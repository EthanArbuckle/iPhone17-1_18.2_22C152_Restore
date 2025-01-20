@interface NSDate(CalClassAdditions)
+ (id)CalDateForBeginningOfToday;
+ (id)CalDateForBeginningOfTomorrow;
+ (id)CalDateForEndOfToday;
+ (id)CalDateForEndOfTomorrow;
+ (id)CalDateRangeStringWithStart:()CalClassAdditions end:;
+ (id)CalSimulatedDateForNow;
+ (id)_nowComponents;
+ (id)_todayComponents;
+ (id)_tomorrowComponents;
+ (id)calGMT;
+ (id)dateFromISO8601String:()CalClassAdditions;
+ (id)dateFromISO8601String:()CalClassAdditions inTimeZone:;
+ (id)dateWithDatePartFromDate:()CalClassAdditions timePartFromDate:inCalendar:;
+ (id)nextRoundedChunkForDuration:()CalClassAdditions;
+ (id)nextRoundedHour;
+ (uint64_t)CalDateForNow;
- (BOOL)CalIsAfterDate:()CalClassAdditions;
- (BOOL)CalIsAfterOrSameAsDate:()CalClassAdditions;
- (BOOL)CalIsBeforeDate:()CalClassAdditions;
- (BOOL)CalIsBeforeOrSameAsDate:()CalClassAdditions;
- (BOOL)CalIsBetweenStartDate:()CalClassAdditions endDate:;
- (BOOL)isAfterDate:()CalClassAdditions;
- (BOOL)isAfterDayForDate:()CalClassAdditions inCalendar:;
- (BOOL)isAfterOrSameDayAsDate:()CalClassAdditions inCalendar:;
- (BOOL)isBeforeDate:()CalClassAdditions;
- (BOOL)isBeforeDayForDate:()CalClassAdditions inCalendar:;
- (BOOL)isBeforeOrSameDayAsDate:()CalClassAdditions inCalendar:;
- (id)CalDateByComponentwiseAddingComponents:()CalClassAdditions inCalendar:;
- (id)CalDateByComponentwiseAddingHours:()CalClassAdditions inCalendar:;
- (id)CalDateByComponentwiseAddingMinutes:()CalClassAdditions inCalendar:;
- (id)CalDateByComponentwiseAddingSeconds:()CalClassAdditions inCalendar:;
- (id)CalDateRoundedDownToNearestMinuteIncrement:()CalClassAdditions inCalendar:;
- (id)_stringWithUseAbbreviatedFormats:()CalClassAdditions lowerCase:;
- (id)allComponentsInCalendar:()CalClassAdditions;
- (id)components:()CalClassAdditions forDayInTimeZone:;
- (id)dateByAddingCalSimulatedOffset;
- (id)dateByAddingDays:()CalClassAdditions inCalendar:;
- (id)dateByAddingHours:()CalClassAdditions inCalendar:;
- (id)dateByAddingMinutes:()CalClassAdditions inCalendar:;
- (id)dateByAddingMonths:()CalClassAdditions inCalendar:;
- (id)dateByAddingWeeks:()CalClassAdditions inCalendar:;
- (id)dateByAddingYears:()CalClassAdditions inCalendar:;
- (id)dateBySubtractingCalSimulatedOffset;
- (id)dateForDayInTimeZone:()CalClassAdditions;
- (id)dateInTimeZone:()CalClassAdditions fromTimeZone:;
- (id)dateOnlyByTranslatingFrom:()CalClassAdditions toCalendar:;
- (id)dateOnlyComponentsInCalendar:()CalClassAdditions;
- (id)dateRemovingComponents:()CalClassAdditions inCalendar:;
- (id)dateRemovingTimeComponentsInCalendar:()CalClassAdditions;
- (id)dateRoundedToHourOnSameDayInCalendar:()CalClassAdditions;
- (id)dateRoundedToNearestFifteenMinutesInCalendar:()CalClassAdditions;
- (id)dateRoundedToStartOfNextDayInCalendar:()CalClassAdditions;
- (id)ek_ios_dateForEndOfDayInTimeZone:()CalClassAdditions;
- (id)localizedAbbrevDate;
- (id)localizedAbbrevMonthWithDay;
- (id)localizedAbbrevMonthWithDayRangeToDate:()CalClassAdditions;
- (id)localizedAbbrevStandaloneMonth;
- (id)localizedAbbrevWeekdayWithDayOfMonthPreferWeekdayFirstForEnglish;
- (id)localizedDateStringWithTemplate:()CalClassAdditions;
- (id)localizedHour;
- (id)localizedHourMinutesWithoutAMPM;
- (id)localizedMonthWithDayWithPreferredShortening;
- (id)localizedShortTime;
- (id)localizedStringForEventTime;
- (id)localizedStringForEventTimeInTimeZone:()CalClassAdditions;
- (id)localizedWeekNumber;
- (id)roundSecondsAndMinutesDownInCalendar:()CalClassAdditions;
- (id)roundSecondsAndMinutesUpInCalendar:()CalClassAdditions;
- (id)roundSecondsDownInCalendar:()CalClassAdditions;
- (id)roundToCurrentMondayInCalendar:()CalClassAdditions;
- (id)roundToCurrentMonthInCalendar:()CalClassAdditions;
- (id)roundToCurrentWeekInCalendar:()CalClassAdditions withFirstWeekdayIndex:;
- (id)roundToCurrentYearInCalendar:()CalClassAdditions;
- (id)roundUpOneSecondIfAt59InCalendar:()CalClassAdditions;
- (id)subtractOneSecondIfAt0InCalendar:()CalClassAdditions;
- (id)timeOnlyComponentsInCalendar:()CalClassAdditions;
- (id)timeStringAlwaysIncludeMinutes:()CalClassAdditions;
- (id)toISO8601String;
- (uint64_t)compareDateIgnoringTimeComponents:()CalClassAdditions inCalendar:;
- (uint64_t)dateRoundedDownToNearestFiveMinutesInCalendar:()CalClassAdditions;
- (uint64_t)dayInCalendar:()CalClassAdditions;
- (uint64_t)hourInCalendar:()CalClassAdditions;
- (uint64_t)isEqualToDateIgnoringTimeComponents:()CalClassAdditions inCalendar:;
- (uint64_t)isSameMonthAsDate:()CalClassAdditions inCalendar:;
- (uint64_t)isSameWeekAsDate:()CalClassAdditions inCalendar:;
- (uint64_t)isSameYearAsDate:()CalClassAdditions inCalendar:;
- (uint64_t)isTodayInCalendar:()CalClassAdditions;
- (uint64_t)localizedAbbrevDateInTimeZone:()CalClassAdditions;
- (uint64_t)localizedAbbrevMonthWeekdayDay;
- (uint64_t)localizedAbbrevMonthWithDayInTimeZone:()CalClassAdditions;
- (uint64_t)localizedAbbrevWeekdayWithDayOfMonth;
- (uint64_t)localizedDayOfMonth;
- (uint64_t)localizedDayOfWeekWithAbbrevDateInTimeZone:()CalClassAdditions;
- (uint64_t)localizedFullDate;
- (uint64_t)localizedFullDateAndTime;
- (uint64_t)localizedFullMonth;
- (uint64_t)localizedFullMonthWeekdayDay;
- (uint64_t)localizedFullMonthWithDay;
- (uint64_t)localizedFullStandaloneWeekday;
- (uint64_t)localizedFullWeekdayWithDayOfMonth;
- (uint64_t)localizedFullYearMonth;
- (uint64_t)localizedHourInTimeZone:()CalClassAdditions;
- (uint64_t)localizedHourMinutesWithoutAMPMInTimeZone:()CalClassAdditions;
- (uint64_t)localizedHourWithoutAMPM;
- (uint64_t)localizedLongDate;
- (uint64_t)localizedMonthAndDayStringShortened:()CalClassAdditions;
- (uint64_t)localizedMonthAndYearStringShortened:()CalClassAdditions;
- (uint64_t)localizedMonthShortened:()CalClassAdditions;
- (uint64_t)localizedRelativeDateStringShortened:()CalClassAdditions;
- (uint64_t)localizedShortDate;
- (uint64_t)localizedShortDateAndTime;
- (uint64_t)localizedShortMonthWithDay;
- (uint64_t)localizedShortStandaloneWeekday;
- (uint64_t)localizedShortTimeInTimeZone:()CalClassAdditions;
- (uint64_t)localizedTime;
- (uint64_t)localizedWeekdayMonthDayStringShortened:()CalClassAdditions;
- (uint64_t)localizedWeekdayMonthDayYearStringShortened:()CalClassAdditions;
- (uint64_t)localizedWeekdayMonthYearStringShortened:()CalClassAdditions;
- (uint64_t)localizedYear;
- (uint64_t)localizedYearMonthAndDayStringShortened:()CalClassAdditions;
- (uint64_t)midnightOffsetMinutes:()CalClassAdditions;
- (uint64_t)minuteInCalendar:()CalClassAdditions;
- (uint64_t)monthInCalendar:()CalClassAdditions;
- (uint64_t)rangeOfDayInLocalizedDateString:()CalClassAdditions;
- (uint64_t)secondInCalendar:()CalClassAdditions;
- (uint64_t)weekInCalendar:()CalClassAdditions;
- (uint64_t)weekdayInCalendar:()CalClassAdditions;
- (uint64_t)yearInCalendar:()CalClassAdditions;
- (void)printComparisonToDate:()CalClassAdditions;
@end

@implementation NSDate(CalClassAdditions)

- (BOOL)CalIsBeforeOrSameAsDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)CalIsAfterOrSameAsDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)CalIsBeforeDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)CalIsAfterDate:()CalClassAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

+ (id)CalDateForBeginningOfToday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [a1 _todayComponents];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

+ (id)_todayComponents
{
  v1 = [a1 _nowComponents];
  [v1 setHour:0];
  [v1 setMinute:0];
  [v1 setSecond:0];

  return v1;
}

+ (id)_nowComponents
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [a1 CalDateForNow];
  v4 = [v2 components:33022 fromDate:v3];

  return v4;
}

+ (uint64_t)CalDateForNow
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (id)timeStringAlwaysIncludeMinutes:()CalClassAdditions
{
  v5 = [MEMORY[0x1E4F28C10] CalSharedDateFormatter];
  [v5 setDateStyle:0];
  [v5 setTimeStyle:1];
  if ((a3 & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
    v7 = [v6 components:96 fromDate:a1];

    if (![v7 minute])
    {
      v8 = [v5 stringFromDate:a1];
      v9 = [v5 AMSymbol];
      uint64_t v10 = [v8 rangeOfString:v9];

      v11 = [v5 PMSymbol];
      uint64_t v12 = [v8 rangeOfString:v11];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL || v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (void *)MEMORY[0x1E4F28C10];
        v14 = [MEMORY[0x1E4F1CA20] currentLocale];
        v15 = [v13 dateFormatFromTemplate:@"h a" options:0 locale:v14];
        [v5 setDateFormat:v15];
      }
    }
  }
  v16 = [v5 stringFromDate:a1];

  return v16;
}

- (BOOL)CalIsBetweenStartDate:()CalClassAdditions endDate:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 compare:a1] == -1 || !objc_msgSend(a1, "compare:", v6)) {
    BOOL v8 = [a1 compare:v7] == -1 || objc_msgSend(a1, "compare:", v7) == 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)calGMT
{
  if (calGMT_onceToken != -1) {
    dispatch_once(&calGMT_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)calGMT_gmt;

  return v0;
}

- (id)dateInTimeZone:()CalClassAdditions fromTimeZone:
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x192FD85E0]();
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] calGMT];
    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = [MEMORY[0x1E4F1C9C8] calGMT];
LABEL_3:
  v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v9 setTimeZone:v7];
  uint64_t v10 = [v9 components:33022 fromDate:a1];
  [v9 setTimeZone:v6];
  [v10 setCalendar:v9];
  v11 = [v10 date];

  return v11;
}

- (id)components:()CalClassAdditions forDayInTimeZone:
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] calGMT];
  }
  id v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v7 setTimeZone:v6];
  BOOL v8 = [v7 components:a3 fromDate:a1];
  [v8 setCalendar:v7];

  return v8;
}

- (id)dateForDayInTimeZone:()CalClassAdditions
{
  v3 = [a1 components:30 forDayInTimeZone:a3];
  v4 = [v3 date];

  return v4;
}

- (id)ek_ios_dateForEndOfDayInTimeZone:()CalClassAdditions
{
  v3 = [a1 components:30 forDayInTimeZone:a3];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  v4 = [v3 date];

  return v4;
}

+ (id)CalSimulatedDateForNow
{
  v0 = +[CalFoundationPreferences shared];
  int v1 = [v0 stopTimeDemoModeActive];

  if (v1)
  {
    v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v3 = +[CalFoundationPreferences shared];
    v4 = [v3 stopTimeDemoModeComponents];
    v5 = [v2 dateFromComponents:v4];
  }
  else
  {
    v2 = objc_opt_new();
    v5 = [v2 dateByAddingCalSimulatedOffset];
  }

  return v5;
}

- (id)dateByAddingCalSimulatedOffset
{
  v2 = +[CalFoundationPreferences shared];
  [v2 simulatedDateForNowOffset];
  v3 = objc_msgSend(a1, "dateByAddingTimeInterval:");

  return v3;
}

- (id)dateBySubtractingCalSimulatedOffset
{
  v2 = +[CalFoundationPreferences shared];
  [v2 simulatedDateForNowOffset];
  v4 = [a1 dateByAddingTimeInterval:-v3];

  return v4;
}

+ (id)CalDateForEndOfToday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v3 = [a1 _todayComponents];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

+ (id)_tomorrowComponents
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setDay:1];
  v4 = [a1 CalDateForBeginningOfToday];
  v5 = [v2 dateByAddingComponents:v3 toDate:v4 options:0];

  id v6 = [v2 components:30 fromDate:v5];

  return v6;
}

+ (id)CalDateForBeginningOfTomorrow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [a1 _tomorrowComponents];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

+ (id)CalDateForEndOfTomorrow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [a1 _tomorrowComponents];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  v4 = [v2 dateFromComponents:v3];

  return v4;
}

+ (id)dateFromISO8601String:()CalClassAdditions
{
  id v3 = (void *)MEMORY[0x1E4F1CAF0];
  id v4 = a3;
  v5 = [v3 timeZoneForSecondsFromGMT:0];
  id v6 = [MEMORY[0x1E4F1C9C8] dateFromISO8601String:v4 inTimeZone:v5];

  return v6;
}

+ (id)dateFromISO8601String:()CalClassAdditions inTimeZone:
{
  v5 = (objc_class *)MEMORY[0x1E4F28C10];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v8 setLocale:v9];

  [v8 setTimeZone:v6];
  uint64_t v10 = [v8 dateFromString:v7];

  return v10;
}

- (id)toISO8601String
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v4];

  v5 = [v2 stringFromDate:a1];

  return v5;
}

- (id)allComponentsInCalendar:()CalClassAdditions
{
  if (a3)
  {
    id v4 = [a3 components:-1 fromDate:a1];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v4 = [v5 components:-1 fromDate:a1];
  }

  return v4;
}

- (id)dateOnlyComponentsInCalendar:()CalClassAdditions
{
  if (a3)
  {
    id v4 = [a3 components:542 fromDate:a1];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v4 = [v5 components:542 fromDate:a1];
  }

  return v4;
}

- (id)timeOnlyComponentsInCalendar:()CalClassAdditions
{
  if (a3)
  {
    id v4 = [a3 components:32992 fromDate:a1];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v4 = [v5 components:32992 fromDate:a1];
  }

  return v4;
}

- (id)dateOnlyByTranslatingFrom:()CalClassAdditions toCalendar:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 calendarIdentifier];
  v9 = [v7 calendarIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11 = [a1 dateOnlyComponentsInCalendar:v6];
    uint64_t v12 = [v7 dateFromComponents:v11];
  }
  else
  {
    uint64_t v12 = [a1 dateRemovingTimeComponentsInCalendar:v7];
  }

  return v12;
}

- (uint64_t)yearInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:4 fromDate:a1];
  uint64_t v7 = [v6 year];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)monthInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:8 fromDate:a1];
  uint64_t v7 = [v6 month];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)weekInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:0x2000 fromDate:a1];
  uint64_t v7 = [v6 weekOfYear];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)dayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:16 fromDate:a1];
  uint64_t v7 = [v6 day];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)weekdayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:512 fromDate:a1];
  uint64_t v7 = [v6 weekday];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)hourInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:32 fromDate:a1];
  uint64_t v7 = [v6 hour];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)minuteInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:64 fromDate:a1];
  uint64_t v7 = [v6 minute];

  if (!v4) {
  return v7;
  }
}

- (uint64_t)secondInCalendar:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v6 = [v5 components:128 fromDate:a1];
  uint64_t v7 = [v6 second];

  if (!v4) {
  return v7;
  }
}

- (id)dateRemovingTimeComponentsInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 dateOnlyComponentsInCalendar:v4];
  id v6 = [v4 dateFromComponents:v5];

  return v6;
}

- (id)dateByAddingMinutes:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:64 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:64 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)dateByAddingHours:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:32 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:32 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)dateByAddingDays:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:16 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:16 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)dateByAddingWeeks:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:0x2000 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:0x2000 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)dateByAddingMonths:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:8 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:8 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)dateByAddingYears:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!a3)
  {
    id v8 = a1;
    goto LABEL_5;
  }
  if (v6)
  {
    id v8 = [v6 dateByAddingUnit:4 value:a3 toDate:a1 options:0];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v10 dateByAddingUnit:4 value:a3 toDate:a1 options:0];

LABEL_7:

  return v9;
}

- (id)CalDateByComponentwiseAddingSeconds:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setSecond:a3];
  if (v6)
  {
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v6];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v9];
  }

  return v8;
}

- (id)CalDateByComponentwiseAddingMinutes:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1C9D8] CalComponentForMinutes:a3];
  if (v6)
  {
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v6];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v9];
  }

  return v8;
}

- (id)CalDateByComponentwiseAddingHours:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1C9D8] CalComponentForHours:a3];
  if (v6)
  {
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v6];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
    id v8 = [a1 CalDateByComponentwiseAddingComponents:v7 inCalendar:v9];
  }

  return v8;
}

- (id)CalDateByComponentwiseAddingComponents:()CalClassAdditions inCalendar:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 components:33022 fromDate:a1];
  if ([v6 era] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setEra:", objc_msgSend(v8, "era") + objc_msgSend(v6, "era"));
  }
  if ([v6 year] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setYear:", objc_msgSend(v8, "year") + objc_msgSend(v6, "year"));
  }
  if ([v6 month] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setMonth:", objc_msgSend(v8, "month") + objc_msgSend(v6, "month"));
  }
  if ([v6 day] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setDay:", objc_msgSend(v8, "day") + objc_msgSend(v6, "day"));
  }
  if ([v6 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setHour:", objc_msgSend(v8, "hour") + objc_msgSend(v6, "hour"));
  }
  if ([v6 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") + objc_msgSend(v6, "minute"));
  }
  if ([v6 second] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setSecond:", objc_msgSend(v8, "second") + objc_msgSend(v6, "second"));
  }
  if ([v6 nanosecond] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v8, "setNanosecond:", objc_msgSend(v8, "nanosecond") + objc_msgSend(v6, "nanosecond"));
  }
  if (v7)
  {
    v9 = [v7 dateFromComponents:v8];
  }
  else
  {
    int v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v9 = [v10 dateFromComponents:v8];
  }
  v11 = [v7 dateByAddingComponents:v6 toDate:a1 options:0];
  if ([v11 CalIsBeforeDate:a1])
  {
    uint64_t v12 = [v7 timeZone];
    v13 = [v12 nextDaylightSavingTimeTransitionAfterDate:v11];

    if ([v13 CalIsBeforeOrSameAsDate:a1]
      && [v13 CalIsAfterDate:v11])
    {
      v14 = [v7 components:33022 fromDate:v9];
      uint64_t v15 = [v14 hour];
      uint64_t v16 = v15 - [v8 hour];
      uint64_t v17 = [v14 minute];
      uint64_t v18 = v17 - [v8 minute];
      uint64_t v19 = [v14 second];
      uint64_t v20 = (uint64_t)((float)((float)v16 * 3600.0) + (double)v18 * 60.0 + (double)(v19 - [v8 second]));
      if (v20 >= 1)
      {
        uint64_t v21 = [v9 dateByAddingTimeInterval:(double)-v20];

        v9 = (void *)v21;
      }
    }
  }

  return v9;
}

- (id)roundSecondsDownInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 allComponentsInCalendar:v4];
  [v5 setSecond:0];
  id v6 = [v4 dateFromComponents:v5];

  return v6;
}

- (id)roundSecondsAndMinutesDownInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 allComponentsInCalendar:v4];
  [v5 setSecond:0];
  [v5 setMinute:0];
  id v6 = [v4 dateFromComponents:v5];

  return v6;
}

- (id)roundSecondsAndMinutesUpInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 allComponentsInCalendar:v4];
  if ([v5 minute] >= 1) {
    objc_msgSend(v5, "setHour:", objc_msgSend(v5, "hour") + 1);
  }
  [v5 setSecond:0];
  [v5 setMinute:0];
  id v6 = [v4 dateFromComponents:v5];

  return v6;
}

- (id)roundUpOneSecondIfAt59InCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 timeOnlyComponentsInCalendar:v4];
  if ([v5 hour] == 23 && objc_msgSend(v5, "minute") == 59 && objc_msgSend(v5, "second") == 59)
  {
    id v6 = [v4 dateByAddingUnit:128 value:1 toDate:a1 options:0];
  }
  else
  {
    id v6 = a1;
  }
  id v7 = v6;

  return v7;
}

- (id)subtractOneSecondIfAt0InCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  v5 = [a1 timeOnlyComponentsInCalendar:v4];
  if ([v5 hour] || objc_msgSend(v5, "minute") || objc_msgSend(v5, "second"))
  {
    id v6 = a1;
  }
  else
  {
    id v6 = [v4 dateByAddingUnit:128 value:-1 toDate:a1 options:0];
  }
  id v7 = v6;

  return v7;
}

- (id)roundToCurrentWeekInCalendar:()CalClassAdditions withFirstWeekdayIndex:
{
  id v6 = a3;
  uint64_t v7 = [a1 weekdayInCalendar:v6];
  if (a4 <= v7) {
    uint64_t v8 = a4 - v7;
  }
  else {
    uint64_t v8 = a4 - v7 - 7;
  }
  v9 = [a1 dateByAddingDays:v8 inCalendar:v6];

  return v9;
}

- (id)roundToCurrentMondayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 ordinalityOfUnit:512 inUnit:0x2000 forDate:a1];
  uint64_t v6 = 2;
  if (v5 < 2) {
    uint64_t v6 = -5;
  }
  uint64_t v7 = [a1 dateByAddingDays:v6 - v5 inCalendar:v4];

  return v7;
}

- (id)roundToCurrentMonthInCalendar:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 dateOnlyComponentsInCalendar:v4];
  [v5 setDay:1];
  uint64_t v6 = [v4 dateFromComponents:v5];

  return v6;
}

- (id)roundToCurrentYearInCalendar:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 dateOnlyComponentsInCalendar:v4];
  [v5 setDay:1];
  [v5 setMonth:1];
  uint64_t v6 = [v4 dateFromComponents:v5];

  return v6;
}

+ (id)dateWithDatePartFromDate:()CalClassAdditions timePartFromDate:inCalendar:
{
  id v7 = a5;
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = a4;
    id v10 = a3;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1C9A8];
    id v12 = a4;
    id v13 = a3;
    uint64_t v8 = [v11 currentCalendar];
  }
  v14 = [a3 dateOnlyComponentsInCalendar:v8];

  uint64_t v15 = [a4 timeOnlyComponentsInCalendar:v8];

  objc_msgSend(v14, "setHour:", objc_msgSend(v15, "hour"));
  objc_msgSend(v14, "setMinute:", objc_msgSend(v15, "minute"));
  objc_msgSend(v14, "setSecond:", objc_msgSend(v15, "second"));
  uint64_t v16 = [v8 dateFromComponents:v14];

  return v16;
}

- (BOOL)isAfterDate:()CalClassAdditions
{
  return a3 && objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isBeforeDate:()CalClassAdditions
{
  return a3 && objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)compareDateIgnoringTimeComponents:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    id v8 = a3;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1C9A8];
    id v10 = a3;
    id v7 = [v9 currentCalendar];
  }
  v11 = [a1 dateRemovingTimeComponentsInCalendar:v7];
  id v12 = [a3 dateRemovingTimeComponentsInCalendar:v7];

  uint64_t v13 = [v11 compare:v12];
  return v13;
}

- (uint64_t)isSameMonthAsDate:()CalClassAdditions inCalendar:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    id v9 = [v8 components:14 fromDate:a1];
    id v10 = [v8 components:14 fromDate:v6];
    uint64_t v11 = [v9 CalIsSameMonthAsComponents:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)isSameWeekAsDate:()CalClassAdditions inCalendar:
{
  if (!a3) {
    return 0;
  }
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(a1, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v6, objc_msgSend(v6, "firstWeekday"));
  id v9 = objc_msgSend(v7, "roundToCurrentWeekInCalendar:withFirstWeekdayIndex:", v6, objc_msgSend(v6, "firstWeekday"));

  uint64_t v10 = [v8 isEqualToDate:v9];
  return v10;
}

- (uint64_t)isSameYearAsDate:()CalClassAdditions inCalendar:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    id v9 = [v8 components:6 fromDate:a1];
    uint64_t v10 = [v8 components:6 fromDate:v6];
    uint64_t v11 = [v9 CalIsSameYearAsComponents:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)isEqualToDateIgnoringTimeComponents:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    id v8 = a3;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1C9A8];
    id v10 = a3;
    id v7 = [v9 currentCalendar];
  }
  uint64_t v11 = [a1 dateOnlyComponentsInCalendar:v7];
  id v12 = [a3 dateOnlyComponentsInCalendar:v7];

  uint64_t v13 = [v11 CalIsSameDayAsComponents:v12];
  return v13;
}

- (BOOL)isBeforeDayForDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") == -1;
}

- (BOOL)isBeforeOrSameDayAsDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") != 1;
}

- (BOOL)isAfterDayForDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") == 1;
}

- (BOOL)isAfterOrSameDayAsDate:()CalClassAdditions inCalendar:
{
  return objc_msgSend(a1, "compareDateIgnoringTimeComponents:inCalendar:") != -1;
}

- (uint64_t)isTodayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v5 dateRemovingTimeComponentsInCalendar:v4];

  id v7 = [a1 dateRemovingTimeComponentsInCalendar:v4];
  uint64_t v8 = [v7 isEqualToDate:v6];

  return v8;
}

- (id)CalDateRoundedDownToNearestMinuteIncrement:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  id v7 = v6;
  if (a3 <= 0)
  {
    id v10 = (void *)[a1 copy];
  }
  else
  {
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    uint64_t v8 = [a1 allComponentsInCalendar:v7];
    id v9 = v8;
    if (a3 != 1) {
      objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a3 * a3);
    }
    [v9 setSecond:0];
    [v9 setNanosecond:0];
    id v10 = [v7 dateFromComponents:v9];
  }

  return v10;
}

- (id)dateRoundedToNearestFifteenMinutesInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  uint64_t v5 = [a1 minuteInCalendar:v4] % 15;
  uint64_t v6 = 15;
  if (v5 < 8) {
    uint64_t v6 = 0;
  }
  id v7 = [a1 dateByAddingMinutes:v6 - v5 inCalendar:v4];

  return v7;
}

- (uint64_t)dateRoundedDownToNearestFiveMinutesInCalendar:()CalClassAdditions
{
  return [a1 CalDateRoundedDownToNearestMinuteIncrement:5 inCalendar:a3];
}

- (id)dateRoundedToHourOnSameDayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  uint64_t v5 = [a1 hourInCalendar:v4];
  if (v5 != [v4 hoursInDay] - 1 && objc_msgSend(a1, "minuteInCalendar:", v4) > 29) {
    ++v5;
  }
  uint64_t v6 = [a1 allComponentsInCalendar:v4];
  [v6 setHour:v5];
  [v6 setMinute:0x7FFFFFFFFFFFFFFFLL];
  [v6 setSecond:0x7FFFFFFFFFFFFFFFLL];
  id v7 = [v4 dateFromComponents:v6];

  return v7;
}

- (id)dateRoundedToStartOfNextDayInCalendar:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 dateRemovingTimeComponentsInCalendar:v4];
  uint64_t v6 = [v5 dateByAddingDays:1 inCalendar:v4];

  return v6;
}

+ (id)nextRoundedHour
{
  v0 = [MEMORY[0x1E4F1C9C8] date];
  int v1 = [v0 dateByAddingMinutes:30 inCalendar:0];
  id v2 = [v1 dateRoundedToHourOnSameDayInCalendar:0];

  return v2;
}

+ (id)nextRoundedChunkForDuration:()CalClassAdditions
{
  id v2 = [MEMORY[0x1E4F1C9A8] sharedAutoupdatingCurrentCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  id v4 = [v2 components:124 fromDate:v3];

  if (a1 > 1800.0) {
    goto LABEL_12;
  }
  uint64_t v5 = [v4 minute];
  if (a1 > 900.0)
  {
    if (v5 > 30) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (v5 <= 15)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 15;
LABEL_9:
    [v6 setMinute:v7];
    uint64_t v8 = [v2 dateFromComponents:v4];
    goto LABEL_13;
  }
  if ((unint64_t)v5 <= 0x1E)
  {
LABEL_8:
    uint64_t v6 = v4;
    uint64_t v7 = 30;
    goto LABEL_9;
  }
  if ((unint64_t)v5 <= 0x2D)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 45;
    goto LABEL_9;
  }
LABEL_12:
  [v4 setMinute:0];
  id v9 = [v2 dateFromComponents:v4];
  uint64_t v8 = [v9 dateByAddingHours:1 inCalendar:v2];

LABEL_13:

  return v8;
}

- (void)printComparisonToDate:()CalClassAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [a1 allComponentsInCalendar:v6];

  uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = [v5 allComponentsInCalendar:v8];

  id v10 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]5();
  }

  uint64_t v11 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]4();
  }

  id v12 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]3();
  }

  uint64_t v13 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]2();
  }

  v14 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]1();
  }

  uint64_t v15 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]0();
  }

  uint64_t v16 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.9();
  }

  uint64_t v17 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.8();
  }

  uint64_t v18 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.7();
  }

  uint64_t v19 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.6();
  }

  uint64_t v20 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.5();
  }

  uint64_t v21 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:].cold.4();
  }

  v22 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]();
  }

  v23 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]();
  }

  v24 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[NSDate(CalClassAdditions) printComparisonToDate:]();
  }
}

- (uint64_t)localizedMonthShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"MMM";
  }
  else {
    id v3 = @"MMMM";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedMonthAndYearStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"yMMM";
  }
  else {
    id v3 = @"yMMMM";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedMonthAndDayStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"MMMd";
  }
  else {
    id v3 = @"MMMMd";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedYearMonthAndDayStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"yMMMd";
  }
  else {
    id v3 = @"yMMMMd";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedWeekdayMonthDayYearStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"yMMMEd";
  }
  else {
    id v3 = @"yMMMMEEEEd";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedWeekdayMonthYearStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"EMMMy";
  }
  else {
    id v3 = @"EEEEmMMMy";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (uint64_t)localizedWeekdayMonthDayStringShortened:()CalClassAdditions
{
  if (a3) {
    id v3 = @"MMMEd";
  }
  else {
    id v3 = @"MMMMEEEEd";
  }
  return [a1 localizedDateStringWithTemplate:v3];
}

- (id)localizedDateStringWithTemplate:()CalClassAdditions
{
  id v4 = (void *)MEMORY[0x1E4F28C10];
  id v5 = a3;
  uint64_t v6 = [v4 CalSharedDateFormatter];
  uint64_t v7 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v9 = [v7 dateFormatFromTemplate:v5 options:0 locale:v8];

  [v6 setDateFormat:v9];
  id v10 = [v6 stringFromDate:a1];

  return v10;
}

- (id)localizedWeekNumber
{
  int v1 = (void *)MEMORY[0x1E4F28EE0];
  id v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "weekInCalendar:", 0));
  id v3 = [v1 localizedStringFromNumber:v2 numberStyle:1];

  return v3;
}

- (uint64_t)localizedRelativeDateStringShortened:()CalClassAdditions
{
  return [a1 _stringWithUseAbbreviatedFormats:a3 lowerCase:0];
}

- (id)_stringWithUseAbbreviatedFormats:()CalClassAdditions lowerCase:
{
  if (_stringWithUseAbbreviatedFormats_lowerCase__onceToken != -1) {
    dispatch_once(&_stringWithUseAbbreviatedFormats_lowerCase__onceToken, &__block_literal_global_63);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [(id)_stringWithUseAbbreviatedFormats_lowerCase__calendar setTimeZone:v7];

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v8 dateRemovingTimeComponentsInCalendar:0];

  id v10 = [a1 dateRemovingTimeComponentsInCalendar:0];
  uint64_t v11 = [(id)_stringWithUseAbbreviatedFormats_lowerCase__calendar components:240 fromDate:v9 toDate:v10 options:0];
  if (![v11 day])
  {
    id v12 = +[CalFoundationBundle bundle];
    if (a4) {
      uint64_t v13 = @"today";
    }
    else {
      uint64_t v13 = @"Today";
    }
    goto LABEL_26;
  }
  if ([v11 day] == -1)
  {
    id v12 = +[CalFoundationBundle bundle];
    if (a4) {
      uint64_t v13 = @"yesterday";
    }
    else {
      uint64_t v13 = @"Yesterday";
    }
    goto LABEL_26;
  }
  if ([v11 day] == 1)
  {
    id v12 = +[CalFoundationBundle bundle];
    if (a4) {
      uint64_t v13 = @"tomorrow";
    }
    else {
      uint64_t v13 = @"Tomorrow";
    }
LABEL_26:
    v27 = [v12 localizedStringForKey:v13 value:&stru_1EE0C39E0 table:0];
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v14 = [v11 day];
  if (v14 >= 0) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = -v14;
  }
  if (v15 <= 6)
  {
    uint64_t v16 = [MEMORY[0x1E4F28C10] CalSharedDateFormatter];
    id v12 = v16;
    if (a3) {
      uint64_t v17 = @"EEE";
    }
    else {
      uint64_t v17 = @"EEEE";
    }
    [v16 setDateFormat:v17];
    uint64_t v18 = [v12 stringFromDate:a1];
    uint64_t v19 = [(id)_stringWithUseAbbreviatedFormats_lowerCase__calendar components:0x2000 fromDate:a1];
    uint64_t v20 = [v19 weekOfYear];

    uint64_t v21 = [(id)_stringWithUseAbbreviatedFormats_lowerCase__calendar components:0x2000 fromDate:v9];
    uint64_t v22 = [v21 weekOfYear];

    uint64_t v23 = [v11 day];
    v24 = +[CalFoundationBundle bundle];
    v25 = v24;
    if ((v23 & 0x8000000000000000) == 0)
    {
      if (v20 <= v22)
      {
        if (a4)
        {
          v26 = @"this %@ (in this week)";
          goto LABEL_37;
        }
        v26 = @"This %@ (in this week)";
      }
      else
      {
        if (a4)
        {
          v26 = @"this %@ (in next week)";
LABEL_37:
          v29 = @"this %@";
LABEL_47:
          v30 = [v24 localizedStringForKey:v26 value:v29 table:0];

          v27 = [NSString localizedStringWithValidatedFormat:v30, @"%@", 0, v18 validFormatSpecifiers error];

          goto LABEL_27;
        }
        v26 = @"This %@ (in next week)";
      }
      v29 = @"This %@";
      goto LABEL_47;
    }
    if (v20 >= v22)
    {
      if (a4)
      {
        v26 = @"last %@ (in this week)";
        goto LABEL_40;
      }
      v26 = @"Last %@ (in this week)";
    }
    else
    {
      if (a4)
      {
        v26 = @"last %@ (in previous week)";
LABEL_40:
        v29 = @"last %@";
        goto LABEL_47;
      }
      v26 = @"Last %@ (in previous week)";
    }
    v29 = @"Last %@";
    goto LABEL_47;
  }
  v27 = [a1 localizedWeekdayMonthDayStringShortened:a3];
LABEL_28:

  return v27;
}

- (uint64_t)midnightOffsetMinutes:()CalClassAdditions
{
  id v3 = [a3 components:96 fromDate:a1];
  uint64_t v4 = [v3 hour];
  uint64_t v5 = [v3 minute] + 60 * v4;

  return v5;
}

- (id)dateRemovingComponents:()CalClassAdditions inCalendar:
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  uint64_t v7 = [v6 components:~a3 fromDate:a1];
  uint64_t v8 = [v6 dateFromComponents:v7];

  return v8;
}

- (uint64_t)localizedYear
{
  return [a1 localizedStringWithFormat:@"CALFullYearFormat"];
}

- (uint64_t)localizedFullMonth
{
  return [a1 localizedStringWithFormat:@"CALFullMonthFormat"];
}

- (uint64_t)localizedDayOfMonth
{
  return [a1 localizedStringWithFormat:@"CALDayOfMonthFormat"];
}

- (uint64_t)localizedFullDateAndTime
{
  return [a1 localizedStringWithFormat:@"CALFullDateAndTimeFormat"];
}

- (uint64_t)localizedShortDateAndTime
{
  return [a1 localizedStringWithFormat:@"CALShortDateAndTimeFormat"];
}

- (uint64_t)localizedFullDate
{
  return [a1 localizedStringWithFormat:@"CALFullDateFormat"];
}

- (uint64_t)localizedLongDate
{
  return [a1 localizedStringWithFormat:@"CALLongDateFormat"];
}

- (id)localizedAbbrevDate
{
  id v2 = +[CalChronometry activeTimeZone];
  id v3 = [a1 localizedAbbrevDateInTimeZone:v2];

  return v3;
}

- (uint64_t)localizedAbbrevDateInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALAbbrevDateFormat" timeZone:a3];
}

- (uint64_t)localizedDayOfWeekWithAbbrevDateInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALLongDayOfWeekAbbrevDateWithoutYearFormat" timeZone:a3];
}

- (uint64_t)localizedShortDate
{
  return [a1 localizedStringWithFormat:@"CALShortDateFormat"];
}

- (uint64_t)localizedFullYearMonth
{
  return [a1 localizedStringWithFormat:@"CALFullYearMonth"];
}

- (uint64_t)localizedFullMonthWeekdayDay
{
  return [a1 localizedStringWithFormat:@"CALFullDateWithoutYearFormat"];
}

- (uint64_t)localizedAbbrevMonthWeekdayDay
{
  return [a1 localizedStringWithFormat:@"CALAbbrevDateWithoutYearFormat"];
}

- (uint64_t)localizedFullMonthWithDay
{
  return [a1 localizedStringWithFormat:@"CALFullMonthWithDay"];
}

- (id)localizedAbbrevMonthWithDay
{
  id v2 = +[CalChronometry activeTimeZone];
  id v3 = [a1 localizedAbbrevMonthWithDayInTimeZone:v2];

  return v3;
}

- (uint64_t)localizedAbbrevMonthWithDayInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALAbbrevMonthWithDay" timeZone:a3];
}

- (uint64_t)localizedShortMonthWithDay
{
  return [a1 localizedStringWithFormat:@"CALShortMonthWithDay"];
}

- (id)localizedMonthWithDayWithPreferredShortening
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v3 = [v2 CalPrefersFullMonthDisplayNames];

  if (v3) {
    [a1 localizedFullMonthWithDay];
  }
  else {
  uint64_t v4 = [a1 localizedAbbrevMonthWithDay];
  }

  return v4;
}

- (uint64_t)localizedFullStandaloneWeekday
{
  return [a1 localizedStringWithFormat:@"CALFullDayOfWeekFormat"];
}

- (uint64_t)localizedShortStandaloneWeekday
{
  return [a1 localizedStringWithFormat:@"CALAbbrevDayOfWeekFormat"];
}

- (uint64_t)localizedFullWeekdayWithDayOfMonth
{
  return [a1 localizedStringWithFormat:@"CALLongDayOfWeekWithDayOfMonthFormat"];
}

- (uint64_t)localizedAbbrevWeekdayWithDayOfMonth
{
  return [a1 localizedStringWithFormat:@"CALAbbrevDayOfWeekWithDayOfMonthFormat"];
}

- (uint64_t)rangeOfDayInLocalizedDateString:()CalClassAdditions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v6 = [v4 currentLocale];
  uint64_t v7 = [MEMORY[0x1E4F28C10] CalSharedDateFormatter];
  uint64_t v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"d" options:0 locale:v6];
  [v7 setDateFormat:v8];

  id v9 = [v7 stringFromDate:a1];
  uint64_t v10 = [v5 rangeOfString:v9];
  uint64_t v12 = v11;
  [v7 setDateFormat:@"d"];
  uint64_t v13 = [v7 stringFromDate:a1];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0) {
    uint64_t v15 = [v5 rangeOfString:v13 options:4];
  }
  else {
    uint64_t v15 = objc_msgSend(v5, "rangeOfString:options:range:locale:", v13, 0, v10, v12, v6);
  }
  uint64_t v16 = v15;

  return v16;
}

- (id)localizedAbbrevWeekdayWithDayOfMonthPreferWeekdayFirstForEnglish
{
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
  int v4 = [v3 isEqualToString:@"en"];

  if (!v4) {
    goto LABEL_5;
  }
  id v5 = +[CalChronometry activeCalendar];
  uint64_t v6 = [a1 weekdayInCalendar:v5];

  uint64_t v7 = [a1 localizedDayOfMonth];
  uint64_t v8 = objc_opt_class();
  objc_sync_enter(v8);
  id v9 = +[CalDateLocalization sharedDateFormatter];
  uint64_t v10 = [v9 shortStandaloneWeekdaySymbols];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v6 - 1];

  uint64_t v12 = [v11 length];
  if (v12)
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@ %@", v11, v7];
  }

  objc_sync_exit(v8);
  if (!v12)
  {
LABEL_5:
    uint64_t v10 = [a1 localizedAbbrevWeekdayWithDayOfMonth];
  }

  return v10;
}

- (id)localizedAbbrevMonthWithDayRangeToDate:()CalClassAdditions
{
  int v4 = (objc_class *)MEMORY[0x1E4F28C20];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setDateStyle:0];
  [v6 setTimeStyle:0];
  [v6 setBoundaryStyle:1];
  uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (([v7 CalUnableToAbbreviateMonthNames] & 1) != 0
    || ([v7 languageCode],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:@"vi"],
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = @"MMd";
  }
  else if ([v7 CalPrefersFullMonthDisplayNames])
  {
    uint64_t v10 = @"MMMMd";
  }
  else
  {
    uint64_t v10 = @"MMMd";
  }
  [v6 setDateTemplate:v10];
  uint64_t v11 = [v6 stringFromDate:a1 toDate:v5];

  return v11;
}

- (id)localizedAbbrevStandaloneMonth
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"LLL"];
  [v2 setFormattingContext:2];
  int v3 = [v2 stringFromDate:a1];

  return v3;
}

- (uint64_t)localizedTime
{
  return [a1 localizedStringWithFormat:@"CALFullTimeFormat"];
}

- (id)localizedShortTime
{
  id v2 = +[CalChronometry activeTimeZone];
  int v3 = [a1 localizedShortTimeInTimeZone:v2];

  return v3;
}

- (uint64_t)localizedShortTimeInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALShortTimeFormat" timeZone:a3];
}

- (id)localizedHour
{
  id v2 = +[CalChronometry activeTimeZone];
  int v3 = [a1 localizedHourInTimeZone:v2];

  return v3;
}

- (uint64_t)localizedHourInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALHourFormat" timeZone:a3];
}

- (id)localizedHourMinutesWithoutAMPM
{
  id v2 = +[CalChronometry activeTimeZone];
  int v3 = [a1 localizedHourMinutesWithoutAMPMInTimeZone:v2];

  return v3;
}

- (uint64_t)localizedHourMinutesWithoutAMPMInTimeZone:()CalClassAdditions
{
  return [a1 localizedStringWithFormat:@"CALHourMinutesWithoutAMPMFormat" timeZone:a3];
}

- (uint64_t)localizedHourWithoutAMPM
{
  return [a1 localizedStringWithFormat:@"CALHourWithoutAMPMFormat"];
}

- (id)localizedStringForEventTime
{
  id v2 = +[CalChronometry activeTimeZone];
  int v3 = [a1 localizedStringForEventTimeInTimeZone:v2];

  return v3;
}

- (id)localizedStringForEventTimeInTimeZone:()CalClassAdditions
{
  id v4 = a3;
  BOOL v5 = +[CalDateLocalization hasAMPM];
  BOOL v6 = +[CalDateLocalization uses24HourTime];
  if (v5 && !v6)
  {
    char v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v9 setLocale:v10];

    [v9 setTimeZone:v4];
    if ([a1 minuteInCalendar:v9]) {
      [a1 localizedShortTimeInTimeZone:v4];
    }
    else {
    uint64_t v8 = [a1 localizedHourInTimeZone:v4];
    }
  }
  else
  {
    uint64_t v8 = [a1 localizedHourMinutesWithoutAMPMInTimeZone:v4];
  }

  return v8;
}

+ (id)CalDateRangeStringWithStart:()CalClassAdditions end:
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[CalFoundationBundle bundle];
  uint64_t v8 = [v7 localizedStringForKey:@"Date range %@ to %@" value:@"%@ to %@" table:0];

  char v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v6, v5);

  return v9;
}

- (void)printComparisonToDate:()CalClassAdditions .cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 nanosecond];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() nanosecond];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "nanosecond: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 second];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() second];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "second: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 minute];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() minute];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "minute %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 hour];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() hour];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "hour: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.5()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 weekdayOrdinal];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() weekdayOrdinal];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "weekdayOrdinal: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 weekday];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() weekday];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "weekday: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.7()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 weekOfYear];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() weekOfYear];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "weekOfYear: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 weekOfMonth];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() weekOfMonth];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "weekOfMonth: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.9()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 day];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() day];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "day: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.10()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 month];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() month];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "month: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.11()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 quarter];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() quarter];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "quarter: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.12()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 year];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() year];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "Year: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.13()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  [v1 era];
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_0() era];
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "Era: %@ vs %@", v5, v6, v7, v8, v9);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.14()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = [v1 timeZone];
  uint64_t v3 = [v0 timeZone];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v4, v5, "TimeZone: %@ vs %@", v6, v7, v8, v9, v10);
}

- (void)printComparisonToDate:()CalClassAdditions .cold.15()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = [v1 calendar];
  uint64_t v3 = [v2 calendarIdentifier];
  uint64_t v4 = [v0 calendar];
  uint64_t v11 = [v4 calendarIdentifier];
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v5, v6, "Calendar: %@ vs %@", v7, v8, v9, v10, 2u);
}

@end