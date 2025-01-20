@interface NSCalendar(WFAdjustDate)
- (id)transformDate:()WFAdjustDate unitFlags:;
- (id)wf_startOfWeekForDate:()WFAdjustDate;
- (uint64_t)wf_startOfHourForDate:()WFAdjustDate;
- (uint64_t)wf_startOfMinuteForDate:()WFAdjustDate;
- (uint64_t)wf_startOfMonthForDate:()WFAdjustDate;
- (uint64_t)wf_startOfYearForDate:()WFAdjustDate;
@end

@implementation NSCalendar(WFAdjustDate)

- (id)transformDate:()WFAdjustDate unitFlags:
{
  v5 = [a1 components:a4 fromDate:a3];
  v6 = [a1 dateFromComponents:v5];

  return v6;
}

- (uint64_t)wf_startOfMinuteForDate:()WFAdjustDate
{
  return [a1 transformDate:a3 unitFlags:124];
}

- (uint64_t)wf_startOfHourForDate:()WFAdjustDate
{
  return [a1 transformDate:a3 unitFlags:60];
}

- (id)wf_startOfWeekForDate:()WFAdjustDate
{
  id v5 = 0;
  [a1 rangeOfUnit:0x2000 startDate:&v5 interval:0 forDate:a3];
  id v3 = v5;
  return v3;
}

- (uint64_t)wf_startOfMonthForDate:()WFAdjustDate
{
  return [a1 transformDate:a3 unitFlags:12];
}

- (uint64_t)wf_startOfYearForDate:()WFAdjustDate
{
  return [a1 transformDate:a3 unitFlags:4];
}

@end