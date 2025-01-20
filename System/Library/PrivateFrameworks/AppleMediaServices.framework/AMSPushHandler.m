@interface AMSPushHandler
+ (id)accountIsEligibleForPushNotifications:(id)a3 accountStore:(id)a4;
- (AMSBagProtocol)bag;
- (AMSPushConfiguration)configuration;
- (AMSPushHandler)initWithConfiguration:(id)a3 bag:(id)a4;
- (AMSPushHandler)initWithConfiguration:(id)a3 bagContract:(id)a4;
- (AMSPushHandlerContract)bagContract;
- (AMSPushHandlerDelegate)delegate;
- (BOOL)shouldHandleNotification:(id)a3;
- (NSDictionary)enabledParsables;
- (void)_handlePushNotification:(id)a3;
- (void)dealloc;
- (void)handleNotification:(id)a3;
- (void)registerForEngagementPushes;
- (void)setDelegate:(id)a3;
@end

@implementation AMSPushHandler

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPushHandler *)self configuration];
  [v5 setDelegate:v4];
}

- (AMSPushHandler)initWithConfiguration:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPushHandler;
  v8 = [(AMSPushHandler *)&v12 init];
  if (v8)
  {
    if (v6) {
      v9 = (AMSPushConfiguration *)v6;
    }
    else {
      v9 = objc_alloc_init(AMSPushConfiguration);
    }
    configuration = v8->_configuration;
    v8->_configuration = v9;

    objc_storeStrong((id *)&v8->_bag, a4);
    [(AMSPushHandler *)v8 registerForEngagementPushes];
  }

  return v8;
}

- (void)registerForEngagementPushes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!+[AMSProcessInfo hasAMSEntitlement])
  {
    v9 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "Current process is attempting to register for engagement pushes but does not have the com.apple.private.applemediaservices entitlement; rejecting",
        (uint8_t *)&v17,
        2u);
    }
    goto LABEL_21;
  }
  v3 = [(AMSPushHandler *)self configuration];
  uint64_t v4 = [v3 enabledActionTypes];
  if (!v4)
  {

    goto LABEL_10;
  }
  id v5 = (void *)v4;
  id v6 = [(AMSPushHandler *)self configuration];
  id v7 = [v6 enabledActionTypes];
  int v8 = [v7 containsObject:@"35"];

  if (v8)
  {
LABEL_10:
    v11 = [(AMSPushHandler *)self configuration];
    v9 = [v11 engagementPushTopic];

    if ([v9 length])
    {
      v10 = [@"com.apple.AppleMediaServices.pushhandler." stringByAppendingString:v9];
      objc_super v12 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v12 addObserver:self selector:sel__handlePushNotification_ name:v10 object:0 suspensionBehavior:4];
      v13 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2114;
        v20 = v10;
        id v15 = v18;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered for pushes with service name %{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      v10 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      objc_super v12 = [v10 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = (id)objc_opt_class();
        id v16 = v18;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No engagment topic provided; will not register for engagement pushes.",
          (uint8_t *)&v17,
          0xCu);
      }
    }

LABEL_21:
  }
}

- (AMSPushConfiguration)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSPushHandler;
  [(AMSPushHandler *)&v4 dealloc];
}

- (AMSPushHandlerDelegate)delegate
{
  v2 = [(AMSPushHandler *)self configuration];
  v3 = [v2 delegate];

  return (AMSPushHandlerDelegate *)v3;
}

- (void)handleNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [[AMSPushPayload alloc] initWithPayload:v4];
    if (os_variant_has_internal_content()
      && [MEMORY[0x1E4F28D90] isValidJSONObject:v4])
    {
      id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:0];
      if (v6)
      {
        id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
        int v8 = +[AMSLogConfig sharedConfigOversize];
        if (!v8)
        {
          int v8 = +[AMSLogConfig sharedConfig];
        }
        v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_opt_class();
          id v11 = v10;
          objc_super v12 = [(AMSPushPayload *)v5 logKey];
          *(_DWORD *)buf = 138543874;
          uint64_t v28 = (uint64_t)v10;
          __int16 v29 = 2114;
          v30 = v12;
          __int16 v31 = 2114;
          v32 = v7;
          _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received payload: %{public}@", buf, 0x20u);
        }
      }
    }
    v13 = [(AMSPushHandler *)self enabledParsables];
    v14 = [(AMSPushPayload *)v5 actionType];
    id v15 = (void *)[v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v15 shouldSkipAccountCheck])
      {
        id v16 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
      }
      else
      {
        int v17 = objc_opt_class();
        id v18 = [(AMSPushPayload *)v5 account];
        id v16 = [v17 accountIsEligibleForPushNotifications:v18 accountStore:0];
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __37__AMSPushHandler_handleNotification___block_invoke;
      v24[3] = &unk_1E55A6030;
      v24[4] = self;
      id v5 = v5;
      v25 = v5;
      v26 = v15;
      [v16 addFinishBlock:v24];
    }
    else
    {
      id v16 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v16)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      __int16 v19 = [v16 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_opt_class();
        id v21 = v20;
        v22 = [(AMSPushPayload *)v5 logKey];
        v23 = [(AMSPushPayload *)v5 actionType];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = (uint64_t)v20;
        __int16 v29 = 2114;
        v30 = v22;
        __int16 v31 = 2048;
        v32 = v23;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to handle notification with action type: %ld", buf, 0x20u);
      }
    }
  }
  else
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [(AMSPushPayload *)v5 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Received nil payload", buf, 0xCu);
    }
  }
}

void __37__AMSPushHandler_handleNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 BOOLValue])
  {
    id v4 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = *(void **)(a1 + 40);
      id v8 = v6;
      v9 = [v7 logKey];
      v10 = [*(id *)(a1 + 40) actionType];
      uint64_t v11 = *(void *)(a1 + 48);
      int v21 = 138544130;
      v22 = v6;
      __int16 v23 = 2114;
      v24 = v9;
      __int16 v25 = 2114;
      v26 = v10;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling notification of type: %{public}@ class: %{public}@", (uint8_t *)&v21, 0x2Au);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    objc_super v12 = *(void **)(a1 + 48);
    v14 = [*(id *)(a1 + 32) configuration];
    id v15 = [*(id *)(a1 + 32) bag];
    [v12 handleNotificationPayload:v13 config:v14 bag:v15];
  }
  else
  {
    v14 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      int v17 = *(void **)(a1 + 40);
      id v18 = v16;
      __int16 v19 = [v17 logKey];
      v20 = [*(id *)(a1 + 40) account];
      int v21 = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      v24 = v19;
      __int16 v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring notification for inactive account: %{public}@", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (BOOL)shouldHandleNotification:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSPushPayload alloc] initWithPayload:v4];

  id v6 = [(AMSPushHandler *)self enabledParsables];
  id v7 = [(AMSPushPayload *)v5 actionType];
  BOOL v8 = [v6 objectForKeyedSubscript:v7] != 0;

  return v8;
}

- (NSDictionary)enabledParsables
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"1";
  v21[0] = objc_opt_class();
  v20[1] = @"35";
  v21[1] = objc_opt_class();
  v20[2] = @"25";
  v21[2] = objc_opt_class();
  v20[3] = @"4";
  v21[3] = objc_opt_class();
  v20[4] = @"22";
  v21[4] = objc_opt_class();
  v20[5] = @"40";
  v21[5] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  id v4 = [(AMSPushHandler *)self configuration];
  id v5 = [v4 enabledActionTypes];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v3, "objectForKeyedSubscript:", v12, (void)v15)) {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v12), v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = (id)[v3 mutableCopy];
  }
  uint64_t v13 = objc_msgSend(v6, "copy", (void)v15);

  return (NSDictionary *)v13;
}

+ (id)accountIsEligibleForPushNotifications:(id)a3 accountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isActive])
  {
    id v7 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v9 = v8;
    id v7 = objc_msgSend(v8, "ams_accountIsBackingAccountForActiveiCloudAccount:", v5);
  }
  return v7;
}

- (void)_handlePushNotification:(id)a3
{
  id v4 = [a3 userInfo];
  [(AMSPushHandler *)self handleNotification:v4];
}

- (AMSPushHandler)initWithConfiguration:(id)a3 bagContract:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPushHandler;
  uint64_t v9 = [(AMSPushHandler *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_bagContract, a4);
  }

  return v10;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSPushHandlerContract)bagContract
{
  return self->_bagContract;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagContract, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end