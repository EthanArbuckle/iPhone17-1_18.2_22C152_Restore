@interface AMSPushRegisterTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6;
- (NSData)token;
- (NSString)environment;
- (id)performTask;
- (void)_updateStorageWithResult:(id)a3 storage:(id)a4;
@end

@implementation AMSPushRegisterTask

- (AMSPushRegisterTask)initWithAccount:(id)a3 token:(id)a4 environment:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSPushRegisterTask;
  v15 = [(AMSTask *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    uint64_t v17 = [v12 copy];
    token = v16->_token;
    v16->_token = (NSData *)v17;

    uint64_t v19 = [v13 copy];
    environment = v16->_environment;
    v16->_environment = (NSString *)v19;

    objc_storeStrong((id *)&v16->_bag, a6);
  }

  return v16;
}

- (id)performTask
{
  v3 = [(AMSPushRegisterTask *)self environment];

  if (v3)
  {
    v4 = [(AMSPushRegisterTask *)self token];

    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __34__AMSPushRegisterTask_performTask__block_invoke;
      v10[3] = &unk_1E559EA38;
      v10[4] = self;
      v9.receiver = self;
      v9.super_class = (Class)AMSPushRegisterTask;
      v5 = [(AMSTask *)&v9 performTaskWithPromiseBlock:v10];
      goto LABEL_7;
    }
    v6 = @"Missing Token";
  }
  else
  {
    v6 = @"Missing Environment";
  }
  v7 = AMSError(2, v6, 0, 0);
  v5 = +[AMSPromise promiseWithError:v7];

LABEL_7:
  return v5;
}

id __34__AMSPushRegisterTask_performTask__block_invoke(uint64_t a1)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v23[0] = @"environment";
  v3 = [*(id *)(a1 + 32) environment];
  v24[0] = v3;
  v23[1] = @"token";
  v4 = [*(id *)(a1 + 32) token];
  v24[1] = v4;
  v23[2] = @"guid";
  v5 = +[AMSDevice deviceGUID];
  v24[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v7 = (void *)[v2 initWithDictionary:v6];

  v8 = +[AMSDevice deviceName];
  objc_super v9 = [v8 dataUsingEncoding:4 allowLossyConversion:1];
  [v7 setObject:v9 forKeyedSubscript:@"device-name-data"];

  v10 = +[AMSDevice serialNumber];
  [v7 setObject:v10 forKeyedSubscript:@"serial-number"];

  id v11 = [*(id *)(a1 + 32) bag];
  id v12 = [*(id *)(a1 + 32) account];
  id v13 = [v11 URLForKey:@"push-notifications/register-success" account:v12];

  id v14 = [AMSURLRequestEncoder alloc];
  v15 = [*(id *)(a1 + 32) bag];
  v16 = [(AMSURLRequestEncoder *)v14 initWithBag:v15];

  [(AMSURLRequestEncoder *)v16 setRequestEncoding:2];
  uint64_t v17 = [*(id *)(a1 + 32) account];
  [(AMSURLRequestEncoder *)v16 setAccount:v17];

  v18 = [(AMSURLRequestEncoder *)v16 requestWithMethod:4 bagURL:v13 parameters:v7];
  uint64_t v19 = +[AMSURLSession defaultSession];
  v20 = [v19 dataTaskPromiseWithRequestPromise:v18];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __34__AMSPushRegisterTask_performTask__block_invoke_2;
  v22[3] = &unk_1E55A39E0;
  v22[4] = *(void *)(a1 + 32);
  [v20 addSuccessBlock:v22];

  return v20;
}

void __34__AMSPushRegisterTask_performTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
  [v2 _updateStorageWithResult:v3 storage:v4];
}

- (void)_updateStorageWithResult:(id)a3 storage:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7)
    {
      v8 = [v7 objectForKeyedSubscript:@"status"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;

        if (v9)
        {
          if ([v9 integerValue])
          {
            v10 = +[AMSLogConfig sharedAccountsConfig];
            if (!v10)
            {
              v10 = +[AMSLogConfig sharedConfig];
            }
            id v11 = [v10 OSLogObject];
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              goto LABEL_42;
            }
            uint64_t v12 = objc_opt_class();
            id v13 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v31 = v12;
            __int16 v32 = 2114;
            v33 = v13;
            _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Status is not 0, cannot use response", buf, 0x16u);
          }
          else
          {
            v18 = [v7 objectForKeyedSubscript:@"lasset"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v11 = v18;
            }
            else {
              id v11 = 0;
            }

            uint64_t v19 = +[AMSLogConfig sharedAccountsConfig];
            if (!v19)
            {
              uint64_t v19 = +[AMSLogConfig sharedConfig];
            }
            v20 = [v19 OSLogObject];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = objc_opt_class();
              objc_super v22 = AMSLogKey();
              *(_DWORD *)buf = 138543874;
              uint64_t v31 = v21;
              __int16 v32 = 2114;
              v33 = v22;
              __int16 v34 = 2114;
              v35 = v11;
              _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: lasset received %{public}@", buf, 0x20u);
            }
            if (v11)
            {
              id v29 = 0;
              [v5 setIsLasset:v11 error:&v29];
              v10 = v29;
              if (!v10)
              {
LABEL_42:

                goto LABEL_43;
              }
              id v13 = +[AMSLogConfig sharedAccountsConfig];
              if (!v13)
              {
                id v13 = +[AMSLogConfig sharedConfig];
              }
              v23 = [v13 OSLogObject];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = objc_opt_class();
                v25 = AMSLogKey();
                v26 = AMSLogableError(v10);
                *(_DWORD *)buf = 138543874;
                uint64_t v31 = v24;
                __int16 v32 = 2114;
                v33 = v25;
                __int16 v34 = 2114;
                v35 = v26;
                _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: failed to update lasset value, %{public}@", buf, 0x20u);
              }
            }
            else
            {
              id v13 = +[AMSLogConfig sharedAccountsConfig];
              if (!v13)
              {
                id v13 = +[AMSLogConfig sharedConfig];
              }
              v23 = [v13 OSLogObject];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = objc_opt_class();
                v28 = AMSLogKey();
                *(_DWORD *)buf = 138543618;
                uint64_t v31 = v27;
                __int16 v32 = 2114;
                v33 = v28;
                _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No lasset, keeping current", buf, 0x16u);
              }
              v10 = 0;
            }
          }
          goto LABEL_42;
        }
      }
      else
      {
      }
      v10 = +[AMSLogConfig sharedAccountsConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v16;
        __int16 v32 = 2114;
        v33 = v17;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No status, cannot update", buf, 0x16u);
      }
      id v9 = 0;
      goto LABEL_42;
    }
  }
  else
  {
  }
  id v9 = +[AMSLogConfig sharedAccountsConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: No response content", buf, 0x16u);
  }
  id v7 = 0;
LABEL_43:
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end