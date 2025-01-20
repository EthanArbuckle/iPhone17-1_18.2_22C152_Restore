@interface DMFCommunicationPolicyMonitor
+ (NSSet)communicationBundleIdentifiers;
+ (NSSet)policyTypes;
+ (unint64_t)communicationPolicyForApplicationPolicy:(id)a3 downtimeEnforced:(BOOL)a4;
- (BOOL)didFetchInitialPolicies;
- (DMFCommunicationPolicyMonitor)init;
- (DMFCommunicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3;
- (NSDictionary)policiesByBundleIdentifier;
- (NSUUID)identifier;
- (id)requestPoliciesByBundleIdentifierWithError:(id *)a3;
- (void)_updatePoliciesByBundleIdentifier;
- (void)dealloc;
- (void)requestPoliciesByBundleIdentifierWithCompletionHandler:(id)a3;
- (void)setDidFetchInitialPolicies:(BOOL)a3;
- (void)setPoliciesByBundleIdentifier:(id)a3;
@end

@implementation DMFCommunicationPolicyMonitor

void __63__DMFCommunicationPolicyMonitor_communicationBundleIdentifiers__block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.facetime";
  v4[1] = @"com.apple.FaceTime";
  v4[2] = @"com.apple.MobileSMS";
  v4[3] = @"com.apple.iChat";
  v4[4] = @"com.apple.mobilephone";
  v4[5] = @"com.apple.NanoPhone";
  v4[6] = @"com.apple.tincan";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)communicationBundleIdentifiers_bundleIdentifiers;
  communicationBundleIdentifiers_bundleIdentifiers = v2;
}

- (DMFCommunicationPolicyMonitor)initWithPolicyChangeHandler:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFCommunicationPolicyMonitor;
  v5 = [(DMFCommunicationPolicyMonitor *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    if (v4)
    {
      v8 = [DMFPolicyRegistration alloc];
      v9 = [(id)objc_opt_class() policyTypes];
      v10 = [(DMFPolicyRegistration *)v8 initWithIdentifier:@"dmf.policy.monitor.communication" policyTypes:v9 callback:v4];

      v11 = +[DMFPolicyMonitor policyMonitor];
      v12 = v5->_identifier;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke;
      v14[3] = &unk_1E6372240;
      v15 = v5;
      [v11 addRegistration:v10 forPolicyMonitorIdentifier:v12 completionHandler:v14];
    }
  }

  return v5;
}

- (void)requestPoliciesByBundleIdentifierWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() communicationBundleIdentifiers];
  id v6 = [v4 allObjects];

  v5 = +[DMFPolicyMonitor policyMonitor];
  [v5 requestCommunicationPoliciesForBundleIdentifiers:v6 completionHandler:v3];
}

void __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v6 = DMFPolicyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

+ (NSSet)communicationBundleIdentifiers
{
  if (communicationBundleIdentifiers_onceToken != -1) {
    dispatch_once(&communicationBundleIdentifiers_onceToken, &__block_literal_global_31);
  }
  uint64_t v2 = (void *)[(id)communicationBundleIdentifiers_bundleIdentifiers copy];
  return (NSSet *)v2;
}

- (void)dealloc
{
  id v3 = +[DMFPolicyMonitor policyMonitor];
  [v3 invalidatePolicyMonitor:self->_identifier];

  v4.receiver = self;
  v4.super_class = (Class)DMFCommunicationPolicyMonitor;
  [(DMFCommunicationPolicyMonitor *)&v4 dealloc];
}

+ (NSSet)policyTypes
{
  if (policyTypes_onceToken_1 != -1) {
    dispatch_once(&policyTypes_onceToken_1, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)policyTypes_types_1;
  return (NSSet *)v2;
}

void __44__DMFCommunicationPolicyMonitor_policyTypes__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"applications";
  v4[1] = @"applicationcategories";
  v4[2] = @"categories";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)policyTypes_types_1;
  policyTypes_types_1 = v2;
}

+ (unint64_t)communicationPolicyForApplicationPolicy:(id)a3 downtimeEnforced:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 integerValue]) {
    return 2;
  }
  else {
    return v4;
  }
}

- (id)requestPoliciesByBundleIdentifierWithError:(id *)a3
{
  BOOL v4 = [(id)objc_opt_class() communicationBundleIdentifiers];
  id v5 = [v4 allObjects];

  id v6 = +[DMFPolicyMonitor policyMonitor];
  v7 = [v6 requestCommunicationPoliciesForBundleIdentifiers:v5 withError:a3];

  return v7;
}

- (DMFCommunicationPolicyMonitor)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__DMFCommunicationPolicyMonitor_init__block_invoke;
  v17[3] = &unk_1E63722B0;
  v18 = self;
  uint64_t v2 = [(DMFCommunicationPolicyMonitor *)v18 initWithPolicyChangeHandler:v17];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() communicationBundleIdentifiers];
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1F18AA2C0, *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v10 = [v4 copy];
    policiesByBundleIdentifier = v2->_policiesByBundleIdentifier;
    v2->_policiesByBundleIdentifier = (NSDictionary *)v10;
  }
  return v2;
}

uint64_t __37__DMFCommunicationPolicyMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePoliciesByBundleIdentifier];
}

- (void)_updatePoliciesByBundleIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BE0E2000, a2, OS_LOG_TYPE_ERROR, "Failed to request communication policies with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (NSDictionary)policiesByBundleIdentifier
{
  return self->_policiesByBundleIdentifier;
}

- (void)setPoliciesByBundleIdentifier:(id)a3
{
}

- (BOOL)didFetchInitialPolicies
{
  return self->_didFetchInitialPolicies;
}

- (void)setDidFetchInitialPolicies:(BOOL)a3
{
  self->_didFetchInitialPolicies = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
}

void __61__DMFCommunicationPolicyMonitor_initWithPolicyChangeHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v6 = [(id)objc_opt_class() policyTypes];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_1BE0E2000, a3, OS_LOG_TYPE_ERROR, "Failed to register communication policy monitor with identifier %{public}@ for types %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end