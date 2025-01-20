@interface HDMCDaySummaryObserverQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (HDMCDaySummaryObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7;
- (id)objectTypes;
- (void)_queue_deliverUpdate;
- (void)_queue_start;
- (void)_queue_stop;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDMCDaySummaryObserverQueryServer

- (void)_queue_start
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  [(HDQueryServer *)&v26 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  v6 = [v5 authorizationOracle];
  v7 = [(HDMCDaySummaryObserverQueryServer *)self objectTypes];
  id v25 = 0;
  v8 = [v6 readAuthorizationStatusesForTypes:v7 error:&v25];
  id v9 = v25;

  if (!v8)
  {
    v20 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v20);

    goto LABEL_19;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = objc_msgSend(v8, "allValues", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    char v14 = 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        if (v14) {
          char v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) canRead];
        }
        else {
          char v14 = 0;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v12);

    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v8;
        id v19 = v18;
        _os_log_impl(&dword_225722000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
      }
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (self->_requiresUpdate)
  {
    [(HDMCDaySummaryObserverQueryServer *)self _queue_deliverUpdate];
    self->_requiresUpdate = 0;
  }
LABEL_19:
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (id)objectTypes
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = HKMCDaySummarySampleTypes();
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (HDMCDaySummaryObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  v17 = [(HDQueryServer *)&v27 initWithUUID:v12 configuration:v13 client:v14 delegate:v15];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_profileExtension, a7);
    objc_initWeak(&location, v18);
    id v19 = objc_alloc(MEMORY[0x263F0A9B0]);
    v20 = [(HDQueryServer *)v18 queryQueue];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __97__HDMCDaySummaryObserverQueryServer_initWithUUID_configuration_client_delegate_profileExtension___block_invoke;
    v24[3] = &unk_2647507D0;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [v19 initWithMode:0 clock:1 queue:v20 delay:v24 block:0.1];
    updateOperation = v18->_updateOperation;
    v18->_updateOperation = (_HKDelayedOperation *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v7 = [v6 entitlements];
  uint64_t v8 = *MEMORY[0x263F09BA8];
  char v9 = [v7 hasEntitlement:*MEMORY[0x263F09BA8]];

  if ((v9 & 1) != 0
    || ([v6 entitlements],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *MEMORY[0x263F09B98],
        char v12 = [v10 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x263F09B98]],
        v10,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement: %@ for core apps or %@ for second-party access.", v8, v11);
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x263EFFA68];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 profile];
  id v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F450C8]];

  if (v16)
  {
    v17 = [[HDMCDaySummaryObserverQueryServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14 profileExtension:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

void __97__HDMCDaySummaryObserverQueryServer_initWithUUID_configuration_client_delegate_profileExtension___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_deliverUpdate");
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  id v6 = [(HDQueryServer *)self queryQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HDMCDaySummaryObserverQueryServer_samplesAdded_anchor___block_invoke;
  v8[3] = &unk_2647507F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __57__HDMCDaySummaryObserverQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = HKSensitiveLogItem();
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating due to samples added: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 208) execute];
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  id v6 = [(HDQueryServer *)self queryQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HDMCDaySummaryObserverQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v8[3] = &unk_2647507F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __70__HDMCDaySummaryObserverQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = HKSensitiveLogItem();
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating due to samples removed of types: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 208) execute];
}

- (void)_queue_deliverUpdate
{
  v3 = [(HDQueryServer *)self clientProxy];
  id v5 = [v3 remoteObjectProxy];

  v4 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v5, "client_deliverUpdateWithQueryUUID:", v4);
}

- (void)_queue_stop
{
  v3.receiver = self;
  v3.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  [(HDQueryServer *)&v3 _queue_stop];
  self->_requiresUpdate = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
}

@end