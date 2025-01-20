@interface BRCSharingProcessFolderSubitemsOperation
- (BOOL)_completeAfterProcessingClientTruthIfNecessaryWithError:(id)a3;
- (BOOL)_completeAfterProcessingServerTruthIfNecessaryWithError:(id)a3;
- (BOOL)deleteShareInfoFromZone:(id)a3 zoneRowID:(id)a4 itemID:(id)a5 sharingOptions:(unint64_t)a6 itemsTable:(id)a7;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSharingProcessFolderSubitemsOperation)initWithItem:(id)a3 sessionContext:(id)a4 processType:(unint64_t)a5 maxSubitemsToFail:(unint64_t)a6;
- (id)computeURLForItemID:(id)a3 rootURL:(id)a4;
- (id)createActivity;
- (void)_stopObservingListOperation;
- (void)dealloc;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)main;
- (void)processClientTruthWithCompletion:(id)a3;
- (void)processServerItemsUnderItemID:(id)a3 completion:(id)a4;
- (void)processServerTruthWithCompletion:(id)a3;
- (void)removeSharedSubitemsWithCompletion:(id)a3;
@end

@implementation BRCSharingProcessFolderSubitemsOperation

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (BRCSharingProcessFolderSubitemsOperation)initWithItem:(id)a3 sessionContext:(id)a4 processType:(unint64_t)a5 maxSubitemsToFail:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [v10 itemID];
  v13 = [v12 debugItemIDString];
  v14 = [@"sharing/clean-subitems" stringByAppendingPathComponent:v13];

  v15 = [v10 serverZone];
  v16 = [v15 metadataSyncContext];
  v49.receiver = self;
  v49.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  v17 = [(_BRCOperation *)&v49 initWithName:v14 syncContext:v16 sessionContext:v11];

  if (v17)
  {
    v18 = [v10 itemID];
    if ([v18 isDocumentsFolder])
    {
LABEL_3:

LABEL_5:
      v17->_isFSRoot = 1;
LABEL_6:
      v17->_alreadyHasShareID = ([v10 sharingOptions] & 4) != 0;
      v17->_rowID = [v10 dbRowID];
      v20 = [v10 clientZone];
      uint64_t v21 = [v20 asPrivateClientZone];
      rootClientZone = v17->_rootClientZone;
      v17->_rootClientZone = (BRCPrivateClientZone *)v21;

      uint64_t v23 = [v10 itemID];
      rootItemID = v17->_rootItemID;
      v17->_rootItemID = (BRCItemID *)v23;

      v25 = [v10 appLibrary];
      uint64_t v26 = [v25 dbRowID];
      appLibraryRowID = v17->_appLibraryRowID;
      v17->_appLibraryRowID = (BRCALRowID *)v26;

      uint64_t v28 = objc_opt_new();
      shareIDsToDelete = v17->_shareIDsToDelete;
      v17->_shareIDsToDelete = (NSMutableArray *)v28;

      uint64_t v30 = objc_opt_new();
      sharedClientSubitems = v17->_sharedClientSubitems;
      v17->_sharedClientSubitems = (NSMutableArray *)v30;

      uint64_t v32 = objc_opt_new();
      sharedServerSubitems = v17->_sharedServerSubitems;
      v17->_sharedServerSubitems = (NSMutableArray *)v32;

      uint64_t v34 = objc_opt_new();
      aliasItemsToDelete = v17->_aliasItemsToDelete;
      v17->_aliasItemsToDelete = (NSMutableArray *)v34;

      uint64_t v36 = objc_opt_new();
      activeListOperations = v17->_activeListOperations;
      v17->_activeListOperations = (NSMutableArray *)v36;

      v38 = +[BRCUserDefaults defaultsForMangledID:0];
      v17->_batchSize = [v38 deleteShareIDBatchCount];

      v17->_failedSubitemsLeft = a6;
      v17->_processType = a5;
      v39 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
      [(_BRCOperation *)v17 setGroup:v39];

      goto LABEL_7;
    }
    char v19 = [v10 isFSRoot];

    if (v19) {
      goto LABEL_5;
    }
    v18 = [v10 st];
    v41 = [v18 parentID];
    if ([v41 isNonDesktopRoot])
    {
      v42 = [v10 clientZone];
      if ([v42 isCloudDocsZone])
      {
        v43 = [v10 st];
        v44 = [v43 filename];
        if (([v44 isEqualToString:*MEMORY[0x1E4F59430]] & 1) == 0)
        {
          v46 = [v10 st];
          [v46 filename];
          v45 = v47 = v43;
          char v48 = [v45 isEqualToString:*MEMORY[0x1E4F59440]];

          if ((v48 & 1) == 0) {
            goto LABEL_6;
          }
          goto LABEL_5;
        }

        goto LABEL_3;
      }
    }
    goto LABEL_6;
  }
LABEL_7:

  return v17;
}

- (void)_stopObservingListOperation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = v2->_activeListOperations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "endObservingChangesWithDelegate:", v2, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)v2->_activeListOperations removeAllObjects];
  objc_sync_exit(v2);
}

- (void)dealloc
{
  [(BRCSharingProcessFolderSubitemsOperation *)self _stopObservingListOperation];
  v3.receiver = self;
  v3.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  [(_BRCOperation *)&v3 dealloc];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCSharingProcessFolderSubitemsOperation;
  [(_BRCFrameworkOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCSharingProcessFolderSubitemsOperation *)self _stopObservingListOperation];
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  long long v7 = self;
  objc_sync_enter(v7);
  [(NSMutableArray *)v7->_activeListOperations removeObject:v8];
  [(NSMutableArray *)v7->_activeListOperations addObject:v6];
  objc_sync_exit(v7);
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/clean-subitems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)removeSharedSubitemsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingProcessFolderSubitemsOperation removeSharedSubitemsWithCompletion:]();
  }

  long long v7 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v8 = [v7 clientTruthWorkloop];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke;
  v10[3] = &unk_1E6994600;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = objc_opt_new();
  v38 = objc_opt_new();
  uint64_t v36 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 528))
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = objc_msgSend(*(id *)(v3 + 576), "count", v36);
      uint64_t v3 = *(void *)(a1 + 32);
      if (v5 >= v6) {
        break;
      }
      long long v7 = [*(id *)(v3 + 576) objectAtIndexedSubscript:v5];
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [v7 shareID];
        *(_DWORD *)buf = 138412546;
        v50 = v12;
        __int16 v51 = 2112;
        v52 = v8;
        _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing shareID %@%@", buf, 0x16u);
      }
      long long v10 = [v7 shareID];
      [v2 addObject:v10];

      id v11 = [v7 emptyRecord];
      [v38 addObject:v11];

      [v36 addObject:v7];
      uint64_t v3 = *(void *)(a1 + 32);
      v4 += 2;
      ++v5;
    }
    while (v4 < *(void *)(v3 + 528));
  }
  else
  {
    unint64_t v5 = 0;
  }
  objc_msgSend(*(id *)(v3 + 576), "removeObjectsInRange:", 0, v5, v36);
  unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 568) count];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 528);
  uint64_t v16 = [*(id *)(v14 + 568) count];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v13 >= v15 - v16)
  {
    uint64_t v20 = *(void *)(v17 + 528);
    uint64_t v21 = v20 - [*(id *)(v17 + 576) count];
    v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "subarrayWithRange:", 0, v21);
    uint64_t v19 = a1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "removeObjectsInRange:", 0, v21);
  }
  else
  {
    v18 = (void *)[*(id *)(v17 + 568) copy];
    uint64_t v19 = a1;
    [*(id *)(*(void *)(a1 + 32) + 568) removeAllObjects];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v18;
  uint64_t v22 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v44 + 1) + 8 * v25);
        v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v26;
          __int16 v51 = 2112;
          v52 = v27;
          _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing alias record %@%@", buf, 0x16u);
        }

        v29 = [*(id *)(*(void *)(v19 + 32) + 592) serverZone];
        uint64_t v30 = [v26 structureRecordIDForItemType:3 zone:v29 aliasTargetZoneIsShared:1];

        [v2 addObject:v30];
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v23);
  }

  if ([v2 count] || objc_msgSend(v38, "count"))
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1A198]);
    if ([v38 count]) {
      uint64_t v32 = v38;
    }
    else {
      uint64_t v32 = 0;
    }
    if ([v2 count]) {
      v33 = v2;
    }
    else {
      v33 = 0;
    }
    uint64_t v34 = (void *)[v31 initWithRecordsToSave:v32 recordIDsToDelete:v33];
    [v34 setAtomic:1];
    [v34 setSavePolicy:0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_381;
    v40[3] = &unk_1E699A148;
    v40[4] = *(void *)(v19 + 32);
    v35 = v37;
    id v41 = v37;
    id v42 = obj;
    id v43 = *(id *)(v19 + 40);
    [v34 setModifyRecordsCompletionBlock:v40];
    [*(id *)(v19 + 32) addSubOperation:v34];
  }
  else
  {
    [*(id *)(*(void *)(v19 + 32) + 592) scheduleSyncDown];
    (*(void (**)(void))(*(void *)(v19 + 40) + 16))();
    v35 = v37;
  }
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_381(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_381_cold_1();
  }

  if (objc_msgSend(v7, "brc_containsCloudKitErrorCode:", 27))
  {
    long long v10 = +[BRCUserDefaults defaultsForMangledID:0];
    [v10 modifyRecordsCountMultiplicativeDecrease];
    float v12 = v11;

    *(void *)(*(void *)(a1 + 32) + 528) = (float)(v12
                                                                    * (float)*(unint64_t *)(*(void *)(a1 + 32)
                                                                                                 + 528));
    [*(id *)(*(void *)(a1 + 32) + 576) addObjectsFromArray:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 568) addObjectsFromArray:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) removeSharedSubitemsWithCompletion:*(void *)(a1 + 56)];
  }
  else
  {
    unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 248) session];
    uint64_t v14 = [v13 clientTruthWorkloop];
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_382;
      block[3] = &unk_1E69952C0;
      id v21 = *(id *)(a1 + 56);
      id v20 = v7;
      dispatch_async(v14, block);

      uint64_t v15 = v21;
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_2;
      v16[3] = &unk_1E69946C8;
      v16[4] = *(void *)(a1 + 32);
      id v17 = v6;
      id v18 = *(id *)(a1 + 56);
      dispatch_async(v14, v16);

      uint64_t v15 = v17;
    }
  }
}

uint64_t __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_382(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_2(uint64_t *a1)
{
  os_activity_t v2 = [*(id *)(a1[4] + 248) session];
  uint64_t v3 = [v2 clientDB];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_3;
  id v8 = &unk_1E6995AD0;
  unint64_t v4 = (void *)a1[5];
  uint64_t v9 = a1[4];
  id v10 = v4;
  [v3 groupInBatch:&v5];

  objc_msgSend((id)a1[4], "removeSharedSubitemsWithCompletion:", a1[6], v5, v6, v7, v8, v9);
}

uint64_t __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 592) learnCKInfosFromSavedRecords:*(void *)(a1 + 40) isOutOfBandModifyRecords:1];
}

- (BOOL)_completeAfterProcessingClientTruthIfNecessaryWithError:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = [(BRCClientZone *)self->_rootClientZone dbRowID];
    if (v5)
    {
      if (![(NSMutableArray *)self->_sharedClientSubitems count])
      {
        BOOL v4 = 0;
        goto LABEL_9;
      }
      uint64_t v6 = objc_opt_new();
      id v7 = objc_opt_new();
      id v8 = [(BRCSyncContext *)self->super.super._syncContext session];
      uint64_t v9 = [v8 expensiveReadOnlyDB];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke;
      v24[3] = &unk_1E699A170;
      id v25 = v5;
      id v10 = v6;
      id v26 = v10;
      id v11 = v7;
      id v27 = v11;
      float v12 = (void *)MEMORY[0x1D94389C0](v24);
      unint64_t v13 = [v9 serialQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke_2;
      v19[3] = &unk_1E6998730;
      v19[4] = self;
      id v20 = v9;
      id v22 = v11;
      id v23 = v12;
      id v21 = v10;
      id v14 = v11;
      id v15 = v10;
      id v16 = v12;
      id v17 = v9;
      dispatch_async(v13, v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"zoneRowID", 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      [(_BRCOperation *)self completedWithResult:0 error:v17];
    }

    BOOL v4 = 1;
LABEL_9:

    return v4;
  }
  [(_BRCOperation *)self completedWithResult:0 error:a3];
  return 1;
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = [v5 clientZone];
    id v7 = [v6 dbRowID];
    int v8 = objc_msgSend(v7, "br_isEqualToNumber:", *(void *)(a1 + 32));

    uint64_t v9 = 48;
    if (v8) {
      uint64_t v9 = 40;
    }
    [*(id *)(a1 + v9) addObject:v10];
  }
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingClientTruthIfNecessaryWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 552);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "session", (void)v16);
        uint64_t v9 = [v8 itemByItemGlobalID:v7 db:*(void *)(a1 + 40)];

        if (v9)
        {
          id v10 = [[BRCItemToPathLookup alloc] initWithItem:v9];
          id v11 = [(BRCItemToPathLookup *)v10 coordinatedReadURL];
          float v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v13 = [(BRCItemToPathLookup *)v10 coordinatedWriteURL];
          }
          id v14 = v13;

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:sharedToMeURLs:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  [*(id *)(a1 + 32) completedWithResult:0 error:v15];
}

- (id)computeURLForItemID:(id)a3 rootURL:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  uint64_t v32 = [(BRCSyncContext *)self->super.super._syncContext session];
  uint64_t v7 = [v32 serverDB];
  [v7 assertOnQueue];
  int v8 = [(BRCClientZone *)self->_rootClientZone dbRowID];
  uint64_t v9 = [(BRCClientZone *)self->_rootClientZone dbRowID];
  v33 = v6;
  id v10 = (void *)[v7 fetch:@"WITH RECURSIVE item_parents (item_filename, item_parent_id) AS(    SELECT item_filename, item_parent_id FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT si.item_filename, si.item_parent_id FROM server_items AS si INNER JOIN item_parents AS p      WHERE si.item_id = p.item_parent_id        AND si.zone_rowid = %@) SELECT item_filename FROM item_parents", v8, v6, v9];

  id v11 = objc_opt_new();
  if (![v10 next])
  {
LABEL_21:
    id v13 = [v11 componentsJoinedByString:@"/"];
    id v27 = v31;
    uint64_t v28 = [v31 URLByAppendingPathComponent:v13];
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v12 = [v10 stringAtIndex:0];
    if (!v12) {
      break;
    }
    id v13 = (void *)v12;
    [v11 insertObject:v12 atIndex:0];
LABEL_20:

    if (([v10 next] & 1) == 0) {
      goto LABEL_21;
    }
  }
  if ([v11 count])
  {
    id v13 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingProcessFolderSubitemsOperation computeURLForItemID:rootURL:]();
    }
    goto LABEL_29;
  }
  id v14 = (void *)[v7 stringWithSQL:@"SELECT item_alias_target FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v33, self->_rootClientZone];
  if (!v14)
  {
    id v13 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingProcessFolderSubitemsOperation computeURLForItemID:rootURL:]();
    }
LABEL_29:
    id v27 = v31;

    uint64_t v28 = 0;
    goto LABEL_22;
  }
  id v15 = v14;
  id v35 = 0;
  id v36 = 0;
  id v34 = 0;
  char v16 = [v14 parseUnsaltedBookmarkDataWithItemID:&v36 mangledID:&v35 error:&v34];
  long long v17 = v34;
  if ((v16 & 1) == 0)
  {
    long long v19 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v15;
      __int16 v39 = 2112;
      v40 = v17;
      __int16 v41 = 2112;
      id v42 = v19;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't parse unsalted bookmark data %@ - %@%@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  long long v18 = [v32 serverZoneByMangledID:v35];
  long long v19 = v18;
  if (v18)
  {
    id v20 = v36;
    uint64_t v21 = [v18 dbRowID];
    id v13 = (void *)[v7 stringWithSQL:@"SELECT item_filename FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v20, v21];

    if (v13)
    {
      [v11 insertObject:v13 atIndex:0];
      char v22 = 1;
      goto LABEL_19;
    }
    id v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412546;
    id v38 = v36;
    __int16 v39 = 2112;
    v40 = v23;
    id v25 = v24;
    id v26 = "[WARNING] No filename found on alias target %@%@";
    goto LABEL_16;
  }
  id v23 = brc_bread_crumbs();
  uint64_t v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v35;
    __int16 v39 = 2112;
    v40 = v23;
    id v25 = v24;
    id v26 = "[WARNING] Couldn't find server zone for %@%@";
LABEL_16:
    _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
  }
LABEL_17:

LABEL_18:
  char v22 = 0;
  id v13 = 0;
LABEL_19:

  if (v22) {
    goto LABEL_20;
  }
  uint64_t v28 = 0;
  id v27 = v31;
LABEL_22:

  return v28;
}

- (BOOL)_completeAfterProcessingServerTruthIfNecessaryWithError:(id)a3
{
  if (a3)
  {
    [(_BRCOperation *)self completedWithResult:0 error:a3];
  }
  else
  {
    if (![(NSMutableArray *)self->_sharedServerSubitems count])
    {
      if (self->_processType == 2)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
      uint64_t v7 = [(NSMutableArray *)self->_aliasItemsToDelete count];
      if (!v7) {
        return v7;
      }
    }
    uint64_t v4 = [(BRCSyncContext *)self->super.super._syncContext session];
    uint64_t v5 = [v4 serverTruthWorkloop];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke;
    v9[3] = &unk_1E6993628;
    v9[4] = self;
    id v10 = v4;
    id v6 = v4;
    dispatch_async(v5, v9);
  }
  LOBYTE(v7) = 1;
  return v7;
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke(uint64_t a1)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__44;
  v10[4] = __Block_byref_object_dispose__44;
  id v11 = (id)objc_opt_new();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__44;
  v8[4] = __Block_byref_object_dispose__44;
  id v9 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke_399;
  v7[3] = &unk_1E699A198;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = v10;
  v7[6] = v8;
  id v2 = (void (**)(void, void))MEMORY[0x1D94389C0](v7);
  uint64_t v3 = [*(id *)(a1 + 40) appLibraryByRowID:*(void *)(*(void *)(a1 + 32) + 608)];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = [v3 absolutePath];
  id v6 = [v4 fileURLWithPath:v5];

  ((void (**)(void, void *))v2)[2](v2, v6);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
}

void __100__BRCSharingProcessFolderSubitemsOperation__completeAfterProcessingServerTruthIfNecessaryWithError___block_invoke_399(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 560);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v10 = [*(id *)(a1 + 32) computeURLForItemID:*(void *)(*((void *)&v23 + 1) + 8 * v8) rootURL:v3];
        [v9 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 32) + 568);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        long long v17 = objc_msgSend(*(id *)(a1 + 32), "computeURLForItemID:rootURL:", *(void *)(*((void *)&v19 + 1) + 8 * v15), v3, (void)v19);
        [v16 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  long long v18 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:sharedToMeURLs:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  [*(id *)(a1 + 32) completedWithResult:0 error:v18];
}

- (void)processServerItemsUnderItemID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingProcessFolderSubitemsOperation processServerItemsUnderItemID:completion:]();
  }

  id v10 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v11 = [v10 clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke;
  block[3] = &unk_1E69946C8;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);
}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  v40 = [v3 clientDB];

  id v4 = [*(id *)(*(void *)v2 + 592) dbRowID];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(*(void *)v2 + 592) dbRowID];
  id v7 = (void *)[v40 fetch:@"WITH RECURSIVE item_children_needing_fetching (item_id, item_type, item_sharing_options, shared_alias_count, shared_children_count) AS(    SELECT item_id, item_type, item_sharing_options, shared_alias_count, shared_children_count FROM server_items      WHERE zone_rowid = %@ AND item_id = %@ AND (IFNULL(shared_children_count + shared_alias_count, 1) > 0)  UNION ALL     SELECT ip.item_id, ip.item_type, ip.item_sharing_options, ip.shared_alias_count, ip.shared_children_count FROM server_items AS ip INNER JOIN item_children_needing_fetching AS p       WHERE ip.item_parent_id = p.item_id        AND ip.zone_rowid = %@        AND ip.item_type IN (0, 9, 10, 1, 2, 8, 3)        AND ((IFNULL(ip.shared_children_count + ip.shared_alias_count, 1) > 0)            OR (ip.item_sharing_options & 4)            OR ip.item_type = 3)) SELECT item_id, item_type, item_sharing_options FROM item_children_needing_fetching WHERE item_type = 3 OR (item_sharing_options & 4)       OR (item_type IN (9, 10) AND (IFNULL(shared_children_count + shared_alias_count, 1) > 0))", v4, v5, v6];

  group = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__44;
  v55[4] = __Block_byref_object_dispose__44;
  id v56 = 0;
  while ([v7 next])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9438760]();
    id v9 = [v7 objectOfClass:objc_opt_class() atIndex:0];
    unsigned __int8 v10 = [v7 intAtIndex:1];
    int v11 = [v7 intAtIndex:2];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_2;
    v50[3] = &unk_1E6996D48;
    id v12 = group;
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v51 = v12;
    uint64_t v52 = v13;
    id v14 = v9;
    id v53 = v14;
    v54 = v55;
    id v15 = (void (**)(void))MEMORY[0x1D94389C0](v50);
    uint64_t v16 = v11;
    if ((v11 & 4) != 0)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      if ((v11 & 0x48) != 0 && *(void *)(v24 + 544) != 2)
      {
        id v34 = brc_bread_crumbs();
        id v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          id v58 = v14;
          __int16 v59 = 2112;
          v60 = v36;
          __int16 v61 = 2112;
          v62 = v34;
          _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEFAULT, "[WARNING] subitem %@ is already shared inside %@%@", buf, 0x20u);
        }

        [*(id *)(*(void *)(a1 + 32) + 560) addObject:v14];
        goto LABEL_31;
      }
      long long v25 = [*(id *)(v24 + 592) serverZone];
      long long v26 = [*(id *)(*(void *)(a1 + 32) + 592) serverZone];
      id v27 = [v26 dbRowID];
      char v28 = [(id)v24 deleteShareInfoFromZone:v25 zoneRowID:v27 itemID:v14 sharingOptions:v16 itemsTable:@"server_items"];

      if (v28) {
        goto LABEL_31;
      }
    }
    else
    {
      if (v10 == 3)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        if (*(void *)(v17 + 544) != 2)
        {
          long long v18 = [*(id *)(v17 + 592) serverItemByItemID:v14];
          long long v19 = [v18 aliasTargetItemID];
          long long v20 = [v18 aliasTargetClientZone];
          BOOL v21 = [v20 serverRankByItemID:v19] == 0;

          if (!v21) {
            goto LABEL_31;
          }
          uint64_t v17 = *(void *)(a1 + 32);
        }
        if (([*(id *)(v17 + 568) containsObject:v14] & 1) == 0)
        {
          long long v22 = brc_bread_crumbs();
          long long v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            id v38 = *(void **)(*(void *)(a1 + 32) + 600);
            *(_DWORD *)buf = 138412802;
            id v58 = v14;
            __int16 v59 = 2112;
            v60 = v38;
            __int16 v61 = 2112;
            v62 = v22;
            _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found shared-to-me alias to delete %@ in %@%@", buf, 0x20u);
          }

          [*(id *)(*(void *)(a1 + 32) + 568) addObject:v14];
        }
        goto LABEL_31;
      }
      if (v10 - 9 > 1)
      {
        uint64_t v32 = brc_bread_crumbs();
        v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v58 = v14;
          __int16 v59 = 2112;
          v60 = v32;
          _os_log_fault_impl(&dword_1D353B000, v37, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Huh?  We shouldn't be processing this item if it's not shared and not a directory fault %@%@", buf, 0x16u);
        }

LABEL_30:
LABEL_31:
        char v29 = 1;
        goto LABEL_32;
      }
      uint64_t v30 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v58 = v14;
        __int16 v59 = 2112;
        v60 = v30;
        _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to fetch %@ before we can continue%@", buf, 0x16u);
      }

      uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 592) fetchDirectoryContentsIfNecessary:v14 isUserWaiting:1 rescheduleApplyScheduler:0];
      if (!v32)
      {
        v15[2](v15);
        goto LABEL_30;
      }
      id v33 = *(id *)(a1 + 32);
      objc_sync_enter(v33);
      if (([*(id *)(*(void *)(a1 + 32) + 584) containsObject:v32] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 584) addObject:v32];
        objc_sync_exit(v33);

        dispatch_group_enter(v12);
        objc_initWeak((id *)buf, v32);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_409;
        v45[3] = &unk_1E699A1C0;
        v45[4] = *(void *)(a1 + 32);
        objc_copyWeak(&v49, (id *)buf);
        char v48 = v55;
        long long v47 = v15;
        long long v46 = v12;
        [v32 addDirectoryListCompletionBlock:v45];
        [v32 beginObservingChangesWithDelegate:*(void *)(a1 + 32)];

        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
        goto LABEL_30;
      }
      objc_sync_exit(v33);
    }
    char v29 = 0;
LABEL_32:

    if ((v29 & 1) == 0) {
      goto LABEL_35;
    }
  }
  __int16 v39 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_411;
  block[3] = &unk_1E699A1E8;
  void block[4] = *(void *)(a1 + 32);
  id v43 = *(id *)(a1 + 48);
  long long v44 = v55;
  dispatch_group_notify(group, v39, block);

LABEL_35:
  _Block_object_dispose(v55, 8);
}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_3;
  v5[3] = &unk_1E6994360;
  uint64_t v4 = *(void *)(a1 + 56);
  v5[4] = v2;
  uint64_t v7 = v4;
  id v6 = *(id *)(a1 + 32);
  [v2 processServerItemsUnderItemID:v3 completion:v5];
}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    if (!v7) {
      objc_storeStrong(v6, a2);
    }
    objc_sync_exit(v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_409(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 584);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [v5 removeObject:WeakRetained];

  objc_sync_exit(v4);
  if (v11)
  {
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void *)(v8 + 40);
    id v9 = (id *)(v8 + 40);
    if (!v10) {
      objc_storeStrong(v9, a2);
    }
    objc_sync_exit(v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__BRCSharingProcessFolderSubitemsOperation_processServerItemsUnderItemID_completion___block_invoke_411(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_sync_exit(obj);
}

- (void)processServerTruthWithCompletion:(id)a3
{
}

- (BOOL)deleteShareInfoFromZone:(id)a3 zoneRowID:(id)a4 itemID:(id)a5 sharingOptions:(unint64_t)a6 itemsTable:(id)a7
{
  char v8 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  syncContext = self->super.super._syncContext;
  id v15 = a7;
  id v16 = a4;
  uint64_t v17 = [(BRCSyncContext *)syncContext session];
  long long v18 = [v17 clientDB];

  id v19 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  long long v20 = [v12 zoneID];
  BOOL v21 = (void *)[v19 initShareIDWithItemID:v13 zoneID:v20];

  long long v22 = [MEMORY[0x1E4FBA900] nameWithString:v15];

  long long v23 = (void *)[v18 fetch:@"SELECT item_type, item_stat_ckinfo, version_ckinfo from %@ WHERE item_id = %@ AND zone_rowid = %@", v22, v13, v16];
  if (![v23 next])
  {
    char v28 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingProcessFolderSubitemsOperation deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:]();
    }
    goto LABEL_7;
  }
  unsigned __int8 v24 = [v23 intAtIndex:0];
  char v25 = v24;
  if (v24 > 0xAu)
  {
LABEL_15:
    char v28 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingProcessFolderSubitemsOperation deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:](v25, (uint64_t)v28, v30);
    }
LABEL_7:
    BOOL v31 = 0;
    goto LABEL_14;
  }
  char v40 = v8;
  __int16 v41 = v18;
  if (((1 << v24) & 0x611) == 0)
  {
    if (((1 << v24) & 0x106) != 0)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F1A2D8]);
      id v27 = [v12 zoneID];
      id v33 = [v13 contentsRecordIDInZoneID:v27];
      char v28 = (void *)[v32 initWithRecordType:@"content" recordID:v33];

      uint64_t v29 = 2;
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  id v26 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v27 = [v13 directoryStructureRecordIDInZone:v12];
  char v28 = (void *)[v26 initWithRecordType:@"structure" recordID:v27];
  uint64_t v29 = 1;
LABEL_10:

  uint64_t v30 = [v23 objectOfClass:objc_opt_class() atIndex:v29];
  [v28 serializeSystemFields:v30];
  id v34 = v21;
  id v35 = [[BRCShareDeleteInfo alloc] initWithShareID:v21 emptyRecord:v28];
  id v36 = brc_bread_crumbs();
  v37 = brc_default_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    __int16 v39 = "full";
    *(_DWORD *)buf = 136315650;
    if ((v40 & 0x48) == 0) {
      __int16 v39 = "empty";
    }
    id v43 = v39;
    __int16 v44 = 2112;
    long long v45 = v34;
    __int16 v46 = 2112;
    long long v47 = v36;
    _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] deleting %s shareID %@%@", buf, 0x20u);
  }

  if (([(NSMutableArray *)self->_shareIDsToDelete containsObject:v35] & 1) == 0) {
    [(NSMutableArray *)self->_shareIDsToDelete addObject:v35];
  }

  BOOL v31 = 1;
  BOOL v21 = v34;
  long long v18 = v41;
LABEL_14:

  return v31;
}

- (void)processClientTruthWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v6 = [v5 clientDB];
  id v7 = brc_bread_crumbs();
  char v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingProcessFolderSubitemsOperation processClientTruthWithCompletion:]();
  }

  id v9 = [v5 clientTruthWorkloop];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke;
  v13[3] = &unk_1E6993D18;
  v13[4] = self;
  id v14 = v6;
  id v15 = v5;
  id v16 = v4;
  id v10 = v4;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  uint64_t v3 = [v2 itemByRowID:*(void *)(*(void *)(a1 + 32) + 520) db:*(void *)(a1 + 40)];
  id v4 = [v3 asDirectory];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2;
  v10[3] = &unk_1E699A210;
  v10[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v5 enumerateItemsWithShareIDUnderParent:v6 block:v10];
  if (*((unsigned char *)v14 + 24))
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 592);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_425;
    v8[3] = &unk_1E6995800;
    id v9 = *(id *)(a1 + 56);
    [v7 waitForCrossZoneMoveProcessingWithCompletion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v13, 8);
}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ((a3 & 4) == 0)
  {
    long long v23 = brc_bread_crumbs();
    unsigned __int8 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2_cold_1();
    }
  }
  if ((a3 & 0x48) != 0 && *(void *)(a1[4] + 544) != 2)
  {
    long long v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = a1[5];
      int v25 = 138412802;
      id v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] subitem %@ is already shared inside %@%@", (uint8_t *)&v25, 0x20u);
    }

    [*(id *)(a1[4] + 552) addObject:v7];
    uint64_t v21 = a1[4];
    unint64_t v22 = *(void *)(v21 + 536);
    *(void *)(v21 + 536) = v22 - 1;
    if (v22 <= 1) {
      *a4 = 1;
    }
  }
  else
  {
    char v8 = [v7 zoneRowID];
    id v9 = [*(id *)(a1[4] + 592) dbRowID];
    int v10 = objc_msgSend(v8, "br_isEqualToNumber:", v9);

    id v11 = (void *)a1[4];
    id v12 = (void *)v11[74];
    if (v10)
    {
      uint64_t v13 = [v12 serverZone];
      id v14 = [v7 zoneRowID];
      uint64_t v15 = [v7 itemID];
      [v11 deleteShareInfoFromZone:v13 zoneRowID:v14 itemID:v15 sharingOptions:a3 itemsTable:@"client_items"];
    }
    else
    {
      char v16 = [v12 session];
      uint64_t v17 = [v16 itemByItemGlobalID:v7];

      [*(id *)(a1[4] + 592) itemMovedIntoShareInThisZone:v17 associatedItemID:0];
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
  }
}

uint64_t __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_425(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)main
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not processing child items on %@ because it already has a shareID%@");
}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _completeAfterProcessingClientTruthIfNecessaryWithError:a2];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_2;
    v5[3] = &unk_1E69939E8;
    v5[4] = v4;
    return [v4 processServerTruthWithCompletion:v5];
  }
  return result;
}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _completeAfterProcessingServerTruthIfNecessaryWithError:a2];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_3;
    v5[3] = &unk_1E69939E8;
    v5[4] = v4;
    return [v4 removeSharedSubitemsWithCompletion:v5];
  }
  return result;
}

void __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 592);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_4;
  v7[3] = &unk_1E6993628;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 waitForCrossZoneMoveProcessingWithCompletion:v7];
}

uint64_t __48__BRCSharingProcessFolderSubitemsOperation_main__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibraryRowID, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_rootClientZone, 0);
  objc_storeStrong((id *)&self->_activeListOperations, 0);
  objc_storeStrong((id *)&self->_shareIDsToDelete, 0);
  objc_storeStrong((id *)&self->_aliasItemsToDelete, 0);
  objc_storeStrong((id *)&self->_sharedServerSubitems, 0);
  objc_storeStrong((id *)&self->_sharedClientSubitems, 0);
}

- (void)removeSharedSubitemsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Removing shared subitems in op %@%@");
}

void __79__BRCSharingProcessFolderSubitemsOperation_removeSharedSubitemsWithCompletion___block_invoke_381_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Remove share subitems batch completed with error - %@%@");
}

- (void)computeURLForItemID:rootURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Can't find alias target for %@%@");
}

- (void)computeURLForItemID:rootURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] an item in the path has a nil filename%@", v1, 0xCu);
}

- (void)processServerItemsUnderItemID:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Processing server truth in op %@%@");
}

- (void)deleteShareInfoFromZone:(os_log_t)log zoneRowID:itemID:sharingOptions:itemsTable:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Don't know how to unshare item of type %d%@", (uint8_t *)v3, 0x12u);
}

- (void)deleteShareInfoFromZone:zoneRowID:itemID:sharingOptions:itemsTable:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't locate the item type we are deleting?%@", v2, v3, v4, v5, v6);
}

- (void)processClientTruthWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Processing client truth in op %@%@");
}

void __77__BRCSharingProcessFolderSubitemsOperation_processClientTruthWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: (options & BRCSharingItemHasShareID) != 0%@", v2, v3, v4, v5, v6);
}

@end