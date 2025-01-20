@interface NSDate(HKSleepDayIndex)
+ (id)hk_sleepMonthStartForMorningIndex:()HKSleepDayIndex calendar:;
+ (id)hk_sleepWeekStartForMorningIndex:()HKSleepDayIndex calendar:;
+ (uint64_t)hk_sleepDayStartForMorningIndex:()HKSleepDayIndex calendar:;
- (id)hk_sleepDayMidnightWithCalendar:()HKSleepDayIndex;
- (id)hk_sleepDayStartWithCalendar:()HKSleepDayIndex;
- (uint64_t)hk_morningIndexWithCalendar:()HKSleepDayIndex;
@end

@implementation NSDate(HKSleepDayIndex)

+ (uint64_t)hk_sleepDayStartForMorningIndex:()HKSleepDayIndex calendar:
{
  return objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", a3 - 1, 18, a4);
}

- (uint64_t)hk_morningIndexWithCalendar:()HKSleepDayIndex
{
  id v5 = a3;
  v6 = [v5 calendarIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v7 & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSDate+HKDayIndex.m", 68, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  v8 = [v5 components:60 fromDate:a1];
  uint64_t v9 = [v8 hour];
  uint64_t v10 = objc_msgSend(v8, "hk_dayIndex");
  if (v9 < 18) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v10 + 1;
  }

  return v11;
}

- (id)hk_sleepDayStartWithCalendar:()HKSleepDayIndex
{
  id v5 = a3;
  v6 = [v5 calendarIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDate+HKDayIndex.m", 79, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  uint64_t v8 = objc_msgSend(a1, "hk_morningIndexWithCalendar:", v5);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", v8, v5);

  return v9;
}

+ (id)hk_sleepWeekStartForMorningIndex:()HKSleepDayIndex calendar:
{
  id v6 = a4;
  char v7 = objc_msgSend(a1, "hk_noonWithDayIndex:calendar:", a3, v6);
  uint64_t v8 = objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v6, "firstWeekday"), v7, 0);
  uint64_t v9 = objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v6);

  return v9;
}

+ (id)hk_sleepMonthStartForMorningIndex:()HKSleepDayIndex calendar:
{
  id v6 = a4;
  char v7 = objc_msgSend(a1, "hk_noonWithDayIndex:calendar:", a3, v6);
  uint64_t v8 = objc_msgSend(v6, "hk_startOfMonthForDate:", v7);
  uint64_t v9 = objc_msgSend(v8, "hk_sleepDayStartWithCalendar:", v6);

  return v9;
}

- (id)hk_sleepDayMidnightWithCalendar:()HKSleepDayIndex
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "hk_morningIndexWithCalendar:", v4);
  id v6 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_sleepDayIntervalForMorningIndex:calendar:", v5, v4);
  char v7 = [v6 endDate];

  uint64_t v8 = [v4 startOfDayForDate:v7];

  return v8;
}

@end