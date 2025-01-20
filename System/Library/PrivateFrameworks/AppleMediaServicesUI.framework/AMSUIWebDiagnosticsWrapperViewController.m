@interface AMSUIWebDiagnosticsWrapperViewController
- (AMSUIWebClientContext)context;
- (AMSUIWebDiagnosticsPageModel)model;
- (AMSUIWebDiagnosticsWrapperViewController)initWithContext:(id)a3;
- (DADiagnosticsRemoteViewController)diagnosticsViewController;
- (void)remoteViewController:(id)a3 didFinishWithReason:(unint64_t)a4;
- (void)reportFinishWithReason:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDiagnosticsViewController:(id)a3;
- (void)setModel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)willPresentPageModel:(id)a3 appearance:(id)a4;
@end

@implementation AMSUIWebDiagnosticsWrapperViewController

- (AMSUIWebDiagnosticsWrapperViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebDiagnosticsWrapperViewController;
  v6 = [(AMSUICommonViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)reportFinishWithReason:(unint64_t)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = [(AMSUIWebDiagnosticsWrapperViewController *)self context];
  v6 = [v5 logKey];
  v7 = AMSUIWebSetSubLogKey(v6, 0);

  v8 = [[AMSUIWebJSRequest alloc] initWithServiceName:@"DeviceDiagnostics" logKey:v7];
  v14 = @"finishReason";
  objc_super v9 = [NSNumber numberWithUnsignedInteger:a3];
  v15[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [(AMSUIWebJSRequest *)v8 setOptions:v10];

  v11 = [(AMSUIWebDiagnosticsWrapperViewController *)self context];
  v12 = [v11 dataProvider];
  id v13 = (id)[v12 runJSRequest:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebDiagnosticsWrapperViewController;
  [(AMSUIWebDiagnosticsWrapperViewController *)&v8 viewWillAppear:a3];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getDADiagnosticsRemoteViewControllerClass_softClass;
  uint64_t v13 = getDADiagnosticsRemoteViewControllerClass_softClass;
  if (!getDADiagnosticsRemoteViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getDADiagnosticsRemoteViewControllerClass_block_invoke;
    v9[3] = &unk_2643E33D8;
    v9[4] = &v10;
    __getDADiagnosticsRemoteViewControllerClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__AMSUIWebDiagnosticsWrapperViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_2643E4C80;
  v7[4] = self;
  id v6 = (id)[v5 requestViewControllerWithConnectionHandler:v7];
}

void __59__AMSUIWebDiagnosticsWrapperViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = [MEMORY[0x263F27EF8] isRunningUnitTests];
    uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    objc_super v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        objc_super v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = AMSLogKey();
        uint64_t v13 = AMSHashIfNeeded();
        int v35 = 138543874;
        uint64_t v36 = v11;
        __int16 v37 = 2114;
        v38 = v12;
        __int16 v39 = 2114;
        v40 = v13;
        _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No Diagnostics view controller set (error: %{public}@)", (uint8_t *)&v35, 0x20u);
      }
      v14 = [MEMORY[0x263F08A00] defaultCenter];
      v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      [v14 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v15 userInfo:0];
    }
    else
    {
      if (!v8)
      {
        objc_super v9 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v31 = [v9 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = objc_opt_class();
        v33 = AMSLogKey();
        v34 = AMSHashIfNeeded();
        int v35 = 138543874;
        uint64_t v36 = v32;
        __int16 v37 = 2114;
        v38 = v33;
        __int16 v39 = 2114;
        v40 = v34;
        _os_log_impl(&dword_21C134000, v31, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] No Diagnostics view controller set (error: %{public}@)", (uint8_t *)&v35, 0x20u);
      }
    }
  }
  else
  {
    [v5 setDelegate:*(void *)(a1 + 32)];
    v16 = [*(id *)(a1 + 32) model];
    v17 = [v16 sessionToken];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v19 = [*(id *)(a1 + 32) model];
      v20 = [v19 sessionToken];
      [v5 sessionToken:v20];
    }
    v21 = [*(id *)(a1 + 32) model];
    v22 = [v21 requiredSerialNumbers];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      v24 = [*(id *)(a1 + 32) model];
      v25 = [v24 requiredSerialNumbers];
      [v5 requiredSerialNumbers:v25];
    }
    v26 = [*(id *)(a1 + 32) model];
    v27 = [v26 selectableSerialNumbers];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if (v28)
    {
      v29 = [*(id *)(a1 + 32) model];
      v30 = [v29 selectableSerialNumbers];
      [v5 selectableSerialNumbers:v30];
    }
    [*(id *)(a1 + 32) setDiagnosticsViewController:v5];
    objc_msgSend(*(id *)(a1 + 32), "ams_setChildViewController:", v5);
  }
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUIWebDiagnosticsWrapperViewController;
  [(AMSUIWebDiagnosticsWrapperViewController *)&v14 viewDidLayoutSubviews];
  v3 = [(AMSUICommonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(AMSUIWebDiagnosticsWrapperViewController *)self diagnosticsViewController];
  uint64_t v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    [(AMSUIWebDiagnosticsWrapperViewController *)self setModel:v6];
  }
  else
  {
    double v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v7)
    {
      double v7 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    double v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      double v10 = [(AMSUIWebDiagnosticsWrapperViewController *)self context];
      double v11 = [v10 logKey];
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid model: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)remoteViewController:(id)a3 didFinishWithReason:(unint64_t)a4
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AMSUIWebDiagnosticsPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (DADiagnosticsRemoteViewController)diagnosticsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticsViewController);
  return (DADiagnosticsRemoteViewController *)WeakRetained;
}

- (void)setDiagnosticsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_diagnosticsViewController);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end