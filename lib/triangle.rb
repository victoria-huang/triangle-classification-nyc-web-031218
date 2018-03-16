require 'pry'

class Triangle
  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def is_equilateral?
    @side_one == @side_two && @side_one == @side_three
  end

  # def is_isosceles?
  #   !self.is_equilateral? && (@side_one == @side_two || @side_one == @side_three || @side_two == @side_three)
  # end

  def is_scalene?
    @side_one != @side_two && @side_one != @side_three && @side_two != @side_three
  end

  def illegal_size?
    @side_one <= 0 || @side_two <= 0 || @side_three <= 0
  end

  def illegal_inequality?
    (@side_one + @side_two) <= @side_three || (@side_two + @side_three) <= @side_one || (@side_one + @side_three) <= @side_two
  end

  def kind
    if self.illegal_size?
      # begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.size_message
      # end
    elsif self.illegal_inequality?
      # begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.inequality_message
      # end
    elsif self.is_equilateral?
      :equilateral
    elsif self.is_scalene?
      :scalene
    else
      :isosceles
    end
  end
end

class TriangleError < StandardError
  # def size_message
  #   puts "Illegal triangle! Sides must have a length greater than 0."
  # end
  #
  # def inequality_message
  #   puts "Illegal triangle! The sum of the lengths of any two sides of a triangle always exceeds the length of the third side."
  # end
end
