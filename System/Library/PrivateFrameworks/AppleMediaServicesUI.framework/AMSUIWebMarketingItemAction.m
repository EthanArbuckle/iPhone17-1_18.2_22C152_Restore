@interface AMSUIWebMarketingItemAction
- (ACAccount)account;
- (AMSUIWebMarketingItemAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)contextInfo;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)offerHints;
- (NSString)placement;
- (NSString)serviceType;
- (id)runAction;
@end

@implementation AMSUIWebMarketingItemAction

- (AMSUIWebMarketingItemAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AMSUIWebMarketingItemAction;
  v7 = [(AMSUIWebAction *)&v35 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"clientIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    clientIdentifier = v7->_clientIdentifier;
    v7->_clientIdentifier = v9;

    v11 = [v6 objectForKeyedSubscript:@"clientVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    clientVersion = v7->_clientVersion;
    v7->_clientVersion = v12;

    v14 = [v6 objectForKeyedSubscript:@"contextInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    contextInfo = v7->_contextInfo;
    v7->_contextInfo = v15;

    v17 = [v6 objectForKeyedSubscript:@"offerHints"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    offerHints = v7->_offerHints;
    v7->_offerHints = v18;

    v20 = [v6 objectForKeyedSubscript:@"placement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    placement = v7->_placement;
    v7->_placement = v21;

    v23 = [v6 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }

    serviceType = v7->_serviceType;
    v7->_serviceType = v24;

    v26 = [(AMSUIWebAction *)v7 context];
    v27 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v28 = [v26 iTunesAccountFromJSAccount:v27];
    account = v7->_account;
    v7->_account = (ACAccount *)v28;

    if (!v7->_account)
    {
      v30 = [(AMSUIWebAction *)v7 context];
      v31 = [v6 objectForKeyedSubscript:@"dsid"];
      uint64_t v32 = [v30 iTunesAccountFromJSDSID:v31];
      v33 = v7->_account;
      v7->_account = (ACAccount *)v32;
    }
  }

  return v7;
}

- (id)runAction
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)AMSUIWebMarketingItemAction;
  id v3 = [(AMSUIWebAction *)&v35 runAction];
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  v5 = AMSLogKey();
  id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    v10 = [(AMSUIWebMarketingItemAction *)self clientIdentifier];
    v11 = [(AMSUIWebMarketingItemAction *)self clientVersion];
    v12 = [(AMSUIWebMarketingItemAction *)self account];
    *(_DWORD *)buf = 138544386;
    uint64_t v37 = v8;
    __int16 v38 = 2114;
    v39 = v9;
    __int16 v40 = 2114;
    v41 = v10;
    __int16 v42 = 2114;
    v43 = v11;
    __int16 v44 = 2114;
    v45 = v12;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running marketing item action with clientID: %{public}@ clientVersion: %{public}@ account: %{public}@", buf, 0x34u);
  }
  id v13 = objc_alloc(MEMORY[0x263F27CE8]);
  v14 = [(AMSUIWebAction *)self context];
  v15 = [v14 bag];
  v16 = [(AMSUIWebMarketingItemAction *)self clientIdentifier];
  v17 = [(AMSUIWebMarketingItemAction *)self clientVersion];
  v18 = [(AMSUIWebMarketingItemAction *)self placement];
  v19 = [(AMSUIWebMarketingItemAction *)self serviceType];
  v20 = (void *)[v13 initWithBag:v15 clientIdentifier:v16 clientVersion:v17 placement:v18 serviceType:v19];

  v21 = [(AMSUIWebAction *)self context];
  v22 = [v21 account];
  [v20 setAccount:v22];

  v23 = [(AMSUIWebMarketingItemAction *)self contextInfo];
  [v20 setContextInfo:v23];

  v24 = [(AMSUIWebMarketingItemAction *)self offerHints];
  [v20 setOfferHints:v24];

  [v20 setLogKey:v5];
  v25 = [v20 perform];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __40__AMSUIWebMarketingItemAction_runAction__block_invoke;
  v31[3] = &unk_2643E53E0;
  id v32 = v5;
  v33 = self;
  id v26 = v4;
  id v34 = v26;
  id v27 = v5;
  [v25 addFinishBlock:v31];

  uint64_t v28 = v34;
  id v29 = v26;

  return v29;
}

void __40__AMSUIWebMarketingItemAction_runAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)AMSSetLogKey();
  uint64_t v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      int v18 = 138543874;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      v21 = v12;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Marketing item task failed. %{public}@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 48) finishWithError:v6];
  }
  else
  {
    if (!v8)
    {
      v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v9 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marketing item task completed successfully.", (uint8_t *)&v18, 0x16u);
    }
    v16 = *(void **)(a1 + 48);
    v17 = [v5 rawValues];
    [v16 finishWithResult:v17];
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)offerHints
{
  return self->_offerHints;
}

- (NSString)placement
{
  return self->_placement;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_offerHints, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end