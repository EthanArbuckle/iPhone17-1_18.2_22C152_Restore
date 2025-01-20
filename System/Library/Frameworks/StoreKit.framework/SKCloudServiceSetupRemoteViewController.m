@interface SKCloudServiceSetupRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKCloudServiceSetupRemoteViewControllerDelegate)delegate;
- (void)didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4;
- (void)dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)overrideCreditCardPresentationWithCompletion:(id)a3;
- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4;
- (void)presentSafariViewControllerWithURL:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SKCloudServiceSetupRemoteViewController

+ (id)exportedInterface
{
  return +[SKCloudServiceSetupExtension clientInterface];
}

+ (id)serviceViewControllerInterface
{
  return +[SKCloudServiceSetupExtension serviceInterface];
}

- (void)didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v7 cloudServiceSetupRemoteViewController:self didFinishLoadingWithSuccess:v4 error:v6];
}

- (void)dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v7 cloudServiceSetupRemoteViewController:self requestsDismissalWithAnimation:v4 completion:v6];
}

- (void)dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v7 cloudServiceSetupRemoteViewController:self requestsDismissingSafariViewControllerAnimated:v4 completion:v6];
}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v5 overrideCreditCardPresentationWithCompletion:v4];
}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v7 overrideRedeemCameraPerformAction:a3 withObject:v6];
}

- (void)presentSafariViewControllerWithURL:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SKCloudServiceSetupRemoteViewController *)self delegate];
  [v10 cloudServiceSetupRemoteViewController:self requestsPresentingSafariViewControllerWithURL:v9 animated:v5 completion:v8];
}

- (SKCloudServiceSetupRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKCloudServiceSetupRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end