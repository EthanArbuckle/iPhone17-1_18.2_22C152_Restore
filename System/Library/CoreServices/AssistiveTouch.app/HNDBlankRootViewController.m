@interface HNDBlankRootViewController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation HNDBlankRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end