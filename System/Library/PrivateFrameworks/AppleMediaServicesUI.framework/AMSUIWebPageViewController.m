@interface AMSUIWebPageViewController
- (AMSUIWebAppOverlayViewController)appOverlayViewController;
- (AMSUIWebAppearance)appearance;
- (AMSUIWebClientContext)context;
- (AMSUIWebPageModel)model;
- (AMSUIWebPageViewController)initWithContext:(id)a3 dataProvider:(id)a4;
- (AMSUIWebPageViewControllerDelegate)delegate;
- (AMSUIWebView)webView;
- (CGSize)contentSize;
- (NSURL)URL;
- (id)_appOverlayTransitioning;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)dismissAppOverlay;
- (id)loadRequest:(id)a3;
- (id)presentAppOverlayWithAdamID:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_applyAppearance;
- (void)_didEncodeRequest:(id)a3;
- (void)_downloadHTMLForRequest:(id)a3 completion:(id)a4;
- (void)_updateLayout;
- (void)_updateToolbarButtonItems;
- (void)_willEncodeRequest:(id)a3;
- (void)loadView;
- (void)setAppOverlayViewController:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
- (void)setURL:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebPageViewController

- (AMSUIWebPageViewController)initWithContext:(id)a3 dataProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebPageViewController;
  v8 = [(AMSUIWebPageViewController *)&v13 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    uint64_t v10 = [v7 createWebView];
    webView = v9->_webView;
    v9->_webView = (AMSUIWebView *)v10;
  }
  return v9;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebPageViewController;
  [(AMSUICommonViewController *)&v6 loadView];
  v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  [(UIViewController *)self ams_setBackgroundColor:v3];

  v4 = [(AMSUICommonViewController *)self view];
  v5 = [(AMSUIWebPageViewController *)self webView];
  [v4 addSubview:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPageViewController;
  [(AMSUIWebPageViewController *)&v4 viewWillAppear:a3];
  [(AMSUIWebPageViewController *)self _applyAppearance];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebPageViewController;
  [(AMSUIWebPageViewController *)&v3 viewWillLayoutSubviews];
  [(AMSUIWebPageViewController *)self _updateLayout];
}

- (id)loadRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(AMSUIWebPageViewController *)self context];
  int v6 = [v5 loadUsingWebKit];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    [(AMSUIWebPageViewController *)self _willEncodeRequest:v7];
    [(AMSUIWebPageViewController *)self _didEncodeRequest:v7];
    v8 = [(AMSUIWebPageViewController *)self webView];
    id v9 = [v8 loadRequest:v7];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263F27B58]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__AMSUIWebPageViewController_loadRequest___block_invoke;
    v12[3] = &unk_2643E55B8;
    objc_copyWeak(&v15, &location);
    id v9 = v10;
    id v13 = v9;
    id v14 = v4;
    [(AMSUIWebPageViewController *)self _downloadHTMLForRequest:v14 completion:v12];

    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);

  return v9;
}

void __42__AMSUIWebPageViewController_loadRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (v5)
  {
    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    v8 = [WeakRetained webView];
    id v9 = [v15 task];
    id v10 = [v9 currentRequest];
    v11 = v10;
    if (!v10) {
      v11 = *(void **)(a1 + 40);
    }
    v12 = [v15 response];
    id v13 = [v15 data];
    id v14 = [v8 loadRequest:v11 response:v12 responseData:v13];

    [*(id *)(a1 + 32) finishWithPromise:v14];
  }
}

- (id)dismissAppOverlay
{
  objc_super v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__AMSUIWebPageViewController_dismissAppOverlay__block_invoke;
  v8[3] = &unk_2643E34D0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(AMSUIWebPageViewController *)self dismissViewControllerAnimated:1 completion:v8];
  id v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __47__AMSUIWebPageViewController_dismissAppOverlay__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppOverlayViewController:0];
  v2 = *(void **)(a1 + 40);
  return [v2 finishWithSuccess];
}

- (id)presentAppOverlayWithAdamID:(id)a3
{
  id v4 = a3;
  id v5 = [AMSUIWebAppOverlayViewController alloc];
  id v6 = [(AMSUIWebPageViewController *)self context];
  id v7 = [v6 clientInfo];
  v8 = [v7 bundleIdentifier];
  id v9 = [(AMSUIWebAppOverlayViewController *)v5 initWithAppAdamID:v4 hostBundleIdentifier:v8];

  [(AMSUIWebAppOverlayViewController *)v9 setModalPresentationStyle:4];
  [(AMSUIWebAppOverlayViewController *)v9 setTransitioningDelegate:self];
  [(AMSUIWebAppOverlayViewController *)v9 setViewRespectsSystemMinimumLayoutMargins:0];
  [(AMSUIWebPageViewController *)self setAppOverlayViewController:v9];
  id v10 = [(AMSUIWebAppOverlayViewController *)v9 preload];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke;
  v14[3] = &unk_2643E55E0;
  v14[4] = self;
  id v15 = v9;
  v11 = v9;
  v12 = [v10 thenWithBlock:v14];

  return v12;
}

id __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke_2;
  v7[3] = &unk_2643E3118;
  id v5 = v2;
  id v8 = v5;
  [v4 presentViewController:v3 animated:1 completion:v7];

  return v5;
}

uint64_t __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess];
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  uint64_t v3 = [(AMSUIWebPageViewController *)self webView];
  id v4 = [v3 underlyingWebView];
  id v5 = [v4 scrollView];

  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AMSUIToastPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  [(AMSUIToastPresentationController *)v8 setDismissDelayTimeInterval:0.0];
  return v8;
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
    [(AMSUIWebPageViewController *)self _applyAppearance];
    [(AMSUIWebPageViewController *)self _updateLayout];
    [(AMSUIWebPageViewController *)self _updateToolbarButtonItems];
  }
  else
  {
    id v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = [(AMSUIWebPageViewController *)self context];
      id v14 = [v13 logKey];
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid browser page model: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)_applyAppearance
{
  id v16 = [(AMSUIWebPageViewController *)self appearance];
  uint64_t v3 = +[AMSUIWebAppearance defaultPlatformBackgroundColor];
  uint64_t v4 = [v16 backgroundColor];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  [(UIViewController *)self ams_setBackgroundColor:v6];

  uint64_t v7 = [v16 backgroundColor];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v3;
  }
  id v10 = [(AMSUIWebPageViewController *)self webView];
  objc_msgSend(v10, "ams_setBackgroundColor:", v9);

  uint64_t v11 = [v16 backgroundColor];
  uint64_t v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v3;
  }
  id v14 = [(AMSUIWebPageViewController *)self webView];
  int v15 = [v14 underlyingWebView];
  objc_msgSend(v15, "ams_setBackgroundColor:", v13);
}

- (id)_appOverlayTransitioning
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  uint64_t v3 = off_2643E2798;
  if (!IsReduceMotionEnabled) {
    uint64_t v3 = off_2643E2810;
  }
  id v4 = objc_alloc_init(*v3);
  return v4;
}

- (void)_didEncodeRequest:(id)a3
{
  id v7 = a3;
  id v4 = [(AMSUIWebPageViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AMSUIWebPageViewController *)self delegate];
    [v6 webPageViewController:self didEncodeNetworkRequest:v7];
  }
}

- (void)_downloadHTMLForRequest:(id)a3 completion:(id)a4
{
  id v29 = a4;
  id v6 = (void *)[a3 mutableCopy];
  [(AMSUIWebPageViewController *)self _willEncodeRequest:v6];
  id v7 = [(AMSUIWebPageViewController *)self context];
  id v8 = [v7 URLSession];

  id v9 = objc_alloc(MEMORY[0x263F27ED8]);
  id v10 = [(AMSUIWebPageViewController *)self context];
  uint64_t v11 = [v10 bag];
  uint64_t v12 = (void *)[v9 initWithBag:v11];

  id v13 = [(AMSUIWebPageViewController *)self context];
  id v14 = [v13 account];
  [v12 setAccount:v14];

  int v15 = [(AMSUIWebPageViewController *)self context];
  id v16 = [v15 clientInfo];
  [v12 setClientInfo:v16];

  __int16 v17 = [(AMSUIWebPageViewController *)self context];
  v18 = [v17 logKey];
  [v12 setLogUUID:v18];

  __int16 v19 = [(AMSUIWebPageViewController *)self context];
  id v20 = [v19 mescalSession];

  if (!v20) {
    [v12 setMescalType:1];
  }
  uint64_t v21 = [(AMSUIWebPageViewController *)self context];
  objc_msgSend(v12, "setUrlKnownToBeTrusted:", objc_msgSend(v21, "disableTrustedDomains"));

  id v22 = objc_alloc_init(MEMORY[0x263F27C98]);
  [v22 setPurpose:1];
  objc_msgSend(v22, "setStyle:", objc_msgSend(MEMORY[0x263F27C98], "preferredAttestationStyle"));
  [v12 setKeychainOptions:v22];
  v23 = [v12 requestByEncodingRequest:v6 parameters:0];
  if (v20)
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke;
    v35[3] = &unk_2643E44D8;
    id v36 = v20;
    v37 = self;
    uint64_t v24 = [v23 thenWithBlock:v35];

    v23 = (void *)v24;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2_28;
  v33[3] = &unk_2643E44D8;
  v33[4] = self;
  id v34 = v8;
  id v25 = v8;
  v26 = [v23 thenWithBlock:v33];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3_29;
  v30[3] = &unk_2643E5608;
  v30[4] = self;
  id v31 = v20;
  id v32 = v29;
  id v27 = v29;
  id v28 = v20;
  [v26 addFinishBlock:v30];
}

id __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [MEMORY[0x263EFF8F8] data];
  id v6 = [v4 primeSignatureForData:v5];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2;
  v18[3] = &unk_2643E5480;
  id v7 = v3;
  id v19 = v7;
  [v6 addSuccessBlock:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3;
  v17[3] = &unk_2643E3570;
  v17[4] = *(void *)(a1 + 40);
  [v6 addErrorBlock:v17];
  id v8 = objc_alloc_init(MEMORY[0x263F27E10]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_25;
  v14[3] = &unk_2643E54A8;
  id v9 = v8;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  [v6 addFinishBlock:v14];
  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base64EncodedStringWithOptions:0];
  [v2 setValue:v3 forHTTPHeaderField:*MEMORY[0x263F278F0]];
}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  char v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 32) context];
    id v8 = [v7 logKey];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to prime sign: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

id __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _didEncodeRequest:v4];
  char v5 = [*(id *)(a1 + 40) dataTaskPromiseWithRequest:v4];

  return v5;
}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = [*(id *)(a1 + 32) context];
  int v9 = [v8 account];
  objc_msgSend(v9, "ams_addCookiesForResult:", v6);

  uint64_t v10 = [*(id *)(a1 + 32) context];
  __int16 v11 = [v10 versionNumber];
  id v12 = v11;
  if (!v11)
  {
    id v3 = [v6 responseHeaders];
    id v12 = [v3 objectForKeyedSubscript:*MEMORY[0x263F278F8]];
  }
  __int16 v13 = [*(id *)(a1 + 32) context];
  [v13 setVersionNumber:v12];

  if (!v11)
  {
  }
  id v14 = [v6 responseHeaders];
  uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F278F0]];

  if (*(void *)(a1 + 40) && [v15 length])
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
    __int16 v17 = [*(id *)(a1 + 40) verifyPrimeSignature:v16];
    id v32 = 0;
    v18 = [v17 resultWithError:&v32];
    id v19 = v32;

    uint64_t v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    uint64_t v21 = (void *)v20;
    if (v18)
    {
      if (!v20)
      {
        uint64_t v21 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v22 = [v21 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      id v29 = v17;
      id v23 = v19;
      uint64_t v24 = objc_opt_class();
      [*(id *)(a1 + 32) context];
      id v25 = v31 = v16;
      v26 = [v25 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v24;
      id v19 = v23;
      __int16 v17 = v29;
      __int16 v35 = 2114;
      id v36 = v26;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verify prime finished.", buf, 0x16u);
    }
    else
    {
      if (!v20)
      {
        uint64_t v21 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v22 = [v21 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v30 = objc_opt_class();
      [*(id *)(a1 + 32) context];
      id v25 = v31 = v16;
      [v25 logKey];
      v28 = id v27 = v19;
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v30;
      __int16 v35 = 2114;
      id v36 = v28;
      __int16 v37 = 2114;
      id v38 = v27;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Verify prime failed: %{public}@", buf, 0x20u);

      id v19 = v27;
    }

    id v16 = v31;
LABEL_17:
  }
  if (!v6 || v7)
  {
    if (!v7)
    {
      AMSError();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_updateToolbarButtonItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(AMSUIWebPageViewController *)self model];
  char v5 = [v4 toolbar];

  id v6 = [v5 leftButton];
  id v7 = (void *)MEMORY[0x263F824A8];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke;
  v22[3] = &unk_2643E3118;
  id v8 = v6;
  id v23 = v8;
  int v9 = [v7 barButtonItemWithWebButtonModel:v8 navigationBarModel:0 actionBlock:v22];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setAccessibilityIdentifier:@"left_bar_button_item"];
    [v3 addObject:v10];
  }
  __int16 v11 = [v5 rightButton];
  id v12 = (void *)MEMORY[0x263F824A8];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke_2;
  uint64_t v20 = &unk_2643E3118;
  id v13 = v11;
  id v21 = v13;
  id v14 = [v12 barButtonItemWithWebButtonModel:v13 navigationBarModel:0 actionBlock:&v17];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setAccessibilityIdentifier:", @"right_bar_button_item", v17, v18, v19, v20);
    id v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    [v3 addObject:v16];

    [v3 addObject:v15];
  }
  -[AMSUIWebPageViewController setToolbarItems:](self, "setToolbarItems:", v3, v17, v18, v19, v20);
}

void __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) action];
  id v1 = (id)[v2 runAction];
}

void __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) action];
  id v1 = (id)[v2 runAction];
}

- (void)_updateLayout
{
  id v12 = [(AMSUICommonViewController *)self view];
  [v12 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  __int16 v11 = [(AMSUIWebPageViewController *)self webView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_willEncodeRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(AMSUIWebPageViewController *)self context];
  double v6 = [v5 additionalHeaders];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__AMSUIWebPageViewController__willEncodeRequest___block_invoke;
  v8[3] = &unk_2643E46D0;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __49__AMSUIWebPageViewController__willEncodeRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (AMSUIWebPageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebPageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSUIWebView)webView
{
  return self->_webView;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (AMSUIWebAppOverlayViewController)appOverlayViewController
{
  return self->_appOverlayViewController;
}

- (void)setAppOverlayViewController:(id)a3
{
}

- (AMSUIWebPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_appOverlayViewController, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end