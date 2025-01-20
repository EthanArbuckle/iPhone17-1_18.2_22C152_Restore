@interface AMSUIWebSynchronizeTreatmentsAction
- (id)runAction;
@end

@implementation AMSUIWebSynchronizeTreatmentsAction

- (id)runAction
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebSynchronizeTreatmentsAction;
  id v3 = [(AMSUIWebAction *)&v15 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Synchronizing treatments", buf, 0x16u);
  }
  v8 = [MEMORY[0x263F27EC0] defaultTreatmentStore];
  v9 = [v8 synchronizeTreatments];
  v10 = [v9 promiseAdapter];
  v11 = [v10 thenWithBlock:&__block_literal_global_31];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__AMSUIWebSynchronizeTreatmentsAction_runAction__block_invoke_2;
  v14[3] = &unk_2643E3570;
  v14[4] = self;
  [v11 addErrorBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__AMSUIWebSynchronizeTreatmentsAction_runAction__block_invoke_6;
  v13[3] = &unk_2643E4E88;
  v13[4] = self;
  [v11 addSuccessBlock:v13];
  return v11;
}

id __48__AMSUIWebSynchronizeTreatmentsAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F27E10];
  v8 = @"success";
  v9[0] = a2;
  id v3 = NSDictionary;
  id v4 = a2;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v2 promiseWithResult:v5];

  return v6;
}

void __48__AMSUIWebSynchronizeTreatmentsAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    v7 = AMSHashIfNeeded();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failure (error: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
}

void __48__AMSUIWebSynchronizeTreatmentsAction_runAction__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success (result: %{public}@)", (uint8_t *)&v7, 0x20u);
  }
}

@end