@interface AMSUIWebSendSMSAction
- (AMSUIWebSendSMSAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)body;
- (NSString)countryCode;
- (NSString)digits;
- (id)runAction;
- (id)telephonyAccessPatterns;
- (void)setBody:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDigits:(id)a3;
@end

@implementation AMSUIWebSendSMSAction

- (AMSUIWebSendSMSAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebSendSMSAction;
  v7 = [(AMSUIWebAction *)&v18 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    body = v7->_body;
    v7->_body = v9;

    v11 = [v6 objectForKeyedSubscript:@"countryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    countryCode = v7->_countryCode;
    v7->_countryCode = v12;

    v14 = [v6 objectForKeyedSubscript:@"digits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    digits = v7->_digits;
    v7->_digits = v15;
  }
  return v7;
}

- (id)telephonyAccessPatterns
{
  v2 = [(AMSUIWebAction *)self context];
  v3 = [v2 bag];
  v4 = [v3 arrayForKey:@"telephony-access-patterns"];
  v5 = [v4 valuePromise];

  return v5;
}

- (id)runAction
{
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebSendSMSAction;
  id v3 = [(AMSUIWebAction *)&v17 runAction];
  v4 = [(AMSUIWebAction *)self context];
  v5 = [v4 webPage];
  id v6 = [v5 webView];
  v7 = [v6 underlyingWebView];
  v8 = [v7 URL];
  v9 = [v8 absoluteString];

  if (v9)
  {
    v10 = [(AMSUIWebSendSMSAction *)self telephonyAccessPatterns];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__AMSUIWebSendSMSAction_runAction__block_invoke;
    v14[3] = &unk_2643E4DF0;
    id v15 = v9;
    v16 = self;
    v11 = [v10 thenWithBlock:v14];
  }
  else
  {
    v12 = (void *)MEMORY[0x263F27E10];
    v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:107 userInfo:0];
    v11 = [v12 promiseWithError:v10];
  }

  return v11;
}

id __34__AMSUIWebSendSMSAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __34__AMSUIWebSendSMSAction_runAction__block_invoke_2;
  v21[3] = &unk_2643E56F8;
  id v22 = *(id *)(a1 + 32);
  if (objc_msgSend(a2, "ams_anyWithTest:", v21))
  {
    v4 = [MEMORY[0x263F7B3F0] sharedController];
    v5 = [*(id *)(a1 + 40) body];
    id v6 = [*(id *)(a1 + 40) digits];
    v7 = [*(id *)(a1 + 40) countryCode];
    id v20 = 0;
    int v8 = [v4 sendSMSWithText:v5 toPhoneNumber:v6 countryCode:v7 error:&v20];
    id v9 = v20;

    v10 = (void *)MEMORY[0x263F27E10];
    if (v8)
    {
      uint64_t v11 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
      goto LABEL_10;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = AMSLogKey();
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v16;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Rejecting webPage: %{public}@", buf, 0x20u);
    }
    objc_super v17 = (void *)MEMORY[0x263F27E10];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:107 userInfo:0];
    v10 = v17;
  }
  uint64_t v11 = [v10 promiseWithError:v9];
LABEL_10:
  objc_super v18 = (void *)v11;

  return v18;
}

BOOL __34__AMSUIWebSendSMSAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08AE8];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithPattern:v4 options:1 error:0];

  BOOL v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", *(void *)(a1 + 32), 0, 0, objc_msgSend(*(id *)(a1 + 32), "length")) != 0x7FFFFFFFFFFFFFFFLL;
  return v6;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end