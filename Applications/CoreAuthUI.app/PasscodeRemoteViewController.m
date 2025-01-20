@interface PasscodeRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)isRemoteViewController;
@end

@implementation PasscodeRemoteViewController

+ (id)_remoteViewControllerInterface
{
  return 0;
}

+ (id)_exportedInterface
{
  return 0;
}

- (BOOL)isRemoteViewController
{
  return 1;
}

@end