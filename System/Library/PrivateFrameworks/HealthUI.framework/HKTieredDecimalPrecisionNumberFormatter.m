@interface HKTieredDecimalPrecisionNumberFormatter
@end

@implementation HKTieredDecimalPrecisionNumberFormatter

uint64_t __58___HKTieredDecimalPrecisionNumberFormatter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_HKTieredDecimalPrecisionNumberFormatter);
  uint64_t v1 = sharedInstance_numberFormatter;
  sharedInstance_numberFormatter = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end