@interface ATXIntentMetadataCache
+ (id)sharedInstance;
- (ATXIntentMetadataCache)initWithDataStore:(id)a3 cacheInvalidationCriteria:(id)a4 startMonitoring:(BOOL)a5;
- (BOOL)isEligibleForWidgetsForIntent:(id)a3;
- (BOOL)supportsBackgroundExecutionForIntent:(id)a3;
- (id)_getCachedEligibleForWidgetsForIntent:(id)a3;
- (id)_getCachedSubtitleForCacheKey:(id)a3;
- (id)_getCachedSupportsBackgroundExecutionForIntent:(id)a3;
- (id)_getCachedTitleForCacheKey:(id)a3;
- (id)initInternal;
- (id)subtitleForIntent:(id)a3 localeIdentifier:(id)a4;
- (id)titleForIntent:(id)a3 localeIdentifier:(id)a4;
- (id)validParameterCombinationsWithSchemaForIntent:(id)a3;
- (void)_setEligibleForWidgets:(BOOL)a3 intent:(id)a4;
- (void)_setSubtitle:(id)a3 cacheKey:(id)a4;
- (void)_setSupportsBackgroundExecution:(BOOL)a3 intent:(id)a4;
- (void)_setTitle:(id)a3 cacheKey:(id)a4;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsDidUpdate:(id)a3;
- (void)setValidParameterCombinationsWithSchema:(id)a3 intent:(id)a4;
- (void)systemDidUpdate;
@end

@implementation ATXIntentMetadataCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATXIntentMetadataCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_29 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_29, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_38;
  return v2;
}

void __40__ATXIntentMetadataCache_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initInternal];
  v4 = (void *)sharedInstance__pasExprOnceResult_38;
  sharedInstance__pasExprOnceResult_38 = v3;
}

- (id)initInternal
{
  uint64_t v3 = +[_ATXDataStore sharedInstance];
  v4 = objc_opt_new();
  v5 = [(ATXIntentMetadataCache *)self initWithDataStore:v3 cacheInvalidationCriteria:v4 startMonitoring:1];

  return v5;
}

- (ATXIntentMetadataCache)initWithDataStore:(id)a3 cacheInvalidationCriteria:(id)a4 startMonitoring:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXIntentMetadataCache;
  v11 = [(ATXIntentMetadataCache *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataStore, a3);
    objc_storeStrong((id *)&v12->_invalidationCriteria, a4);
    if (v5) {
      [(ATXIntentMetadataCacheInvalidationMonitor *)v12->_invalidationCriteria setDelegateAndStartMonitoring:v12];
    }
  }

  return v12;
}

- (void)setValidParameterCombinationsWithSchema:(id)a3 intent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v7 includingParameters:1];
  if (v8 && [v6 count])
  {
    id v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(ATXIntentMetadataCacheKey *)v8 stringRepresentationForSerialization];
      int v13 = 138412290;
      objc_super v14 = v10;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving parameter combinations for cacheKey: %@", (uint8_t *)&v13, 0xCu);
    }
    [(_ATXDataStore *)self->_dataStore writeValidParameterCombinationsWithSchema:v6 cacheKey:v8];
  }
  else
  {
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v7 _className];
      int v13 = 138412290;
      objc_super v14 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save parameter combinations for intent: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)validParameterCombinationsWithSchemaForIntent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v4 includingParameters:1];

  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(ATXIntentMetadataCacheKey *)v5 stringRepresentationForSerialization];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached parameter combinations for cacheKey: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = [(_ATXDataStore *)self->_dataStore validParameterCombinationsWithSchemaForCacheKey:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsBackgroundExecutionForIntent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXIntentMetadataCache *)self _getCachedSupportsBackgroundExecutionForIntent:v4];
  id v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    uint64_t v7 = objc_msgSend(v4, "atx_supportsBackgroundExecution");
    [(ATXIntentMetadataCache *)self _setSupportsBackgroundExecution:v7 intent:v4];
  }

  return v7;
}

- (void)_setSupportsBackgroundExecution:(BOOL)a3 intent:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v6 includingParameters:1];
  v8 = __atxlog_handle_default();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = [(ATXIntentMetadataCacheKey *)v7 stringRepresentationForSerialization];
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving supportsBackgroundExecution for for cacheKey: %@", (uint8_t *)&v12, 0xCu);
    }
    [(_ATXDataStore *)self->_dataStore writeSupportsBackgroundExecution:v4 cacheKey:v7];
  }
  else
  {
    if (v9)
    {
      v11 = [v6 _className];
      int v12 = 138412290;
      int v13 = v11;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save supportsBackgroundExecution for intent: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_getCachedSupportsBackgroundExecutionForIntent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v4 includingParameters:1];

  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(ATXIntentMetadataCacheKey *)v5 stringRepresentationForSerialization];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached supportsBackgroundExecution for cacheKey: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = [(_ATXDataStore *)self->_dataStore supportsBackgroundExecutionForCacheKey:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)titleForIntent:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v6 includingParameterValues:1 localeIdentifier:v7];

  BOOL v9 = [(ATXIntentMetadataCache *)self _getCachedTitleForCacheKey:v8];
  int v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "atx_titleWithEfficientLocalization");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(ATXIntentMetadataCache *)self _setTitle:v11 cacheKey:v8];
  }

  return v11;
}

- (void)_setTitle:(id)a3 cacheKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_default();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = [v7 stringRepresentationForSerialization];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving title for cacheKey: %@", (uint8_t *)&v11, 0xCu);
    }
    [(_ATXDataStore *)self->_dataStore writeTitle:v6 cacheKey:v7];
  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save title because cacheKey is nil.", (uint8_t *)&v11, 2u);
    }
  }
}

- (id)_getCachedTitleForCacheKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 stringRepresentationForSerialization];
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached title for cacheKey: %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [(_ATXDataStore *)self->_dataStore titleForCacheKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)subtitleForIntent:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v6 includingParameterValues:1 localeIdentifier:v7];

  int v9 = [(ATXIntentMetadataCache *)self _getCachedSubtitleForCacheKey:v8];
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v6, "atx_subtitleWithEfficientLocalization");
    uint64_t v13 = (void *)v12;
    uint64_t v14 = &stru_1F2740B58;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    uint64_t v11 = v14;

    [(ATXIntentMetadataCache *)self _setSubtitle:v11 cacheKey:v8];
  }

  return v11;
}

- (void)_setSubtitle:(id)a3 cacheKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = __atxlog_handle_default();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = [v7 stringRepresentationForSerialization];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving subtitle for cacheKey: %@", (uint8_t *)&v11, 0xCu);
    }
    [(_ATXDataStore *)self->_dataStore writeSubtitle:v6 cacheKey:v7];
  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save subtitle because cacheKey is nil.", (uint8_t *)&v11, 2u);
    }
  }
}

- (id)_getCachedSubtitleForCacheKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 stringRepresentationForSerialization];
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached subtitle for cacheKey: %@", (uint8_t *)&v9, 0xCu);
    }
    id v7 = [(_ATXDataStore *)self->_dataStore subtitleForCacheKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isEligibleForWidgetsForIntent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXIntentMetadataCache *)self _getCachedEligibleForWidgetsForIntent:v4];
  id v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    uint64_t v7 = objc_msgSend(v4, "atx_isEligibleForWidgets");
    [(ATXIntentMetadataCache *)self _setEligibleForWidgets:v7 intent:v4];
  }

  return v7;
}

- (void)_setEligibleForWidgets:(BOOL)a3 intent:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v6 includingParameters:0];
  v8 = __atxlog_handle_default();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = [(ATXIntentMetadataCacheKey *)v7 stringRepresentationForSerialization];
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache saving isEligibleForWidgets for cacheKey: %@", (uint8_t *)&v12, 0xCu);
    }
    [(_ATXDataStore *)self->_dataStore writeEligibleForWidgets:v4 cacheKey:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = [v6 _className];
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache couldn't save isEligibleForWidgets for intent: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)_getCachedEligibleForWidgetsForIntent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [[ATXIntentMetadataCacheKey alloc] initWithIntent:v4 includingParameters:0];

  if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(ATXIntentMetadataCacheKey *)v5 stringRepresentationForSerialization];
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXIntentMetadataCache fetching cached isEligibleForWidgets for cacheKey: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = [(_ATXDataStore *)self->_dataStore isEligibleForWidgetsForCacheKey:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)applicationsDidUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating intents due to app registration for bundleId %@", buf, 0xCu);
        }

        [(_ATXDataStore *)self->_dataStore removeCachedIntentsWithBundleId:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v9;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating intents due to app uninstall for bundleId %@", buf, 0xCu);
        }

        [(_ATXDataStore *)self->_dataStore removeCachedIntentsWithBundleId:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)systemDidUpdate
{
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXIntentMetadataCache invalidating all intents due to OS update", v4, 2u);
  }

  [(_ATXDataStore *)self->_dataStore removeAllCachedIntents];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationCriteria, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end