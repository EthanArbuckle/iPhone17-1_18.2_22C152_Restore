@interface UIDevice(ControlCenterAdditions)
- (uint64_t)ccuiSupportsGroupRendering;
@end

@implementation UIDevice(ControlCenterAdditions)

- (uint64_t)ccuiSupportsGroupRendering
{
  return 1;
}

@end