@interface AMSUIInlineDialogViewController
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSBinaryPromise)loadPromise;
- (AMSDialogRequest)dialogRequest;
- (AMSEngagement)engagement;
- (AMSUIAppearance)preferredAppearance;
- (AMSUIInlineDialogViewController)init;
- (AMSUIInlineDialogViewController)initWithRequest:(id)a3;
- (AMSUIInlineDialogViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4;
- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7;
- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 context:(id)a5;
- (AMSUIMessageViewController)childContentController;
- (AMSUIMessageViewControllerDelegate)delegate;
- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldAutomaticallyReportMetrics;
- (CGPoint)anchorPoint;
- (NSDictionary)context;
- (NSString)placement;
- (NSString)serviceType;
- (id)_findDialogRequestInResponse:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)impressionsReportingFrequency;
- (void)_didFailToFetchWithError:(id)a3;
- (void)_didFetchResponse:(id)a3;
- (void)_setContentController:(id)a3;
- (void)_setDialogRequest:(id)a3;
- (void)_setDialogRequestBanner:(id)a3;
- (void)_setDialogRequestBubbleTip:(id)a3;
- (void)_setDialogRequestDashboardMessage:(id)a3;
- (void)_setupEngagement;
- (void)_tearDownContentView;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)enqueueImpressionMetrics;
- (void)loadView;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)setAccount:(id)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setBag:(id)a3;
- (void)setChildContentController:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialogRequest:(id)a3;
- (void)setEngagement:(id)a3;
- (void)setImpressionsReportingFrequency:(unint64_t)a3;
- (void)setLoadPromise:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setPreferredAppearance:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3;
@end

@implementation AMSUIInlineDialogViewController

- (void)setDelegate:(id)a3
{
}

- (void)loadView
{
  v3 = [AMSUIInlineDialogView alloc];
  v4 = -[AMSUICommonView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AMSUIInlineDialogViewController *)self setView:v4];

  v5 = [(AMSUIInlineDialogViewController *)self dialogRequest];

  if (v5)
  {
    id v6 = [(AMSUIInlineDialogViewController *)self dialogRequest];
    [(AMSUIInlineDialogViewController *)self _setDialogRequest:v6];
  }
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIInlineDialogViewController;
  v9 = [(AMSUIInlineDialogViewController *)&v17 initWithNibName:0 bundle:0];
  if (v9)
  {
    v10 = (AMSEngagement *)objc_alloc_init(MEMORY[0x263F27C28]);
    engagement = v9->_engagement;
    v9->_engagement = v10;

    v9->_impressionsReportingFrequency = 1;
    objc_storeStrong((id *)&v9->_placement, a4);
    objc_storeStrong((id *)&v9->_serviceType, a3);
    v9->_shouldAutomaticallyReportMetrics = 1;
    v12 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v12)
    {
      v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      v21 = v15;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized (placement: %{public}@, serviceType: %{public}@)", buf, 0x2Au);
    }
    [(AMSUIInlineDialogViewController *)v9 _setupEngagement];
  }

  return v9;
}

- (void)_setupEngagement
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUIInlineDialogViewController *)self engagement];
  if (v3)
  {
    id v28 = (id)v3;
    uint64_t v4 = [(AMSUIInlineDialogViewController *)self serviceType];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [(AMSUIInlineDialogViewController *)self placement];

      if (v6)
      {
        id v7 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
        if (!v7)
        {
          id v7 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        id v8 = [v7 OSLogObject];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = objc_opt_class();
          v10 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = v9;
          __int16 v34 = 2114;
          v35 = v10;
          _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing initial message event request", buf, 0x16u);
        }
        id v11 = objc_alloc(MEMORY[0x263F27C38]);
        v12 = [(AMSUIInlineDialogViewController *)self serviceType];
        id v13 = objc_alloc(MEMORY[0x263F27C50]);
        uint64_t v14 = [(AMSUIInlineDialogViewController *)self placement];
        v15 = [(AMSUIInlineDialogViewController *)self context];
        v16 = (void *)[v13 initWithPlacement:v14 context:v15];
        v31 = v16;
        objc_super v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
        v18 = (void *)[v11 initWithServiceType:v12 placementInfo:v17];

        uint64_t v19 = [(AMSUIInlineDialogViewController *)self engagement];
        __int16 v20 = [v19 enqueueMessageEvent:v18];

        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke;
        v30[3] = &unk_2643E3D58;
        v30[4] = self;
        [v20 addSuccessBlock:v30];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_2;
        v29[3] = &unk_2643E3570;
        v29[4] = self;
        [v20 addErrorBlock:v29];
        v21 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
        if (!v21)
        {
          v21 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        __int16 v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = objc_opt_class();
          __int16 v24 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v33 = v23;
          __int16 v34 = 2114;
          v35 = v24;
          _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning to observe for updates", buf, 0x16u);
        }
        id v25 = [(AMSUIInlineDialogViewController *)self engagement];
        uint64_t v26 = [(AMSUIInlineDialogViewController *)self placement];
        v27 = [(AMSUIInlineDialogViewController *)self serviceType];
        [v25 addObserver:self placement:v26 serviceType:v27];
      }
    }
    else
    {
    }
  }
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)placement
{
  return self->_placement;
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

- (NSDictionary)context
{
  return self->_context;
}

- (AMSUIInlineDialogViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUIInlineDialogViewController;
  v2 = [(AMSUIInlineDialogViewController *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_impressionsReportingFrequency = 1;
    uint64_t v4 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
    loadPromise = v3->_loadPromise;
    v3->_loadPromise = v4;

    [(AMSBinaryPromise *)v3->_loadPromise finishWithSuccess];
    v3->_shouldAutomaticallyReportMetrics = 1;
  }
  return v3;
}

- (AMSUIInlineDialogViewController)initWithRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIInlineDialogViewController;
  id v6 = [(AMSUIInlineDialogViewController *)&v13 initWithNibName:0 bundle:0];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v7->_impressionsReportingFrequency = 1;
    v7->_shouldAutomaticallyReportMetrics = 1;
    id v8 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      objc_super v17 = v11;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized with a dialog request, will not listen for engagement pushes.", buf, 0x16u);
    }
  }

  return v7;
}

- (AMSUIInlineDialogViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(AMSUIInlineDialogViewController *)self initWithRequest:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a5);
    objc_storeStrong((id *)&v12->_bag, a4);
  }

  return v12;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIInlineDialogViewController;
  v12 = [(AMSUIInlineDialogViewController *)&v20 initWithNibName:0 bundle:0];
  if (v12)
  {
    objc_super v13 = (AMSEngagement *)objc_alloc_init(MEMORY[0x263F27C28]);
    engagement = v12->_engagement;
    v12->_engagement = v13;

    objc_storeStrong((id *)&v12->_context, a5);
    objc_storeStrong((id *)&v12->_placement, a4);
    objc_storeStrong((id *)&v12->_serviceType, a3);
    v12->_shouldAutomaticallyReportMetrics = 1;
    uint64_t v15 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v15)
    {
      uint64_t v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      __int16 v24 = v18;
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initialized (placement: %{public}@, serviceType: %{public}@)", buf, 0x2Au);
    }
    [(AMSUIInlineDialogViewController *)v12 _setupEngagement];
  }

  return v12;
}

- (AMSUIInlineDialogViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(AMSUIInlineDialogViewController *)self initWithServiceType:a3 placement:a4 context:a7];
  __int16 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a6);
    objc_storeStrong((id *)&v16->_bag, a5);
  }

  return v16;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_messageViewController_enqueueEventWithFields_inTopic_ == a3)
  {
    id v5 = [(AMSUIInlineDialogViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6) {
      return 1;
    }
  }
  if (sel_messageViewController_enqueueActionEventWithFields_inTopic_ == a3)
  {
    objc_super v7 = [(AMSUIInlineDialogViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8) {
      return 1;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AMSUIInlineDialogViewController;
  return [(AMSUIInlineDialogViewController *)&v10 respondsToSelector:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (sel_messageViewController_enqueueActionEventWithFields_inTopic_ == a3
    || sel_messageViewController_enqueueEventWithFields_inTopic_ == a3)
  {
    uint64_t v4 = [(AMSUIInlineDialogViewController *)self delegate];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_setDialogRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 style] == 3)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      char v8 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Banner", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIInlineDialogViewController *)self _setDialogRequestBanner:v4];
  }
  else
  {
    uint64_t v9 = [v4 style];
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    id v11 = (void *)v10;
    if (v9 == 6)
    {
      if (!v10)
      {
        id v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        id v14 = AMSLogKey();
        int v18 = 138543618;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        v21 = v14;
        _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Dashboard Message", (uint8_t *)&v18, 0x16u);
      }
      [(AMSUIInlineDialogViewController *)self _setDialogRequestDashboardMessage:v4];
    }
    else
    {
      if (!v10)
      {
        id v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v15 = [v11 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = AMSLogKey();
        int v18 = 138543618;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        v21 = v17;
        _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rendering message as Bubble Tip", (uint8_t *)&v18, 0x16u);
      }
      [(AMSUIInlineDialogViewController *)self _setDialogRequestBubbleTip:v4];
    }
  }
}

- (void)_setDialogRequestBanner:(id)a3
{
  id v4 = a3;
  id v5 = [AMSUIBannerMessageViewController alloc];
  char v6 = [(AMSUIInlineDialogViewController *)self bag];
  uint64_t v7 = [(AMSUIInlineDialogViewController *)self account];
  uint64_t v10 = [(AMSUIBannerMessageViewController *)v5 initWithRequest:v4 bag:v6 account:v7];

  char v8 = [(AMSUIInlineDialogViewController *)self preferredAppearance];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  [(AMSUIBannerMessageViewController *)v10 setPreferredAppearance:v9];
  [(AMSUIBaseMessageViewController *)v10 setDelegate:self];
  [(AMSUIInlineDialogViewController *)self _setContentController:v10];
}

- (void)_setDialogRequestBubbleTip:(id)a3
{
  id v4 = a3;
  id v5 = [AMSUIBubbleTipViewController alloc];
  char v6 = [(AMSUIInlineDialogViewController *)self bag];
  uint64_t v7 = [(AMSUIInlineDialogViewController *)self account];
  uint64_t v10 = [(AMSUIBubbleTipViewController *)v5 initWithRequest:v4 bag:v6 account:v7];

  char v8 = [(AMSUIInlineDialogViewController *)self preferredAppearance];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  [(AMSUIBubbleTipViewController *)v10 setPreferredAppearance:v9];
  [(AMSUIBaseMessageViewController *)v10 setDelegate:self];
  [(AMSUIInlineDialogViewController *)self _setContentController:v10];
}

- (void)_setDialogRequestDashboardMessage:(id)a3
{
  id v4 = a3;
  id v5 = [AMSUIDashboardMessageViewController alloc];
  char v6 = [(AMSUIInlineDialogViewController *)self bag];
  uint64_t v7 = [(AMSUIInlineDialogViewController *)self account];
  uint64_t v10 = [(AMSUIDashboardMessageViewController *)v5 initWithRequest:v4 bag:v6 account:v7];

  char v8 = [(AMSUIInlineDialogViewController *)self preferredAppearance];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  [(AMSUIDashboardMessageViewController *)v10 setPreferredAppearance:v9];
  [(AMSUIBaseMessageViewController *)v10 setDelegate:self];
  [(AMSUIInlineDialogViewController *)self _setContentController:v10];
}

- (void)_setContentController:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AMSUIInlineDialogViewController *)self childContentController];

  if (v5)
  {
    char v6 = [(AMSUIInlineDialogViewController *)self childContentController];
    uint64_t v7 = [v6 viewIfLoaded];
    [v7 removeFromSuperview];

    char v8 = [(AMSUIInlineDialogViewController *)self childContentController];
    [v8 removeFromParentViewController];

    [(AMSUIInlineDialogViewController *)self setChildContentController:0];
  }
  if (v4)
  {
    objc_msgSend(v4, "setShouldAutomaticallyReportMetrics:", -[AMSUIInlineDialogViewController shouldAutomaticallyReportMetrics](self, "shouldAutomaticallyReportMetrics"));
    objc_msgSend(v4, "setImpressionsReportingFrequency:", -[AMSUIInlineDialogViewController impressionsReportingFrequency](self, "impressionsReportingFrequency"));
    [(AMSUIInlineDialogViewController *)self setChildContentController:v4];
    objc_initWeak(&location, v4);
    id v9 = [v4 loadPromise];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__AMSUIInlineDialogViewController__setContentController___block_invoke;
    v10[3] = &unk_2643E3D30;
    objc_copyWeak(&v11, &location);
    v10[4] = self;
    [v9 addFinishBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __57__AMSUIInlineDialogViewController__setContentController___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__AMSUIInlineDialogViewController__setContentController___block_invoke_2;
  v2[3] = &unk_2643E3598;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
}

void __57__AMSUIInlineDialogViewController__setContentController___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) childContentController];

    uint64_t v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    id v5 = (void *)v4;
    if (v3 == WeakRetained)
    {
      if (!v4)
      {
        id v5 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v11 = [v5 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v12;
        __int16 v32 = 2114;
        uint64_t v33 = v13;
        _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Child controller loaded, adding to view heiarchy", buf, 0x16u);
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = objc_msgSend(*(id *)(a1 + 32), "view", 0);
      uint64_t v15 = [v14 subviews];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      [*(id *)(a1 + 32) addChildViewController:WeakRetained];
      __int16 v20 = [*(id *)(a1 + 32) view];
      v21 = [WeakRetained view];
      [v20 addSubview:v21];

      id v5 = [*(id *)(a1 + 32) delegate];
      uint64_t v22 = *(void **)(a1 + 32);
      char v6 = [v22 view];
      [v6 bounds];
      objc_msgSend(v5, "messageViewController:didUpdateSize:", v22, v23, v24);
    }
    else
    {
      if (!v4)
      {
        id v5 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      char v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = objc_opt_class();
        char v8 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v7;
        __int16 v32 = 2114;
        uint64_t v33 = v8;
        id v9 = "%{public}@: [%{public}@] Child controller loaded but a different child is being presented";
LABEL_11:
        _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
      }
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    if (!v5)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      char v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v8;
      id v9 = "%{public}@: [%{public}@] Child controller loaded but disappeared";
      goto LABEL_11;
    }
  }
}

- (void)_tearDownContentView
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AMSUIInlineDialogViewController *)self childContentController];

  uint64_t v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      char v8 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      __int16 v20 = v8;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Tearing down content", (uint8_t *)&v17, 0x16u);
    }
    id v9 = [(AMSUIInlineDialogViewController *)self childContentController];
    uint64_t v10 = [v9 viewIfLoaded];
    [v10 removeFromSuperview];

    id v11 = [(AMSUIInlineDialogViewController *)self childContentController];
    [v11 removeFromParentViewController];

    [(AMSUIInlineDialogViewController *)self setChildContentController:0];
    uint64_t v12 = [(AMSUIInlineDialogViewController *)self view];
    [v12 setNeedsLayout];

    id v5 = [(AMSUIInlineDialogViewController *)self delegate];
    uint64_t v13 = [(AMSUIInlineDialogViewController *)self view];
    [v13 frame];
    objc_msgSend(v5, "messageViewController:didUpdateSize:", self, v14, 0.0);
  }
  else
  {
    if (!v4)
    {
      id v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v13 = [v5 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      __int16 v20 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No content to teardown.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)enqueueImpressionMetrics
{
  id v2 = [(AMSUIInlineDialogViewController *)self childContentController];
  [v2 enqueueImpressionMetrics];
}

- (void)setPreferredAppearance:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(AMSUIInlineDialogViewController *)self childContentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
LABEL_7:
      char v6 = [(AMSUIInlineDialogViewController *)self childContentController];
      [v6 setPreferredAppearance:v8];
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v6 = [(AMSUIInlineDialogViewController *)self childContentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

- (AMSUIAppearance)preferredAppearance
{
  id v3 = [(AMSUIInlineDialogViewController *)self childContentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(AMSUIInlineDialogViewController *)self childContentController];
  if (isKindOfClass) {
    goto LABEL_4;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if (v6)
  {
    id v5 = [(AMSUIInlineDialogViewController *)self childContentController];
LABEL_4:
    char v7 = [v5 preferredAppearance];

    goto LABEL_6;
  }
  char v7 = 0;
LABEL_6:
  return (AMSUIAppearance *)v7;
}

- (unint64_t)impressionsReportingFrequency
{
  return self->_impressionsReportingFrequency;
}

- (void)setImpressionsReportingFrequency:(unint64_t)a3
{
  id v5 = [(AMSUIInlineDialogViewController *)self childContentController];

  if (v5)
  {
    char v6 = [(AMSUIInlineDialogViewController *)self childContentController];
    [v6 setImpressionsReportingFrequency:a3];
  }
  self->_impressionsReportingFrequency = a3;
}

- (BOOL)shouldAutomaticallyReportMetrics
{
  return self->_shouldAutomaticallyReportMetrics;
}

- (void)setShouldAutomaticallyReportMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AMSUIInlineDialogViewController *)self childContentController];

  if (v5)
  {
    char v6 = [(AMSUIInlineDialogViewController *)self childContentController];
    [v6 setShouldAutomaticallyReportMetrics:v3];
  }
  self->_shouldAutomaticallyReportMetrics = v3;
}

void __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    char v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    double v14 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_22;
  v9[3] = &unk_2643E34D0;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFetchResponse:*(void *)(a1 + 40)];
}

void __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    char v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    double v14 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_24;
  v9[3] = &unk_2643E34D0;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __51__AMSUIInlineDialogViewController__setupEngagement__block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFailToFetchWithError:*(void *)(a1 + 40)];
}

- (id)_findDialogRequestInResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIInlineDialogViewController *)self placement];
  uint64_t v6 = [(AMSUIInlineDialogViewController *)self placement];

  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    char v7 = objc_msgSend(v4, "messageActions", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) placementsMap];
        __int16 v13 = [v12 objectForKeyedSubscript:v5];
        double v14 = [v13 firstObject];
        uint64_t v15 = [v14 makeDialogRequest];

        if (v15) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F27CB8];
  id v6 = a4;
  char v7 = [v5 sharedMessagingUIConfig];
  if (!v7)
  {
    char v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    uint64_t v11 = [(AMSUIInlineDialogViewController *)self placement];
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    long long v18 = v11;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] action for %@ was pushed", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v12 = [(AMSUIInlineDialogViewController *)self delegate];
  [v12 messageViewController:self didSelectActionWithDialogResult:v6];
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [(AMSUIInlineDialogViewController *)self delegate];
  objc_msgSend(v7, "messageViewController:didUpdateSize:", self, width, height);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(AMSUIInlineDialogViewController *)self delegate];
  [v6 messageViewController:self didFailWithError:v5];
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  id v5 = a4;
  id v6 = [(AMSUIInlineDialogViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(AMSUIInlineDialogViewController *)self delegate];
    char v9 = [v8 messageViewController:self shouldEnqueueMetricsForDialogResult:v5];
  }
  else
  {
    char v9 = [(AMSUIInlineDialogViewController *)self shouldAutomaticallyReportMetrics];
  }

  return v9;
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(AMSUIInlineDialogViewController *)self serviceType];
  char v13 = [v12 isEqualToString:v11];

  if (v13)
  {
    uint64_t v14 = [(AMSUIInlineDialogViewController *)self placement];
    char v15 = [v14 isEqualToString:v10];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      __int16 v17 = (void *)v16;
      if (v9)
      {
        if (!v16)
        {
          __int16 v17 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        long long v18 = [v17 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = objc_opt_class();
          long long v20 = AMSLogKey();
          uint64_t v21 = [(AMSUIInlineDialogViewController *)self placement];
          *(_DWORD *)buf = 138543874;
          uint64_t v38 = v19;
          __int16 v39 = 2114;
          v40 = v20;
          __int16 v41 = 2112;
          v42 = v21;
          _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Message for %@ was pushed to", buf, 0x20u);
        }
        uint64_t v22 = [(AMSUIInlineDialogViewController *)self delegate];
        char v23 = objc_opt_respondsToSelector();

        if (v23)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_30;
          block[3] = &unk_2643E34D0;
          block[4] = self;
          id v35 = v9;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_2;
        v32[3] = &unk_2643E34D0;
        v32[4] = self;
        id v33 = v9;
        dispatch_async(MEMORY[0x263EF83A0], v32);
      }
      else
      {
        if (!v16)
        {
          __int16 v17 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        long long v28 = [v17 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = objc_opt_class();
          v30 = AMSLogKey();
          uint64_t v31 = [(AMSUIInlineDialogViewController *)self placement];
          *(_DWORD *)buf = 138543874;
          uint64_t v38 = v29;
          __int16 v39 = 2114;
          v40 = v30;
          __int16 v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Nil message for %@ was pushed", buf, 0x20u);
        }
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke;
        v36[3] = &unk_2643E3118;
        v36[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v36);
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  double v24 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  if (!v24)
  {
    double v24 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  long long v25 = [v24 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = objc_opt_class();
    long long v27 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v26;
    __int16 v39 = 2114;
    v40 = v27;
    _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Ignoring dialog pushed due to wrong placement and service type", buf, 0x16u);
  }
LABEL_17:
}

uint64_t __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownContentView];
}

void __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageViewController:*(void *)(a1 + 32) didLoadDialogRequest:*(void *)(a1 + 40)];
}

uint64_t __85__AMSUIInlineDialogViewController_engagement_didUpdateRequest_placement_serviceType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDialogRequest:*(void *)(a1 + 40)];
}

- (void)_didFetchResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AMSUIInlineDialogViewController *)self _findDialogRequestInResponse:v4];

  [(AMSUIInlineDialogViewController *)self setDialogRequest:v5];
  uint64_t v6 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
  char v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      char v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found message to display", (uint8_t *)&v18, 0x16u);
    }
    id v11 = [(AMSUIInlineDialogViewController *)self viewIfLoaded];

    if (v11) {
      [(AMSUIInlineDialogViewController *)self _setDialogRequest:v5];
    }
    uint64_t v12 = [(AMSUIInlineDialogViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(AMSUIInlineDialogViewController *)self delegate];
      [v14 messageViewController:self didLoadDialogRequest:v5];
    }
  }
  else
  {
    if (!v6)
    {
      char v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    char v15 = [v7 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      __int16 v17 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No message found to display", (uint8_t *)&v18, 0x16u);
    }
    [(AMSUIInlineDialogViewController *)self _tearDownContentView];
  }
}

- (void)_didFailToFetchWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIInlineDialogViewController *)self delegate];
  [v5 messageViewController:self didFailWithError:v4];
}

- (CGPoint)anchorPoint
{
  objc_copyStruct(v4, &self->_anchorPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_anchorPoint, &v3, 16, 1, 0);
}

- (AMSBinaryPromise)loadPromise
{
  return self->_loadPromise;
}

- (void)setLoadPromise:(id)a3
{
}

- (AMSUIMessageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIMessageViewControllerDelegate *)WeakRetained;
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

- (void)setEngagement:(id)a3
{
}

- (void)setDialogRequest:(id)a3
{
}

- (void)setPlacement:(id)a3
{
}

- (void)setServiceType:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (AMSUIMessageViewController)childContentController
{
  return self->_childContentController;
}

- (void)setChildContentController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childContentController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadPromise, 0);
}

@end