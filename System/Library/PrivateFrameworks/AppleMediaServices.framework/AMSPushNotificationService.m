@interface AMSPushNotificationService
+ (void)registerAllTokens;
+ (void)registerTokensIfNeeded;
@end

@implementation AMSPushNotificationService

+ (void)registerAllTokens
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v4;
    __int16 v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Refreshing all push tokens", buf, 0x16u);
  }
  v6 = objc_alloc_init(AMSDaemonConnection);
  v7 = [(AMSDaemonConnection *)v6 pushNotificationService];
  id v14 = 0;
  v8 = [v7 resultWithError:&v14];
  id v9 = v14;

  if (v9)
  {
    v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch push service. %{public}@", buf, 0x20u);
    }
  }
  [v8 registerAllTokens];
}

+ (void)registerTokensIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v4;
    __int16 v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Refreshing push token if needed", buf, 0x16u);
  }
  v6 = objc_alloc_init(AMSDaemonConnection);
  v7 = [(AMSDaemonConnection *)v6 pushNotificationService];
  id v14 = 0;
  v8 = [v7 resultWithError:&v14];
  id v9 = v14;

  if (v9)
  {
    v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      v13 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch push service. %{public}@", buf, 0x20u);
    }
  }
  [v8 registerTokensIfNeeded];
}

@end