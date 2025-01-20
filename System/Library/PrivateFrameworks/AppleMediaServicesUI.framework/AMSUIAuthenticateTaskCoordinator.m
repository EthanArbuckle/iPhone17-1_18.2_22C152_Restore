@interface AMSUIAuthenticateTaskCoordinator
- (id)_authenticateTaskForItem:(id)a3;
- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4;
- (id)handleRequest:(id)a3 presentingViewController:(id)a4;
@end

@implementation AMSUIAuthenticateTaskCoordinator

- (id)handleRequest:(id)a3 presentingViewController:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v22[0] = @"AMSAuthenticateTaskCoordinatorItemKeyRequest";
    v22[1] = @"AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController";
    v23[0] = v6;
    v23[1] = v7;
    v9 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    uint64_t v10 = [(AMSAuthenticateTaskCoordinator *)self handleRequestDictionary:v9];
  }
  else
  {
    v11 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v11)
    {
      v11 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = AMSLogKey();
      v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        AMSLogKey();
        self = (AMSUIAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"%@: [%@] ", v16, self];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      v17 = };
      v18 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Missing a required parameter, unable to process the authenticate request. request = %{public}@ presentingViewController = %{public}@", buf, 0x20u);
      if (v13)
      {

        v17 = self;
      }
    }
    v19 = (void *)MEMORY[0x263F27E10];
    v9 = AMSError();
    uint64_t v10 = [v19 promiseWithError:v9];
  }
  v20 = (void *)v10;

  return v20;
}

- (id)_authenticateTaskForItem:(id)a3 authenticationResults:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyRequest"];
  v8 = [v7 options];
  v9 = [v6 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController"];

  uint64_t v10 = [[AMSUIAuthenticateTask alloc] initWithAuthenticationResults:v5 presentingViewController:v9 options:v8];
  return v10;
}

- (id)_authenticateTaskForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyRequest"];
  id v5 = [v3 objectForKeyedSubscript:@"AMSAuthenticateTaskCoordinatorItemKeyPresentingViewController"];

  id v6 = [[AMSUIAuthenticateTask alloc] initWithRequest:v4 presentingViewController:v5];
  return v6;
}

@end