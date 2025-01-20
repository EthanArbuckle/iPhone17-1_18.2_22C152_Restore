@interface FPDownloadOperation
- (BOOL)recursively;
- (FPDownloadOperation)initWithItems:(id)a3;
- (FPDownloadOperation)initWithRemoteOperation:(id)a3 info:(id)a4;
- (id)_t_patchActionOperationInfo;
- (id)downloadCompletionBlock;
- (id)fp_prettyDescription;
- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5;
- (void)_recomputeDownloadInfoIfNecessary;
- (void)_removeProgressWithItemID:(id)a3;
- (void)_retrieveChildProgressForItem:(id)a3 childProxies:(id)a4 parentSetup:(id)a5;
- (void)_runWithRemoteOperation:(id)a3;
- (void)_setupParentProgress;
- (void)_updateParentProgressForItem:(id)a3 withUnitCount:(id)a4;
- (void)_updateProgressWithUpdatedFileCountForItem:(id)a3;
- (void)actionMain;
- (void)completedWithResult:(id)a3 error:(id)a4;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6;
- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5;
- (void)remoteOperationProgressesAreReady;
- (void)setDownloadCompletionBlock:(id)a3;
- (void)setRecursively:(BOOL)a3;
- (void)set_t_patchActionOperationInfo:(id)a3;
@end

@implementation FPDownloadOperation

- (void)_recomputeDownloadInfoIfNecessary
{
  if (!self->_info)
  {
    v3 = +[FPDaemonOperationManager sharedInstance];
    v4 = [v3 generateLocalOperationID];

    v5 = [(NSArray *)self->_items fp_map:&__block_literal_global_26];
    v6 = [(FPActionOperationInfo *)[FPDownloadInfo alloc] initWithOperationID:v4 roots:v5];
    info = self->_info;
    self->_info = v6;

    [(FPDownloadInfo *)self->_info setRecursively:1];
  }
  v8 = [(FPDownloadOperation *)self _t_patchActionOperationInfo];

  if (v8)
  {
    v9 = [(FPDownloadOperation *)self _t_patchActionOperationInfo];
    v9[2](v9, self->_info);
  }
}

id __56__FPDownloadOperation__recomputeDownloadInfoIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FPActionOperationLocator locatorForItem:a2];
}

- (FPDownloadOperation)initWithItems:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPDownloadOperation;
  v6 = [(FPActionOperation *)&v13 initWithProvider:0 action:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
    itemsPendingDownload = v7->_itemsPendingDownload;
    v7->_itemsPendingDownload = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    childProxies = v7->_childProxies;
    v7->_childProxies = (NSMutableDictionary *)v10;

    [(FPDownloadOperation *)v7 _setupParentProgress];
  }

  return v7;
}

- (void)presendNotifications
{
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  v4 = [(FPActionOperation *)self stitcher];
  [v4 transformItems:self->_items handler:&__block_literal_global_7_0];

  id v5 = [(FPActionOperation *)self stitcher];
  [v5 flush];
}

void __43__FPDownloadOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCloudItem]
    && (![v2 isDownloaded]
     || [v2 isFolder] && (objc_msgSend(v2, "isRecursivelyDownloaded") & 1) == 0))
  {
    [v2 setDownloaded:0];
    [v2 setDownloading:1];
  }
}

- (id)fp_prettyDescription
{
  id v2 = NSString;
  v3 = [(NSArray *)self->_items fp_itemIdentifiers];
  v4 = [v3 componentsJoinedByString:@", "];
  id v5 = [v2 stringWithFormat:@"download items (%@)", v4];

  return v5;
}

- (void)actionMain
{
  [(FPDownloadOperation *)self _recomputeDownloadInfoIfNecessary];
  if ([(FPActionOperation *)self finishAfterPreflight]
    && [(FPActionOperation *)self finishAfterPreflight])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPDownloadOperation.m" lineNumber:106 description:@"operation shouldn't run"];
  }
  [(FPActionOperationInfo *)self->_info setAttachSandboxExtensionsOnXPCEncoding:1];
  v4 = +[FPDaemonConnection sharedConnectionProxy];
  info = self->_info;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__FPDownloadOperation_actionMain__block_invoke;
  v7[3] = &unk_1E5AF3920;
  v7[4] = self;
  [v4 scheduleActionOperationWithInfo:info completionHandler:v7];
}

void __33__FPDownloadOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FPDownloadOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E5AF17D0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __33__FPDownloadOperation_actionMain__block_invoke_2(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "completedWithResult:error:", 0);
  }
  else {
    return [v2 _runWithRemoteOperation:a1[6]];
  }
}

- (void)_completedWithResultsByRoot:(id)a3 errorsByRoot:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v10, "fp_prettyDescription");
    int v20 = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v19;
    _os_log_debug_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Remote download operation finished with results:%@; errors:%@; %@",
      (uint8_t *)&v20,
      0x20u);
  }
  uint64_t v13 = fp_current_or_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[FPDownloadOperation _completedWithResultsByRoot:errorsByRoot:error:](self);
  }

  if (v10)
  {
    id v14 = v10;
  }
  else
  {
    v15 = objc_msgSend(v9, "fp_copyItemKeysUnwrappedAndKeyMap:", 0);
    v16 = [v15 allValues];
    id v14 = [v16 firstObject];
  }
  v17 = [v8 allValues];
  v18 = objc_msgSend(v17, "fp_map:", &__block_literal_global_25_0);
  [(FPDownloadOperation *)self completedWithResult:v18 error:v14];
}

id __70__FPDownloadOperation__completedWithResultsByRoot_errorsByRoot_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isProviderItem])
  {
    uint64_t v3 = [v2 asFPItem];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)completedWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__FPDownloadOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E5AF17D0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__FPDownloadOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)FPDownloadOperation;
  objc_msgSendSuper2(&v6, sel_completedWithResult_error_, v3, v2);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(v4 + 472);
  *(void *)(v4 + 472) = 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = self->_items;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v14 itemID];
        [(FPDownloadOperation *)self _removeProgressWithItemID:v15];

        v16 = [v14 providerDomainID];
        [v8 addObject:v16];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  [(NSObservation *)self->_observation finishObserving];
  observation = self->_observation;
  self->_observation = 0;

  v18 = [(FPActionOperation *)self progress];
  v19 = [v18 fileTotalCount];
  int v20 = [(FPActionOperation *)self progress];
  [v20 setFileCompletedCount:v19];

  id v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[FPDownloadOperation finishWithResult:error:](self);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
  }
  else {
    __int16 v22 = 0;
  }
  id v23 = [(FPActionOperation *)self stitcher];
  [v23 finishWithItems:v22 error:v7];

  uint64_t v24 = [(FPDownloadOperation *)self downloadCompletionBlock];
  v25 = (void *)v24;
  if (v24)
  {
    (*(void (**)(uint64_t, id, id))(v24 + 16))(v24, v6, v7);
    [(FPDownloadOperation *)self setDownloadCompletionBlock:0];
  }

  v26.receiver = self;
  v26.super_class = (Class)FPDownloadOperation;
  [(FPActionOperation *)&v26 finishWithResult:v6 error:v7];
}

- (FPDownloadOperation)initWithRemoteOperation:(id)a3 info:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FPDownloadOperation;
  return [(FPActionOperation *)&v5 initWithProvider:0 action:0];
}

- (void)remoteOperationCompletedRoot:(id)a3 resultingItem:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  id v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[FPDownloadOperation remoteOperationCompletedRoot:resultingItem:error:completion:]((uint64_t)v10, v12, v14);
  }

  v13[2](v13);
  v15 = [(FPOperation *)self callbackQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__FPDownloadOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke;
  v17[3] = &unk_1E5AF0748;
  id v18 = v11;
  v19 = self;
  id v16 = v11;
  dispatch_async(v15, v17);
}

void __83__FPDownloadOperation_remoteOperationCompletedRoot_resultingItem_error_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isProviderItem])
  {
    uint64_t v2 = [*(id *)(a1 + 32) asFPItem];
    if (v2)
    {
      id v3 = (id)v2;
      [*(id *)(*(void *)(a1 + 40) + 464) removeObject:v2];
      [*(id *)(a1 + 40) _updateProgressWithUpdatedFileCountForItem:v3];
    }
  }
}

- (void)remoteOperationCreatedRoot:(id)a3 resultingItem:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(void))a5;
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPDownloadOperation remoteOperationCreatedRoot:resultingItem:completion:]((uint64_t)v6, v8);
  }

  v7[2](v7);
}

- (void)remoteOperationProgressesAreReady
{
  uint64_t v4 = [(FPOperation *)self callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke;
  v5[3] = &unk_1E5AF06F0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[57])
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FPDownloadOperation.m" lineNumber:228 description:@"operation was not setup propertly"];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__13;
  v11[4] = __Block_byref_object_dispose__13;
  id v12 = 0;
  uint64_t v4 = (void *)MEMORY[0x1E4F28EE8];
  objc_super v5 = [v2 progress];
  id v6 = [v4 keyPathWithRootObject:v5 path:"fractionCompleted"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_36;
  v10[3] = &unk_1E5AF3968;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = v13;
  v10[6] = v11;
  uint64_t v7 = [v6 addObserverBlock:v10];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 488);
  *(void *)(v8 + 488) = v7;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_36(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = (id *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 32) progress];
  [v4 fractionCompleted];
  if (v5 == *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {

    goto LABEL_13;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:");
    if (v6 < 1.0)
    {
      uint64_t v7 = [*v3 progress];
      [v7 fractionCompleted];
      if (v8 < 1.0)
      {
        id v9 = [*(id *)(a1 + 32) progress];
        [v9 fractionCompleted];
        double v11 = v10;
        double v12 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

        if (v11 >= v12) {
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
  }

LABEL_10:
  id v13 = [*(id *)(a1 + 32) progress];
  [v13 fractionCompleted];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2);
  v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_36_cold_1(v3);
  }

LABEL_13:
}

- (void)_runWithRemoteOperation:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke;
  v8[3] = &unk_1E5AF1240;
  v8[4] = self;
  uint64_t v4 = [a3 remoteObjectProxyWithErrorHandler:v8];
  remoteMoveOperation = self->_remoteMoveOperation;
  self->_remoteMoveOperation = v4;

  double v6 = self->_remoteMoveOperation;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_3;
  v7[3] = &unk_1E5AF3990;
  v7[4] = self;
  [(NSXPCProxyCreating *)v6 registerFrameworkClient:self operationCompletion:v7];
}

void __47__FPDownloadOperation__runWithRemoteOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_2;
  v6[3] = &unk_1E5AF0748;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = [*(id *)(a1 + 32) callbackQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_4;
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

uint64_t __47__FPDownloadOperation__runWithRemoteOperation___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedWithResultsByRoot:*(void *)(a1 + 40) errorsByRoot:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_updateProgressWithUpdatedFileCountForItem:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 itemID];

  if (v4)
  {
    id v5 = [v6 itemID];
    [(FPDownloadOperation *)self _removeProgressWithItemID:v5];
  }
}

- (void)_setupParentProgress
{
  id v3 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FPDownloadOperation__setupParentProgress__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__FPDownloadOperation__setupParentProgress__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  [v2 setTotalUnitCount:-1];

  id v3 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v3, "fp_setFileOperationKind:", *MEMORY[0x1E4F28858]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 448);
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = +[FPItemManager defaultManager];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __43__FPDownloadOperation__setupParentProgress__block_invoke_2;
        v12[3] = &unk_1E5AF2878;
        uint64_t v10 = *(void *)(a1 + 32);
        v12[4] = v8;
        v12[5] = v10;
        [v9 fetchURLForItem:v8 creatingPlaceholderIfMissing:1 completionHandler:v12];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __43__FPDownloadOperation__setupParentProgress__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __43__FPDownloadOperation__setupParentProgress__block_invoke_2_cold_1(a1, (uint64_t)v7, v8);
    }
  }
  [*(id *)(a1 + 32) setFileURL:v5];
  uint64_t v11 = a1 + 32;
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void **)(v11 + 8);
  id v12 = [v9 documentSize];
  [v10 _updateParentProgressForItem:v9 withUnitCount:v12];
}

- (void)_updateParentProgressForItem:(id)a3 withUnitCount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke;
  block[3] = &unk_1E5AF17D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 5;
  id v3 = (void *)*((void *)a1[4] + 62);
  uint64_t v4 = [a1[5] itemID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_cold_1(v2, v6);
    }
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, a1[4]);
    id v7 = a1[4];
    id v8 = a1[5];
    uint64_t v9 = v7[62];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_43;
    v10[3] = &unk_1E5AF39B8;
    objc_copyWeak(&v12, &location);
    id v11 = a1[6];
    [v7 _retrieveChildProgressForItem:v8 childProxies:v9 parentSetup:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2;
    block[3] = &unk_1E5AF17D0;
    void block[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v2, "fp_addChildProgress:withUnitCount:", *(void *)(v1 + 8), *(void *)(v1 + 16));

  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2_cold_1((id *)v1, v3);
  }
}

- (void)_removeProgressWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(NSMutableDictionary *)self->_childProxies objectForKeyedSubscript:v4];
  [v6 stopTrackingIfStarted];
  [(NSMutableDictionary *)self->_childProxies removeObjectForKey:v4];
}

- (void)_retrieveChildProgressForItem:(id)a3 childProxies:(id)a4 parentSetup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v10 fileURL];
  id v13 = objc_opt_new();
  [v13 setUpdateFileCount:1];
  long long v14 = [v10 itemID];

  [v9 setObject:v13 forKeyedSubscript:v14];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__FPDownloadOperation__retrieveChildProgressForItem_childProxies_parentSetup___block_invoke;
  v16[3] = &unk_1E5AF39E0;
  id v17 = v8;
  id v15 = v8;
  [v13 setProgressDidSetupHandler:v16];
  [v13 startTrackingFileURL:v12 kind:*MEMORY[0x1E4F28858] allowReadPausedProgressFromDisk:0];
}

uint64_t __78__FPDownloadOperation__retrieveChildProgressForItem_childProxies_parentSetup___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)recursively
{
  return self->_recursively;
}

- (void)setRecursively:(BOOL)a3
{
  self->_recursively = a3;
}

- (id)downloadCompletionBlock
{
  return self->_downloadCompletionBlock;
}

- (void)setDownloadCompletionBlock:(id)a3
{
}

- (id)_t_patchActionOperationInfo
{
  return self->__t_patchActionOperationInfo;
}

- (void)set_t_patchActionOperationInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__t_patchActionOperationInfo, 0);
  objc_storeStrong(&self->_downloadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_childProxies, 0);
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_remoteMoveOperation, 0);
  objc_storeStrong((id *)&self->_itemsPendingDownload, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_completedWithResultsByRoot:(void *)a1 errorsByRoot:error:.cold.1(void *a1)
{
  uint64_t v2 = [a1 progress];
  id v3 = [v2 localizedAdditionalDescription];
  id v4 = [a1 progress];
  id v5 = [v4 fileCompletedCount];
  id v6 = [a1 progress];
  id v7 = [v6 fileTotalCount];
  id v8 = [a1 progress];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_1A33AE000, v9, v10, "[DEBUG] download-op progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);
}

- (void)finishWithResult:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v2 = [a1 progress];
  id v3 = [v2 localizedAdditionalDescription];
  id v4 = [a1 progress];
  id v5 = [v4 fileCompletedCount];
  id v6 = [a1 progress];
  id v7 = [v6 fileTotalCount];
  id v8 = [a1 progress];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_1A33AE000, v9, v10, "[DEBUG] download-op final progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);
}

- (void)remoteOperationCompletedRoot:(NSObject *)a3 resultingItem:error:completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Remote root download finished - root:%@; error:%@",
    (uint8_t *)&v6,
    0x16u);
}

- (void)remoteOperationCreatedRoot:(uint64_t)a1 resultingItem:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Remote download root created: %@", (uint8_t *)&v2, 0xCu);
}

void __56__FPDownloadOperation_remoteOperationProgressesAreReady__block_invoke_36_cold_1(id *a1)
{
  int v2 = [*a1 progress];
  uint64_t v3 = [v2 localizedAdditionalDescription];
  uint64_t v4 = [*a1 progress];
  id v5 = [v4 fileCompletedCount];
  int v6 = [*a1 progress];
  uint64_t v7 = [v6 fileTotalCount];
  __int16 v8 = [*a1 progress];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_1A33AE000, v9, v10, "[DEBUG] download-op progress: %@\n files: %@ / %@\n%@", v11, v12, v13, v14, v15);
}

void __43__FPDownloadOperation__setupParentProgress__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Error retrieving url for item %@: %@", (uint8_t *)&v4, 0x16u);
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 itemID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-op already tracking a childProxy for item %@", (uint8_t *)&v4, 0xCu);
}

void __66__FPDownloadOperation__updateParentProgressForItem_withUnitCount___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [*a1 progress];
  uint64_t v5 = [*a1 progress];
  uint64_t v6 = [v5 fileCompletedCount];
  uint64_t v7 = [*a1 progress];
  uint64_t v8 = [v7 fileTotalCount];
  int v9 = 138412802;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download-op Added childProxy to parent: %@\n %@ / %@ files", (uint8_t *)&v9, 0x20u);
}

@end