@interface UIViewController(CAMCameraRollController)
- (uint64_t)cam_swizzled_supportedInterfaceOrientations;
@end

@implementation UIViewController(CAMCameraRollController)

- (uint64_t)cam_swizzled_supportedInterfaceOrientations
{
  return 30;
}

@end