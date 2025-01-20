@interface HKInteractiveChartTimePeriodData
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)statisticsInterval;
- (NSString)timePeriodPrefix;
- (double)timePeriod;
- (int64_t)recordCount;
- (void)setEndDate:(id)a3;
- (void)setRecordCount:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)setTimePeriod:(double)a3;
- (void)setTimePeriodPrefix:(id)a3;
@end

@implementation HKInteractiveChartTimePeriodData

- (double)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(double)a3
{
  self->_timePeriod = a3;
}

- (NSString)timePeriodPrefix
{
  return self->_timePeriodPrefix;
}

- (void)setTimePeriodPrefix:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timePeriodPrefix, 0);
}

@end