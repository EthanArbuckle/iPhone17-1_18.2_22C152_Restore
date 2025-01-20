@interface SKStorePageViewController
- (SKStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addRemoteView;
- (void)_didFinishWithResult:(id)a3 error:(id)a4;
- (void)_didLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_dismissProductPageViewController;
- (void)_prepareToLoadWithCompletionBlock:(id)a3;
- (void)_requestRemoteViewController;
- (void)_showProductPageWithItemIdentifier:(id)a3;
- (void)dealloc;
- (void)loadPageWithURL:(id)a3 completionBlock:(id)a4;
- (void)loadPageWithURLBagKey:(id)a3 completionBlock:(id)a4;
- (void)loadView;
@end

@implementation SKStorePageViewController

- (SKStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SKStorePageViewController;
  v4 = [(SKStorePageViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F18A8];
    serviceProxy = v4->_serviceProxy;
    v4->_serviceProxy = (SKUIServiceStorePageViewController *)v5;
  }
  return v4;
}

- (void)dealloc
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKStoreProductViewController *)self->_productPageViewController setDelegate:0];
  [(SKUIServiceStorePageViewController *)self->_serviceProxy setInvocationTarget:0];
  [(SKRemoteStorePageViewController *)self->_remoteViewController setStorePageViewController:0];
  v4.receiver = self;
  v4.super_class = (Class)SKStorePageViewController;
  [(SKStorePageViewController *)&v4 dealloc];
}

- (void)loadPageWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  [(SKStorePageViewController *)self _prepareToLoadWithCompletionBlock:a4];
  [(SKUIServiceStorePageViewController *)self->_serviceProxy loadPageWithURL:v6];
}

- (void)loadPageWithURLBagKey:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  [(SKStorePageViewController *)self _prepareToLoadWithCompletionBlock:a4];
  [(SKUIServiceStorePageViewController *)self->_serviceProxy loadPageWithURLBagKey:v6];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(SKStorePageViewController *)self setView:v3];
  [(SKStorePageViewController *)self _addRemoteView];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  if (SKAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)_didFinishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  -[SKStorePageViewController _didLoadWithResult:error:](self, "_didLoadWithResult:error:", [a3 BOOLValue], v6);
}

- (void)_showProductPageWithItemIdentifier:(id)a3
{
  id v4 = a3;
  if (!self->_productPageViewController)
  {
    v5 = objc_alloc_init(SKStoreProductViewController);
    productPageViewController = self->_productPageViewController;
    self->_productPageViewController = v5;

    [(SKStoreProductViewController *)self->_productPageViewController setDelegate:self];
    objc_initWeak(&location, self);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"id", 0);
    objc_super v8 = self->_productPageViewController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__SKStorePageViewController__showProductPageWithItemIdentifier___block_invoke;
    v9[3] = &unk_1E5FAADF0;
    objc_copyWeak(&v10, &location);
    [(SKStoreProductViewController *)v8 loadProductWithParameters:v7 completionBlock:v9];
    [(SKStorePageViewController *)self presentViewController:self->_productPageViewController animated:1 completion:0];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

void __64__SKStorePageViewController__showProductPageWithItemIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _dismissProductPageViewController];
  }
}

- (void)_addRemoteView
{
  if (self->_remoteViewController && [(SKStorePageViewController *)self isViewLoaded])
  {
    id v4 = [(SKStorePageViewController *)self view];
    uint64_t v3 = [(SKRemoteStorePageViewController *)self->_remoteViewController view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
    [v3 setAutoresizingMask:18];
    [v4 addSubview:v3];
  }
}

- (void)_didLoadWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v13 = v6;
  if (v4)
  {
    [(SKStorePageViewController *)self _addRemoteView];
  }
  else
  {
    id v7 = v6;
    cancelRequest = self->_cancelRequest;
    if (cancelRequest)
    {
      id v9 = (id)[(_UIAsyncInvocation *)cancelRequest invoke];
      id v10 = self->_cancelRequest;
      self->_cancelRequest = 0;
    }
  }
  loadBlock = (void (**)(id, BOOL, void))self->_loadBlock;
  if (loadBlock)
  {
    ((void (**)(id, BOOL, id))loadBlock)[2](loadBlock, v4, v13);
    id v12 = self->_loadBlock;
    self->_loadBlock = 0;
  }

  MEMORY[0x1F4181820]();
}

- (void)_dismissProductPageViewController
{
  [(SKStoreProductViewController *)self->_productPageViewController dismissViewControllerAnimated:1 completion:0];
  [(SKStoreProductViewController *)self->_productPageViewController setDelegate:0];
  productPageViewController = self->_productPageViewController;
  self->_productPageViewController = 0;
}

- (void)_prepareToLoadWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (self->_loadBlock != v4)
  {
    id v7 = v4;
    v5 = (void *)[v4 copy];
    id loadBlock = self->_loadBlock;
    self->_id loadBlock = v5;

    id v4 = v7;
  }
  if (!self->_cancelRequest && !self->_remoteViewController)
  {
    id v8 = v4;
    [(SKStorePageViewController *)self _requestRemoteViewController];
    id v4 = v8;
  }
}

- (void)_requestRemoteViewController
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SKStorePageViewController__requestRemoteViewController__block_invoke;
  v6[3] = &unk_1E5FA9B00;
  v6[4] = self;
  [(SKStorePageViewController *)self _beginDelayingPresentation:v6 cancellationHandler:10.0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SKStorePageViewController__requestRemoteViewController__block_invoke_2;
  v5[3] = &unk_1E5FA9D18;
  v5[4] = self;
  uint64_t v3 = +[_UIRemoteViewController requestViewController:@"ServiceStorePageViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v5];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v3;
}

uint64_t __57__SKStorePageViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = SSError();
  [v1 _didLoadWithResult:0 error:v2];

  return 0;
}

void __57__SKStorePageViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  if (v12)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1000), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "setStorePageViewController:");
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 1008);
    id v9 = [*(id *)(v7 + 1000) serviceViewControllerProxy];
    [v8 setInvocationTarget:v9];

    [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 1000)];
    [*(id *)(a1 + 32) _addRemoteView];
  }
  else
  {
    NSLog(&cfstr_CouldNotReques.isa, v6);
    [*(id *)(a1 + 32) _didLoadWithResult:0 error:v6];
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  }
  [*(id *)(a1 + 32) _endDelayingPresentation];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 976);
  *(void *)(v10 + 976) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_productPageViewController, 0);
  objc_storeStrong(&self->_loadBlock, 0);

  objc_storeStrong((id *)&self->_cancelRequest, 0);
}

@end