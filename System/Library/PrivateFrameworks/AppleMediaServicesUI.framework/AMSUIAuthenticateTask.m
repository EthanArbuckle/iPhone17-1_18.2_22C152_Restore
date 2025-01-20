@interface AMSUIAuthenticateTask
- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5;
- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5;
- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5;
- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5;
- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4;
- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4 bag:(id)a5;
- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4;
- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4 bag:(id)a5;
- (UIViewController)presentingViewController;
- (UIWindow)presentingWindow;
- (id)_createAuthKitUpdateTaskForAccount:(id)a3;
- (id)_getPresentingViewController;
- (id)_presentEngagementRequest:(id)a3;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIAuthenticateTask

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  v8 = (void *)MEMORY[0x263F27B28];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "amsui_internalBag");
  v13 = [(AMSUIAuthenticateTask *)self initWithAccount:v11 presentingViewController:v10 options:v9 bag:v12];

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  v8 = (void *)MEMORY[0x263F27B28];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "amsui_internalBag");
  v13 = [(AMSUIAuthenticateTask *)self initWithAccount:v11 presentingWindow:v10 options:v9 bag:v12];

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = [(AMSAuthenticateTask *)&v16 initWithAccount:a3 options:a5 bag:a6];
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    [(AMSAuthenticateTask *)&v15 setDelegate:v12];
    objc_storeStrong((id *)&v13->_presentingViewController, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAccount:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = [(AMSAuthenticateTask *)&v16 initWithAccount:a3 options:a5 bag:a6];
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    [(AMSAuthenticateTask *)&v15 setDelegate:v12];
    objc_storeStrong((id *)&v13->_presentingWindow, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5
{
  v8 = (void *)MEMORY[0x263F27B28];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "amsui_internalBag");
  v13 = [(AMSUIAuthenticateTask *)self initWithAuthenticationResults:v11 presentingViewController:v10 options:v9 bag:v12];

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5
{
  v8 = (void *)MEMORY[0x263F27B28];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "amsui_internalBag");
  v13 = [(AMSUIAuthenticateTask *)self initWithAuthenticationResults:v11 presentingWindow:v10 options:v9 bag:v12];

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingViewController:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = [(AMSAuthenticateTask *)&v16 initWithAuthenticationResults:a3 options:a5 bag:a6];
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    [(AMSAuthenticateTask *)&v15 setDelegate:v12];
    objc_storeStrong((id *)&v13->_presentingViewController, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithAuthenticationResults:(id)a3 presentingWindow:(id)a4 options:(id)a5 bag:(id)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIAuthenticateTask;
  v12 = [(AMSAuthenticateTask *)&v16 initWithAuthenticationResults:a3 options:a5 bag:a6];
  v13 = v12;
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)AMSUIAuthenticateTask;
    [(AMSAuthenticateTask *)&v15 setDelegate:v12];
    objc_storeStrong((id *)&v13->_presentingWindow, a4);
  }

  return v13;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  v6 = (void *)MEMORY[0x263F27B28];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "amsui_internalBag");
  id v10 = [(AMSUIAuthenticateTask *)self initWithRequest:v8 presentingViewController:v7 bag:v9];

  return v10;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4
{
  v6 = (void *)MEMORY[0x263F27B28];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "amsui_internalBag");
  id v10 = [(AMSUIAuthenticateTask *)self initWithRequest:v8 presentingWindow:v7 bag:v9];

  return v10;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingViewController:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 logKey];

  if (v11)
  {
    v12 = [v8 logKey];
    id v13 = (id)AMSSetLogKey();
  }
  v14 = [v8 account];
  objc_super v15 = [v8 options];
  objc_super v16 = [(AMSUIAuthenticateTask *)self initWithAccount:v14 presentingViewController:v10 options:v15 bag:v9];

  return v16;
}

- (AMSUIAuthenticateTask)initWithRequest:(id)a3 presentingWindow:(id)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 logKey];

  if (v11)
  {
    v12 = [v8 logKey];
    id v13 = (id)AMSSetLogKey();
  }
  v14 = [v8 account];
  objc_super v15 = [v8 options];
  objc_super v16 = [(AMSUIAuthenticateTask *)self initWithAccount:v14 presentingWindow:v10 options:v15 bag:v9];

  return v16;
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F27CB8];
  id v9 = a5;
  id v10 = [v8 sharedAccountsConfig];
  if (!v10)
  {
    id v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = AMSLogKey();
    v14 = AMSHashIfNeeded();
    int v19 = 138543874;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    v22 = v13;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog request in UI Task. dialogRequest = %{public}@", (uint8_t *)&v19, 0x20u);
  }
  objc_super v15 = [AMSUIAlertDialogTask alloc];
  objc_super v16 = [(AMSUIAuthenticateTask *)self _getPresentingViewController];
  v17 = [(AMSUIAlertDialogTask *)v15 initWithRequest:v7 presentingViewController:v16];

  v18 = [(AMSUIAlertDialogTask *)v17 present];
  [v18 addFinishBlock:v9];
}

- (id)_createAuthKitUpdateTaskForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27D90]);
  v6 = [(AMSUIAuthenticateTask *)self presentingWindow];

  if (v6)
  {
    id v7 = [AMSUIAuthKitUpdateTask alloc];
    id v8 = [(AMSUIAuthenticateTask *)self presentingWindow];
    id v9 = [(AMSAuthenticateTask *)self options];
    id v10 = [(AMSUIAuthKitUpdateTask *)v7 initWithAccount:v4 presentingWindow:v8 options:v9];

    [v5 finishWithResult:v10];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__AMSUIAuthenticateTask__createAuthKitUpdateTaskForAccount___block_invoke;
    v15[3] = &unk_2643E3360;
    v15[4] = self;
    id v16 = v4;
    id v17 = v5;
    id v11 = v15;
    uint64_t v12 = AMSLogKey();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_0;
    block[3] = &unk_2643E33B0;
    id v19 = v12;
    id v20 = v11;
    id v13 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v5;
}

void __60__AMSUIAuthenticateTask__createAuthKitUpdateTaskForAccount___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v2 = [*(id *)(a1 + 32) presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (!v3
    || ([*(id *)(a1 + 32) presentingViewController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 topViewController],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        !v9))
  {
    id v9 = [*(id *)(a1 + 32) presentingViewController];
  }
  id v5 = [AMSUIAuthKitUpdateTask alloc];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) options];
  id v8 = [(AMSUIAuthKitUpdateTask *)v5 initWithAccount:v6 presentingViewController:v9 options:v7];

  [*(id *)(a1 + 48) finishWithResult:v8];
}

- (id)_presentEngagementRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [AMSUIEngagementTask alloc];
  id v7 = [(AMSAuthenticateTask *)self bag];
  id v8 = [(AMSUIAuthenticateTask *)self _getPresentingViewController];
  id v9 = [(AMSUIEngagementTask *)v6 initWithRequest:v4 bag:v7 presentingViewController:v8];

  id v10 = [(AMSUIEngagementTask *)v9 presentEngagement];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__AMSUIAuthenticateTask__presentEngagementRequest___block_invoke;
  v13[3] = &unk_2643E3468;
  id v11 = v5;
  id v14 = v11;
  [v10 addFinishBlock:v13];

  return v11;
}

uint64_t __51__AMSUIAuthenticateTask__presentEngagementRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithSuccess];
  }
}

- (id)_getPresentingViewController
{
  id v3 = [(AMSUIAuthenticateTask *)self presentingWindow];

  if (v3)
  {
    id v4 = [(AMSUIAuthenticateTask *)self presentingWindow];
    id v5 = [v4 rootViewController];
  }
  else
  {
    id v5 = [(AMSUIAuthenticateTask *)self presentingViewController];
  }
  return v5;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIWindow)presentingWindow
{
  return self->_presentingWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end