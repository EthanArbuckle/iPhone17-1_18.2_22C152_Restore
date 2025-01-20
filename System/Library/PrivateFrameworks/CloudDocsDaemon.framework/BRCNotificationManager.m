@interface BRCNotificationManager
- (BOOL)hasActiveAliasWatchers;
- (BOOL)hasWatcherForDocumentID:(id)a3;
- (BOOL)hasWatcherMatchingGlobalItemID:(id)a3;
- (BOOL)isCancelled;
- (BRCAccountSession)session;
- (BRCNotificationManager)initWithAccountSession:(id)a3;
- (id)pipeWithReceiver:(id)a3;
- (void)_dispatchUpdatesToPipesWithRank:(unint64_t)a3;
- (void)_queueAdditionalUpdates;
- (void)cancel;
- (void)close;
- (void)fetchLastFlushedRankWithReply:(id)a3;
- (void)flushUpdatesWithRank:(unint64_t)a3;
- (void)getPipeWithXPCReceiver:(id)a3 client:(id)a4 reply:(id)a5;
- (void)invalidatePipeReceiversWatchingAppLibraryIDs:(id)a3 completionBlock:(id)a4;
- (void)invalidatePipesWatchingAppLibraryIDs:(id)a3;
- (void)pipeDelegateInvalidated:(id)a3;
- (void)queueProgressUpdates:(id)a3;
- (void)queueUpdate:(id)a3;
- (void)queueUpdateForItemAtRowID:(unint64_t)a3;
- (void)registerAppLibraries:(id)a3 forFlags:(unint64_t)a4;
- (void)registerPipe:(id)a3 asWatcherForFileObjectID:(id)a4;
- (void)unregisterAppLibraries:(id)a3 forFlags:(unint64_t)a4;
- (void)unregisterPipeAsWatcher:(id)a3;
@end

@implementation BRCNotificationManager

- (void)queueProgressUpdates:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__BRCNotificationManager_LegacyAdditions__queueProgressUpdates___block_invoke;
  v16[3] = &unk_1E6993628;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  v7 = queue;
  v8 = v16;
  v9 = (void *)MEMORY[0x1D9438760]();
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v18);
  v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v18;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(void *)&block[4] = v14;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v24 = v18;
  uint64_t v25 = v19;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_0;
  v21 = &unk_1E6993710;
  v12 = v7;
  v22 = v12;
  v13 = v8;
  id v23 = v13;
  dispatch_async(v12, block);
}

void __64__BRCNotificationManager_LegacyAdditions__queueProgressUpdates___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D9438760](v3);
        objc_msgSend(v7, "processProgressUpdates:", *(void *)(a1 + 40), (void)v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (BOOL)hasActiveAliasWatchers
{
  return atomic_load_explicit((atomic_ullong *volatile)&self->_activeAliasQueries, memory_order_acquire) != 0;
}

- (BOOL)hasWatcherForDocumentID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F594C8]) initWithDocIDNumber:v4];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  v7 = [(NSMutableDictionary *)v6->_watchersByFileObjectID objectForKeyedSubscript:v5];
  BOOL v8 = [v7 count] != 0;

  objc_sync_exit(v6);
  return v8;
}

- (BRCNotificationManager)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BRCNotificationManager;
  uint64_t v6 = [(BRCNotificationManager *)&v34 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = +[BRCPersistedState loadFromClientStateInSession:v7->_session];
    state = v7->_state;
    v7->_state = (BRCClientRanksPersistedState *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    pipes = v7->_pipes;
    v7->_pipes = (NSHashTable *)v10;

    long long v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.brc.notififcation-mgr", v13);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v14;

    v16 = (BRNotificationQueue *)objc_alloc_init(MEMORY[0x1E4F594F0]);
    notifs = v7->_notifs;
    v7->_notifs = v16;

    long long v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    additionalUpdatesItemRowID = v7->_additionalUpdatesItemRowID;
    v7->_additionalUpdatesItemRowID = v18;

    v20 = [(BRCAccountSession *)v7->_session clientDB];
    v21 = [v20 serialQueue];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __49__BRCNotificationManager_initWithAccountSession___block_invoke;
    v31 = &unk_1E6993628;
    id v32 = v5;
    v22 = v7;
    v33 = v22;
    dispatch_sync(v21, &v28);

    id v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    watchersByFileObjectID = v22->_watchersByFileObjectID;
    v22->_watchersByFileObjectID = v23;

    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v28, v29, v30, v31);
    fileObjectIDByWatcher = v22->_fileObjectIDByWatcher;
    v22->_fileObjectIDByWatcher = (NSMapTable *)v25;
  }
  return v7;
}

void __49__BRCNotificationManager_initWithAccountSession___block_invoke(uint64_t a1)
{
  id v2 = +[BRCPersistedState loadFromClientStateInSession:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 nextNotifRank];

  *(void *)(*(void *)(a1 + 40) + 96) = v3;
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BRCNotificationManager_close__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = self;
  objc_sync_enter(v4);
  watchersByFileObjectID = v4->_watchersByFileObjectID;
  v4->_watchersByFileObjectID = 0;

  fileObjectIDByWatcher = v4->_fileObjectIDByWatcher;
  v4->_fileObjectIDByWatcher = 0;

  objc_sync_exit(v4);
}

uint64_t __31__BRCNotificationManager_close__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v6++) close];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)registerAppLibraries:(id)a3 forFlags:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if ((a4 & 4) != 0) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeAliasQueries, 1uLL);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    unint64_t v11 = (a4 >> 2) & 1;
    unint64_t v12 = (a4 >> 1) & 1;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) registerQueryWithAliases:v11 isRecursive:v12];
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)unregisterAppLibraries:(id)a3 forFlags:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) unregisterQueryWithAliases:(a4 >> 2) & 1 isRecursive:(a4 >> 1) & 1];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if ((a4 & 4) != 0) {
    atomic_fetch_add((atomic_ullong *volatile)&self->_activeAliasQueries, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)registerPipe:(id)a3 asWatcherForFileObjectID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  [(BRCNotificationManager *)v8 unregisterPipeAsWatcher:v6];
  uint64_t v9 = [(NSMapTable *)v8->_fileObjectIDByWatcher objectForKey:v6];
  if (v9)
  {
    uint64_t v10 = [(NSMutableDictionary *)v8->_watchersByFileObjectID objectForKeyedSubscript:v9];
    [v10 removeObject:v6];
  }
  [(NSMapTable *)v8->_fileObjectIDByWatcher setObject:v7 forKey:v6];
  id v11 = [(NSMutableDictionary *)v8->_watchersByFileObjectID objectForKeyedSubscript:v7];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)v8->_watchersByFileObjectID setObject:v11 forKeyedSubscript:v7];
  }
  [v11 addObject:v6];
  long long v12 = brc_bread_crumbs();
  long long v13 = brc_notifications_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Pipe %@ watching %@%@", (uint8_t *)&v14, 0x20u);
  }

  objc_sync_exit(v8);
}

- (void)unregisterPipeAsWatcher:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMapTable *)v5->_fileObjectIDByWatcher objectForKey:v4];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)v5->_watchersByFileObjectID objectForKeyedSubscript:v6];
    [v7 removeObject:v4];
    if (![v7 count]) {
      [(NSMutableDictionary *)v5->_watchersByFileObjectID setObject:0 forKeyedSubscript:v6];
    }
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_notifications_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412802;
      id v11 = v4;
      __int16 v12 = 2112;
      long long v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] Pipe %@ no longer watching %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
  objc_sync_exit(v5);
}

- (void)getPipeWithXPCReceiver:(id)a3 client:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCNotificationManager getPipeWithXPCReceiver:client:reply:]((uint64_t)v15, v16);
    }
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__BRCNotificationManager_getPipeWithXPCReceiver_client_reply___block_invoke;
  v17[3] = &unk_1E6993D18;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v17);
}

void __62__BRCNotificationManager_getPipeWithXPCReceiver_client_reply___block_invoke(void *a1)
{
  id v2 = [[BRCNotificationPipe alloc] initWithXPCReceiver:a1[4] client:a1[5] manager:a1[6] startingRank:*(void *)(a1[6] + 96)];
  [(BRCNotificationPipe *)v2 setDelegate:a1[5]];
  [*(id *)(a1[6] + 16) addObject:v2];
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)pipeWithReceiver:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7;
  id v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BRCNotificationManager_pipeWithReceiver___block_invoke;
  block[3] = &unk_1E69936C0;
  id v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __43__BRCNotificationManager_pipeWithReceiver___block_invoke(void *a1)
{
  id v2 = [[BRCNotificationPipe alloc] initWithReceiver:a1[4] manager:a1[5] startingRank:*(void *)(a1[5] + 96)];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1[5] + 16);
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v5 addObject:v6];
}

- (void)queueUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fileObjectID];

  if (!v5)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCNotificationManager queueUpdate:]((uint64_t)v8, v9);
    }
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__BRCNotificationManager_queueUpdate___block_invoke;
  v10[3] = &unk_1E6993628;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  dispatch_async_with_logs_1(queue, v10);
}

uint64_t __38__BRCNotificationManager_queueUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addNotification:*(void *)(a1 + 40) asDead:0];
}

- (void)queueUpdateForItemAtRowID:(unint64_t)a3
{
  obj = self->_additionalUpdatesItemRowID;
  objc_sync_enter(obj);
  additionalUpdatesItemRowID = self->_additionalUpdatesItemRowID;
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableSet *)additionalUpdatesItemRowID addObject:v6];

  objc_sync_exit(obj);
}

- (void)fetchLastFlushedRankWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__BRCNotificationManager_fetchLastFlushedRankWithReply___block_invoke;
  v7[3] = &unk_1E69952C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__BRCNotificationManager_fetchLastFlushedRankWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 96));
}

- (void)_dispatchUpdatesToPipesWithRank:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_previousMaxRank != a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F594D8], "br_getDomainIdentifierForCurrentPersona");
    id v6 = objc_msgSend(MEMORY[0x1E4F25DE0], "br_sharedProviderManagerWithDomainID:", v5);
    objc_msgSend(v6, "br_signalWorkingSetEnumeratorWithCompletionHandler:", &__block_literal_global_11);
  }
  self->_previousMaxRank = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_pipes;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1D9438760](v8);
        objc_msgSend(v12, "processUpdates:withRank:", self->_notifs, a3, (void)v14);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  [(BRNotificationQueue *)self->_notifs removeAllObjects];
}

void __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke_cold_1((uint64_t)v2, (uint64_t)v3, v4);
    }
  }
}

- (void)_queueAdditionalUpdates
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  obj = self->_additionalUpdatesItemRowID;
  objc_sync_enter(obj);
  if ([(NSMutableSet *)self->_additionalUpdatesItemRowID count])
  {
    uint64_t v3 = (void *)[(NSMutableSet *)self->_additionalUpdatesItemRowID copy];
    [(NSMutableSet *)self->_additionalUpdatesItemRowID removeAllObjects];
    objc_sync_exit(obj);

    memset(v20, 0, sizeof(v20));
    __brc_create_section(0, (uint64_t)"-[BRCNotificationManager _queueAdditionalUpdates]", 265, v20);
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_notifications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v20[0];
      uint64_t v14 = [v3 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx collecting %lu additional folder updates%@", buf, 0x20u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = (void *)MEMORY[0x1D9438760]();
          id v12 = -[BRCAccountSession itemByRowID:](self->_session, "itemByRowID:", [v10 unsignedLongLongValue]);
          [v12 triggerNotificationIfNeeded];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    __brc_leave_section(v20);
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (void)flushUpdatesWithRank:(unint64_t)a3
{
  [(BRCNotificationManager *)self _queueAdditionalUpdates];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BRCNotificationManager_flushUpdatesWithRank___block_invoke;
  v6[3] = &unk_1E6995308;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_with_logs_1(queue, v6);
}

uint64_t __47__BRCNotificationManager_flushUpdatesWithRank___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchUpdatesToPipesWithRank:*(void *)(a1 + 40)];
}

- (void)invalidatePipesWatchingAppLibraryIDs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__BRCNotificationManager_invalidatePipesWatchingAppLibraryIDs___block_invoke;
  v7[3] = &unk_1E6993628;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __63__BRCNotificationManager_invalidatePipesWatchingAppLibraryIDs___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationManager invalidatePipesWatchingAppLibraryIDs:]_block_invoke", 285, v13);
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v13[0];
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating pipes watching %@%@", buf, 0x20u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidateIfWatchingAppLibraryIDs:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  __brc_leave_section(v13);
}

- (void)pipeDelegateInvalidated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__BRCNotificationManager_pipeDelegateInvalidated___block_invoke;
  v7[3] = &unk_1E6993628;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__BRCNotificationManager_pipeDelegateInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(v2, "objectEnumerator", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = [v8 delegate];
        long long v10 = *(void **)(a1 + 40);

        if (v9 == v10) {
          [v8 close];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)invalidatePipeReceiversWatchingAppLibraryIDs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__BRCNotificationManager_invalidatePipeReceiversWatchingAppLibraryIDs_completionBlock___block_invoke;
  v11[3] = &unk_1E69946C8;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async_with_logs_1(queue, v11);
}

void __87__BRCNotificationManager_invalidatePipeReceiversWatchingAppLibraryIDs_completionBlock___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationManager invalidatePipeReceiversWatchingAppLibraryIDs:completionBlock:]_block_invoke", 310, v13);
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v13[0];
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating NSMDQs watching %@%@", buf, 0x20u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1[5] + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "invalidateReceiverIfWatchingAppLibraryIDs:", a1[4], (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __brc_leave_section(v13);
}

- (BOOL)hasWatcherMatchingGlobalItemID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = v5->_pipes;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isWatchingGlobalItemID:", v4, (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDByWatcher, 0);
  objc_storeStrong((id *)&self->_additionalUpdatesItemRowID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_transferCache, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_watchersByFileObjectID, 0);
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getPipeWithXPCReceiver:(uint64_t)a1 client:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: reply%@", (uint8_t *)&v2, 0xCu);
}

- (void)queueUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.fileObjectID%@", (uint8_t *)&v2, 0xCu);
}

void __58__BRCNotificationManager__dispatchUpdatesToPipesWithRank___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] failed to signal enumerator for root container: %@%@", (uint8_t *)&v3, 0x16u);
}

@end