@interface NSCalendar(HKCalendar)
+ (id)hk_canonicalDateOfBirthDateComponentsWithDate:()HKCalendar;
+ (id)hk_gregorianCalendarWithCupertinoTimeZone;
+ (id)hk_gregorianCalendarWithFirstWeekdayFromRegion;
+ (id)hk_gregorianCalendarWithLocalTimeZone;
+ (id)hk_gregorianCalendarWithUTCTimeZone;
+ (id)hk_localDateOfBirthDateComponentsWithDate:()HKCalendar;
+ (uint64_t)hk_gregorianCalendar;
- (BOOL)hk_isDate:()HKCalendar withinNumberOfCalendarDays:ofDate:;
- (double)_hk_cachedLengthOfUnitForUnitStartDate:()HKCalendar calendarUnit:;
- (double)hk_durationSinceReferenceDateForDate:()HKCalendar calendarUnit:;
- (double)hk_lengthOfDayForDate:()HKCalendar;
- (double)hk_timeIntervalSinceStartOfDayForDate:()HKCalendar;
- (id)_hk_weekendDaysForDate:()HKCalendar;
- (id)hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:()HKCalendar;
- (id)hk_dateByShiftingToGregorianCalendarWithUTCTimeZone:()HKCalendar;
- (id)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:second:;
- (id)hk_dateOfBirthDateComponentsWithDate:()HKCalendar;
- (id)hk_dateWithDurationSinceReferenceDate:()HKCalendar calendarUnit:;
- (id)hk_firstDateWithHour:()HKCalendar minute:afterDate:;
- (id)hk_nearestNoonBeforeDateOrEqualToDate:()HKCalendar;
- (id)hk_nearestStartOfDayForDate:()HKCalendar;
- (id)hk_nearestStartOfMonthForDate:()HKCalendar;
- (id)hk_nearestStartOfWeekWithFirstWeekDay:()HKCalendar date:;
- (id)hk_sixMonthPeriodContaining:()HKCalendar dateBefore:;
- (id)hk_startOfDateByAddingDays:()HKCalendar toDate:;
- (id)hk_startOfFitnessWeekBeforeDate:()HKCalendar;
- (id)hk_startOfHourForDate:()HKCalendar addingHours:;
- (id)hk_startOfHourForDate:()HKCalendar moduloHours:addingModuloCount:;
- (id)hk_startOfMinuteForDate:()HKCalendar moduloMinutes:addingModuloCount:;
- (id)hk_startOfMonthForDate:()HKCalendar;
- (id)hk_startOfMonthForDate:()HKCalendar addingMonths:;
- (id)hk_startOfUnitForDate:()HKCalendar calendarUnit:;
- (id)hk_startOfWeekWithFirstWeekday:()HKCalendar beforeDate:addingWeeks:;
- (id)hk_startOfYearForDate:()HKCalendar addingYears:;
- (id)hk_timeZoneDependentReferenceDate;
- (id)hk_weekendDays;
- (id)hk_weeksContainingInterval:()HKCalendar firstWeekday:;
- (uint64_t)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:()HKCalendar calendarUnit:;
- (uint64_t)hk_dateByAddingDays:()HKCalendar toDate:;
- (uint64_t)hk_dateBySubtractingDays:()HKCalendar fromDate:;
- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:;
- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:;
- (uint64_t)hk_startOfDateBySubtractingDays:()HKCalendar fromDate:;
- (void)hk_enumerateDateInterval:()HKCalendar byDateComponents:block:;
@end

@implementation NSCalendar(HKCalendar)

- (uint64_t)hk_dateBySubtractingDays:()HKCalendar fromDate:
{
  return [a1 dateByAddingUnit:16 value:-a3 toDate:a4 options:0];
}

+ (id)hk_gregorianCalendarWithUTCTimeZone
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v0 setTimeZone:v1];

  return v0;
}

- (uint64_t)hk_startOfDateBySubtractingDays:()HKCalendar fromDate:
{
  return objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", -a3);
}

- (id)hk_startOfDateByAddingDays:()HKCalendar toDate:
{
  v5 = [a1 dateByAddingUnit:16 value:a3 toDate:a4 options:0];
  v6 = [a1 startOfDayForDate:v5];

  return v6;
}

- (id)hk_dateByShiftingToGregorianCalendarWithUTCTimeZone:()HKCalendar
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v7 = [a1 components:254 fromDate:v5];

  v8 = [v6 dateFromComponents:v7];

  return v8;
}

- (id)hk_startOfFitnessWeekBeforeDate:()HKCalendar
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", HKFirstDayOfWeekForWeeklyGoalCalculations(), v4, 0);

  return v5;
}

- (id)hk_startOfWeekWithFirstWeekday:()HKCalendar beforeDate:addingWeeks:
{
  id v8 = a4;
  uint64_t v9 = [a1 component:512 fromDate:v8];
  v10 = [a1 dateByAddingUnit:16 value:7 * ((v9 - a3 + 7) / 7) - (v9 - a3 + 7) toDate:v8 options:0];

  v11 = [a1 startOfDayForDate:v10];

  if (a5)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v12 setCalendar:a1];
    [v12 setWeekOfYear:1];
    uint64_t v13 = objc_msgSend(v12, "hk_dateByAddingInterval:toDate:", a5, v11);

    v11 = (void *)v13;
  }

  return v11;
}

+ (uint64_t)hk_gregorianCalendar
{
  return [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
}

- (id)hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:()HKCalendar
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v7 = [v6 components:254 fromDate:v5];

  id v8 = [a1 dateFromComponents:v7];

  return v8;
}

+ (id)hk_canonicalDateOfBirthDateComponentsWithDate:()HKCalendar
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendarWithUTCTimeZone");
  v6 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);

  v7 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  [v6 setCalendar:v7];

  return v6;
}

- (id)hk_dateOfBirthDateComponentsWithDate:()HKCalendar
{
  id v4 = [a1 components:30 fromDate:a3];
  [v4 setCalendar:a1];

  return v4;
}

+ (id)hk_gregorianCalendarWithLocalTimeZone
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v0 setTimeZone:v1];

  return v0;
}

+ (id)hk_gregorianCalendarWithCupertinoTimeZone
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
  [v0 setTimeZone:v1];

  return v0;
}

+ (id)hk_gregorianCalendarWithFirstWeekdayFromRegion
{
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  v2 = [v1 objectForKey:*MEMORY[0x1E4F1C3E0]];
  objc_msgSend(v0, "setFirstWeekday:", objc_msgSend(v2, "firstWeekday"));

  return v0;
}

+ (id)hk_localDateOfBirthDateComponentsWithDate:()HKCalendar
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v6 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);

  v7 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  [v6 setCalendar:v7];

  return v6;
}

- (id)hk_weeksContainingInterval:()HKCalendar firstWeekday:
{
  id v6 = a3;
  v7 = [v6 startDate];
  id v8 = objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v7, 0);

  uint64_t v9 = [v6 endDate];
  v10 = objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v9, 0);

  v11 = [v6 endDate];
  int v12 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

  if (v12)
  {
    uint64_t v13 = [v6 endDate];
    uint64_t v14 = objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a4, v13, 1);

    v10 = (void *)v14;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v10];

  return v15;
}

- (id)hk_startOfMinuteForDate:()HKCalendar moduloMinutes:addingModuloCount:
{
  id v8 = [a1 components:126 fromDate:a3];
  uint64_t v9 = v8;
  if (a4 < 1)
  {
    a4 = 1;
  }
  else if (0x3CuLL % a4)
  {
    a4 = 1;
  }
  objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a4 * a4);
  v10 = [a1 dateFromComponents:v9];
  if (a5)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v11 setCalendar:a1];
    [v11 setMinute:a4];
    uint64_t v12 = objc_msgSend(v11, "hk_dateByAddingInterval:toDate:", a5, v10);

    v10 = (void *)v12;
  }

  return v10;
}

- (id)hk_startOfHourForDate:()HKCalendar addingHours:
{
  id v6 = [a1 components:62 fromDate:a3];
  v7 = [a1 dateFromComponents:v6];
  if (a4)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v8 setCalendar:a1];
    [v8 setHour:1];
    uint64_t v9 = objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a4, v7);

    v7 = (void *)v9;
  }

  return v7;
}

- (id)hk_startOfHourForDate:()HKCalendar moduloHours:addingModuloCount:
{
  id v8 = [a1 components:62 fromDate:a3];
  uint64_t v9 = v8;
  if (a4 < 1)
  {
    a4 = 1;
  }
  else if (0x18uLL % a4)
  {
    a4 = 1;
  }
  objc_msgSend(v8, "setHour:", objc_msgSend(v8, "hour") / a4 * a4);
  v10 = [a1 dateFromComponents:v9];
  if (a5)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v11 setCalendar:a1];
    [v11 setHour:a4];
    uint64_t v12 = objc_msgSend(v11, "hk_dateByAddingInterval:toDate:", a5, v10);

    v10 = (void *)v12;
  }

  return v10;
}

- (id)hk_startOfMonthForDate:()HKCalendar
{
  id v4 = [a1 components:14 fromDate:a3];
  id v5 = [a1 dateFromComponents:v4];

  return v5;
}

- (id)hk_startOfMonthForDate:()HKCalendar addingMonths:
{
  id v6 = objc_msgSend(a1, "hk_startOfMonthForDate:");
  if (a4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setCalendar:a1];
    [v7 setMonth:1];
    uint64_t v8 = objc_msgSend(v7, "hk_dateByAddingInterval:toDate:", a4, v6);

    id v6 = (void *)v8;
  }

  return v6;
}

- (id)hk_startOfYearForDate:()HKCalendar addingYears:
{
  id v6 = [a1 components:6 fromDate:a3];
  id v7 = [a1 dateFromComponents:v6];
  if (a4)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v8 setCalendar:a1];
    [v8 setYear:1];
    uint64_t v9 = objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a4, v7);

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)hk_nearestStartOfDayForDate:()HKCalendar
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 startOfDayForDate:v4];
  v10[0] = v5;
  id v6 = objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", 1, v4);
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = objc_msgSend(v4, "hk_nearestDate:", v7);

  return v8;
}

- (id)hk_nearestStartOfWeekWithFirstWeekDay:()HKCalendar date:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_msgSend(a1, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a3, v6, 0);
  id v8 = objc_msgSend(a1, "hk_startOfDateByAddingDays:toDate:", 7, v7);
  v12[0] = v7;
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = objc_msgSend(v6, "hk_nearestDate:", v9);

  return v10;
}

- (id)hk_nearestStartOfMonthForDate:()HKCalendar
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hk_startOfMonthForDate:", v4);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setCalendar:a1];
  [v6 setMonth:1];
  id v7 = [a1 dateByAddingComponents:v6 toDate:v5 options:0];
  v11[0] = v5;
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v9 = objc_msgSend(v4, "hk_nearestDate:", v8);

  return v9;
}

- (id)hk_sixMonthPeriodContaining:()HKCalendar dateBefore:
{
  id v6 = [a1 components:24578 fromDate:a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v7, "setEra:", objc_msgSend(v6, "era"));
  objc_msgSend(v7, "setYearForWeekOfYear:", objc_msgSend(v6, "yearForWeekOfYear"));
  uint64_t v8 = [v6 weekOfYear];
  if (a4)
  {
    if (v8 <= 26) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 27;
    }
  }
  else if (v8 < 27)
  {
    uint64_t v9 = 27;
  }
  else
  {
    objc_msgSend(v7, "setYearForWeekOfYear:", objc_msgSend(v7, "yearForWeekOfYear") + 1);
    uint64_t v9 = 1;
  }
  [v7 setWeekOfYear:v9];
  v10 = [a1 dateFromComponents:v7];

  return v10;
}

- (uint64_t)hk_dateByAddingDays:()HKCalendar toDate:
{
  return [a1 dateByAddingUnit:16 value:a3 toDate:a4 options:0];
}

- (id)hk_firstDateWithHour:()HKCalendar minute:afterDate:
{
  id v8 = a5;
  uint64_t v9 = [a1 dateBySettingHour:a3 minute:a4 second:0 ofDate:v8 options:0];
  if (objc_msgSend(v9, "hk_isBeforeDate:", v8))
  {
    v10 = [a1 dateByAddingUnit:16 value:1 toDate:v8 options:0];
    uint64_t v11 = [a1 dateBySettingHour:a3 minute:a4 second:0 ofDate:v10 options:0];

    uint64_t v9 = (void *)v11;
  }

  return v9;
}

- (id)hk_weekendDays
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = objc_msgSend(a1, "_hk_weekendDaysForDate:", v2);

  return v3;
}

- (id)_hk_weekendDaysForDate:()HKCalendar
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = 7;
  do
  {
    if ([a1 isDateInWeekend:v4])
    {
      id v7 = [a1 components:512 fromDate:v4];
      uint64_t v8 = [v7 weekday];

      uint64_t v9 = [NSNumber numberWithUnsignedInteger:v8];
      [v5 addObject:v9];
    }
    v10 = objc_msgSend(a1, "hk_dateByAddingDays:toDate:", 1, v4);

    id v4 = v10;
    --v6;
  }
  while (v6);

  return v5;
}

- (id)hk_nearestNoonBeforeDateOrEqualToDate:()HKCalendar
{
  id v4 = a3;
  id v5 = [a1 startOfDayForDate:v4];
  uint64_t v6 = [a1 dateBySettingHour:12 minute:0 second:0 ofDate:v5 options:0];
  int v7 = objc_msgSend(v4, "hk_isBeforeDate:", v6);

  if (v7)
  {
    uint64_t v8 = [a1 dateByAddingUnit:16 value:-1 toDate:v6 options:0];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (double)hk_timeIntervalSinceStartOfDayForDate:()HKCalendar
{
  id v4 = a3;
  id v5 = [a1 startOfDayForDate:v4];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:
{
  return objc_msgSend(a1, "hk_dateFromComponentsWithYear:month:day:hour:minute:second:", a3, a4, a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (uint64_t)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:
{
  return objc_msgSend(a1, "hk_dateFromComponentsWithYear:month:day:hour:minute:second:", a3, a4, a5, a6, a7, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)hk_dateFromComponentsWithYear:()HKCalendar month:day:hour:minute:second:
{
  id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v15 setYear:a3];
  [v15 setMonth:a4];
  [v15 setDay:a5];
  [v15 setHour:a6];
  [v15 setMinute:a7];
  [v15 setSecond:a8];
  v16 = [a1 dateFromComponents:v15];

  return v16;
}

- (void)hk_enumerateDateInterval:()HKCalendar byDateComponents:block:
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  uint64_t v11 = [v8 startDate];
  char v21 = 0;
  uint64_t v12 = [v8 endDate];
  int v13 = objc_msgSend(v11, "hk_isBeforeDate:", v12);

  if (v13)
  {
    while (1)
    {
      uint64_t v14 = [a1 dateByAddingComponents:v9 toDate:v11 options:0];
      id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
      v16 = [v8 endDate];
      v17 = HKDateMin(v14, v16);
      v18 = (void *)[v15 initWithStartDate:v11 endDate:v17];
      v10[2](v10, v18, &v21);

      if (v21) {
        break;
      }

      v19 = [v8 endDate];
      char v20 = objc_msgSend(v14, "hk_isBeforeDate:", v19);

      uint64_t v11 = v14;
      if ((v20 & 1) == 0) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v14 = v11;
LABEL_7:
}

- (double)hk_lengthOfDayForDate:()HKCalendar
{
  v2 = objc_msgSend(a1, "startOfDayForDate:");
  v3 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_oneDay");
  id v4 = [a1 dateByAddingComponents:v3 toDate:v2 options:0];

  [v4 timeIntervalSinceDate:v2];
  double v6 = v5;

  return v6;
}

- (id)hk_timeZoneDependentReferenceDate
{
  os_unfair_lock_lock((os_unfair_lock_t)&hk_timeZoneDependentReferenceDate___referenceDateCacheLock);
  v2 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
  if (!hk_timeZoneDependentReferenceDate___referenceDateCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v4 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
    hk_timeZoneDependentReferenceDate___referenceDateCache = (uint64_t)v3;

    v2 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
  }
  double v5 = [a1 timeZone];
  double v6 = [v2 objectForKey:v5];

  if (!v6)
  {
    double v7 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    id v8 = [a1 timeZone];
    [v7 setTimeZone:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v9 setYear:2001];
    [v9 setMonth:1];
    [v9 setDay:1];
    double v6 = [v7 dateFromComponents:v9];
    v10 = (void *)hk_timeZoneDependentReferenceDate___referenceDateCache;
    uint64_t v11 = [a1 timeZone];
    [v10 setObject:v6 forKey:v11];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&hk_timeZoneDependentReferenceDate___referenceDateCacheLock);

  return v6;
}

- (uint64_t)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:()HKCalendar calendarUnit:
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateLock);
  if (!_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = (void *)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache;
    _hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache = (uint64_t)v7;
  }
  id v9 = [[_HKDateCalendarUnitKey alloc] initWithDate:v6 calendar:a1 unit:a4];
  v10 = [(id)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache objectForKey:v9];
  if (!v10)
  {
    uint64_t v11 = objc_msgSend(a1, "hk_timeZoneDependentReferenceDate");
    uint64_t v12 = [a1 components:a4 fromDate:v11 toDate:v6 options:0];

    uint64_t v13 = [v12 valueForComponent:a4];
    v10 = [NSNumber numberWithInteger:v13];
    [(id)_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateCache setObject:v10 forKey:v9];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate_calendarUnit____valueSinceReferenceDateLock);
  uint64_t v14 = [v10 integerValue];

  return v14;
}

- (double)_hk_cachedLengthOfUnitForUnitStartDate:()HKCalendar calendarUnit:
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitLock);
  if (!_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = (void *)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache;
    _hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache = (uint64_t)v8;
  }
  v10 = [[_HKDateCalendarUnitKey alloc] initWithDate:v7 calendar:a1 unit:a4];
  uint64_t v11 = [(id)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache objectForKey:v10];
  if (!v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_dateComponentsForCalendarUnit:", a4);
    uint64_t v13 = [a1 dateByAddingComponents:v12 toDate:v7 options:0];

    [v13 timeIntervalSinceDate:v7];
    double v15 = v14;
    if (v14 <= 2.22044605e-16)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, a1, @"NSCalendar+HKCalendar.m", 508, @"Encountered zero length of unit %lu for date %@", a4, v7 object file lineNumber description];
    }
    uint64_t v11 = [NSNumber numberWithDouble:v15];
    [(id)_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitCache setObject:v11 forKey:v10];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_hk_cachedLengthOfUnitForUnitStartDate_calendarUnit____lengthOfUnitLock);
  [v11 doubleValue];
  double v17 = v16;

  return v17;
}

- (id)hk_startOfUnitForDate:()HKCalendar calendarUnit:
{
  id v7 = a3;
  switch(a4)
  {
    case 8:
      uint64_t v8 = objc_msgSend(a1, "hk_startOfMonthForDate:", v7);
      goto LABEL_7;
    case 32:
      uint64_t v8 = objc_msgSend(a1, "hk_startOfHourForDate:addingHours:", v7, 0);
      goto LABEL_7;
    case 16:
      uint64_t v8 = [a1 startOfDayForDate:v7];
LABEL_7:
      id v9 = (void *)v8;
      goto LABEL_9;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:a1 file:@"NSCalendar+HKCalendar.m" lineNumber:526 description:@"Unsuppored calendar unit."];

  id v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)hk_isDate:()HKCalendar withinNumberOfCalendarDays:ofDate:
{
  id v8 = a5;
  id v9 = objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", a3, 16);
  uint64_t v10 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v9, 16);
  uint64_t v11 = objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", v8, 16);

  uint64_t v12 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v11, 16);
  unint64_t v13 = v10 - v12;
  if (v10 - v12 < 0) {
    unint64_t v13 = v12 - v10;
  }
  BOOL v14 = v13 <= a4;

  return v14;
}

- (double)hk_durationSinceReferenceDateForDate:()HKCalendar calendarUnit:
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"NSCalendar+HKCalendar.m" lineNumber:546 description:@"date must be an NSDate"];
  }
  id v8 = objc_msgSend(a1, "hk_startOfUnitForDate:calendarUnit:", v7, a4);
  uint64_t v9 = objc_msgSend(a1, "_hk_cachedValueSinceTimeZoneDependentReferenceDateForUnitStartDate:calendarUnit:", v8, a4);
  objc_msgSend(a1, "_hk_cachedLengthOfUnitForUnitStartDate:calendarUnit:", v8, a4);
  double v11 = v10;
  [v7 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v8 timeIntervalSinceReferenceDate];
  double v15 = (v13 - v14) / v11 + (double)v9;

  return v15;
}

- (id)hk_dateWithDurationSinceReferenceDate:()HKCalendar calendarUnit:
{
  uint64_t v7 = (uint64_t)a2;
  id v8 = objc_msgSend(a1, "hk_timeZoneDependentReferenceDate");
  uint64_t v9 = [a1 dateByAddingUnit:a4 value:v7 toDate:v8 options:0];

  objc_msgSend(a1, "_hk_cachedLengthOfUnitForUnitStartDate:calendarUnit:", v9, a4);
  double v11 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)(fmod(a2, 1.0) * v10));

  return v11;
}

@end