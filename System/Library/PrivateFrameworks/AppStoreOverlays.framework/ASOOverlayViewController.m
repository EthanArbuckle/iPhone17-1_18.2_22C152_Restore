@interface ASOOverlayViewController
- (ASOHostContext)context;
- (ASOOverlayManager)overlayManager;
- (ASOOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ASORemoteOverlay)currentOverlay;
- (ASORemoteViewController)remoteViewController;
- (BOOL)isViewServiceLoading;
- (NSOperationQueue)presentationQueue;
- (OS_dispatch_queue)viewServiceQueue;
- (void)_loadRemoteViewController:(id)a3;
- (void)_loadViewServiceIfNeeded:(id)a3;
- (void)didEnterBackground;
- (void)didFinishDismissingOverlay:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)dismissOverlay;
- (void)failAllQueuedOverlaysWithError:(id)a3;
- (void)loadViewServiceIfNeeded;
- (void)presentOverlay:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentOverlay:(id)a3;
- (void)setIsViewServiceLoading:(BOOL)a3;
- (void)setOverlayManager:(id)a3;
- (void)setPresentationQueue:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setViewServiceQueue:(id)a3;
- (void)shutdownViewServiceIfOverlayOffScreen;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)willStartPresentingOverlay:(id)a3 transitionContext:(id)a4;
@end

@implementation ASOOverlayViewController

- (ASOOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)ASOOverlayViewController;
  v4 = [(UIApplicationRotationFollowingController *)&v12 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_isViewServiceLoading = 0;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AppStoreOverlays.viewServiceLoader", v6);
    viewServiceQueue = v5->_viewServiceQueue;
    v5->_viewServiceQueue = (OS_dispatch_queue *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    presentationQueue = v5->_presentationQueue;
    v5->_presentationQueue = v9;

    [(NSOperationQueue *)v5->_presentationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_presentationQueue setSuspended:1];
  }
  return v5;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ASOOverlayViewController;
  [(ASOOverlayViewController *)&v12 viewDidLoad];
  [(ASOOverlayViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
  v3 = [(ASOOverlayViewController *)self view];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];

  double v4 = *MEMORY[0x263F1D1C0];
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v7 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  v8 = [(ASOOverlayViewController *)self view];
  objc_msgSend(v8, "setLayoutMargins:", v4, v5, v6, v7);

  v9 = [(ASOOverlayViewController *)self view];
  [v9 setUserInteractionEnabled:0];

  [(ASOOverlayViewController *)self loadViewServiceIfNeeded];
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_didEnterBackground name:*MEMORY[0x263F1D050] object:0];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:self selector:sel_didEnterBackground name:*MEMORY[0x263F07FC8] object:0];
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)ASOOverlayViewController;
  [(ASOOverlayViewController *)&v23 viewDidLayoutSubviews];
  v3 = [(ASOOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(ASOOverlayViewController *)self view];
  [v12 layoutMargins];
  double v14 = v5 + v13;
  double v16 = v7 + v15;
  double v18 = v9 - (v13 + v17);
  double v20 = v11 - (v15 + v19);

  v21 = [(ASOOverlayViewController *)self remoteViewController];
  v22 = [v21 view];
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);
}

- (void)presentOverlay:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = ASOViewRenderOverlayRequested();
  [(ASOOverlayViewController *)self loadViewServiceIfNeeded];
  double v6 = [[ASORemoteOverlay alloc] initWithOverlay:v4 contextProvider:self hostSpan:v5];
  double v7 = [(ASOOverlayViewController *)self presentationQueue];
  double v8 = [(ASORemoteOverlay *)v6 presentOverlayOperation];
  [v7 addOperation:v8];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    double v9 = [v4 overlayConfiguration];
    double v10 = [(ASOOverlayViewController *)self presentationQueue];
    int v11 = 138412802;
    id v12 = v4;
    __int16 v13 = 2112;
    double v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = [v10 operationCount];
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Queue the presentation of %@ with configuration %@ (queue size: %lu)", (uint8_t *)&v11, 0x20u);
  }
}

- (void)dismissOverlay
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(ASOOverlayViewController *)self presentationQueue];
  id v4 = +[ASORemoteOverlay dismissOverlayOperationWithContextProvider:self];
  [v3 addOperation:v4];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    double v5 = [(ASOOverlayViewController *)self presentationQueue];
    int v6 = 134217984;
    uint64_t v7 = [v5 operationCount];
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "View controller did queue dismissal (queue size: %lu)", (uint8_t *)&v6, 0xCu);
  }
}

- (void)failAllQueuedOverlaysWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [v4 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Sending failed events to all overlays because of error: %@", buf, 0xCu);
  }
  int v6 = [(ASOOverlayViewController *)self presentationQueue];
  [v6 setSuspended:1];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(ASOOverlayViewController *)self presentationQueue];
  uint64_t v8 = [v7 operations];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    __int16 v13 = &_os_log_internal;
    *(void *)&long long v10 = 138412290;
    long long v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        __int16 v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isCancelled", v17) & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v17;
              v24 = v15;
              _os_log_impl(&dword_218366000, v13, OS_LOG_TYPE_INFO, "Cancelling operation in presentation queue: %@", buf, 0xCu);
            }
            uint64_t v16 = [v15 remoteOverlay];
            [v16 finishWithError:v4];
          }
          [v15 cancel];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)loadViewServiceIfNeeded
{
  v3 = [(ASOOverlayViewController *)self viewServiceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke;
  block[3] = &unk_26431CD10;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke_2;
  v6[3] = &unk_26431CE48;
  uint64_t v7 = v2;
  id v4 = v2;
  [v3 _loadViewServiceIfNeeded:v6];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v4, v5);
}

void __51__ASOOverlayViewController_loadViewServiceIfNeeded__block_invoke_2(uint64_t a1)
{
}

- (void)_loadViewServiceIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_time_t v5 = [(ASOOverlayViewController *)self remoteViewController];
  if (v5)
  {

    goto LABEL_4;
  }
  if ([(ASOOverlayViewController *)self isViewServiceLoading])
  {
LABEL_4:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v6 = [(ASOOverlayViewController *)self remoteViewController];
      *(_DWORD *)buf = 67109376;
      BOOL v10 = v6 != 0;
      __int16 v11 = 1024;
      BOOL v12 = [(ASOOverlayViewController *)self isViewServiceLoading];
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Not loading view service because the service is already loaded (%d) or is currently loading (%d)", buf, 0xEu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Attempt to start loading overlay view service", buf, 2u);
  }
  [(ASOOverlayViewController *)self setIsViewServiceLoading:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke;
  v7[3] = &unk_26431CE98;
  v7[4] = self;
  id v8 = v4;
  [(ASOOverlayViewController *)self _loadRemoteViewController:v7];

LABEL_9:
}

void __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Did finish view service load attempt", buf, 2u);
  }
  [*(id *)(a1 + 32) setIsViewServiceLoading:0];
  if (v7 && v8 && !v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Successfully loaded view service", buf, 2u);
    }
    [*(id *)(a1 + 32) setRemoteViewController:v7];
    [*(id *)(a1 + 32) addChildViewController:v7];
    BOOL v10 = [*(id *)(a1 + 32) view];
    __int16 v11 = [v7 view];
    [v10 addSubview:v11];

    [v7 didMoveToParentViewController:*(void *)(a1 + 32)];
    BOOL v12 = [*(id *)(a1 + 32) view];
    [v12 setNeedsLayout];

    [*(id *)(a1 + 32) setContext:v8];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke_14;
    v19[3] = &unk_26431CE70;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v13 = [*(id *)(a1 + 32) context];
    double v14 = [v13 _auxiliaryConnection];
    [v14 setInvalidationHandler:v19];

    __int16 v15 = [*(id *)(a1 + 32) presentationQueue];
    [v15 setSuspended:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "An error occurred while loading the view service: %@", buf, 0xCu);
    }
    long long v17 = *(void **)(a1 + 32);
    long long v18 = [MEMORY[0x263F087E8] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    [v17 failAllQueuedOverlaysWithError:v18];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __53__ASOOverlayViewController__loadViewServiceIfNeeded___block_invoke_14(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Extension auxiliary connection invalidated", v8, 2u);
  }
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
  [WeakRetained failAllQueuedOverlaysWithError:v4];

  id v5 = objc_loadWeakRetained(v2);
  int v6 = [v5 remoteViewController];
  id v7 = (id)[v6 disconnect];
}

- (void)_loadRemoteViewController:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F08800];
  uint64_t v10 = *MEMORY[0x263F07FE0];
  v11[0] = @"com.apple.AppStoreOverlays.ViewService";
  int v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke;
  v8[3] = &unk_26431CF10;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 extensionsWithMatchingAttributes:v6 completion:v8];
}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v6 || !v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to find the overlay view service extension with error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Did find overlay view service extension: %@", buf, 0xCu);
    }
    id v8 = [v5 firstObject];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_21;
    block[3] = &unk_26431CEE8;
    id v13 = v8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v9;
    id v10 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_21(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_2;
  v5[3] = &unk_26431CEC0;
  id v7 = *(id *)(a1 + 48);
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  [v2 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v5];
}

void __54__ASOOverlayViewController__loadRemoteViewController___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [v10 localizedDescription];
      int v14 = 138412290;
      id v15 = v12;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to instantiate remote view controller with error: %@", (uint8_t *)&v14, 0xCu);
    }
    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Remote view controller (%@) is not an ASORemoteViewController", (uint8_t *)&v14, 0xCu);
    }
    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_15:
    v13();
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Did instantiate remote view controller.", (uint8_t *)&v14, 2u);
  }
  [v8 setDelegate:*(void *)(a1 + 32)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Getting context for extension (request UUID: %@)", (uint8_t *)&v14, 0xCu);
  }
  __int16 v11 = [*(id *)(a1 + 40) _extensionContextForUUID:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_16:
}

- (void)willStartPresentingOverlay:(id)a3 transitionContext:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Will start presenting overlay %@.", (uint8_t *)&v7, 0xCu);
  }
  [(ASOOverlayViewController *)self setCurrentOverlay:v5];
  int8x16_t v6 = [(ASOOverlayViewController *)self overlayManager];
  [v6 willStartPresentingOverlay];
}

- (void)didFinishDismissingOverlay:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Did finish presenting overlay %@.", (uint8_t *)&v6, 0xCu);
  }
  [(ASOOverlayViewController *)self setCurrentOverlay:0];
  id v5 = [(ASOOverlayViewController *)self overlayManager];
  [v5 didFinishDismissingOverlay];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  int8x16_t v4 = [(ASOOverlayViewController *)self remoteViewController];
  [v4 willMoveToParentViewController:0];

  id v5 = [(ASOOverlayViewController *)self remoteViewController];
  int v6 = [v5 view];
  [v6 removeFromSuperview];

  id v7 = [(ASOOverlayViewController *)self remoteViewController];
  [v7 didMoveToParentViewController:0];

  [(ASOOverlayViewController *)self setContext:0];
  [(ASOOverlayViewController *)self setRemoteViewController:0];
  uint64_t v8 = [(ASOOverlayViewController *)self presentationQueue];
  [v8 setSuspended:1];

  id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
  uint64_t v9 = [(ASOOverlayViewController *)self currentOverlay];

  if (v9)
  {
    id v10 = [(ASOOverlayViewController *)self currentOverlay];
    [v10 finishWithError:v12];

    [(ASOOverlayViewController *)self setCurrentOverlay:0];
    __int16 v11 = [(ASOOverlayViewController *)self overlayManager];
    [v11 didFinishDismissingOverlay];
  }
}

- (void)didReceiveMemoryWarning
{
  v4.receiver = self;
  v4.super_class = (Class)ASOOverlayViewController;
  [(ASOOverlayViewController *)&v4 didReceiveMemoryWarning];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "App hosting overlay did receive memory warning", v3, 2u);
  }
  [(ASOOverlayViewController *)self shutdownViewServiceIfOverlayOffScreen];
}

- (void)didEnterBackground
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "App hosting overlay did enter background", v3, 2u);
  }
  [(ASOOverlayViewController *)self shutdownViewServiceIfOverlayOffScreen];
}

- (void)shutdownViewServiceIfOverlayOffScreen
{
  id v3 = [(ASOOverlayViewController *)self currentOverlay];

  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v4)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Not shutting down view service because overlay is on-screen", v7, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Shutting down view service because overlay is off-screen", buf, 2u);
    }
    id v5 = [(ASOOverlayViewController *)self remoteViewController];
    id v6 = (id)[v5 disconnect];
  }
}

- (ASORemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (ASOHostContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (ASOHostContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (ASORemoteOverlay)currentOverlay
{
  return self->_currentOverlay;
}

- (void)setCurrentOverlay:(id)a3
{
}

- (OS_dispatch_queue)viewServiceQueue
{
  return self->_viewServiceQueue;
}

- (void)setViewServiceQueue:(id)a3
{
}

- (BOOL)isViewServiceLoading
{
  return self->_isViewServiceLoading;
}

- (void)setIsViewServiceLoading:(BOOL)a3
{
  self->_isViewServiceLoading = a3;
}

- (NSOperationQueue)presentationQueue
{
  return self->_presentationQueue;
}

- (void)setPresentationQueue:(id)a3
{
}

- (ASOOverlayManager)overlayManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayManager);

  return (ASOOverlayManager *)WeakRetained;
}

- (void)setOverlayManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overlayManager);
  objc_storeStrong((id *)&self->_presentationQueue, 0);
  objc_storeStrong((id *)&self->_viewServiceQueue, 0);
  objc_storeStrong((id *)&self->_currentOverlay, 0);
  objc_destroyWeak((id *)&self->_context);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end