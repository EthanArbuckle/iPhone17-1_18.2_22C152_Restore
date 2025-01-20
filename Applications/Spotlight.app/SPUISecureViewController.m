@interface SPUISecureViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation SPUISecureViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end