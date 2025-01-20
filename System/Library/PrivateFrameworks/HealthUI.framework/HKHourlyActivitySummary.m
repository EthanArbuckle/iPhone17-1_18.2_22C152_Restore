@interface HKHourlyActivitySummary
- (BOOL)_useHourlyGoalComparison;
- (NSDateComponents)hourlyDateComponents;
- (id)dateComponentsForCalendar:(id)a3;
- (void)setHourlyDateComponents:(id)a3;
@end

@implementation HKHourlyActivitySummary

- (id)dateComponentsForCalendar:(id)a3
{
  id v4 = a3;
  v5 = [(HKHourlyActivitySummary *)self hourlyDateComponents];
  v6 = [v5 calendar];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    v8 = [(HKHourlyActivitySummary *)self hourlyDateComponents];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_useHourlyGoalComparison
{
  return 1;
}

- (NSDateComponents)hourlyDateComponents
{
  return self->_hourlyDateComponents;
}

- (void)setHourlyDateComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end