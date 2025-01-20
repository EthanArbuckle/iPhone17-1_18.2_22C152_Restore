@interface FIUIDateFormattingUtilities
+ (BOOL)_dateStringFits:(id)a3 font:(id)a4 maxWidth:(double)a5;
+ (id)_dateFormatter;
+ (id)_localizedTodayFormatterWithTemplate:(id)a3;
+ (id)stringWithDayNameAndShortMonthFromDate:(id)a3;
+ (id)stringWithEitherTodayOrLongStyleDateFromDate:(id)a3;
+ (id)stringWithLongestStyleDate:(id)a3 font:(id)a4 maxWidth:(double)a5;
+ (id)stringWithShortStyleDate:(id)a3;
+ (id)timeFormatter;
+ (id)timeRangeStringFromDateInterval:(id)a3;
+ (id)timeStringWithSpaceRemoved:(id)a3 date:(id)a4;
@end

@implementation FIUIDateFormattingUtilities

+ (id)timeFormatter
{
  if (timeFormatter_onceToken != -1) {
    dispatch_once(&timeFormatter_onceToken, &__block_literal_global_326);
  }
  v2 = (void *)timeFormatter___timeFormatter;
  return v2;
}

void __44__FIUIDateFormattingUtilities_timeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)timeFormatter___timeFormatter;
  timeFormatter___timeFormatter = (uint64_t)v0;

  [(id)timeFormatter___timeFormatter setDateStyle:0];
  [(id)timeFormatter___timeFormatter setTimeStyle:1];
  v2 = FIUIBundle();
  id v5 = [v2 localizedStringForKey:@"AM_SYMBOL_OVERRIDE" value:&stru_26CF5F1B8 table:@"Localizable"];

  if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", @"-") & 1) == 0) {
    [(id)timeFormatter___timeFormatter setAMSymbol:v5];
  }
  v3 = FIUIBundle();
  v4 = [v3 localizedStringForKey:@"PM_SYMBOL_OVERRIDE" value:&stru_26CF5F1B8 table:@"Localizable"];

  if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", @"-") & 1) == 0) {
    [(id)timeFormatter___timeFormatter setPMSymbol:v4];
  }
  objc_msgSend((id)timeFormatter___timeFormatter, "fu_observeTimeZoneAndLocaleChanges");
}

+ (id)timeRangeStringFromDateInterval:(id)a3
{
  id v4 = a3;
  id v5 = [a1 timeFormatter];
  v6 = [v4 startDate];
  v7 = [a1 timeStringWithSpaceRemoved:v5 date:v6];

  v8 = [a1 timeFormatter];
  v9 = [v4 endDate];

  v10 = [a1 timeStringWithSpaceRemoved:v8 date:v9];

  v11 = NSString;
  v12 = FIUIBundle();
  v13 = [v12 localizedStringForKey:@"TIME_RANGE_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
  v14 = objc_msgSend(v11, "stringWithFormat:", v13, v7, v10);

  return v14;
}

+ (id)timeStringWithSpaceRemoved:(id)a3 date:(id)a4
{
  id v5 = a3;
  v6 = [v5 stringFromDate:a4];
  v7 = NSString;
  v8 = [v5 AMSymbol];
  v9 = [v7 stringWithFormat:@" %@", v8];
  v10 = [v5 AMSymbol];
  v11 = [v6 stringByReplacingOccurrencesOfString:v9 withString:v10];

  v12 = NSString;
  v13 = [v5 PMSymbol];
  v14 = [v12 stringWithFormat:@" %@", v13];
  v15 = [v5 PMSymbol];
  v16 = [v11 stringByReplacingOccurrencesOfString:v14 withString:v15];

  v17 = NSString;
  v18 = [v5 AMSymbol];
  v19 = [v17 stringWithFormat:@" %@", v18];
  v20 = [v5 AMSymbol];
  v21 = [v16 stringByReplacingOccurrencesOfString:v19 withString:v20];

  v22 = NSString;
  v23 = [v5 PMSymbol];
  v24 = [v22 stringWithFormat:@" %@", v23];
  v25 = [v5 PMSymbol];

  v26 = [v21 stringByReplacingOccurrencesOfString:v24 withString:v25];

  return v26;
}

+ (id)stringWithLongestStyleDate:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 _dateFormatter];
  [v10 setDateStyle:3];
  v11 = [v10 stringFromDate:v8];
  if (([a1 _dateStringFits:v11 font:v9 maxWidth:a5] & 1) == 0)
  {
    [v10 setDateStyle:2];
    v12 = [v10 stringFromDate:v8];

    if ([a1 _dateStringFits:v12 font:v9 maxWidth:a5])
    {
      v11 = v12;
    }
    else
    {
      [v10 setDateStyle:1];
      v11 = [v10 stringFromDate:v8];
    }
  }
  id v13 = v11;

  return v13;
}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_dateFormatter___dateFormatter;
  return v2;
}

uint64_t __45__FIUIDateFormattingUtilities__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter___dateFormatter;
  _dateFormatter___dateFormatter = (uint64_t)v0;

  [(id)_dateFormatter___dateFormatter setTimeStyle:0];
  v2 = (void *)_dateFormatter___dateFormatter;
  return objc_msgSend(v2, "fu_observeTimeZoneAndLocaleChanges");
}

+ (BOOL)_dateStringFits:(id)a3 font:(id)a4 maxWidth:(double)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v14 = *MEMORY[0x263F814F0];
  v15[0] = a4;
  v7 = NSDictionary;
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [v9 sizeWithAttributes:v10];
  double v12 = v11;

  return v12 <= a5;
}

+ (id)stringWithShortStyleDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _dateFormatter];
  [v5 setDateStyle:1];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (id)_localizedTodayFormatterWithTemplate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDoesRelativeDateFormatting:1];
  [v5 setDateStyle:2];
  v6 = [MEMORY[0x263EFF910] date];
  v7 = [v5 stringFromDate:v6];

  id v8 = NSString;
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  v10 = [v8 stringWithFormat:@"'%@'", v9];

  id v11 = objc_alloc_init(MEMORY[0x263F08790]);
  double v12 = (void *)MEMORY[0x263F08790];
  id v13 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v14 = [v12 dateFormatFromTemplate:v4 options:0 locale:v13];

  v15 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(EE+|cc+)" options:0 error:0];
  v16 = objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v14, 0, 0, objc_msgSend(v14, "length"), v10);
  [v11 setDateFormat:v16];

  return v11;
}

+ (id)stringWithEitherTodayOrLongStyleDateFromDate:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__FIUIDateFormattingUtilities_stringWithEitherTodayOrLongStyleDateFromDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringWithEitherTodayOrLongStyleDateFromDate__onceToken != -1) {
    dispatch_once(&stringWithEitherTodayOrLongStyleDateFromDate__onceToken, block);
  }
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v6 = [v5 isDateInToday:v4];

  v7 = &stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter;
  if (!v6) {
    v7 = &stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter;
  }
  id v8 = [(id)*v7 stringFromDate:v4];

  return v8;
}

uint64_t __76__FIUIDateFormattingUtilities_stringWithEitherTodayOrLongStyleDateFromDate___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _localizedTodayFormatterWithTemplate:@"EEEEMMMMdy"];
  v2 = (void *)stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter;
  stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter = v1;

  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  id v4 = (void *)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter;
  stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter = (uint64_t)v3;

  [(id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter setDateStyle:3];
  [(id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter setTimeStyle:0];
  [(id)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter setDoesRelativeDateFormatting:0];
  objc_msgSend((id)stringWithEitherTodayOrLongStyleDateFromDate____todayFormatter, "fu_observeTimeZoneAndLocaleChanges");
  id v5 = (void *)stringWithEitherTodayOrLongStyleDateFromDate____notTodayFormatter;
  return objc_msgSend(v5, "fu_observeTimeZoneAndLocaleChanges");
}

+ (id)stringWithDayNameAndShortMonthFromDate:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__FIUIDateFormattingUtilities_stringWithDayNameAndShortMonthFromDate___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringWithDayNameAndShortMonthFromDate__onceToken != -1) {
    dispatch_once(&stringWithDayNameAndShortMonthFromDate__onceToken, block);
  }
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v6 = [v5 isDateInToday:v4];

  v7 = &stringWithDayNameAndShortMonthFromDate____todayFormatter;
  if (!v6) {
    v7 = &stringWithDayNameAndShortMonthFromDate____notTodayFormatter;
  }
  id v8 = [(id)*v7 stringFromDate:v4];

  return v8;
}

void __70__FIUIDateFormattingUtilities_stringWithDayNameAndShortMonthFromDate___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _localizedTodayFormatterWithTemplate:@"EEEEMMMdy"];
  v2 = (void *)stringWithDayNameAndShortMonthFromDate____todayFormatter;
  stringWithDayNameAndShortMonthFromDate____todayFormatter = v1;

  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  id v4 = (void *)stringWithDayNameAndShortMonthFromDate____notTodayFormatter;
  stringWithDayNameAndShortMonthFromDate____notTodayFormatter = (uint64_t)v3;

  id v5 = (void *)MEMORY[0x263F08790];
  int v6 = [MEMORY[0x263EFF960] currentLocale];
  id v7 = [v5 dateFormatFromTemplate:@"EEEEMMMdy" options:0 locale:v6];

  [(id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter setFormattingContext:2];
  [(id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter setDateFormat:v7];
  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____todayFormatter, "fu_observeTimeZoneAndLocaleChanges");
  objc_msgSend((id)stringWithDayNameAndShortMonthFromDate____notTodayFormatter, "fu_observeTimeZoneAndLocaleChanges");
}

@end