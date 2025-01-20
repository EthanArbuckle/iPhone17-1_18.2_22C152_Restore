@interface BRContainerCache
+ (BOOL)hasDaemonicParts;
+ (BOOL)isManagedProvider;
+ (BOOL)isPersonalProvider;
+ (id)containerCache;
+ (id)containerCacheForPersonaID:(id)a3;
+ (id)containerHelper;
- (BOOL)_updateContainersCache;
- (BRContainerCache)initWithHelper:(id)a3 personaID:(id)a4;
- (id)_allContainersByIDNoCopyBlocking:(BOOL)a3;
- (id)allContainersBlockIfNeeded:(BOOL)a3;
- (id)allContainersByID;
- (id)containerByID:(id)a3;
- (id)documentContainers;
- (void)_accountWillChange;
- (void)_containerListDidChange;
- (void)_updateContainersCache;
- (void)dealloc;
- (void)documentContainers;
- (void)invalidateAndClearCache:(BOOL)a3;
- (void)subscribeToContainerStatusUpdate;
- (void)unsubscribeToContainerStatusUpdate;
@end

@implementation BRContainerCache

+ (BOOL)isPersonalProvider
{
  if (isPersonalProvider_once != -1) {
    dispatch_once(&isPersonalProvider_once, &__block_literal_global_552);
  }
  return isPersonalProvider_isPersonalProvider;
}

+ (BOOL)isManagedProvider
{
  if (isManagedProvider_once != -1) {
    dispatch_once(&isManagedProvider_once, &__block_literal_global_560);
  }
  return isManagedProvider_isManagedProvider;
}

void __38__BRContainerCache_isPersonalProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = BRIsFPFSEnabled(a1, a2);
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v6 bundleIdentifier];
  v4 = v3;
  if (v2) {
    v5 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  }
  else {
    v5 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  }
  isPersonalProvider_isPersonalProvider = [v3 isEqualToString:v5];
}

void __37__BRContainerCache_isManagedProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = BRIsFPFSEnabled(a1, a2);
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v6 bundleIdentifier];
  v4 = v3;
  if (v2) {
    v5 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  }
  else {
    v5 = @"com.apple.CloudDocs.MobileDocumentsFileProviderManaged";
  }
  isManagedProvider_isManagedProvider = [v3 isEqualToString:v5];
}

- (BRContainerCache)initWithHelper:(id)a3 personaID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v52 = brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]", 2609);
    v53 = brc_default_log(0);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      -[BRContainerCache initWithHelper:personaID:]();
    }
  }
  v67.receiver = self;
  v67.super_class = (Class)BRContainerCache;
  v9 = [(BRContainerCache *)&v67 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_helper, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    containersByID = v10->_containersByID;
    v10->_containersByID = v11;

    uint64_t v13 = objc_opt_new();
    fetchedContainerIDs = v10->_fetchedContainerIDs;
    v10->_fetchedContainerIDs = (NSMutableSet *)v13;

    v10->_containerCacheUptodate = 0;
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.clouddocs.container-cache-queue", v16);

    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    uint64_t v19 = br_pacer_create("com.apple.clouddocs.container-invalidation-pacer", v10->_queue, 1.0);
    invalidationPacer = v10->_invalidationPacer;
    v10->_invalidationPacer = (br_pacer *)v19;

    objc_initWeak(&location, v10);
    v21 = v10->_invalidationPacer;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke;
    v64[3] = &unk_1E59AE2E8;
    objc_copyWeak(&v65, &location);
    br_pacer_set_event_handler(v21, v64);
    br_pacer_resume((unsigned __int8 *)v10->_invalidationPacer);
    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, 0);
    memoryPressureSource = v10->_memoryPressureSource;
    v10->_memoryPressureSource = (OS_dispatch_source *)v22;

    v24 = v10->_memoryPressureSource;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_526;
    v62[3] = &unk_1E59AE2E8;
    objc_copyWeak(&v63, &location);
    v25 = v24;
    v26 = v62;
    v27 = v25;
    v28 = v26;
    v29 = v28;
    v30 = v28;
    if (brc_block_remember_persona)
    {
      v30 = brc_block_remember_persona(v28);
    }
    id v54 = v8;
    id obj = a4;
    dispatch_block_t v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v30);
    dispatch_source_set_event_handler(v27, v31);

    dispatch_resume((dispatch_object_t)v10->_memoryPressureSource);
    int out_token = 0;
    objc_msgSend(@"BRContainerCacheDidChangeDistributedNotification", "br_libnotifyPerUserNotificationName");
    id v32 = objc_claimAutoreleasedReturnValue();
    v33 = (const char *)[v32 UTF8String];
    v34 = dispatch_get_global_queue(0, 0);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_527;
    v59[3] = &unk_1E59AF498;
    objc_copyWeak(&v60, &location);
    v35 = v34;
    v36 = v59;
    v37 = [MEMORY[0x1E4FB36F8] sharedManager];
    v38 = objc_msgSend(v37, "br_currentPersonaID");

    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v69 = 3221225472;
    v70 = __br_notify_register_dispatch_block_invoke_4;
    v71 = &unk_1E59AD580;
    id v39 = v38;
    id v72 = v39;
    v74 = v33;
    v40 = v36;
    id v73 = v40;
    notify_register_dispatch(v33, &out_token, v35, &handler);

    objc_storeStrong((id *)&v10->_personaID, obj);
    int v58 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_2;
    v56[3] = &unk_1E59AF498;
    objc_copyWeak(&v57, &location);
    v41 = v35;
    v42 = v56;
    v43 = [MEMORY[0x1E4FB36F8] sharedManager];
    v44 = objc_msgSend(v43, "br_currentPersonaID");

    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v69 = 3221225472;
    v70 = __br_notify_register_dispatch_block_invoke_4;
    v71 = &unk_1E59AD580;
    id v45 = v44;
    id v72 = v45;
    v74 = "com.apple.tcc.access.changed";
    v46 = v42;
    id v73 = v46;
    uint32_t v47 = notify_register_dispatch("com.apple.tcc.access.changed", &v58, v41, &handler);

    id v8 = v54;
    if (v47)
    {
      v48 = brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]", 2648);
      v49 = brc_default_log(0);
      if (os_log_type_enabled(v49, (os_log_type_t)0x90u)) {
        -[BRContainerCache initWithHelper:personaID:]((uint64_t)v48, v47, v49);
      }
    }
    +[BRAccount startAccountTokenChangeObserverIfNeeded];
    v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v50 addObserver:v10 selector:sel__accountWillChange name:@"BRAccountTokenWillChangeNotification" object:0];

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&v63);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke(uint64_t a1)
{
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2621, v5);
  int v2 = brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2621);
  v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_cold_1(v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateAndClearCache:0];

  __brc_leave_section((uint64_t)v5);
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_526(uint64_t a1)
{
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2630, v5);
  int v2 = brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2630);
  v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_526_cold_1(v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateAndClearCache:1];

  __brc_leave_section((uint64_t)v5);
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_527(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _containerListDidChange];
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_2(uint64_t a1)
{
  int v2 = brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke_2", 2644);
  v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_2_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateAndClearCache:1];
}

- (void)dealloc
{
  br_pacer_cancel(self->_invalidationPacer);
  dispatch_source_cancel((dispatch_source_t)self->_memoryPressureSource);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = 0;

  [(BRContainerCache *)self unsubscribeToContainerStatusUpdate];
  v4.receiver = self;
  v4.super_class = (Class)BRContainerCache;
  [(BRContainerCache *)&v4 dealloc];
}

+ (id)containerHelper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__BRContainerCache_containerHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (containerHelper_once != -1) {
    dispatch_once(&containerHelper_once, block);
  }
  int v2 = (void *)containerHelper_helper;

  return v2;
}

uint64_t __35__BRContainerCache_containerHelper__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasDaemonicParts]) {
    v1 = NSClassFromString((NSString *)@"BRCDaemonContainerHelper");
  }
  else {
    v1 = objc_opt_class();
  }
  containerHelper_helper = [v1 sharedHelper];

  return MEMORY[0x1F41817F8]();
}

+ (id)containerCacheForPersonaID:(id)a3
{
  id v4 = a3;
  if (containerCacheForPersonaID__onceToken != -1) {
    dispatch_once(&containerCacheForPersonaID__onceToken, &__block_literal_global_542);
  }
  id v5 = (id)containerCacheForPersonaID__containerCacheByPersona;
  objc_sync_enter(v5);
  id v6 = [(id)containerCacheForPersonaID__containerCacheByPersona objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v7 = [BRContainerCache alloc];
    id v8 = [a1 containerHelper];
    id v6 = [(BRContainerCache *)v7 initWithHelper:v8 personaID:v4];

    [(id)containerCacheForPersonaID__containerCacheByPersona setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

uint64_t __47__BRContainerCache_containerCacheForPersonaID___block_invoke()
{
  containerCacheForPersonaID__containerCacheByPersona = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (id)containerCache
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v4 = objc_msgSend(v3, "br_currentPersonaID");

  id v5 = [a1 containerCacheForPersonaID:v4];

  return v5;
}

- (id)allContainersBlockIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = -[BRContainerCache _allContainersByIDNoCopyBlocking:](v4, "_allContainersByIDNoCopyBlocking:", [(id)objc_opt_class() hasDaemonicParts] | v3);
  id v6 = [v5 allValues];

  objc_sync_exit(v4);

  return v6;
}

- (id)documentContainers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = -[BRContainerCache _allContainersByIDNoCopyBlocking:](v2, "_allContainersByIDNoCopyBlocking:", 1, 0);
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isDocumentScopePublic]
          && ([v9 isCloudSyncTCCDisabled] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v2);
  v10 = brc_bread_crumbs((uint64_t)"-[BRContainerCache documentContainers]", 2733);
  v11 = brc_default_log(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRContainerCache documentContainers]((uint64_t)v3);
  }

  return v3;
}

- (void)_accountWillChange
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] won't restore persona: %@%@", (void)v3, DWORD2(v3));
}

void __38__BRContainerCache__accountWillChange__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_accountWillChange___personalPersona;
  _accountWillChange___personalPersona = v0;
}

- (id)allContainersByID
{
  id v2 = self;
  objc_sync_enter(v2);
  long long v3 = [(BRContainerCache *)v2 _allContainersByIDNoCopyBlocking:1];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);

  return v4;
}

- (id)containerByID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_containerCacheUptodate
    || ([(NSMutableSet *)v5->_fetchedContainerIDs containsObject:v4] & 1) != 0)
  {
    containersByID = v5->_containersByID;
    uint64_t v7 = [v4 appLibraryOrZoneName];
    id v8 = [(NSMutableDictionary *)containersByID objectForKeyedSubscript:v7];

    if (v8) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  id v8 = [(BRContainerHelper *)v5->_helper fetchContainerForMangledID:v4 personaID:v5->_personaID];
  if (!v8)
  {
LABEL_4:
    v9 = brc_bread_crumbs((uint64_t)"-[BRContainerCache containerByID:]", 2767);
    v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] could not find container for id: %@%@", (uint8_t *)&v16, 0x16u);
    }

    id v8 = 0;
    goto LABEL_11;
  }
  v11 = brc_bread_crumbs((uint64_t)"-[BRContainerCache containerByID:]", 2759);
  v12 = brc_default_log(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRContainerCache containerByID:]((uint64_t)v4);
  }

  long long v13 = v5->_containersByID;
  long long v14 = [v4 appLibraryOrZoneName];
  [(NSMutableDictionary *)v13 setObject:v8 forKeyedSubscript:v14];

  [(NSMutableSet *)v5->_fetchedContainerIDs addObject:v4];
LABEL_11:
  objc_sync_exit(v5);

  return v8;
}

- (void)subscribeToContainerStatusUpdate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_containerStatusObserver)
  {
    long long v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    objc_initWeak(&location, v2);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __52__BRContainerCache_subscribeToContainerStatusUpdate__block_invoke;
    v11 = &unk_1E59AF4C0;
    objc_copyWeak(&v12, &location);
    id v4 = (void *)MEMORY[0x19F3C48D0](&v8);
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1, v8, v9, v10, v11);
    uint64_t v6 = [v3 addObserverForName:BRContainerDidChangeStatusDistributedNotification object:0 queue:v5 usingBlock:v4];
    containerStatusObserver = v2->_containerStatusObserver;
    v2->_containerStatusObserver = v6;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

void __52__BRContainerCache_subscribeToContainerStatusUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v16 userInfo];
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    uint64_t v6 = [v5 _allContainersByIDNoCopyBlocking:1];
    uint64_t v7 = [v4 objectForKeyedSubscript:BRContainerIDKey];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    objc_sync_exit(v5);
    uint64_t v9 = [v4 objectForKeyedSubscript:BRContainerCurrentStatusKey];

    if (v9)
    {
      v10 = [v4 objectForKeyedSubscript:BRContainerCurrentStatusKey];
      objc_msgSend(v8, "setCurrentStatus:", objc_msgSend(v10, "unsignedIntegerValue"));
    }
    v11 = [v4 objectForKeyedSubscript:BRContainerlastServerUpdateKey];

    if (v11)
    {
      id v12 = [v4 objectForKeyedSubscript:BRContainerlastServerUpdateKey];
      long long v13 = [MEMORY[0x1E4F1C9C8] distantPast];
      int v14 = [v12 isEqualToDate:v13];

      if (v14) {
        long long v15 = 0;
      }
      else {
        long long v15 = v12;
      }
      [v8 setLastServerUpdate:v15];
    }
  }
}

- (void)unsubscribeToContainerStatusUpdate
{
  id obj = self;
  objc_sync_enter(obj);
  id v2 = obj;
  if (obj->_containerStatusObserver)
  {
    long long v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:obj->_containerStatusObserver];
    containerStatusObserver = obj->_containerStatusObserver;
    obj->_containerStatusObserver = 0;

    id v2 = obj;
  }
  objc_sync_exit(v2);
}

+ (BOOL)hasDaemonicParts
{
  if (hasDaemonicParts_once_0 != -1) {
    dispatch_once(&hasDaemonicParts_once_0, &__block_literal_global_550);
  }
  return hasDaemonicParts_hasDaemonicParts_0;
}

void __36__BRContainerCache_hasDaemonicParts__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  hasDaemonicParts_hasDaemonicParts_0 = [v0 isEqualToString:@"com.apple.bird"];
}

- (void)_containerListDidChange
{
}

- (void)invalidateAndClearCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  [(BRContainerCache *)v4 unsubscribeToContainerStatusUpdate];
  if (v3)
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[BRContainerCache invalidateAndClearCache:]", 2877);
    uint64_t v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(NSMutableDictionary *)v4->_containersByID count];
      personaID = v4->_personaID;
      int v13 = 134218498;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = personaID;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] removing %lu containers from cache of persona: %@%@", (uint8_t *)&v13, 0x20u);
    }

    [(NSMutableDictionary *)v4->_containersByID removeAllObjects];
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs((uint64_t)"-[BRContainerCache invalidateAndClearCache:]", 2880);
    uint64_t v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRContainerCache invalidateAndClearCache:]();
    }
  }
  v4->_containerCacheUptodate = 0;
  [(NSMutableSet *)v4->_fetchedContainerIDs removeAllObjects];
  objc_sync_exit(v4);

  uint64_t v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v9 postNotificationName:BRContainerListDidChangeDistributedNotification object:0];

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:BRContainerListDidChangeNotification object:0];
}

- (BOOL)_updateContainersCache
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_containerCacheUptodate) {
    return 0;
  }
  helper = self->_helper;
  id v12 = 0;
  id v5 = [(BRContainerHelper *)helper fetchAllContainersByIDWithError:&v12];
  id v6 = v12;
  BOOL v2 = v5 != 0;
  if (v5)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    [(NSMutableDictionary *)v7->_containersByID removeAllObjects];
    [(NSMutableSet *)v7->_fetchedContainerIDs removeAllObjects];
    [(NSMutableDictionary *)v7->_containersByID addEntriesFromDictionary:v5];
    self->_containerCacheUptodate = 1;
    uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRContainerCache _updateContainersCache]", 2910);
    uint64_t v9 = brc_default_log(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(BRContainerCache *)(uint64_t)v8 _updateContainersCache];
    }

    objc_sync_exit(v7);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache _updateContainersCache]", 2914);
    uint64_t v7 = (BRContainerCache *)objc_claimAutoreleasedReturnValue();
    v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to fetch all containers: %@%@", buf, 0x16u);
    }
  }
  return v2;
}

- (id)_allContainersByIDNoCopyBlocking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(BRContainerHelper *)self->_helper canFetchAllContainersByID])
  {
    if (!self->_containerCacheUptodate)
    {
      if (v3)
      {
        [(BRContainerCache *)self _updateContainersCache];
      }
      else
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__BRContainerCache__allContainersByIDNoCopyBlocking___block_invoke;
        block[3] = &unk_1E59AD3B0;
        block[4] = self;
        dispatch_async(queue, block);
      }
    }
  }
  else
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[BRContainerCache _allContainersByIDNoCopyBlocking:]", 2940);
    id v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int IsContainerProxy = BRCurrentProcessIsContainerProxy();
      uint64_t v8 = @"NO";
      if (IsContainerProxy) {
        uint64_t v8 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] client can't fetch all containers by ID (isContainerProxy: %@)%@", buf, 0x16u);
    }
  }
  containersByID = self->_containersByID;

  return containersByID;
}

void __53__BRContainerCache__allContainersByIDNoCopyBlocking___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _updateContainersCache])
  {
    id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:BRContainerListDidChangeNotification object:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStatusObserver, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_invalidationPacer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fetchedContainerIDs, 0);
  objc_storeStrong((id *)&self->_containersByID, 0);
  objc_storeStrong((id *)&self->_helper, 0);

  objc_storeStrong((id *)&self->_personaID, 0);
}

- (void)initWithHelper:(os_log_t)log personaID:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] Can't register to TCC access changed; error: %d%@",
    (uint8_t *)v3,
    0x12u);
}

- (void)initWithHelper:personaID:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: helper%@", v2, v3, v4, v5, v6);
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┏%llx invalidating container cache%@", (void)v3, DWORD2(v3));
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_526_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┏%llx Invalidate cache after receiving memory pressure%@", (void)v3, DWORD2(v3));
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] TCC access changed, invalidating cache%@", v2, v3, v4, v5, v6);
}

- (void)documentContainers
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] Document containers returning %@%@", (void)v3, DWORD2(v3));
}

- (void)containerByID:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] added 1 container with mangledID %@ to cache%@", (void)v3, DWORD2(v3));
}

- (void)invalidateAndClearCache:.cold.1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] Marking container cache stale for persona: %@%@", (void)v3, DWORD2(v3));
}

- (void)_updateContainersCache
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] added %lu containers to cache%@", buf, 0x16u);
}

@end