@interface BRCFetchRecentAndFavoriteDocumentsOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFetchRecentAndFavoriteDocumentsOperation)initWithServerZone:(id)a3 sessionContext:(id)a4;
- (id)createActivity;
- (void)_performQueryOperationForBit:(unsigned int)a3 index:(id)a4 completion:(id)a5;
- (void)main;
@end

@implementation BRCFetchRecentAndFavoriteDocumentsOperation

- (BRCFetchRecentAndFavoriteDocumentsOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 mangledID];
  v10 = [v9 description];
  v11 = [@"fetch-recent-documents" stringByAppendingPathComponent:v10];

  v12 = [v7 metadataSyncContext];
  v16.receiver = self;
  v16.super_class = (Class)BRCFetchRecentAndFavoriteDocumentsOperation;
  v13 = [(_BRCOperation *)&v16 initWithName:v11 syncContext:v12 sessionContext:v8];

  if (v13)
  {
    [(_BRCOperation *)v13 setNonDiscretionary:1];
    v14 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchRecents");
    [(_BRCOperation *)v13 setGroup:v14];

    objc_storeStrong((id *)&v13->_serverZone, a3);
  }

  return v13;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sync/fetch-recents", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_performQueryOperationForBit:(unsigned int)a3 index:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, BRCFetchRecentAndFavoriteDocumentsOperation *, void))a5;
  if (([(BRCServerZone *)self->_serverZone state] & a3) != 0)
  {
    v9[2](v9, self, 0);
  }
  else
  {
    v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"indexName", v8];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"SearchIndexes" predicate:v28];
    id v11 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:self->_serverZone parentOperation:self pendingChangesStream:0 contentRecordsFetchedInline:0 sessionContext:self->super._sessionContext];
    v12 = self->_serverZone;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke;
    v42[3] = &unk_1E6999240;
    v13 = v12;
    v43 = v13;
    unsigned int v44 = a3;
    [v11 setQueryFinishedServerTruthCallback:v42];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2;
    v36[3] = &unk_1E69994F0;
    id v14 = v8;
    id v37 = v14;
    v38 = v13;
    unsigned int v41 = a3;
    id v15 = v11;
    id v39 = v15;
    id v40 = v9;
    v27 = v13;
    objc_super v16 = (void *)MEMORY[0x1D94389C0](v36);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v10];
    v18 = [(BRCServerZone *)self->_serverZone zoneID];
    [v17 setZoneID:v18];

    v19 = [(BRCServerZone *)self->_serverZone mangledID];
    v20 = +[BRCUserDefaults defaultsForMangledID:v19];
    unint64_t v21 = [v20 numberOfGreedyRecentlyUsedItems];

    if (v21 >= 0x96) {
      uint64_t v22 = 150;
    }
    else {
      uint64_t v22 = v21;
    }
    [v17 setResultsLimit:v22];
    [v17 setFetchAllResults:0];
    [v17 setShouldFetchAssetContent:0];
    v23 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:185];
    [v17 setDesiredKeys:v23];

    v24 = [v15 callbackQueue];
    [v17 setCallbackQueue:v24];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_3;
    v34[3] = &unk_1E6998220;
    id v25 = v15;
    id v35 = v25;
    [v17 setRecordFetchedBlock:v34];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_4;
    v29[3] = &unk_1E6999540;
    id v30 = v25;
    v9 = v16;
    id v33 = v9;
    v31 = self;
    id v32 = v14;
    id v26 = v25;
    [v17 setQueryCompletionBlock:v29];
    [(_BRCOperation *)self addSubOperation:v17];
  }
}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStateBits:*(unsigned int *)(a1 + 40)];
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isRetriable") & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We seem to be unable to fetch %@. Setting the bit anyway to allow the sync engine to progress (error %@)%@", buf, 0x20u);
    }

    id v11 = [*(id *)(a1 + 40) db];
    v12 = [v11 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_14;
    block[3] = &unk_1E69994C8;
    id v14 = *(id *)(a1 + 40);
    int v18 = *(_DWORD *)(a1 + 64);
    id v15 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v16 = v5;
    dispatch_async(v12, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) setStateBits:*(unsigned int *)(a1 + 64)];
  os_activity_t v2 = [*(id *)(a1 + 40) callbackQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2_15;
  v3[3] = &unk_1E69952C0;
  id v5 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_2_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRecord:a2];
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 cancel];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5;
    v9[3] = &unk_1E6999518;
    id v10 = v5;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v13 = v6;
    uint64_t v11 = v7;
    id v12 = v8;
    [v10 notifyWhenRecordsAreFetchedAndFinish:v9];
  }
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5(uint64_t a1)
{
  os_activity_t v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v14);
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) saveRecordsWithQueryCursor:0];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v5)
    {
      id v8 = *(void (**)(uint64_t, uint64_t, void))(v6 + 16);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      v8(v9, v10, 0);
    }
    else
    {
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5_cold_1(a1, (uint64_t)v11, v12);
      }

      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Couldn't allocate ranks when fetching query %@", *(void *)(a1 + 48));
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v13);
    }
  }
}

- (void)main
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke;
  v2[3] = &unk_1E6999568;
  v2[4] = self;
  [(BRCFetchRecentAndFavoriteDocumentsOperation *)self _performQueryOperationForBit:8 index:@"recent_documents" completion:v2];
}

uint64_t __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a3)
  {
    return [v3 completedWithResult:0 error:a3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke_2;
    v5[3] = &unk_1E6999568;
    v5[4] = v3;
    return [v3 _performQueryOperationForBit:16 index:@"favorite_documents" completion:v5];
  }
}

uint64_t __51__BRCFetchRecentAndFavoriteDocumentsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a3];
}

- (void).cxx_destruct
{
}

void __93__BRCFetchRecentAndFavoriteDocumentsOperation__performQueryOperationForBit_index_completion___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't allocate ranks when fetching query %@%@", (uint8_t *)&v4, 0x16u);
}

@end