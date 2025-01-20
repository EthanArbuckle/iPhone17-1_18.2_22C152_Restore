@interface BRCSharingCopyShareURLOperation
- (BRCSharingCopyShareURLOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5;
- (id)createActivity;
- (void)_completedWithURL:(id)a3 error:(id)a4;
- (void)main;
@end

@implementation BRCSharingCopyShareURLOperation

- (BRCSharingCopyShareURLOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 recordID];
  v12 = [v11 recordName];
  v13 = [@"sharing/copy-shareURL" stringByAppendingPathComponent:v12];

  v16.receiver = self;
  v16.super_class = (Class)BRCSharingCopyShareURLOperation;
  v14 = [(BRCSharingModifyShareOperation *)&v16 initWithName:v13 zone:v9 share:v10 sessionContext:v8];

  return v14;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/copy-shareURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_completedWithURL:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    share = self->super._share;
    int v13 = 138413058;
    id v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = share;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished copying URL %@ for share %@ error %@%@", (uint8_t *)&v13, 0x2Au);
  }

  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:@"url"];
  }
  v11 = self->super._share;
  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:@"share"];
  }
  [(_BRCOperation *)self completedWithResult:v8 error:v7];
}

- (void)main
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__BRCSharingCopyShareURLOperation_main__block_invoke;
  v2[3] = &unk_1E6999568;
  v2[4] = self;
  [(BRCSharingModifyShareOperation *)self _performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:1 completion:v2];
}

void __39__BRCSharingCopyShareURLOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v4 = *(id **)(a1 + 32);
  if (!a3)
  {
    v5 = [v4[65] clientZone];
    id v6 = [v5 itemByItemID:*(void *)(*(void *)(a1 + 32) + 536)];

    id v7 = [v6 st];
    id v8 = [v7 logicalName];

    id v9 = *(id **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v9[66], "brc_updateWithLogicalName:isFolder:", v8, objc_msgSend(v6, "isDirectory"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "brc_updateWithLogicalName:isFolder:", v8, objc_msgSend(v6, "isDirectory"));
      id v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 528);
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v34;
        __int16 v40 = 2112;
        v41 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Share: %@%@", buf, 0x16u);
      }

      v12 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v35;
        __int16 v40 = 2112;
        v41 = v12;
        _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Prepared record: %@%@", buf, 0x16u);
      }

      if (([*(id *)(*(void *)(a1 + 32) + 528) isKnownToServer] & 1) == 0)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        __int16 v15 = *(void **)(v14 + 528);
        objc_super v16 = [*(id *)(v14 + 520) metadataSyncContext];
        __int16 v17 = [v16 ckContainerID];
        [v15 CKAssignToContainerWithID:v17];
      }
      if (([*(id *)(*(void *)(a1 + 32) + 544) isKnownToServer] & 1) == 0)
      {
        uint64_t v18 = *(void *)(a1 + 32);
        __int16 v19 = *(void **)(v18 + 544);
        v20 = [*(id *)(v18 + 520) metadataSyncContext];
        uint64_t v21 = [v20 ckContainerID];
        [v19 CKAssignToContainerWithID:v21];
      }
      if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 528), "brc_safeToGetURL"))
      {
        v22 = [*(id *)(*(void *)(a1 + 32) + 528) URL];

        if (v22)
        {
          v23 = *(void **)(a1 + 32);
          v24 = (void *)v23[66];
LABEL_20:
          v26 = [v24 URL];
          [v23 _completedWithURL:v26 error:0];
LABEL_28:

          return;
        }
      }
      if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "brc_safeToGetURL"))
      {
        v25 = [*(id *)(*(void *)(a1 + 32) + 544) URL];

        if (v25)
        {
          v23 = *(void **)(a1 + 32);
          v24 = (void *)v23[68];
          goto LABEL_20;
        }
      }
      id v9 = *(id **)(a1 + 32);
      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 528);
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v36;
        __int16 v40 = 2112;
        v41 = v32;
        _os_log_fault_impl(&dword_1D353B000, v33, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't get a share URL for %@%@", buf, 0x16u);
      }

      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F59368];
      uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 528);
      v31 = @"unreachable: Couldn't get a share URL for %@";
    }
    else
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        __39__BRCSharingCopyShareURLOperation_main__block_invoke_cold_1();
      }

      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F59368];
      v31 = @"unreachable: Couldn't get a share URL";
    }
    v26 = objc_msgSend(v29, "br_errorWithDomain:code:description:", v30, 15, v31, v37);
    [v9 completedWithResult:0 error:v26];
    goto LABEL_28;
  }
  [v4 completedWithResult:0 error:a3];
}

void __39__BRCSharingCopyShareURLOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Couldn't get a share URL%@", v2, v3, v4, v5, v6);
}

@end