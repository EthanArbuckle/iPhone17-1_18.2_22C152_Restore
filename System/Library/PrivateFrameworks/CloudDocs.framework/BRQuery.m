@interface BRQuery
+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3;
+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3;
+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4;
+ (void)didEndPossibleFileOperation:(id)a3;
+ (void)initialize;
- (BOOL)_collectUpdates:(id)a3;
- (BRNotificationReceiver)receiver;
- (BRQuery)initWithQuery:(id)a3 values:(id)a4 sortingAttributes:(id)a5 items:(id)a6;
- (NSMetadataQuery)query;
- (NSString)description;
- (const)resultAtIndex:(int64_t)a3;
- (id)_classifyItems:(id)a3 deletedItemIDs:(id)a4;
- (id)_replacementObjectForQueryItem:(id)a3;
- (id)_replacementObjectsForArrayOfQueryItem:(id)a3;
- (id)attributeValueForName:(id)a3 forResultAtIndex:(int64_t)a4;
- (id)queryQueue;
- (id)valuesOfAttribute:(id)a3;
- (int64_t)indexOfResult:(const void *)a3;
- (unint64_t)countOfResultsForAttributeName:(id)a3 value:(id)a4;
- (unint64_t)resultCount;
- (unsigned)executeWithOptions:(unint64_t)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_handleAddedItemsNotifications:(id)a3 userInfo:(id)a4;
- (void)_handleRemovedItemsNotifications:(id)a3 userInfo:(id)a4;
- (void)_handleReplacedItemsNotifications:(id)a3 userInfo:(id)a4;
- (void)_monitorNetworkForQueryItemIfNecessary:(id)a3 fpItemID:(id)a4;
- (void)_monitorTransferForFPItemIfNecessary:(id)a3;
- (void)_performBlockAsync:(id)a3;
- (void)_postNote:(__CFString *)a3;
- (void)_postNote:(__CFString *)a3 userInfo:(id)a4;
- (void)_processChanges:(id)a3;
- (void)_processProgressUpdateBatch;
- (void)_processUpdates;
- (void)_runQuery;
- (void)_sendHasUpdateNotificationIfNeeded;
- (void)_setQueryState:(int)a3;
- (void)_stopMonitoringTransferForFPItemID:(id)a3;
- (void)_stopProgressObservers;
- (void)_watchScopes;
- (void)dealloc;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)itemCollectionGathererDidInvalidate;
- (void)itemCollectionGathererDidReceiveUpdates:(id)a3 deleteItemsWithIDs:(id)a4;
- (void)itemCollectionGathererFinishedGathering;
- (void)itemCollectionGathererGatheredItems:(id)a3;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)notificationReceiverDidReceiveNotifications:(id)a3;
- (void)notificationsReceiverDidFinishGathering:(id)a3;
- (void)notificationsReceiverDidInvalidate:(id)a3;
- (void)notificationsReceiverDidReceiveNotificationsBatch:(id)a3;
- (void)processUpdates;
- (void)setBatchingParameters:(id *)a3;
- (void)setCreateResultFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5;
- (void)setCreateValueFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5;
- (void)setExternalDocumentsBundleIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryQueue:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setSearchScope:(id)a3 withOptions:(unsigned int)a4;
- (void)setSendHasUpdateNotification:(BOOL)a3;
- (void)setSortComparator:(void *)a3 withContext:(void *)a4;
- (void)stop;
@end

@implementation BRQuery

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    gBRActiveQueriesSet = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3
{
  id v3 = a3;
  if (!atomic_load_explicit(&gBRActiveQueries, memory_order_acquire)) {
    goto LABEL_12;
  }
  int active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) == 2)
  {
LABEL_5:
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (active_platform == 11)
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_12;
    }
  }
  else
  {
    if (active_platform == 1) {
      goto LABEL_5;
    }
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
  }
LABEL_10:
  if (objc_msgSend(v3, "br_isInSyncedLocation"))
  {
    v5 = [[BRQueryStitch alloc] initWithURL:v3 objid:0 kind:0];
    pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
    v6 = [(id)gBRActiveQueriesSet allObjects];
    [(BRQueryStitch *)v5 setQueries:v6];

    pthread_rwlock_unlock(&gBRActiveQueriesMutex);
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
LABEL_13:

  return v5;
}

+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!atomic_load_explicit(&gBRActiveQueries, memory_order_acquire)) {
    goto LABEL_14;
  }
  int active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) == 2)
  {
LABEL_5:
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (active_platform == 11)
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_14;
    }
  }
  else
  {
    if (active_platform == 1) {
      goto LABEL_5;
    }
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
  }
LABEL_10:
  if ((objc_msgSend(v5, "br_isInSyncedLocation") & 1) != 0 || objc_msgSend(v6, "br_isInSyncedLocation"))
  {
    v8 = +[BRFileObjectID fileObjectIDForURL:v5 allocateDocID:1 error:0];
    if (v8)
    {
      v9 = [[BRQueryStitch alloc] initWithURL:v6 objid:v8 kind:1];
      [(BRQueryStitch *)v9 setFromURL:v5];
      pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
      v10 = [(id)gBRActiveQueriesSet allObjects];
      [(BRQueryStitch *)v9 setQueries:v10];

      pthread_rwlock_unlock(&gBRActiveQueriesMutex);
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_17;
  }
LABEL_14:
  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3
{
  id v3 = a3;
  if (!atomic_load_explicit(&gBRActiveQueries, memory_order_acquire)) {
    goto LABEL_13;
  }
  int active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) == 2)
  {
LABEL_5:
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (active_platform == 11)
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_13;
    }
  }
  else
  {
    if (active_platform == 1) {
      goto LABEL_5;
    }
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
  }
LABEL_10:
  if (objc_msgSend(v3, "br_isInSyncedLocation"))
  {
    id v5 = +[BRFileObjectID fileObjectIDForURL:v3 allocateDocID:0 error:0];
    if (v5)
    {
      id v6 = [[BRQueryStitch alloc] initWithURL:v3 objid:v5 kind:2];
      pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
      v7 = [(id)gBRActiveQueriesSet allObjects];
      [(BRQueryStitch *)v6 setQueries:v7];

      pthread_rwlock_unlock(&gBRActiveQueriesMutex);
    }
    else
    {
      id v6 = 0;
    }

    goto LABEL_14;
  }
LABEL_13:
  id v6 = 0;
LABEL_14:

  return v6;
}

+ (void)didEndPossibleFileOperation:(id)a3
{
}

- (NSString)description
{
  if (atomic_load_explicit(&self->_disableCount, memory_order_acquire)) {
    v2 = @"suspended";
  }
  else {
    v2 = @"running";
  }
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %@ state:%s predicate:%@>", objc_opt_class(), self, v2, queryStateToCString[self->_queryState], self->_predicate];
}

- (BRQuery)initWithQuery:(id)a3 values:(id)a4 sortingAttributes:(id)a5 items:(id)a6
{
  id v9 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BRQuery;
  id v10 = a5;
  id v11 = a4;
  v12 = [(BRQuery *)&v48 init];
  [v12 setQuery:v9];
  uint64_t v13 = [v9 predicate];
  v14 = (void *)*((void *)v12 + 6);
  *((void *)v12 + 6) = v13;

  int v17 = BRIsFPFSEnabled(v15, v16);
  v12[96] = v17;
  if (v17)
  {
    v18 = [[BRItemCollectionGatherer alloc] initWithDelegate:v12 query:v9];
    v19 = (void *)*((void *)v12 + 36);
    *((void *)v12 + 36) = v18;

    uint64_t v20 = objc_opt_new();
    v21 = (void *)*((void *)v12 + 37);
    *((void *)v12 + 37) = v20;

    uint64_t v22 = objc_opt_new();
    v23 = (void *)*((void *)v12 + 38);
    *((void *)v12 + 38) = v22;

    uint64_t v24 = objc_opt_new();
    v25 = (void *)*((void *)v12 + 41);
    *((void *)v12 + 41) = v24;

    v26 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(v26, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("br-progress-queue", v27);

    v29 = (void *)*((void *)v12 + 43);
    *((void *)v12 + 43) = v28;

    uint64_t v30 = br_pacer_create("br-progress-pacer", *((void **)v12 + 43), 1.0);
    v31 = (void *)*((void *)v12 + 42);
    *((void *)v12 + 42) = v30;

    v32 = (void *)*((void *)v12 + 42);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __56__BRQuery_initWithQuery_values_sortingAttributes_items___block_invoke;
    v46[3] = &unk_1E59AD3B0;
    v47 = v12;
    br_pacer_set_event_handler(v32, v46);
    br_pacer_resume(*((unsigned __int8 **)v12 + 42));
    v33 = v47;
  }
  else
  {
    v34 = objc_alloc_init(BRNotificationReceiver);
    v33 = (char *)*((void *)v12 + 4);
    *((void *)v12 + 4) = v34;
  }

  uint64_t v35 = [v11 copy];
  v36 = (void *)*((void *)v12 + 13);
  *((void *)v12 + 13) = v35;

  uint64_t v37 = [v10 copy];
  v38 = (void *)*((void *)v12 + 14);
  *((void *)v12 + 14) = v37;

  *(_OWORD *)(v12 + 120) = xmmword_19EDD6880;
  *(_OWORD *)(v12 + 136) = xmmword_19EDD6880;
  *(_OWORD *)(v12 + 152) = xmmword_19EDD6880;
  uint64_t v39 = objc_opt_new();
  v40 = (void *)*((void *)v12 + 8);
  *((void *)v12 + 8) = v39;

  uint64_t v41 = objc_opt_new();
  v42 = (void *)*((void *)v12 + 9);
  *((void *)v12 + 9) = v41;

  uint64_t v43 = objc_opt_new();
  v44 = (void *)*((void *)v12 + 10);
  *((void *)v12 + 10) = v43;

  return (BRQuery *)v12;
}

uint64_t __56__BRQuery_initWithQuery_values_sortingAttributes_items___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processProgressUpdateBatch];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _receiver.delegate == nil%@", v2, v3, v4, v5, v6);
}

- (id)valuesOfAttribute:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_results, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint8_t v6 = self->_results;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      v12 = v9;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(id *)(*((void *)&v15 + 1) + 8 * v11);

        uint64_t v13 = objc_msgSend(v9, "attributeForName:", v4, (void)v15);
        if (v13) {
          [v5 addObject:v13];
        }

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_setQueryState:(int)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  memset(v28, 0, sizeof(v28));
  __brc_create_section(0, (uint64_t)"-[BRQuery _setQueryState:]", 557, v28);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQuery _setQueryState:]", 557);
  uint8_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = queryStateToCString[a3];
    *(_DWORD *)location = 134218754;
    *(void *)&location[4] = v28[0];
    __int16 v30 = 2112;
    v31 = self;
    __int16 v32 = 2080;
    v33 = v22;
    __int16 v34 = 2112;
    uint64_t v35 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: setting state to %s%@", location, 0x2Au);
  }

  if (!self->_isFPFSMode)
  {
    int queryState = self->_queryState;
    long long v15 = [(BRQuery *)self receiver];
    uint64_t v11 = v15;
    self->_int queryState = a3;
    switch(a3)
    {
      case 1:
        if (!queryState)
        {
          pthread_rwlock_wrlock(&gBRActiveQueriesMutex);
          atomic_fetch_add(&gBRActiveQueries, 1uLL);
          [(id)gBRActiveQueriesSet addObject:self];
          pthread_rwlock_unlock(&gBRActiveQueriesMutex);
        }
        [v11 setDelegate:self];
        [v11 setBatchingChanges:self->_batchingParameters.first_max_num];
        uint64_t v16 = 128;
        goto LABEL_20;
      case 2:
        [v15 setBatchingChanges:self->_batchingParameters.progress_max_num];
        uint64_t v16 = 144;
        goto LABEL_20;
      case 3:
        [v15 setBatchingChanges:self->_batchingParameters.update_max_num];
        uint64_t v16 = 160;
LABEL_20:
        [v11 setBatchingDelay:(double)*(unint64_t *)((char *)&self->super.isa + v16) / 1000.0];
        break;
      case 4:
        [v15 invalidateAndDontNotifyDelegate];
        pthread_rwlock_wrlock(&gBRActiveQueriesMutex);
        if ([(id)gBRActiveQueriesSet containsObject:self])
        {
          atomic_fetch_add(&gBRActiveQueries, 0xFFFFFFFFFFFFFFFFLL);
          [(id)gBRActiveQueriesSet removeObject:self];
          uint64_t v20 = [(id)gBRActiveQueriesSet count];
          unint64_t v21 = atomic_load((unint64_t *)&gBRActiveQueries);
          if (v20 != v21)
          {
            v23 = brc_bread_crumbs((uint64_t)"-[BRQuery _setQueryState:]", 627);
            uint64_t v24 = brc_default_log(0);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              -[BRQuery _setQueryState:]();
            }
          }
        }
        pthread_rwlock_unlock(&gBRActiveQueriesMutex);
        break;
      default:
        goto LABEL_21;
    }
    goto LABEL_21;
  }
  self->_int queryState = a3;
  if (a3 == 4)
  {
    [(BRItemCollectionGatherer *)self->_collectionGatherer invalidate];
    collectionGatherer = self->_collectionGatherer;
    self->_collectionGatherer = 0;

    [(BRQuery *)self _stopProgressObservers];
    BRRemoveNetworkReachabilityObserver(self->_networkReachabilityToken);
    id networkReachabilityToken = self->_networkReachabilityToken;
    self->_id networkReachabilityToken = 0;

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v19 = getUIApplicationWillResignActiveNotification();
    [v11 removeObserver:self name:v19 object:0];

    uint64_t v13 = getUIApplicationDidBecomeActiveNotification();
    [v11 removeObserver:self name:v13 object:0];
LABEL_14:

LABEL_21:
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    if (!self->_networkReachabilityToken)
    {
      objc_initWeak((id *)location, self);
      progressQueue = self->_progressQueue;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __26__BRQuery__setQueryState___block_invoke;
      v26[3] = &unk_1E59AF6E8;
      objc_copyWeak(&v27, (id *)location);
      uint64_t v8 = BRAddNetworkReachabilityObserverWithCallbackQueue(progressQueue, v26);
      id v9 = self->_networkReachabilityToken;
      self->_id networkReachabilityToken = v8;

      uint64_t v10 = self->_progressQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__BRQuery__setQueryState___block_invoke_2;
      block[3] = &unk_1E59AD3B0;
      block[4] = self;
      dispatch_async(v10, block);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)location);
    }
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12 = getUIApplicationWillResignActiveNotification();
    [v11 addObserver:self selector:sel__applicationWillResignActive_ name:v12 object:0];

    uint64_t v13 = getUIApplicationDidBecomeActiveNotification();
    [v11 addObserver:self selector:sel__applicationDidBecomeActive_ name:v13 object:0];
    goto LABEL_14;
  }
LABEL_22:
  __brc_leave_section((uint64_t)v28);
}

void __26__BRQuery__setQueryState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained networkReachabilityChanged:a2];
}

void __26__BRQuery__setQueryState___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[BRReachabilityMonitor sharedReachabilityMonitor];
  objc_msgSend(v1, "networkReachabilityChanged:", objc_msgSend(v2, "isNetworkReachable"));
}

- (void)disableUpdates
{
  atomic_fetch_add(&self->_disableCount, 1u);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __25__BRQuery_disableUpdates__block_invoke;
  v2[3] = &unk_1E59AD3B0;
  v2[4] = self;
  [(BRQuery *)self _performBlockAsync:v2];
}

void __25__BRQuery_disableUpdates__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v1 + 284);
  *(_DWORD *)(v1 + 284) = v3 + 1;
  if (!v3)
  {
    if (*((unsigned char *)*v2 + 96))
    {
      id v4 = brc_bread_crumbs((uint64_t)"-[BRQuery disableUpdates]_block_invoke", 643);
      uint64_t v5 = brc_default_log(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __25__BRQuery_disableUpdates__block_invoke_cold_2();
      }

      [*((id *)*v2 + 36) disableUpdates];
    }
    else
    {
      uint8_t v6 = brc_bread_crumbs((uint64_t)"-[BRQuery disableUpdates]_block_invoke", 649);
      uint64_t v7 = brc_default_log(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __25__BRQuery_disableUpdates__block_invoke_cold_1();
      }

      uint64_t v8 = [*v2 receiver];
      [v8 suspend];
    }
  }
}

- (void)enableUpdates
{
  atomic_fetch_add(&self->_disableCount, 0xFFFFFFFF);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __24__BRQuery_enableUpdates__block_invoke;
  v2[3] = &unk_1E59AD3B0;
  v2[4] = self;
  [(BRQuery *)self _performBlockAsync:v2];
}

void __24__BRQuery_enableUpdates__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v1 + 284) - 1;
  *(_DWORD *)(v1 + 284) = v3;
  if (!v3)
  {
    if (*((unsigned char *)*v2 + 96))
    {
      id v4 = brc_bread_crumbs((uint64_t)"-[BRQuery enableUpdates]_block_invoke", 663);
      uint64_t v5 = brc_default_log(1);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __24__BRQuery_enableUpdates__block_invoke_cold_2();
      }

      [*((id *)*v2 + 36) enableUpdates];
    }
    else
    {
      uint8_t v6 = brc_bread_crumbs((uint64_t)"-[BRQuery enableUpdates]_block_invoke", 669);
      uint64_t v7 = brc_default_log(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __24__BRQuery_enableUpdates__block_invoke_cold_1();
      }

      uint64_t v8 = [*v2 receiver];
      [v8 resume];
    }
  }
}

- (void)_performBlockAsync:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__BRQuery__performBlockAsync___block_invoke;
  v12[3] = &unk_1E59AF408;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  uint8_t v6 = (void *)MEMORY[0x19F3C48D0](v12);
  queryQueue = self->_queryQueue;
  if (!queryQueue)
  {
    runLoop = self->_runLoop;
    if (runLoop)
    {
      CFRunLoopPerformBlock(runLoop, (CFTypeRef)*MEMORY[0x1E4F1D410], v6);
      CFRunLoopWakeUp(self->_runLoop);
      goto LABEL_17;
    }
    int active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) != 2)
    {
      if (active_platform == 11)
      {
        if (dyld_program_sdk_at_least()) {
          goto LABEL_14;
        }
        goto LABEL_11;
      }
      if (active_platform != 1)
      {
        syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
        goto LABEL_14;
      }
    }
    if (dyld_program_sdk_at_least())
    {
LABEL_14:
      uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]", 693);
      uint64_t v11 = brc_default_log(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BRQuery _performBlockAsync:]();
      }
LABEL_16:

      goto LABEL_17;
    }
LABEL_11:
    uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]", 695);
    uint64_t v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      -[BRQuery _performBlockAsync:]();
    }
    goto LABEL_16;
  }
  [(NSOperationQueue *)queryQueue addOperationWithBlock:v6];
LABEL_17:
}

void __30__BRQuery__performBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 96) && !*(void *)(v1 + 288))
  {
    int v3 = brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]_block_invoke", 679);
    id v4 = brc_default_log(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __30__BRQuery__performBlockAsync___block_invoke_cold_1();
    }
  }
  else
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRQuery stop]", 702, v6);
  int v3 = brc_bread_crumbs((uint64_t)"-[BRQuery stop]", 702);
  id v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v6[0];
    __int16 v9 = 2112;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx stopping %@%@", buf, 0x20u);
  }

  [(BRQuery *)self setQuery:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __15__BRQuery_stop__block_invoke;
  v5[3] = &unk_1E59AD3B0;
  v5[4] = self;
  [(BRQuery *)self _performBlockAsync:v5];
  __brc_leave_section((uint64_t)v6);
}

uint64_t __15__BRQuery_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setQueryState:4];
}

- (void)_watchScopes
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] The current process has the following container IDs that should be added to the search scopes = %@%@", (void)v3, DWORD2(v3));
}

- (void)_runQuery
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] not doing anything, we're already started%@", v2, v3, v4, v5, v6);
}

- (unsigned)executeWithOptions:(unint64_t)a3
{
  if (self->_results)
  {
    __int16 v11 = brc_bread_crumbs((uint64_t)"-[BRQuery executeWithOptions:]", 781);
    v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRQuery executeWithOptions:]();
    }
  }
  uint64_t v4 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:64];
  results = self->_results;
  self->_results = v4;

  BOOL isFPFSMode = self->_isFPFSMode;
  uint64_t v7 = (objc_class *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:64];
  uint64_t v8 = 24;
  if (!isFPFSMode) {
    uint64_t v8 = 16;
  }
  __int16 v9 = *(Class *)((char *)&self->super.isa + v8);
  *(Class *)((char *)&self->super.isa + v8) = v7;

  [(BRQuery *)self _runQuery];
  return 1;
}

- (id)attributeValueForName:(id)a3 forResultAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_results count] <= a4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_results objectAtIndex:a4];
    uint64_t v8 = [v7 attributeForName:v6];
  }

  return v8;
}

- (unint64_t)countOfResultsForAttributeName:(id)a3 value:(id)a4
{
  return 0;
}

- (int64_t)indexOfResult:(const void *)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_results count];
  if (v5 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while (1)
  {
    create_result_callbacks_equal = (uint64_t (*)(uint64_t, const void *))self->_create_result_callbacks_equal;
    __int16 v9 = [(NSMutableArray *)self->_results objectAtIndex:v7];
    LODWORD(create_result_callbacks_equal) = create_result_callbacks_equal([v9 replacement], a3);

    if (create_result_callbacks_equal) {
      break;
    }
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (id)_replacementObjectForQueryItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_create_result_fn)
  {
    id v6 = [v4 replacement];
    if (!v6)
    {
      ((void (*)(BRQuery *, void *, void *))self->_create_result_fn)(self, v5, self->_create_result_context);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [v5 setReplacement:v6];
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)_replacementObjectsForArrayOfQueryItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = -[BRQuery _replacementObjectForQueryItem:](self, "_replacementObjectForQueryItem:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (const)resultAtIndex:(int64_t)a3
{
  if ([(NSMutableArray *)self->_results count] <= a3) {
    return 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_results objectAtIndex:a3];
  id v6 = [(BRQuery *)self _replacementObjectForQueryItem:v5];

  return v6;
}

- (unint64_t)resultCount
{
  return [(NSMutableArray *)self->_results count];
}

- (void)setBatchingParameters:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_batchingParameters.update_max_num = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_batchingParameters.progress_max_num = v4;
  *(_OWORD *)&self->_batchingParameters.first_max_num = v3;
}

- (void)setExternalDocumentsBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCreateResultFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5
{
  self->_create_result_fn = a3;
  self->_create_result_context = a4;
  if (!a5)
  {
    self->_create_result_callbacks_equal = MLEqualCallback;
LABEL_7:
    var2 = MLReleaseCallback;
    goto LABEL_8;
  }
  var4 = a5->var4;
  if (!var4) {
    var4 = MLEqualCallback;
  }
  self->_create_result_callbacks_equal = var4;
  var2 = (uint64_t (*)())a5->var2;
  if (!var2) {
    goto LABEL_7;
  }
LABEL_8:
  self->_create_result_callbacks_release = var2;
}

- (void)setCreateValueFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5
{
  self->_create_value_fn = a3;
  self->_create_value_context = a4;
  if (!a5)
  {
    self->_create_value_callbacks_equal = MLEqualCallback;
LABEL_7:
    var2 = MLReleaseCallback;
    goto LABEL_8;
  }
  var4 = a5->var4;
  if (!var4) {
    var4 = MLEqualCallback;
  }
  self->_create_value_callbacks_equal = var4;
  var2 = (uint64_t (*)())a5->var2;
  if (!var2) {
    goto LABEL_7;
  }
LABEL_8:
  self->_create_value_callbacks_release = var2;
}

- (void)setSearchScope:(id)a3 withOptions:(unsigned int)a4
{
  id v6 = (NSArray *)[a3 copy];
  searchScopes = self->_searchScopes;
  self->_searchScopes = v6;

  self->_scopeOptions = a4;
}

- (void)setSortComparator:(void *)a3 withContext:(void *)a4
{
  self->_sort_fn = a3;
  self->_sort_context = a4;
}

- (void)setQueryQueue:(id)a3
{
  uint64_t v5 = (NSOperationQueue *)a3;
  id v6 = v5;
  if (self->_queryQueue != v5)
  {
    p_queryQueue = &self->_queryQueue;
    if ([(NSOperationQueue *)v5 maxConcurrentOperationCount] != 1)
    {
      uint64_t v8 = brc_bread_crumbs((uint64_t)"-[BRQuery setQueryQueue:]", 941);
      uint64_t v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRQuery setQueryQueue:]();
      }
    }
    objc_storeStrong((id *)p_queryQueue, a3);
  }
}

- (id)queryQueue
{
  return self->_queryQueue;
}

- (void)_postNote:(__CFString *)a3
{
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQuery _postNote:]", 954);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRQuery _postNote:]((uint64_t)a3);
  }

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:a3 object:self];
}

- (void)_postNote:(__CFString *)a3 userInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = brc_bread_crumbs((uint64_t)"-[BRQuery _postNote:userInfo:]", 960);
  uint64_t v8 = brc_default_log(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412802;
    __int16 v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v7;
    _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] posting %@: %@%@", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:a3 object:self userInfo:v6];
}

- (BOOL)_collectUpdates:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRQuery _collectUpdates:]", 966, v33);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 966);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v36 = v33[0];
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2112;
    v40 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx changes = %@%@", buf, 0x20u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        __int16 v11 = (void *)MEMORY[0x19F3C4670]();
        __int16 v12 = [v10 fileObjectID];
        char v13 = [v10 isDead];
        __int16 v14 = [v10 diffs];
        if ((v13 & 1) == 0)
        {
          if ([(NSPredicate *)self->_predicate evaluateWithObject:v10])
          {
            int v15 = 0;
            goto LABEL_13;
          }
          [v10 markDead];
        }
        int v15 = 1;
LABEL_13:
        uint64_t v16 = [(NSMutableDictionary *)self->_resultsByRowID objectForKey:v12];
        if (v16)
        {
          if (v15)
          {
            [(NSMutableDictionary *)self->_toBeReplacedByFileObjectID removeObjectForKey:v12];
LABEL_30:
            [(NSMutableDictionary *)self->_toBeRemovedByFileObjectID setObject:v16 forKey:v12];
            goto LABEL_33;
          }
          if ((v14 & 0xC030) != 0)
          {
            int active_platform = dyld_get_active_platform();
            if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
            {
              if ((dyld_program_sdk_at_least() & 1) == 0)
              {
                [(NSMutableDictionary *)self->_toBeReplacedByFileObjectID removeObjectForKey:v12];
                [(NSMutableDictionary *)self->_toBeInsertedByFileObjectID setObject:v10 forKey:v12];
                goto LABEL_30;
              }
            }
            else
            {
              syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
            }
          }
          [(NSMutableDictionary *)self->_toBeReplacedByFileObjectID setObject:v10 forKey:v12];
          [(NSMutableDictionary *)self->_toBeRemovedByFileObjectID removeObjectForKey:v12];
        }
        else
        {
          toBeInsertedByFileObjectID = self->_toBeInsertedByFileObjectID;
          if (v15)
          {
            uint64_t v16 = [(NSMutableDictionary *)toBeInsertedByFileObjectID objectForKey:v12];
            if ([v16 canMerge:v10]) {
              [(NSMutableDictionary *)self->_toBeInsertedByFileObjectID removeObjectForKey:v12];
            }
          }
          else
          {
            v19 = [(NSMutableDictionary *)toBeInsertedByFileObjectID objectForKey:v12];
            uint64_t v16 = v19;
            if (v19)
            {
              [v19 merge:v10];
            }
            else
            {
              [(NSMutableDictionary *)self->_toBeInsertedByFileObjectID setObject:v10 forKey:v12];
              uint64_t v16 = 0;
            }
          }
        }
LABEL_33:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v20 = brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1029);
  unint64_t v21 = brc_default_log(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[BRQuery _collectUpdates:]((uint64_t)self);
  }

  uint64_t v22 = brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1030);
  v23 = brc_default_log(1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRQuery _collectUpdates:]((uint64_t)self);
  }

  uint64_t v24 = brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1031);
  v25 = brc_default_log(1);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[BRQuery _collectUpdates:]((uint64_t)self);
  }

  kdebug_trace();
  BOOL v26 = [(NSMutableDictionary *)self->_toBeRemovedByFileObjectID count]
     || [(NSMutableDictionary *)self->_toBeInsertedByFileObjectID count]
     || [(NSMutableDictionary *)self->_toBeReplacedByFileObjectID count] != 0;
  __brc_leave_section((uint64_t)v33);

  return v26;
}

- (void)_processUpdates
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Crash recovery is done%@", v2, v3, v4, v5, v6);
}

void __26__BRQuery__processUpdates__block_invoke(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count] <= a2) {
    __26__BRQuery__processUpdates__block_invoke_cold_1();
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 192))(0, [v4 replacement]);
  [v4 setReplacement:0];
}

- (void)_processChanges:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRQuery _processChanges:]", 1155, v21);
  uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1155);
  uint8_t v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v24 = v21[0];
    __int16 v25 = 2112;
    BOOL v26 = self;
    __int16 v27 = 2112;
    id v28 = v4;
    __int16 v29 = 2112;
    long long v30 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: processing changes %@%@", buf, 0x2Au);
  }

  if (self->_queryState == 4
    || ([(BRQuery *)self query],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = v7 == 0,
        v7,
        v8))
  {
    char v13 = brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1158);
    __int16 v14 = brc_default_log(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRQuery _processChanges:]();
    }
  }
  else
  {
    if (self->_queryState == 1)
    {
      [(BRQuery *)self _setQueryState:2];
      [(BRQuery *)self _postNote:@"__kMDQueryWillChangeNotification"];
    }
    if (self->_needsCrashMarking)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = self->_results;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "setIsPreCrash:", 1, (void)v17);
          }
          uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v10);
      }

      self->_needsCrashMarking = 0;
    }
    if (-[BRQuery _collectUpdates:](self, "_collectUpdates:", v4, (void)v17)
      || self->_needsCrashEvicting && [(NSMutableArray *)self->_results count])
    {
      [(BRQuery *)self _processUpdates];
    }
    else
    {
      int v15 = brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1177);
      uint64_t v16 = brc_default_log(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRQuery _processChanges:]();
      }
    }
    if (self->_queryState == 2 && self->_ubiquitousGatherComplete)
    {
      [(BRQuery *)self _setQueryState:3];
      [(BRQuery *)self _postNote:@"kMDQueryDidFinishNotification"];
    }
  }
  __brc_leave_section((uint64_t)v21);
}

- (void)processUpdates
{
  if (!atomic_load_explicit(&self->_disableCount, memory_order_acquire))
  {
    id v2 = [(BRQuery *)self receiver];
    [v2 flush];
  }
}

- (void)_sendHasUpdateNotificationIfNeeded
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] posting has updates notifications%@", v2, v3, v4, v5, v6);
}

- (void)setSendHasUpdateNotification:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__BRQuery_setSendHasUpdateNotification___block_invoke;
  v3[3] = &unk_1E59AE420;
  v3[4] = self;
  BOOL v4 = a3;
  [(BRQuery *)self _performBlockAsync:v3];
}

uint64_t __40__BRQuery_setSendHasUpdateNotification___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(*(void *)(result + 32) + 95) != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BRQuery setSendHasUpdateNotification:]_block_invoke", 1218);
    uint64_t v3 = brc_default_log(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      BOOL v4 = "Enabling";
      uint64_t v5 = *(void *)(v1 + 32);
      if (!*(unsigned char *)(v1 + 40)) {
        BOOL v4 = "Disabling";
      }
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v2;
      _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s update notifications on %@%@", (uint8_t *)&v6, 0x20u);
    }

    *(unsigned char *)(*(void *)(v1 + 32) + 95) = *(unsigned char *)(v1 + 40);
    return [*(id *)(v1 + 32) _sendHasUpdateNotificationIfNeeded];
  }
  return result;
}

- (void)notificationsReceiverDidInvalidate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke;
  void v6[3] = &unk_1E59AD648;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRQuery *)self _performBlockAsync:v6];
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1230, v14);
  uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1230);
  uint64_t v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v14[0];
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    long long v20 = v2;
    _os_log_debug_impl(&dword_19ED3F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx remote process is gone for %@%@", buf, 0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) != *(void *)(v4 + 32))
  {
    uint64_t v12 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1232);
    char v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_3();
    }

    uint64_t v4 = *(void *)(a1 + 32);
  }
  if ((*(_DWORD *)(v4 + 88) | 4) != 4)
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1236);
    int v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_2();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 92) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 93) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 94) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  [(id)v4 setReceiver:0];
  if (*(_DWORD *)(*(void *)(a1 + 32) + 88) != 4)
  {
    id v7 = objc_alloc_init(BRNotificationReceiver);
    [(BRNotificationReceiver *)v7 setDelegate:*(void *)(a1 + 32)];
    __int16 v8 = *(_DWORD **)(a1 + 32);
    if (v8[71])
    {
      [(BRNotificationReceiver *)v7 suspend];
      __int16 v8 = *(_DWORD **)(a1 + 32);
    }
    [v8 setReceiver:v7];
    if (*(_DWORD *)(*(void *)(a1 + 32) + 88))
    {
      uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1261);
      __int16 v10 = brc_default_log(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _setQueryState:*(unsigned int *)(*(void *)(a1 + 32) + 88)];
      [*(id *)(a1 + 32) _watchScopes];
    }
  }
  __brc_leave_section((uint64_t)v14);
}

- (void)notificationsReceiverDidFinishGathering:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidFinishGathering:]", 1270, v8);
  id v5 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidFinishGathering:]", 1270);
  int v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = v8[0];
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received gathering done for %@%@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke;
  v7[3] = &unk_1E59AF738;
  v7[4] = self;
  [v4 dequeue:-1 block:v7];
  __brc_leave_section((uint64_t)v8);
}

void __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke_2;
  void v6[3] = &unk_1E59AD648;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _performBlockAsync:v6];
}

uint64_t __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 92) = 1;
  return [*(id *)(a1 + 32) _processChanges:*(void *)(a1 + 40)];
}

- (void)notificationsReceiverDidReceiveNotificationsBatch:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidReceiveNotificationsBatch:]", 1281, v8);
  id v5 = brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidReceiveNotificationsBatch:]", 1281);
  int v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v10 = v8[0];
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received notifications for %@%@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke;
  v7[3] = &unk_1E59AF738;
  v7[4] = self;
  [v4 dequeue:-1 block:v7];
  __brc_leave_section((uint64_t)v8);
}

void __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke_2;
  void v6[3] = &unk_1E59AD648;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _performBlockAsync:v6];
}

uint64_t __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processChanges:*(void *)(a1 + 40)];
}

- (void)notificationReceiverDidReceiveNotifications:(id)a3
{
  if (self->_sendHasUpdateNotification)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__BRQuery_notificationReceiverDidReceiveNotifications___block_invoke;
    v3[3] = &unk_1E59AD3B0;
    v3[4] = self;
    [(BRQuery *)self _performBlockAsync:v3];
  }
}

uint64_t __55__BRQuery_notificationReceiverDidReceiveNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHasUpdateNotificationIfNeeded];
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRQuery networkReachabilityChanged:]", 1304, v9);
  id v5 = brc_bread_crumbs((uint64_t)"-[BRQuery networkReachabilityChanged:]", 1304);
  int v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = "not reachable";
    *(_DWORD *)buf = 134218498;
    if (v3) {
      id v7 = "reachable";
    }
    uint64_t v11 = v9[0];
    __int16 v12 = 2080;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx network is %s%@", buf, 0x20u);
  }

  self->_isNetworkOffline = !v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__BRQuery_networkReachabilityChanged___block_invoke;
  void v8[3] = &unk_1E59AD3B0;
  v8[4] = self;
  [(BRQuery *)self _performBlockAsync:v8];
  __brc_leave_section((uint64_t)v9);
}

void __38__BRQuery_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 344);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__BRQuery_networkReachabilityChanged___block_invoke_2;
  block[3] = &unk_1E59AD3B0;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __38__BRQuery_networkReachabilityChanged___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 304) count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 304);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          __int16 v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", v7, (void)v9);
          [v8 setIsNetworkOffline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 312)];
          [*(id *)(*(void *)(a1 + 32) + 328) addObject:v7];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    br_pacer_signal(*(void **)(*(void *)(a1 + 32) + 336));
  }
}

- (void)_monitorTransferForFPItemIfNecessary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  if (([v4 isUploading] & 1) != 0 || objc_msgSend(v4, "isDownloading"))
  {
    progressObserverByFPItemID = self->_progressObserverByFPItemID;
    int v6 = [v4 itemID];
    uint64_t v7 = [(NSMutableDictionary *)progressObserverByFPItemID objectForKeyedSubscript:v6];

    if (v7)
    {
      [(BRFPItemProgressObserver *)v7 updateWithFPItem:v4];
    }
    else
    {
      uint64_t v7 = [[BRFPItemProgressObserver alloc] initWithFPItem:v4 queue:self->_progressQueue];
      objc_initWeak(&location, self);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      long long v12 = __48__BRQuery__monitorTransferForFPItemIfNecessary___block_invoke;
      __int16 v13 = &unk_1E59AF760;
      objc_copyWeak(&v14, &location);
      [(BRFPItemProgressObserver *)v7 setProgressHandler:&v10];
      __int16 v8 = self->_progressObserverByFPItemID;
      long long v9 = objc_msgSend(v4, "itemID", v10, v11, v12, v13);
      [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];

      [(BRFPItemProgressObserver *)v7 start];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v7 = [v4 itemID];
    [(BRQuery *)self _stopMonitoringTransferForFPItemID:v7];
  }
}

void __48__BRQuery__monitorTransferForFPItemIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[41];
    int v6 = [v7 fpItemID];
    [v5 addObject:v6];

    br_pacer_signal(v4[42]);
  }
}

- (void)_monitorNetworkForQueryItemIfNecessary:(id)a3 fpItemID:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  if ([v6 isInTransfer])
  {
    [v6 setIsNetworkOffline:self->_isNetworkOffline];

    [(NSMutableSet *)self->_fpItemIDsInTransfer addObject:v7];
  }
  else
  {
    [v6 setIsNetworkOffline:0];

    [(NSMutableSet *)self->_fpItemIDsInTransfer removeObject:v7];
  }
}

- (void)_stopMonitoringTransferForFPItemID:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  id v4 = [(NSMutableDictionary *)self->_progressObserverByFPItemID objectForKeyedSubscript:v6];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 stop];
    [(NSMutableDictionary *)self->_progressObserverByFPItemID setObject:0 forKeyedSubscript:v6];
  }
  [(NSMutableSet *)self->_fpItemIDsWithProgressUpdates removeObject:v6];
}

- (void)_stopProgressObservers
{
  if (BRIsFPFSEnabled(self, a2))
  {
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__BRQuery__stopProgressObservers__block_invoke;
    block[3] = &unk_1E59AD3B0;
    block[4] = self;
    dispatch_sync(progressQueue, block);
  }
}

uint64_t __33__BRQuery__stopProgressObservers__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 296), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) stop];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 296) removeAllObjects];
}

- (void)_processProgressUpdateBatch
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke;
  v2[3] = &unk_1E59AD3B0;
  v2[4] = self;
  [(BRQuery *)self _performBlockAsync:v2];
}

void __38__BRQuery__processProgressUpdateBatch__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 344);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke_2;
  block[3] = &unk_1E59AE3F8;
  block[4] = v5;
  id v7 = v2;
  id v18 = v7;
  id v8 = v3;
  id v19 = v8;
  id v9 = v4;
  id v20 = v9;
  dispatch_sync(v6, block);
  if ([v8 count])
  {
    [*(id *)(a1 + 32) _postNote:@"__kMDQueryWillChangeNotification"];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained willChange:4 valuesAtIndexes:v7 forKey:@"results"];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v12 = [*(id *)(a1 + 32) _replacementObjectsForArrayOfQueryItem:v9];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28650]];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke_146;
    v16[3] = &unk_1E59AF788;
    v16[4] = *(void *)(a1 + 32);
    [v8 enumerateKeysAndObjectsUsingBlock:v16];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v13 didChange:4 valuesAtIndexes:v7 forKey:@"results"];

    id v14 = *(_DWORD **)(a1 + 32);
    int v15 = v14[22];
    if (v15 == 2)
    {
      [v14 _postNote:@"kMDQueryProgressNotification"];
    }
    else if (v15 == 3)
    {
      [v14 _postNote:@"kMDQueryDidUpdateNotification" userInfo:v11];
    }
  }
}

uint64_t __38__BRQuery__processProgressUpdateBatch__block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 328);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v26;
    *(void *)&long long v4 = 138412546;
    long long v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", v8, v24, (void)v25);
        uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 296) objectForKeyedSubscript:v8];
        id v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12
          || (uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 8) indexOfObjectIdenticalTo:v9],
              v13 == 0x7FFFFFFFFFFFFFFFLL))
        {
          id v14 = brc_bread_crumbs((uint64_t)"-[BRQuery _processProgressUpdateBatch]_block_invoke_2", 1423);
          int v15 = brc_default_log(1);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            uint64_t v30 = v8;
            __int16 v31 = 2112;
            long long v32 = v14;
            _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Result not found for progress update %@%@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v16 = v13;
          id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
          __int16 v17 = [v11 downloadPercentCompleted];

          if (v17)
          {
            id v18 = [v11 downloadPercentCompleted];
            [v14 setObject:v18 forKey:@"kICDDownloadPercent"];
          }
          id v19 = [v11 uploadPercentCompleted];

          if (v19)
          {
            id v20 = [v11 uploadPercentCompleted];
            [v14 setObject:v20 forKey:@"kICDUploadPercent"];
          }
          [*(id *)(a1 + 40) addIndex:v16];
          uint64_t v21 = *(void **)(a1 + 48);
          uint64_t v22 = [NSNumber numberWithInteger:v16];
          [v21 setObject:v14 forKey:v22];

          [*(id *)(a1 + 56) addObject:v9];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v5);
  }

  return [*(id *)(*(void *)(a1 + 32) + 328) removeAllObjects];
}

void __38__BRQuery__processProgressUpdateBatch__block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  long long v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "unsignedLongValue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 valueForKey:@"kICDDownloadPercent"];
  [v8 setAttribute:v6 forKey:@"dl%"];

  id v7 = [v5 valueForKey:@"kICDUploadPercent"];

  [v8 setAttribute:v7 forKey:@"ul%"];
}

- (id)_classifyItems:(id)a3 deletedItemIDs:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v6 = a4;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v71 count:16];
  v46 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v59;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * v11);
        uint64_t v13 = [(NSMutableDictionary *)self->_fpItemIDToResultItem objectForKey:v12];
        if (v13)
        {
          uint64_t v14 = [(NSMutableArray *)self->_results indexOfObjectIdenticalTo:v13];
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v16 = brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1476);
            __int16 v17 = brc_default_log(0);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v16;
              _os_log_fault_impl(&dword_19ED3F000, v17, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: resultIndex != NSNotFound%@", buf, 0xCu);
            }

            id v7 = v46;
          }
          int v15 = [NSNumber numberWithUnsignedInteger:v14];
          [v53 setObject:v12 forKey:v15];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v18 = [v7 countByEnumeratingWithState:&v58 objects:v71 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }

  BOOL v19 = ![(NSArray *)self->_searchScopes containsObject:*MEMORY[0x1E4F28638]]
     && [(NSArray *)self->_searchScopes containsObject:*MEMORY[0x1E4F28640]];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obja = obj;
  uint64_t v20 = [obja countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v55;
    *(void *)&long long v21 = 138412290;
    long long v45 = v21;
    BOOL v49 = v19;
    do
    {
      uint64_t v24 = 0;
      uint64_t v50 = v22;
      do
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(obja);
        }
        long long v25 = *(void **)(*((void *)&v54 + 1) + 8 * v24);
        if (v19 && objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * v24), "br_isDocumentsFolder"))
        {
          long long v26 = brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1486);
          long long v27 = brc_default_log(1);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v25;
            __int16 v66 = 2112;
            *(void *)v67 = v26;
            _os_log_debug_impl(&dword_19ED3F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring Documents Folder %@ from NSMDQ results%@", buf, 0x16u);
          }
        }
        else
        {
          long long v26 = objc_msgSend(v25, "itemID", v45);
          predicate = self->_predicate;
          __int16 v29 = [[BRQueryItem alloc] initWithFPItem:v25];
          BOOL v30 = [(NSPredicate *)predicate evaluateWithObject:v29];

          long long v27 = [(NSMutableDictionary *)self->_fpItemIDToResultItem objectForKey:v26];
          if (v27)
          {
            uint64_t v31 = v23;
            uint64_t v32 = [(NSMutableArray *)self->_results indexOfObjectIdenticalTo:v27];
            if (v32 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v35 = brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1496);
              uint64_t v36 = brc_default_log(0);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v45;
                v65 = v35;
                _os_log_fault_impl(&dword_19ED3F000, v36, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: resultIndex != NSNotFound%@", buf, 0xCu);
              }

              BOOL v19 = v49;
              if (!v30) {
                goto LABEL_37;
              }
LABEL_30:
              v33 = [v25 fileURL];

              if (!v33) {
                goto LABEL_37;
              }
              uint64_t v34 = [NSNumber numberWithUnsignedInteger:v32];
              [v48 setObject:v25 forKey:v34];
            }
            else
            {
              if (v30) {
                goto LABEL_30;
              }
LABEL_37:
              __int16 v37 = brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1498);
              id v38 = brc_default_log(1);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v41 = [v25 fileURL];
                *(_DWORD *)buf = 138413058;
                v65 = v25;
                __int16 v66 = 1024;
                *(_DWORD *)v67 = v30;
                *(_WORD *)&v67[4] = 2112;
                *(void *)&v67[6] = v41;
                v42 = (void *)v41;
                __int16 v68 = 2112;
                v69 = v37;
                _os_log_debug_impl(&dword_19ED3F000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing %@ from the set -- itemSatisfiesPredicate = %d, url = %@%@", buf, 0x26u);
              }
              __int16 v39 = [v25 itemID];
              v40 = [NSNumber numberWithUnsignedInteger:v32];
              [v53 setObject:v39 forKey:v40];

              BOOL v19 = v49;
            }
            uint64_t v23 = v31;
            uint64_t v22 = v50;
            goto LABEL_41;
          }
          if (v30) {
            [v47 addObject:v25];
          }
        }
LABEL_41:

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obja countByEnumeratingWithState:&v54 objects:v70 count:16];
    }
    while (v22);
  }

  v62[0] = @"kICDQueryAddedItems";
  v62[1] = @"kICDQueryRemovedItems";
  v63[0] = v47;
  v63[1] = v53;
  v62[2] = @"kICDQueryReplacedItems";
  v63[2] = v48;
  uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];

  return v43;
}

- (void)_handleAddedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(NSMutableArray *)self->_results count];
    uint64_t v9 = [v6 count];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", v8, v9);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    [WeakRetained willChange:2 valuesAtIndexes:v10 forKey:@"results"];
    if (v7) {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    }
    else {
      uint64_t v12 = 0;
    }
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke;
    block[3] = &unk_1E59AD620;
    id v17 = v6;
    id v14 = v12;
    id v18 = v14;
    BOOL v19 = self;
    dispatch_sync(progressQueue, block);
    if (v7)
    {
      int v15 = [(BRQuery *)self _replacementObjectsForArrayOfQueryItem:v14];
      [v7 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28648]];
    }
    [WeakRetained didChange:2 valuesAtIndexes:v10 forKey:@"results"];
  }
}

void __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke_2;
  v5[3] = &unk_1E59AF7B0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [[BRQueryItem alloc] initWithFPItem:v9];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 addObject:v3];
  }
  [*(id *)(a1 + 40) _monitorTransferForFPItemIfNecessary:v9];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v9 itemID];
  [v5 _monitorNetworkForQueryItemIfNecessary:v3 fpItemID:v6];

  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v3];
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = [v9 itemID];
  [v7 setObject:v3 forKey:v8];
}

- (void)_handleReplacedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke;
    v22[3] = &unk_1E59AF7D8;
    id v9 = v8;
    id v23 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v22];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    [WeakRetained willChange:4 valuesAtIndexes:v9 forKey:@"results"];
    if (v7) {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    }
    else {
      uint64_t v11 = 0;
    }
    progressQueue = self->_progressQueue;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_2;
    id v18 = &unk_1E59AD620;
    id v19 = v6;
    id v13 = v11;
    id v20 = v13;
    long long v21 = self;
    dispatch_sync(progressQueue, &v15);
    if (v7)
    {
      id v14 = -[BRQuery _replacementObjectsForArrayOfQueryItem:](self, "_replacementObjectsForArrayOfQueryItem:", v13, v15, v16, v17, v18, v19);
      [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28650]];
    }
    objc_msgSend(WeakRetained, "didChange:valuesAtIndexes:forKey:", 4, v9, @"results", v15, v16, v17, v18);
  }
}

uint64_t __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedLongValue];

  return [v2 addIndex:v3];
}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3;
  v5[3] = &unk_1E59AF800;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    unint64_t v7 = [v5 unsignedLongValue];
    if (v7 >= [*(id *)(*(void *)(a1 + 40) + 8) count])
    {
      uint64_t v16 = brc_bread_crumbs((uint64_t)"-[BRQuery _handleReplacedItemsNotifications:userInfo:]_block_invoke_3", 1566);
      id v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3_cold_1();
      }
    }
    id v8 = *(void **)(a1 + 32);
    id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectAtIndex:", objc_msgSend(v5, "unsignedLongValue"));
    [v8 addObject:v9];
  }
  uint64_t v10 = [[BRQueryItem alloc] initWithFPItem:v6];
  [*(id *)(a1 + 40) _monitorTransferForFPItemIfNecessary:v6];
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v6 itemID];
  [v11 _monitorNetworkForQueryItemIfNecessary:v10 fpItemID:v12];

  id v13 = *(void **)(*(void *)(a1 + 40) + 24);
  id v14 = [v6 itemID];
  uint64_t v15 = [v13 objectForKey:v14];

  [v15 merge:v10 allowMergingFileObjectIDIfPossible:1];
}

- (void)_handleRemovedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (v7) {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    }
    else {
      uint64_t v10 = 0;
    }
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke;
    block[3] = &unk_1E59AE3F8;
    id v17 = v6;
    id v12 = v10;
    id v18 = v12;
    id v19 = self;
    id v13 = v9;
    id v20 = v13;
    dispatch_sync(progressQueue, block);
    [WeakRetained willChange:3 valuesAtIndexes:v13 forKey:@"results"];
    if (v7)
    {
      id v14 = [(BRQuery *)self _replacementObjectsForArrayOfQueryItem:v12];
      [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28658]];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3;
    v15[3] = &unk_1E59AF710;
    v15[4] = self;
    [v13 enumerateIndexesWithOptions:2 usingBlock:v15];
    [(NSMutableArray *)self->_results removeObjectsAtIndexes:v13];
    [WeakRetained didChange:3 valuesAtIndexes:v13 forKey:@"results"];
  }
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_2;
  void v6[3] = &unk_1E59AF828;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectAtIndex:", objc_msgSend(v8, "unsignedLongValue"));
    [v6 addObject:v7];
  }
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v8, "unsignedLongValue"));
  [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v5];
  [*(id *)(a1 + 40) _stopMonitoringTransferForFPItemID:v5];
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count] <= a2)
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[BRQuery _handleRemovedItemsNotifications:userInfo:]_block_invoke_3", 1610);
    id v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1();
    }
  }
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 192))(0, [v4 replacement]);
  [v4 setReplacement:0];
}

- (void)itemCollectionGathererFinishedGathering
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke;
  v2[3] = &unk_1E59AD3B0;
  v2[4] = self;
  [(BRQuery *)self _performBlockAsync:v2];
}

void __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke(uint64_t a1)
{
  id v2 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererFinishedGathering]_block_invoke", 1622);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 88) != 3)
  {
    *(unsigned char *)(v4 + 92) = 1;
    [*(id *)(a1 + 32) _setQueryState:3];
    [*(id *)(a1 + 32) _postNote:@"kMDQueryDidFinishNotification"];
  }
}

- (void)itemCollectionGathererGatheredItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke;
  void v6[3] = &unk_1E59AD648;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRQuery *)self _performBlockAsync:v6];
}

void __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke(uint64_t a1)
{
  id v2 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererGatheredItems:]_block_invoke", 1634);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke_cold_1();
  }

  id v4 = *(_DWORD **)(a1 + 32);
  if (v4[22] == 1)
  {
    [v4 _setQueryState:2];
    id v4 = *(_DWORD **)(a1 + 32);
  }
  [v4 _postNote:@"__kMDQueryWillChangeNotification"];
  id v5 = [*(id *)(a1 + 32) _classifyItems:*(void *)(a1 + 40) deletedItemIDs:0];
  id v6 = [v5 objectForKey:@"kICDQueryReplacedItems"];
  id v7 = [v5 objectForKey:@"kICDQueryAddedItems"];
  if ([v7 count] || objc_msgSend(v6, "count"))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [*(id *)(a1 + 32) _handleAddedItemsNotifications:v7 userInfo:v8];
    [*(id *)(a1 + 32) _handleReplacedItemsNotifications:v6 userInfo:v8];
    id v9 = *(_DWORD **)(a1 + 32);
    int v10 = v9[22];
    if (v10 == 2)
    {
      [v9 _postNote:@"kMDQueryProgressNotification"];
    }
    else if (v10 == 3)
    {
      [v9 _postNote:@"kMDQueryDidUpdateNotification" userInfo:v8];
    }
  }
}

- (void)itemCollectionGathererDidReceiveUpdates:(id)a3 deleteItemsWithIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke;
  v10[3] = &unk_1E59AD620;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BRQuery *)self _performBlockAsync:v10];
}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke(uint64_t a1)
{
  id v2 = *(_DWORD **)(a1 + 32);
  if (v2[22] == 1)
  {
    [v2 _setQueryState:2];
    [*(id *)(a1 + 32) _postNote:@"__kMDQueryWillChangeNotification"];
  }
  id v3 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:]_block_invoke", 1671);
  id v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_2(a1, (uint64_t)v3, v4);
  }

  id v5 = [*(id *)(a1 + 32) _classifyItems:*(void *)(a1 + 40) deletedItemIDs:*(void *)(a1 + 48)];
  id v6 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:]_block_invoke", 1683);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_1((uint64_t)v5);
  }

  id v8 = [v5 objectForKey:@"kICDQueryReplacedItems"];
  id v9 = [v5 objectForKey:@"kICDQueryRemovedItems"];
  int v10 = [v5 objectForKey:@"kICDQueryAddedItems"];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if ([v8 count] || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    [*(id *)(a1 + 32) _postNote:@"__kMDQueryWillChangeNotification"];
    [*(id *)(a1 + 32) _handleAddedItemsNotifications:v10 userInfo:v11];
    [*(id *)(a1 + 32) _handleReplacedItemsNotifications:v8 userInfo:v11];
    [*(id *)(a1 + 32) _handleRemovedItemsNotifications:v9 userInfo:v11];
    id v12 = *(_DWORD **)(a1 + 32);
    int v13 = v12[22];
    if (v13 == 2)
    {
      [v12 _postNote:@"kMDQueryProgressNotification"];
    }
    else if (v13 == 3)
    {
      [v12 _postNote:@"kMDQueryDidUpdateNotification" userInfo:v11];
    }
  }
}

- (void)itemCollectionGathererDidInvalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke;
  v2[3] = &unk_1E59AD3B0;
  v2[4] = self;
  [(BRQuery *)self _performBlockAsync:v2];
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1716);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_2();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, v5);
  [WeakRetained willChange:3 valuesAtIndexes:v6 forKey:@"results"];
  uint64_t v25 = *MEMORY[0x1E4F28658];
  id v7 = *(id **)(a1 + 32);
  id v8 = [v7[3] allValues];
  id v9 = [v7 _replacementObjectsForArrayOfQueryItem:v8];
  v26[0] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_152;
  v24[3] = &unk_1E59AF710;
  v24[4] = *(void *)(a1 + 32);
  [v6 enumerateIndexesWithOptions:2 usingBlock:v24];
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:64];
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v11;

  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:64];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;

  [WeakRetained didChange:3 valuesAtIndexes:v6 forKey:@"results"];
  id v17 = *(_DWORD **)(a1 + 32);
  int v18 = v17[22];
  switch(v18)
  {
    case 2:
      [v17 _postNote:@"kMDQueryProgressNotification"];
      break;
    case 4:
      goto LABEL_12;
    case 3:
      [v17 _postNote:@"kMDQueryDidUpdateNotification" userInfo:v10];
      break;
  }
  id v19 = [[BRItemCollectionGatherer alloc] initWithDelegate:*(void *)(a1 + 32) query:WeakRetained];
  uint64_t v20 = *(void *)(a1 + 32);
  long long v21 = *(void **)(v20 + 288);
  *(void *)(v20 + 288) = v19;

  if (*(_DWORD *)(*(void *)(a1 + 32) + 88))
  {
    uint64_t v22 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1745);
    id v23 = brc_default_log(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _setQueryState:*(unsigned int *)(*(void *)(a1 + 32) + 88)];
    [*(id *)(a1 + 32) _watchScopes];
  }
LABEL_12:
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_152(uint64_t a1, unint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count] <= a2)
  {
    uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1723);
    id v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1();
    }
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a2];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 192))(0, [v4 replacement]);
  [v4 setReplacement:0];
}

- (void)_applicationWillResignActive:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int queryState = self->_queryState;
  BOOL v6 = queryState > 4;
  int v7 = (1 << queryState) & 0x13;
  if (v6 || v7 == 0)
  {
    id v9 = [MEMORY[0x1E4F96478] currentProcess];
    int v10 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
    id v11 = objc_alloc(MEMORY[0x1E4F96318]);
    v20[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    int v13 = (void *)[v11 initWithExplanation:@"NSMDQ resigning" target:v9 attributes:v12];

    [v13 acquireWithInvalidationHandler:&__block_literal_global_167];
    uint64_t v14 = brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]", 1765);
    uint64_t v15 = brc_default_log(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRQuery _applicationWillResignActive:]((uint64_t)self);
    }

    collectionGatherer = self->_collectionGatherer;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__BRQuery__applicationWillResignActive___block_invoke_168;
    v18[3] = &unk_1E59AD3B0;
    id v19 = v13;
    id v17 = v13;
    [(BRItemCollectionGatherer *)collectionGatherer pauseWatchingWithCompletionBlock:v18];
  }
}

void __40__BRQuery__applicationWillResignActive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]_block_invoke", 1762);
  uint64_t v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__BRQuery__applicationWillResignActive___block_invoke_cold_1((uint64_t)v3);
  }
}

uint64_t __40__BRQuery__applicationWillResignActive___block_invoke_168(uint64_t a1)
{
  id v2 = brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]_block_invoke", 1767);
  id v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __40__BRQuery__applicationWillResignActive___block_invoke_168_cold_1();
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4 = brc_bread_crumbs((uint64_t)"-[BRQuery _applicationDidBecomeActive:]", 1776);
  uint64_t v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRQuery _applicationDidBecomeActive:]((uint64_t)self);
  }

  [(BRItemCollectionGatherer *)self->_collectionGatherer resumeWatching];
}

- (NSMetadataQuery)query
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_query);

  return (NSMetadataQuery *)WeakRetained;
}

- (void)setQuery:(id)a3
{
}

- (BRNotificationReceiver)receiver
{
  return (BRNotificationReceiver *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_progressUpdatePacer, 0);
  objc_storeStrong((id *)&self->_fpItemIDsWithProgressUpdates, 0);
  objc_storeStrong(&self->_networkReachabilityToken, 0);
  objc_storeStrong((id *)&self->_fpItemIDsInTransfer, 0);
  objc_storeStrong((id *)&self->_progressObserverByFPItemID, 0);
  objc_storeStrong((id *)&self->_collectionGatherer, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_searchScopes, 0);
  objc_storeStrong((id *)&self->_sortingAttributes, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_toBeInsertedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_toBeReplacedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_toBeRemovedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_query);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_fpItemIDToResultItem, 0);
  objc_storeStrong((id *)&self->_resultsByRowID, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

- (void)_setQueryState:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: gBRActiveQueriesSet.count == gBRActiveQueries%@", v2, v3, v4, v5, v6);
}

void __25__BRQuery_disableUpdates__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@: suspending receiver%@", (void)v3, DWORD2(v3));
}

void __25__BRQuery_disableUpdates__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@: disabling gatherer updates%@", (void)v3, DWORD2(v3));
}

void __24__BRQuery_enableUpdates__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@: resuming receiver%@", (void)v3, DWORD2(v3));
}

void __24__BRQuery_enableUpdates__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@: enabling gatherer updates%@", (void)v3, DWORD2(v3));
}

- (void)_performBlockAsync:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] API MISUSE: NSMetadataQuery CLIENT BUG: do not access the results before calling -startQuery%@", v2, v3, v4, v5, v6);
}

- (void)_performBlockAsync:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19ED3F000, v0, (os_log_type_t)0x90u, "[ERROR] NSMetadataQuery CLIENT BUG: do not access the results before calling -startQuery%@", v1, 0xCu);
}

void __30__BRQuery__performBlockAsync___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Collection Gatherer has been invalidated, skip performing the block%@", v2, v3, v4, v5, v6);
}

- (void)executeWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _results == nil%@", v2, v3, v4, v5, v6);
}

- (void)setQueryQueue:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] API MISUSE: running a NSMetadataQuery with maxConcurrentOperationCount != 1 is not supported%@", v2, v3, v4, v5, v6);
}

- (void)_postNote:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] posting %@%@", (void)v3, DWORD2(v3));
}

- (void)_collectUpdates:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 80);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] _toBeInserted = %@%@", (void)v3, DWORD2(v3));
}

- (void)_collectUpdates:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 64);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] _toBeRemoved = %@%@", (void)v3, DWORD2(v3));
}

- (void)_collectUpdates:(uint64_t)a1 .cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 72);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] _toBeReplaced = %@%@", (void)v3, DWORD2(v3));
}

void __26__BRQuery__processUpdates__block_invoke_cold_1()
{
}

- (void)_processChanges:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] the query is stopped, not processing changes%@", v2, v3, v4, v5, v6);
}

- (void)_processChanges:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] no update to collect%@", v2, v3, v4, v5, v6);
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Restarting the receiver%@", v2, v3, v4, v5, v6);
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] setup the query to restart with Crash Marking on%@", v2, v3, v4, v5, v6);
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: receiver == self->_receiver%@", v2, v3, v4, v5, v6);
}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: [idx unsignedLongValue] < _results.count%@", v2, v3, v4, v5, v6);
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: idx < self->_results.count%@", v2, v3, v4, v5, v6);
}

void __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] BRQuery::finishedGathering%@", v2, v3, v4, v5, v6);
}

void __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] BRQuery::itemCollectionGathererGatheredItems - START%@", v2, v3, v4, v5, v6);
}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] BRQuery classificationResultDict = %@%@", (void)v3, DWORD2(v3));
}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_19ED3F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] BRQuery updateHandler\n items = %@ \n deleted = %@%@", (uint8_t *)&v5, 0x20u);
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Rewatch the scopes%@", v2, v3, v4, v5, v6);
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] BRQuery::itemCollectionGathererDidInvalidate - Clearning the results away%@", v2, v3, v4, v5, v6);
}

- (void)_applicationWillResignActive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - BRQuery::_applicationWillResignActive%@", (void)v3, DWORD2(v3));
}

void __40__BRQuery__applicationWillResignActive___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] NSMDQ resignation expired with error %@%@", (void)v3, DWORD2(v3));
}

void __40__BRQuery__applicationWillResignActive___block_invoke_168_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] About to invalidate the assertion%@", v2, v3, v4, v5, v6);
}

- (void)_applicationDidBecomeActive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] %@ - BRQuery::_applicationDidBecomeActive%@", (void)v3, DWORD2(v3));
}

@end