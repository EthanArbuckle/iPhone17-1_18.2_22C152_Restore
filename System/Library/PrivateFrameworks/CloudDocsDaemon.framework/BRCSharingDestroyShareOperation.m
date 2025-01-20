@interface BRCSharingDestroyShareOperation
- (BRCSharingDestroyShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5;
- (id)createActivity;
- (id)shareID;
- (void)main;
@end

@implementation BRCSharingDestroyShareOperation

- (id)shareID
{
  return (id)[(CKShare *)self->super._share recordID];
}

- (BRCSharingDestroyShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 recordID];
  v12 = [v11 recordName];
  v13 = [@"sharing/destroy-share" stringByAppendingPathComponent:v12];

  v17.receiver = self;
  v17.super_class = (Class)BRCSharingDestroyShareOperation;
  v14 = [(BRCSharingModifyShareOperation *)&v17 initWithName:v13 zone:v9 share:v10 sessionContext:v8];

  v15 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
  [(_BRCOperation *)v14 setGroup:v15];

  return v14;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/destroy-share", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v3 = [(BRCServerZone *)self->super._serverZone session];
  v4 = [v3 clientDB];
  v5 = [v4 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BRCSharingDestroyShareOperation_main__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(v5, block);
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(*(void *)(a1 + 32) + 528) recordID];
  v4 = objc_msgSend(v3, "brc_shareItemID");

  v5 = [*(id *)(*(void *)v2 + 520) clientZone];
  v6 = [v5 itemByItemID:v4];

  if ([*(id *)(*(void *)v2 + 520) isPrivateZone])
  {
    if ([v6 isDocument])
    {
      v7 = [v6 asDocument];
      id v8 = [v7 baseRecord];

      id v9 = [v6 asDocument];
      id v10 = [v9 currentVersion];
      v11 = [v10 ckInfo];
      [v8 serializeSystemFields:v11];
    }
    else
    {
      v13 = [v6 asDirectory];
      id v8 = [v13 folderRootStructureRecord];

      id v9 = [v6 st];
      id v10 = [v9 ckInfo];
      [v8 serializeSystemFields:v10];
    }

    id v12 = objc_alloc(MEMORY[0x1E4F1A198]);
    if (v8)
    {
      v29[0] = v8;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      char v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1A198]);
    id v8 = 0;
  }
  v14 = 0;
  char v15 = 1;
LABEL_9:
  v16 = [*(id *)(a1 + 32) shareID];
  v28 = v16;
  objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v18 = (void *)[v12 initWithRecordsToSave:v14 recordIDsToDelete:v17];

  if ((v15 & 1) == 0) {
  objc_initWeak(&location, v18);
  }
  [v18 setAtomic:1];
  [v18 setSavePolicy:0];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __39__BRCSharingDestroyShareOperation_main__block_invoke_2;
  v24 = &unk_1E699A030;
  objc_copyWeak(&v26, &location);
  uint64_t v25 = *(void *)(a1 + 32);
  [v18 setModifyRecordsCompletionBlock:&v21];
  v19 = objc_msgSend(v18, "callbackQueue", v21, v22, v23, v24);
  v20 = [*(id *)(a1 + 32) callbackQueue];
  dispatch_set_target_queue(v19, v20);

  [*(id *)(a1 + 32) addSubOperation:v18];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = [v9 count];

  if (!v8 && !v11)
  {
    id v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: got an unexpected number of shares deleted");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v23 = [*(id *)(a1 + 32) shareID];
      int v25 = 138413058;
      id v26 = v23;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = WeakRetained;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] failed to destroy share %@: %@ in %@%@", (uint8_t *)&v25, 0x2Au);
    }
    v16 = *(void **)(a1 + 32);
    objc_super v17 = [v16 shareID];
    v18 = objc_msgSend(v8, "brc_cloudKitErrorForRecordID:", v17);
    [v16 completedWithResult:0 error:v18];
  }
  else
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v24 = [*(id *)(a1 + 32) shareID];
      int v25 = 138412802;
      id v26 = v24;
      __int16 v27 = 2112;
      id v28 = WeakRetained;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] destroyed share %@ in %@%@", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void **)(v21 + 528);
    *(void *)(v21 + 528) = 0;

    [*(id *)(a1 + 32) _updateDBAndSyncDownIfNeededWithShare:0 recordsToLearnCKInfo:v7];
    [*(id *)(a1 + 32) completedWithResult:MEMORY[0x1E4F1CC38] error:0];
  }
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: got an unexpected number of shares deleted%@", v2, v3, v4, v5, v6);
}

@end