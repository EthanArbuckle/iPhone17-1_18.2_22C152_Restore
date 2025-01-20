@interface SFPasswordRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)passwordServiceViewControllerName;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
- (SFPasswordRemoteViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)willDismissServiceViewController;
@end

@implementation SFPasswordRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [a1 passwordServiceViewControllerName];
  v7 = [v5 requestViewController:v6 fromServiceWithBundleIdentifier:@"com.apple.SafariViewService" connectionHandler:v4];

  return v7;
}

+ (id)passwordServiceViewControllerName
{
  return &stru_1EFB97EB8;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFBEF098];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self viewServiceDidTerminateWithError:v5];
}

- (void)willDismissServiceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteViewControllerWillDismiss:self];
}

- (SFPasswordRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPasswordRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end