# Read dataset
fileName <- "household_power_consumption.txt"
columnNames <- read.csv2(fileName, stringsAsFactors=FALSE, header = FALSE, nrows = 1)
columnNames <- as.character(columnNames[1,])
mydata <- read.csv2(fileName,stringsAsFactors=FALSE, col.names = columnNames, skip = 66636, nrows = 2880)
# Convert columns 1 and 2 into date-time object
dateTime <- strptime(paste(mydata[,1], mydata[,2], sep = " "),
                     "%d/%m/%Y %H:%M:%S")
# Convert columns 3 - 9 into numeric format 
for (pp in 3:9){
  mydata[,pp] <- as.numeric(mydata[,pp])
}
# Create the plot
bmp(filename = "plot3.png", width = 480, height = 480)
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(dateTime, mydata[,7], type = "l", col = "black", ylab = "Enery sub metering")
lines(dateTime, mydata[,8],xlab = "", type = "l", col = "red")
lines(dateTime, mydata[,9],xlab = "", type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = names(mydata)[7:9])
dev.off()