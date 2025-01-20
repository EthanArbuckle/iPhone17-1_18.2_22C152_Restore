@interface AMSSetDemoAccountTask
- (ACAccountStore)accountStore;
- (AMSProcessInfo)clientInfo;
- (AMSSetDemoAccountTask)initWithUsername:(id)a3 password:(id)a4;
- (AMSSetDemoAccountTask)initWithUsername:(id)a3 password:(id)a4 accountStore:(id)a5;
- (NSString)password;
- (NSString)username;
- (id)performTask;
- (void)setClientInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AMSSetDemoAccountTask

- (AMSSetDemoAccountTask)initWithUsername:(id)a3 password:(id)a4
{
  return [(AMSSetDemoAccountTask *)self initWithUsername:a3 password:a4 accountStore:0];
}

- (AMSSetDemoAccountTask)initWithUsername:(id)a3 password:(id)a4 accountStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSSetDemoAccountTask;
  v12 = [(AMSTask *)&v17 init];
  if (v12)
  {
    uint64_t v13 = +[AMSProcessInfo currentProcess];
    clientInfo = v12->_clientInfo;
    v12->_clientInfo = (AMSProcessInfo *)v13;

    objc_storeStrong((id *)&v12->_password, a4);
    objc_storeStrong((id *)&v12->_username, a3);
    v15 = v11;
    if (!v11)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    }
    objc_storeStrong((id *)&v12->_accountStore, v15);
    if (!v11) {
  }
    }
  return v12;
}

- (id)performTask
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __36__AMSSetDemoAccountTask_performTask__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = AMSLogKey();
    v6 = NSString;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v7;
    if (v5)
    {
      uint64_t v1 = AMSLogKey();
      [v6 stringWithFormat:@"%@: [%@] ", v8, v1];
    }
    else
    {
      [v6 stringWithFormat:@"%@: ", v7];
    id v9 = };
    id v10 = [*(id *)(a1 + 32) username];
    id v11 = AMSHashIfNeeded(v10);
    v12 = [*(id *)(a1 + 32) clientInfo];
    uint64_t v13 = AMSHashIfNeeded(v12);
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Setting up the demo account. username = %{public}@ | clientInfo = %{public}@", buf, 0x20u);

    if (v5)
    {

      id v9 = (void *)v1;
    }
  }
  v14 = [*(id *)(a1 + 32) accountStore];
  v15 = objc_msgSend(v14, "ams_fetchDemoAccount");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke_7;
  v18[3] = &unk_1E55A0F28;
  v18[4] = *(void *)(a1 + 32);
  v16 = [v15 thenWithBlock:v18];

  return v16;
}

id __36__AMSSetDemoAccountTask_performTask__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = [v4 value];

  if (v5)
  {
    v6 = [v4 value];
    uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = AMSLogKey();
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v2 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v2];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      v15 = AMSHashIfNeeded(v6);
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Removing the existing demo account. existingAccount = %{public}@", buf, 0x16u);
      if (v9)
      {

        uint64_t v13 = (void *)v2;
      }
    }
    v14 = objc_alloc_init(AMSMutableBinaryPromise);
    v16 = [*(id *)(a1 + 32) accountStore];
    objc_super v17 = [(AMSBinaryPromise *)v14 completionHandlerAdapter];
    [v16 removeAccount:v6 withCompletionHandler:v17];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke_9;
    v22[3] = &unk_1E559F028;
    v22[4] = *(void *)(a1 + 32);
    [(AMSBinaryPromise *)v14 addErrorBlock:v22];
  }
  else
  {
    v14 = +[AMSBinaryPromise promiseWithSuccess];
  }
  v18 = [(AMSBinaryPromise *)v14 promiseAdapter];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke_11;
  v21[3] = &unk_1E559F370;
  v21[4] = *(void *)(a1 + 32);
  v19 = [v18 thenWithBlock:v21];

  return v19;
}

void __36__AMSSetDemoAccountTask_performTask__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove the existing demo account. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
}

id __36__AMSSetDemoAccountTask_performTask__block_invoke_11(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(AMSAuthenticateOptions);
  [(AMSAuthenticateOptions *)v2 setAuthenticationType:1];
  id v3 = [*(id *)(a1 + 32) clientInfo];
  [(AMSAuthenticateOptions *)v2 setClientInfo:v3];

  [(AMSAuthenticateOptions *)v2 setDemoAccountSetup:1];
  id v4 = [NSString stringWithCString:"-[AMSSetDemoAccountTask performTask]_block_invoke" encoding:4];
  [(AMSAuthenticateOptions *)v2 setDebugReason:v4];

  v5 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v2];
  v6 = [*(id *)(a1 + 32) password];
  [(AMSAuthenticateTask *)v5 setRawPassword:v6];

  uint64_t v7 = [*(id *)(a1 + 32) username];
  [(AMSAuthenticateTask *)v5 setUsername:v7];

  uint64_t v8 = [(AMSAuthenticateTask *)v5 performAuthentication];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke_2;
  v12[3] = &unk_1E559F028;
  v12[4] = *(void *)(a1 + 32);
  [v8 addErrorBlock:v12];
  uint64_t v9 = [v8 thenWithBlock:&__block_literal_global_117];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__AMSSetDemoAccountTask_performTask__block_invoke_2_17;
  v11[3] = &unk_1E55A6428;
  v11[4] = *(void *)(a1 + 32);
  [v9 addSuccessBlock:v11];

  return v9;
}

void __36__AMSSetDemoAccountTask_performTask__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate the demo account. error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
}

id __36__AMSSetDemoAccountTask_performTask__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 account];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

void __36__AMSSetDemoAccountTask_performTask__block_invoke_2_17(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSHashIfNeeded(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully setup the demo account. account = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end