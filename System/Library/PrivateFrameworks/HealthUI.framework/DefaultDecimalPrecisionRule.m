@interface DefaultDecimalPrecisionRule
@end

@implementation DefaultDecimalPrecisionRule

uint64_t ___DefaultDecimalPrecisionRule_block_invoke()
{
  _DefaultDecimalPrecisionRule_defaultPrecisionRule = [[HKStaticDecimalPrecisionRule alloc] initWithDecimalPrecision:2];
  return MEMORY[0x1F41817F8]();
}

@end