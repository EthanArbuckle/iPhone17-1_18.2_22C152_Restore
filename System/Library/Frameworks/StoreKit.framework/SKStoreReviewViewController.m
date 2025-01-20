@interface SKStoreReviewViewController
- (NSString)reviewRequestToken;
- (SKRemoteReviewViewController)remoteViewController;
- (SKStoreReviewPresentationWindow)presentationWindow;
- (SKStoreReviewViewController)initWithReviewRequestToken:(id)a3;
- (SKUIServiceReviewViewController)serviceProxy;
- (_UIAsyncInvocation)cancelRequest;
- (void)_addRemoteView;
- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4;
- (void)_requestRemoteViewController;
- (void)dealloc;
- (void)remoteReviewViewControllerTerminatedWithError:(id)a3;
- (void)setCancelRequest:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setReviewRequestToken:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SKStoreReviewViewController

- (SKStoreReviewViewController)initWithReviewRequestToken:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKStoreReviewViewController;
  v5 = [(SKStoreReviewViewController *)&v11 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F16C8];
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (SKUIServiceReviewViewController *)v6;

    uint64_t v8 = [v4 copy];
    reviewRequestToken = v5->_reviewRequestToken;
    v5->_reviewRequestToken = (NSString *)v8;

    [(SKStoreReviewViewController *)v5 setModalPresentationStyle:17];
    [(SKStoreReviewViewController *)v5 setModalTransitionStyle:12];
  }

  return v5;
}

- (void)dealloc
{
  [(SKStoreReviewViewController *)self setPresentationWindow:0];
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKUIServiceReviewViewController *)self->_serviceProxy setInvocationTarget:0];
  [(SKRemoteReviewViewController *)self->_remoteViewController setReviewViewController:0];
  [(SKRemoteReviewViewController *)self->_remoteViewController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SKStoreReviewViewController;
  [(SKStoreReviewViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SKStoreReviewViewController;
  [(SKStoreReviewViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  objc_super v4 = [(SKStoreReviewViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(SKStoreReviewViewController *)self _requestRemoteViewController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKStoreReviewViewController;
  -[SKStoreReviewViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  objc_super v5 = [(SKStoreReviewViewController *)self serviceProxy];
  v6 = [NSNumber numberWithBool:v3];
  [v5 finishImmediately:v6];
}

- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4
{
  id v9 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = [[SKXPCConnection alloc] initWithServiceName:0x1F08AA200];
    objc_super v7 = (void *)SSXPCCreateMessageDictionary();
    uint64_t v8 = [(SKStoreReviewViewController *)self reviewRequestToken];
    MEMORY[0x1B3E91870](v7, "1", v8);

    [(SKXPCConnection *)v6 sendMessage:v7];
  }
  if (([(SKStoreReviewViewController *)self isBeingDismissed] & 1) == 0) {
    [(SKStoreReviewViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
  [(SKStoreReviewViewController *)self setPresentationWindow:0];
}

- (void)remoteReviewViewControllerTerminatedWithError:(id)a3
{
}

- (void)_requestRemoteViewController
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke;
  v11[3] = &unk_1E5FA9B00;
  v11[4] = self;
  [(SKStoreReviewViewController *)self _beginDelayingPresentation:v11 cancellationHandler:10.0];
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke_2;
  objc_super v7 = &unk_1E5FA9B28;
  objc_copyWeak(&v9, &location);
  uint64_t v8 = self;
  BOOL v3 = +[_UIRemoteViewController requestViewController:@"ServiceReviewViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:&v4];
  -[SKStoreReviewViewController setCancelRequest:](self, "setCancelRequest:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  return 0;
}

void __59__SKStoreReviewViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained setRemoteViewController:v5];
    id v9 = [v8 remoteViewController];
    [v9 setReviewViewController:v8];

    v10 = [v8 remoteViewController];
    [v10 setDelegate:v8];

    objc_super v11 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceViewControllerProxy];
    v12 = [v8 serviceProxy];
    [v12 setInvocationTarget:v11];

    [v8 addChildViewController:*(void *)(*(void *)(a1 + 32) + 1000)];
    [v8 _addRemoteView];
    v13 = [v8 remoteViewController];
    [v13 didMoveToParentViewController:*(void *)(a1 + 32)];

    v14 = [v8 reviewRequestToken];
    uint64_t v15 = [v14 isEqualToString:*MEMORY[0x1E4FA89E8]];

    v16 = [v8 serviceProxy];
    v19 = @"SKUIServiceReviewSandboxMode";
    v17 = [NSNumber numberWithBool:v15];
    v20[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v16 setupWithParameters:v18];
  }
  else
  {
    [WeakRetained _didFinishWithResult:0 error:v6];
  }
  [v8 setCancelRequest:0];
  [v8 _endDelayingPresentation];
}

- (void)_addRemoteView
{
  uint64_t v3 = [(SKStoreReviewViewController *)self remoteViewController];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    int v5 = [(SKStoreReviewViewController *)self isViewLoaded];

    if (v5)
    {
      id v6 = [(SKStoreReviewViewController *)self remoteViewController];
      id v9 = [v6 view];

      objc_super v7 = [MEMORY[0x1E4FB1618] clearColor];
      [v9 setBackgroundColor:v7];

      uint64_t v8 = [(SKStoreReviewViewController *)self view];
      [v8 bounds];
      objc_msgSend(v9, "setFrame:");
      [v9 setAutoresizingMask:18];
      [v8 addSubview:v9];
    }
  }
}

- (SKStoreReviewPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
}

- (SKUIServiceReviewViewController)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (_UIAsyncInvocation)cancelRequest
{
  return self->_cancelRequest;
}

- (void)setCancelRequest:(id)a3
{
}

- (SKRemoteReviewViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (NSString)reviewRequestToken
{
  return self->_reviewRequestToken;
}

- (void)setReviewRequestToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewRequestToken, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);

  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

@end