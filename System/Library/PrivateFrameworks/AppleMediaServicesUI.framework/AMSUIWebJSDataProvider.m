@interface AMSUIWebJSDataProvider
- (AMSUIWebClientContext)context;
- (AMSUIWebJSAppQueryManager)appQueryManager;
- (AMSUIWebJSDataProvider)initWithContext:(id)a3;
- (AMSUIWebJSProperties)properties;
- (AMSUIWebJSTelephonyProtocol)telephony;
- (AMSUIWebView)webView;
- (BOOL)_canInteractWithJS;
- (BOOL)startOTPListener;
- (BOOL)stopOTPListener;
- (NSString)otpIdentifier;
- (id)_syncPropertiesScriptWithProperties:(id)a3;
- (id)createWebView;
- (id)loadPageModelWithInfo:(id)a3;
- (id)loadPageRenderData;
- (id)postEvent:(id)a3 options:(id)a4;
- (id)runJSRequest:(id)a3;
- (id)runSafariCallback:(id)a3;
- (id)syncProperties;
- (void)_observeNotifications;
- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3;
- (void)_postSubscriptionChangedWithType:(int64_t)a3;
- (void)_postTelephonyDidChangeEvent;
- (void)_purchaseDidSucceed:(id)a3;
- (void)_safariDataUpdate:(id)a3;
- (void)_subscriptionStatusChangeActivity:(id)a3;
- (void)_subscriptionStatusChangeAppStore:(id)a3;
- (void)_subscriptionStatusChangeHWBundle:(id)a3;
- (void)_subscriptionStatusChangeMusic:(id)a3;
- (void)_subscriptionStatusChangeNews:(id)a3;
- (void)_subscriptionStatusChangeTV:(id)a3;
- (void)_subscriptionStatusChangeiCloud:(id)a3;
- (void)appQueryManager:(id)a3 didReceiveApps:(id)a4;
- (void)dealloc;
- (void)propertiesDidChange:(id)a3;
- (void)setContext:(id)a3;
- (void)setOtpIdentifier:(id)a3;
- (void)setProperties:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation AMSUIWebJSDataProvider

- (AMSUIWebJSAppQueryManager)appQueryManager
{
  v2 = self;
  objc_sync_enter(v2);
  appQueryManager = v2->_appQueryManager;
  if (!appQueryManager)
  {
    v4 = [[AMSUIWebJSAppQueryManager alloc] initWithDelegate:v2];
    v5 = v2->_appQueryManager;
    v2->_appQueryManager = v4;

    appQueryManager = v2->_appQueryManager;
  }
  v6 = appQueryManager;
  objc_sync_exit(v2);

  return v6;
}

- (AMSUIWebJSTelephonyProtocol)telephony
{
  v2 = self;
  objc_sync_enter(v2);
  telephony = v2->_telephony;
  if (!telephony)
  {
    v4 = [[AMSUIWebJSTelephony alloc] initWithDelegate:v2];
    v5 = v2->_telephony;
    v2->_telephony = v4;

    telephony = v2->_telephony;
  }
  v6 = telephony;
  objc_sync_exit(v2);

  return (AMSUIWebJSTelephonyProtocol *)v6;
}

- (AMSUIWebJSDataProvider)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebJSDataProvider;
  v5 = [(AMSUIWebJSDataProvider *)&v9 init];
  if (v5)
  {
    v6 = [[AMSUIWebJSProperties alloc] initWithContext:v4 delegate:v5];
    properties = v5->_properties;
    v5->_properties = v6;

    objc_storeWeak((id *)&v5->_context, v4);
    [(AMSUIWebJSDataProvider *)v5 _observeNotifications];
  }

  return v5;
}

- (void)dealloc
{
  [(AMSUIWebJSTelephony *)self->_telephony invalidate];
  [(AMSUIWebJSAppQueryManager *)self->_appQueryManager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSDataProvider;
  [(AMSUIWebJSDataProvider *)&v3 dealloc];
}

- (id)createWebView
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = [(AMSUIWebJSDataProvider *)self webView];

  if (v3)
  {
    id v4 = [(AMSUIWebJSDataProvider *)self webView];
  }
  else
  {
    v5 = [(AMSUIWebJSDataProvider *)self properties];
    v6 = [v5 generateProperties];
    id v22 = 0;
    v7 = [v6 resultWithTimeout:&v22 error:0.5];
    id v8 = v22;

    if (v8)
    {
      objc_super v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v9)
      {
        objc_super v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        v12 = AMSLogKey();
        v13 = [v8 description];
        *(_DWORD *)buf = 138543874;
        uint64_t v25 = v11;
        __int16 v26 = 2114;
        v27 = v12;
        __int16 v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error while generating properties for web view: %@", buf, 0x20u);
      }
    }
    uint64_t v14 = [(AMSUIWebJSDataProvider *)self _syncPropertiesScriptWithProperties:v7];
    v15 = (void *)v14;
    v16 = &stru_26CC491D8;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    v18 = [AMSUIWebView alloc];
    v19 = [(AMSUIWebJSDataProvider *)self context];
    v23 = v17;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];

    id v4 = [(AMSUIWebView *)v18 initWithContext:v19 additionalScripts:v20];
    [(AMSUIWebJSDataProvider *)self setWebView:v4];
  }
  return v4;
}

- (id)loadPageModelWithInfo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(AMSUIWebJSDataProvider *)self _canInteractWithJS];
  v6 = (void *)MEMORY[0x263F27E10];
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F27E10]);
    id v8 = [(AMSUIWebJSDataProvider *)self context];
    objc_super v9 = [v8 logKey];
    v10 = AMSUIWebSetSubLogKey(v9, 0);

    uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = objc_opt_class();
      __int16 v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading page model", buf, 0x16u);
    }

    v13 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"PageData" logKey:v10];
    [(AMSUIWebJSRequest *)v13 setOptions:v4];
    uint64_t v14 = [(AMSUIWebJSDataProvider *)self runJSRequest:v13];
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__AMSUIWebJSDataProvider_loadPageModelWithInfo___block_invoke;
    v18[3] = &unk_2643E5220;
    objc_copyWeak(&v20, (id *)buf);
    id v15 = v7;
    id v19 = v15;
    [v14 addFinishBlock:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = AMSError();
    id v15 = [v6 promiseWithError:v16];
  }
  return v15;
}

void __48__AMSUIWebJSDataProvider_loadPageModelWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    id v8 = [v5 body];
    objc_super v9 = [WeakRetained context];
    v10 = +[AMSUIWebModel pageModelFromJSObject:v8 context:v9];

    uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    v12 = (void *)v11;
    if (v10)
    {
      if (!v11)
      {
        v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_opt_class();
        id v15 = AMSLogKey();
        int v21 = 138543874;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        v24 = v15;
        __int16 v25 = 2114;
        __int16 v26 = v10;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loaded page: %{public}@", (uint8_t *)&v21, 0x20u);
      }
      [*(id *)(a1 + 32) finishWithResult:v10];
    }
    else
    {
      if (!v11)
      {
        v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v16 = [v12 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        v18 = AMSLogKey();
        int v21 = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load page model", (uint8_t *)&v21, 0x16u);
      }
      id v19 = *(void **)(a1 + 32);
      id v20 = AMSError();
      [v19 finishWithError:v20];
    }
  }
}

- (id)loadPageRenderData
{
  id v3 = objc_alloc_init(MEMORY[0x263F27E10]);
  id v4 = [(AMSUIWebJSDataProvider *)self context];
  id v5 = [v4 logKey];
  id v6 = AMSUIWebSetSubLogKey(v5, 0);

  id v7 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"PageRender" logKey:v6];
  id v8 = [(AMSUIWebJSDataProvider *)self runJSRequest:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__AMSUIWebJSDataProvider_loadPageRenderData__block_invoke;
  v11[3] = &unk_2643E5248;
  v11[4] = self;
  objc_super v9 = [v8 thenWithBlock:v11];

  return v9;
}

id __44__AMSUIWebJSDataProvider_loadPageRenderData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 body];

  if (v3)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v4)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loaded page render data from JS", (uint8_t *)&v14, 0x16u);
    }
    id v8 = (void *)MEMORY[0x263F27E10];
    objc_super v9 = [v2 body];
    uint64_t v10 = [v8 promiseWithResult:v9];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F27E10];
    objc_super v9 = AMSError();
    uint64_t v10 = [v11 promiseWithError:v9];
  }
  v12 = (void *)v10;

  return v12;
}

- (id)postEvent:(id)a3 options:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(AMSUIWebJSDataProvider *)self _canInteractWithJS])
  {
    id v8 = [(AMSUIWebJSDataProvider *)self context];
    objc_super v9 = [v8 logKey];
    uint64_t v10 = AMSUIWebSetSubLogKey(v9, 0);

    uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = objc_msgSend(v7, "ams_JSONStringWithError:", 0);
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      __int16 v28 = v10;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting event: %{public}@ options: %@", buf, 0x2Au);
    }
    uint64_t v15 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"_PostEvent" logKey:v10];
    uint64_t v22 = @"name";
    __int16 v23 = @"options";
    id v16 = (id)MEMORY[0x263EFFA78];
    if (v7) {
      id v16 = v7;
    }
    v24[0] = v6;
    v24[1] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v22 count:2];
    -[AMSUIWebJSRequest setOptions:](v15, "setOptions:", v17, v22, v23);

    uint64_t v18 = [(AMSUIWebJSDataProvider *)self runJSRequest:v15];
    id v19 = [v18 binaryPromiseAdapter];
  }
  else
  {
    id v20 = (void *)MEMORY[0x263F27B58];
    uint64_t v10 = AMSError();
    id v19 = [v20 promiseWithError:v10];
  }

  return v19;
}

- (id)runJSRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebJSDataProvider *)self webView];

  if (v5)
  {
    id v6 = [(AMSUIWebJSDataProvider *)self webView];
    [v6 sendJSRequest:v4];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F27E10];
    id v6 = AMSError();
    [v7 promiseWithError:v6];
  id v8 = };

  return v8;
}

- (id)runSafariCallback:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AMSUIWebJSDataProvider *)self context];
  id v6 = [v5 logKey];
  id v7 = AMSUIWebSetSubLogKey(v6, 0);

  id v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    id v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  objc_super v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    int v16 = 138543618;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running safari callback", (uint8_t *)&v16, 0x16u);
  }
  v12 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"SafariCallback" logKey:v7];
  [(AMSUIWebJSRequest *)v12 setOptions:v4];

  uint64_t v13 = [(AMSUIWebJSDataProvider *)self runJSRequest:v12];
  int v14 = [v13 thenWithBlock:&__block_literal_global_27];

  return v14;
}

id __44__AMSUIWebJSDataProvider_runSafariCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F27E10];
  uint64_t v3 = [a2 body];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA78];
  }
  id v6 = [v2 promiseWithResult:v5];

  return v6;
}

- (BOOL)startOTPListener
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(AMSUIWebJSDataProvider *)self stopOTPListener];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  [(AMSUIWebJSDataProvider *)self setOtpIdentifier:v4];

  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    objc_super v9 = [(AMSUIWebJSDataProvider *)self otpIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    int v16 = v8;
    __int16 v17 = 2114;
    __int16 v18 = v9;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting OTP listener with ID: %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v12, (id *)buf);
  uint64_t v10 = [(AMSUIWebJSDataProvider *)self otpIdentifier];
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __42__AMSUIWebJSDataProvider_startOTPListener__block_invoke(uint64_t a1, __CFString *a2, __CFString *a3, __CFString *a4, __CFString *a5)
{
  v17[4] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16[0] = @"token";
  v16[1] = @"source";
  uint64_t v10 = &stru_26CC491D8;
  if (a5) {
    uint64_t v11 = a5;
  }
  else {
    uint64_t v11 = &stru_26CC491D8;
  }
  if (a2) {
    id v12 = a2;
  }
  else {
    id v12 = &stru_26CC491D8;
  }
  v17[0] = v11;
  v17[1] = v12;
  if (a3) {
    uint64_t v13 = a3;
  }
  else {
    uint64_t v13 = &stru_26CC491D8;
  }
  v16[2] = @"serviceID";
  v16[3] = @"body";
  if (a4) {
    uint64_t v10 = a4;
  }
  v17[2] = v13;
  v17[3] = v10;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  id v15 = (id)[WeakRetained postEvent:@"OTPReceived" options:v14];
}

- (BOOL)stopOTPListener
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUIWebJSDataProvider *)self otpIdentifier];

  if (v3)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v4)
    {
      id v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = AMSLogKey();
      id v8 = [(AMSUIWebJSDataProvider *)self otpIdentifier];
      int v11 = 138543874;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      int v16 = v8;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stopping OTP listener with ID: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    objc_super v9 = [(AMSUIWebJSDataProvider *)self otpIdentifier];
    HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();

    [(AMSUIWebJSDataProvider *)self setOtpIdentifier:0];
  }
  return 1;
}

- (id)syncProperties
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AMSUIWebJSDataProvider *)self context];
  id v4 = [v3 logKey];
  uint64_t v5 = AMSUIWebSetSubLogKey(v4, 0);

  uint64_t v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2114;
    __int16 v23 = v5;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Syncing properties", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v8 = [(AMSUIWebJSDataProvider *)self properties];
  objc_super v9 = [v8 generateProperties];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  int v16 = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke;
  uint64_t v17 = &unk_2643E5308;
  objc_copyWeak(&v19, (id *)buf);
  id v10 = v5;
  id v18 = v10;
  int v11 = [v9 thenWithBlock:&v14];
  uint64_t v12 = objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __40__AMSUIWebJSDataProvider_syncProperties__block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([v3 length])
  {
    uint64_t v5 = [WeakRetained _syncPropertiesScriptWithProperties:v3];
    if ([v5 length])
    {
      uint64_t v6 = [WeakRetained webView];
      v23[0] = v5;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      [v6 updateUserScriptsWithScripts:v7];

      if ([WeakRetained _canInteractWithJS])
      {
        id v8 = objc_alloc_init(MEMORY[0x263F27E10]);
        objc_initWeak(&location, WeakRetained);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_2;
        v17[3] = &unk_2643E52E0;
        v17[4] = WeakRetained;
        id v18 = v5;
        objc_copyWeak(&v21, &location);
        id v19 = *(id *)(a1 + 32);
        id v9 = v8;
        id v20 = v9;
        dispatch_async(MEMORY[0x263EF83A0], v17);
        id v10 = v20;
        id v11 = v9;

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        id v11 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
      }
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x263F27E10];
      uint64_t v15 = AMSError();
      id v11 = [v14 promiseWithError:v15];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F27E10];
    __int16 v13 = AMSError();
    id v11 = [v12 promiseWithError:v13];
  }
  return v11;
}

void __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webView];
  id v3 = [v2 underlyingWebView];
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_3;
  v5[3] = &unk_2643E52B8;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 evaluateJavaScript:v4 completionHandler:v5];

  objc_destroyWeak(&v8);
}

void __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sync properties. %{public}@", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithError:v4];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithResult:MEMORY[0x263EFFA88]];
  }
}

- (void)_subscriptionStatusChangeMusic:(id)a3
{
}

- (void)_subscriptionStatusChangeActivity:(id)a3
{
}

- (void)_subscriptionStatusChangeAppStore:(id)a3
{
}

- (void)_subscriptionStatusChangeNews:(id)a3
{
}

- (void)_subscriptionStatusChangeTV:(id)a3
{
}

- (void)_subscriptionStatusChangeiCloud:(id)a3
{
}

- (void)_subscriptionStatusChangeHWBundle:(id)a3
{
}

- (void)appQueryManager:(id)a3 didReceiveApps:(id)a4
{
}

- (void)propertiesDidChange:(id)a3
{
  id v3 = [(AMSUIWebJSDataProvider *)self syncProperties];
}

- (BOOL)_canInteractWithJS
{
  id v2 = [(AMSUIWebJSDataProvider *)self webView];
  char v3 = [v2 contentLoaded];

  return v3;
}

- (void)_observeNotifications
{
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2050000000;
  char v3 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  uint64_t v66 = getASDSubscriptionEntitlementsClass_softClass;
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsClass_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)&v58);
    char v3 = (void *)v64[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v63, 8);
  uint64_t v5 = [v4 sharedInstance];
  objc_initWeak(&location, self);
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263F833C0];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke;
  v55[3] = &unk_2643E5330;
  objc_copyWeak(&v56, &location);
  id v8 = (id)[v6 addObserverForName:v7 object:0 queue:0 usingBlock:v55];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v10 = *MEMORY[0x263F83318];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_2;
  v53[3] = &unk_2643E5330;
  objc_copyWeak(&v54, &location);
  id v11 = (id)[v9 addObserverForName:v10 object:0 queue:0 usingBlock:v53];

  __int16 v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__safariDataUpdate_ name:@"SSScriptSafariViewControllerDataUpdateNotification" object:0];

  uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  __int16 v14 = (id *)getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    id v15 = (void *)AppStoreDaemonLibrary_0();
    uint64_t v16 = dlsym(v15, "ASDSubscriptionEntitlementsActivityDidChangeNotification");
    *(void *)(v62[1] + 24) = v16;
    getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    __int16 v14 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v14) {
    goto LABEL_29;
  }
  id v17 = *v14;
  [v13 addObserver:self selector:sel__subscriptionStatusChangeActivity_ name:v17 object:v5];

  id v18 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  id v19 = (id *)getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    id v20 = (void *)AppStoreDaemonLibrary_0();
    id v21 = dlsym(v20, "ASDSubscriptionEntitlementsAppStoreDidChangeNotification");
    *(void *)(v62[1] + 24) = v21;
    getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    id v19 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v19) {
    goto LABEL_29;
  }
  id v22 = *v19;
  [v18 addObserver:self selector:sel__subscriptionStatusChangeAppStore_ name:v22 object:v5];

  __int16 v23 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v24 = (id *)getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    __int16 v25 = (void *)AppStoreDaemonLibrary_0();
    uint64_t v26 = dlsym(v25, "ASDSubscriptionEntitlementsNewsDidChangeNotification");
    *(void *)(v62[1] + 24) = v26;
    getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    uint64_t v24 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v24) {
    goto LABEL_29;
  }
  id v27 = *v24;
  [v23 addObserver:self selector:sel__subscriptionStatusChangeNews_ name:v27 object:v5];

  __int16 v28 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  __int16 v29 = (id *)getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    id v30 = (void *)AppStoreDaemonLibrary_0();
    __int16 v31 = dlsym(v30, "ASDSubscriptionEntitlementsMusicDidChangeNotification");
    *(void *)(v62[1] + 24) = v31;
    getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    __int16 v29 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v29) {
    goto LABEL_29;
  }
  id v32 = *v29;
  [v28 addObserver:self selector:sel__subscriptionStatusChangeMusic_ name:v32 object:v5];

  uint64_t v33 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v34 = (id *)getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    v35 = (void *)AppStoreDaemonLibrary_0();
    v36 = dlsym(v35, "ASDSubscriptionEntitlementsTVDidChangeNotification");
    *(void *)(v62[1] + 24) = v36;
    getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    v34 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v34) {
    goto LABEL_29;
  }
  id v37 = *v34;
  [v33 addObserver:self selector:sel__subscriptionStatusChangeTV_ name:v37 object:v5];

  v38 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v39 = (id *)getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    v40 = (void *)AppStoreDaemonLibrary_0();
    v41 = dlsym(v40, "ASDSubscriptionEntitlementsiCloudDidChangeNotification");
    *(void *)(v62[1] + 24) = v41;
    getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    v39 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v39) {
    goto LABEL_29;
  }
  id v42 = *v39;
  [v38 addObserver:self selector:sel__subscriptionStatusChangeiCloud_ name:v42 object:v5];

  v43 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v44 = (id *)getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    v45 = (void *)AppStoreDaemonLibrary_0();
    v46 = dlsym(v45, "ASDSubscriptionEntitlementsHWBundleDidChangeNotification");
    *(void *)(v62[1] + 24) = v46;
    getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr = *(void *)(v62[1] + 24);
    v44 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v44) {
    goto LABEL_29;
  }
  id v47 = *v44;
  [v43 addObserver:self selector:sel__subscriptionStatusChangeHWBundle_ name:v47 object:v5];

  v48 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  v49 = (id *)getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr;
  uint64_t v66 = getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr;
  if (!getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v58 = MEMORY[0x263EF8330];
    uint64_t v59 = 3221225472;
    v60 = __getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_block_invoke;
    v61 = &unk_2643E33D8;
    v62 = &v63;
    __getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_block_invoke((uint64_t)&v58);
    v49 = (id *)v64[3];
  }
  _Block_object_dispose(&v63, 8);
  if (!v49)
  {
LABEL_29:
    dlerror();
    abort_report_np();
    __break(1u);
    goto LABEL_30;
  }
  id v50 = *v49;
  [v48 addObserver:self selector:sel__subscriptionStatusChangeMusic_ name:v50 object:v5];

  v51 = [MEMORY[0x263F08A00] defaultCenter];
  [v51 addObserver:self selector:sel__purchaseDidSucceed_ name:@"AMSPurchaseFinishedNotification" object:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_3;
  block[3] = &unk_2643E3118;
  block[4] = self;
  if (_observeNotifications_onceToken != -1) {
LABEL_30:
  }
    dispatch_once(&_observeNotifications_onceToken, block);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained postEvent:@"DidDisappear" options:&unk_26CC73A10];
}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained postEvent:@"DidAppear" options:&unk_26CC73A38];
}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_3(uint64_t a1)
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, 0, (CFNotificationCallback)_purchaseDidSucceed, @"kSSPurchaseRequestFinishedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  char v3 = CFNotificationCenterGetDistributedCenter();
  id v4 = *(const void **)(a1 + 32);
  CFNotificationCenterAddObserver(v3, v4, (CFNotificationCallback)_handleDataUpdateNotification, @"AMSUIWebSafariDataUpdateDarwin", 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"apps";
  v9[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v7 = [(AMSUIWebJSDataProvider *)self postEvent:@"MediaQueryResultsChange" options:v6];
}

- (void)_postSubscriptionChangedWithType:(int64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = @"mediaType";
  id v4 = [NSNumber numberWithInteger:a3];
  v8[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [(AMSUIWebJSDataProvider *)self postEvent:@"SubscriptionChanged" options:v5];
}

- (void)_postTelephonyDidChangeEvent
{
  id v2 = [(AMSUIWebJSDataProvider *)self postEvent:@"TelephonyChange" options:MEMORY[0x263EFFA78]];
}

- (void)_purchaseDidSucceed:(id)a3
{
  id v3 = [(AMSUIWebJSDataProvider *)self postEvent:@"BuyConfirmed" options:MEMORY[0x263EFFA78]];
}

- (void)_safariDataUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received ScriptDataUpdate notification", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v10 = +[AMSUIWebOpenSafariAction resultFromURL:v5 error:0];
    id v11 = [(AMSUIWebJSDataProvider *)self postEvent:@"SafariDataUpdate" options:v10];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v12 = [v10 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      __int16 v14 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      id v18 = v14;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari data update called without a URL", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)_syncPropertiesScriptWithProperties:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [NSString stringWithFormat:@"AMS.updateProperties('%@')", v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (AMSUIWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  return (AMSUIWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (AMSUIWebClientContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (AMSUIWebJSProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)otpIdentifier
{
  return self->_otpIdentifier;
}

- (void)setOtpIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otpIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_telephony, 0);
  objc_storeStrong((id *)&self->_appQueryManager, 0);
}

@end