@interface AMSUIEngagementTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSEngagementRequest)request;
- (AMSEngagementResult)result;
- (AMSProcessInfo)clientInfo;
- (AMSUIEngagementTask)initWithRequest:(id)a3 bag:(id)a4 presentingViewController:(id)a5;
- (AMSUIEngagementTaskDelegate)delegate;
- (AMSUIEngagementViewController)taskController;
- (BOOL)_isInitialEngagementViewController;
- (BOOL)_isRemotePresentationEnabled;
- (BOOL)_isRemoteViewService;
- (BOOL)_isWindowPresentation;
- (BOOL)allowMultiplePresentations;
- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (BOOL)isFinished;
- (BOOL)isRootRemotePresentation;
- (BOOL)isRunning;
- (BOOL)presented;
- (BOOL)remotePresentation;
- (CGSize)preferredContentSize;
- (NSError)error;
- (UIViewController)cachedNavigationController;
- (UIViewController)presentingViewController;
- (id)_infoWithBuyParams:(id)a3 additionalInfo:(id)a4;
- (id)_presentEngagementLocally;
- (id)_presentEngagementRemotely;
- (id)_presentTaskController;
- (id)_presentViewController:(id)a3 dismissBlock:(id)a4;
- (id)engagementViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5;
- (id)presentEngagement;
- (int64_t)_modalPresentationStyle;
- (int64_t)_userInterfaceStyle;
- (void)engagementViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)engagementViewControllerShouldDismiss:(id)a3;
- (void)setAllowMultiplePresentations:(BOOL)a3;
- (void)setBag:(id)a3;
- (void)setCachedNavigationController:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setIsRootRemotePresentation:(BOOL)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPresented:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRemotePresentation:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation AMSUIEngagementTask

- (AMSUIEngagementTask)initWithRequest:(id)a3 bag:(id)a4 presentingViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIEngagementTask;
  v12 = [(AMSTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bag, a4);
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong((id *)&v13->_presentingViewController, a5);
  }

  return v13;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (id)presentEngagement
{
  v3 = [(AMSUIEngagementTask *)self presentingViewController];

  if (v3)
  {
    if ([(AMSUIEngagementTask *)self _isRemotePresentationEnabled]) {
      [(AMSUIEngagementTask *)self _presentEngagementRemotely];
    }
    else {
    v6 = [(AMSUIEngagementTask *)self _presentEngagementLocally];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x263F27E10];
    v5 = AMSError();
    v6 = [v4 promiseWithError:v5];
  }
  return v6;
}

- (AMSUIEngagementViewController)taskController
{
  taskController = self->_taskController;
  if (!taskController)
  {
    v4 = [AMSUIEngagementViewController alloc];
    v5 = [(AMSUIEngagementTask *)self request];
    v6 = [(AMSUIEngagementTask *)self bag];
    v7 = [(AMSUIEngagementViewController *)v4 initWithRequest:v5 bag:v6 delegate:self];
    v8 = self->_taskController;
    self->_taskController = v7;

    id v9 = [(AMSUIEngagementTask *)self clientInfo];
    [(AMSUIEngagementViewController *)self->_taskController setClientInfo:v9];

    taskController = self->_taskController;
  }
  return taskController;
}

+ (AMSBagKeySet)bagKeySet
{
  return +[AMSUIWebViewController bagKeySet];
}

+ (NSString)bagSubProfile
{
  return +[AMSUIWebViewController bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSUIWebViewController bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSUIWebViewController createBagForSubProfile];
}

- (id)engagementViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = [(AMSUIEngagementTask *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  v14 = (void *)v13;
  if (v12)
  {
    if (!v13)
    {
      v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v16 = v24;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to request content view", (uint8_t *)&v23, 0xCu);
    }
    v17 = [(AMSUIEngagementTask *)self delegate];
    v18 = [(AMSUIEngagementTask *)self taskController];
    v19 = objc_msgSend(v17, "engagementTaskViewController:contentViewWithDictionary:frame:", v18, v10, x, y, width, height);
  }
  else
  {
    if (!v13)
    {
      v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v20 = [v14 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v21 = v24;
      _os_log_impl(&dword_21C134000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Delegate does not implement contentViewWithDictionary", (uint8_t *)&v23, 0xCu);
    }
    v17 = AMSError();
    v19 = 0;
  }

  return v19;
}

- (void)engagementViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v23 = a4;
  [(AMSUIEngagementTask *)self setError:a5];
  v7 = v23;
  if (v23)
  {
    v8 = [(AMSUIEngagementTask *)self result];

    if (v8)
    {
      id v9 = [v23 carrierLinkResult];
      id v10 = [(AMSUIEngagementTask *)self result];
      [v10 setCarrierLinkResult:v9];

      id v11 = [v23 purchaseResult];
      char v12 = [(AMSUIEngagementTask *)self result];
      [v12 setPurchaseResult:v11];

      uint64_t v13 = [(AMSUIEngagementTask *)self result];
      uint64_t v14 = [v13 userInfo];
      objc_super v15 = (void *)v14;
      uint64_t v16 = MEMORY[0x263EFFA78];
      if (v14) {
        v17 = (void *)v14;
      }
      else {
        v17 = (void *)MEMORY[0x263EFFA78];
      }
      uint64_t v18 = [v23 userInfo];
      v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = v16;
      }
      id v21 = objc_msgSend(v17, "ams_dictionaryByAddingEntriesFromDictionary:", v20);
      v22 = [(AMSUIEngagementTask *)self result];
      [v22 setUserInfo:v21];
    }
    else
    {
      [(AMSUIEngagementTask *)self setResult:v23];
    }
    v7 = v23;
  }
}

- (void)engagementViewControllerShouldDismiss:(id)a3
{
  id v3 = [(AMSUIEngagementTask *)self taskController];
  objc_msgSend(v3, "ams_dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(AMSUIEngagementTask *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  char v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      char v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      uint64_t v16 = [v7 identifier];
      *(_DWORD *)buf = 138543618;
      v36 = v14;
      __int16 v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to handle delegate action (identifier: %{public}@)", buf, 0x16u);
    }
    v17 = [(AMSUIEngagementTask *)self delegate];
    uint64_t v18 = [(AMSUIEngagementTask *)self taskController];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __94__AMSUIEngagementTask_engagementViewController_handleDynamicDelegateAction_completionHandler___block_invoke;
    v32[3] = &unk_2643E34F8;
    v32[4] = self;
    id v33 = v7;
    id v34 = v8;
    char v19 = [v17 engagementTaskViewController:v18 handleDynamicDelegateAction:v33 completionHandler:v32];

    if (v19)
    {
      BOOL v20 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    if (!v11)
    {
      char v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v21 = [v12 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_opt_class();
      id v23 = v22;
      id v24 = [v7 identifier];
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      __int16 v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Delegate does not implement handleDynamicDelegateAction (identifier: %{public}@)", buf, 0x16u);
    }
    uint64_t v25 = AMSError();
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v25);
  }
  v26 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v26)
  {
    v26 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_opt_class();
    id v29 = v28;
    v30 = [v7 identifier];
    *(_DWORD *)buf = 138543618;
    v36 = v28;
    __int16 v37 = 2114;
    v38 = v30;
    _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate action not handled (identifier: %{public}@)", buf, 0x16u);
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x263EFFA80], 0);
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

void __94__AMSUIEngagementTask_engagementViewController_handleDynamicDelegateAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v13)
      {
        uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v23 = objc_opt_class();
      id v24 = *(void **)(a1 + 40);
      id v17 = v23;
      uint64_t v18 = [v24 identifier];
      int v25 = 138543618;
      v26 = v23;
      __int16 v27 = 2114;
      id v28 = v18;
      char v19 = "%{public}@: Delegate responded with neither an error or response (identifier: %{public}@)";
      BOOL v20 = v14;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 22;
      goto LABEL_13;
    }
LABEL_9:
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v13)
    {
      uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v15 = objc_opt_class();
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = v15;
    uint64_t v18 = [v16 identifier];
    int v25 = 138543874;
    v26 = v15;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v5;
    char v19 = "%{public}@: Delegate responded with a response (identifier: %{public}@, response: %{public}@)";
    BOOL v20 = v14;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    uint32_t v22 = 32;
LABEL_13:
    _os_log_impl(&dword_21C134000, v20, v21, v19, (uint8_t *)&v25, v22);

LABEL_14:
    goto LABEL_15;
  }
  id v7 = [MEMORY[0x263F27CB8] sharedConfig];
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
    char v12 = [v10 identifier];
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

- (id)_infoWithBuyParams:(id)a3 additionalInfo:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[a4 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v9 = v8;

  [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x263F27848]];
  return v9;
}

- (BOOL)_isInitialEngagementViewController
{
  id v3 = [(AMSUIEngagementTask *)self clientInfo];
  v4 = [v3 bundleIdentifier];
  int v5 = [v4 containsString:@"iCloudQuota"];

  if (v5)
  {
    uint64_t v6 = [(AMSUIEngagementTask *)self presentingViewController];
    if (v6)
    {
      id v7 = (void *)v6;
      do
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          break;
        }
        uint64_t v9 = [v7 parentViewController];

        id v7 = (void *)v9;
      }
      while (v9);
      char v10 = isKindOfClass ^ 1;
    }
    else
    {
      char v10 = 1;
    }
    return v10 & 1;
  }
  else
  {
    return [(AMSUIEngagementTask *)self isRootRemotePresentation];
  }
}

- (BOOL)_isRemotePresentationEnabled
{
  BOOL v3 = [(AMSUIEngagementTask *)self remotePresentation];
  if (v3) {
    LOBYTE(v3) = ![(AMSUIEngagementTask *)self _isRemoteViewService];
  }
  return v3;
}

- (BOOL)_isRemoteViewService
{
  v2 = [MEMORY[0x263F27E08] currentProcess];
  BOOL v3 = [v2 bundleIdentifier];
  char v4 = [&unk_26CC73B90 containsObject:v3];

  return v4;
}

- (BOOL)_isWindowPresentation
{
  v2 = [MEMORY[0x263F27E08] currentProcess];
  BOOL v3 = [v2 bundleIdentifier];
  char v4 = [&unk_26CC73BA8 containsObject:v3];

  return v4;
}

- (id)_presentEngagementLocally
{
  id v3 = objc_alloc_init(MEMORY[0x263F27E10]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke;
  v8[3] = &unk_2643E34D0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  int v5 = v9;
  id v6 = v4;

  return v6;
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) allowMultiplePresentations] & 1) == 0
    && (([*(id *)(a1 + 32) isRunning] & 1) != 0
     || [*(id *)(a1 + 32) isFinished]))
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v2)
    {
      v2 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      int v5 = AMSLogKey();
      int v6 = [*(id *)(a1 + 32) isRunning];
      int v7 = [*(id *)(a1 + 32) isFinished];
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v4;
      __int16 v23 = 2114;
      id v24 = v5;
      __int16 v25 = 1024;
      int v26 = v6;
      __int16 v27 = 1024;
      int v28 = v7;
      _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task not available. Running: %d, Finished: %d", buf, 0x22u);
    }
    id v8 = *(void **)(a1 + 40);
    id v9 = AMSError();
    [v8 finishWithError:v9];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
    char v10 = [*(id *)(a1 + 32) request];
    int v11 = [v10 silentlyCheckURL];

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) taskController];
      uint64_t v13 = [v12 requestIsSupported];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_93;
      v19[3] = &unk_2643E39B8;
      uint64_t v14 = *(void **)(a1 + 40);
      v19[4] = *(void *)(a1 + 32);
      id v20 = v14;
      [v13 addFinishBlock:v19];
    }
    else
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = [*(id *)(a1 + 32) _presentTaskController];
      [v15 finishWithPromise:v16];
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_96;
    v18[3] = &unk_2643E39E0;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    [v17 addFinishBlock:v18];
  }
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v5)
    {
      int v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    int v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      id v9 = [*(id *)(a1 + 32) request];
      char v10 = [v9 URL];
      int v11 = AMSLogableURL();
      int v25 = 138543874;
      uint64_t v26 = v7;
      __int16 v27 = 2114;
      int v28 = v8;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silently failing with URL: %{public}@", (uint8_t *)&v25, 0x20u);
    }
    char v12 = [v4 userInfo];
    uint64_t v13 = (void *)[v12 mutableCopy];
    uint64_t v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v18 = v15;

    char v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x263F27858]];

    id v20 = [v4 domain];
    [v4 code];
    os_log_type_t v21 = objc_msgSend(v4, "ams_title");
    uint64_t v22 = objc_msgSend(v4, "ams_message");
    __int16 v23 = objc_msgSend(v4, "ams_underlyingError");
    id v24 = AMSCustomError();

    [*(id *)(a1 + 40) finishWithError:v24];
  }
  else
  {
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = [*(id *)(a1 + 32) _presentTaskController];
    [v16 finishWithPromise:v17];
  }
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_96(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_2;
  block[3] = &unk_2643E3118;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__AMSUIEngagementTask__presentEngagementLocally__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  v2 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    int v5 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    char v10 = v5;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing AMSUIEngagementTaskViewController", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) taskController];
  objc_msgSend(v6, "ams_dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_presentEngagementRemotely
{
  id v3 = [AMSUIEngagementRemoteViewTask alloc];
  uint64_t v4 = [(AMSUIEngagementTask *)self request];
  int v5 = [(AMSUIEngagementTask *)self presentingViewController];
  int v6 = [(AMSUIEngagementRemoteViewTask *)v3 initWithRequest:v4 presentingViewController:v5];

  int v7 = [(AMSUIEngagementTask *)self bag];
  [(AMSUIEngagementRemoteViewTask *)v6 setBag:v7];

  uint64_t v8 = [(AMSUIEngagementTask *)self clientInfo];
  if (v8)
  {
    [(AMSUIEngagementRemoteViewTask *)v6 setClientInfo:v8];
  }
  else
  {
    __int16 v9 = [MEMORY[0x263F27E08] currentProcess];
    [(AMSUIEngagementRemoteViewTask *)v6 setClientInfo:v9];
  }
  char v10 = [(AMSUIEngagementRemoteViewTask *)v6 presentEngagement];

  return v10;
}

- (id)_presentTaskController
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F27E10]);
  [(AMSUIEngagementTask *)self setPresented:1];
  uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  int v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    char v19 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting AMSUIEngagementTaskViewController", buf, 0x16u);
  }
  uint64_t v8 = [(AMSUIEngagementTask *)self taskController];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__AMSUIEngagementTask__presentTaskController__block_invoke;
  v14[3] = &unk_2643E34D0;
  v14[4] = self;
  id v15 = v3;
  id v9 = v3;
  id v10 = [(AMSUIEngagementTask *)self _presentViewController:v8 dismissBlock:v14];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__AMSUIEngagementTask__presentTaskController__block_invoke_103;
  v13[3] = &unk_2643E3A08;
  v13[4] = self;
  uint64_t v11 = [v9 catchWithBlock:v13];

  return v11;
}

void __45__AMSUIEngagementTask__presentTaskController__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    int v5 = AMSLogKey();
    int v16 = 138543618;
    uint64_t v17 = v4;
    __int16 v18 = 2114;
    char v19 = v5;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismiss block called", (uint8_t *)&v16, 0x16u);
  }
  if (([*(id *)(a1 + 40) isFinished] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 32) error];

    if (v6)
    {
      int v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) error];
      id v9 = v7;
LABEL_8:
      [v9 finishWithError:v8];
LABEL_15:

      return;
    }
    id v10 = [*(id *)(a1 + 32) result];

    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) result];
      char v12 = v11;
    }
    else
    {
      uint64_t v13 = [*(id *)(a1 + 32) request];
      int v14 = [v13 failOnDismiss];

      if (v14)
      {
        id v15 = *(void **)(a1 + 40);
        AMSError();
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = v15;
        goto LABEL_8;
      }
      id v8 = objc_alloc_init(MEMORY[0x263F27C60]);
      char v12 = *(void **)(a1 + 40);
    }
    [v12 finishWithResult:v8];
    goto LABEL_15;
  }
}

id __45__AMSUIEngagementTask__presentTaskController__block_invoke_103(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  int v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v8 = v7;

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "presented"));
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F27858]];

  id v10 = [v3 domain];
  [v3 code];
  uint64_t v11 = objc_msgSend(v3, "ams_title");
  char v12 = objc_msgSend(v3, "ams_message");
  uint64_t v13 = objc_msgSend(v3, "ams_underlyingError");

  int v14 = AMSCustomError();

  id v15 = [MEMORY[0x263F27E10] promiseWithError:v14];

  return v15;
}

- (id)_presentViewController:(id)a3 dismissBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F27E10]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke;
  aBlock[3] = &unk_2643E33B0;
  id v9 = v8;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_2;
  v18[3] = &unk_2643E3A50;
  v18[4] = self;
  id v19 = v6;
  id v20 = v10;
  os_log_type_t v21 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v18);
  id v15 = v21;
  id v16 = v9;

  return v16;
}

uint64_t __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc_init(MEMORY[0x263F27C60]);
  [v2 finishWithResult:v3];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

void __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 32) presentingViewController];
  uint64_t v4 = objc_msgSend(v3, "ams_frontmostController");

  if (!v4)
  {
    int v5 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v5)
    {
      int v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = AMSLogKey();
      id v8 = NSString;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = v9;
      if (v7)
      {
        uint64_t v1 = AMSLogKey();
        [v8 stringWithFormat:@"%@: [%@] ", v10, v1];
      }
      else
      {
        [v8 stringWithFormat:@"%@: ", v9];
      uint64_t v11 = };
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Presenting view controller is nil!", buf, 0xCu);
      if (v7)
      {

        uint64_t v11 = (void *)v1;
      }
    }
  }
  id v12 = [*(id *)(a1 + 32) request];
  int v13 = [v12 isPresentationRequest];

  if (v13)
  {
    id v14 = [[AMSUIEngagementWrapperViewController alloc] initWithViewController:*(void *)(a1 + 40)];
    [(AMSUIEngagementWrapperViewController *)v14 setDismissBlock:*(void *)(a1 + 48)];
    -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", [*(id *)(a1 + 32) _modalPresentationStyle]);
    id v15 = [(AMSUIEngagementWrapperViewController *)v14 presentationController];
    [v15 setDelegate:v14];

    id v16 = [*(id *)(a1 + 32) request];
    -[AMSUIEngagementWrapperViewController setModalInPresentation:](v14, "setModalInPresentation:", [v16 suppressInteractiveModalDismissal]);

    [v4 presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    uint64_t v17 = [*(id *)(a1 + 32) request];
    uint64_t v18 = [v17 presentationStyle];

    if (v18 == 4)
    {
      id v14 = [[AMSUIEngagementCardWrapperViewController alloc] initWithViewController:*(void *)(a1 + 40)];
      id v19 = [MEMORY[0x263F62390] defaultConfiguration];
      [(AMSUIEngagementWrapperViewController *)v19 setSupportsDarkMode:1];
      id v20 = (id)[v4 presentProxCardFlowWithDelegate:*(void *)(a1 + 32) initialViewController:v14 configuration:v19];
      os_log_type_t v21 = [*(id *)(a1 + 32) request];
      -[AMSUIEngagementWrapperViewController setPresentationStyle:](v14, "setPresentationStyle:", [v21 presentationStyle]);
    }
    else
    {
      id v14 = [*(id *)(a1 + 32) cachedNavigationController];
      if (!v14)
      {
        id v14 = (AMSUIEngagementWrapperViewController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:*(void *)(a1 + 40)];
        -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", [*(id *)(a1 + 32) _modalPresentationStyle]);
        uint64_t v22 = [*(id *)(a1 + 32) _userInterfaceStyle];
        if (v22) {
          [(AMSUIEngagementWrapperViewController *)v14 setOverrideUserInterfaceStyle:v22];
        }
        [*(id *)(a1 + 32) setCachedNavigationController:v14];
      }
      id v19 = [[AMSUIEngagementWrapperViewController alloc] initWithViewController:v14];
      -[AMSUIEngagementWrapperViewController setModalPresentationStyle:](v19, "setModalPresentationStyle:", [*(id *)(a1 + 32) _modalPresentationStyle]);
      id v23 = [*(id *)(a1 + 32) request];
      -[AMSUIEngagementWrapperViewController setModalInPresentation:](v19, "setModalInPresentation:", [v23 suppressInteractiveModalDismissal]);

      id v24 = [*(id *)(a1 + 32) request];
      uint64_t v25 = [v24 presentationStyle];

      if (v25 == 5)
      {
        uint64_t v26 = [(AMSUIEngagementWrapperViewController *)v19 sheetPresentationController];
        __int16 v27 = [MEMORY[0x263F82BD0] _detentWithIdentifier:@"Custom" resolutionContextBlock:&__block_literal_global_6];
        id v30 = v27;
        int v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        [v26 setDetents:v28];

        [v26 setPrefersEdgeAttachedInCompactHeight:1];
        [v26 setPrefersScrollingExpandsWhenScrolledToEdge:0];
        [v26 setPreferredCornerRadius:12.0];
      }
      [(AMSUIEngagementWrapperViewController *)v19 setDismissBlock:*(void *)(a1 + 56)];
      __int16 v29 = [(AMSUIEngagementWrapperViewController *)v14 presentationController];
      [v29 setDelegate:v19];

      [v4 presentViewController:v19 animated:1 completion:0];
    }
  }
}

double __59__AMSUIEngagementTask__presentViewController_dismissBlock___block_invoke_119(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _containerBounds];
  double v4 = v3;
  int v5 = [MEMORY[0x263F82DA0] currentTraitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  [v2 _fullHeightPresentedViewFrame];
  double v9 = v8;
  int v10 = [v2 _isEdgeAttached];
  double v11 = 0.0;
  if (v10) {
    [v2 _containerSafeAreaInsets];
  }
  double v12 = 1.1;
  if (!IsAccessibilityCategory) {
    double v12 = 1.0;
  }
  double v13 = dbl_21C2CE250[v4 > 568.0];
  double v14 = v12 * (v9 - v11);
  if ([v2 _isEdgeAttached]) {
    double v15 = v13;
  }
  else {
    double v15 = 1.0;
  }
  double v16 = v14 * v15;

  return v16;
}

- (int64_t)_modalPresentationStyle
{
  id v2 = [(AMSUIEngagementTask *)self request];
  uint64_t v3 = [v2 presentationStyle];

  if (v3 == 3) {
    return 1;
  }
  else {
    return 2 * (v3 != 2);
  }
}

- (int64_t)_userInterfaceStyle
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [(AMSUIEngagementTask *)self request];
  uint64_t v3 = [v2 URL];
  double v4 = [v3 fragment];

  if (v4)
  {
    [v4 componentsSeparatedByString:@"&"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", @"userInterfaceStyle=", (void)v14))
          {
            double v12 = [v10 substringFromIndex:objc_msgSend(@"userInterfaceStyle=", "length")];
            if ([v12 isEqualToString:@"light"])
            {
              int64_t v11 = 1;
            }
            else if ([v12 isEqualToString:@"dark"])
            {
              int64_t v11 = 2;
            }
            else
            {
              int64_t v11 = 0;
            }

            goto LABEL_18;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int64_t v11 = 0;
LABEL_18:
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (BOOL)allowMultiplePresentations
{
  return self->_allowMultiplePresentations;
}

- (void)setAllowMultiplePresentations:(BOOL)a3
{
  self->_allowMultiplePresentations = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (AMSUIEngagementTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIEngagementTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRootRemotePresentation
{
  return self->_isRootRemotePresentation;
}

- (void)setIsRootRemotePresentation:(BOOL)a3
{
  self->_isRootRemotePresentation = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (BOOL)remotePresentation
{
  return self->_remotePresentation;
}

- (void)setRemotePresentation:(BOOL)a3
{
  self->_remotePresentation = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (UIViewController)cachedNavigationController
{
  return self->_cachedNavigationController;
}

- (void)setCachedNavigationController:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cachedNavigationController, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_taskController, 0);
}

@end