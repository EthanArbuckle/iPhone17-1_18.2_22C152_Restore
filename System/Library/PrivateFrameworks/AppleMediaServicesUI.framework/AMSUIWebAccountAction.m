@interface AMSUIWebAccountAction
- (ACAccount)account;
- (AMSUIWebAccountAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)accountObject;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setAccountObject:(id)a3;
@end

@implementation AMSUIWebAccountAction

- (AMSUIWebAccountAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebAccountAction;
  v8 = [(AMSUIWebAction *)&v16 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }

    accountObject = v8->_accountObject;
    v8->_accountObject = v10;

    v12 = [v7 iTunesAccountFromJSAccount:v8->_accountObject];
    uint64_t v13 = [v12 copy];
    account = v8->_account;
    v8->_account = (ACAccount *)v13;
  }
  return v8;
}

- (id)runAction
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebAccountAction;
  id v3 = [(AMSUIWebAction *)&v28 runAction];
  v4 = [(AMSUIWebAccountAction *)self account];
  v5 = [(AMSUIWebAccountAction *)self accountObject];
  id v6 = [v5 objectForKeyedSubscript:@"accountFlags"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __34__AMSUIWebAccountAction_runAction__block_invoke;
  v26[3] = &unk_2643E46D0;
  id v8 = v4;
  id v27 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v26];
  v9 = [v5 objectForKeyedSubscript:@"active"];
  if (objc_opt_respondsToSelector())
  {
    v10 = [v5 objectForKeyedSubscript:@"active"];
    objc_msgSend(v8, "setActive:", objc_msgSend(v10, "BOOLValue"));
  }
  else
  {
    [v8 setActive:0];
  }

  v11 = [v5 objectForKeyedSubscript:@"credits"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  objc_msgSend(v8, "ams_setCreditsString:", v12);
  uint64_t v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    objc_super v16 = AMSLogKey();
    v17 = [v8 dirtyProperties];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v15;
    __int16 v31 = 2114;
    v32 = v16;
    __int16 v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating account keys: %{public}@", buf, 0x20u);
  }
  v18 = (void *)MEMORY[0x263EFB210];
  v19 = [(AMSUIWebAction *)self context];
  v20 = [v19 clientInfo];
  v21 = [v20 accountMediaType];
  v22 = objc_msgSend(v18, "ams_sharedAccountStoreForMediaType:", v21);

  v23 = objc_msgSend(v22, "ams_saveAccount:verifyCredentials:", v8, 0);
  v24 = [v23 promiseAdapter];

  return v24;
}

uint64_t __34__AMSUIWebAccountAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_setAccountFlagValue:forAccountFlag:", a3, a2);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)accountObject
{
  return self->_accountObject;
}

- (void)setAccountObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObject, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end