@interface AMSPaymentAuthorizationDialogTask
- (AMSBagProtocol)bag;
- (AMSPaymentAuthorizationDialogRequest)request;
- (AMSPaymentAuthorizationDialogTask)initWithRequest:(id)a3 bag:(id)a4;
- (AMSPurchaseInfo)purchaseInfo;
- (NSDictionary)idmsToken;
- (NSString)passwordEquivalentToken;
- (id)perform;
- (void)setBag:(id)a3;
- (void)setIdmsToken:(id)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setPurchaseInfo:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSPaymentAuthorizationDialogTask

- (AMSPaymentAuthorizationDialogTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPaymentAuthorizationDialogTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v10;
}

- (id)perform
{
  objc_initWeak(&location, self);
  v2 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AMSPaymentAuthorizationDialogTask_perform__block_invoke;
  v5[3] = &unk_1E55A0DE8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSMutableLazyPromise *)v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __44__AMSPaymentAuthorizationDialogTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v5 setAllowServerDialogs:1];
  [(AMSAuthenticateOptions *)v5 setAuthenticationType:2];
  [(AMSAuthenticateOptions *)v5 setCanMakeAccountActive:0];
  id v6 = AMSLogKey();
  [(AMSAuthenticateOptions *)v5 setLogKey:v6];

  [(AMSAuthenticateOptions *)v5 setDebugReason:@"[Payment Authorization]"];
  id v7 = [AMSAuthenticateTask alloc];
  id v8 = [WeakRetained request];
  v9 = [v8 account];
  v10 = [(AMSAuthenticateTask *)v7 initWithAccount:v9 options:v5];

  v11 = [(AMSAuthenticateTask *)v10 performAuthentication];
  id v22 = 0;
  objc_super v12 = [v11 resultWithError:&v22];
  id v13 = v22;

  if (v12)
  {
    v14 = [v12 authenticationResults];
    v15 = [v14 valueForKey:*MEMORY[0x1E4F4EDC0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    [WeakRetained setIdmsToken:v16];
    v17 = [v12 authenticationResults];
    v18 = [v17 valueForKey:*MEMORY[0x1E4F4EDE8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    [WeakRetained setPasswordEquivalentToken:v19];
    v20 = objc_alloc_init(AMSPaymentAuthorizationDialogResult);
    v21 = [WeakRetained passwordEquivalentToken];
    [(AMSPaymentSheetResult *)v20 setPasswordEquivalentToken:v21];

    [v3 finishWithResult:v20];
  }
  else
  {
    if (!v13)
    {
      AMSError(0, @"Payment Authorization", @"Unknown Error", 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v3 finishWithError:v13];
  }
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
}

- (NSDictionary)idmsToken
{
  return self->_idmsToken;
}

- (void)setIdmsToken:(id)a3
{
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
}

- (AMSPaymentAuthorizationDialogRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_idmsToken, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end