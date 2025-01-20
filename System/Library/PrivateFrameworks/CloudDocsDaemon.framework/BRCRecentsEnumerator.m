@interface BRCRecentsEnumerator
+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:(id)a3;
+ (void)dropRecentsForSession:(id)a3 completionHandler:(id)a4;
- (BOOL)isCancelled;
- (BRCRecentsEnumerator)initWithAccountSession:(id)a3;
- (char)computeTombstoneEntryType:(id)a3;
- (id)_deletedDocIdResultSetFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)changeTokenForNotifRank:(unint64_t)a3;
- (void)_activeSetDidChange;
- (void)_deleteAllRanks;
- (void)_enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)_handleResetForRowID:(int64_t)a3 notifRank:(unint64_t)a4 completionHandler:(id)a5;
- (void)_readyForIndexingWithAckedRank:(unint64_t)a3;
- (void)_signalActiveSetDidChange;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)dropIndexForClientZone:(id)a3;
- (void)dropItemWithFileObjectID:(id)a3 notifRank:(unint64_t)a4 itemIsLive:(BOOL)a5;
- (void)enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)garbageCollectRanksPreceding:(unint64_t)a3;
- (void)maxNotifRankWasFlushed;
- (void)resume;
@end

@implementation BRCRecentsEnumerator

- (void)dropIndexForClientZone:(id)a3
{
  session = self->_session;
  id v5 = a3;
  v6 = [(BRCAccountSession *)session clientDB];
  [v6 assertOnQueue];

  v7 = +[BRCPersistedState loadFromClientStateInSession:self->_session];
  uint64_t v8 = [v7 allocateNotifRank];

  id v10 = [(BRCAccountSession *)self->_session clientDB];
  v9 = [v5 dbRowID];

  [v10 execute:@"INSERT INTO tombstones (file_object_id, file_object_id_type, notif_rank) VALUES (%lld, %d, %lld)", objc_msgSend(v9, "longLongValue"), 2, v8];
}

- (void)dropItemWithFileObjectID:(id)a3 notifRank:(unint64_t)a4 itemIsLive:(BOOL)a5
{
  id v8 = a3;
  v9 = [(BRCAccountSession *)self->_session clientDB];
  [v9 assertOnQueue];

  if (a5)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  char v11 = [v8 isFolderOrAliasID];
  session = self->_session;
  if (v11)
  {
    v13 = [v8 folderID];
    -[BRCAccountSession globalItemByFileID:](session, "globalItemByFileID:", [v13 unsignedLongLongValue]);
  }
  else
  {
    v13 = [v8 documentID];
    -[BRCAccountSession globalItemByDocumentID:](session, "globalItemByDocumentID:", [v13 unsignedIntValue]);
  id v10 = };

  if (!v10 || ([v10 isOnDisk] & 1) == 0)
  {
LABEL_11:
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCRecentsEnumerator(LegacyAdditions) dropItemWithFileObjectID:notifRank:itemIsLive:]();
    }

    int v18 = [(BRCRecentsEnumerator *)self computeTombstoneEntryType:v8];
    v14 = [(BRCAccountSession *)self->_session clientDB];
    [v14 execute:@"INSERT INTO tombstones (file_object_id, file_object_id_type, notif_rank) VALUES (%lld, %d, %lld)", objc_msgSend(v8, "rawID"), v18, a4];
    goto LABEL_14;
  }
  v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCRecentsEnumerator(LegacyAdditions) dropItemWithFileObjectID:notifRank:itemIsLive:]();
  }

LABEL_14:
}

+ (void)dropRecentsForSession:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  v7 = dispatch_group_create();
  id v8 = objc_msgSend(MEMORY[0x1E4F594D8], "br_getDomainIdentifierForCurrentPersona");
  v9 = objc_msgSend(MEMORY[0x1E4F25DE0], "br_sharedProviderManagerWithDomainID:", v8);
  if (v9)
  {
    dispatch_group_enter(v7);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke;
    v22[3] = &unk_1E6993588;
    v24 = v27;
    v23 = v7;
    objc_msgSend(v9, "br_signalWorkingSetEnumeratorWithCompletionHandler:", v22);
  }
  id v10 = [v5 clientDB];
  if (v10)
  {
    dispatch_group_enter(v7);
    char v11 = [v10 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4;
    block[3] = &unk_1E69935B0;
    id v19 = v10;
    v21 = v25;
    v20 = v7;
    dispatch_async(v11, block);
  }
  v12 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_9;
  v14[3] = &unk_1E69935D8;
  id v15 = v6;
  v16 = v27;
  v17 = v25;
  id v13 = v6;
  dispatch_group_notify(v7, v12, v14);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) execute:@"DELETE FROM tombstones"])
  {
    v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_2(v2, (uint64_t)v5, v6);
    }

    uint64_t v7 = [*(id *)(a1 + 32) lastError];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v3 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_9(void *a1)
{
  uint64_t result = a1[4];
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
    if (!v3) {
      uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void))a3;
  if (([MEMORY[0x1E4F23838] isIndexingAvailable] & 1) == 0)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:]();
    }
    goto LABEL_8;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"didDropCoreSpotlightIndex", (CFStringRef)*MEMORY[0x1E4F592E8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && AppBooleanValue)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:]();
    }
LABEL_8:

    if (v3) {
      v3[2](v3, 0);
    }
    goto LABEL_14;
  }
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping CoreSpotlight index%@", buf, 0xCu);
  }

  id v9 = objc_alloc(MEMORY[0x1E4F23838]);
  id v10 = (void *)[v9 initWithName:@"com.apple.clouddocs-items" protectionClass:*MEMORY[0x1E4F28358]];
  if (!v10)
  {
    char v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[BRCRecentsEnumerator dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:]();
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E6997220;
  v14 = v3;
  [v10 deleteAllSearchableItemsWithCompletionHandler:v13];

LABEL_14:
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_3();
    }
LABEL_4:

    goto LABEL_8;
  }
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_2();
  }

  uint64_t v8 = (CFStringRef *)MEMORY[0x1E4F592E8];
  CFPreferencesSetAppValue(@"didDropCoreSpotlightIndex", MEMORY[0x1E4F1CC38], (CFStringRef)*MEMORY[0x1E4F592E8]);
  if (!CFPreferencesAppSynchronize(*v8))
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_1();
    }
    goto LABEL_4;
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (char)computeTombstoneEntryType:(id)a3
{
  return [a3 isFolderOrAliasID] ^ 1;
}

- (void)_deleteAllRanks
{
  id v2 = [(BRCAccountSession *)self->_session clientDB];
  [v2 execute:@"DELETE FROM tombstones"];
}

- (void)garbageCollectRanksPreceding:(unint64_t)a3
{
  id v4 = [(BRCAccountSession *)self->_session clientDB];
  objc_msgSend(v4, "execute:", @"DELETE FROM tombstones WHERE notif_rank < %lld", a3);
}

- (void)_readyForIndexingWithAckedRank:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t flushedNotifRank = self->_flushedNotifRank;
    int v10 = 134218498;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    unint64_t v13 = flushedNotifRank;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning index acked rank %llu (flushed rank %llu)%@", (uint8_t *)&v10, 0x20u);
  }

  if (a3 + 1 > self->_flushedNotifRank)
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCRecentsEnumerator _readyForIndexingWithAckedRank:]();
    }
  }
  [(BRCRecentsEnumerator *)self _signalActiveSetDidChange];
}

- (id)changeTokenForNotifRank:(unint64_t)a3
{
  id v5 = objc_alloc_init(BRCRecentsChangeToken);
  [(BRCRecentsChangeToken *)v5 setDatabaseID:[(BRCAccountSession *)self->_session databaseIDHash]];
  [(BRCRecentsChangeToken *)v5 setNotifRank:a3];
  id v6 = [(BRCRecentsChangeToken *)v5 toData];

  return v6;
}

- (void)_handleResetForRowID:(int64_t)a3 notifRank:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v43 = a3;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 2112;
    v47 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] handling reset for rowID %lld, notif rank: %llu%@", buf, 0x20u);
  }

  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F25DE0], "br_sharedProviderManager");
  session = self->_session;
  unint64_t v13 = [NSNumber numberWithLongLong:a3];
  __int16 v14 = [(BRCAccountSession *)session serverZoneByRowID:v13];
  id v15 = [v14 clientZone];

  if ([v15 isPrivateZone])
  {
    v31 = v11;
    unint64_t v32 = a4;
    uint64_t v16 = [v15 asPrivateClientZone];
    v17 = [v16 appLibraries];

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = [v15 asPrivateClientZone];
    v20 = [v19 appLibraries];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v37 + 1) + 8 * v24) appLibraryID];
          if (v25) {
            [v18 addObject:v25];
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }

    id v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v43 = (int64_t)v18;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v26;
      _os_log_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Dropping spotlight index for %@ due to a reset%@", buf, 0x16u);
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke;
    v33[3] = &unk_1E69948C8;
    v33[4] = self;
    id v34 = v18;
    unint64_t v36 = v32;
    id v35 = v8;
    id v28 = v18;
    unint64_t v11 = v31;
    [v31 deleteSearchableItemsWithSpotlightDomainIdentifiers:v28 completionHandler:v33];

    goto LABEL_20;
  }
  v29 = brc_bread_crumbs();
  v30 = brc_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v43 = (int64_t)v29;
    _os_log_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] reset zone is not a private zone, skipping%@", buf, 0xCu);
  }

  [(BRCRecentsEnumerator *)self _readyForIndexingWithAckedRank:a4];
  if (v8)
  {
    v17 = [(BRCRecentsEnumerator *)self changeTokenForNotifRank:a4];
    (*((void (**)(id, void *, void))v8 + 2))(v8, v17, 0);
LABEL_20:
  }
}

void __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke_2;
  block[3] = &unk_1E6995BD0;
  id v10 = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __73__BRCRecentsEnumerator__handleResetForRowID_notifRank_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_6;
  }
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_error_impl(&dword_1D353B000, v3, (os_log_type_t)0x90u, "[ERROR] Failed to delete searchable items for mangledIDs %@: %@%@", (uint8_t *)&v8, 0x20u);
  }

  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 64) - 1;
  }
  else {
LABEL_6:
  }
    uint64_t v4 = *(void *)(a1 + 64);
  [*(id *)(a1 + 48) _readyForIndexingWithAckedRank:v4];
  id v5 = [*(id *)(a1 + 48) changeTokenForNotifRank:v4];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_deletedDocIdResultSetFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [(BRCPQLConnection *)self->_indexingDB fetch:@"SELECT file_object_id, file_object_id_type, notif_rank FROM tombstones    WHERE notif_rank >= %lld ORDER BY notif_rank ASC LIMIT %lld", a3, a4];
  return v7;
}

- (void)maxNotifRankWasFlushed
{
  id v3 = [(BRCAccountSession *)self->_session clientDB];
  [v3 assertOnQueue];

  uint64_t v4 = +[BRCPersistedState loadFromClientStateInSession:self->_session];
  uint64_t v5 = [v4 nextNotifRank] - 1;

  tracker = self->_tracker;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__BRCRecentsEnumerator_maxNotifRankWasFlushed__block_invoke;
  v8[3] = &unk_1E6995308;
  v8[4] = self;
  v8[5] = v5;
  brc_task_tracker_async_with_logs(tracker, queue, v8, &__block_literal_global_37);
}

uint64_t __46__BRCRecentsEnumerator_maxNotifRankWasFlushed__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  unint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 40) < v2)
  {
    *(void *)(v1 + 40) = v2;
    return [*(id *)(result + 32) _signalActiveSetDidChange];
  }
  return result;
}

- (void)_enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v52 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  uint64_t v92 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  v51 = v8;
  v53 = self;
  if (v8)
  {
    uint64_t v9 = [v8 databaseID];
    if (v9 != [(BRCAccountSession *)self->_session databaseIDHash])
    {
      id v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u)) {
        -[BRCRecentsEnumerator _enumerateChangesFromChangeToken:limit:completion:]();
      }

      unint64_t v36 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke;
      v79[3] = &unk_1E6994600;
      v79[4] = self;
      id v80 = v52;
      dispatch_async(v36, v79);

      goto LABEL_43;
    }
    uint64_t v10 = [v8 notifRank];
    id v8 = (id)([v8 notifRank] + 1);
    p_unint64_t flushedNotifRank = &self->_flushedNotifRank;
    if ((unint64_t)v8 > self->_flushedNotifRank)
    {
      uint64_t v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v43 = *p_flushedNotifRank;
        *(_DWORD *)buf = 134218498;
        id v95 = v8;
        __int16 v96 = 2048;
        unint64_t v97 = v43;
        __int16 v98 = 2112;
        v99 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] incoming rank is newer than what we know about: %lld > %lld, stopping here%@", buf, 0x20u);
      }

      if (v52)
      {
        id v13 = [(BRCRecentsEnumerator *)self changeTokenForNotifRank:v10];
        (*((void (**)(id, void, void, void *, void))v52 + 2))(v52, 0, 0, v13, 0);
      }
      goto LABEL_43;
    }
  }
  else
  {
    p_unint64_t flushedNotifRank = &self->_flushedNotifRank;
  }
  uint64_t v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  unint64_t v54 = a4;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v42 = *p_flushedNotifRank;
    *(_DWORD *)buf = 134218498;
    id v95 = v8;
    __int16 v96 = 2048;
    unint64_t v97 = v42;
    __int16 v98 = 2112;
    v99 = v14;
    _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerating changes from notif rank %llu (max %llu)%@", buf, 0x20u);
  }
  id v50 = v8;

  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_78;
  v78[3] = &unk_1E6998698;
  v78[4] = &v89;
  v78[5] = &v85;
  v78[6] = &v81;
  uint64_t v48 = (uint64_t (**)(void, void))MEMORY[0x1D94389C0](v78);
  v47 = [(BRCAccountSession *)self->_session itemsNeedingIndexingEnumeratorFromNotifRank:v8 batchSize:a4 db:self->_indexingDB];
  v49 = [(BRCRecentsEnumerator *)self _deletedDocIdResultSetFromNotifRank:v8 batchSize:a4];
  uint64_t v16 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_85;
  block[3] = &unk_1E6995308;
  void block[4] = self;
  block[5] = v8;
  dispatch_async(v16, block);

  uint64_t v17 = ((uint64_t (**)(void, void *))v48)[2](v48, v49);
  if ((id)v82[3] == v8 && *((unsigned char *)v86 + 24) == 2)
  {
    uint64_t v18 = v90[3];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_86;
    v75[3] = &unk_1E69986E0;
    id v76 = v52;
    [(BRCRecentsEnumerator *)self _handleResetForRowID:v18 notifRank:v8 completionHandler:v75];
  }
  else
  {
    context = (void *)MEMORY[0x1D9438760](v17);
    id v19 = objc_alloc_init(BRCRecentsChangeToken);
    v20 = [[BRCRecentsEnumeratorBatch alloc] initWithBatchSize:a4];
    [(BRCRecentsChangeToken *)v19 setDatabaseID:[(BRCAccountSession *)v53->_session databaseIDHash]];
    __int16 v46 = v19;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_3;
    v66[3] = &unk_1E6998708;
    v71 = &v81;
    v66[4] = v53;
    v72 = &v85;
    v73 = &v89;
    uint64_t v21 = v20;
    v67 = v21;
    id v69 = &__block_literal_global_82_2;
    unint64_t v74 = a4;
    v70 = v48;
    id v68 = v49;
    uint64_t v22 = (uint64_t (**)(void))MEMORY[0x1D94389C0](v66);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v23 = v47;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v93 count:16];
    uint64_t v25 = v24;
    if (v24)
    {
      uint64_t v26 = *(void *)v63;
LABEL_16:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v63 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v62 + 1) + 8 * v27);
        v29 = (void *)MEMORY[0x1D9438760](v24);
        while (1)
        {
          unint64_t v30 = v82[3];
          if (v30 >= objc_msgSend(v28, "notifsRank", context)) {
            break;
          }
          if ((v22[2](v22) & 1) == 0) {
            goto LABEL_28;
          }
        }
        if ([v28 notifsRank] > *p_flushedNotifRank
          || ([(BRCRecentsEnumeratorBatch *)v21 addIndexOfItem:v28],
              [(BRCRecentsEnumeratorBatch *)v21 batchCount] >= v54))
        {
LABEL_28:
          BOOL v32 = 0;
          int v33 = 12;
          goto LABEL_29;
        }
        unint64_t v31 = [(BRCRecentsEnumeratorBatch *)v21 rank];
        BOOL v32 = v31 < *p_flushedNotifRank;
        int v33 = v31 >= *p_flushedNotifRank ? 12 : 0;
LABEL_29:
        if (!v32) {
          break;
        }
        if (++v27 == v25)
        {
          uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v93 count:16];
          uint64_t v25 = v24;
          if (v24) {
            goto LABEL_16;
          }
          goto LABEL_32;
        }
      }

      if (v33) {
        goto LABEL_39;
      }
    }
    else
    {
LABEL_32:
    }
    do
    {
      if (v82[3] == -1) {
        break;
      }
      long long v37 = (void *)MEMORY[0x1D9438760]();
      char v38 = v22[2](v22);
    }
    while ((v38 & 1) != 0);
LABEL_39:
    uint64_t v39 = [(BRCRecentsEnumeratorBatch *)v21 rank];
    if (!v39) {
      uint64_t v39 = *p_flushedNotifRank;
    }
    [(BRCRecentsChangeToken *)v46 setNotifRank:v39];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_90;
    v56[3] = &unk_1E6998758;
    id v61 = v50;
    long long v40 = v21;
    v57 = v40;
    v58 = v53;
    v41 = v46;
    v59 = v41;
    id v60 = v52;
    [(BRCRecentsEnumeratorBatch *)v40 listItems:v56];
  }

LABEL_43:
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAllRanks];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_78(void *a1, void *a2)
{
  id v4 = a2;
  if ([v4 next])
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = [v4 unsignedLongLongAtIndex:0];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v4 intAtIndex:1];
    uint64_t v3 = [v4 longLongAtIndex:2];
  }
  else
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = 0;
    uint64_t v3 = -1;
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
}

id __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F594C8]) initWithDocID:a2];
  }
  else if (a3)
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_cold_1((uint64_t)v5, a3, v6);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F594E0]) initWithFileID:a2];
  }
  return v4;
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) garbageCollectRanksPreceding:*(void *)(a1 + 40)];
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a3);
  }
  return result;
}

uint64_t __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) > *(void *)(*(void *)(a1 + 32) + 40)) {
    return 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 2)
  {
    unint64_t v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_3_cold_1();
    }

    [*(id *)(a1 + 40) setRank:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) - 1];
    return 0;
  }
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) addDeletionOfFileObjectID:v5 rank:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  if ((unint64_t)[*(id *)(a1 + 40) batchCount] >= *(void *)(a1 + 96)
    || (unint64_t)[*(id *)(a1 + 40) rank] >= *(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v4 = 0;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v4 = 1;
  }

  return v4;
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = [*(id *)(a1 + 32) rank];
    *(_DWORD *)buf = 134219010;
    uint64_t v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    id v33 = v5;
    __int16 v34 = 2112;
    id v35 = v6;
    __int16 v36 = 2112;
    long long v37 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] sending batch from %llu to %llu\n updatedItems = %@\n deletedItems = %@%@", buf, 0x34u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 48);
  uint64_t v11 = *(void **)(v9 + 16);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_91;
  v23[3] = &unk_1E6998730;
  v23[4] = v9;
  id v24 = *(id *)(a1 + 48);
  id v27 = *(id *)(a1 + 56);
  id v25 = v5;
  id v26 = v6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_92;
  v18[3] = &unk_1E6998730;
  __int16 v12 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v19 = v12;
  id v13 = *(id *)(a1 + 56);
  id v21 = v26;
  id v22 = v13;
  id v20 = v25;
  id v14 = v26;
  id v15 = v25;
  brc_task_tracker_async_with_logs(v10, v11, v23, v18);
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_91(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_readyForIndexingWithAckedRank:", objc_msgSend(*(id *)(a1 + 40), "notifRank"));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) toData];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v2 + 16))(v2, v4, v3, v5, 0);
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_92(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_readyForIndexingWithAckedRank:", objc_msgSend(*(id *)(a1 + 40), "notifRank"));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) toData];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v2 + 16))(v2, v4, v3, v5, 0);
}

- (void)enumerateChangesFromChangeToken:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[BRCRecentsChangeToken changeTokenFromData:a3];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke;
  v20[3] = &unk_1E6995C20;
  v20[4] = self;
  id v10 = v9;
  id v21 = v10;
  unint64_t v23 = a4;
  id v11 = v8;
  id v22 = v11;
  uint64_t v12 = MEMORY[0x1D94389C0](v20);
  id v13 = (void *)v12;
  if (v10)
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    tracker = self->_tracker;
    id v15 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_4;
    v18[3] = &unk_1E6994600;
    v18[4] = self;
    id v19 = v13;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_5;
    v16[3] = &unk_1E6995800;
    id v17 = v11;
    brc_task_tracker_async_with_logs(tracker, v15, v18, v16);
  }
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  uint64_t v4 = *(void **)(v2 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_2;
  v10[3] = &unk_1E6995C20;
  v10[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v13 = v6;
  id v12 = v7;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_3;
  v8[3] = &unk_1E6995800;
  id v9 = *(id *)(a1 + 48);
  brc_task_tracker_async_with_logs(v3, v4, v10, v8);
}

uint64_t __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateChangesFromChangeToken:*(void *)(a1 + 40) limit:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

uint64_t __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAllRanks];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __73__BRCRecentsEnumerator_enumerateChangesFromChangeToken_limit_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

- (void)_activeSetDidChange
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] active set did change, notifying fileproviderd%@", v2, v3, v4, v5, v6);
}

void __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke_cold_1();
    }
  }
}

- (void)_signalActiveSetDidChange
{
}

- (BRCRecentsEnumerator)initWithAccountSession:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCRecentsEnumerator;
  uint8_t v6 = [(BRCRecentsEnumerator *)&v23 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    id v8 = +[BRCUserDefaults defaultsForMangledID:0];
    [v8 recentsEnumeratorPacerInterval];
    id v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v10 = [(BRCAccountSession *)v7->_session clientTruthWorkloop];
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("recents-enumerator", v11, v10);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v5 clientDB];
    indexingDB = v7->_indexingDB;
    v7->_indexingDB = (BRCPQLConnection *)v14;

    uint64_t v16 = br_pacer_create();
    pacer = v7->_pacer;
    v7->_pacer = (br_pacer *)v16;

    objc_initWeak(&location, v7);
    objc_copyWeak(&v21, &location);
    br_pacer_set_event_handler();
    uint64_t v18 = brc_task_tracker_create("recents-enumerator-tracker");
    tracker = v7->_tracker;
    v7->_tracker = (brc_task_tracker *)v18;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __47__BRCRecentsEnumerator_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activeSetDidChange];
}

- (void)resume
{
  br_pacer_resume();
  [(BRCRecentsEnumerator *)self _signalActiveSetDidChange];
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BRCRecentsEnumerator_close__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_sync(queue, block);
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

uint64_t __29__BRCRecentsEnumerator_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)cancel
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Canceling spotlight indexer.%@", v2, v3, v4, v5, v6);
}

- (BOOL)isCancelled
{
  return br_pacer_test_cancel() != 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BRCRecentsEnumerator;
  [(BRCRecentsEnumerator *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_pacer, 0);
  objc_storeStrong((id *)&self->_indexingDB, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] failed to signal enumerator for root container: %@%@", v1, 0x16u);
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted ranks from tombstones successfully%@", (uint8_t *)&v2, 0xCu);
}

void __81__BRCRecentsEnumerator_LegacyAdditions__dropRecentsForSession_completionHandler___block_invoke_4_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 lastError];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] failed deleting ranks from tombstones: %@%@", (uint8_t *)&v6, 0x16u);
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] CoreSpotlight index has already been dropped%@", v2, v3, v4, v5, v6);
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: index%@", v1, 0xCu);
}

+ (void)dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] device does not support CoreSpotlight indexing, no need to drop any index%@", v2, v3, v4, v5, v6);
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D353B000, v1, (os_log_type_t)0x90u, "[ERROR] failed to synchronize user defaults for %@%@", v2, 0x16u);
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] dropped Spotlight index successfully%@", v2, v3, v4, v5, v6);
}

void __82__BRCRecentsEnumerator_dropLegacyCoreSpotlightIndexIfNeededWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed dropping Spotlight index: %@%@");
}

- (void)_readyForIndexingWithAckedRank:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Finished indexing for now%@", v2, v3, v4, v5, v6);
}

- (void)_enumerateChangesFromChangeToken:limit:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] change token has expired, index should be dropped%@", v1, 0xCu);
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_2_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: bad tombstone entry type: %d%@", (uint8_t *)v3, 0x12u);
}

void __74__BRCRecentsEnumerator__enumerateChangesFromChangeToken_limit_completion___block_invoke_3_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D353B000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] found a tombstone entry of type client zone db rowid (%lld), sending current batch%@", v2, 0x16u);
}

void __43__BRCRecentsEnumerator__activeSetDidChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed to signal enumerator for working set: %@%@");
}

@end