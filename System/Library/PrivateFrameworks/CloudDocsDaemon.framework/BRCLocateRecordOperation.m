@interface BRCLocateRecordOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCLocateRecordOperation)initWithRecordID:(id)a3 serverZone:(id)a4 isUserWaiting:(BOOL)a5 maxBackoff:(double)a6 sessionContext:(id)a7;
- (CKRecordID)recordID;
- (id)createActivity;
- (void)_performAfterLocatingRecord:(id)a3;
- (void)addLocateRecordCompletionBlock:(id)a3;
- (void)cancelToBeReplacedByOperation:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
@end

@implementation BRCLocateRecordOperation

- (BRCLocateRecordOperation)initWithRecordID:(id)a3 serverZone:(id)a4 isUserWaiting:(BOOL)a5 maxBackoff:(double)a6 sessionContext:(id)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = [v14 session];
  v17 = objc_msgSend(v13, "brc_itemIDWithSession:", v16);

  v18 = brc_bread_crumbs();
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v13;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_INFO, "[INFO] Request to locate record: [%@] of item [%@]%@", buf, 0x20u);
  }

  v20 = [v17 debugItemIDString];
  v21 = [@"locate-record/" stringByAppendingString:v20];

  v22 = [v14 metadataSyncContext];
  v28.receiver = self;
  v28.super_class = (Class)BRCLocateRecordOperation;
  v23 = [(_BRCOperation *)&v28 initWithName:v21 syncContext:v22 sessionContext:v15];

  if (v23)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F1A218], "br_locateRecord");
    [(_BRCOperation *)v23 setGroup:v24];

    [(_BRCOperation *)v23 setNonDiscretionary:v9];
    [(_BRCOperation *)v23 setMaxBackoff:a6];
    objc_storeStrong((id *)&v23->_recordID, a3);
    objc_storeStrong((id *)&v23->_structureRecordID, a3);
    objc_storeStrong((id *)&v23->_serverZone, a4);
    uint64_t v25 = objc_opt_new();
    locateRecordCompletionBlocks = v23->_locateRecordCompletionBlocks;
    v23->_locateRecordCompletionBlocks = (NSMutableArray *)v25;
  }
  return v23;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sync/locate-record", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_performAfterLocatingRecord:(id)a3
{
  id v4 = a3;
  id v5 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:self->_serverZone parentOperation:self pendingChangesStream:0 contentRecordsFetchedInline:1 sessionContext:self->super._sessionContext];
  v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_recordID];
  recordID = self->_recordID;
  v8 = [(BRCServerZone *)self->_serverZone session];
  BOOL v9 = [(CKRecordID *)recordID brc_itemIDWithSession:v8];

  v10 = [(CKRecordID *)self->_recordID recordName];
  int v11 = [v10 hasPrefix:@"documentStructure/"];

  if (v11)
  {
    v12 = [v9 itemIDString];
    id v13 = [@"documentContent/" stringByAppendingString:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v15 = [(CKRecordID *)self->_recordID zoneID];
    v16 = (void *)[v14 initWithRecordName:v13 zoneID:v15];
    [v6 addObject:v16];

LABEL_5:
    goto LABEL_6;
  }
  v17 = [(CKRecordID *)self->_recordID recordName];
  int v18 = [v17 hasPrefix:@"documentContent/"];

  if (v18)
  {
    v19 = [v9 itemIDString];
    id v13 = [@"documentStructure/" stringByAppendingString:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v21 = [(CKRecordID *)self->_recordID zoneID];
    v22 = (CKRecordID *)[v20 initWithRecordName:v13 zoneID:v21];
    structureRecordID = self->_structureRecordID;
    self->_structureRecordID = v22;

    [v6 addObject:self->_structureRecordID];
    goto LABEL_5;
  }
LABEL_6:
  if (([v9 isDocumentsFolder] & 1) == 0 && objc_msgSend(v9, "isNonDesktopRoot"))
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v25 = [v9 itemIDString];
    v26 = [(CKRecordID *)self->_recordID zoneID];
    v27 = (void *)[v24 initWithRecordName:v25 zoneID:v26];
    [v6 addObject:v27];
  }
  objc_super v28 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v6];
  [v28 setShouldFetchAssetContent:0];
  v29 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:185];
  [v28 setDesiredKeys:v29];

  id v30 = [v5 callbackQueue];
  [v28 setCallbackQueue:v30];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke;
  v41[3] = &unk_1E69987D0;
  id v31 = v5;
  id v42 = v31;
  [v28 setPerRecordCompletionBlock:v41];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_7;
  v37 = &unk_1E6999F18;
  v38 = self;
  id v39 = v31;
  id v40 = v4;
  id v32 = v4;
  id v33 = v31;
  [v28 setFetchRecordsCompletionBlock:&v34];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v28, v34, v35, v36, v37, v38);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) addRecord:a2];
  }
  else
  {
    BOOL v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412802;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] record with id %@ encountered an error while locating - %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 528)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2;
  v13[3] = &unk_1E6995940;
  id v14 = v5;
  id v7 = *(void **)(a1 + 40);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = *(id *)(a1 + 48);
  id v17 = v6;
  id v18 = v10;
  id v11 = v6;
  id v12 = v5;
  [v7 notifyWhenRecordsAreFetchedAndFinish:v13];
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    os_activity_t v2 = [*(id *)(a1 + 40) records];
    uint64_t v3 = [v2 count];

    if (!v3)
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 560);
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = v29;
        __int16 v34 = 2112;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        v37 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to look up record %@ - %@%@", buf, 0x20u);
      }

      id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      goto LABEL_15;
    }
  }
  if (([*(id *)(a1 + 40) saveRecordsWithQueryCursor:0] & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_4();
    }

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Can't alloc ranks after fetching records");
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
    goto LABEL_11;
  }
  id v4 = [*(id *)(a1 + 40) error];

  if (!v4)
  {
    id v14 = (id *)(a1 + 56);
    id v13 = *(id *)(a1 + 56);
    if (v13) {
      goto LABEL_17;
    }
    if (![*(id *)(*(void *)(a1 + 48) + 536) isSharedZone])
    {
      id v13 = *v14;
      if (!*v14)
      {
        v26 = brc_bread_crumbs();
        v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_2((id *)(a1 + 48));
        }

        uint64_t v28 = *(void *)(a1 + 64);
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 7, @"Could not locate record");
        (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v9);
        goto LABEL_11;
      }
LABEL_17:
      uint64_t v9 = [v13 objectForKeyedSubscript:@"parent"];
      if (!v9)
      {
        if ([*(id *)(*(void *)(a1 + 48) + 536) isSharedZone])
        {
          id v15 = [*v14 share];

          if (v15)
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_23:

            *(void *)(*(void *)(a1 + 48) + 504) = [*(id *)(a1 + 40) recordsFetched];
            *(void *)(*(void *)(a1 + 48) + 512) = [*(id *)(a1 + 40) recordsFetchedTotalMetadataSize];
            *(void *)(*(void *)(a1 + 48) + 520) = [*(id *)(a1 + 40) xattrsFetchedTotalSize];
            return;
          }
        }
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v17 = *(void *)(a1 + 64);
      if (isKindOfClass)
      {
        id v18 = [v9 recordID];
        v19 = [*(id *)(*(void *)(a1 + 48) + 536) session];
        id v20 = objc_msgSend(v18, "brc_itemIDWithSession:", v19);
        (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v20, 0);

        goto LABEL_23;
      }
      v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_3((uint64_t *)v14, (uint64_t)v23, v24);
      }

      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: parent isn't a reference %@", *v14);
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v25);

LABEL_11:
      return;
    }
    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_1();
    }

    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_15:
    v12();
    return;
  }
  uint64_t v5 = *(void *)(a1 + 64);
  id v31 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
}

- (void)main
{
  uint64_t v6 = [*(id *)(a1 + 536) mangledID];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x20u);
}

void __32__BRCLocateRecordOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(v9 + 560);
      id v11 = [*(id *)(v9 + 536) mangledID];
      *(_DWORD *)buf = 138413058;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] Locating recordID %@ in zone %@ --> Record not found. Error %@%@", buf, 0x2Au);
    }
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = MEMORY[0x1E4F1CC28];
    id v14 = v6;
  }
  else
  {
    if (v5)
    {
      id v15 = [*(id *)(*(void *)(a1 + 32) + 536) session];
      uint64_t v16 = [v15 clientTruthWorkloop];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __32__BRCLocateRecordOperation_main__block_invoke_21;
      v21[3] = &unk_1E6993628;
      id v17 = v5;
      uint64_t v18 = *(void *)(a1 + 32);
      id v22 = v17;
      uint64_t v23 = v18;
      dispatch_async(v16, v21);

      goto LABEL_8;
    }
    v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __32__BRCLocateRecordOperation_main__block_invoke_cold_1();
    }

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    id v14 = 0;
  }
  [v12 completedWithResult:v13 error:v14];
LABEL_8:
}

void __32__BRCLocateRecordOperation_main__block_invoke_21(uint64_t a1)
{
  os_log_t v2 = -[BRCFetchParentChainOperation initWithParentID:sessionContext:zone:isUserWaiting:]([BRCFetchParentChainOperation alloc], "initWithParentID:sessionContext:zone:isUserWaiting:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 256), *(void *)(*(void *)(a1 + 40) + 536), [*(id *)(a1 + 40) nonDiscretionary]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__BRCLocateRecordOperation_main__block_invoke_2;
  v5[3] = &unk_1E69939E8;
  v5[4] = *(void *)(a1 + 40);
  [(BRCFetchParentChainOperation *)v2 addFetchParentChainCompletionBlock:v5];
  if (!v2)
  {
    os_log_type_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __32__BRCLocateRecordOperation_main__block_invoke_21_cold_1();
    }
  }
  [*(id *)(a1 + 40) addSubOperation:v2];
}

void __32__BRCLocateRecordOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 560);
      id v8 = [*(id *)(v6 + 536) mangledID];
      int v12 = 138413058;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] Locating recordID %@ in zone %@ --> Fetch parent chain failed with error %@%@", (uint8_t *)&v12, 0x2Au);
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    id v11 = v3;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    id v11 = 0;
  }
  [v9 completedWithResult:v10 error:v11];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRCLocateRecordOperation;
  [(_BRCOperation *)&v24 finishWithResult:v6 error:v7];
  if (!v7 && [(_BRCOperation *)self nonDiscretionary])
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCLocateRecordOperation finishWithResult:error:](self);
    }

    [(_BRCOperation *)self executionTimeInSec];
    id v10 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", @"BRCLocateRecordOperation", self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    id v11 = [(BRCServerZone *)self->_serverZone session];
    int v12 = [v11 analyticsReporter];
    [v12 postReportForDefaultSubCategoryWithCategory:11 telemetryTimeEvent:v10];
  }
  uint64_t v13 = self;
  objc_sync_enter(v13);
  v13->_exists = [v6 isEqual:MEMORY[0x1E4F1CC38]];
  __int16 v14 = v13->_locateRecordCompletionBlocks;
  locateRecordCompletionBlocks = v13->_locateRecordCompletionBlocks;
  v13->_locateRecordCompletionBlocks = 0;

  objc_sync_exit(v13);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  __int16 v16 = v14;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)addLocateRecordCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  locateRecordCompletionBlocks = v5->_locateRecordCompletionBlocks;
  if (locateRecordCompletionBlocks)
  {
    id v7 = (void *)MEMORY[0x1D94389C0](v4);
    [(NSMutableArray *)locateRecordCompletionBlocks addObject:v7];
  }
  else
  {
    id v8 = [(_BRCOperation *)v5 callbackQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__BRCLocateRecordOperation_addLocateRecordCompletionBlock___block_invoke;
    v9[3] = &unk_1E69952C0;
    v9[4] = v5;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
  objc_sync_exit(v5);
}

void __59__BRCLocateRecordOperation_addLocateRecordCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v1 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  uint64_t v4 = v1[544];
  id v5 = [v1 error];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(BRCLocateRecordOperation *)v5 dependencies];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          [v4 addDependency:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    id v10 = v5->_locateRecordCompletionBlocks;
    locateRecordCompletionBlocks = v5->_locateRecordCompletionBlocks;
    v5->_locateRecordCompletionBlocks = 0;

    objc_sync_exit(v5);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v12 = v10;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v4, "addLocateRecordCompletionBlock:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    [(_BRCOperation *)v5 cancel];
    if ([(_BRCOperation *)v5 isExecuting]) {
      [v4 addDependency:v5];
    }
  }
  else
  {
    [(_BRCOperation *)self cancel];
  }
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_locateRecordCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_structureRecordID, 0);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Located record in shared zone. No need to fetch the parent chain.%@", v1, 0xCu);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_2(id *a1)
{
  v1 = [*a1 recordID];
  uint64_t v2 = [v1 debugDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x16u);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_3(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: parent isn't a reference %@%@", (uint8_t *)&v4, 0x16u);
}

void __56__BRCLocateRecordOperation__performAfterLocatingRecord___block_invoke_2_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't alloc ranks after fetching records%@", v1, 0xCu);
}

void __32__BRCLocateRecordOperation_main__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Record located. No need to fetch the parent chain.%@", v1, 0xCu);
}

void __32__BRCLocateRecordOperation_main__block_invoke_21_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fetchParentChainOp%@", v1, 0xCu);
}

- (void)finishWithResult:(void *)a1 error:.cold.1(void *a1)
{
  [a1 executionTimeInSec];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x3Eu);
}

@end