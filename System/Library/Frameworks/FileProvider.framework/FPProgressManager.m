@interface FPProgressManager
+ (id)defaultManager;
- (FPProgressManager)init;
- (id)_progressForItem:(id)a3 usingProgressMap:(id)a4;
- (id)copyProgressForItem:(id)a3;
- (id)downloadProgressForItem:(id)a3;
- (id)removeCopyProgress:(id)a3;
- (id)uploadProgressForItem:(id)a3;
- (void)_resolveURLForItem:(id)a3 completionHandler:(id)a4;
- (void)attachProgressToItemsIfNeeded:(id)a3;
- (void)registerCopyProgress:(id)a3 forItemID:(id)a4;
- (void)removeCopyProgressForItemID:(id)a3;
- (void)removeDownloadProgressForItemID:(id)a3;
@end

@implementation FPProgressManager

void __41__FPProgressManager_copyProgressForItem___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [*(id *)(a1 + 40) itemID];
  uint64_t v3 = [v2 anyObjectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)defaultManager_defaultManager;

  return v2;
}

- (id)copyProgressForItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FPProgressManager_copyProgressForItem___block_invoke;
  block[3] = &unk_1E5AF17F8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)attachProgressToItemsIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412802;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDownloading", v13) & 1) != 0 || objc_msgSend(v9, "isUploading"))
        {
          id v10 = [v9 progress];
          if (v10)
          {
            v11 = fp_current_or_default_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v12 = objc_opt_class();
              *(_DWORD *)buf = v13;
              uint64_t v19 = v12;
              __int16 v20 = 2048;
              v21 = v10;
              __int16 v22 = 2112;
              v23 = v9;
              _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] progress <%@:%p> attached to %@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v6);
  }
}

uint64_t __35__FPProgressManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager = objc_alloc_init(FPProgressManager);

  return MEMORY[0x1F41817F8]();
}

- (FPProgressManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)FPProgressManager;
  v2 = [(FPProgressManager *)&v13 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.FileProvider.item-progress-manager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    downloadProgressPerItemIDs = v2->_downloadProgressPerItemIDs;
    v2->_downloadProgressPerItemIDs = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uploadProgressPerItemIDs = v2->_uploadProgressPerItemIDs;
    v2->_uploadProgressPerItemIDs = (NSMapTable *)v8;

    id v10 = objc_alloc_init(FPOneToManyWeakMap);
    copyProgressPerItemIDs = v2->_copyProgressPerItemIDs;
    v2->_copyProgressPerItemIDs = v10;
  }
  return v2;
}

- (void)registerCopyProgress:(id)a3 forItemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__FPProgressManager_registerCopyProgress_forItemID___block_invoke;
  block[3] = &unk_1E5AF17D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __52__FPProgressManager_registerCopyProgress_forItemID___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) addObject:a1[5] forKey:a1[6]];
}

- (void)removeCopyProgressForItemID:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__FPProgressManager_removeCopyProgressForItemID___block_invoke;
    v7[3] = &unk_1E5AF0748;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __49__FPProgressManager_removeCopyProgressForItemID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKey:*(void *)(a1 + 40)];
}

- (void)removeDownloadProgressForItemID:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__FPProgressManager_removeDownloadProgressForItemID___block_invoke;
    v7[3] = &unk_1E5AF0748;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __53__FPProgressManager_removeDownloadProgressForItemID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)removeCopyProgress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FPProgressManager_removeCopyProgress___block_invoke;
  block[3] = &unk_1E5AF17F8;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(queue, block);
  id v7 = [(id)v13[5] firstObject];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __40__FPProgressManager_removeCopyProgress___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) removeObject:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)downloadProgressForItem:(id)a3
{
  id v3 = [(FPProgressManager *)self _progressForItem:a3 usingProgressMap:self->_downloadProgressPerItemIDs];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F28858];
    if ((objc_msgSend(v3, "fp_isOfFileOperationKind:", *MEMORY[0x1E4F28858]) & 1) == 0)
    {
      long long v15 = objc_msgSend(v4, "fp_fileOperationKind");
      fp_simulate_crash(@"[Progress] Progress kind %@ should be \"downloading\" but instead it's \"%@\"", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v4);

      id v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[FPProgressManager downloadProgressForItem:](v4);
      }

      objc_msgSend(v4, "fp_setFileOperationKind:", v5);
    }
  }

  return v4;
}

- (id)uploadProgressForItem:(id)a3
{
  id v3 = [(FPProgressManager *)self _progressForItem:a3 usingProgressMap:self->_uploadProgressPerItemIDs];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F28880];
    if ((objc_msgSend(v3, "fp_isOfFileOperationKind:", *MEMORY[0x1E4F28880]) & 1) == 0)
    {
      long long v15 = objc_msgSend(v4, "fp_fileOperationKind");
      fp_simulate_crash(@"[Progress] Progress kind %@ should be \"uploading\" but instead it's \"%@\"", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v4);

      id v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[FPProgressManager uploadProgressForItem:](v4);
      }

      objc_msgSend(v4, "fp_setFileOperationKind:", v5);
    }
  }

  return v4;
}

- (void)_resolveURLForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [v6 fileURL];

  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 fileURL];
  int v10 = [v9 startAccessingSecurityScopedResource];
  int v11 = objc_msgSend(v9, "fp_checkSandboxFileMetadataRead");
  if (v10) {
    [v9 stopAccessingSecurityScopedResource];
  }
  if (!v11)
  {

LABEL_7:
    uint64_t v9 = +[FPItemManager defaultManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke;
    v12[3] = &unk_1E5AF1848;
    v12[4] = self;
    id v13 = v7;
    [v9 fetchURLForItem:v6 creatingPlaceholderIfMissing:1 completionHandler:v12];

    goto LABEL_8;
  }
  (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
LABEL_8:
}

void __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke_2;
  block[3] = &unk_1E5AF1820;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __58__FPProgressManager__resolveURLForItem_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_progressForItem:(id)a3 usingProgressMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke;
  block[3] = &unk_1E5AF18E8;
  id v15 = v8;
  long long v16 = self;
  id v17 = v7;
  v18 = &v20;
  SEL v19 = a2;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(queue, block);
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v12;
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);
  BOOL v4 = v2 == v3;
  uint64_t section = __fp_create_section();
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v28 = @"download";
    uint64_t v29 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    if (v2 == v3) {
      v28 = @"upload";
    }
    uint64_t v39 = section;
    __int16 v40 = 2112;
    v41 = v28;
    __int16 v42 = 2112;
    uint64_t v43 = v29;
    _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx [Progress] looking up for %@ progress of %@", buf, 0x20u);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 48) itemID];
  uint64_t v9 = [v7 objectForKey:v8];
  uint64_t v10 = a1 + 56;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  id v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v13 && ([v13 isCancelled] & 1) == 0)
  {
    v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_cold_1(v10, v27);
    }
  }
  else
  {
    id v14 = (id *)MEMORY[0x1E4F28880];
    if (v2 != v3) {
      id v14 = (id *)MEMORY[0x1E4F28858];
    }
    id v15 = *v14;
    long long v16 = objc_alloc_init(_FPParentProgress);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTotalUnitCount:-1];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "fp_setFileOperationKind:", v15);
    SEL v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v21 = [*(id *)(a1 + 48) itemID];
    [v19 setObject:v20 forKey:v21];

    v23 = *(void **)(a1 + 40);
    uint64_t v22 = *(void **)(a1 + 48);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48;
    v30[3] = &unk_1E5AF18C0;
    v30[4] = v23;
    uint64_t v35 = section;
    id v24 = v22;
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 64);
    id v31 = v24;
    uint64_t v34 = v25;
    id v26 = *(id *)(a1 + 32);
    BOOL v37 = v4;
    id v32 = v26;
    id v33 = v15;
    v27 = v15;
    [v23 _resolveURLForItem:v24 completionHandler:v30];
  }
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v35 = *(void *)(a1 + 72);
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    SEL v19 = objc_msgSend(v5, "fp_shortDescription");
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    v45 = v20;
    _os_log_debug_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] got url %@, creating child progress for %@", buf, 0x20u);
  }
  if (v6)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = objc_msgSend(v6, "fp_prettyDescription");
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_3(v9, v10, buf, v8);
    }
  }
  else if (v5)
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v12 = *(void **)(a1 + 48);
    id v13 = [*(id *)(a1 + 40) itemID];
    id v14 = [v12 objectForKey:v13];
    LOBYTE(v11) = [v11 isEqual:v14];

    if (v11)
    {
      id v8 = objc_opt_new();
      id location = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__0;
      v46 = __Block_byref_object_dispose__0;
      id v47 = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_57;
      v29[3] = &unk_1E5AF1898;
      objc_copyWeak(v33, &location);
      uint64_t v15 = *(void *)(a1 + 64);
      id v31 = buf;
      uint64_t v32 = v15;
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = *(void **)(a1 + 72);
      id v30 = v16;
      v33[1] = v17;
      [v8 setProgressDidSetupHandler:v29];
      if (*(unsigned char *)(a1 + 88)) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = [*(id *)(a1 + 40) isExternalDownloadPlaceholder];
      }
      [v8 startTrackingFileURL:v5 kind:*(void *)(a1 + 56) allowReadPausedProgressFromDisk:v18];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setProgressProxy:v8];
      uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
      if (v21)
      {
        uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v23 = [*(id *)(a1 + 40) documentSize];
        objc_msgSend(v22, "fp_addChildProgress:withUnitCount:", v21, v23);

        uint64_t v28 = *(void *)(a1 + 72);
        id v24 = fp_current_or_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = *(void *)(a1 + 40);
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v27 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)uint64_t v36 = 134218754;
          uint64_t v37 = v28;
          __int16 v38 = 2112;
          uint64_t v39 = v25;
          __int16 v40 = 2112;
          uint64_t v41 = v26;
          __int16 v42 = 2112;
          uint64_t v43 = v27;
          _os_log_debug_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] Added child progress for %@: %@, child %@", v36, 0x2Au);
        }

        __fp_leave_section_Debug((uint64_t)&v28);
      }

      objc_destroyWeak(v33);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      id v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_2(v8);
      }
    }
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_1(v8);
    }
  }

  __fp_leave_section_Debug((uint64_t)&v35);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_57(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    if (a3)
    {
      dispatch_assert_queue_V2(WeakRetained[1]);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_2;
      v12[3] = &unk_1E5AF1870;
      uint64_t v15 = *(void *)(a1 + 48);
      id v13 = v6;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 64);
      id v14 = v10;
      uint64_t v16 = v11;
      dispatch_async(v9, v12);
    }
  }
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = [*(id *)(a1 + 40) documentSize];
  objc_msgSend(v2, "fp_addChildProgress:withUnitCount:", v3, v4);

  uint64_t v9 = *(void *)(a1 + 56);
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_debug_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx [Progress] Added child progress for %@: %@, child %@", buf, 0x2Au);
  }

  __fp_leave_section_Debug((uint64_t)&v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copyProgressPerItemIDs, 0);
  objc_storeStrong((id *)&self->_uploadProgressPerItemIDs, 0);
  objc_storeStrong((id *)&self->_downloadProgressPerItemIDs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)downloadProgressForItem:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_fileOperationKind");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_35(&dword_1A33AE000, v2, v3, "[SIMCRASH] [Progress] Progress kind %@ should be \"downloading\" but instead it's \"%@\"", v4, v5, v6, v7, v8);
}

- (void)uploadProgressForItem:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_fileOperationKind");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_35(&dword_1A33AE000, v2, v3, "[SIMCRASH] [Progress] Progress kind %@ should be \"uploading\" but instead it's \"%@\"", v4, v5, v6, v7, v8);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] [Progress] found existing progress %@", (uint8_t *)&v3, 0xCu);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] [Progress] can't create child children because URL is required; parent progress will remain indeterminate th"
    "roughout the transfer",
    v1,
    2u);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] [Progress] URL was fetched for a different progress no need to attach children", v1, 2u);
}

void __55__FPProgressManager__progressForItem_usingProgressMap___block_invoke_48_cold_3(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] [Progress] can't retrieve URL for %@; %@",
    buf,
    0x16u);
}

@end