@interface AMSUIWebFetchCardDataAction
- (AMSUIWebFetchCardDataAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)merchantID;
- (NSString)storeFrontCountryCode;
- (id)runAction;
- (void)setMerchantID:(id)a3;
- (void)setStoreFrontCountryCode:(id)a3;
@end

@implementation AMSUIWebFetchCardDataAction

- (AMSUIWebFetchCardDataAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebFetchCardDataAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"merchantID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    merchantID = v7->_merchantID;
    v7->_merchantID = v9;

    v11 = [v6 objectForKeyedSubscript:@"storeFrontCountryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    storeFrontCountryCode = v7->_storeFrontCountryCode;
    v7->_storeFrontCountryCode = v12;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)AMSUIWebFetchCardDataAction;
  id v3 = [(AMSUIWebAction *)&v32 runAction];
  v4 = AMSLogKey();
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v7;
    __int16 v36 = 2114;
    v37 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching card data...", buf, 0x16u);
  }

  v8 = [(AMSUIWebFetchCardDataAction *)self merchantID];
  if (v8)
  {
    v9 = [MEMORY[0x263F27E10] promiseWithResult:v8];
  }
  else
  {
    v10 = [(AMSUIWebAction *)self context];
    v11 = [v10 bag];
    v12 = [v11 stringForKey:@"applepay-merchant-id"];
    v9 = [v12 valuePromise];
  }
  v13 = [(AMSUIWebFetchCardDataAction *)self storeFrontCountryCode];
  if (v13)
  {
    v14 = [MEMORY[0x263F27E10] promiseWithResult:v13];
  }
  else
  {
    objc_super v15 = [(AMSUIWebAction *)self context];
    v16 = [v15 bag];
    v17 = [v16 stringForKey:@"countryCode"];
    v14 = [v17 valuePromise];
  }
  v18 = (void *)MEMORY[0x263F27E10];
  v33[0] = v14;
  v33[1] = v9;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v20 = [v18 promiseWithAll:v19];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke;
  v30[3] = &unk_2643E4DF0;
  v30[4] = self;
  id v21 = v4;
  id v31 = v21;
  v22 = [v20 thenWithBlock:v30];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_2;
  v28[3] = &unk_2643E37F8;
  v28[4] = self;
  id v23 = v21;
  id v29 = v23;
  [v22 addErrorBlock:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_30;
  v26[3] = &unk_2643E3840;
  v26[4] = self;
  id v27 = v23;
  id v24 = v23;
  [v22 addSuccessBlock:v26];

  return v22;
}

id __40__AMSUIWebFetchCardDataAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v3 objectAtIndexedSubscript:1];

  id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 40);
    int v14 = 138544130;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    v19 = v4;
    __int16 v20 = 2114;
    id v21 = v5;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] countryCode: %{public}@, merchantIdentifier: %{public}@", (uint8_t *)&v14, 0x2Au);
  }

  v10 = (void *)[objc_alloc(MEMORY[0x263F27BB0]) initWithCountryCode:v4 merchantIdentifier:v5];
  v11 = [v10 performCardRegistration];
  v12 = [v11 thenWithBlock:&__block_literal_global_23];

  return v12;
}

id __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [v2 cardData];
  if (v4)
  {
    v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    [v3 setObject:v5 forKeyedSubscript:@"cardData"];
  }
  id v6 = [v2 brokerURL];
  uint64_t v7 = [v6 absoluteString];
  [v3 setObject:v7 forKeyedSubscript:@"brokerURL"];

  uint64_t v8 = [v2 paymentServicesURL];
  uint64_t v9 = [v8 absoluteString];
  [v3 setObject:v9 forKeyedSubscript:@"paymentServicesURL"];

  v10 = [MEMORY[0x263F27E10] promiseWithResult:v3];

  return v10;
}

void __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = AMSLogableError();
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    int v14 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void __40__AMSUIWebFetchCardDataAction_runAction__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543875;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2113;
    id v13 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched card data: %{private}@", (uint8_t *)&v8, 0x20u);
  }
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (void)setMerchantID:(id)a3
{
}

- (NSString)storeFrontCountryCode
{
  return self->_storeFrontCountryCode;
}

- (void)setStoreFrontCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
}

@end