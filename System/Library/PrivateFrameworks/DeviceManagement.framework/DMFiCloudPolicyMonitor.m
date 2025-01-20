@interface DMFiCloudPolicyMonitor
+ (id)iCloudLogoutPolicyForPoliciesByType:(id)a3;
- (DMFiCloudPolicyMonitor)init;
- (DMFiCloudPolicyMonitor)initWithPolicyChangeHandler:(id)a3;
- (NSArray)policyTypes;
- (NSUUID)identifier;
- (id)requestiCloudLogoutPolicyWithError:(id *)a3;
- (int64_t)iCloudLogoutPolicy;
- (void)dealloc;
- (void)requestiCloudLogoutPolicyWithCompletionHandler:(id)a3;
- (void)setICloudLogoutPolicy:(int64_t)a3;
@end

@implementation DMFiCloudPolicyMonitor

- (DMFiCloudPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFiCloudPolicyMonitor;
  v5 = [(DMFiCloudPolicyMonitor *)&v18 init];
  if (v5)
  {
    v19[0] = @"icloudaccountlogout";
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    policyTypes = v5->_policyTypes;
    v5->_policyTypes = (NSArray *)v6;

    uint64_t v8 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    if (v4)
    {
      v10 = [DMFPolicyRegistration alloc];
      v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v5->_policyTypes];
      v12 = [(DMFPolicyRegistration *)v10 initWithIdentifier:@"dmf.policy.monitor.icloud.account.logout" policyTypes:v11 callback:v4];

      v13 = +[DMFPolicyMonitor policyMonitor];
      v14 = v5->_identifier;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v16[3] = &unk_1E6372240;
      v17 = v5;
      [v13 addRegistration:v12 forPolicyMonitorIdentifier:v14 completionHandler:v16];
    }
  }

  return v5;
}

void __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    uint64_t v6 = DMFPolicyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (void)dealloc
{
  v3 = +[DMFPolicyMonitor policyMonitor];
  [v3 invalidatePolicyMonitor:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)DMFiCloudPolicyMonitor;
  [(DMFiCloudPolicyMonitor *)&v4 dealloc];
}

+ (id)iCloudLogoutPolicyForPoliciesByType:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"icloudaccountlogout"];
  objc_super v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 defaultPolicy];
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = DMFPolicyLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = DMFPolicyUnlocalizedDisplayName(v5);
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1BE0E2000, v6, OS_LOG_TYPE_DEFAULT, "iCloud logout has policy %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];

  return v8;
}

- (id)requestiCloudLogoutPolicyWithError:(id *)a3
{
  unint64_t v5 = +[DMFPolicyMonitor policyMonitor];
  uint64_t v6 = [(DMFiCloudPolicyMonitor *)self policyTypes];
  id v12 = 0;
  v7 = [v5 requestPoliciesForTypes:v6 withError:&v12];
  id v8 = v12;

  if (v7)
  {
    v9 = +[DMFiCloudPolicyMonitor iCloudLogoutPolicyForPoliciesByType:v7];
  }
  else
  {
    int v10 = DMFPolicyLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[DMFiCloudPolicyMonitor requestiCloudLogoutPolicyWithError:](self);
    }

    v9 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v9;
}

- (void)requestiCloudLogoutPolicyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[DMFPolicyMonitor policyMonitor];
  uint64_t v6 = [(DMFiCloudPolicyMonitor *)self policyTypes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6372BB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 requestPoliciesForTypes:v6 completionHandler:v8];
}

void __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = +[DMFiCloudPolicyMonitor iCloudLogoutPolicyForPoliciesByType:a2];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    id v8 = DMFPolicyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (DMFiCloudPolicyMonitor)init
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__DMFiCloudPolicyMonitor_init__block_invoke;
  v4[3] = &unk_1E63722B0;
  id v5 = self;
  v2 = [(DMFiCloudPolicyMonitor *)v5 initWithPolicyChangeHandler:v4];

  return v2;
}

void __30__DMFiCloudPolicyMonitor_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestiCloudLogoutPolicyWithError:0];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "setICloudLogoutPolicy:", objc_msgSend(v2, "integerValue"));
    v2 = v3;
  }
}

- (int64_t)iCloudLogoutPolicy
{
  id v3 = [(DMFiCloudPolicyMonitor *)self requestiCloudLogoutPolicyWithError:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t iCloudLogoutPolicy = [v3 integerValue];
    self->_uint64_t iCloudLogoutPolicy = iCloudLogoutPolicy;
  }
  else
  {
    uint64_t iCloudLogoutPolicy = self->_iCloudLogoutPolicy;
  }

  return iCloudLogoutPolicy;
}

- (void)setICloudLogoutPolicy:(int64_t)a3
{
  self->_uint64_t iCloudLogoutPolicy = a3;
}

- (NSArray)policyTypes
{
  return self->_policyTypes;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_policyTypes, 0);
}

void __54__DMFiCloudPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  int v5 = 138543874;
  uint64_t v6 = v4;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1BE0E2000, log, OS_LOG_TYPE_ERROR, "Failed to register iCloud policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)requestiCloudLogoutPolicyWithError:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 policyTypes];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);
}

void __73__DMFiCloudPolicyMonitor_requestiCloudLogoutPolicyWithCompletionHandler___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) policyTypes];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BE0E2000, v2, v3, "Failed to request policies for types %{public}@ with error: %{public}@", v4, v5, v6, v7, v8);
}

@end