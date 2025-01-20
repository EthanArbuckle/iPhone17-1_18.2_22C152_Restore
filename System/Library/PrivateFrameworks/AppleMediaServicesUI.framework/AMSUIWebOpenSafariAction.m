@interface AMSUIWebOpenSafariAction
+ (id)resultFromURL:(id)a3 error:(id)a4;
- (AMSUIWebOpenSafariAction)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebSafariViewController)safariViewController;
- (BOOL)_presentViewContoller:(id)a3;
- (NSDictionary)data;
- (NSString)callbackScheme;
- (NSURL)URL;
- (UIViewController)presentedViewController;
- (id)runAction;
- (void)_safariDataUpdate:(id)a3;
- (void)setCallbackScheme:(id)a3;
- (void)setData:(id)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setSafariViewController:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSUIWebOpenSafariAction

- (AMSUIWebOpenSafariAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebOpenSafariAction;
  v7 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"callbackScheme"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = @"amscallback";
    }
    objc_storeStrong((id *)&v7->_callbackScheme, v10);

    v11 = [v6 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    data = v7->_data;
    v7->_data = v12;

    v14 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (v15)
    {
      v16 = [NSURL URLWithString:v15];
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v7->_URL, v16);
    if (v15) {
  }
    }
  return v7;
}

+ (id)resultFromURL:(id)a3 error:(id)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "ams_parameters");
  v16[0] = @"callbackURL";
  uint64_t v8 = [v6 absoluteString];
  v9 = (void *)v8;
  v10 = &stru_26CC491D8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = (void *)MEMORY[0x263EFFA78];
  if (v7) {
    v11 = v7;
  }
  if (v5) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v6 == 0;
  }
  v17[0] = v10;
  v17[1] = v11;
  v16[1] = @"query";
  v16[2] = @"success";
  v13 = @"false";
  if (!v12) {
    v13 = @"true";
  }
  v17[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v14;
}

- (id)runAction
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)AMSUIWebOpenSafariAction;
  id v3 = [(AMSUIWebAction *)&v37 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    uint64_t v8 = [(AMSUIWebOpenSafariAction *)self URL];
    AMSLogableURL();
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v39 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running safari action with URL: %{public}@", buf, 0x20u);
  }
  v10 = [(AMSUIWebOpenSafariAction *)self URL];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    v27 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [v27 promiseWithError:v22];
  }
  else
  {
    BOOL v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__safariDataUpdate_ name:@"SSScriptSafariViewControllerDataUpdateNotification" object:0];

    id v13 = objc_alloc_init(MEMORY[0x263F27E10]);
    v14 = AMSLogKey();
    id v15 = [AMSUIWebSafariViewController alloc];
    v16 = [(AMSUIWebAction *)self context];
    v17 = [(AMSUIWebSafariViewController *)v15 initWithContext:v16];

    [(AMSUIWebSafariViewController *)v17 setShouldDismissOnCallback:1];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__8;
    v40 = __Block_byref_object_dispose__8;
    objc_super v18 = self;
    v41 = v18;
    v19 = [(AMSUIWebOpenSafariAction *)v18 URL];
    v20 = [(AMSUIWebOpenSafariAction *)v18 data];
    v21 = [(AMSUIWebOpenSafariAction *)v18 callbackScheme];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __37__AMSUIWebOpenSafariAction_runAction__block_invoke;
    v32 = &unk_2643E5590;
    id v22 = v14;
    id v33 = v22;
    v34 = v18;
    id v23 = v13;
    id v35 = v23;
    v36 = buf;
    [(AMSUIWebSafariViewController *)v17 loadActionURL:v19 data:v20 callbackScheme:v21 actionHandler:&v29];

    if (!-[AMSUIWebOpenSafariAction _presentViewContoller:](v18, "_presentViewContoller:", v17, v29, v30, v31, v32))
    {
      v24 = AMSError();
      [v23 finishWithError:v24];
    }
    v25 = v35;
    id v26 = v23;

    _Block_object_dispose(buf, 8);
  }

  return v26;
}

void __37__AMSUIWebOpenSafariAction_runAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)AMSSetLogKey();
  uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    BOOL v12 = (void *)v11;
    id v13 = &stru_26CC491D8;
    *(_DWORD *)v21 = 138543874;
    *(void *)&v21[4] = v10;
    if (v5) {
      id v13 = v5;
    }
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received safari callback. %{public}@", v21, 0x20u);
  }
  v14 = [(id)objc_opt_class() resultFromURL:v6 error:v5];

  id v15 = [*(id *)(a1 + 40) context];
  v16 = [v15 dataProvider];
  id v17 = (id)[v16 postEvent:@"SafariDataUpdate" options:v14];

  objc_super v18 = *(void **)(a1 + 48);
  if (v5) {
    [v18 finishWithError:v5];
  }
  else {
    [v18 finishWithResult:v14];
  }
  objc_msgSend(*(id *)(a1 + 40), "setSafariViewController:", 0, *(_OWORD *)v21);
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = 0;
}

- (BOOL)_presentViewContoller:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebAction *)self context];
  id v6 = [v5 flowController];
  id v7 = [v6 currentContainer];

  if (v7)
  {
    [v4 setShouldSetPresentationDelegate:1];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v4];
    [(AMSUIWebOpenSafariAction *)self setSafariViewController:v4];
    [(AMSUIWebOpenSafariAction *)self setPresentedViewController:v8];
    id v9 = objc_alloc_init(MEMORY[0x263F829A8]);
    [v9 configureWithDefaultBackground];
    uint64_t v10 = [v4 navigationItem];
    [v10 setStandardAppearance:v9];

    uint64_t v11 = [v4 navigationItem];
    [v11 setCompactAppearance:v9];

    BOOL v12 = [v4 navigationItem];
    [v12 setScrollEdgeAppearance:v9];

    [v7 presentViewController:v8 animated:1 completion:0];
  }

  return v7 != 0;
}

- (void)_safariDataUpdate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (!v5)
  {
    BOOL v12 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v12)
    {
      BOOL v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v12 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      objc_super v18 = AMSLogKey();
      int v23 = 138543618;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      id v26 = v18;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari data update called without a URL", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_22;
  }
  id v6 = [v5 scheme];
  uint64_t v7 = [(AMSUIWebOpenSafariAction *)self callbackScheme];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_26CC491D8;
  }
  char v10 = [v6 isEqualToString:v9];

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  BOOL v12 = (void *)v11;
  if ((v10 & 1) == 0)
  {
    if (!v11)
    {
      BOOL v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v12 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      v21 = [(AMSUIWebOpenSafariAction *)self callbackScheme];
      __int16 v22 = AMSLogableURL();
      int v23 = 138544130;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      id v26 = v20;
      __int16 v27 = 2114;
      v28 = v21;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ScriptDataUpdate scheme does not match callbackScheme (%{public}@): %{public}@", (uint8_t *)&v23, 0x2Au);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v11)
  {
    BOOL v12 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    id v15 = AMSLogKey();
    int v23 = 138543618;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    id v26 = v15;
    _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received ScriptDataUpdate notification", (uint8_t *)&v23, 0x16u);
  }
  BOOL v12 = [(AMSUIWebOpenSafariAction *)self safariViewController];
  [v12 receiveCallbackURL:v5];
LABEL_23:
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)callbackScheme
{
  return self->_callbackScheme;
}

- (void)setCallbackScheme:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentedViewController:(id)a3
{
}

- (AMSUIWebSafariViewController)safariViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safariViewController);
  return (AMSUIWebSafariViewController *)WeakRetained;
}

- (void)setSafariViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_safariViewController);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_callbackScheme, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end