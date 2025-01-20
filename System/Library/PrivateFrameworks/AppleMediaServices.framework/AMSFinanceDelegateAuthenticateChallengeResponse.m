@interface AMSFinanceDelegateAuthenticateChallengeResponse
+ (BOOL)isDelegateAuthChallengeForTaskInfo:(id)a3;
- (AMSFinanceDelegateAuthenticateChallengeResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4;
- (AMSURLTaskInfo)taskInfo;
- (NSDictionary)responseDictionary;
- (id)performWithTaskInfo:(id)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setTaskInfo:(id)a3;
@end

@implementation AMSFinanceDelegateAuthenticateChallengeResponse

- (AMSFinanceDelegateAuthenticateChallengeResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSFinanceDelegateAuthenticateChallengeResponse;
  v9 = [(AMSFinanceDelegateAuthenticateChallengeResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseDictionary, a3);
    objc_storeStrong((id *)&v10->_taskInfo, a4);
  }

  return v10;
}

+ (BOOL)isDelegateAuthChallengeForTaskInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AMSSetLogKeyIfNeeded();
  v5 = [v3 response];

  v6 = objc_msgSend(v5, "ams_valueForHTTPHeaderField:", @"X-Apple-DelegateAuth-Challenge");

  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v6 != 0];
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v4;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Is delegate auth challenge? %{public}@", (uint8_t *)&v12, 0x20u);
  }
  return v6 != 0;
}

- (id)performWithTaskInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSSetLogKeyIfNeeded();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate auth action not implemented", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end