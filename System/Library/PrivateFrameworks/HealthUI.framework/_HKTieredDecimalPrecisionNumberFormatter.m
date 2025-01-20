@interface _HKTieredDecimalPrecisionNumberFormatter
+ (id)sharedInstance;
- (BOOL)returnsUnitWithValueForDisplay;
- (id)_numberFormatterForNumber:(id)a3 displayType:(id)a4;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (unint64_t)style;
@end

@implementation _HKTieredDecimalPrecisionNumberFormatter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)sharedInstance_numberFormatter;
  return v2;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (unint64_t)style
{
  return 1;
}

- (id)_numberFormatterForNumber:(id)a3 displayType:(id)a4
{
  id v6 = a4;
  [a3 doubleValue];
  double v8 = v7;
  if (v7 >= 1.0)
  {
    uint64_t v9 = [v6 roundingMode];
    uint64_t v10 = [(_HKTieredDecimalPrecisionNumberFormatter *)self style];
    uint64_t v11 = v8 < 100.0;
  }
  else
  {
    uint64_t v9 = [v6 roundingMode];
    uint64_t v10 = [(_HKTieredDecimalPrecisionNumberFormatter *)self style];
    uint64_t v11 = 2;
  }
  v12 = HKNumberFormatterWithDecimalPrecisionAndStyle(v11, v9, v10);

  return v12;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7 = a3;
  double v8 = [(_HKTieredDecimalPrecisionNumberFormatter *)self _numberFormatterForNumber:v7 displayType:a4];
  uint64_t v9 = [v8 stringFromNumber:v7];

  return v9;
}

@end