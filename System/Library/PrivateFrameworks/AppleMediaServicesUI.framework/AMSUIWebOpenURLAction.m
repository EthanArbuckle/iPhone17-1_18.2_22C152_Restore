@interface AMSUIWebOpenURLAction
+ (id)_openIgnoringOverrides:(id)a3;
+ (id)_openUniversalLink:(id)a3;
- (AMSUIWebOpenURLAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSURL)URL;
- (id)runAction;
- (int64_t)type;
- (void)setType:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation AMSUIWebOpenURLAction

- (AMSUIWebOpenURLAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebOpenURLAction;
  v7 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:a4];
  v8 = v7;
  if (v7)
  {
    v7->_uint64_t type = 0;
    v9 = [v6 objectForKeyedSubscript:@"appLink"];
    if (objc_opt_respondsToSelector())
    {
      v10 = [v6 objectForKeyedSubscript:@"appLink"];
      int v11 = [v10 BOOLValue];

      if (v11) {
        v8->_uint64_t type = 1;
      }
    }
    else
    {
    }
    v12 = [v6 objectForKeyedSubscript:@"type"];
    if (v12)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t type = [v12 longLongValue];
      }
      else {
        uint64_t type = v8->_type;
      }
      v8->_uint64_t type = type;
    }
    v14 = [v6 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (v15)
    {
      v16 = [NSURL URLWithString:v15];
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong((id *)&v8->_URL, v16);
    if (v15) {
  }
    }
  return v8;
}

- (id)runAction
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)AMSUIWebOpenURLAction;
  id v3 = [(AMSUIWebAction *)&v32 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    v8 = [(AMSUIWebOpenURLAction *)self URL];
    v9 = AMSLogableURL();
    int64_t v10 = [(AMSUIWebOpenURLAction *)self type];
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = v6;
    __int16 v35 = 2114;
    v36 = v7;
    __int16 v37 = 2114;
    v38 = v9;
    __int16 v39 = 2048;
    int64_t v40 = v10;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening URL: %{public}@ type: %ld", buf, 0x2Au);
  }
  int v11 = [(AMSUIWebOpenURLAction *)self URL];

  if (v11)
  {
    switch([(AMSUIWebOpenURLAction *)self type])
    {
      case 0:
        goto LABEL_19;
      case 1:
        v12 = (void *)MEMORY[0x263F27DC8];
        v13 = [(AMSUIWebOpenURLAction *)self URL];
        v14 = [(AMSUIWebAction *)self context];
        id v15 = [v14 clientInfo];
        v16 = [(AMSUIWebAction *)self context];
        v17 = [v16 bag];
        objc_super v18 = [v12 openURL:v13 clientInfo:v15 bag:v17];

        goto LABEL_12;
      case 2:
        v20 = objc_opt_class();
        v13 = [(AMSUIWebOpenURLAction *)self URL];
        uint64_t v21 = [v20 _openUniversalLink:v13];
        goto LABEL_11;
      case 3:
        v22 = objc_opt_class();
        v13 = [(AMSUIWebOpenURLAction *)self URL];
        uint64_t v21 = [v22 _openIgnoringOverrides:v13];
LABEL_11:
        objc_super v18 = (void *)v21;
LABEL_12:

        if (!v18) {
          goto LABEL_19;
        }
        v23 = [v18 promiseAdapter];

        break;
      default:
        v24 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v24)
        {
          v24 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = objc_opt_class();
          v27 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v26;
          __int16 v35 = 2114;
          v36 = v27;
          _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle unknown type", buf, 0x16u);
        }
LABEL_19:
        v28 = (void *)MEMORY[0x263F27DC8];
        v29 = [(AMSUIWebOpenURLAction *)self URL];
        LODWORD(v28) = [v28 openStandardURL:v29];

        v19 = (void *)MEMORY[0x263F27E10];
        if (!v28) {
          goto LABEL_21;
        }
        v23 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
        break;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x263F27E10];
LABEL_21:
    v30 = AMSError();
    v23 = [v19 promiseWithError:v30];
  }
  return v23;
}

+ (id)_openUniversalLink:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    v20 = v7;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening universal link: %@", buf, 0x20u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263F27B58]);
  v9 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v15 = *MEMORY[0x263F83378];
  uint64_t v16 = MEMORY[0x263EFFA88];
  int64_t v10 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__AMSUIWebOpenURLAction__openUniversalLink___block_invoke;
  v13[3] = &unk_2643E4568;
  id v11 = v8;
  id v14 = v11;
  [v9 openURL:v3 options:v10 completionHandler:v13];

  return v11;
}

void __44__AMSUIWebOpenURLAction__openUniversalLink___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithSuccess];
  }
  else
  {
    AMSError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v4];
  }
}

+ (id)_openIgnoringOverrides:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = objc_opt_new();
  [v5 setAllowURLOverrides:0];
  [v5 setIgnoreAppLinkEnabledProperty:1];
  uint64_t v6 = [MEMORY[0x263F01880] defaultWorkspace];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__AMSUIWebOpenURLAction__openIgnoringOverrides___block_invoke;
  v9[3] = &unk_2643E4880;
  id v7 = v4;
  id v10 = v7;
  [v6 openURL:v3 configuration:v5 completionHandler:v9];

  return v7;
}

void __48__AMSUIWebOpenURLAction__openIgnoringOverrides___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3)
  {
    AMSError();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishWithError:v5];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 finishWithSuccess];
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_uint64_t type = a3;
}

- (void).cxx_destruct
{
}

@end