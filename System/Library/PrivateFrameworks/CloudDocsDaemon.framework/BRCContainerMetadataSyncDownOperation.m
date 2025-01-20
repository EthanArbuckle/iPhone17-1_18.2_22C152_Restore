@interface BRCContainerMetadataSyncDownOperation
- (BOOL)shouldFetchAnotherBatch;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCContainerMetadataSyncDownOperation)initWithSession:(id)a3 state:(id)a4;
- (id)createActivity;
- (void)_completedWithServerChangeToken:(id)a3 requestID:(unint64_t)a4;
- (void)main;
- (void)performAfterCreatingZoneIfNeeded:(id)a3;
- (void)performAfterFetchingAssetContents:(id)a3;
- (void)performAfterFetchingRecordChanges:(id)a3;
@end

@implementation BRCContainerMetadataSyncDownOperation

- (BRCContainerMetadataSyncDownOperation)initWithSession:(id)a3 state:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 cloudDocsClientZone];
  v10 = [v9 defaultAppLibrary];
  v11 = [v10 transferSyncContext];

  v15.receiver = self;
  v15.super_class = (Class)BRCContainerMetadataSyncDownOperation;
  v12 = [(_BRCOperation *)&v15 initWithName:@"sync-down/container-metadata" syncContext:v11 sessionContext:v7];
  v13 = v12;
  if (v12)
  {
    [(_BRCOperation *)v12 setNonDiscretionary:[(BRCContainerMetadataSyncPersistedState *)v12->_state hasCaughtUpAtLeastOnce] ^ 1];
    objc_storeStrong((id *)&v13->_session, a3);
    objc_storeStrong((id *)&v13->_state, a4);
  }

  return v13;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sync-down/container-metadata", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)performAfterCreatingZoneIfNeeded:(id)a3
{
  v9 = (void (**)(id, void))a3;
  v4 = [(BRCContainerMetadataSyncPersistedState *)self->_state serverChangeToken];

  if (v4)
  {
    v9[2](v9, 0);
  }
  else
  {
    v5 = [BRCCreateZoneAndSubscribeOperation alloc];
    session = self->_session;
    id v7 = objc_msgSend(MEMORY[0x1E4F1A320], "brc_containerMetadataZoneID");
    id v8 = [(BRCCreateZoneAndSubscribeOperation *)v5 initWithSession:session zoneID:v7];

    [(BRCCreateZoneAndSubscribeOperation *)v8 setOptimisticSubscribe:1];
    [(BRCCreateZoneAndSubscribeOperation *)v8 setCreateZoneAndSubscribeCompletionBlock:v9];
    [(_BRCOperation *)self addSubOperation:v8];
  }
}

- (void)performAfterFetchingRecordChanges:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  char v54 = 0;
  v5 = objc_msgSend(MEMORY[0x1E4F1A320], "brc_containerMetadataZoneID");
  v6 = objc_opt_new();
  id v7 = +[BRCUserDefaults defaultsForMetadataContainer];
  objc_msgSend(v6, "setResultsLimit:", objc_msgSend(v7, "maxRecordCountInFetchRecordsOperation"));

  id v8 = BRContainerIconCKAssetKeys();
  v9 = [v8 allObjects];
  v10 = [v9 arrayByAddingObject:@"infoPlist"];
  [v6 setDesiredKeys:v10];

  v11 = [(BRCContainerMetadataSyncPersistedState *)self->_state serverChangeToken];
  [v6 setPreviousServerChangeToken:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F1A070]);
  v59[0] = v5;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  v57 = v5;
  v58 = v6;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  objc_super v15 = (void *)[v12 initWithRecordZoneIDs:v13 optionsByRecordZoneID:v14];

  v16 = objc_opt_new();
  [v15 setConfiguration:v16];

  v17 = [v15 configuration];
  [v17 setSourceApplicationBundleIdentifier:*MEMORY[0x1E4F59408]];

  [v15 setShouldFetchAssetContents:0];
  long long v49 = 0uLL;
  uint64_t v50 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCContainerMetadataSyncDownOperation performAfterFetchingRecordChanges:]", 149, &v49);
  v18 = brc_bread_crumbs();
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v56 = v18;
    _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx starting fetch container-metadata changes operation %@%@", buf, 0x20u);
  }

  long long v51 = v49;
  uint64_t v52 = v50;
  [v15 setFetchAllChanges:0];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke;
  v46[3] = &unk_1E69969C0;
  long long v47 = v51;
  uint64_t v48 = v52;
  v46[4] = self;
  v46[5] = v53;
  [v15 setRecordChangedBlock:v46];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v56) = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_18;
  v39[3] = &unk_1E6996A10;
  long long v44 = v51;
  uint64_t v45 = v52;
  v42 = buf;
  v39[4] = self;
  id v20 = v5;
  id v40 = v20;
  v43 = v53;
  id v21 = v4;
  id v41 = v21;
  [v15 setRecordZoneFetchCompletionBlock:v39];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2;
  v34 = &unk_1E6996A38;
  long long v37 = v51;
  uint64_t v38 = v52;
  v36 = buf;
  id v22 = v21;
  id v35 = v22;
  [v15 setFetchRecordZoneChangesCompletionBlock:&v31];
  v23 = [MEMORY[0x1E4F1CA48] array];
  recordIDsForDesiredAssets = self->_recordIDsForDesiredAssets;
  self->_recordIDsForDesiredAssets = v23;

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"infoPlist", 0, v31, v32, v33, v34);
  v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  desiredKeysForDesiredAssets = self->_desiredKeysForDesiredAssets;
  self->_desiredKeysForDesiredAssets = v25;

  v27 = [MEMORY[0x1E4F1CA60] dictionary];
  recordIDsToVersionETagsForDesiredAssets = self->_recordIDsToVersionETagsForDesiredAssets;
  self->_recordIDsToVersionETagsForDesiredAssets = v27;

  v29 = [MEMORY[0x1E4F1CA80] set];
  containerIDsUpdated = self->_containerIDsUpdated;
  self->_containerIDsUpdated = v29;

  [(_BRCOperation *)self addSubOperation:v15];
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v53, 8);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v55 = *(_OWORD *)(a1 + 48);
  uint64_t v56 = *(void *)(a1 + 64);
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  long long v47 = v3;
  uint64_t v48 = a1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [v3 recordID];
    v33 = [v3 allKeys];
    v34 = [v3 recordChangeTag];
    id v35 = [v3 modifiedByDevice];
    *(_DWORD *)buf = 134219266;
    uint64_t v59 = v55;
    __int16 v60 = 2112;
    v61 = v32;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v33;
    __int16 v64 = 2112;
    v65 = v34;
    __int16 v66 = 2112;
    v67 = v35;
    __int16 v68 = 2112;
    v69 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got container-metadata changes for %@ keys:%@ changeTag:%@ modified:%@%@", buf, 0x3Eu);
  }
  v6 = [v3 recordID];
  uint64_t v46 = [v6 recordName];

  id v7 = (void *)v46;
  if ([MEMORY[0x1E4F594E8] validateContainerID:v46])
  {
    char v54 = 0;
    uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v46];
    id v8 = objc_msgSend(*(id *)(*(void *)(v48 + 32) + 504), "getOrCreateAppLibraryAndPrivateZonesIfNecessary:appLibraryExists:");
    v9 = v8;
    *(unsigned char *)(*(void *)(*(void *)(v48 + 40) + 8) + 24) = 1;
    if (!v8)
    {
LABEL_19:

      id v7 = (void *)v46;
      goto LABEL_20;
    }
    v10 = *(void **)(*(void *)(v48 + 32) + 544);
    v11 = [v8 appLibraryID];
    [v10 addObject:v11];

    uint64_t v12 = objc_msgSend(v47, "brc_containerMetadataPropertiesData");
    v43 = (void *)v12;
    if (v12)
    {
      id v53 = 0;
      long long v44 = objc_msgSend(MEMORY[0x1E4F28F98], "propertyListWithData:options:format:error:", v12, 0, 0, &v53, v12);
      id v13 = v53;
      if (!v13)
      {
        id v20 = brc_bread_crumbs();
        id v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v59 = (uint64_t)v44;
          __int16 v60 = 2112;
          v61 = v45;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v20;
          _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] received container-metadata properties plist %@ for %@%@", buf, 0x20u);
        }

        if (![MEMORY[0x1E4F594A8] isDocumentScopePublicWithProperties:v44 mangledID:v45])
        {
          uint64_t v17 = 1;
          goto LABEL_15;
        }
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v14 = objc_msgSend(v47, "brc_containerMetadataIconNames");
        uint64_t v17 = 0;
        uint64_t v22 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v50 != v23) {
                objc_enumerationMutation(v14);
              }
              v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v26 = [v9 containerMetadata];
              char v27 = [v26 hasIconWithName:v25];

              if ((v27 & 1) == 0)
              {
                uint64_t v17 = brc_bread_crumbs();
                v28 = brc_default_log();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v31 = [v9 appLibraryID];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v59 = (uint64_t)v25;
                  __int16 v60 = 2112;
                  v61 = v31;
                  __int16 v62 = 2112;
                  uint64_t v63 = v17;
                  _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] we'll download icon %@ for container %@%@", buf, 0x20u);
                }
                v29 = *(void **)(*(void *)(v48 + 32) + 528);
                v30 = BRContainerIconCKAssetKeyForName();
                [v29 addObject:v30];

                LOBYTE(v17) = 1;
              }
            }
            uint64_t v22 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v22);

          if (v17)
          {
            uint64_t v38 = *(void **)(*(void *)(v48 + 32) + 520);
            v39 = [v47 recordID];
            [v38 addObject:v39];

            id v40 = *(void **)(*(void *)(v48 + 32) + 536);
            id v41 = [v47 etag];
            v42 = [v47 recordID];
            [v40 setObject:v41 forKey:v42];

LABEL_18:
            goto LABEL_19;
          }
          uint64_t v17 = 0;
LABEL_15:
          v18 = brc_bread_crumbs();
          v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v36 = [v47 recordID];
            long long v37 = [v47 recordChangeTag];
            *(_DWORD *)buf = 138412802;
            uint64_t v59 = (uint64_t)v36;
            __int16 v60 = 2112;
            v61 = v37;
            __int16 v62 = 2112;
            uint64_t v63 = (uint64_t)v18;
            _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] updating container-metadata %@ at etag:%@ (no asset downloaded)%@", buf, 0x20u);
          }
          [v9 _updateContainerMetadataFromRecord:v47 stripIcons:v17];
          goto LABEL_18;
        }
LABEL_14:

        goto LABEL_15;
      }
      v14 = v13;
      objc_super v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = v46;
        __int16 v60 = 2112;
        v61 = v14;
        __int16 v62 = 2112;
        uint64_t v63 = (uint64_t)v15;
        _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] failed parsing container-metadata plist for container %@: %@%@", buf, 0x20u);
      }
    }
    else
    {
      v14 = brc_bread_crumbs();
      objc_super v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_cold_1();
      }
      long long v44 = 0;
    }

    uint64_t v17 = 1;
    goto LABEL_14;
  }
LABEL_20:

  __brc_leave_section((uint64_t *)&v55);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_18(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  long long v30 = *(_OWORD *)(a1 + 72);
  uint64_t v31 = *(void *)(a1 + 88);
  objc_super v15 = brc_bread_crumbs();
  v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219266;
    uint64_t v33 = v30;
    if (a5) {
      uint64_t v23 = "no";
    }
    else {
      uint64_t v23 = "yes";
    }
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2080;
    long long v37 = v23;
    __int16 v38 = 2112;
    id v39 = v13;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 2112;
    v43 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx container-metadata receieved server change token %@, caught-up:%s client change token %@ error:%@%@", buf, 0x3Eu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 552) = a5;
  uint64_t v17 = objc_msgSend(v14, "brc_cloudKitErrorForZone:", *(void *)(a1 + 40));
  v18 = [*(id *)(*(void *)(a1 + 32) + 504) clientTruthWorkloop];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_21;
  v24[3] = &unk_1E69969E8;
  uint64_t v29 = *(void *)(a1 + 64);
  v24[4] = *(void *)(a1 + 32);
  id v25 = v13;
  id v19 = *(id *)(a1 + 48);
  id v27 = v17;
  id v28 = v19;
  id v26 = v12;
  id v20 = v17;
  id v21 = v12;
  id v22 = v13;
  dispatch_async(v18, v24);

  __brc_leave_section((uint64_t *)&v30);
}

uint64_t __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_21(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    os_activity_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) containerScheduler];
    [v2 scheduleSyncDownForSharedDatabaseImmediately:1];
  }
  [*(id *)(a1 + 40) bytes];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  id v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2_cold_1();
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
  }
  __brc_leave_section((uint64_t *)&v6);
}

- (void)performAfterFetchingAssetContents:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:self->_recordIDsForDesiredAssets];
  [v5 setRecordIDsToVersionETags:self->_recordIDsToVersionETagsForDesiredAssets];
  [v5 setDesiredKeys:self->_desiredKeysForDesiredAssets];
  long long v6 = [v5 operationID];
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCContainerMetadataSyncDownOperation performAfterFetchingAssetContents:]", 249, &v26);
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    recordIDsForDesiredAssets = self->_recordIDsForDesiredAssets;
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v29 = recordIDsForDesiredAssets;
    __int16 v30 = 2112;
    uint64_t v31 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx adding sub-operation to fetch asset contents: %@ for records: %@%@", buf, 0x2Au);
  }

  *(void *)&buf[16] = v27;
  *(_OWORD *)buf = v26;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke;
  v23[3] = &unk_1E6996A60;
  long long v24 = v26;
  uint64_t v25 = v27;
  v23[4] = self;
  [v5 setPerRecordCompletionBlock:v23];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_30;
  v18 = &unk_1E6996A88;
  long long v21 = *(_OWORD *)buf;
  uint64_t v22 = *(void *)&buf[16];
  id v19 = v6;
  id v20 = v4;
  id v9 = v4;
  id v10 = v6;
  [v5 setFetchRecordsCompletionBlock:&v15];
  id v11 = self->_recordIDsForDesiredAssets;
  self->_recordIDsForDesiredAssets = 0;

  desiredKeysForDesiredAssets = self->_desiredKeysForDesiredAssets;
  self->_desiredKeysForDesiredAssets = 0;

  recordIDsToVersionETagsForDesiredAssets = self->_recordIDsToVersionETagsForDesiredAssets;
  self->_recordIDsToVersionETagsForDesiredAssets = 0;

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5, v15, v16, v17, v18);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v31 = *(_OWORD *)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 56);
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v34 = (void *)v31;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v9;
    __int16 v39 = 2112;
    __int16 v40 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx per record callback: %@ - %@%@", buf, 0x2Au);
  }

  if (objc_msgSend(v9, "brc_isCloudKitUnknownItemError"))
  {
    id v12 = *(void **)(*(void *)(a1 + 32) + 504);
    id v13 = objc_alloc(MEMORY[0x1E4F594E8]);
    id v14 = [v8 zoneID];
    uint64_t v15 = (void *)[v13 initWithRecordZoneID:v14];
    uint64_t v16 = [v12 clientZoneByMangledID:v15];
    uint64_t v17 = [v16 enhancedDrivePrivacyEnabled];

    v18 = [*(id *)(*(void *)(a1 + 32) + 504) analyticsReporter];
    id v19 = +[AppTelemetryTimeSeriesEvent newMissingAssetContentEventWithRecordID:v8 enhancedDrivePrivacyEnabled:v17];
    [v18 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v19];
  }
  if (!v9)
  {
    id v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_2();
    }

    uint64_t v22 = [v7 recordID];
    uint64_t v23 = [v22 recordName];

    long long v24 = [*(id *)(*(void *)(a1 + 32) + 504) appLibraryByID:v23];
    if (v24)
    {
      uint64_t v25 = brc_bread_crumbs();
      long long v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = [v7 recordID];
        __int16 v30 = [v7 recordChangeTag];
        *(_DWORD *)buf = 138412802;
        __int16 v34 = v29;
        __int16 v35 = 2112;
        id v36 = v30;
        __int16 v37 = 2112;
        id v38 = v25;
        _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] updating container metadata %@ at etag:%@ (after asset download)%@", buf, 0x20u);
      }
      [v24 _updateContainerMetadataFromRecord:v7 stripIcons:0];
    }
    else
    {
      uint64_t v27 = brc_bread_crumbs();
      id v28 = brc_default_log();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
        __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_1();
      }
    }
  }
  __brc_leave_section((uint64_t *)&v31);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 64);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished %@%@", buf, 0x20u);
  }

  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v5 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] fetched %lu containers metadata from the cloud - %@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t *)&v13);
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "brc_isResetError"))
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCContainerMetadataSyncDownOperation;
    BOOL v5 = [(_BRCOperation *)&v7 shouldRetryForError:v4];
  }

  return v5;
}

- (void)_completedWithServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v6 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  objc_super v7 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke;
  block[3] = &unk_1E6995A58;
  block[4] = self;
  long long v13 = v15;
  unint64_t v14 = a4;
  id v8 = v6;
  id v12 = v8;
  dispatch_async_and_wait(v7, block);

  id v9 = [(_BRCOperation *)self callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_37;
  v10[3] = &unk_1E6996218;
  v10[4] = self;
  v10[5] = v15;
  dispatch_async(v9, v10);

  _Block_object_dispose(v15, 8);
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1[4] + 544);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1D9438760]();
        id v9 = [*(id *)(a1[4] + 504) appLibraryByID:v7];
        id v10 = [v9 defaultClientZone];
        int v11 = [v10 recomputeAppSyncBlockState];

        if (v11) {
          atomic_store(1u, (unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v4);
  }

  id v12 = *(void **)(a1[4] + 504);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2;
  v18[3] = &__block_descriptor_40_e23_B16__0__BRCAppLibrary_8l;
  v18[4] = a1[7];
  [v12 enumerateAppLibraries:v18];
  long long v13 = brc_bread_crumbs();
  unint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[7];
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] remembering container-metadata server change token %@ requestID %llu%@", buf, 0x20u);
  }

  return [*(id *)(a1[4] + 512) updateWithServerChangeToken:a1[5] requestID:a1[7]];
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 containerMetadataSyncRequestID];
  if (v4 == *(void *)(a1 + 32))
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2_cold_1();
    }

    [v3 setContainerMetadataNeedsSyncUp:0];
LABEL_9:
    [v3 setContainerMetadataSyncRequestID:0];
    goto LABEL_10;
  }
  uint64_t v7 = v4;
  if (v4)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138413058;
      id v13 = v3;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      long long v19 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync up of app library container metdata failed for %@ because requestIDs differ %lld vs %lld%@", (uint8_t *)&v12, 0x2Au);
    }

    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

uint64_t __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_37(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 504) containerScheduler];
    [v3 refreshPushRegistrationAfterAppsListChanged];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 completedWithResult:0 error:0];
}

- (void)main
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Sync: syncing down container metadata%@");
}

uint64_t __45__BRCContainerMetadataSyncDownOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  if (a2)
  {
    return [v2 completedWithResult:0 error:a2];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_2;
    v4[3] = &unk_1E6996B18;
    v4[4] = v2;
    return [v2 performAfterFetchingRecordChanges:v4];
  }
}

void __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  id v9 = *(void **)(a1 + 32);
  if (a4)
  {
    [v9 completedWithResult:0 error:a4];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_3;
    v10[3] = &unk_1E6996AF0;
    v10[4] = v9;
    id v11 = v7;
    uint64_t v12 = a3;
    [v9 performAfterFetchingAssetContents:v10];
  }
}

void __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  int v4 = [v3 skipContainerRecordsWithMissingAssets];

  if (v4)
  {
    char v5 = objc_msgSend(v7, "brc_checkErrorsFromCloudKit:", &__block_literal_global_22);
    id v6 = v7;
    if ((v5 & 1) == 0)
    {
LABEL_3:
      [*(id *)(a1 + 32) _completedWithServerChangeToken:*(void *)(a1 + 40) requestID:*(void *)(a1 + 48)];
      goto LABEL_6;
    }
  }
  else
  {
    id v6 = v7;
    if (!v7) {
      goto LABEL_3;
    }
  }
  [*(id *)(a1 + 32) completedWithResult:0 error:v6];
LABEL_6:
}

uint64_t __45__BRCContainerMetadataSyncDownOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "brc_isCloudKitUnknownItemError") ^ 1;
}

- (BOOL)shouldFetchAnotherBatch
{
  return self->_shouldFetchAnotherBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIDsUpdated, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETagsForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_desiredKeysForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_recordIDsForDesiredAssets, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] containerID %@ had no properties plist%@");
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingRecordChanges___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┳%llx finished operation%@");
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] unknown container %@%@", v1, 0x16u);
}

void __75__BRCContainerMetadataSyncDownOperation_performAfterFetchingAssetContents___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] got asset contents for %@%@");
}

void __83__BRCContainerMetadataSyncDownOperation__completedWithServerChangeToken_requestID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync up of app library container metdata succeeded for %@%@");
}

@end