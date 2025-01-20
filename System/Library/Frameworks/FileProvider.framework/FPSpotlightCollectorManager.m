@interface FPSpotlightCollectorManager
+ (FPSpotlightCollectorManager)sharedInstance;
+ (id)_mountPointsFromProviderDomains:(id)a3;
- (BOOL)areMountQueriesEnabled;
- (FPSpotlightCollectorManager)init;
- (NSArray)collectors;
- (NSMutableDictionary)collectorByDescriptor;
- (NSSet)currentMountPoints;
- (NSSet)effectiveCurrentMountPoints;
- (id)_recursiveDescription;
- (id)providerDomainChangesToken;
- (void)_observeFileProviderDomains;
- (void)collectorDidFinish:(id)a3;
- (void)dealloc;
- (void)disableMountPointQueries;
- (void)enableMountPointQueries;
- (void)registerDataSource:(id)a3;
- (void)resumeCollectors;
- (void)setAreMountQueriesEnabled:(BOOL)a3;
- (void)setCollectorByDescriptor:(id)a3;
- (void)setCurrentMountPoints:(id)a3;
- (void)setProviderDomainChangesToken:(id)a3;
- (void)suspendCollectors;
- (void)unregisterDataSource:(id)a3;
@end

@implementation FPSpotlightCollectorManager

- (void)unregisterDataSource:(id)a3
{
  id v5 = a3;
  v6 = [v5 queryDescriptor];
  v7 = self;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)v7->_collectorByDescriptor objectForKeyedSubscript:v6];
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:v7 file:@"FPSpotlightCollectorManager.m" lineNumber:106 description:@"Data source was unregistered but not previously registered"];
  }
  [v8 removeObserver:v5];
  v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightCollectorManager unregisterDataSource:]();
  }

  objc_sync_exit(v7);
}

- (void)registerDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 queryDescriptor];
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSMutableDictionary *)v6->_collectorByDescriptor objectForKeyedSubscript:v5];
  if (!v7)
  {
    v7 = [[FPSpotlightCollector alloc] initWithDescriptor:v5];
    [(FPSpotlightCollector *)v7 setDelegate:v6];
    [(NSMutableDictionary *)v6->_collectorByDescriptor setObject:v7 forKeyedSubscript:v5];
  }
  [(FPSpotlightCollector *)v7 addObserver:v4];
  v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightCollectorManager registerDataSource:]();
  }

  objc_sync_exit(v6);
}

+ (FPSpotlightCollectorManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPSpotlightCollectorManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (FPSpotlightCollectorManager *)v2;
}

uint64_t __45__FPSpotlightCollectorManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (FPSpotlightCollectorManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FPSpotlightCollectorManager;
  v2 = [(FPSpotlightCollectorManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    collectorByDescriptor = v2->_collectorByDescriptor;
    v2->_collectorByDescriptor = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"FPQueryCollectionDefaultMountPointIdentifier"];
    currentMountPoints = v2->_currentMountPoints;
    v2->_currentMountPoints = (NSSet *)v5;

    v2->_areMountQueriesEnabled = 1;
    [(FPSpotlightCollectorManager *)v2 _observeFileProviderDomains];
  }
  return v2;
}

- (void)_observeFileProviderDomains
{
  uint64_t v3 = [(FPSpotlightCollectorManager *)self providerDomainChangesToken];

  if (!v3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke;
    objc_super v8 = &unk_1E5AF5070;
    objc_copyWeak(&v9, &location);
    id v4 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:&v5];
    -[FPSpotlightCollectorManager setProviderDomainChangesToken:](self, "setProviderDomainChangesToken:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)setProviderDomainChangesToken:(id)a3
{
}

- (id)providerDomainChangesToken
{
  return objc_getProperty(self, a2, 16, 1);
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allValues];
  id v4 = +[FPSpotlightCollectorManager _mountPointsFromProviderDomains:v3];
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setCurrentMountPoints:v4];

  v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_cold_1(v5, v7);
  }

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  id v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_12;
  block[3] = &unk_1E5AF06C8;
  objc_copyWeak(&v11, v5);
  dispatch_after(v8, v9, block);

  objc_destroyWeak(&v11);
}

- (void)setCurrentMountPoints:(id)a3
{
}

+ (id)_mountPointsFromProviderDomains:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a3, "fp_map:", &__block_literal_global_49);
  v8[0] = @"FPQueryCollectionDefaultMountPointIdentifier";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v4 arrayByAddingObjectsFromArray:v3];

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v6;
}

uint64_t __63__FPSpotlightCollectorManager__mountPointsFromProviderDomains___block_invoke(uint64_t a1, void *a2)
{
  return [a2 spotlightMountPoint];
}

- (NSSet)effectiveCurrentMountPoints
{
  if ([(FPSpotlightCollectorManager *)self areMountQueriesEnabled])
  {
    uint64_t v3 = [(FPSpotlightCollectorManager *)self currentMountPoints];
    id v4 = (void *)[v3 copy];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:@"FPQueryCollectionDefaultMountPointIdentifier"];
  }

  return (NSSet *)v4;
}

- (void)enableMountPointQueries
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did enable querying mount points", v1, 2u);
}

- (BOOL)areMountQueriesEnabled
{
  return self->_areMountQueriesEnabled;
}

- (NSSet)currentMountPoints
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)collectors
{
  return (NSArray *)[(NSMutableDictionary *)self->_collectorByDescriptor allValues];
}

- (void)dealloc
{
  uint64_t v3 = [(FPSpotlightCollectorManager *)self providerDomainChangesToken];

  if (v3)
  {
    id v4 = [(FPSpotlightCollectorManager *)self providerDomainChangesToken];
    +[FPProviderDomain endMonitoringProviderDomainChanges:v4];

    [(FPSpotlightCollectorManager *)self setProviderDomainChangesToken:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightCollectorManager;
  [(FPSpotlightCollectorManager *)&v5 dealloc];
}

- (void)suspendCollectors
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  [(FPSpotlightCollectorManager *)v2 collectors];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v5 = 138412290;
    long long v10 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "suspend", v10, (void)v11);
        id v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did suspend collector %@", buf, 0xCu);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)resumeCollectors
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  [(FPSpotlightCollectorManager *)v2 collectors];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v5 = 138412290;
    long long v10 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "resume", v10, (void)v11);
        id v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did resume collector %@", buf, 0xCu);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)disableMountPointQueries
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Did disable querying mount points", v1, 2u);
}

- (void)collectorDidFinish:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 queryDescriptor];
  [(NSMutableDictionary *)v5->_collectorByDescriptor removeObjectForKey:v6];
  v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightCollectorManager collectorDidFinish:]();
  }

  objc_sync_exit(v5);
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_12(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend(WeakRetained, "collectors", 0);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = objc_loadWeakRetained(v1);
        long long v10 = [v9 effectiveCurrentMountPoints];
        [v8 mountPointsDidChange:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)_recursiveDescription
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = NSString;
  uint64_t v5 = [(FPSpotlightCollectorManager *)self collectors];
  uint64_t v6 = [v4 stringWithFormat:@"Collector Manager: %@ (%ld collectors)\n", self, objc_msgSend(v5, "count")];
  [v3 appendString:v6];

  unint64_t v7 = 0x1E4F29000uLL;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(FPSpotlightCollectorManager *)self collectors];
  uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v8;
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
        long long v10 = [v9 allObservers];
        long long v11 = [*(id *)(v7 + 24) stringWithFormat:@"\t\\ Collector: %@ (%ld observers)\n", v9, objc_msgSend(v10, "count")];
        [v3 appendString:v11];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v17;
                v19 = [*(id *)(v7 + 24) stringWithFormat:@"\t\t\\ Observer %@\n", v18];
                [v3 appendString:v19];

                v20 = [v18 delegate];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v22 = [v18 delegate];
                  v23 = *(void **)(v7 + 24);
                  [v22 items];
                  v25 = unint64_t v24 = v7;
                  v26 = [v23 stringWithFormat:@"\t\t\t\\ Collection %@ (%ld items)\n", v22, objc_msgSend(v25, "count")];
                  [v3 appendString:v26];

                  unint64_t v7 = v24;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v14);
        }

        uint64_t v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v30);
  }

  NSLog(&stru_1EF68C878.isa, v3);

  return v3;
}

- (NSMutableDictionary)collectorByDescriptor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCollectorByDescriptor:(id)a3
{
}

- (void)setAreMountQueriesEnabled:(BOOL)a3
{
  self->_areMountQueriesEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectorByDescriptor, 0);
  objc_storeStrong((id *)&self->_currentMountPoints, 0);

  objc_storeStrong(&self->_providerDomainChangesToken, 0);
}

- (void)registerDataSource:.cold.1()
{
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] SpotlightCollectorManager: Registered data source %@ for %@");
}

- (void)unregisterDataSource:.cold.1()
{
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] SpotlightCollectorManager: Unregistered data source %@ for %@");
}

- (void)collectorDidFinish:.cold.1()
{
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] SpotlightCollectorManager: Did remove finished collector %@ for descriptor %@");
}

void __58__FPSpotlightCollectorManager__observeFileProviderDomains__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained currentMountPoints];
  int v5 = 134217984;
  uint64_t v6 = [v4 count];
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] SpotlightCollectorManager: Provider domains have changed, number of current mount points: %ld", (uint8_t *)&v5, 0xCu);
}

@end