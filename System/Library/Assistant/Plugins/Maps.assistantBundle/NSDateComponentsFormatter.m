@interface NSDateComponentsFormatter
+ (id)_ma_sharedDateComponentsFormatter;
+ (id)_ma_sharedDateComponentsFormatterWithUnitStyle:(int64_t)a3;
@end

@implementation NSDateComponentsFormatter

+ (id)_ma_sharedDateComponentsFormatterWithUnitStyle:(int64_t)a3
{
  if (qword_55CA8 != -1) {
    dispatch_once(&qword_55CA8, &stru_307D8);
  }
  v4 = +[NSLocale _ma_locale];
  v5 = [v4 objectForKey:NSLocaleCalendar];
  [(id)qword_55CA0 setCalendar:v5];

  [(id)qword_55CA0 setUnitsStyle:a3];
  [(id)qword_55CA0 setAllowedUnits:96];
  v6 = (void *)qword_55CA0;

  return v6;
}

+ (id)_ma_sharedDateComponentsFormatter
{
  return objc_msgSend(a1, "_ma_sharedDateComponentsFormatterWithUnitStyle:", 2);
}

@end