@interface NSDateFormatter
+ (id)_ma_sharedDateFormatter;
@end

@implementation NSDateFormatter

+ (id)_ma_sharedDateFormatter
{
  if (qword_55CB8 != -1) {
    dispatch_once(&qword_55CB8, &stru_307F8);
  }
  v2 = (void *)qword_55CB0;
  v3 = +[NSLocale _ma_locale];
  [v2 setLocale:v3];

  v4 = (void *)qword_55CB0;

  return v4;
}

@end