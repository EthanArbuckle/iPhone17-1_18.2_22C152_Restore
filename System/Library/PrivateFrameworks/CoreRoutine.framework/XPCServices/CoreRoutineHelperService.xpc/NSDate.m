@interface NSDate
+ (NSDate)dateWithHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5;
+ (NSDate)dateWithResolution:(unint64_t)a3;
+ (NSDate)dateWithResolution:(unint64_t)a3 calendar:(id)a4;
+ (id)dateBisectingDate1:(id)a3 date2:(id)a4;
+ (id)dateFormatter;
+ (id)endOfDay;
+ (id)roundingUpDate:(id)a3 bucketDurationMinute:(int)a4;
+ (id)startOfDay;
+ (id)stringFromTimestamp:(double)a3;
- (BOOL)betweenDate:(id)a3 andDate:(id)a4;
- (BOOL)isAfterDate:(id)a3;
- (BOOL)isBeforeDate:(id)a3;
- (BOOL)isOnOrAfter:(id)a3;
- (BOOL)isOnOrBefore:(id)a3;
- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4;
- (id)dateByRoundingWithTimeQuantization:(int64_t)a3;
- (id)dateReducedToResolution:(unint64_t)a3;
- (id)dateReducedToResolution:(unint64_t)a3 calendar:(id)a4;
- (id)endOfDay;
- (id)getFormattedDateString;
- (id)startOfDay;
- (id)stringFromDate;
- (id)weekdayStringFromDate;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)weekday;
@end

@implementation NSDate

- (BOOL)betweenDate:(id)a3 andDate:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    [a3 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [(NSDate *)self timeIntervalSinceReferenceDate];
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

- (BOOL)isBeforeDate:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)isOnOrBefore:(id)a3
{
  return (id)[(NSDate *)self compare:a3] != (id)1;
}

- (BOOL)isAfterDate:(id)a3
{
  return (id)[(NSDate *)self compare:a3] == (id)1;
}

- (BOOL)isOnOrAfter:(id)a3
{
  return [(NSDate *)self compare:a3] != NSOrderedAscending;
}

+ (id)startOfDay
{
  v2 = [a1 date];
  v3 = [v2 startOfDay];

  return v3;
}

- (id)startOfDay
{
  v3 = +[NSCalendar currentCalendar];
  v4 = [v3 components:28 fromDate:self];

  v5 = +[NSCalendar currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

+ (id)endOfDay
{
  v2 = [a1 date];
  v3 = [v2 endOfDay];

  return v3;
}

- (id)endOfDay
{
  v3 = +[NSCalendar currentCalendar];
  v4 = [v3 components:28 fromDate:self];

  [v4 setHour:23];
  [v4 setMinute:59];
  [v4 setSecond:59];
  v5 = +[NSCalendar currentCalendar];
  v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (unint64_t)hour
{
  v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 component:32 fromDate:self];

  return (unint64_t)v4;
}

- (unint64_t)minute
{
  v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 component:64 fromDate:self];

  return (unint64_t)v4;
}

- (unint64_t)weekday
{
  v3 = +[NSCalendar currentCalendar];
  LOBYTE(self) = [v3 component:512 fromDate:self];

  return 1 << ((_BYTE)self - 1);
}

- (id)weekdayStringFromDate
{
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"EEEE"];
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  v5 = [v3 stringFromDate:self];

  return v5;
}

- (id)stringFromDate
{
  [(NSDate *)self timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  v5 = +[NSDate dateFormatter];
  v6 = [v5 stringFromDate:self];
  id v7 = +[NSString stringWithFormat:@"%f (%@)", v4, v6];

  return v7;
}

- (id)getFormattedDateString
{
  if (self)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    [v3 setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
    uint64_t v4 = +[NSTimeZone localTimeZone];
    [v3 setTimeZone:v4];

    v5 = [v3 stringFromDate:self];
  }
  else
  {
    v5 = @"-";
  }
  return v5;
}

+ (id)stringFromTimestamp:(double)a3
{
  id v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v4 = [v3 stringFromDate];

  return v4;
}

+ (id)dateFormatter
{
  if (qword_10002D4B0 != -1) {
    dispatch_once(&qword_10002D4B0, &stru_100024680);
  }
  v2 = (void *)qword_10002D4A8;
  return v2;
}

+ (NSDate)dateWithResolution:(unint64_t)a3
{
  uint64_t v4 = +[NSDate date];
  v5 = +[NSCalendar currentCalendar];
  v6 = [v4 dateReducedToResolution:a3 calendar:v5];

  return (NSDate *)v6;
}

+ (NSDate)dateWithResolution:(unint64_t)a3 calendar:(id)a4
{
  id v5 = a4;
  v6 = +[NSDate date];
  id v7 = [v6 dateReducedToResolution:a3 calendar:v5];

  return (NSDate *)v7;
}

- (id)dateReducedToResolution:(unint64_t)a3
{
  id v5 = +[NSCalendar currentCalendar];
  v6 = [(NSDate *)self dateReducedToResolution:a3 calendar:v5];

  return v6;
}

- (id)dateReducedToResolution:(unint64_t)a3 calendar:(id)a4
{
  id v6 = a4;
  if (a3 >= 7)
  {
    double v8 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218498;
      unint64_t v13 = a3;
      __int16 v14 = 2080;
      BOOL v15 = "-[NSDate(RTExtensions) dateReducedToResolution:calendar:]";
      __int16 v16 = 1024;
      int v17 = 180;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unhandled resolution, %lu (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = qword_1000192C8[a3];
  }
  double v9 = [v6 components:v7 fromDate:self];
  double v10 = [v6 dateFromComponents:v9];

  return v10;
}

- (id)dateByAddingUnit:(unint64_t)a3 value:(int64_t)a4
{
  uint64_t v7 = +[NSCalendar currentCalendar];
  double v8 = [v7 dateByAddingUnit:a3 value:a4 toDate:self options:0];

  return v8;
}

- (id)dateByRoundingWithTimeQuantization:(int64_t)a3
{
  id v3 = self;
  if (self)
  {
    id v5 = +[NSCalendar currentCalendar];
    id v6 = [v5 components:96 fromDate:v3];

    id v3 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)((uint64_t)objc_msgSend(v6, "minute") % a3) * -60.0);
  }
  return v3;
}

+ (NSDate)dateWithHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5
{
  double v8 = +[NSCalendar currentCalendar];
  double v9 = +[NSDate date];
  double v10 = [v8 components:28 fromDate:v9];

  [v10 setHour:a3];
  [v10 setMinute:a4];
  [v10 setSecond:a5];
  double v11 = [v8 dateFromComponents:v10];

  return (NSDate *)v11;
}

+ (id)dateBisectingDate1:(id)a3 date2:(id)a4
{
  id v5 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:(v7 + v9) * 0.5];
}

+ (id)roundingUpDate:(id)a3 bucketDurationMinute:(int)a4
{
  id v5 = a3;
  if (a4 <= 0)
  {
    double v6 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109634;
      v15[1] = a4;
      __int16 v16 = 2080;
      int v17 = "+[NSDate(RTExtensions) roundingUpDate:bucketDurationMinute:]";
      __int16 v18 = 1024;
      int v19 = 226;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "bucketDurationMinute should be greater than 0, %d (in %s:%d)", (uint8_t *)v15, 0x18u);
    }
  }
  double v7 = +[NSCalendar currentCalendar];
  double v8 = [v7 components:2097404 fromDate:v5];

  double v9 = +[NSCalendar currentCalendar];
  double v10 = [v9 components:2097276 fromDate:v5];

  float v11 = ceil(((float)(uint64_t)[v8 second] / 60.0 + (float)(uint64_t)objc_msgSend(v8, "minute")) / (double)a4);
  [v10 setMinute:(uint64_t)(float)((float)a4 * v11)];
  int v12 = +[NSCalendar currentCalendar];
  unint64_t v13 = [v12 dateFromComponents:v10];

  return v13;
}

@end