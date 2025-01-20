@interface AMSUIWebPresentPrivacySplashAction
- (AMSUIWebPresentPrivacySplashAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)privacyIdentifier;
- (id)runAction;
- (void)setPrivacyIdentifier:(id)a3;
@end

@implementation AMSUIWebPresentPrivacySplashAction

- (AMSUIWebPresentPrivacySplashAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPresentPrivacySplashAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"privacyIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    privacyIdentifier = v7->_privacyIdentifier;
    v7->_privacyIdentifier = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebPresentPrivacySplashAction;
  id v3 = [(AMSUIWebAction *)&v22 runAction];
  v4 = [(AMSUIWebPresentPrivacySplashAction *)self privacyIdentifier];

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
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v8;
      __int16 v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting OBPrivacyPresenter", buf, 0x16u);
    }
    id v10 = objc_alloc_init(MEMORY[0x263F27E10]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke;
    v20[3] = &unk_2643E34D0;
    v20[4] = self;
    id v11 = v10;
    id v21 = v11;
    dispatch_async(MEMORY[0x263EF83A0], v20);
    objc_super v12 = v21;
    id v13 = v11;

    v14 = v13;
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v15 = [v6 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No privacyIdentifier found", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = [v18 promiseWithError:v13];
  }

  return v14;
}

void __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F5B8F8];
  id v3 = [*(id *)(a1 + 32) privacyIdentifier];
  v4 = [v2 presenterForPrivacySplashWithIdentifier:v3];

  uint64_t v5 = [*(id *)(a1 + 32) context];
  id v6 = [v5 flowController];
  v7 = [v6 currentContainer];
  [v4 setPresentingViewController:v7];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke_2;
  objc_super v12 = &unk_2643E34D0;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v8;
  [v4 setDismissHandler:&v9];
  objc_msgSend(v4, "present", v9, v10, v11, v12, v13);
}

void __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F27AE0];
  id v3 = [*(id *)(a1 + 32) privacyIdentifier];
  uint64_t v4 = [v2 acknowledgementNeededForPrivacyIdentifier:v3] ^ 1;

  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v8 = @"acknowledged";
  id v6 = [NSNumber numberWithBool:v4];
  v9[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v5 finishWithResult:v7];
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
}

@end