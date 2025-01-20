@interface UIWindow(BannerKitAdditions)
- (BOOL)_bn_isRotating;
@end

@implementation UIWindow(BannerKitAdditions)

- (BOOL)_bn_isRotating
{
  uint64_t v2 = [a1 _fromWindowOrientation];
  return v2 != [a1 _toWindowOrientation];
}

@end