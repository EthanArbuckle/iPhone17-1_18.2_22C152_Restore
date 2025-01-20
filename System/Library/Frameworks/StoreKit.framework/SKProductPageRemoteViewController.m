@interface SKProductPageRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKProductPageRemoteViewControllerDelegate)delegate;
- (void)finishImmediately;
- (void)finishWithResult:(unint64_t)a3 completion:(id)a4;
- (void)loadDidFinish;
- (void)setAskToBuy:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreview:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(BOOL)a3;
- (void)setUsageContext:(id)a3;
- (void)setVisibleInClientWindow:(id)a3;
- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4;
- (void)userDidInteractWithProduct:(unint64_t)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKProductPageRemoteViewController

+ (id)exportedInterface
{
  return +[SKProductPageExtension clientInterface];
}

+ (id)serviceViewControllerInterface
{
  return +[SKProductPageExtension serviceInterface];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v7 = a3;
  v4 = [(SKProductPageRemoteViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SKProductPageRemoteViewController *)self delegate];
    [v6 productPageRemoteViewController:self didTerminateWithError:v7];
  }
}

- (void)finishWithResult:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SKProductPageRemoteViewController *)self delegate];
  [v7 productPageRemoteViewController:self finishWithResult:a3 completion:v6];
}

- (void)loadDidFinish
{
  id v3 = [(SKProductPageRemoteViewController *)self delegate];
  [v3 productPageRemoteViewControllerLoadDidFinish:self];
}

- (void)userDidInteractWithProduct:(unint64_t)a3
{
  id v5 = [(SKProductPageRemoteViewController *)self delegate];
  [v5 productPageRemoteViewController:self userDidInteractWithProduct:a3];
}

- (void)setShowsStoreButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v4 _setShowsStoreButton:v3];
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 _setCancelButtonTitle:v4];
}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 _setRightBarButtonTitle:v4];
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v4 _setShowsRightBarButton:v3];
}

- (void)setPromptString:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 _setPromptString:v4];
}

- (void)setAskToBuy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v4 _setAskToBuy:v3];
}

- (void)setUsageContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 _setUsageContext:v4];
}

- (void)setVisibleInClientWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 setVisibleInClientWindow:v4];
}

- (void)finishImmediately
{
  id v3 = [(SKProductPageRemoteViewController *)self delegate];
  [v3 productPageRemoteViewController:self finishWithResult:0 completion:0];
}

- (void)setPreview:(id)a3
{
  id v4 = a3;
  id v5 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v5 setPreview:v4];
}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKProductPageRemoteViewController *)self extensionProxy];
  [v7 _setupWithClientBundleID:v6 bagType:a4];
}

- (SKProductPageRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKProductPageRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end