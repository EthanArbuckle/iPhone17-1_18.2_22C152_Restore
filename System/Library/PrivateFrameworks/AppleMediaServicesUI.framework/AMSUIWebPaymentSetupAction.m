@interface AMSUIWebPaymentSetupAction
- (AMSUIWebPaymentSetupAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)referrerIdentifier;
- (id)runAction;
- (void)setReferrerIdentifier:(id)a3;
@end

@implementation AMSUIWebPaymentSetupAction

- (AMSUIWebPaymentSetupAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPaymentSetupAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"referrerIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    referrerIdentifier = v7->_referrerIdentifier;
    v7->_referrerIdentifier = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)AMSUIWebPaymentSetupAction;
  id v3 = [(AMSUIWebAction *)&v33 runAction];
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
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v6;
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Started running.", buf, 0x16u);
  }
  v8 = [(AMSUIWebAction *)self context];
  v9 = [v8 bag];

  if ([MEMORY[0x263F27B98] shouldUseUpsellEnrollmentWithBag:v9])
  {
    v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    char v11 = objc_msgSend(v10, "ams_isActiveAccountCombined");

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x263F27E10]);
      v13 = [(AMSUIWebAction *)self context];
      v14 = [v13 flowController];
      v15 = [v14 currentContainer];

      v16 = [AMSUIPaymentSetupTask alloc];
      v17 = [(AMSUIWebPaymentSetupAction *)self referrerIdentifier];
      v18 = [(AMSUIPaymentSetupTask *)v16 initWithReferrerIdentifier:v17 presentingViewController:v15];

      v19 = [(AMSUIPaymentSetupTask *)v18 present];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __39__AMSUIWebPaymentSetupAction_runAction__block_invoke;
      v31[3] = &unk_2643E39B8;
      v31[4] = self;
      id v20 = v12;
      id v32 = v20;
      [v19 addFinishBlock:v31];
      v21 = v32;
      id v22 = v20;

      goto LABEL_18;
    }
    v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v23)
    {
      v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = objc_opt_class();
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v27;
      __int16 v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for no combined account.", buf, 0x16u);
    }
  }
  else
  {
    v23 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v23)
    {
      v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      v26 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v25;
      __int16 v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);
    }
  }

  v29 = (void *)MEMORY[0x263F27E10];
  v15 = AMSError();
  id v22 = [v29 promiseWithError:v15];
LABEL_18:

  return v22;
}

void __39__AMSUIWebPaymentSetupAction_runAction__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    v8 = (void *)v7;
    v9 = @"unsuccessfully";
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    if (a2) {
      v9 = @"successfully";
    }
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished %{public}@.", buf, 0x20u);
  }
  v10 = *(void **)(a1 + 40);
  char v11 = objc_msgSend(NSNumber, "numberWithBool:", a2, @"success");
  v14 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v10 finishWithResult:v12];
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end