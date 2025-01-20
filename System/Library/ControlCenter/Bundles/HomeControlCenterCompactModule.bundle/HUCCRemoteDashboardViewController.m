@interface HUCCRemoteDashboardViewController
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (HUCCRemoteDashboardDelegate)delegate;
- (void)authorizeIfLocked;
- (void)quickControlsPresentationDidUpdate:(BOOL)a3;
- (void)requestDismissal;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation HUCCRemoteDashboardViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"HCSRemoteViewController" fromServiceWithBundleIdentifier:@"com.apple.Home.HomeControlService" connectionHandler:v3];

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCCRemoteDashboardViewController *)self delegate];
  [v5 remoteDashboard:self viewServiceDidTerminateWithError:v4];
}

+ (id)serviceViewControllerInterface
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F08D80], sel_hu_homeControlServiceXPCInterface);
}

+ (id)exportedInterface
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F08D80], sel_hu_homeControlXPCInterface);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)authorizeIfLocked
{
  id v3 = [(HUCCRemoteDashboardViewController *)self delegate];
  [v3 requestLockAuthenticationForRemoteDashboard:self];
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUCCRemoteDashboardViewController *)self delegate];
  [v4 quickControlsPresentationDidUpdate:v3];
}

- (void)requestDismissal
{
  id v2 = [(HUCCRemoteDashboardViewController *)self delegate];
  [v2 requestDismissal];
}

- (HUCCRemoteDashboardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCRemoteDashboardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end