@interface AMSPushParsableEngagementEvent
+ (BOOL)shouldSkipAccountCheck;
+ (id)_eventForMapiPayload:(id)a3 account:(id)a4 bag:(id)a5;
+ (id)_eventForStaticAssetPayload:(id)a3 bag:(id)a4;
+ (void)_waitForPromises:(id)a3 completion:(id)a4;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSPushParsableEngagementEvent

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 logKey];
  id v10 = AMSSetLogKey(v9);

  v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    v14 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v13;
    __int16 v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing engagement event", buf, 0x16u);
  }
  v15 = [v7 aps];
  v16 = [v15 objectForKeyedSubscript:@"mi"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  v18 = [v7 account];
  v19 = [a1 _eventForMapiPayload:v17 account:v18 bag:v8];

  v20 = [v7 aps];
  v21 = [v20 objectForKeyedSubscript:@"static"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  v23 = [a1 _eventForStaticAssetPayload:v22 bag:v8];
  v24 = [v7 aps];
  v25 = [v24 objectForKeyedSubscript:@"event"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }

  if (v26) {
    id v27 = v26;
  }
  else {
    id v27 = (id)MEMORY[0x1E4F1CC08];
  }
  v28 = +[AMSPromise promiseWithResult:v27];
  v40[0] = v19;
  v40[1] = v23;
  v40[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke;
  v34[3] = &unk_1E55A3208;
  id v35 = v7;
  id v36 = v19;
  id v37 = v28;
  id v38 = v23;
  id v39 = a1;
  id v30 = v23;
  id v31 = v28;
  id v32 = v19;
  id v33 = v7;
  [a1 _waitForPromises:v29 completion:v34];
}

void __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logKey];
  id v3 = AMSSetLogKey(v2);

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:@"AMSPushHandler" forKeyedSubscript:@"source"];
  [v4 setObject:@"engagementPush" forKeyedSubscript:@"eventType"];
  uint64_t v5 = [*(id *)(a1 + 40) resultWithError:0];
  v6 = (void *)v5;
  uint64_t v7 = MEMORY[0x1E4F1CC08];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC08];
  }
  [v4 setObject:v8 forKeyedSubscript:@"mi"];

  uint64_t v9 = [*(id *)(a1 + 48) resultWithError:0];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v7;
  }
  [v4 setObject:v11 forKeyedSubscript:@"event"];

  uint64_t v12 = [*(id *)(a1 + 56) resultWithError:0];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v7;
  }
  [v4 setObject:v14 forKeyedSubscript:@"static"];

  uint64_t v15 = [v4 count];
  uint64_t v16 = +[AMSLogConfig sharedConfig];
  id v17 = (AMSEngagement *)v16;
  if (v15)
  {
    if (!v16)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [(AMSEngagement *)v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      v20 = [*(id *)(a1 + 32) logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      id v31 = v20;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Enqueueing event: %@", buf, 0x20u);
    }
    id v17 = objc_alloc_init(AMSEngagement);
    v21 = [(AMSEngagement *)v17 enqueueData:v4];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke_42;
    v25[3] = &unk_1E55A6058;
    uint64_t v27 = *(void *)(a1 + 64);
    id v26 = *(id *)(a1 + 32);
    [v21 addFinishBlock:v25];

    id v22 = v26;
  }
  else
  {
    if (!v16)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v22 = [(AMSEngagement *)v17 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = [*(id *)(a1 + 32) logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v23;
      __int16 v30 = 2114;
      id v31 = v24;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Engagement event contains no fields", buf, 0x16u);
    }
  }
}

void __71__AMSPushParsableEngagementEvent_handleNotificationPayload_config_bag___block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [*(id *)(a1 + 32) logKey];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished enqueueing event. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (id)_eventForMapiPayload:(id)a3 account:(id)a4 bag:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v7 objectForKeyedSubscript:@"clientIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    id v14 = [v7 objectForKeyedSubscript:@"clientVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v14;
    }
    else {
      id v35 = 0;
    }

    uint64_t v15 = [v7 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v34 = v15;
    }
    else {
      id v34 = 0;
    }
    id v33 = v8;

    uint64_t v16 = [v7 objectForKeyedSubscript:@"placement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    v18 = v34;
    uint64_t v19 = v35;

    v20 = [v7 objectForKeyedSubscript:@"params"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v9;

    if (v11 && v35 && v34 && v17)
    {
      uint64_t v23 = +[AMSLogConfig sharedConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_opt_class();
        AMSLogKey();
        id v26 = v32 = v11;
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v25;
        __int16 v38 = 2114;
        id v39 = v26;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found MAPI request", buf, 0x16u);

        id v11 = v32;
      }

      id v9 = v22;
      v18 = v34;
      uint64_t v19 = v35;
      uint64_t v27 = [[AMSMarketingItemTask alloc] initWithBag:v22 clientIdentifier:v11 clientVersion:v35 placement:v17 serviceType:v34];
      [(AMSMarketingItemTask *)v27 setAccount:v33];
      [(AMSMarketingItemTask *)v27 setContextInfo:v21];
      [(AMSMarketingItemTask *)v27 perform];
      uint64_t v29 = v28 = v11;
      __int16 v13 = [v29 thenWithBlock:&__block_literal_global_110];

      id v11 = v28;
    }
    else
    {
      __int16 v30 = AMSError(7, @"MAPI keys Not Found", 0, 0);
      __int16 v13 = +[AMSPromise promiseWithError:v30];

      id v9 = v22;
    }

    id v8 = v33;
  }
  else
  {
    uint64_t v12 = AMSError(11, @"Engagement Push MI Failure", @"Failed to locate account", 0);
    __int16 v13 = +[AMSPromise promiseWithError:v12];
  }
  return v13;
}

id __67__AMSPushParsableEngagementEvent__eventForMapiPayload_account_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 rawValues];
  id v3 = (void *)v2;
  if (v2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = +[AMSPromise promiseWithResult:v4];

  return v5;
}

+ (id)_eventForStaticAssetPayload:(id)a3 bag:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v7 = 0;
LABEL_10:
    uint64_t v19 = AMSError(7, @"Static Key Not Found", 0, 0);
    v18 = +[AMSPromise promiseWithError:v19];

    goto LABEL_11;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  if (!v8) {
    goto LABEL_10;
  }
  id v9 = (void *)v8;
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    __int16 v13 = AMSLogKey();
    int v21 = 138543618;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found static request", (uint8_t *)&v21, 0x16u);
  }
  id v14 = [[AMSURLRequestEncoder alloc] initWithBag:v5];
  uint64_t v15 = [(AMSURLRequestEncoder *)v14 requestWithMethod:2 URL:v9 parameters:0];
  uint64_t v16 = +[AMSURLSession defaultSession];
  id v17 = [v16 dataTaskPromiseWithRequestPromise:v15];

  v18 = [v17 thenWithBlock:&__block_literal_global_65_1];

LABEL_11:
  return v18;
}

id __66__AMSPushParsableEngagementEvent__eventForStaticAssetPayload_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 object];
  id v3 = (void *)v2;
  if (v2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC08];
  }
  id v5 = +[AMSPromise promiseWithResult:v4];

  return v5;
}

+ (void)_waitForPromises:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  if ([v5 count])
  {
    id v7 = +[AMSPromise promiseWithAny:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__AMSPushParsableEngagementEvent__waitForPromises_completion___block_invoke;
    v8[3] = &unk_1E55A5918;
    id v9 = v6;
    [v7 addFinishBlock:v8];
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __62__AMSPushParsableEngagementEvent__waitForPromises_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end