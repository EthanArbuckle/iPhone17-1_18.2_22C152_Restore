@interface CUIColorSpaceGetSRGB
@end

@implementation CUIColorSpaceGetSRGB

CGColorSpaceRef ___CUIColorSpaceGetSRGB_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  _CUIColorSpaceGetSRGB_sSRGBColorSpace = (uint64_t)result;
  return result;
}

@end