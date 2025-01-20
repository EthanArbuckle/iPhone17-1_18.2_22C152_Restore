@interface NSDate(HKDayIndex)
+ (id)hk_dateOnDayIndex:()HKDayIndex atHour:calendar:;
+ (id)hk_earliestPossibleDateWithDayIndex:()HKDayIndex;
+ (id)hk_latestPossibleDateWithDayIndex:()HKDayIndex;
+ (uint64_t)hk_noonWithDayIndex:()HKDayIndex calendar:;
- (uint64_t)hk_dayIndexWithCalendar:()HKDayIndex;
- (uint64_t)hk_earliestPossibleDayIndex;
- (uint64_t)hk_latestPossibleDayIndex;
@end

@implementation NSDate(HKDayIndex)

+ (id)hk_dateOnDayIndex:()HKDayIndex atHour:calendar:
{
  v7 = (void *)MEMORY[0x1E4F1C9D8];
  id v8 = a5;
  v9 = objc_msgSend(v7, "hk_componentsWithDayIndex:calendar:", a3, v8);
  [v9 setHour:a4];
  v10 = [v8 dateFromComponents:v9];

  return v10;
}

+ (uint64_t)hk_noonWithDayIndex:()HKDayIndex calendar:
{
  return objc_msgSend(a1, "hk_dateOnDayIndex:atHour:calendar:", a3, 12, a4);
}

+ (id)hk_earliestPossibleDateWithDayIndex:()HKDayIndex
{
  v4 = +[HKCalendarCache latestTimeZoneCalendar];
  v5 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDayIndex:calendar:", a3, v4);
  v6 = [v4 dateFromComponents:v5];

  return v6;
}

+ (id)hk_latestPossibleDateWithDayIndex:()HKDayIndex
{
  v4 = +[HKCalendarCache earliestTimeZoneCalendar];
  v5 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDayIndex:calendar:", a3, v4);
  v6 = [v4 dateFromComponents:v5];
  v7 = [v4 dateByAddingUnit:16 value:1 toDate:v6 options:0];

  return v7;
}

- (uint64_t)hk_dayIndexWithCalendar:()HKDayIndex
{
  id v5 = a3;
  v6 = [v5 calendarIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v7 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDate+HKDayIndex.m", 45, @"Invalid parameter not satisfying: %@", @"[[calendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  id v8 = [v5 components:28 fromDate:a1];
  uint64_t v9 = objc_msgSend(v8, "hk_dayIndex");

  return v9;
}

- (uint64_t)hk_earliestPossibleDayIndex
{
  v2 = +[HKCalendarCache earliestTimeZoneCalendar];
  uint64_t v3 = objc_msgSend(a1, "hk_dayIndexWithCalendar:", v2);

  return v3;
}

- (uint64_t)hk_latestPossibleDayIndex
{
  v2 = +[HKCalendarCache latestTimeZoneCalendar];
  uint64_t v3 = objc_msgSend(a1, "hk_dayIndexWithCalendar:", v2);

  return v3;
}

@end