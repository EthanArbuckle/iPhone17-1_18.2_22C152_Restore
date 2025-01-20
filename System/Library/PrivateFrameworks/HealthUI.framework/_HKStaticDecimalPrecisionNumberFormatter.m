@interface _HKStaticDecimalPrecisionNumberFormatter
+ (id)formatterWithDecimalPrecision:(int64_t)a3;
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (int64_t)decimalPrecision;
- (void)setDecimalPrecision:(int64_t)a3;
@end

@implementation _HKStaticDecimalPrecisionNumberFormatter

+ (id)formatterWithDecimalPrecision:(int64_t)a3
{
  v4 = objc_alloc_init(_HKStaticDecimalPrecisionNumberFormatter);
  [(_HKStaticDecimalPrecisionNumberFormatter *)v4 setDecimalPrecision:a3];
  return v4;
}

- (void)setDecimalPrecision:(int64_t)a3
{
  self->_decimalPrecision = a3;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  int64_t decimalPrecision = self->_decimalPrecision;
  id v7 = a3;
  v8 = HKNumberFormatterWithDecimalPrecision(decimalPrecision, [a4 roundingMode]);
  v9 = [v8 stringFromNumber:v7];

  return v9;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (int64_t)decimalPrecision
{
  return self->_decimalPrecision;
}

@end