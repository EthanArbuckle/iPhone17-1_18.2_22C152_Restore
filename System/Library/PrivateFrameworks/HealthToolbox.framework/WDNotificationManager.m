@interface WDNotificationManager
+ (BOOL)suppressBadgeNotifications;
+ (void)initialize;
+ (void)setSuppressBadgeNotifications:(BOOL)a3;
- (HKHealthStore)healthStore;
- (WDNotificationManager)initWithHealthStore:(id)a3;
- (id)_lock_policyForNotification:(id)a3;
- (void)resetEmergencySOSBadge;
- (void)resetHealthRecordsDataBadge;
- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5;
- (void)setPolicy:(id)a3 forDomain:(int64_t)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WDNotificationManager

+ (BOOL)suppressBadgeNotifications
{
  return _suppressBadgeNotifications;
}

+ (void)setSuppressBadgeNotifications:(BOOL)a3
{
  _suppressBadgeNotifications = a3;
}

+ (void)initialize
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2210D2000, log, OS_LOG_TYPE_ERROR, "Failed to register for BadgesDidUpdate notification", v1, 2u);
}

void __35__WDNotificationManager_initialize__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) suppressBadgeNotifications] & 1) == 0)
  {
    id v1 = [MEMORY[0x263F08A00] defaultCenter];
    [v1 postNotificationName:@"WDNotificationManagerBadgesDidUpdateNotificationName" object:0];
  }
}

- (WDNotificationManager)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDNotificationManager;
  v6 = [(WDNotificationManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F0A578]) initWithHealthStore:v5];
    notificationStore = v7->_notificationStore;
    v7->_notificationStore = (HKNotificationStore *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    domainsToPolicies = v7->_domainsToPolicies;
    v7->_domainsToPolicies = v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setBadge:(id)a3 forDomain:(int64_t)a4 completion:(id)a5
{
}

- (void)setPolicy:(id)a3 forDomain:(int64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  domainsToPolicies = self->_domainsToPolicies;
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)domainsToPolicies setObject:v7 forKeyedSubscript:v9];

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_policyForNotification:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = objc_msgSend(v5, "wd_userInfo");

  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0ADA8]];
    uint64_t v8 = [(NSMutableDictionary *)self->_domainsToPolicies objectForKeyedSubscript:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6) {
    [(WDNotificationManager *)self _lock_policyForNotification:v6];
  }
  else {
  uint64_t v8 = [(NSMutableDictionary *)self->_domainsToPolicies objectForKeyedSubscript:&unk_26D2FD2A8];
  }
  os_unfair_lock_unlock(p_lock);
  if (objc_opt_respondsToSelector()) {
    [v8 userNotificationCenter:v9 openSettingsForNotification:v6];
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = [(WDNotificationManager *)self _lock_policyForNotification:v8];
  os_unfair_lock_unlock(p_lock);
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 userNotificationCenter:v12 willPresentNotification:v8 withCompletionHandler:v9];
  }
  else {
    v9[2](v9, 27);
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = [v8 notification];
  id v12 = [(WDNotificationManager *)self _lock_policyForNotification:v11];

  os_unfair_lock_unlock(p_lock);
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 userNotificationCenter:v13 didReceiveNotificationResponse:v8 withCompletionHandler:v9];
  }
  else {
    v9[2](v9);
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_notificationStore, 0);

  objc_storeStrong((id *)&self->_domainsToPolicies, 0);
}

- (void)resetEmergencySOSBadge
{
  id v3 = [MEMORY[0x263F0A120] zeroBadge];
  [(WDNotificationManager *)self setBadge:v3 forDomain:0 completion:&__block_literal_global_13];
}

void __60__WDNotificationManager_Convenience__resetEmergencySOSBadge__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09928], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2210D2000, v5, OS_LOG_TYPE_DEFAULT, "Failed to reset Emergency SOS badge with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)resetHealthRecordsDataBadge
{
  id v3 = [MEMORY[0x263F0A120] zeroBadge];
  [(WDNotificationManager *)self setBadge:v3 forDomain:3 completion:&__block_literal_global_279];
}

void __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

void __65__WDNotificationManager_Convenience__resetHealthRecordsDataBadge__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "Failed to reset Health Records badge with error: %@", (uint8_t *)&v2, 0xCu);
}

@end