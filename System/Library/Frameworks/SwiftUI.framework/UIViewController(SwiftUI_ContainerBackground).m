@interface UIViewController(SwiftUI_ContainerBackground)
- (uint64_t)_wantsTransparentBackground;
@end

@implementation UIViewController(SwiftUI_ContainerBackground)

- (uint64_t)_wantsTransparentBackground
{
  return 0;
}

@end