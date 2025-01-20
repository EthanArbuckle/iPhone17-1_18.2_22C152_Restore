@interface DebugWorldNode
- (void)appDidEnterBackground;
@end

@implementation DebugWorldNode

- (void)appDidEnterBackground
{
  swift_retain();
  sub_22F1AF2EC();
  swift_release();
}

@end