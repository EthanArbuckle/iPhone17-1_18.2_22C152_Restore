@interface SKStoreRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKStoreRemoteViewControllerDelegate)delegate;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentRequestedViewControllerWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsTabSelection;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKStoreRemoteViewController

+ (id)exportedInterface
{
  return +[SKStoreExtension clientInterface];
}

+ (id)serviceViewControllerInterface
{
  return +[SKStoreExtension serviceInterface];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v7 = a3;
  v4 = [(SKStoreRemoteViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SKStoreRemoteViewController *)self delegate];
    [v6 storeRemoteViewControllerTerminatedWithError:v7];
  }
}

- (void)setNeedsTabSelection
{
  id v3 = [(SKStoreRemoteViewController *)self delegate];
  [v3 storeRemoteViewControllerNeedsTabSelection:self];
}

- (void)presentRequestedViewControllerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SKStoreRemoteViewController *)self delegate];
  [v5 storeRemoteViewController:self presentRequestedViewControllerWithIdentifier:v4];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__SKStoreRemoteViewController_dismissViewControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5FA9BB8;
  aBlock[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  v9.receiver = self;
  v9.super_class = (Class)SKStoreRemoteViewController;
  [(SKStoreRemoteViewController *)&v9 dismissViewControllerAnimated:v4 completion:v8];
}

void __72__SKStoreRemoteViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 storeRemoteViewControllerDidDismiss];
  }
}

- (SKStoreRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKStoreRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end