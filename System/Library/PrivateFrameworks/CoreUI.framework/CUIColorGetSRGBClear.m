@interface CUIColorGetSRGBClear
@end

@implementation CUIColorGetSRGBClear

CGColorRef ___CUIColorGetSRGBClear_block_invoke()
{
  CGColorRef result = CGColorCreateSRGB(0.0, 0.0, 0.0, 0.0);
  _CUIColorGetSRGBClear_sClearColor = (uint64_t)result;
  return result;
}

@end