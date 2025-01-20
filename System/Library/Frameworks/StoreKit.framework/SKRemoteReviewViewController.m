@interface SKRemoteReviewViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKRemoteReviewViewControllerDelegate)delegate;
- (SKStoreReviewViewController)reviewViewController;
- (void)didFinishWithResult:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setReviewViewController:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKRemoteReviewViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SKRemoteReviewViewController *)self reviewViewController];
  uint64_t v8 = [v7 unsignedIntegerValue];

  [v9 _didFinishWithResult:v8 error:v6];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E7D98];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F16C8];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v6 = a3;
  v4 = [(SKRemoteReviewViewController *)self delegate];

  if (v4)
  {
    v5 = [(SKRemoteReviewViewController *)self delegate];
    [v5 remoteReviewViewControllerTerminatedWithError:v6];
  }
}

- (SKRemoteReviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKRemoteReviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKStoreReviewViewController)reviewViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reviewViewController);

  return (SKStoreReviewViewController *)WeakRetained;
}

- (void)setReviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reviewViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end