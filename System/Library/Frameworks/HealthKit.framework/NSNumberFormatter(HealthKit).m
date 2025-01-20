@interface NSNumberFormatter(HealthKit)
+ (id)hk_percentDecimalNumberFormatter;
+ (id)hk_percentNumberFormatter;
+ (id)hk_wholeNumberFormatter;
@end

@implementation NSNumberFormatter(HealthKit)

+ (id)hk_wholeNumberFormatter
{
  if (hk_wholeNumberFormatter_onceToken != -1) {
    dispatch_once(&hk_wholeNumberFormatter_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)hk_wholeNumberFormatter__formatter;

  return v0;
}

+ (id)hk_percentNumberFormatter
{
  if (hk_percentNumberFormatter_onceToken != -1) {
    dispatch_once(&hk_percentNumberFormatter_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)hk_percentNumberFormatter__formatter;

  return v0;
}

+ (id)hk_percentDecimalNumberFormatter
{
  if (hk_percentDecimalNumberFormatter_onceToken != -1) {
    dispatch_once(&hk_percentDecimalNumberFormatter_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)hk_percentDecimalNumberFormatter__formatter;

  return v0;
}

@end