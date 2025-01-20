@interface UIDocumentBrowserTransitionController
- (BOOL)encounteredUnrecoverableError;
- (BOOL)isCoordinatingForURL:(id)a3;
- (BOOL)shouldStopObservingProgress;
- (BOOL)transitionDidFinish;
- (DOCServiceTransitionProtocol)transitionController;
- (NSOperationQueue)transitionControllerQueue;
- (NSProgress)loadingProgress;
- (NSURL)itemURL;
- (UIDocumentBrowserTransitionController)init;
- (UIDocumentBrowserTransitionController)initWithItemURL:(id)a3 documentBrowserProxy:(id)a4 referenceView:(id)a5;
- (UIView)targetView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)dealloc;
- (void)doc_commonInit;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEncounteredUnrecoverableError:(BOOL)a3;
- (void)setItemURL:(id)a3;
- (void)setLoadingProgress:(NSProgress *)loadingProgress;
- (void)setShouldStopObservingProgress:(BOOL)a3;
- (void)setTargetView:(UIView *)targetView;
- (void)setTransitionController:(id)a3;
- (void)setTransitionControllerQueue:(id)a3;
- (void)setTransitionDidFinish:(BOOL)a3;
@end

@implementation UIDocumentBrowserTransitionController

- (UIDocumentBrowserTransitionController)init
{
  return 0;
}

- (UIDocumentBrowserTransitionController)initWithItemURL:(id)a3 documentBrowserProxy:(id)a4 referenceView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9
    && (v15.receiver = self,
        v15.super_class = (Class)UIDocumentBrowserTransitionController,
        v12 = [(UIDocumentBrowserTransitionController *)&v15 init],
        (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_itemURL, a3);
    objc_storeStrong((id *)&self->_serviceDocumentBrowserProxy, a4);
    objc_storeStrong((id *)&self->_referenceView, a5);
    [(UIDocumentBrowserTransitionController *)self doc_commonInit];
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isCoordinatingForURL:(id)a3
{
  id v4 = a3;
  if (([(NSURL *)self->_itemURL isEqual:v4] & 1) != 0
    || ([(NSURL *)self->_itemURL standardizedURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 standardizedURL],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqual:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(NSURL *)self->_itemURL URLByStandardizingPath];
    id v10 = [v4 URLByStandardizingPath];
    char v8 = [v9 isEqual:v10];
  }
  return v8;
}

- (void)doc_commonInit
{
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = (NSObject **)MEMORY[0x263F3AC28];
    id v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F3AC28];
  v5 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) setTransitionController:v3];
  v12 = [*(id *)(a1 + 32) transitionControllerQueue];
  [v12 setSuspended:0];

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 56) stopAccessingSecurityScopedResource];
  }
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F3AC28];
  v5 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) setTransitionController:v3];
  v12 = [*(id *)(a1 + 32) transitionControllerQueue];
  [v12 setSuspended:0];
}

- (void)setLoadingProgress:(NSProgress *)loadingProgress
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = loadingProgress;
  p_loadingProgress = (id *)&self->_loadingProgress;
  if (self->_loadingProgress != v5)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    if (v7->_shouldStopObservingProgress && *p_loadingProgress)
    {
      uint64_t v8 = (NSObject **)MEMORY[0x263F3AC88];
      uint64_t v9 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        uint64_t v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *p_loadingProgress;
        *(_DWORD *)buf = 138543362;
        id v18 = v10;
        _os_log_impl(&dword_21361D000, v9, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] REMOVE fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      [*p_loadingProgress removeObserver:v7 forKeyPath:@"fractionCompleted"];
      [*p_loadingProgress removeObserver:v7 forKeyPath:@"isIndeterminate"];
      v7->_shouldStopObservingProgress = 0;
    }
    objc_sync_exit(v7);

    objc_storeStrong(p_loadingProgress, loadingProgress);
    transitionControllerQueue = v7->_transitionControllerQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__UIDocumentBrowserTransitionController_setLoadingProgress___block_invoke;
    v16[3] = &unk_2641B15E8;
    v16[4] = v7;
    [(NSOperationQueue *)transitionControllerQueue addOperationWithBlock:v16];
    if (*p_loadingProgress && ([*p_loadingProgress isFinished] & 1) == 0)
    {
      v12 = v7;
      objc_sync_enter(v12);
      v13 = (NSObject **)MEMORY[0x263F3AC88];
      v14 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = *p_loadingProgress;
        *(_DWORD *)buf = 138543362;
        id v18 = v15;
        _os_log_impl(&dword_21361D000, v14, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] ADD fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      [*p_loadingProgress addObserver:v12 forKeyPath:@"fractionCompleted" options:1 context:&UIDocumentBrowserTransitionControllerKVOContext];
      [*p_loadingProgress addObserver:v12 forKeyPath:@"isIndeterminate" options:1 context:&UIDocumentBrowserTransitionControllerKVOContext];
      v7->_shouldStopObservingProgress = 1;
      objc_sync_exit(v12);
    }
  }
}

void __60__UIDocumentBrowserTransitionController_setLoadingProgress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) loadingProgress];
  uint64_t v2 = (v5 != 0) & ~[*(id *)(a1 + 32) transitionDidFinish];
  id v3 = [*(id *)(a1 + 32) transitionController];
  [v5 fractionCompleted];
  objc_msgSend(v3, "setHasProgress:loadingFractionCompleted:setIsIndeterminate:", v2, objc_msgSend(v5, "isIndeterminate"), v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &UIDocumentBrowserTransitionControllerKVOContext)
  {
    transitionController = self->_transitionController;
    loadingProgress = self->_loadingProgress;
    BOOL v10 = !self->_transitionDidFinish && loadingProgress != 0;
    [(NSProgress *)loadingProgress fractionCompleted];
    double v12 = v11;
    BOOL v13 = [(NSProgress *)self->_loadingProgress isIndeterminate];
    [(DOCServiceTransitionProtocol *)transitionController setHasProgress:v10 loadingFractionCompleted:v13 setIsIndeterminate:v12];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIDocumentBrowserTransitionController;
    -[UIDocumentBrowserTransitionController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(UIDocumentBrowserTransitionController *)v2 loadingProgress];
  if (v3)
  {
    BOOL v4 = [(UIDocumentBrowserTransitionController *)v2 shouldStopObservingProgress];

    if (v4)
    {
      id v5 = (NSObject **)MEMORY[0x263F3AC88];
      uint64_t v6 = *MEMORY[0x263F3AC88];
      if (!*MEMORY[0x263F3AC88])
      {
        DOCInitLogging();
        uint64_t v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        loadingProgress = v2->_loadingProgress;
        *(_DWORD *)buf = 138543362;
        double v12 = loadingProgress;
        _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] REMOVE-DEALLOC fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      uint64_t v8 = [(UIDocumentBrowserTransitionController *)v2 loadingProgress];
      [v8 removeObserver:v2 forKeyPath:@"fractionCompleted"];

      uint64_t v9 = [(UIDocumentBrowserTransitionController *)v2 loadingProgress];
      [v9 removeObserver:v2 forKeyPath:@"isIndeterminate"];

      [(UIDocumentBrowserTransitionController *)v2 setShouldStopObservingProgress:0];
    }
  }
  objc_sync_exit(v2);

  v10.receiver = v2;
  v10.super_class = (Class)UIDocumentBrowserTransitionController;
  [(UIDocumentBrowserTransitionController *)&v10 dealloc];
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(UIDocumentBrowserTransitionController *)self encounteredUnrecoverableError])
  {
    uint64_t v6 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v7 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UIDocumentBrowserTransitionController animateTransition:](v7);
    }
    [v5 completeTransition:1];
    goto LABEL_24;
  }
  uint64_t v8 = [v5 viewControllerForKey:*MEMORY[0x263F83C00]];
  uint64_t v9 = [v5 viewControllerForKey:*MEMORY[0x263F83C10]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      if ([v11 isEqualToString:@"DOCServiceBrowserViewController"])
      {
LABEL_12:

        goto LABEL_13;
      }
      double v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      char v14 = [v13 isEqualToString:@"DOCServiceBrowserViewController"];

      if ((v14 & 1) == 0)
      {
        double v11 = [MEMORY[0x263F08690] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"UIDocumentBrowserTransitionController.m", 192, @"UIDocumentBrowserTransitionController can only be used when transitioning from or to a viewController of type UIDocumentBrowserViewController. sourceViewController: %@, destinationViewController: %@", v8, v9 object file lineNumber description];
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = 1;
  }
  else
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v15 = [v17 isEqualToString:@"DOCServiceBrowserViewController"];
  }
  id v18 = [v5 containerView];
  uint64_t v19 = [v5 viewForKey:*MEMORY[0x263F83C08]];
  v20 = [v5 viewForKey:*MEMORY[0x263F83C18]];
  [v20 setAutoresizingMask:18];
  [v18 bounds];
  objc_msgSend(v20, "setFrame:");
  [v20 setAlpha:0.0];
  v34 = (void *)v9;
  if (v15) {
    [v18 insertSubview:v20 belowSubview:v19];
  }
  else {
    [v18 addSubview:v20];
  }
  v21 = (NSObject **)MEMORY[0x263F3AC28];
  v22 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v22 = *v21;
  }
  v35 = (void *)v8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v50 = v15;
    _os_log_impl(&dword_21361D000, v22, OS_LOG_TYPE_INFO, "Starting transition. Presenting: %d", buf, 8u);
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke;
  v42[3] = &unk_2641B1CC8;
  id v23 = v18;
  id v43 = v23;
  id v44 = v19;
  id v45 = v20;
  v46 = self;
  id v47 = v5;
  char v48 = v15;
  id v24 = v20;
  id v25 = v19;
  v26 = (void *)MEMORY[0x21668E400](v42);
  v27 = self->_transitionController;
  v28 = self->_referenceView;
  transitionControllerQueue = self->_transitionControllerQueue;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_3;
  v36[3] = &unk_2641B1D40;
  char v41 = v15;
  v37 = v27;
  v38 = v28;
  id v39 = v23;
  id v40 = v26;
  id v30 = v26;
  id v31 = v23;
  v32 = v28;
  v33 = v27;
  [(NSOperationQueue *)transitionControllerQueue addOperationWithBlock:v36];

LABEL_24:
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) transitionDuration:*(void *)(a1 + 64)];
  double v18 = v17;
  uint64_t v19 = [*(id *)(a1 + 56) targetView];
  unsigned __int8 v20 = *(unsigned char *)(a1 + 72);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2;
  v24[3] = &unk_2641B1CA0;
  v21 = *(void **)(a1 + 64);
  v24[4] = *(void *)(a1 + 56);
  id v25 = v21;
  id v26 = *(id *)(a1 + 48);
  id v27 = v13;
  id v22 = v13;
  LOWORD(v23) = v20;
  +[DOCTransitionUtils performZoomTransitionInContainer:withSourceView:destinationView:duration:alterativeView:thumbnail:thumbnailStyle:location:presenting:fadingSource:completion:](DOCTransitionUtils, "performZoomTransitionInContainer:withSourceView:destinationView:duration:alterativeView:thumbnail:thumbnailStyle:location:presenting:fadingSource:completion:", v14, v15, v16, v19, v22, a3, v18, a4, a5, a6, a7, v23, v24);
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setTransitionDidFinish:1];
  BOOL v4 = [*(id *)(a1 + 32) transitionController];
  [v4 setHasProgress:0 loadingFractionCompleted:0 setIsIndeterminate:0.0];

  [*(id *)(a1 + 40) completeTransition:a2];
  [*(id *)(a1 + 48) setAlpha:1.0];
  [*(id *)(a1 + 32) setLoadingProgress:0];
  if (*(void *)(a1 + 56))
  {
    id v5 = [*(id *)(a1 + 32) transitionController];
    [v5 endTransition];
  }
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (NSObject **)MEMORY[0x263F3AC28];
  id v3 = *MEMORY[0x263F3AC28];
  if (*(void *)(a1 + 32))
  {
    if (!v3)
    {
      DOCInitLogging();
      id v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v3, OS_LOG_TYPE_INFO, "Item has a service browser, trying to get the display information", buf, 2u);
    }
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_28;
    v6[3] = &unk_2641B1D18;
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v7 getDisplayInformation:v5 withCompletionBlock:v6];
  }
  else
  {
    if (!v3)
    {
      DOCInitLogging();
      id v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v3, OS_LOG_TYPE_INFO, "No item service browser. Just adding the view.", buf, 2u);
    }
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_28(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v4 = v3;
  DOCRunInMainThread();
}

uint64_t __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2_29(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (NSObject **)MEMORY[0x263F3AC28];
  id v3 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    CGFloat v6 = *(double *)(a1 + 80);
    CGFloat v7 = *(double *)(a1 + 88);
    CGFloat v8 = *(double *)(a1 + 96);
    CGFloat v9 = *(double *)(a1 + 104);
    id v10 = v3;
    v22.origin.x = v6;
    v22.origin.y = v7;
    v22.size.width = v8;
    v22.size.height = v9;
    double v11 = NSStringFromCGRect(v22);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    unsigned __int8 v20 = v11;
    _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_INFO, "Display information received thumbnail: %@ style: %lu sourceRect: %@. Starting transition.", buf, 0x20u);
  }
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_30;
    block[3] = &unk_2641B15E8;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_msgSend(*(id *)(a1 + 48), "convertRect:toView:", *(void *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTransition];
}

- (NSProgress)loadingProgress
{
  return self->_loadingProgress;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  return (UIView *)WeakRetained;
}

- (void)setTargetView:(UIView *)targetView
{
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (BOOL)transitionDidFinish
{
  return self->_transitionDidFinish;
}

- (void)setTransitionDidFinish:(BOOL)a3
{
  self->_transitionDidFinish = a3;
}

- (DOCServiceTransitionProtocol)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
}

- (NSOperationQueue)transitionControllerQueue
{
  return self->_transitionControllerQueue;
}

- (void)setTransitionControllerQueue:(id)a3
{
}

- (BOOL)encounteredUnrecoverableError
{
  return self->_encounteredUnrecoverableError;
}

- (void)setEncounteredUnrecoverableError:(BOOL)a3
{
  self->_encounteredUnrecoverableError = a3;
}

- (BOOL)shouldStopObservingProgress
{
  return self->_shouldStopObservingProgress;
}

- (void)setShouldStopObservingProgress:(BOOL)a3
{
  self->_shouldStopObservingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionControllerQueue, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_loadingProgress, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_serviceDocumentBrowserProxy, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Remote object proxy disconnected with error: %@", (uint8_t *)&v2, 0xCu);
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)animateTransition:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "UIDocumentBrowserTransitionController: Encountered an unrecoverable error creating the remote transition coordinator. Falling back to a no animation transition", v1, 2u);
}

@end