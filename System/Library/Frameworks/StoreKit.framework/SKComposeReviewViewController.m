@interface SKComposeReviewViewController
- (SKComposeReviewDelegate)delegate;
- (SKComposeReviewViewController)initWithCompositionURL:(id)a3;
- (SKComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_addRemoteView;
- (void)_didFinishWithResult:(BOOL)a3 error:(id)a4;
- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4;
- (void)_requestRemoteViewController;
- (void)_tearDownAfterError:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)prepareWithCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SKComposeReviewViewController

- (SKComposeReviewViewController)initWithCompositionURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKComposeReviewViewController;
  v5 = [(SKComposeReviewViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    compositionURL = v5->_compositionURL;
    v5->_compositionURL = (NSURL *)v6;
  }
  return v5;
}

- (SKComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SKComposeReviewViewController;
  id v4 = [(SKComposeReviewViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F17E8];
    serviceProxy = v4->_serviceProxy;
    v4->_serviceProxy = (SKUIServiceComposeReviewViewController *)v5;

    v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1) {
      [(SKComposeReviewViewController *)v4 setModalPresentationStyle:2];
    }
  }
  return v4;
}

- (void)dealloc
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKRemoteComposeReviewViewController *)self->_remoteViewController setComposeReviewViewController:0];
  [(SKUIServiceComposeReviewViewController *)self->_serviceProxy setInvocationTarget:0];
  v4.receiver = self;
  v4.super_class = (Class)SKComposeReviewViewController;
  [(SKComposeReviewViewController *)&v4 dealloc];
}

- (void)prepareWithCompletionBlock:(id)a3
{
  if (self->_prepareBlock)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    [v3 raise:v4 format:@"Double prepare"];
  }
  else
  {
    uint64_t v6 = (void *)[a3 copy];
    id prepareBlock = self->_prepareBlock;
    self->_id prepareBlock = v6;

    [(SKComposeReviewViewController *)self _requestRemoteViewController];
  }
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v3];

  [(SKComposeReviewViewController *)self setView:v4];
  [(SKComposeReviewViewController *)self _addRemoteView];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIServiceComposeReviewViewController *)self->_serviceProxy loadReviewWithURL:self->_compositionURL];
  v5.receiver = self;
  v5.super_class = (Class)SKComposeReviewViewController;
  [(SKComposeReviewViewController *)&v5 viewDidAppear:v3];
}

- (void)_didFinishWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  if (self->_prepareBlock)
  {
    [(SKComposeReviewViewController *)self _didPrepareWithResult:a3 error:a4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = v8;
    if (v7)
    {
      [v8 reviewComposeViewController:self didFinishSubmitting:v4];
    }
    else
    {
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        return;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 reviewComposeViewControllerDidFinish:self];
    }
  }
}

- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  if (v4) {
    [(SKComposeReviewViewController *)self _addRemoteView];
  }
  [(SKComposeReviewViewController *)self _endDelayingPresentation];
  id prepareBlock = (void (**)(id, BOOL, id))self->_prepareBlock;
  if (prepareBlock)
  {
    prepareBlock[2](prepareBlock, v4, v8);
    id v7 = self->_prepareBlock;
    self->_id prepareBlock = 0;
  }

  MEMORY[0x1F4181820]();
}

- (void)_tearDownAfterError:(id)a3
{
  if (self->_prepareBlock) {
    [(SKComposeReviewViewController *)self _didFinishWithResult:0 error:a3];
  }
  else {
    [(SKComposeReviewViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)_addRemoteView
{
  if (self->_remoteViewController && [(SKComposeReviewViewController *)self isViewLoaded])
  {
    id v4 = [(SKComposeReviewViewController *)self view];
    BOOL v3 = [(SKRemoteComposeReviewViewController *)self->_remoteViewController view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
    [v3 setAutoresizingMask:18];
    [v4 addSubview:v3];
  }
}

- (void)_requestRemoteViewController
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke;
  v6[3] = &unk_1E5FA9B00;
  v6[4] = self;
  [(SKComposeReviewViewController *)self _beginDelayingPresentation:v6 cancellationHandler:10.0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke_2;
  v5[3] = &unk_1E5FA9D18;
  v5[4] = self;
  BOOL v3 = +[_UIRemoteViewController requestViewController:@"ServiceComposeReviewViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v5];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v3;
}

uint64_t __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = SSError();
  [v1 _didPrepareWithResult:0 error:v2];

  return 0;
}

void __61__SKComposeReviewViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  if (v12)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1000), a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "setComposeReviewViewController:");
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 1008);
    char v9 = [*(id *)(v7 + 1000) serviceViewControllerProxy];
    [v8 setInvocationTarget:v9];

    [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 1000)];
  }
  else
  {
    NSLog(&cfstr_CouldNotReques.isa, v6);
    [*(id *)(a1 + 32) _didPrepareWithResult:0 error:v6];
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    [*(id *)(a1 + 32) _endDelayingPresentation];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 976);
  *(void *)(v10 + 976) = 0;
}

- (SKComposeReviewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKComposeReviewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_compositionURL, 0);

  objc_storeStrong((id *)&self->_cancelRequest, 0);
}

@end