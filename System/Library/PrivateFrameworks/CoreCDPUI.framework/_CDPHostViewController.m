@interface _CDPHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (NSCopying)request;
- (NSExtension)weakExtension;
- (double)_keyboardHeightOffset;
- (id)viewServiceTerminationBlock;
- (void)dealloc;
- (void)hostKeyboardOffset:(id)a3;
- (void)setRequest:(id)a3;
- (void)setViewServiceTerminationBlock:(id)a3;
- (void)setWeakExtension:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _CDPHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CDPHostViewController viewServiceDidTerminateWithError:]((uint64_t)v4, v5);
  }

  viewServiceTerminationBlock = (void (**)(void))self->_viewServiceTerminationBlock;
  if (viewServiceTerminationBlock) {
    viewServiceTerminationBlock[2]();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = [(_CDPHostViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  v5 = [(_CDPHostViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA38620];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA4AE20];
}

- (void)hostKeyboardOffset:(id)a3
{
  if (a3)
  {
    v5 = NSNumber;
    id v6 = a3;
    [(_CDPHostViewController *)self _keyboardHeightOffset];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v6, v7);
  }
}

- (double)_keyboardHeightOffset
{
  objc_msgSend(MEMORY[0x263F828A0], "sizeForInterfaceOrientation:", -[_CDPHostViewController interfaceOrientation](self, "interfaceOrientation"));
  double v30 = v3;
  id v4 = [(_CDPHostViewController *)self view];
  v5 = [(_CDPHostViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "convertRect:toView:", 0);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v14 = [MEMORY[0x263F82B60] mainScreen];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  double MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  double v24 = v30 - (MaxY - CGRectGetMaxY(v32));
  v25 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];
  double v27 = 50.0;
  if (v26 != 1) {
    double v27 = 0.0;
  }
  double v28 = v24 + v27;

  return v28;
}

- (void)dealloc
{
  double v3 = [(_CDPHostViewController *)self request];

  if (v3)
  {
    id v4 = [(_CDPHostViewController *)self weakExtension];
    v5 = [(_CDPHostViewController *)self request];
    [v4 cancelExtensionRequestWithIdentifier:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  [(_UIRemoteViewController *)&v6 dealloc];
}

- (NSCopying)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSExtension)weakExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakExtension);

  return (NSExtension *)WeakRetained;
}

- (void)setWeakExtension:(id)a3
{
}

- (id)viewServiceTerminationBlock
{
  return self->_viewServiceTerminationBlock;
}

- (void)setViewServiceTerminationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewServiceTerminationBlock, 0);
  objc_destroyWeak((id *)&self->_weakExtension);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "CDP view service terminated with error: %@", (uint8_t *)&v2, 0xCu);
}

@end