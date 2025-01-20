@interface FCGoalProgressStore
- (FCGoalProgressStore)initWithProfile:(id)a3;
- (id)_legacyDefaultsDomain;
- (id)_userDefaultsDomain;
- (id)currentConfiguration;
- (id)lastFiredEventDateForIdentifier:(id)a3;
- (id)scheduledEventIdentifiers;
- (void)clearScheduledEventIdentifiers;
- (void)currentConfiguration;
- (void)scheduledEventIdentifiers;
- (void)storeCurrentConfiguration:(id)a3;
- (void)storeFiredEventDate:(id)a3 identifier:(id)a4;
- (void)storeScheduledEventIdentifiers:(id)a3;
@end

@implementation FCGoalProgressStore

- (FCGoalProgressStore)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCGoalProgressStore;
  v5 = [(FCGoalProgressStore *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (void)storeCurrentConfiguration:(id)a3
{
  id v4 = [a3 transportData];
  v5 = [(FCGoalProgressStore *)self _userDefaultsDomain];
  id v14 = 0;
  [v5 setData:v4 forKey:@"goalProgressConfigurationData" error:&v14];
  id v6 = v14;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCGoalProgressStore storeCurrentConfiguration:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (id)currentConfiguration
{
  v2 = [(FCGoalProgressStore *)self _userDefaultsDomain];
  id v14 = 0;
  v3 = [v2 dataForKey:@"goalProgressConfigurationData" error:&v14];
  id v4 = v14;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      [(FCGoalProgressStore *)(uint64_t)v4 currentConfiguration];
    }
    goto LABEL_4;
  }
  if (!v3)
  {
LABEL_4:
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F620E0]) initWithTransportData:v3];
LABEL_7:

  return v12;
}

- (void)storeFiredEventDate:(id)a3 identifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FCGoalProgressStore *)self _legacyDefaultsDomain];
  id v11 = 0;
  [v8 setDate:v6 forKey:v7 error:&v11];
  id v9 = v11;
  if (v9)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_ERROR, "Failed to store goal progress event date %@ identifier %@, error %@", buf, 0x20u);
    }
  }
}

- (id)lastFiredEventDateForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(FCGoalProgressStore *)self _legacyDefaultsDomain];
  id v17 = 0;
  id v6 = [v5 dateForKey:v4 error:&v17];
  id v7 = v17;
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCGoalProgressStore lastFiredEventDateForIdentifier:]((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }
    id v15 = 0;
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

- (void)storeScheduledEventIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(FCGoalProgressStore *)self _userDefaultsDomain];
  id v6 = [v4 allObjects];
  id v8 = 0;
  [v5 setPropertyListValue:v6 forKey:@"goalProgressScheduledEventIdentifiers" error:&v8];
  id v7 = v8;

  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCGoalProgressStore storeScheduledEventIdentifiers:]();
    }
  }
}

- (void)clearScheduledEventIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [(FCGoalProgressStore *)self storeScheduledEventIdentifiers:v3];
}

- (id)scheduledEventIdentifiers
{
  v2 = [(FCGoalProgressStore *)self _userDefaultsDomain];
  id v7 = 0;
  id v3 = [v2 propertyListValueForKey:@"goalProgressScheduledEventIdentifiers" error:&v7];
  id v4 = v7;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCGoalProgressStore scheduledEventIdentifiers]();
    }
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }

  return v5;
}

- (id)_userDefaultsDomain
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FCGoalProgressStore__userDefaultsDomain__block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  if (_userDefaultsDomain_onceToken_0 != -1) {
    dispatch_once(&_userDefaultsDomain_onceToken_0, block);
  }
  return (id)_userDefaultsDomain_defaultsDomain_0;
}

void __42__FCGoalProgressStore__userDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F65B28]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [v2 initWithCategory:1 domainName:@"com.apple.fitnesscoaching.goalProgress" profile:WeakRetained];
  id v4 = (void *)_userDefaultsDomain_defaultsDomain_0;
  _userDefaultsDomain_defaultsDomain_0 = v3;
}

- (id)_legacyDefaultsDomain
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FCGoalProgressStore__legacyDefaultsDomain__block_invoke;
  block[3] = &unk_1E69B8500;
  block[4] = self;
  if (_legacyDefaultsDomain_onceToken != -1) {
    dispatch_once(&_legacyDefaultsDomain_onceToken, block);
  }
  return (id)_legacyDefaultsDomain_defaultsDomain;
}

void __44__FCGoalProgressStore__legacyDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F65B28]);
  uint64_t v3 = *MEMORY[0x1E4F659F0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [v2 initWithCategory:1 domainName:v3 profile:WeakRetained];
  v5 = (void *)_legacyDefaultsDomain_defaultsDomain;
  _legacyDefaultsDomain_defaultsDomain = v4;
}

- (void).cxx_destruct
{
}

- (void)storeCurrentConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)currentConfiguration
{
}

- (void)lastFiredEventDateForIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storeScheduledEventIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D3B3E000, v0, v1, "Failed to store scheduled goal progress event identifiers %{public}@, error %{public}@");
}

- (void)scheduledEventIdentifiers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D3B3E000, v0, v1, "Failed to fetch scheduled goal progress event identifiers %{public}@, error %{public}@");
}

@end