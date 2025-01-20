@interface AMSUIDelegateTokenTask
- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 presentingViewController:(id)a5;
- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 processInfo:(id)a5 presentingViewController:(id)a6;
- (UIViewController)presentingViewController;
- (id)authenticateTaskWithRequest:(id)a3;
- (id)perform;
@end

@implementation AMSUIDelegateTokenTask

- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 presentingViewController:(id)a5
{
  v8 = (void *)MEMORY[0x263F27E08];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 currentProcess];
  v13 = [(AMSUIDelegateTokenTask *)self initWithDelegateAuthenticateRequest:v11 account:v10 processInfo:v12 presentingViewController:v9];

  return v13;
}

- (AMSUIDelegateTokenTask)initWithDelegateAuthenticateRequest:(id)a3 account:(id)a4 processInfo:(id)a5 presentingViewController:(id)a6
{
  id v21 = a6;
  id v11 = (void *)MEMORY[0x263F27B28];
  v12 = (void *)MEMORY[0x263F27BF0];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [v12 bagSubProfile];
  v17 = [MEMORY[0x263F27BF0] bagSubProfileVersion];
  v18 = [v11 bagForProfile:v16 profileVersion:v17];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIDelegateTokenTask;
  v19 = [(AMSDelegateTokenTask *)&v22 initWithDelegateAuthenticateRequest:v15 bag:v18 processInfo:v13 account:v14];

  if (v19) {
    objc_storeStrong((id *)&v19->_presentingViewController, a6);
  }

  return v19;
}

- (id)perform
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__AMSUIDelegateTokenTask_perform__block_invoke;
  v4[3] = &unk_2643E3258;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __33__AMSUIDelegateTokenTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F27CB8] sharedAccountsMultiUserConfig];
  if (!v2)
  {
    v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    v6 = [*(id *)(a1 + 32) account];
    v7 = AMSHashIfNeeded();
    int v10 = 138543874;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving delegate authentication token. Account = %{public}@", (uint8_t *)&v10, 0x20u);
  }
  v8 = [*(id *)(a1 + 32) performRetrieveDelegateToken];
  return v8;
}

- (id)authenticateTaskWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [AMSUIAuthenticateTask alloc];
  v6 = [(AMSUIDelegateTokenTask *)self presentingViewController];
  v7 = [(AMSUIAuthenticateTask *)v5 initWithRequest:v4 presentingViewController:v6];

  return v7;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void).cxx_destruct
{
}

@end