@interface NSDateComponentsFormatter
+ (id)_ma_sharedDateComponentsFormatter;
+ (id)_ma_sharedDateComponentsFormatterWithUnitStyle:(int64_t)a3;
+ (id)_maps_stringFromTimeInterval:(double)a3;
+ (id)_maps_stringLongFromTimeInterval:(double)a3;
@end

@implementation NSDateComponentsFormatter

+ (id)_ma_sharedDateComponentsFormatterWithUnitStyle:(int64_t)a3
{
  if (qword_51B30 != -1) {
    dispatch_once(&qword_51B30, &stru_3D028);
  }
  v4 = +[NSLocale _ma_locale];
  v5 = [v4 objectForKey:NSLocaleCalendar];
  [(id)qword_51B28 setCalendar:v5];

  [(id)qword_51B28 setUnitsStyle:a3];
  [(id)qword_51B28 setAllowedUnits:96];
  v6 = (void *)qword_51B28;

  return v6;
}

+ (id)_ma_sharedDateComponentsFormatter
{
  return objc_msgSend(a1, "_ma_sharedDateComponentsFormatterWithUnitStyle:", 2);
}

+ (id)_maps_stringFromTimeInterval:(double)a3
{
  if (qword_51BF0 != -1) {
    dispatch_once(&qword_51BF0, &stru_3D3B0);
  }
  v4 = (void *)qword_51BE8;

  return [v4 stringFromTimeInterval:a3];
}

+ (id)_maps_stringLongFromTimeInterval:(double)a3
{
  if (qword_51C00 != -1) {
    dispatch_once(&qword_51C00, &stru_3D3D0);
  }
  v4 = (void *)qword_51BF8;

  return [v4 stringFromTimeInterval:a3];
}

@end