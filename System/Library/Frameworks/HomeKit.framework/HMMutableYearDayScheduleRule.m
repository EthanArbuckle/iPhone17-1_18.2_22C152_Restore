@interface HMMutableYearDayScheduleRule
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setValidFrom:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation HMMutableYearDayScheduleRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMYearDayScheduleRule allocWithZone:a3];
  v5 = [(HMYearDayScheduleRule *)self dateInterval];
  v6 = [(HMYearDayScheduleRule *)v4 initWithDateInterval:v5];

  return v6;
}

- (void)setValidUntil:(id)a3
{
  id v4 = a3;
  [(HMMutableYearDayScheduleRule *)self setEndDate:v4];
  v5 = [(HMMutableYearDayScheduleRule *)self startDate];

  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  if (v5) {
    [(HMMutableYearDayScheduleRule *)self startDate];
  }
  else {
  id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v7 = (void *)[v6 initWithStartDate:v8 endDate:v4];

  [(HMYearDayScheduleRule *)self setDateInterval:v7];
}

- (void)setValidFrom:(id)a3
{
  id v4 = a3;
  [(HMMutableYearDayScheduleRule *)self setStartDate:v4];
  v5 = [(HMMutableYearDayScheduleRule *)self endDate];

  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  if (v5) {
    [(HMMutableYearDayScheduleRule *)self endDate];
  }
  else {
  id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v7 = (void *)[v6 initWithStartDate:v4 endDate:v8];

  [(HMYearDayScheduleRule *)self setDateInterval:v7];
}

@end