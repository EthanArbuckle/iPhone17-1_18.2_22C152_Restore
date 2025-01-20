@interface AMSUIWebAuthorizeApplePayEnrollmentAction
- (AMSUIWebAuthorizeApplePayEnrollmentAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)paymentSession;
- (NSNumber)confirmationStyle;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (id)runAction;
- (void)setConfirmationStyle:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPaymentSession:(id)a3;
@end

@implementation AMSUIWebAuthorizeApplePayEnrollmentAction

- (AMSUIWebAuthorizeApplePayEnrollmentAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebAuthorizeApplePayEnrollmentAction;
  v7 = [(AMSUIWebAction *)&v21 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"confirmationStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    confirmationStyle = v7->_confirmationStyle;
    v7->_confirmationStyle = v9;

    v11 = [v6 objectForKeyedSubscript:@"passSerialNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    passSerialNumber = v7->_passSerialNumber;
    v7->_passSerialNumber = v12;

    v14 = [v6 objectForKeyedSubscript:@"passTypeIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    passTypeIdentifier = v7->_passTypeIdentifier;
    v7->_passTypeIdentifier = v15;

    v17 = [v6 objectForKeyedSubscript:@"paymentSession"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    paymentSession = v7->_paymentSession;
    v7->_paymentSession = v18;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)AMSUIWebAuthorizeApplePayEnrollmentAction;
  id v3 = [(AMSUIWebAction *)&v25 runAction];
  v4 = [(AMSUIWebAction *)self context];
  v5 = [v4 bag];

  if ([MEMORY[0x263F27B98] shouldUseExtendedEnrollmentWithBag:v5])
  {
    id v6 = [(AMSUIWebAuthorizeApplePayEnrollmentAction *)self paymentSession];
    if (v6)
    {
      v7 = [v5 stringForKey:@"currentStorefrontCountryCodeISO2A"];
      v8 = [v7 valuePromise];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke;
      v21[3] = &unk_2643E4858;
      id v22 = v5;
      v23 = self;
      id v24 = v6;
      v9 = [v8 thenWithBlock:v21];
    }
    else
    {
      v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v15)
      {
        v15 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        v18 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        v29 = v18;
        _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for bad arguments.", buf, 0x16u);
      }
      v19 = (void *)MEMORY[0x263F27E10];
      v8 = AMSError();
      v9 = [v19 promiseWithError:v8];
    }
  }
  else
  {
    v10 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v10)
    {
      v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v12;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for feature not enabled.", buf, 0x16u);
    }
    v14 = (void *)MEMORY[0x263F27E10];
    id v6 = AMSError();
    v9 = [v14 promiseWithError:v6];
  }

  return v9;
}

id __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F27E10]);
  v5 = [*(id *)(a1 + 32) stringForKey:@"currencyCode"];
  id v6 = [v5 valuePromise];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2;
  v12[3] = &unk_2643E4830;
  v12[4] = *(void *)(a1 + 40);
  id v7 = v4;
  id v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v8 = v3;
  [v6 addFinishBlock:v12];
  v9 = v15;
  id v10 = v7;

  return v10;
}

void __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v7)
  {
    id v7 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v9;
    __int16 v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_21C134000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No currency code, falling back to device locale", buf, 0x16u);
  }
  v11 = [MEMORY[0x263EFF960] currentLocale];
  id v5 = [v11 currencyCode];

  if (v5)
  {
LABEL_7:
    uint64_t v12 = [a1[4] presentingSceneIdentifierPromise];
    id v13 = [a1[4] presentingSceneBundleIdentifierPromise];
    id v14 = (void *)MEMORY[0x263F27E10];
    v32[0] = v12;
    v32[1] = v13;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    v16 = [v14 promiseWithAll:v15];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_37;
    v26[3] = &unk_2643E4808;
    id v17 = a1[6];
    id v18 = a1[4];
    id v27 = v17;
    id v28 = v18;
    id v29 = a1[7];
    id v30 = v5;
    id v31 = a1[5];
    id v19 = v5;
    id v20 = (id)[v16 thenWithBlock:v26];
  }
  else
  {
    objc_super v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v21)
    {
      objc_super v21 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      id v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v23;
      __int16 v35 = 2114;
      v36 = v24;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed for bad arguments.", buf, 0x16u);
    }
    id v25 = a1[5];
    AMSError();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [v25 finishWithError:v19];
  }
}

id __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F27B90];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithPaymentSession:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) confirmationStyle];
  objc_msgSend(v5, "setConfirmationStyle:", objc_msgSend(v6, "integerValue"));

  [v5 setCountryCode:*(void *)(a1 + 48)];
  [v5 setCurrencyCode:*(void *)(a1 + 56)];
  id v7 = [*(id *)(a1 + 40) passSerialNumber];
  [v5 setPassSerialNumber:v7];

  id v8 = [*(id *)(a1 + 40) passTypeIdentifier];
  [v5 setPassTypeIdentifier:v8];

  uint64_t v9 = [v4 objectAtIndexedSubscript:0];
  id v10 = [v9 value];
  [v5 setPresentationSceneIdentifier:v10];

  v11 = [v4 objectAtIndexedSubscript:1];

  uint64_t v12 = [v11 value];
  [v5 setPresentationSceneBundleIdentifier:v12];

  id v13 = [v5 performCardAuthorization];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2_39;
  v17[3] = &unk_2643E47E0;
  id v18 = *(id *)(a1 + 64);
  [v13 addSuccessBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_3;
  v15[3] = &unk_2643E3570;
  id v16 = *(id *)(a1 + 64);
  [v13 addErrorBlock:v15];

  return v13;
}

void __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_2_39(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [a2 token];
  id v4 = [v3 paymentData];

  id v5 = [v4 base64EncodedStringWithOptions:0];
  id v6 = *(void **)(a1 + 32);
  id v8 = @"payment";
  v9[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v6 finishWithResult:v7];
}

uint64_t __54__AMSUIWebAuthorizeApplePayEnrollmentAction_runAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (NSNumber)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSDictionary)paymentSession
{
  return self->_paymentSession;
}

- (void)setPaymentSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_confirmationStyle, 0);
}

@end