@interface FPMoveOperation
- (BOOL)_hasAccessToURL:(id)a3 readonly:(BOOL)a4;
- (BOOL)_preflightCheckNotMovingIntoSelfWithError:(id *)a3;
- (BOOL)_preflightCheckProviderCanMoveWithErrors:(id *)a3;
- (BOOL)byCopy;
- (BOOL)shouldBounceOnCollision;
- (FPMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (FPMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4;
- (FPMoveOperation)initWithRemoteOperation:(id)a3 info:(id)a4;
- (FPMoveOperation)initWithSourceItems:(id)a3 orSourceURLs:(id)a4 destinationFolder:(id)a5 orDestinationURL:(id)a6;
- (FPMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4;
- (FPMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4;
- (NSDictionary)errorsByItem;
- (NSDictionary)progressByRoot;
- (NSDictionary)targetFilenamesByItem;
- (NSDictionary)targetFilenamesByURL;
- (NSDictionary)transferLocations;
- (NSDictionary)transferResults;
- (NSMutableDictionary)filenamesByURL;
- (id)_mapURLsToFakeFPItems:(id)a3;
- (id)_t_patchActionOperationInfo;
- (id)_t_remoteOperationWasScheduled;
- (id)_t_rootCompleted;
- (id)fp_prettyDescription;
- (id)operationDescription;
- (unint64_t)defaultLastUsedDatePolicy;
- (unint64_t)lastUsageUpdatePolicy;
- (void)_completedWithResult:(id)a3 error:(id)a4;
- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5;
- (void)_preflightForceBounceIfCopyingOntoSelf;
- (void)_presendNotifications;
- (void)_recomputeMoveInfoIfNecessary;
- (void)_recoverFromCollisionError:(id)a3 withPolicy:(unint64_t)a4;
- (void)_resetOperationBeforeErrorRecovery;
- (void)_resolveURLsWithCompletionHandler:(id)a3;
- (void)_runWithRemoteOperation:(id)a3;
- (void)_scheduleAgainAfterErrorRecovery;
- (void)_t_unblockReader;
- (void)actionMain;
- (void)cancel;
- (void)checkNonEmptyPackage;
- (void)completedWithResult:(id)a3 error:(id)a4;
- (void)gatherErrorsForUserInteractionForDomain:(id)a3 action:(id)a4 sourceItems:(id)a5 destinationItem:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9;
- (void)main;
- (void)presendNotifications;
- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6;
- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5;
- (void)remoteOperationFinishedSendingPastUpdates;
- (void)remoteOperationProgressesAreReady;
- (void)runUserInteractionsPreflight:(id)a3;
- (void)setLastUsageUpdatePolicy:(unint64_t)a3;
- (void)setProgressByRoot:(id)a3;
- (void)setShouldBounceOnCollision:(BOOL)a3;
- (void)setTargetFilenamesByItem:(id)a3;
- (void)setTargetFilenamesByURL:(id)a3;
- (void)set_t_patchActionOperationInfo:(id)a3;
- (void)set_t_remoteOperationWasScheduled:(id)a3;
- (void)set_t_rootCompleted:(id)a3;
- (void)subclassPreflightWithCompletion:(id)a3;
@end

@implementation FPMoveOperation

- (void)checkNonEmptyPackage
{
  id v2 = [(NSArray *)self->__sourceURLs fp_map:&__block_literal_global_30];
}

uint64_t __39__FPMoveOperation_checkNonEmptyPackage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = [v2 startAccessingSecurityScopedResource];
  if (objc_msgSend(v2, "fp_isPackage"))
  {
    int v10 = 0;
    id v4 = v2;
    int v5 = fpfs_num_entries((const char *)[v4 fileSystemRepresentation], 0, &v10);
    if (!(v5 | v10))
    {
      v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [v4 path];
        v8 = objc_msgSend(v7, "fp_prettyPath");
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Attempt to move/import an empty package %@", buf, 0xCu);
      }
    }
  }
  if (v3) {
    [v2 stopAccessingSecurityScopedResource];
  }

  return 0;
}

- (FPMoveOperation)initWithSourceItems:(id)a3 orSourceURLs:(id)a4 destinationFolder:(id)a5 orDestinationURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13)
  {
    v15 = [v13 providerDomainID];
  }
  else if ([v11 count])
  {
    [v11 firstObject];
    id v16 = v11;
    id v17 = v14;
    v19 = id v18 = v12;
    v15 = [v19 providerDomainID];

    id v12 = v18;
    id v14 = v17;
    id v11 = v16;
    id v13 = 0;
  }
  else
  {
    v15 = 0;
  }
  v37.receiver = self;
  v37.super_class = (Class)FPMoveOperation;
  v20 = [(FPActionOperation *)&v37 initWithProvider:v15 action:0];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_providerIdentifier, v15);
    objc_storeStrong((id *)&v21->__sourceURLs, a4);
    objc_storeStrong((id *)&v21->__sourceItems, a3);
    objc_storeStrong((id *)&v21->__destinationURL, a6);
    objc_storeStrong((id *)&v21->__destinationFolder, a5);
    v21->__lastUsedDatePolicy = [(FPMoveOperation *)v21 defaultLastUsedDatePolicy];
    [(FPActionOperation *)v21 setSourceItemsToPreflight:v11];
    [(FPActionOperation *)v21 setDestinationItemToPreflight:v13];
    v21->_isScheduledFromThisClient = 1;
    uint64_t v22 = +[FPProgressManager defaultManager];
    progressManager = v21->_progressManager;
    v21->_progressManager = (FPProgressManager *)v22;

    id location = 0;
    objc_initWeak(&location, v21);
    v24 = [(FPActionOperation *)v21 progress];
    objc_msgSend(v24, "fp_setFileOperationKind:", *MEMORY[0x1E4F28850]);

    uint64_t v25 = objc_opt_new();
    progressByRoot = v21->_progressByRoot;
    v21->_progressByRoot = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    createdOrFailedRoots = v21->_createdOrFailedRoots;
    v21->_createdOrFailedRoots = (NSMutableSet *)v27;

    uint64_t v29 = objc_opt_new();
    createdItemsByRoot = v21->_createdItemsByRoot;
    v21->_createdItemsByRoot = (NSMutableDictionary *)v29;

    uint64_t v31 = objc_opt_new();
    placeholderIDsByRoot = v21->_placeholderIDsByRoot;
    v21->_placeholderIDsByRoot = (NSMutableDictionary *)v31;

    uint64_t v33 = objc_opt_new();
    URLByResolvedFPItem = v21->_URLByResolvedFPItem;
    v21->_URLByResolvedFPItem = (NSMutableDictionary *)v33;

    [(FPActionOperation *)v21 setSetupRemoteOperationService:1];
    [(FPMoveOperation *)v21 checkNonEmptyPackage];
    objc_destroyWeak(&location);
  }

  return v21;
}

- (FPMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  return [(FPMoveOperation *)self initWithSourceItems:a3 orSourceURLs:0 destinationFolder:0 orDestinationURL:a4];
}

- (FPMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  return [(FPMoveOperation *)self initWithSourceItems:0 orSourceURLs:a3 destinationFolder:a4 orDestinationURL:0];
}

- (FPMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  return [(FPMoveOperation *)self initWithSourceItems:a3 orSourceURLs:0 destinationFolder:a4 orDestinationURL:0];
}

- (FPMoveOperation)initWithRemoteOperation:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FPMoveOperation *)self initWithSourceItems:0 orSourceURLs:0 destinationFolder:0 orDestinationURL:0];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteMoveOperation, a3);
    objc_storeStrong((id *)&v10->_info, a4);
    v10->_isScheduledFromThisClient = 0;
    [(FPActionOperation *)v10 setHavePreflight:0];
    [(FPActionOperation *)v10 setSetupRemoteOperationService:0];
  }

  return v10;
}

- (FPMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 allKeys];
  v9 = [(FPMoveOperation *)self initWithSourceItems:0 orSourceURLs:v8 destinationFolder:v6 orDestinationURL:0];

  uint64_t v10 = [v7 copy];
  targetFilenamesByURL = v9->__targetFilenamesByURL;
  v9->__targetFilenamesByURL = (NSDictionary *)v10;

  return v9;
}

- (id)operationDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"bounce:%d lud:%lu ", -[FPMoveInfo shouldBounce](self->_info, "shouldBounce"), -[FPMoveInfo lastUsedDatePolicy](self->_info, "lastUsedDatePolicy"));
}

- (id)_mapURLsToFakeFPItems:(id)a3
{
  return (id)objc_msgSend(a3, "fp_map:", &__block_literal_global_7_1);
}

FPItem *__41__FPMoveOperation__mapURLsToFakeFPItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v13 = 0;
  uint64_t v3 = *MEMORY[0x1E4F1C538];
  id v12 = 0;
  char v4 = [v2 getResourceValue:&v13 forKey:v3 error:&v12];
  id v5 = v13;
  id v6 = v12;
  if (v4)
  {
    id v7 = [FPItem alloc];
    id v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [(FPItem *)v7 initWithProviderDomainID:@"fakeIdentifier" itemIdentifier:@"fakeIdentifier" parentItemIdentifier:@"fakeIdentifier" filename:v9 contentType:v5];
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __41__FPMoveOperation__mapURLsToFakeFPItems___block_invoke_cold_1(v2, v6, v8);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_recomputeMoveInfoIfNecessary
{
  if (!self->_info)
  {
    uint64_t v3 = (FPMoveInfo *)objc_opt_new();
    info = self->_info;
    self->_info = v3;
  }
  id v5 = +[FPDaemonOperationManager sharedInstance];
  id v6 = [v5 generateLocalOperationID];
  [(FPActionOperationInfo *)self->_info setOperationID:v6];

  if (self->__sourceItems || self->__sourceURLs)
  {
    [(FPActionOperationInfo *)self->_info setRoots:0];
    sourceItems = self->__sourceItems;
    if (sourceItems)
    {
      id v8 = [(NSArray *)sourceItems fp_map:&__block_literal_global_17];
      [(FPActionOperationInfo *)self->_info setRoots:v8];
    }
    sourceURLs = self->__sourceURLs;
    if (sourceURLs)
    {
      uint64_t v10 = [(NSArray *)sourceURLs fp_map:&__block_literal_global_21_0];
      id v11 = [(FPActionOperationInfo *)self->_info roots];

      id v12 = self->_info;
      if (v11)
      {
        id v13 = [(FPActionOperationInfo *)v12 roots];
        id v14 = [v13 arrayByAddingObjectsFromArray:v10];
        [(FPActionOperationInfo *)self->_info setRoots:v14];
      }
      else
      {
        [(FPActionOperationInfo *)v12 setRoots:v10];
      }
    }
  }
  uint64_t v15 = [(FPActionOperationInfo *)self->_info roots];
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = [(NSMutableDictionary *)self->_createdItemsByRoot count];

    if (v17)
    {
      id v18 = [(FPActionOperationInfo *)self->_info roots];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_3;
      v27[3] = &unk_1E5AF3EF8;
      v27[4] = self;
      v19 = objc_msgSend(v18, "fp_filter:", v27);
      [(FPActionOperationInfo *)self->_info setRoots:v19];
    }
  }
  v20 = [(FPActionOperationInfo *)self->_info roots];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_4;
  v26[3] = &unk_1E5AF3F20;
  v26[4] = self;
  v21 = objc_msgSend(v20, "fp_map:", v26);
  [(FPMoveInfo *)self->_info setRootFilenames:v21];

  if (self->__destinationFolder)
  {
    uint64_t v22 = +[FPActionOperationLocator locatorForItem:](FPActionOperationLocator, "locatorForItem:");
  }
  else
  {
    if (!self->__destinationURL) {
      goto LABEL_20;
    }
    uint64_t v22 = +[FPActionOperationLocator locatorForURL:](FPActionOperationLocator, "locatorForURL:");
  }
  v23 = (void *)v22;
  [(FPMoveInfo *)self->_info setTargetFolder:v22];

LABEL_20:
  [(FPMoveInfo *)self->_info setLastUsedDatePolicy:self->__lastUsedDatePolicy];
  [(FPMoveInfo *)self->_info setShouldBounce:self->_shouldBounceOnCollision];
  [(FPMoveInfo *)self->_info setByCopy:[(FPMoveOperation *)self byCopy]];
  v24 = [(FPMoveOperation *)self _t_patchActionOperationInfo];

  if (v24)
  {
    uint64_t v25 = [(FPMoveOperation *)self _t_patchActionOperationInfo];
    ((void (**)(void, FPMoveInfo *))v25)[2](v25, self->_info);
  }
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForItem:a2];
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForURL:a2];
}

BOOL __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 544) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

id __48__FPMoveOperation__recomputeMoveInfoIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isExternalURL])
  {
    char v4 = *(void **)(*(void *)(a1 + 32) + 496);
    id v5 = [v3 asURL];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 496);
      uint64_t v8 = [v3 asURL];
LABEL_7:
      id v12 = (void *)v8;
      id v13 = [v7 objectForKeyedSubscript:v8];

      goto LABEL_9;
    }
  }
  if ([v3 isProviderItem])
  {
    v9 = *(void **)(*(void *)(a1 + 32) + 504);
    uint64_t v10 = [v3 asFPItem];
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 504);
      uint64_t v8 = [v3 asFPItem];
      goto LABEL_7;
    }
  }
  id v13 = [v3 filename];
LABEL_9:

  return v13;
}

- (BOOL)_hasAccessToURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int v6 = [v5 startAccessingSecurityScopedResource];
  pid_t v7 = getpid();
  if (v4) {
    uint64_t v8 = "file-read-data";
  }
  else {
    uint64_t v8 = "file-write-data";
  }
  int v9 = *MEMORY[0x1E4F14100] | 1;
  id v10 = [v5 path];
  int v11 = fpfs_lp_sandbox_check(v7, (uint64_t)v8, v9, (const char *)[v10 fileSystemRepresentation]);

  if (v6) {
    [v5 stopAccessingSecurityScopedResource];
  }

  return v11 == 0;
}

- (void)_resolveURLsWithCompletionHandler:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  v24 = (void (**)(id, id))a3;
  v26 = +[FPItemManager defaultManager];
  BOOL v4 = dispatch_group_create();
  p_destinationURL = &self->__destinationURL;
  destinationURL = self->__destinationURL;
  if (destinationURL)
  {
    if (![(FPMoveOperation *)self _hasAccessToURL:destinationURL readonly:0])
    {
      uint64_t v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FPMoveOperation _resolveURLsWithCompletionHandler:]((uint64_t *)&self->__destinationURL, v15);
      }

      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *p_destinationURL;
      uint64_t v51 = *MEMORY[0x1E4F289D0];
      v52[0] = v17;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      int v9 = [v16 errorWithDomain:*MEMORY[0x1E4F281F8] code:513 userInfo:v27];
      v24[2](v24, v9);
      goto LABEL_23;
    }
    dispatch_group_enter(v4);
    pid_t v7 = *p_destinationURL;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke;
    v46[3] = &unk_1E5AF3F48;
    v46[4] = self;
    v47 = v4;
    [v26 fetchItemForURL:v7 completionHandler:v46];
  }
  sourceURLs = self->__sourceURLs;
  if (sourceURLs)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](sourceURLs, "count"));
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->__sourceURLs, "count"));
    int v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->__targetFilenamesByURL, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obj = self->__sourceURLs;
    uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          if (![(FPMoveOperation *)self _hasAccessToURL:v14 readonly:1])
          {
            id v18 = fp_current_or_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[FPMoveOperation _resolveURLsWithCompletionHandler:](v14, v18);
            }

            v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v48 = *MEMORY[0x1E4F289D0];
            uint64_t v49 = v14;
            v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            v21 = [v19 errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:v20];
            v24[2](v24, v21);

            uint64_t v22 = obj;
            goto LABEL_22;
          }
          dispatch_group_enter(v4);
          id location = 0;
          objc_initWeak(&location, self);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_31;
          v34[3] = &unk_1E5AF3F70;
          v35 = v4;
          objc_copyWeak(&v40, &location);
          uint64_t v36 = v14;
          objc_super v37 = v9;
          id v38 = v10;
          id v39 = v27;
          [v26 fetchItemForURL:v14 completionHandler:v34];

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);
        }
        uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v27 = 0;
    int v9 = 0;
    id v10 = 0;
  }
  v23 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_32;
  block[3] = &unk_1E5AF1D80;
  int v9 = v9;
  uint64_t v29 = v9;
  id v27 = v27;
  id v30 = v27;
  uint64_t v31 = self;
  id v10 = v10;
  id v32 = v10;
  uint64_t v33 = v24;
  dispatch_group_notify(v4, v23, block);

  uint64_t v22 = v29;
LABEL_22:

LABEL_23:
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }

    id v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    [*(id *)(*(void *)(a1 + 32) + 560) setObject:*(void *)(*(void *)(a1 + 32) + 472) forKeyedSubscript:v6];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 480), a2);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 472);
    *(void *)(v10 + 472) = 0;

    [*(id *)(a1 + 32) setDestinationItemToPreflight:v6];
    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_31(id *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  objc_sync_enter(v7);
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 9);
  id v9 = WeakRetained;
  if (v5 && WeakRetained)
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_msgSend(a1[5], "fp_shortDescription");
      int v13 = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_debug_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: source URL %@ resolved to item %@", (uint8_t *)&v13, 0x20u);
    }
    [a1[6] addObject:v5];
    [v9[70] setObject:a1[5] forKeyedSubscript:v5];
    uint64_t v11 = [v9[62] objectForKeyedSubscript:a1[5]];
    if (v11) {
      [a1[7] setObject:v11 forKeyedSubscript:v5];
    }
  }
  else if (WeakRetained)
  {
    [a1[8] addObject:a1[5]];
  }

  objc_sync_exit(v7);
  dispatch_group_leave((dispatch_group_t)a1[4]);
}

uint64_t __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_32(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 40) count];
    uint64_t v3 = [*(id *)(a1 + 32) count] + v2;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 456) count];
    if (v3 != [*(id *)(*(void *)(a1 + 48) + 464) count] + v4) {
      __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_32_cold_1();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 456), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 464), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 504), *(id *)(a1 + 56));
    id v5 = [*(id *)(a1 + 48) sourceItemsToPreflight];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) sourceItemsToPreflight];
      id v7 = [v6 arrayByAddingObjectsFromArray:*(void *)(a1 + 32)];
      [*(id *)(a1 + 48) setSourceItemsToPreflight:v7];
    }
    else
    {
      [*(id *)(a1 + 48) setSourceItemsToPreflight:*(void *)(a1 + 32)];
    }
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v8 = [*(id *)(a1 + 48) sourceItemsToPreflight];

    id v9 = *(void **)(a1 + 48);
    if (v8)
    {
      uint64_t v10 = [v9 sourceItemsToPreflight];
      uint64_t v11 = [*(id *)(a1 + 48) _mapURLsToFakeFPItems:*(void *)(a1 + 40)];
      uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v11];
      [*(id *)(a1 + 48) setSourceItemsToPreflight:v12];
    }
    else
    {
      uint64_t v10 = [v9 _mapURLsToFakeFPItems:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) setSourceItemsToPreflight:v10];
    }
  }
  int v13 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v13();
}

- (void)actionMain
{
  BOOL isScheduledFromThisClient = self->_isScheduledFromThisClient;
  [(FPMoveOperation *)self _recomputeMoveInfoIfNecessary];
  if (isScheduledFromThisClient)
  {
    if ([(FPActionOperation *)self finishAfterPreflight])
    {
      if ([(FPActionOperation *)self finishAfterPreflight])
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"FPMoveOperation.m" lineNumber:465 description:@"operation shouldn't run"];
      }
    }
    [(FPActionOperationInfo *)self->_info setAttachSandboxExtensionsOnXPCEncoding:1];
    id v5 = +[FPDaemonConnection sharedConnectionProxy];
    uint64_t v6 = [(FPMoveOperation *)self qualityOfService];
    if (v6 <= 16)
    {
      if (v6 == -1)
      {
        uint64_t v7 = 21;
        goto LABEL_20;
      }
      if (v6 == 9)
      {
        uint64_t v7 = 9;
        goto LABEL_20;
      }
    }
    else
    {
      switch(v6)
      {
        case 17:
          uint64_t v7 = 17;
          goto LABEL_20;
        case 33:
          uint64_t v7 = 33;
          goto LABEL_20;
        case 25:
          uint64_t v7 = 25;
LABEL_20:
          [(FPActionOperationInfo *)self->_info setQos:v7];
          info = self->_info;
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __29__FPMoveOperation_actionMain__block_invoke;
          v11[3] = &unk_1E5AF3920;
          v11[4] = self;
          [v5 scheduleActionOperationWithInfo:info completionHandler:v11];

          return;
      }
    }
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  remoteMoveOperation = self->_remoteMoveOperation;

  [(FPMoveOperation *)self _runWithRemoteOperation:remoteMoveOperation];
}

void __29__FPMoveOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__FPMoveOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __29__FPMoveOperation_actionMain__block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "completedWithResult:error:", 0);
  }
  else {
    return [v2 _runWithRemoteOperation:a1[6]];
  }
}

- (void)main
{
  if (self->_isScheduledFromThisClient)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __23__FPMoveOperation_main__block_invoke;
    v2[3] = &unk_1E5AF1240;
    v2[4] = self;
    [(FPMoveOperation *)self _resolveURLsWithCompletionHandler:v2];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)FPMoveOperation;
    [(FPActionOperation *)&v3 main];
  }
}

id __23__FPMoveOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    return (id)[v2 completedWithResult:0 error:a2];
  }
  else
  {
    v4.receiver = v2;
    v4.super_class = (Class)FPMoveOperation;
    return objc_msgSendSuper2(&v4, sel_main);
  }
}

- (void)_runWithRemoteOperation:(id)a3
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke;
  v10[3] = &unk_1E5AF1240;
  v10[4] = self;
  objc_super v4 = [a3 remoteObjectProxyWithErrorHandler:v10];
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = v4;

  id v6 = self->_remoteMoveOperation;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_3;
  v9[3] = &unk_1E5AF3990;
  v9[4] = self;
  [(NSXPCProxyCreating *)v6 registerFrameworkClient:self operationCompletion:v9];
  uint64_t v7 = [(FPMoveOperation *)self _t_remoteOperationWasScheduled];

  if (v7)
  {
    uint64_t v8 = [(FPMoveOperation *)self _t_remoteOperationWasScheduled];
    v8[2]();
  }
}

void __43__FPMoveOperation__runWithRemoteOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_2;
  v6[3] = &unk_1E5AF0748;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __43__FPMoveOperation__runWithRemoteOperation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __43__FPMoveOperation__runWithRemoteOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) callbackQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__FPMoveOperation__runWithRemoteOperation___block_invoke_4;
  v14[3] = &unk_1E5AF0DC8;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v14);
}

uint64_t __43__FPMoveOperation__runWithRemoteOperation___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedWithResultsByRoot:*(void *)(a1 + 40) errorsByRoot:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)FPMoveOperation;
  [(FPOperation *)&v2 cancel];
}

- (void)remoteOperationProgressesAreReady
{
  objc_super v4 = [(FPOperation *)self callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__FPMoveOperation_remoteOperationProgressesAreReady__block_invoke;
  v5[3] = &unk_1E5AF06F0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __52__FPMoveOperation_remoteOperationProgressesAreReady__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [*(id *)(a1 + 32) progress];
  id v3 = *(void **)(*(void *)(a1 + 32) + 448);
  if (!v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FPMoveOperation.m" lineNumber:538 description:@"operation was not setup propertly"];

    id v3 = *(void **)(*(void *)(a1 + 32) + 448);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [v3 roots];
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F28850];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [*(id *)(*(void *)(a1 + 32) + 528) progressForRoot:v10 completion:&__block_literal_global_55];
        objc_msgSend(v11, "fp_setFileOperationKind:", v8);
        id v12 = *(void **)(*(void *)(a1 + 32) + 584);
        id v13 = [v10 underlyingObject];
        [v12 setObject:v11 forKeyedSubscript:v13];

        objc_msgSend(v2, "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount") + objc_msgSend(v11, "totalUnitCount"));
        objc_msgSend(v2, "addChild:withPendingUnitCount:", v11, objc_msgSend(v11, "totalUnitCount"));
        id v14 = [*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:v10];
        [*(id *)(*(void *)(a1 + 32) + 512) registerCopyProgress:v11 forItemID:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  (*((void (**)(id))a5 + 2))(a5);
  id v10 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__FPMoveOperation_remoteOperationCreatedRoot_resultingItem_completion___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __71__FPMoveOperation_remoteOperationCreatedRoot_resultingItem_completion___block_invoke(id *a1)
{
  id v10 = [*((id *)a1[4] + 69) objectForKeyedSubscript:a1[5]];
  objc_super v2 = (void *)*((void *)a1[4] + 73);
  id v3 = [a1[5] underlyingObject];
  objc_super v4 = [v2 objectForKeyedSubscript:v3];

  [*((id *)a1[4] + 67) addObject:a1[5]];
  id v5 = a1[6];
  if (v5
    && ([*((id *)a1[4] + 68) setObject:v5 forKeyedSubscript:a1[5]],
        [a1[6] isProviderItem]))
  {
    uint64_t v6 = [a1[6] asFPItem];
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v6)
  {
    uint64_t v7 = (void *)*((void *)a1[4] + 64);
    id v8 = [v6 itemID];
    [v7 registerCopyProgress:v4 forItemID:v8];
  }
  if (v10) {
    [*((id *)a1[4] + 64) registerCopyProgress:v4 forItemID:v10];
  }
LABEL_10:
  if ([a1[4] byCopy])
  {
    [v6 setChildItemCount:0];
    objc_msgSend(v6, "setState:", objc_msgSend(v6, "state") | 8);
    id v9 = [a1[4] stitcher];
    [v9 replacePlaceholderWithID:v10 withItem:v6];
  }
}

- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  (*((void (**)(id))a6 + 2))(a6);
  id v11 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__FPMoveOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __79__FPMoveOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "_t_rootCompleted");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_t_rootCompleted");
    id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(void *)(a1 + 40));
  }
  [*(id *)(*(void *)(a1 + 32) + 536) addObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 584) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) isProviderItem]
    && ([*(id *)(a1 + 48) asFPItem], (objc_super v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 512);
    id v11 = v4;
    uint64_t v6 = [v4 itemID];
    [v5 removeCopyProgressForItemID:v6];

    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    id v11 = 0;
  }
  if ([*(id *)(a1 + 32) byCopy])
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 552) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 512) removeCopyProgressForItemID:v8];
    char v9 = v7 ^ 1;
    if (!v8) {
      char v9 = 1;
    }
    if ((v9 & 1) == 0)
    {
      [v11 setChildItemCount:0];
      id v10 = [*(id *)(a1 + 32) stitcher];
      [v10 replacePlaceholderWithID:v8 withItem:v11];

      [*(id *)(*(void *)(a1 + 32) + 512) removeCopyProgressForItemID:v8];
    }
  }
}

- (void)remoteOperationFinishedSendingPastUpdates
{
  if (!self->_isScheduledFromThisClient)
  {
    id v3 = [(FPOperation *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FPMoveOperation_remoteOperationFinishedSendingPastUpdates__block_invoke;
    block[3] = &unk_1E5AF0FF0;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

uint64_t __60__FPMoveOperation_remoteOperationFinishedSendingPastUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presendNotifications];
}

- (void)_recoverFromCollisionError:(id)a3 withPolicy:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_msgSend(v7, "fp_userInfoFPItem");
  [(FPActionOperation *)self setHaveErrorRecovery:0];
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      if (!v8)
      {
        long long v19 = fp_current_or_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[FPMoveOperation _recoverFromCollisionError:withPolicy:](v19);
        }

        char v9 = self;
        id v10 = v7;
        goto LABEL_21;
      }
      SEL v24 = a2;
      id v11 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = [(NSDictionary *)self->_errorsByItem allValues];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v27;
        char v16 = 1;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v18 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "fp_userInfoFPItem", v24);
            if (v18)
            {
              [v11 addObject:v18];
              v16 &= ([v18 capabilities] & 0x10) != 0;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v14);
      }
      else
      {
        char v16 = 1;
      }

      if (![v11 count] && !objc_msgSend(v11, "count"))
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:v24 object:self file:@"FPMoveOperation.m" lineNumber:698 description:@"there should be at least one item"];
      }
      v20 = off_1E5AF0168;
      if ((v16 & 1) == 0) {
        v20 = off_1E5AEFF48;
      }
      uint64_t v21 = (void *)[objc_alloc(*v20) initWithItems:v11];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke;
      v25[3] = &unk_1E5AF1240;
      v25[4] = self;
      [v21 setActionCompletionBlock:v25];
      [(FPMoveOperation *)self _resetOperationBeforeErrorRecovery];
      uint64_t v22 = +[FPItemManager defaultManager];
      [v22 scheduleAction:v21];
    }
    else
    {
      if (!a4)
      {
        char v9 = self;
        id v10 = 0;
LABEL_21:
        [(FPMoveOperation *)v9 completedWithResult:0 error:v10];
        goto LABEL_30;
      }
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"FPMoveOperation.m" lineNumber:730 description:@"UNREACHABLE: unhandled recovery option"];
    }

    goto LABEL_30;
  }
  [(FPMoveOperation *)self setShouldBounceOnCollision:1];
  [(FPMoveOperation *)self _resetOperationBeforeErrorRecovery];
  [(FPMoveOperation *)self _scheduleAgainAfterErrorRecovery];
LABEL_30:
}

void __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke_2;
  v7[3] = &unk_1E5AF0748;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __57__FPMoveOperation__recoverFromCollisionError_withPolicy___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "completedWithResult:error:", 0);
  }
  else {
    return [v1 _scheduleAgainAfterErrorRecovery];
  }
}

- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v28 = objc_msgSend(v10, "fp_prettyDescription");
    *(_DWORD *)buf = 138412802;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v28;
    _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] remote operation finished with results:%@; errors:%@; %@",
      buf,
      0x20u);
  }
  objc_msgSend(v8, "fp_copyItemKeysAndValuesUnwrappedAndKeyMap:", self->_URLByResolvedFPItem);
  uint64_t v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  transferLocations = self->_transferLocations;
  self->_transferLocations = v13;

  uint64_t v15 = [(NSDictionary *)self->_transferLocations fp_filter:&__block_literal_global_66_0];
  transferResults = self->_transferResults;
  self->_transferResults = v15;

  objc_msgSend(v9, "fp_copyItemKeysUnwrappedAndKeyMap:", self->_URLByResolvedFPItem);
  long long v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  errorsByItem = self->_errorsByItem;
  self->_errorsByItem = v17;

  if (v10)
  {
    id v19 = v10;
  }
  else
  {
    v20 = [(NSDictionary *)self->_errorsByItem allValues];
    id v19 = [v20 firstObject];
  }
  uint64_t v21 = [(FPMoveInfo *)self->_info targetFolder];
  if (([v21 isProviderItem] & 1) == 0)
  {

    v23 = 0;
LABEL_11:
    long long v27 = [(NSDictionary *)self->_transferResults allValues];
    [(FPMoveOperation *)self completedWithResult:v27 error:v19];

    goto LABEL_12;
  }
  uint64_t v22 = [(FPMoveInfo *)self->_info targetFolder];
  v23 = [v22 asFPItem];

  if (!v23) {
    goto LABEL_11;
  }
  SEL v24 = [v23 childItemCount];

  if (!v24) {
    goto LABEL_11;
  }
  uint64_t v25 = [(FPActionOperation *)self itemManager];
  long long v26 = [v23 itemID];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke_2;
  v29[3] = &unk_1E5AF3F48;
  v29[4] = self;
  id v30 = v19;
  [v25 fetchItemForItemID:v26 completionHandler:v29];

LABEL_12:
}

uint64_t __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __66__FPMoveOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = *(id **)(a1 + 32);
    uint64_t v5 = [v4[72] allValues];
    id v6 = [v5 arrayByAddingObject:v3];
    [v4 completedWithResult:v6 error:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] move destination folder is gone after move finished", v9, 2u);
    }

    id v8 = *(id **)(a1 + 32);
    uint64_t v5 = [v8[72] allValues];
    [v8 completedWithResult:v5 error:*(void *)(a1 + 40)];
  }
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPMoveOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__FPMoveOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_completedWithResult:(id)a3 error:(id)a4
{
  SEL v27 = a2;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = a4;
  id v7 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    BOOL v8 = [(FPMoveInfo *)self->_info byCopy];
    id v9 = FPErrorVariantCopy;
    if (!v8) {
      id v9 = FPErrorVariantMove;
    }
    id v10 = *v9;
    id v11 = [(FPActionOperationInfo *)self->_info roots];
    id v12 = [v11 firstObject];

    if (!v12) {
      goto LABEL_10;
    }
    if ([v12 isProviderItem])
    {
      id v13 = [v12 asFPItem];
      uint64_t v14 = objc_msgSend(v6, "fp_annotatedErrorWithItem:variant:", v13, v10);
    }
    else
    {
      if (![v12 isExternalURL])
      {
LABEL_10:

        goto LABEL_11;
      }
      id v13 = [v12 asURL];
      uint64_t v14 = objc_msgSend(v6, "fp_annotatedErrorWithURL:variant:", v13, v10);
    }
    uint64_t v15 = (void *)v14;

    id v6 = v15;
    goto LABEL_10;
  }
LABEL_11:
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = 0;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v17 = [(NSMutableDictionary *)self->_createdItemsByRoot allValues];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v22, "isProviderItem", v27))
        {
          progressManager = self->_progressManager;
          SEL v24 = [v22 asFPItem];
          uint64_t v25 = [v24 itemID];
          [(FPProgressManager *)progressManager removeCopyProgressForItemID:v25];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v19);
  }

  long long v26 = [(FPActionOperation *)self stitcher];
  [v26 finishWithItems:v28 error:v6];

  if (v6)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__FPMoveOperation__completedWithResult_error___block_invoke;
    v29[3] = &unk_1E5AF3FB8;
    id v30 = v28;
    id v31 = v6;
    id v32 = self;
    SEL v33 = v27;
    [(FPActionOperation *)self tryRecoveringFromError:v31 completion:v29];
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)FPMoveOperation;
    [(FPOperation *)&v34 completedWithResult:v28 error:0];
  }
}

id __46__FPMoveOperation__completedWithResult_error___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "fp_isFileProviderError:", -1001) & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 40), "fp_isFileProviderError:", -1001) & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"FPMoveOperation.m", 832, @"unexpected recoverable error: %@", *(void *)(a1 + 40) object file lineNumber description];
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(a1 + 48);
    return (id)[v5 _recoverFromCollisionError:v6 withPolicy:a3];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    v11.receiver = *(id *)(a1 + 48);
    v11.super_class = (Class)FPMoveOperation;
    return objc_msgSendSuper2(&v11, sel_completedWithResult_error_, v9, v8);
  }
}

- (void)_presendNotifications
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  [(FPMoveOperation *)self _recomputeMoveInfoIfNecessary];
  if (![(FPActionOperation *)self finishAfterPreflight]
    && ![(FPOperation *)self isFinished])
  {
    objc_super v4 = [(FPMoveInfo *)self->_info targetFolder];
    char v5 = [v4 isExternalURL];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [(FPActionOperation *)self stitcher];
      [v6 start];

      if ([(FPMoveInfo *)self->_info lastUsedDatePolicy] == 2)
      {
        v61 = [MEMORY[0x1E4F1C9C8] date];
      }
      else
      {
        v61 = 0;
      }
      id v7 = [(FPMoveInfo *)self->_info targetFolder];
      if ([v7 isProviderItem])
      {
        uint64_t v8 = [(FPMoveInfo *)self->_info targetFolder];
        v63 = [v8 asFPItem];
      }
      else
      {
        v63 = 0;
      }

      uint64_t v9 = [(FPActionOperationInfo *)self->_info roots];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        unint64_t v12 = 0;
        v59 = (void *)*MEMORY[0x1E4F44408];
        uint64_t v60 = *MEMORY[0x1E4F1C538];
        v58 = (void *)*MEMORY[0x1E4F443C8];
        unint64_t v13 = 0x1E95CA000uLL;
        *(void *)&long long v11 = 138412546;
        long long v57 = v11;
        do
        {
          uint64_t v14 = [(FPActionOperationInfo *)self->_info roots];
          uint64_t v15 = [v14 objectAtIndexedSubscript:v12];

          char v16 = [(FPMoveInfo *)self->_info rootFilenames];
          long long v17 = [v16 objectAtIndexedSubscript:v12];

          if (([*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v13 + 3656)) containsObject:v15] & 1) == 0)
          {
            v64 = v17;
            if ([v15 isExternalURL])
            {
              uint64_t v18 = [v15 asURL];
              int v19 = [v18 startAccessingSecurityScopedResource];
              id v71 = 0;
              id v70 = 0;
              int v20 = [v18 getResourceValue:&v71 forKey:v60 error:&v70];
              id v21 = v71;
              id v62 = v70;
              if (!v20 || !v21)
              {
                uint64_t v22 = fp_current_or_default_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v76 = v15;
                  __int16 v77 = 2112;
                  id v78 = v62;
                  _os_log_error_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Failed to get type of %@ (%@)", buf, 0x16u);
                }

                int v23 = [v15 isFolder];
                SEL v24 = v59;
                if (v23) {
                  SEL v24 = v58;
                }
                id v25 = v24;

                id v21 = v25;
              }
              if (v19) {
                [v18 stopAccessingSecurityScopedResource];
              }
              long long v26 = [(FPActionOperation *)self stitcher];
              SEL v27 = [v63 itemIdentifier];
              id v28 = [v63 providerDomainID];
              long long v29 = [v26 createPlaceholderWithName:v64 contentType:v21 contentAccessDate:v61 underParent:v27 inProviderDomainID:v28];
              [(NSMutableDictionary *)self->_placeholderIDsByRoot setObject:v29 forKeyedSubscript:v15];

              unint64_t v13 = 0x1E95CA000;
              id v30 = v62;
            }
            else
            {
              id v21 = [v15 asFPItem];
              if ([(FPMoveInfo *)self->_info byCopy])
              {
                id v30 = [(FPActionOperation *)self stitcher];
                unint64_t v31 = [(FPMoveInfo *)self->_info lastUsedDatePolicy];
                id v32 = [v63 itemIdentifier];
                SEL v33 = [v63 providerDomainID];
                objc_super v34 = [v30 createPlaceholderWithCopyOfExistingItem:v21 lastUsageUpdatePolicy:v31 underParent:v32 inProviderDomainID:v33];
                [(NSMutableDictionary *)self->_placeholderIDsByRoot setObject:v34 forKeyedSubscript:v15];
              }
              else if (v63 {
                     && ([v21 providerDomainID],
              }
                         long long v35 = objc_claimAutoreleasedReturnValue(),
                         [v63 providerDomainID],
                         long long v36 = objc_claimAutoreleasedReturnValue(),
                         int v37 = [v35 isEqualToString:v36],
                         v36,
                         v35,
                         v37))
              {
                long long v38 = [(FPActionOperation *)self stitcher];
                id v74 = v21;
                id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
                v68[0] = MEMORY[0x1E4F143A8];
                v68[1] = 3221225472;
                v68[2] = __40__FPMoveOperation__presendNotifications__block_invoke;
                v68[3] = &unk_1E5AF3FE0;
                id v69 = v63;
                [v38 transformItems:v39 handler:v68];

                id v30 = v69;
              }
              else
              {
                uint64_t v40 = [(FPActionOperation *)self stitcher];
                id v73 = v21;
                v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
                [v40 deleteItems:v41];

                id v30 = [(FPActionOperation *)self stitcher];
                long long v42 = [v63 itemIdentifier];
                long long v43 = [v63 providerDomainID];
                id v44 = (id)[v30 createPlaceholderWithCopyOfExistingItem:v21 lastUsageUpdatePolicy:1 underParent:v42 inProviderDomainID:v43];
              }
            }

            long long v17 = v64;
          }

          ++v12;
          long long v45 = [(FPActionOperationInfo *)self->_info roots];
          unint64_t v46 = [v45 count];
        }
        while (v12 < v46);
      }
      if (v63)
      {
        v47 = [(FPMoveInfo *)self->_info targetFolder];
        uint64_t v48 = [v47 asFPItem];
        uint64_t v49 = [v48 childItemCount];

        if (v49)
        {
          v50 = [(FPActionOperationInfo *)self->_info roots];
          uint64_t v51 = [v50 count];

          v52 = [(FPActionOperation *)self stitcher];
          v53 = [(FPMoveInfo *)self->_info targetFolder];
          v54 = [v53 asFPItem];
          v72 = v54;
          v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __40__FPMoveOperation__presendNotifications__block_invoke_2;
          v65[3] = &unk_1E5AF4008;
          id v66 = v49;
          uint64_t v67 = v51;
          [v52 transformItems:v55 handler:v65];
        }
      }
      v56 = [(FPActionOperation *)self stitcher];
      [v56 flush];
    }
  }
}

void __40__FPMoveOperation__presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 itemIdentifier];
  [v4 setParentItemIdentifier:v5];

  id v6 = [*(id *)(a1 + 32) providerDomainID];
  [v4 setProviderDomainID:v6];
}

void __40__FPMoveOperation__presendNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setState:0];
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 40) + objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setChildItemCount:v4];
}

- (void)presendNotifications
{
  if (self->_isScheduledFromThisClient)
  {
    id v3 = [(FPOperation *)self callbackQueue];
    dispatch_activate(v3);

    id v4 = [(FPOperation *)self callbackQueue];
    dispatch_assert_queue_not_V2(v4);

    char v5 = [(FPOperation *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__FPMoveOperation_presendNotifications__block_invoke;
    block[3] = &unk_1E5AF0FF0;
    void block[4] = self;
    dispatch_sync(v5, block);
  }
}

uint64_t __39__FPMoveOperation_presendNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presendNotifications];
}

- (BOOL)byCopy
{
  return 0;
}

- (unint64_t)defaultLastUsedDatePolicy
{
  return 1;
}

- (void)runUserInteractionsPreflight:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(FPActionOperation *)self setupRemoteOperationService])
  {
    id v6 = [(FPActionOperation *)self sourceItemsToPreflight];
    id v7 = [v6 firstObject];
    if ([v7 isExcludedFromSync])
    {
      uint64_t v8 = 0;
    }
    else
    {
      sourceItems = self->__sourceItems;

      if (!sourceItems)
      {
        uint64_t v8 = 0;
LABEL_8:
        uint64_t v10 = [(FPActionOperation *)self destinationItemToPreflight];
        if ([v10 isExcludedFromSync])
        {
          uint64_t v11 = 0;
        }
        else
        {
          unint64_t v12 = [(FPActionOperation *)self sourceItemsToPreflight];
          unint64_t v13 = [v12 firstObject];
          char v14 = [v13 isIgnoreRoot];

          if (v14)
          {
            uint64_t v11 = 0;
            goto LABEL_14;
          }
          uint64_t v10 = [(FPActionOperation *)self destinationItemToPreflight];
          uint64_t v11 = [v10 providerDomainID];
        }

LABEL_14:
        if (!(v8 | v11))
        {
          id v21 = [(FPOperation *)self callbackQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke;
          block[3] = &unk_1E5AF14E8;
          uint64_t v49 = (__CFString *)v5;
          dispatch_async(v21, block);

          int v19 = v49;
LABEL_65:

          goto LABEL_66;
        }
        uint64_t v15 = fp_current_or_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v51 = (uint64_t (*)(uint64_t, uint64_t))v11;
          _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: preflighting for moving items from %@ to %@", buf, 0x20u);
        }

        if (v8) {
          BOOL v16 = v11 != 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          goto LABEL_24;
        }
        if (v8 && v11)
        {
          if (([(id)v8 isEqualToString:v11] & 1) == 0)
          {
LABEL_24:
            BOOL v17 = [(FPMoveOperation *)self byCopy];
            uint64_t v18 = FPPreflightActionCopyOut;
            if (!v17) {
              uint64_t v18 = FPPreflightActionMoveOut;
            }
            int v19 = *v18;
            if (!v11)
            {
              SEL v24 = 0;
              goto LABEL_46;
            }
            if (![(FPActionOperation *)self finishAfterPreflight]
              && ![(FPMoveOperation *)self byCopy]
              && ![(FPActionOperation *)self finishAfterPreflight]
              && ![(FPMoveOperation *)self byCopy])
            {
              int v37 = [MEMORY[0x1E4F28B00] currentHandler];
              [v37 handleFailureInMethod:a2, self, @"FPMoveOperation.m", 1009, @"cross-domain moves only support preflight, not execution" object file lineNumber description];
            }
            BOOL v20 = [(FPMoveOperation *)self byCopy];
            goto LABEL_38;
          }
        }
        else if (!v8 && v11)
        {
          BOOL v20 = [(FPMoveOperation *)self byCopy];
          int v19 = 0;
LABEL_38:
          uint64_t v22 = FPPreflightActionCopyIn;
          if (!v20) {
            uint64_t v22 = FPPreflightActionMoveIn;
          }
          int v23 = *v22;
          SEL v24 = v23;
LABEL_44:
          SEL v27 = v23;
LABEL_46:
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v51 = __Block_byref_object_copy__16;
          v52 = __Block_byref_object_dispose__16;
          id v53 = 0;
          id v53 = (id)objc_opt_new();
          id v28 = dispatch_group_create();
          long long v29 = fp_current_or_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[FPMoveOperation runUserInteractionsPreflight:]((uint64_t)self);
          }

          uint64_t v38 = v8;
          if (v19)
          {
            dispatch_group_enter(v28);
            id v30 = [(FPActionOperation *)self sourceItemsToPreflight];
            if (v24)
            {
              unint64_t v31 = 0;
            }
            else
            {
              unint64_t v31 = [(FPActionOperation *)self destinationItemToPreflight];
            }
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_80;
            v45[3] = &unk_1E5AF4030;
            v47 = buf;
            unint64_t v46 = v28;
            [(FPMoveOperation *)self gatherErrorsForUserInteractionForDomain:v8 action:v19 sourceItems:v30 destinationItem:v31 sourceItemKeysAllowList:0 destinationItemKeysAllowList:0 completionHandler:v45];
            if (!v24) {
          }
            }
          if (v24)
          {
            dispatch_group_enter(v28);
            id v32 = fp_current_or_default_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[FPMoveOperation runUserInteractionsPreflight:]((uint64_t)self);
            }

            if (v19)
            {
              SEL v33 = 0;
            }
            else
            {
              SEL v33 = [(FPActionOperation *)self sourceItemsToPreflight];
            }
            objc_super v34 = [(FPActionOperation *)self destinationItemToPreflight];
            long long v35 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF6C3A58];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_85;
            v42[3] = &unk_1E5AF4030;
            id v44 = buf;
            long long v43 = v28;
            [(FPMoveOperation *)self gatherErrorsForUserInteractionForDomain:v11 action:v24 sourceItems:v33 destinationItem:v34 sourceItemKeysAllowList:v35 destinationItemKeysAllowList:0 completionHandler:v42];

            if (!v19) {
          }
            }
          long long v36 = [(FPOperation *)self callbackQueue];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2;
          v39[3] = &unk_1E5AF4058;
          v41 = buf;
          v39[4] = self;
          id v40 = v5;
          dispatch_group_notify(v28, v36, v39);

          uint64_t v8 = v38;
          _Block_object_dispose(buf, 8);

          goto LABEL_65;
        }
        BOOL v25 = [(FPMoveOperation *)self byCopy];
        SEL v24 = 0;
        long long v26 = FPPreflightActionCopy;
        if (!v25) {
          long long v26 = FPPreflightActionMove;
        }
        int v23 = *v26;
        int v19 = v23;
        goto LABEL_44;
      }
      id v6 = [(FPActionOperation *)self sourceItemsToPreflight];
      id v7 = [v6 firstObject];
      uint64_t v8 = [v7 providerDomainID];
    }

    goto LABEL_8;
  }
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_66:
}

uint64_t __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_80(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_85(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"description" ascending:1];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v7[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = [v3 sortedArrayUsingDescriptors:v4];

  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)gatherErrorsForUserInteractionForDomain:(id)a3 action:(id)a4 sourceItems:(id)a5 destinationItem:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = [(FPActionOperation *)self itemManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke;
  v30[3] = &unk_1E5AF40A8;
  id v36 = v20;
  id v37 = v21;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v15;
  id v35 = v19;
  id v23 = v20;
  id v24 = v19;
  id v25 = v15;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v21;
  [v22 fetchOperationServiceForProviderDomainID:v25 handler:v30];
}

void __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v4();
  }
  else
  {
    id v5 = [a2 remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AF4080;
    id v13 = *(id *)(a1 + 80);
    [v5 userInteractionErrorsForPerformingAction:v6 sourceItems:v7 destinationItem:v8 fpProviderDomainId:v9 sourceItemKeysAllowList:v10 destinationItemKeysAllowList:v11 completionHandler:v12];
  }
}

void __165__FPMoveOperation_gatherErrorsForUserInteractionForDomain_action_sourceItems_destinationItem_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3 && [v3 count])
  {
    id v4 = [v6 objectAtIndex:0];
    id v5 = (void *)[v4 copy];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)_preflightCheckProviderCanMoveWithErrors:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (![(FPMoveInfo *)self->_info byMoving]) {
    return 1;
  }
  id v30 = a3;
  id v33 = self;
  id v5 = [(FPMoveInfo *)self->_info targetFolder];
  char v6 = [v5 isExternalURL];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(FPActionOperation *)v33 remoteService];

  if (!v8)
  {
    uint64_t v9 = [(FPActionOperation *)v33 remoteService];

    if (!v9)
    {
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:v33 file:@"FPMoveOperation.m" lineNumber:1117 description:@"cannot preflight without the service"];
    }
  }
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__16;
  long long v43 = __Block_byref_object_dispose__16;
  id v44 = 0;
  uint64_t v10 = [(FPMoveInfo *)v33->_info targetFolder];
  uint64_t v11 = [v10 asFPItem];

  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unint64_t v12 = [(FPActionOperationInfo *)v33->_info roots];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v36;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        if (([v16 isExternalURL] & 1) == 0)
        {
          id v17 = [v16 asFPItem];
          id v18 = [v17 providerDomainID];
          id v19 = [v11 providerDomainID];
          char v20 = [v18 isEqualToString:v19];

          if (v20)
          {
            id v21 = [v16 asFPItem];
            uint64_t v22 = [v21 itemID];
            [v32 addObject:v22];

LABEL_15:
            goto LABEL_18;
          }
          if (![(FPActionOperation *)v33 finishAfterPreflight]
            && ![(FPActionOperation *)v33 finishAfterPreflight])
          {
            id v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:a2 object:v33 file:@"FPMoveOperation.m" lineNumber:1130 description:@"only preflight is supported on cross-domain moves"];
            goto LABEL_15;
          }
        }
LABEL_18:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v23 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      uint64_t v13 = v23;
    }
    while (v23);
  }

  if ([v32 count])
  {
    id v24 = [(FPActionOperation *)v33 remoteService];
    id v25 = [v24 synchronousRemoteObjectProxy];
    id v26 = [v11 itemID];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__FPMoveOperation__preflightCheckProviderCanMoveWithErrors___block_invoke;
    v34[3] = &unk_1E5AF40D0;
    void v34[4] = &v39;
    [v25 preflightReparentItemIDs:v32 underParentID:v26 reply:v34];
  }
  uint64_t v27 = [(id)v40[5] count];
  if (v30 && v27) {
    *id v30 = (id) v40[5];
  }
  BOOL v7 = [(id)v40[5] count] == 0;

  _Block_object_dispose(&v39, 8);
  return v7;
}

void __60__FPMoveOperation__preflightCheckProviderCanMoveWithErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  id v4 = v5;
  if (v5) {
    a2 = v4;
  }
  objc_storeStrong(v3, a2);
}

- (BOOL)_preflightCheckNotMovingIntoSelfWithError:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = [(FPMoveInfo *)self->_info targetFolder];
  char v4 = [v3 isExternalURL];

  if (v4) {
    return 1;
  }
  char v6 = [(FPMoveInfo *)self->_info targetFolder];
  id v32 = [v6 asFPItem];

  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__16;
  id v62 = __Block_byref_object_dispose__16;
  id v63 = 0;
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__16;
  v56 = __Block_byref_object_dispose__16;
  id v57 = 0;
  long long v38 = (NSDictionary *)objc_opt_new();
  BOOL v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v8 = [(FPActionOperation *)self itemManager];
  uint64_t v9 = [v32 itemID];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __61__FPMoveOperation__preflightCheckNotMovingIntoSelfWithError___block_invoke;
  v48[3] = &unk_1E5AF40F8;
  v50 = &v52;
  uint64_t v51 = &v58;
  dispatch_group_t group = v7;
  dispatch_group_t v49 = group;
  [v8 fetchParentsForItemID:v9 recursively:1 completionHandler:v48];

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = [(id)v59[5] arrayByAddingObject:v32];
  uint64_t v11 = (void *)v59[5];
  v59[5] = v10;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v12 = [(FPActionOperationInfo *)self->_info roots];
  uint64_t v35 = [v12 countByEnumeratingWithState:&v44 objects:v65 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v45;
    uint64_t v37 = *MEMORY[0x1E4F281F8];
    id obj = v12;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (([v13 isExternalURL] & 1) == 0)
        {
          uint64_t v14 = [v13 asFPItem];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v15 = (id)v59[5];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v64 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v41 != v17) {
                  objc_enumerationMutation(v15);
                }
                id v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                char v20 = [v14 itemID];
                id v21 = [v19 itemID];
                LODWORD(v19) = [v20 isEqual:v21];

                if (v19)
                {
                  uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:v37 code:512 userInfo:0];
                  if ([(FPMoveOperation *)self byCopy]) {
                    uint64_t v23 = @"Copy";
                  }
                  else {
                    uint64_t v23 = @"Move";
                  }
                  uint64_t v24 = objc_msgSend(v22, "fp_annotatedErrorWithItem:variant:", v14, v23);
                  id v25 = (void *)v53[5];
                  v53[5] = v24;

                  [(NSDictionary *)v38 setObject:v53[5] forKeyedSubscript:v14];
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v64 count:16];
            }
            while (v16);
          }
        }
      }
      unint64_t v12 = obj;
      uint64_t v35 = [obj countByEnumeratingWithState:&v44 objects:v65 count:16];
    }
    while (v35);
  }

  errorsByItem = self->_errorsByItem;
  self->_errorsByItem = v38;
  uint64_t v27 = v38;

  id v28 = (void *)v53[5];
  if (a3 && v28)
  {
    *a3 = v28;
    id v28 = (void *)v53[5];
  }
  BOOL v5 = v28 == 0;

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v5;
}

void __61__FPMoveOperation__preflightCheckNotMovingIntoSelfWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v6 + 40);
  BOOL v7 = (id *)(v6 + 40);
  uint64_t v8 = v9;
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = a3;
  }
  objc_storeStrong(v7, v10);
  id v14 = a3;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_preflightForceBounceIfCopyingOntoSelf
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 600;
  if (!self->_shouldBounceOnCollision)
  {
    id v3 = [(FPMoveInfo *)self->_info targetFolder];
    char v4 = [v3 isExternalURL];

    if ((v4 & 1) == 0)
    {
      id v5 = [(FPMoveInfo *)self->_info targetFolder];
      uint64_t v22 = [v5 asFPItem];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = [(FPActionOperationInfo *)self->_info roots];
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v34;
        char v20 = v24;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v34 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v27 = 0;
            id v28 = &v27;
            uint64_t v29 = 0x3032000000;
            id v30 = __Block_byref_object_copy__16;
            id v31 = __Block_byref_object_dispose__16;
            id v32 = 0;
            if (objc_msgSend(v9, "isProviderItem", v19, v20))
            {
              uint64_t v10 = [v9 asFPItem];
            }
            else
            {
              uint64_t v10 = 0;
            }
            id v32 = v10;
            if (!v28[5] && [v9 isExternalURL])
            {
              dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
              unint64_t v12 = [(FPActionOperation *)self itemManager];
              id v13 = [v9 asURL];
              v23[0] = MEMORY[0x1E4F143A8];
              v23[1] = 3221225472;
              v24[0] = __57__FPMoveOperation__preflightForceBounceIfCopyingOntoSelf__block_invoke;
              v24[1] = &unk_1E5AF4120;
              id v26 = &v27;
              id v14 = v11;
              id v25 = v14;
              [v12 fetchItemForURL:v13 completionHandler:v23];

              dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
            }
            id v15 = (void *)v28[5];
            if (v15)
            {
              uint64_t v16 = [v15 parentItemID];
              uint64_t v17 = [v22 itemID];
              int v18 = [v16 isEqual:v17];

              if (v18)
              {
                *((unsigned char *)&self->super.super.super.super.isa + v19) = 1;
                _Block_object_dispose(&v27, 8);

                goto LABEL_20;
              }
            }
            _Block_object_dispose(&v27, 8);
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_20:
    }
  }
}

void __57__FPMoveOperation__preflightForceBounceIfCopyingOntoSelf__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v6);

  [(FPMoveOperation *)self _recomputeMoveInfoIfNecessary];
  id v13 = 0;
  [(FPMoveOperation *)self _preflightCheckNotMovingIntoSelfWithError:&v13];
  id v7 = v13;
  id v12 = 0;
  [(FPMoveOperation *)self _preflightCheckProviderCanMoveWithErrors:&v12];
  id v8 = v12;
  [(FPMoveOperation *)self _preflightForceBounceIfCopyingOntoSelf];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = v9;
  if (v7) {
    [v9 addObject:v7];
  }
  if (v8) {
    [v10 addObjectsFromArray:v8];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__FPMoveOperation_subclassPreflightWithCompletion___block_invoke;
  v11[3] = &unk_1E5AF4148;
  v11[4] = self;
  void v11[5] = a2;
  [(FPActionOperation *)self tryRecoveringFromPreflightErrors:v10 recoveryHandler:v11 completion:v5];
}

uint64_t __51__FPMoveOperation_subclassPreflightWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3) {
    goto LABEL_5;
  }
  if (a3 != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"FPMoveOperation.m", 1270, @"UNREACHABLE: invalid index for error: %@", v5 object file lineNumber description];

LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

- (void)_t_unblockReader
{
  id v3 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FPMoveOperation__t_unblockReader__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __35__FPMoveOperation__t_unblockReader__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 528), "_t_unblockReader");
}

- (void)_resetOperationBeforeErrorRecovery
{
  id v3 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(FPActionOperation *)self stitcher];
  [v4 finish];

  [(FPActionOperation *)self resetStitcher];

  [(FPOperation *)self resetRemoteOperation];
}

- (void)_scheduleAgainAfterErrorRecovery
{
  id v4 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_isScheduledFromThisClient)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"FPMoveOperation.m" lineNumber:1301 description:@"retrying remote operations is not supported"];
  }
  [(FPMoveOperation *)self _presendNotifications];

  [(FPMoveOperation *)self actionMain];
}

- (id)fp_prettyDescription
{
  BOOL v3 = [(FPMoveOperation *)self byCopy];
  sourceURLs = self->__sourceURLs;
  id v5 = NSString;
  if (v3)
  {
    if (sourceURLs) {
      [(NSArray *)sourceURLs fp_map:&__block_literal_global_110];
    }
    else {
    uint64_t v6 = [(NSArray *)self->__sourceItems fp_itemIdentifiers];
    }
    id v7 = [v6 componentsJoinedByString:@", "];
    [v5 stringWithFormat:@"copy items (%@)", v7];
  }
  else
  {
    if (sourceURLs) {
      [(NSArray *)sourceURLs fp_map:&__block_literal_global_118];
    }
    else {
    uint64_t v6 = [(NSArray *)self->__sourceItems fp_itemIdentifiers];
    }
    id v7 = [v6 componentsJoinedByString:@", "];
    [v5 stringWithFormat:@"move items (%@)", v7];
  id v8 = };

  return v8;
}

uint64_t __39__FPMoveOperation_fp_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_shortDescription");
}

uint64_t __39__FPMoveOperation_fp_prettyDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_shortDescription");
}

- (NSDictionary)errorsByItem
{
  return self->_errorsByItem;
}

- (NSDictionary)targetFilenamesByURL
{
  return self->__targetFilenamesByURL;
}

- (void)setTargetFilenamesByURL:(id)a3
{
}

- (NSDictionary)targetFilenamesByItem
{
  return self->__targetFilenamesByItem;
}

- (void)setTargetFilenamesByItem:(id)a3
{
}

- (NSDictionary)transferResults
{
  return self->_transferResults;
}

- (unint64_t)lastUsageUpdatePolicy
{
  return self->__lastUsedDatePolicy;
}

- (void)setLastUsageUpdatePolicy:(unint64_t)a3
{
  self->__lastUsedDatePolicy = a3;
}

- (BOOL)shouldBounceOnCollision
{
  return self->_shouldBounceOnCollision;
}

- (void)setShouldBounceOnCollision:(BOOL)a3
{
  self->_shouldBounceOnCollision = a3;
}

- (NSDictionary)transferLocations
{
  return self->_transferLocations;
}

- (NSMutableDictionary)filenamesByURL
{
  return self->_filenamesByURL;
}

- (NSDictionary)progressByRoot
{
  return &self->_progressByRoot->super;
}

- (void)setProgressByRoot:(id)a3
{
}

- (id)_t_patchActionOperationInfo
{
  return self->__t_patchActionOperationInfo;
}

- (void)set_t_patchActionOperationInfo:(id)a3
{
}

- (id)_t_remoteOperationWasScheduled
{
  return self->__t_remoteOperationWasScheduled;
}

- (void)set_t_remoteOperationWasScheduled:(id)a3
{
}

- (id)_t_rootCompleted
{
  return self->__t_rootCompleted;
}

- (void)set_t_rootCompleted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_rootCompleted, 0);
  objc_storeStrong(&self->__t_remoteOperationWasScheduled, 0);
  objc_storeStrong(&self->__t_patchActionOperationInfo, 0);
  objc_storeStrong((id *)&self->_filenamesByURL, 0);
  objc_storeStrong((id *)&self->_transferLocations, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_transferResults, 0);
  objc_storeStrong((id *)&self->_errorsByItem, 0);
  objc_storeStrong((id *)&self->_URLByResolvedFPItem, 0);
  objc_storeStrong((id *)&self->_placeholderIDsByRoot, 0);
  objc_storeStrong((id *)&self->_createdItemsByRoot, 0);
  objc_storeStrong((id *)&self->_createdOrFailedRoots, 0);
  objc_storeStrong((id *)&self->_remoteMoveOperation, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->__targetFilenamesByItem, 0);
  objc_storeStrong((id *)&self->__targetFilenamesByURL, 0);
  objc_storeStrong((id *)&self->__destinationFolder, 0);
  objc_storeStrong((id *)&self->__destinationURL, 0);
  objc_storeStrong((id *)&self->__sourceItems, 0);
  objc_storeStrong((id *)&self->__sourceURLs, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

void __41__FPMoveOperation__mapURLsToFakeFPItems___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "fp_shortDescription");
  uint64_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Error converting URL %@ to FPItem: %@", (uint8_t *)&v7, 0x16u);
}

- (void)_resolveURLsWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] No read permission for source: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_resolveURLsWithCompletionHandler:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] No write permission to destination: %@", (uint8_t *)&v3, 0xCu);
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = objc_msgSend(*(id *)(v5 + 472), "fp_shortDescription");
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: destination URL %@ resolved to item %@", (uint8_t *)&v7, 0x20u);
}

void __53__FPMoveOperation__resolveURLsWithCompletionHandler___block_invoke_32_cold_1()
{
  __assert_rtn("-[FPMoveOperation _resolveURLsWithCompletionHandler:]_block_invoke", "FPMoveOperation.m", 427, "externalURLS.count + items.count == self->__sourceURLs.count + self->__sourceItems.count");
}

- (void)_recoverFromCollisionError:(os_log_t)log withPolicy:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] file provider extension sent a collision error without an item", v1, 2u);
}

- (void)runUserInteractionsPreflight:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] %@: running user interaction preflight for %@", (void)v3, DWORD2(v3));
}

void __48__FPMoveOperation_runUserInteractionsPreflight___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] %@: returning %@", (void)v3, DWORD2(v3));
}

@end