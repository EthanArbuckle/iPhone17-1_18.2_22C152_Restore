@interface DKCloudProvider
- (BOOL)isRestoring;
- (BOOL)notifiedCompletion;
- (BYBuddyDaemonCloudSyncClient)cloudSyncClient;
- (DKBackupProvider)currentBackupProvider;
- (DKCloudProvider)init;
- (NSArray)backupProviders;
- (NSArray)syncErrors;
- (NSMutableArray)backupResults;
- (NSProgress)backupProgress;
- (NSProgress)syncProgress;
- (NWPathEvaluator)pathEvaluator;
- (OS_dispatch_queue)progressQueue;
- (double)timeRemaining;
- (id)completion;
- (id)progressHandler;
- (unint64_t)isUploadSupportedForCurrentNetwork;
- (void)_communicateProgress;
- (void)_startBackupForProvider:(id)a3 remainingProviders:(id)a4 allowExpensiveCellular:(BOOL)a5;
- (void)_startBackupWithProviders:(id)a3 allowExpensiveCellular:(BOOL)a4;
- (void)beginUploadAllowingExpensiveCellular:(BOOL)a3 progressHandler:(id)a4 completion:(id)a5;
- (void)cancelUpload;
- (void)hasDataToUpload:(id)a3;
- (void)setBackupProgress:(id)a3;
- (void)setBackupProviders:(id)a3;
- (void)setBackupResults:(id)a3;
- (void)setCloudSyncClient:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCurrentBackupProvider:(id)a3;
- (void)setNotifiedCompletion:(BOOL)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
- (void)setSyncErrors:(id)a3;
- (void)setSyncProgress:(id)a3;
- (void)setTimeRemaining:(double)a3;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
@end

@implementation DKCloudProvider

- (DKCloudProvider)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)DKCloudProvider;
  v2 = [(DKCloudProvider *)&v24 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.diskembarkui.progress", 0);
    progressQueue = v2->_progressQueue;
    v2->_progressQueue = (OS_dispatch_queue *)v3;

    v5 = (BYBuddyDaemonCloudSyncClient *)objc_alloc_init(MEMORY[0x263F67FE0]);
    cloudSyncClient = v2->_cloudSyncClient;
    v2->_cloudSyncClient = v5;

    [(BYBuddyDaemonCloudSyncClient *)v2->_cloudSyncClient setDelegate:v2];
    v7 = (NWPathEvaluator *)objc_alloc_init(MEMORY[0x263F14420]);
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = objc_msgSend(MEMORY[0x263EFB210], "defaultStore", 0);
    v11 = objc_msgSend(v10, "aa_appleAccounts");

    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[DKBackupProvider alloc] initWithAccount:*(void *)(*((void *)&v20 + 1) + 8 * v15)];
          [v9 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v9 copy];
    backupProviders = v2->_backupProviders;
    v2->_backupProviders = (NSArray *)v17;
  }
  return v2;
}

- (unint64_t)isUploadSupportedForCurrentNetwork
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = [(DKCloudProvider *)self pathEvaluator];
  v4 = [v3 path];

  v5 = [v4 interface];
  uint64_t v6 = [v5 type];

  unint64_t v7 = 0;
  if (v6 && v6 != 4)
  {
    if (v6 == 2)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v8 = [(DKCloudProvider *)self backupProviders];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            if (![*(id *)(*((void *)&v15 + 1) + 8 * i) isManualBackupOnCellularAllowed])
            {

              unint64_t v7 = 0;
              goto LABEL_20;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      if ([v4 isExpensive]) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
    if (([v4 status] | 2) == 3) {
      unint64_t v7 = v13;
    }
    else {
      unint64_t v7 = 0;
    }
  }
LABEL_20:

  return v7;
}

- (void)hasDataToUpload:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v7 = [(DKCloudProvider *)self backupProviders];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * v11) isBackupEnabled])
          {
            v4[2](v4, 1);

            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = [(DKCloudProvider *)self cloudSyncClient];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__DKCloudProvider_hasDataToUpload___block_invoke;
    v13[3] = &unk_264CF0F30;
    uint64_t v14 = v4;
    [v12 needsToSync:v13];
  }
  else
  {
    v4[2](v4, 0);
  }
LABEL_13:
}

void __35__DKCloudProvider_hasDataToUpload___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__DKCloudProvider_hasDataToUpload___block_invoke_2;
  v3[3] = &unk_264CF0F08;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __35__DKCloudProvider_hasDataToUpload___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) != 0);
}

- (BOOL)isRestoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(DKCloudProvider *)self backupProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isRestoring])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)beginUploadAllowingExpensiveCellular:(BOOL)a3 progressHandler:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke;
  block[3] = &unk_264CF0F58;
  block[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v12 = [(DKCloudProvider *)self progressQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke_2;
  v19[3] = &unk_264CF0A98;
  v19[4] = self;
  dispatch_async(v12, v19);

  uint64_t v13 = _DKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_237B3F000, v13, OS_LOG_TYPE_DEFAULT, "Beginning cloud upload...", v18, 2u);
  }

  uint64_t v14 = _DKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_237B3F000, v14, OS_LOG_TYPE_DEFAULT, "Starting backup(s)...", v18, 2u);
  }

  long long v15 = [(DKCloudProvider *)self backupProviders];
  [(DKCloudProvider *)self _startBackupWithProviders:v15 allowExpensiveCellular:v6];

  long long v16 = _DKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_237B3F000, v16, OS_LOG_TYPE_DEFAULT, "Starting sync...", v18, 2u);
  }

  long long v17 = [(DKCloudProvider *)self cloudSyncClient];
  [v17 startSync];
}

uint64_t __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressHandler:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setCompletion:v2];
}

uint64_t __83__DKCloudProvider_beginUploadAllowingExpensiveCellular_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimeRemaining:0.0];
  uint64_t v2 = (void *)MEMORY[0x263F08AB8];
  uint64_t v3 = [*(id *)(a1 + 32) backupProviders];
  uint64_t v4 = objc_msgSend(v2, "progressWithTotalUnitCount:", objc_msgSend(v3, "count"));
  [*(id *)(a1 + 32) setBackupProgress:v4];

  uint64_t v5 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
  [*(id *)(a1 + 32) setSyncProgress:v5];

  BOOL v6 = [MEMORY[0x263EFF980] array];
  [*(id *)(a1 + 32) setBackupResults:v6];

  [*(id *)(a1 + 32) setSyncErrors:0];
  long long v7 = *(void **)(a1 + 32);
  return [v7 setNotifiedCompletion:0];
}

- (void)cancelUpload
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DKCloudProvider *)self progressQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DKCloudProvider_cancelUpload__block_invoke;
  block[3] = &unk_264CF0A98;
  block[4] = self;
  dispatch_async(v3, block);

  uint64_t v4 = _DKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling backup(s)...", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(DKCloudProvider *)self backupProviders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) cancel];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  id v10 = _DKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling sync...", buf, 2u);
  }

  id v11 = [(DKCloudProvider *)self cloudSyncClient];
  [v11 cancelSync];
}

uint64_t __31__DKCloudProvider_cancelUpload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNotifiedCompletion:1];
}

- (void)_startBackupWithProviders:(id)a3 allowExpensiveCellular:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v6 mutableCopy];
    uint64_t v8 = [v7 firstObject];
    [v7 removeObjectAtIndex:0];
    [(DKCloudProvider *)self _startBackupForProvider:v8 remainingProviders:v7 allowExpensiveCellular:v4];
  }
  else
  {
    uint64_t v9 = _DKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_237B3F000, v9, OS_LOG_TYPE_DEFAULT, "All backups complete!", v10, 2u);
    }

    [(DKCloudProvider *)self _communicateProgress];
  }
}

- (void)_startBackupForProvider:(id)a3 remainingProviders:(id)a4 allowExpensiveCellular:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
  id v11 = [(DKCloudProvider *)self progressQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke;
  block[3] = &unk_264CF09F8;
  block[4] = self;
  id v12 = v8;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  dispatch_async(v11, block);

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_2;
  v22[3] = &unk_264CF0FA8;
  v22[4] = self;
  id v23 = v13;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_4;
  v17[3] = &unk_264CF0FF8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v23;
  id v20 = v9;
  BOOL v21 = v5;
  id v14 = v9;
  id v15 = v23;
  id v16 = v12;
  [v16 startBackupWithExpensiveCellularAllowed:v5 progressHandler:v22 completionHandler:v17];
}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentBackupProvider:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) backupProgress];
  [v2 addChild:*(void *)(a1 + 48) withPendingUnitCount:1];
}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_2(uint64_t a1, uint64_t a2, float a3)
{
  id v6 = [*(id *)(a1 + 32) progressQueue];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_3;
  id v12 = &unk_264CF0F80;
  id v7 = *(id *)(a1 + 40);
  float v16 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  uint64_t v14 = v8;
  uint64_t v15 = a2;
  dispatch_async(v6, &v9);

  objc_msgSend(*(id *)(a1 + 32), "_communicateProgress", v9, v10, v11, v12);
}

uint64_t __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompletedUnitCount:(uint64_t)(float)(*(float *)(a1 + 56) * 100.0)];
  double v2 = (double)*(unint64_t *)(a1 + 48) * 60.0;
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 setTimeRemaining:v2];
}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) progressQueue];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_5;
  uint64_t v10 = &unk_264CF0FD0;
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v3;
  id v14 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, &v7);

  objc_msgSend(*(id *)(a1 + 32), "_communicateProgress", v7, v8, v9, v10, v11);
  [*(id *)(a1 + 32) _startBackupWithProviders:*(void *)(a1 + 56) allowExpensiveCellular:*(unsigned __int8 *)(a1 + 64)];
}

void __85__DKCloudProvider__startBackupForProvider_remainingProviders_allowExpensiveCellular___block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentBackupProvider];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    if (*(void *)(a1 + 48))
    {
      BOOL v4 = [*(id *)(a1 + 32) currentBackupProvider];
      BOOL v5 = [v4 account];

      id v6 = [*(id *)(a1 + 32) backupResults];
      uint64_t v7 = +[DKCloudUploadResult resultWithAccount:success:error:](DKCloudUploadResult, "resultWithAccount:success:error:", v5, *(void *)(a1 + 48) == 0);
      [v6 addObject:v7];
    }
    [*(id *)(a1 + 32) setCurrentBackupProvider:0];
    uint64_t v8 = [*(id *)(a1 + 56) totalUnitCount];
    uint64_t v9 = *(void **)(a1 + 56);
    [v9 setCompletedUnitCount:v8];
  }
}

- (void)_communicateProgress
{
  id v3 = [(DKCloudProvider *)self progressQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__DKCloudProvider__communicateProgress__block_invoke;
  block[3] = &unk_264CF0A98;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__DKCloudProvider__communicateProgress__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) notifiedCompletion]) {
    goto LABEL_8;
  }
  double v2 = [*v1 backupProgress];
  if (([v2 isFinished] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v3 = [*v1 syncProgress];
  int v4 = [v3 isFinished];

  if (!v4)
  {
LABEL_8:
    uint64_t v9 = [*v1 backupProgress];
    [v9 fractionCompleted];
    double v11 = v10;
    id v12 = [*v1 syncProgress];
    [v12 fractionCompleted];
    *(float *)&double v11 = v13 * 0.25 + v11 * 0.75;

    [*v1 timeRemaining];
    id v14 = v20;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__DKCloudProvider__communicateProgress__block_invoke_2;
    v20[3] = &unk_264CF1020;
    v20[4] = *v1;
    int v21 = LODWORD(v11);
    v20[5] = v15;
    goto LABEL_9;
  }
  [*v1 setNotifiedCompletion:1];
  BOOL v5 = [*v1 syncErrors];
  uint64_t v6 = [v5 count];

  uint64_t v7 = _DKLogSystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__DKCloudProvider__communicateProgress__block_invoke_cold_2(v1);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v8, OS_LOG_TYPE_DEFAULT, "Sync completed successfully!", buf, 2u);
  }

  float v16 = [*v1 backupResults];
  uint64_t v17 = [v16 count];

  id v18 = _DKLogSystem();
  id v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __39__DKCloudProvider__communicateProgress__block_invoke_cold_1(v1);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v19, OS_LOG_TYPE_DEFAULT, "Backup(s) completed successfully!", buf, 2u);
  }

  id v14 = v22;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __39__DKCloudProvider__communicateProgress__block_invoke_11;
  v22[3] = &unk_264CF0A98;
  v22[4] = *v1;
LABEL_9:
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __39__DKCloudProvider__communicateProgress__block_invoke_11(uint64_t a1)
{
  uint64_t v8 = objc_alloc_init(DKCloudUploadResults);
  double v2 = [*(id *)(a1 + 32) backupResults];
  id v3 = (void *)[v2 copy];
  [(DKCloudUploadResults *)v8 setBackupResults:v3];

  int v4 = [*(id *)(a1 + 32) syncErrors];
  BOOL v5 = +[DKCloudUploadResult resultWithSuccess:error:](DKCloudUploadResult, "resultWithSuccess:error:", [v4 count] == 0, 0);
  [(DKCloudUploadResults *)v8 setSyncResult:v5];

  uint64_t v6 = [*(id *)(a1 + 32) completion];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) completion];
    ((void (**)(void, DKCloudUploadResults *))v7)[2](v7, v8);
  }
}

void __39__DKCloudProvider__communicateProgress__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) progressHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) progressHandler];
    v3[2](*(float *)(a1 + 48), *(double *)(a1 + 40));
  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DKCloudProvider *)self progressQueue];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __43__DKCloudProvider_syncCompletedWithErrors___block_invoke;
  double v10 = &unk_264CF1048;
  double v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v7);

  [(DKCloudProvider *)self _communicateProgress];
}

void __43__DKCloudProvider_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSyncErrors:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) syncProgress];
  uint64_t v2 = [v4 totalUnitCount];
  id v3 = [*(id *)(a1 + 32) syncProgress];
  [v3 setCompletedUnitCount:v2];
}

- (void)syncProgress:(double)a3
{
  BOOL v5 = [(DKCloudProvider *)self progressQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__DKCloudProvider_syncProgress___block_invoke;
  v6[3] = &unk_264CF1070;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);

  [(DKCloudProvider *)self _communicateProgress];
}

void __32__DKCloudProvider_syncProgress___block_invoke(uint64_t a1)
{
  uint64_t v1 = (uint64_t)(*(double *)(a1 + 40) * 100.0);
  id v2 = [*(id *)(a1 + 32) syncProgress];
  [v2 setCompletedUnitCount:v1];
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)backupProviders
{
  return self->_backupProviders;
}

- (void)setBackupProviders:(id)a3
{
}

- (DKBackupProvider)currentBackupProvider
{
  return self->_currentBackupProvider;
}

- (void)setCurrentBackupProvider:(id)a3
{
}

- (BYBuddyDaemonCloudSyncClient)cloudSyncClient
{
  return self->_cloudSyncClient;
}

- (void)setCloudSyncClient:(id)a3
{
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSProgress)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(id)a3
{
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(id)a3
{
}

- (NSMutableArray)backupResults
{
  return self->_backupResults;
}

- (void)setBackupResults:(id)a3
{
}

- (NSArray)syncErrors
{
  return self->_syncErrors;
}

- (void)setSyncErrors:(id)a3
{
}

- (BOOL)notifiedCompletion
{
  return self->_notifiedCompletion;
}

- (void)setNotifiedCompletion:(BOOL)a3
{
  self->_notifiedCompletion = a3;
}

- (OS_dispatch_queue)progressQueue
{
  return self->_progressQueue;
}

- (void)setProgressQueue:(id)a3
{
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_syncErrors, 0);
  objc_storeStrong((id *)&self->_backupResults, 0);
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong((id *)&self->_backupProgress, 0);
  objc_storeStrong((id *)&self->_cloudSyncClient, 0);
  objc_storeStrong((id *)&self->_currentBackupProvider, 0);
  objc_storeStrong((id *)&self->_backupProviders, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

void __39__DKCloudProvider__communicateProgress__block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 backupResults];
  OUTLINED_FUNCTION_0_0(&dword_237B3F000, v2, v3, "Backup(s) completed with errors: %{public}@", v4, v5, v6, v7, 2u);
}

void __39__DKCloudProvider__communicateProgress__block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 syncErrors];
  OUTLINED_FUNCTION_0_0(&dword_237B3F000, v2, v3, "Sync completed with errors: %{public}@", v4, v5, v6, v7, 2u);
}

@end