def printMedian(input)
	puts input, ""
	remainder = 0
	toggleRemainder = proc {remainder==0?(remainder=1):(remainder=0)}
	inputs = input.split(/\W+/)
	i = 0
	while i<inputs.length
		(i % 2 == remainder and (scan_o=inputs[i].scan(/[ar]/))==[]) ? (puts "Wrong!"; i += 1; toggleRemainder.call()) : (inputs[i+1].scan(/[0-9]+/)!=[]? (addOrDelete(scan_o[0], inputs[i+1]); i += 2;): (puts "Wrong!"; i+=1;  toggleRemainder.call()))
	end
end

def findMedian
	print ($numbersArray.length>0)?(($numbersArray.length % 2 == 0)? ($numbersArray[$numbersArray.length / 2] + $numbersArray[($numbersArray.length / 2)-1]) / 2: $numbersArray[$numbersArray.length / 2]):  nil
end

def addOrDelete(how, what)
	how == "a" ? ($numbersArray = ($numbersArray << what.to_i()).sort(); findMedian) : ($numbersArray.include?(what.to_i())? ($numbersArray = $numbersArray - [what.to_i()];findMedian) : (print "Wrong!"))
	puts print $numbersArray
end

$numbersArray = []

printMedian("a 6
a 10
a 5
r 2
r 4
a 12
r 10
r 6
r 5
r 12
r 10
11
a 3
a 5
r 6
5 a
r 5
a 11")
