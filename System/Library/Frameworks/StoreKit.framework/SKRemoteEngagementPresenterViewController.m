@interface SKRemoteEngagementPresenterViewController
- (OS_dispatch_queue)engagementPresentationQueue;
- (OS_dispatch_semaphore)remoteViewControllerSemaphore;
- (SKEngagementPresenterProtocol)delegate;
- (SKRemoteEngagementPresenterViewController)init;
- (SKRemoteEngagementRemoteViewController)remoteViewController;
- (void)_addRemoteView;
- (void)_loadRemoteViewController;
- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SKRemoteEngagementPresenterViewController

- (SKRemoteEngagementPresenterViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKRemoteEngagementPresenterViewController;
  v2 = [(SKRemoteEngagementPresenterViewController *)&v8 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    remoteViewControllerSemaphore = v2->_remoteViewControllerSemaphore;
    v2->_remoteViewControllerSemaphore = (OS_dispatch_semaphore *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("SKRemoteEngagementPresenterViewController engagement presentation queue", 0);
    engagementPresentationQueue = v2->_engagementPresentationQueue;
    v2->_engagementPresentationQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SKRemoteEngagementPresenterViewController;
  [(SKRemoteEngagementPresenterViewController *)&v3 viewDidLoad];
  [(SKRemoteEngagementPresenterViewController *)self _loadRemoteViewController];
}

- (void)presentEngagementRequestData:(id)a3 clientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Present engagement request: %{public}@, clientBundleID: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  engagementPresentationQueue = self->_engagementPresentationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke;
  block[3] = &unk_1E5FA9E80;
  objc_copyWeak(&v19, (id *)buf);
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(engagementPresentationQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_super v3 = [WeakRetained remoteViewControllerSemaphore];
  dispatch_time_t v4 = dispatch_time(0, 60000000000);
  intptr_t v5 = dispatch_semaphore_wait(v3, v4);

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_cold_1();
    }
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3;
    v8[3] = &unk_1E5FA9E58;
    v8[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy_;
  v18[3] = __Block_byref_object_dispose_;
  id v19 = 0;
  v2 = [*(id *)(a1 + 32) remoteViewController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4;
  v16[3] = &unk_1E5FA9E08;
  v16[4] = &v17;
  objc_super v3 = [v2 serviceViewControllerProxyWithErrorHandler:v16];

  if (*(void *)(v18[0] + 40))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3_cold_1((uint64_t)v18, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(void *)(v18[0] + 40));
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6;
    v14[3] = &unk_1E5FA9E30;
    id v15 = *(id *)(a1 + 56);
    [v3 presentEngagementRequestData:v12 clientBundleID:v13 completion:v14];
  }
  _Block_object_dispose(&v17, 8);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Finished presenting engagement request with view service", buf, 2u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_7;
  v13[3] = &unk_1E5FA9BB8;
  id v11 = *(id *)(a1 + 32);
  id v14 = v3;
  id v15 = v11;
  id v12 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_loadRemoteViewController
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SKRemoteEngagementPresenterViewController__loadRemoteViewController__block_invoke;
  v4[3] = &unk_1E5FA9B28;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  id v3 = +[_UIRemoteViewController requestViewController:@"ServiceRemoteEngagementViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__SKRemoteEngagementPresenterViewController__loadRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (v12)
  {
    [WeakRetained setRemoteViewController:v12];
    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = [v7 remoteViewController];
    [v9 setDelegate:v8];

    [v7 addChildViewController:*(void *)(*(void *)(a1 + 32) + 984)];
    [v7 _addRemoteView];
  }
  else
  {
    NSLog(&cfstr_CouldNotReques.isa, v5);
    [v7 dismissViewControllerAnimated:1 completion:0];
    uint64_t v10 = [v7 delegate];
    [v10 engagementTaskDidFinishWithResult:0 resultData:0 error:v5 completion:&__block_literal_global_3];
  }
  id v11 = [v7 remoteViewControllerSemaphore];
  dispatch_semaphore_signal(v11);
}

- (void)_addRemoteView
{
  if (self->_remoteViewController
    && [(SKRemoteEngagementPresenterViewController *)self isViewLoaded])
  {
    id v4 = [(SKRemoteEngagementPresenterViewController *)self view];
    id v3 = [(SKRemoteEngagementRemoteViewController *)self->_remoteViewController view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
    [v3 setAutoresizingMask:18];
    [v4 addSubview:v3];
  }
}

- (SKEngagementPresenterProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKEngagementPresenterProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKRemoteEngagementRemoteViewController)remoteViewController
{
  return (SKRemoteEngagementRemoteViewController *)objc_getProperty(self, a2, 984, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (OS_dispatch_queue)engagementPresentationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 992, 1);
}

- (OS_dispatch_semaphore)remoteViewControllerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 1000, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerSemaphore, 0);
  objc_storeStrong((id *)&self->_engagementPresentationQueue, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Timed out waiting to view service", v0, 2u);
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __100__SKRemoteEngagementPresenterViewController_presentEngagementRequestData_clientBundleID_completion___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end