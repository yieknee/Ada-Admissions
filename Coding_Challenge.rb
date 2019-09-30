#The program helps business travelers track their expenses my analyzing what they spent on flights, checked bags and accommodations. Each checked bag costs $50. 

puts "Welcome to Tavel Expense Tracker. Please provide us with some information regarding your recent travels."

puts "\n"

#create hashes that will store each trips ticket, checked bag, and accommodation expenses.
trip1_expenses = Hash.new(0)
trip2_expenses = Hash.new(0)
trip3_expenses = Hash.new(0)

#create arrays. Each array will only store a singe cost category for each trip.
ticket_prices = Array.new()
checked_bags = Array.new()
accommodations = Array.new()

x = 0
until x == 3 #collect the following information 3 times.
  x += 1
  puts "Please input the following information for trip # #{x}:" # the x represents the number trip. Trip #1, #2, #3. 
  puts "What was the cost of your round trip ticket?"
  ticket = gets.chomp.to_f.round(2) # prices aren't alway whole amounts. using a float to account for cents.
  
  ticket_prices << ticket #pushing the cost of each ticket for each trip into an array.
    
  puts "How many bags did you check?"
  bags = gets.chomp.to_i
  fee = 50 * bags #each checked bag costs $50. Fee is the product of each checked bag by the cost to check a bag.
  
  checked_bags << fee #pushing the total cost of checked bags for each trip into an array.
    
  puts "What was the price of accommodations?"
  hotels = gets.chomp.to_f.round(2) # prices aren't alway whole amounts. Using a float to account for cents.
  accommodations << hotels #pushing the  cost of accommodations for each trip into an array.
puts "\n"
end

puts "--------------------"

#hash of the ticket, checked bag, and accommodation costs for trip 1.
trip1_expenses[:ticket] = ticket_prices[0]
trip1_expenses[:bags] = checked_bags[0]
trip1_expenses[:hotels] = accommodations[0]

#hash of the ticket, checked bag, and accommodation costs for trip 2.
trip2_expenses[:ticket] = ticket_prices[1]
trip2_expenses[:bags] = checked_bags[1]
trip2_expenses[:hotels] = accommodations[1]

#hash of the ticket, checked bag, and accommodation costs for trip 3.
trip3_expenses[:ticket] = ticket_prices[2]
trip3_expenses[:bags] = checked_bags[2]
trip3_expenses[:hotels] = accommodations[2]

#summing the total cost of trip 1.
total_1 = 0
trip1_expenses.values.each do |cost_1|
  total_1 += cost_1
end

#summing the total cost of trip 2.
total_2 = 0
trip2_expenses.values.each do |cost_2|
  total_2 += cost_2
end

#summing the total cost of trip 3.
total_3 = 0
trip3_expenses.values.each do |cost_3|
  total_3 += cost_3
end

#outputs the total of all trips, rounded to 2 decimals.
trip_total = (total_1 + total_2 + total_3) 
puts "The total cost of your trips is $#{ '%.2f' % trip_total}!"

#outputs the total of trip 1 and the percentage of trip 1 to the total rounded to 2 decimals.
puts "For trip 1 you spent a total of $#{ '%.2f' % total_1}, which is #{ '%.2f' % ((total_1/trip_total)*100)}% of your total expense."

#outputs the total of trip 2 and the percentage of trip 2 to the total, rounded to 2 decimals.
puts "For trip 2 you spent a total of $#{ '%.2f' % total_2}, which is #{ '%.2f' % ((total_2/trip_total)*100)}% of your total expense."

#outputs the total of trip 3 and the percentage of trip three to the total, rounded to 2 decimals.
puts "For trip 3 you spent a total of $#{ '%.2f' % total_3}, which is #{ '%.2f' % ((total_3/trip_total)*100)}% of your total expense."

#determines which trip is the most expensive rounded to 2 decimals.
if total_1 > total_2 && total_1 > total_3
  puts "Your most expensive trip was the first, with a total cost of $#{ '%.2f' % total_1}."
elsif total_2 > total_1 && total_2 > total_3
  puts "Your most expensive trip was the second, with a total cost of $#{ '%.2f' % total_2}."
elsif total_3 > total_1 && total_3 > total_2
  puts "Your most expensive trip was the third, with a total cost of $#{ '%.2f' % total_3}."
elsif total_1 == total_2 && total_1 == total_3
  puts "Your total expenses were all the same." #output if all trip totals are equal
 
#outputs if two of the three trips are equal and larger than the third.
elsif total_1 == total_2 && total_1 > total_3
  puts "Your most expensive trips were the first and second, with a total cost of $#{ '%.2f' % total_1}." 
elsif total_1 > total_2 && total_1 == total_3
  puts "Your most expensive trips were the first and third, with a total cost of $#{ '%.2f' % total_1}."
elsif total_2 == total_3 && total_2 > total_1
  puts "Your most expensive trips were the second and third, with a total cost of $#{ '%.2f' % total_2}."
end

#sum all ticket expenses for the 3 trips
ticket_total = 0
ticket_prices.each do |tp|
  ticket_total += tp
end

#sum all accommodation expenses for the 3 trips
accommodations_total = 0
accommodations.each do |ap|
  accommodations_total += ap
end

#output of total amount spent on tickets and accommodations.
puts "You spent $#{ '%.2f' % ticket_total} on flights and $#{ '%.2f' % accommodations_total} on accommodations."

puts "--------------------"
puts "\n" 

puts "Thank you for using Travel Expense Tracker! Please visit us again to help analyze your future travel expenses."

=begin
1. Describe something that you are pleased within your code.

I am pleased that my code can discern a situation where two or more of the total trip expenses are the same. When I was writing the code I realized that if two trips were equally expensive but higher than the other trip I would need a response to that scenario. I am also pleased that my code can pick up on cents and not just whole dollars. I have never taken a trip that was exactly an integer amount expensive. I wanted my code to be able to pick up on floats and display the total costs as floats. 

2. Describe something that you tried that didn't work and how you eventually fixed it.

When I was considering which approach to take I first tried using only a hash to collect the flight, bag, and hotel inputs using the until loop. I first tried doing the below. 
trip1_expenses = Hash.new(0)
trip2_expenses = Hash.new(0)
trip3_expenses = Hash.new(0)

x = 0 
until x == 3 
x += 1
puts "Please input the following information for trip # #{x}:"
puts "What was the cost of your round trip ticket?"
trip1_expenses[:ticket] = gets.chomp.to_f.round(2) 

puts "How many bags did you check?"
bags = gets.chomp.to_i
trip1_expenses[:fee] = 50 * bags 

puts "What was the price of accommodations?"
trip1_expenses[:hotels] = gets.chomp.to_f.round(2)
end

But after writing it, I realized it wouldn't catch each trip in its hash, and that the hash at the end will only hold the values from the last trip. 

I could have solved it by doing the following, but for more than 3 trips it's not efficient.

trip1_expenses = Hash.new(0)
trip2_expenses = Hash.new(0)
trip3_expenses = Hash.new(0)

puts "Please input the following information for trip #1"
puts "What was the cost of your round trip ticket?"

trip1_expenses[:ticket] = gets.chomp.to_f.round(2) 

puts "How many bags did you check?"bags = gets.chomp.to_i
trip1_expenses[:fee] = 50 * bags 

puts "What was the price of accommodations?"
trip1_expenses[:hotels] = gets.chomp.to_f.round(2)

*repeat above for trips 2 and 3.

I ultimately choose do it the way I currently have it in my code because it was more efficient.

3. Describe a situation where your code may not perform as you would like.

My code will not work if someone wants to put in more than 3 trip expenses. My code is currently only configured to collect the specific data three times. If I were to fix this, I would start by asking the user to input how many trips they would like to analyze the expenses. From there I would possibly use an until loop to ask for inputs regarding flights, bags, and accommodation how many trips the user inputted earlier. Example: puts "How many trips would you like to input the expenses for?"trip_number = gets.chomp.to_iI would then create the arrays and hashes needed to store the inputs as I did in this version. I would then write an until loop:

x = 0
until x == trip_number

I would create the puts are variables to store the trip information as I did in this code. 

4. Paste a sample run of your program and explain what happened (control flow) as the program ran. 

My program first outputs a welcome message. It then creates the hashes (trip1_expenses, trip2_expenses, trip3_expenses ) and arrays (ticket_prices, checked_bags, accommodations) for the trips and cost categories. Then it starts a loop. The loop is instructed to run until the value of the variable x is three. The value of x increases at an increment of 1 starting at 0. On the first loop, it asks the user to input the value of the round trip ticket for trip #1 ($454.36) and stores it as a variable called tickets. The variable tickets is pushed into the array ticket_prices. It then asks for the number of bags checked (3) and stores it as a variable called bags. The variable bags is then multiplied by 50 (the cost of each checked bag), and the product is stored as a variable called fees. Fees is pushed into the checked_bags array. The program then asks the user to input the price of accommodations ($525.32)and stores it as a variable called hotels. Hotels is pushed into an array called accommodations. After this question, the loop runs again to start collecting inputs for trip 2 and repeats what is stated above. It keeps repeating these questions and collecting the inputs and storing them as variables and those variables pushed into arrays until it asks the last question for trip 3, at which point the loop ends. When the loop ends, there are now three arrays that contain the user inputs for each cost category. The program then creates keys for hashes and references the values in the arrays to create the values to the keys. This results in three hashes that have keys and values that represent the three trips. The program then iterates over the values in each hash and sums up the values and stores the sum of values into variables called total_1, total_2, and total_3. The sum of the values from the three hashes are then added together and stored as a variable called trip_total. The program then outputs a message telling the user the total cost of all trips added together ($3529.68). It then outputs a message about the total cost of trip #1 using the total_1 variable ($1129.68) and the percentage of total expenses ((total_1 / trip_total) *100) (32.01%). It performs these same steps for trips 2 and 3 and outputs the information. It then starts running through a series of if statements to determine which trip costs the mosts. It starts by checking if trip #1 is more expensive the other two trips (no). It does the same for trips 2 and 3(no). It then checks if all three trips are equal to each other (no). Then if 2 of the 3 trips are equal and greater than the third. It keeps checking the if/elsif statements until reaches the if statement where trips 2 and 3 are equal and greater than trip 1. It displays that message and ends the search through the if/ elsif statements. It then iterates over the ticket_prices array and sums up the values in a new variable called ticket_total, and does the same for the accommodations array and stores that sum in a variable called accommodations_total. It then outputs a message about the total cost of flights and accommodations for all three trips using the ticket_total and accommodations_total variables. Finally, it outs a thank you message to end the program. 

=end

