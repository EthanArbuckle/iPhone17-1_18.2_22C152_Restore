@interface ATRestoreManager
+ (id)sharedManager;
- (ATRestoreManager)init;
- (BOOL)_iCloudPhotoLibraryEnabled;
- (BOOL)hasProperNetworkConditions;
- (id)_dataClasses;
- (void)_checkActiveRestoreStateWithCompletion:(id)a3;
- (void)_start;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)restoreAssetLinkDidCancelRestore:(id)a3;
- (void)restoreAssetLinkNetworkPolicyDidChange:(id)a3;
- (void)restoreSessionActiveWithCompletion:(id)a3;
- (void)resume;
- (void)sessionDidFinish:(id)a3;
- (void)setRestoreInProgress:(BOOL)a3;
@end

@implementation ATRestoreManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreSession, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_checkRestoreStatusQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationDataRestoreLink, 0);

  objc_storeStrong((id *)&self->_restoreLink, 0);
}

- (void)_checkActiveRestoreStateWithCompletion:(id)a3
{
  id v4 = a3;
  checkRestoreStatusQueue = self->_checkRestoreStatusQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke;
  v7[3] = &unk_1E6B88088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(checkRestoreStatusQueue, v7);
}

uint64_t __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = [*(id *)(*(void *)(a1 + 32) + 64) activeRestoreType] == 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 51) = [*(id *)(*(void *)(a1 + 32) + 64) activeRestoreType] == 3;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 49) && !*(unsigned char *)(v2 + 51))
  {
    unint64_t v3 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    *(void *)v38 = 0;
    *(void *)&v38[8] = v38;
    *(void *)&v38[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__2336;
    v40 = __Block_byref_object_dispose__2337;
    id v41 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    do
    {
      v5 = _ATLogCategoryRestore();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(v6 + 8);
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v6;
        __int16 v34 = 2048;
        unint64_t v35 = v3;
        __int16 v36 = 2114;
        uint64_t v37 = v7;
        _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ start checking if iCloudRestore is active in %llu (seconds), restoreLink %{public}@", buf, 0x20u);
      }

      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      dispatch_time_t v9 = dispatch_time(0, 1000000000 * v3);
      v10 = dispatch_get_global_queue(0, 0);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_63;
      block[3] = &unk_1E6B88060;
      block[4] = *(void *)(a1 + 32);
      v26 = v38;
      v27 = &v28;
      v11 = v8;
      v25 = v11;
      dispatch_after(v9, v10, block);

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v12 = *(void *)(*(void *)&v38[8] + 40);
      if (v12)
      {
        *((unsigned char *)v29 + 24) = 0;
        if (v3 > 0x3B) {
          unint64_t v3 = 60;
        }
        else {
          unint64_t v3 = 2 * v3 + 2;
        }
      }
      BOOL v13 = v12 == 0;
    }
    while (!v13);
    *(unsigned char *)(*(void *)(a1 + 32) + 50) = *((unsigned char *)v29 + 24);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(&v28, 8);
  }
  v14 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(unsigned __int8 **)(a1 + 32);
    int v16 = v15[50];
    int v17 = v15[49];
    int v18 = v15[51];
    *(_DWORD *)v38 = 138544130;
    *(void *)&v38[4] = v15;
    *(_WORD *)&v38[12] = 1024;
    *(_DWORD *)&v38[14] = v16;
    *(_WORD *)&v38[18] = 1024;
    *(_DWORD *)&v38[20] = v17;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v18;
    _os_log_impl(&dword_1D9A2D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ iCloudRestoreActive %d iTunesRestoreActive %d deviceRestoreActive %d.", v38, 0x1Eu);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v19 + 50)
    && !*(unsigned char *)(v19 + 49)
    && !*(unsigned char *)(v19 + 51)
    && [*(id *)(v19 + 64) activeRestoreType])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F4A240], 0, 0, 1u);
    [*(id *)(*(void *)(a1 + 32) + 64) setActiveRestoreType:0];
    v21 = _ATLogCategoryRestore();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)v38 = 138543618;
      *(void *)&v38[4] = v22;
      *(_WORD *)&v38[12] = 1024;
      *(_DWORD *)&v38[14] = 0;
      _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ No active restore - setting activeRestoreType to %d.", v38, 0x12u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_63(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6B88038;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 restoreSessionActiveWithCompletion:v4];
}

void __59__ATRestoreManager__checkActiveRestoreStateWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_iCloudPhotoLibraryEnabled
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  long long v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__ATRestoreManager__iCloudPhotoLibraryEnabled__block_invoke;
  v6[3] = &unk_1E6B88010;
  dispatch_semaphore_t v8 = &v9;
  uint64_t v4 = v2;
  uint64_t v7 = v4;
  objc_msgSend(v3, "ic_primaryAppleAccountWithCompletion:", v6);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

intptr_t __46__ATRestoreManager__iCloudPhotoLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isEnabledForDataclass:*MEMORY[0x1E4F17A88]];
  }
  long long v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (void)setRestoreInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying restore progress: %d", (uint8_t *)&v9, 0x12u);
  }

  id v6 = [MEMORY[0x1E4F5B6A8] userContext];
  uint64_t v7 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/restore/inProgress"];
  dispatch_semaphore_t v8 = [NSNumber numberWithBool:v3];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)_start
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (([(MSVXPCTransaction *)self->_xpcTransaction isActive] & 1) == 0) {
    [(MSVXPCTransaction *)self->_xpcTransaction beginTransaction];
  }
  int v3 = [(ATDeviceSettings *)self->_settings activeRestoreType];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = self;
  long long v5 = [(ATRestoreManager *)self _dataClasses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    unsigned int v9 = v3 & 0xFFFFFFFE;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v9 == 2
          && [*(id *)(*((void *)&v20 + 1) + 8 * i) isEqualToString:@"Photo"]
          && [(ATRestoreManager *)v19 _iCloudPhotoLibraryEnabled])
        {
          _ATLogCategoryRestore();
          BOOL v12 = (ATAssetSessionTask *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v19;
            _os_log_impl(&dword_1D9A2D000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping photos restore from iTunes because iCPL is enabled", buf, 0xCu);
          }
        }
        else
        {
          BOOL v12 = [[ATAssetSessionTask alloc] initWithDataClass:v11];
          uint64_t v13 = [NSString stringWithFormat:@"%@ restore", v11];
          [(ATSessionTask *)v12 setLocalizedDescription:v13];

          v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(isRestore = YES) AND NOT (dataclass = %@)", @"Media"];
          [(ATAssetSessionTask *)v12 setFilterPredicate:v14];

          [(ATAssetSessionTask *)v12 setRetryUntilFinished:1];
          [(ATAssetSessionTask *)v12 setShouldRetryAssetBlock:&__block_literal_global_52];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }

  [(ATRestoreManager *)v19 setRestoreInProgress:1];
  id v15 = objc_alloc(MEMORY[0x1E4F4A2E0]);
  uint64_t v16 = [v15 initWithSessionTypeIdentifier:*MEMORY[0x1E4F4A288]];
  restoreSession = v19->_restoreSession;
  v19->_restoreSession = (ATSession *)v16;

  [(ATSession *)v19->_restoreSession addSessionTasks:v4];
  [(ATSession *)v19->_restoreSession addObserver:v19];
  int v18 = [MEMORY[0x1E4F478D8] sharedSessionServer];
  [v18 addSession:v19->_restoreSession];

  [(ATSession *)v19->_restoreSession start];
}

BOOL __26__ATRestoreManager__start__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 error];
  if ([v3 code] == 16)
  {
    BOOL v4 = 1;
  }
  else
  {
    long long v5 = [v2 error];
    BOOL v4 = [v5 code] == 3;
  }
  return v4;
}

- (id)_dataClasses
{
  if (_dataClasses_onceToken != -1) {
    dispatch_once(&_dataClasses_onceToken, &__block_literal_global_37);
  }
  id v2 = (void *)[(id)_dataClasses_dataClassesArray copy];

  return v2;
}

void __32__ATRestoreManager__dataClasses__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Application", @"Book", @"Media", 0);
  uint64_t v1 = [v0 mutableCopy];
  id v2 = (void *)_dataClasses_dataClassesArray;
  _dataClasses_dataClassesArray = v1;

  int v3 = (void *)_dataClasses_dataClassesArray;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Photo", @"MessagePart", @"Book", @"VoiceMemo", @"File", 0);
  [v3 removeObjectsInArray:v4];

  long long v5 = (void *)_dataClasses_dataClassesArray;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Photo", @"MessagePart", @"Book", @"VoiceMemo", @"File", 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObjectsFromArray:v6];
}

- (void)restoreAssetLinkNetworkPolicyDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB8618], "sharedMonitor", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ATRestoreManager *)self environmentMonitorDidChangeNetworkReachability:v4];
}

- (void)restoreAssetLinkDidCancelRestore:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATRestoreManager_restoreAssetLinkDidCancelRestore___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__ATRestoreManager_restoreAssetLinkDidCancelRestore___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "sessionTasks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 cancelAllAssets];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)sessionDidFinish:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATRestoreManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __37__ATRestoreManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  id v4 = _ATLogCategoryRestore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v5;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finishing restore", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) finishRestore];
  [*(id *)(a1 + 40) setRestoreInProgress:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F4A240], 0, 0, 1u);
  long long v7 = +[ATDeviceSettings sharedInstance];
  [v7 setActiveRestoreType:0];

  [*(id *)(*(void *)(a1 + 40) + 56) endTransaction];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = +[ATClientController sharedInstance];
  long long v9 = [v8 allClients];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __37__ATRestoreManager_sessionDidFinish___block_invoke_34;
          v15[3] = &unk_1E6B88B40;
          v15[4] = v14;
          dispatch_client_async(v14, v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

uint64_t __37__ATRestoreManager_sessionDidFinish___block_invoke_34(uint64_t a1)
{
  return [*(id *)(a1 + 32) restoreEndedWithError:0];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ATRestoreManager_environmentMonitorDidChangeNetworkReachability___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

void __67__ATRestoreManager_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) hasProperNetworkConditions];
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    [v3 resume];
  }
  else
  {
    id v4 = [v3[9] sessionTasks];
    uint64_t v5 = _ATLogCategoryRestore();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = [v4 count];
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending %lu restore tasks because wifi is not available", buf, 0x16u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "suspend", (void)v12);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)hasProperNetworkConditions
{
  return [(ATRestoreAssetLink *)self->_restoreLink hasProperNetworkConditions];
}

- (void)resume
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__ATRestoreManager_resume__block_invoke;
  v2[3] = &unk_1E6B87FC8;
  v2[4] = self;
  [(ATRestoreManager *)self restoreSessionActiveWithCompletion:v2];
}

void __26__ATRestoreManager_resume__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__ATRestoreManager_resume__block_invoke_2;
  v4[3] = &unk_1E6B87FA0;
  char v5 = a2;
  void v4[4] = v2;
  dispatch_async(v3, v4);
}

void __26__ATRestoreManager_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = _ATLogCategoryRestore();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v5;
      __int16 v31 = 2114;
      uint64_t v32 = v6;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming restore _restoreSession %{public}@.", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 72);
    if (v8)
    {
      uint64_t v9 = [v8 sessionTasks];
      uint64_t v10 = _ATLogCategoryRestore();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = [v9 count];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v11;
        __int16 v31 = 2048;
        uint64_t v32 = v12;
        _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming %lu restore tasks", buf, 0x16u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "resume", (void)v23);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v15);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__ATRestoreManager_resume__block_invoke_8;
      block[3] = &unk_1E6B88B40;
      block[4] = v7;
      if (_block_invoke_onceToken != -1) {
        dispatch_once(&_block_invoke_onceToken, block);
      }
      __int16 v19 = +[ATDeviceSettings sharedInstance];
      int v20 = [v19 hasCompletedDataMigration];

      uint64_t v21 = _ATLogCategoryRestore();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v22;
        __int16 v31 = 1024;
        LODWORD(v32) = v20;
        _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ hasCompletedDataMigration = %d", buf, 0x12u);
      }

      if (v20) {
        [*(id *)(a1 + 32) _start];
      }
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ No active restore session.", buf, 0xCu);
    }
  }
}

void __26__ATRestoreManager_resume__block_invoke_8(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 50))
  {
    int v2 = [MEMORY[0x1E4F47890] sharedInstance];
    [v2 addAssetLink:*(void *)(*(void *)(a1 + 32) + 8)];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setRestoreDelegate:");
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Photo", @"MessagePart", @"Book", @"VoiceMemo", @"File", 0);
    [*(id *)(*(void *)(a1 + 32) + 8) setAllowedDataClasses:v3];

    [*(id *)(*(void *)(a1 + 32) + 8) open];
    BOOL v4 = [MEMORY[0x1E4F47890] sharedInstance];
    [v4 addAssetLink:*(void *)(*(void *)(a1 + 32) + 16)];

    [*(id *)(*(void *)(a1 + 32) + 16) setAllowedDataClasses:&unk_1F33DCD10];
    [*(id *)(*(void *)(a1 + 32) + 16) open];
  }
  uint64_t v5 = [MEMORY[0x1E4FB8618] sharedMonitor];
  [v5 registerObserver:*(void *)(a1 + 32)];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v7 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_CFNotificationCallback, @"ATHasCompletedMigrationNotificationName", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)restoreSessionActiveWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke;
  v6[3] = &unk_1E6B88088;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ATRestoreManager *)self _checkActiveRestoreStateWithCompletion:v6];
}

void __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke_2;
    v5[3] = &unk_1E6B88088;
    id v4 = v1;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    dispatch_async(v3, v5);
  }
}

uint64_t __55__ATRestoreManager_restoreSessionActiveWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  BOOL v4 = v3[49] || v3[50] || v3[51] != 0;
  return (*(uint64_t (**)(uint64_t, BOOL))(v2 + 16))(v2, v4);
}

- (ATRestoreManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ATRestoreManager;
  uint64_t v2 = [(ATRestoreManager *)&v18 init];
  if (v2)
  {
    uint64_t v3 = +[ATDeviceSettings sharedInstance];
    BOOL v4 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v3;

    id v5 = objc_alloc_init(ATRestoreAssetLink);
    id v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    id v7 = objc_alloc_init(ATRestoreAssetLink);
    uint64_t v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    *(_WORD *)(v2 + 49) = 0;
    v2[51] = 0;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.queue", 0);
    uint64_t v10 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.callBackQueue", MEMORY[0x1E4F14430]);
    uint64_t v12 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.amp.AirTraffic.ATRestoreManager.checkRestoreStatusQueue", 0);
    uint64_t v14 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F77A50]) initWithName:@"com.apple.atc.restore"];
    uint64_t v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;
  }
  return (ATRestoreManager *)v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2412);
  }
  uint64_t v2 = (void *)sharedManager_restoreManager;

  return v2;
}

uint64_t __33__ATRestoreManager_sharedManager__block_invoke()
{
  sharedManager_restoreManager = objc_alloc_init(ATRestoreManager);

  return MEMORY[0x1F41817F8]();
}

@end