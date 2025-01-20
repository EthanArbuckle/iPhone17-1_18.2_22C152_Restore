@interface _HKTieredDecimalPrecisionPercentageFormatter
+ (id)sharedInstance;
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (unint64_t)style;
@end

@implementation _HKTieredDecimalPrecisionPercentageFormatter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_358 != -1) {
    dispatch_once(&sharedInstance_onceToken_358, &__block_literal_global_360);
  }
  v2 = (void *)sharedInstance_numberFormatter_357;
  return v2;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (unint64_t)style
{
  return 3;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7 = a3;
  v8 = [(_HKTieredDecimalPrecisionNumberFormatter *)self _numberFormatterForNumber:v7 displayType:a4];
  v9 = NSNumber;
  [v7 doubleValue];
  double v11 = v10;

  v12 = [v9 numberWithDouble:v11];
  v13 = [v8 stringFromNumber:v12];

  return v13;
}

@end