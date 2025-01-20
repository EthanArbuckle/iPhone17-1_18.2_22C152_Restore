@interface NSDate(DayComparison)
- (BOOL)isSameDayAsDate:()DayComparison;
@end

@implementation NSDate(DayComparison)

- (BOOL)isSameDayAsDate:()DayComparison
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  v7 = [v6 components:28 fromDate:a1];
  v8 = [v6 components:28 fromDate:v5];

  uint64_t v9 = [v7 year];
  if (v9 == [v8 year] && (uint64_t v10 = objc_msgSend(v7, "month"), v10 == objc_msgSend(v8, "month")))
  {
    uint64_t v11 = [v7 day];
    BOOL v12 = v11 == [v8 day];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end