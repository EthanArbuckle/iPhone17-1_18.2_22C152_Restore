@interface NSString
@end

@implementation NSString

uint64_t __42__NSString_CLKFormatter___clkBlinkerRange__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v1 = _clkBlinkerRange_blinkerSet;
  _clkBlinkerRange_blinkerSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __59__NSString_CLKFormatter___clkBlinkerRangeByBackwardsSearch__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v1 = _clkBlinkerRangeByBackwardsSearch_blinkerSet;
  _clkBlinkerRangeByBackwardsSearch_blinkerSet = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end