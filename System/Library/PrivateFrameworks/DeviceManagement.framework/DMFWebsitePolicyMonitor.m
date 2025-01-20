@interface DMFWebsitePolicyMonitor
+ (NSSet)policyTypes;
- (DMFWebsitePolicyMonitor)initWithPolicyChangeHandler:(id)a3;
- (NSUUID)identifier;
- (void)dealloc;
- (void)requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4;
@end

@implementation DMFWebsitePolicyMonitor

- (DMFWebsitePolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFWebsitePolicyMonitor;
  v5 = [(DMFWebsitePolicyMonitor *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    if (v4)
    {
      v8 = [DMFPolicyRegistration alloc];
      v9 = [(id)objc_opt_class() policyTypes];
      v10 = [(DMFPolicyRegistration *)v8 initWithIdentifier:@"dmf.policy.monitor.web" policyTypes:v9 callback:v4];

      v11 = +[DMFPolicyMonitor policyMonitor];
      v12 = v5->_identifier;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v14[3] = &unk_1E6372240;
      v15 = v5;
      [v11 addRegistration:v10 forPolicyMonitorIdentifier:v12 completionHandler:v14];
    }
  }

  return v5;
}

void __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v6 = DMFPolicyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)dealloc
{
  v3 = +[DMFPolicyMonitor policyMonitor];
  [v3 invalidatePolicyMonitor:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)DMFWebsitePolicyMonitor;
  [(DMFWebsitePolicyMonitor *)&v4 dealloc];
}

+ (NSSet)policyTypes
{
  if (policyTypes_onceToken_2 != -1) {
    dispatch_once(&policyTypes_onceToken_2, &__block_literal_global_18);
  }
  v2 = (void *)policyTypes_types_2;
  return (NSSet *)v2;
}

void __38__DMFWebsitePolicyMonitor_policyTypes__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"applications";
  v4[1] = @"categories";
  v4[2] = @"websites";
  v4[3] = @"websitecategories";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)policyTypes_types_2;
  policyTypes_types_2 = v2;
}

- (void)requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[DMFPolicyMonitor policyMonitor];
  [v7 requestPoliciesForWebsiteURLs:v6 completionHandler:v5];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

void __55__DMFWebsitePolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = [(id)objc_opt_class() policyTypes];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1BE0E2000, a3, OS_LOG_TYPE_ERROR, "Failed to register website policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end