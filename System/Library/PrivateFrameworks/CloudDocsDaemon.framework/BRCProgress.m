@interface BRCProgress
+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5;
+ (id)downloadProgressForDocument:(id)a3 sizeInfo:(id)a4;
+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4;
- (BOOL)isPublished;
- (BRCProgress)initWithGroup:(char)a3 parentFileIDs:(id)a4 session:(id)a5;
- (BRCProgress)initWithIgnorePublish:(BOOL)a3;
- (NSArray)parentFileIDs;
- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5;
- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5;
- (void)addAliasItem:(id)a3;
- (void)brc_publish;
- (void)brc_unpublish;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setSession:(id)a3 parentFileIDs:(id)a4 group:(char)a5;
@end

@implementation BRCProgress

- (void)setCompletedUnitCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BRCProgress;
  -[BRCProgress setCompletedUnitCount:](&v8, sel_setCompletedUnitCount_);
  v5 = self;
  objc_sync_enter(v5);
  progressByAliasContainerID = v5->_progressByAliasContainerID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__BRCProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSProgress_16_B24l;
  v7[4] = a3;
  [(NSMutableDictionary *)progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:v7];
  objc_sync_exit(v5);
}

uint64_t __37__BRCProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCompletedUnitCount:*(void *)(a1 + 32)];
}

- (void)brc_publish
{
  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    [(NSProgress *)&v4 brc_publish];
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 1;
    [(NSMutableDictionary *)v3->_progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
    objc_sync_exit(v3);
  }
}

uint64_t __26__BRCProgress_brc_publish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_publish");
}

- (void)brc_unpublish
{
  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    [(NSProgress *)&v4 brc_unpublish];
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 0;
    [(NSMutableDictionary *)v3->_progressByAliasContainerID enumerateKeysAndObjectsUsingBlock:&__block_literal_global_38];
    objc_sync_exit(v3);
  }
}

uint64_t __28__BRCProgress_brc_unpublish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_unpublish");
}

+ (id)downloadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _progressForDocument:v6 group:2 sizeInfo:a4];
  if (v7)
  {
    objc_super v8 = [v6 session];
    v9 = [v8 globalProgress];
    [v9 addProgress:v7 forDocument:v6 inGroup:2];
  }
  else
  {
    objc_super v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting download progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _progressForDocument:v6 group:1 sizeInfo:a4];
  if (v7)
  {
    objc_super v8 = [v6 session];
    v9 = [v8 globalProgress];
    [v9 addProgress:v7 forDocument:v6 inGroup:1];
  }
  else
  {
    objc_super v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting upload progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

- (BRCProgress)initWithGroup:(char)a3 parentFileIDs:(id)a4 session:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BRCProgress;
  int v11 = [(BRCProgress *)&v14 initWithParent:0 userInfo:0];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, v10);
    objc_storeStrong((id *)&v12->_parentFileIDs, a4);
    v12->_group = a3;
  }

  return v12;
}

- (BRCProgress)initWithIgnorePublish:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCProgress;
  result = [(BRCProgress *)&v5 init];
  if (result) {
    result->_ignorePublish = a3;
  }
  return result;
}

- (void)setSession:(id)a3 parentFileIDs:(id)a4 group:(char)a5
{
  objc_super v8 = (NSArray *)a4;
  objc_storeWeak((id *)&self->_session, a3);
  parentFileIDs = self->_parentFileIDs;
  self->_parentFileIDs = v8;

  self->_group = a5;
}

- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  int v6 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v49 = [[BRCItemToPathLookup alloc] initWithItem:v8];
  v50 = [(BRCItemToPathLookup *)v49 coordinatedWriteURL];
  if (!v50)
  {
    v45 = brc_bread_crumbs();
    v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      -[BRCProgress _setupProgressForDocument:group:sizeInfo:]((uint64_t)v45, v46);
    }
  }
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");
  if ([v8 isFault])
  {
    id v10 = [v50 URLByDeletingLastPathComponent];
    int v11 = [v8 st];
    id v12 = [v11 filename];
    __int16 v13 = [v10 URLByAppendingPathComponent:v12 isDirectory:0];

    [(BRCProgress *)self setUserInfoObject:v13 forKey:*MEMORY[0x1E4F288A8]];
  }
  id v61 = 0;
  char v14 = [v50 getPromisedItemResourceValue:&v61 forKey:*MEMORY[0x1E4F1C6C8] error:0];
  id v15 = v61;
  if ((v14 & 1) == 0)
  {
    uint64_t v16 = [v50 lastPathComponent];

    id v15 = (id)v16;
  }
  v17 = [v9 objectForKeyedSubscript:@"BRCSizeInfoCompletedUnitCountKey"];
  -[BRCProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", [v17 longLongValue]);

  v18 = [v9 objectForKeyedSubscript:@"BRCSizeInfoTotalUnitCountKey"];
  -[BRCProgress setTotalUnitCount:](self, "setTotalUnitCount:", [v18 longLongValue]);

  if ([(BRCProgress *)self completedUnitCount] < 0
    || [(BRCProgress *)self totalUnitCount] < 0)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(BRCProgress *)self totalUnitCount];
      uint64_t v22 = [(BRCProgress *)self completedUnitCount];
      *(_DWORD *)buf = 134218498;
      v64 = (BRCProgress *)v21;
      __int16 v65 = 2048;
      uint64_t v66 = v22;
      __int16 v67 = 2112;
      v68 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress initialized with negative values. total [%lld] completed [%lld]%@", buf, 0x20u);
    }
  }
  [(BRCProgress *)self setKind:*MEMORY[0x1E4F28898]];
  [(BRCProgress *)self setUserInfoObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F593A8]];
  [(BRCProgress *)self setCancellable:0];
  v23 = (id *)MEMORY[0x1E4F28858];
  if (v15)
  {
    [(BRCProgress *)self setUserInfoObject:v15 forKey:*MEMORY[0x1E4F28828]];
    if (v6 == 1) {
      id v24 = (id)*MEMORY[0x1E4F28880];
    }
    else {
      id v24 = *v23;
    }
    v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v26 = _BRLocalizedStringWithFormat();
    -[BRCProgress setLocalizedDescription:](self, "setLocalizedDescription:", v26, v15);
  }
  else
  {
    if (v6 == 1) {
      v27 = (void *)*MEMORY[0x1E4F28880];
    }
    else {
      v27 = (void *)*MEMORY[0x1E4F28858];
    }
    id v24 = v27;
  }
  [(BRCProgress *)self setUserInfoObject:v24 forKey:*MEMORY[0x1E4F28868]];
  if ([v24 isEqualToString:*v23] && objc_msgSend(v8, "isFault"))
  {
    [(BRCProgress *)self setCancellable:1];
    v28 = [v8 clientZone];
    v48 = (void *)[v8 dbRowID];
    objc_initWeak((id *)buf, self);
    v29 = [v8 st];
    v30 = [v29 filename];

    v31 = [v8 clientZone];
    v32 = [v31 taskTracker];

    v33 = [v28 db];
    v34 = [v33 serialQueue];

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke;
    v55[3] = &unk_1E6993F98;
    id v47 = v30;
    id v56 = v47;
    id v35 = v32;
    id v57 = v35;
    id v36 = v34;
    id v58 = v36;
    id v37 = v28;
    id v59 = v37;
    v60[1] = v48;
    objc_copyWeak(v60, (id *)buf);
    [(BRCProgress *)self setCancellationHandler:v55];
    objc_destroyWeak(v60);

    objc_destroyWeak((id *)buf);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v38 = [v8 reverseAliasEnumerator];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(v38);
        }
        [(BRCProgress *)self addAliasItem:*(void *)(*((void *)&v51 + 1) + 8 * i)];
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v39);
  }

  v42 = brc_bread_crumbs();
  v43 = brc_notifications_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v44 = [v50 path];
    *(_DWORD *)buf = 138412802;
    v64 = self;
    __int16 v65 = 2112;
    uint64_t v66 = (uint64_t)v44;
    __int16 v67 = 2112;
    v68 = v42;
    _os_log_debug_impl(&dword_1D353B000, v43, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);
  }
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9438760]();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCProgress _setupProgressForDocument:group:sizeInfo:]_block_invoke", 290, v18);
  v3 = brc_bread_crumbs();
  objc_super v4 = brc_notifications_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v18[0];
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx User requested to cancel download for %@%@", buf, 0x20u);
  }

  objc_super v5 = *(void **)(a1 + 40);
  int v6 = *(void **)(a1 + 48);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_55;
  char v14 = &unk_1E6993F70;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  id v15 = v7;
  uint64_t v17 = v8;
  id v16 = *(id *)(a1 + 40);
  brc_task_tracker_async_with_logs(v5, v6, &v11, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "brc_unpublish", v11, v12, v13, v14);

  __brc_leave_section(v18);
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_55(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemByRowID:*(void *)(a1 + 48)];
  id v4 = [v2 asDocument];

  v3 = v4;
  if (v4)
  {
    [v4 evictInTask:*(void *)(a1 + 40) options:1 error:0];
    v3 = v4;
  }
}

- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5
{
  uint64_t v6 = a4;
  id v10 = a3;
  id v8 = a5;
  if ([v10 isOnDisk])
  {
    id v9 = [v10 session];
    [(BRCProgress *)self setSession:v9 parentFileIDs:0 group:v6];

    [(BRCProgress *)self _setupProgressForDocument:v10 group:v6 sizeInfo:v8];
  }
}

+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([v7 isOnDisk])
  {
    id v9 = [[BRCItemToPathLookup alloc] initWithItem:v7];
    id v10 = [(BRCItemToPathLookup *)v9 coordinatedWriteURL];
    if (v10)
    {
      uint64_t v11 = [BRCProgress alloc];
      uint64_t v12 = [v7 session];
      __int16 v13 = [(BRCProgress *)v11 initWithGroup:v6 parentFileIDs:0 session:v12];

      if (v13) {
        [(BRCProgress *)v13 _setupProgressForDocument:v7 group:v6 sizeInfo:v8];
      }
    }
    else
    {
      __int16 v13 = 0;
    }
  }
  else
  {
    __int16 v13 = 0;
  }

  return v13;
}

- (void)addAliasItem:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 clientZone];
  id v7 = [v6 mangledID];
  id v8 = [v7 aliasTargetContainerString];

  progressByAliasContainerID = v5->_progressByAliasContainerID;
  if (!progressByAliasContainerID)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = v5->_progressByAliasContainerID;
    v5->_progressByAliasContainerID = v10;

    progressByAliasContainerID = v5->_progressByAliasContainerID;
  }
  uint64_t v12 = [(NSMutableDictionary *)progressByAliasContainerID objectForKeyedSubscript:v8];

  if (!v12)
  {
    int v37 = 0;
    __int16 v13 = [[BRCItemToPathLookup alloc] initWithItem:v4];
    char v14 = [(BRCItemToPathLookup *)v13 byFileSystemID];
    if ([v14 resolveMustExist:1 error:&v37])
    {
      id v15 = [v14 physicalURL];
      id v16 = [[BRCProgress alloc] initWithParent:0 userInfo:0];
      p_super = &v16->super.super;
      if (!v15)
      {
        v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
          -[BRCProgress addAliasItem:]();
        }

        goto LABEL_25;
      }
      if (v16)
      {
        [(BRCProgress *)v16 setTotalUnitCount:[(BRCProgress *)v5 totalUnitCount]];
        [p_super setCompletedUnitCount:[(BRCProgress *)v5 completedUnitCount]];
        [p_super setKind:*MEMORY[0x1E4F28898]];
        [p_super setCancellable:0];
        uint64_t v18 = *MEMORY[0x1E4F28890];
        [p_super setUserInfoObject:v15 forKey:*MEMORY[0x1E4F28890]];
        [p_super setUserInfoObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F593A8]];
        v19 = [(BRCProgress *)v5 userInfo];
        v33 = [v19 objectForKey:v18];

        id v36 = 0;
        uint64_t v20 = *MEMORY[0x1E4F1C6C8];
        id v35 = 0;
        LOBYTE(v18) = [v33 getResourceValue:&v36 forKey:v20 error:&v35];
        id v32 = v36;
        id v31 = v35;
        if ((v18 & 1) == 0)
        {
          __int16 v21 = brc_bread_crumbs();
          uint64_t v22 = brc_notifications_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v39 = v33;
            __int16 v40 = 2112;
            *(void *)v41 = v31;
            *(_WORD *)&v41[8] = 2112;
            *(void *)&v41[10] = v21;
            _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[NOTIF] can't get the filename of %@: %@%@", buf, 0x20u);
          }
        }
        if (v32) {
          [p_super setUserInfoObject:v32 forKey:*MEMORY[0x1E4F28828]];
        }
        __int16 v23 = [(BRCProgress *)v5 userInfo];
        uint64_t v24 = *MEMORY[0x1E4F28868];
        v34 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];

        if (v34) {
          [p_super setUserInfoObject:v34 forKey:v24];
        }
        if ([(BRCProgress *)v5 isCancellable])
        {
          [p_super setCancellable:1];
          uint64_t v25 = [(BRCProgress *)v5 cancellationHandler];
          [p_super setCancellationHandler:v25];
        }
        if (v5->_published) {
          [p_super brc_publish];
        }
        [(NSMutableDictionary *)v5->_progressByAliasContainerID setObject:p_super forKeyedSubscript:v8];
        v26 = brc_bread_crumbs();
        v27 = brc_notifications_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v30 = [v15 path];
          *(_DWORD *)buf = 138412802;
          uint64_t v39 = p_super;
          __int16 v40 = 2112;
          *(void *)v41 = v30;
          *(_WORD *)&v41[8] = 2112;
          *(void *)&v41[10] = v26;
          _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v15 = brc_bread_crumbs();
      p_super = brc_default_log();
      if (os_log_type_enabled(p_super, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v39 = v14;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v37;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v15;
        _os_log_error_impl(&dword_1D353B000, p_super, (os_log_type_t)0x90u, "[ERROR] can't resolve %@ %{errno}d%@", buf, 0x1Cu);
      }
    }

    [(BRCItemToPathLookup *)v13 closePaths];
LABEL_25:
  }
  objc_sync_exit(v5);
}

- (BOOL)isPublished
{
  return self->_published;
}

- (NSArray)parentFileIDs
{
  return self->_parentFileIDs;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_parentFileIDs, 0);
  objc_storeStrong((id *)&self->_progressByAliasContainerID, 0);
}

- (void)_setupProgressForDocument:(uint64_t)a1 group:(NSObject *)a2 sizeInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: url%@", (uint8_t *)&v2, 0xCu);
}

- (void)addAliasItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] can't get URL for %@%@", v1, 0x16u);
}

@end