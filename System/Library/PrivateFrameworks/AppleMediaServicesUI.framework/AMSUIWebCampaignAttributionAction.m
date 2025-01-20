@interface AMSUIWebCampaignAttributionAction
+ (id)_campaignAttributionTaskForURL:(id)a3;
- (ACAccount)account;
- (AMSUIWebCampaignAttributionAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)additionalQueryItems;
- (NSURL)URL;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setAdditionalQueryItems:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSUIWebCampaignAttributionAction

- (AMSUIWebCampaignAttributionAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebCampaignAttributionAction;
  v8 = [(AMSUIWebAction *)&v39 initWithJSObject:v7 context:a4];
  v9 = v8;
  if (v8)
  {
    v10 = [(AMSUIWebAction *)v8 context];
    v11 = [v7 objectForKeyedSubscript:@"account"];
    v12 = [v10 iTunesAccountFromJSAccount:v11];
    v13 = v12;
    if (!v12)
    {
      v4 = [(AMSUIWebAction *)v9 context];
      v13 = [v4 account];
    }
    objc_storeStrong((id *)&v9->_account, v13);
    if (!v12)
    {
    }
    v14 = [v7 objectForKeyedSubscript:@"additionalQueryItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [MEMORY[0x263EFF980] array];
    if (v16)
    {
      v34 = v9;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v33 = v15;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v23 = [v17 objectForKeyedSubscript:v22];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v24 = v23;
            }
            else {
              id v24 = 0;
            }

            if (v24)
            {
              v25 = [MEMORY[0x263F08BD0] queryItemWithName:v22 value:v24];
              [v16 addObject:v25];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v19);
      }

      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v16];
      v9 = v34;
      additionalQueryItems = v34->_additionalQueryItems;
      v34->_additionalQueryItems = (NSArray *)v26;

      id v15 = v33;
    }
    v28 = [v7 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }

    if (v29)
    {
      uint64_t v30 = [NSURL URLWithString:v29];
      URL = v9->_URL;
      v9->_URL = (NSURL *)v30;
    }
  }

  return v9;
}

- (id)runAction
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebCampaignAttributionAction;
  id v3 = [(AMSUIWebAction *)&v46 runAction];
  v4 = [(AMSUIWebCampaignAttributionAction *)self URL];

  if (v4)
  {
    if (runAction_ams_once_token___COUNTER__ != -1) {
      dispatch_once(&runAction_ams_once_token___COUNTER__, &__block_literal_global_19);
    }
    id v5 = (id)runAction_ams_once_object___COUNTER__;
    id v6 = objc_alloc(MEMORY[0x263F08BA0]);
    id v7 = [(AMSUIWebCampaignAttributionAction *)self URL];
    v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

    if (v8)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v9 = objc_msgSend(v8, "queryItems", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v43 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) name];
            char v15 = [v5 containsObject:v14];

            if (v15)
            {

              v27 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
              if (!v27)
              {
                v27 = [MEMORY[0x263F27CB8] sharedConfig];
              }
              v28 = [v27 OSLogObject];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v29 = objc_opt_class();
                uint64_t v30 = AMSLogKey();
                *(_DWORD *)buf = 138543618;
                uint64_t v49 = v29;
                __int16 v50 = 2114;
                v51 = v30;
                _os_log_impl(&dword_21C134000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning campaign attribution task", buf, 0x16u);
              }
              v31 = objc_opt_class();
              v32 = [(AMSUIWebCampaignAttributionAction *)self URL];
              id v33 = [v31 _campaignAttributionTaskForURL:v32];

              v34 = [(AMSUIWebCampaignAttributionAction *)self account];
              [v33 setAccount:v34];

              long long v35 = [(AMSUIWebCampaignAttributionAction *)self additionalQueryItems];
              [v33 setAdditionalQueryItems:v35];

              long long v36 = [v33 perform];
              uint64_t v26 = [v36 thenWithBlock:&__block_literal_global_82];

              goto LABEL_34;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v16)
      {
        v16 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v18;
        __int16 v50 = 2114;
        v51 = v19;
        _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL does not contain any known campaign or affiliate query parameters", buf, 0x16u);
      }
      uint64_t v20 = (void *)MEMORY[0x263F27E10];
    }
    else
    {
      long long v37 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v37)
      {
        long long v37 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      long long v38 = [v37 OSLogObject];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = objc_opt_class();
        v40 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v39;
        __int16 v50 = 2114;
        v51 = v40;
        _os_log_impl(&dword_21C134000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to convert URL to components", buf, 0x16u);
      }
      uint64_t v20 = (void *)MEMORY[0x263F27E10];
    }
    id v33 = AMSError();
    uint64_t v26 = [v20 promiseWithError:v33];
LABEL_34:
  }
  else
  {
    v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v21)
    {
      v21 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      id v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v23;
      __int16 v50 = 2114;
      v51 = v24;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid URL passed", buf, 0x16u);
    }
    v25 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 promiseWithError:v5];
  }

  return v26;
}

uint64_t __46__AMSUIWebCampaignAttributionAction_runAction__block_invoke()
{
  runAction_ams_once_object___COUNTER__ = [MEMORY[0x263EFFA08] setWithArray:&unk_26CC73BF0];
  return MEMORY[0x270F9A758]();
}

id __46__AMSUIWebCampaignAttributionAction_runAction__block_invoke_79(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF9A0];
  v13 = @"success";
  v14[0] = MEMORY[0x263EFFA88];
  id v3 = NSDictionary;
  id v4 = a2;
  id v5 = [v3 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v6 = [v2 dictionaryWithDictionary:v5];

  id v7 = [v4 redirectURL];

  v8 = [v7 absoluteString];

  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"redirectURL"];
  }
  v9 = (void *)MEMORY[0x263F27E10];
  uint64_t v10 = [NSDictionary dictionaryWithDictionary:v6];
  uint64_t v11 = [v9 promiseWithResult:v10];

  return v11;
}

+ (id)_campaignAttributionTaskForURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F27B88];
  id v4 = a3;
  id v5 = [v3 createBagForSubProfile];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F27B88]) initWithURL:v4 bag:v5];

  return v6;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (void)setAdditionalQueryItems:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end