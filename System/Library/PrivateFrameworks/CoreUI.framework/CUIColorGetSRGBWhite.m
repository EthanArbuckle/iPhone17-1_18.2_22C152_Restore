@interface CUIColorGetSRGBWhite
@end

@implementation CUIColorGetSRGBWhite

CGColorRef ___CUIColorGetSRGBWhite_block_invoke()
{
  CGColorRef result = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  _CUIColorGetSRGBWhite_sWhiteColor = (uint64_t)result;
  return result;
}

@end