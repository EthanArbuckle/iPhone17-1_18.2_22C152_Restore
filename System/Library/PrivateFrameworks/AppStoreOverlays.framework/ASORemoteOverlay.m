@interface ASORemoteOverlay
+ (OS_os_log)log;
+ (id)dismissOverlayOperationWithContextProvider:(id)a3;
- (ASCSignpostSpan)hostSpan;
- (ASOOverlay)overlay;
- (ASOOverlayConfiguration)overlayConfiguration;
- (ASOOverlayTransitionContext)presentationTransitionContext;
- (ASORemoteOverlay)initWithOverlay:(id)a3 contextProvider:(id)a4 hostSpan:(id)a5;
- (ASORemoteOverlayHost)contextProvider;
- (BOOL)isActive;
- (BOOL)isLoaded;
- (id)context;
- (id)presentOverlayOperation;
- (void)finishWithError:(id)a3;
- (void)remoteStoreOverlayDidFailToLoadWithError:(id)a3;
- (void)remoteStoreOverlayDidFinishDismissal:(id)a3;
- (void)remoteStoreOverlayDidFinishPresentation:(id)a3;
- (void)remoteStoreOverlayWillStartDismissing:(id)a3 executeBlock:(id)a4;
- (void)remoteStoreOverlayWillStartPresenting:(id)a3 executeBlock:(id)a4;
- (void)setContextProvider:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setOverlay:(id)a3;
- (void)setPresentationTransitionContext:(id)a3;
@end

@implementation ASORemoteOverlay

+ (OS_os_log)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)log_log;

  return (OS_os_log *)v2;
}

uint64_t __23__ASORemoteOverlay_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.AppStoreOverlays", "ASORemoteOverlay");

  return MEMORY[0x270F9A758]();
}

- (ASORemoteOverlay)initWithOverlay:(id)a3 contextProvider:(id)a4 hostSpan:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASORemoteOverlay;
  v12 = [(ASORemoteOverlay *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_overlay, a3);
    objc_storeWeak((id *)&v13->_contextProvider, v10);
    objc_storeStrong((id *)&v13->_hostSpan, a5);
    *(_WORD *)&v13->_isLoaded = 256;
  }

  return v13;
}

- (void)finishWithError:(id)a3
{
  id v20 = a3;
  if ([(ASORemoteOverlay *)self isActive])
  {
    if ([(ASORemoteOverlay *)self isLoaded])
    {
      v4 = [ASOOverlayTransitionContext alloc];
      v5 = [(ASORemoteOverlay *)self presentationTransitionContext];
      [v5 endFrameInternal];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      v14 = [(ASORemoteOverlay *)self presentationTransitionContext];
      [v14 startFrameInternal];
      v19 = -[ASOOverlayTransitionContext initWithStartFrame:endFrame:](v4, "initWithStartFrame:endFrame:", v7, v9, v11, v13, v15, v16, v17, v18);

      [(ASORemoteOverlay *)self remoteStoreOverlayWillStartDismissing:v19 executeBlock:&__block_literal_global_4];
      [(ASORemoteOverlay *)self remoteStoreOverlayDidFinishDismissal:v19];
    }
    else
    {
      [(ASORemoteOverlay *)self remoteStoreOverlayDidFailToLoadWithError:v20];
    }
    [(ASORemoteOverlay *)self setIsActive:0];
  }
}

- (id)presentOverlayOperation
{
  v2 = [[ASOPresentRemoteOverlayOperation alloc] initWithRemoteOverlay:self];

  return v2;
}

+ (id)dismissOverlayOperationWithContextProvider:(id)a3
{
  id v3 = a3;
  v4 = [[ASODismissRemoteOverlayOperation alloc] initWithContextProvider:v3];

  return v4;
}

- (id)context
{
  v2 = [(ASORemoteOverlay *)self contextProvider];
  id v3 = [v2 hostContextForOverlayViewService];

  return v3;
}

- (ASOOverlayConfiguration)overlayConfiguration
{
  id v3 = [(ASORemoteOverlay *)self overlay];
  v4 = [v3 overlayConfiguration];
  v5 = (void *)[v4 copyWithZone:0];

  double v6 = [(ASORemoteOverlay *)self hostSpan];
  [v5 setAdditionalValue:v6 forKey:@"ASOOverlayConfigurationParameterHostSignpostSpan"];

  double v7 = NSNumber;
  double v8 = [MEMORY[0x263F1C5C0] currentDevice];
  double v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "userInterfaceIdiom"));
  [v5 setAdditionalValue:v9 forKey:@"ASOOverlayConfigurationParameterHostIdiom"];

  return (ASOOverlayConfiguration *)v5;
}

- (void)remoteStoreOverlayDidFailToLoadWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[ASORemoteOverlay log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_DEFAULT, "Store overlay did fail to load with error: %@", buf, 0xCu);
  }

  [(ASORemoteOverlay *)self setIsActive:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ASORemoteOverlay_remoteStoreOverlayDidFailToLoadWithError___block_invoke;
  v7[3] = &unk_26431CE10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __61__ASORemoteOverlay_remoteStoreOverlayDidFailToLoadWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) overlay];
  id v3 = [v2 overlayDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFailToLoadWithError:", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) overlay];
    double v7 = [v6 overlayDelegate];
    id v8 = [*(id *)(a1 + 32) overlay];
    [v7 storeOverlay:v8 didFailToLoadWithError:*(void *)(a1 + 40)];

    double v9 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_218366000, v9, OS_LOG_TYPE_INFO, "Delegate didFailToLoadWithError: returned", v10, 2u);
    }
  }
}

- (void)remoteStoreOverlayWillStartPresenting:(id)a3 executeBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ASORemoteOverlay *)self setIsLoaded:1];
  [(ASORemoteOverlay *)self setPresentationTransitionContext:v6];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke;
  block[3] = &unk_26431CF88;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke(id *a1)
{
  v2 = [a1[4] overlay];
  id v3 = [v2 overlayDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_INFO, "Calling delegate willStartPresentation:", buf, 2u);
    }

    id v6 = [a1[4] overlay];
    id v7 = [v6 overlayDelegate];
    id v8 = [a1[4] overlay];
    [v7 storeOverlay:v8 willStartPresentation:a1[5]];

    id v9 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v9, OS_LOG_TYPE_INFO, "Delegate willStartPresentation: returned", buf, 2u);
    }
  }
  id v10 = [a1[4] contextProvider];
  [v10 willStartPresentingOverlay:a1[4] transitionContext:a1[5]];

  id v11 = +[ASORemoteOverlay log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_cold_1(v11);
  }

  id v12 = [a1[4] contextProvider];
  double v13 = [v12 remoteViewControllerForOverlayViewService];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_14;
  v14[3] = &unk_26431CF60;
  id v16 = a1[6];
  id v15 = a1[5];
  [v13 synchronizeAnimationsInActions:v14];
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_14(uint64_t a1)
{
  v2 = +[ASORemoteOverlay log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, v2, OS_LOG_TYPE_INFO, "Calling view service present execute block", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_16;
  v3[3] = &unk_26431CD10;
  id v4 = *(id *)(a1 + 32);
  +[ASOOverlayAnimator performAnimations:v3 completion:0];
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_16(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "animationBlocks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)remoteStoreOverlayDidFinishPresentation:(id)a3
{
  id v4 = a3;
  [(ASORemoteOverlay *)self setPresentationTransitionContext:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__ASORemoteOverlay_remoteStoreOverlayDidFinishPresentation___block_invoke;
  v6[3] = &unk_26431CE10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __60__ASORemoteOverlay_remoteStoreOverlayDidFinishPresentation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) overlay];
  uint64_t v3 = [v2 overlayDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFinishPresentation:", buf, 2u);
    }

    long long v6 = [*(id *)(a1 + 32) overlay];
    id v7 = [v6 overlayDelegate];
    long long v8 = [*(id *)(a1 + 32) overlay];
    [v7 storeOverlay:v8 didFinishPresentation:*(void *)(a1 + 40)];

    long long v9 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_218366000, v9, OS_LOG_TYPE_INFO, "Delegate didFinishPresentation: returned", v10, 2u);
    }
  }
}

- (void)remoteStoreOverlayWillStartDismissing:(id)a3 executeBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke;
  block[3] = &unk_26431CF88;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] overlay];
  uint64_t v3 = [v2 overlayDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_INFO, "Calling delegate willStartDismissal:", buf, 2u);
    }

    id v6 = [a1[4] overlay];
    id v7 = [v6 overlayDelegate];
    id v8 = [a1[4] overlay];
    [v7 storeOverlay:v8 willStartDismissal:a1[5]];

    id v9 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v9, OS_LOG_TYPE_INFO, "Delegate willStartDismissal: returned", buf, 2u);
    }
  }
  id v10 = +[ASORemoteOverlay log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, v10, OS_LOG_TYPE_INFO, "Starting dismissal synchronized animations", buf, 2u);
  }

  id v11 = [a1[4] contextProvider];
  id v12 = [v11 remoteViewControllerForOverlayViewService];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_21;
  v13[3] = &unk_26431CF60;
  id v15 = a1[6];
  id v14 = a1[5];
  [v12 synchronizeAnimationsInActions:v13];
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = +[ASORemoteOverlay log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, v2, OS_LOG_TYPE_INFO, "Calling view service dismiss execute block", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_22;
  v3[3] = &unk_26431CD10;
  id v4 = *(id *)(a1 + 32);
  +[ASOOverlayAnimator performAnimations:v3 completion:0];
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartDismissing_executeBlock___block_invoke_22(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "animationBlocks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)remoteStoreOverlayDidFinishDismissal:(id)a3
{
  id v4 = a3;
  [(ASORemoteOverlay *)self setIsActive:0];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __57__ASORemoteOverlay_remoteStoreOverlayDidFinishDismissal___block_invoke;
  id v10 = &unk_26431CE10;
  uint64_t v11 = self;
  id v12 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], &v7);
  long long v6 = [(ASORemoteOverlay *)self contextProvider];
  [v6 didFinishDismissingOverlay:self];
}

void __57__ASORemoteOverlay_remoteStoreOverlayDidFinishDismissal___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) overlay];
  uint64_t v3 = [v2 overlayDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218366000, v5, OS_LOG_TYPE_INFO, "Calling delegate didFinishDismissal:", buf, 2u);
    }

    long long v6 = [*(id *)(a1 + 32) overlay];
    uint64_t v7 = [v6 overlayDelegate];
    uint64_t v8 = [*(id *)(a1 + 32) overlay];
    [v7 storeOverlay:v8 didFinishDismissal:*(void *)(a1 + 40)];

    long long v9 = +[ASORemoteOverlay log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_218366000, v9, OS_LOG_TYPE_INFO, "Delegate didFinishDismissal: returned", v10, 2u);
    }
  }
}

- (ASORemoteOverlayHost)contextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);

  return (ASORemoteOverlayHost *)WeakRetained;
}

- (void)setContextProvider:(id)a3
{
}

- (ASOOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (ASCSignpostSpan)hostSpan
{
  return self->_hostSpan;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (ASOOverlayTransitionContext)presentationTransitionContext
{
  return self->_presentationTransitionContext;
}

- (void)setPresentationTransitionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationTransitionContext, 0);
  objc_storeStrong((id *)&self->_hostSpan, 0);
  objc_storeStrong((id *)&self->_overlay, 0);

  objc_destroyWeak((id *)&self->_contextProvider);
}

void __71__ASORemoteOverlay_remoteStoreOverlayWillStartPresenting_executeBlock___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218366000, log, OS_LOG_TYPE_DEBUG, "Starting presentation synchronized animations", v1, 2u);
}

@end