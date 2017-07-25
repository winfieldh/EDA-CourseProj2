library (dplyr)
library (ggplot2)

# Read the data

pmdata <- readRDS("summarySCC_PM25.rds")
classcode <- readRDS("Source_Classification_Code.rds")

#1 make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

TotalEmissions <- group_by(pmdata, year) %>% summarise(Emissions=sum(Emissions))
plot(TotalEmissions$year,TotalEmissions$Emissions, type="l", col="red",xlab="Year", ylab="Emissions", main = "Total Emissions")

#2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

BaltData <- filter(pmdata,fips=="24510")
BaltEmissions <- group_by(BaltData, year) %>% summarise(Emissions=sum(Emissions))
plot(BaltEmissions$year,BaltEmissions$Emissions,type='l',xlab="Year", ylab="Emissions", main = "Total Emissions")

