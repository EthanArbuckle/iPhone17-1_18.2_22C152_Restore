@interface FPActionOperation
+ (id)newArrayRemovingFirstElement:(id)a3;
- (BOOL)finishAfterPreflight;
- (BOOL)haveErrorRecovery;
- (BOOL)havePreflight;
- (BOOL)haveStitching;
- (BOOL)setupRemoteOperationService;
- (BOOL)skipPreflight;
- (FPActionOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4;
- (FPActionOperation)initWithProvider:(id)a3 action:(id)a4;
- (FPItem)destinationItemToPreflight;
- (FPItemManager)itemManager;
- (FPStitchingSession)stitcher;
- (FPXOperationService)remoteService;
- (FPXOperationService)remoteServiceProxy;
- (NSArray)sourceItemsToPreflight;
- (NSProgress)progress;
- (NSSet)destinationItemKeysAllowList;
- (NSSet)sourceItemKeysAllowList;
- (NSString)action;
- (id)actionCompletionBlock;
- (id)errorRecoveryHandler;
- (id)operationDescription;
- (id)placeholdersCreationBlock;
- (id)replicateForItems:(id)a3;
- (void)_dispatchToSubOperations;
- (void)_preflightAndRun;
- (void)_runUserInteractionsPreflight:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)invokeErrorRecoveryHandlerWithService:(id)a3 fpProviderDomainId:(id)a4 error:(id)a5 completion:(id)a6;
- (void)main;
- (void)preflightWithCompletion:(id)a3;
- (void)resetStitcher;
- (void)runUserInteractionsPreflight:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionCompletionBlock:(id)a3;
- (void)setDestinationItemKeysAllowList:(id)a3;
- (void)setDestinationItemToPreflight:(id)a3;
- (void)setErrorRecoveryHandler:(id)a3;
- (void)setFinishAfterPreflight:(BOOL)a3;
- (void)setHaveErrorRecovery:(BOOL)a3;
- (void)setHavePreflight:(BOOL)a3;
- (void)setHaveStitching:(BOOL)a3;
- (void)setItemManager:(id)a3;
- (void)setPlaceholdersCreationBlock:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRemoteService:(id)a3;
- (void)setSetupRemoteOperationService:(BOOL)a3;
- (void)setSkipPreflight:(BOOL)a3;
- (void)setSourceItemKeysAllowList:(id)a3;
- (void)setSourceItemsToPreflight:(id)a3;
- (void)subclassPreflightWithCompletion:(id)a3;
- (void)tryRecoveringFromError:(id)a3 completion:(id)a4;
- (void)tryRecoveringFromPreflightErrors:(id)a3 recoveryHandler:(id)a4 completion:(id)a5;
@end

@implementation FPActionOperation

- (FPActionOperation)initWithProvider:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FPActionOperation;
  v9 = [(FPOperation *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_setupRemoteOperationService = 0;
    v9->_haveErrorRecovery = 1;
    v9->_haveStitching = 1;
    v9->_havePreflight = 1;
    v9->_skipPreflight = 0;
    objc_storeStrong((id *)&v9->_action, a4);
    objc_storeStrong((id *)&v10->_providerIdentifier, a3);
    uint64_t v11 = +[FPItemManager defaultManager];
    itemManager = v10->_itemManager;
    v10->_itemManager = (FPItemManager *)v11;

    uint64_t section = __fp_create_section();
    v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPActionOperation initWithProvider:action:]((uint64_t)v10, section);
    }

    v10->_logSection = section;
    uint64_t v15 = objc_opt_new();
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v15;

    [(NSProgress *)v10->_progress setCancellable:1];
    id location = 0;
    objc_initWeak(&location, v10);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__FPActionOperation_initWithProvider_action___block_invoke;
    v18[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v19, &location);
    [(NSProgress *)v10->_progress setCancellationHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __45__FPActionOperation_initWithProvider_action___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__FPActionOperation_initWithProvider_action___block_invoke_cold_1();
  }

  [WeakRetained cancel];
}

- (FPActionOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"FPActionOperation.m", 108, @"Operation %@ initialized with empty item set.", objc_opt_class() object file lineNumber description];
  }
  v9 = [(FPActionOperation *)self initWithProvider:0 action:v8];
  v10 = v9;
  if (v9)
  {
    v9->_multiProviders = 1;
    [(FPActionOperation *)v9 setSourceItemsToPreflight:v7];
    uint64_t v11 = (NSDictionary *)objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v18 = [v17 providerDomainID];
          id v19 = [(NSDictionary *)v11 objectForKeyedSubscript:v18];
          if (!v19)
          {
            id v19 = objc_opt_new();
            [(NSDictionary *)v11 setObject:v19 forKeyedSubscript:v18];
          }
          [v19 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    itemsByDomainID = v10->_itemsByDomainID;
    v10->_itemsByDomainID = v11;

    id v7 = v23;
  }

  return v10;
}

- (FPStitchingSession)stitcher
{
  if (self->_haveStitching && !self->_finishAfterPreflight)
  {
    stitcher = self->_stitcher;
    if (!stitcher)
    {
      v5 = (FPStitchingSession *)objc_opt_new();
      v6 = self->_stitcher;
      self->_stitcher = v5;

      [(FPStitchingSession *)self->_stitcher setPlaceholdersCreationBlock:self->_placeholdersCreationBlock];
      stitcher = self->_stitcher;
    }
    v3 = stitcher;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)resetStitcher
{
  [(FPStitchingSession *)self->_stitcher finish];
  stitcher = self->_stitcher;
  self->_stitcher = 0;
}

- (id)replicateForItems:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"FPActionOperation.m" lineNumber:163 description:@"UNREACHABLE: this should be overridden by the concrete operation"];

  return 0;
}

- (void)_dispatchToSubOperations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = objc_opt_new();
  v3 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__26;
  v24[4] = __Block_byref_object_dispose__26;
  id v25 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_itemsByDomainID;
  uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v21;
    *(void *)&long long v5 = 138412546;
    long long v13 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = -[NSDictionary objectForKeyedSubscript:](self->_itemsByDomainID, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v7), v13);
        v9 = [(FPActionOperation *)self replicateForItems:v8];
        [v9 setHaveStitching:0];
        BOOL v10 = self->_havePreflight && !self->_skipPreflight;
        [v9 setHavePreflight:v10];
        [v9 setFinishAfterPreflight:self->_finishAfterPreflight];
        [v9 setHaveErrorRecovery:self->_haveErrorRecovery];
        [v9 setErrorRecoveryHandler:self->_errorRecoveryHandler];
        [v9 setSkipPreflight:self->_skipPreflight];
        dispatch_group_enter(v3);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __45__FPActionOperation__dispatchToSubOperations__block_invoke;
        v17[3] = &unk_1E5AF0850;
        v17[4] = self;
        id v19 = v24;
        v18 = v3;
        [v9 setActionCompletionBlock:v17];
        uint64_t v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          long long v27 = v9;
          __int16 v28 = 2112;
          uint64_t v29 = self;
          _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] created suboperation %@ for %@", buf, 0x16u);
        }

        [v15 addOperation:v9];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSDictionary *)obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v4);
  }

  id v12 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPActionOperation__dispatchToSubOperations__block_invoke_24;
  block[3] = &unk_1E5AF2468;
  block[4] = self;
  block[5] = v24;
  dispatch_group_notify(v3, v12, block);

  _Block_object_dispose(v24, 8);
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  v9 = v10;
  if (v8) {
    v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke_24(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 328);
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "fp_prettyDescription");
    __45__FPActionOperation__dispatchToSubOperations__block_invoke_24_cold_1(v3, (uint64_t)v5, v4);
  }

  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  __fp_leave_section_Debug((uint64_t)&v4);
}

- (id)operationDescription
{
  if (self->_multiProviders) {
    providerIdentifier = @"multiple providers";
  }
  else {
    providerIdentifier = (__CFString *)self->_providerIdentifier;
  }
  return (id)[NSString stringWithFormat:@" %@ ", providerIdentifier];
}

- (void)runUserInteractionsPreflight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FPActionOperation *)self action];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    BOOL v7 = [(FPActionOperation *)self setupRemoteOperationService];

    if (v7)
    {
      id v8 = [(FPActionOperation *)self sourceItemsToPreflight];
      v9 = [v8 firstObject];
      if ([v9 isExcludedFromSync])
      {
      }
      else
      {
        id v10 = [(FPActionOperation *)self destinationItemToPreflight];
        int v11 = [v10 isExcludedFromSync];

        if (!v11)
        {
          id v12 = self->_providerIdentifier;
          long long v13 = [(FPActionOperation *)self remoteServiceProxy];
          uint64_t v14 = [(FPActionOperation *)self action];
          uint64_t v15 = [(FPActionOperation *)self sourceItemsToPreflight];
          v16 = [(FPActionOperation *)self destinationItemToPreflight];
          v17 = [(FPActionOperation *)self sourceItemKeysAllowList];
          v18 = [(FPActionOperation *)self destinationItemKeysAllowList];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __50__FPActionOperation_runUserInteractionsPreflight___block_invoke;
          v19[3] = &unk_1E5AF4080;
          id v20 = v4;
          [v13 userInteractionErrorsForPerformingAction:v14 sourceItems:v15 destinationItem:v16 fpProviderDomainId:v12 sourceItemKeysAllowList:v17 destinationItemKeysAllowList:v18 completionHandler:v19];

          goto LABEL_7;
        }
      }
    }
  }
  (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_7:
}

void __50__FPActionOperation_runUserInteractionsPreflight___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      uint64_t v5 = [v4 objectAtIndex:0];
      v7[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_runUserInteractionsPreflight:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke;
  v7[3] = &unk_1E5AF5478;
  v7[4] = self;
  id v8 = v5;
  SEL v9 = a2;
  id v6 = v5;
  [(FPActionOperation *)self runUserInteractionsPreflight:v7];
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2;
  v10[3] = &unk_1E5AF32B0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  dispatch_async(v4, v10);
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = fp_current_or_default_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_2();
    }

    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "fp_map:", &__block_literal_global_48);
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_36;
    v9[3] = &unk_1E5AF4148;
    uint64_t v8 = *(void *)(a1 + 56);
    v9[4] = v6;
    v9[5] = v8;
    [v6 tryRecoveringFromPreflightErrors:v5 recoveryHandler:v9 completion:v7];
  }
  else
  {
    if (v4) {
      __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_34_cold_1();
  }

  BOOL v4 = objc_msgSend(v2, "fp_asWarning");

  return v4;
}

uint64_t __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_36(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3) {
    goto LABEL_5;
  }
  if (a3 != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"FPActionOperation.m", 268, @"UNREACHABLE: invalid index for error: %@", v5 object file lineNumber description];

LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_skipPreflight)
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPActionOperation preflightWithCompletion:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v5[2](v5, 1, 0);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__FPActionOperation_preflightWithCompletion___block_invoke;
    v14[3] = &unk_1E5AF54A0;
    v14[4] = self;
    id v15 = v4;
    [(FPActionOperation *)self _runUserInteractionsPreflight:v14];
  }
}

uint64_t __45__FPActionOperation_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) subclassPreflightWithCompletion:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_preflightAndRun
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: no preflight, finishing after preflight", v2, v3, v4, v5, v6);
}

void __37__FPActionOperation__preflightAndRun__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FPActionOperation__preflightAndRun__block_invoke_2;
  block[3] = &unk_1E5AF54C8;
  char v12 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __37__FPActionOperation__preflightAndRun__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48)
    || *(void *)(a1 + 32)
    || [*(id *)(a1 + 40) finishAfterPreflight])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 328);
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
      __37__FPActionOperation__preflightAndRun__block_invoke_2_cold_1(v3, (uint64_t)v8, v7);
    }

    id v4 = *(id *)(a1 + 32);
    id v5 = v4;
    if (!*(unsigned char *)(a1 + 48) && !v4)
    {
      id v5 = FPUserCancelledError();
    }
    [*(id *)(a1 + 40) completedWithResult:0 error:v5];

    __fp_leave_section_Debug((uint64_t)&v7);
  }
  else
  {
    uint8_t v6 = *(void **)(a1 + 40);
    [v6 actionMain];
  }
}

- (void)main
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v0, (uint64_t)v0, "[DEBUG] ┳%llx starting action %@", v1);
}

uint64_t __25__FPActionOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preflightAndRun];
}

void __25__FPActionOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint8_t v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [v6 completedWithResult:0 error:a3];
  }
  else
  {
    uint64_t v7 = [v6 callbackQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__FPActionOperation_main__block_invoke_3;
    v8[3] = &unk_1E5AF0748;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t __25__FPActionOperation_main__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setRemoteService:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _preflightAndRun];
}

- (FPXOperationService)remoteService
{
  if (!self->_setupRemoteOperationService)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperation.m" lineNumber:371 description:@"setupRemoteOperationService is not set"];
  }
  remoteService = self->_remoteService;

  return remoteService;
}

- (FPXOperationService)remoteServiceProxy
{
  uint64_t v2 = [(FPActionOperation *)self remoteService];
  uint64_t v3 = [v2 remoteObjectProxy];

  return (FPXOperationService *)v3;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(FPActionOperation *)self resetStitcher];
  [(FPXOperationService *)self->_remoteService invalidate];
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  uint64_t v9 = [(FPActionOperation *)self actionCompletionBlock];
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
    [(FPActionOperation *)self setActionCompletionBlock:0];
  }

  unint64_t logSection = self->_logSection;
  uint64_t v11 = fp_current_or_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v13 = v6;
    if (isKindOfClass)
    {
      uint64_t v13 = FPAbbreviatedArrayDescription(v6);
    }
    uint64_t v14 = objc_msgSend(v7, "fp_prettyDescription");
    *(_DWORD *)buf = 134218754;
    unint64_t v18 = logSection;
    __int16 v19 = 2112;
    id v20 = self;
    __int16 v21 = 2112;
    long long v22 = v13;
    __int16 v23 = 2112;
    long long v24 = v14;
    _os_log_debug_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx action finished %@ with (result=%@, error=%@)", buf, 0x2Au);

    if (isKindOfClass) {
  }
    }

  v15.receiver = self;
  v15.super_class = (Class)FPActionOperation;
  [(FPOperation *)&v15 finishWithResult:v6 error:v7];
  __fp_leave_section_Debug((uint64_t)&logSection);
}

- (void)tryRecoveringFromError:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(FPActionOperation *)self haveErrorRecovery];
  id v10 = [(FPActionOperation *)self errorRecoveryHandler];
  if (v10) {
    BOOL v11 = v9;
  }
  else {
    BOOL v11 = 0;
  }

  char v12 = [v7 localizedRecoveryOptions];
  if (![v12 count]) {
    BOOL v11 = 0;
  }

  uint64_t v13 = [v7 recoveryAttempter];

  if (!v13
    || ([v7 recoveryAttempter], uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                                               v14,
                                               !v14))
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_21:
    long long v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[FPActionOperation tryRecoveringFromError:completion:]();
    }
    goto LABEL_23;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2 object:self file:@"FPActionOperation.m" lineNumber:418 description:@"already has an attempter"];

  if (!v11) {
    goto LABEL_21;
  }
LABEL_9:
  objc_super v15 = [v7 userInfo];
  v16 = [v15 objectForKey:@"FPCanBeSuppressed"];
  uint64_t v17 = [v16 BOOLValue];

  unint64_t v18 = [v7 userInfo];
  __int16 v19 = [v18 objectForKey:@"FPIsSuppressed"];
  uint64_t v20 = [v19 BOOLValue];

  __int16 v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v33 = [NSNumber numberWithBool:v17];
    v34 = [NSNumber numberWithBool:v20];
    *(_DWORD *)buf = 138412802;
    v41 = self;
    __int16 v42 = 2112;
    v43 = v33;
    __int16 v44 = 2112;
    v45 = v34;
    _os_log_debug_impl(&dword_1A33AE000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Checking suppression: suppressionIsEnabledForPredicate = %@, suppressionIsCheckedForPredicate = %@", buf, 0x20u);
  }
  if ((v17 & v20) != 0)
  {
    long long v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[FPActionOperation tryRecoveringFromError:completion:]();
    }
LABEL_23:

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    goto LABEL_24;
  }
  if (((v17 ^ 1 | v20) & 1) == 0)
  {
    __int16 v23 = [v7 userInfo];
    long long v24 = (void *)[v23 mutableCopy];

    uint64_t v25 = [NSNumber numberWithBool:1];
    [v24 setValue:v25 forKey:@"FPErrorShowSuppressionCheckbox"];

    long long v26 = (void *)MEMORY[0x1E4F28C58];
    long long v27 = [v7 domain];
    uint64_t v28 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v7, "code"), v24);

    id v7 = (id)v28;
  }
  uint64_t v29 = [v7 userInfo];
  v30 = [v29 objectForKey:@"DomainIdentifier"];

  if (v30)
  {
    uint64_t v31 = [(FPActionOperation *)self itemManager];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke;
    v36[3] = &unk_1E5AF5518;
    v36[4] = self;
    id v37 = v30;
    id v39 = v8;
    id v38 = v7;
    [v31 fetchOperationServiceForProviderDomainID:v37 handler:v36];
  }
  else
  {
    v32 = [(FPActionOperation *)self remoteServiceProxy];
    [(FPActionOperation *)self invokeErrorRecoveryHandlerWithService:v32 fpProviderDomainId:@"n/a" error:v7 completion:v8];
  }
LABEL_24:
}

void __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v7 = (void *)a1[4];
    id v8 = [a2 remoteObjectProxy];
    [v7 invokeErrorRecoveryHandlerWithService:v8 fpProviderDomainId:a1[5] error:a1[6] completion:a1[7]];
  }
}

- (void)invokeErrorRecoveryHandlerWithService:(id)a3 fpProviderDomainId:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke;
  uint64_t v17 = &unk_1E5AF5568;
  unint64_t v18 = self;
  id v19 = v10;
  id v11 = v10;
  char v12 = objc_msgSend(a5, "fp_recoverableErrorWithBlock:fpProviderDomainId:operationService:", &v14, a4, a3);
  uint64_t v13 = [(FPActionOperation *)self errorRecoveryHandler];
  ((void (**)(void, void *))v13)[2](v13, v12);
}

void __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke_2;
  v5[3] = &unk_1E5AF5540;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, *(void *)(a1 + 40));
}

- (void)tryRecoveringFromPreflightErrors:(id)a3 recoveryHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([v8 count])
  {
    id v11 = objc_msgSend(v8, "fp_filter:", &__block_literal_global_68_0);
    if ([v11 count])
    {
      char v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[FPActionOperation tryRecoveringFromPreflightErrors:recoveryHandler:completion:]((uint64_t)self, (uint64_t)v8, v12);
      }

      uint64_t v13 = [v11 firstObject];
      v10[2](v10, 0, v13);
    }
    else
    {
      uint64_t v13 = [v8 objectAtIndexedSubscript:0];
      uint64_t v15 = objc_msgSend(v13, "fp_genericPreflightError");
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_69;
      v17[3] = &unk_1E5AF55D8;
      v17[4] = self;
      id v20 = v9;
      id v18 = v15;
      __int16 v21 = v10;
      id v19 = v8;
      id v16 = v15;
      [(FPActionOperation *)self tryRecoveringFromError:v16 completion:v17];
    }
  }
  else
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPActionOperation tryRecoveringFromPreflightErrors:recoveryHandler:completion:]();
    }

    v10[2](v10, 1, 0);
  }
}

uint64_t __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_isWarning") ^ 1;
}

void __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_69(id *a1, char a2, uint64_t a3)
{
  id v6 = [a1[4] callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_2;
  block[3] = &unk_1E5AF55B0;
  char v16 = a2;
  id v13 = a1[7];
  id v10 = a1[5];
  uint64_t v15 = a3;
  id v14 = a1[8];
  id v7 = a1[6];
  id v8 = a1[4];
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v6, block);
}

void __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0)
    {
      uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
      v2();
      return;
    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "fp_isWarning") & 1) == 0)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  id v3 = +[FPActionOperation newArrayRemovingFirstElement:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) tryRecoveringFromPreflightErrors:v3 recoveryHandler:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

+ (id)newArrayRemovingFirstElement:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);

  return v4;
}

- (BOOL)finishAfterPreflight
{
  return self->_finishAfterPreflight;
}

- (void)setFinishAfterPreflight:(BOOL)a3
{
  self->_finishAfterPreflight = a3;
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (id)placeholdersCreationBlock
{
  return self->_placeholdersCreationBlock;
}

- (void)setPlaceholdersCreationBlock:(id)a3
{
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (id)errorRecoveryHandler
{
  return self->_errorRecoveryHandler;
}

- (void)setErrorRecoveryHandler:(id)a3
{
}

- (FPItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (void)setRemoteService:(id)a3
{
}

- (BOOL)setupRemoteOperationService
{
  return self->_setupRemoteOperationService;
}

- (void)setSetupRemoteOperationService:(BOOL)a3
{
  self->_setupRemoteOperationService = a3;
}

- (BOOL)haveErrorRecovery
{
  return self->_haveErrorRecovery;
}

- (void)setHaveErrorRecovery:(BOOL)a3
{
  self->_haveErrorRecovery = a3;
}

- (BOOL)havePreflight
{
  return self->_havePreflight;
}

- (void)setHavePreflight:(BOOL)a3
{
  self->_havePreflight = a3;
}

- (BOOL)haveStitching
{
  return self->_haveStitching;
}

- (void)setHaveStitching:(BOOL)a3
{
  self->_haveStitching = a3;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSArray)sourceItemsToPreflight
{
  return self->_sourceItemsToPreflight;
}

- (void)setSourceItemsToPreflight:(id)a3
{
}

- (NSSet)sourceItemKeysAllowList
{
  return self->_sourceItemKeysAllowList;
}

- (void)setSourceItemKeysAllowList:(id)a3
{
}

- (NSSet)destinationItemKeysAllowList
{
  return self->_destinationItemKeysAllowList;
}

- (void)setDestinationItemKeysAllowList:(id)a3
{
}

- (FPItem)destinationItemToPreflight
{
  return self->_destinationItemToPreflight;
}

- (void)setDestinationItemToPreflight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationItemToPreflight, 0);
  objc_storeStrong((id *)&self->_destinationItemKeysAllowList, 0);
  objc_storeStrong((id *)&self->_sourceItemKeysAllowList, 0);
  objc_storeStrong((id *)&self->_sourceItemsToPreflight, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong(&self->_errorRecoveryHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong(&self->_placeholdersCreationBlock, 0);
  objc_storeStrong((id *)&self->_stitcher, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);

  objc_storeStrong((id *)&self->_itemsByDomainID, 0);
}

- (void)initWithProvider:(uint64_t)a1 action:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v2, (uint64_t)v2, "[DEBUG] ┣%llx created operation: %@", (uint8_t *)&v3);
}

void __45__FPActionOperation_initWithProvider_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] cancelling operation via its progress: %@", v2, v3, v4, v5, v6);
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke_24_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_4((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v6, v4, "[DEBUG] ┳%llx all suboperations have finished (error:%@)", v5);
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) action];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] FPActionOperation, No warnings found for action %@", v4, v5, v6, v7, v8);
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_16_0();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*v2 count];
  uint64_t v4 = [*(id *)(v1 + 40) action];
  int v6 = 134218242;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  id v9 = v4;
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v0, v5, "[DEBUG] FPActionOperation, received %lu warnings for action %{public}@", (uint8_t *)&v6);
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] FPActionOperation, received warning: %@", v2, v3, v4, v5, v6);
}

- (void)preflightWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__FPActionOperation__preflightAndRun__block_invoke_2_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_4((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v6, v4, "[DEBUG] ┳%llx finishing action after preflight; %@", v5);
}

- (void)tryRecoveringFromError:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: suppression box check, not running pre-flight check.", v2, v3, v4, v5, v6);
}

- (void)tryRecoveringFromError:completion:.cold.2()
{
  OUTLINED_FUNCTION_16_0();
  uint64_t v3 = v2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [v2 haveErrorRecovery];
  uint64_t v5 = [v3 errorRecoveryHandler];
  uint8_t v6 = [v1 localizedRecoveryOptions];
  int v7 = 138413058;
  __int16 v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 1024;
  BOOL v12 = v5 != 0;
  __int16 v13 = 2112;
  id v14 = v6;
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: No handler, no recovery. haveErrorRecovery=%{BOOL}d, errorRecoveryHandler=%{BOOL}d, error.localizedRecoveryOptions=%@", (uint8_t *)&v7, 0x22u);
}

void __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] %@: Error retrieving operation service for provider domain: %@, error: %@", (uint8_t *)&v5, 0x20u);
}

- (void)tryRecoveringFromPreflightErrors:recoveryHandler:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] %@: no errors, early return from tryRecoveringFromPreflightErrors", v2, v3, v4, v5, v6);
}

- (void)tryRecoveringFromPreflightErrors:(uint64_t)a1 recoveryHandler:(uint64_t)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, (uint64_t)a3, "[DEBUG] %@: no hard errors, early return from tryRecoveringFromPreflightErrors. errs=%@", (uint8_t *)&v3);
}

@end