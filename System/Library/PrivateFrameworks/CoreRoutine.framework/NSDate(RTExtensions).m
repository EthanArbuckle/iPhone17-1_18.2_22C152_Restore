@interface NSDate(RTExtensions)
+ (id)dateFormatter;
+ (id)dateWithHour:()RTExtensions minute:second:;
+ (id)dateWithResolution:()RTExtensions;
+ (id)dateWithResolution:()RTExtensions calendar:;
+ (id)endOfDay;
+ (id)roundingUpDate:()RTExtensions bucketDurationMinute:;
+ (id)startOfDay;
+ (id)stringFromTimestamp:()RTExtensions;
+ (uint64_t)dateBisectingDate1:()RTExtensions date2:;
- (BOOL)betweenDate:()RTExtensions andDate:;
- (BOOL)isAfterDate:()RTExtensions;
- (BOOL)isBeforeDate:()RTExtensions;
- (BOOL)isOnOrAfter:()RTExtensions;
- (BOOL)isOnOrBefore:()RTExtensions;
- (__CFString)getFormattedDateString;
- (id)dateByAddingUnit:()RTExtensions value:;
- (id)dateByRoundingWithTimeQuantization:()RTExtensions;
- (id)dateReducedToResolution:()RTExtensions;
- (id)dateReducedToResolution:()RTExtensions calendar:;
- (id)endOfDay;
- (id)startOfDay;
- (id)stringFromDate;
- (id)weekdayStringFromDate;
- (uint64_t)hour;
- (uint64_t)minute;
- (uint64_t)weekday;
@end

@implementation NSDate(RTExtensions)

- (BOOL)isOnOrAfter:()RTExtensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)isOnOrBefore:()RTExtensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

+ (id)stringFromTimestamp:()RTExtensions
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  v1 = [v0 stringFromDate];

  return v1;
}

- (id)stringFromDate
{
  v2 = NSString;
  [a1 timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  v5 = [MEMORY[0x1E4F1C9C8] dateFormatter];
  v6 = [v5 stringFromDate:a1];
  v7 = [v2 stringWithFormat:@"%f (%@)", v4, v6];

  return v7;
}

+ (id)dateFormatter
{
  if (qword_1EB472190 != -1) {
    dispatch_once(&qword_1EB472190, &__block_literal_global_6);
  }
  v0 = (void *)_MergedGlobals_10;
  return v0;
}

- (BOOL)betweenDate:()RTExtensions andDate:
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    [a3 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [a1 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [v7 timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v9 <= v13)
    {
      BOOL v14 = v9 <= v11;
      BOOL v15 = v11 > v13;
    }
    else
    {
      BOOL v14 = v13 <= v11;
      BOOL v15 = v11 > v9;
    }
    return !v15 && v14;
  }
  return result;
}

- (BOOL)isBeforeDate:()RTExtensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isAfterDate:()RTExtensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

+ (id)startOfDay
{
  v1 = [a1 date];
  v2 = [v1 startOfDay];

  return v2;
}

- (id)startOfDay
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:28 fromDate:a1];

  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 dateFromComponents:v3];

  return v5;
}

+ (id)endOfDay
{
  v1 = [a1 date];
  v2 = [v1 endOfDay];

  return v2;
}

- (id)endOfDay
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 components:28 fromDate:a1];

  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 dateFromComponents:v3];

  return v5;
}

- (uint64_t)hour
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 component:32 fromDate:a1];

  return v3;
}

- (uint64_t)minute
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [v2 component:64 fromDate:a1];

  return v3;
}

- (uint64_t)weekday
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  LOBYTE(a1) = [v2 component:512 fromDate:a1];

  return 1 << (a1 - 1);
}

- (id)weekdayStringFromDate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"EEEE"];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  uint64_t v4 = [v2 stringFromDate:a1];

  return v4;
}

- (__CFString)getFormattedDateString
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
    uint64_t v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v2 setTimeZone:v3];

    uint64_t v4 = [v2 stringFromDate:a1];
  }
  else
  {
    uint64_t v4 = @"-";
  }
  return v4;
}

+ (id)dateWithResolution:()RTExtensions
{
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v4 dateReducedToResolution:a3 calendar:v5];

  return v6;
}

+ (id)dateWithResolution:()RTExtensions calendar:
{
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  id v7 = [v5 date];
  double v8 = [v7 dateReducedToResolution:a3 calendar:v6];

  return v8;
}

- (id)dateReducedToResolution:()RTExtensions
{
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [a1 dateReducedToResolution:a3 calendar:v5];

  return v6;
}

- (id)dateReducedToResolution:()RTExtensions calendar:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 >= 7)
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218498;
      unint64_t v13 = a3;
      __int16 v14 = 2080;
      BOOL v15 = "-[NSDate(RTExtensions) dateReducedToResolution:calendar:]";
      __int16 v16 = 1024;
      int v17 = 180;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "Unhandled resolution, %lu (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = qword_1A90371C8[a3];
  }
  double v9 = [v6 components:v7 fromDate:a1];
  double v10 = [v6 dateFromComponents:v9];

  return v10;
}

- (id)dateByAddingUnit:()RTExtensions value:
{
  uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v8 = [v7 dateByAddingUnit:a3 value:a4 toDate:a1 options:0];

  return v8;
}

- (id)dateByRoundingWithTimeQuantization:()RTExtensions
{
  id v3 = a1;
  if (a1)
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v6 = [v5 components:96 fromDate:v3];

    objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(objc_msgSend(v6, "minute") % a3) * -60.0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)dateWithHour:()RTExtensions minute:second:
{
  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [MEMORY[0x1E4F1C9C8] date];
  double v10 = [v8 components:28 fromDate:v9];

  [v10 setHour:a3];
  [v10 setMinute:a4];
  [v10 setSecond:a5];
  double v11 = [v8 dateFromComponents:v10];

  return v11;
}

+ (uint64_t)dateBisectingDate1:()RTExtensions date2:
{
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return [v5 dateWithTimeIntervalSinceReferenceDate:(v8 + v10) * 0.5];
}

+ (id)roundingUpDate:()RTExtensions bucketDurationMinute:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 <= 0)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109634;
      v15[1] = a4;
      __int16 v16 = 2080;
      int v17 = "+[NSDate(RTExtensions) roundingUpDate:bucketDurationMinute:]";
      __int16 v18 = 1024;
      int v19 = 226;
      _os_log_error_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_ERROR, "bucketDurationMinute should be greater than 0, %d (in %s:%d)", (uint8_t *)v15, 0x18u);
    }
  }
  double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v8 = [v7 components:2097404 fromDate:v5];

  double v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v10 = [v9 components:2097276 fromDate:v5];

  float v11 = ceil(((float)[v8 second] / 60.0 + (float)objc_msgSend(v8, "minute")) / (double)a4);
  [v10 setMinute:(uint64_t)(float)((float)a4 * v11)];
  int v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v13 = [v12 dateFromComponents:v10];

  return v13;
}

@end