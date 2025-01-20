@interface AXExtendedSRGBColorSpace
@end

@implementation AXExtendedSRGBColorSpace

CGColorSpaceRef ___AXExtendedSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
  _AXExtendedSRGBColorSpace_ExtendedSRGBColorSpace = (uint64_t)result;
  return result;
}

@end