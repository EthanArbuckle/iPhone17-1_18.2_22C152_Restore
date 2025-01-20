@interface HKTieredDecimalPrecisionPercentageFormatter
@end

@implementation HKTieredDecimalPrecisionPercentageFormatter

uint64_t __62___HKTieredDecimalPrecisionPercentageFormatter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_HKTieredDecimalPrecisionPercentageFormatter);
  uint64_t v1 = sharedInstance_numberFormatter_357;
  sharedInstance_numberFormatter_357 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end