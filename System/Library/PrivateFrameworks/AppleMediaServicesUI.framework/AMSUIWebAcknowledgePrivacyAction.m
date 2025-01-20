@interface AMSUIWebAcknowledgePrivacyAction
- (ACAccount)account;
- (AMSUIWebAcknowledgePrivacyAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)privacyIdentifier;
- (id)runAction;
- (void)setAccount:(id)a3;
- (void)setPrivacyIdentifier:(id)a3;
@end

@implementation AMSUIWebAcknowledgePrivacyAction

- (AMSUIWebAcknowledgePrivacyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)AMSUIWebAcknowledgePrivacyAction;
  v8 = [(AMSUIWebAction *)&v34 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"privacyIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }

    privacyIdentifier = v8->_privacyIdentifier;
    v8->_privacyIdentifier = v10;

    v12 = [v6 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    uint64_t v14 = [v7 iTunesAccountFromJSAccount:v13];
    account = v8->_account;
    v8->_account = (ACAccount *)v14;

    v16 = v8->_account;
    if (v16 && ![(ACAccount *)v16 ams_isLocalAccount]) {
      goto LABEL_22;
    }
    v17 = (void *)MEMORY[0x263EFB210];
    v18 = [(AMSUIWebAction *)v8 context];
    v19 = [v18 clientInfo];
    v20 = [v19 accountMediaType];
    v21 = objc_msgSend(v17, "ams_sharedAccountStoreForMediaType:", v20);

    v22 = [v21 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];
    uint64_t v23 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v22];
    v24 = v8->_account;
    v8->_account = (ACAccount *)v23;

    v25 = [v13 objectForKeyedSubscript:@"username"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }

    [(ACAccount *)v8->_account setUsername:v26];
    v27 = [v13 objectForKeyedSubscript:@"DSID"];
    if (objc_opt_respondsToSelector())
    {
      v28 = [v13 objectForKeyedSubscript:@"DSID"];
      uint64_t v29 = [v28 longLongValue];

      if (v29)
      {
        v30 = [NSNumber numberWithLongLong:v29];
        [(ACAccount *)v8->_account ams_setDSID:v30];

LABEL_18:
        v31 = [v13 objectForKeyedSubscript:@"altDSID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v32 = v31;
        }
        else {
          id v32 = 0;
        }

        [(ACAccount *)v8->_account ams_setAltDSID:v32];
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
    }
    [(ACAccount *)v8->_account ams_setDSID:0];
    goto LABEL_18;
  }
LABEL_23:

  return v8;
}

- (id)runAction
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebAcknowledgePrivacyAction;
  id v3 = [(AMSUIWebAction *)&v21 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    v8 = [(AMSUIWebAcknowledgePrivacyAction *)self privacyIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v6;
    __int16 v24 = 2114;
    v25 = v7;
    __int16 v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Acknowledging privacy for ID: %{public}@", buf, 0x20u);
  }
  v9 = [(AMSUIWebAcknowledgePrivacyAction *)self privacyIdentifier];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [(AMSUIWebAcknowledgePrivacyAction *)self account];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263F27AE0]);
      id v13 = [(AMSUIWebAcknowledgePrivacyAction *)self privacyIdentifier];
      uint64_t v14 = [(AMSUIWebAcknowledgePrivacyAction *)self account];
      v15 = (void *)[v12 initWithPrivacyIdentifier:v13 account:v14];

      v16 = [v15 acknowledgePrivacy];
      v17 = [v16 promiseAdapter];
      v18 = [v17 thenWithBlock:&__block_literal_global_16];

      goto LABEL_11;
    }
    v19 = (void *)MEMORY[0x263F27E10];
  }
  else
  {
    v19 = (void *)MEMORY[0x263F27E10];
  }
  v15 = AMSError();
  v18 = [v19 promiseWithError:v15];
LABEL_11:

  return v18;
}

uint64_t __45__AMSUIWebAcknowledgePrivacyAction_runAction__block_invoke()
{
  return [MEMORY[0x263F27E10] promiseWithResult:&unk_26CC73948];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end