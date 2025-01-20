@interface NSDateIntervalFormatter
@end

@implementation NSDateIntervalFormatter

id __65__NSDateIntervalFormatter_HealthUI__hk_hourDateIntervalFormatter__block_invoke()
{
  if (!__hourDateIntervalFormatter)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v1 = (void *)__hourDateIntervalFormatter;
    __hourDateIntervalFormatter = (uint64_t)v0;

    v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__hourDateIntervalFormatter setLocale:v2];

    [(id)__hourDateIntervalFormatter setBoundaryStyle:2];
    v3 = [(id)__hourDateIntervalFormatter locale];
    int v4 = objc_msgSend(v3, "hk_isIn24HourTime");

    if (v4) {
      v5 = @"HH";
    }
    else {
      v5 = @"hh";
    }
    [(id)__hourDateIntervalFormatter setDateTemplate:v5];
  }
  v6 = (void *)__hourDateIntervalFormatter;
  return v6;
}

id __73__NSDateIntervalFormatter_HealthUI__hk_hourDateIntervalWithDateFormatter__block_invoke()
{
  if (!__hourDateIntervalWithDayFormatter)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v1 = (void *)__hourDateIntervalWithDayFormatter;
    __hourDateIntervalWithDayFormatter = (uint64_t)v0;

    v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__hourDateIntervalWithDayFormatter setLocale:v2];

    [(id)__hourDateIntervalWithDayFormatter setBoundaryStyle:2];
    v3 = [(id)__hourDateIntervalWithDayFormatter locale];
    int v4 = objc_msgSend(v3, "hk_isIn24HourTime");

    if (v4) {
      v5 = @"MMMdHH";
    }
    else {
      v5 = @"MMMdhh";
    }
    [(id)__hourDateIntervalWithDayFormatter setDateTemplate:v5];
  }
  v6 = (void *)__hourDateIntervalWithDayFormatter;
  return v6;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_hourOnlyDateIntervalFormatter__block_invoke()
{
  if (!__hourOnlyDateIntervalFormatter)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v1 = (void *)__hourOnlyDateIntervalFormatter;
    __hourOnlyDateIntervalFormatter = (uint64_t)v0;

    v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__hourOnlyDateIntervalFormatter setLocale:v2];

    [(id)__hourOnlyDateIntervalFormatter setBoundaryStyle:2];
    v3 = [(id)__hourOnlyDateIntervalFormatter locale];
    int v4 = objc_msgSend(v3, "hk_isIn24HourTime");

    if (v4) {
      v5 = @"H";
    }
    else {
      v5 = @"h";
    }
    [(id)__hourOnlyDateIntervalFormatter setDateTemplate:v5];
  }
  v6 = (void *)__hourOnlyDateIntervalFormatter;
  return v6;
}

id __75__NSDateIntervalFormatter_HealthUI__hk_hourMinuteOnlyDateIntervalFormatter__block_invoke()
{
  if (!__hourMinuteOnlyDateIntervalFormatter)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v1 = (void *)__hourMinuteOnlyDateIntervalFormatter;
    __hourMinuteOnlyDateIntervalFormatter = (uint64_t)v0;

    v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__hourMinuteOnlyDateIntervalFormatter setLocale:v2];

    [(id)__hourMinuteOnlyDateIntervalFormatter setBoundaryStyle:2];
    v3 = [(id)__hourMinuteOnlyDateIntervalFormatter locale];
    int v4 = objc_msgSend(v3, "hk_isIn24HourTime");

    if (v4) {
      v5 = @"H:mm a";
    }
    else {
      v5 = @"h:mm a";
    }
    [(id)__hourMinuteOnlyDateIntervalFormatter setDateTemplate:v5];
  }
  v6 = (void *)__hourMinuteOnlyDateIntervalFormatter;
  return v6;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_dateTimeDateIntervalFormatter__block_invoke()
{
  if (!__dateTimeDateIntervalFormatter)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v1 = (void *)__dateTimeDateIntervalFormatter;
    __dateTimeDateIntervalFormatter = (uint64_t)v0;

    v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__dateTimeDateIntervalFormatter setLocale:v2];

    v3 = [(id)__dateTimeDateIntervalFormatter locale];
    int v4 = objc_msgSend(v3, "hk_isIn24HourTime");

    if (v4) {
      v5 = @"MMM d y H:mm a";
    }
    else {
      v5 = @"MMM d y h:mm a";
    }
    [(id)__dateTimeDateIntervalFormatter setDateTemplate:v5];
  }
  v6 = (void *)__dateTimeDateIntervalFormatter;
  return v6;
}

id __60__NSDateIntervalFormatter_HealthUI__hk_dayIntervalFormatter__block_invoke()
{
  id v0 = (void *)__dayDateIntervalFormatter;
  if (!__dayDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__dayDateIntervalFormatter;
    __dayDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__dayDateIntervalFormatter setLocale:v3];

    [(id)__dayDateIntervalFormatter setDateTemplate:@"MMM d y"];
    id v0 = (void *)__dayDateIntervalFormatter;
  }
  return v0;
}

id __62__NSDateIntervalFormatter_HealthUI__hk_monthIntervalFormatter__block_invoke()
{
  id v0 = (void *)__monthDateIntervalFormatter;
  if (!__monthDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__monthDateIntervalFormatter;
    __monthDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__monthDateIntervalFormatter setLocale:v3];

    [(id)__monthDateIntervalFormatter setDateTemplate:@"MMM y"];
    id v0 = (void *)__monthDateIntervalFormatter;
  }
  return v0;
}

id __61__NSDateIntervalFormatter_HealthUI__hk_yearIntervalFormatter__block_invoke()
{
  id v0 = (void *)__yearDateIntervalFormatter;
  if (!__yearDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__yearDateIntervalFormatter;
    __yearDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__yearDateIntervalFormatter setLocale:v3];

    [(id)__yearDateIntervalFormatter setDateTemplate:@"y"];
    id v0 = (void *)__yearDateIntervalFormatter;
  }
  return v0;
}

id __69__NSDateIntervalFormatter_HealthUI__hk_monthDayYearIntervalFormatter__block_invoke()
{
  id v0 = (void *)__monthDayYearDateIntervalFormatter;
  if (!__monthDayYearDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__monthDayYearDateIntervalFormatter;
    __monthDayYearDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__monthDayYearDateIntervalFormatter setLocale:v3];

    [(id)__monthDayYearDateIntervalFormatter setDateTemplate:@"MM/d/yy"];
    id v0 = (void *)__monthDayYearDateIntervalFormatter;
  }
  return v0;
}

id __66__NSDateIntervalFormatter_HealthUI__hk_monthYearIntervalFormatter__block_invoke()
{
  id v0 = (void *)__monthYearDateIntervalFormatter;
  if (!__monthYearDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__monthYearDateIntervalFormatter;
    __monthYearDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__monthYearDateIntervalFormatter setLocale:v3];

    [(id)__monthYearDateIntervalFormatter setDateTemplate:@"MM/yy"];
    id v0 = (void *)__monthYearDateIntervalFormatter;
  }
  return v0;
}

id __75__NSDateIntervalFormatter_HealthUI__hk_mediumMonthDayDateIntervalFormatter__block_invoke()
{
  id v0 = (void *)__mediumMonthDayDateIntervalFormatter;
  if (!__mediumMonthDayDateIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__mediumMonthDayDateIntervalFormatter;
    __mediumMonthDayDateIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__mediumMonthDayDateIntervalFormatter setLocale:v3];

    [(id)__mediumMonthDayDateIntervalFormatter setDateTemplate:@"MMMd"];
    id v0 = (void *)__mediumMonthDayDateIntervalFormatter;
  }
  return v0;
}

id __72__NSDateIntervalFormatter_HealthUI__hk_mediumDateStyleIntervalFormatter__block_invoke()
{
  id v0 = (void *)__mediumDateStyleIntervalFormatter;
  if (!__mediumDateStyleIntervalFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    v2 = (void *)__mediumDateStyleIntervalFormatter;
    __mediumDateStyleIntervalFormatter = (uint64_t)v1;

    v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableAutoupdatingCurrentLocale");
    [(id)__mediumDateStyleIntervalFormatter setLocale:v3];

    [(id)__mediumDateStyleIntervalFormatter setDateStyle:2];
    [(id)__mediumDateStyleIntervalFormatter setTimeStyle:0];
    id v0 = (void *)__mediumDateStyleIntervalFormatter;
  }
  return v0;
}

@end