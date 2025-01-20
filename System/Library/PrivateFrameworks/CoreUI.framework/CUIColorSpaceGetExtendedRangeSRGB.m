@interface CUIColorSpaceGetExtendedRangeSRGB
@end

@implementation CUIColorSpaceGetExtendedRangeSRGB

CGColorSpaceRef ___CUIColorSpaceGetExtendedRangeSRGB_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  _CUIColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace = (uint64_t)result;
  return result;
}

@end