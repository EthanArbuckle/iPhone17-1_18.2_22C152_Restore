@interface InitializeRGBColorSpace
@end

@implementation InitializeRGBColorSpace

CGColorSpaceRef ___InitializeRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  StandardRGB = (uint64_t)result;
  return result;
}

@end