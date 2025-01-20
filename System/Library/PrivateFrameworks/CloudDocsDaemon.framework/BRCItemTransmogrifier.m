@interface BRCItemTransmogrifier
- (BOOL)addOperation:(id)a3 forItem:(id)a4;
- (BRCItemTransmogrifier)initWithSession:(id)a3;
- (double)_renameDelayForZone:(id)a3;
- (double)_renameItem:(id)a3;
- (id)queue;
- (void)_finishDirectoryToPackageTransmogrification:(id)a3 relpath:(id)a4;
- (void)_renameItems;
- (void)_scheduleRenameAfter:(double)a3 onQueue:(id)a4;
- (void)removeOperationsForItemGlobalID:(id)a3;
- (void)scheduleBouncedDirectoryRename:(id)a3;
- (void)scheduleDirectoryToPackageTransmogrification:(id)a3 absolutePath:(id)a4;
@end

@implementation BRCItemTransmogrifier

- (BRCItemTransmogrifier)initWithSession:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCItemTransmogrifier;
  v6 = [(BRCItemTransmogrifier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = v7;
  }

  return v7;
}

- (id)queue
{
  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = v2->_queue;
    v2->_queue = (NSOperationQueue *)v4;

    [(NSOperationQueue *)v2->_queue setName:@"com.apple.bird.transmogrifier"];
    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    queue = v2->_queue;
  }
  v6 = queue;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)addOperation:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 itemGlobalID];
  v9 = self;
  objc_sync_enter(v9);
  pendingTransmogirifcations = v9->_pendingTransmogirifcations;
  if (!pendingTransmogirifcations)
  {
    uint64_t v13 = objc_opt_new();
    v14 = v9->_pendingTransmogirifcations;
    v9->_pendingTransmogirifcations = (NSMutableDictionary *)v13;

    pendingTransmogirifcations = v9->_pendingTransmogirifcations;
  }
  v11 = [(NSMutableDictionary *)pendingTransmogirifcations objectForKeyedSubscript:v8];

  if (!v11) {
    [(NSMutableDictionary *)v9->_pendingTransmogirifcations setObject:v6 forKeyedSubscript:v8];
  }
  objc_sync_exit(v9);

  return v11 == 0;
}

- (void)removeOperationsForItemGlobalID:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_pendingTransmogirifcations removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)_finishDirectoryToPackageTransmogrification:(id)a3 relpath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 db];
  [v7 assertOnQueue];

  v8 = [v5 serverZone];
  v9 = [v5 itemID];
  objc_super v10 = [v5 db];
  v11 = [v8 itemByItemID:v9 db:v10];

  if ([v11 isDead])
  {
    v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] Not finishing transmogrification because item is dead in the server thruth%@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v12 = [v5 itemParentGlobalID];
    id v14 = +[BRCLocalItem newItemWithPath:v6 parentGlobalID:v12];
    uint64_t v13 = [v14 asDocument];

    if (v13)
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412802;
        v18 = v13;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new document %@ at %@%@", (uint8_t *)&v17, 0x20u);
      }

      [v13 markNeedsReading];
      [v5 markLostWhenReplacedByItem:v13];
      [v5 saveToDB];
      [v13 saveToDB];
    }
  }
}

- (void)scheduleDirectoryToPackageTransmogrification:(id)a3 absolutePath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v6 itemID];
  objc_super v10 = [v6 db];
  v11 = [v8 itemByItemID:v9 db:v10];

  if ([v11 isDead])
  {
    brc_bread_crumbs();
    v12 = (BRCFileProvidingRequestOperation *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] Not scheduling transmogrification because item is dead in the server thruth%@", buf, 0xCu);
    }
  }
  else
  {
    v12 = [[BRCFileProvidingRequestOperation alloc] initWithDirectoryItem:v6];
    [(_BRCOperation *)v12 setNonDiscretionary:0];
    if ([(BRCItemTransmogrifier *)self addOperation:v12 forItem:v6])
    {
      long long v32 = 0uLL;
      uint64_t v33 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCItemTransmogrifier scheduleDirectoryToPackageTransmogrification:absolutePath:]", 120, &v32);
      id v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        v35 = v14;
        _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Start downloading nested items prior to transmogrificaiton of %@%@", buf, 0x20u);
      }

      *(_OWORD *)buf = v32;
      *(void *)&buf[16] = v33;
      v16 = [v6 itemGlobalID];
      int v17 = [v6 st];
      v18 = [v17 fileID];
      uint64_t v19 = [v18 longLongValue];

      id v20 = self->_session;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke;
      v24[3] = &unk_1E6997EC0;
      long long v29 = *(_OWORD *)buf;
      uint64_t v30 = *(void *)&buf[16];
      id v25 = v16;
      v26 = self;
      v27 = v20;
      id v28 = v7;
      uint64_t v31 = v19;
      __int16 v21 = v20;
      id v22 = v16;
      [(BRCFileProvidingRequestOperation *)v12 addCompletionCallback:v24];
      [(BRCAccountSession *)self->_session addMiscOperation:v12];
      uint64_t v23 = [(BRCItemTransmogrifier *)self queue];
      [v23 addOperation:v12];

      id v6 = 0;
    }
  }
}

BOOL __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = *(_OWORD *)(a1 + 64);
  uint64_t v30 = *(void *)(a1 + 80);
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_cold_1();
  }

  if (v3)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)block = 138412802;
      *(void *)&block[4] = v20;
      *(_WORD *)&block[12] = 2112;
      *(void *)&block[14] = v3;
      *(_WORD *)&block[22] = 2112;
      v34 = v6;
      _os_log_fault_impl(&dword_1D353B000, v7, OS_LOG_TYPE_FAULT, "[CRIT] Failed to download items required for transmogrification of %@: error: %@%@", block, 0x20u);
    }

    [*(id *)(a1 + 40) removeOperationsForItemGlobalID:*(void *)(a1 + 32)];
  }
  else
  {
    v8 = [*(id *)(a1 + 48) clientTruthWorkloop];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4;
    v23[3] = &unk_1E6997E98;
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 40);
    id v26 = v9;
    uint64_t v27 = v11;
    uint64_t v28 = v10;
    v12 = v8;
    uint64_t v13 = v23;
    id v14 = (void *)MEMORY[0x1D9438760]();
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v31);
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v31;
      label = dispatch_queue_get_label(v12);
      *(_DWORD *)block = 134218498;
      *(void *)&block[4] = v21;
      *(_WORD *)&block[12] = 2080;
      *(void *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v34 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    long long v37 = v31;
    uint64_t v38 = v32;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_14;
    v34 = &unk_1E6993710;
    int v17 = v12;
    v35 = v17;
    v18 = v13;
    id v36 = v18;
    dispatch_async(v17, block);
  }
  __brc_leave_section((uint64_t *)&v29);

  return v3 == 0;
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4_cold_1();
  }

  uint64_t v4 = [[BRCRelativePath alloc] initWithAbsolutePath:*(void *)(a1 + 40) session:*(void *)(a1 + 48)];
  int v11 = 0;
  if ([(BRCRelativePath *)v4 resolveAndKeepOpenMustExist:1 error:&v11])
  {
    if ([(BRCRelativePath *)v4 isDocument]
      && [(BRCRelativePath *)v4 fileID] == *(void *)(a1 + 64))
    {
      id v5 = [*(id *)(a1 + 48) itemByItemGlobalID:*(void *)(a1 + 32)];
      id v6 = [v5 asDirectory];

      [*(id *)(a1 + 56) _finishDirectoryToPackageTransmogrification:v6 relpath:v4];
    }
    else
    {
      id v6 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(BRCRelativePath **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        *(void *)v15 = v4;
        *(_WORD *)&v15[8] = 2112;
        *(void *)&v15[10] = v6;
        _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ changed at relpath %@, abandoning transmogirifcation%@", buf, 0x20u);
      }
    }
    [(BRCRelativePath *)v4 close];
  }
  else
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v4;
      __int16 v14 = 1024;
      *(_DWORD *)v15 = v11;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Abandonding transmogrification since %@ can not be resolved, error %d%@", buf, 0x1Cu);
    }
  }
  [*(id *)(a1 + 56) removeOperationsForItemGlobalID:*(void *)(a1 + 32)];
}

- (double)_renameDelayForZone:(id)a3
{
  id v3 = [a3 zoneName];
  if ([v3 hasPrefix:@"brtest"]) {
    double v4 = 45.0;
  }
  else {
    double v4 = 600.0;
  }

  return v4;
}

- (double)_renameItem:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  double v4 = (BRCRelativePath *)a3;
  int __errnum = 0;
  id v5 = [BRCRelativePath alloc];
  id v6 = [(BRCRelativePath *)v4 fileID];
  uint64_t v7 = [v6 longLongValue];
  v8 = [(BRCRelativePath *)v4 session];
  id v9 = [(BRCRelativePath *)v5 initWithFileID:v7 session:v8];

  if (![(BRCRelativePath *)v9 resolveAndKeepOpenMustExist:1 error:&__errnum])
  {
    v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v50 = v9;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = __errnum;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resovle %@, error %d%@", buf, 0x1Cu);
    }

    goto LABEL_20;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)-[BRCRelativePath modificationTime](v9, "modificationTime"));
  [v10 timeIntervalSinceNow];
  double v12 = v11;
  double v13 = -v11;

  __int16 v14 = [(BRCRelativePath *)v4 clientZone];
  [(BRCItemTransmogrifier *)self _renameDelayForZone:v14];
  double v16 = v15;

  if (v16 <= v13)
  {
    uint64_t v20 = [(BRCRelativePath *)v9 filename];
    uint64_t v21 = [(BRCRelativePath *)v4 st];
    id v22 = [v21 representableName];
    char v23 = [v20 isEqual:v22];

    if (v23)
    {
      id v24 = brc_bread_crumbs();
      id v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v35 = [(BRCRelativePath *)v9 filename];
        id v36 = [(BRCRelativePath *)v4 st];
        long long v37 = [v36 logicalNameWithoutLocalBounce];
        *(_DWORD *)buf = 138413058;
        v50 = v4;
        __int16 v51 = 2112;
        *(void *)v52 = v35;
        *(_WORD *)&v52[8] = 2112;
        *(void *)&v52[10] = v37;
        __int16 v53 = 2112;
        v54 = v24;
        _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] renaming item for transmogrify %@ (%@ -> %@)%@", buf, 0x2Au);
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __37__BRCItemTransmogrifier__renameItem___block_invoke;
      v45[3] = &unk_1E6993E30;
      id v26 = v9;
      v46 = v26;
      uint64_t v27 = v4;
      v47 = v27;
      if ([(BRCRelativePath *)v26 performOnOpenParentFileDescriptor:v45 error:&__errnum])
      {
        uint64_t v28 = [(BRCRelativePath *)v27 db];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __37__BRCItemTransmogrifier__renameItem___block_invoke_13;
        v42[3] = &unk_1E6997EE8;
        v43 = v27;
        int v44 = __errnum;
        [v28 groupInBatch:v42];

        long long v29 = v43;
      }
      else
      {
        long long v29 = brc_bread_crumbs();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
        {
          uint64_t v38 = [(BRCRelativePath *)v26 filename];
          uint64_t v39 = [(BRCRelativePath *)v27 st];
          v40 = [v39 logicalNameWithoutLocalBounce];
          v41 = strerror(__errnum);
          *(_DWORD *)buf = 138413058;
          v50 = v38;
          __int16 v51 = 2112;
          *(void *)v52 = v40;
          *(_WORD *)&v52[8] = 2080;
          *(void *)&v52[10] = v41;
          __int16 v53 = 2112;
          v54 = v29;
          _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] failed renaming for transmogrify from %@ to %@ (%s)%@", buf, 0x2Au);
        }
      }

      uint64_t v32 = v26;
    }
    else
    {
      uint64_t v30 = brc_bread_crumbs();
      long long v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v4;
        __int16 v51 = 2112;
        *(void *)v52 = v30;
        _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ have changed, abandoning rename%@", buf, 0x16u);
      }

      uint64_t v32 = v9;
    }
    [(BRCRelativePath *)v32 close];
LABEL_20:
    double v17 = 0.0;
    goto LABEL_21;
  }
  [(BRCRelativePath *)v9 close];
  double v17 = v12 + v16;
LABEL_21:

  return v17;
}

uint64_t __37__BRCItemTransmogrifier__renameItem___block_invoke(uint64_t a1, int a2)
{
  double v4 = [*(id *)(a1 + 32) filename];
  id v5 = [*(id *)(a1 + 40) st];
  id v6 = [v5 logicalNameWithoutLocalBounce];
  uint64_t v7 = BRCRenameAt(a2, v4, a2, v6, 0);

  return v7;
}

void __37__BRCItemTransmogrifier__renameItem___block_invoke_13(uint64_t a1)
{
  v2 = [BRCRelativePath alloc];
  id v3 = [*(id *)(a1 + 32) fileID];
  uint64_t v4 = [v3 longLongValue];
  id v5 = [*(id *)(a1 + 32) session];
  id v6 = [(BRCRelativePath *)v2 initWithFileID:v4 session:v5];

  int v9 = 0;
  if ([(BRCRelativePath *)v6 resolveAndKeepOpenMustExist:1 error:&v9])
  {
    uint64_t v7 = [*(id *)(a1 + 32) session];
    v8 = [v7 fsReader];
    [v8 fseventAtPath:v6 flags:0];
  }
  else
  {
    uint64_t v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __37__BRCItemTransmogrifier__renameItem___block_invoke_13_cold_1(a1, (uint64_t)v7, v8);
    }
  }

  [(BRCRelativePath *)v6 close];
}

- (void)_renameItems
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_pendingRenames firstObject];
  if (v3)
  {
    id v5 = (void *)v3;
    *(void *)&long long v4 = 138412546;
    long long v21 = v4;
    do
    {
      -[NSMutableArray removeObject:](self->_pendingRenames, "removeObject:", v5, v21);
      session = self->_session;
      uint64_t v7 = [v5 zoneRowID];
      v8 = [(BRCAccountSession *)session serverZoneByRowID:v7];
      int v9 = [v8 clientZone];

      uint64_t v10 = [v5 itemID];
      double v11 = [v9 itemByItemID:v10];
      double v12 = [v11 asDirectory];

      if (v12)
      {
        [(BRCItemTransmogrifier *)self _renameItem:v12];
        pendingRenames = self->_pendingRenames;
        if (v13 > 0.0)
        {
          double v18 = v13;
          [(NSMutableArray *)pendingRenames addObject:v5];
          uint64_t v19 = [v12 db];
          uint64_t v20 = [v19 serialQueue];
          [(BRCItemTransmogrifier *)self _scheduleRenameAfter:v20 onQueue:v18];

          return;
        }
      }
      else
      {
        double v15 = brc_bread_crumbs();
        double v16 = brc_default_log();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = v21;
          char v23 = v5;
          __int16 v24 = 2112;
          id v25 = v15;
          _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] Can't find %@ in client truth%@", buf, 0x16u);
        }

        pendingRenames = self->_pendingRenames;
      }
      uint64_t v17 = [(NSMutableArray *)pendingRenames firstObject];

      id v5 = (void *)v17;
    }
    while (v17);
  }
}

- (void)_scheduleRenameAfter:(double)a3 onQueue:(id)a4
{
  id v6 = a4;
  if (!self->_pendingRenamesTimer)
  {
    uint64_t v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
    pendingRenamesTimer = self->_pendingRenamesTimer;
    self->_pendingRenamesTimer = v7;

    int v9 = self->_pendingRenamesTimer;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    double v11 = self->_pendingRenamesTimer;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__BRCItemTransmogrifier__scheduleRenameAfter_onQueue___block_invoke;
    v19[3] = &unk_1E6993C50;
    objc_copyWeak(&v20, &location);
    double v12 = v11;
    double v13 = v19;
    __int16 v14 = v12;
    double v15 = v13;
    double v16 = v15;
    uint64_t v17 = v15;
    if (*MEMORY[0x1E4F59658])
    {
      uint64_t v17 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v15);
    }
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v14, v18);

    dispatch_resume((dispatch_object_t)self->_pendingRenamesTimer);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __54__BRCItemTransmogrifier__scheduleRenameAfter_onQueue___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    id v3 = WeakRetained;

    [v3 _renameItems];
    WeakRetained = v3;
  }
}

- (void)scheduleBouncedDirectoryRename:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (!self->_pendingRenames)
  {
    id v5 = (NSMutableArray *)objc_opt_new();
    pendingRenames = self->_pendingRenames;
    self->_pendingRenames = v5;

    id v4 = v13;
  }
  uint64_t v7 = [v4 itemGlobalID];
  if (([(NSMutableArray *)self->_pendingRenames containsObject:v7] & 1) == 0)
  {
    [(NSMutableArray *)self->_pendingRenames addObject:v7];
    v8 = [v13 clientZone];
    [(BRCItemTransmogrifier *)self _renameDelayForZone:v8];
    double v10 = v9;
    double v11 = [v13 db];
    double v12 = [v11 serialQueue];
    [(BRCItemTransmogrifier *)self _scheduleRenameAfter:v12 onQueue:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransmogirifcations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingRenames, 0);
  objc_storeStrong((id *)&self->_pendingRenamesTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┳%llx Nested download finished%@");
}

void __83__BRCItemTransmogrifier_scheduleDirectoryToPackageTransmogrification_absolutePath___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Finished downloading nested items needed for transmogrification of %@%@");
}

void __37__BRCItemTransmogrifier__renameItem___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = strerror(*(_DWORD *)(a1 + 40));
  int v6 = 136315394;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] failed opening after rename for transmogrify (%s)%@", (uint8_t *)&v6, 0x16u);
}

@end