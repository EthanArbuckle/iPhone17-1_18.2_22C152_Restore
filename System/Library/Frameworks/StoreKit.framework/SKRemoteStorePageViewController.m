@interface SKRemoteStorePageViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKStorePageViewController)storePageViewController;
- (void)didFinishWithResult:(id)a3 error:(id)a4;
- (void)setStorePageViewController:(id)a3;
- (void)showProductPageWithItemIdentifier:(id)a3;
@end

@implementation SKRemoteStorePageViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKRemoteStorePageViewController *)self storePageViewController];
  [v8 _didFinishWithResult:v7 error:v6];
}

- (void)showProductPageWithItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SKRemoteStorePageViewController *)self storePageViewController];
  [v5 _showProductPageWithItemIdentifier:v4];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08EBC88];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F18A8];
}

- (SKStorePageViewController)storePageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storePageViewController);

  return (SKStorePageViewController *)WeakRetained;
}

- (void)setStorePageViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end