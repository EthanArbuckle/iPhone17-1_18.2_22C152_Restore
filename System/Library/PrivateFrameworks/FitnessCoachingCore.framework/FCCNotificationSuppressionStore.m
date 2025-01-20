@interface FCCNotificationSuppressionStore
- (BOOL)lastNotifiedSuppressionState;
- (BOOL)notificationsSuppressed;
- (FCCNotificationSuppressionStore)init;
- (FCCNotificationSuppressionStore)initWithDateProvider:(id)a3;
- (id)_requestsMap;
- (id)_userDefaults;
- (id)allRequests;
- (void)_requestsMap;
- (void)_updateStoredRequests:(id)a3;
- (void)addNotificationSuppressionRequest:(id)a3;
- (void)removeNotificationSuppressionRequest:(id)a3;
- (void)setLastNotifiedSuppressionState:(BOOL)a3;
@end

@implementation FCCNotificationSuppressionStore

- (BOOL)notificationsSuppressed
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCCNotificationSuppressionStore *)self allRequests];
  v4 = [(FCCDateProvider *)self->_dateProvider coachingDate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "expirationDate", (void)v12);
        char v10 = objc_msgSend(v9, "hk_isAfterDate:", v4);

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allRequests
{
  v2 = [(FCCNotificationSuppressionStore *)self _requestsMap];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 allValues];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_requestsMap
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  v4 = [(FCCNotificationSuppressionStore *)self _userDefaults];
  id v5 = [v4 dictionaryForKey:@"NotificationSuppressionRequests"];
  os_unfair_lock_unlock(p_unfairLock);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      -[FCCNotificationSuppressionStore _requestsMap](v7);
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global);
  }

  return v6;
}

- (id)_userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.FitnessCoaching"];
  return v2;
}

- (FCCNotificationSuppressionStore)init
{
  v3 = objc_alloc_init(FCCDateProvider);
  v4 = [(FCCNotificationSuppressionStore *)self initWithDateProvider:v3];

  return v4;
}

- (FCCNotificationSuppressionStore)initWithDateProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCNotificationSuppressionStore;
  uint64_t v6 = [(FCCNotificationSuppressionStore *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateProvider, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)addNotificationSuppressionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCNotificationSuppressionStore *)self _requestsMap];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v11 = v8;

  objc_super v9 = [v4 identifier];
  [v11 setObject:v4 forKeyedSubscript:v9];

  char v10 = (void *)[v11 copy];
  [(FCCNotificationSuppressionStore *)self _updateStoredRequests:v10];
}

- (void)removeNotificationSuppressionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCNotificationSuppressionStore *)self _requestsMap];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v11 = v8;

  objc_super v9 = [v4 identifier];

  [v11 removeObjectForKey:v9];
  char v10 = (void *)[v11 copy];
  [(FCCNotificationSuppressionStore *)self _updateStoredRequests:v10];
}

- (BOOL)lastNotifiedSuppressionState
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v4 = [(FCCNotificationSuppressionStore *)self _userDefaults];
  char v5 = [v4 BOOLForKey:@"NotificationSuppressionLastNotifiedState"];
  os_unfair_lock_unlock(p_unfairLock);

  return v5;
}

- (void)setLastNotifiedSuppressionState:(BOOL)a3
{
  BOOL v3 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v6 = [(FCCNotificationSuppressionStore *)self _userDefaults];
  [v6 setBool:v3 forKey:@"NotificationSuppressionLastNotifiedState"];
  os_unfair_lock_unlock(p_unfairLock);
}

void __47__FCCNotificationSuppressionStore__requestsMap__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id v7 = a3;
  id v8 = [[FCCNotificationSuppressionRequest alloc] initWithTransportData:v7];

  if (v8) {
    v6[2](v6, v9, v8);
  }
}

- (void)_updateStoredRequests:(id)a3
{
  id v4 = a3;
  id v6 = [(FCCNotificationSuppressionStore *)self _userDefaults];
  char v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_283);

  [v6 setObject:v5 forKey:@"NotificationSuppressionRequests"];
}

void __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 transportData];
  if (v9)
  {
    v8[2](v8, v6, v9);
  }
  else
  {
    _HKInitializeLogging();
    char v10 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke_cold_1((uint64_t)v7, v10);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)_requestsMap
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_1B55C0000, v1, OS_LOG_TYPE_ERROR, "Loaded suppression requests object is not a dictionary %@", (uint8_t *)&v4, 0xCu);
}

void __57__FCCNotificationSuppressionStore__updateStoredRequests___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "Failed to create request data for request: %@", (uint8_t *)&v2, 0xCu);
}

@end