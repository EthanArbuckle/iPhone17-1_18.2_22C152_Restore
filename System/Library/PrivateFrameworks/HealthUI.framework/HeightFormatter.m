@interface HeightFormatter
@end

@implementation HeightFormatter

uint64_t ___HeightFormatter_block_invoke()
{
  v0 = objc_alloc_init(HKHeightNumberFormatter);
  uint64_t v1 = _HeightFormatter__heightFormatter;
  _HeightFormatter__heightFormatter = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end