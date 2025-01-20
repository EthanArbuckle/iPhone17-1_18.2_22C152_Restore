@interface CALNDateStringUtils
+ (id)_allDayFormatter;
+ (id)_dateTimeFormatter;
+ (id)dateTimeStringForEventDate:(id)a3 alwaysIncludeDate:(BOOL)a4 allDayEvent:(BOOL)a5 dateProvider:(id)a6;
@end

@implementation CALNDateStringUtils

+ (id)dateTimeStringForEventDate:(id)a3 alwaysIncludeDate:(BOOL)a4 allDayEvent:(BOOL)a5 dateProvider:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  v10 = [a6 now];
  [v9 timeIntervalSinceDate:v10];
  if (a4 || v11 < 0.0 || v11 >= 43200.0)
  {
    v13 = objc_opt_class();
    if (v7) {
      [v13 _allDayFormatter];
    }
    else {
    v14 = [v13 _dateTimeFormatter];
    }
    v12 = [v14 stringFromDate:v9];
  }
  else
  {
    v12 = [MEMORY[0x263F08790] localizedStringFromDate:v9 dateStyle:0 timeStyle:1];
  }

  return v12;
}

+ (id)_allDayFormatter
{
  if (_allDayFormatter_onceToken != -1) {
    dispatch_once(&_allDayFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_allDayFormatter_allDayFormatter;
  return v2;
}

uint64_t __39__CALNDateStringUtils__allDayFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_allDayFormatter_allDayFormatter;
  _allDayFormatter_allDayFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)_allDayFormatter_allDayFormatter setLocale:v2];

  [(id)_allDayFormatter_allDayFormatter setDateStyle:3];
  [(id)_allDayFormatter_allDayFormatter setTimeStyle:0];
  v3 = (void *)_allDayFormatter_allDayFormatter;
  return [v3 setDoesRelativeDateFormatting:1];
}

+ (id)_dateTimeFormatter
{
  if (_dateTimeFormatter_onceToken != -1) {
    dispatch_once(&_dateTimeFormatter_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_dateTimeFormatter_dateTimeFormatter;
  return v2;
}

uint64_t __41__CALNDateStringUtils__dateTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateTimeFormatter_dateTimeFormatter;
  _dateTimeFormatter_dateTimeFormatter = (uint64_t)v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)_dateTimeFormatter_dateTimeFormatter setLocale:v2];

  [(id)_dateTimeFormatter_dateTimeFormatter setDateStyle:3];
  [(id)_dateTimeFormatter_dateTimeFormatter setTimeStyle:1];
  v3 = (void *)_dateTimeFormatter_dateTimeFormatter;
  return [v3 setDoesRelativeDateFormatting:1];
}

@end