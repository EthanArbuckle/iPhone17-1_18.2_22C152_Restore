@interface NSMeasurementFormatter
+ (id)_ma_distanceStringWithValue:(double)a3 unit:(id)a4 style:(int64_t)a5;
+ (id)_ma_sharedMeasurementFormatterWithFractionDigits:(unint64_t)a3 unitOptions:(unint64_t)a4 style:(int64_t)a5;
@end

@implementation NSMeasurementFormatter

+ (id)_ma_sharedMeasurementFormatterWithFractionDigits:(unint64_t)a3 unitOptions:(unint64_t)a4 style:(int64_t)a5
{
  if (qword_51B60 != -1) {
    dispatch_once(&qword_51B60, &stru_3D088);
  }
  v8 = +[NSLocale _ma_locale];
  [(id)qword_51B58 setLocale:v8];

  v9 = +[NSNumberFormatter _ma_sharedNumberFormatterWithStyle:1 fractionDigits:a3];
  [(id)qword_51B58 setNumberFormatter:v9];

  [(id)qword_51B58 setUnitOptions:a4];
  [(id)qword_51B58 setUnitStyle:a5];
  v10 = (void *)qword_51B58;

  return v10;
}

+ (id)_ma_distanceStringWithValue:(double)a3 unit:(id)a4 style:(int64_t)a5
{
  id v8 = a4;
  v9 = objc_msgSend(a1, "_ma_sharedMeasurementFormatterWithFractionDigits:unitOptions:style:", a3 < 10.0, 1, a5);
  id v10 = [objc_alloc((Class)NSMeasurement) initWithDoubleValue:v8 unit:a3];

  v11 = [v9 stringFromMeasurement:v10];

  return v11;
}

@end