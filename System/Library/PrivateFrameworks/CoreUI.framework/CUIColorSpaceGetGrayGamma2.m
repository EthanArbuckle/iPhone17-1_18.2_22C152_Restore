@interface CUIColorSpaceGetGrayGamma2
@end

@implementation CUIColorSpaceGetGrayGamma2

CGColorSpaceRef ___CUIColorSpaceGetGrayGamma2_2_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceGenericGrayGamma2_2);
  _CUIColorSpaceGetGrayGamma2_2_sGenericGrayColorSpace = (uint64_t)result;
  return result;
}

@end