@interface SKRemoteProductActivityViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SKStoreProductActivityViewController)productActivityViewController;
- (void)didFinishWithResult:(id)a3 error:(id)a4;
- (void)setProductActivityViewController:(id)a3;
@end

@implementation SKRemoteProductActivityViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SKRemoteProductActivityViewController *)self productActivityViewController];
  uint64_t v8 = [v7 unsignedIntegerValue];

  [v9 _didFinishWithResult:v8 error:v6];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08EBE18];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1848];
}

- (SKStoreProductActivityViewController)productActivityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productActivityViewController);

  return (SKStoreProductActivityViewController *)WeakRetained;
}

- (void)setProductActivityViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end