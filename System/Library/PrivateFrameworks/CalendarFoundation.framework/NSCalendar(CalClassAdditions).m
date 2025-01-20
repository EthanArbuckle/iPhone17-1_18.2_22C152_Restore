@interface NSCalendar(CalClassAdditions)
+ (id)CalCalendarWithUnsanitizedCalendarIdentifier:()CalClassAdditions;
+ (id)CalDateFromBirthdayComponents:()CalClassAdditions;
+ (id)CalGregorianCalendarForTimeZone:()CalClassAdditions;
+ (id)CalGregorianGMTCalendar;
+ (id)CalYearlessDateThreshold;
+ (id)sharedAutoupdatingCurrentCalendar;
- (BOOL)dateIsFirstOfMonth:()CalClassAdditions;
- (BOOL)dateIsFirstOfYear:()CalClassAdditions;
- (id)CalDateBySubtractingComponents:()CalClassAdditions fromDate:;
- (id)CalDateFromComponents:()CalClassAdditions inTimeZone:;
- (id)CalOccurrencesForBirthday:()CalClassAdditions inDateRange:;
- (id)dateBySanityCheckingDateRoundedToDay:()CalClassAdditions;
- (id)mapDatesFromDate:()CalClassAdditions stepSize:range:mapBlock:;
- (uint64_t)CalDaysInYearContainingDate:()CalClassAdditions;
- (uint64_t)CalWeeksInMonthContainingDate:()CalClassAdditions;
- (uint64_t)CalWeeksInYearContainingDate:()CalClassAdditions;
- (uint64_t)cal_isMultidayEventForUIWithStartDate:()CalClassAdditions endDate:;
- (uint64_t)calendarDaysFromDate:()CalClassAdditions toDate:;
- (uint64_t)daysInMonthContainingDate:()CalClassAdditions;
- (uint64_t)daysInWeek;
- (uint64_t)hoursInDay;
- (uint64_t)minutesInHour;
- (uint64_t)monthsInYearForDate:()CalClassAdditions;
- (uint64_t)secondsInDay;
- (uint64_t)secondsInMinute;
@end

@implementation NSCalendar(CalClassAdditions)

- (id)dateBySanityCheckingDateRoundedToDay:()CalClassAdditions
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 hourInCalendar:a1];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = v4;
    v8 = v7;
    v9 = v7;
    if (v6 >= 12)
    {
      v9 = [v7 dateByAddingDays:1 inCalendar:a1];
    }
    id v4 = [v9 dateRemovingTimeComponentsInCalendar:a1];

    if (([v4 isEqualToDate:v8] & 1) == 0)
    {
      v10 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v8 dateStyle:1 timeStyle:1];
        v20 = [a1 timeZone];
        v13 = [v20 descriptionForDate:v8];
        v14 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v4 dateStyle:1 timeStyle:1];
        v19 = [a1 timeZone];
        v15 = [v19 descriptionForDate:v4];
        v16 = [a1 calendarIdentifier];
        v17 = [a1 locale];
        v18 = [v17 localeIdentifier];
        *(_DWORD *)buf = 138413570;
        v22 = v12;
        __int16 v23 = 2112;
        v24 = v13;
        __int16 v25 = 2112;
        v26 = v14;
        __int16 v27 = 2112;
        v28 = v15;
        __int16 v29 = 2112;
        v30 = v16;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_error_impl(&dword_190D88000, v10, OS_LOG_TYPE_ERROR, "ERROR: The given date could not be rounded to midnight. This date & time may not exist in the active calendar.\n\tInitial Start Date = %@ in %@;\n"
          "\tRevised Start Date = %@ in %@;\n"
          "\tCalendar/Locale = %@/%@;",
          buf,
          0x3Eu);
      }
    }
  }

  return v4;
}

- (uint64_t)daysInWeek
{
  [a1 maximumRangeOfUnit:512];
  if (v1 <= 0) {
    return 7;
  }
  else {
    return v1;
  }
}

+ (id)CalGregorianGMTCalendar
{
  if (CalGregorianGMTCalendar_onceToken != -1) {
    dispatch_once(&CalGregorianGMTCalendar_onceToken, &__block_literal_global_13_0);
  }
  v0 = (void *)CalGregorianGMTCalendar_gregorianGMTCalendar;

  return v0;
}

+ (id)CalGregorianCalendarForTimeZone:()CalClassAdditions
{
  id v4 = a3;
  if (!v4
    || ([MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 isEquivalentTo:v5],
        v5,
        v6))
  {
    id v7 = [a1 CalGregorianGMTCalendar];
    goto LABEL_12;
  }
  v8 = [v4 name];
  os_unfair_lock_lock((os_unfair_lock_t)&CalGregorianCalendarForTimeZone__lock);
  id v9 = (id)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
  if (CalGregorianCalendarForTimeZone__calendarForTimeZoneCache) {
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained(&CalGregorianCalendarForTimeZone__weakCache);
  if (!WeakRetained)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = (void *)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
    CalGregorianCalendarForTimeZone__calendarForTimeZoneCache = (uint64_t)v9;

LABEL_5:
    id WeakRetained = v9;
  }
  id v7 = [WeakRetained objectForKey:v8];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v7 setTimeZone:v4];
    [WeakRetained setObject:v7 forKey:v8];
    unint64_t v11 = [WeakRetained count];
    if (CalGregorianCalendarForTimeZone__calendarForTimeZoneCache)
    {
      if (v11 >= 0x20)
      {
        objc_storeWeak(&CalGregorianCalendarForTimeZone__weakCache, (id)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache);
        CFTypeRef v12 = CFRetain((CFTypeRef)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache);
        CFAutorelease(v12);
        v13 = (void *)CalGregorianCalendarForTimeZone__calendarForTimeZoneCache;
        CalGregorianCalendarForTimeZone__calendarForTimeZoneCache = 0;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CalGregorianCalendarForTimeZone__lock);

LABEL_12:

  return v7;
}

- (id)CalOccurrencesForBirthday:()CalClassAdditions inDateRange:
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 isValid])
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  v8 = objc_opt_new();
  objc_msgSend(v8, "setMonth:", objc_msgSend(v6, "month"));
  objc_msgSend(v8, "setLeapMonth:", objc_msgSend(v6, "isLeapMonth"));
  objc_msgSend(v8, "setDay:", objc_msgSend(v6, "day"));
  if ([v6 year] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "era") == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  id v9 = [a1 dateFromComponents:v6];
  v10 = [v7 endDate];
  char v11 = [v9 CalIsAfterDate:v10];

  if ((v11 & 1) == 0)
  {
    v13 = [v7 startDate];
    int v14 = [v9 CalIsAfterDate:v13];

    if (v14)
    {
      v15 = [CalDateRange alloc];
      v16 = [v7 endDate];
      uint64_t v17 = [(CalDateRange *)v15 initWithStartDate:v9 endDate:v16];

      id v7 = (id)v17;
    }

LABEL_10:
    v18 = [v7 startDate];
    v19 = [a1 nextDateAfterDate:v18 matchingHour:0 minute:0 second:0 options:6];

    v20 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__NSCalendar_CalClassAdditions__CalOccurrencesForBirthday_inDateRange___block_invoke;
    v24[3] = &unk_1E56CD8E8;
    id v7 = v7;
    id v25 = v7;
    id v21 = v20;
    id v26 = v21;
    [a1 enumerateDatesStartingAfterDate:v19 matchingComponents:v8 options:256 usingBlock:v24];
    v22 = v26;
    id v12 = v21;

    goto LABEL_11;
  }

  id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_11:

LABEL_12:

  return v12;
}

- (uint64_t)calendarDaysFromDate:()CalClassAdditions toDate:
{
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7 || ([v6 isEqualToDate:v7] & 1) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [a1 components:48 fromDate:v6 toDate:v7 options:0];
    uint64_t v8 = [v9 day];
    if ([v9 hour])
    {
      uint64_t v10 = [v6 hourInCalendar:a1];
      char v11 = [a1 timeZone];
      uint64_t v12 = [v11 secondsFromGMTForDate:v7];
      v13 = [a1 timeZone];
      uint64_t v14 = v12 - [v13 secondsFromGMTForDate:v6];

      if (v14 <= 0) {
        unint64_t v15 = 0;
      }
      else {
        unint64_t v15 = v14 / 0xE10uLL;
      }
      uint64_t v16 = [v9 hour] + v10 + v15;
      if (v16 < 24) {
        v8 += v16 >> 63;
      }
      else {
        ++v8;
      }
    }
  }
  return v8;
}

- (uint64_t)secondsInMinute
{
  [a1 maximumRangeOfUnit:128];
  if (v1 <= 0) {
    return 60;
  }
  else {
    return v1;
  }
}

+ (id)sharedAutoupdatingCurrentCalendar
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NSCalendar_CalClassAdditions__sharedAutoupdatingCurrentCalendar__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAutoupdatingCurrentCalendar_onceToken != -1) {
    dispatch_once(&sharedAutoupdatingCurrentCalendar_onceToken, block);
  }
  uint64_t v1 = (void *)sharedAutoupdatingCurrentCalendar_autoupdatingCalendar;

  return v1;
}

- (BOOL)dateIsFirstOfMonth:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 components:14 fromDate:v4];
  id v6 = [a1 dateFromComponents:v5];
  if (v6) {
    BOOL v7 = [a1 compareDate:v6 toDate:v4 toUnitGranularity:16] == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)monthsInYearForDate:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 yearInCalendar:a1];
  id v6 = [MEMORY[0x1E4F1C9D8] CalComponentForYears:v5];
  BOOL v7 = [a1 dateFromComponents:v6];
  if ([v4 yearInCalendar:a1] == v5)
  {
    uint64_t v8 = 0;
    id v9 = v4;
    do
    {
      id v4 = [v7 dateByAddingMonths:++v8 inCalendar:a1];

      id v9 = v4;
    }
    while ([v4 yearInCalendar:a1] == v5);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)minutesInHour
{
  [a1 maximumRangeOfUnit:64];
  if (v1 <= 0) {
    return 60;
  }
  else {
    return v1;
  }
}

- (uint64_t)hoursInDay
{
  [a1 maximumRangeOfUnit:32];
  if (v1 <= 0) {
    return 24;
  }
  else {
    return v1;
  }
}

+ (id)CalYearlessDateThreshold
{
  if (CalYearlessDateThreshold_onceToken != -1) {
    dispatch_once(&CalYearlessDateThreshold_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)CalYearlessDateThreshold_s_threshold;

  return v0;
}

- (uint64_t)secondsInDay
{
  uint64_t v2 = [a1 secondsInMinute];
  uint64_t v3 = [a1 minutesInHour] * v2;
  return v3 * [a1 hoursInDay];
}

- (uint64_t)daysInMonthContainingDate:()CalClassAdditions
{
  [a1 rangeOfUnit:16 inUnit:8 forDate:a3];
  return v3;
}

- (uint64_t)CalDaysInYearContainingDate:()CalClassAdditions
{
  [a1 rangeOfUnit:16 inUnit:4 forDate:a3];
  return v3;
}

- (uint64_t)CalWeeksInMonthContainingDate:()CalClassAdditions
{
  [a1 rangeOfUnit:4096 inUnit:8 forDate:a3];
  return v3;
}

- (uint64_t)CalWeeksInYearContainingDate:()CalClassAdditions
{
  [a1 rangeOfUnit:0x2000 inUnit:4 forDate:a3];
  return v3;
}

- (BOOL)dateIsFirstOfYear:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 components:14 fromDate:v4];
  id v6 = objc_opt_new();
  objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  BOOL v7 = [a1 dateFromComponents:v6];
  if (v7) {
    BOOL v8 = [a1 compareDate:v7 toDate:v4 toUnitGranularity:16] == 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (uint64_t)cal_isMultidayEventForUIWithStartDate:()CalClassAdditions endDate:
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDate:v6 inSameDayAsDate:v7])
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [a1 startOfDayForDate:v6];
    uint64_t v10 = [a1 dateByAddingUnit:16 value:1 toDate:v9 options:0];
    uint64_t v8 = [v7 isEqualToDate:v10] ^ 1;
  }
  return v8;
}

- (id)CalDateFromComponents:()CalClassAdditions inTimeZone:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 timeZone];
  [a1 setTimeZone:v6];

  id v9 = [a1 dateFromComponents:v7];

  [a1 setTimeZone:v8];

  return v9;
}

- (id)CalDateBySubtractingComponents:()CalClassAdditions fromDate:
{
  id v5 = a4;
  id v6 = (void *)[a3 copy];
  if ([v6 era] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setEra:", -objc_msgSend(v6, "era"));
  }
  if ([v6 year] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setYear:", -objc_msgSend(v6, "year"));
  }
  if ([v6 month] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setMonth:", -objc_msgSend(v6, "month"));
  }
  if ([v6 day] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setDay:", -objc_msgSend(v6, "day"));
  }
  if ([v6 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setHour:", -objc_msgSend(v6, "hour"));
  }
  if ([v6 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setMinute:", -objc_msgSend(v6, "minute"));
  }
  if ([v6 second] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "setSecond:", -objc_msgSend(v6, "second"));
  }
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];

  return v8;
}

+ (id)CalCalendarWithUnsanitizedCalendarIdentifier:()CalClassAdditions
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)*MEMORY[0x1E4F1C318];
  }
  id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v3];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  }

  return v4;
}

+ (id)CalDateFromBirthdayComponents:()CalClassAdditions
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  id v5 = [v3 calendar];
  [v5 setTimeZone:v4];

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  if ([v3 year] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [v3 calendar];
    id v7 = [v6 calendarIdentifier];
    int v8 = [(id)*MEMORY[0x1E4F1C318] isEqualToString:v7];

    if (v8)
    {
      id v9 = (void *)[v3 copy];
      [v9 setYear:1604];
      uint64_t v10 = [v3 calendar];
      uint64_t v11 = [v10 dateFromComponents:v9];
      uint64_t v12 = (void *)v25[5];
      v25[5] = v11;
    }
    else
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v23[3] = 0;
      [v3 setEra:0x7FFFFFFFFFFFFFFFLL];
      unint64_t v15 = [v3 calendar];
      uint64_t v16 = [MEMORY[0x1E4F1C9A8] CalYearlessDateThreshold];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke;
      v19[3] = &unk_1E56CD910;
      id v21 = &v24;
      id v20 = v3;
      v22 = v23;
      [v15 enumerateDatesStartingAfterDate:v16 matchingComponents:v20 options:6 usingBlock:v19];

      _Block_object_dispose(v23, 8);
    }
  }
  else
  {
    uint64_t v13 = [v3 date];
    uint64_t v14 = (void *)v25[5];
    v25[5] = v13;
  }
  id v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (id)mapDatesFromDate:()CalClassAdditions stepSize:range:mapBlock:
{
  id v10 = a3;
  uint64_t v11 = a6;
  uint64_t v12 = objc_opt_new();
  id v13 = v10;
  uint64_t v14 = [a1 dateByAddingUnit:a5 value:1 toDate:v13 options:0];
  unint64_t v15 = v13;
  if ([v13 isBeforeDate:v14])
  {
    uint64_t v16 = v13;
    do
    {
      unint64_t v15 = [a1 dateByAddingUnit:a4 value:1 toDate:v16 options:0];

      id v17 = v11[2](v11, v15);
      [v12 addObject:v17];

      uint64_t v16 = v15;
    }
    while (([v15 isBeforeDate:v14] & 1) != 0);
  }

  return v12;
}

@end