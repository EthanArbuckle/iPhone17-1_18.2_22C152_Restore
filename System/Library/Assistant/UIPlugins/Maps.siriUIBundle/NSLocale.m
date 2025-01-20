@interface NSLocale
+ (id)_ma_locale;
@end

@implementation NSLocale

+ (id)_ma_locale
{
  if (qword_51B50 != -1) {
    dispatch_once(&qword_51B50, &stru_3D068);
  }
  v2 = (void *)qword_51B48;

  return v2;
}

@end