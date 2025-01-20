@interface AMSUserNotificationAuthorizationTask
+ (id)_findEngagementRequestInResponse:(id)a3;
+ (id)engagementRequestForFullSheet;
+ (id)recordEngagementEventWithBundleIdentifier:(id)a3 options:(id)a4;
- (AMSUserNotificationAuthorizationDelegate)delegate;
- (AMSUserNotificationAuthorizationOptions)options;
- (AMSUserNotificationAuthorizationTask)initWithBundleIdentifier:(id)a3 options:(id)a4;
- (NSString)bundleIdentifier;
- (UNUserNotificationCenter)notificationCenter;
- (id)_presentDialogForUserInitiatedWithCompletion;
- (id)_startEngagementAuthorizationWithResult:(id)a3;
- (id)requestAuthorization;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation AMSUserNotificationAuthorizationTask

- (AMSUserNotificationAuthorizationTask)initWithBundleIdentifier:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSUserNotificationAuthorizationTask;
  v9 = [(AMSTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v7];
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = (UNUserNotificationCenter *)v11;
  }
  return v10;
}

+ (id)engagementRequestForFullSheet
{
  v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = objc_alloc(MEMORY[0x1E4F44680]);
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  id v7 = (void *)[v4 initWithBundleIdentifier:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke;
  v12[3] = &unk_1E55A8530;
  id v8 = v3;
  v13 = v8;
  id v14 = a1;
  [v7 getNotificationSettingsWithCompletionHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_33;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v11[4] = a1;
  [(AMSPromise *)v8 addErrorBlock:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_34;
  v10[3] = &__block_descriptor_40_e48_v16__0__AMSUserNotificationAuthorizationResult_8l;
  v10[4] = a1;
  [(AMSPromise *)v8 addSuccessBlock:v10];

  return v8;
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 authorizationStatus] == 1 || objc_msgSend(v3, "authorizationStatus") == 2)
  {
    AMSError(11, @"User has already accepted or denied notification authorization.", 0, 0);
    id v4 = (AMSUserNotificationAuthorizationOptions *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) finishWithError:v4];
  }
  else
  {
    id v4 = objc_alloc_init(AMSUserNotificationAuthorizationOptions);
    v5 = *(void **)(a1 + 40);
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 bundleIdentifier];
    id v8 = [v5 recordEngagementEventWithBundleIdentifier:v7 options:v4];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_2;
    v13[3] = &unk_1E559F028;
    id v14 = *(id *)(a1 + 32);
    [v8 addErrorBlock:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_3;
    v11[3] = &unk_1E55A8508;
    long long v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    long long v12 = v10;
    [v8 addSuccessBlock:v11];
  }
}

uint64_t __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    id v8 = AMSLogKey();
    int v16 = 138543618;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", (uint8_t *)&v16, 0x16u);
  }
  id v9 = [*(id *)(a1 + 40) _findEngagementRequestInResponse:v3];

  if (v9)
  {
    long long v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      long long v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = objc_opt_class();
      id v13 = v12;
      id v14 = AMSLogKey();
      int v16 = 138543618;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained engagement request", (uint8_t *)&v16, 0x16u);
    }
    [v9 setSilentlyCheckURL:1];
    v15 = objc_alloc_init(AMSUserNotificationAuthorizationResult);
    [(AMSUserNotificationAuthorizationResult *)v15 setRequest:v9];
    [*(id *)(a1 + 32) finishWithResult:v15];
  }
  else
  {
    AMSError(12, @"No engagement request returned.", 0, 0);
    v15 = (AMSUserNotificationAuthorizationResult *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) finishWithError:v15];
  }
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = AMSLogKey();
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Explicit notification authorization for full sheet failed: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __69__AMSUserNotificationAuthorizationTask_engagementRequestForFullSheet__block_invoke_34(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = AMSLogKey();
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Explicit notification authorization for full sheet completed successfully.", (uint8_t *)&v6, 0x16u);
  }
}

+ (id)_findEngagementRequestInResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "messageActions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) engagementRequest];
        if (v8)
        {
          uint64_t v9 = v8;
          [v8 setSilentlyCheckURL:1];
          [v9 setFailOnDismiss:1];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

+ (id)recordEngagementEventWithBundleIdentifier:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  __int16 v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event.", buf, 0x16u);
  }
  long long v11 = objc_alloc_init(AMSEngagement);
  v25[0] = v5;
  v24[0] = @"bundleIdentifier";
  v24[1] = @"userInitiated";
  long long v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v6, "userInitiated"));
  v25[1] = v12;
  v24[2] = @"authorizationOptions";
  long long v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "authorizationOptions"));
  v25[2] = v13;
  v24[3] = @"metricsOverlay";
  long long v14 = [v6 metricsOverlay];

  v15 = (void *)MEMORY[0x1E4F1CC08];
  if (v14) {
    v15 = v14;
  }
  v25[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

  v17 = [[AMSEngagementPlacementInfo alloc] initWithPlacement:@"notificationAuthorization" context:v16];
  __int16 v18 = [AMSEngagementMessageEvent alloc];
  v23 = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v20 = [(AMSEngagementMessageEvent *)v18 initWithServiceType:@"com.apple.notificationAuthorization" placementInfo:v19];

  v21 = [(AMSEngagement *)v11 enqueueMessageEvent:v20];

  return v21;
}

- (id)requestAuthorization
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    uint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    __int16 v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting notification authorization task", buf, 0x16u);
  }
  __int16 v8 = objc_alloc_init(AMSUserNotificationAuthorizationResult);
  uint64_t v9 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak((id *)buf, self);
  uint64_t v10 = [(AMSUserNotificationAuthorizationTask *)self notificationCenter];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke;
  v17[3] = &unk_1E55A85A0;
  objc_copyWeak(&v20, (id *)buf);
  long long v11 = v9;
  __int16 v18 = v11;
  long long v12 = v8;
  v19 = v12;
  [v10 getNotificationSettingsWithCompletionHandler:v17];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_5;
  v16[3] = &unk_1E559F028;
  v16[4] = self;
  [(AMSPromise *)v11 addErrorBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_44;
  v15[3] = &unk_1E55A85C8;
  v15[4] = self;
  [(AMSPromise *)v11 addSuccessBlock:v15];
  long long v13 = v11;

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return v13;
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([v3 authorizationStatus] == 1 || objc_msgSend(v3, "authorizationStatus") == 2)
  {
    id v5 = AMSError(11, @"User has already accepted or denied notification authorization.", 0, 0);
    [a1[4] finishWithError:v5];
  }
  else
  {
    id v5 = [WeakRetained _startEngagementAuthorizationWithResult:a1[5]];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_2;
    v9[3] = &unk_1E559F028;
    id v10 = a1[4];
    [v5 addErrorBlock:v9];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_3;
    v6[3] = &unk_1E55A22D0;
    v6[4] = WeakRetained;
    id v7 = a1[5];
    id v8 = a1[4];
    [v5 addSuccessBlock:v6];
  }
}

uint64_t __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_3(id *a1)
{
  v2 = [a1[4] notificationCenter];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_4;
  v3[3] = &unk_1E55A8578;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 getNotificationSettingsWithCompletionHandler:v3];
}

uint64_t __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationStatus:", objc_msgSend(a2, "authorizationStatus"));
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 finishWithResult:v4];
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Notification authorization completed with error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __60__AMSUserNotificationAuthorizationTask_requestAuthorization__block_invoke_44()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = +[AMSLogConfig sharedConfig];
  if (!v0)
  {
    v0 = +[AMSLogConfig sharedConfig];
  }
  v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_opt_class();
    id v3 = v2;
    uint64_t v4 = AMSLogKey();
    int v5 = 138543618;
    id v6 = v2;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification authorization completed successfully", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_presentDialogForUserInitiatedWithCompletion
{
  id v3 = objc_alloc_init(AMSMutableBinaryPromise);
  uint64_t v4 = [(AMSUserNotificationAuthorizationTask *)self notificationCenter];
  int v5 = [(AMSUserNotificationAuthorizationTask *)self options];
  uint64_t v6 = [v5 authorizationOptions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__AMSUserNotificationAuthorizationTask__presentDialogForUserInitiatedWithCompletion__block_invoke;
  v11[3] = &unk_1E55A0778;
  void v11[4] = self;
  __int16 v7 = v3;
  id v12 = v7;
  [v4 requestAuthorizationWithOptions:v6 completionHandler:v11];

  uint64_t v8 = v12;
  uint64_t v9 = v7;

  return v9;
}

void __84__AMSUserNotificationAuthorizationTask__presentDialogForUserInitiatedWithCompletion__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  __int16 v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      __int16 v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authorization granted.", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithSuccess];
  }
  else
  {
    if (!v6)
    {
      __int16 v7 = +[AMSLogConfig sharedConfig];
    }
    __int16 v11 = [v7 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire authorization. Error: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
}

- (id)_startEngagementAuthorizationWithResult:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutableBinaryPromise);
  uint64_t v6 = objc_opt_class();
  __int16 v7 = [(AMSUserNotificationAuthorizationTask *)self bundleIdentifier];
  uint64_t v8 = [(AMSUserNotificationAuthorizationTask *)self options];
  uint64_t v9 = [v6 recordEngagementEventWithBundleIdentifier:v7 options:v8];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke;
  v19[3] = &unk_1E559F028;
  id v10 = v5;
  uint64_t v20 = v10;
  [v9 addErrorBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_2;
  v16[3] = &unk_1E55A8618;
  v16[4] = self;
  __int16 v11 = v10;
  v17 = v11;
  id v18 = v4;
  id v12 = v4;
  [v9 addSuccessBlock:v16];
  uint64_t v13 = v18;
  int v14 = v11;

  return v14;
}

uint64_t __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_2(id *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    __int16 v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v6;
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully obtained response", buf, 0x16u);
  }
  uint64_t v8 = [(id)objc_opt_class() _findEngagementRequestInResponse:v3];
  if (v8)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v11;
      __int16 v36 = 2114;
      v37 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);
    }
    [v8 setSilentlyCheckURL:1];
    uint64_t v13 = [a1[4] delegate];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_52;
    v29[3] = &unk_1E55A85F0;
    id v30 = a1[6];
    id v14 = v8;
    id v15 = a1[4];
    id v16 = a1[5];
    id v31 = v14;
    id v32 = v15;
    id v33 = v16;
    [v13 handleEngagementRequest:v14 completion:v29];

    v17 = v30;
    goto LABEL_22;
  }
  id v18 = [a1[4] options];
  if (![v18 userInitiated])
  {
    id v19 = [v3 data];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"forceTCC"];
    if (objc_opt_respondsToSelector())
    {
      v21 = [v3 data];
      v22 = [v21 objectForKeyedSubscript:@"forceTCC"];
      int v23 = [v22 BOOLValue];

      if (v23) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    v17 = AMSError(12, @"No engagement request obtained.", 0, 0);
    [a1[5] finishWithError:v17];
    goto LABEL_22;
  }

LABEL_15:
  v24 = +[AMSLogConfig sharedConfig];
  if (!v24)
  {
    v24 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v25 = [v24 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v26;
    __int16 v36 = 2114;
    v37 = v27;
    _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No engagement request obtained, attempting to present TCC dialog instead.", buf, 0x16u);
  }
  id v28 = a1[5];
  v17 = [a1[4] _presentDialogForUserInitiatedWithCompletion];
  [v28 finishWithPromise:v17];
LABEL_22:
}

void __80__AMSUserNotificationAuthorizationTask__startEngagementAuthorizationWithResult___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [*(id *)(a1 + 32) setRequest:*(void *)(a1 + 40)];
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    __int16 v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      int v13 = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error while presenting engagement: %{public}@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 56) finishWithError:v4];
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v6 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement completed successfully", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 56) finishWithSuccess];
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (AMSUserNotificationAuthorizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUserNotificationAuthorizationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSUserNotificationAuthorizationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end