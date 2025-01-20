@interface AMSUIWebFetchTreatmentOverridesAction
- (id)runAction;
@end

@implementation AMSUIWebFetchTreatmentOverridesAction

- (id)runAction
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebFetchTreatmentOverridesAction;
  id v2 = [(AMSUIWebAction *)&v12 runAction];
  v3 = [MEMORY[0x263F27BE0] treatmentOverrides];
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
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v6;
    __int16 v17 = 2114;
    v18 = v7;
    __int16 v19 = 2114;
    v20 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching treatment overrides (value: %{public}@)", buf, 0x20u);
  }
  v8 = (void *)MEMORY[0x263F27E10];
  v13 = @"treatmentOverrides";
  v14 = v3;
  v9 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v10 = [v8 promiseWithResult:v9];

  return v10;
}

@end