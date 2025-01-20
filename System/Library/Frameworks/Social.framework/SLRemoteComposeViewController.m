@interface SLRemoteComposeViewController
- (BOOL)_canShowWhileLocked;
- (SLRemoteComposeViewControllerDelegateProtocol)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SLRemoteComposeViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 3, @"SLRemoteComposeViewController: (this may be harmless) viewServiceDidTerminateWithError: %@");
  v8.receiver = self;
  v8.super_class = (Class)SLRemoteComposeViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v5, v5);
  v6 = [(SLRemoteComposeViewController *)self delegate];
  v7 = v6;
  if (v6) {
    [v6 remoteViewController:self didTerminateWithError:v5];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SLRemoteComposeViewControllerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SLRemoteComposeViewControllerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end