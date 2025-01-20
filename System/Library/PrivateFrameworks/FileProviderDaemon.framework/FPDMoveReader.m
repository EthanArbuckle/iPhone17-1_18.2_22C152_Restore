@interface FPDMoveReader
+ (BOOL)_hasDiskWriterSupportForDomain:(id)a3;
- (BOOL)_enqueueItem:(id)a3 forRoot:(id)a4 atomically:(BOOL)a5 useDiskWriter:(BOOL)a6;
- (BOOL)_isCancelled;
- (BOOL)_isRootCancelled:(id)a3;
- (BOOL)_isSingleMoveForRoot:(id)a3;
- (BOOL)_isSinglePkgCopyForRoot:(id)a3;
- (BOOL)_shouldCheckFileSystemBitsForRoot:(id)a3 targetFolderURL:(id)a4;
- (BOOL)_shouldCheckSpaceForRoot:(id)a3 targetFolderURL:(id)a4;
- (BOOL)_shouldUseDiskWriterToPerformMoveForItem:(id)a3;
- (FPDMoveReader)init;
- (FPDMoveReader)initWithMoveWriter:(id)a3 operation:(id)a4 queue:(id)a5;
- (id)_getTargetFolderFor:(id)a3 root:(id)a4 error:(id *)a5;
- (id)_iteratorForRoot:(id)a3 enforceFPItem:(BOOL)a4 error:(id *)a5;
- (id)_targetNameForSource:(id)a3;
- (id)errorBlock;
- (id)preflightCompletionBlock;
- (id)rootPreflightCompletionBlock;
- (id)startDownloadBlock;
- (int64_t)_fileSizeBitsSupportAtPath:(id)a3;
- (void)_bailOutOfRoot:(id)a3;
- (void)_enqueueAtomsForRoot:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_getSpaceForWriteSize:(int64_t)a3 atTargetPath:(id)a4 completion:(id)a5;
- (void)_progressComputationPreflight:(id)a3 completion:(id)a4;
- (void)_run;
- (void)_runWithDownloadedTarget:(id)a3;
- (void)_t_unblock;
- (void)_t_waitForUnblock;
- (void)cancel;
- (void)cancelRoot:(id)a3;
- (void)dumpStateTo:(id)a3;
- (void)setErrorBlock:(id)a3;
- (void)setPreflightCompletionBlock:(id)a3;
- (void)setRootPreflightCompletionBlock:(id)a3;
- (void)setStartDownloadBlock:(id)a3;
- (void)start;
- (void)verifyTargetURL:(id)a3;
@end

@implementation FPDMoveReader

- (FPDMoveReader)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should not call this"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDMoveReader init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 66, (const char *)[v2 UTF8String]);
}

- (FPDMoveReader)initWithMoveWriter:(id)a3 operation:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)FPDMoveReader;
  v11 = [(FPDMoveReader *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_operation, v9);
    uint64_t v13 = [v9 info];
    info = v12->_info;
    v12->_info = (FPMoveInfo *)v13;

    objc_storeWeak((id *)&v12->_moveQueue, v10);
    objc_storeWeak((id *)&v12->_writer, v8);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, (dispatch_qos_class_t)[(FPMoveInfo *)v12->_info qos], 0);
    dispatch_queue_t v17 = dispatch_queue_create("FileProvider.move-reader", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_opt_new();
    cancelledRoots = v12->_cancelledRoots;
    v12->_cancelledRoots = (NSMutableSet *)v19;

    uint64_t section = __fp_create_section();
    v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader initWithMoveWriter:operation:queue:]();
    }

    v12->_logSection = section;
    if ([(FPMoveInfo *)v12->_info _t_clientDrivenReader])
    {
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      clientUnblockSema = v12->_clientUnblockSema;
      v12->_clientUnblockSema = (OS_dispatch_semaphore *)v23;
    }
  }

  return v12;
}

- (void)verifyTargetURL:(id)a3
{
  int v4 = (void (**)(id, void *, void))a3;
  v5 = [(FPMoveInfo *)self->_info targetFolder];
  char v6 = [v5 isExternalURL];
  v7 = [(FPMoveInfo *)self->_info targetFolder];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 asURL];
  }
  else
  {
    id v10 = [v7 asFPItem];
    id v9 = [v10 fileURL];
  }
  if (v9)
  {
    v4[2](v4, v9, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    v12 = [WeakRetained manager];
    uint64_t v13 = [(FPMoveInfo *)self->_info targetFolder];
    v14 = [v13 asFPItem];
    v15 = [v14 itemID];
    v16 = [v12 domainFromItemID:v15 reason:0];

    dispatch_queue_t v17 = [v16 defaultBackend];
    v18 = [(FPMoveInfo *)self->_info targetFolder];
    uint64_t v19 = [v18 asFPItem];
    v20 = [v19 itemID];
    v21 = +[FPDRequest requestForSelf];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __33__FPDMoveReader_verifyTargetURL___block_invoke;
    v22[3] = &unk_1E6A75250;
    v22[4] = self;
    dispatch_semaphore_t v23 = v4;
    [v17 URLForItemID:v20 creatingPlaceholderIfMissing:1 ignoreAlternateContentsURL:1 forBookmarkResolution:0 request:v21 completionHandler:v22];
  }
}

void __33__FPDMoveReader_verifyTargetURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    int v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v5 = [a3 url];
    char v6 = [*(id *)(*(void *)(a1 + 32) + 16) targetFolder];
    v7 = [v6 asFPItem];
    [v7 setFileURL:v5];

    id v8 = [*(id *)(*(void *)(a1 + 32) + 16) targetFolder];
    id v9 = [v8 asFPItem];
    id v10 = [v9 fileURL];
    [v10 stopAccessingSecurityScopedResource];

    uint64_t v11 = *(void *)(a1 + 40);
    id v14 = [*(id *)(*(void *)(a1 + 32) + 16) targetFolder];
    v12 = [v14 asFPItem];
    uint64_t v13 = [v12 fileURL];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v13, 0);
  }
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __22__FPDMoveReader_start__block_invoke;
  v2[3] = &unk_1E6A74788;
  v2[4] = self;
  [(FPDMoveReader *)self verifyTargetURL:v2];
}

void __22__FPDMoveReader_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __22__FPDMoveReader_start__block_invoke_cold_1(v6);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 80);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __22__FPDMoveReader_start__block_invoke_6;
  v11[3] = &unk_1E6A736C0;
  v11[4] = v8;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, v11);
}

uint64_t __22__FPDMoveReader_start__block_invoke_6(uint64_t a1)
{
  uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 88);
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __22__FPDMoveReader_start__block_invoke_6_cold_1((uint64_t)&v19, v2, v3, v4, v5, v6, v7, v8);
  }

  char v9 = [*(id *)(a1 + 40) startAccessingSecurityScopedResource];
  uint64_t v11 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __22__FPDMoveReader_start__block_invoke_7;
  v15[3] = &unk_1E6A75278;
  char v18 = v9;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 32);
  id v16 = v12;
  uint64_t v17 = v13;
  [v11 _progressComputationPreflight:v12 completion:v15];

  return __fp_leave_section_Debug();
}

uint64_t __22__FPDMoveReader_start__block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 _run];
}

- (BOOL)_isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->__cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)_finishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(FPDMoveReader *)self _isCancelled])
  {
    uint64_t v6 = fp_current_or_default_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        -[FPDMoveReader _finishWithError:](v5);
      }
    }
    else if (v7)
    {
      -[FPDMoveReader _finishWithError:]();
    }

    self->__BOOL cancelled = 1;
    objc_storeStrong((id *)&self->_error, a3);
    errorBlock = (void (**)(id, id))self->_errorBlock;
    if (v5 && errorBlock)
    {
      errorBlock[2](errorBlock, v5);
      errorBlock = (void (**)(id, id))self->_errorBlock;
    }
    self->_errorBlock = 0;
  }
}

- (id)_iteratorForRoot:(id)a3 enforceFPItem:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 isProviderItem])
  {
    char v9 = [v8 asFPItem];
    uint64_t v26 = 0;
    p_operation = &self->_operation;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    id v12 = [WeakRetained manager];
    uint64_t v13 = [v9 itemID];
    id v14 = [v13 providerDomainID];
    v15 = [v12 domainWithID:v14 reason:&v26];

    if (v15)
    {
      if ([v15 isUsingFPFS])
      {
        id v16 = +[FPDIterator hybridIteratorForItem:v9 domain:v15 enforceFPItem:v6];
      }
      else
      {
        id v22 = objc_loadWeakRetained((id *)p_operation);
        dispatch_semaphore_t v23 = [v22 manager];
        id v16 = +[FPDIterator iteratorForLocator:v8 manager:v23];

        v24 = [v8 asFPItem];
        objc_msgSend(v16, "setShouldDecorateItems:", objc_msgSend(v24, "isRecursivelyDownloaded") ^ 1);
      }
    }
    else
    {
      if (a5)
      {
        uint64_t v19 = [v9 itemID];
        v20 = [v19 providerDomainID];
        FPProviderNotFoundError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[FPDMoveReader _iteratorForRoot:enforceFPItem:error:](v9);
      }

      id v16 = 0;
    }
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)&self->_operation);
    char v18 = [v17 manager];
    id v16 = +[FPDIterator iteratorForLocator:v8 manager:v18];
  }
  return v16;
}

- (void)_progressComputationPreflight:(id)a3 completion:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v52 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FPDMoveReader _progressComputationPreflight:completion:]();
  }

  self->_startedPreflight = 1;
  id v8 = [(FPMoveInfo *)self->_info targetFolder];
  self->_isTargetFolderMaterialized = [v8 isDownloaded];

  char v9 = [v6 path];
  uint64_t v59 = [(FPDMoveReader *)self _fileSizeBitsSupportAtPath:v9];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v10 = [(FPMoveInfo *)self->_info roots];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:v91 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v64 = 0;
    uint64_t v13 = *(void *)v76;
    location = (id *)&self->_operation;
    id v55 = v6;
    v56 = v10;
    uint64_t v53 = *(void *)v76;
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v54 = v12;
    while (1)
    {
      if (*(void *)v76 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v65 = v14;
      uint64_t v15 = *(void *)(*((void *)&v75 + 1) + 8 * v14);
      if ([(FPDMoveReader *)self _isCancelled]) {
        break;
      }
      if (!self->_isTargetFolderMaterialized && !self->_willMaterializeTargetFolder)
      {
        id v16 = [(FPMoveInfo *)self->_info targetFolder];
        id WeakRetained = objc_loadWeakRetained(location);
        char v18 = [WeakRetained manager];
        self->_BOOL willMaterializeTargetFolder = [v16 willRequireDownloadForSourceItem:v15 extensionManager:v18];
      }
      if ([(FPDMoveReader *)self _isSingleMoveForRoot:v15])
      {
        uint64_t v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          BOOL willMaterializeTargetFolder = self->_willMaterializeTargetFolder;
          *(_DWORD *)buf = 138412546;
          uint64_t v80 = v15;
          __int16 v81 = 1024;
          LODWORD(v82) = willMaterializeTargetFolder;
          _os_log_debug_impl(&dword_1D744C000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: preflight for root: %@, atomic move, willMaterializeTargetFolder=%{BOOL}d", buf, 0x12u);
        }

        v20 = [(FPDMoveReader *)self rootPreflightCompletionBlock];
        v20[2](v20, v15, 1, 0, 0);
      }
      else
      {
        id v74 = 0;
        v21 = [(FPDMoveReader *)self _iteratorForRoot:v15 enforceFPItem:0 error:&v74];
        id v22 = v74;
        dispatch_semaphore_t v23 = v22;
        if (!v21)
        {
          [(FPDMoveReader *)self _finishWithError:v22];
          v47 = v52;
          goto LABEL_68;
        }
        id v57 = v22;
        BOOL v24 = [(FPDMoveReader *)self _shouldCheckFileSystemBitsForRoot:v15 targetFolderURL:v6];
        BOOL v66 = [(FPDMoveReader *)self _shouldCheckSpaceForRoot:v15 targetFolderURL:v6];
        if (([v21 done] & 1) == 0)
        {
          char v58 = 0;
          uint64_t v25 = 0;
          uint64_t v67 = 0;
          uint64_t v26 = 0;
          BOOL v27 = v59 > 0 && v24;
          BOOL v63 = v27;
          uint64_t v60 = v15;
          v61 = v21;
          while (1)
          {
            v28 = (void *)MEMORY[0x1D9471CC0]();
            if ([(FPDMoveReader *)self _isCancelled])
            {
              v47 = v52;
              v52[2](v52);
              id v6 = v55;
              goto LABEL_67;
            }
            if ([(FPDMoveReader *)self _isRootCancelled:v15])
            {
              uint64_t v26 = 0;
              uint64_t v67 = 0;
LABEL_46:
              goto LABEL_47;
            }
            id v73 = 0;
            v29 = [v21 nextWithError:&v73];
            id v30 = v73;
            if (v63 && [v29 size] > v59) {
              break;
            }
            if (v29) {
              BOOL v31 = v66;
            }
            else {
              BOOL v31 = 0;
            }
            if (v31)
            {
              v64 += [v29 size];
            }
            else if (!v29 && v30)
            {
              v50 = fp_current_or_default_log();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                -[FPDMoveReader _progressComputationPreflight:completion:](v30);
              }

              [(FPDMoveReader *)self _finishWithError:v30];
              v47 = v52;
              v52[2](v52);
              goto LABEL_66;
            }
            if ([v21 done] || !v29)
            {

              goto LABEL_46;
            }
            uint64_t v68 = v25;
            v32 = [(FPMoveInfo *)self->_info targetFolder];
            v33 = [v29 filename];
            LOBYTE(v51) = 0;
            v34 = +[FPDMoveAtom atomForMoving:v29 toTargetFolder:v32 as:v33 root:v15 atomically:0 sourceMaterializeOption:0 targetMaterializeOption:0 useDiskWriter:v51];

            info = self->_info;
            id v36 = objc_loadWeakRetained(location);
            v37 = [v36 manager];
            LODWORD(info) = [v34 shouldAccountForDownloadOfSourceItemForMoveInfo:info extensionManager:v37];

            if (info)
            {
              v67 += [v29 size];
              char v58 = 1;
            }
            if (([v29 requiresCrossDeviceCopy] & 1) != 0
              || ([(FPMoveInfo *)self->_info targetFolder],
                  v38 = objc_claimAutoreleasedReturnValue(),
                  int v39 = [v38 requiresCrossDeviceCopy],
                  v38,
                  v39))
            {
              uint64_t v25 = [v29 size] + v68;
            }
            else
            {
              uint64_t v25 = v68;
            }

            v21 = v61;
            ++v26;
            uint64_t v15 = v60;
            if ([v61 done]) {
              goto LABEL_47;
            }
          }
          v48 = fp_current_or_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[FPDMoveReader _progressComputationPreflight:completion:]();
          }

          v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:27 userInfo:MEMORY[0x1E4F1CC08]];
          [(FPDMoveReader *)self _finishWithError:v49];
          v47 = v52;
          v52[2](v52);

LABEL_66:
          id v6 = v55;

LABEL_67:
          dispatch_semaphore_t v23 = v57;
LABEL_68:

          id v10 = v56;
LABEL_69:

          goto LABEL_70;
        }
        uint64_t v25 = 0;
        char v58 = 0;
        uint64_t v26 = 0;
        uint64_t v67 = 0;
LABEL_47:
        v40 = fp_current_or_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          BOOL v43 = self->_willMaterializeTargetFolder;
          *(_DWORD *)buf = 138413570;
          uint64_t v80 = v15;
          __int16 v81 = 2048;
          uint64_t v82 = v26;
          __int16 v83 = 2048;
          uint64_t v84 = v67;
          __int16 v85 = 2048;
          uint64_t v86 = v25;
          __int16 v87 = 1024;
          int v88 = v58 & 1;
          __int16 v89 = 1024;
          BOOL v90 = v43;
          _os_log_debug_impl(&dword_1D744C000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: preflight for root: %@, numItems:%lu, undownloadedSize:%lu, crossDeviceCopySize:%lu,                   isRequiringDownload:%{BOOL}d, willMaterializeTargetFolder:%{BOOL}d", buf, 0x36u);
        }

        v41 = [(FPDMoveReader *)self rootPreflightCompletionBlock];
        v41[2](v41, v15, v26, v67, v25);

        id v6 = v55;
        id v10 = v56;
        uint64_t v13 = v53;
        uint64_t v12 = v54;
        v20 = (void (**)(void, void, void, void, void))v57;
      }

      uint64_t v14 = v65 + 1;
      if (v65 + 1 == v12)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v75 objects:v91 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_54;
      }
    }
    v47 = v52;
    v52[2](v52);
    goto LABEL_69;
  }
  uint64_t v64 = 0;
LABEL_54:

  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke;
  v72[3] = &unk_1E6A73FE8;
  v72[4] = self;
  uint64_t v44 = MEMORY[0x1D9471EC0](v72);
  v45 = (void *)v44;
  if (v64)
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13;
    v69[3] = &unk_1E6A752C8;
    v69[4] = self;
    v70 = v52;
    id v71 = v45;
    v46 = self;
    v47 = v52;
    [(FPDMoveReader *)v46 _getSpaceForWriteSize:v64 atTargetPath:v6 completion:v69];
  }
  else
  {
    (*(void (**)(uint64_t))(v44 + 16))(v44);
    v47 = v52;
    v52[2](v52);
  }

LABEL_70:
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) preflightCompletionBlock];
  v3[2]();

  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_2;
    block[3] = &unk_1E6A752A0;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v3, block);

    id v4 = v10;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:28 userInfo:MEMORY[0x1E4F1CC08]];
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 80);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_14;
    v12[3] = &unk_1E6A73E38;
    v12[4] = v7;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    id v4 = v5;
    dispatch_async(v8, v12);
  }
}

uint64_t __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_getSpaceForWriteSize:(int64_t)a3 atTargetPath:(id)a4 completion:(id)a5
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if (v7)
  {
    uint64_t v9 = *MEMORY[0x1E4F1C800];
    uint64_t v10 = *MEMORY[0x1E4F1C810];
    v45[0] = *MEMORY[0x1E4F1C800];
    v45[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1C858];
    v45[2] = *MEMORY[0x1E4F1C858];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    id v40 = 0;
    id v13 = [v7 resourceValuesForKeys:v12 error:&v40];
    id v14 = v40;
    uint64_t v15 = v14;
    if (v13) {
      goto LABEL_3;
    }
    uint64_t v25 = [v14 domain];
    if ([v25 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v26 = [v15 code];

      if (v26 == 260)
      {
        BOOL v27 = [v7 URLByDeletingLastPathComponent];
        id v39 = v15;
        id v13 = [v27 resourceValuesForKeys:v12 error:&v39];
        id v35 = v39;

        uint64_t v28 = [v7 URLByDeletingLastPathComponent];

        id v7 = (id)v28;
        uint64_t v15 = v35;
        if (v13)
        {
LABEL_3:
          id v16 = [v13 objectForKeyedSubscript:v9];
          int64_t v17 = [v16 longLongValue];

          char v18 = [v13 objectForKeyedSubscript:v11];
          LODWORD(v16) = [v18 BOOLValue];

          if (v16) {
            BOOL v19 = v17 <= 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            v20 = [v13 objectForKeyedSubscript:v10];
            int64_t v21 = [v20 longLongValue];

            if (v21) {
              BOOL v22 = v21 < a3;
            }
            else {
              BOOL v22 = 0;
            }
            uint64_t v23 = !v22;
            v8[2](v8, v23);
          }
          else if (v17 >= a3)
          {
            v8[2](v8, 1);
          }
          else
          {
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke;
            v36[3] = &unk_1E6A752F0;
            v37 = v8;
            int64_t v38 = a3;
            v29 = (void *)MEMORY[0x1D9471EC0](v36);
            id v30 = fp_current_or_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              int64_t v44 = a3;
              _os_log_impl(&dword_1D744C000, v30, OS_LOG_TYPE_INFO, "[INFO] Low disk space: purging to make room for %ld bytes", buf, 0xCu);
            }

            v41[0] = @"CACHE_DELETE_VOLUME";
            BOOL v31 = [v7 path];
            v41[1] = @"CACHE_DELETE_AMOUNT";
            v42[0] = v31;
            v32 = [NSNumber numberWithInteger:a3 + 10485760];
            v42[1] = v32;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
            v33 = CacheDeletePurgeSpaceWithInfo();
          }
LABEL_32:

          goto LABEL_33;
        }
      }
    }
    else
    {
    }
    v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveReader _getSpaceForWriteSize:atTargetPath:completion:]((uint64_t)v7, v15, v34);
    }

    v8[2](v8, 1);
    goto LABEL_32;
  }
  BOOL v24 = fp_current_or_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[FPDMoveReader _getSpaceForWriteSize:atTargetPath:completion:]();
  }

  v8[2](v8, 1);
LABEL_33:
}

uint64_t __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    [v3 longLongValue];

    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)_fileSizeBitsSupportAtPath:(id)a3
{
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 2097156);
  if (v4 < 0)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveReader _fileSizeBitsSupportAtPath:]();
    }
    goto LABEL_9;
  }
  int v5 = v4;
  uint64_t v6 = fpathconf(v4, 18);
  close(v5);
  if (v6 < 0)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveReader _fileSizeBitsSupportAtPath:]();
    }
LABEL_9:

    int64_t v7 = -1;
    goto LABEL_10;
  }
  if (v6) {
    int64_t v7 = (uint64_t)exp2((double)(v6 - 1));
  }
  else {
    int64_t v7 = 0;
  }
LABEL_10:

  return v7;
}

- (BOOL)_shouldCheckSpaceForRoot:(id)a3 targetFolderURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FPMoveInfo *)self->_info byCopy])
  {
    uint64_t v33 = 0;
    long long v32 = xmmword_1D7524648;
    uint64_t v31 = 0;
    memset(v30, 0, sizeof(v30));
    id v8 = [v7 path];
    if (getattrlist((const char *)[v8 fileSystemRepresentation], &v32, v30, 0x28uLL, 0x21u) < 0)
    {
      BOOL v24 = fp_current_or_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[FPDMoveReader _shouldCheckSpaceForRoot:targetFolderURL:](v8);
      }

      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = (BYTE14(v30[0]) & 1) == 0;
    }
    goto LABEL_22;
  }
  if (![v6 isProviderItem]) {
    goto LABEL_8;
  }
  uint64_t v10 = [(FPMoveInfo *)self->_info targetFolder];
  int v11 = [v10 isProviderItem];

  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = [v6 asFPItem];
  id v13 = [v12 providerDomainID];
  id v14 = [(FPMoveInfo *)self->_info targetFolder];
  uint64_t v15 = [v14 asFPItem];
  id v16 = [v15 providerDomainID];
  char v17 = [v13 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
LABEL_8:
    if ([v6 isExternalURL])
    {
      id v8 = [v6 asURL];
    }
    else
    {
      char v18 = [v6 asFPItem];
      id v8 = [v18 fileURL];
    }
    id v29 = 0;
    uint64_t v19 = *MEMORY[0x1E4F1C820];
    id v28 = 0;
    [v8 getResourceValue:&v29 forKey:v19 error:&v28];
    id v20 = v29;
    id v26 = 0;
    id v27 = 0;
    id v21 = v28;
    [v7 getResourceValue:&v27 forKey:v19 error:&v26];
    id v22 = v27;
    id v23 = v26;

    BOOL v9 = v7 && !v23 && v20 && v22 && ![v20 isEqual:v22];
LABEL_22:

    goto LABEL_23;
  }
  BOOL v9 = 0;
LABEL_23:

  return v9;
}

- (BOOL)_shouldCheckFileSystemBitsForRoot:(id)a3 targetFolderURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isProviderItem]) {
    goto LABEL_5;
  }
  id v8 = [(FPMoveInfo *)self->_info targetFolder];
  int v9 = [v8 isProviderItem];

  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [v6 asFPItem];
  int v11 = [v10 providerDomainID];
  uint64_t v12 = [(FPMoveInfo *)self->_info targetFolder];
  id v13 = [v12 asFPItem];
  id v14 = [v13 providerDomainID];
  char v15 = [v11 isEqualToString:v14];

  if (v15)
  {
    LOBYTE(v16) = 0;
  }
  else
  {
LABEL_5:
    if ([v6 isExternalURL])
    {
      char v17 = [v6 asURL];
    }
    else
    {
      char v18 = [v6 asFPItem];
      char v17 = [v18 fileURL];
    }
    id v27 = 0;
    uint64_t v16 = *MEMORY[0x1E4F1C820];
    id v26 = 0;
    [v17 getResourceValue:&v27 forKey:v16 error:&v26];
    id v19 = v27;
    id v24 = 0;
    id v25 = 0;
    id v20 = v26;
    [v7 getResourceValue:&v25 forKey:v16 error:&v24];
    id v21 = v25;
    id v22 = v24;

    LOBYTE(v16) = 0;
    if (v7 && !v22 && v19 && v21) {
      LODWORD(v16) = [v19 isEqual:v21] ^ 1;
    }
  }
  return v16;
}

- (id)_getTargetFolderFor:(id)a3 root:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = [(FPMoveInfo *)self->_info roots];
  int v11 = [v10 containsObject:v8];

  if (v11)
  {
    uint64_t v12 = [(FPMoveInfo *)self->_info targetFolder];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    id v14 = [v8 parentIdentifier];
    uint64_t v12 = [WeakRetained waitForResultOfSourceID:v14 root:v9 error:a5];
  }
  return v12;
}

- (id)_targetNameForSource:(id)a3
{
  id v4 = a3;
  int v5 = [(FPMoveInfo *)self->_info roots];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v4 filename];
  }
  else
  {
    id v8 = [(FPMoveInfo *)self->_info rootFilenames];
    id v7 = [v8 objectAtIndexedSubscript:v6];
  }
  return v7;
}

- (BOOL)_enqueueItem:(id)a3 forRoot:(id)a4 atomically:(BOOL)a5 useDiskWriter:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v33 = 0;
  uint64_t v12 = [(FPDMoveReader *)self _getTargetFolderFor:v10 root:v11 error:&v33];
  id v13 = v33;
  id v14 = v13;
  if (v12)
  {
    id v32 = v13;
    uint64_t v31 = [(FPDMoveReader *)self _targetNameForSource:v10];
    char v15 = [(FPMoveInfo *)self->_info targetFolder];
    uint64_t v16 = [(FPMoveInfo *)self->_info byCopy];
    id v17 = v11;
    BOOL v18 = a6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    id v20 = [WeakRetained manager];
    uint64_t v21 = [v10 materializeOptionForDestinationItem:v15 recursively:v7 isCopy:v16 extensionManager:v20];

    LOBYTE(v30) = v18;
    id v11 = v17;
    id v22 = v31;
    id v23 = +[FPDMoveAtom atomForMoving:v10 toTargetFolder:v12 as:v31 root:v11 atomically:v7 sourceMaterializeOption:v21 targetMaterializeOption:self->_willMaterializeTargetFolder useDiskWriter:v30];
    if (v21)
    {
      id v24 = [(FPDMoveReader *)self startDownloadBlock];

      if (v24)
      {
        id v25 = [(FPDMoveReader *)self startDownloadBlock];
        id v26 = [v23 source];
        id v27 = [v26 asFPItem];
        ((void (**)(void, void *, BOOL, void))v25)[2](v25, v27, v21 == 2, 0);
      }
    }
    id v28 = objc_loadWeakRetained((id *)&self->_moveQueue);
    [v28 enqueue:v23];

    id v14 = v32;
  }
  else
  {
    id v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FPDMoveReader _enqueueItem:forRoot:atomically:useDiskWriter:]((uint64_t)v10, v14);
    }
  }

  return v12 != 0;
}

- (void)_bailOutOfRoot:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDMoveReader _bailOutOfRoot:]();
  }

  if (self->_depth)
  {
    do
    {
      uint64_t v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unint64_t depth = self->_depth;
        *(_DWORD *)buf = 67109120;
        int v12 = depth;
        _os_log_debug_impl(&dword_1D744C000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader:_bailOutOfRoot: adding atomForPostFolder %d", buf, 8u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
      id v8 = +[FPDMoveAtom atomForPostFolderUnderRoot:v4 atomically:0 useDiskWriter:0];
      [WeakRetained enqueue:v8];

      unint64_t v9 = self->_depth - 1;
      self->_unint64_t depth = v9;
    }
    while (v9);
  }
}

- (BOOL)_isSingleMoveForRoot:(id)a3
{
  id v4 = a3;
  if ([(FPMoveInfo *)self->_info byCopy])
  {
    int v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader _isSingleMoveForRoot:]();
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_32;
  }
  if (![(FPMoveInfo *)self->_info byMoving]) {
    goto LABEL_11;
  }
  if (![v4 isProviderItem]) {
    goto LABEL_11;
  }
  uint64_t v6 = [(FPMoveInfo *)self->_info targetFolder];
  int v7 = [v6 isProviderItem];

  if (!v7) {
    goto LABEL_11;
  }
  id v8 = [v4 asFPItem];
  unint64_t v9 = [v8 providerDomainID];
  id v10 = [(FPMoveInfo *)self->_info targetFolder];
  id v11 = [v10 asFPItem];
  int v12 = [v11 providerDomainID];
  int v13 = [v9 isEqualToString:v12];

  if (v13)
  {
    int v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader _isSingleMoveForRoot:]();
    }
    BOOL v14 = 1;
  }
  else
  {
LABEL_11:
    if (![(FPDMoveReader *)self _shouldUseDiskWriterToPerformMoveForItem:v4])
    {
      int v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[FPDMoveReader _isSingleMoveForRoot:].cold.5();
      }
      goto LABEL_16;
    }
    if ([v4 isExternalURL])
    {
      int v5 = [v4 asURL];
    }
    else
    {
      char v15 = [v4 asFPItem];
      int v5 = [v15 fileURL];
    }
    uint64_t v16 = [(FPMoveInfo *)self->_info targetFolder];
    char v17 = [v16 isExternalURL];
    BOOL v18 = [(FPMoveInfo *)self->_info targetFolder];
    id v19 = v18;
    if (v17)
    {
      id v20 = [v18 asURL];
    }
    else
    {
      uint64_t v21 = [v18 asFPItem];
      id v20 = [v21 fileURL];
    }
    id v32 = 0;
    uint64_t v22 = *MEMORY[0x1E4F1C820];
    id v31 = 0;
    [v5 getResourceValue:&v32 forKey:v22 error:&v31];
    id v23 = v32;
    id v29 = 0;
    id v30 = 0;
    id v24 = v31;
    [v20 getResourceValue:&v30 forKey:v22 error:&v29];
    id v25 = v30;
    id v26 = v29;

    if (!v26 && v23 && v20 && [v23 isEqual:v25])
    {
      id v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[FPDMoveReader _isSingleMoveForRoot:]();
      }
      BOOL v14 = 1;
    }
    else
    {
      id v27 = fp_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[FPDMoveReader _isSingleMoveForRoot:].cold.4();
      }
      BOOL v14 = 0;
    }
  }
LABEL_32:

  return v14;
}

- (BOOL)_isSinglePkgCopyForRoot:(id)a3
{
  id v3 = a3;
  if ([v3 isExternalURL])
  {
    id v4 = [v3 asURL];
  }
  else
  {
    int v5 = [v3 asFPItem];

    id v4 = [v5 fileURL];
    id v3 = v5;
  }

  char v6 = objc_msgSend(v4, "fp_isPackage");
  return v6;
}

+ (BOOL)_hasDiskWriterSupportForDomain:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isUsingFPFS] & 1) == 0)
  {
    char v6 = [v4 providerDomainID];
    int v7 = objc_msgSend(v6, "fp_toProviderID");

    if (([v7 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v7 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_shouldUseDiskWriterToPerformMoveForItem:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isProviderItem])
  {
    char v5 = [v4 asFPItem];
  }
  else
  {
    char v5 = 0;
  }
  char v6 = [(FPMoveInfo *)self->_info targetFolder];
  if ([v6 isProviderItem])
  {
    int v7 = [(FPMoveInfo *)self->_info targetFolder];
    id v8 = [v7 asFPItem];
  }
  else
  {
    id v8 = 0;
  }

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
    id v10 = [WeakRetained manager];
    id v11 = [v5 itemID];
    int v12 = [v10 domainFromItemID:v11 reason:0];

    if (v8)
    {
LABEL_9:
      id v13 = objc_loadWeakRetained((id *)&self->_operation);
      BOOL v14 = [v13 manager];
      char v15 = [v8 itemID];
      uint64_t v16 = [v14 domainFromItemID:v15 reason:0];

      goto LABEL_12;
    }
  }
  else
  {
    int v12 = 0;
    if (v8) {
      goto LABEL_9;
    }
  }
  uint64_t v16 = 0;
LABEL_12:
  BOOL v17 = +[FPDMoveReader _hasDiskWriterSupportForDomain:v12];
  if (+[FPDMoveReader _hasDiskWriterSupportForDomain:v16])
  {
    LOBYTE(v18) = [v16 isUsingFPFS];
    if ((v18 & 1) == 0 && v17)
    {
      if ([v12 isUsingFPFS]
        && [v16 isUsingFPFS]
        && (![v4 isProviderItem]
         || ([(FPMoveInfo *)self->_info targetFolder],
             id v19 = objc_claimAutoreleasedReturnValue(),
             int v20 = [v19 isProviderItem],
             v19,
             v20)))
      {
        if ([(FPMoveInfo *)self->_info byMoving]
          && [v4 isProviderItem]
          && ([(FPMoveInfo *)self->_info targetFolder],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              int v22 = [v21 isProviderItem],
              v21,
              v22))
        {
          v50 = [v4 asFPItem];
          v47 = [v50 providerDomainID];
          id v23 = [(FPMoveInfo *)self->_info targetFolder];
          id v24 = [v23 asFPItem];
          id v25 = [v24 providerDomainID];
          LODWORD(v18) = [v47 isEqualToString:v25];
        }
        else
        {
          LODWORD(v18) = 0;
        }
        BOOL v27 = !self->_isTargetFolderMaterialized && !self->_willMaterializeTargetFolder;
        if (((v18 | v27) & 1) == 0)
        {
          id v28 = [(FPMoveInfo *)self->_info targetFolder];
          char v29 = [v28 isExternalURL];
          id v30 = [(FPMoveInfo *)self->_info targetFolder];
          id v31 = v30;
          if (v29)
          {
            uint64_t v32 = [v30 asURL];
          }
          else
          {
            id v33 = [v30 asFPItem];
            uint64_t v32 = [v33 fileURL];
          }
          if ([v4 isExternalURL])
          {
            v34 = [v4 asURL];
          }
          else
          {
            id v35 = [v4 asFPItem];
            v34 = [v35 fileURL];
          }
          if (!v34)
          {
            id v36 = objc_loadWeakRetained((id *)&self->_operation);
            v37 = [v36 manager];
            v34 = [v4 materializedURLWithExtensionManager:v37];
          }
          if (!v32)
          {
            int64_t v38 = [(FPMoveInfo *)self->_info targetFolder];
            id v39 = objc_loadWeakRetained((id *)&self->_operation);
            id v40 = [v39 manager];
            uint64_t v32 = [v38 materializedURLWithExtensionManager:v40];
          }
          uint64_t v51 = (void *)v32;
          id v55 = 0;
          uint64_t v41 = *MEMORY[0x1E4F1C820];
          id v54 = 0;
          [v34 getResourceValue:&v55 forKey:v41 error:&v54];
          id v42 = v55;
          id v43 = v54;
          int64_t v44 = fp_current_or_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            v48 = objc_msgSend(v43, "fp_prettyDescription");
            *(_DWORD *)buf = 138412802;
            id v57 = v34;
            __int16 v58 = 2112;
            id v59 = v42;
            __int16 v60 = 2112;
            v61 = v48;
            _os_log_debug_impl(&dword_1D744C000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: sourceURL %@ sourceVolume %@ error %@", buf, 0x20u);
          }
          id v52 = 0;
          id v53 = 0;
          [v51 getResourceValue:&v53 forKey:v41 error:&v52];
          id v45 = v53;
          id v46 = v52;

          uint64_t v18 = fp_current_or_default_log();
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
          {
            v49 = objc_msgSend(v46, "fp_prettyDescription");
            *(_DWORD *)buf = 138412802;
            id v57 = v51;
            __int16 v58 = 2112;
            id v59 = v45;
            __int16 v60 = 2112;
            v61 = v49;
            _os_log_debug_impl(&dword_1D744C000, (os_log_t)v18, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: targetFolderURL %@ destVolume %@ error %@", buf, 0x20u);
          }
          LOBYTE(v18) = 0;
          if (!v46 && v42 && v45) {
            LOBYTE(v18) = [v42 isEqual:v45];
          }
        }
      }
      else
      {
        LOBYTE(v18) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (void)_enqueueAtomsForRoot:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FPDMoveReader *)self _isRootCancelled:v4]) {
    goto LABEL_50;
  }
  BOOL v5 = [(FPDMoveReader *)self _shouldUseDiskWriterToPerformMoveForItem:v4];
  if ([(FPDMoveReader *)self _isSinglePkgCopyForRoot:v4])
  {
    char v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader _enqueueAtomsForRoot:](v4);
    }

    if (![(FPDMoveReader *)self _enqueueItem:v4 forRoot:v4 atomically:1 useDiskWriter:v5])
    {
      int v7 = [NSString stringWithFormat:@"[ASSERT] ‼️ enqueuing a root should never fail"];
      id v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("-[FPDMoveReader _enqueueAtomsForRoot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 719, (const char *)[v7 UTF8String]);
    }
    goto LABEL_50;
  }
  BOOL v9 = [(FPDMoveReader *)self _isSingleMoveForRoot:v4];
  id v10 = fp_current_or_default_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v9)
  {
    if (v11) {
      -[FPDMoveReader _enqueueAtomsForRoot:].cold.7();
    }

    self->_unint64_t depth = 0;
    id v37 = 0;
    BOOL v14 = [(FPDMoveReader *)self _iteratorForRoot:v4 enforceFPItem:1 error:&v37];
    id v13 = v37;
    if (v14)
    {
      if (([v14 done] & 1) == 0)
      {
        id v33 = v13;
        *(void *)&long long v15 = 138412546;
        long long v32 = v15;
        while (1)
        {
          uint64_t v16 = (void *)MEMORY[0x1D9471CC0]();
          [(FPDMoveReader *)self _t_waitForUnblock];
          if ([(FPDMoveReader *)self _isCancelled]) {
            goto LABEL_42;
          }
          if ([(FPDMoveReader *)self _isRootCancelled:v4])
          {
            [(FPDMoveReader *)self _bailOutOfRoot:v4];
LABEL_42:
            goto LABEL_49;
          }
          id v36 = 0;
          BOOL v17 = [v14 nextWithError:&v36];
          id v18 = v36;
          id v19 = v18;
          if (!v17)
          {
            if (v18) {
              break;
            }
          }
          v34 = v18;
          id v35 = v16;
          BOOL v20 = v5;
          for (uint64_t i = objc_msgSend(v14, "numFoldersPopped", v32); i; --i)
          {
            int v22 = fp_current_or_default_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              unint64_t depth = self->_depth;
              *(_DWORD *)buf = 67109120;
              LODWORD(v39) = depth;
              _os_log_debug_impl(&dword_1D744C000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: adding atomForPostFolder %d", buf, 8u);
            }

            id WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
            id v24 = +[FPDMoveAtom atomForPostFolderUnderRoot:v4 atomically:0 useDiskWriter:0];
            [WeakRetained enqueue:v24];

            --self->_depth;
          }
          if (!v17 || ([v14 done] & 1) != 0)
          {

            id v19 = v34;
            uint64_t v16 = v35;
            goto LABEL_48;
          }
          id v26 = fp_current_or_default_log();
          BOOL v5 = v20;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            id v28 = [v17 identifier];
            *(_DWORD *)buf = v32;
            id v39 = v28;
            __int16 v40 = 1024;
            BOOL v41 = v20;
            _os_log_debug_impl(&dword_1D744C000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: itemID %@ shouldUseDiskWriterToPerformMoveForItem %{BOOL}d", buf, 0x12u);
          }
          BOOL v27 = [(FPDMoveReader *)self _enqueueItem:v17 forRoot:v4 atomically:0 useDiskWriter:v20];
          id v19 = v34;
          uint64_t v16 = v35;
          if (!v27)
          {
            [(FPDMoveReader *)self _bailOutOfRoot:v4];

            goto LABEL_47;
          }
          if ([v17 isFolder]) {
            ++self->_depth;
          }

          if ([v14 done]) {
            goto LABEL_49;
          }
        }
        char v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[FPDMoveReader _enqueueAtomsForRoot:].cold.6(v19);
        }

        [(FPDMoveReader *)self _finishWithError:v19];
LABEL_47:
        id v13 = v33;
LABEL_48:
      }
    }
    else
    {
      [(FPDMoveReader *)self _finishWithError:v13];
    }
    goto LABEL_49;
  }
  if (v11) {
    -[FPDMoveReader _enqueueAtomsForRoot:].cold.5(v4);
  }

  if (![(FPDMoveReader *)self _enqueueItem:v4 forRoot:v4 atomically:1 useDiskWriter:v5])
  {
    id v30 = [NSString stringWithFormat:@"[ASSERT] ‼️ enqueuing a root should never fail"];
    id v31 = fp_current_or_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveReader _enqueueAtomsForRoot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 732, (const char *)[v30 UTF8String]);
  }
  if ([v4 isFolder])
  {
    int v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader _enqueueAtomsForRoot:]();
    }

    id v13 = objc_loadWeakRetained((id *)&self->_moveQueue);
    BOOL v14 = +[FPDMoveAtom atomForPostFolderUnderRoot:v4 atomically:1 useDiskWriter:v5];
    [v13 enqueue:v14];
LABEL_49:
  }
LABEL_50:
}

- (void)_runWithDownloadedTarget:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_willMaterializeTargetFolder)
  {
    char v6 = [(FPMoveInfo *)self->_info targetFolder];
    int v7 = [v6 asFPItem];

    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveReader _runWithDownloadedTarget:]();
    }

    BOOL v9 = [(FPDMoveReader *)self startDownloadBlock];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__FPDMoveReader__runWithDownloadedTarget___block_invoke;
    v10[3] = &unk_1E6A73710;
    v10[4] = self;
    id v11 = v5;
    ((void (**)(void, void *, void, void *))v9)[2](v9, v7, 0, v10);
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __42__FPDMoveReader__runWithDownloadedTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  fp_dispatch_async_with_logs();
}

uint64_t __42__FPDMoveReader__runWithDownloadedTarget___block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    return objc_msgSend(v2, "_finishWithError:");
  }
  else
  {
    uint64_t result = [v2 _isCancelled];
    if ((result & 1) == 0)
    {
      id v5 = *(uint64_t (**)(void))(a1[6] + 16);
      return v5();
    }
  }
  return result;
}

- (void)_run
{
}

void __21__FPDMoveReader__run__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) roots];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1D9471CC0]();
        BOOL v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v7;
          _os_log_debug_impl(&dword_1D744C000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: looking at root %@", buf, 0xCu);
        }

        if ([*(id *)(a1 + 32) _isCancelled])
        {
          int v12 = fp_current_or_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            __21__FPDMoveReader__run__block_invoke_cold_1();
          }

          return;
        }
        if ([*(id *)(a1 + 32) _isRootCancelled:v7])
        {
          id v10 = fp_current_or_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            __21__FPDMoveReader__run__block_invoke_cold_2(&v13, v14, v10);
          }
        }
        else
        {
          [*(id *)(a1 + 32) _enqueueAtomsForRoot:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained finishedEnqueuing];

  [*(id *)(a1 + 32) _finishWithError:0];
}

- (void)_t_waitForUnblock
{
  if ([(FPMoveInfo *)self->_info _t_clientDrivenReader])
  {
    clientUnblockSema = self->_clientUnblockSema;
    dispatch_semaphore_wait(clientUnblockSema, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_t_unblock
{
  if (([(FPMoveInfo *)self->_info _t_clientDrivenReader] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"[ASSERT] ‼️ unexpected call"];
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveReader _t_unblock]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveReader.m", 869, (const char *)[v4 UTF8String]);
  }
  clientUnblockSema = self->_clientUnblockSema;
  dispatch_semaphore_signal(clientUnblockSema);
}

- (BOOL)_isRootCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableSet *)v5->_cancelledRoots containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)cancelRoot:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_cancelledRoots addObject:v5];
  objc_sync_exit(v4);
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v2->__BOOL cancelled = 1;
  if ([(FPMoveInfo *)v2->_info _t_clientDrivenReader])
  {
    int v3 = 500;
    do
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)v2->_clientUnblockSema);
      --v3;
    }
    while (v3);
  }
  objc_sync_exit(v2);

  queue = v2->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__FPDMoveReader_cancel__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = v2;
  dispatch_sync(queue, block);
}

void __23__FPDMoveReader_cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  [v1 _finishWithError:v2];
}

- (void)dumpStateTo:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 write:@"+ reader\n"];
  if (v4->__cancelled)
  {
    [v5 startAttributes:2];
    [v5 write:@"  reader cancelled\n"];
    [v5 reset];
  }
  if ([(NSMutableSet *)v4->_cancelledRoots count])
  {
    [v5 startFgColor:1];
    [v5 write:@"  roots cancelled: %@\n", v4->_cancelledRoots];
    [v5 reset];
  }
  if (v4->_error)
  {
    [v5 startFgColor:1];
    [v5 write:@"  error: %@\n", v4->_error];
    [v5 reset];
  }
  [v5 write:@"\n"];
  objc_sync_exit(v4);
}

- (id)rootPreflightCompletionBlock
{
  return self->_rootPreflightCompletionBlock;
}

- (void)setRootPreflightCompletionBlock:(id)a3
{
}

- (id)preflightCompletionBlock
{
  return self->_preflightCompletionBlock;
}

- (void)setPreflightCompletionBlock:(id)a3
{
}

- (id)startDownloadBlock
{
  return self->_startDownloadBlock;
}

- (void)setStartDownloadBlock:(id)a3
{
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_startDownloadBlock, 0);
  objc_storeStrong(&self->_preflightCompletionBlock, 0);
  objc_storeStrong(&self->_rootPreflightCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientUnblockSema, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cancelledRoots, 0);
  objc_destroyWeak((id *)&self->_writer);
  objc_destroyWeak((id *)&self->_moveQueue);
  objc_storeStrong((id *)&self->_info, 0);
  objc_destroyWeak((id *)&self->_operation);
}

- (void)initWithMoveWriter:operation:queue:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] ┣%llx move-reader: create move reader", v2, v3, v4, v5, v6);
}

void __22__FPDMoveReader_start__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] move-reader: failed to verify target URL with error %@", v4, v5, v6, v7, v8);
}

void __22__FPDMoveReader_start__block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)_finishWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: succeeded", v2, v3, v4, v5, v6);
}

- (void)_iteratorForRoot:(void *)a1 enforceFPItem:error:.cold.1(void *a1)
{
  uint64_t v1 = [a1 providerDomainID];
  uint64_t v2 = objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v3, v4, "[ERROR] move-reader: encountered error during enumeration: root is from unknown domain %@", v5, v6, v7, v8, v9);
}

- (void)_progressComputationPreflight:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D744C000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Filesystem only supports %ld file size bits but we need %ld", v2, 0x16u);
}

- (void)_progressComputationPreflight:(void *)a1 completion:.cold.2(void *a1)
{
  os_log_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] move-reader: encountered error during preflight: %@", v4, v5, v6, v7, v8);
}

- (void)_progressComputationPreflight:completion:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: starting preflight", v2, v3, v4, v5, v6);
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 43);
  LODWORD(v2) = *(unsigned __int8 *)(v2 + 42);
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: finished preflight. isTargetFolderMaterialized: %{BOOL}d willMaterializeTargetFolder %{BOOL}d", (uint8_t *)v4, 0xEu);
}

void __58__FPDMoveReader__progressComputationPreflight_completion___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] move-reader: Could not move/copy item due to not enough free space at destination.", v1, 2u);
}

- (void)_getSpaceForWriteSize:atTargetPath:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D744C000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Cannot check available space because no target path given", v1, 2u);
}

- (void)_getSpaceForWriteSize:(uint64_t)a1 atTargetPath:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = [a2 localizedDescription];
  uint64_t v7 = [a2 userInfo];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  uint8_t v13 = v7;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Error retrieving available space for url %@: %@, %@", (uint8_t *)&v8, 0x20u);
}

void __63__FPDMoveReader__getSpaceForWriteSize_atTargetPath_completion___block_invoke_cold_1()
{
  os_log_t v0 = [0 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v1, v2, "[ERROR] Error purging: %@", v3, v4, v5, v6, v7);
}

- (void)_fileSizeBitsSupportAtPath:.cold.1()
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] Cannot open target path: %@, error: %s", v3, v4, v5, v6, v7);
}

- (void)_fileSizeBitsSupportAtPath:.cold.2()
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v1, v2, "[ERROR] Cannot get max filesize bits: %s", v3, v4, v5, v6, v7);
}

- (void)_shouldCheckSpaceForRoot:(void *)a1 targetFolderURL:.cold.1(void *a1)
{
  [a1 fileSystemRepresentation];
  uint64_t v1 = __error();
  strerror(*v1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] move_shouldCheckSpaceForRoot: getattrlist (%s) failed %s", v4, v5, v6, v7, v8);
}

- (void)_enqueueItem:(uint64_t)a1 forRoot:(void *)a2 atomically:useDiskWriter:.cold.1(uint64_t a1, void *a2)
{
  uint8_t v8 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v2, v3, "[ERROR] couldn't get target folder for %@; %@", v4, v5, v6, v7, 2u);
}

- (void)_bailOutOfRoot:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: bailing out of root", v2, v3, v4, v5, v6);
}

- (void)_isSingleMoveForRoot:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: copy require to iterate on all the children of the root", v2, v3, v4, v5, v6);
}

- (void)_isSingleMoveForRoot:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: issuing a single move since source and destination are in the same domain", v2, v3, v4, v5, v6);
}

- (void)_isSingleMoveForRoot:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: issuing a single move since source and destination support disk writer and are on the same volume", v2, v3, v4, v5, v6);
}

- (void)_isSingleMoveForRoot:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: move will require a copy since source and destination are on different volumes", v2, v3, v4, v5, v6);
}

- (void)_isSingleMoveForRoot:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: move does not support the disk-writer", v2, v3, v4, v5, v6);
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)_enqueueAtomsForRoot:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: _enqueueAtomsForRoot:_isSingleMoveForRoot: adding atomForPostFolder", v2, v3, v4, v5, v6);
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)_enqueueAtomsForRoot:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] move-reader: encountered error during enumeration: %@", v4, v5, v6, v7, v8);
}

- (void)_enqueueAtomsForRoot:.cold.7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: going to iterate over root", v2, v3, v4, v5, v6);
}

- (void)_runWithDownloadedTarget:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: targetFolder needs to be materialized, starting download: %@", v2, v3, v4, v5, v6);
}

void __21__FPDMoveReader__run__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] move-reader: operation was cancelled, don't enumerate", v2, v3, v4, v5, v6);
}

void __21__FPDMoveReader__run__block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] move-reader: root was cancelled, don't enumerate", buf, 2u);
}

@end