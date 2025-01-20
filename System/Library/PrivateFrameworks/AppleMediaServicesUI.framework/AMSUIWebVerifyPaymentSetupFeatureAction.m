@interface AMSUIWebVerifyPaymentSetupFeatureAction
- (AMSUIWebVerifyPaymentSetupFeatureAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)referrerIdentifier;
- (id)_checkCombinedAccount;
- (id)_checkUpsellCardEnrollment;
- (id)runAction;
- (void)setReferrerIdentifier:(id)a3;
@end

@implementation AMSUIWebVerifyPaymentSetupFeatureAction

- (AMSUIWebVerifyPaymentSetupFeatureAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPaymentSetupFeatureAction;
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebVerifyPaymentSetupFeatureAction;
  id v3 = [(AMSUIWebAction *)&v19 runAction];
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
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verifying payment setup.", buf, 0x16u);
  }
  v8 = (void *)MEMORY[0x263F27B58];
  v9 = [(AMSUIWebVerifyPaymentSetupFeatureAction *)self _checkUpsellCardEnrollment];
  v20[0] = v9;
  v10 = [(AMSUIWebVerifyPaymentSetupFeatureAction *)self _checkCombinedAccount];
  v20[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  objc_super v12 = [v8 promiseWithAll:v11];

  v13 = [v12 promiseAdapter];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke;
  v18[3] = &unk_2643E3B40;
  v18[4] = self;
  v14 = [v13 thenWithBlock:v18];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_3;
  v17[3] = &unk_2643E4E88;
  v17[4] = self;
  [v14 addSuccessBlock:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_16;
  v16[3] = &unk_2643E3570;
  v16[4] = self;
  [v14 addErrorBlock:v16];

  return v14;
}

id __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27DF0]);
  id v3 = [*(id *)(a1 + 32) referrerIdentifier];
  v4 = (void *)[v2 initWithIdentifier:v3];

  v5 = [v4 performPaymentSetupFeatureLookup];
  uint64_t v6 = [v5 thenWithBlock:&__block_literal_global_33];

  return v6;
}

id __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F27E10];
  v7 = @"supported";
  id v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "state") == 1);
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 promiseWithResult:v4];

  return v5;
}

void __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verified payment setup: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __52__AMSUIWebVerifyPaymentSetupFeatureAction_runAction__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = AMSLogableError();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify payment setup: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_checkCombinedAccount
{
  id v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  int v3 = objc_msgSend(v2, "ams_isActiveAccountCombined");

  v4 = (void *)MEMORY[0x263F27B58];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263F27B58] promiseWithSuccess];
  }
  else
  {
    uint64_t v6 = AMSError();
    uint64_t v5 = [v4 promiseWithError:v6];
  }
  return v5;
}

- (id)_checkUpsellCardEnrollment
{
  id v3 = objc_alloc_init(MEMORY[0x263F27B58]);
  v4 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__AMSUIWebVerifyPaymentSetupFeatureAction__checkUpsellCardEnrollment__block_invoke;
  v9[3] = &unk_2643E34D0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_async(v4, v9);

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __69__AMSUIWebVerifyPaymentSetupFeatureAction__checkUpsellCardEnrollment__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  id v6 = [v2 bag];

  int v3 = [MEMORY[0x263F27B98] shouldUseUpsellEnrollmentWithBag:v6];
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    [v4 finishWithSuccess];
  }
  else
  {
    id v5 = AMSError();
    [v4 finishWithError:v5];
  }
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