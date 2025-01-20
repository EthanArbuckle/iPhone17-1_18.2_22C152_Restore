@interface NSDateComponents(CalClassAdditions)
+ (id)CalComponentForDays:()CalClassAdditions;
+ (id)CalComponentForHours:()CalClassAdditions;
+ (id)CalComponentForMinutes:()CalClassAdditions;
+ (id)CalComponentForMonths:()CalClassAdditions;
+ (id)CalComponentForWeeks:()CalClassAdditions;
+ (id)CalComponentForYears:()CalClassAdditions;
+ (id)CalComponentsWithYear:()CalClassAdditions month:day:hour:minute:second:;
- (BOOL)CalHasTimeComponents;
- (BOOL)CalIsSameYearAsComponents:()CalClassAdditions;
- (id)CalDateComponents:()CalClassAdditions byAddingComponents:calendar:;
- (id)CalDateComponents:()CalClassAdditions byAddingDays:calendar:;
- (id)CalDateComponentsForDateOnly;
- (id)CalDateComponentsForEndOfDay;
- (id)CalRepresentedDate;
- (uint64_t)CalClearTimeComponents;
- (uint64_t)CalIsSameDayAsComponents:()CalClassAdditions;
- (uint64_t)CalIsSameMonthAsComponents:()CalClassAdditions;
- (unint64_t)CalGregorianDate;
@end

@implementation NSDateComponents(CalClassAdditions)

- (id)CalRepresentedDate
{
  v2 = [a1 calendar];
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v3 = [v2 dateFromComponents:a1];

  return v3;
}

+ (id)CalComponentForMinutes:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setMinute:a3];

  return v4;
}

+ (id)CalComponentForHours:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setHour:a3];

  return v4;
}

+ (id)CalComponentForDays:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setDay:a3];

  return v4;
}

+ (id)CalComponentForWeeks:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setWeekOfYear:a3];

  return v4;
}

+ (id)CalComponentForMonths:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setMonth:a3];

  return v4;
}

+ (id)CalComponentForYears:()CalClassAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setYear:a3];

  return v4;
}

+ (id)CalComponentsWithYear:()CalClassAdditions month:day:hour:minute:second:
{
  v14 = objc_opt_new();
  [v14 setYear:a3];
  [v14 setMonth:a4];
  [v14 setDay:a5];
  [v14 setHour:a6];
  [v14 setMinute:a7];
  [v14 setSecond:a8];

  return v14;
}

- (uint64_t)CalIsSameDayAsComponents:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 day];
  if (v5 == [v4 day]) {
    uint64_t v6 = [a1 CalIsSameMonthAsComponents:v4];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)CalIsSameMonthAsComponents:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 month];
  if (v5 == [v4 month]) {
    uint64_t v6 = [a1 CalIsSameYearAsComponents:v4];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)CalIsSameYearAsComponents:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 year];
  if (v5 == [v4 year])
  {
    uint64_t v6 = [a1 era];
    BOOL v7 = v6 == [v4 era];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)CalDateComponents:()CalClassAdditions byAddingComponents:calendar:
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v8 timeZone];
  v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v8 setTimeZone:v11];

  v12 = [v8 dateFromComponents:a1];
  v13 = [v8 dateByAddingComponents:v9 toDate:v12 options:0];

  v14 = [v8 components:a3 fromDate:v13];
  [v8 setTimeZone:v10];

  return v14;
}

- (id)CalDateComponents:()CalClassAdditions byAddingDays:calendar:
{
  id v8 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  [v10 setDay:a4];
  v11 = [a1 CalDateComponents:a3 byAddingComponents:v10 calendar:v9];

  return v11;
}

- (id)CalDateComponentsForDateOnly
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v2, "setEra:", objc_msgSend(a1, "era"));
  objc_msgSend(v2, "setYear:", objc_msgSend(a1, "year"));
  objc_msgSend(v2, "setMonth:", objc_msgSend(a1, "month"));
  objc_msgSend(v2, "setDay:", objc_msgSend(a1, "day"));

  return v2;
}

- (id)CalDateComponentsForEndOfDay
{
  v1 = (void *)[a1 copy];
  [v1 setHour:23];
  [v1 setMinute:59];
  [v1 setSecond:59];

  return v1;
}

- (unint64_t)CalGregorianDate
{
  unsigned int v2 = [a1 year];
  unsigned __int8 v3 = [a1 month];
  unsigned __int8 v4 = [a1 day];
  if ([a1 hour] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = (unint64_t)[a1 hour] << 48;
  }
  if ([a1 minute] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [a1 minute] << 56;
  }
  if ([a1 second] != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 second];
  }
  return v2 | ((unint64_t)v3 << 32) & 0xFFFF00FFFFFFFFFFLL | ((unint64_t)v4 << 40) | v5 | v6;
}

- (BOOL)CalHasTimeComponents
{
  return [a1 hour] != 0x7FFFFFFFFFFFFFFFLL
      && [a1 minute] != 0x7FFFFFFFFFFFFFFFLL
      && [a1 second] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)CalClearTimeComponents
{
  [a1 setHour:0x7FFFFFFFFFFFFFFFLL];
  [a1 setMinute:0x7FFFFFFFFFFFFFFFLL];

  return [a1 setSecond:0x7FFFFFFFFFFFFFFFLL];
}

@end