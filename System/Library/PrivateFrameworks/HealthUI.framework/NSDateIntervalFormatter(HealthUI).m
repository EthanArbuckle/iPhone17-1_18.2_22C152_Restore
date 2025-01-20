@interface NSDateIntervalFormatter(HealthUI)
+ (id)hk_dateTimeDateIntervalFormatter;
+ (id)hk_dayIntervalFormatter;
+ (id)hk_hourDateIntervalFormatter;
+ (id)hk_hourDateIntervalWithDateFormatter;
+ (id)hk_hourMinuteOnlyDateIntervalFormatter;
+ (id)hk_hourOnlyDateIntervalFormatter;
+ (id)hk_mediumDateStyleIntervalFormatter;
+ (id)hk_mediumMonthDayDateIntervalFormatter;
+ (id)hk_monthDayYearIntervalFormatter;
+ (id)hk_monthIntervalFormatter;
+ (id)hk_monthYearIntervalFormatter;
+ (id)hk_yearIntervalFormatter;
@end

@implementation NSDateIntervalFormatter(HealthUI)

+ (id)hk_hourDateIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_594);
}

+ (id)hk_hourDateIntervalWithDateFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_602);
}

+ (id)hk_hourOnlyDateIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_610);
}

+ (id)hk_hourMinuteOnlyDateIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_615);
}

+ (id)hk_dateTimeDateIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_623);
}

+ (id)hk_dayIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_631);
}

+ (id)hk_monthIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_636);
}

+ (id)hk_yearIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_641);
}

+ (id)hk_monthDayYearIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_646);
}

+ (id)hk_monthYearIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_651);
}

+ (id)hk_mediumMonthDayDateIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_656);
}

+ (id)hk_mediumDateStyleIntervalFormatter
{
  return _performNSDateFormatterInitializationBlock(&__block_literal_global_661);
}

@end