@interface AMSAccountSignOutService
+ (void)performSignOutTasksInDaemonForAccount:(id)a3;
@end

@implementation AMSAccountSignOutService

+ (void)performSignOutTasksInDaemonForAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedAccountsConfig];
  v6 = (AMSDaemonConnection *)v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [(AMSDaemonConnection *)v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      v19 = v9;
      __int16 v20 = 2114;
      id v21 = v4;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Performing sign-out tasks for: %{public}@", buf, 0x20u);
    }
    v6 = objc_alloc_init(AMSDaemonConnection);
    v10 = [(AMSDaemonConnection *)v6 accountSignOutServiceProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__AMSAccountSignOutService_performSignOutTasksInDaemonForAccount___block_invoke;
    v13[3] = &unk_1E559EB08;
    id v15 = a1;
    id v14 = v4;
    [v10 addFinishBlock:v13];
  }
  else
  {
    if (!v5)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v10 = [(AMSDaemonConnection *)v6 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Failed to perform sign-out tasks", buf, 0x16u);
    }
  }
}

void __66__AMSAccountSignOutService_performSignOutTasksInDaemonForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      int v10 = 138543874;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Failed to connect to daemon: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    [a2 performAccountSignOutTasksForAccountWithID:*(void *)(a1 + 32)];
  }
}

@end