@interface MSASPersonModel
- (BOOL)dbQueueIsAssetCollectionWithGUIDPending:(id)a3;
- (BOOL)dbQueueIsGUIDQueued:(id)a3 inQueue:(id)a4;
- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4;
- (BOOL)hasItemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4;
- (BOOL)isAssetCollectionWithGUIDPending:(id)a3;
- (BOOL)shouldDownloadEarliestPhotosFirst;
- (MSASPersonModel)initWithPersonID:(id)a3;
- (id)_commandWithMinimumIdentifier:(id)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8;
- (id)commandAtHeadOfQueueOutParams:(id *)a3 outCommandIdentifier:(int64_t *)a4 outPersonID:(id *)a5 outAlbumGUID:(id *)a6 outAssetCollectionGUID:(id *)a7;
- (id)commandWithMinimumIdentifier:(int64_t)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8;
- (id)itemsForUpload;
- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 maxCount:(int)a5;
- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 thumbnails:(BOOL)a5 maxCount:(int)a6 isInflight:(BOOL)a7;
- (id)nextItemsForUploadAlbumGUID:(id)a3 maxPriority:(int)a4 maxCount:(int)a5;
- (id)nextItemsForUploadMaxCount:(int)a3;
- (int)assetCollectionsInUploadQueue;
- (int)assetCollectionsInUploadQueueAlbumGUID:(id)a3;
- (int)assetsInDownloadQueue;
- (int)assetsInDownloadQueueAlbumGUID:(id)a3;
- (int)dbQueueAssetCountAlbumGUID:(id)a3 inQueue:(id)a4;
- (int)itemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4;
- (int64_t)countOfEnqueuedCommand:(id)a3;
- (int64_t)countOfEnqueuedCommands;
- (int64_t)dbQueueNextCommandSequenceNumber;
- (int64_t)dbQueueSmallestCommandSequenceNumber;
- (int64_t)nextMMCSItemID;
- (void)addPendingAssetCollectionGUID:(id)a3 albumGUID:(id)a4;
- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7;
- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7 sequenceNumber:(int64_t)a8;
- (void)dbQueueRemoveAllEntriesFromTable:(id)a3;
- (void)dbQueueRemoveCommandAtHeadOfQueue;
- (void)dbQueueRemoveCommandIdentifier:(int64_t)a3;
- (void)dbQueueRemoveGUID:(id)a3 fromQueue:(id)a4;
- (void)dbQueueRequeuePendingCommandsWithAlbumGUID:(id)a3;
- (void)dbQueueRequeuePendingCommandsWithAssetCollectionGUID:(id)a3;
- (void)dbQueueRequeuePendingCommandsWithQueryStatement:(sqlite3_stmt *)a3 deleteStatement:(sqlite3_stmt *)a4;
- (void)dbQueueSetErrorCount:(int)a3 forGUID:(id)a4 inQueue:(id)a5;
- (void)enqueueAssetCollectionForUpload:(id)a3 album:(id)a4;
- (void)enqueueAssetForDownload:(id)a3 inAlbumWithGUID:(id)a4;
- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7;
- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 pendingOnAssetCollectionGUID:(id)a7;
- (void)enqueueCommandAtHeadOfQueue:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7;
- (void)purgeCompletionBlock:(id)a3;
- (void)removeAssetCollectionsFromUploadQueue:(id)a3;
- (void)removeAssetsFromDownloadQueue:(id)a3;
- (void)removeCommandIdentifier:(int64_t)a3;
- (void)requeuePendingAssetCollectionGUID:(id)a3;
- (void)requeuePendingAssetCollectionsWithAlbumGUID:(id)a3;
- (void)setErrorCount:(int)a3 forAssetCollectionInUploadQueue:(id)a4;
- (void)setErrorCount:(int)a3 forAssetInDownloadQueue:(id)a4;
- (void)setInFlightAssets:(id)a3;
- (void)setParams:(id)a3 forCommandWithIdentifier:(int64_t)a4;
- (void)setShouldDownloadEarliestPhotosFirst:(BOOL)a3;
@end

@implementation MSASPersonModel

- (void)setShouldDownloadEarliestPhotosFirst:(BOOL)a3
{
  self->_shouldDownloadEarliestPhotosFirst = a3;
}

- (BOOL)shouldDownloadEarliestPhotosFirst
{
  return self->_shouldDownloadEarliestPhotosFirst;
}

- (void)removeAssetCollectionsFromUploadQueue:(id)a3
{
  v4 = (void *)[a3 copy];
  v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MSASPersonModel_removeAssetCollectionsFromUploadQueue___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__MSASPersonModel_removeAssetCollectionsFromUploadQueue___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 40);
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
        v7 = *(void **)(a1 + 32);
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "GUID", (void)v10);
        [v7 dbQueueRemoveGUID:v8 fromQueue:@"UploadQueue"];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) dbQueueEndTransaction];
}

- (void)setErrorCount:(int)a3 forAssetCollectionInUploadQueue:(id)a4
{
  id v6 = a4;
  v7 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSASPersonModel_setErrorCount_forAssetCollectionInUploadQueue___block_invoke;
  block[3] = &unk_1E6C3D280;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __65__MSASPersonModel_setErrorCount_forAssetCollectionInUploadQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) GUID];
  [v2 dbQueueSetErrorCount:v1 forGUID:v3 inQueue:@"UploadQueue"];
}

- (id)nextItemsForUploadAlbumGUID:(id)a3 maxPriority:(int)a4 maxCount:(int)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4868;
  v22 = __Block_byref_object_dispose__4869;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(MSASModelBase *)self dbQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MSASPersonModel_nextItemsForUploadAlbumGUID_maxPriority_maxCount___block_invoke;
  v13[3] = &unk_1E6C3CC38;
  v13[4] = self;
  id v14 = v8;
  int v16 = a5;
  int v17 = a4;
  uint64_t v15 = &v18;
  id v10 = v8;
  dispatch_sync(v9, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __68__MSASPersonModel_nextItemsForUploadAlbumGUID_maxPriority_maxCount___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v29 = *(void **)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    int v31 = *(_DWORD *)(a1 + 56);
    int v36 = 138543874;
    v37 = v29;
    __int16 v38 = 2114;
    uint64_t v39 = v30;
    __int16 v40 = 1024;
    int v41 = v31;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Querying for next items to upload. Album GUID: %{public}@. Max: %d.", (uint8_t *)&v36, 0x1Cu);
  }
  if (*(void *)(a1 + 40)) {
    id v2 = @"select object, album, errorCount from UploadQueue where albumGUID = :alb and uploadPriority <= :priority order by uploadPriority,ord limit :lim;";
  }
  else {
    id v2 = @"select object, album, errorCount from UploadQueue where uploadPriority <= :priority order by uploadPriority,ord limit :lim;";
  }
  id v3 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:v2];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5) {
    goto LABEL_7;
  }
  if (*(void *)(a1 + 40))
  {
    int v8 = sqlite3_bind_parameter_index(v3, ":alb");
    uint64_t v9 = sqlite3_bind_text(v3, v8, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    int v10 = v9;
    MSSqliteTrapForDBLockError(v9);
    if (v10) {
      goto LABEL_7;
    }
  }
  int v11 = sqlite3_bind_parameter_index(v3, ":lim");
  uint64_t v12 = sqlite3_bind_int(v3, v11, *(_DWORD *)(a1 + 56));
  int v13 = v12;
  MSSqliteTrapForDBLockError(v12);
  if (v13) {
    goto LABEL_7;
  }
  int v14 = sqlite3_bind_parameter_index(v3, ":priority");
  uint64_t v15 = sqlite3_bind_int(v3, v14, *(_DWORD *)(a1 + 60));
  int v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16) {
    goto LABEL_7;
  }
  while (1)
  {
    int v17 = sqlite3_step(v3);
    if (v17 != 100) {
      break;
    }
    uint64_t v18 = objc_opt_new();
    v19 = sqlite3_column_blob(v3, 0);
    int v20 = sqlite3_column_bytes(v3, 0);
    v21 = (void *)MEMORY[0x1E4F28DC0];
    v22 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:v20 freeWhenDone:0];
    id v23 = [v21 MSSafeUnarchiveObjectWithData:v22 outError:0];

    [v18 setObject:v23];
    v24 = sqlite3_column_blob(v3, 1);
    int v25 = sqlite3_column_bytes(v3, 1);
    v26 = (void *)MEMORY[0x1E4F28DC0];
    v27 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v24 length:v25 freeWhenDone:0];
    v28 = [v26 MSSafeUnarchiveObjectWithData:v27 outError:0];

    [v18 setAlbum:v28];
    objc_msgSend(v18, "setErrorCount:", sqlite3_column_int(v3, 2));
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v18];
  }
  if (v17 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v34 = *(void **)(a1 + 32);
      v35 = sqlite3_errmsg((sqlite3 *)[v34 dbQueueDB]);
      int v36 = 138543618;
      v37 = v34;
      __int16 v38 = 2082;
      uint64_t v39 = (uint64_t)v35;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving items for upload. Error: %{public}s", (uint8_t *)&v36, 0x16u);
    }
LABEL_7:
    sqlite3_reset(v3);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    return;
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v32 = *(void **)(a1 + 32);
    uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    int v36 = 138543618;
    v37 = v32;
    __int16 v38 = 2048;
    uint64_t v39 = v33;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %ld items.", (uint8_t *)&v36, 0x16u);
  }
}

- (id)nextItemsForUploadMaxCount:(int)a3
{
  return [(MSASPersonModel *)self nextItemsForUploadAlbumGUID:0 maxPriority:0x7FFFFFFFLL maxCount:*(void *)&a3];
}

- (id)itemsForUpload
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__4868;
  int v11 = __Block_byref_object_dispose__4869;
  id v12 = 0;
  id v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MSASPersonModel_itemsForUpload__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__MSASPersonModel_itemsForUpload__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueDB];
  id v6 = [NSString stringWithFormat:@"select object, album, errorCount from UploadQueue;"];
  uint64_t v3 = +[MSASModelEnumerator enumeratorWithDatabase:v2 query:v6 stepBlock:&__block_literal_global_4883];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __33__MSASPersonModel_itemsForUpload__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = sqlite3_column_blob(a2, 0);
  int v5 = sqlite3_column_bytes(a2, 0);
  id v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v4 length:v5 freeWhenDone:0];
  int v8 = [v6 MSSafeUnarchiveObjectWithData:v7 outError:0];

  [v3 setObject:v8];
  uint64_t v9 = sqlite3_column_blob(a2, 1);
  int v10 = sqlite3_column_bytes(a2, 1);
  int v11 = (void *)MEMORY[0x1E4F28DC0];
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v9 length:v10 freeWhenDone:0];
  int v13 = [v11 MSSafeUnarchiveObjectWithData:v12 outError:0];

  [v3 setAlbum:v13];
  objc_msgSend(v3, "setErrorCount:", sqlite3_column_int(a2, 2));

  return v3;
}

- (int)assetCollectionsInUploadQueueAlbumGUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MSASPersonModel_assetCollectionsInUploadQueueAlbumGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

uint64_t __58__MSASPersonModel_assetCollectionsInUploadQueueAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueAssetCountAlbumGUID:*(void *)(a1 + 40) inQueue:@"UploadQueue"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)assetCollectionsInUploadQueue
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MSASPersonModel_assetCollectionsInUploadQueue__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __48__MSASPersonModel_assetCollectionsInUploadQueue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueAssetCountAlbumGUID:0 inQueue:@"UploadQueue"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)enqueueAssetCollectionForUpload:(id)a3 album:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSASPersonModel_enqueueAssetCollectionForUpload_album___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __57__MSASPersonModel_enqueueAssetCollectionForUpload_album___block_invoke(id *a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v26 = a1[4];
    id v27 = a1[5];
    v28 = [a1[6] GUID];
    *(_DWORD *)buf = 138543874;
    v52 = v26;
    __int16 v53 = 2114;
    id v54 = v27;
    __int16 v55 = 2114;
    v56 = v28;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing upload for asset collection: %{public}@\n In album with GUID: %{public}@", buf, 0x20u);
  }
  id v2 = a1[4];
  uint64_t v3 = [a1[5] GUID];
  LODWORD(v2) = [v2 dbQueueIsGUIDQueued:v3 inQueue:@"UploadQueue"];

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = a1[4];
      id v5 = a1[5];
      *(_DWORD *)buf = 138543618;
      v52 = v4;
      __int16 v53 = 2114;
      id v54 = v5;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to re-enqueue asset collection %{public}@ for upload. Ignoring.", buf, 0x16u);
    }
  }
  else
  {
    id v6 = (sqlite3_stmt *)[a1[4] statementForString:@"insert into UploadQueue (ord, object, album, GUID, albumGUID, uploadPriority) values (?, ?, ?, ?, ?, ?);"];
    uint64_t v7 = sqlite3_reset(v6);
    int v8 = v7;
    MSSqliteTrapForDBLockError(v7);
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceReferenceDate];
      uint64_t v11 = sqlite3_bind_double(v6, 1, v10);
      int v12 = v11;
      MSSqliteTrapForDBLockError(v11);

      if (!v12)
      {
        id v13 = a1[5];
        id v50 = 0;
        int v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v50];
        id v15 = v50;
        int v16 = v15;
        if (!v14)
        {
          int v17 = NSString;
          uint64_t v18 = [v15 userInfo];
          v19 = [v17 stringWithFormat:@"Failed to archive an assetCollection object. Error: %@ Info: %@", v16, v18];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v19;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }
        unint64_t v20 = [v14 length];
        if (v20 >> 31) {
          __assert_rtn("-[MSASPersonModel enqueueAssetCollectionForUpload:album:]_block_invoke", "MSASPersonModel.m", 1356, "objectArchiveLength <= INT_MAX");
        }
        int v21 = v20;
        id v22 = v14;
        uint64_t v23 = sqlite3_bind_blob(v6, 2, (const void *)[v22 bytes], v21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        int v24 = v23;
        MSSqliteTrapForDBLockError(v23);
        if (v24)
        {
          id v25 = v16;
        }
        else
        {
          id v29 = a1[6];
          id v49 = v16;
          uint64_t v30 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v29 requiringSecureCoding:1 error:&v49];
          id v25 = v49;

          if (!v30)
          {
            int v31 = NSString;
            v32 = [v25 userInfo];
            uint64_t v33 = [v31 stringWithFormat:@"Failed to archive an album object. Error: %@ Info: %@", v25, v32];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v33;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }
          unint64_t v34 = [v30 length];
          if (v34 >> 31) {
            __assert_rtn("-[MSASPersonModel enqueueAssetCollectionForUpload:album:]_block_invoke", "MSASPersonModel.m", 1364, "albumArchiveLength <= INT_MAX");
          }
          int v35 = v34;
          id v36 = v30;
          uint64_t v37 = sqlite3_bind_blob(v6, 3, (const void *)[v36 bytes], v35, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          int v38 = v37;
          MSSqliteTrapForDBLockError(v37);
          if (!v38)
          {
            id v39 = [a1[5] GUID];
            uint64_t v40 = sqlite3_bind_text(v6, 4, (const char *)[v39 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            int v41 = v40;
            MSSqliteTrapForDBLockError(v40);

            if (!v41)
            {
              id v42 = [a1[6] GUID];
              uint64_t v43 = sqlite3_bind_text(v6, 5, (const char *)[v42 UTF8String], -1, 0);
              int v44 = v43;
              MSSqliteTrapForDBLockError(v43);

              if (!v44)
              {
                if ([a1[5] isVideo]) {
                  int v45 = 10;
                }
                else {
                  int v45 = 0;
                }
                uint64_t v46 = sqlite3_bind_int(v6, 6, v45);
                int v47 = v46;
                MSSqliteTrapForDBLockError(v46);
                if (!v47)
                {
                  uint64_t v48 = sqlite3_step(v6);
                  MSSqliteTrapForDBLockError(v48);
                }
              }
            }
          }
        }
      }
    }
    sqlite3_reset(v6);
  }
}

- (void)removeAssetsFromDownloadQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MSASPersonModel_removeAssetsFromDownloadQueue___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__MSASPersonModel_removeAssetsFromDownloadQueue___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 40);
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
        uint64_t v7 = *(void **)(a1 + 32);
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "GUID", (void)v10);
        [v7 dbQueueRemoveGUID:v8 fromQueue:@"DownloadQueue"];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) dbQueueEndTransaction];
}

- (void)setInFlightAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) GUID];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    long long v12 = [(MSASModelBase *)self dbQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__MSASPersonModel_setInFlightAssets___block_invoke;
    v14[3] = &unk_1E6C3DB28;
    v14[4] = self;
    id v15 = v5;
    id v13 = v5;
    dispatch_async(v12, v14);
  }
}

void __37__MSASPersonModel_setInFlightAssets___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting inflight for assets with GUIDs %{public}@ in DownloadQueue.", buf, 0x16u);
  }
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore DownloadQueue set isInflight = 1 where GUID = ?;"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
        uint64_t v9 = sqlite3_reset(v2);
        int v10 = v9;
        MSSqliteTrapForDBLockError(v9);
        if (v10
          || (id v11 = v8,
              uint64_t v12 = sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(v11, "UTF8String", (void)v20), -1, 0),
              int v13 = v12,
              MSSqliteTrapForDBLockError(v12),
              v13)
          || (v14 = sqlite3_step(v2), int v15 = v14, MSSqliteTrapForDBLockError(v14), v15 != 101))
        {

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void *)(a1 + 32);
            uint64_t v19 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v26 = v18;
            __int16 v27 = 2114;
            uint64_t v28 = v19;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set inflight for assets with GUIDs %{public}@ in DownloadQueue.", buf, 0x16u);
          }
          return;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
}

- (void)setErrorCount:(int)a3 forAssetInDownloadQueue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSASPersonModel_setErrorCount_forAssetInDownloadQueue___block_invoke;
  block[3] = &unk_1E6C3D280;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __57__MSASPersonModel_setErrorCount_forAssetInDownloadQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) GUID];
  [v2 dbQueueSetErrorCount:v1 forGUID:v3 inQueue:@"DownloadQueue"];
}

- (int)itemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  id v8 = [(MSASModelBase *)self dbQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__MSASPersonModel_itemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke;
  v12[3] = &unk_1E6C3CC10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  int v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LODWORD(v7) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return (int)v7;
}

void __80__MSASPersonModel_itemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v14 = (void *)a1[4];
    int v15 = (const char *)a1[5];
    uint64_t v16 = a1[6];
    int v19 = 138543874;
    long long v20 = v14;
    __int16 v21 = 2114;
    long long v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of assets to download using criteria: focus album GUID: %{public}@ focus asset collection GUID: %{public}@", (uint8_t *)&v19, 0x20u);
  }
  if (a1[6])
  {
    id v2 = (void *)a1[4];
    id v3 = @"select count(*) from DownloadQueue where assetCollectionGUID = :assetcol;";
  }
  else
  {
    id v2 = (void *)a1[4];
    if (a1[5]) {
      id v3 = @"select count(*) from DownloadQueue where albumGUID = :album;";
    }
    else {
      id v3 = @"select count(*) from DownloadQueue;";
    }
  }
  uint64_t v4 = (sqlite3_stmt *)[v2 statementForString:v3];
  uint64_t v5 = sqlite3_reset(v4);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6) {
    goto LABEL_22;
  }
  if (a1[6])
  {
    int v7 = sqlite3_bind_parameter_index(v4, ":assetcol");
    id v8 = (void *)a1[6];
  }
  else
  {
    if (!a1[5]) {
      goto LABEL_16;
    }
    int v7 = sqlite3_bind_parameter_index(v4, ":album");
    id v8 = (void *)a1[5];
  }
  uint64_t v9 = sqlite3_bind_text(v4, v7, (const char *)[v8 UTF8String], -1, 0);
  int v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
LABEL_22:
    sqlite3_reset(v4);
    return;
  }
LABEL_16:
  while (1)
  {
    int v11 = sqlite3_step(v4);
    if (v11 != 100) {
      break;
    }
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = sqlite3_column_int(v4, 0);
  }
  if (v11 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (void *)a1[4];
      uint64_t v18 = sqlite3_errmsg((sqlite3 *)[v17 dbQueueDB]);
      int v19 = 138543618;
      long long v20 = v17;
      __int16 v21 = 2082;
      long long v22 = v18;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error counting items for download. Error: %{public}s", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_22;
  }
  sqlite3_reset(v4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = (void *)a1[4];
    int v13 = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 138543618;
    long long v20 = v12;
    __int16 v21 = 1024;
    LODWORD(v22) = v13;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %d assets.", (uint8_t *)&v19, 0x12u);
  }
}

- (BOOL)hasItemsForDownloadCountFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = [(MSASModelBase *)self dbQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__MSASPersonModel_hasItemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke;
  v12[3] = &unk_1E6C3CC10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  int v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

void __83__MSASPersonModel_hasItemsForDownloadCountFocusAlbumGUID_focusAssetCollectionGUID___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v14 = (void *)a1[4];
    int v15 = (const char *)a1[5];
    uint64_t v16 = a1[6];
    int v19 = 138543874;
    long long v20 = v14;
    __int16 v21 = 2114;
    long long v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Checking if there are assets to download using criteria: focus album GUID: %{public}@ focus asset collection GUID: %{public}@", (uint8_t *)&v19, 0x20u);
  }
  if (a1[6])
  {
    id v2 = (void *)a1[4];
    id v3 = @"select ord from DownloadQueue where assetCollectionGUID = :assetcol limit 1;";
  }
  else
  {
    id v2 = (void *)a1[4];
    if (a1[5]) {
      id v3 = @"select ord from DownloadQueue where albumGUID = :album limit 1;";
    }
    else {
      id v3 = @"select ord from DownloadQueue limit 1;";
    }
  }
  uint64_t v4 = (sqlite3_stmt *)[v2 statementForString:v3];
  uint64_t v5 = sqlite3_reset(v4);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6) {
    goto LABEL_21;
  }
  if (a1[6])
  {
    int v7 = sqlite3_bind_parameter_index(v4, ":assetcol");
    id v8 = (void *)a1[6];
  }
  else
  {
    if (!a1[5]) {
      goto LABEL_14;
    }
    int v7 = sqlite3_bind_parameter_index(v4, ":album");
    id v8 = (void *)a1[5];
  }
  uint64_t v9 = sqlite3_bind_text(v4, v7, (const char *)[v8 UTF8String], -1, 0);
  int v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
LABEL_21:
    sqlite3_reset(v4);
    return;
  }
LABEL_14:
  while (1)
  {
    int v11 = sqlite3_step(v4);
    if (v11 != 100) {
      break;
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  if (v11 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (void *)a1[4];
      uint64_t v18 = sqlite3_errmsg((sqlite3 *)[v17 dbQueueDB]);
      int v19 = 138543618;
      long long v20 = v17;
      __int16 v21 = 2082;
      long long v22 = v18;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error checking for assets to download. Error: %{public}s", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_21;
  }
  sqlite3_reset(v4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = (void *)a1[4];
    int v13 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    int v19 = 138543618;
    long long v20 = v12;
    __int16 v21 = 1024;
    LODWORD(v22) = v13;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: result: %d", (uint8_t *)&v19, 0x12u);
  }
}

- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 maxCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = [(MSASPersonModel *)self nextItemsForDownloadFocusAlbumGUID:v8 focusAssetCollectionGUID:v9 thumbnails:1 maxCount:v5 isInflight:1];
  if (![v10 count])
  {
    uint64_t v11 = [(MSASPersonModel *)self nextItemsForDownloadFocusAlbumGUID:v8 focusAssetCollectionGUID:v9 thumbnails:1 maxCount:v5 isInflight:0];

    int v10 = (void *)v11;
  }
  if (![v10 count])
  {
    uint64_t v12 = [(MSASPersonModel *)self nextItemsForDownloadFocusAlbumGUID:v8 focusAssetCollectionGUID:v9 thumbnails:0 maxCount:v5 isInflight:1];

    int v10 = (void *)v12;
  }
  if (![v10 count])
  {
    uint64_t v13 = [(MSASPersonModel *)self nextItemsForDownloadFocusAlbumGUID:v8 focusAssetCollectionGUID:v9 thumbnails:0 maxCount:v5 isInflight:0];

    int v10 = (void *)v13;
  }

  return v10;
}

- (id)nextItemsForDownloadFocusAlbumGUID:(id)a3 focusAssetCollectionGUID:(id)a4 thumbnails:(BOOL)a5 maxCount:(int)a6 isInflight:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__4868;
  uint64_t v30 = __Block_byref_object_dispose__4869;
  id v31 = 0;
  id v14 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__MSASPersonModel_nextItemsForDownloadFocusAlbumGUID_focusAssetCollectionGUID_thumbnails_maxCount_isInflight___block_invoke;
  block[3] = &unk_1E6C3CBE8;
  BOOL v24 = a5;
  block[4] = self;
  id v20 = v12;
  BOOL v25 = a7;
  id v21 = v13;
  long long v22 = &v26;
  int v23 = a6;
  id v15 = v13;
  id v16 = v12;
  dispatch_sync(v14, block);

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __110__MSASPersonModel_nextItemsForDownloadFocusAlbumGUID_focusAssetCollectionGUID_thumbnails_maxCount_isInflight___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v36 = *(unsigned __int8 *)(a1 + 68);
    uint64_t v37 = *(void **)(a1 + 32);
    uint64_t v38 = *(void *)(a1 + 40);
    uint64_t v39 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 69)) {
      uint64_t v40 = @"1";
    }
    else {
      uint64_t v40 = @"0";
    }
    int v45 = 138544386;
    uint64_t v46 = v37;
    __int16 v47 = 1024;
    *(_DWORD *)uint64_t v48 = v36;
    *(_WORD *)&v48[4] = 2114;
    *(void *)&v48[6] = v38;
    __int16 v49 = 2114;
    uint64_t v50 = v39;
    __int16 v51 = 2114;
    v52 = v40;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Querying for the next assets to download using criteria: thumbnail: %d focus album GUID: %{public}@ focus asset collection GUID: %{public}@ isInflight: %{public}@", (uint8_t *)&v45, 0x30u);
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(a1 + 48))
  {
    int v5 = [*(id *)(a1 + 32) shouldDownloadEarliestPhotosFirst];
    int v6 = *(void **)(a1 + 32);
    if (v5) {
      int v7 = @"select object, albumGUID, errorCount from DownloadQueue where assetCollectionGUID = :assetcol and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;";
    }
    else {
      int v7 = @"select object, albumGUID, errorCount from DownloadQueue where assetCollectionGUID = :assetcol and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;";
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = [*(id *)(a1 + 32) shouldDownloadEarliestPhotosFirst];
    int v6 = *(void **)(a1 + 32);
    if (v8)
    {
      if (v9) {
        int v7 = @"select object, albumGUID, errorCount from DownloadQueue where albumGUID = :album and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;";
      }
      else {
        int v7 = @"select object, albumGUID, errorCount from DownloadQueue where albumGUID = :album and isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;";
      }
    }
    else if (v9)
    {
      int v7 = @"select object, albumGUID, errorCount from DownloadQueue where isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate asc, photoCreationDate asc limit:lim;";
    }
    else
    {
      int v7 = @"select object, albumGUID, errorCount from DownloadQueue where isThumbnail = :thumb and isInflight = :inflight order by albumGUID asc, batchCreationDate desc, photoCreationDate asc limit:lim;";
    }
  }
  int v10 = (sqlite3_stmt *)[v6 statementForString:v7];
  uint64_t v11 = sqlite3_reset(v10);
  int v12 = v11;
  MSSqliteTrapForDBLockError(v11);
  if (v12) {
    goto LABEL_39;
  }
  if (*(void *)(a1 + 48))
  {
    int v13 = sqlite3_bind_parameter_index(v10, ":assetcol");
    id v14 = *(void **)(a1 + 48);
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_19;
    }
    int v13 = sqlite3_bind_parameter_index(v10, ":album");
    id v14 = *(void **)(a1 + 40);
  }
  uint64_t v15 = sqlite3_bind_text(v10, v13, (const char *)[v14 UTF8String], -1, 0);
  int v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16)
  {
LABEL_39:
    sqlite3_reset(v10);
    return;
  }
LABEL_19:
  int v17 = sqlite3_bind_parameter_index(v10, ":thumb");
  if (*(unsigned char *)(a1 + 68)) {
    uint64_t v18 = "1";
  }
  else {
    uint64_t v18 = "0";
  }
  uint64_t v19 = sqlite3_bind_text(v10, v17, v18, -1, 0);
  int v20 = v19;
  MSSqliteTrapForDBLockError(v19);
  if (v20) {
    goto LABEL_39;
  }
  int v21 = sqlite3_bind_parameter_index(v10, ":inflight");
  long long v22 = *(unsigned char *)(a1 + 69) ? "1" : "0";
  uint64_t v23 = sqlite3_bind_text(v10, v21, v22, -1, 0);
  int v24 = v23;
  MSSqliteTrapForDBLockError(v23);
  if (v24) {
    goto LABEL_39;
  }
  int v25 = sqlite3_bind_parameter_index(v10, ":lim");
  uint64_t v26 = sqlite3_bind_int(v10, v25, *(_DWORD *)(a1 + 64));
  int v27 = v26;
  MSSqliteTrapForDBLockError(v26);
  if (v27) {
    goto LABEL_39;
  }
  while (1)
  {
    int v28 = sqlite3_step(v10);
    if (v28 != 100) {
      break;
    }
    uint64_t v29 = objc_opt_new();
    uint64_t v30 = sqlite3_column_blob(v10, 0);
    int v31 = sqlite3_column_bytes(v10, 0);
    v32 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v33 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v30 length:v31 freeWhenDone:0];
    unint64_t v34 = [v32 MSSafeUnarchiveObjectWithData:v33 outError:0];

    [v29 setObject:v34];
    int v35 = MSSqliteStringFromStatementColumn(v10, 1);
    [v29 setAlbumGUID:v35];
    objc_msgSend(v29, "setErrorCount:", sqlite3_column_int(v10, 2));
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v29];
  }
  if (v28 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void **)(a1 + 32);
      int v44 = sqlite3_errmsg((sqlite3 *)[v43 dbQueueDB]);
      int v45 = 138543618;
      uint64_t v46 = v43;
      __int16 v47 = 2082;
      *(void *)uint64_t v48 = v44;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving items for download. Error: %{public}s", (uint8_t *)&v45, 0x16u);
    }
    goto LABEL_39;
  }
  sqlite3_reset(v10);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v41 = *(void **)(a1 + 32);
    uint64_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    int v45 = 138543618;
    uint64_t v46 = v41;
    __int16 v47 = 2048;
    *(void *)uint64_t v48 = v42;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %ld assets.", (uint8_t *)&v45, 0x16u);
  }
}

- (int)assetsInDownloadQueueAlbumGUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASPersonModel_assetsInDownloadQueueAlbumGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

uint64_t __50__MSASPersonModel_assetsInDownloadQueueAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueAssetCountAlbumGUID:*(void *)(a1 + 40) inQueue:@"DownloadQueue"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)assetsInDownloadQueue
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MSASPersonModel_assetsInDownloadQueue__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __40__MSASPersonModel_assetsInDownloadQueue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueAssetCountAlbumGUID:0 inQueue:@"DownloadQueue"];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)enqueueAssetForDownload:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASPersonModel_enqueueAssetForDownload_inAlbumWithGUID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__MSASPersonModel_enqueueAssetForDownload_inAlbumWithGUID___block_invoke(id *a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] GUID];
  LODWORD(v2) = [v2 dbQueueIsGUIDQueued:v3 inQueue:@"DownloadQueue"];

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = a1[4];
      int v5 = [a1[5] GUID];
      id v6 = [a1[5] assetCollectionGUID];
      *(_DWORD *)buf = 138543874;
      v62 = v4;
      __int16 v63 = 2114;
      v64 = v5;
      __int16 v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to re-enqueue asset (GUID: %{public}@ collectionGUID: %{public}@) for download. Ignoring.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v43 = a1[4];
      int v44 = [a1[5] GUID];
      int v45 = [a1[5] assetCollectionGUID];
      id v46 = a1[6];
      *(_DWORD *)buf = 138544130;
      v62 = v43;
      __int16 v63 = 2114;
      v64 = v44;
      __int16 v65 = 2114;
      v66 = v45;
      __int16 v67 = 2114;
      id v68 = v46;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing download for asset (GUID: %{public}@ collectionGUID: %{public}@) in album with GUID: %{public}@.", buf, 0x2Au);
    }
    id v7 = (sqlite3_stmt *)[a1[4] statementForString:@"insert into DownloadQueue (ord, object, GUID, albumGUID, assetCollectionGUID, isThumbnail, batchCreationDate, photoCreationDate) values (?, ?, ?, ?, ?, ?, ?, ?);"];
    uint64_t v8 = sqlite3_reset(v7);
    int v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceReferenceDate];
      uint64_t v12 = sqlite3_bind_double(v7, 1, v11);
      int v13 = v12;
      MSSqliteTrapForDBLockError(v12);

      if (!v13)
      {
        id v14 = a1[5];
        id v60 = 0;
        uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v60];
        id v16 = v60;
        int v17 = v16;
        if (!v15)
        {
          uint64_t v18 = NSString;
          uint64_t v19 = [v16 userInfo];
          int v20 = [v18 stringWithFormat:@"Failed to archive an assetArchive object. Error: %@ Info: %@", v17, v19];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v62 = v20;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }
        }
        unint64_t v21 = [v15 length];
        if (v21 >> 31) {
          __assert_rtn("-[MSASPersonModel enqueueAssetForDownload:inAlbumWithGUID:]_block_invoke", "MSASPersonModel.m", 1058, "assetArchiveLength <= INT_MAX");
        }
        int v22 = v21;
        id v23 = v15;
        uint64_t v24 = sqlite3_bind_blob(v7, 2, (const void *)[v23 bytes], v22, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        int v25 = v24;
        MSSqliteTrapForDBLockError(v24);
        if (!v25)
        {
          id v26 = [a1[5] GUID];
          uint64_t v27 = sqlite3_bind_text(v7, 3, (const char *)[v26 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          int v28 = v27;
          MSSqliteTrapForDBLockError(v27);

          if (!v28)
          {
            uint64_t v29 = sqlite3_bind_text(v7, 4, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            int v30 = v29;
            MSSqliteTrapForDBLockError(v29);
            if (!v30)
            {
              id v31 = [a1[5] assetCollectionGUID];
              uint64_t v32 = sqlite3_bind_text(v7, 5, (const char *)[v31 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              int v33 = v32;
              MSSqliteTrapForDBLockError(v32);

              if (!v33)
              {
                unint64_t v34 = [a1[5] metadata];
                int v35 = [v34 objectForKey:@"MSAssetMetadataAssetType"];
                char v36 = [v35 isEqualToString:@"thumbnail"];

                if ((v36 & 1) != 0
                  || ([a1[5] metadata],
                      uint64_t v37 = objc_claimAutoreleasedReturnValue(),
                      [v37 objectForKey:@"MSAssetMetadataAssetTypeFlags"],
                      uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                      char v39 = [v38 intValue],
                      v38,
                      v37,
                      (v39 & 1) != 0))
                {
                  BOOL v42 = 1;
                }
                else
                {
                  uint64_t v40 = [a1[5] mediaAssetType];
                  BOOL v42 = v40 == 5 || v40 == 2;
                }
                uint64_t v47 = sqlite3_bind_int(v7, 6, v42);
                int v48 = v47;
                MSSqliteTrapForDBLockError(v47);
                if (!v48)
                {
                  __int16 v49 = [a1[5] batchCreationDate];

                  if (!v49
                    || ([a1[5] batchCreationDate],
                        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
                        [v50 timeIntervalSinceReferenceDate],
                        uint64_t v52 = sqlite3_bind_double(v7, 7, v51),
                        int v53 = v52,
                        MSSqliteTrapForDBLockError(v52),
                        v50,
                        !v53))
                  {
                    id v54 = [a1[5] photoCreationDate];

                    if (!v54
                      || ([a1[5] photoCreationDate],
                          __int16 v55 = objc_claimAutoreleasedReturnValue(),
                          [v55 timeIntervalSinceReferenceDate],
                          uint64_t v57 = sqlite3_bind_double(v7, 8, v56),
                          int v58 = v57,
                          MSSqliteTrapForDBLockError(v57),
                          v55,
                          !v58))
                    {
                      uint64_t v59 = sqlite3_step(v7);
                      MSSqliteTrapForDBLockError(v59);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    sqlite3_reset(v7);
  }
}

- (int64_t)nextMMCSItemID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MSASPersonModel_nextMMCSItemID__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__MSASPersonModel_nextMMCSItemID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dbQueuePersistentObjectForKey:@"nextMMCSItemID"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 longLongValue];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1];
  [v3 dbQueueSetPersistentObject:v4 forKey:@"nextMMCSItemID"];
}

- (BOOL)dbQueueIsGUIDQueued:(id)a3 inQueue:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [NSString stringWithFormat:@"select GUID from %@ where GUID = ? limit 1", v7];;
  uint64_t v9 = [(MSASModelBase *)self statementForString:v8];

  uint64_t v10 = sqlite3_reset(v9);
  LODWORD(v8) = v10;
  MSSqliteTrapForDBLockError(v10);
  if (v8
    || (id v11 = v6,
        uint64_t v12 = sqlite3_bind_text(v9, 1, (const char *)[v11 UTF8String], -1, 0),
        int v13 = v12,
        MSSqliteTrapForDBLockError(v12),
        v13))
  {
    sqlite3_reset(v9);
    LOBYTE(v14) = 0;
  }
  else
  {
    int v16 = sqlite3_step(v9);
    BOOL v14 = v16 == 100;
    if ((v16 & 0xFFFFFFFE) != 0x64 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2082;
      uint64_t v24 = sqlite3_errmsg([(MSASModelBase *)self dbQueueDB]);
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot check if GUID %{public}@ is in %{public}@. Error: %{public}s", buf, 0x2Au);
    }
    sqlite3_reset(v9);
  }

  return v14;
}

- (void)dbQueueRemoveGUID:(id)a3 fromQueue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing GUID %{public}@ from %{public}@.", buf, 0x20u);
  }
  uint64_t v8 = [NSString stringWithFormat:@"delete from %@ where GUID = ?", v7];;
  uint64_t v9 = [(MSASModelBase *)self statementForString:v8];

  uint64_t v10 = sqlite3_reset(v9);
  LODWORD(v8) = v10;
  MSSqliteTrapForDBLockError(v10);
  if (!v8)
  {
    uint64_t v11 = sqlite3_bind_text(v9, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v12 = v11;
    MSSqliteTrapForDBLockError(v11);
    if (!v12)
    {
      uint64_t v13 = sqlite3_step(v9);
      MSSqliteTrapForDBLockError(v13);
    }
  }
  sqlite3_reset(v9);
}

- (void)dbQueueSetErrorCount:(int)a3 forGUID:(id)a4 inQueue:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 1024;
    int v25 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting error count for GUID %{public}@ in %{public}@ to %d.", buf, 0x26u);
  }
  uint64_t v10 = [NSString stringWithFormat:@"update %@ set errorCount = ? where GUID = ?", v9];;
  uint64_t v11 = [(MSASModelBase *)self statementForString:v10];

  uint64_t v12 = sqlite3_reset(v11);
  LODWORD(v10) = v12;
  MSSqliteTrapForDBLockError(v12);
  if (!v10)
  {
    uint64_t v13 = sqlite3_bind_int(v11, 1, a3);
    int v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (!v14)
    {
      uint64_t v15 = sqlite3_bind_text(v11, 2, (const char *)[v8 UTF8String], -1, 0);
      int v16 = v15;
      MSSqliteTrapForDBLockError(v15);
      if (!v16)
      {
        uint64_t v17 = sqlite3_step(v11);
        MSSqliteTrapForDBLockError(v17);
      }
    }
  }
  sqlite3_reset(v11);
}

- (int)dbQueueAssetCountAlbumGUID:(id)a3 inQueue:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    id v8 = @"select count(*) from %@ where albumGUID = ?";
  }
  else {
    id v8 = @"select count(*) from %@;";
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  uint64_t v10 = [(MSASModelBase *)self statementForString:v9];

  uint64_t v11 = sqlite3_reset(v10);
  LODWORD(v9) = v11;
  MSSqliteTrapForDBLockError(v11);
  if (v9) {
    goto LABEL_5;
  }
  if (v6)
  {
    uint64_t v17 = sqlite3_bind_text(v10, 1, (const char *)[v6 UTF8String], -1, 0);
    int v18 = v17;
    MSSqliteTrapForDBLockError(v17);
    if (v18) {
      goto LABEL_5;
    }
  }
  if (sqlite3_step(v10) != 100)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = self;
      __int16 v22 = 2114;
      *(void *)id v23 = v7;
      *(_WORD *)&v23[8] = 2082;
      *(void *)&v23[10] = sqlite3_errmsg([(MSASModelBase *)self dbQueueDB]);
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot count number of assets enqueued in %{public}@. Error: %{public}s", buf, 0x20u);
    }
LABEL_5:
    int v12 = 0;
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v12 = sqlite3_column_int(v10, 0);
  if (v10) {
LABEL_6:
  }
    sqlite3_reset(v10);
LABEL_7:
  BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138544130;
      id v21 = self;
      __int16 v22 = 1024;
      *(_DWORD *)id v23 = v12;
      *(_WORD *)&v23[4] = 2114;
      *(void *)&v23[6] = v7;
      *(_WORD *)&v23[14] = 2114;
      *(void *)&v23[16] = v6;
      int v14 = MEMORY[0x1E4F14500];
      uint64_t v15 = "%{public}@: Found %d assets enqueued in %{public}@ for album GUID %{public}@.";
      uint32_t v16 = 38;
LABEL_20:
      _os_log_debug_impl(&dword_1DC434000, v14, OS_LOG_TYPE_DEBUG, v15, buf, v16);
    }
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 1024;
    *(_DWORD *)id v23 = v12;
    *(_WORD *)&v23[4] = 2114;
    *(void *)&v23[6] = v7;
    int v14 = MEMORY[0x1E4F14500];
    uint64_t v15 = "%{public}@: Found %d assets enqueued in %{public}@.";
    uint32_t v16 = 28;
    goto LABEL_20;
  }

  return v12;
}

- (void)requeuePendingAssetCollectionsWithAlbumGUID:(id)a3
{
  id v4 = a3;
  int v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MSASPersonModel_requeuePendingAssetCollectionsWithAlbumGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __63__MSASPersonModel_requeuePendingAssetCollectionsWithAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing asset collections from album with GUID %{public}@ from pending list.", (uint8_t *)&v11, 0x16u);
  }
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"delete from PendingAssetCollections where albumGUID = ?;"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    int v5 = 914;
  }
  else
  {
    uint64_t v6 = sqlite3_step(v2);
    int v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7 == 101) {
      goto LABEL_8;
    }
    int v5 = 915;
  }
  MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), v5);
LABEL_8:
  if (v2) {
    sqlite3_reset(v2);
  }
  return [*(id *)(a1 + 32) dbQueueRequeuePendingCommandsWithAlbumGUID:*(void *)(a1 + 40)];
}

- (void)requeuePendingAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  int v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MSASPersonModel_requeuePendingAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__MSASPersonModel_requeuePendingAssetCollectionGUID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing asset collection GUID %{public}@ from pending list.", (uint8_t *)&v9, 0x16u);
  }
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"delete from PendingAssetCollections where assetCollectionGUID = ?;"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    uint64_t v5 = sqlite3_step(v2);
    MSSqliteTrapForDBLockError(v5);
  }
  if (v2) {
    sqlite3_reset(v2);
  }
  return [*(id *)(a1 + 32) dbQueueRequeuePendingCommandsWithAssetCollectionGUID:*(void *)(a1 + 40)];
}

- (void)addPendingAssetCollectionGUID:(id)a3 albumGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASPersonModel_addPendingAssetCollectionGUID_albumGUID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __59__MSASPersonModel_addPendingAssetCollectionGUID_albumGUID___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = a1[6];
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Adding asset collection GUID %{public}@ in album GUID %{public}@ as pending.", (uint8_t *)&v12, 0x20u);
  }
  id v2 = (sqlite3_stmt *)[a1[4] statementForString:@"insert or ignore into PendingAssetCollections (assetCollectionGUID, albumGUID) values (?, ?);"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  int v4 = v3;
  uint64_t result = MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    uint64_t v6 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
    int v7 = v6;
    uint64_t result = MSSqliteTrapForDBLockError(v6);
    if (!v7)
    {
      uint64_t v8 = sqlite3_step(v2);
      uint64_t result = MSSqliteTrapForDBLockError(v8);
    }
  }
  if (v2) {
    return sqlite3_reset(v2);
  }
  return result;
}

- (BOOL)dbQueueIsAssetCollectionWithGUIDPending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASModelBase *)self statementForString:@"select assetCollectionGUID from PendingAssetCollections where assetCollectionGUID = ? limit 1;"];
  uint64_t v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (!v6)
  {
    int v7 = sqlite3_step(v5);
    BOOL v8 = v7 == 100;
    if ((v7 & 0xFFFFFFFE) == 0x64) {
      goto LABEL_5;
    }
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 870);
  }
  BOOL v8 = 0;
LABEL_5:
  if (v5) {
    sqlite3_reset(v5);
  }
  return v8;
}

- (BOOL)isAssetCollectionWithGUIDPending:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSASPersonModel_isAssetCollectionWithGUIDPending___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __52__MSASPersonModel_isAssetCollectionWithGUIDPending___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueIsAssetCollectionWithGUIDPending:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)countOfEnqueuedCommands
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MSASPersonModel_countOfEnqueuedCommands__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__MSASPersonModel_countOfEnqueuedCommands__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = *(void **)(a1 + 32);
    int v11 = 138543362;
    int v12 = v8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of commands queued", (uint8_t *)&v11, 0xCu);
  }
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select count(*) from CommandQueue;"];
  uint64_t v3 = sqlite3_reset(v2);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4) {
    goto LABEL_4;
  }
  int v5 = sqlite3_step(v2);
  if (v5 != 101)
  {
    if (v5 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = sqlite3_errmsg((sqlite3 *)[v6 dbQueueDB]);
        int v11 = 138543618;
        int v12 = v6;
        __int16 v13 = 2082;
        char v14 = v7;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error counting number of commands enqueued.sqlite error: %{public}s", (uint8_t *)&v11, 0x16u);
      }
LABEL_4:
      sqlite3_reset(v2);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(v2, 0);
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(const char **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v11 = 138543618;
    int v12 = v9;
    __int16 v13 = 2048;
    char v14 = v10;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %lld commands in the queue.", (uint8_t *)&v11, 0x16u);
  }
}

- (int64_t)countOfEnqueuedCommand:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSASPersonModel_countOfEnqueuedCommand___block_invoke;
  block[3] = &unk_1E6C3D000;
  block[4] = self;
  id v10 = v4;
  int v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__MSASPersonModel_countOfEnqueuedCommand___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v15 = 138543618;
    __int16 v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Counting number of queued command %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select count(*) from CommandQueue where command = ?;"];
  uint64_t v3 = sqlite3_bind_text(v2, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4) {
    goto LABEL_5;
  }
  uint64_t v5 = sqlite3_reset(v2);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6) {
    goto LABEL_5;
  }
  int v7 = sqlite3_step(v2);
  if (v7 != 101)
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = sqlite3_errmsg((sqlite3 *)[v12 dbQueueDB]);
        int v15 = 138543874;
        __int16 v16 = v12;
        __int16 v17 = 2114;
        uint64_t v18 = v13;
        __int16 v19 = 2082;
        __int16 v20 = v14;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error counting number of “%{public}@” commands enqueued.sqlite error: %{public}s", (uint8_t *)&v15, 0x20u);
      }
LABEL_5:
      sqlite3_reset(v2);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      return;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v2, 0);
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...found %lld instances.", (uint8_t *)&v15, 0x16u);
  }
}

- (void)purgeCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MSASPersonModel_purgeCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__MSASPersonModel_purgeCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  [*(id *)(a1 + 32) dbQueueRemoveAllEntriesFromTable:@"CommandQueue"];
  [*(id *)(a1 + 32) dbQueueRemoveAllEntriesFromTable:@"PendingCommandQueue"];
  [*(id *)(a1 + 32) dbQueueRemoveAllEntriesFromTable:@"PendingAssetCollections"];
  [*(id *)(a1 + 32) dbQueueRemoveAllEntriesFromTable:@"DownloadQueue"];
  [*(id *)(a1 + 32) dbQueueRemoveAllEntriesFromTable:@"UploadQueue"];
  [*(id *)(a1 + 32) dbQueueEndTransaction];
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    dispatch_async(v3, v2);
  }
}

- (void)dbQueueRemoveAllEntriesFromTable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing all entries from table %{public}@.", buf, 0x16u);
  }
  uint64_t v5 = [NSString stringWithFormat:@"delete from %@;", v4];
  id v6 = [(MSASModelBase *)self statementForString:v5];

  uint64_t v7 = sqlite3_step(v6);
  LODWORD(v5) = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v5 != 101) {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 773);
  }
  if (v6) {
    sqlite3_reset(v6);
  }
}

- (void)dbQueueRemoveCommandIdentifier:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing command at order %lld.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v5 = [(MSASModelBase *)self statementForString:@"delete from CommandQueue where ord = ?;"];
  uint64_t v6 = sqlite3_reset(v5);
  int v7 = v6;
  MSSqliteTrapForDBLockError(v6);
  if (!v7)
  {
    uint64_t v8 = sqlite3_bind_int64(v5, 1, a3);
    int v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      uint64_t v10 = sqlite3_step(v5);
      MSSqliteTrapForDBLockError(v10);
    }
  }
  sqlite3_reset(v5);
}

- (void)removeCommandIdentifier:(int64_t)a3
{
  uint64_t v5 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MSASPersonModel_removeCommandIdentifier___block_invoke;
  v6[3] = &unk_1E6C3DAB0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __43__MSASPersonModel_removeCommandIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueRemoveCommandIdentifier:*(void *)(a1 + 40)];
}

- (void)dbQueueRemoveCommandAtHeadOfQueue
{
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSASPersonModel_dbQueueRemoveCommandAtHeadOfQueue__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __52__MSASPersonModel_dbQueueRemoveCommandAtHeadOfQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 dbQueueSmallestCommandSequenceNumber];
  return [v1 dbQueueRemoveCommandIdentifier:v2];
}

- (void)setParams:(id)a3 forCommandWithIdentifier:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSASPersonModel_setParams_forCommandWithIdentifier___block_invoke;
  block[3] = &unk_1E6C3CE28;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __54__MSASPersonModel_setParams_forCommandWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2048;
    uint64_t v28 = v20;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting parameters for command at sequence number %lld.", buf, 0x16u);
  }
  uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update CommandQueue set params = ? where ord = ?;"];
  uint64_t v3 = sqlite3_reset(v2);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4) {
    goto LABEL_12;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v24 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v24];
  id v7 = v24;
  id v8 = v7;
  if (!v6)
  {
    int v9 = NSString;
    id v10 = [v7 userInfo];
    int64_t v11 = [v9 stringWithFormat:@"Failed to archive a paramsData object. Error: %@ Info: %@", v8, v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  unint64_t v12 = [v6 length];
  if (v12 >= 0x7FFFFFFF) {
    __assert_rtn("-[MSASPersonModel setParams:forCommandWithIdentifier:]_block_invoke", "MSASPersonModel.m", 732, "paramsDataLength < INT_MAX");
  }
  int v13 = v12;
  id v14 = v6;
  uint64_t v15 = sqlite3_bind_blob(v2, 1, (const void *)[v14 bytes], v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  int v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16 || (uint64_t v17 = sqlite3_bind_int64(v2, 2, *(void *)(a1 + 48)), v18 = v17, MSSqliteTrapForDBLockError(v17), v18))
  {

LABEL_12:
    sqlite3_reset(v2);
    return;
  }
  uint64_t v21 = sqlite3_step(v2);
  int v22 = v21;
  MSSqliteTrapForDBLockError(v21);

  sqlite3_reset(v2);
  if (v22 == 101 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v23 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v23;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...done.", buf, 0xCu);
  }
}

- (id)commandWithMinimumIdentifier:(int64_t)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8
{
  id v14 = [NSNumber numberWithLongLong:a3];
  uint64_t v15 = [(MSASPersonModel *)self _commandWithMinimumIdentifier:v14 outParams:a4 outCommandIdentifier:a5 outPersonID:a6 outAlbumGUID:a7 outAssetCollectionGUID:a8];

  return v15;
}

- (id)commandAtHeadOfQueueOutParams:(id *)a3 outCommandIdentifier:(int64_t *)a4 outPersonID:(id *)a5 outAlbumGUID:(id *)a6 outAssetCollectionGUID:(id *)a7
{
  return [(MSASPersonModel *)self _commandWithMinimumIdentifier:0 outParams:a3 outCommandIdentifier:a4 outPersonID:a5 outAlbumGUID:a6 outAssetCollectionGUID:a7];
}

- (id)_commandWithMinimumIdentifier:(id)a3 outParams:(id *)a4 outCommandIdentifier:(int64_t *)a5 outPersonID:(id *)a6 outAlbumGUID:(id *)a7 outAssetCollectionGUID:(id *)a8
{
  id v11 = a3;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__4868;
  id v60 = __Block_byref_object_dispose__4869;
  id v61 = 0;
  uint64_t v50 = 0;
  double v51 = &v50;
  uint64_t v52 = 0x3032000000;
  int v53 = __Block_byref_object_copy__4868;
  id v54 = __Block_byref_object_dispose__4869;
  id v55 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__4868;
  int v44 = __Block_byref_object_dispose__4869;
  id v45 = 0;
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__4868;
  uint64_t v38 = __Block_byref_object_dispose__4869;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__4868;
  uint64_t v32 = __Block_byref_object_dispose__4869;
  id v33 = 0;
  unint64_t v12 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__MSASPersonModel__commandWithMinimumIdentifier_outParams_outCommandIdentifier_outPersonID_outAlbumGUID_outAssetCollectionGUID___block_invoke;
  block[3] = &unk_1E6C3CBC0;
  id v13 = v11;
  id v20 = v13;
  uint64_t v21 = self;
  int v22 = &v56;
  id v23 = &v50;
  id v24 = &v46;
  int v25 = &v40;
  uint64_t v26 = &v34;
  __int16 v27 = &v28;
  dispatch_sync(v12, block);

  if (a4) {
    *a4 = (id) v51[5];
  }
  if (a5) {
    *a5 = v47[3];
  }
  if (a6) {
    *a6 = (id) v41[5];
  }
  if (a7) {
    *a7 = (id) v35[5];
  }
  if (a8) {
    *a8 = (id) v29[5];
  }
  id v14 = (id)v57[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v14;
}

void __128__MSASPersonModel__commandWithMinimumIdentifier_outParams_outCommandIdentifier_outPersonID_outAlbumGUID_outAssetCollectionGUID___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(const char **)(a1 + 32);
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3)
    {
      id v24 = *(void **)(a1 + 40);
      int v27 = 138543618;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      uint64_t v30 = v2;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving command with minimum identifier %{public}@.", (uint8_t *)&v27, 0x16u);
    }
    int v4 = (sqlite3_stmt *)[*(id *)(a1 + 40) statementForString:@"select ord, command, params, personID, albumGUID, assetCollectionGUID from CommandQueue where ord >= ? order by ord limit 1;"];
    uint64_t v5 = sqlite3_bind_int64(v4, 1, [*(id *)(a1 + 32) longLongValue]);
    int v6 = v5;
    MSSqliteTrapForDBLockError(v5);
    if (v6) {
      MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 40) dbQueueDB], *(void *)(a1 + 40), 644);
    }
  }
  else
  {
    if (v3)
    {
      int v25 = *(void **)(a1 + 40);
      int v27 = 138543362;
      uint64_t v28 = v25;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving command at the head of the queue.", (uint8_t *)&v27, 0xCu);
    }
    int v4 = (sqlite3_stmt *)[*(id *)(a1 + 40) statementForString:@"select ord, command, params, personID, albumGUID, assetCollectionGUID from CommandQueue order by ord limit 1;"];
  }
  uint64_t v7 = sqlite3_reset(v4);
  int v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8) {
    goto LABEL_10;
  }
  int v11 = sqlite3_step(v4);
  if (v11 == 101)
  {
    int v16 = 0;
    uint64_t v17 = 0;
    int v18 = 0;
    sqlite3_int64 v12 = 0;
    uint64_t v15 = 0;
    id v10 = 0;
  }
  else
  {
    if (v11 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v22 = *(void **)(a1 + 40);
        id v23 = sqlite3_errmsg((sqlite3 *)[v22 dbQueueDB]);
        int v27 = 138543618;
        uint64_t v28 = v22;
        __int16 v29 = 2082;
        uint64_t v30 = v23;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving command at the head of the queue. sqlite error: %{public}s", (uint8_t *)&v27, 0x16u);
      }
LABEL_10:
      sqlite3_reset(v4);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
      goto LABEL_18;
    }
    sqlite3_int64 v12 = sqlite3_column_int64(v4, 0);
    id v10 = MSSqliteStringFromStatementColumn(v4, 1);
    id v13 = sqlite3_column_blob(v4, 2);
    id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v13, sqlite3_column_bytes(v4, 2), 0);
    uint64_t v15 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v14 outError:0];
    int v16 = MSSqliteStringFromStatementColumn(v4, 3);
    uint64_t v17 = MSSqliteStringFromStatementColumn(v4, 4);
    int v18 = MSSqliteStringFromStatementColumn(v4, 5);
  }
  sqlite3_reset(v4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v16);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v17);
  uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
  id v21 = v18;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = *(void **)(a1 + 40);
    int v27 = 138544642;
    uint64_t v28 = v26;
    __int16 v29 = 2114;
    uint64_t v30 = (const char *)v10;
    __int16 v31 = 2048;
    sqlite3_int64 v32 = v12;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    __int16 v35 = 2114;
    uint64_t v36 = v17;
    __int16 v37 = 2112;
    id v38 = v21;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved command %{public}@ at sequence number %lld for personID %@, album GUID %{public}@,  asset collection GUID %@", (uint8_t *)&v27, 0x3Eu);
  }

LABEL_18:
}

- (void)dbQueueRequeuePendingCommandsWithAlbumGUID:(id)a3
{
  id v10 = a3;
  int v4 = [(MSASModelBase *)self statementForString:@"select command, params, personID, albumGUID, assetCollectionGUID from PendingCommandQueue where albumGUID = ?;"];
  uint64_t v5 = MSSqliteBindStringOrNull(v4, 1, v10);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 613);
    uint64_t v7 = 0;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v7 = [(MSASModelBase *)self statementForString:@"delete from PendingCommandQueue where albumGUID = ?;"];
  uint64_t v8 = MSSqliteBindStringOrNull(v7, 1, v10);
  int v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 616);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(MSASPersonModel *)self dbQueueRequeuePendingCommandsWithQueryStatement:v4 deleteStatement:v7];
  if (v4) {
LABEL_6:
  }
    sqlite3_reset(v4);
LABEL_7:
  if (v7) {
    sqlite3_reset(v7);
  }
}

- (void)dbQueueRequeuePendingCommandsWithAssetCollectionGUID:(id)a3
{
  id v10 = a3;
  int v4 = [(MSASModelBase *)self statementForString:@"select command, params, personID, albumGUID, assetCollectionGUID from PendingCommandQueue where assetCollectionGUID = ?;"];
  uint64_t v5 = MSSqliteBindStringOrNull(v4, 1, v10);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 597);
    uint64_t v7 = 0;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v7 = [(MSASModelBase *)self statementForString:@"delete from PendingCommandQueue where AssetCollectionGUID = ?;"];
  uint64_t v8 = MSSqliteBindStringOrNull(v7, 1, v10);
  int v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 600);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(MSASPersonModel *)self dbQueueRequeuePendingCommandsWithQueryStatement:v4 deleteStatement:v7];
  if (v4) {
LABEL_6:
  }
    sqlite3_reset(v4);
LABEL_7:
  if (v7) {
    sqlite3_reset(v7);
  }
}

- (void)dbQueueRequeuePendingCommandsWithQueryStatement:(sqlite3_stmt *)a3 deleteStatement:(sqlite3_stmt *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(MSASModelBase *)self beginTransaction];
  int64_t v36 = [(MSASPersonModel *)self dbQueueNextCommandSequenceNumber];
  int v6 = [(MSASModelBase *)self statementForString:@"insert into CommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"];
  int v7 = sqlite3_step(a3);
  while (v7 == 100)
  {
    uint64_t v8 = MSSqliteStringFromStatementColumn(a3, 0);
    int v9 = MSSqliteDataFromStatementColumn(a3, 1);
    id v10 = MSSqliteStringFromStatementColumn(a3, 2);
    int v11 = MSSqliteStringFromStatementColumn(a3, 3);
    sqlite3_int64 v12 = MSSqliteStringFromStatementColumn(a3, 4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      id v38 = self;
      __int16 v39 = 2114;
      uint64_t v40 = v8;
      __int16 v41 = 2048;
      int64_t v42 = v36;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Requeueing pended command: %{public}@ at position %lld", buf, 0x20u);
    }
    uint64_t v13 = sqlite3_reset(v6);
    int v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (v14)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 573;
LABEL_22:
      MSLogSqliteError(v15, (uint64_t)v16, v17);
      char v32 = 0;
      int v7 = 100;
      goto LABEL_23;
    }
    uint64_t v18 = sqlite3_bind_int64(v6, 1, v36);
    int v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (v19)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 574;
      goto LABEL_22;
    }
    uint64_t v20 = MSSqliteBindStringOrNull(v6, 2, v8);
    int v21 = v20;
    MSSqliteTrapForDBLockError(v20);
    if (v21)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 575;
      goto LABEL_22;
    }
    uint64_t v22 = MSSqliteBindDataOrNull(v6, 3, v9);
    int v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (v23)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 576;
      goto LABEL_22;
    }
    uint64_t v24 = MSSqliteBindStringOrNull(v6, 4, v10);
    int v25 = v24;
    MSSqliteTrapForDBLockError(v24);
    if (v25)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 577;
      goto LABEL_22;
    }
    uint64_t v26 = MSSqliteBindStringOrNull(v6, 5, v11);
    int v27 = v26;
    MSSqliteTrapForDBLockError(v26);
    if (v27)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 578;
      goto LABEL_22;
    }
    uint64_t v28 = MSSqliteBindStringOrNull(v6, 6, v12);
    int v29 = v28;
    MSSqliteTrapForDBLockError(v28);
    if (v29)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 579;
      goto LABEL_22;
    }
    uint64_t v30 = sqlite3_step(v6);
    int v31 = v30;
    MSSqliteTrapForDBLockError(v30);
    if (v31 != 101)
    {
      uint64_t v15 = [(MSASModelBase *)self dbQueueDB];
      int v16 = self;
      int v17 = 580;
      goto LABEL_22;
    }
    ++v36;
    int v7 = sqlite3_step(a3);
    char v32 = 1;
LABEL_23:

    if ((v32 & 1) == 0) {
      goto LABEL_27;
    }
  }
  uint64_t v33 = sqlite3_step(a4);
  int v34 = v33;
  MSSqliteTrapForDBLockError(v33);
  if (v34 != 101) {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 586);
  }
LABEL_27:
  if (v6) {
    sqlite3_reset(v6);
  }
  [(MSASModelBase *)self endTransaction];
}

- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 pendingOnAssetCollectionGUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__MSASPersonModel_enqueueCommand_params_personID_albumGUID_pendingOnAssetCollectionGUID___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  v23[4] = self;
  id v24 = v16;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(v17, v23);
}

void __89__MSASPersonModel_enqueueCommand_params_personID_albumGUID_pendingOnAssetCollectionGUID___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) dbQueueIsAssetCollectionWithGUIDPending:*(void *)(a1 + 40)])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      __int16 v37 = v21;
      __int16 v38 = 2114;
      uint64_t v39 = v22;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing pending command “%{public}@”.", buf, 0x16u);
    }
    uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select max(ord) from PendingCommandQueue;"];
    int v3 = sqlite3_step(v2);
    if (v3 == 101)
    {
      sqlite3_int64 v4 = 0;
      if (!v2) {
        goto LABEL_13;
      }
    }
    else
    {
      if (v3 != 100)
      {
        MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 526);
        goto LABEL_18;
      }
      sqlite3_int64 v4 = sqlite3_column_int(v2, 0) + 1;
      if (!v2)
      {
LABEL_13:
        uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"insert into PendingCommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"];
        uint64_t v11 = sqlite3_bind_int64(v2, 1, v4);
        int v12 = v11;
        MSSqliteTrapForDBLockError(v11);
        if (!v12)
        {
          uint64_t v13 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
          int v14 = v13;
          MSSqliteTrapForDBLockError(v13);
          if (!v14)
          {
            uint64_t v15 = *(void *)(a1 + 56);
            id v35 = 0;
            id v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v35];
            id v17 = v35;
            id v18 = v17;
            if (v16)
            {
              id v19 = v2;
              id v20 = v16;
            }
            else
            {
              int v23 = NSString;
              id v24 = [v17 userInfo];
              id v25 = [v23 stringWithFormat:@"Failed to archive params object. Error: %@ Info: %@", v18, v24];

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                __int16 v37 = v25;
                _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
              }

              id v19 = v2;
              id v20 = 0;
            }
            uint64_t v26 = MSSqliteBindDataOrNull(v19, 3, v20);
            int v27 = v26;
            MSSqliteTrapForDBLockError(v26);
            if (!v27)
            {
              uint64_t v28 = MSSqliteBindStringOrNull(v2, 4, *(id *)(a1 + 64));
              int v29 = v28;
              MSSqliteTrapForDBLockError(v28);
              if (!v29)
              {
                uint64_t v30 = MSSqliteBindStringOrNull(v2, 5, *(id *)(a1 + 72));
                int v31 = v30;
                MSSqliteTrapForDBLockError(v30);
                if (!v31)
                {
                  uint64_t v32 = MSSqliteBindStringOrNull(v2, 6, *(id *)(a1 + 40));
                  int v33 = v32;
                  MSSqliteTrapForDBLockError(v32);
                  if (!v33)
                  {
                    uint64_t v34 = sqlite3_step(v2);
                    MSSqliteTrapForDBLockError(v34);
                  }
                }
              }
            }

            if (!v2) {
              return;
            }
LABEL_19:
            sqlite3_reset(v2);
            return;
          }
        }
LABEL_18:
        if (!v2) {
          return;
        }
        goto LABEL_19;
      }
    }
    sqlite3_reset(v2);
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  int v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  [v9 dbQueueEnqueueCommand:v5 params:v6 personID:v7 albumGUID:v8 assetCollectionGUID:v10];
}

- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7 sequenceNumber:(int64_t)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v41 = self;
    __int16 v42 = 2114;
    id v43 = v14;
    __int16 v44 = 2048;
    int64_t v45 = a8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueueing command %{public}@ at sequence number %lld.", buf, 0x20u);
  }
  id v19 = [(MSASModelBase *)self statementForString:@"insert into CommandQueue (ord, command, params, personID, albumGUID, assetCollectionGUID) values (?, ?, ?, ?, ?, ?);"];
  uint64_t v20 = sqlite3_bind_int64(v19, 1, a8);
  int v21 = v20;
  MSSqliteTrapForDBLockError(v20);
  if (!v21)
  {
    uint64_t v22 = MSSqliteBindStringOrNull(v19, 2, v14);
    int v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (!v23)
    {
      id v39 = 0;
      id v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v39];
      id v25 = v39;
      uint64_t v26 = v25;
      if (v24)
      {
        uint64_t v27 = MSSqliteBindDataOrNull(v19, 3, v24);
      }
      else
      {
        uint64_t v28 = NSString;
        int v29 = [v25 userInfo];
        uint64_t v30 = [v28 stringWithFormat:@"Failed to archive params object. Error: %@ Info: %@", v26, v29];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v41 = v30;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        uint64_t v27 = sqlite3_bind_null(v19, 3);
      }
      int v31 = v27;
      MSSqliteTrapForDBLockError(v27);
      if (!v31)
      {
        uint64_t v32 = MSSqliteBindStringOrNull(v19, 4, v16);
        int v33 = v32;
        MSSqliteTrapForDBLockError(v32);
        if (!v33)
        {
          uint64_t v34 = MSSqliteBindStringOrNull(v19, 5, v17);
          int v35 = v34;
          MSSqliteTrapForDBLockError(v34);
          if (!v35)
          {
            uint64_t v36 = MSSqliteBindStringOrNull(v19, 6, v18);
            int v37 = v36;
            MSSqliteTrapForDBLockError(v36);
            if (!v37)
            {
              uint64_t v38 = sqlite3_step(v19);
              MSSqliteTrapForDBLockError(v38);
            }
          }
        }
      }
    }
  }
  if (v19) {
    sqlite3_reset(v19);
  }
}

- (void)enqueueCommandAtHeadOfQueue:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__MSASPersonModel_enqueueCommandAtHeadOfQueue_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __93__MSASPersonModel_enqueueCommandAtHeadOfQueue_params_personID_albumGUID_assetCollectionGUID___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  uint64_t v7 = [v1 dbQueueSmallestCommandSequenceNumber] - 1;
  return [v1 dbQueueEnqueueCommand:v2 params:v3 personID:v4 albumGUID:v5 assetCollectionGUID:v6 sequenceNumber:v7];
}

- (void)enqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__MSASPersonModel_enqueueCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __80__MSASPersonModel_enqueueCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueEnqueueCommand:*(void *)(a1 + 40) params:*(void *)(a1 + 48) personID:*(void *)(a1 + 56) albumGUID:*(void *)(a1 + 64) assetCollectionGUID:*(void *)(a1 + 72)];
}

- (void)dbQueueEnqueueCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x1E019E3B0]();
  [(MSASPersonModel *)self dbQueueEnqueueCommand:v17 params:v12 personID:v13 albumGUID:v14 assetCollectionGUID:v15 sequenceNumber:[(MSASPersonModel *)self dbQueueNextCommandSequenceNumber]];
}

- (int64_t)dbQueueSmallestCommandSequenceNumber
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSASModelBase *)self statementForString:@"select min(ord) from CommandQueue;"];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5)
  {
LABEL_2:
    sqlite3_reset(v3);
    return 0;
  }
  int v7 = sqlite3_step(v3);
  if (v7 == 101)
  {
    sqlite3_int64 v6 = 0;
  }
  else
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543618;
        uint64_t v10 = self;
        __int16 v11 = 2082;
        id v12 = sqlite3_errmsg([(MSASModelBase *)self dbQueueDB]);
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve next command sequence number. sqlite error: %{public}s", (uint8_t *)&v9, 0x16u);
      }
      goto LABEL_2;
    }
    sqlite3_int64 v6 = sqlite3_column_int64(v3, 0);
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    id v12 = (const char *)v6;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...smallest command number: %lld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (int64_t)dbQueueNextCommandSequenceNumber
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSASModelBase *)self statementForString:@"select max(ord) from CommandQueue;"];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5)
  {
LABEL_2:
    sqlite3_reset(v3);
    return 0;
  }
  int v7 = sqlite3_step(v3);
  if (v7 == 101)
  {
    int64_t v6 = 0;
  }
  else
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543618;
        uint64_t v10 = self;
        __int16 v11 = 2082;
        id v12 = sqlite3_errmsg([(MSASModelBase *)self dbQueueDB]);
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve next command sequence number. sqlite error: %{public}s", (uint8_t *)&v9, 0x16u);
      }
      goto LABEL_2;
    }
    int64_t v6 = sqlite3_column_int64(v3, 0) + 1;
  }
  sqlite3_reset(v3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    id v12 = (const char *)v6;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...next command sequence: %lld", (uint8_t *)&v9, 0x16u);
  }
  return v6;
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)MSASPersonModel;
  unsigned int v6 = [(MSASModelBase *)&v11 dbQueueUpgradeFromDatabaseVersion:*(void *)&a3 currentVersion:*(void *)&a4];
  if (v6)
  {
    if (a3 < 0)
    {
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists CommandQueue (\n   ord                   integer,\n   command               text,\n   params                blob,\n   personID              text,\n   albumGUID             text,\n   assetCollectionGUID   text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create person model command queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists CommandQueueByOrder on CommandQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create command queueindex. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists PendingCommandQueue (\n   ord                   integer,\n   command               text,\n   params                blob,\n   personID              text,\n   albumGUID             text,\n   assetCollectionGUID   text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create person model pending command queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists PendingCommandQueueByOrder on PendingCommandQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create pending command queue index. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists PendingAssetCollections (\n   assetCollectionGUID   text unique,\n   albumGUID             text\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create person model pending asset collections table. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists DownloadQueue (\n  ord                  integer,\n  isThumbnail          integer default 0,\n  isInflight           integer default 0,\n  GUID                 text,\n  albumGUID            text,\n  assetCollectionGUID  text,\n  batchCreationDate    real,\n  photoCreationDate    real,\n  errorCount           integer default 0,\n  album                blob,\n  object               blob\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create download queue tables. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueGeneralOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate asc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
        goto LABEL_46;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueGeneralReverseOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate desc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
        goto LABEL_13;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists UploadQueue (\n  ord                  integer,\n  uploadPriority       integer default 0,\n  GUID                 text,\n  albumGUID            text,\n  errorCount           integer default 0,\n  album                blob,\n  object               blob\n);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create upload queue tables. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists UploadQueueByOrder on UploadQueue (ord asc);",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not create upload queue order index. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists UploadQueueByGUID on UploadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
        goto LABEL_40;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueByGUID on DownloadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
        goto LABEL_98;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_107;
    }
    if (a3 <= 2)
    {
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table DownloadQueue add column batchCreationDate real;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_6:
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not add download queue column. Error: %{public}s";
LABEL_99:
          _os_log_error_impl(&dword_1DC434000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
        }
LABEL_100:
        sqlite3_free(errmsg);
        goto LABEL_101;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table DownloadQueue add column photoCreationDate real;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_6;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueGeneralOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate asc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
LABEL_46:
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        id v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create download queue index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_11;
    }
    if (a3 == 3)
    {
LABEL_11:
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueGeneralReverseOrder on DownloadQueue (isThumbnail asc, albumGUID asc, batchCreationDate desc, photoCreationDate asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
LABEL_13:
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        id v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create download queue reverse index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_31;
    }
    if (a3 <= 4)
    {
LABEL_31:
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table PendingAssetCollections add column albumGUID text;",
             0,
             0,
             &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not add albumGUID column to pending asset collections queue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_38;
    }
    if (a3 == 5)
    {
LABEL_38:
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists UploadQueueByGUID on UploadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
LABEL_40:
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        id v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create upload queue GUID index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists DownloadQueueByGUID on DownloadQueue (GUID asc);",
             0,
             0,
             &errmsg))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_100;
        }
LABEL_98:
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        id v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create download queue GUID index. Error: %{public}s";
        goto LABEL_99;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_61;
    }
    if (a3 <= 6)
    {
LABEL_61:
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table UploadQueue add column uploadPriority integer", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not add uploadPriority column to UploadQueue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table DownloadQueue drop column album", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not drop album column in DownloadQueue. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        sqlite3_free(errmsg);
      }
      goto LABEL_72;
    }
    if (a3 == 8)
    {
LABEL_107:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (a3 == 7)
    {
LABEL_72:
      errmsg = 0;
      if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table DownloadQueue add column isInflight integer", 0, 0, &errmsg))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          id v15 = errmsg;
          int v7 = MEMORY[0x1E4F14500];
          uint64_t v8 = "%{public}@: Could not add isInflight column to DownloadQueue. Error: %{public}s";
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      goto LABEL_107;
    }
    unsigned int v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 1024;
      LODWORD(v15) = a3;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not supporting migration from version %d. Recreating database.", buf, 0x12u);
LABEL_101:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (MSASPersonModel)initWithPersonID:(id)a3
{
  id v4 = a3;
  int v5 = MSPathAlbumSharingPersistentStoreForPersonID(v4);
  v8.receiver = self;
  v8.super_class = (Class)MSASPersonModel;
  unsigned int v6 = [(MSASModelBase *)&v8 initWithPersonID:v4 databasePath:v5 currentVersion:8];

  return v6;
}

@end