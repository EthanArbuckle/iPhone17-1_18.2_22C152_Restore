@interface NSNumberFormatter
+ (id)_ma_localizedStringFromInteger:(int64_t)a3;
+ (id)_ma_sharedNumberFormatterWithStyle:(unint64_t)a3 fractionDigits:(unint64_t)a4;
@end

@implementation NSNumberFormatter

+ (id)_ma_sharedNumberFormatterWithStyle:(unint64_t)a3 fractionDigits:(unint64_t)a4
{
  if (qword_55CE8 != -1) {
    dispatch_once(&qword_55CE8, &stru_30858);
  }
  [(id)qword_55CE0 setNumberStyle:a3];
  [(id)qword_55CE0 setMinimumFractionDigits:a4];
  [(id)qword_55CE0 setMaximumFractionDigits:a4];
  v6 = (void *)qword_55CE0;
  v7 = +[NSLocale _ma_locale];
  [v6 setLocale:v7];

  v8 = (void *)qword_55CE0;

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