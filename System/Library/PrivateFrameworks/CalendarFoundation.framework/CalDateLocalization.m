@interface CalDateLocalization
+ (BOOL)dateIsWeekend:(id)a3;
+ (BOOL)hasAMPM;
+ (BOOL)requiresSingularLocalizationForDate:(id)a3;
+ (BOOL)shouldUseHourMinutesWithoutAMPMForHours;
+ (BOOL)uses24HourTime;
+ (BOOL)weekdayIsWeekend:(int64_t)a3;
+ (__CFDateFormatter)_dateFormatterForKey:(id)a3;
+ (__CFLocale)createCFLocale;
+ (id)ICUFormatForKey:(id)a3;
+ (id)ICUFormats;
+ (id)_hourSymbolInFormat:(id)a3;
+ (id)calendarDayFormatter;
+ (id)dateFormatters;
+ (id)dateStringRepresentationForEventCompontentsStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 timeZone:(id)a6;
+ (id)dateStringRepresentationForReminderStartDate:(id)a3 allDay:(BOOL)a4;
+ (id)formatKeyForHourString;
+ (id)locale;
+ (id)longStringForDateAndTime:(id)a3 inTimeZone:(id)a4;
+ (id)sharedDateFormatter;
+ (id)sizeOrderedAllDateFormatsWithoutYear;
+ (id)sizeOrderedDateFormats;
+ (id)sizeOrderedDateFormatsWithYear;
+ (id)sizeOrderedDateFormatsWithoutYear;
+ (id)timelineHourDateFormatter;
+ (id)weekendDays;
+ (void)generateAdditionalPrecodedFormatters:(id)a3;
+ (void)generateDerivedTimeFormats:(id)a3;
+ (void)generateLocalizedDateTimeFormats;
+ (void)generatePreferedOrders;
+ (void)generateStandardFormatters:(id)a3;
+ (void)initializeFormatters;
+ (void)rebuildFormatters;
+ (void)rebuildWeekendDays;
+ (void)setupFormat:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6;
+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5;
+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6;
+ (void)setupFormatter:(__CFDateFormatter *)a3 forKey:(id)a4;
@end

@implementation CalDateLocalization

+ (void)initializeFormatters
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if ((__FormattersInitialized & 1) == 0)
  {
    __FormattersInitialized = 1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)__ICUFormats;
    __ICUFormats = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = (void *)__DateFormatters;
    __DateFormatters = (uint64_t)v5;

    [a1 generateLocalizedDateTimeFormats];
  }
  objc_sync_exit(obj);
}

+ (void)rebuildFormatters
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  id v3 = (void *)__SharedFormatter;
  __SharedFormatter = 0;

  v4 = (void *)__CalendarDayFormatter;
  __CalendarDayFormatter = 0;

  [a1 generateLocalizedDateTimeFormats];
  objc_sync_exit(obj);
}

+ (void)rebuildWeekendDays
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)__WeekendDays;
  __WeekendDays = 0;

  objc_sync_exit(obj);
}

+ (id)locale
{
  return (id)[MEMORY[0x1E4F1CA20] currentLocale];
}

+ (__CFLocale)createCFLocale
{
  v2 = [a1 locale];
  id v3 = [v2 localeIdentifier];

  v4 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3);
  return v4;
}

+ (id)sharedDateFormatter
{
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  v4 = (void *)__SharedFormatter;
  if (!__SharedFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v6 = (void *)__SharedFormatter;
    __SharedFormatter = (uint64_t)v5;

    [(id)__SharedFormatter setDateFormat:0];
    [(id)__SharedFormatter setDateStyle:0];
    [(id)__SharedFormatter setTimeStyle:0];
    v7 = (void *)__SharedFormatter;
    v8 = [a1 locale];
    [v7 setLocale:v8];

    v9 = (void *)__SharedFormatter;
    v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v9 setTimeZone:v10];

    v4 = (void *)__SharedFormatter;
  }
  id v11 = v4;
  objc_sync_exit(v3);

  return v11;
}

+ (id)timelineHourDateFormatter
{
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  v4 = (void *)__TimelineHourFormatter;
  if (!__TimelineHourFormatter)
  {
    id v5 = objc_opt_new();
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v5 setCalendar:v6];

    v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v5 setTimeZone:v7];

    v8 = [a1 locale];
    [v5 setLocale:v8];

    [v5 setLocalizedDateFormatFromTemplate:@"j"];
    v9 = (void *)__TimelineHourFormatter;
    __TimelineHourFormatter = (uint64_t)v5;

    v4 = (void *)__TimelineHourFormatter;
  }
  id v10 = v4;
  objc_sync_exit(v3);

  return v10;
}

+ (id)calendarDayFormatter
{
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  v4 = (void *)__CalendarDayFormatter;
  if (!__CalendarDayFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v6 = (void *)__CalendarDayFormatter;
    __CalendarDayFormatter = (uint64_t)v5;

    [(id)__CalendarDayFormatter setNumberStyle:1];
    v7 = (void *)__CalendarDayFormatter;
    v8 = [a1 locale];
    [v7 setLocale:v8];

    v4 = (void *)__CalendarDayFormatter;
  }
  id v9 = v4;
  objc_sync_exit(v3);

  return v9;
}

+ (id)weekendDays
{
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  v4 = (void *)__WeekendDays;
  if (!__WeekendDays)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = (void *)__WeekendDays;
    __WeekendDays = (uint64_t)v5;

    v7 = [a1 locale];
    id v8 = [v7 localeIdentifier];
    [v8 UTF8String];
    ucal_open();

    int v9 = 1;
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    uint64_t v11 = MEMORY[0x1E4F1CC38];
    do
    {
      if (ucal_getDayOfWeekType() == 1) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v10;
      }
      [(id)__WeekendDays addObject:v12];
      ++v9;
    }
    while (v9 != 8);
    ucal_close();
    v4 = (void *)__WeekendDays;
  }
  id v13 = v4;
  objc_sync_exit(v3);

  return v13;
}

+ (BOOL)dateIsWeekend:(id)a3
{
  id v4 = a3;
  id v5 = +[CalChronometry activeCalendar];
  uint64_t v6 = [v4 weekdayInCalendar:v5];

  LOBYTE(a1) = [a1 weekdayIsWeekend:v6];
  return (char)a1;
}

+ (BOOL)weekdayIsWeekend:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 < 1) {
    return 0;
  }
  id v5 = [a1 weekendDays];
  unint64_t v6 = [v5 count];

  if (v3 > v6) {
    return 0;
  }
  id v8 = [a1 weekendDays];
  int v9 = [v8 objectAtIndex:v3];
  char v10 = [v9 BOOLValue];

  return v10;
}

+ (BOOL)hasAMPM
{
  unint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = [a1 sharedDateFormatter];
  id v5 = [v4 AMSymbol];
  if ([v5 length])
  {
    unint64_t v6 = [v4 PMSymbol];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  objc_sync_exit(v3);
  return v7;
}

+ (BOOL)uses24HourTime
{
  unint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = [a1 ICUFormats];
  id v5 = [v4 objectForKey:@"CALShortTimeFormat"];

  BOOL v6 = [v5 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v5 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;

  objc_sync_exit(v3);
  return v6;
}

+ (BOOL)shouldUseHourMinutesWithoutAMPMForHours
{
  if (![a1 hasAMPM]) {
    return 1;
  }

  return [a1 uses24HourTime];
}

+ (id)formatKeyForHourString
{
  int v2 = [a1 shouldUseHourMinutesWithoutAMPMForHours];
  unint64_t v3 = CALHourMinutesWithoutAMPMFormat;
  if (!v2) {
    unint64_t v3 = CALHourFormat;
  }
  id v4 = *v3;

  return v4;
}

+ (BOOL)requiresSingularLocalizationForDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setCalendar:v4];
  [v5 setLocalizedDateFormatFromTemplate:@"j"];
  BOOL v6 = [v5 stringFromDate:v3];
  BOOL v7 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v8 = [v7 invertedSet];

  int v9 = [v6 componentsSeparatedByCharactersInSet:v8];
  char v10 = [v9 componentsJoinedByString:&stru_1EE0C39E0];

  id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v12 = [v11 numberFromString:v10];
  int v13 = [v12 intValue];
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = [v4 component:32 fromDate:v3];
  }

  return v14 == 1;
}

+ (void)setupFormatter:(__CFDateFormatter *)a3 forKey:(id)a4
{
  id v5 = a4;
  CFDateFormatterGetFormat(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(id)__DateFormatters setObject:a3 forKey:v5];
  [(id)__ICUFormats setObject:v6 forKey:v5];
}

+ (void)setupFormat:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a4;
  char v10 = (__CFString *)a3;
  id v11 = CFDateFormatterCreate(0, (CFLocaleRef)a5, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetFormat(v11, v10);

  if (v6) {
    CFDateFormatterSetProperty(v11, @"kCFDateFormatterFormattingContextKey", &unk_1EE0D45B8);
  }
  [a1 setupFormatter:v11 forKey:v12];
  CFRelease(v11);
}

+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5
{
}

+ (void)setupFormatTemplate:(id)a3 forKey:(id)a4 locale:(id)a5 standalone:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 length])
  {
    int v13 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v10 options:0 locale:v12];
    if ([v13 length])
    {
      [a1 setupFormat:v13 forKey:v11 locale:v12 standalone:v6];
    }
    else
    {
      uint64_t v14 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:]((uint64_t)v10, v12, v14);
      }
    }
  }
}

+ (void)generateStandardFormatters:(id)a3
{
  CFLocaleRef v3 = (const __CFLocale *)a3;
  CFDateFormatterRef v4 = CFDateFormatterCreate(0, v3, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
  +[CalDateLocalization setupFormatter:v4 forKey:@"CALFullDateAndTimeFormat"];
  CFRelease(v4);
  CFDateFormatterRef v5 = CFDateFormatterCreate(0, v3, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
  +[CalDateLocalization setupFormatter:v5 forKey:@"CALShortDateAndTimeFormat"];
  CFRelease(v5);
  CFDateFormatterRef v6 = CFDateFormatterCreate(0, v3, kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:v6 forKey:@"CALFullDateFormat"];
  CFRelease(v6);
  CFDateFormatterRef v7 = CFDateFormatterCreate(0, v3, kCFDateFormatterLongStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:v7 forKey:@"CALLongDateFormat"];
  CFRelease(v7);
  CFDateFormatterRef v8 = CFDateFormatterCreate(0, v3, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:v8 forKey:@"CALAbbrevDateFormat"];
  CFRelease(v8);
  CFDateFormatterRef v9 = CFDateFormatterCreate(0, v3, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  +[CalDateLocalization setupFormatter:v9 forKey:@"CALShortDateFormat"];
  CFRelease(v9);
  CFDateFormatterRef v10 = CFDateFormatterCreate(0, v3, kCFDateFormatterNoStyle, kCFDateFormatterFullStyle);
  +[CalDateLocalization setupFormatter:v10 forKey:@"CALFullTimeFormat"];
  CFRelease(v10);
  CFDateFormatterRef v11 = CFDateFormatterCreate(0, v3, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);

  +[CalDateLocalization setupFormatter:v11 forKey:@"CALShortTimeFormat"];

  CFRelease(v11);
}

+ (void)generateAdditionalPrecodedFormatters:(id)a3
{
  id v7 = a3;
  +[CalDateLocalization setupFormatTemplate:@"j" forKey:@"CALHourFormat" locale:v7];
  +[CalDateLocalization setupFormat:@"a" forKey:@"CALAMPMFormat" locale:v7 standalone:0];
  +[CalDateLocalization setupFormatTemplate:@"d" forKey:@"CALDayOfMonthFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"y" forKey:@"CALFullYearFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"LLL" forKey:@"CALAbbrevMonthFormat" locale:v7 standalone:1];
  +[CalDateLocalization setupFormatTemplate:@"LLLL" forKey:@"CALFullMonthFormat" locale:v7 standalone:1];
  +[CalDateLocalization setupFormatTemplate:@"cccc" forKey:@"CALFullDayOfWeekFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"ccc" forKey:@"CALAbbrevDayOfWeekFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"EEEEd" forKey:@"CALLongDayOfWeekWithDayOfMonthFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"yMMMMEEEd" forKey:@"CALAbbrevDayOfWeekWithFullDateFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"yMMMEd" forKey:@"CALAbbrevDayOfWeekWithAbbrevDateFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"MMMMEEEEd" forKey:@"CALFullDateWithoutYearFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"MMMEEEEd" forKey:@"CALLongDayOfWeekAbbrevDateWithoutYearFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"MMMMEEEd" forKey:@"CALAbbrevDayOfWeekWithFullDateWithoutYearFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"MMMEEEd" forKey:@"CALAbbrevDateWithoutYearFormat" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"MMMMd" forKey:@"CALFullMonthWithDay" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"yMMMM" forKey:@"CALFullYearMonth" locale:v7 standalone:1];
  +[CalDateLocalization setupFormatTemplate:@"MMMd" forKey:@"CALAbbrevMonthWithDay" locale:v7];
  +[CalDateLocalization setupFormatTemplate:@"Md" forKey:@"CALShortMonthWithDay" locale:v7];
  v8[0] = 0;
  v8[1] = 0;
  CFDateFormatterRef v4 = (void *)MEMORY[0x1E4F28E78];
  CFDateFormatterRef v5 = _GetFormatAnd_d_FieldRangeFor_EEEd(v7, v8);
  CFDateFormatterRef v6 = [v4 stringWithString:v5];

  if ([v6 length]) {
    [a1 setupFormat:v6 forKey:@"CALAbbrevDayOfWeekWithDayOfMonthFormat" locale:v7 standalone:0];
  }
}

+ (id)_hourSymbolInFormat:(id)a3
{
  id v3 = a3;
  CFDateFormatterRef v4 = @"HH";
  if ([v3 rangeOfString:@"HH"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    CFDateFormatterRef v4 = @"H";
    if ([v3 rangeOfString:@"H"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      CFDateFormatterRef v4 = @"KK";
      if ([v3 rangeOfString:@"KK"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        CFDateFormatterRef v4 = @"K";
        if ([v3 rangeOfString:@"K"] == 0x7FFFFFFFFFFFFFFFLL)
        {
          CFDateFormatterRef v4 = @"kk";
          if ([v3 rangeOfString:@"kk"] == 0x7FFFFFFFFFFFFFFFLL)
          {
            CFDateFormatterRef v4 = @"k";
            if ([v3 rangeOfString:@"k"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              CFDateFormatterRef v4 = @"hh";
              if ([v3 rangeOfString:@"hh"] == 0x7FFFFFFFFFFFFFFFLL)
              {
                CFDateFormatterRef v4 = @"h";
                if ([v3 rangeOfString:@"h"] == 0x7FFFFFFFFFFFFFFFLL) {
                  CFDateFormatterRef v4 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

+ (void)generateDerivedTimeFormats:(id)a3
{
  id v18 = a3;
  CFDateFormatterRef v4 = [a1 ICUFormats];
  CFDateFormatterRef v5 = [v4 objectForKey:@"CALShortTimeFormat"];

  CFDateFormatterRef v6 = [a1 _hourSymbolInFormat:v5];
  id v7 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"jmm" options:0 locale:v18];
  CFDateFormatterRef v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"a."];
  CFDateFormatterRef v9 = [v7 stringByTrimmingCharactersInSet:v8];

  CFDateFormatterRef v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  CFDateFormatterRef v11 = [v9 stringByTrimmingCharactersInSet:v10];

  id v12 = [a1 _hourSymbolInFormat:v11];
  if ([v6 length] && objc_msgSend(v12, "length") && (objc_msgSend(v12, "isEqualToString:", v6) & 1) == 0)
  {
    uint64_t v13 = [v11 stringByReplacingOccurrencesOfString:v12 withString:v6];

    CFDateFormatterRef v11 = (void *)v13;
  }
  if (![v6 length])
  {
    uint64_t v14 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:v18];

    v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"a."];
    v16 = [v14 stringByTrimmingCharactersInSet:v15];

    v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    CFDateFormatterRef v6 = [v16 stringByTrimmingCharactersInSet:v17];
  }
  +[CalDateLocalization setupFormat:v6 forKey:@"CALHourWithoutAMPMFormat" locale:v18 standalone:0];
  +[CalDateLocalization setupFormat:v11 forKey:@"CALHourMinutesWithoutAMPMFormat" locale:v18 standalone:0];
}

+ (void)generateLocalizedDateTimeFormats
{
  if (__FormattersInitialized == 1)
  {
    [(id)__ICUFormats removeAllObjects];
    [(id)__DateFormatters removeAllObjects];
    if (_formattersCache)
    {
      [(id)_formattersCache removeAllObjects];
    }
    else
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDateFormatterRef v4 = (void *)_formattersCache;
      _formattersCache = (uint64_t)v3;
    }
    id v5 = [a1 locale];
    [a1 generateStandardFormatters:v5];
    [a1 generateAdditionalPrecodedFormatters:v5];
    [a1 generateDerivedTimeFormats:v5];
    [a1 generatePreferedOrders];
  }
}

+ (void)generatePreferedOrders
{
  if (!_datesFormats)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CALFullDateFormat", @"CALLongDateFormat", @"CALAbbrevDateFormat", @"CALShortDateFormat", @"CALShortMonthWithDay", 0);
    id v3 = (void *)_datesFormats;
    _datesFormats = v2;
  }
  if (!_datesWithYear)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CALFullDateFormat", @"CALLongDateFormat", @"CALAbbrevDateFormat", @"CALShortDateFormat", 0);
    id v5 = (void *)_datesWithYear;
    _datesWithYear = v4;
  }
  if (!_fullDatesWithoutYear)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CALFullDateWithoutYearFormat", @"CALFullMonthWithDay", @"CALAbbrevDateWithoutYearFormat", @"CALAbbrevMonthWithDay", @"CALShortMonthWithDay", 0);
    id v7 = (void *)_fullDatesWithoutYear;
    _fullDatesWithoutYear = v6;
  }
  if (!_datesWithoutYear)
  {
    _datesWithoutYear = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CALFullDateWithoutYearFormat", @"CALAbbrevDateWithoutYearFormat", @"CALShortMonthWithDay", 0);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)sizeOrderedDateFormats
{
  return (id)_datesFormats;
}

+ (id)sizeOrderedDateFormatsWithYear
{
  return (id)_datesWithYear;
}

+ (id)sizeOrderedDateFormatsWithoutYear
{
  return (id)_datesWithoutYear;
}

+ (id)sizeOrderedAllDateFormatsWithoutYear
{
  return (id)_fullDatesWithoutYear;
}

+ (id)ICUFormats
{
  [a1 initializeFormatters];
  uint64_t v2 = (void *)__ICUFormats;

  return v2;
}

+ (id)dateFormatters
{
  [a1 initializeFormatters];
  uint64_t v2 = (void *)__DateFormatters;

  return v2;
}

+ (id)ICUFormatForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 ICUFormats];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

+ (__CFDateFormatter)_dateFormatterForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 dateFormatters];
  uint64_t v6 = (__CFDateFormatter *)[v5 objectForKey:v4];

  return v6;
}

+ (id)longStringForDateAndTime:(id)a3 inTimeZone:(id)a4
{
  id v6 = a4;
  CFDateRef v7 = (const __CFDate *)a3;
  CFLocaleRef v8 = (const __CFLocale *)[a1 createCFLocale];
  CFDateFormatterRef v9 = CFDateFormatterCreate(0, v8, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterRef v10 = v9;
  if (v6) {
    CFStringRef v11 = @"EEE  MMM d, jmm z";
  }
  else {
    CFStringRef v11 = @"EEE  MMM d, jmm";
  }
  CFLocaleRef Locale = CFDateFormatterGetLocale(v9);
  CFStringRef DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate(0, v11, 0, Locale);
  CFDateFormatterSetFormat(v10, DateFormatFromTemplate);
  CFDateFormatterSetProperty(v10, (CFStringRef)*MEMORY[0x1E4F1D0F8], v6);

  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v10, v7);
  CFRelease(DateFormatFromTemplate);
  CFRelease(v10);
  CFRelease(v8);

  return StringWithDate;
}

+ (id)dateStringRepresentationForEventCompontentsStartDate:(id)a3 endDate:(id)a4 allDay:(BOOL)a5 timeZone:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CalendarFoundation"];
  uint64_t v14 = 0;
  if (v10 && v11)
  {
    if (v12) {
      int v15 = v7;
    }
    else {
      int v15 = 1;
    }
    if (!v12)
    {
      id v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    id v12 = v12;
    v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v16 setTimeZone:v12];
    v41 = v16;
    v17 = [v16 components:30 fromDate:v10];
    id v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v18 setTimeZone:v12];
    if (v7)
    {
      uint64_t v19 = [v11 dateByAddingTimeInterval:-1.0];

      id v11 = (id)v19;
    }
    [v18 components:30 fromDate:v11];
    v38 = v40 = v17;
    int v20 = objc_msgSend(v17, "isEqual:");
    v21 = objc_opt_new();
    v22 = [a1 locale];
    [v21 setLocale:v22];

    v39 = v18;
    if (v15)
    {
      [v21 setTimeZone:v12];
      [v21 setDateStyle:2];
      [v21 setTimeStyle:!v7];
      v23 = [v21 stringFromDate:v10];
      if (v20) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = 2;
      }
      [v21 setDateStyle:v24];
      [v21 setTimeStyle:!v7];
      v25 = [v21 stringFromDate:v11];
      int v26 = v20 & v7;
      v27 = NSString;
      if (v26 == 1)
      {
        v28 = [v13 localizedStringForKey:@"Scheduled: %@" value:&stru_1EE0C39E0 table:0];
LABEL_27:
        uint64_t v14 = objc_msgSend(v27, "localizedStringWithFormat:", v28, v23, v37);
LABEL_28:

        goto LABEL_29;
      }
      v33 = @"Scheduled: %@ to %@";
      v34 = &stru_1EE0C39E0;
    }
    else
    {
      int v29 = [v12 isEqualToTimeZone:v12];
      [v21 setTimeZone:v12];
      if (v29)
      {
        [v21 setTimeStyle:1];
        [v21 setDateStyle:2];
        v23 = [v21 stringFromDate:v10];
        if (v20) {
          uint64_t v30 = 0;
        }
        else {
          uint64_t v30 = 2;
        }
        [v21 setDateStyle:v30];
        v25 = [v21 stringFromDate:v11];
        [v21 setLocalizedDateFormatFromTemplate:@"z"];
        v28 = [v21 stringFromDate:v10];
        v31 = NSString;
        v32 = [v13 localizedStringForKey:@"Scheduled: %@ to %@, %@", &stru_1EE0C39E0, 0 value table];
        uint64_t v14 = objc_msgSend(v31, "localizedStringWithFormat:", v32, v23, v25, v28);

        goto LABEL_28;
      }
      [v21 setLocalizedDateFormatFromTemplate:@"MMM d, y h:mm a z"];
      v23 = [v21 stringFromDate:v10];
      [v21 setTimeZone:v12];
      if (v20) {
        v35 = @"h:mm a z";
      }
      else {
        v35 = @"MMM d, y h:mm a z";
      }
      [v21 setLocalizedDateFormatFromTemplate:v35];
      v25 = [v21 stringFromDate:v11];
      v27 = NSString;
      v33 = @"Scheduled: %@ to %@ (with timezone information)";
      v34 = @"Scheduled: %@ to %@";
    }
    v28 = [v13 localizedStringForKey:v33 value:v34 table:0];
    v37 = v25;
    goto LABEL_27;
  }
LABEL_29:

  return v14;
}

+ (id)dateStringRepresentationForReminderStartDate:(id)a3 allDay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  CFLocaleRef v8 = [a1 locale];
  [v7 setLocale:v8];

  [v7 setDoesRelativeDateFormatting:1];
  [v7 setDateStyle:1];
  [v7 setTimeStyle:!v4];
  CFDateFormatterRef v9 = [v7 stringFromDate:v6];

  return v9;
}

+ (void)setupFormatTemplate:(NSObject *)a3 forKey:locale:standalone:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 localeIdentifier];
  int v6 = 136315650;
  BOOL v7 = "+[CalDateLocalization setupFormatTemplate:forKey:locale:standalone:]";
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_error_impl(&dword_190D88000, a3, OS_LOG_TYPE_ERROR, "%s ERROR: unable to generate format string from template \"%@\" in locale \"%@\"", (uint8_t *)&v6, 0x20u);
}

@end