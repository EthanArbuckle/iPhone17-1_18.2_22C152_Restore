@interface HKJulianIndexedSevenDayQuantitySeriesAxisLabel
- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4;
- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4 type:(int64_t)a5;
- (NSString)text;
- (double)location;
- (int64_t)type;
@end

@implementation HKJulianIndexedSevenDayQuantitySeriesAxisLabel

- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4
{
  return [(HKJulianIndexedSevenDayQuantitySeriesAxisLabel *)self initWithText:a3 location:1 type:a4];
}

- (HKJulianIndexedSevenDayQuantitySeriesAxisLabel)initWithText:(id)a3 location:(double)a4 type:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKJulianIndexedSevenDayQuantitySeriesAxisLabel;
  v10 = [(HKJulianIndexedSevenDayQuantitySeriesAxisLabel *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_location = a4;
    v11->_type = a5;
  }

  return v11;
}

- (double)location
{
  return self->_location;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end