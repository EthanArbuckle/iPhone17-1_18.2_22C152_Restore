@interface DDRemoteActionHostViewController
- (DDRemoteActionHostViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation DDRemoteActionHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(DDRemoteActionHostViewController *)self delegate];
  [v5 DDRemoteActionDidTerminateWithError:v4];
}

- (DDRemoteActionHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDRemoteActionHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end