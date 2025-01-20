@interface AMSUIWebErrorViewController
- (AMSUIErrorView)errorView;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebErrorPageModel)model;
- (AMSUIWebErrorViewController)initWithContext:(id)a3;
- (BOOL)showingCancelButton;
- (void)_applyAppearance;
- (void)_enqueuePageEventIfNeeded;
- (void)_showCancelButtonIfNeeded;
- (void)loadView;
- (void)setAppearance:(id)a3;
- (void)setContext:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setModel:(id)a3;
- (void)setShowingCancelButton:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebErrorViewController

- (AMSUIWebErrorViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(AMSUICommonViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebErrorViewController;
  [(AMSUIWebErrorViewController *)&v12 viewWillAppear:a3];
  [(AMSUIWebErrorViewController *)self _applyAppearance];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    context = self->_context;
    id v8 = v6;
    v9 = [(AMSUIWebClientContext *)context logKey];
    v10 = [(AMSUIErrorView *)self->_errorView title];
    v11 = [(AMSUIErrorView *)self->_errorView message];
    *(_DWORD *)buf = 138544130;
    v14 = v6;
    __int16 v15 = 2114;
    v16 = v9;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error page displayed. Title: %{public}@, Message: %{public}@", buf, 0x2Au);
  }
}

- (void)loadView
{
  v59[1] = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)AMSUIWebErrorViewController;
  [(AMSUICommonViewController *)&v57 loadView];
  v3 = [(AMSUIWebErrorViewController *)self model];
  v4 = [v3 error];
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F08338]];
  v7 = [v6 lowercaseString];
  char v8 = [v7 isEqualToString:@"user cancelled"];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F27D68]);
    v10 = [(AMSUIWebErrorViewController *)self model];
    v11 = [v10 error];
    objc_super v12 = (void *)[v9 initWithSubsystem:*MEMORY[0x263F279A0] category:@"bootstrap" error:v11];

    v13 = [(AMSUIWebErrorViewController *)self context];
    v14 = [v13 clientInfo];
    __int16 v15 = [v14 bundleIdentifier];
    [v12 setClientApp:v15];

    v16 = [(AMSUIWebErrorViewController *)self context];
    __int16 v17 = [v16 clientOptions];
    v18 = [v17 objectForKeyedSubscript:@"inlineInterrupt"];
    if (objc_opt_respondsToSelector())
    {
      __int16 v19 = [(AMSUIWebErrorViewController *)self context];
      v20 = [v19 clientOptions];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"inlineInterrupt"];
      objc_msgSend(v12, "setEventInlineInterruption:", objc_msgSend(v21, "BOOLValue"));
    }
    else
    {
      [v12 setEventInlineInterruption:0];
    }

    v22 = [(AMSUIWebErrorViewController *)self context];
    v23 = [v22 versionNumber];
    if (v23)
    {
      v58 = @"html";
      v24 = [(AMSUIWebErrorViewController *)self context];
      v25 = [v24 versionNumber];
      v59[0] = v25;
      v26 = [NSDictionary dictionaryWithObjects:v59 forKeys:&v58 count:1];
      [v12 setJsVersions:v26];
    }
    else
    {
      v24 = [v12 jsVersions];
      [v12 setJsVersions:v24];
    }

    v27 = [(AMSUIWebErrorViewController *)self context];
    v28 = [v27 URL];
    [v12 setUrl:v28];

    v29 = [(AMSUIWebErrorViewController *)self context];
    v30 = [v29 metrics];
    [v30 enqueueEvent:v12];
  }
  v31 = [AMSUIErrorView alloc];
  v32 = -[AMSUIErrorView initWithFrame:title:](v31, "initWithFrame:title:", &stru_26CC491D8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AMSUIWebErrorViewController *)self setErrorView:v32];

  v33 = [(AMSUIWebErrorViewController *)self model];
  v34 = [v33 errorTitle];
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    v37 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_TITLE", 0, v37);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v38 = [(AMSUIWebErrorViewController *)self model];
  v39 = [v38 actionButtonTitle];
  v40 = v39;
  if (v39)
  {
    id v41 = v39;
  }
  else
  {
    v42 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_BUTTON", 0, v42);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v44 = AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_MESSAGE", 0, v43);

  v45 = [(AMSUIWebErrorViewController *)self model];
  if (([v45 errorMessageInternalOnly] & 1) == 0)
  {

LABEL_20:
    v45 = [(AMSUIWebErrorViewController *)self model];
    [v45 errorMessage];
    v44 = v46 = v44;
    goto LABEL_21;
  }
  v46 = [(AMSUIWebErrorViewController *)self model];
  if ([v46 errorMessageInternalOnly])
  {
    int has_internal_content = os_variant_has_internal_content();

    if (!has_internal_content) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  v48 = [(AMSUIWebErrorViewController *)self errorView];
  [v48 setTitle:v36];

  v49 = [(AMSUIWebErrorViewController *)self errorView];
  [v49 setButtonTitle:v41];

  v50 = [(AMSUIWebErrorViewController *)self errorView];
  [v50 setMessage:v44];

  objc_initWeak(&location, self);
  errorView = self->_errorView;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __39__AMSUIWebErrorViewController_loadView__block_invoke;
  v54[3] = &unk_2643E37D0;
  objc_copyWeak(&v55, &location);
  [(AMSUIErrorView *)errorView setButtonAction:v54];
  [(AMSUIWebErrorViewController *)self _enqueuePageEventIfNeeded];
  v52 = [(AMSUICommonViewController *)self view];
  v53 = [(AMSUIWebErrorViewController *)self errorView];
  [v52 addSubview:v53];

  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);
}

void __39__AMSUIWebErrorViewController_loadView__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [WeakRetained context];
    v6 = [v5 logKey];
    int v16 = 138543618;
    uint64_t v17 = v4;
    __int16 v18 = 2114;
    __int16 v19 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action button tapped", (uint8_t *)&v16, 0x16u);
  }
  v7 = [WeakRetained model];
  char v8 = [v7 action];

  if (v8)
  {
    id v9 = [WeakRetained model];
    v10 = [v9 action];
    id v11 = (id)[v10 runAction];
  }
  objc_super v12 = [WeakRetained model];
  v13 = [v12 actionBlock];

  if (v13)
  {
    v14 = [WeakRetained model];
    __int16 v15 = [v14 actionBlock];
    ((void (**)(void, BOOL))v15)[2](v15, v8 != 0);
  }
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebErrorViewController;
  [(AMSUIWebErrorViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(AMSUIWebErrorViewController *)self errorView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
  }
  else
  {
    double v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      double v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      objc_super v13 = [(AMSUIWebErrorViewController *)self context];
      v14 = [v13 logKey];
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid error page model: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)_applyAppearance
{
  id v12 = [(AMSUIWebErrorViewController *)self appearance];
  v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  uint64_t v4 = [v12 backgroundColor];
  double v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = [(AMSUIWebErrorViewController *)self errorView];
  objc_msgSend(v7, "ams_setBackgroundColor:", v6);

  uint64_t v8 = [v12 backgroundColor];
  id v9 = (void *)v8;
  if (v8) {
    double v10 = (void *)v8;
  }
  else {
    double v10 = v3;
  }
  double v11 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v11, "ams_setBackgroundColor:", v10);

  [(AMSUIWebErrorViewController *)self _showCancelButtonIfNeeded];
}

- (void)_enqueuePageEventIfNeeded
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(AMSUIWebErrorViewController *)self context];
  uint64_t v4 = [v3 metricsOverlay];
  double v5 = [v4 objectForKeyedSubscript:@"engagementMetrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6) {
    goto LABEL_9;
  }
  id v7 = [(AMSUIWebErrorViewController *)self context];
  uint64_t v8 = [v7 clientOptions];
  id v9 = [v8 objectForKeyedSubscript:@"engagementMetrics"];

  objc_opt_class();
  id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;

  if (v6)
  {
LABEL_9:
    double v10 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v10)
    {
      double v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      objc_super v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement display event.", buf, 0x16u);
    }
    v14 = [(AMSUIWebErrorViewController *)self context];
    int v15 = [v14 URL];
    v23[3] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:4];

    id v17 = objc_alloc(MEMORY[0x263F27C28]);
    __int16 v18 = [(AMSUIWebErrorViewController *)self context];
    __int16 v19 = [v18 bag];
    id v20 = (void *)[v17 initWithBag:v19];
    id v21 = (id)[v20 enqueueData:v16];
  }
}

- (void)_showCancelButtonIfNeeded
{
  v3 = [(AMSUIWebErrorViewController *)self context];
  uint64_t v4 = [v3 flowController];
  id v23 = [v4 currentContainer];

  double v5 = [v23 navigationItem];
  int v6 = [v5 hidesBackButton];
  id v7 = [(AMSUIWebErrorViewController *)self navigationController];
  uint64_t v8 = [v7 viewControllers];
  unint64_t v9 = [v8 count];

  if ((v9 < 2 || v6) && ![(AMSUIWebErrorViewController *)self showingCancelButton])
  {
    double v10 = [v5 rightBarButtonItems];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      [(AMSUIWebErrorViewController *)self setShowingCancelButton:1];
      uint64_t v12 = [AMSUIWebFlowAction alloc];
      objc_super v13 = [(AMSUIWebErrorViewController *)self context];
      v14 = [(AMSUIWebFlowAction *)v12 initWithContext:v13];

      [(AMSUIWebFlowAction *)v14 setPresentationType:4];
      int v15 = objc_alloc_init(AMSUIWebButtonModel);
      uint64_t v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
      id v17 = AMSUILocalizedStringFromBundle(@"CANCEL", 0, v16);
      [(AMSUIWebButtonModel *)v15 setTitle:v17];

      [(AMSUIWebButtonModel *)v15 setAction:v14];
      [(AMSUIWebButtonModel *)v15 setEnabled:1];
      [(AMSUIWebButtonModel *)v15 setStyle:3];
      __int16 v18 = objc_alloc_init(AMSUIWebBarButtonItemModel);
      [(AMSUIWebBarButtonItemModel *)v18 setButtonModel:v15];
      __int16 v19 = objc_alloc_init(AMSUIWebNavigationBarModel);
      [(AMSUIWebNavigationBarModel *)v19 setLeftBarButtonItemModel:v18];
      id v20 = [(AMSUIWebErrorViewController *)self model];
      id v21 = [v20 navigationBar];
      if ([v21 style] == 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 5;
      }
      [(AMSUIWebNavigationBarModel *)v19 setStyle:v22];

      [v23 applyNavigationModel:v19];
    }
  }
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AMSUIErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (AMSUIWebErrorPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)showingCancelButton
{
  return self->_showingCancelButton;
}

- (void)setShowingCancelButton:(BOOL)a3
{
  self->_showingCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end