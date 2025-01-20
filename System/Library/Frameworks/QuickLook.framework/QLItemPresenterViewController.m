@interface QLItemPresenterViewController
- (BOOL)_currentPreviewControllerIsErrorViewController;
- (BOOL)_processIsEntitledToCheckScreenTimePolicy;
- (BOOL)_processIsEntitledToConfigureScreenTime;
- (BOOL)_shouldApplyScreenTimeMoviePolicyForItem:(id)a3;
- (BOOL)canAnimateFromDetailViewToFullScreenPreview;
- (BOOL)downloadingItemViewControllerShouldForceAutodownloadFile:(id)a3;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)loadingFailed;
- (BOOL)printing;
- (CGSize)preferredContentSize;
- (DMFApplicationPolicyMonitor)screenTimeApplicationMonitor;
- (DMFCategoryPolicyMonitor)screenTimeCategoryMonitor;
- (NSString)hostApplicationBundleIdentifier;
- (NSString)parentApplicationDisplayIdentifier;
- (QLDownloadingItemViewController)downloadingController;
- (QLErrorItemViewController)errorViewController;
- (QLItem)previewItem;
- (QLItemPresenterViewController)init;
- (QLItemPresenterViewController)initWithHostApplicationBundleIdentifier:(id)a3 parentApplicationDisplayIdentifier:(id)a4;
- (QLItemViewController)previewProvider;
- (QLLoadingItemViewController)loadingViewController;
- (QLPreviewContext)context;
- (QLScreenTimeItemViewController)screenTimeController;
- (id)additionalItemViewControllerDescription;
- (id)contents;
- (id)initForPrinting:(BOOL)a3;
- (id)loadingCompletionHandler;
- (id)screenTimePolicyBundleIdentifier;
- (void)_cancelAllDeferredApperanceUpdates;
- (void)_didReceiveNewScreenTimeApplicationPolicies:(id)a3 error:(id)a4;
- (void)_didReceiveNewScreenTimeCategoryPolicy:(id)a3 error:(id)a4;
- (void)_didReceiveNewScreenTimePolicy:(int64_t)a3;
- (void)_hideScreenTimeViewControllerIfNeeded;
- (void)_performLoadingCompletionHandlerWithError:(id)a3;
- (void)_performReadyBlockIfNedded;
- (void)_queryScreenTimeCategoryPolicy;
- (void)_queryScreenTimePolicyForBundleIdentifier:(id)a3;
- (void)_setupScreenTimeApplicationHandling;
- (void)_setupScreenTimeCategoryHandling;
- (void)_setupScreenTimeHandling;
- (void)_showLoadingViewControllerDeferredIfNeeded;
- (void)_showReadyToDisplayPreviewViewControllerDeferredIfNeeded:(id)a3;
- (void)_showScreenTimeViewControllerWithPolicy:(int64_t)a3;
- (void)_startLoadingPreviewWithContents:(id)a3;
- (void)downloadingItemViewControllerDidFinishLoadingPreviewItem:(id)a3 withContents:(id)a4;
- (void)isReadyForDisplayWithCompletionHandler:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setContents:(id)a3;
- (void)setContext:(id)a3;
- (void)setDownloadingController:(id)a3;
- (void)setErrorViewController:(id)a3;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setLoadingCompletionHandler:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)setParentApplicationDisplayIdentifier:(id)a3;
- (void)setPreviewItem:(id)a3;
- (void)setPreviewProvider:(id)a3;
- (void)setPrinting:(BOOL)a3;
- (void)setScreenTimeApplicationMonitor:(id)a3;
- (void)setScreenTimeCategoryMonitor:(id)a3;
- (void)setScreenTimeController:(id)a3;
- (void)showErrorViewController;
- (void)showPreviewProviderViewController;
- (void)showPreviewViewController:(id)a3;
- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4;
- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4 updatingIsReadyForDisplay:(BOOL)a5;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)updatePreviewItemDisplayState:(id)a3;
@end

@implementation QLItemPresenterViewController

- (QLItemPresenterViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)QLItemPresenterViewController;
  v2 = [(QLItemViewController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(QLItemViewController *)v2 setPresentingDelegate:v2];
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.quicklook.preview-loading.serial-queue", v4);
    previewLoadingQueue = v3->previewLoadingQueue;
    v3->previewLoadingQueue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

- (QLItemPresenterViewController)initWithHostApplicationBundleIdentifier:(id)a3 parentApplicationDisplayIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [(QLItemPresenterViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentApplicationDisplayIdentifier, a4);
    objc_storeStrong((id *)&v10->_hostApplicationBundleIdentifier, a3);
    v11 = v10;
  }

  return v10;
}

- (id)initForPrinting:(BOOL)a3
{
  v4 = [(QLItemPresenterViewController *)self init];
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    v4->_printing = a3;
    v6 = v4;
  }

  return v5;
}

- (void)_showLoadingViewControllerDeferredIfNeeded
{
  v3 = [(QLItemPresenterViewController *)self previewProvider];
  int v4 = [v3 presenterShouldHandleLoadingView:self->_previewItem readyToDisplay:0];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__QLItemPresenterViewController__showLoadingViewControllerDeferredIfNeeded__block_invoke;
    block[3] = &unk_2642F5430;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
}

void __75__QLItemPresenterViewController__showLoadingViewControllerDeferredIfNeeded__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) previewProvider];
  if (([v4 isLoaded] & 1) == 0)
  {
    int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1147);

    if (v2) {
      return;
    }
    v3 = *(void **)(a1 + 32);
    id v4 = [v3 loadingViewController];
    objc_msgSend(v3, "showPreviewViewController:");
  }
}

- (void)_showReadyToDisplayPreviewViewControllerDeferredIfNeeded:(id)a3
{
  previewItem = self->_previewItem;
  id v5 = a3;
  double v6 = maxLoadingItemForItem(previewItem);
  [v5 timeIntervalSinceNow];
  double v8 = v7;

  double v9 = 0.0;
  if (v6 + v8 > 0.0) {
    double v9 = (v6 + v8) * 1000000000.0;
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__QLItemPresenterViewController__showReadyToDisplayPreviewViewControllerDeferredIfNeeded___block_invoke;
  block[3] = &unk_2642F5430;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
}

void __90__QLItemPresenterViewController__showReadyToDisplayPreviewViewControllerDeferredIfNeeded___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _currentPreviewControllerIsErrorViewController] & 1) == 0)
  {
    int v2 = *(void **)(a1 + 32);
    id v3 = [v2 previewProvider];
    [v2 showPreviewViewController:v3 animatingWithCrossfade:0];
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(QLItemPresenterViewController *)self setContents:v9];
  p_previewItem = (id *)&self->_previewItem;
  objc_storeStrong((id *)&self->_previewItem, a3);
  v13 = [(QLItem *)self->_previewItem createPreviewContext];
  [(QLItemPresenterViewController *)self setContext:v13];

  if ([(QLItem *)self->_previewItem previewItemType] == 15)
  {
    v14 = (NSObject **)MEMORY[0x263F62940];
    v15 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = *p_previewItem;
      *(_DWORD *)buf = 138412290;
      id v42 = v16;
      _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_DEBUG, "Will show error view controller because can't preview item: %@. #PreviewController", buf, 0xCu);
    }
    [(QLItemPresenterViewController *)self setLoadingCompletionHandler:v11];
    v17 = [(QLItemPresenterViewController *)self errorViewController];
    v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.QLErrorItemViewController" code:1 userInfo:0];
    [v17 setError:v18];

    [(QLItemPresenterViewController *)self showPreviewViewController:v17];
    goto LABEL_26;
  }
  v19 = [*p_previewItem fetcher];

  if (v19)
  {
    objc_initWeak((id *)buf, self);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
    v38[3] = &unk_2642F59E0;
    id v39 = v11;
    objc_copyWeak(&v40, (id *)buf);
    [(QLItemPresenterViewController *)self setLoadingCompletionHandler:v38];
    v20 = [MEMORY[0x263EFF910] date];
    v21 = [(QLItemPresenterViewController *)self previewProvider];
    id v22 = *p_previewItem;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
    v36[3] = &unk_2642F50C8;
    v36[4] = self;
    id v23 = v20;
    id v37 = v23;
    self->_shouldHandleLoadingView = [v21 presenterShouldHandleLoadingView:v22 readyToDisplay:v36];

    v24 = [*p_previewItem fetcher];
    if ([v24 isLongFetchOperation])
    {
      BOOL v25 = !self->_shouldHandleLoadingView;

      if (!v25)
      {
        v26 = [(QLItemPresenterViewController *)self downloadingController];
        [(QLItemPresenterViewController *)self showPreviewViewController:v26];
LABEL_25:

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
    }
    else
    {
    }
    if (!self->_shouldHandleLoadingView)
    {
      v28 = [(QLItemPresenterViewController *)self loadingViewController];
      [(QLItemPresenterViewController *)self showPreviewViewController:v28 animatingWithCrossfade:1 updatingIsReadyForDisplay:0];
    }
    if ([*p_previewItem previewItemType] != 13)
    {
      v29 = [(QLItemPresenterViewController *)self previewProvider];
      v30 = [*p_previewItem createPreviewContext];
      [v29 preloadViewControllerForContext:v30];
    }
    [(QLItemPresenterViewController *)self _showLoadingViewControllerDeferredIfNeeded];
    v26 = objc_opt_new();
    [*p_previewItem transformerClass];
    v31 = objc_opt_new();
    if (objc_opt_respondsToSelector()) {
      [v26 addObject:objc_opt_class()];
    }
    if (objc_opt_respondsToSelector()) {
      [v26 addObject:objc_opt_class()];
    }
    if (objc_opt_respondsToSelector()) {
      [v26 addObject:objc_opt_class()];
    }
    v32 = [*p_previewItem fetcher];
    v33 = objc_opt_new();
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
    v34[3] = &unk_2642F5A08;
    objc_copyWeak(&v35, (id *)buf);
    [v32 fetchContentWithAllowedOutputClasses:v26 inQueue:v33 updateBlock:0 completionBlock:v34];

    objc_destroyWeak(&v35);
    goto LABEL_25;
  }
  v27 = [(QLItemPresenterViewController *)self loadingViewController];
  [(QLItemPresenterViewController *)self showPreviewViewController:v27];

  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
LABEL_26:
}

uint64_t __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v7;
  }
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setupScreenTimeHandling];
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showReadyToDisplayPreviewViewControllerDeferredIfNeeded:*(void *)(a1 + 40)];
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4;
  aBlock[3] = &unk_2642F5A08;
  id v7 = (id *)(a1 + 32);
  objc_copyWeak(&v23, (id *)(a1 + 32));
  double v8 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained(v7);
  id v10 = [WeakRetained previewItem];

  if ([v10 previewItemType] == 13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = objc_alloc(MEMORY[0x263F62960]);
    v12 = [v10 previewItemContentType];
    v13 = (void *)[v11 initWithURL:v5 contentType:v12];
    [v10 setGenerationFetcher:v13];

    v14 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v17 = [v10 generationFetcher];
    v18 = objc_opt_new();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_17;
    v19[3] = &unk_2642F5A30;
    objc_copyWeak(&v21, v7);
    id v20 = v8;
    [v17 fetchContentWithAllowedOutputClasses:v16 inQueue:v18 updateBlock:0 completionBlock:v19];

    objc_destroyWeak(&v21);
  }
  else
  {
    (*((void (**)(void *, id, id))v8 + 2))(v8, v5, v6);
  }

  objc_destroyWeak(&v23);
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v6;
  id v8 = v5;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
    {
      id v3 = (NSObject **)MEMORY[0x263F62940];
      uint64_t v4 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        uint64_t v4 = *v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = v4;
        id v6 = [WeakRetained previewItem];
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        int v15 = 138412802;
        id v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Will show error view because presenter could not successfully fetch content of preview item: %@, contents: %@, error: %@. #PreviewController", (uint8_t *)&v15, 0x20u);
      }
      id v9 = [WeakRetained errorViewController];
      [WeakRetained showPreviewViewController:v9];
    }
    else
    {
      id v10 = (NSObject **)MEMORY[0x263F62940];
      id v11 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = v11;
        v13 = [WeakRetained previewItem];
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v14;
        _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_DEBUG, "Will _startLoadingPreviewWithContents because presenter successfully fetched content of preview item: %@, contents: %@. #PreviewController", (uint8_t *)&v15, 0x16u);
      }
      [WeakRetained _startLoadingPreviewWithContents:*(void *)(a1 + 40)];
    }
  }
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    uint64_t v7 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = [v7 previewItem];
    id v9 = v24;
    id v10 = [v9 fileURLHandler];
    [v8 setGeneratedURLHandler:v10];

    id v11 = [v9 contentType];
    v12 = [v11 identifier];
    [v8 setGeneratedItemContentType:v12];

    objc_msgSend(v8, "setStringEncoding:", objc_msgSend(v9, "stringEncoding"));
    v13 = [v9 attachments];
    [v8 setAttachments:v13];

    uint64_t v14 = [v9 bitmapFormat];
    [v8 setBitmapFormat:v14];

    [v8 setCanBeEdited:0];
    [v8 setEditingMode:0];
    int v15 = (void *)v7[147];
    v7[147] = 0;

    unint64_t v16 = [v9 replyType];
    if (v16 < 3 || v16 == 4)
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v18 = [v9 data];
      (*(void (**)(uint64_t, void *, id))(v20 + 16))(v20, v18, v5);
    }
    else
    {
      if (v16 != 3)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_8;
      }
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [v9 fileURLHandler];
      __int16 v19 = [v18 fileURL];
      (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v19, v5);
    }
LABEL_8:

    goto LABEL_10;
  }
  uint64_t v21 = (void *)MEMORY[0x263F087E8];
  uint64_t v22 = *MEMORY[0x263F62938];
  id v23 = [NSDictionary dictionaryWithObject:@"QLItemPresenterVC (weakself) is nil when fetchContentWithAllowedOutputClasses calls back" forKey:*MEMORY[0x263F08320]];
  uint64_t v7 = [v21 errorWithDomain:v22 code:0 userInfo:v23];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_10:
}

- (CGSize)preferredContentSize
{
  id v3 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
  int v4 = [v3 isLoaded];

  if (v4)
  {
    id v5 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    [v5 preferredContentSize];
  }
  else
  {
    id v5 = [(QLItemPresenterViewController *)self previewItem];
    [v5 predictedPreferredContentSizeForOrbPlatter];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_performReadyBlockIfNedded
{
  if (self->_isReadyForDisplay)
  {
    readyBlock = (void (**)(id, SEL))self->_readyBlock;
    if (readyBlock)
    {
      readyBlock[2](readyBlock, a2);
      id v4 = self->_readyBlock;
      self->_readyBlock = 0;
    }
  }
}

- (void)_performLoadingCompletionHandlerWithError:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  loadingCompletionHandler = (void (**)(id, id))v4->_loadingCompletionHandler;
  if (loadingCompletionHandler)
  {
    loadingCompletionHandler[2](loadingCompletionHandler, v7);
    id v6 = v4->_loadingCompletionHandler;
    v4->_loadingCompletionHandler = 0;
  }
  objc_sync_exit(v4);
}

- (void)showErrorViewController
{
  id v3 = [(QLItemPresenterViewController *)self errorViewController];
  [(QLItemPresenterViewController *)self showPreviewViewController:v3];
}

- (void)showPreviewProviderViewController
{
  id v3 = [(QLItemPresenterViewController *)self previewProvider];
  [(QLItemPresenterViewController *)self showPreviewViewController:v3];
}

- (void)showPreviewViewController:(id)a3
{
}

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4
{
}

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4 updatingIsReadyForDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  [(QLItemAggregatedViewController *)&v7 showPreviewViewController:a3 animatingWithCrossfade:a4];
  if (v5)
  {
    self->_isReadyForDisplay = 1;
    [(QLItemPresenterViewController *)self _performReadyBlockIfNedded];
  }
}

- (void)isReadyForDisplayWithCompletionHandler:(id)a3
{
  id aBlock = a3;
  if (self->_readyBlock)
  {
    id v4 = [NSString stringWithFormat:@"The presenter (%@) already has a block for isReadyForDisplayWithCompletionHandler:. Only one observer at a time is supported.", self];
    NSLog(&cfstr_SError.isa, "-[QLItemPresenterViewController isReadyForDisplayWithCompletionHandler:]", v4);
  }
  BOOL v5 = _Block_copy(aBlock);
  id readyBlock = self->_readyBlock;
  self->_id readyBlock = v5;

  [(QLItemPresenterViewController *)self _performReadyBlockIfNedded];
}

- (BOOL)canAnimateFromDetailViewToFullScreenPreview
{
  uint64_t v2 = [(QLItem *)self->_previewItem previewItemType];
  return v2 == 1 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startLoadingPreviewWithContents:(id)a3
{
  id v4 = a3;
  previewLoadingQueue = self->previewLoadingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke;
  v7[3] = &unk_2642F50C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(previewLoadingQueue, v7);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[150])
  {
    id v3 = [v2 currentPreviewViewController];
    BOOL v4 = v3 == *(void **)(*(void *)(a1 + 32) + 1200);

    uint64_t v2 = *(id **)(a1 + 32);
  }
  else
  {
    BOOL v4 = 0;
  }
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  void v38[4] = __Block_byref_object_dispose__2;
  id v39 = 0;
  objc_initWeak(&location, v2[150]);
  objc_initWeak(&from, *(id *)(a1 + 32));
  double v5 = maxLoadingItemForItem(*(void **)(*(void *)(a1 + 32) + 1224));
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 1149))
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_29;
    block[3] = &unk_2642F5A58;
    BOOL v35 = v4;
    objc_copyWeak(&v33, &from);
    objc_copyWeak(&v34, &location);
    block[4] = v38;
    dispatch_after(v7, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 1224), "transformerClass", v5);
  id v8 = objc_opt_new();
  double v9 = [*(id *)(*(void *)(a1 + 32) + 1224) createPreviewContext];
  double v10 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v9, "setViewDynamicRange:", objc_msgSend(v10, "imageDynamicRange"));

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v12 = *(void *)(a1 + 40);
  if (isKindOfClass)
  {
    uint64_t v31 = 0;
    v13 = (id *)&v31;
    uint64_t v14 = [v8 transformedContentsFromData:v12 context:v9 error:&v31];
  }
  else
  {
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();
    uint64_t v16 = *(void *)(a1 + 40);
    if (v15)
    {
      uint64_t v30 = 0;
      v13 = (id *)&v30;
      uint64_t v14 = [v8 transformedContentsFromURL:v16 context:v9 error:&v30];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v29 = 0;
      v13 = (id *)&v29;
      uint64_t v14 = [v8 transformedContentsFromSpotlightSearchableItemInfo:v17 context:v9 error:&v29];
    }
  }
  id v18 = (id)v14;
  id v19 = *v13;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v22 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v20;
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_ERROR, "Error while attempting to load preview item: %@ #ItemPresenter", buf, 0xCu);
    }
    v28[6] = (id)MEMORY[0x263EF8330];
    v28[7] = (id)3221225472;
    v28[8] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_30;
    v28[9] = &unk_2642F5430;
    v28[10] = *(id *)(a1 + 32);
    QLRunInMainThread();
    goto LABEL_25;
  }
  if (v18)
  {
    id v18 = v18;
    id v26 = v9;
    objc_copyWeak(&v27, &location);
    objc_copyWeak(v28, &from);
    QLRunInMainThread();
    objc_destroyWeak(v28);
    objc_destroyWeak(&v27);

    uint64_t v20 = 0;
    goto LABEL_25;
  }
LABEL_20:
  id v23 = (NSObject **)MEMORY[0x263F62940];
  id v24 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v24 = *v23;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    BOOL v25 = *(void **)(*(void *)(a1 + 32) + 1224);
    *(_DWORD *)buf = 138412290;
    v41 = v25;
    _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_ERROR, "Cancelled loading view controller because transformedContent is nil for item: %@. #ItemPresenter", buf, 0xCu);
  }
  v28[1] = (id)MEMORY[0x263EF8330];
  v28[2] = (id)3221225472;
  v28[3] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_31;
  v28[4] = &unk_2642F5430;
  v28[5] = *(id *)(a1 + 32);
  QLRunInMainThread();
  uint64_t v20 = 0;
  id v18 = 0;
LABEL_25:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v38, 8);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_29(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (([WeakRetained isLoaded] & 1) == 0)
    {
      id v2 = objc_loadWeakRetained((id *)(a1 + 48));

      if (!v2) {
        return;
      }
      id v3 = objc_loadWeakRetained((id *)(a1 + 48));
      [v3 setShowsLoadingPreviewSpinner:1];

      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x263EFF910] date];
    }
    MEMORY[0x270F9A758]();
  }
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_30(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 errorViewController];
  [v1 showPreviewViewController:v2];
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_31(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 errorViewController];
  [v1 showPreviewViewController:v2];
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewProvider];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_3;
  v5[3] = &unk_2642F5AA8;
  v5[5] = *(void *)(a1 + 56);
  objc_copyWeak(&v6, (id *)(a1 + 64));
  objc_copyWeak(&v7, (id *)(a1 + 72));
  v5[4] = *(void *)(a1 + 32);
  [v2 loadPreviewControllerIfNeededWithContents:v3 context:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    [v4 timeIntervalSinceNow];
    double v6 = v5 + 0.4;
    double v7 = v6 * 1000000000.0;
    BOOL v8 = v6 <= 0.0;
    double v9 = 0.0;
    if (!v8) {
      double v9 = v7;
    }
    int64_t v10 = (uint64_t)v9;
  }
  else
  {
    int64_t v10 = 0;
  }
  dispatch_time_t v11 = dispatch_time(0, v10);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_4;
  block[3] = &unk_2642F5A80;
  uint64_t v16 = *(void *)(a1 + 40);
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v14 = v3;
  id v12 = v3;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  uint64_t v15 = *(void *)(a1 + 32);
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v17);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setShowsLoadingPreviewSpinner:0];
  }
  if (*(void *)(a1 + 32))
  {
    id v3 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v5;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Error while attempting to load preview item: %@ #ItemPresenter", (uint8_t *)&v13, 0xCu);
    }
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    double v7 = [v6 errorViewController];
    [v6 showPreviewViewController:v7];
  }
  else
  {
    uint64_t v8 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1149);
    id v9 = objc_loadWeakRetained((id *)(a1 + 64));
    int64_t v10 = [v9 previewProvider];
    [v9 showPreviewViewController:v10 animatingWithCrossfade:v8];

    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    double v7 = [v6 previewProvider];
    dispatch_time_t v11 = [v7 view];
    [v11 becomeFirstResponder];
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  [v12 _performLoadingCompletionHandlerWithError:0];
}

- (void)downloadingItemViewControllerDidFinishLoadingPreviewItem:(id)a3 withContents:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThread();
}

uint64_t __103__QLItemPresenterViewController_downloadingItemViewControllerDidFinishLoadingPreviewItem_withContents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLoadingPreviewWithContents:*(void *)(a1 + 40)];
}

- (BOOL)downloadingItemViewControllerShouldForceAutodownloadFile:(id)a3
{
  id v3 = self;
  id v4 = [(QLItemAggregatedViewController *)self delegate];
  LOBYTE(v3) = [v4 itemPresenterViewControllerShouldForceAutodownloadFile:v3];

  return (char)v3;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  [(QLItemAggregatedViewController *)&v7 setAppearance:a3 animated:a4];
  id v5 = [(QLItemAggregatedViewController *)self appearance];
  uint64_t v6 = [v5 presentationMode];

  if (v6 == 4)
  {
    self->_isPeekingSession = 1;
    self->_shouldDeferAppearanceUpdates = 0;
  }
}

- (BOOL)isLoaded
{
  if (!self->_previewProvider) {
    return 0;
  }
  id v2 = [(QLItemPresenterViewController *)self previewProvider];
  char v3 = [v2 isLoaded];

  return v3;
}

- (BOOL)isLoading
{
  if (!self->_previewProvider) {
    return 1;
  }
  id v2 = [(QLItemPresenterViewController *)self previewProvider];
  char v3 = [v2 isLoading];

  return v3;
}

- (BOOL)loadingFailed
{
  if (!self->_previewProvider) {
    return 0;
  }
  id v2 = [(QLItemPresenterViewController *)self previewProvider];
  char v3 = [v2 loadingFailed];

  return v3;
}

- (QLErrorItemViewController)errorViewController
{
  errorViewController = self->_errorViewController;
  if (!errorViewController)
  {
    id v4 = (QLErrorItemViewController *)objc_opt_new();
    id v5 = self->_errorViewController;
    self->_errorViewController = v4;

    uint64_t v6 = self->_errorViewController;
    objc_super v7 = [(QLItem *)self->_previewItem createPreviewContext];
    [(QLItemViewController *)v6 loadPreviewControllerIfNeededWithContents:0 context:v7 completionHandler:0];

    self->_failureOccurred = 1;
    errorViewController = self->_errorViewController;
  }
  uint64_t v8 = errorViewController;

  return v8;
}

- (BOOL)_currentPreviewControllerIsErrorViewController
{
  char v3 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
  if (v3)
  {
    id v4 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    BOOL v5 = v4 == self->_errorViewController;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (QLLoadingItemViewController)loadingViewController
{
  loadingViewController = self->_loadingViewController;
  if (!loadingViewController)
  {
    id v4 = (QLLoadingItemViewController *)objc_opt_new();
    BOOL v5 = self->_loadingViewController;
    self->_loadingViewController = v4;

    uint64_t v6 = self->_loadingViewController;
    objc_super v7 = [(QLItem *)self->_previewItem createPreviewContext];
    [(QLLoadingItemViewController *)v6 loadPreviewControllerWithContents:0 context:v7 completionHandler:0];

    loadingViewController = self->_loadingViewController;
  }
  uint64_t v8 = loadingViewController;

  return v8;
}

- (QLDownloadingItemViewController)downloadingController
{
  downloadingController = self->_downloadingController;
  if (!downloadingController)
  {
    id v4 = (QLDownloadingItemViewController *)objc_opt_new();
    BOOL v5 = self->_downloadingController;
    self->_downloadingController = v4;

    [(QLDownloadingItemViewController *)self->_downloadingController setDownloadingDelegate:self];
    uint64_t v6 = self->_downloadingController;
    previewItem = self->_previewItem;
    uint64_t v8 = [(QLItem *)previewItem createPreviewContext];
    [(QLDownloadingItemViewController *)v6 loadPreviewControllerWithContents:previewItem context:v8 completionHandler:0];

    downloadingController = self->_downloadingController;
  }
  id v9 = downloadingController;

  return v9;
}

- (QLItemViewController)previewProvider
{
  previewProvider = self->_previewProvider;
  if (!previewProvider)
  {
    BOOL printing = self->_printing;
    previewItem = self->_previewItem;
    if (printing) {
      [(QLItem *)previewItem previewItemPrintingViewControllerClassName];
    }
    else {
    uint64_t v6 = [(QLItem *)previewItem previewItemViewControllerClassName];
    }
    NSClassFromString(v6);
    objc_super v7 = (QLItemViewController *)objc_opt_new();
    uint64_t v8 = self->_previewProvider;
    self->_previewProvider = v7;

    if (self->_previewControllerMissedTransitionDidStart && (objc_opt_respondsToSelector() & 1) != 0) {
      [(QLItemViewController *)self->_previewProvider transitionDidStart:1];
    }

    id v9 = [(QLItemViewController *)self presentingDelegate];
    [(QLItemViewController *)self->_previewProvider setPresentingDelegate:v9];

    int64_t v10 = [(QLItemAggregatedViewController *)self delegate];
    [(QLItemViewController *)self->_previewProvider setDelegate:v10];

    previewProvider = self->_previewProvider;
  }
  dispatch_time_t v11 = previewProvider;

  return v11;
}

- (QLItem)previewItem
{
  return self->_previewItem;
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(QLItemPresenterViewController *)self _cancelAllDeferredApperanceUpdates];
  if (self->_shouldDeferAppearanceUpdates)
  {
    if (v3) {
      uint64_t v6 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v6 = 0;
    }
    [(QLItemPresenterViewController *)self performSelector:a2 withObject:v6 afterDelay:0.1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLItemPresenterViewController;
    [(QLItemAggregatedViewController *)&v7 previewWillAppear:v3];
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  if (self->_shouldDeferAppearanceUpdates)
  {
    if (a3) {
      uint64_t v4 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v4 = 0;
    }
    [(QLItemPresenterViewController *)self performSelector:a2 withObject:v4 afterDelay:0.1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLItemPresenterViewController;
    [(QLItemAggregatedViewController *)&v5 previewDidAppear:a3];
  }
  [(QLItemPresenterViewController *)self _cancelAllDeferredApperanceUpdates];
  self->_shouldDeferAppearanceUpdates = 0;
}

- (void)previewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_isPeekingSession)
  {
    self->_shouldDeferAppearanceUpdates = 0;
LABEL_16:
    v12.receiver = self;
    v12.super_class = (Class)QLItemPresenterViewController;
    [(QLItemAggregatedViewController *)&v12 previewWillDisappear:v3];
    return;
  }
  uint64_t v6 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
  if (v6)
  {
    objc_super v7 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    uint64_t v8 = [(QLItemPresenterViewController *)self previewProvider];
    if (v7 == v8)
    {
      p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
      self->_shouldDeferAppearanceUpdates = 1;
    }
    else
    {
      id v9 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
      p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
      self->_shouldDeferAppearanceUpdates = v9 == self->_downloadingController;
    }
  }
  else
  {
    p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
    self->_shouldDeferAppearanceUpdates = 0;
  }

  if (!*p_shouldDeferAppearanceUpdates) {
    goto LABEL_16;
  }
  if (v3) {
    uint64_t v11 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v11 = 0;
  }

  [(QLItemPresenterViewController *)self performSelector:a2 withObject:v11 afterDelay:0.1];
}

- (void)previewDidDisappear:(BOOL)a3
{
  self->_isPeekingSession = 0;
  if (self->_shouldDeferAppearanceUpdates)
  {
    if (a3) {
      uint64_t v3 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v3 = 0;
    }
    [(QLItemPresenterViewController *)self performSelector:a2 withObject:v3 afterDelay:0.1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)QLItemPresenterViewController;
    [(QLItemAggregatedViewController *)&v4 previewDidDisappear:a3];
  }
}

- (void)_cancelAllDeferredApperanceUpdates
{
}

- (void)transitionDidStart:(BOOL)a3
{
  BOOL v3 = a3;
  previewProvider = self->_previewProvider;
  if (previewProvider
    || (self->_previewControllerMissedTransitionDidStart = 1, (previewProvider = self->_previewProvider) != 0))
  {
    -[QLItemViewController transitionDidStart:](previewProvider, "transitionDidStart:");
  }
  else
  {
    id v5 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    [v5 transitionDidStart:v3];
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_previewProvider)
  {
    previewProvider = self->_previewProvider;
    -[QLItemViewController transitionDidFinish:didComplete:](previewProvider, "transitionDidFinish:didComplete:");
  }
  else
  {
    id v7 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    [v7 transitionDidFinish:v5 didComplete:v4];
  }
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_previewProvider)
  {
    previewProvider = self->_previewProvider;
    -[QLItemViewController transitionWillFinish:didComplete:](previewProvider, "transitionWillFinish:didComplete:");
  }
  else
  {
    id v7 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    [v7 transitionWillFinish:v5 didComplete:v4];
  }
}

- (id)additionalItemViewControllerDescription
{
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  BOOL v4 = [(QLItemViewController *)&v7 additionalItemViewControllerDescription];
  BOOL v5 = [v3 stringWithFormat:@"%@\n\tPreview item: %@", v4, self->_previewItem];

  return v5;
}

- (void)updatePreviewItemDisplayState:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
    [v6 updatePreviewItemDisplayState:v7];
  }
}

- (void)_setupScreenTimeHandling
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (![(QLItemPresenterViewController *)self _processIsEntitledToCheckScreenTimePolicy])
  {
    char v5 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v6 = *v5;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v11 = 138412290;
    objc_super v12 = self;
    id v7 = "Can't set up screen time management because process is not entitled to check screen time policy. %@ #PreviewController";
LABEL_15:
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, 0xCu);
    return;
  }
  if (![(QLItemPresenterViewController *)self _processIsEntitledToConfigureScreenTime])
  {
    uint64_t v8 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v6 = *v8;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v11 = 138412290;
    objc_super v12 = self;
    id v7 = "Can't set up screen time management because process is not entitled to configure screen time. %@ #PreviewController";
    goto LABEL_15;
  }
  BOOL v3 = [(QLItemPresenterViewController *)self previewItem];
  BOOL v4 = [(QLItemPresenterViewController *)self _shouldApplyScreenTimeMoviePolicyForItem:v3];

  if (v4)
  {
    [(QLItemPresenterViewController *)self _setupScreenTimeCategoryHandling];
    return;
  }
  id v9 = [(QLItemPresenterViewController *)self screenTimePolicyBundleIdentifier];

  if (v9)
  {
    [(QLItemPresenterViewController *)self _setupScreenTimeApplicationHandling];
    return;
  }
  int64_t v10 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v6 = *v10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    objc_super v12 = self;
    id v7 = "No need to set up screen time management for preview controller: %@. #PreviewController";
    goto LABEL_15;
  }
}

- (void)_setupScreenTimeCategoryHandling
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F39D00]);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __65__QLItemPresenterViewController__setupScreenTimeCategoryHandling__block_invoke;
  id v9 = &unk_2642F5AF8;
  objc_copyWeak(&v10, &location);
  BOOL v4 = (DMFCategoryPolicyMonitor *)[v3 initWithPolicyChangeHandler:&v6];
  screenTimeCategoryMonitor = self->_screenTimeCategoryMonitor;
  self->_screenTimeCategoryMonitor = v4;

  [(QLItemPresenterViewController *)self _queryScreenTimeCategoryPolicy];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __65__QLItemPresenterViewController__setupScreenTimeCategoryHandling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queryScreenTimeCategoryPolicy];
}

- (void)_setupScreenTimeApplicationHandling
{
  id v3 = [(QLItemPresenterViewController *)self screenTimePolicyBundleIdentifier];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x263F39CF8]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __68__QLItemPresenterViewController__setupScreenTimeApplicationHandling__block_invoke;
  id v10 = &unk_2642F5AF8;
  objc_copyWeak(&v11, &location);
  char v5 = (DMFApplicationPolicyMonitor *)[v4 initWithPolicyChangeHandler:&v7];
  screenTimeApplicationMonitor = self->_screenTimeApplicationMonitor;
  self->_screenTimeApplicationMonitor = v5;

  -[QLItemPresenterViewController _queryScreenTimePolicyForBundleIdentifier:](self, "_queryScreenTimePolicyForBundleIdentifier:", v3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __68__QLItemPresenterViewController__setupScreenTimeApplicationHandling__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 screenTimePolicyBundleIdentifier];
  [v2 _queryScreenTimePolicyForBundleIdentifier:v1];
}

- (void)_queryScreenTimePolicyForBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  screenTimeApplicationMonitor = self->_screenTimeApplicationMonitor;
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke;
  v7[3] = &unk_2642F5B20;
  objc_copyWeak(&v8, &location);
  [(DMFApplicationPolicyMonitor *)screenTimeApplicationMonitor requestPoliciesForBundleIdentifiers:v6 completionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didReceiveNewScreenTimeApplicationPolicies:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_queryScreenTimeCategoryPolicy
{
  v8[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  screenTimeCategoryMonitor = self->_screenTimeCategoryMonitor;
  v8[0] = *MEMORY[0x263F31820];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke;
  v5[3] = &unk_2642F5B20;
  objc_copyWeak(&v6, &location);
  [(DMFCategoryPolicyMonitor *)screenTimeCategoryMonitor requestPoliciesForCategoryIdentifiers:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didReceiveNewScreenTimeCategoryPolicy:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_didReceiveNewScreenTimeCategoryPolicy:(id)a3 error:(id)a4
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (!a4)
  {
    id v6 = [v7 objectForKeyedSubscript:*MEMORY[0x263F31820]];
    -[QLItemPresenterViewController _didReceiveNewScreenTimePolicy:](self, "_didReceiveNewScreenTimePolicy:", [v6 integerValue]);
  }
}

- (void)_didReceiveNewScreenTimeApplicationPolicies:(id)a3 error:(id)a4
{
  id v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (!a4)
  {
    id v6 = [(QLItemPresenterViewController *)self screenTimePolicyBundleIdentifier];
    id v7 = [v8 objectForKeyedSubscript:v6];

    -[QLItemPresenterViewController _didReceiveNewScreenTimePolicy:](self, "_didReceiveNewScreenTimePolicy:", [v7 integerValue]);
  }
}

- (void)_didReceiveNewScreenTimePolicy:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (a3)
  {
    [(QLItemPresenterViewController *)self _showScreenTimeViewControllerWithPolicy:a3];
  }
  else
  {
    [(QLItemPresenterViewController *)self _hideScreenTimeViewControllerIfNeeded];
  }
}

- (void)_showScreenTimeViewControllerWithPolicy:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(QLItemPresenterViewController *)self screenTimeController];
  [(QLItemPresenterViewController *)self showPreviewViewController:v5];
  [v5 showBlockingViewControllerWithPolicy:a3];
}

- (void)_hideScreenTimeViewControllerIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(QLItemAggregatedViewController *)self currentPreviewViewController];
  id v4 = [(QLItemPresenterViewController *)self screenTimeController];

  if (v3 == v4)
  {
    id v5 = [(QLItemPresenterViewController *)self screenTimeController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__QLItemPresenterViewController__hideScreenTimeViewControllerIfNeeded__block_invoke;
    v6[3] = &unk_2642F5430;
    v6[4] = self;
    [v5 hideBlockingViewControllerWithCompletionHandler:v6];
  }
}

void __70__QLItemPresenterViewController__hideScreenTimeViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) showPreviewProviderViewController];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1208);
  *(void *)(v2 + 1208) = 0;
}

- (QLScreenTimeItemViewController)screenTimeController
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  screenTimeController = self->_screenTimeController;
  if (!screenTimeController)
  {
    id v4 = [(QLItemPresenterViewController *)self previewItem];
    BOOL v5 = [(QLItemPresenterViewController *)self _shouldApplyScreenTimeMoviePolicyForItem:v4];

    if (v5)
    {
      id v6 = [QLScreenTimeItemViewController alloc];
      id v7 = [(QLScreenTimeItemViewController *)v6 initWithCategoryIdentifier:*MEMORY[0x263F31820]];
      id v8 = self->_screenTimeController;
      self->_screenTimeController = v7;
    }
    else
    {
      id v9 = [(QLItemPresenterViewController *)self screenTimePolicyBundleIdentifier];

      if (v9)
      {
        id v10 = [QLScreenTimeItemViewController alloc];
        id v11 = [(QLItemPresenterViewController *)self screenTimePolicyBundleIdentifier];
        objc_super v12 = [(QLScreenTimeItemViewController *)v10 initWithBundleIdentifier:v11];
        uint64_t v13 = self->_screenTimeController;
        self->_screenTimeController = v12;
      }
      else
      {
        uint64_t v14 = (NSObject **)MEMORY[0x263F62940];
        uint64_t v15 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          uint64_t v15 = *v14;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v20 = 138412290;
          uint64_t v21 = self;
          _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_ERROR, "Cannot set up screen time preview controller: %@. #PreviewController", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    uint64_t v16 = self->_screenTimeController;
    id v17 = [(QLItem *)self->_previewItem createPreviewContext];
    [(QLItemViewController *)v16 loadPreviewControllerIfNeededWithContents:0 context:v17 completionHandler:0];

    screenTimeController = self->_screenTimeController;
  }
  id v18 = screenTimeController;

  return v18;
}

- (id)screenTimePolicyBundleIdentifier
{
  id v3 = [(QLItemPresenterViewController *)self previewItem];
  uint64_t v4 = [v3 previewItemType];

  if (v4 == 12)
  {
    BOOL v5 = (void *)MEMORY[0x263F628F8];
    id v6 = [(QLItemPresenterViewController *)self previewItem];
    id v7 = objc_msgSend(v5, "ql_applicationBundleIdentifierOfExtensionForItem:", v6);
LABEL_5:

    goto LABEL_7;
  }
  id v8 = (void *)MEMORY[0x263F629B0];
  id v9 = [(QLItemPresenterViewController *)self previewItem];
  id v10 = [v9 previewItemContentType];
  LODWORD(v8) = [v8 isIWorkDocumentType:v10];

  if (v8)
  {
    id v11 = (void *)MEMORY[0x263F62930];
    id v6 = [(QLItemPresenterViewController *)self previewItem];
    objc_super v12 = [v6 previewItemContentType];
    id v7 = [v11 screentimeiWorkBundleForUTI:v12];

    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_shouldApplyScreenTimeMoviePolicyForItem:(id)a3
{
  uint64_t v4 = [(QLItemPresenterViewController *)self previewItem];
  if ([v4 previewItemType] == 1)
  {
    BOOL v5 = (void *)MEMORY[0x263F160F0];
    id v6 = [(QLItemPresenterViewController *)self previewItem];
    id v7 = [v6 previewItemContentType];
    int v8 = [v5 isTypeAudioOnly:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  id v9 = [(QLItemPresenterViewController *)self hostApplicationBundleIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.DocumentsApp"];

  return v8 & v10;
}

- (BOOL)_processIsEntitledToCheckScreenTimePolicy
{
  if (_processIsEntitledToCheckScreenTimePolicy_onceToken != -1) {
    dispatch_once(&_processIsEntitledToCheckScreenTimePolicy_onceToken, &__block_literal_global_1);
  }
  return _processIsEntitledToCheckScreenTimePolicy_entitled;
}

BOOL __74__QLItemPresenterViewController__processIsEntitledToCheckScreenTimePolicy__block_invoke()
{
  BOOL result = _QLGetBoolEntitlement(@"com.apple.private.dmd.policy");
  _processIsEntitledToCheckScreenTimePolicy_entitled = result;
  return result;
}

- (BOOL)_processIsEntitledToConfigureScreenTime
{
  if (_processIsEntitledToConfigureScreenTime_onceToken != -1) {
    dispatch_once(&_processIsEntitledToConfigureScreenTime_onceToken, &__block_literal_global_71);
  }
  return _processIsEntitledToConfigureScreenTime_entitled;
}

BOOL __72__QLItemPresenterViewController__processIsEntitledToConfigureScreenTime__block_invoke()
{
  BOOL result = _QLGetBoolEntitlement(@"com.apple.private.screen-time");
  _processIsEntitledToConfigureScreenTime_entitled = result;
  return result;
}

- (void)setPreviewProvider:(id)a3
{
}

- (void)setErrorViewController:(id)a3
{
}

- (void)setLoadingViewController:(id)a3
{
}

- (void)setDownloadingController:(id)a3
{
}

- (void)setScreenTimeController:(id)a3
{
}

- (id)loadingCompletionHandler
{
  return self->_loadingCompletionHandler;
}

- (void)setLoadingCompletionHandler:(id)a3
{
}

- (void)setPreviewItem:(id)a3
{
}

- (id)contents
{
  return objc_getProperty(self, a2, 1232, 1);
}

- (void)setContents:(id)a3
{
}

- (QLPreviewContext)context
{
  return (QLPreviewContext *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setContext:(id)a3
{
}

- (BOOL)printing
{
  return self->_printing;
}

- (void)setPrinting:(BOOL)a3
{
  self->_BOOL printing = a3;
}

- (NSString)hostApplicationBundleIdentifier
{
  return self->_hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (NSString)parentApplicationDisplayIdentifier
{
  return self->_parentApplicationDisplayIdentifier;
}

- (void)setParentApplicationDisplayIdentifier:(id)a3
{
}

- (DMFApplicationPolicyMonitor)screenTimeApplicationMonitor
{
  return self->_screenTimeApplicationMonitor;
}

- (void)setScreenTimeApplicationMonitor:(id)a3
{
}

- (DMFCategoryPolicyMonitor)screenTimeCategoryMonitor
{
  return self->_screenTimeCategoryMonitor;
}

- (void)setScreenTimeCategoryMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeCategoryMonitor, 0);
  objc_storeStrong((id *)&self->_screenTimeApplicationMonitor, 0);
  objc_storeStrong((id *)&self->_parentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_contents, 0);
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_screenTimeController, 0);
  objc_storeStrong((id *)&self->_downloadingController, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->previewLoadingQueue, 0);

  objc_storeStrong(&self->_readyBlock, 0);
}

@end