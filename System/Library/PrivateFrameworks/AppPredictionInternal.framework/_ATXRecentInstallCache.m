@interface _ATXRecentInstallCache
- (id)_allRecentlyInstalledApplicationsAfterExpirationDate:(id)a3;
- (id)_getRecentInstallationsMap;
- (id)allRecentlyInstalledApplications;
- (id)initTrackingAppsMoreRecentThan:(double)a3;
- (id)initTrackingAppsMoreRecentThan:(double)a3 installMonitor:(id)a4 uninstallMonitor:(id)a5;
- (void)_notifiedOfInstalls:(id)a3;
- (void)_notifiedOfUninstalls:(id)a3;
- (void)reset;
@end

@implementation _ATXRecentInstallCache

- (id)initTrackingAppsMoreRecentThan:(double)a3 installMonitor:(id)a4 uninstallMonitor:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  if (a3 >= 0.0)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_ATXRecentInstallCache.m", 26, @"Invalid parameter not satisfying: %@", @"installMonitor != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_ATXRecentInstallCache.m", 25, @"Invalid parameter not satisfying: %@", @"ttl >= 0" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_ATXRecentInstallCache.m", 27, @"Invalid parameter not satisfying: %@", @"uninstallMonitor != nil" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)_ATXRecentInstallCache;
  v12 = [(_ATXRecentInstallCache *)&v27 init];
  v13 = v12;
  if (v12)
  {
    v12->_ttl = a3;
    uint64_t v14 = objc_opt_new();
    recentInstallations = v13->_recentInstallations;
    v13->_recentInstallations = (NSMutableDictionary *)v14;

    objc_initWeak(&location, v13);
    objc_storeStrong((id *)&v13->_installNotificationMonitor, a4);
    installNotificationMonitor = v13->_installNotificationMonitor;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke;
    v24[3] = &unk_1E68ACAE0;
    objc_copyWeak(&v25, &location);
    [(_ATXInternalInstallNotification *)installNotificationMonitor registerForNotificationsWithInstallBlock:v24];
    objc_storeStrong((id *)&v13->_uninstallNotificationMonitor, a5);
    uninstallNotificationMonitor = v13->_uninstallNotificationMonitor;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke_2;
    v22[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v23, &location);
    [(_ATXInternalUninstallNotification *)uninstallNotificationMonitor registerForNotificationsWithUninstallBlock:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)initTrackingAppsMoreRecentThan:(double)a3
{
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  id v7 = [(_ATXRecentInstallCache *)self initTrackingAppsMoreRecentThan:v5 installMonitor:v6 uninstallMonitor:a3];

  return v7;
}

- (void)_notifiedOfInstalls:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = objc_msgSend(v6, "objectForKeyedSubscript:", v10, (void)v12);
        [(NSMutableDictionary *)v5->_recentInstallations setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_notifiedOfUninstalls:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  recentInstallations = v4->_recentInstallations;
  id v6 = [v7 allObjects];
  [(NSMutableDictionary *)recentInstallations removeObjectsForKeys:v6];

  objc_sync_exit(v4);
}

- (id)allRecentlyInstalledApplications
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_ttl];
  id v4 = [(_ATXRecentInstallCache *)self _allRecentlyInstalledApplicationsAfterExpirationDate:v3];

  return v4;
}

- (id)_allRecentlyInstalledApplicationsAfterExpirationDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v17 = (id)objc_opt_new();
  id v6 = self;
  objc_sync_enter(v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = v6->_recentInstallations;
  uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)v6->_recentInstallations objectForKeyedSubscript:v10];
        long long v12 = [v11 earlierDate:v4];
        int v13 = [v12 isEqualToDate:v4];

        if (v13) {
          long long v14 = v17;
        }
        else {
          long long v14 = v5;
        }
        [v14 addObject:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)v6->_recentInstallations removeObjectsForKeys:v5];
  objc_sync_exit(v6);

  return v17;
}

- (id)_getRecentInstallationsMap
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_recentInstallations copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = objc_opt_new();
  recentInstallations = obj->_recentInstallations;
  obj->_recentInstallations = (NSMutableDictionary *)v2;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInstallations, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationMonitor, 0);
  objc_storeStrong((id *)&self->_installNotificationMonitor, 0);
}

@end