@interface NSDate(HealthUI)
- (id)hk_dateBeforeDateForCalendar:()HealthUI rangeUnit:;
@end

@implementation NSDate(HealthUI)

- (id)hk_dateBeforeDateForCalendar:()HealthUI rangeUnit:
{
  id v6 = 0;
  [a3 rangeOfUnit:a4 startDate:&v6 interval:0 forDate:a1];
  id v4 = v6;
  return v4;
}

@end