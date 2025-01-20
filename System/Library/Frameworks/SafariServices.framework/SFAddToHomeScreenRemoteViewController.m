@interface SFAddToHomeScreenRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (SFAddToHomeScreenRemoteViewControllerDelegate)delegate;
- (void)serviceViewControllerDidFinishWithResult:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SFAddToHomeScreenRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"SFAddToHomeScreenServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.SafariViewService" connectionHandler:v3];

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC70078];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC60080];
}

- (void)serviceViewControllerDidFinishWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteViewController:self didFinishWithResult:v3];
}

- (SFAddToHomeScreenRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAddToHomeScreenRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end