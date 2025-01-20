@interface GetGenericRGBColorSpace
@end

@implementation GetGenericRGBColorSpace

CGColorSpaceRef ___GetGenericRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
  _GetGenericRGBColorSpace_genericRGBColorSpace = (uint64_t)result;
  return result;
}

@end