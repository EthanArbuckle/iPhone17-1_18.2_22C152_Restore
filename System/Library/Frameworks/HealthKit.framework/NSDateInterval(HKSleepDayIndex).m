@interface NSDateInterval(HKSleepDayIndex)
+ (id)hk_sleepDayIntervalForMorningIndex:()HKSleepDayIndex calendar:;
+ (id)hk_sleepDayIntervalForMorningIndexRange:()HKSleepDayIndex calendar:;
+ (id)hk_sleepWeekIntervalForMorningIndex:()HKSleepDayIndex calendar:;
- (id)_hk_dateForYearMonthDayComponents:()HKSleepDayIndex hourMinuteSecondComponents:calendar:;
- (id)hk_dateIntervalByMappingToSleepDayWithMorningIndex:()HKSleepDayIndex calendar:;
- (uint64_t)hk_dayIndexRangeWithCalendar:()HKSleepDayIndex;
@end

@implementation NSDateInterval(HKSleepDayIndex)

+ (id)hk_sleepDayIntervalForMorningIndex:()HKSleepDayIndex calendar:
{
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  v7 = objc_msgSend(v5, "hk_sleepDayStartForMorningIndex:calendar:", a3, v6);
  v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", a3 + 1, v6);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];

  return v9;
}

+ (id)hk_sleepDayIntervalForMorningIndexRange:()HKSleepDayIndex calendar:
{
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a5;
  v9 = objc_msgSend(v7, "hk_sleepDayStartForMorningIndex:calendar:", a3, v8);
  if (a4 <= 0) {
    unint64_t v10 = 0x8000000000000000;
  }
  else {
    unint64_t v10 = a3 + a4;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", v10, v8);

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v11];

  return v12;
}

+ (id)hk_sleepWeekIntervalForMorningIndex:()HKSleepDayIndex calendar:
{
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  v7 = objc_msgSend(v5, "hk_sleepWeekStartForMorningIndex:calendar:", a3, v6);
  id v8 = objc_msgSend(v6, "hk_dateByAddingDays:toDate:", 7, v7);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];

  return v9;
}

- (id)hk_dateIntervalByMappingToSleepDayWithMorningIndex:()HKSleepDayIndex calendar:
{
  id v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "hk_sleepDayIntervalForMorningIndex:calendar:", a3, v6);
  id v8 = [a1 startDate];
  if ([v7 containsDate:v8])
  {
    v9 = [a1 endDate];
    int v10 = [v7 containsDate:v9];

    if (v10)
    {
      id v11 = a1;
      goto LABEL_11;
    }
  }
  else
  {
  }
  v12 = [v7 startDate];
  v13 = [v6 components:28 fromDate:v12];

  v14 = [v7 endDate];
  v15 = [v6 components:28 fromDate:v14];

  v16 = [a1 startDate];
  v17 = [v6 components:224 fromDate:v16];

  if ([v17 hour] >= 18) {
    v18 = v13;
  }
  else {
    v18 = v15;
  }
  v19 = objc_msgSend(a1, "_hk_dateForYearMonthDayComponents:hourMinuteSecondComponents:calendar:", v18, v17, v6);
  [a1 duration];
  v20 = objc_msgSend(v19, "dateByAddingTimeInterval:");
  v21 = [v7 endDate];
  int v22 = objc_msgSend(v20, "hk_isAfterDate:", v21);

  if (v22)
  {
    uint64_t v23 = [v7 endDate];

    v20 = (void *)v23;
  }
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 endDate:v20];

LABEL_11:

  return v11;
}

- (uint64_t)hk_dayIndexRangeWithCalendar:()HKSleepDayIndex
{
  id v4 = a3;
  v5 = [a1 startDate];
  uint64_t v6 = objc_msgSend(v5, "hk_morningIndexWithCalendar:", v4);

  v7 = [a1 endDate];
  objc_msgSend(v7, "hk_morningIndexWithCalendar:", v4);

  return v6;
}

- (id)_hk_dateForYearMonthDayComponents:()HKSleepDayIndex hourMinuteSecondComponents:calendar:
{
  v7 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 setCalendar:v8];

  objc_msgSend(v11, "setYear:", objc_msgSend(v10, "year"));
  objc_msgSend(v11, "setMonth:", objc_msgSend(v10, "month"));
  uint64_t v12 = [v10 day];

  [v11 setDay:v12];
  objc_msgSend(v11, "setHour:", objc_msgSend(v9, "hour"));
  objc_msgSend(v11, "setMinute:", objc_msgSend(v9, "minute"));
  uint64_t v13 = [v9 second];

  [v11 setSecond:v13];
  v14 = [v11 date];

  return v14;
}

@end