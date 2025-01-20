@interface DMFApplicationPolicyMonitor
+ (NSSet)policyTypes;
+ (void)createPolicyMonitorWithPolicyChangeHandler:(id)a3 completionHandler:(id)a4;
- (DMFApplicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3;
- (DMFPolicyRegistration)registration;
- (NSUUID)identifier;
- (id)_initWithPolicyChangeHandler:(id)a3 addingRegistration:(BOOL)a4;
- (id)requestPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4;
- (void)dealloc;
- (void)requestPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4;
@end

@implementation DMFApplicationPolicyMonitor

- (id)_initWithPolicyChangeHandler:(id)a3 addingRegistration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DMFApplicationPolicyMonitor;
  v7 = [(DMFApplicationPolicyMonitor *)&v20 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    if (v6)
    {
      v10 = [DMFPolicyRegistration alloc];
      v11 = [(id)objc_opt_class() policyTypes];
      uint64_t v12 = [(DMFPolicyRegistration *)v10 initWithIdentifier:@"dmf.policy.monitor.app" policyTypes:v11 callback:v6];
      registration = v7->_registration;
      v7->_registration = (DMFPolicyRegistration *)v12;

      if (v4)
      {
        v14 = +[DMFPolicyMonitor policyMonitor];
        v16 = v7->_identifier;
        v15 = v7->_registration;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke;
        v18[3] = &unk_1E6372240;
        v19 = v7;
        [v14 addRegistration:v15 forPolicyMonitorIdentifier:v16 completionHandler:v18];
      }
    }
  }

  return v7;
}

void __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = DMFPolicyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (DMFApplicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  return (DMFApplicationPolicyMonitor *)[(DMFApplicationPolicyMonitor *)self _initWithPolicyChangeHandler:a3 addingRegistration:1];
}

+ (NSSet)policyTypes
{
  if (policyTypes_onceToken != -1) {
    dispatch_once(&policyTypes_onceToken, &__block_literal_global);
  }
  v2 = (void *)policyTypes_types;
  return (NSSet *)v2;
}

void __42__DMFApplicationPolicyMonitor_policyTypes__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"applications";
  v4[1] = @"applicationcategories";
  v4[2] = @"categories";
  v4[3] = @"websites";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)policyTypes_types;
  policyTypes_types = v2;
}

+ (void)createPolicyMonitorWithPolicyChangeHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) _initWithPolicyChangeHandler:v7 addingRegistration:0];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __92__DMFApplicationPolicyMonitor_createPolicyMonitorWithPolicyChangeHandler_completionHandler___block_invoke;
  v18 = &unk_1E6372288;
  id v9 = v6;
  id v20 = v9;
  id v10 = v8;
  id v19 = v10;
  v11 = (void *)MEMORY[0x1C188B2F0](&v15);
  uint64_t v12 = +[DMFPolicyMonitor policyMonitor];
  if (v7)
  {
    v13 = [v10 registration];
    v14 = [v10 identifier];
    [v12 addRegistration:v13 forPolicyMonitorIdentifier:v14 completionHandler:v11];
  }
  else
  {
    v13 = [(id)objc_opt_class() policyTypes];
    v14 = [v13 allObjects];
    [v12 requestPoliciesForTypes:v14 completionHandler:v11];
  }
}

uint64_t __92__DMFApplicationPolicyMonitor_createPolicyMonitorWithPolicyChangeHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    [a2 count];
  }
  BOOL v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)dealloc
{
  v3 = +[DMFPolicyMonitor policyMonitor];
  [v3 invalidatePolicyMonitor:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)DMFApplicationPolicyMonitor;
  [(DMFApplicationPolicyMonitor *)&v4 dealloc];
}

- (id)requestPoliciesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = +[DMFPolicyMonitor policyMonitor];
  id v7 = [v6 requestPoliciesForBundleIdentifiers:v5 withError:a4];

  return v7;
}

- (void)requestPoliciesForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[DMFPolicyMonitor policyMonitor];
  [v7 requestPoliciesForBundleIdentifiers:v6 completionHandler:v5];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (DMFPolicyRegistration)registration
{
  return self->_registration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __79__DMFApplicationPolicyMonitor__initWithPolicyChangeHandler_addingRegistration___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = [(id)objc_opt_class() policyTypes];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1BE0E2000, a3, OS_LOG_TYPE_ERROR, "Failed to register application policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end