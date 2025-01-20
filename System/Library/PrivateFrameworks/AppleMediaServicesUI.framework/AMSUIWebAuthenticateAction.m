@interface AMSUIWebAuthenticateAction
- (AMSAuthenticateRequest)request;
- (AMSUIWebAuthenticateAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)isAuthenticatingCloud;
- (BOOL)makeCurrentAccount;
- (BOOL)pauseTimeouts;
- (id)_responseForAccount:(id)a3;
- (id)runAction;
- (void)_updateContextWithAccountIfNeeded:(id)a3;
- (void)setIsAuthenticatingCloud:(BOOL)a3;
- (void)setMakeCurrentAccount:(BOOL)a3;
- (void)setPauseTimeouts:(BOOL)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSUIWebAuthenticateAction

- (AMSUIWebAuthenticateAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v62.receiver = self;
  v62.super_class = (Class)AMSUIWebAuthenticateAction;
  v7 = [(AMSUIWebAction *)&v62 initWithJSObject:v6 context:a4];
  if (!v7) {
    goto LABEL_65;
  }
  v8 = [v6 objectForKeyedSubscript:@"pauseTimeouts"];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v6 objectForKeyedSubscript:@"pauseTimeouts"];
    v7->_pauseTimeouts = [v9 BOOLValue];
  }
  else
  {
    v7->_pauseTimeouts = 1;
  }

  v10 = [v6 objectForKeyedSubscript:@"makeCurrentAccount"];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v6 objectForKeyedSubscript:@"makeCurrentAccount"];
    v7->_makeCurrentAccount = [v11 BOOLValue];
  }
  else
  {
    v7->_makeCurrentAccount = 0;
  }

  v12 = [v6 objectForKeyedSubscript:@"defaultButtonText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  v14 = [v6 objectForKeyedSubscript:@"headers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v59 = v14;
  }
  else {
    id v59 = 0;
  }

  v15 = [v6 objectForKeyedSubscript:@"promptTitle"];
  objc_opt_class();
  v60 = v13;
  if (objc_opt_isKindOfClass()) {
    id v61 = v15;
  }
  else {
    id v61 = 0;
  }

  v16 = [(AMSUIWebAction *)v7 context];
  v17 = [v6 objectForKeyedSubscript:@"account"];
  v18 = [v16 iTunesAccountFromJSAccount:v17];

  if (!v18 || objc_msgSend(v18, "ams_isLocalAccount"))
  {
    v19 = (void *)MEMORY[0x263EFB210];
    v20 = [(AMSUIWebAction *)v7 context];
    v21 = [v20 clientInfo];
    v22 = [v21 accountMediaType];
    v23 = objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v22);

    v24 = [v23 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];
    v25 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v24];

    v26 = [v6 objectForKeyedSubscript:@"account"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }

    v28 = [v27 objectForKeyedSubscript:@"username"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v28;
    }
    else {
      id v29 = 0;
    }

    [v25 setUsername:v29];
    v30 = [v27 objectForKeyedSubscript:@"DSID"];
    if (objc_opt_respondsToSelector())
    {
      v31 = [v27 objectForKeyedSubscript:@"DSID"];
      uint64_t v32 = [v31 longLongValue];

      if (v32)
      {
        v33 = [NSNumber numberWithLongLong:v32];
        objc_msgSend(v25, "ams_setDSID:", v33);

LABEL_30:
        v34 = [v27 objectForKeyedSubscript:@"altDSID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v35 = v34;
        }
        else {
          id v35 = 0;
        }

        objc_msgSend(v25, "ams_setAltDSID:", v35);
        goto LABEL_35;
      }
    }
    else
    {
    }
    objc_msgSend(v25, "ams_setDSID:", 0);
    goto LABEL_30;
  }
  v25 = v18;
LABEL_35:
  v36 = objc_msgSend(v25, "ams_DSID");

  if (!v36)
  {
    v37 = [v6 objectForKeyedSubscript:@"dsid"];
    if (objc_opt_respondsToSelector())
    {
      v38 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v37, "longLongValue"));
      objc_msgSend(v25, "ams_setDSID:", v38);
    }
    else
    {
      objc_msgSend(v25, "ams_setDSID:", 0);
    }
  }
  v39 = objc_msgSend(v25, "ams_altDSID");

  if (!v39)
  {
    v40 = [v6 objectForKeyedSubscript:@"altDSID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v41 = v40;
    }
    else {
      id v41 = 0;
    }

    objc_msgSend(v25, "ams_setAltDSID:", v41);
  }
  v42 = [v25 username];

  if (!v42)
  {
    v43 = [v6 objectForKeyedSubscript:@"username"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v44 = v43;
    }
    else {
      id v44 = 0;
    }

    [v25 setUsername:v44];
  }
  v45 = [v6 objectForKeyedSubscript:@"serviceType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }

  if ([v46 isEqualToString:@"cloud"]) {
    [(AMSUIWebAuthenticateAction *)v7 setIsAuthenticatingCloud:1];
  }
  v47 = [v6 objectForKeyedSubscript:@"type"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v48 = [v47 unsignedIntegerValue];
  }
  else {
    uint64_t v48 = 1;
  }
  id v49 = objc_alloc_init(MEMORY[0x263F27B00]);
  v50 = [(AMSUIWebAction *)v7 context];
  v51 = [v50 clientInfo];
  [v49 setClientInfo:v51];

  [v49 setAuthenticationType:v48];
  [v49 setPromptTitle:v61];
  v52 = [v6 objectForKeyedSubscript:@"canMakeAccountActive"];
  if (objc_opt_respondsToSelector())
  {
    v53 = [v6 objectForKeyedSubscript:@"canMakeAccountActive"];
    objc_msgSend(v49, "setCanMakeAccountActive:", objc_msgSend(v53, "BOOLValue"));
  }
  else
  {
    [v49 setCanMakeAccountActive:0];
  }

  [v49 setHTTPHeaders:v59];
  [v49 setDefaultButtonString:v60];
  v54 = [v6 objectForKeyedSubscript:@"ignoreAccountConversion"];
  if (objc_opt_respondsToSelector())
  {
    v55 = [v6 objectForKeyedSubscript:@"ignoreAccountConversion"];
    objc_msgSend(v49, "setIgnoreAccountConversion:", objc_msgSend(v55, "BOOLValue"));
  }
  else
  {
    [v49 setIgnoreAccountConversion:0];
  }

  uint64_t v56 = [objc_alloc(MEMORY[0x263F27B08]) initWithAccount:v25 options:v49];
  request = v7->_request;
  v7->_request = (AMSAuthenticateRequest *)v56;

LABEL_65:
  return v7;
}

- (id)runAction
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)AMSUIWebAuthenticateAction;
  id v3 = [(AMSUIWebAction *)&v41 runAction];
  BOOL v4 = [(AMSUIWebAuthenticateAction *)self isAuthenticatingCloud];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      v10 = [(AMSUIWebAuthenticateAction *)self request];
      v11 = [v10 account];
      v12 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v43 = v8;
      __int16 v44 = 2114;
      v45 = v9;
      __int16 v46 = 2114;
      v47 = v12;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running cloud authenticate action for account: %{public}@", buf, 0x20u);
    }
    id v13 = [(AMSUIWebAction *)self context];
    v14 = [v13 actionDelegate];
    BOOL v15 = [(AMSUIWebAuthenticateAction *)self pauseTimeouts];
    v16 = [(AMSUIWebAuthenticateAction *)self request];
    v17 = [v14 action:self pauseTimeouts:v15 handleAuthenticateCloudRequest:v16];

    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __39__AMSUIWebAuthenticateAction_runAction__block_invoke;
    v39 = &unk_2643E4790;
    v40 = self;
    v18 = &v36;
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v6 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      v22 = [(AMSUIWebAuthenticateAction *)self request];
      v23 = [v22 account];
      v24 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v43 = v20;
      __int16 v44 = 2114;
      v45 = v21;
      __int16 v46 = 2114;
      v47 = v24;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running authenticate action for account: %{public}@", buf, 0x20u);
    }
    v25 = [(AMSUIWebAction *)self context];
    v26 = [v25 actionDelegate];
    BOOL v27 = [(AMSUIWebAuthenticateAction *)self pauseTimeouts];
    v28 = [(AMSUIWebAuthenticateAction *)self request];
    v17 = [v26 action:self pauseTimeouts:v27 handleAuthenticateRequest:v28];

    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __39__AMSUIWebAuthenticateAction_runAction__block_invoke_57;
    v34 = &unk_2643E47B8;
    id v35 = self;
    v18 = &v31;
  }
  id v29 = objc_msgSend(v17, "thenWithBlock:", v18, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);

  return v29;
}

id __39__AMSUIWebAuthenticateAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 account];
  [v3 _updateContextWithAccountIfNeeded:v5];

  id v6 = (void *)MEMORY[0x263F27E10];
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v4 account];

  v9 = [v7 _responseForAccount:v8];
  v10 = [v6 promiseWithResult:v9];

  return v10;
}

id __39__AMSUIWebAuthenticateAction_runAction__block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 account];
  [v3 _updateContextWithAccountIfNeeded:v5];

  id v6 = (void *)MEMORY[0x263F27E10];
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v4 account];

  v9 = [v7 _responseForAccount:v8];
  v10 = [v6 promiseWithResult:v9];

  return v10;
}

- (void)_updateContextWithAccountIfNeeded:(id)a3
{
  id v10 = a3;
  if ([(AMSUIWebAuthenticateAction *)self makeCurrentAccount]
    || ([(AMSUIWebAction *)self context],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 account],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v10, "web_matchAccount:", v5),
        v5,
        v4,
        v6))
  {
    v7 = [(AMSUIWebAction *)self context];
    uint64_t v8 = [(AMSUIWebAction *)self context];
    v9 = [v8 clientInfo];
    [v7 replaceCurrentAccount:v10 clientInfo:v9];
  }
}

- (id)_responseForAccount:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ams_DSID");
  int v6 = (void *)v5;
  v7 = &unk_26CC736D0;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v14[0] = @"dsid";
  v9 = [v8 stringValue];

  v14[1] = @"account";
  v15[0] = v9;
  id v10 = [(AMSUIWebAction *)self context];
  v11 = [v10 JSAccountFromAccount:v4 store:0];

  v15[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (BOOL)makeCurrentAccount
{
  return self->_makeCurrentAccount;
}

- (void)setMakeCurrentAccount:(BOOL)a3
{
  self->_makeCurrentAccount = a3;
}

- (AMSAuthenticateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (BOOL)pauseTimeouts
{
  return self->_pauseTimeouts;
}

- (void)setPauseTimeouts:(BOOL)a3
{
  self->_pauseTimeouts = a3;
}

- (BOOL)isAuthenticatingCloud
{
  return self->_isAuthenticatingCloud;
}

- (void)setIsAuthenticatingCloud:(BOOL)a3
{
  self->_isAuthenticatingCloud = a3;
}

- (void).cxx_destruct
{
}

@end