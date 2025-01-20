@interface AMSUICommonErrorViewController
- (AMSBagProtocol)bag;
- (AMSUICommonErrorViewController)initWithError:(id)a3 logKey:(id)a4 bag:(id)a5 retryAction:(id)a6 cancelAction:(id)a7;
- (AMSUIErrorView)errorView;
- (NSDictionary)engagementMetrics;
- (NSError)error;
- (NSString)logKey;
- (id)cancelAction;
- (id)navigationItem;
- (id)retryAction;
- (void)_cancelButtonAction;
- (void)_enqueuePageEventIfNeeded;
- (void)_setup;
- (void)_setupNavigationItem;
- (void)_showCancelButton;
- (void)loadView;
- (void)setBag:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setEngagementMetrics:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setRetryAction:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUICommonErrorViewController

- (AMSUICommonErrorViewController)initWithError:(id)a3 logKey:(id)a4 bag:(id)a5 retryAction:(id)a6 cancelAction:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)AMSUICommonErrorViewController;
  v18 = [(AMSUICommonErrorViewController *)&v25 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_error, a3);
    objc_storeStrong((id *)&v19->_logKey, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    v20 = _Block_copy(v16);
    id retryAction = v19->_retryAction;
    v19->_id retryAction = v20;

    v22 = _Block_copy(v17);
    id cancelAction = v19->_cancelAction;
    v19->_id cancelAction = v22;
  }
  return v19;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonErrorViewController;
  [(AMSUICommonViewController *)&v5 loadView];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor");
  v4 = [(AMSUICommonViewController *)self view];
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonErrorViewController;
  [(AMSUICommonErrorViewController *)&v3 viewDidLoad];
  [(AMSUICommonErrorViewController *)self _enqueuePageEventIfNeeded];
  [(AMSUICommonErrorViewController *)self _setup];
}

- (void)_enqueuePageEventIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AMSUICommonErrorViewController *)self engagementMetrics];

  if (v3)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v4)
    {
      v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      v7 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement display event.", buf, 0x16u);
    }
    v8 = [(AMSUICommonErrorViewController *)self engagementMetrics];
    v15[2] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:3];

    id v10 = objc_alloc(MEMORY[0x263F27C28]);
    v11 = [(AMSUICommonErrorViewController *)self bag];
    v12 = (void *)[v10 initWithBag:v11];
    id v13 = (id)[v12 enqueueData:v9];
  }
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonErrorViewController;
  [(AMSUICommonErrorViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUICommonErrorViewController *)self errorView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (id)navigationItem
{
  objc_super v3 = [(AMSUICommonErrorViewController *)self parentViewController];
  double v4 = objc_msgSend(v3, "ams_navigationItemViewController");

  if (objc_opt_respondsToSelector())
  {
    double v5 = [v4 navigationItem];
  }
  else
  {
    double v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AMSUICommonErrorViewController;
    id v6 = [(AMSUICommonErrorViewController *)&v9 navigationItem];
  }
  double v7 = v6;

  return v7;
}

- (void)_setupNavigationItem
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(AMSUICommonErrorViewController *)self navigationItem];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v2, "ams_configureWithTransparentBackground");
  }
  else
  {
    objc_super v3 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v3)
    {
      objc_super v3 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      double v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = objc_opt_class();
      _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Unexpected navigation item of %{public}@ class", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_showCancelButton
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  double v4 = [(AMSUICommonErrorViewController *)self bag];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v6 = AMSUILocalizedStringFromBundle(@"CANCEL", v4, v5);
  int v7 = (void *)[v3 initWithTitle:v6 style:0 target:self action:sel__cancelButtonAction];
  v10[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  __int16 v9 = [(AMSUICommonErrorViewController *)self navigationItem];
  [v9 setLeftBarButtonItems:v8];
}

- (void)_cancelButtonAction
{
  v2 = [(AMSUICommonErrorViewController *)self cancelAction];
  v2[2]();
}

- (void)_setup
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [AMSUIErrorView alloc];
  double v4 = -[AMSUIErrorView initWithFrame:title:](v3, "initWithFrame:title:", &stru_26CC491D8, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AMSUICommonErrorViewController *)self setErrorView:v4];

  uint64_t v5 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor");
  id v6 = [(AMSUICommonErrorViewController *)self errorView];
  objc_msgSend(v6, "ams_setBackgroundColor:", v5);

  v38 = objc_alloc_init(AMSUIAirplaneModeInquiry);
  BOOL v7 = [(AMSUIAirplaneModeInquiry *)v38 isEnabled];
  uint64_t v8 = [(AMSUICommonErrorViewController *)self error];
  __int16 v9 = [v8 userInfo];
  double v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11
    && (([v11 domain],
         uint64_t v12 = objc_claimAutoreleasedReturnValue(),
         v12 == (void *)*MEMORY[0x263EFC6F0])
      ? (BOOL v13 = v7)
      : (BOOL v13 = 0),
        v12,
        v13))
  {
    uint64_t v14 = [(AMSUICommonErrorViewController *)self bag];
    id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    id v16 = @"WIFI_AIRPLANE_MODE_ERROR";
  }
  else
  {
    uint64_t v14 = [(AMSUICommonErrorViewController *)self bag];
    id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    id v16 = @"DEFAULT_ERROR_TITLE";
  }
  uint64_t v17 = AMSUILocalizedStringFromBundle(v16, v14, v15);

  if (v17 && [v17 length])
  {
    __int16 v18 = [(AMSUICommonErrorViewController *)self errorView];
    [v18 setTitle:v17];
  }
  if (os_variant_has_internal_content())
  {
    v19 = [(AMSUICommonErrorViewController *)self error];
    uint64_t v20 = objc_msgSend(v19, "ams_message");
    v21 = [(AMSUICommonErrorViewController *)self errorView];
    [v21 setMessage:v20];
  }
  else
  {
    v19 = [(AMSUICommonErrorViewController *)self bag];
    uint64_t v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    v21 = AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_MESSAGE", v19, v20);
    v22 = [(AMSUICommonErrorViewController *)self errorView];
    [v22 setMessage:v21];
  }
  v23 = [(AMSUICommonErrorViewController *)self bag];
  v24 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  objc_super v25 = AMSUILocalizedStringFromBundle(@"DEFAULT_ERROR_BUTTON", v23, v24);
  v26 = [(AMSUICommonErrorViewController *)self errorView];
  [v26 setButtonTitle:v25];

  errorView = self->_errorView;
  v28 = [(AMSUICommonErrorViewController *)self retryAction];
  [(AMSUIErrorView *)errorView setButtonAction:v28];

  v29 = [(AMSUICommonViewController *)self view];
  v30 = [(AMSUICommonErrorViewController *)self errorView];
  [v29 addSubview:v30];

  v31 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v31)
  {
    v31 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v32 = [v31 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    id v33 = (id)objc_opt_class();
    logKey = self->_logKey;
    v35 = logKey;
    if (!logKey)
    {
      v35 = AMSLogKey();
    }
    v36 = [(AMSUIErrorView *)self->_errorView title];
    v37 = [(AMSUIErrorView *)self->_errorView message];
    *(_DWORD *)buf = 138544130;
    id v40 = v33;
    __int16 v41 = 2114;
    v42 = v35;
    __int16 v43 = 2114;
    v44 = v36;
    __int16 v45 = 2114;
    v46 = v37;
    _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error page displayed. Title: %{public}@, Message: %{public}@", buf, 0x2Au);

    if (!logKey) {
  }
    }

  [(AMSUICommonErrorViewController *)self _setupNavigationItem];
  [(AMSUICommonErrorViewController *)self _showCancelButton];
}

- (NSDictionary)engagementMetrics
{
  return self->_engagementMetrics;
}

- (void)setEngagementMetrics:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AMSUIErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (id)retryAction
{
  return self->_retryAction;
}

- (void)setRetryAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryAction, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_engagementMetrics, 0);
}

@end