@interface AXSRGBColorSpace
@end

@implementation AXSRGBColorSpace

CGColorSpaceRef ___AXSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  _AXSRGBColorSpace_RGBColorSpace = (uint64_t)result;
  return result;
}

@end