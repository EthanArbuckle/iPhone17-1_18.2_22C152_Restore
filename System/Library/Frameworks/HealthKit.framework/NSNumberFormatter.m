@interface NSNumberFormatter
@end

@implementation NSNumberFormatter

uint64_t __55__NSNumberFormatter_HealthKit__hk_wholeNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)hk_wholeNumberFormatter__formatter;
  hk_wholeNumberFormatter__formatter = (uint64_t)v0;

  [(id)hk_wholeNumberFormatter__formatter setNumberStyle:0];
  [(id)hk_wholeNumberFormatter__formatter setRoundingMode:6];
  v2 = (void *)hk_wholeNumberFormatter__formatter;

  return [v2 setMaximumFractionDigits:0];
}

uint64_t __57__NSNumberFormatter_HealthKit__hk_percentNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)hk_percentNumberFormatter__formatter;
  hk_percentNumberFormatter__formatter = (uint64_t)v0;

  v2 = (void *)hk_percentNumberFormatter__formatter;

  return [v2 setNumberStyle:3];
}

uint64_t __64__NSNumberFormatter_HealthKit__hk_percentDecimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)hk_percentDecimalNumberFormatter__formatter;
  hk_percentDecimalNumberFormatter__formatter = (uint64_t)v0;

  [(id)hk_percentDecimalNumberFormatter__formatter setNumberStyle:1];
  [(id)hk_percentDecimalNumberFormatter__formatter setMaximumFractionDigits:0];
  v2 = (void *)hk_percentDecimalNumberFormatter__formatter;

  return [v2 setMultiplier:&unk_1EECE1C70];
}

@end