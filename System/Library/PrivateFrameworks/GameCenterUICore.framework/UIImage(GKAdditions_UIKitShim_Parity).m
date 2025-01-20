@interface UIImage(GKAdditions_UIKitShim_Parity)
- (CGImage)_gkScale;
- (uint64_t)_gkCGImage;
- (uint64_t)_gkImageOrientation;
@end

@implementation UIImage(GKAdditions_UIKitShim_Parity)

- (CGImage)_gkScale
{
  result = (CGImage *)[a1 _gkCGImage];
  if (result)
  {
    CGImageGetWidth(result);
    return (CGImage *)[a1 size];
  }
  return result;
}

- (uint64_t)_gkCGImage
{
  id v1 = a1;
  return [v1 CGImage];
}

- (uint64_t)_gkImageOrientation
{
  return 0;
}

@end