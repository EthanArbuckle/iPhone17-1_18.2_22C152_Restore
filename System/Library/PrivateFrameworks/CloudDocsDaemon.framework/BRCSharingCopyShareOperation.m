@interface BRCSharingCopyShareOperation
- (BRCClientZone)clientZone;
- (BRCItemID)rootItemIDToLookup;
- (BRCSharingCopyShareOperation)initWithItem:(id)a3 sessionContext:(id)a4;
- (CKRecordID)recordIDNeedingFetch;
- (CKRecordID)shareID;
- (id)createActivity;
- (void)fetchRootURLIfNecessaryAndFinishWithShare:(id)a3;
- (void)main;
- (void)setClientZone:(id)a3;
- (void)setRecordIDNeedingFetch:(id)a3;
- (void)setRootItemIDToLookup:(id)a3;
- (void)setShareID:(id)a3;
@end

@implementation BRCSharingCopyShareOperation

- (BRCSharingCopyShareOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v8 metadataSyncContext];

  if (!v9)
  {
    v33 = [v6 serverZone];

    if (v33)
    {
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:](v6, (uint64_t)v34, v35);
      }
    }
    else
    {
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:]((uint64_t)v6, (uint64_t)v34, v35);
      }
    }
  }
  v10 = [v6 itemID];
  v11 = [v10 debugItemIDString];
  v12 = [@"sharing/copy-share" stringByAppendingPathComponent:v11];

  v36.receiver = self;
  v36.super_class = (Class)BRCSharingCopyShareOperation;
  v13 = [(_BRCOperation *)&v36 initWithName:v12 syncContext:v9 sessionContext:v7];

  if (v13)
  {
    [(_BRCOperation *)v13 setNonDiscretionary:1];
    uint64_t v14 = [v6 clientZone];
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v14;

    if (([v6 sharingOptions] & 0x48) != 0)
    {
      if (([v6 sharingOptions] & 4) != 0) {
        goto LABEL_12;
      }
LABEL_8:
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v6;
        __int16 v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Fetching the root share object for shared to me child item %@%@", buf, 0x16u);
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v6);
      shareID = v13->_shareID;
      v13->_shareID = (CKRecordID *)v20;

      uint64_t v22 = [(CKRecordID *)v13->_shareID brc_shareItemID];
      rootItemIDToLookup = v13->_rootItemIDToLookup;
      v13->_rootItemIDToLookup = (BRCItemID *)v22;
      goto LABEL_22;
    }
    v16 = [v6 clientZone];
    if ([v16 isSharedZone])
    {
      char v17 = [v6 sharingOptions];

      if ((v17 & 4) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_12:
    if (([v6 isDirectory] & 1) != 0 || objc_msgSend(v6, "isDocument"))
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      v25 = [v6 asShareableItem];
      uint64_t v26 = [v24 initShareIDWithShareableItem:v25];
      v27 = v13->_shareID;
      v13->_shareID = (CKRecordID *)v26;

      if (([v6 sharingOptions] & 4) != 0) {
        goto LABEL_23;
      }
      rootItemIDToLookup = [v6 st];
      int v28 = [rootItemIDToLookup iWorkShareable];

      if (!v28) {
        goto LABEL_23;
      }
      int v29 = [v6 isDocument];
      if (v29)
      {
        rootItemIDToLookup = [v6 asDocument];
        v30 = [rootItemIDToLookup documentRecordID];
      }
      else
      {
        v30 = 0;
      }
      objc_storeStrong((id *)&v13->_recordIDNeedingFetch, v30);
      if (!v29) {
        goto LABEL_23;
      }
    }
    else
    {
      rootItemIDToLookup = v13->_shareID;
      v13->_shareID = 0;
    }
LABEL_22:

LABEL_23:
    v31 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
    [(_BRCOperation *)v13 setGroup:v31];
  }
  return v13;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/copy-share", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)fetchRootURLIfNecessaryAndFinishWithShare:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotShared");
    v8 = self;
    v9 = 0;
    v10 = v5;
LABEL_6:
    [(_BRCOperation *)v8 completedWithResult:v9 error:v10];
    goto LABEL_7;
  }
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"share"];
  if (!self->_rootItemIDToLookup)
  {
    v8 = self;
    v9 = v5;
    v10 = 0;
    goto LABEL_6;
  }
  id v6 = [(BRCClientZone *)self->_clientZone db];
  id v7 = [v6 serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke;
  v11[3] = &unk_1E6993628;
  v11[4] = self;
  id v12 = v5;
  dispatch_async(v7, v11);

LABEL_7:
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = [*(id *)(*(void *)(a1 + 32) + 544) itemByItemID:*(void *)(*(void *)(a1 + 32) + 536)];
  if (v2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10;
    v12[3] = &unk_1E6995F70;
    v3 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v3;
    id v4 = (void (**)(void, void))MEMORY[0x1D94389C0](v12);
    v5 = +[BRCItemToPathLookup lookupForItem:v2];
    id v6 = [v5 coordinatedReadURL];
    [v5 closePaths];
    ((void (**)(void, void *))v4)[2](v4, v6);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 536);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      char v17 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find root itemID %@%@", buf, 0x16u);
    }

    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Can't find root itemID %@", *(void *)(*(void *)(a1 + 32) + 536));
    [v7 completedWithResult:0 error:v10];
  }
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) setObject:a2 forKeyedSubscript:@"rootURL"];
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 completedWithResult:v4 error:0];
  }
  else
  {
    uint64_t v6 = a1 + 32;
    v5 = *(void **)(a1 + 32);
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10_cold_1(v6, (uint64_t)v7, v8);
    }

    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: Can't find URL for root itemID %@", *(void *)(*(void *)v6 + 536));
    [v5 completedWithResult:0 error:v9];
  }
}

- (void)main
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (self->_shareID)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->_shareID, self->_recordIDNeedingFetch, 0);
    v5 = (void *)[v3 initWithRecordIDs:v4];

    [v5 setShouldFetchAssetContent:0];
    uint64_t v6 = *MEMORY[0x1E4F19E08];
    v11[0] = *MEMORY[0x1E4F19DF0];
    v11[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F19DD0];
    v11[2] = *MEMORY[0x1E4F19DC8];
    v11[3] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
    [v5 setDesiredKeys:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__BRCSharingCopyShareOperation_main__block_invoke;
    v10[3] = &unk_1E6995380;
    v10[4] = self;
    [v5 setFetchRecordsCompletionBlock:v10];
    [(_BRCOperation *)self addSubOperation:v5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDocumentIsNotShared");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0);
  }
}

void __36__BRCSharingCopyShareOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [v6 completedWithResult:0 error:a3];
  }
  else
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6[65]];
    v8 = *(void **)(a1 + 32);
    if (v8[66])
    {
      id v9 = objc_msgSend(v5, "objectForKeyedSubscript:");
      v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19DF0]];
      uint64_t v11 = [v9 encryptedValues];
      id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F19E08]];

      id v13 = [v9 recordID];
      uint64_t v14 = [*(id *)(a1 + 32) syncContext];
      uint64_t v15 = [v14 session];
      __int16 v16 = objc_msgSend(v13, "brc_itemIDWithSession:", v15);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setPublicSharingIdentity:v12];
      }
      else
      {
        char v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          uint64_t v22 = v16;
          __int16 v23 = 2112;
          id v24 = v17;
          _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] No sharing identity on %@%@", (uint8_t *)&v21, 0x16u);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setBaseToken:v10];
      }
      else
      {
        v19 = brc_bread_crumbs();
        uint64_t v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          uint64_t v22 = v16;
          __int16 v23 = 2112;
          id v24 = v19;
          _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No base token on %@%@", (uint8_t *)&v21, 0x16u);
        }
      }
      v8 = *(void **)(a1 + 32);
    }
    [v8 fetchRootURLIfNecessaryAndFinishWithShare:v7];
  }
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (CKRecordID)recordIDNeedingFetch
{
  return self->_recordIDNeedingFetch;
}

- (void)setRecordIDNeedingFetch:(id)a3
{
}

- (BRCItemID)rootItemIDToLookup
{
  return self->_rootItemIDToLookup;
}

- (void)setRootItemIDToLookup:(id)a3
{
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (void)setClientZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_rootItemIDToLookup, 0);
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, a2, a3, "[CRIT] UNREACHABLE: Copying share for item %@ that does not have a server zone%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 serverZone];
  int v7 = 138412802;
  v8 = a1;
  __int16 v9 = 2112;
  v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item's %@ server zone %@ is missing sync context while coping share%@", (uint8_t *)&v7, 0x20u);
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 536);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, a2, a3, "[CRIT] UNREACHABLE: Can't find URL for root itemID %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end