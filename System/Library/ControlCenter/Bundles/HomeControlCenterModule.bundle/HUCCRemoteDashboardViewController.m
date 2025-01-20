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
  v4 = objc_opt_class();
  v6 = objc_msgSend_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_(v4, v5, @"HCSRemoteViewController", @"com.apple.Home.HomeControlService", v3);

  return v6;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteDashboard_viewServiceDidTerminateWithError_(v8, v7, (uint64_t)self, v4);
}

+ (id)serviceViewControllerInterface
{
  return (id)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263F08D80], sel_hu_homeControlServiceXPCInterface);
}

+ (id)exportedInterface
{
  return (id)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263F08D80], sel_hu_homeControlXPCInterface);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)authorizeIfLocked
{
  objc_msgSend_delegate(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestLockAuthenticationForRemoteDashboard_(v5, v4, (uint64_t)self);
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quickControlsPresentationDidUpdate_(v5, v4, v3);
}

- (void)requestDismissal
{
  objc_msgSend_delegate(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDismissal(v5, v3, v4);
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