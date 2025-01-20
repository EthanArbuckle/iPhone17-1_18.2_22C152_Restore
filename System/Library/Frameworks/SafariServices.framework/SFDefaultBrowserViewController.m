@interface SFDefaultBrowserViewController
- (SFDefaultBrowserViewController)initWithViewDidBecomeReady:(id)a3 completion:(id)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)serviceProxy;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_addRemoteViewController;
- (void)_connectToService;
- (void)_didLoadRemoteViewController:(id)a3;
- (void)_initializeViewService;
- (void)remoteViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)remoteViewControllerFailed:(id)a3;
- (void)serviceProxyWillQueueInvocation:(id)a3;
@end

@implementation SFDefaultBrowserViewController

- (SFDefaultBrowserViewController)initWithViewDidBecomeReady:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDefaultBrowserViewController;
  v8 = [(SFDefaultBrowserViewController *)&v15 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1AD0C36A0](v6);
    id viewDidBecomeReady = v8->_viewDidBecomeReady;
    v8->_id viewDidBecomeReady = (id)v9;

    uint64_t v11 = MEMORY[0x1AD0C36A0](v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v11;

    [(SFDefaultBrowserViewController *)v8 _initializeViewService];
    v13 = v8;
  }

  return v8;
}

- (void)_initializeViewService
{
  if (!self->_serviceProxy)
  {
    v3 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC707E0];
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFDefaultBrowserServiceProtocol *)v3;

    [(SFDefaultBrowserServiceProtocol *)self->_serviceProxy setDelegate:self];
    [(SFDefaultBrowserViewController *)self _connectToService];
  }
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SFDefaultBrowserViewController__connectToService__block_invoke;
  v6[3] = &unk_1E5C751F0;
  v6[4] = self;
  v4 = +[SFDefaultBrowserRemoteViewController requestViewControllerWithConnectionHandler:v6];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;
}

void __51__SFDefaultBrowserViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 984);
  *(void *)(v7 + 984) = 0;

  if (v5)
  {
    [*(id *)(a1 + 32) _didLoadRemoteViewController:v5];
  }
  else
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__SFAddToHomeScreenViewController__connectToService__block_invoke_cold_1((uint64_t)v6, v9);
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 1000) + 16))();
  }
}

- (id)serviceProxy
{
  [(SFDefaultBrowserViewController *)self _initializeViewService];
  serviceProxy = self->_serviceProxy;

  return serviceProxy;
}

- (void)_didLoadRemoteViewController:(id)a3
{
  p_remoteViewController = &self->_remoteViewController;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  id v6 = a3;
  uint64_t v7 = [v6 serviceViewControllerProxy];
  [(SFDefaultBrowserServiceProtocol *)self->_serviceProxy setTarget:v7];

  [(SFDefaultBrowserRemoteViewController *)*p_remoteViewController setDelegate:self];
  serviceProxy = self->_serviceProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SFDefaultBrowserViewController__didLoadRemoteViewController___block_invoke;
  v9[3] = &unk_1E5C72678;
  v9[4] = self;
  [(SFDefaultBrowserServiceProtocol *)serviceProxy prepareForDisplayWithCompletionHandler:v9];
}

uint64_t __63__SFDefaultBrowserViewController__didLoadRemoteViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _addRemoteViewController];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 1000) + 16);

  return v3();
}

- (void)_addRemoteViewController
{
  id v7 = [(SFDefaultBrowserRemoteViewController *)self->_remoteViewController view];
  id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  objc_msgSend(v7, "setFrame:");

  v4 = [(SFDefaultBrowserViewController *)self view];
  [v4 addSubview:v7];

  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v6 = [(SFDefaultBrowserViewController *)self view];
  [v6 setBackgroundColor:v5];

  [(SFDefaultBrowserViewController *)self addChildViewController:self->_remoteViewController];
  [(_UIRemoteViewController *)self->_remoteViewController didMoveToParentViewController:self];
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest) {
    [(SFDefaultBrowserViewController *)self _connectToService];
  }
}

- (void)remoteViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id completionHandler = (void (**)(id, int64_t))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a4);
  }
}

- (void)remoteViewControllerFailed:(id)a3
{
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_viewDidBecomeReady, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end