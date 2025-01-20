@interface BRCSideCarSyncUpOperation
- (BOOL)shouldPerformAnotherBatch;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSideCarSyncUpOperation)initWithSession:(id)a3;
- (id)_itemsNeedingSyncUpEnumerator;
- (id)createActivity;
- (void)_markItemsFailedSync;
- (void)_syncUpRecordBatchWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 recordIDToZoneMap:(id)a5 requestID:(unint64_t)a6;
- (void)fakeSyncForItem:(id)a3 itemRank:(unint64_t)a4;
- (void)main;
@end

@implementation BRCSideCarSyncUpOperation

- (BRCSideCarSyncUpOperation)initWithSession:(id)a3
{
  id v5 = a3;
  v6 = [v5 syncContextProvider];
  v7 = [v6 sideCarSyncContext];
  v10.receiver = self;
  v10.super_class = (Class)BRCSideCarSyncUpOperation;
  v8 = [(_BRCOperation *)&v10 initWithName:@"side-car.sync-up" syncContext:v7 sessionContext:v5];

  if (v8) {
    objc_storeStrong((id *)&v8->_session, a3);
  }

  return v8;
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->_shouldPerformAnotherBatch;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sync/side-car-sync-up", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_markItemsFailedSync
{
  v3 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async_and_wait(v3, block);
}

void __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke(uint64_t a1)
{
  os_activity_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) clientDB];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke_2;
  v3[3] = &unk_1E6993A60;
  v3[4] = *(void *)(a1 + 32);
  [v2 performWithFlags:4 action:v3];
}

uint64_t __49__BRCSideCarSyncUpOperation__markItemsFailedSync__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "itemsWithSideCarInFlightDiffsEnumerator", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v6 markLatestSyncRequestFailedInZone:&unk_1F2B26E08];
        [v6 saveToDBForServerEdit:1 keepAliases:1];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return 1;
}

- (void)_syncUpRecordBatchWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 recordIDToZoneMap:(id)a5 requestID:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32 = (void *)a6;
  uint64_t v13 = [v10 count];
  if (v13 + [v11 count])
  {
    if (!a6)
    {
      v22 = brc_bread_crumbs();
      v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCSideCarSyncUpOperation _syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:]((uint64_t)v22, v23);
      }
    }
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[BRCSideCarSyncUpOperation _syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:]((uint64_t)v14, a6, v15);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F1A198]);
    v17 = [v11 allKeys];
    v18 = (void *)[v16 initWithRecordsToSave:v10 recordIDsToDelete:v17];

    [v18 setRecordIDsToDeleteToEtags:v11];
    v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v32 length:8];
    [v18 setClientChangeTokenData:v19];

    objc_initWeak(&location, v18);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke;
    v26[3] = &unk_1E69953F8;
    objc_copyWeak(v30, &location);
    v26[4] = self;
    id v27 = v10;
    id v28 = v11;
    id v29 = v12;
    v30[1] = v32;
    [v18 setModifyRecordsCompletionBlock:v26];
    v20 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_13;
    v24[3] = &unk_1E6993628;
    v24[4] = self;
    id v25 = v18;
    id v21 = v18;
    dispatch_async(v20, v24);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_BRCOperation *)self completedWithResult:0 error:0];
  }
}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(v9, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = WeakRetained;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to create the side car zone on %@ - %@%@", location, 0x20u);
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1A320], "brc_sideCarZoneID");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v14 = [[BRCCreateZoneAndSubscribeOperation alloc] initWithSession:*(void *)(*(void *)(a1 + 32) + 504) zoneID:v13];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_7;
    v29[3] = &unk_1E69953D0;
    objc_copyWeak(v33, (id *)location);
    v15 = *(void **)(a1 + 40);
    v29[4] = *(void *)(a1 + 32);
    id v30 = v15;
    id v31 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    v17 = *(void **)(a1 + 72);
    id v32 = v16;
    v33[1] = v17;
    [(BRCCreateZoneAndSubscribeOperation *)v14 setCreateZoneAndSubscribeCompletionBlock:v29];
    [*(id *)(a1 + 32) addSubOperation:v14];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (v9)
    {
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = WeakRetained;
        __int16 v35 = 2112;
        id v36 = v9;
        __int16 v37 = 2112;
        v38 = v18;
        _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] Failed syncing up side cars on %@ - %@%@", location, 0x20u);
      }

      [*(id *)(a1 + 32) _markItemsFailedSync];
    }
    else
    {
      v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v7;
        __int16 v35 = 2112;
        id v36 = WeakRetained;
        __int16 v37 = 2112;
        v38 = v20;
        _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] finished side car sync up: %@, op: %@%@", location, 0x20u);
      }

      v22 = [*(id *)(*(void *)(a1 + 32) + 504) clientTruthWorkloop];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      id v25 = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_10;
      v26 = &unk_1E6993628;
      id v27 = v7;
      id v28 = *(id *)(a1 + 56);
      dispatch_async_and_wait(v22, &v23);
    }
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9, v23, v24, v25, v26);
  }
}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v4)
  {
    [*(id *)(a1 + 32) _markItemsFailedSync];
    [WeakRetained completedWithResult:0 error:v4];
  }
  else
  {
    [WeakRetained _syncUpRecordBatchWithModifiedRecords:*(void *)(a1 + 40) deletedRecordIDs:*(void *)(a1 + 48) recordIDToZoneMap:*(void *)(a1 + 56) requestID:*(void *)(a1 + 72)];
  }
}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_10(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412290;
    long long v16 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        id v9 = *(void **)(a1 + 40);
        id v10 = objc_msgSend(v8, "recordID", v16, (void)v17);
        id v11 = [v9 objectForKeyedSubscript:v10];

        if (!v11)
        {
          uint64_t v13 = brc_bread_crumbs();
          v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v23 = v13;
            _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: clientZone%@", buf, 0xCu);
          }
        }
        id v21 = v8;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [v11 learnCKInfosFromSavedRecords:v12 isOutOfBandModifyRecords:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [v2 countByEnumeratingWithState:&v17 objects:v24 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }
}

void __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_13(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 504) clientDB];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_2;
  v4[3] = &unk_1E6993628;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 scheduleFlushWithCheckpoint:0 whenFlushed:v4];
}

uint64_t __112__BRCSideCarSyncUpOperation__syncUpRecordBatchWithModifiedRecords_deletedRecordIDs_recordIDToZoneMap_requestID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubOperation:*(void *)(a1 + 40)];
}

- (void)fakeSyncForItem:(id)a3 itemRank:(unint64_t)a4
{
  id v8 = a3;
  [v8 prepareForSyncUpSideCarZone];
  [v8 markLatestSyncRequestAcknowledgedInZone:&unk_1F2B26E08];
  [v8 saveToDBForServerEdit:1 keepAliases:1];
  if (a4)
  {
    uint64_t v6 = [(BRCAccountSession *)self->_session applyScheduler];
    uint64_t v7 = [v8 serverZone];
    [v6 didMarkSyncIdleForServerRank:a4 zone:v7];
  }
}

- (void)main
{
  uint64_t v3 = self->_session;
  long long v4 = [(BRCAccountSession *)v3 clientTruthWorkloop];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__BRCSideCarSyncUpOperation_main__block_invoke;
  v6[3] = &unk_1E6993628;
  uint64_t v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __33__BRCSideCarSyncUpOperation_main__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientDB];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BRCSideCarSyncUpOperation_main__block_invoke_2;
  v5[3] = &unk_1E6993A88;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  [v2 performWithFlags:12 action:v5];
}

uint64_t __33__BRCSideCarSyncUpOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v77 = a2;
  id v3 = [*(id *)(a1 + 32) _itemsNeedingSyncUpEnumerator];
  v79 = +[BRCUserDefaults defaultsForSideCar];
  unsigned int v4 = [v79 maxRecordCountInModifyRecordsOperation];
  id v5 = objc_opt_new();
  int8x16_t v6 = objc_opt_new();
  v80 = objc_opt_new();
  *(unsigned char *)(*(void *)(a1 + 32) + 512) = 1;
  uint64_t v7 = [v5 count];
  v84 = v6;
  if ([v6 count] + v7 < (unint64_t)v4)
  {
    unint64_t v83 = v4;
    uint64_t v76 = a1;
    v82 = v5;
    do
    {
      id v8 = (void *)MEMORY[0x1D9438760]();
      id v9 = [v3 nextObject];
      if (!v9)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 512) = 0;
        break;
      }
      id v10 = v9;
      id v11 = [v9 sideCarInfo];
      __int16 v12 = [v10 localDiffs];
      uint64_t v13 = [v11 ckInfo];
      v14 = [v13 etag];

      if (([v10 isDead] & 1) != 0
        || (v12 & 0x1A00) != 0 && v14 && ([v11 hasfieldsToSync] & 1) == 0)
      {
        uint64_t v15 = [v10 sideCarInfo];
        long long v16 = [v15 ckInfo];
        long long v17 = [v16 etag];

        if (!v17)
        {
          id v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v28;
            _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Faking sync for side car info delete which isn't known to the server%@", buf, 0xCu);
          }

          [*(id *)(a1 + 32) fakeSyncForItem:v10 itemRank:0];
          goto LABEL_43;
        }
        long long v18 = brc_bread_crumbs();
        long long v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v86 = v10;
          __int16 v87 = 2112;
          v88 = v18;
          _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleting side-car record for %@%@", buf, 0x16u);
        }

        long long v20 = [v10 sideCarRecordID];
        [v5 setObject:v17 forKeyedSubscript:v20];
        goto LABEL_42;
      }
      id v21 = [*(id *)(a1 + 40) clientDB];
      v22 = [v10 itemID];
      uint64_t v23 = [v10 clientZone];
      uint64_t v24 = [v23 dbRowID];
      long long v17 = (void *)[v21 fetch:@"SELECT item_state, item_side_car_ckinfo, item_rank FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v22, v24];

      if ([v17 next])
      {
        int v25 = [v17 intAtIndex:0];
        v26 = [v17 objectOfClass:objc_opt_class() atIndex:1];
        uint64_t v81 = [v17 unsignedLongLongAtIndex:2];
        id v27 = [v26 etag];

        [v17 close];
        if (([v11 hasfieldsToSync] & 1) == 0)
        {
          id v5 = v82;
LABEL_27:
          uint64_t v39 = v81;
LABEL_29:
          v40 = brc_bread_crumbs();
          v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v86 = v10;
            __int16 v87 = 2112;
            v88 = v40;
            _os_log_debug_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] Faking sync of side-car record for %@%@", buf, 0x16u);
          }

          [*(id *)(a1 + 32) fakeSyncForItem:v10 itemRank:v39];
          goto LABEL_32;
        }
        id v5 = v82;
        if (v25 == 1 && ([v10 isKnownByServer] & 1) != 0) {
          goto LABEL_27;
        }
        long long v20 = [v10 baseSideCarRecord];
        if (v27) {
          goto LABEL_24;
        }
        unsigned int v78 = 1;
      }
      else
      {
        id v30 = [v10 itemID];
        id v31 = [v10 serverZone];
        id v32 = [v31 asSharedZone];
        v33 = [v30 sideCarRecordNameWithZone:v32];

        v34 = [*(id *)(a1 + 40) clientDB];
        __int16 v35 = (void *)[v34 fetchObjectOfClass:objc_opt_class(), @"SELECT item_side_car_ckinfo FROM side_car_lookahead WHERE record_name = %@", v33 sql];

        id v36 = [v35 etag];

        if (![v11 hasfieldsToSync])
        {
          uint64_t v39 = 0;
          id v5 = v82;
          goto LABEL_29;
        }
        long long v20 = [v10 baseSideCarRecord];
        uint64_t v81 = 0;
        if (v36)
        {
          id v5 = v82;
LABEL_24:
          __int16 v37 = [v11 ckInfo];
          v38 = [v37 etag];

          unsigned int v78 = 0;
          if (v38) {
            goto LABEL_39;
          }
          goto LABEL_34;
        }
        unsigned int v78 = 1;
        id v5 = v82;
      }
LABEL_34:
      char v42 = [v79 useShareReferenceOnSideCar];
      v43 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v10);
      v44 = v43;
      if ((v42 & 1) == 0)
      {
        v75 = v3;
        v45 = objc_msgSend(v43, "brc_shareItemID");
        if (!v45)
        {
          v65 = brc_bread_crumbs();
          v66 = brc_default_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v65;
            _os_log_fault_impl(&dword_1D353B000, v66, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: itemID%@", buf, 0xCu);
          }
        }
        v46 = [v10 serverZone];
        v47 = [v46 ownerName];
        [v45 derivedAliasItemIDWithOwnerName:v47];
        v48 = v74 = v45;

        v49 = [v10 appLibrary];
        v50 = [v49 defaultClientZone];
        v51 = [v50 serverZone];
        uint64_t v73 = [v48 structureRecordIDForItemType:3 zone:v51 aliasTargetZoneIsShared:1];

        v44 = (void *)v73;
        id v3 = v75;
        id v5 = v82;
      }
      if (v44)
      {
        v52 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v44 action:0];
        [v20 setObject:v52 forKeyedSubscript:@"shareReference"];

LABEL_39:
        v53 = v3;
        v54 = brc_bread_crumbs();
        v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v86 = v10;
          __int16 v87 = 2112;
          v88 = v54;
          _os_log_debug_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up side-car record for %@%@", buf, 0x16u);
        }

        v56 = [v10 st];
        v57 = [v56 logicalName];
        v58 = objc_msgSend(v57, "br_pathExtension");
        objc_msgSend(v20, "serializeSideCarInfo:filenameExtension:diffs:deadInServerTruth:", v11, v58, objc_msgSend(v10, "localDiffs"), v78);

        [v84 addObject:v20];
        v59 = [v10 clientZone];
        v60 = [v59 asSharedClientZone];
        v61 = [v20 recordID];
        [v80 setObject:v60 forKeyedSubscript:v61];

        id v3 = v53;
        a1 = v76;
        id v5 = v82;
LABEL_42:

        [v10 prepareForSyncUpSideCarZone];
        [v10 saveToDB];
        goto LABEL_43;
      }
      v63 = brc_bread_crumbs();
      v64 = brc_default_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v86 = v10;
        __int16 v87 = 2112;
        v88 = v63;
        _os_log_fault_impl(&dword_1D353B000, v64, OS_LOG_TYPE_FAULT, "[CRIT] Unable to compute reference recordID for %@%@", buf, 0x16u);
      }

      a1 = v76;
      [*(id *)(v76 + 32) fakeSyncForItem:v10 itemRank:v81];

LABEL_32:
LABEL_43:

      uint64_t v62 = [v5 count];
    }
    while ([v84 count] + v62 < v83);
  }
  v67 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  v68 = [v67 containerScheduler];
  v69 = [v68 sideCarSyncPersistedState];

  if (!v69)
  {
    v71 = brc_bread_crumbs();
    v72 = brc_default_log();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      __33__BRCSideCarSyncUpOperation_main__block_invoke_2_cold_1((uint64_t)v71, v72);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_syncUpRecordBatchWithModifiedRecords:deletedRecordIDs:recordIDToZoneMap:requestID:", v84, v5, v80, objc_msgSend(v69, "allocateNextRequestID"));

  return 1;
}

- (id)_itemsNeedingSyncUpEnumerator
{
  id v3 = [(BRCAccountSession *)self->_session clientDB];
  unsigned int v4 = (void *)[v3 fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.throttle_state != 0    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_stat_ckinfo IS NOT NULL    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL", &unk_1F2B26E08];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__BRCSideCarSyncUpOperation__itemsNeedingSyncUpEnumerator__block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __58__BRCSideCarSyncUpOperation__itemsNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 504);
  id v5 = a2;
  int8x16_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void).cxx_destruct
{
}

- (void)_syncUpRecordBatchWithModifiedRecords:(os_log_t)log deletedRecordIDs:recordIDToZoneMap:requestID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up side car records with request %llu%@", (uint8_t *)&v3, 0x16u);
}

- (void)_syncUpRecordBatchWithModifiedRecords:(uint64_t)a1 deletedRecordIDs:(NSObject *)a2 recordIDToZoneMap:requestID:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: requestID%@", (uint8_t *)&v2, 0xCu);
}

void __33__BRCSideCarSyncUpOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: state%@", (uint8_t *)&v2, 0xCu);
}

@end