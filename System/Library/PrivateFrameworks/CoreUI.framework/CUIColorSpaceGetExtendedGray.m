@interface CUIColorSpaceGetExtendedGray
@end

@implementation CUIColorSpaceGetExtendedGray

CGColorSpaceRef ___CUIColorSpaceGetExtendedGray_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName(kCGColorSpaceExtendedGray);
  _CUIColorSpaceGetExtendedGray_sExtendedGrayColorSpace = (uint64_t)result;
  return result;
}

@end