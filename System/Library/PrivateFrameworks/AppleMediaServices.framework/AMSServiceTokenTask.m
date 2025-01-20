@interface AMSServiceTokenTask
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (AMSServiceTokenTask)initWithAccount:(id)a3 accountStore:(id)a4 serviceIdentifier:(id)a5 useCachedServiceToken:(BOOL)a6;
- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4;
- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4 useCachedServiceToken:(BOOL)a5;
- (BOOL)useCachedServiceToken;
- (Class)authKitUpdateTaskClass;
- (NSString)serviceIdentifier;
- (id)_authKitUpdateTask;
- (id)perform;
- (void)setAuthKitUpdateTaskClass:(Class)a3;
@end

@implementation AMSServiceTokenTask

- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4
{
  return [(AMSServiceTokenTask *)self initWithAccount:a3 serviceIdentifier:a4 useCachedServiceToken:1];
}

- (AMSServiceTokenTask)initWithAccount:(id)a3 serviceIdentifier:(id)a4 useCachedServiceToken:(BOOL)a5
{
  return [(AMSServiceTokenTask *)self initWithAccount:a3 accountStore:0 serviceIdentifier:a4 useCachedServiceToken:a5];
}

- (AMSServiceTokenTask)initWithAccount:(id)a3 accountStore:(id)a4 serviceIdentifier:(id)a5 useCachedServiceToken:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AMSServiceTokenTask;
  v14 = [(AMSTask *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a3);
    v16 = v12;
    if (!v12)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    }
    objc_storeStrong((id *)&v15->_accountStore, v16);
    if (!v12) {

    }
    uint64_t v17 = objc_opt_class();
    Class authKitUpdateTaskClass = v15->_authKitUpdateTaskClass;
    v15->_Class authKitUpdateTaskClass = (Class)v17;

    uint64_t v19 = [v13 copy];
    serviceIdentifier = v15->_serviceIdentifier;
    v15->_serviceIdentifier = (NSString *)v19;

    v15->_useCachedServiceToken = a6;
  }

  return v15;
}

- (id)_authKitUpdateTask
{
  v3 = objc_alloc_init(AMSAuthenticateOptions);
  v4 = [(AMSServiceTokenTask *)self serviceIdentifier];
  [(AMSAuthenticateOptions *)v3 setServiceIdentifier:v4];

  [(AMSAuthenticateOptions *)v3 setServiceTokenOnly:1];
  id v5 = objc_alloc([(AMSServiceTokenTask *)self authKitUpdateTaskClass]);
  v6 = [(AMSServiceTokenTask *)self account];
  v7 = (void *)[v5 initWithAccount:v6 options:v3];

  return v7;
}

- (id)perform
{
  if ([(AMSServiceTokenTask *)self useCachedServiceToken])
  {
    v3 = [(AMSServiceTokenTask *)self accountStore];
    v4 = [(AMSServiceTokenTask *)self account];
    id v5 = [(AMSServiceTokenTask *)self serviceIdentifier];
    v6 = objc_msgSend(v3, "ams_fetchGrandSlamTokenForAccount:withIdentifier:", v4, v5);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__AMSServiceTokenTask_perform__block_invoke;
    v12[3] = &unk_1E55A3FB8;
    v12[4] = self;
    v7 = [v6 continueWithBlock:v12];
  }
  else
  {
    v8 = +[AMSOptional optionalWithNil];
    v7 = +[AMSPromise promiseWithResult:v8];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__AMSServiceTokenTask_perform__block_invoke_11;
  v11[3] = &unk_1E55A0F28;
  v11[4] = self;
  v9 = [v7 thenWithBlock:v11];

  return v9;
}

id __30__AMSServiceTokenTask_perform__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (objc_msgSend(v7, "ams_hasDomain:code:", @"AMSErrorDomain", 7))
  {
    v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = AMSLogKey();
      id v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        uint64_t v3 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, v3];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      v14 = };
      v23 = [*(id *)(a1 + 32) serviceIdentifier];
      v24 = AMSHashIfNeeded(v23);
      v25 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543874;
      v33 = v14;
      __int16 v34 = 2114;
      v35 = v24;
      __int16 v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@No cached service token found for identifier: %{public}@ | error = %{public}@", buf, 0x20u);

      if (v10)
      {

        v14 = (void *)v3;
      }
    }
    uint64_t v22 = +[AMSOptional optionalWithNil];
    goto LABEL_19;
  }
  if (!v7)
  {
    uint64_t v22 = +[AMSOptional optionalWithValue:v6];
LABEL_19:
    v26 = (void *)v22;
    v27 = +[AMSPromise promiseWithResult:v22];

    goto LABEL_25;
  }
  v15 = +[AMSLogConfig sharedAccountsConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = AMSLogKey();
    v18 = NSString;
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = v19;
    if (v17)
    {
      uint64_t v3 = AMSLogKey();
      [v18 stringWithFormat:@"%@: [%@] ", v20, v3];
    }
    else
    {
      [v18 stringWithFormat:@"%@: ", v19];
    v21 = };
    v28 = [*(id *)(a1 + 32) serviceIdentifier];
    v29 = AMSHashIfNeeded(v28);
    v30 = AMSLogableError(v7);
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    __int16 v34 = 2114;
    v35 = v29;
    __int16 v36 = 2114;
    v37 = v30;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cached service token for identifier: %{public}@ | error = %{public}@", buf, 0x20u);

    if (v17)
    {

      v21 = (void *)v3;
    }
  }
  v27 = +[AMSPromise promiseWithError:v7];
LABEL_25:

  return v27;
}

id __30__AMSServiceTokenTask_perform__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 value];

  if (v4)
  {
    id v5 = [v3 value];
    id v6 = +[AMSPromise promiseWithResult:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _authKitUpdateTask];
    id v7 = [v5 performAuthKitUpdate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__AMSServiceTokenTask_perform__block_invoke_2;
    v9[3] = &unk_1E55A63E0;
    v9[4] = *(void *)(a1 + 32);
    id v6 = [v7 thenWithBlock:v9];
  }
  return v6;
}

id __30__AMSServiceTokenTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 authenticationResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [*(id *)(a1 + 32) serviceIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = +[AMSPromise promiseWithResult:v7];
  }
  else
  {
    v9 = AMSError(101, @"Unknown AuthKit Failure", @"The AuthKit authentication succeeded, but the results did not contain a service token.", 0);
    v8 = +[AMSPromise promiseWithError:v9];
  }
  return v8;
}

- (ACAccount)account
{
  return self->_account;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)useCachedServiceToken
{
  return self->_useCachedServiceToken;
}

- (Class)authKitUpdateTaskClass
{
  return self->_authKitUpdateTaskClass;
}

- (void)setAuthKitUpdateTaskClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authKitUpdateTaskClass, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end