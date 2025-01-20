@interface PRXCardContentViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation PRXCardContentViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end