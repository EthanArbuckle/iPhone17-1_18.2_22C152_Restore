@interface HKInteractiveChartHandwashingEventData
- (BOOL)meetsGoal;
- (HKInteractiveChartHandwashingEventData)initWithTimePeriod:(double)a3 meetsGoal:(BOOL)a4;
- (void)setMeetsGoal:(BOOL)a3;
@end

@implementation HKInteractiveChartHandwashingEventData

- (HKInteractiveChartHandwashingEventData)initWithTimePeriod:(double)a3 meetsGoal:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartHandwashingEventData;
  v6 = [(HKInteractiveChartHandwashingEventData *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(HKInteractiveChartTimePeriodData *)v6 setTimePeriod:a3];
    [(HKInteractiveChartHandwashingEventData *)v7 setMeetsGoal:v4];
  }
  return v7;
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void)setMeetsGoal:(BOOL)a3
{
  self->_meetsGoal = a3;
}

@end