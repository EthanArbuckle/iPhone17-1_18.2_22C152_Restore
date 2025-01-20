@interface PercentNumberFormatter
@end

@implementation PercentNumberFormatter

uint64_t ___PercentNumberFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_PercentNumberFormatter___formatter;
  _PercentNumberFormatter___formatter = (uint64_t)v0;

  [(id)_PercentNumberFormatter___formatter setRoundingMode:2];
  [(id)_PercentNumberFormatter___formatter setNumberStyle:3];
  v2 = (void *)_PercentNumberFormatter___formatter;
  return [v2 setMaximumFractionDigits:0];
}

@end