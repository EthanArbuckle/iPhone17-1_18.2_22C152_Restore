@interface FULockSafePageViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation FULockSafePageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end