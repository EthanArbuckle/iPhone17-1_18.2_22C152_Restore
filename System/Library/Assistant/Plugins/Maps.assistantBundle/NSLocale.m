@interface NSLocale
+ (id)_ma_locale;
@end

@implementation NSLocale

+ (id)_ma_locale
{
  if (qword_55CC8 != -1) {
    dispatch_once(&qword_55CC8, &stru_30818);
  }
  v2 = (void *)qword_55CC0;

  return v2;
}

@end