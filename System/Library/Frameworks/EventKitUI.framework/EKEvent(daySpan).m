@interface EKEvent(daySpan)
- (uint64_t)daySpan;
@end

@implementation EKEvent(daySpan)

- (uint64_t)daySpan
{
  v2 = [a1 startCalendarDate];
  v3 = [v2 calendarDateForDay];

  v4 = [a1 endCalendarDate];
  v5 = [v4 calendarDateForDay];

  uint64_t v6 = [v5 differenceInDays:v3] + 1;
  return v6;
}

@end