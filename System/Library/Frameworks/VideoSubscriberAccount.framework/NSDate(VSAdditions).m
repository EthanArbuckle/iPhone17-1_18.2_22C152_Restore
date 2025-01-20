@interface NSDate(VSAdditions)
+ (uint64_t)vs_currentDate;
- (BOOL)vs_isAfter:()VSAdditions;
- (BOOL)vs_isBefore:()VSAdditions;
- (id)vs_dateIncrementedByDays:()VSAdditions;
- (id)vs_dateIncrementedByMinutes:()VSAdditions;
- (id)vs_dateRoundedToDay;
@end

@implementation NSDate(VSAdditions)

+ (uint64_t)vs_currentDate
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (id)vs_dateRoundedToDay
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [v2 components:30 fromDate:a1];
  [v3 setCalendar:v2];
  v4 = [v3 date];

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [components date] parameter must not be nil."];
  }
  v5 = [v3 date];

  return v5;
}

- (id)vs_dateIncrementedByDays:()VSAdditions
{
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 dateByAddingUnit:16 value:a3 toDate:a1 options:0];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [calendar dateByAddingUnit:NSCalendarUnitDay value:days toDate:self options:0] parameter must not be nil."];
  }
  v7 = [v5 dateByAddingUnit:16 value:a3 toDate:a1 options:0];

  return v7;
}

- (id)vs_dateIncrementedByMinutes:()VSAdditions
{
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 dateByAddingUnit:64 value:a3 toDate:a1 options:0];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [calendar dateByAddingUnit:NSCalendarUnitMinute value:minutes toDate:self options:0] parameter must not be nil."];
  }
  v7 = [v5 dateByAddingUnit:64 value:a3 toDate:a1 options:0];

  return v7;
}

- (BOOL)vs_isAfter:()VSAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)vs_isBefore:()VSAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

@end