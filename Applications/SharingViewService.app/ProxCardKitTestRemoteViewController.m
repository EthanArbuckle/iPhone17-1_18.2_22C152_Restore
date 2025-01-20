@interface ProxCardKitTestRemoteViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ProxCardKitTestRemoteViewController

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 1);
}

- (void)proxCardFlowDidDismiss
{
  id v2 = [(ProxCardKitTestRemoteViewController *)self _remoteViewControllerProxy];
  [v2 dismiss];
}

- (void)proxCardFlowWillPresent
{
  id v2 = [(ProxCardKitTestRemoteViewController *)self _remoteViewControllerProxy];
  [v2 setStatusBarHidden:1 withDuration:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ProxCardKitTestRemoteViewController;
  [(ProxCardKitTestRemoteViewController *)&v6 viewDidAppear:a3];
  v4 = objc_alloc_init(ProxCardKitTestStartViewController);
  id v5 = [(ProxCardKitTestRemoteViewController *)self presentProxCardFlowWithDelegate:self initialViewController:v4];
}

@end