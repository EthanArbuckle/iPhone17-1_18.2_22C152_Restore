@interface CLSCalendar
+ (BOOL)currentLocaleSupportsSeasons;
+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3;
+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3;
+ (BOOL)isDateValid:(id)a3;
+ (BOOL)isFirstMonthOfSeasonForLocalDate:(id)a3;
+ (BOOL)isFirstTenDaysOfSeasonForLocalDate:(id)a3;
+ (BOOL)isFirstTwoWeeksOfMonthForLocalDate:(id)a3;
+ (BOOL)isLastMonthOfSeasonForLocalDate:(id)a3;
+ (BOOL)isLastTwoWeeksOfMonthForLocalDate:(id)a3;
+ (BOOL)isLastWeekOfMonthForLocalDate:(id)a3;
+ (BOOL)isMiddleMonthOfSeasonForLocalDate:(id)a3;
+ (BOOL)isSecondHalfOfSeasonForLocalDate:(id)a3;
+ (BOOL)supportsSeasonsWithLocale:(id)a3;
+ (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5;
+ (id)components:(unint64_t)a3 fromDate:(id)a4;
+ (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6;
+ (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6;
+ (id)componentsFromDate:(id)a3 inTimeZone:(id)a4;
+ (id)currentLocalDate;
+ (id)dateByAddingDays:(int64_t)a3 toDate:(id)a4;
+ (id)dateByAddingHours:(int64_t)a3 toDate:(id)a4;
+ (id)dateByAddingMonths:(int64_t)a3 toDate:(id)a4;
+ (id)dateByAddingWeeksOfYear:(int64_t)a3 toDate:(id)a4;
+ (id)dateByAddingYears:(int64_t)a3 toDate:(id)a4;
+ (id)dateBySettingYear:(int64_t)a3 ofDate:(id)a4;
+ (id)dateComponentsWithLocalDate:(id)a3;
+ (id)dateComponentsWithUTCDate:(id)a3 localDate:(id)a4;
+ (id)dateFromComponents:(id)a3 inTimeZone:(id)a4;
+ (id)dateFromComponents:(unint64_t)a3 ofDate:(id)a4;
+ (id)endOfDayForDate:(id)a3;
+ (id)endOfMonthForDate:(id)a3;
+ (id)endOfWeekForDate:(id)a3;
+ (id)localDateFormatterWithFormat:(id)a3;
+ (id)localDateFromUniversalDate:(id)a3;
+ (id)localDateFromUniversalDate:(id)a3 atLocation:(id)a4;
+ (id)localDateFromUniversalDate:(id)a3 inTimeZone:(id)a4;
+ (id)localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:(id)a3;
+ (id)localStartDateForNextSeasonAfterLocalDate:(id)a3;
+ (id)localStartSeasonDateForLocalDate:(id)a3;
+ (id)northernMeteorologicalSeasonNameForDateComponents:(id)a3;
+ (id)s_seasonCountryCodesDictionary;
+ (id)seasonNameForDateComponents:(id)a3 locale:(id)a4;
+ (id)seasonNameForLocalDate:(id)a3 locale:(id)a4;
+ (id)southernMeteorologicalSeasonNameForDateComponents:(id)a3;
+ (id)startOfDayForDate:(id)a3;
+ (id)startOfMonthForDate:(id)a3;
+ (id)startOfWeekForDate:(id)a3;
+ (id)timeZoneFromLocation:(id)a3;
+ (id)universalDateFromLocalDate:(id)a3;
+ (id)universalDateFromLocalDate:(id)a3 atLocation:(id)a4;
+ (id)universalDateFromLocalDate:(id)a3 inTimeZone:(id)a4;
+ (id)validDateForDate:(id)a3;
+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularities:(unint64_t)a5;
+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5;
+ (int64_t)dayFromDate:(id)a3;
+ (int64_t)dayOfWeekFromDate:(id)a3;
+ (int64_t)hourFromDate:(id)a3;
+ (int64_t)monthFromDate:(id)a3;
+ (int64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4;
+ (int64_t)weekOfMonthFromDate:(id)a3;
+ (int64_t)weekOfYearFromDate:(id)a3;
+ (int64_t)yearForWeekOfYearFromDate:(id)a3;
+ (int64_t)yearFromDate:(id)a3;
+ (void)initialize;
@end

@implementation CLSCalendar

+ (id)localStartSeasonDateForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 monthFromDate:v4];
    uint64_t v6 = 3;
    uint64_t v7 = 9;
    if (v5 < 9) {
      uint64_t v7 = 6;
    }
    if (v5 >= 6) {
      uint64_t v6 = v7;
    }
    if (v5 - 12 >= 0xFFFFFFFFFFFFFFF7) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 12;
    }
    v9 = [(id)sCLSDateHelperCalendar dateBySettingUnit:8 value:v8 ofDate:v4 options:260];
    v10 = [a1 startOfMonthForDate:v9];
  }
  else
  {
    v10 = [a1 validDateForDate:v4];
  }

  return v10;
}

+ (BOOL)supportsSeasonsWithLocale:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 countryCode];
  if ([a1 isCountryCodePartOfNorthernHemisphere:v5])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [v4 countryCode];
    char v6 = [a1 isCountryCodePartOfSouthernHemisphere:v7];
  }
  return v6;
}

+ (BOOL)currentLocaleSupportsSeasons
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  LOBYTE(a1) = [a1 supportsSeasonsWithLocale:v3];

  return (char)a1;
}

+ (id)localStartDateForNextSeasonAfterLocalDate:(id)a3
{
  id v4 = [a1 dateByAddingMonths:3 toDate:a3];
  unint64_t v5 = [a1 localStartSeasonDateForLocalDate:v4];

  return v5;
}

+ (BOOL)isLastMonthOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 monthFromDate:v4];
    if (v5 <= 0xB) {
      unsigned int v6 = (0x8A4u >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isMiddleMonthOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 monthFromDate:v4];
    if (v5 <= 0xA) {
      unsigned int v6 = (0x492u >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 localStartSeasonDateForLocalDate:v4];
    unsigned int v6 = [a1 dateByAddingDays:11 toDate:v5];
    uint64_t v7 = [v6 dateByAddingTimeInterval:-0.01];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)isFirstTenDaysOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:v4];
  unsigned int v6 = v5;
  if (v5) {
    char v7 = [v5 containsDate:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isFirstMonthOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 monthFromDate:v4];
    if (v5 <= 0xC) {
      unsigned int v6 = (0x1248u >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isSecondHalfOfSeasonForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    unint64_t v5 = [a1 componentsFromDate:v4 inTimeZone:0];
    uint64_t v6 = [v5 month];
    uint64_t v7 = [v5 day];
    BOOL v9 = v6 == 4 && v7 > 14;
    BOOL v11 = v6 == 7 && v7 > 14;
    BOOL v13 = v6 == 10 && v7 > 14;
    BOOL v16 = v6 == 1 && v7 > 14 || v6 == 2;
    char v17 = v13 || v16;
    if (v6 == 11) {
      char v17 = 1;
    }
    if (v11) {
      char v18 = 1;
    }
    else {
      char v18 = v17;
    }
    if (v6 == 8) {
      char v18 = 1;
    }
    if (v9) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if (v6 == 5) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v19;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (id)seasonNameForLocalDate:(id)a3 locale:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 componentsFromDate:a3 inTimeZone:0];
  uint64_t v8 = [a1 seasonNameForDateComponents:v7 locale:v6];

  return v8;
}

+ (id)seasonNameForDateComponents:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  uint64_t v8 = [v7 countryCode];
  int v9 = [a1 isCountryCodePartOfNorthernHemisphere:v8];

  if (v9)
  {
    uint64_t v10 = [a1 northernMeteorologicalSeasonNameForDateComponents:v6];
LABEL_7:
    BOOL v13 = (void *)v10;
    goto LABEL_9;
  }
  BOOL v11 = [v7 countryCode];
  int v12 = [a1 isCountryCodePartOfSouthernHemisphere:v11];

  if (v12)
  {
    uint64_t v10 = [a1 southernMeteorologicalSeasonNameForDateComponents:v6];
    goto LABEL_7;
  }
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a1, "s_seasonCountryCodesDictionary");
  id v6 = [v5 objectForKeyedSubscript:@"southernHemisphereCountryCodes"];
  char v7 = [v6 containsObject:v4];

  return v7;
}

+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a1, "s_seasonCountryCodesDictionary");
  id v6 = [v5 objectForKeyedSubscript:@"northernHemisphereCountryCodes"];
  char v7 = [v6 containsObject:v4];

  return v7;
}

+ (id)s_seasonCountryCodesDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CLSCalendar_s_seasonCountryCodesDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (s_seasonCountryCodesDictionary_onceToken != -1) {
    dispatch_once(&s_seasonCountryCodesDictionary_onceToken, block);
  }
  v2 = (void *)s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary;
  return v2;
}

void __45__CLSCalendar_s_seasonCountryCodesDictionary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"seasonsCountryCodes" withExtension:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  v2 = (void *)s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary;
  s_seasonCountryCodesDictionary_s_seasonCountryCodesDictionary = v1;
}

+ (id)southernMeteorologicalSeasonNameForDateComponents:(id)a3
{
  unint64_t v3 = [a3 month];
  id v4 = @"Autumn";
  unint64_t v5 = @"Spring";
  if (v3 < 9) {
    unint64_t v5 = @"Winter";
  }
  if (v3 >= 6) {
    id v4 = v5;
  }
  if (v3 - 12 >= 0xFFFFFFFFFFFFFFF7) {
    return v4;
  }
  else {
    return @"Summer";
  }
}

+ (id)northernMeteorologicalSeasonNameForDateComponents:(id)a3
{
  unint64_t v3 = [a3 month];
  id v4 = @"Spring";
  unint64_t v5 = @"Autumn";
  if (v3 < 9) {
    unint64_t v5 = @"Summer";
  }
  if (v3 >= 6) {
    id v4 = v5;
  }
  if (v3 - 12 >= 0xFFFFFFFFFFFFFFF7) {
    return v4;
  }
  else {
    return @"Winter";
  }
}

+ (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  int v12 = 0;
  if (v9 && v10)
  {
    id v13 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v13);
    int v12 = [(id)sCLSDateHelperCalendar components:a3 fromDate:v9 toDate:v11 options:a6];
    objc_sync_exit(v13);
  }
  return v12;
}

+ (id)components:(unint64_t)a3 fromDateComponents:(id)a4 toDateComponents:(id)a5 options:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  int v12 = 0;
  if (v9 && v10)
  {
    id v13 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v13);
    int v12 = [(id)sCLSDateHelperCalendar components:a3 fromDateComponents:v9 toDateComponents:v11 options:a6];
    objc_sync_exit(v13);
  }
  return v12;
}

+ (BOOL)isFirstTwoWeeksOfMonthForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    uint64_t v5 = [a1 rangeOfUnit:16 inUnit:8 forDate:v4];
    BOOL v6 = [a1 dayFromDate:v4] - 14 < v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isLastTwoWeeksOfMonthForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    [a1 rangeOfUnit:16 inUnit:8 forDate:v4];
    BOOL v6 = [a1 dayFromDate:v4] + 14 > v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isLastWeekOfMonthForLocalDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    [a1 rangeOfUnit:16 inUnit:8 forDate:v4];
    BOOL v6 = [a1 dayFromDate:v4] + 7 > v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  id v8 = a5;
  if ([a1 isDateValid:v8])
  {
    id v9 = (id)sCLSDateHelperCalendar;
    objc_sync_enter(v9);
    uint64_t v10 = [(id)sCLSDateHelperCalendar rangeOfUnit:a3 inUnit:a4 forDate:v8];
    NSUInteger v12 = v11;
    objc_sync_exit(v9);
  }
  else
  {
    NSUInteger v12 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v10;
  NSUInteger v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularity:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  int64_t v11 = 0;
  if (v8 && v9)
  {
    id v12 = a1;
    objc_sync_enter(v12);
    int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:a5];
    objc_sync_exit(v12);
  }
  return v11;
}

+ (int64_t)compareDate:(id)a3 toDate:(id)a4 toUnitGranularities:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  int64_t v11 = 0;
  if (v8 && v9)
  {
    id v12 = a1;
    objc_sync_enter(v12);
    if (((v5 & 4) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:4]) == 0)
      && ((v5 & 8) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:8]) == 0)
      && ((v5 & 0x10) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:16]) == 0)
      && ((v5 & 0x20) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:32]) == 0)
      && ((v5 & 0x40) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:64]) == 0)
      && ((v5 & 0x80) == 0
       || (int64_t v11 = [(id)sCLSDateHelperCalendar compareDate:v8 toDate:v10 toUnitGranularity:128]) == 0))
    {
      int64_t v11 = 0;
    }
    objc_sync_exit(v12);
  }
  return v11;
}

+ (int64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  id v4 = [(id)sCLSDateHelperCalendar components:16 fromDate:a3 toDate:a4 options:0];
  uint64_t v5 = [v4 day];
  if (v5 >= 0) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = -v5;
  }

  return v6;
}

+ (id)dateFromComponents:(unint64_t)a3 ofDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = a1;
    objc_sync_enter(v7);
    id v8 = [(id)sCLSDateHelperCalendar components:a3 fromDate:v6];
    id v9 = [(id)sCLSDateHelperCalendar dateFromComponents:v8];

    objc_sync_exit(v7);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)dateByAddingWeeksOfYear:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setWeekOfYear:a3];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateByAddingComponents:v7 toDate:v6 options:0];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)dateByAddingYears:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setYear:a3];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateByAddingComponents:v7 toDate:v6 options:0];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)dateByAddingMonths:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setMonth:a3];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateByAddingComponents:v7 toDate:v6 options:0];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)dateByAddingDays:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setDay:a3];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateByAddingComponents:v7 toDate:v6 options:0];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)dateByAddingHours:(int64_t)a3 toDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setHour:a3];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateByAddingComponents:v7 toDate:v6 options:0];
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (int64_t)hourFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:32 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)dayOfWeekFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    uint64_t v6 = [(id)sCLSDateHelperCalendar component:512 fromDate:v4];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = v6;
    }
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

+ (int64_t)dayFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:16 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)weekOfMonthFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:4096 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)weekOfYearFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:0x2000 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)monthFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:8 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)yearForWeekOfYearFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:0x4000 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (int64_t)yearFromDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    int64_t v6 = [(id)sCLSDateHelperCalendar component:4 fromDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

+ (id)components:(unint64_t)a3 fromDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = a1;
    objc_sync_enter(v7);
    id v8 = [(id)sCLSDateHelperCalendar components:a3 fromDate:v6];
    objc_sync_exit(v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)endOfMonthForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    uint64_t v5 = [a1 startOfMonthForDate:v4];

    id v6 = [a1 dateByAddingMonths:1 toDate:v5];
    id v7 = [v6 dateByAddingTimeInterval:-0.01];

    id v4 = (id)v5;
  }
  else
  {
    id v7 = [a1 validDateForDate:v4];
  }

  return v7;
}

+ (id)startOfMonthForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    id v6 = [(id)sCLSDateHelperCalendar components:14 fromDate:v4];
    id v7 = [(id)sCLSDateHelperCalendar dateFromComponents:v6];

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = [a1 validDateForDate:v4];
  }

  return v7;
}

+ (id)endOfWeekForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    uint64_t v5 = [a1 startOfWeekForDate:v4];

    id v6 = [a1 dateByAddingWeeksOfYear:1 toDate:v5];
    id v7 = [v6 dateByAddingTimeInterval:-0.01];

    id v4 = (id)v5;
  }
  else
  {
    id v7 = [a1 validDateForDate:v4];
  }

  return v7;
}

+ (id)startOfWeekForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    id v6 = [(id)sCLSDateHelperCalendar components:24576 fromDate:v4];
    id v7 = [(id)sCLSDateHelperCalendar dateFromComponents:v6];

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = [a1 validDateForDate:v4];
  }

  return v7;
}

+ (id)endOfDayForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    uint64_t v5 = [a1 startOfDayForDate:v4];

    id v6 = [a1 dateByAddingDays:1 toDate:v5];
    id v7 = [v6 dateByAddingTimeInterval:-0.01];

    id v4 = (id)v5;
  }
  else
  {
    id v7 = [a1 validDateForDate:v4];
  }

  return v7;
}

+ (id)startOfDayForDate:(id)a3
{
  id v4 = a3;
  if ([a1 isDateValid:v4])
  {
    id v5 = a1;
    objc_sync_enter(v5);
    id v6 = [(id)sCLSDateHelperCalendar startOfDayForDate:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = [a1 validDateForDate:v4];
  }

  return v6;
}

+ (id)timeZoneFromLocation:(id)a3
{
  return (id)[a3 timeZone];
}

+ (id)localDateFormatterWithFormat:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:v4];

  id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v6];

  return v5;
}

+ (id)dateBySettingYear:(int64_t)a3 ofDate:(id)a4
{
  id v6 = a4;
  if ([a1 isDateValid:v6])
  {
    id v7 = a1;
    objc_sync_enter(v7);
    id v8 = [v7 components:-24577 fromDate:v6];
    [v8 setYear:a3];
    id v9 = [v7 dateFromComponents:v8 inTimeZone:0];

    objc_sync_exit(v7);
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)localDateFromUniversalDate:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDateValid:v6])
  {
    if (v7)
    {
      id v8 = [v7 timeZone];
    }
    else
    {
      id v8 = (id)sCLSDateHelperGMTTimeZone_5335;
    }
    uint64_t v10 = v8;
    id v9 = [a1 localDateFromUniversalDate:v6 inTimeZone:v8];
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)universalDateFromLocalDate:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDateValid:v6])
  {
    if (v7)
    {
      id v8 = [v7 timeZone];
    }
    else
    {
      id v8 = (id)sCLSDateHelperGMTTimeZone_5335;
    }
    uint64_t v10 = v8;
    id v9 = [a1 universalDateFromLocalDate:v6 inTimeZone:v8];
  }
  else
  {
    id v9 = [a1 validDateForDate:v6];
  }

  return v9;
}

+ (id)localDateFromUniversalDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  id v6 = [v4 localTimeZone];
  id v7 = [a1 localDateFromUniversalDate:v5 inTimeZone:v6];

  return v7;
}

+ (id)localDateFromUniversalDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDateValid:v6])
  {
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = (void *)sCLSDateHelperGMTTimeZone_5335;
    if (v7) {
      id v9 = v7;
    }
    id v10 = v9;
    if (v10)
    {
      int64_t v11 = [(id)sCLSDateHelperCalendar componentsInTimeZone:v10 fromDate:v6];
      [v11 setTimeZone:sCLSDateHelperGMTTimeZone_5335];
      id v12 = [(id)sCLSDateHelperCalendar dateFromComponents:v11];
    }
    else
    {
      id v12 = 0;
    }

    objc_sync_exit(v8);
  }
  else
  {
    id v12 = [a1 validDateForDate:v6];
  }

  return v12;
}

+ (id)universalDateFromLocalDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  id v6 = [v4 localTimeZone];
  id v7 = [a1 universalDateFromLocalDate:v5 inTimeZone:v6];

  return v7;
}

+ (id)universalDateFromLocalDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDateValid:v6])
  {
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar componentsInTimeZone:sCLSDateHelperGMTTimeZone_5335 fromDate:v6];
    id v10 = v9;
    if (v7) {
      uint64_t v11 = (uint64_t)v7;
    }
    else {
      uint64_t v11 = sCLSDateHelperGMTTimeZone_5335;
    }
    [v9 setTimeZone:v11];
    id v12 = [(id)sCLSDateHelperCalendar dateFromComponents:v10];

    objc_sync_exit(v8);
  }
  else
  {
    id v12 = [a1 validDateForDate:v6];
  }

  return v12;
}

+ (id)componentsFromDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a4;
  id v7 = [a1 validDateForDate:a3];
  id v8 = a1;
  objc_sync_enter(v8);
  if (!v6) {
    id v6 = (id)sCLSDateHelperGMTTimeZone_5335;
  }
  id v9 = [(id)sCLSDateHelperCalendar componentsInTimeZone:v6 fromDate:v7];
  objc_sync_exit(v8);

  return v9;
}

+ (id)dateFromComponents:(id)a3 inTimeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sCLSDateHelperCalendar dateFromComponents:v6];
    objc_sync_exit(v8);

    if (v7)
    {
      uint64_t v10 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)objc_msgSend(v7, "secondsFromGMTForDate:", v9));

      id v9 = (void *)v10;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)dateComponentsWithLocalDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 validDateForDate:v4];

    id v6 = a1;
    objc_sync_enter(v6);
    id v4 = [(id)sCLSDateHelperCalendar componentsInTimeZone:sCLSDateHelperGMTTimeZone_5335 fromDate:v5];
    objc_sync_exit(v6);
  }
  return v4;
}

+ (id)dateComponentsWithUTCDate:(id)a3 localDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isDateValid:v6] && objc_msgSend(a1, "isDateValid:", v7))
  {
    [v7 timeIntervalSinceDate:v6];
    id v9 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)v8];
    id v10 = a1;
    objc_sync_enter(v10);
    uint64_t v11 = [(id)sCLSDateHelperCalendar componentsInTimeZone:v9 fromDate:v6];
    objc_sync_exit(v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)currentLocalDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  unint64_t v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v3, "secondsFromGMTForDate:", v4));

  return v5;
}

+ (id)validDateForDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    double v8 = 0;
    goto LABEL_8;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v5 = [v3 compare:v4];

  if (v5 == -1)
  {
    double v8 = [MEMORY[0x1E4F1C9C8] distantPast];

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  id v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v7 = [v6 compare:v3];

  double v8 = v3;
  if (v7 == -1)
  {
    double v8 = [MEMORY[0x1E4F1C9C8] distantFuture];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      NSUInteger v13 = v8;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid date found: %@, using %@ instead.", (uint8_t *)&v10, 0x16u);
    }
  }
LABEL_8:

  return v8;
}

+ (BOOL)isDateValid:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    if ([v3 compare:v4] == -1)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
      BOOL v6 = [v5 compare:v3] == -1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return !v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&OBJC_METACLASS___CLSCalendar;
    objc_msgSendSuper2(&v3, sel_initialize);
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, &__block_literal_global_5342);
    }
  }
}

uint64_t __25__CLSCalendar_initialize__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  uint64_t v1 = (void *)sCLSDateHelperGMTTimeZone_5335;
  sCLSDateHelperGMTTimeZone_5335 = v0;

  uint64_t v2 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  objc_super v3 = (void *)sCLSDateHelperCalendar;
  sCLSDateHelperCalendar = v2;

  uint64_t v4 = sCLSDateHelperGMTTimeZone_5335;
  uint64_t v5 = (void *)sCLSDateHelperCalendar;
  return [v5 setTimeZone:v4];
}

@end