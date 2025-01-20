@interface SFExternalPasswordCredentialRemoteViewController
+ (id)exportedInterface;
+ (id)passwordServiceViewControllerName;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (void)presentExternalPasswordCredentialRemoteViewController;
@end

@implementation SFExternalPasswordCredentialRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentExternalPasswordCredentialRemoteViewController
{
  id v3 = [(SFPasswordRemoteViewController *)self delegate];
  [v3 presentExternalPasswordCredentialRemoteViewController:self];
}

+ (id)passwordServiceViewControllerName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC6EE38];
}

+ (id)serviceViewControllerInterface
{
  return +[SFExternalPasswordCredentialServiceViewController _exportedInterface];
}

@end