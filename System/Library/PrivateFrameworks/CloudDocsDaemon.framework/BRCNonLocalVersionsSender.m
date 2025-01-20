@interface BRCNonLocalVersionsSender
+ (id)senderWithLookup:(id)a3 client:(id)a4 XPCReceiver:(id)a5 error:(id *)a6;
- (BOOL)includeCachedVersions;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCNonLocalVersionsSender)initWithDocument:(id)a3 serverItem:(id)a4 relpath:(id)a5 client:(id)a6 XPCReceiver:(id)a7 error:(id *)a8;
- (NSURL)logicalURL;
- (NSURL)physicalURL;
- (id)_depsTrackingOperation;
- (id)_fetchThumbnailOperationForVersionRecord:(id)a3 physicalURL:(id)a4;
- (id)_fetchVersionsOperationWithDepsOp:(id)a3;
- (id)createActivity;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)listNonLocalVersionsWithReply:(id)a3;
- (void)main;
- (void)setIncludeCachedVersions:(BOOL)a3;
@end

@implementation BRCNonLocalVersionsSender

+ (id)senderWithLookup:(id)a3 client:(id)a4 XPCReceiver:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 byIDLocalItem];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [v9 relpath];
    v15 = [v9 byIDServerItem];
  }
  else
  {
    v13 = [v9 faultedLocalItem];
    v15 = [v9 faultedServerItem];
    v14 = [v9 faultedRelpath];
  }
  if ([v13 isDocument])
  {
    v16 = [v13 st];
    v17 = [v16 ckInfo];

    if (v17)
    {
      id v18 = objc_alloc((Class)objc_opt_class());
      v19 = [v13 asDocument];
      v20 = (void *)[v18 initWithDocument:v19 serverItem:v15 relpath:v14 client:v10 XPCReceiver:v11 error:a6];

      goto LABEL_22;
    }
    if (!v13)
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_98_cold_1();
      }
    }
    v37 = v14;
    v21 = v15;
    id v22 = v11;
    id v23 = v10;
    v33 = (void *)MEMORY[0x1E4F28C58];
    v34 = [v9 url];
    v35 = [v34 path];
    v27 = objc_msgSend(v33, "brc_errorNotInCloud:", v35);

    if (v27)
    {
      v28 = brc_bread_crumbs();
      v29 = brc_default_log();
      if (!os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
        goto LABEL_18;
      }
      v30 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "+[BRCNonLocalVersionsSender senderWithLookup:client:XPCReceiver:error:]";
      __int16 v40 = 2080;
      if (!a6) {
        v30 = "(ignored by caller)";
      }
      goto LABEL_27;
    }
  }
  else
  {
    v37 = v14;
    v21 = v15;
    id v22 = v11;
    id v23 = v10;
    v24 = (void *)MEMORY[0x1E4F28C58];
    v25 = [v9 url];
    v26 = [v25 path];
    v27 = objc_msgSend(v24, "brc_errorNoDocument:underlyingPOSIXError:", v26, 21);

    if (v27)
    {
      v28 = brc_bread_crumbs();
      v29 = brc_default_log();
      if (!os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
LABEL_18:

        goto LABEL_19;
      }
      v30 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "+[BRCNonLocalVersionsSender senderWithLookup:client:XPCReceiver:error:]";
      __int16 v40 = 2080;
      if (!a6) {
        v30 = "(ignored by caller)";
      }
LABEL_27:
      v41 = v30;
      __int16 v42 = 2112;
      v43 = v27;
      __int16 v44 = 2112;
      v45 = v28;
      _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_18;
    }
  }
LABEL_19:
  id v10 = v23;
  if (a6) {
    *a6 = v27;
  }

  v20 = 0;
  id v11 = v22;
  v15 = v21;
  v14 = v37;
LABEL_22:

  return v20;
}

- (BRCNonLocalVersionsSender)initWithDocument:(id)a3 serverItem:(id)a4 relpath:(id)a5 client:(id)a6 XPCReceiver:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id obj = a7;
  id v53 = a7;
  id v17 = [NSString alloc];
  id v18 = [v13 itemID];
  v19 = (void *)[v17 initWithFormat:@"non-local-versions for %@", v18];

  v20 = [v13 currentVersion];
  v21 = [v13 syncContextUsedForTransfers];
  id v22 = [v13 session];
  v63.receiver = self;
  v63.super_class = (Class)BRCNonLocalVersionsSender;
  id v23 = [(_BRCOperation *)&v63 initWithName:v19 syncContext:v21 sessionContext:v22];

  if (v23)
  {
    objc_storeStrong((id *)&v23->_client, a6);
    uint64_t v24 = [v13 serverZone];
    serverZone = v23->_serverZone;
    v23->_serverZone = (BRCServerZone *)v24;

    uint64_t v26 = [v13 appLibrary];
    appLibrary = v23->_appLibrary;
    v23->_appLibrary = (BRCAppLibrary *)v26;

    uint64_t v28 = [v13 itemID];
    itemID = v23->_itemID;
    v23->_itemID = (BRCItemID *)v28;

    uint64_t v30 = [v13 documentRecordID];
    recordID = v23->_recordID;
    v23->_recordID = (CKRecordID *)v30;

    uint64_t v32 = [v15 physicalURL];
    physicalURL = v23->_physicalURL;
    v23->_physicalURL = (NSURL *)v32;

    v34 = [v13 st];
    v35 = [v34 logicalName];
    uint64_t v36 = [v15 logicalURLWithLogicalName:v35];
    logicalURL = v23->_logicalURL;
    v23->_logicalURL = (NSURL *)v36;

    uint64_t v38 = [v13 st];
    st = v23->_st;
    v23->_st = (BRCStatInfo *)v38;

    __int16 v40 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchNonLocalVersions");
    [(_BRCOperation *)v23 setGroup:v40];

    if (v20)
    {
      v41 = [v20 ckInfo];
      uint64_t v42 = [v41 etag];
      currentEtag = v23->_currentEtag;
      v23->_currentEtag = (NSString *)v42;
    }
    else
    {
      v41 = [v14 latestVersion];
      currentEtag = [v41 ckInfo];
      uint64_t v44 = [currentEtag etag];
      v45 = v23->_currentEtag;
      v23->_currentEtag = (NSString *)v44;
    }
    if (v23->_itemID)
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__60;
      v61 = __Block_byref_object_dispose__60;
      id v62 = 0;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __90__BRCNonLocalVersionsSender_initWithDocument_serverItem_relpath_client_XPCReceiver_error___block_invoke;
      v54[3] = &unk_1E699C368;
      v55 = v23;
      v56 = &v57;
      [v15 performOnOpenFileDescriptor:v54 error:0];
      if (a8) {
        *a8 = (id) v58[5];
      }

      _Block_object_dispose(&v57, 8);
    }
    if (!v23->_storagePathPrefix) {
      goto LABEL_13;
    }
    uint64_t v46 = [MEMORY[0x1E4F63BE8] manager];
    uint64_t v47 = [v46 permanentStorageForItemAtURL:v23->_physicalURL allocateIfNone:0 error:a8];
    storage = v23->_storage;
    v23->_storage = (GSAdditionStoring *)v47;

    if (!v23->_storage)
    {
LABEL_13:
      v49 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)&v23->_receiver, obj);
  }
  [(_BRCOperation *)v23 setNonDiscretionary:1];
  v49 = v23;
LABEL_14:

  return v49;
}

uint64_t __90__BRCNonLocalVersionsSender_initWithDocument_serverItem_relpath_client_XPCReceiver_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [MEMORY[0x1E4F63BE0] storagePrefixForFileDescriptor:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 536);
  *(void *)(v5 + 536) = v4;

  return 0;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "non-local-versions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (id)_fetchThumbnailOperationForVersionRecord:(id)a3 physicalURL:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 recordID];
  id v9 = [v7 etag];

  id v10 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  v40[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  uint64_t v12 = (void *)[v10 initWithRecordIDs:v11];

  long long v32 = 0uLL;
  uint64_t v33 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCNonLocalVersionsSender _fetchThumbnailOperationForVersionRecord:physicalURL:]", 163, &v32);
  id v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->_itemID;
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = itemID;
    *(_WORD *)&buf[22] = 2112;
    v37 = v9;
    __int16 v38 = 2112;
    v39 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Fetching thumbnail for non-local version %@ etag %@%@", buf, 0x2Au);
  }

  *(_OWORD *)buf = v32;
  *(void *)&buf[16] = v33;
  id v15 = [v12 callbackQueue];
  id v16 = [(_BRCOperation *)self callbackQueue];
  dispatch_set_target_queue(v15, v16);

  id v17 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:16];
  [v12 setDesiredKeys:v17];

  v34 = v8;
  v35 = v9;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  [v12 setRecordIDsToVersionETags:v18];

  v19 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchNonLocalVersions");
  [v12 setGroup:v19];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke;
  v25[3] = &unk_1E699C390;
  long long v30 = *(_OWORD *)buf;
  uint64_t v31 = *(void *)&buf[16];
  id v26 = v8;
  v27 = self;
  id v28 = v9;
  id v29 = v6;
  id v20 = v6;
  id v21 = v9;
  id v22 = v8;
  [v12 setFetchRecordsCompletionBlock:v25];

  return v12;
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  long long v32 = *(_OWORD *)(a1 + 64);
  uint64_t v33 = *(void *)(a1 + 80);
  v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = [v7 debugDescription];
    v25 = (void *)v24;
    id v26 = @"success";
    *(_DWORD *)buf = 134218754;
    if (v6) {
      id v26 = v6;
    }
    uint64_t v37 = v32;
    __int16 v38 = 2112;
    uint64_t v39 = v24;
    __int16 v40 = 2112;
    v41 = v26;
    __int16 v42 = 2112;
    v43 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Received non local thumbnail record: %@ result: %@%@", buf, 0x2Au);
  }
  if (!v6)
  {
    if ([*(id *)(a1 + 40) finishIfCancelled])
    {
      id v6 = 0;
      goto LABEL_28;
    }
    if (v7)
    {
      id v10 = [v7 etag];
      char v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

      if (v11)
      {
        uint64_t v12 = [v7 objectForKeyedSubscript:@"thumb1024"];
        id v13 = [(__CFString *)v12 fileURL];
        BOOL v14 = v13 == 0;

        if (v14)
        {
          id v23 = brc_bread_crumbs();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
            __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_2((uint64_t)v23, v27);
          }
          id v6 = 0;
        }
        else
        {
          id v15 = (void *)MEMORY[0x1E4F3A6A8];
          uint64_t v34 = *MEMORY[0x1E4F1C500];
          id v16 = [(__CFString *)v12 fileURL];
          v35 = v16;
          id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          id v18 = [v7 objectForKeyedSubscript:@"thumbQLMetadata"];
          uint64_t v19 = *(void *)(a1 + 56);
          id v31 = 0;
          int v20 = [v15 associateThumbnailImagesDictionary:v17 serializedQuickLookMetadata:v18 withImmutableDocument:1 atURL:v19 error:&v31];
          id v6 = (__CFString *)v31;

          if (v20)
          {
            id v21 = brc_bread_crumbs();
            id v22 = brc_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_3();
            }

            [*(id *)(*(void *)(a1 + 40) + 504) newThumbnailForVersionWithEtag:*(void *)(a1 + 48)];
            goto LABEL_27;
          }
          id v23 = brc_bread_crumbs();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
            __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_4();
          }
        }

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      brc_bread_crumbs();
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        id v28 = [v7 etag];
        uint64_t v29 = [v28 UTF8String];
        uint64_t v30 = [*(id *)(a1 + 48) UTF8String];
        *(_DWORD *)buf = 136315650;
        uint64_t v37 = v29;
        __int16 v38 = 2080;
        uint64_t v39 = v30;
        __int16 v40 = 2112;
        v41 = v12;
        _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK sent a bogus ETag: %s != %s%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_1((uint64_t)v12, v23);
      }
    }
    id v6 = 0;
    goto LABEL_26;
  }
LABEL_28:
  __brc_leave_section((uint64_t *)&v32);
}

- (id)_fetchVersionsOperationWithDepsOp:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_receiver;
  id v6 = self->_appLibrary;
  id v7 = [(BRCServerZone *)self->_serverZone clientZone];
  v8 = self->_recordID;
  id v9 = objc_alloc(MEMORY[0x1E4F1A058]);
  v33[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  char v11 = (void *)[v9 initWithRecordIDs:v10];

  uint64_t v12 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:153];
  [v11 setDesiredKeys:v12];

  id v13 = objc_msgSend(MEMORY[0x1E4F1A218], "br_fetchNonLocalVersions");
  [v11 setGroup:v13];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke;
  v25[3] = &unk_1E699C3E0;
  id v26 = v6;
  v27 = self;
  BOOL v14 = v8;
  id v31 = v4;
  long long v32 = v11;
  id v28 = v14;
  id v29 = v7;
  uint64_t v30 = v5;
  id v15 = v4;
  id v16 = v5;
  id v17 = v7;
  id v18 = v6;
  [v11 setFetchRecordVersionsProgressBlock:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_27;
  v22[3] = &unk_1E69944C0;
  id v23 = v14;
  uint64_t v24 = self;
  uint64_t v19 = v14;
  [v11 setFetchRecordVersionsCompletionBlock:v22];
  id v20 = v11;

  return v20;
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v74 = a2;
  id v75 = a4;
  id v8 = a5;
  uint64_t v90 = a1;
  id v9 = [*(id *)(a1 + 32) db];
  id v10 = [v9 serialQueue];
  dispatch_assert_queue_not_V2(v10);

  if (([*(id *)(a1 + 40) finishIfCancelled] & 1) == 0)
  {
    if (v8)
    {
      [*(id *)(a1 + 40) completedWithResult:0 error:v8];
      goto LABEL_84;
    }
    memset(v114, 0, sizeof(v114));
    __brc_create_section(0, (uint64_t)"-[BRCNonLocalVersionsSender _fetchVersionsOperationWithDepsOp:]_block_invoke", 233, v114);
    char v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v68 = v114[0];
      uint64_t v69 = [v75 count];
      v70 = [*(id *)(*(void *)(v90 + 40) + 600) path];
      uint64_t v71 = *(void *)(v90 + 48);
      uint64_t v72 = *(void *)(v90 + 80);
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v68;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2112;
      v123 = v70;
      *(_WORD *)v124 = 2112;
      *(void *)&v124[2] = v71;
      *(_WORD *)&v124[10] = 2112;
      *(void *)&v124[12] = v72;
      __int16 v125 = 2112;
      v126 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Got %lu versions for %@ (recordID:%@ %@)%@", buf, 0x3Eu);
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obj = v75;
    uint64_t v13 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
    if (!v13)
    {
      id v8 = 0;
      goto LABEL_83;
    }
    uint64_t v89 = v13;
    id v8 = 0;
    uint64_t v88 = *(void *)v111;
    uint64_t v78 = *MEMORY[0x1E4F63BB8];
    uint64_t v76 = *MEMORY[0x1E4F63BD0];
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v111 != v88) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v110 + 1) + 8 * v14);
      brc_bread_crumbs();
      id v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v29 = [v15 etag];
        uint64_t v30 = [v15 debugDescription];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v123 = v16;
        _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Considering etag %@ %@%@", buf, 0x20u);
      }
      id v18 = *(void **)(*(void *)(v90 + 40) + 528);
      uint64_t v19 = [v15 etag];
      LODWORD(v18) = [v18 isEqualToString:v19];

      if (v18)
      {
        brc_bread_crumbs();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Skipping current version%@", buf, 0xCu);
        }
        goto LABEL_37;
      }
      id v108 = v8;
      id v109 = 0;
      int v22 = [v15 deserializeVersion:&v109 fakeStatInfo:0 contentBoundaryKey:0 clientZone:*(void *)(v90 + 56) error:&v108];
      id v20 = v109;
      id v23 = v108;

      if ((v22 & 1) == 0)
      {
        id v21 = brc_bread_crumbs();
        id v26 = brc_default_log();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v21;
          _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Unable to deserialize record: %@%@", buf, 0x16u);
        }

        goto LABEL_36;
      }
      uint64_t v24 = *(void *)(*(void *)(v90 + 40) + 512);
      v25 = [*(id *)(v90 + 48) zoneID];
      v87 = [v20 additionNameForItemID:v24 zoneID:v25];

      id v21 = [*(id *)(*(void *)(v90 + 40) + 544) additionWithName:v87 inNameSpace:v78 error:0];
      if (!v21)
      {
        id v21 = [*(id *)(*(void *)(v90 + 40) + 544) additionWithName:v87 inNameSpace:v76 error:0];
        if (!v21) {
          break;
        }
      }
      if (*(unsigned char *)(*(void *)(v90 + 40) + 592))
      {
        int v84 = 0;
LABEL_28:
        id v31 = [v20 originalPOSIXName];
        BOOL v32 = v31 == 0;

        if (!v32)
        {
          uint64_t v33 = [*(id *)(v90 + 32) session];
          v83 = [v33 stageRegistry];

          uint64_t v34 = [v21 url];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v123 = __Block_byref_object_copy__60;
          *(void *)v124 = __Block_byref_object_dispose__60;
          id v35 = v34;
          *(void *)&v124[8] = v35;
          if (!v84)
          {
            v79 = 0;
            id v8 = v23;
            goto LABEL_47;
          }
          id v85 = [MEMORY[0x1E4F63BD8] additionURLForName:v87 storagePrefix:*(void *)(*(void *)(v90 + 40) + 536) inConflictNamespace:0];

          uint64_t v102 = 0;
          v103 = &v102;
          uint64_t v104 = 0x3032000000;
          v105 = __Block_byref_object_copy__60;
          v106 = __Block_byref_object_dispose__60;
          id v107 = 0;
          uint64_t v36 = [*(id *)(v90 + 32) db];
          uint64_t v37 = [v36 serialQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_19;
          block[3] = &unk_1E699C3B8;
          v100 = buf;
          id v95 = v83;
          id v38 = v87;
          id v96 = v38;
          id v39 = *(id *)(v90 + 56);
          uint64_t v40 = *(void *)(v90 + 40);
          id v97 = v39;
          uint64_t v98 = v40;
          id v99 = v20;
          v101 = &v102;
          dispatch_sync(v37, block);

          id v8 = (id)v103[5];
          uint64_t v41 = *(void *)(*(void *)&buf[8] + 40);
          if (v41)
          {
            if ([*(id *)(*(void *)(v90 + 40) + 552) isSandboxed])
            {
              v79 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "brc_issueSandboxExtensionOfClass:error:", "com.apple.clouddocs.version", 0);
            }
            else
            {
              v79 = 0;
            }
          }
          else
          {
            __int16 v42 = brc_bread_crumbs();
            v43 = brc_default_log();
            if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
            {
              *(_DWORD *)v115 = 138412802;
              id v116 = v38;
              __int16 v117 = 2112;
              id v118 = v8;
              __int16 v119 = 2112;
              v120 = v42;
              _os_log_error_impl(&dword_1D353B000, v43, (os_log_type_t)0x90u, "[ERROR] Unable to create fault for '%@': %@%@", v115, 0x20u);
            }

            [*(id *)(v90 + 40) completedWithResult:0 error:v8];
            v79 = 0;
          }

          _Block_object_dispose(&v102, 8);
          if (v41)
          {
            id v35 = v85;
LABEL_47:
            uint64_t v44 = *(void **)(*(void *)(v90 + 40) + 528);
            v45 = [v15 etag];
            LODWORD(v44) = [v44 isEqualToString:v45];

            if (v44)
            {
              id v85 = *(id *)(*(void *)(v90 + 40) + 600);

              objc_storeStrong((id *)(*(void *)&buf[8] + 40), *(id *)(*(void *)(v90 + 40) + 608));
            }
            else
            {
              id v85 = v35;
            }
            unsigned int v82 = [MEMORY[0x1E4F3A6A8] hasThumbnailOnImmutableDocumentAtURL:*(void *)(*(void *)&buf[8] + 40)];
            uint64_t v102 = 0;
            v103 = &v102;
            uint64_t v104 = 0x3032000000;
            v105 = __Block_byref_object_copy__60;
            v106 = __Block_byref_object_dispose__60;
            id v107 = 0;
            uint64_t v46 = [*(id *)(v90 + 56) session];
            int v47 = objc_msgSend(v15, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v46);

            if ((v47 & 1) == 0)
            {
              if ([*(id *)(*(void *)(v90 + 40) + 552) isSandboxed])
              {
                v48 = [*(id *)(*(void *)(v90 + 40) + 560) session];
                v49 = [v48 serverDB];

                v50 = [v49 serialQueue];
                v91[0] = MEMORY[0x1E4F143A8];
                v91[1] = 3221225472;
                v91[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_23;
                v91[3] = &unk_1E6996D48;
                uint64_t v51 = *(void *)(v90 + 40);
                v91[4] = v15;
                v91[5] = v51;
                id v92 = v49;
                v93 = &v102;
                id v52 = v49;
                dispatch_sync(v50, v91);
              }
              else
              {
                uint64_t v53 = +[BRFieldUserIdentity unknownPersonNameComponents];
                id v52 = (id)v103[5];
                v103[5] = v53;
              }
            }
            v81 = [v20 displayNameWithoutExtension:1];
            v80 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v20, "mtime"));
            v54 = brc_bread_crumbs();
            v55 = brc_default_log();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v66 = [v85 path];
              *(_DWORD *)v115 = 138412802;
              id v116 = v20;
              __int16 v117 = 2112;
              id v118 = v66;
              __int16 v119 = 2112;
              v120 = v54;
              _os_log_debug_impl(&dword_1D353B000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] sending %@ at '%@'%@", v115, 0x20u);
            }
            v56 = *(void **)(v90 + 64);
            if (v84)
            {
              uint64_t v57 = *(void *)(*(void *)&buf[8] + 40);
              v58 = [v15 etag];
              if (v47)
              {
                uint64_t v59 = objc_msgSend(v15, "brc_lastEditorDeviceName");
                v60 = v59;
              }
              else
              {
                v60 = 0;
                uint64_t v59 = v77;
              }
              [v56 newFaultVersionAtURL:v85 faultURL:v57 faultExtension:v79 etag:v58 hasThumbnail:v82 displayName:v81 lastEditorDeviceName:v60 lastEditorNameComponents:v103[5] modificationDate:v80];
              v77 = v59;
              if (!v47)
              {
LABEL_69:

                if (v82)
                {
                  id v62 = brc_bread_crumbs();
                  objc_super v63 = brc_default_log();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v115 = 138412290;
                    id v116 = v62;
                    _os_log_debug_impl(&dword_1D353B000, v63, OS_LOG_TYPE_DEBUG, "[DEBUG] Thumbnail is already present, not downloading twice%@", v115, 0xCu);
                  }

LABEL_75:
                }
                else
                {
                  v64 = [v15 objectForKeyedSubscript:@"thumb1024"];

                  if (v64)
                  {
                    id v62 = [*(id *)(v90 + 40) _fetchThumbnailOperationForVersionRecord:v15 physicalURL:*(void *)(*(void *)&buf[8] + 40)];
                    [*(id *)(v90 + 72) addDependency:v62];
                    [*(id *)(v90 + 40) addSubOperation:v62];
                    goto LABEL_75;
                  }
                }

                _Block_object_dispose(&v102, 8);
                int v65 = 1;
                v77 = v59;
LABEL_77:

                _Block_object_dispose(buf, 8);
                if (!v65) {
                  goto LABEL_83;
                }
                goto LABEL_38;
              }
            }
            else
            {
              v58 = [v21 size];
              uint64_t v59 = [v15 etag];
              if (v47)
              {
                v73 = objc_msgSend(v15, "brc_lastEditorDeviceName");
                v61 = v73;
              }
              else
              {
                v61 = 0;
              }
              [v56 newCachedVersionAtURL:v85 size:v58 etag:v59 hasThumbnail:v82 displayName:v81 lastEditorDeviceName:v61 lastEditorNameComponents:v103[5] modificationDate:v80];
              if (v47) {
            }
              }
            uint64_t v59 = v77;
            goto LABEL_69;
          }
          int v65 = 0;
          goto LABEL_77;
        }
        v27 = brc_bread_crumbs();
        id v28 = brc_default_log();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v27;
          _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] Version is lacking a name%@", buf, 0xCu);
        }
        goto LABEL_35;
      }
      v27 = brc_bread_crumbs();
      id v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] The version is already cached locally, skip it%@", buf, 0xCu);
      }
LABEL_35:

LABEL_36:
      id v8 = v23;
LABEL_37:

LABEL_38:
      if (v89 == ++v14)
      {
        uint64_t v67 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
        uint64_t v89 = v67;
        if (!v67)
        {
LABEL_83:

          __brc_leave_section(v114);
          goto LABEL_84;
        }
        goto LABEL_8;
      }
    }
    int v84 = 1;
    goto LABEL_28;
  }
LABEL_84:
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_19(void *a1)
{
  os_activity_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  uint64_t v6 = *(void *)(a1[7] + 520);
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v2 makeNonLocalVersionSideFaultWithAdditionName:v3 clientZone:v4 statInfo:v6 version:v5 sharingOptions:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[9] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_23(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = [*(id *)(a1 + 32) lastModifiedUserRecordID];
  uint64_t v3 = [v2 recordName];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 560) session];
  uint64_t v5 = [(id)objc_opt_class() userIdentityForName:v3 db:*(void *)(a1 + 48)];

  uint64_t v6 = [v5 nameComponentsAcceptUnknownUser:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v10 = +[BRFieldUserIdentity unknownPersonNameComponents];
  LODWORD(v9) = [v9 isEqual:v10];

  if (v9)
  {
    char v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] User has no formatted name%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_27_cold_1();
  }

  if (([*(id *)(a1 + 40) finishIfCancelled] & 1) == 0)
  {
    uint64_t v6 = *(id **)(a1 + 40);
    if (v3) {
      [v6 completedWithResult:0 error:v3];
    }
    else {
      [v6[63] versionsDone];
    }
  }
}

- (id)_depsTrackingOperation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__BRCNonLocalVersionsSender__depsTrackingOperation__block_invoke;
  v4[3] = &unk_1E6993698;
  v4[4] = self;
  os_activity_t v2 = +[NSBlockOperation blockOperationWithBlock:v4];
  return v2;
}

uint64_t __51__BRCNonLocalVersionsSender__depsTrackingOperation__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) finishIfCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 completedWithResult:0 error:0];
  }
  return result;
}

- (void)main
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] scheduling operation %@%@");
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  reply = (void (**)(id, id))self->_reply;
  if (reply)
  {
    reply[2](reply, v7);
    id v9 = self->_reply;
    self->_reply = 0;
  }
  if (v7) {
    [(_BRCOperation *)self cancel];
  }
  v10.receiver = self;
  v10.super_class = (Class)BRCNonLocalVersionsSender;
  [(_BRCOperation *)&v10 finishWithResult:v6 error:v7];
}

- (NSURL)logicalURL
{
  return self->_logicalURL;
}

- (NSURL)physicalURL
{
  return self->_physicalURL;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalURL, 0);
  objc_storeStrong((id *)&self->_logicalURL, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_storagePathPrefix, 0);
  objc_storeStrong((id *)&self->_currentEtag, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)listNonLocalVersionsWithReply:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(1, (uint64_t)"-[BRCNonLocalVersionsSender(IPCs) listNonLocalVersionsWithReply:]", 423, v19);
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v19[0];
    qos_class_t v8 = qos_class_self();
    id v9 = BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = self;
    __int16 v24 = 2112;
    v25 = v9;
    __int16 v26 = 2080;
    v27 = "-[BRCNonLocalVersionsSender(IPCs) listNonLocalVersionsWithReply:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);
  }
  client = self->_client;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke;
  v17[3] = &unk_1E69957B0;
  v17[4] = self;
  id v11 = v4;
  id v18 = v11;
  LODWORD(client) = _brc_ipc_check_logged_status(client, 0, v17);

  if (client)
  {
    uint64_t v12 = (void *)MEMORY[0x1D94389C0](v11);
    id reply = self->_reply;
    self->_id reply = v12;

    uint64_t v14 = self->_client;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke_129;
    v15[3] = &unk_1E699C408;
    v15[4] = self;
    id v16 = v11;
    [(BRCXPCClient *)v14 performBlock:v15 withSessionFromURL:self->_physicalURL];
  }
  __brc_leave_section(v19);
}

void __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke_129(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) schedule];
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = v5;
      if (!v5)
      {
        __int16 v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      }
      int v12 = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
      if (!v5) {
    }
      }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
    }
    else
    {
      __int16 v11 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

- (void)invalidate
{
  [(_BRCOperation *)self cancel];
  client = self->_client;
  self->_client = 0;
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK sent us no results and no error%@", (uint8_t *)&v2, 0xCu);
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK couldn't fetch the thumbnail and set no error%@", (uint8_t *)&v2, 0xCu);
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Successfully added thumbnail to version at %@%@");
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to attach thumbnail to version: %@%@", v1, 0x16u);
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] completed fetching non-local versions of %@%@");
}

@end