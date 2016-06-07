# Exploratory Data Analysis
# Week 1 Project
# Electric Power Consumption
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- grep("zip", unlist(strsplit(fileURL, split="%2F", fixed=TRUE)), value=TRUE, fixed=TRUE)
download.file(fileURL, destfile=file.path("./data/", fileName))

unzip(file.path("./data", fileName), overwrite=TRUE, exdir="./data")

unfileName <- unzip(file.path("./data", fileName), list=TRUE)$Name
housepower <- read.table(file.path("./data", unfileName), header=TRUE, sep=";", na.strings="?")

housepower$Date <- as.Date(housepower$Date, format="%d/%m/%Y")

ed_housepower <- subset(housepower, Date=="2007-02-01"|Date=="2007-02-02")
ed_housepower$DateTime <- paste(ed_housepower$Date, ed_housepower$Time)
ed_housepower$DateTime <- strptime(ed_housepower$DateTime, "%Y-%m-%d %H:%M:%S", tz="America/Los_Angeles")


#All the code prior to this is repeated in eac of the plot scripts
#if you're testing my code in one sitting, it's not necessary to re-reun each time


#plot1.png
par(mfcol=c(1,1)) #just to make sure
png(filename="./data/plot1.png")
with(ed_housepower, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()

