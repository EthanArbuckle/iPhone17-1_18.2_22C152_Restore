@interface DOCProtectedAppContainerCache
+ (BOOL)enabled;
- (CSSearchQuery)searchQuery;
- (DOCAppProtectionContextProviding)appProtectionContext;
- (DOCProtectedAppContainerCache)initWithDelegate:(id)a3;
- (DOCProtectedAppContainerCacheDelegate)delegate;
- (NSArray)apps;
- (id)appForAppContainerBundleID:(id)a3;
- (id)appForAppContainerOID:(id)a3;
- (id)description;
- (unint64_t)cacheStatus;
- (void)appForAppContainerBundleID:(id)a3 completion:(id)a4;
- (void)appForAppContainerOID:(id)a3 completion:(id)a4;
- (void)createProtectedAppLookupTablesFromResultSet:(id)a3 completionHandler:(id)a4;
- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(id)a3;
- (void)fetchAllAppContainerIDsFromCoreSpotlightIfNeeded;
- (void)lookupOIDs:(id)a3;
- (void)setAppProtectionContext:(id)a3;
- (void)setCacheStatus:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchQuery:(id)a3;
@end

@implementation DOCProtectedAppContainerCache

- (void)setAppProtectionContext:(id)a3
{
}

- (DOCProtectedAppContainerCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCProtectedAppContainerCache;
  v5 = [(DOCProtectedAppContainerCache *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_cacheStatus = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

+ (BOOL)enabled
{
  if (enabled_onceToken != -1) {
    dispatch_once(&enabled_onceToken, &__block_literal_global_16);
  }
  return enabled_enabled;
}

BOOL __40__DOCProtectedAppContainerCache_enabled__block_invoke()
{
  BOOL result = +[DOCFeature protectedAppsEnabled];
  enabled_enabled = result;
  return result;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DOCProtectedAppContainerCache;
  id v4 = [(DOCProtectedAppContainerCache *)&v11 description];
  unint64_t v5 = [(DOCProtectedAppContainerCache *)self cacheStatus];
  uint64_t v6 = [(NSMutableArray *)self->_appList count];
  appList = self->_appList;
  objc_super v8 = [(NSMutableDictionary *)self->_oidToAppMap allKeys];
  v9 = [v3 stringWithFormat:@"%@ cacheStatus=%lu, app count: %lu, apps=%@, oids=%@", v4, v5, v6, appList, v8];

  return v9;
}

- (NSArray)apps
{
  [(DOCProtectedAppContainerCache *)self fetchAllAppContainerIDsFromCoreSpotlightIfNeeded];
  if (self->_appList) {
    appList = self->_appList;
  }
  else {
    appList = (NSMutableArray *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)appList;
}

- (id)appForAppContainerOID:(id)a3
{
  id v4 = a3;
  [(DOCProtectedAppContainerCache *)self fetchAllAppContainerIDsFromCoreSpotlightIfNeeded];
  unint64_t v5 = [(NSMutableDictionary *)self->_oidToAppMap objectForKey:v4];

  return v5;
}

- (id)appForAppContainerBundleID:(id)a3
{
  id v4 = a3;
  [(DOCProtectedAppContainerCache *)self fetchAllAppContainerIDsFromCoreSpotlightIfNeeded];
  unint64_t v5 = [(NSMutableDictionary *)self->_appIdToAppMap objectForKey:v4];

  return v5;
}

- (void)appForAppContainerOID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__DOCProtectedAppContainerCache_appForAppContainerOID_completion___block_invoke;
  v10[3] = &unk_2641B60E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCProtectedAppContainerCache *)self fetchAllAppContainerIDsFromCoreSpotlightAsync:v10];
}

void __66__DOCProtectedAppContainerCache_appForAppContainerOID_completion___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)appForAppContainerBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__DOCProtectedAppContainerCache_appForAppContainerBundleID_completion___block_invoke;
  v10[3] = &unk_2641B60E0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCProtectedAppContainerCache *)self fetchAllAppContainerIDsFromCoreSpotlightAsync:v10];
}

void __71__DOCProtectedAppContainerCache_appForAppContainerBundleID_completion___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightIfNeeded
{
}

void __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke_cold_1(a1, v2);
  }
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(id)a3
{
  id v4 = (void (**)(void))a3;
  unint64_t v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    unint64_t v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.6(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (([(id)objc_opt_class() enabled] & 1) == 0)
  {
    v16 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v16 = docLogHandle;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.5(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_20;
  }
  v13 = [(DOCProtectedAppContainerCache *)self appProtectionContext];
  char v14 = [v13 hasAnyProtectedApps];

  if ((v14 & 1) == 0)
  {
    v24 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v24 = docLogHandle;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:].cold.4(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_20;
  }
  if ([(DOCProtectedAppContainerCache *)self cacheStatus])
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  if ([(DOCProtectedAppContainerCache *)self cacheStatus])
  {
    v15 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v15 = docLogHandle;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
LABEL_11:
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:](v15, self);
LABEL_20:
    v4[2](v4);
    goto LABEL_21;
  }
  [(DOCProtectedAppContainerCache *)self setCacheStatus:1];
  v32 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v32 = docLogHandle;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[DOCProtectedAppContainerCache fetchAllAppContainerIDsFromCoreSpotlightAsync:](v32, v33, v34, v35, v36, v37, v38, v39);
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke;
  v40[3] = &unk_2641B6658;
  v40[4] = self;
  v41 = v4;
  [(DOCProtectedAppContainerCache *)self lookupOIDs:v40];

LABEL_21:
}

void __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a2 mutableCopy];
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(void **)(v13 + 8);
  *(void *)(v13 + 8) = v12;

  uint64_t v15 = [v11 copy];
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 16);
  *(void *)(v16 + 16) = v15;

  uint64_t v18 = [v10 copy];
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void **)(v19 + 24);
  *(void *)(v19 + 24) = v18;

  uint64_t v21 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v21 = docLogHandle;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) setCacheStatus:2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v22 = [*(id *)(a1 + 32) delegate];
  [v22 appProtectionCacheDidUpdate:*(void *)(a1 + 32)];
}

- (CSSearchQuery)searchQuery
{
  searchQuery = self->_searchQuery;
  if (!searchQuery)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F02AD0]);
    [v4 setFetchAttributes:&unk_26C40CBE0];
    unint64_t v5 = (CSSearchQuery *)[objc_alloc(MEMORY[0x263F02AC8]) initWithQueryString:@"FPAppContainerBundleID == *" queryContext:v4];
    uint64_t v6 = self->_searchQuery;
    self->_searchQuery = v5;

    searchQuery = self->_searchQuery;
  }
  return searchQuery;
}

- (void)lookupOIDs:(id)a3
{
  id v4 = a3;
  unint64_t v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    unint64_t v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DOCProtectedAppContainerCache lookupOIDs:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  char v14 = [MEMORY[0x263EFF9A0] dictionary];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke;
  v26[3] = &unk_2641B6680;
  CFAbsoluteTime v28 = Current;
  id v15 = v14;
  id v27 = v15;
  uint64_t v16 = [(DOCProtectedAppContainerCache *)self searchQuery];
  [v16 setFoundItemsHandler:v26];

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_21;
  v21[3] = &unk_2641B66D0;
  objc_copyWeak(v24, &location);
  id v17 = v15;
  id v22 = v17;
  v24[1] = *(id *)&Current;
  id v18 = v4;
  id v23 = v18;
  uint64_t v19 = [(DOCProtectedAppContainerCache *)self searchQuery];
  [v19 setCompletionHandler:v21];

  uint64_t v20 = [(DOCProtectedAppContainerCache *)self searchQuery];
  [v20 start];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)(a1 + 40);
  uint64_t v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = v6;
    uint64_t v31 = [v3 count];
    v32 = [NSNumber numberWithDouble:Current - v5];
    *(_DWORD *)buf = 136315650;
    v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
    __int16 v41 = 2048;
    uint64_t v42 = v31;
    __int16 v43 = 2112;
    v44 = v32;
    _os_log_debug_impl(&dword_213670000, v30, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s found items: %lu took: %@ ms", buf, 0x20u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    id v33 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v13 = CFAbsoluteTimeGetCurrent();
        double v14 = *(double *)(a1 + 40);
        id v15 = [v12 attributeSet];
        uint64_t v16 = [v15 attributeForKey:@"FPAppContainerBundleID"];

        id v17 = [v12 attributeSet];
        id v18 = [v17 attributeForKey:@"_kMDItemOID"];

        uint64_t v19 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          uint64_t v19 = docLogHandle;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v27 = NSNumber;
          CFAbsoluteTime v28 = v19;
          uint64_t v29 = [v27 numberWithDouble:v13 - v14];
          *(_DWORD *)buf = 136315650;
          v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
          __int16 v41 = 2112;
          uint64_t v42 = (uint64_t)v12;
          __int16 v43 = 2112;
          v44 = v29;
          _os_log_debug_impl(&dword_213670000, v28, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s found item: %@ took: %@ ms", buf, 0x20u);

          id v7 = v33;
        }
        if (v16) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (v20)
        {
          uint64_t v21 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            uint64_t v21 = docLogHandle;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
            __int16 v41 = 2112;
            uint64_t v42 = (uint64_t)v16;
            __int16 v43 = 2112;
            v44 = v18;
            _os_log_debug_impl(&dword_213670000, v21, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s appID: %@ or oid: %@ were nil, skipping", buf, 0x20u);
          }
        }
        else
        {
          id v22 = [*(id *)(a1 + 32) valueForKey:v16];
          id v23 = v22;
          if (v22)
          {
            [v22 addObject:v18];
            v24 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v24 = docLogHandle;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
              __int16 v41 = 2112;
              uint64_t v42 = (uint64_t)v16;
              __int16 v43 = 2112;
              v44 = v18;
              _os_log_debug_impl(&dword_213670000, v24, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s existing appID: %@ adding oid: %@ to cache", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v25 = [MEMORY[0x263EFF9C0] set];
            [v25 addObject:v18];
            [*(id *)(a1 + 32) setValue:v25 forKey:v16];

            id v7 = v33;
          }
          uint64_t v26 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            uint64_t v26 = docLogHandle;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v40 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke";
            __int16 v41 = 2112;
            uint64_t v42 = (uint64_t)v16;
            __int16 v43 = 2112;
            v44 = v18;
            _os_log_debug_impl(&dword_213670000, v26, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s adding appID: %@ oid: %@ to cache", buf, 0x20u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }
}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_2;
    v7[3] = &unk_2641B66A8;
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [WeakRetained createProtectedAppLookupTablesFromResultSet:v5 completionHandler:v7];
  }
  else
  {
    uint64_t v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_21_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  double Current = CFAbsoluteTimeGetCurrent();
  double v14 = *(double *)(a1 + 40);
  id v15 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v15 = docLogHandle;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NSNumber;
    id v17 = v15;
    id v18 = [v16 numberWithDouble:Current - v14];
    int v19 = 136315650;
    BOOL v20 = "-[DOCProtectedAppContainerCache lookupOIDs:]_block_invoke_2";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_213670000, v17, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] AppCache: %s finished searching for all app container items. Error: %@. Took: %@ ms", (uint8_t *)&v19, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createProtectedAppLookupTablesFromResultSet:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  id v7 = (void (**)(id, id, id, id, void))a4;
  id v8 = [v6 array];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v11 = docLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DOCProtectedAppContainerCache createProtectedAppLookupTablesFromResultSet:completionHandler:]();
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __95__DOCProtectedAppContainerCache_createProtectedAppLookupTablesFromResultSet_completionHandler___block_invoke;
  v16[3] = &unk_2641B66F8;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  [v5 enumerateKeysAndObjectsUsingBlock:v16];
  id v15 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v15 = docLogHandle;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[DOCProtectedAppContainerCache createProtectedAppLookupTablesFromResultSet:completionHandler:]();
  }
  v7[2](v7, v12, v13, v14, 0);
}

void __95__DOCProtectedAppContainerCache_createProtectedAppLookupTablesFromResultSet_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[DOCProtectedApp alloc] initWith:v5 oids:v6];
  [a1[4] addObject:v7];
  [a1[5] setObject:v7 forKey:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(a1[6], "setObject:forKey:", v7, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (DOCAppProtectionContextProviding)appProtectionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionContext);
  return (DOCAppProtectionContextProviding *)WeakRetained;
}

- (DOCProtectedAppContainerCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DOCProtectedAppContainerCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSearchQuery:(id)a3
{
}

- (unint64_t)cacheStatus
{
  return self->_cacheStatus;
}

- (void)setCacheStatus:(unint64_t)a3
{
  self->_cacheStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appProtectionContext);
  objc_storeStrong((id *)&self->_oidToAppMap, 0);
  objc_storeStrong((id *)&self->_appIdToAppMap, 0);
  objc_storeStrong((id *)&self->_appList, 0);
}

void __81__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  [v2 count];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v3, v4, "[PROTECTED APPS] AppCache: %s fetched %lu apps", (uint8_t *)v5);
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  [a2 cacheStatus];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v3, v4, "[PROTECTED APPS] AppCache: %s cacheStatus: %lu fetching or already fetched, returning", (uint8_t *)v5);
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAllAppContainerIDsFromCoreSpotlightAsync:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__DOCProtectedAppContainerCache_fetchAllAppContainerIDsFromCoreSpotlightAsync___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v0, v1, "[PROTECTED APPS] AppCache: %s received new map. Error: %@", (uint8_t *)v2);
}

- (void)lookupOIDs:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__DOCProtectedAppContainerCache_lookupOIDs___block_invoke_21_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v0, v1, "[PROTECTED APPS] AppCache: %s finished searching for all app container items. Error: %@.", (uint8_t *)v2);
}

- (void)createProtectedAppLookupTablesFromResultSet:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v0, v1, "[PROTECTED APPS] AppCache: %s finished with: %@", (uint8_t *)v2);
}

- (void)createProtectedAppLookupTablesFromResultSet:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_213670000, v0, v1, "[PROTECTED APPS] AppCache: %s start with: %@", (uint8_t *)v2);
}

@end