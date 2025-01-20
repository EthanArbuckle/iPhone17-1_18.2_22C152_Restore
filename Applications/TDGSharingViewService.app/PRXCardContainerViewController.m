@interface PRXCardContainerViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation PRXCardContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end