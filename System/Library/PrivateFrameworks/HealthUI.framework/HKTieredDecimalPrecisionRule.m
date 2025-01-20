@interface HKTieredDecimalPrecisionRule
+ (id)numberFormatter;
+ (id)percentageFormatter;
- (id)numberFormatter;
- (int64_t)decimalPrecisionForValue:(double)a3;
- (int64_t)maximumDecimalPrecision;
- (int64_t)minimumDecimalPrecision;
@end

@implementation HKTieredDecimalPrecisionRule

+ (id)percentageFormatter
{
  return +[_HKTieredDecimalPrecisionPercentageFormatter sharedInstance];
}

+ (id)numberFormatter
{
  return +[_HKTieredDecimalPrecisionNumberFormatter sharedInstance];
}

- (int64_t)minimumDecimalPrecision
{
  return 0;
}

- (int64_t)maximumDecimalPrecision
{
  return 2;
}

- (int64_t)decimalPrecisionForValue:(double)a3
{
  if (a3 >= 1.0) {
    return a3 < 100.0;
  }
  else {
    return 2;
  }
}

- (id)numberFormatter
{
  v2 = objc_opt_class();
  return (id)[v2 numberFormatter];
}

@end