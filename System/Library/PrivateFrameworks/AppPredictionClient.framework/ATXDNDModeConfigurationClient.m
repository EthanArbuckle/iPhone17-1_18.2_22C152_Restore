@interface ATXDNDModeConfigurationClient
+ (ATXDNDModeConfigurationClient)sharedInstance;
+ (id)dndSemanticTypeToString:(int64_t)a3;
- (BOOL)isCloudSyncActive;
- (id)_configuredModesBySemanticType;
- (id)_init;
- (id)appConfigurationsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)configuredModes;
- (id)debug_allModeDescriptions;
- (id)dndModeForATXMode:(unint64_t)a3;
- (id)dndModeForDNDModeWithUUID:(id)a3;
- (id)dndModeForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4;
- (id)dndModeUUIDForDNDModeIdentifier:(id)a3;
- (id)dndModeUUIDForDNDModeSemanticType:(int64_t)a3;
- (id)dndSemanticTypeForATXMode:(unint64_t)a3;
- (id)getAllModeConfigurationsWithoutCache;
- (id)iOSAppAllowListForMode:(int64_t)a3;
- (id)iOSAppDenyListForMode:(int64_t)a3;
- (id)iOSAppListForMode:(int64_t)a3 configurationType:(unint64_t)a4;
- (id)iOSContactAllowListForMode:(int64_t)a3;
- (id)iOSContactDenyListForMode:(int64_t)a3;
- (id)iOSContactListForMode:(int64_t)a3 configurationType:(unint64_t)a4;
- (id)modeConfigurationForDNDModeWithUUID:(id)a3;
- (id)modeConfigurationForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4;
- (id)modesByModeIdentifiers;
- (unint64_t)atxModeForDNDMode:(id)a3;
- (unint64_t)atxModeForDNDSemanticType:(int64_t)a3;
- (void)configuredModesDidChange;
- (void)getAllModeConfigurationsWithoutCache;
- (void)invalidateCaches;
- (void)refreshCachedConfigs;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXDNDModeConfigurationClient

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)ATXDNDModeConfigurationClient;
  v2 = [(ATXDNDModeConfigurationClient *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5F690] serviceForClientIdentifier:@"com.apple.proactive.AppPredictionClient"];
    dndConfigurationService = v2->_dndConfigurationService;
    v2->_dndConfigurationService = (DNDModeConfigurationService *)v3;

    uint64_t v5 = [MEMORY[0x1E4F5F5E0] serviceForClientIdentifier:@"com.apple.proactive.AppPredictionClient"];
    dndGlobalConfigurationService = v2->_dndGlobalConfigurationService;
    v2->_dndGlobalConfigurationService = (DNDGlobalConfigurationService *)v5;

    v7 = [[ATXDNDModeConfigurationClientListener alloc] initWithDelegate:v2];
    updateListener = v2->_updateListener;
    v2->_updateListener = (DNDModeConfigurationServiceListener *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("ATXDNDModeConfigurationClient.observerQueue", v11);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v2);
    v14 = v2->_dndConfigurationService;
    v15 = v2->_updateListener;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__ATXDNDModeConfigurationClient__init__block_invoke;
    v17[3] = &unk_1E5D086B8;
    objc_copyWeak(&v18, &location);
    [(DNDModeConfigurationService *)v14 addListener:v15 withCompletionHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__ATXDNDModeConfigurationClient__init__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v6);
    [WeakRetained invalidateCaches];

    v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __38__ATXDNDModeConfigurationClient__init__block_invoke_cold_1(v6);
    }
  }
}

+ (ATXDNDModeConfigurationClient)sharedInstance
{
  if (sharedInstance__pasOnceToken8 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken8, &__block_literal_global_63);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_11;

  return (ATXDNDModeConfigurationClient *)v2;
}

void __47__ATXDNDModeConfigurationClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  id v1 = [[ATXDNDModeConfigurationClient alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_11;
  sharedInstance__pasExprOnceResult_11 = (uint64_t)v1;
}

- (void)refreshCachedConfigs
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "[%@] Failed to fetch configs with error %@", v4, v5, v6, v7, v8);
}

- (void)invalidateCaches
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isCacheValid = 0;
  objc_sync_exit(obj);
}

- (id)appConfigurationsForModeIdentifier:(id)a3 error:(id *)a4
{
  return (id)[(DNDModeConfigurationService *)self->_dndConfigurationService getAppConfigurationActionsForModeIdentifier:a3 error:a4];
}

- (id)configuredModes
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid) {
    [(ATXDNDModeConfigurationClient *)v2 refreshCachedConfigs];
  }
  uint64_t v3 = v2->_cachedModeConfig;
  objc_sync_exit(v2);

  return v3;
}

- (id)modesByModeIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid) {
    [(ATXDNDModeConfigurationClient *)v2 refreshCachedConfigs];
  }
  uint64_t v3 = v2->_cachedModesByModeIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configuredModesBySemanticType
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid) {
    [(ATXDNDModeConfigurationClient *)v2 refreshCachedConfigs];
  }
  uint64_t v3 = v2->_cachedModesBySemanticType;
  objc_sync_exit(v2);

  return v3;
}

- (id)dndModeForDNDModeWithUUID:(id)a3
{
  return [(ATXDNDModeConfigurationClient *)self dndModeForDNDModeWithUUID:a3 useCache:1];
}

- (id)dndModeForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[ATXDNDModeConfigurationClient dndModeForDNDModeWithUUID:useCache:]";
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalidating cache in order to mitigate stale cache bugs", (uint8_t *)&v12, 0xCu);
    }

    [(ATXDNDModeConfigurationClient *)self invalidateCaches];
  }
  uint8_t v8 = [(ATXDNDModeConfigurationClient *)self configuredModes];
  uint64_t v9 = v8;
  v10 = 0;
  if (v6)
  {
    if (v8)
    {
      v10 = [v8 objectForKeyedSubscript:v6];

      if (v10)
      {
        v10 = [v9 objectForKeyedSubscript:v6];
      }
    }
  }

  return v10;
}

- (unint64_t)atxModeForDNDMode:(id)a3
{
  uint64_t v4 = [(ATXDNDModeConfigurationClient *)self dndModeForDNDModeWithUUID:a3];
  uint64_t v5 = v4;
  if (v4) {
    unint64_t v6 = -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](self, "atxModeForDNDSemanticType:", [v4 semanticType]);
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)atxModeForDNDSemanticType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xA) {
    return 0;
  }
  else {
    return qword_1A7A9D9A8[a3 + 1];
  }
}

- (id)dndModeUUIDForDNDModeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXDNDModeConfigurationClient *)self modesByModeIdentifiers];
  unint64_t v6 = v5;
  if (v4
    && v5
    && ([v5 objectForKeyedSubscript:v4],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint8_t v8 = [v6 objectForKeyedSubscript:v4];
    uint64_t v9 = [v8 identifier];
  }
  else
  {
    v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXDNDModeConfigurationClient dndModeUUIDForDNDModeIdentifier:]();
    }

    uint64_t v9 = objc_opt_new();
  }

  return v9;
}

- (id)dndModeUUIDForDNDModeSemanticType:(int64_t)a3
{
  id v4 = [(ATXDNDModeConfigurationClient *)self _configuredModesBySemanticType];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  unint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if ((unint64_t)[v6 count] < 2)
  {
    uint8_t v8 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXDNDModeConfigurationClient dndModeUUIDForDNDModeSemanticType:](a3, v7);
    }

    uint8_t v8 = 0;
  }

  return v8;
}

- (id)dndSemanticTypeForATXMode:(unint64_t)a3
{
  if (a3 - 1 > 0xE) {
    return 0;
  }
  else {
    return (id)qword_1E5D08728[a3 - 1];
  }
}

- (id)dndModeForATXMode:(unint64_t)a3
{
  id v4 = [(ATXDNDModeConfigurationClient *)self dndSemanticTypeForATXMode:a3];
  if (v4)
  {
    uint64_t v5 = [(ATXDNDModeConfigurationClient *)self _configuredModesBySemanticType];
    unint64_t v6 = [v5 objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)debug_allModeDescriptions
{
  uint64_t v3 = [(ATXDNDModeConfigurationClient *)self configuredModes];
  id v4 = [v3 allValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ATXDNDModeConfigurationClient_debug_allModeDescriptions__block_invoke;
  v7[3] = &unk_1E5D086E0;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v7);

  return v5;
}

id __58__ATXDNDModeConfigurationClient_debug_allModeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v5 = [v4 name];
  unint64_t v6 = [v4 identifier];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [v4 semanticType];
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v4 semanticType];

  v11 = ATXModeToString([v9 atxModeForDNDSemanticType:v10]);
  int v12 = [v3 stringWithFormat:@"Mode Name: %@, UUID: %@, Semantic Type: %ld, ATXMode: %@", v5, v7, v8, v11];

  return v12;
}

- (id)iOSAppAllowListForMode:(int64_t)a3
{
  return [(ATXDNDModeConfigurationClient *)self iOSAppListForMode:a3 configurationType:0];
}

- (id)iOSAppDenyListForMode:(int64_t)a3
{
  return [(ATXDNDModeConfigurationClient *)self iOSAppListForMode:a3 configurationType:1];
}

- (id)iOSAppListForMode:(int64_t)a3 configurationType:(unint64_t)a4
{
  dndConfigurationService = self->_dndConfigurationService;
  id v17 = 0;
  uint64_t v7 = [(DNDModeConfigurationService *)dndConfigurationService modeConfigurationsReturningError:&v17];
  id v8 = v17;
  if (v7)
  {
    uint64_t v9 = objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__ATXDNDModeConfigurationClient_iOSAppListForMode_configurationType___block_invoke;
    v13[3] = &unk_1E5D08708;
    int64_t v15 = a3;
    unint64_t v16 = a4;
    uint64_t v10 = v9;
    uint64_t v14 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    v11 = v14;
  }
  else
  {
    v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXDNDModeConfigurationClient iOSAppListForMode:configurationType:]();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

void __69__ATXDNDModeConfigurationClient_iOSAppListForMode_configurationType___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];
  uint64_t v7 = a1[5];

  if (v6 == v7)
  {
    id v8 = [v4 configuration];
    uint64_t v9 = [v8 applicationConfigurationType];
    uint64_t v10 = a1[6];

    if (v9 == v10)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v11 = objc_msgSend(v4, "configuration", 0);
      int v12 = [v11 applicationsWithExceptions];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ([v17 platform] == 1)
            {
              id v18 = (void *)a1[4];
              v19 = [v17 bundleID];
              [v18 addObject:v19];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)iOSContactAllowListForMode:(int64_t)a3
{
  return [(ATXDNDModeConfigurationClient *)self iOSContactListForMode:a3 configurationType:0];
}

- (id)iOSContactDenyListForMode:(int64_t)a3
{
  return [(ATXDNDModeConfigurationClient *)self iOSContactListForMode:a3 configurationType:1];
}

- (id)iOSContactListForMode:(int64_t)a3 configurationType:(unint64_t)a4
{
  dndConfigurationService = self->_dndConfigurationService;
  id v17 = 0;
  uint64_t v7 = [(DNDModeConfigurationService *)dndConfigurationService modeConfigurationsReturningError:&v17];
  id v8 = v17;
  if (v7)
  {
    uint64_t v9 = objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__ATXDNDModeConfigurationClient_iOSContactListForMode_configurationType___block_invoke;
    v13[3] = &unk_1E5D08708;
    int64_t v15 = a3;
    unint64_t v16 = a4;
    uint64_t v10 = v9;
    uint64_t v14 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    v11 = v14;
  }
  else
  {
    v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXDNDModeConfigurationClient iOSContactListForMode:configurationType:]();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

void __73__ATXDNDModeConfigurationClient_iOSContactListForMode_configurationType___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];
  uint64_t v7 = a1[5];

  if (v6 == v7)
  {
    id v8 = [v4 configuration];
    uint64_t v9 = [v8 senderConfigurationType];
    uint64_t v10 = a1[6];

    if (v9 == v10)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v11 = [v4 configuration];
      int v12 = [v11 contactsWithExceptions];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v18 = [v17 contactIdentifier];

            if (v18)
            {
              v19 = (void *)a1[4];
              long long v20 = [v17 contactIdentifier];
              [v19 addObject:v20];
            }
            else
            {
              long long v20 = __atxlog_handle_notification_management();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v17;
                _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_INFO, "Contact Identifier for %@ is nil. Skipping to next", buf, 0xCu);
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)modeConfigurationForDNDModeWithUUID:(id)a3
{
  return [(ATXDNDModeConfigurationClient *)self modeConfigurationForDNDModeWithUUID:a3 useCache:1];
}

- (id)modeConfigurationForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(ATXDNDModeConfigurationClient *)self dndModeForDNDModeWithUUID:v6 useCache:v4];
  id v8 = [v7 modeIdentifier];
  if (v8)
  {
    dndConfigurationService = self->_dndConfigurationService;
    id v15 = 0;
    uint64_t v10 = [(DNDModeConfigurationService *)dndConfigurationService modeConfigurationForModeIdentifier:v8 error:&v15];
    v11 = v15;
    int v12 = v11;
    if (!v10 && v11)
    {
      uint64_t v13 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:]((uint64_t)v8, (uint64_t)v12, v13);
      }
    }
  }
  else
  {
    int v12 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:]();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)getAllModeConfigurationsWithoutCache
{
  dndConfigurationService = self->_dndConfigurationService;
  id v8 = 0;
  uint64_t v3 = [(DNDModeConfigurationService *)dndConfigurationService modeConfigurationsReturningError:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXDNDModeConfigurationClient getAllModeConfigurationsWithoutCache]();
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (BOOL)isCloudSyncActive
{
  return [(DNDGlobalConfigurationService *)self->_dndGlobalConfigurationService isCloudSyncActive];
}

- (void)configuredModesDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(ATXDNDModeConfigurationClient *)self invalidateCaches];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        observerQueue = v3->_observerQueue;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __57__ATXDNDModeConfigurationClient_configuredModesDidChange__block_invoke;
        v10[3] = &unk_1E5D04FC8;
        v10[4] = v8;
        v10[5] = v3;
        dispatch_async(observerQueue, v10);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

uint64_t __57__ATXDNDModeConfigurationClient_configuredModesDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configuredModesDidChange:*(void *)(a1 + 40)];
}

+ (id)dndSemanticTypeToString:(int64_t)a3
{
  return (id)DNDModeSemanticTypeToString();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModesBySemanticType, 0);
  objc_storeStrong((id *)&self->_cachedModesByModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedModeConfig, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updateListener, 0);
  objc_storeStrong((id *)&self->_dndGlobalConfigurationService, 0);

  objc_storeStrong((id *)&self->_dndConfigurationService, 0);
}

void __38__ATXDNDModeConfigurationClient__init__block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "[%@] Configuration update handler failed with error %@", v6, v7, v8, v9, v10);
}

- (void)dndModeUUIDForDNDModeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to get UUID for DND Mode associated with mode identifier: %@", v2, v3, v4, v5, v6);
}

- (void)dndModeUUIDForDNDModeSemanticType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = DNDModeSemanticTypeToString();
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "There is more than 1 mode of type: %{public}@", v4, 0xCu);
}

- (void)iOSAppListForMode:configurationType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not fetch mode configurations and app allow list: %@", v2, v3, v4, v5, v6);
}

- (void)iOSContactListForMode:configurationType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not fetch mode configurations and contact allow list: %@", v2, v3, v4, v5, v6);
}

- (void)modeConfigurationForDNDModeWithUUID:useCache:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to access mode configuration for mode UUID because we couldn't find the modeIdentifier. Mode UUID: %@", v2, v3, v4, v5, v6);
}

- (void)modeConfigurationForDNDModeWithUUID:(os_log_t)log useCache:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Unable to fetch mode configuration for mode with mode identifier: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)getAllModeConfigurationsWithoutCache
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "%@ - Unable to fetch mode configurations with err: %@", v4, v5, v6, v7, v8);
}

@end