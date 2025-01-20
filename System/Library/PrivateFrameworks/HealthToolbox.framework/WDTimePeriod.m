@interface WDTimePeriod
+ (WDTimePeriod)timePeriodWithSample:(id)a3;
+ (WDTimePeriod)timePeriodWithStartDate:(id)a3 endDate:(id)a4;
+ (id)sleep_timePeriodForSample:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sleep_titleString;
- (unint64_t)hash;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation WDTimePeriod

- (id)sleep_titleString
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(WDTimePeriod *)self startDate];
  v5 = [(WDTimePeriod *)self endDate];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 compareDate:v4 toDate:v3 toUnitGranularity:4];

  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v9 = v7 | [v8 compareDate:v5 toDate:v3 toUnitGranularity:4];

  if (v9) {
    objc_msgSend(MEMORY[0x263F087A8], "hk_dayIntervalFormatter");
  }
  else {
  v10 = objc_msgSend(MEMORY[0x263F087A8], "hk_mediumMonthDayDateIntervalFormatter");
  }
  v11 = [v10 stringFromDate:v4 toDate:v5];

  return v11;
}

+ (id)sleep_timePeriodForSample:(id)a3
{
  v3 = [a3 startDate];
  v4 = HKSleepStartDateForDate();
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateByAddingUnit:16 value:1 toDate:v4 options:0];

  uint64_t v7 = +[WDTimePeriod timePeriodWithStartDate:v4 endDate:v6];

  return v7;
}

+ (WDTimePeriod)timePeriodWithStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(WDTimePeriod);
  [(WDTimePeriod *)v7 setStartDate:v6];

  [(WDTimePeriod *)v7 setEndDate:v5];

  return v7;
}

+ (WDTimePeriod)timePeriodWithSample:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  id v6 = [v4 endDate];

  uint64_t v7 = [a1 timePeriodWithStartDate:v5 endDate:v6];

  return (WDTimePeriod *)v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WDTimePeriod *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v5 = 1;
    goto LABEL_7;
  }
  if ([(NSDate *)self->_startDate isEqual:v4->_startDate]) {
    char v5 = [(NSDate *)self->_endDate isEqual:v4->_endDate];
  }
  else {
LABEL_5:
  }
    char v5 = 0;
LABEL_7:

  return v5;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ - %@", self->_startDate, self->_endDate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[WDTimePeriod allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_startDate, self->_startDate);
  objc_storeStrong((id *)&v4->_endDate, self->_endDate);
  return v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end