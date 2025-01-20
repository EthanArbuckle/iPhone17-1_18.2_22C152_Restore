@interface AMSUIBaseMessageViewController
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSBinaryPromise)loadPromise;
- (AMSDialogRequest)dialogRequest;
- (AMSUIBaseMessageViewController)initWithRequest:(id)a3;
- (AMSUIBaseMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (AMSUIMessageView)_messageView;
- (AMSUIMessageViewControllerDelegate)delegate;
- (BOOL)_debugInfoIsNotEmpty;
- (BOOL)_isLoadingImage;
- (BOOL)didEnqueueMetrics;
- (BOOL)isImageSymbolImage;
- (BOOL)shouldAutomaticallyReportMetrics;
- (UIColor)_messageTextColor;
- (UIColor)_titleTextColor;
- (UIImage)_loadedImage;
- (UIImageSymbolConfiguration)_effectiveImageSymbolConfiguration;
- (id)_loadIconAssetWithURL:(id)a3;
- (id)_messageFontCompatibleWith:(id)a3;
- (id)_setImageWithURL:(id)a3;
- (id)_setMICAIconAssetWithURL:(id)a3;
- (id)_titleFontCompatibleWith:(id)a3;
- (int64_t)_iconAnimationPlayCount;
- (int64_t)_primaryImageRenderingMode;
- (int64_t)currentIconPlayCount;
- (unint64_t)_messageStyle;
- (unint64_t)impressionsReportingFrequency;
- (void)_didTapActionButton:(id)a3;
- (void)_handleDialogResult:(id)a3 completionHandler:(id)a4;
- (void)_notifyMetricsFields:(id)a3 isImpression:(BOOL)a4;
- (void)_preferredContentSizeCategoryDidChange:(id)a3;
- (void)_preloadImageIfNeeded;
- (void)_presentDebugMenu;
- (void)_resetAndPlayMICAPlayer;
- (void)_setDialogRequest:(id)a3;
- (void)_setupDebugMenu;
- (void)_startObservingMICAPlayer;
- (void)_updateTextWithAttributes;
- (void)_updateTextWithAttributes:(id)a3;
- (void)enqueueImpressionEngagementMetrics;
- (void)enqueueImpressionMetrics;
- (void)loadView;
- (void)micaPlayerDidChangePlaybackTime:(id)a3 isPlaybackAtEnd:(BOOL)a4;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setCurrentIconPlayCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEnqueueMetrics:(BOOL)a3;
- (void)setImpressionsReportingFrequency:(unint64_t)a3;
- (void)setIsImageSymbolImage:(BOOL)a3;
- (void)setLoadPromise:(id)a3;
- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3;
- (void)set_isLoadingImage:(BOOL)a3;
- (void)set_loadedImage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AMSUIBaseMessageViewController

- (AMSUIBaseMessageViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIBaseMessageViewController;
  v6 = [(AMSUIBaseMessageViewController *)&v12 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_currentIconPlayCount = 0;
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v7->_impressionsReportingFrequency = 1;
    v8 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
    loadPromise = v7->_loadPromise;
    v7->_loadPromise = v8;

    v7->_shouldAutomaticallyReportMetrics = 1;
    v7->_isImageSymbolImage = 0;
    [(AMSUIBaseMessageViewController *)v7 setViewRespectsSystemMinimumLayoutMargins:0];
    [(AMSUIBaseMessageViewController *)v7 _preloadImageIfNeeded];
    if (![(AMSUIBaseMessageViewController *)v7 _isLoadingImage])
    {
      v10 = [(AMSUIBaseMessageViewController *)v7 loadPromise];
      [v10 finishWithSuccess];
    }
  }

  return v7;
}

- (AMSUIBaseMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(AMSUIBaseMessageViewController *)self initWithRequest:a3];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a5);
    objc_storeStrong((id *)&v12->_bag, a4);
  }

  return v12;
}

- (void)loadView
{
  v3 = [[AMSUIMessageView alloc] initWithStyle:[(AMSUIBaseMessageViewController *)self _messageStyle]];
  [(AMSUIMessageView *)v3 setIsImageSymbolImage:[(AMSUIBaseMessageViewController *)self isImageSymbolImage]];
  [(AMSUIBaseMessageViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v11[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)AMSUIBaseMessageViewController;
  [(AMSUIBaseMessageViewController *)&v10 viewDidLoad];
  v3 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  [(AMSUIBaseMessageViewController *)self _setDialogRequest:v3];

  [(AMSUIBaseMessageViewController *)self _commitAppearance];
  if (os_variant_has_internal_content()
    && ([MEMORY[0x263F27EF8] isRunningUnitTests] & 1) == 0)
  {
    [(AMSUIBaseMessageViewController *)self _setupDebugMenu];
  }
  if ([(AMSUIBaseMessageViewController *)self _isLoadingImage])
  {
    v4 = [(AMSUIBaseMessageViewController *)self _messageView];
    [v4 setPreLayoutImageView:1];
  }
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__AMSUIBaseMessageViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_2643E34A8;
  objc_copyWeak(&v8, &location);
  id v6 = (id)[(AMSUIBaseMessageViewController *)self registerForTraitChanges:v5 withHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__AMSUIBaseMessageViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v14 traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  id v8 = [v5 preferredContentSizeCategory];
  if (v7 == v8)
  {
    id v9 = [v14 traitCollection];
    uint64_t v10 = [v9 legibilityWeight];
    uint64_t v11 = [v5 legibilityWeight];

    if (v10 == v11) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = [v14 traitCollection];
  [WeakRetained _preferredContentSizeCategoryDidChange:v13];

LABEL_5:
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIBaseMessageViewController;
  [(AMSUIBaseMessageViewController *)&v12 viewDidAppear:a3];
  v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    id v7 = v6;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Did appear", buf, 0xCu);
  }
  [(AMSUIBaseMessageViewController *)self _resetAndPlayMICAPlayer];
  id v8 = [(AMSUIBaseMessageViewController *)self _messageView];
  id v9 = NSString;
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
  uint64_t v11 = [v9 stringWithFormat:@"%@ viewDidAppear", v10];
  [v8 _recordNewsDebugEventWithCategory:v11];

  if ([(AMSUIBaseMessageViewController *)self shouldAutomaticallyReportMetrics]) {
    [(AMSUIBaseMessageViewController *)self enqueueImpressionMetrics];
  }
}

- (int64_t)_iconAnimationPlayCount
{
  return 1;
}

- (UIImageSymbolConfiguration)_effectiveImageSymbolConfiguration
{
  return 0;
}

- (id)_messageFontCompatibleWith:(id)a3
{
  return 0;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  return 0;
}

- (unint64_t)_messageStyle
{
  return 3;
}

- (AMSUIMessageView)_messageView
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIBaseMessageViewController;
  v2 = [(AMSUIBaseMessageViewController *)&v4 view];
  return (AMSUIMessageView *)v2;
}

- (int64_t)_primaryImageRenderingMode
{
  return 0;
}

- (void)enqueueImpressionMetrics
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(AMSUIBaseMessageViewController *)self impressionsReportingFrequency];
  if (v3 == 2)
  {
    char v4 = 1;
  }
  else if (v3 == 1)
  {
    char v4 = ![(AMSUIBaseMessageViewController *)self didEnqueueMetrics];
  }
  else
  {
    char v4 = 0;
  }
  if (![(AMSUIBaseMessageViewController *)self didEnqueueMetrics]) {
    [(AMSUIBaseMessageViewController *)self enqueueImpressionEngagementMetrics];
  }
  if (v4)
  {
    [(AMSUIBaseMessageViewController *)self setDidEnqueueMetrics:1];
    id v5 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    id v6 = [v5 clickstreamMetricsEvent];
    [(AMSUIBaseMessageViewController *)self _notifyMetricsFields:v6 isImpression:1];

    id v14 = [(AMSUIBaseMessageViewController *)self _messageView];
    id v7 = NSString;
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
    id v9 = [v7 stringWithFormat:@"%@ _notifyMetricsFields/impression", v8];
    [v14 _recordNewsDebugEventWithCategory:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_super v12 = objc_opt_class();
      id v13 = v12;
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2048;
      unint64_t v18 = [(AMSUIBaseMessageViewController *)self impressionsReportingFrequency];
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_INFO, "%{public}@: Will not enqueue impression metrics (impressionsReportingFrequency: %lu)", buf, 0x16u);
    }
  }
}

- (void)enqueueImpressionEngagementMetrics
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(AMSUIBaseMessageViewController *)self _messageView];
  char v4 = NSString;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AMSUIBaseMessageViewController _messageStyle](self, "_messageStyle"));
  id v6 = [v4 stringWithFormat:@"%@ enqueueImpressionEngagementMetrics", v5];
  [v3 _recordNewsDebugEventWithCategory:v6];

  id v7 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  id v8 = [v7 metricsEvent];

  if (v8)
  {
    id v9 = [(AMSUIBaseMessageViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(AMSUIBaseMessageViewController *)self delegate];
      [v11 messageViewControllerDidEnqueueImpression:self];
    }
    objc_super v12 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v12)
    {
      objc_super v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v14 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing Engagement Impression MetricsEvent", (uint8_t *)&buf, 0xCu);
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __68__AMSUIBaseMessageViewController_enqueueImpressionEngagementMetrics__block_invoke;
    v22[3] = &unk_2643E34D0;
    v22[4] = self;
    id v23 = v8;
    uint64_t v15 = v22;
    v16 = AMSLogKey();
    __int16 v17 = dispatch_get_global_queue(0, 0);
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v25 = __AMSDispatchAsyncGlobal_block_invoke;
    v26 = &unk_2643E33B0;
    id v27 = v16;
    id v28 = v15;
    id v18 = v16;
    dispatch_async(v17, &buf);
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v19)
    {
      uint64_t v19 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v21 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_21C134000, v20, OS_LOG_TYPE_INFO, "%{public}@: No Engagement MetricsEvent to enqueue", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __68__AMSUIBaseMessageViewController_enqueueImpressionEngagementMetrics__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F27D40];
  id v4 = [*(id *)(a1 + 32) bag];
  unint64_t v3 = [v2 internalInstanceUsingBag:v4];
  [v3 enqueueEvent:*(void *)(a1 + 40)];
}

- (void)_setupDebugMenu
{
  if ([(AMSUIBaseMessageViewController *)self _debugInfoIsNotEmpty])
  {
    unint64_t v3 = [(AMSUIBaseMessageViewController *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = [(AMSUIBaseMessageViewController *)self view];
      [v5 setupDebugButtonWithTarget:self action:sel__presentDebugMenu];
    }
  }
}

- (BOOL)_debugInfoIsNotEmpty
{
  v2 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  unint64_t v3 = [v2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"debugInfo"];

  BOOL v5 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 count] != 0;
  return v5;
}

- (void)_presentDebugMenu
{
  id v5 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  unint64_t v3 = [v5 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"debugInfo"];
  +[AMSUIDebugMenu presentDebugMenuWithPresentingVC:self debugInfo:v4];
}

- (void)_handleDialogResult:(id)a3 completionHandler:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F27CB8];
  id v8 = a3;
  id v9 = [v7 sharedMessagingUIConfig];
  if (!v9)
  {
    id v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  char v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v61 = (id)objc_opt_class();
    id v11 = v61;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Attempting to handle dialog request", buf, 0xCu);
  }
  objc_super v12 = [v8 originalRequest];
  id v13 = [v8 selectedActionIdentifier];

  id v14 = [v12 locateActionWithIdentifier:v13];

  uint64_t v15 = [v14 kind];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    __int16 v17 = (void *)[objc_alloc(MEMORY[0x263F27BE8]) initWithDialogAction:v14];
    if ([v14 requiresDelegate])
    {
      id v18 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v18)
      {
        id v18 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v19 = [(AMSUIActionContext *)v18 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_28:

        v38 = [(AMSUIBaseMessageViewController *)self delegate];
        char v39 = objc_opt_respondsToSelector();

        uint64_t v40 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
        v41 = (void *)v40;
        if (v39)
        {
          if (!v40)
          {
            v41 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v42 = [v41 OSLogObject];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = objc_opt_class();
            id v44 = v43;
            v45 = [v17 identifier];
            *(_DWORD *)long long buf = 138543618;
            id v61 = v43;
            __int16 v62 = 2114;
            v63 = v45;
            _os_log_impl(&dword_21C134000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);
          }
          v46 = [(AMSUIBaseMessageViewController *)self delegate];
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 3221225472;
          v57[2] = __72__AMSUIBaseMessageViewController__handleDialogResult_completionHandler___block_invoke;
          v57[3] = &unk_2643E34F8;
          v57[4] = self;
          id v58 = v17;
          id v59 = v6;
          char v47 = [v46 messageViewController:self handleDelegateAction:v58 completionHandler:v57];

          if (v47) {
            goto LABEL_45;
          }
        }
        else
        {
          if (!v40)
          {
            v41 = [MEMORY[0x263F27CB8] sharedConfig];
          }
          v48 = [v41 OSLogObject];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v49 = objc_opt_class();
            id v50 = v49;
            v51 = [v17 identifier];
            *(_DWORD *)long long buf = 138543618;
            id v61 = v49;
            __int16 v62 = 2114;
            v63 = v51;
            _os_log_impl(&dword_21C134000, v48, OS_LOG_TYPE_DEBUG, "%{public}@: Delegate does not implement handleDelegateAction (identifier: %{public}@)", buf, 0x16u);
          }
          (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x263EFFA88], 0);
        }
        v52 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
        if (!v52)
        {
          v52 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v53 = [v52 OSLogObject];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = objc_opt_class();
          id v55 = v54;
          v56 = [v17 identifier];
          *(_DWORD *)long long buf = 138543618;
          id v61 = v54;
          __int16 v62 = 2114;
          v63 = v56;
          _os_log_impl(&dword_21C134000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);
        }
        (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x263EFFA80], 0);
LABEL_45:

        goto LABEL_46;
      }
      v20 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v61 = v20;
      id v21 = v20;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_INFO, "%{public}@: Delegate is required to process action", buf, 0xCu);
    }
    else
    {
      v26 = [AMSUIActionContext alloc];
      id v27 = [(AMSUIBaseMessageViewController *)self account];
      id v28 = [(AMSUIBaseMessageViewController *)self bag];
      id v18 = [(AMSUIActionContext *)v26 initWithAccount:v27 bag:v28 presentingViewController:self processInfo:0];

      uint64_t v19 = [v17 actionPayload];
      BOOL v29 = +[AMSUIActionRunner canHandle:v19 context:v18];
      uint64_t v30 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      id v21 = (id)v30;
      if (v29)
      {
        if (!v30)
        {
          id v21 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v31 = [v21 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = objc_opt_class();
          *(_DWORD *)long long buf = 138543362;
          id v61 = v32;
          id v33 = v32;
          _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: AMS ActionRunner can handle action", buf, 0xCu);
        }
        v34 = +[AMSUIActionRunner handle:v19 context:v18];
        [v34 addFinishBlock:v6];

        goto LABEL_45;
      }
      if (!v30)
      {
        id v21 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v35 = [v21 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        id v61 = v36;
        id v37 = v36;
        _os_log_impl(&dword_21C134000, v35, OS_LOG_TYPE_INFO, "%{public}@: AMS ActionRunner cannot handle action", buf, 0xCu);
      }
    }

    goto LABEL_28;
  }
  v22 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v22)
  {
    v22 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = objc_opt_class();
    *(_DWORD *)long long buf = 138543362;
    id v61 = v24;
    id v25 = v24;
    _os_log_impl(&dword_21C134000, v23, OS_LOG_TYPE_INFO, "%{public}@: No action kind", buf, 0xCu);
  }
  (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x263EFFA80], 0);
LABEL_46:
}

void __72__AMSUIBaseMessageViewController__handleDialogResult_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      id v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v13)
      {
        id v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v23 = objc_opt_class();
      v24 = *(void **)(a1 + 40);
      id v17 = v23;
      id v18 = [v24 identifier];
      int v25 = 138543618;
      v26 = v23;
      __int16 v27 = 2114;
      id v28 = v18;
      uint64_t v19 = "%{public}@: Delegate responded with neither an error or response (identifier: %{public}@)";
      v20 = v14;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 22;
      goto LABEL_13;
    }
LABEL_9:
    id v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v13)
    {
      id v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = v15;
    id v18 = [v16 identifier];
    int v25 = 138543874;
    v26 = v15;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v5;
    uint64_t v19 = "%{public}@: Delegate responded with a response (identifier: %{public}@, response: %{public}@)";
    v20 = v14;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    uint32_t v22 = 32;
LABEL_13:
    _os_log_impl(&dword_21C134000, v20, v21, v19, (uint8_t *)&v25, v22);

LABEL_14:
    goto LABEL_15;
  }
  id v7 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_opt_class();
    char v10 = *(void **)(a1 + 40);
    id v11 = v9;
    objc_super v12 = [v10 identifier];
    int v25 = 138543874;
    v26 = v9;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    id v30 = v12;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Delegate responded with error (identifier: %{public}@, error: %{public}@)", (uint8_t *)&v25, 0x20u);
  }
  if (v5) {
    goto LABEL_9;
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_notifyMetricsFields:(id)a3 isImpression:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(AMSUIBaseMessageViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
    }
    else
    {
      id v8 = [(AMSUIBaseMessageViewController *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0)
      {
        uint64_t v16 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
        if (!v16)
        {
          uint64_t v16 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        id v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v21 = 138543362;
          id v22 = (id)objc_opt_class();
          id v20 = v22;
          _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_INFO, "%{public}@: Delegate does observe for metrics. Dropping metrics event.", (uint8_t *)&v21, 0xCu);
        }
        goto LABEL_16;
      }
    }
    char v10 = [(AMSUIBaseMessageViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      objc_super v12 = [(AMSUIBaseMessageViewController *)self delegate];
      objc_opt_respondsToSelector();
    }
    id v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v13)
    {
      id v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v15 = v22;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing metrics fields", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
    id v17 = [v16 objectForKey:@"topic"];
    [v16 removeObjectForKey:@"topic"];
    if (v11)
    {
      if (a4)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v18 = [(AMSUIBaseMessageViewController *)self delegate];
      uint64_t v19 = [NSDictionary dictionaryWithDictionary:v16];
      [v18 messageViewController:self enqueueActionEventWithFields:v19 inTopic:v17];
    }
    else
    {
      id v18 = [(AMSUIBaseMessageViewController *)self delegate];
      uint64_t v19 = [NSDictionary dictionaryWithDictionary:v16];
      [v18 messageViewController:self enqueueEventWithFields:v19 inTopic:v17];
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (void)_preloadImageIfNeeded
{
  unint64_t v3 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [v4 iconImage];

  if (!v5)
  {
    id v6 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    id v7 = [v6 iconURL];

    if (v7)
    {
      id v8 = [(AMSUIBaseMessageViewController *)self dialogRequest];
      char v9 = [v8 iconURL];
      char v10 = [(AMSUIBaseMessageViewController *)self _loadIconAssetWithURL:v9];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__AMSUIBaseMessageViewController__preloadImageIfNeeded__block_invoke;
      v12[3] = &unk_2643E3520;
      v12[4] = self;
      [v10 resultWithTimeout:v12 completion:2.0];
      char v11 = [(AMSUIBaseMessageViewController *)self loadPromise];
      [v11 finishWithPromise:v10];
    }
  }
}

void __55__AMSUIBaseMessageViewController__preloadImageIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v4;
      id v7 = v10;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Icon loading failed with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [*(id *)(a1 + 32) loadPromise];
    [v8 finishWithSuccess];
  }
}

- (void)_setDialogRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes];
  id v12 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v12;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v6 iconImage];
  if (v7
    || ([(AMSUIBaseMessageViewController *)self _loadedImage],
        id v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "ams_imageWithRenderingMode:", -[AMSUIBaseMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode")), id v7 = objc_claimAutoreleasedReturnValue(), v8, v7))
  {
    int v9 = [(AMSUIBaseMessageViewController *)self _effectiveImageSymbolConfiguration];
    id v10 = [v5 imageView];
    [v10 setPreferredSymbolConfiguration:v9];

    __int16 v11 = [v5 imageView];
    [v11 setImage:v7];
  }
}

- (id)_loadIconAssetWithURL:(id)a3
{
  id v4 = a3;
  if (+[AMSUIEngagementContentRecord isURLEngagementContent:v4])
  {
    id v5 = [[AMSUIEngagementContentRecord alloc] initWithURL:v4];
    id v6 = [(AMSUIEngagementContentRecord *)v5 contentExtension];
  }
  else
  {
    id v6 = [v4 pathExtension];
  }
  [(AMSUIBaseMessageViewController *)self set_isLoadingImage:1];
  if ([v6 isEqualToString:@"caar"]) {
    [(AMSUIBaseMessageViewController *)self _setMICAIconAssetWithURL:v4];
  }
  else {
  id v7 = [(AMSUIBaseMessageViewController *)self _setImageWithURL:v4];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke;
  v9[3] = &unk_2643E3520;
  v9[4] = self;
  [v7 addFinishBlock:v9];

  return v7;
}

void __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@: Finished icon loading", (uint8_t *)&buf, 0xCu);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke_53;
  v12[3] = &unk_2643E34D0;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v8 = v12;
  id v9 = v4;
  id v10 = AMSLogKey();
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 3221225472;
  id v15 = __AMSDispatchAsync_block_invoke_1;
  uint64_t v16 = &unk_2643E33B0;
  id v17 = v10;
  id v18 = v8;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], &buf);
}

void __56__AMSUIBaseMessageViewController__loadIconAssetWithURL___block_invoke_53(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_isLoadingImage:", 0);
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) _messageView];
    [v2 setPreLayoutImageView:0];
  }
}

- (void)_resetAndPlayMICAPlayer
{
  if (!UIAccessibilityIsReduceMotionEnabled()
    && [(AMSUIBaseMessageViewController *)self _iconAnimationPlayCount])
  {
    [(AMSUIBaseMessageViewController *)self _startObservingMICAPlayer];
    self->_currentIconPlayCount = 0;
    id v4 = [(AMSUIBaseMessageViewController *)self _messageView];
    unint64_t v3 = [v4 micaPlayer];
    [v3 play];
  }
}

- (id)_setMICAIconAssetWithURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v7 = v17;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@: Loading MICA asset", buf, 0xCu);
  }
  id v8 = +[AMSUIAssetLoader sharedLoader];
  id v9 = [v8 fetchWithAssetURL:v4];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke;
  v14[3] = &unk_2643E3548;
  v14[4] = self;
  id v15 = v4;
  id v10 = v4;
  [v9 addSuccessBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_2;
  v13[3] = &unk_2643E3570;
  v13[4] = self;
  [v9 addErrorBlock:v13];
  id v11 = [v9 binaryPromiseAdapter];

  return v11;
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully loaded MICA asset", (uint8_t *)&buf, 0xCu);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_55;
  v12[3] = &unk_2643E3360;
  id v7 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v3;
  id v14 = v7;
  id v8 = v12;
  id v9 = v3;
  id v10 = AMSLogKey();
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v16 = __AMSDispatchAsync_block_invoke_1;
  id v17 = &unk_2643E33B0;
  id v18 = v10;
  id v19 = v8;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], &buf);
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_55(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _messageView];
  [v2 _setupMICAAssetWithData:*(void *)(a1 + 40) originalURL:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 window];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 _resetAndPlayMICAPlayer];
  }
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v3;
    id v6 = v11;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load MICA asset with error %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_57;
  v8[3] = &unk_2643E34D0;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __59__AMSUIBaseMessageViewController__setMICAIconAssetWithURL___block_invoke_57(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _messageView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 messageViewController:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (id)_setImageWithURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v7 = v20;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_INFO, "%{public}@: Loading image asset", buf, 0xCu);
  }
  id v8 = +[AMSUIImageLoader defaultLoader];
  id v9 = [v8 fetchImageWithURL:v4];
  if ([v8 _isURLSystemImage:v4])
  {
    id v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v10)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v20 = v12;
      id v13 = v12;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Setting MessageView isImageSymbolImage true", buf, 0xCu);
    }
    [(AMSUIBaseMessageViewController *)self setIsImageSymbolImage:1];
  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke;
  v17[3] = &unk_2643E35C0;
  v17[4] = self;
  objc_copyWeak(&v18, (id *)buf);
  [v9 addSuccessBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_2;
  v16[3] = &unk_2643E3570;
  v16[4] = self;
  [v9 addErrorBlock:v16];
  uint64_t v14 = [v9 binaryPromiseAdapter];
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Successfully loaded image asset", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_60;
  v8[3] = &unk_2643E3598;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v9 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(&v10);
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained viewIfLoaded];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = objc_msgSend(v3, "ams_imageWithRenderingMode:", objc_msgSend(WeakRetained, "_primaryImageRenderingMode"));
    id v5 = [WeakRetained _effectiveImageSymbolConfiguration];
    if (v5)
    {
      uint64_t v6 = [v4 imageWithSymbolConfiguration:v5];

      id v4 = (void *)v6;
    }
    id v7 = [WeakRetained _messageView];
    id v8 = [v7 imageView];
    [v8 setImage:v4];

    id v9 = [WeakRetained _messageView];
    [v9 setNeedsLayout];
  }
  else
  {
    objc_msgSend(WeakRetained, "set_loadedImage:", v3);
  }
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v3;
    id v6 = v11;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load image %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_62;
  v8[3] = &unk_2643E34D0;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __51__AMSUIBaseMessageViewController__setImageWithURL___block_invoke_62(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _messageView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 messageViewController:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_startObservingMICAPlayer
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(AMSUIBaseMessageViewController *)self _messageView];
  id v4 = [v3 micaPlayer];

  if (v4)
  {
    [(AMSUIBaseMessageViewController *)self setCurrentIconPlayCount:0];
    id v5 = [(AMSUIBaseMessageViewController *)self _messageView];
    id v6 = [v5 micaPlayer];
    [v6 setDelegate:self];

    id v7 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Began observing MICA Player", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes:a3];
  id v4 = [(AMSUIBaseMessageViewController *)self delegate];
  objc_msgSend(v4, "messageViewController:didUpdateSize:", self, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)_updateTextWithAttributes
{
  id v3 = [(AMSUIBaseMessageViewController *)self traitCollection];
  [(AMSUIBaseMessageViewController *)self _updateTextWithAttributes:v3];
}

- (void)_updateTextWithAttributes:(id)a3
{
  id v68 = a3;
  id v4 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  id v5 = [v4 title];

  if (v5)
  {
    id v6 = [(AMSUIBaseMessageViewController *)self _titleTextColor];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[AMSUIAppearance _defaultTitleColor];
    }
    id v9 = v8;

    int v10 = [(AMSUIBaseMessageViewController *)self _titleFontCompatibleWith:v68];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[AMSUIAppearance _defaultTitleFontForStyle:[(AMSUIBaseMessageViewController *)self _messageStyle] withTraitCollection:v68];
    }
    id v13 = v12;

    uint64_t v14 = [[AMSUIMessageMarkdownConfiguration alloc] initWithColor:v9 font:v13];
    id v15 = [AMSUIMessageMarkdownGenerator alloc];
    uint64_t v16 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    id v17 = [v16 title];
    id v18 = [(AMSUIMessageMarkdownGenerator *)v15 initWithMarkdownString:v17 configuration:v14];

    id v19 = [(AMSUIMessageMarkdownGenerator *)v18 generate];
    id v20 = [(AMSUIBaseMessageViewController *)self _messageView];
    [v20 setTitle:v19];
  }
  uint64_t v21 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  uint64_t v22 = [v21 message];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    uint64_t v25 = [v24 style];

    if (v25 == 8) {
      goto LABEL_19;
    }
    v26 = [(AMSUIBaseMessageViewController *)self _messageTextColor];
    __int16 v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = +[AMSUIAppearance _defaultMessageColor];
    }
    uint64_t v21 = v28;

    __int16 v29 = [(AMSUIBaseMessageViewController *)self _messageFontCompatibleWith:v68];
    id v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = +[AMSUIAppearance _defaultMessageFontForStyle:[(AMSUIBaseMessageViewController *)self _messageStyle] withTraitCollection:v68];
    }
    v32 = v31;

    id v33 = [[AMSUIMessageMarkdownConfiguration alloc] initWithColor:v21 font:v32];
    v34 = [AMSUIMessageMarkdownGenerator alloc];
    v35 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    v36 = [v35 message];
    id v37 = [(AMSUIMessageMarkdownGenerator *)v34 initWithMarkdownString:v36 configuration:v33];

    v38 = [(AMSUIMessageMarkdownGenerator *)v37 generate];
    char v39 = [(AMSUIBaseMessageViewController *)self _messageView];
    [v39 setMessage:v38];
  }
LABEL_19:
  uint64_t v40 = [(AMSUIBaseMessageViewController *)self _messageView];
  [v40 _setTextViewText];

  v41 = [MEMORY[0x263EFF980] array];
  v42 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  v43 = [v42 titleAccessibilityLabel];

  id v44 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  v45 = v44;
  if (v43)
  {
    v46 = [v44 titleAccessibilityLabel];
    unint64_t v47 = [v46 length];

    if (v47 < 2) {
      goto LABEL_25;
    }
    v48 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    uint64_t v49 = [v48 titleAccessibilityLabel];
  }
  else
  {
    id v50 = [v44 title];

    if (!v50) {
      goto LABEL_25;
    }
    v48 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    uint64_t v49 = [v48 title];
  }
  v51 = (void *)v49;
  [v41 addObject:v49];

LABEL_25:
  v52 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  v53 = [v52 messageAccessibilityLabel];

  v54 = [(AMSUIBaseMessageViewController *)self dialogRequest];
  id v55 = v54;
  if (v53)
  {
    v56 = [v54 messageAccessibilityLabel];
    unint64_t v57 = [v56 length];

    if (v57 < 2) {
      goto LABEL_31;
    }
    id v58 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    uint64_t v59 = [v58 messageAccessibilityLabel];
  }
  else
  {
    v60 = [v54 message];

    if (!v60) {
      goto LABEL_31;
    }
    id v58 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    uint64_t v59 = [v58 message];
  }
  id v61 = (void *)v59;
  [v41 addObject:v59];

LABEL_31:
  if ([v41 count])
  {
    __int16 v62 = [v41 componentsJoinedByString:@", "];
    v63 = [(AMSUIBaseMessageViewController *)self _messageView];
    uint64_t v64 = [v63 textView];
    [v64 setAccessibilityLabel:v62];
  }
  else
  {
    __int16 v62 = [(AMSUIBaseMessageViewController *)self _messageView];
    v63 = [v62 textView];
    uint64_t v64 = [v63 attributedText];
    v65 = [v64 string];
    v66 = [(AMSUIBaseMessageViewController *)self _messageView];
    v67 = [v66 textView];
    [v67 setAccessibilityLabel:v65];
  }
}

- (void)_didTapActionButton:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIBaseMessageViewController *)self _messageView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    id v9 = [v7 dialogAction];
LABEL_13:
    id v13 = v9;
    int v10 = [v9 identifier];

    uint64_t v14 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v58 = (id)objc_opt_class();
      __int16 v59 = 2114;
      v60 = v10;
      id v16 = v58;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Action invoked (identifier: %{public}@)", buf, 0x16u);
    }
    [v5 setUserInteractionEnabled:0];
    id v17 = objc_alloc(MEMORY[0x263F27C18]);
    id v18 = [(AMSUIBaseMessageViewController *)self dialogRequest];
    id v19 = (void *)[v17 initWithOriginalRequest:v18 selectedActionIdentifier:v10];

    id v20 = [v19 originalRequest];
    id v11 = [v20 locateActionWithIdentifier:v10];

    int v21 = [(AMSUIBaseMessageViewController *)self shouldAutomaticallyReportMetrics];
    uint64_t v22 = [(AMSUIBaseMessageViewController *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(AMSUIBaseMessageViewController *)self delegate];
      int v21 = [v24 messageViewController:self shouldEnqueueMetricsForDialogResult:v19];
    }
    uint64_t v25 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v25)
    {
      uint64_t v25 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = objc_opt_class();
      id v28 = @"false";
      if (v21) {
        id v28 = @"true";
      }
      *(_DWORD *)long long buf = 138543618;
      id v58 = v27;
      __int16 v59 = 2114;
      v60 = v28;
      __int16 v29 = v5;
      id v30 = v27;
      _os_log_impl(&dword_21C134000, v26, OS_LOG_TYPE_INFO, "%{public}@: shouldAutoEnqueue %{public}@", buf, 0x16u);

      id v5 = v29;
    }

    if (v21)
    {
      id v31 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v31)
      {
        id v31 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        id v58 = v33;
        id v34 = v33;
        _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueueing engagement metrics", buf, 0xCu);
      }
      id v35 = objc_alloc(MEMORY[0x263F27C28]);
      v36 = [(AMSUIBaseMessageViewController *)self bag];
      id v37 = (void *)[v35 initWithBag:v36];
      [v37 handleDialogResult:v19];

      if (v11)
      {
        v38 = [v11 clickstreamMetricsEvent];
        [(AMSUIBaseMessageViewController *)self _notifyMetricsFields:v38 isImpression:0];
      }
    }
    char v39 = [v11 deepLink];
    uint64_t v40 = [(AMSUIBaseMessageViewController *)self bag];
    if (v40 && v39)
    {
      BOOL v41 = +[AMSUIMessagingActionRunner canRespondToDeeplink:v39];

      if (!v41)
      {
LABEL_44:
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke;
        v54[3] = &unk_2643E35E8;
        v54[4] = self;
        id v55 = v19;
        id v56 = v5;
        id v52 = v19;
        [(AMSUIBaseMessageViewController *)self _handleDialogResult:v52 completionHandler:v54];

        goto LABEL_45;
      }
      v53 = v5;
      v42 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v42)
      {
        v42 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v43 = [v42 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        id v44 = objc_opt_class();
        *(_DWORD *)long long buf = 138543618;
        id v58 = v44;
        __int16 v59 = 2114;
        v60 = v39;
        id v45 = v44;
        _os_log_impl(&dword_21C134000, v43, OS_LOG_TYPE_INFO, "%{public}@: AMS can respond to action with deeplink %{public}@", buf, 0x16u);
      }
      v46 = [AMSUIMessagingActionContext alloc];
      unint64_t v47 = [(AMSUIBaseMessageViewController *)self bag];
      v48 = [(AMSUIBaseMessageViewController *)self account];
      uint64_t v49 = [MEMORY[0x263F27E08] currentProcess];
      uint64_t v40 = [(AMSUIMessagingActionContext *)v46 initWithBag:v47 account:v48 clientInfo:v49];

      uint64_t v50 = +[AMSUIMessagingTemporaryActionDataProvider parametersForAppStoreOptInNotificationWithDeeplink:v39];
      v51 = (void *)v50;
      if (v40 && v50)
      {
        +[AMSUIMessagingActionRunner performWithDeeplink:v39 context:v40 parameters:v50];
      }
      id v5 = v53;
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v5 bodyAction];

    if (v8)
    {
      id v7 = [(AMSUIBaseMessageViewController *)self _messageView];
      id v9 = [v7 bodyAction];
      goto LABEL_13;
    }
  }
  int v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v10)
  {
    int v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v11 = [(__CFString *)v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v58 = (id)objc_opt_class();
    id v12 = v58;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Action invoked but failed dialog action found", buf, 0xCu);
  }
LABEL_45:
}

void __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke_2;
  v6[3] = &unk_2643E3360;
  id v2 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v3 = v6;
  id v4 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_1;
  block[3] = &unk_2643E33B0;
  id v10 = v4;
  id v11 = v3;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__AMSUIBaseMessageViewController__didTapActionButton___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageViewController:*(void *)(a1 + 32) didSelectActionWithDialogResult:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 48);
  return [v3 setUserInteractionEnabled:1];
}

- (void)micaPlayerDidChangePlaybackTime:(id)a3 isPlaybackAtEnd:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    int v23 = 138543618;
    v24 = v9;
    __int16 v25 = 2050;
    int64_t v26 = [(AMSUIBaseMessageViewController *)self currentIconPlayCount];
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: micaPlayerDidChangePlaybackTime (currentIconPlayCount: %{public}ld)", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v11 = [(AMSUIBaseMessageViewController *)self _iconAnimationPlayCount];
  if (v11 >= 1)
  {
    int64_t v12 = v11;
    if (v4)
    {
      [(AMSUIBaseMessageViewController *)self setCurrentIconPlayCount:[(AMSUIBaseMessageViewController *)self currentIconPlayCount] + 1];
      id v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v13)
      {
        id v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = objc_opt_class();
        id v16 = v15;
        int64_t v17 = [(AMSUIBaseMessageViewController *)self currentIconPlayCount];
        int v23 = 138543618;
        v24 = v15;
        __int16 v25 = 2050;
        int64_t v26 = v17;
        _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: MICA playback at end (currentIconPlayCount: %{public}ld)", (uint8_t *)&v23, 0x16u);
      }
    }
    if ([(AMSUIBaseMessageViewController *)self currentIconPlayCount] >= v12)
    {
      [v6 pause];
      id v18 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v18)
      {
        id v18 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = objc_opt_class();
        id v21 = v20;
        int64_t v22 = [(AMSUIBaseMessageViewController *)self currentIconPlayCount];
        int v23 = 138543874;
        v24 = v20;
        __int16 v25 = 2050;
        int64_t v26 = v22;
        __int16 v27 = 2050;
        int64_t v28 = v12;
        _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Paused MICA playback (currentIconPlayCount: %{public}ld, maxPlayCount: %{public}ld)", (uint8_t *)&v23, 0x20u);
      }
    }
  }
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (AMSUIMessageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIMessageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)impressionsReportingFrequency
{
  return self->_impressionsReportingFrequency;
}

- (void)setImpressionsReportingFrequency:(unint64_t)a3
{
  self->_impressionsReportingFrequency = a3;
}

- (AMSBinaryPromise)loadPromise
{
  return self->_loadPromise;
}

- (void)setLoadPromise:(id)a3
{
}

- (BOOL)shouldAutomaticallyReportMetrics
{
  return self->_shouldAutomaticallyReportMetrics;
}

- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3
{
  self->_shouldAutomaticallyReportMetrics = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (BOOL)didEnqueueMetrics
{
  return self->_didEnqueueMetrics;
}

- (void)setDidEnqueueMetrics:(BOOL)a3
{
  self->_didEnqueueMetrics = a3;
}

- (int64_t)currentIconPlayCount
{
  return self->_currentIconPlayCount;
}

- (void)setCurrentIconPlayCount:(int64_t)a3
{
  self->_currentIconPlayCount = a3;
}

- (BOOL)isImageSymbolImage
{
  return self->_isImageSymbolImage;
}

- (void)setIsImageSymbolImage:(BOOL)a3
{
  self->_isImageSymbolImage = a3;
}

- (BOOL)_isLoadingImage
{
  return self->__isLoadingImage;
}

- (void)set_isLoadingImage:(BOOL)a3
{
  self->__isLoadingImage = a3;
}

- (UIImage)_loadedImage
{
  return self->__loadedImage;
}

- (void)set_loadedImage:(id)a3
{
}

- (UIColor)_messageTextColor
{
  return self->__messageTextColor;
}

- (UIColor)_titleTextColor
{
  return self->__titleTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleTextColor, 0);
  objc_storeStrong((id *)&self->__messageTextColor, 0);
  objc_storeStrong((id *)&self->__loadedImage, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_loadPromise, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
}

@end