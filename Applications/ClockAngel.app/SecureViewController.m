@interface SecureViewController
- (BOOL)_canShowWhileLocked;
- (SecureViewController)init;
@end

@implementation SecureViewController

- (SecureViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SecureViewController;
  return [(SecureViewController *)&v3 init];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end