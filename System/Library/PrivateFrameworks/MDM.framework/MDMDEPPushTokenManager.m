@interface MDMDEPPushTokenManager
- (BOOL)_queue_appTokenNeedsToBeSynced;
- (DMCNetworkMonitor)networkMonitor;
- (MDMDEPPushTokenManager)initWithPushServiceManager:(id)a3;
- (MDMPushServiceManager)pushServiceManager;
- (NSData)appToken;
- (OS_dispatch_queue)workerQueue;
- (double)syncInterval;
- (id)_noPushTokenError;
- (id)_queue_lastestPushTokenToSync;
- (id)depPushToken;
- (void)_queue_setLastestPushTokenToSync:(id)a3;
- (void)_retryPushTokenSync;
- (void)_syncPushTokenShouldForce:(BOOL)a3 shouldScheduleRetry:(BOOL)a4 completionHandler:(id)a5;
- (void)pushServiceManager:(id)a3 didReceiveAppToken:(id)a4 forTopic:(id)a5 environment:(unint64_t)a6;
- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6;
- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5;
- (void)setAppToken:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setPushServiceManager:(id)a3;
- (void)setSyncInterval:(double)a3;
- (void)setWorkerQueue:(id)a3;
- (void)startMonitoringDEPPushTokenChange;
- (void)syncDEPPushTokenWithCompletion:(id)a3;
@end

@implementation MDMDEPPushTokenManager

- (MDMDEPPushTokenManager)initWithPushServiceManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMDEPPushTokenManager;
  v6 = [(MDMDEPPushTokenManager *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("MDMDEPPushTokenManager_worker_queue", 0);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_pushServiceManager, a3);
    uint64_t v9 = objc_opt_new();
    networkMonitor = v6->_networkMonitor;
    v6->_networkMonitor = (DMCNetworkMonitor *)v9;

    v6->_syncInterval = 300.0;
  }

  return v6;
}

- (void)startMonitoringDEPPushTokenChange
{
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Start monitoring for app push token changes...", v6, 2u);
  }
  v4 = [(MDMDEPPushTokenManager *)self pushServiceManager];
  [v4 startListeningForDEPPushMessage];

  id v5 = [(MDMDEPPushTokenManager *)self pushServiceManager];
  [v5 requestAppTokenForTopic:0x26E54C710 environment:0];
}

- (id)depPushToken
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(MDMDEPPushTokenManager *)self workerQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__MDMDEPPushTokenManager_depPushToken__block_invoke;
  v6[3] = &unk_264B9D318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __38__MDMDEPPushTokenManager_depPushToken__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) appToken];
  return MEMORY[0x270F9A758]();
}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__MDMDEPPushTokenManager_syncDEPPushTokenWithCompletion___block_invoke;
  v6[3] = &unk_264B9D340;
  id v7 = v4;
  id v5 = v4;
  [(MDMDEPPushTokenManager *)self _syncPushTokenShouldForce:1 shouldScheduleRetry:0 completionHandler:v6];
}

uint64_t __57__MDMDEPPushTokenManager_syncDEPPushTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_queue_appTokenNeedsToBeSynced
{
  v3 = [MEMORY[0x263F52808] sharedConfiguration];
  [v3 refreshDetailsFromDisk];

  id v4 = [MEMORY[0x263F52808] sharedConfiguration];
  id v5 = [v4 lastDEPPushTokenHash];

  v6 = [(MDMDEPPushTokenManager *)self appToken];
  id v7 = [v6 DMCSHA256Hash];
  char v8 = [v7 isEqualToData:v5] ^ 1;

  return v8;
}

- (void)_syncPushTokenShouldForce:(BOOL)a3 shouldScheduleRetry:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(MDMDEPPushTokenManager *)self workerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke;
  block[3] = &unk_264B9D3B8;
  block[4] = self;
  id v12 = v8;
  BOOL v13 = a3;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) networkMonitor];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2;
  v4[3] = &unk_264B9D3B8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  __int16 v6 = *(_WORD *)(a1 + 48);
  [v2 waitForNetworkWithCompletionHandler:v4];
}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_3;
  block[3] = &unk_264B9D3B8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  __int16 v6 = *(_WORD *)(a1 + 48);
  dispatch_async(v2, block);
}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appToken];
  if ([v2 length])
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_queue_appTokenNeedsToBeSynced") & 1) != 0 || *(unsigned char *)(a1 + 48))
    {
      v3 = [v2 DMCSHA256Hash];
      objc_msgSend(*(id *)(a1 + 32), "_queue_setLastestPushTokenToSync:", v3);
      id v4 = objc_opt_new();
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_9;
      v11[3] = &unk_264B9D390;
      v11[4] = *(void *)(a1 + 32);
      id v12 = v2;
      id v13 = v3;
      char v15 = *(unsigned char *)(a1 + 49);
      id v14 = *(id *)(a1 + 40);
      id v5 = v3;
      [v4 syncDEPPushToken:v12 pushTopic:0x26E54C710 completionBlock:v11];
    }
    else
    {
      uint64_t v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Push token has been synced.", buf, 2u);
      }
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10) {
        (*(void (**)(uint64_t, void, void, void))(v10 + 16))(v10, 0, 0, 0);
      }
    }
  }
  else
  {
    __int16 v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Push token is not available.", buf, 2u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) _noPushTokenError];
      (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, 0, 0, v8);
    }
  }
}

void __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_9(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) workerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2_10;
  block[3] = &unk_264B9D368;
  char v21 = a2;
  id v15 = v7;
  id v16 = v8;
  id v17 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  char v22 = *(unsigned char *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = *(id *)(a1 + 56);
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, block);
}

uint64_t __90__MDMDEPPushTokenManager__syncPushTokenShouldForce_shouldScheduleRetry_completionHandler___block_invoke_2_10(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v4;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Push token sync succeed. Response: %{public}@", buf, 0xCu);
    }
    id v5 = [MEMORY[0x263F53C50] sharedConnection];
    [v5 updateCloudConfigurationWithLastPushTokenHash:*(void *)(a1 + 56)];

    __int16 v6 = objc_opt_new();
    id v7 = &stru_26E549450;
    v23 = @"Token";
    v24 = @"Token hash";
    id v8 = *(__CFString **)(a1 + 48);
    if (!v8) {
      id v8 = &stru_26E549450;
    }
    if (*(void *)(a1 + 56)) {
      id v7 = *(__CFString **)(a1 + 56);
    }
    uint64_t v9 = *MEMORY[0x263F38A60];
    v25[0] = v8;
    v25[1] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v23 count:2];
    objc_msgSend(v6, "logRegularEventForTopic:reason:details:", v9, @"App Push Token Synced", v10, v23, v24);

    if (!*(void *)(a1 + 56)
      || (objc_msgSend(*(id *)(a1 + 64), "_queue_lastestPushTokenToSync"),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToData:*(void *)(a1 + 56)],
          v11,
          v12))
    {
      objc_msgSend(*(id *)(a1 + 64), "_queue_setLastestPushTokenToSync:", 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v13;
      __int16 v30 = 2114;
      uint64_t v31 = v14;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to upload push token with reponse: %{public}@, error: %{public}@", buf, 0x16u);
    }
    id v15 = objc_opt_new();
    uint64_t v17 = *(void *)(a1 + 40);
    id v16 = *(__CFString **)(a1 + 48);
    if (!v16) {
      id v16 = &stru_26E549450;
    }
    v26[0] = @"Token";
    v26[1] = @"Token hash";
    id v18 = *(__CFString **)(a1 + 56);
    if (!v18) {
      id v18 = &stru_26E549450;
    }
    uint64_t v19 = *MEMORY[0x263F38A60];
    v27[0] = v16;
    v27[1] = v18;
    id v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v15 logErrorEventForTopic:v19 reason:@"App Push Token Sync Failed" error:v17 details:v20];

    if (*(unsigned char *)(a1 + 81))
    {
      char v21 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230A49000, v21, OS_LOG_TYPE_INFO, "MDMDEPPushTokenManager: Retrying push token sync...", buf, 2u);
      }
      [*(id *)(a1 + 64) _retryPushTokenSync];
    }
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (void)_retryPushTokenSync
{
  v3 = [(MDMDEPPushTokenManager *)self workerQueue];
  [(MDMDEPPushTokenManager *)self syncInterval];
  if (v4 <= 86400.0) {
    double v5 = v4;
  }
  else {
    double v5 = 86400.0;
  }
  [(MDMDEPPushTokenManager *)self syncInterval];
  if (v6 <= 86400.0) {
    double v7 = v6;
  }
  else {
    double v7 = 86400.0;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__MDMDEPPushTokenManager__retryPushTokenSync__block_invoke;
  v10[3] = &unk_264B9D3E0;
  v10[4] = self;
  +[MDMBackgroundTaskUtilities scheduleOneShotBackgroundTask:@"com.apple.mdmd.MDMDEPPushTokenManager" usingQueue:v3 interval:v10 gracePeriod:v5 callback:v7];

  [(MDMDEPPushTokenManager *)self syncInterval];
  double v9 = v8 + v8;
  if (v9 > 86400.0) {
    double v9 = 86400.0;
  }
  [(MDMDEPPushTokenManager *)self setSyncInterval:v9];
}

uint64_t __45__MDMDEPPushTokenManager__retryPushTokenSync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _syncPushTokenShouldForce:0 shouldScheduleRetry:1 completionHandler:0];
}

- (void)_queue_setLastestPushTokenToSync:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    uint64_t v11 = @"LatestPushTokenHashToSync";
    id v12 = v3;
    id v5 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    double v6 = MDMDEPTokenSyncActivitiesFilePath();
    [v5 DMCWriteToBinaryFile:v6];
  }
  else
  {
    double v7 = [MEMORY[0x263F08850] defaultManager];
    double v8 = MDMDEPTokenSyncActivitiesFilePath();
    id v10 = 0;
    [v7 removeItemAtPath:v8 error:&v10];
    id v5 = v10;

    if (v5)
    {
      double v9 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v5;
        _os_log_impl(&dword_230A49000, v9, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to remove DEP token sync activity file with error: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (id)_queue_lastestPushTokenToSync
{
  int v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = MDMDEPTokenSyncActivitiesFilePath();
  double v4 = [v2 dictionaryWithContentsOfFile:v3];

  id v5 = [v4 objectForKeyedSubscript:@"LatestPushTokenHashToSync"];

  return v5;
}

- (id)_noPushTokenError
{
  int v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F38B10];
  double v4 = DMCErrorArray();
  id v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12127, v4, *MEMORY[0x263F38A40], 0);

  return v5;
}

- (void)pushServiceManager:(id)a3 didReceiveAppToken:(id)a4 forTopic:(id)a5 environment:(unint64_t)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!a6 && [v10 isEqualToString:0x26E54C710])
  {
    id v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      id v19 = v9;
      _os_log_impl(&dword_230A49000, v12, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Received app token for topic: %{public}@, appToken: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = [(MDMDEPPushTokenManager *)self workerQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __85__MDMDEPPushTokenManager_pushServiceManager_didReceiveAppToken_forTopic_environment___block_invoke;
    v14[3] = &unk_264B9D408;
    v14[4] = self;
    id v15 = v9;
    dispatch_async(v13, v14);
  }
}

void __85__MDMDEPPushTokenManager_pushServiceManager_didReceiveAppToken_forTopic_environment___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) appToken];
  char v3 = [v2 isEqualToData:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setAppToken:*(void *)(a1 + 40)];
    double v4 = *(void **)(a1 + 32);
    [v4 _syncPushTokenShouldForce:0 shouldScheduleRetry:1 completionHandler:0];
  }
}

- (void)pushServiceManager:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5 environment:(unint64_t)a6
{
  if (!a6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = v7;
    if ([a4 isEqualToString:0x26E54C710])
    {
      double v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_DEFAULT, "MDMDEPPushTokenManager: Received message from DEP server, fetching cloud config again...", v10, 2u);
      }
      id v9 = [MEMORY[0x263F53C50] sharedConnection];
      [v9 retrieveAndStoreCloudConfigurationDetailsCompletionBlock:&__block_literal_global_0];
    }
  }
}

void __92__MDMDEPPushTokenManager_pushServiceManager_didReceiveMessageForTopic_userInfo_environment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    char v3 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v2;
      _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_ERROR, "MDMDEPPushTokenManager: Failed to retrieve & store cloud config with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    double v4 = [MEMORY[0x263F52808] sharedConfiguration];
    [v4 refreshDetailsFromDisk];
  }
}

- (void)pushServiceManager:(id)a3 didReceivePublicToken:(id)a4 forEnvironment:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a5)
  {
    id v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      id v9 = "-[MDMDEPPushTokenManager pushServiceManager:didReceivePublicToken:forEnvironment:]";
      _os_log_impl(&dword_230A49000, v6, OS_LOG_TYPE_DEBUG, "MDMDEPPushTokenManager: %s", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [(MDMDEPPushTokenManager *)self pushServiceManager];
    [v7 requestAppTokenForTopic:0x26E54C710 environment:0];
  }
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (MDMPushServiceManager)pushServiceManager
{
  return self->_pushServiceManager;
}

- (void)setPushServiceManager:(id)a3
{
}

- (DMCNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (NSData)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
}

- (double)syncInterval
{
  return self->_syncInterval;
}

- (void)setSyncInterval:(double)a3
{
  self->_syncInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_pushServiceManager, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end