@interface NSDate(Additions)
+ (id)hf_dateByAddingComponents:()Additions toDate:times:;
+ (id)hf_dateByAddingDays:()Additions toDate:;
+ (id)hf_dateByAddingHours:()Additions toDate:;
+ (id)hf_dateByAddingMinutes:()Additions toDate:;
+ (id)hf_dateByAddingMonths:()Additions toDate:;
+ (id)hf_dateByAddingNanoseconds:()Additions toDate:;
+ (id)hf_dateByAddingSeconds:()Additions toDate:;
+ (id)hf_dateByAddingWeeks:()Additions toDate:;
+ (id)hf_dateByAddingYears:()Additions months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:;
+ (id)hf_dateByAddingYears:()Additions toDate:;
+ (id)hf_dateBySubtractingComponents:()Additions fromDate:times:;
+ (id)hf_sharedCalendar;
+ (id)hf_sharedTimeZone;
+ (uint64_t)hf_daysBetweenDates:()Additions endDate:;
+ (uint64_t)hf_minutesBetweenDates:()Additions endDate:;
- (BOOL)_uses24HourTimeForLocale;
- (BOOL)hf_isFirstHourOfDay;
- (BOOL)hf_isMidnight;
- (BOOL)hf_isWithinInterval:()Additions ofDate:;
- (id)hf_endOfDay;
- (id)hf_endOfWeek;
- (id)hf_startOfDay;
- (id)hf_startOfHour;
- (id)hf_startOfMinute;
- (id)hf_startOfNextDay;
- (id)hf_startOfSecond;
- (id)hf_startOfWeek;
- (uint64_t)hf_isBetweenStartDate:()Additions endDate:;
- (uint64_t)hf_isSingularHour;
- (uint64_t)hf_isWithinOneHourOfDate:()Additions;
- (uint64_t)hf_isWithinOneMinuteOfDate:()Additions;
- (uint64_t)hf_isWithinOneSecondOfDate:()Additions;
@end

@implementation NSDate(Additions)

+ (id)hf_sharedCalendar
{
  if (_MergedGlobals_280 != -1) {
    dispatch_once(&_MergedGlobals_280, &__block_literal_global_145);
  }
  v0 = (void *)qword_26AB2F5A8;
  return v0;
}

+ (id)hf_sharedTimeZone
{
  if (qword_26AB2F5B0 != -1) {
    dispatch_once(&qword_26AB2F5B0, &__block_literal_global_2_0);
  }
  v0 = (void *)qword_26AB2F5B8;
  return v0;
}

+ (id)hf_dateByAddingComponents:()Additions toDate:times:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = v8;
  if (a5 >= 1)
  {
    v11 = v8;
    do
    {
      v12 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
      v10 = [v12 dateByAddingComponents:v7 toDate:v11 options:0];

      v11 = v10;
      --a5;
    }
    while (a5);
  }

  return v10;
}

+ (id)hf_dateBySubtractingComponents:()Additions fromDate:times:
{
  id v7 = a3;
  id v8 = (objc_class *)MEMORY[0x263EFF918];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  if ([v7 year] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setYear:", -objc_msgSend(v7, "year"));
  }
  if ([v7 month] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setMonth:", -objc_msgSend(v7, "month"));
  }
  if ([v7 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setHour:", -objc_msgSend(v7, "hour"));
  }
  if ([v7 weekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setWeekOfYear:", -objc_msgSend(v7, "weekOfYear"));
  }
  if ([v7 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setWeekOfMonth:", -objc_msgSend(v7, "weekOfMonth"));
  }
  if ([v7 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setMinute:", -objc_msgSend(v7, "minute"));
  }
  if ([v7 second] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "setSecond:", -objc_msgSend(v7, "second"));
  }
  v11 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingComponents:toDate:times:", v10, v9, a5);

  return v11;
}

+ (id)hf_dateByAddingYears:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", a3, 0, 0, 0, 0, 0, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingMonths:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, a3, 0, 0, 0, 0, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingWeeks:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, a3, 0, 0, 0, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingDays:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, a3, 0, 0, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingHours:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, a3, 0, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingMinutes:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, a3, 0, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingSeconds:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, 0, a3, 0, v5);

  return v6;
}

+ (id)hf_dateByAddingNanoseconds:()Additions toDate:
{
  id v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "hf_dateByAddingYears:months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:", 0, 0, 0, 0, 0, 0, 0, a3, v5);

  return v6;
}

- (id)hf_startOfDay
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v3 = objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v4 = [v2 componentsInTimeZone:v3 fromDate:a1];

  [v4 setHour:0];
  [v4 setMinute:0];
  [v4 setSecond:0];
  [v4 setNanosecond:0];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)hf_startOfNextDay
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v3 = [v2 nextDateAfterDate:a1 matchingHour:0 minute:0 second:0 options:2];

  return v3;
}

- (id)hf_startOfHour
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v3 = objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v4 = [v2 componentsInTimeZone:v3 fromDate:a1];

  [v4 setMinute:0];
  [v4 setSecond:0];
  [v4 setNanosecond:0];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)hf_startOfMinute
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v3 = objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v4 = [v2 componentsInTimeZone:v3 fromDate:a1];

  [v4 setSecond:0];
  [v4 setNanosecond:0];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)hf_startOfSecond
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v3 = objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  v4 = [v2 componentsInTimeZone:v3 fromDate:a1];

  [v4 setNanosecond:0];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)hf_startOfWeek
{
  id v1 = a1;
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  uint64_t v3 = [v2 component:512 fromDate:v1];
  uint64_t v4 = [v2 firstWeekday];
  if (v3 - v4 >= 1)
  {
    uint64_t v5 = [v2 dateByAddingUnit:16 value:v4 - v3 toDate:v1 options:0];

    id v1 = (id)v5;
  }
  v6 = [v2 startOfDayForDate:v1];

  return v6;
}

- (id)hf_endOfDay
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "hf_sharedTimeZone");
  uint64_t v4 = [v2 componentsInTimeZone:v3 fromDate:a1];

  [v4 setHour:23];
  [v4 setMinute:59];
  [v4 setSecond:59];
  [v4 setNanosecond:0];
  uint64_t v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)hf_endOfWeek
{
  id v1 = a1;
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  uint64_t v3 = [v2 component:512 fromDate:v1];
  if (v3 <= 6)
  {
    uint64_t v4 = [v2 dateByAddingUnit:16 value:7 - v3 toDate:v1 options:0];

    id v1 = (id)v4;
  }
  uint64_t v5 = [v2 startOfDayForDate:v1];

  return v5;
}

- (BOOL)hf_isWithinInterval:()Additions ofDate:
{
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return fabs(v3) < a2;
}

- (uint64_t)hf_isWithinOneHourOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 3600.0);
}

- (uint64_t)hf_isWithinOneMinuteOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 60.0);
}

- (uint64_t)hf_isWithinOneSecondOfDate:()Additions
{
  return objc_msgSend(a1, "hf_isWithinInterval:ofDate:", 1.0);
}

- (BOOL)hf_isFirstHourOfDay
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  double v3 = [v2 components:32 fromDate:a1];

  BOOL v4 = [v3 hour] == 0;
  return v4;
}

- (BOOL)hf_isMidnight
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  double v3 = [v2 components:224 fromDate:a1];

  BOOL v4 = ![v3 hour] && !objc_msgSend(v3, "minute") && objc_msgSend(v3, "second") == 0;
  return v4;
}

- (uint64_t)hf_isSingularHour
{
  v2 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  double v3 = [v2 components:32 fromDate:a1];

  if ([v3 hour] == 1)
  {
    uint64_t v4 = 1;
  }
  else if ([v3 hour] == 13)
  {
    uint64_t v4 = [a1 _uses24HourTimeForLocale] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_isBetweenStartDate:()Additions endDate:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 earlierDate:v7];
  int v9 = [v8 isEqualToDate:v7];

  if (v9)
  {
    id v10 = [a1 laterDate:v6];
    uint64_t v11 = [v10 isEqualToDate:v6];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (uint64_t)hf_minutesBetweenDates:()Additions endDate:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  id v8 = [v7 startOfDayForDate:v6];

  int v9 = [v7 startOfDayForDate:v5];

  uint64_t v10 = [v7 ordinalityOfUnit:64 inUnit:2 forDate:v8];
  uint64_t v11 = [v7 ordinalityOfUnit:64 inUnit:2 forDate:v9] - v10;

  return v11;
}

+ (uint64_t)hf_daysBetweenDates:()Additions endDate:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  id v8 = [v7 startOfDayForDate:v6];

  int v9 = [v7 startOfDayForDate:v5];

  uint64_t v10 = [v7 ordinalityOfUnit:16 inUnit:2 forDate:v8];
  uint64_t v11 = [v7 ordinalityOfUnit:16 inUnit:2 forDate:v9] - v10;

  return v11;
}

+ (id)hf_dateByAddingYears:()Additions months:weeks:days:hours:minutes:seconds:nanoseconds:toDate:
{
  v17 = (objc_class *)MEMORY[0x263EFF918];
  id v18 = a11;
  id v19 = objc_alloc_init(v17);
  [v19 setYear:a3];
  [v19 setMonth:a4];
  [v19 setWeekOfMonth:a5];
  [v19 setDay:a6];
  [v19 setHour:a7];
  [v19 setMinute:a8];
  [v19 setSecond:a9];
  [v19 setNanosecond:a10];
  v20 = objc_msgSend((id)objc_opt_class(), "hf_sharedCalendar");
  v21 = [v20 dateByAddingComponents:v19 toDate:v18 options:0];

  return v21;
}

- (BOOL)_uses24HourTimeForLocale
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setLocalizedDateFormatFromTemplate:@"j"];
  id v1 = [MEMORY[0x263EFF960] currentLocale];
  [v0 setLocale:v1];

  v2 = [v0 dateFormat];
  BOOL v3 = [v2 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v2 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end