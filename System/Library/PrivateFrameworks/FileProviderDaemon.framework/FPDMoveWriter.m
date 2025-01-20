@interface FPDMoveWriter
+ (id)acquireDownloadSlotForItem:(id)a3;
+ (void)initialize;
+ (void)releaseDownloadSlot:(id)a3;
- (FPDCoordinator)coordinator;
- (FPDMoveOperation)operation;
- (FPDMoveWriter)initWithOperation:(id)a3 queue:(id)a4;
- (FPDMoveWriterExecutor)diskWriter;
- (FPMoveInfo)info;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)defaultExecutor;
- (id)itemCompletionBlock;
- (id)itemCopyProgressBlock;
- (id)rootCompletionBlock;
- (id)rootCreatedBlock;
- (id)waitForResultOfSourceID:(id)a3 root:(id)a4 error:(id *)a5;
- (void)_finishWithError:(id)a3;
- (void)_handleCompletionOfAtom:(id)a3 source:(id)a4 result:(id)a5 error:(id)a6;
- (void)_handleFolder:(id)a3 completion:(id)a4;
- (void)_handleItem:(id)a3 completion:(id)a4;
- (void)_handlePostFolder:(id)a3 completion:(id)a4;
- (void)_performCopyOrMoveOfFolder:(id)a3 completion:(id)a4;
- (void)_performCopyOrMoveOfItem:(id)a3 completion:(id)a4;
- (void)_removeRoot:(id)a3;
- (void)_step;
- (void)_unblockWaiterForSourceID:(id)a3 withResult:(id)a4 error:(id)a5;
- (void)cancel;
- (void)cancelRoot:(id)a3;
- (void)dumpStateTo:(id)a3;
- (void)failWithError:(id)a3;
- (void)handleAtom:(id)a3 completion:(id)a4;
- (void)handleCreationForAtom:(id)a3 result:(id)a4;
- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8;
- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9;
- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 useDiskWriter:(BOOL)a6 completion:(id)a7;
- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 useDiskWriter:(BOOL)a9 completion:(id)a10;
- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9;
- (void)setCompletionBlock:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDiskWriter:(id)a3;
- (void)setItemCompletionBlock:(id)a3;
- (void)setItemCopyProgressBlock:(id)a3;
- (void)setProgress:(id)a3 forRoot:(id)a4;
- (void)setRootCompletionBlock:(id)a3;
- (void)setRootCreatedBlock:(id)a3;
- (void)start;
- (void)startDownloadOfItem:(id)a3 shouldMaterializeRecursively:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation FPDMoveWriter

+ (id)acquireDownloadSlotForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 providerID];
  id v5 = (id)_globalDownloadSlotsByProvider_0;
  objc_sync_enter(v5);
  v6 = [(id)_globalDownloadSlotsByProvider_0 objectForKeyedSubscript:v4];
  if (!v6)
  {
    v6 = dispatch_semaphore_create(256);
    [(id)_globalDownloadSlotsByProvider_0 setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  return v4;
}

+ (void)releaseDownloadSlot:(id)a3
{
  id v7 = a3;
  id v3 = (id)_globalDownloadSlotsByProvider_0;
  objc_sync_enter(v3);
  v4 = [(id)_globalDownloadSlotsByProvider_0 objectForKeyedSubscript:v7];
  objc_sync_exit(v3);

  if (!v4)
  {
    id v5 = [NSString stringWithFormat:@"[ASSERT] ‼️ semaphore should still exists"];
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("+[FPDMoveWriter releaseDownloadSlot:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 104, (const char *)[v5 UTF8String]);
  }
  dispatch_semaphore_signal(v4);
}

+ (void)initialize
{
  if (initialize_once_0 != -1) {
    dispatch_once(&initialize_once_0, &__block_literal_global_23);
  }
}

uint64_t __27__FPDMoveWriter_initialize__block_invoke()
{
  _globalDownloadSlotsByProvider_0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (FPDMoveWriter)initWithOperation:(id)a3 queue:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)FPDMoveWriter;
  v8 = [(FPDMoveWriter *)&v66 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_operation, v6);
    uint64_t v10 = [v6 info];
    info = v9->_info;
    v9->_info = (FPMoveInfo *)v10;

    objc_storeWeak((id *)&v9->_moveQueue, v7);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)[(FPMoveInfo *)v9->_info qos], 0);
    dispatch_queue_t v14 = dispatch_queue_create("FileProvider.move-writer.async", v13);
    asyncQueue = v9->_asyncQueue;
    v9->_asyncQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)[(FPMoveInfo *)v9->_info qos], 0);
    dispatch_queue_t v18 = dispatch_queue_create("FileProvider.move-writer", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = objc_opt_new();
    sourceFoldersStack = v9->_sourceFoldersStack;
    v9->_sourceFoldersStack = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    destinationFoldersStack = v9->_destinationFoldersStack;
    v9->_destinationFoldersStack = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    errorsByRoot = v9->_errorsByRoot;
    v9->_errorsByRoot = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    progressByRoot = v9->_progressByRoot;
    v9->_progressByRoot = (NSMutableDictionary *)v26;

    v9->_originalBouncePolicy = [(FPMoveInfo *)v9->_info shouldBounce];
    v9->_depth = 0;
    v28 = [FPDCoordinator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_operation);
    v30 = [WeakRetained manager];
    uint64_t v31 = [(FPDCoordinator *)v28 initWithExtensionManager:v30 callbackQueue:v9->_queue];
    coordinator = v9->_coordinator;
    v9->_coordinator = (FPDCoordinator *)v31;

    v33 = [FPDCoordinator alloc];
    id v34 = objc_loadWeakRetained((id *)&v9->_operation);
    v35 = [v34 manager];
    uint64_t v36 = [(FPDCoordinator *)v33 initWithExtensionManager:v35 callbackQueue:v9->_queue];
    preemptiveDownloadCoordinator = v9->_preemptiveDownloadCoordinator;
    v9->_preemptiveDownloadCoordinator = (FPDCoordinator *)v36;

    uint64_t section = __fp_create_section();
    v39 = fp_current_or_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveWriter initWithOperation:queue:]();
    }

    v9->_logSection = section;
    v40 = [v6 info];
    v41 = [v40 targetFolder];
    int v42 = [v41 isProviderItem];

    if (v42)
    {
      v43 = [[FPDMoveWriterToProvider alloc] initWithWriter:v9];
      providerWriter = v9->_providerWriter;
      v9->_providerWriter = (FPDMoveWriterExecutor *)v43;
    }
    if ([(FPMoveInfo *)v9->_info _t_clearItemURLs])
    {
      v45 = [(FPMoveInfo *)v9->_info targetFolder];
      v46 = [v45 asFPItem];
      [v46 setFileURL:0];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v47 = [(FPMoveInfo *)v9->_info roots];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v63;
        do
        {
          uint64_t v51 = 0;
          do
          {
            if (*(void *)v63 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = [*(id *)(*((void *)&v62 + 1) + 8 * v51) asFPItem];
            [v52 setFileURL:0];

            ++v51;
          }
          while (v49 != v51);
          uint64_t v49 = [v47 countByEnumeratingWithState:&v62 objects:v67 count:16];
        }
        while (v49);
      }
    }
    v53 = [(FPMoveInfo *)v9->_info roots];
    v54 = [(FPMoveInfo *)v9->_info targetFolder];
    v55 = [v53 arrayByAddingObject:v54];

    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __41__FPDMoveWriter_initWithOperation_queue___block_invoke;
    v60[3] = &unk_1E6A766E8;
    v56 = v9;
    v61 = v56;
    uint64_t v57 = objc_msgSend(v55, "fp_map:", v60);
    accessTokens = v56->_accessTokens;
    v56->_accessTokens = (NSArray *)v57;
  }
  return v9;
}

id __41__FPDMoveWriter_initWithOperation_queue___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(*(void *)(a1 + 32) + 160);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained manager];
  [v3 annotateWithPersonaSandboxIfNeeded:v5];

  id v6 = [v3 startAccessingLocator];

  return v6;
}

- (void)_performCopyOrMoveOfItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = [v6 source];
  int v9 = [v8 isFolder];

  if (v9)
  {
    v32 = [NSString stringWithFormat:@"[ASSERT] ‼️ unexpected folder"];
    v33 = fp_current_or_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveWriter _performCopyOrMoveOfItem:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 171, (const char *)[v32 UTF8String]);
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke;
  v42[3] = &unk_1E6A76710;
  v42[4] = self;
  id v10 = v7;
  id v43 = v10;
  v11 = (void (**)(void, void, void))MEMORY[0x1D9471EC0](v42);
  errorsByRoot = self->_errorsByRoot;
  v13 = [v6 root];
  dispatch_queue_t v14 = [(NSMutableDictionary *)errorsByRoot objectForKeyedSubscript:v13];

  if (v14)
  {
    v15 = [v6 source];
    [(FPDMoveWriter *)self _handleCompletionOfAtom:v6 source:v15 result:0 error:v14];

    ((void (**)(void, void, void *))v11)[2](v11, 0, v14);
  }
  else
  {
    int v16 = [(FPMoveInfo *)self->_info byCopy];
    v17 = [v6 source];
    dispatch_queue_t v18 = v17;
    if (!v16)
    {
      uint64_t v22 = [v17 parentIdentifier];
      v23 = [v6 targetFolder];
      uint64_t v24 = [v23 identifier];
      if ([v22 isEqual:v24])
      {
        [v6 targetName];
        v25 = id v34 = v23;
        uint64_t v26 = [v6 source];
        [v26 filename];
        v27 = v38 = v22;
        int v36 = [v25 isEqualToString:v27];

        if (v36)
        {
          v28 = [v6 source];
          ((void (**)(void, void *, void))v11)[2](v11, v28, 0);

          goto LABEL_11;
        }
      }
      else
      {
      }
      v29 = [v6 source];
      v30 = [v6 targetFolder];
      uint64_t v31 = [v6 targetName];
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](self, "performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:", v29, v30, v31, [v6 materializeOption], objc_msgSend(v6, "targetMaterializeOption"), objc_msgSend(v6, "useDiskWriter"), v11);

      goto LABEL_11;
    }
    v19 = [v6 targetFolder];
    uint64_t v20 = [v6 targetName];
    uint64_t v37 = [v6 materializeOption];
    uint64_t v35 = [v6 targetMaterializeOption];
    uint64_t v21 = [v6 useDiskWriter];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_3;
    v39[3] = &unk_1E6A76670;
    v39[4] = self;
    id v40 = v6;
    v41 = v11;
    [(FPDMoveWriter *)self performCopyOfItem:v18 to:v19 as:v20 sourceMaterializeOption:v37 targetMaterializeOption:v35 useDiskWriter:v21 completion:v39];
  }
LABEL_11:
}

void __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_2;
  block[3] = &unk_1E6A765A8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 112);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_4;
  block[3] = &unk_1E6A76698;
  void block[4] = v7;
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v9 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __53__FPDMoveWriter__performCopyOrMoveOfItem_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) handleCreationForAtom:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)_handleItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__FPDMoveWriter__handleItem_completion___block_invoke;
  v10[3] = &unk_1E6A76670;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FPDMoveWriter *)self _performCopyOrMoveOfItem:v9 completion:v10];
}

uint64_t __40__FPDMoveWriter__handleItem_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = *(NSObject **)(a1[4] + 112);
  id v6 = a3;
  id v7 = a2;
  dispatch_assert_queue_V2(v5);
  id v8 = (void *)a1[4];
  id v9 = (void *)a1[5];
  id v10 = [v9 source];
  [v8 _handleCompletionOfAtom:v9 source:v10 result:v7 error:v6];

  id v11 = *(uint64_t (**)(void))(a1[6] + 16);
  return v11();
}

- (void)_performCopyOrMoveOfFolder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke;
  v22[3] = &unk_1E6A76710;
  v22[4] = self;
  id v8 = v7;
  id v23 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1D9471EC0](v22);
  errorsByRoot = self->_errorsByRoot;
  id v11 = [v6 root];
  id v12 = [(NSMutableDictionary *)errorsByRoot objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [v6 source];
    [(FPDMoveWriter *)self _handleCompletionOfAtom:v6 source:v13 result:0 error:v12];

    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
  else
  {
    int v14 = [(FPMoveInfo *)self->_info byCopy];
    id v15 = [v6 source];
    id v16 = [v6 targetFolder];
    v17 = [v6 targetName];
    if (v14)
    {
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:](self, "performCreateFolder:inside:as:useDiskWriter:completion:", v15, v16, v17, [v6 useDiskWriter], v9);
    }
    else
    {
      uint64_t v21 = [v6 materializeOption];
      uint64_t v18 = [v6 targetMaterializeOption];
      uint64_t v19 = [v6 useAtomicMove];
      LOBYTE(v20) = [v6 useDiskWriter];
      [(FPDMoveWriter *)self performMoveOfFolder:v15 to:v16 as:v17 sourceMaterializeOption:v21 targetMaterializeOption:v18 atomically:v19 useDiskWriter:v20 completion:v9];
    }
  }
}

void __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke_2;
  block[3] = &unk_1E6A765A8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__FPDMoveWriter__performCopyOrMoveOfFolder_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_handleFolder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v6 source];
  char v9 = [v8 isFolder];

  if ((v9 & 1) == 0)
  {
    id v12 = [NSString stringWithFormat:@"[ASSERT] ‼️ expected a folder"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveWriter _handleFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 266, (const char *)[v12 UTF8String]);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__FPDMoveWriter__handleFolder_completion___block_invoke;
  v14[3] = &unk_1E6A76670;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  [(FPDMoveWriter *)self _performCopyOrMoveOfFolder:v11 completion:v14];
}

void __42__FPDMoveWriter__handleFolder_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 112));
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = 138412802;
    uint64_t v18 = v16;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: atom done %@: %@, error=%@", (uint8_t *)&v17, 0x20u);
  }

  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  char v9 = [*(id *)(a1 + 40) source];
  [v8 addObject:v9];

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 48);
  if (v5)
  {
    [*(id *)(v10 + 48) addObject:v5];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA98] null];
    [v11 addObject:v12];
  }
  id v13 = *(void **)(a1 + 32);
  id v14 = *(void **)(a1 + 40);
  id v15 = [v14 source];
  [v13 _handleCompletionOfAtom:v14 source:v15 result:v5 error:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_handleCompletionOfAtom:(id)a3 source:(id)a4 result:(id)a5 error:(id)a6
{
  id v31 = a4;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  id v13 = a3;
  dispatch_assert_queue_V2(queue);
  id v14 = [v13 source];
  id v15 = [v14 identifier];
  [(FPDMoveWriter *)self _unblockWaiterForSourceID:v15 withResult:v10 error:v11];

  uint64_t v16 = [v13 root];
  int v17 = [v13 kind];
  info = self->_info;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  id v20 = [WeakRetained manager];
  uint64_t v21 = [v13 shouldAccountForDownloadOfSourceItemForMoveInfo:info extensionManager:v20];

  int v22 = [v13 useAtomicMove];
  if (v11)
  {
    uint64_t v23 = [(NSMutableDictionary *)self->_errorsByRoot objectForKeyedSubscript:v16];

    if (!v23) {
      [(NSMutableDictionary *)self->_errorsByRoot setObject:v11 forKeyedSubscript:v16];
    }
  }
  if (v17 != 1)
  {
    uint64_t v24 = [(FPDMoveWriter *)self itemCompletionBlock];
    ((void (**)(void, void *, id, uint64_t))v24)[2](v24, v16, v31, v21);
  }
  v25 = [(FPMoveInfo *)self->_info roots];
  int v26 = [v25 containsObject:v31];

  if (v26)
  {
    if (v10)
    {
      v27 = [(FPDMoveWriter *)self rootCreatedBlock];
      ((void (**)(void, void *, id))v27)[2](v27, v16, v10);
    }
    v28 = [(NSMutableDictionary *)self->_errorsByRoot objectForKeyedSubscript:v16];
    if (v17)
    {
      if ([(FPMoveInfo *)self->_info byMoving]
        && (([v31 isExternalURL] ^ 1 | v22) & 1) == 0)
      {
        [(FPDMoveWriter *)self _removeRoot:v16];
      }
      if (v17 == 1)
      {
        unint64_t v29 = self->_depth - 1;
        self->_depth = v29;
        if (!v29) {
          [(FPMoveInfo *)self->_info setShouldBounce:self->_originalBouncePolicy];
        }
      }
      v30 = [(FPDMoveWriter *)self rootCompletionBlock];
      ((void (**)(void, void *, void *))v30)[2](v30, v16, v28);
    }
    else
    {
      ++self->_depth;
      [(FPMoveInfo *)self->_info setShouldBounce:1];
    }
  }
}

- (void)handleCreationForAtom:(id)a3 result:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [v15 root];
  id v8 = [(FPMoveInfo *)self->_info roots];
  char v9 = [v15 source];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    if (v6)
    {
      id v11 = [(FPDMoveWriter *)self rootCreatedBlock];
      ((void (**)(void, void *, id))v11)[2](v11, v7, v6);
    }
    progressByRoot = self->_progressByRoot;
    id v13 = [v15 root];
    [(NSMutableDictionary *)progressByRoot removeObjectForKey:v13];
  }
  [(NSObservation *)self->_importProgressObservation finishObserving];
  importProgressObservation = self->_importProgressObservation;
  self->_importProgressObservation = 0;
}

- (void)_handlePostFolder:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NSMutableArray *)self->_sourceFoldersStack count])
  {
    id v8 = [NSString stringWithFormat:@"[ASSERT] ‼️ _sourceFoldersStack - no folder to pop"];
    char v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveWriter _handlePostFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 373, (const char *)[v8 UTF8String]);
  }
  if (![(NSMutableArray *)self->_destinationFoldersStack count])
  {
    int v10 = [NSString stringWithFormat:@"[ASSERT] ‼️ _destinationFoldersStack - no folder to pop"];
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveWriter _handlePostFolder:completion:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 374, (const char *)[v10 UTF8String]);
  }
  id v7 = [(NSMutableArray *)self->_sourceFoldersStack lastObject];
  [(FPDMoveWriter *)self _handleCompletionOfAtom:v12 source:v7 result:0 error:0];
  [(NSMutableArray *)self->_sourceFoldersStack removeLastObject];
  [(NSMutableArray *)self->_destinationFoldersStack removeLastObject];
  v6[2](v6);
}

- (void)handleAtom:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __39__FPDMoveWriter_handleAtom_completion___block_invoke;
  id v14 = &unk_1E6A73878;
  id v15 = self;
  id v16 = v7;
  id v8 = v7;
  char v9 = (void *)MEMORY[0x1D9471EC0](&v11);
  int v10 = objc_msgSend(v6, "kind", v11, v12, v13, v14, v15);
  if (v10)
  {
    if (v10 == 1)
    {
      [(FPDMoveWriter *)self _handlePostFolder:v6 completion:v9];
    }
    else if (v10 == 2)
    {
      [(FPDMoveWriter *)self _handleItem:v6 completion:v9];
    }
  }
  else
  {
    [(FPDMoveWriter *)self _handleFolder:v6 completion:v9];
  }
}

uint64_t __39__FPDMoveWriter_handleAtom_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) stopAccessingAllURLs];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_step
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_asyncQueue);
  if (!self->_cancelled)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_moveQueue);
    v4 = [WeakRetained dequeue];

    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __22__FPDMoveWriter__step__block_invoke;
    v7[3] = &unk_1E6A736C0;
    id v8 = v4;
    char v9 = self;
    id v6 = v4;
    dispatch_sync(queue, v7);
  }
}

uint64_t __22__FPDMoveWriter__step__block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __22__FPDMoveWriter__step__block_invoke_cold_1(v2, v3, v4);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __22__FPDMoveWriter__step__block_invoke_24;
    v9[3] = &unk_1E6A73FE8;
    v9[4] = v5;
    return [v5 handleAtom:v6 completion:v9];
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    return [v8 _finishWithError:0];
  }
}

void __22__FPDMoveWriter__step__block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__FPDMoveWriter__step__block_invoke_2;
  block[3] = &unk_1E6A73FE8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __22__FPDMoveWriter__step__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _step];
}

- (void)start
{
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__FPDMoveWriter_start__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = self;
  dispatch_async(asyncQueue, block);
}

uint64_t __22__FPDMoveWriter_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _step];
}

- (void)_finishWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_cancelled)
  {
    uint64_t v6 = fp_current_or_default_log();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[FPDMoveWriter _finishWithError:](v5);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[FPDMoveWriter _finishWithError:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    [(FPDCoordinator *)self->_coordinator stopAccessingAllURLs];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = self->_accessTokens;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v19++), "stopAccessing", (void)v25);
        }
        while (v17 != v19);
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    [(FPDCoordinator *)self->_preemptiveDownloadCoordinator stopAccessingAllURLs];
    waiterBlock = (void (**)(id, void, id))self->_waiterBlock;
    if (waiterBlock)
    {
      waiterBlock[2](waiterBlock, 0, v5);
      id v21 = self->_waiterBlock;
    }
    else
    {
      id v21 = 0;
    }
    self->_waiterBlock = 0;

    id waitedOnID = self->_waitedOnID;
    self->_id waitedOnID = 0;

    self->_cancelled = 1;
    objc_storeStrong((id *)&self->_error, a3);
    uint64_t v23 = [(FPDMoveWriter *)self completionBlock];
    uint64_t v24 = (void *)v23;
    if (v23)
    {
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v5);
      [(FPDMoveWriter *)self setCompletionBlock:0];
    }
  }
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__FPDMoveWriter_failWithError___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __31__FPDMoveWriter_failWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

- (void)cancelRoot:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__FPDMoveWriter_cancelRoot___block_invoke;
  v7[3] = &unk_1E6A736C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __28__FPDMoveWriter_cancelRoot___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v4 cancel];
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__FPDMoveWriter_cancel__block_invoke;
  block[3] = &unk_1E6A73FE8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __23__FPDMoveWriter_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  [v1 _finishWithError:v2];
}

- (void)setProgress:(id)a3 forRoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(FPMoveInfo *)self->_info roots];
  int v9 = [v8 containsObject:v7];

  if (v9)
  {
    [(NSMutableDictionary *)self->_progressByRoot setObject:v6 forKeyedSubscript:v7];
    uint64_t v10 = [(FPDMoveWriter *)self itemCopyProgressBlock];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    uint64_t v11 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v6 path:"fractionCompleted"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37__FPDMoveWriter_setProgress_forRoot___block_invoke;
    v15[3] = &unk_1E6A76738;
    id v16 = v6;
    uint64_t v19 = v20;
    id v12 = v10;
    id v18 = v12;
    id v17 = v7;
    uint64_t v13 = [v11 addObserverBlock:v15];
    importProgressObservation = self->_importProgressObservation;
    self->_importProgressObservation = v13;

    _Block_object_dispose(v20, 8);
  }
}

uint64_t __37__FPDMoveWriter_setProgress_forRoot___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) completedUnitCount];
  if (result != *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) completedUnitCount];
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

- (void)_unblockWaiterForSourceID:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  queue = self->_queue;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  LODWORD(queue) = [self->_waitedOnID isEqual:v10];

  if (queue)
  {
    (*((void (**)(void))self->_waiterBlock + 2))();
    id waiterBlock = self->_waiterBlock;
    self->_id waiterBlock = 0;

    id waitedOnID = self->_waitedOnID;
    self->_id waitedOnID = 0;
  }
}

- (id)waitForResultOfSourceID:(id)a3 root:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__14;
  uint64_t v35 = __Block_byref_object_dispose__14;
  id v36 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__14;
  unint64_t v29 = __Block_byref_object_dispose__14;
  id v30 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke;
  block[3] = &unk_1E6A76788;
  void block[4] = self;
  SEL v24 = a2;
  id v13 = v9;
  id v19 = v13;
  int v22 = &v31;
  uint64_t v14 = v11;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  uint64_t v23 = &v25;
  dispatch_sync(queue, block);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v16 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id location = 0;
  id v2 = (uint64_t *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *v2;
  if (*(void *)(*v2 + 80))
  {
    SEL v24 = [NSString stringWithFormat:@"[ASSERT] ‼️ cannot have more than 1 waiter"];
    uint64_t v25 = fp_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDMoveWriter waitForResultOfSourceID:root:error:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/move/FPDMoveWriter.m", 547, (const char *)[v24 UTF8String]);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(v3 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 40);
        id v10 = [*(id *)(*((void *)&v30 + 1) + 8 * v8) identifier];
        if ([v9 isEqual:v10])
        {
          dispatch_semaphore_t v11 = [*(id *)(*(void *)(a1 + 32) + 48) objectAtIndexedSubscript:v6 + v8];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 48) objectAtIndexedSubscript:v6 + v8];
            uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
            id v21 = *(void **)(v20 + 40);
            *(void *)(v20 + 40) = v19;

            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
            goto LABEL_16;
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      v6 += v8;
    }
    while (v5);
  }

  id v13 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 56)];

  if (v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke_2;
    v26[3] = &unk_1E6A76760;
    objc_copyWeak(&v29, &location);
    long long v28 = *(_OWORD *)(a1 + 64);
    id v27 = *(id *)(a1 + 48);
    uint64_t v22 = MEMORY[0x1D9471EC0](v26);
    uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 80);
    *(void *)(*(void *)(a1 + 32) + 80) = v22;

    objc_destroyWeak(&v29);
  }
LABEL_16:
  objc_destroyWeak(&location);
}

void __52__FPDMoveWriter_waitForResultOfSourceID_root_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  dispatch_assert_queue_V2(WeakRetained[14]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)startDownloadOfItem:(id)a3 shouldMaterializeRecursively:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FPDMoveWriter startDownloadOfItem:shouldMaterializeRecursively:completionHandler:]();
  }

  dispatch_semaphore_t v11 = [(id)objc_opt_class() acquireDownloadSlotForItem:v8];
  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  preemptiveDownloadCoordinator = self->_preemptiveDownloadCoordinator;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke;
  v18[3] = &unk_1E6A765D0;
  id v19 = v8;
  uint64_t v20 = self;
  id v21 = v11;
  uint64_t v22 = v12;
  id v23 = v9;
  BOOL v24 = a4;
  id v14 = v9;
  id v15 = v12;
  id v16 = v11;
  id v17 = v8;
  [(FPDCoordinator *)preemptiveDownloadCoordinator resolveItem:v17 completion:v18];
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = (void *)v7[4];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v10 = [v7 operation];
    dispatch_semaphore_t v11 = [v10 request];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39;
    v17[3] = &unk_1E6A767B0;
    id v12 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v12;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 64);
    [v8 coordinateAtURL:v5 recursively:v9 request:v11 handler:v17];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_cold_1(a1, v6, v13);
    }

    [(id)objc_opt_class() releaseDownloadSlot:*(void *)(a1 + 48)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      if (v6)
      {
        (*(void (**)(void, id))(v14 + 16))(*(void *)(a1 + 64), v6);
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) itemIdentifier];
        id v16 = FPItemNotFoundError();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);
      }
    }
  }
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = a4;
  [(id)objc_opt_class() releaseDownloadSlot:*(void *)(a1 + 40)];
  v7[2](v7);

  id v8 = fp_current_or_default_log();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39_cold_2(a1, v6, v9);
    }

    [*(id *)(a1 + 32) _finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39_cold_1(a1, v9, v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
  }
}

- (void)_removeRoot:(id)a3
{
  id v4 = a3;
  if ([v4 isFolder])
  {
    id v5 = [(FPDMoveWriter *)self coordinator];
    id v6 = [v4 asURL];
    [v5 startAccessingURLForAtomDuration:v6];

    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [v4 asURL];
    id v12 = 0;
    char v9 = [v7 removeItemAtURL:v8 error:&v12];
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FPDMoveWriter _removeRoot:](v10);
      }
    }
  }
  else
  {
    id v10 = 0;
  }
}

- (void)dumpStateTo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__FPDMoveWriter_dumpStateTo___block_invoke;
  v7[3] = &unk_1E6A736C0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __29__FPDMoveWriter_dumpStateTo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) write:@"+ writer\n"];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 88))
  {
    [*(id *)(a1 + 32) write:@"  cancelled\n"];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(void *)(v2 + 96))
  {
    [*(id *)(a1 + 32) startFgColor:1];
    [*(id *)(a1 + 32) write:@"  error: %@\n", *(void *)(*(void *)(a1 + 40) + 96)];
    [*(id *)(a1 + 32) reset];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(void *)(v2 + 72))
  {
    [*(id *)(a1 + 32) startAttributes:2];
    [*(id *)(a1 + 32) write:@"  waiter on: %@\n", *(void *)(*(void *)(a1 + 40) + 72)];
    [*(id *)(a1 + 32) reset];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  [*(id *)(a1 + 32) write:@"  folder stack (origin): %@\n", *(void *)(v2 + 40)];
  [*(id *)(a1 + 32) write:@"  folder stack (destination): %@\n", *(void *)(*(void *)(a1 + 40) + 48)];
  if ([*(id *)(*(void *)(a1 + 40) + 56) count])
  {
    [*(id *)(a1 + 32) startFgColor:1];
    [*(id *)(a1 + 32) write:@"  errors by root: %@\n", *(void *)(*(void *)(a1 + 40) + 56)];
    [*(id *)(a1 + 32) reset];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 write:@"\n"];
}

- (id)defaultExecutor
{
  providerWriter = self->_providerWriter;
  if (providerWriter)
  {
    uint64_t v3 = providerWriter;
  }
  else
  {
    uint64_t v3 = [(FPDMoveWriter *)self diskWriter];
  }
  return v3;
}

- (FPDMoveWriterExecutor)diskWriter
{
  diskWriter = self->_diskWriter;
  if (!diskWriter)
  {
    id v4 = [[FPDMoveWriterToDisk alloc] initWithWriter:self];
    id v5 = self->_diskWriter;
    self->_diskWriter = (FPDMoveWriterExecutor *)v4;

    diskWriter = self->_diskWriter;
  }
  return diskWriter;
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(FPDMoveWriter *)self defaultExecutor];
  [v18 performCopyOfItem:v17 to:v16 as:v15 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v14];
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  if (v9)
  {
    id v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[FPDMoveWriter performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](self);
    }

    id v21 = [(FPDMoveWriter *)self diskWriter];
    [v21 performCopyOfItem:v19 to:v18 as:v17 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v16];
  }
  else
  {
    id v22 = [(FPDMoveWriter *)self defaultExecutor];
    [v22 performCopyOfItem:v19 to:v18 as:v17 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v16];
  }
}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 useDiskWriter:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = fp_current_or_default_log();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v21) {
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](self);
    }

    id v29 = [(FPDMoveWriter *)self diskWriter];
  }
  else
  {
    if (v21) {
      -[FPDMoveWriter performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:](v20, v22, v23, v24, v25, v26, v27, v28);
    }

    id v29 = [(FPDMoveWriter *)self defaultExecutor];
  }
  long long v30 = v29;
  [v29 performMoveOfItem:v19 to:v18 as:v17 sourceMaterializeOption:a6 targetMaterializeOption:a7 completion:v16];
}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 useDiskWriter:(BOOL)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v17 = a10;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  BOOL v21 = fp_current_or_default_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (a9)
  {
    if (v22) {
      -[FPDMoveWriter performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:](self);
    }

    uint64_t v24 = [(FPDMoveWriter *)self diskWriter];
  }
  else
  {
    if (v22) {
      -[FPDMoveWriter performMoveOfFolder:to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:](v10, v21, v23);
    }

    uint64_t v24 = [(FPDMoveWriter *)self defaultExecutor];
  }
  uint64_t v25 = v24;
  [v24 performMoveOfFolder:v20 to:v19 as:v18 sourceMaterializeOption:a6 targetMaterializeOption:a7 atomically:v10 completion:v17];
}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 useDiskWriter:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = fp_current_or_default_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v17) {
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:](self);
    }

    uint64_t v25 = [(FPDMoveWriter *)self diskWriter];
  }
  else
  {
    if (v17) {
      -[FPDMoveWriter performCreateFolder:inside:as:useDiskWriter:completion:](v16, v18, v19, v20, v21, v22, v23, v24);
    }

    uint64_t v25 = [(FPDMoveWriter *)self defaultExecutor];
  }
  uint64_t v26 = v25;
  [v25 performCreateFolder:v15 inside:v14 as:v13 completion:v12];
}

- (FPDMoveOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (FPDMoveOperation *)WeakRetained;
}

- (id)itemCopyProgressBlock
{
  return self->_itemCopyProgressBlock;
}

- (void)setItemCopyProgressBlock:(id)a3
{
}

- (id)itemCompletionBlock
{
  return self->_itemCompletionBlock;
}

- (void)setItemCompletionBlock:(id)a3
{
}

- (id)rootCreatedBlock
{
  return self->_rootCreatedBlock;
}

- (void)setRootCreatedBlock:(id)a3
{
}

- (id)rootCompletionBlock
{
  return self->_rootCompletionBlock;
}

- (void)setRootCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void)setDiskWriter:(id)a3
{
}

- (FPMoveInfo)info
{
  return self->_info;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FPDCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_diskWriter, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_rootCompletionBlock, 0);
  objc_storeStrong(&self->_rootCreatedBlock, 0);
  objc_storeStrong(&self->_itemCompletionBlock, 0);
  objc_storeStrong(&self->_itemCopyProgressBlock, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_accessTokens, 0);
  objc_storeStrong((id *)&self->_importProgressObservation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_waiterBlock, 0);
  objc_storeStrong(&self->_waitedOnID, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_errorsByRoot, 0);
  objc_storeStrong((id *)&self->_destinationFoldersStack, 0);
  objc_storeStrong((id *)&self->_sourceFoldersStack, 0);
  objc_storeStrong((id *)&self->_preemptiveDownloadCoordinator, 0);
  objc_storeStrong((id *)&self->_providerWriter, 0);
  objc_destroyWeak((id *)&self->_moveQueue);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)initWithOperation:queue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, v0, v1, "[DEBUG] ┣%llx creating move writer", v2);
}

void __22__FPDMoveWriter__step__block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, a3, "[DEBUG] move-writer dequeued atom %@", (uint8_t *)&v4);
}

- (void)_finishWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_finishWithError:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] writer: failed with error: %@", v4, v5, v6, v7, v8);
}

- (void)startDownloadOfItem:shouldMaterializeRecursively:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D744C000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer starting download of item %@, shouldMaterializeRecursively %@", v2, 0x16u);
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: cannot resolve item to url %@: %@", v5, 0x16u);
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, a3, "[DEBUG] move-writer: finished download of item %@", (uint8_t *)&v4);
}

void __84__FPDMoveWriter_startDownloadOfItem_shouldMaterializeRecursively_completionHandler___block_invoke_39_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_2_6();
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: couldn't download item to url (%@): %@", v5, 0x16u);
}

- (void)_removeRoot:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] writer: couldn't remove root: %@", v4, v5, v6, v7, v8);
}

- (void)performCopyOfItem:(void *)a1 to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:.cold.1(void *a1)
{
  os_log_t v1 = [a1 diskWriter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] move-writer in performMoveOfItem, copying file on disk %@", v4, v5, v6, v7, v8);
}

- (void)performMoveOfItem:(void *)a1 to:as:sourceMaterializeOption:targetMaterializeOption:useDiskWriter:completion:.cold.1(void *a1)
{
  os_log_t v1 = [a1 diskWriter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] move-writer in performMoveOfItem, moving file to disk %@", v4, v5, v6, v7, v8);
}

- (void)performMoveOfItem:(uint64_t)a3 to:(uint64_t)a4 as:(uint64_t)a5 sourceMaterializeOption:(uint64_t)a6 targetMaterializeOption:(uint64_t)a7 useDiskWriter:(uint64_t)a8 completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performMoveOfFolder:(void *)a1 to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:.cold.1(void *a1)
{
  os_log_t v1 = [a1 diskWriter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] move-writer in performMoveOfFolder, moving folder to disk %@", v4, v5, v6, v7, v8);
}

- (void)performMoveOfFolder:(uint64_t)a3 to:as:sourceMaterializeOption:targetMaterializeOption:atomically:useDiskWriter:completion:.cold.2(char a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"no";
  if (a1) {
    uint64_t v3 = @"yes";
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1D744C000, a2, a3, "[DEBUG] move-writer in performMoveOfFolder, moving folder to provider, useAtomicMove %@", (uint8_t *)&v4);
}

- (void)performCreateFolder:(void *)a1 inside:as:useDiskWriter:completion:.cold.1(void *a1)
{
  os_log_t v1 = [a1 diskWriter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17(&dword_1D744C000, v2, v3, "[DEBUG] move-writer in performCreateFolder, creating folder in disk %@", v4, v5, v6, v7, v8);
}

- (void)performCreateFolder:(uint64_t)a3 inside:(uint64_t)a4 as:(uint64_t)a5 useDiskWriter:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end