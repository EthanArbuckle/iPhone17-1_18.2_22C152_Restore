@interface NSNumberFormatter
+ (id)_ma_localizedStringFromInteger:(int64_t)a3;
+ (id)_ma_sharedNumberFormatterWithStyle:(unint64_t)a3 fractionDigits:(unint64_t)a4;
@end

@implementation NSNumberFormatter

+ (id)_ma_sharedNumberFormatterWithStyle:(unint64_t)a3 fractionDigits:(unint64_t)a4
{
  if (qword_51B70 != -1) {
    dispatch_once(&qword_51B70, &stru_3D0A8);
  }
  [(id)qword_51B68 setNumberStyle:a3];
  [(id)qword_51B68 setMinimumFractionDigits:a4];
  [(id)qword_51B68 setMaximumFractionDigits:a4];
  v6 = (void *)qword_51B68;
  v7 = +[NSLocale _ma_locale];
  [v6 setLocale:v7];

  v8 = (void *)qword_51B68;

  return v8;
}

+ (id)_ma_localizedStringFromInteger:(int64_t)a3
{
  v4 = +[NSNumberFormatter _ma_sharedNumberFormatterWithStyle:0 fractionDigits:0];
  v5 = +[NSNumber numberWithInteger:a3];
  v6 = [v4 stringFromNumber:v5];

  return v6;
}

@end