@interface NSDate(GEOCelestial)
+ (id)_geo_calendar;
+ (uint64_t)geo_dateWithJulianDay:()GEOCelestial;
- (double)geo_hoursAndMinutes;
- (double)geo_julianDay;
@end

@implementation NSDate(GEOCelestial)

+ (uint64_t)geo_dateWithJulianDay:()GEOCelestial
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(a1 + -2440587.5) * 86400.0];
}

- (double)geo_julianDay
{
  [a1 timeIntervalSince1970];
  return v1 / 86400.0 + 2440587.5;
}

- (double)geo_hoursAndMinutes
{
  v2 = objc_msgSend((id)objc_opt_class(), "_geo_calendar");
  v3 = [v2 components:96 fromDate:a1];

  double v4 = (double)[v3 hour];
  double v5 = (double)[v3 minute] / 60.0 + v4;

  return v5;
}

+ (id)_geo_calendar
{
  if (qword_1EB29F478 != -1) {
    dispatch_once(&qword_1EB29F478, &__block_literal_global_5);
  }
  v0 = (void *)_MergedGlobals_180;

  return v0;
}

@end