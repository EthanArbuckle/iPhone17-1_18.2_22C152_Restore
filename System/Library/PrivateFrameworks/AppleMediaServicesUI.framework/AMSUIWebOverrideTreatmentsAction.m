@interface AMSUIWebOverrideTreatmentsAction
- (AMSUIWebOverrideTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)treatmentOverrides;
- (id)runAction;
- (void)setTreatmentOverrides:(id)a3;
@end

@implementation AMSUIWebOverrideTreatmentsAction

- (AMSUIWebOverrideTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOverrideTreatmentsAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"treatmentOverrides"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    treatmentOverrides = v7->_treatmentOverrides;
    v7->_treatmentOverrides = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebOverrideTreatmentsAction;
  id v3 = [(AMSUIWebAction *)&v13 runAction];
  v4 = [(AMSUIWebOverrideTreatmentsAction *)self treatmentOverrides];
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding treatments (value: %{public}@)", buf, 0x20u);
  }
  [MEMORY[0x263F27BE0] setTreatmentOverrides:v4];
  v9 = (void *)MEMORY[0x263F27E10];
  v14 = @"success";
  uint64_t v15 = MEMORY[0x263EFFA88];
  v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v11 = [v9 promiseWithResult:v10];

  return v11;
}

- (NSDictionary)treatmentOverrides
{
  return self->_treatmentOverrides;
}

- (void)setTreatmentOverrides:(id)a3
{
}

- (void).cxx_destruct
{
}

@end