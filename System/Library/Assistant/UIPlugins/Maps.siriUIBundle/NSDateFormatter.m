@interface NSDateFormatter
+ (id)_ma_sharedDateFormatter;
+ (id)_maps_abbreviatedDateStringWithoutYearForDate:(id)a3;
+ (id)_maps_abbreviatedWeekdayForDate:(id)a3;
+ (id)_maps_dateStringWithoutYearForDate:(id)a3;
+ (id)_maps_numericMonthDayString:(id)a3;
+ (id)_maps_timeForDate:(id)a3;
+ (id)_maps_timeForDate:(id)a3 timeZone:(id)a4;
+ (id)_maps_weekdayForDate:(id)a3;
@end

@implementation NSDateFormatter

+ (id)_ma_sharedDateFormatter
{
  if (qword_51B40 != -1) {
    dispatch_once(&qword_51B40, &stru_3D048);
  }
  v2 = (void *)qword_51B38;
  v3 = +[NSLocale _ma_locale];
  [v2 setLocale:v3];

  v4 = (void *)qword_51B38;

  return v4;
}

+ (id)_maps_timeForDate:(id)a3
{
  uint64_t v3 = qword_51B80;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51B80, &stru_3D2D0);
  }
  v5 = [(id)qword_51B78 stringFromDate:v4];

  return v5;
}

+ (id)_maps_timeForDate:(id)a3 timeZone:(id)a4
{
  uint64_t v5 = qword_51B90;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_51B90, &stru_3D2F0);
  }
  [(id)qword_51B88 setTimeZone:v6];

  v8 = [(id)qword_51B88 stringFromDate:v7];

  return v8;
}

+ (id)_maps_abbreviatedWeekdayForDate:(id)a3
{
  uint64_t v3 = qword_51BA0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51BA0, &stru_3D310);
  }
  [(id)qword_51B98 setLocalizedDateFormatFromTemplate:@"E"];
  uint64_t v5 = [(id)qword_51B98 stringFromDate:v4];

  return v5;
}

+ (id)_maps_weekdayForDate:(id)a3
{
  uint64_t v3 = qword_51BB0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51BB0, &stru_3D330);
  }
  [(id)qword_51BA8 setLocalizedDateFormatFromTemplate:@"EEEE"];
  uint64_t v5 = [(id)qword_51BA8 stringFromDate:v4];

  return v5;
}

+ (id)_maps_dateStringWithoutYearForDate:(id)a3
{
  uint64_t v3 = qword_51BC0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51BC0, &stru_3D350);
  }
  [(id)qword_51BB8 setLocalizedDateFormatFromTemplate:@"MMMMd"];
  uint64_t v5 = [(id)qword_51BB8 stringFromDate:v4];

  return v5;
}

+ (id)_maps_abbreviatedDateStringWithoutYearForDate:(id)a3
{
  uint64_t v3 = qword_51BD0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51BD0, &stru_3D370);
  }
  [(id)qword_51BC8 setLocalizedDateFormatFromTemplate:@"MMMd"];
  uint64_t v5 = [(id)qword_51BC8 stringFromDate:v4];

  return v5;
}

+ (id)_maps_numericMonthDayString:(id)a3
{
  uint64_t v3 = qword_51BE0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_51BE0, &stru_3D390);
  }
  [(id)qword_51BD8 setLocalizedDateFormatFromTemplate:@"Md"];
  uint64_t v5 = [(id)qword_51BD8 stringFromDate:v4];

  return v5;
}

@end