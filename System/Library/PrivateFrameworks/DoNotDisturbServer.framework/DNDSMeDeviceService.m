@interface DNDSMeDeviceService
- (BOOL)_queue_saveDataToBackingStoreWithError:(id *)a3;
- (BOOL)_saveDataToBackingStoreWithError:(id *)a3;
- (DNDMeDeviceState)meDeviceState;
- (DNDSMeDeviceService)init;
- (NSString)sysdiagnoseDataIdentifier;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (void)_loadDataFromBackingStore;
- (void)_queue_fetchMeDevice;
- (void)_queue_processMeDevice:(id)a3 error:(id)a4;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
- (void)startMonitoringMeDeviceChanges;
@end

@implementation DNDSMeDeviceService

- (DNDSMeDeviceService)init
{
  v19.receiver = self;
  v19.super_class = (Class)DNDSMeDeviceService;
  v2 = [(DNDSMeDeviceService *)&v19 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC18DoNotDisturbServer19FindMyLocateSession);
    findMyLocateSession = v2->_findMyLocateSession;
    v2->_findMyLocateSession = v3;

    [(DNDSMeDeviceService *)v2 startMonitoringMeDeviceChanges];
    uint64_t v5 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.me-device.queue"];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.donotdisturb.DNDSMeDeviceService.call-out", v7);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableSet *)v10;

    meDeviceState = v2->_meDeviceState;
    v2->_meDeviceState = 0;

    v13 = [DNDSJSONBackingStore alloc];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_meDeviceStoreFileURL");
    uint64_t v16 = [(DNDSJSONBackingStore *)v13 initWithRecordClass:v14 fileURL:v15 versionNumber:0];
    backingStore = v2->_backingStore;
    v2->_backingStore = (DNDSBackingStore *)v16;

    [(DNDSMeDeviceService *)v2 _loadDataFromBackingStore];
  }
  return v2;
}

- (void)startMonitoringMeDeviceChanges
{
  objc_initWeak(&location, self);
  [(FindMyLocateSession *)self->_findMyLocateSession startMonitoringPreferencesChangesWithCompletionHandler:&__block_literal_global_13];
  findMyLocateSession = self->_findMyLocateSession;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__DNDSMeDeviceService_startMonitoringMeDeviceChanges__block_invoke_8;
  v4[3] = &unk_1E69741C8;
  objc_copyWeak(&v5, &location);
  [(FindMyLocateSession *)findMyLocateSession setMeDeviceUpdateCallback:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__DNDSMeDeviceService_startMonitoringMeDeviceChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDSLogMeDeviceService;
  BOOL v4 = os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "findmylocate: startMonitoringPreferencesChanges error %@";
      v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "findmylocate: startMonitoringPreferencesChanges completed successfully";
    v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

void __53__DNDSMeDeviceService_startMonitoringMeDeviceChanges__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "findmylocate: didUpdateMeDevice %@", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained[1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__DNDSMeDeviceService_startMonitoringMeDeviceChanges__block_invoke_9;
  v8[3] = &unk_1E69735B8;
  v8[4] = WeakRetained;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);
}

uint64_t __53__DNDSMeDeviceService_startMonitoringMeDeviceChanges__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processMeDevice:error:", *(void *)(a1 + 40), 0);
}

- (DNDMeDeviceState)meDeviceState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__DNDSMeDeviceService_meDeviceState__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (DNDMeDeviceState *)v3;
}

uint64_t __36__DNDSMeDeviceService_meDeviceState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__DNDSMeDeviceService_addListener___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

uint64_t __35__DNDSMeDeviceService_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__DNDSMeDeviceService_removeListener___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

uint64_t __38__DNDSMeDeviceService_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_fetchMeDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "findmylocate: fetching current 'Me Device'", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  findMyLocateSession = self->_findMyLocateSession;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__DNDSMeDeviceService__queue_fetchMeDevice__block_invoke;
  v5[3] = &unk_1E69741F0;
  objc_copyWeak(&v6, buf);
  [(FindMyLocateSession *)findMyLocateSession getActiveLocationSharingDeviceWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __43__DNDSMeDeviceService__queue_fetchMeDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DNDSMeDeviceService__queue_fetchMeDevice__block_invoke_2;
  block[3] = &unk_1E69734A0;
  block[4] = WeakRetained;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __43__DNDSMeDeviceService__queue_fetchMeDevice__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processMeDevice:error:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_processMeDevice:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "findmylocate: processing 'Me Device', determining status", buf, 2u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    id v9 = DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v7;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "findmylocate: error determining current 'Me Device' status; error=%{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    if ([v6 isThisDevice]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 3;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F5F5F0]);
    id v12 = [v6 deviceName];
    id v13 = (void *)[v11 initWithStatus:v10 name:v12];

    uint64_t v14 = (void *)DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      [v13 meDeviceStatus];
      uint64_t v16 = DNDMeDeviceStatusToString();
      v17 = [v13 meDeviceName];
      *(_DWORD *)buf = 138543618;
      id v27 = v16;
      __int16 v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "findmylocate: current 'Me Device' state determined; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
        buf,
        0x16u);
    }
    if ([(DNDMeDeviceState *)self->_meDeviceState isEqual:v13])
    {
      id v7 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_meDeviceState, v13);
      id v25 = 0;
      [(DNDSMeDeviceService *)self _queue_saveDataToBackingStoreWithError:&v25];
      id v7 = v25;
      v18 = (void *)[(NSMutableSet *)self->_listeners copy];
      calloutQueue = self->_calloutQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__DNDSMeDeviceService__queue_processMeDevice_error___block_invoke;
      v21[3] = &unk_1E69734A0;
      id v22 = v13;
      id v23 = v18;
      v24 = self;
      id v20 = v18;
      dispatch_async(calloutQueue, v21);
    }
  }
}

void __52__DNDSMeDeviceService__queue_processMeDevice_error___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    [v3 meDeviceStatus];
    id v5 = DNDMeDeviceStatusToString();
    id v6 = [*(id *)(a1 + 32) meDeviceName];
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "notifying listeners of a change to 'Me Device' state; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
      buf,
      0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "meDeviceService:didReceiveMeDeviceStateUpdate:", *(void *)(a1 + 48), *(void *)(a1 + 32), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_loadDataFromBackingStore
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v25 = 0;
  uint64_t v3 = [v2 readRecordWithError:&v25];
  id v4 = v25;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v3;

  id v7 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v7)
  {
    if (v4)
    {
      uint64_t v8 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_ERROR)) {
        __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_cold_1((uint64_t)v4, v8);
      }
      _DNDSRequestRadar(@"Failed to load current 'Me Device' database", v4, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSMeDeviceService.m", 174);
    }
    uint64_t v9 = objc_alloc_init(DNDSMeDeviceStore);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = v9;

    id v7 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  long long v12 = [v7 meDeviceStatus];
  uint64_t v13 = [v12 unsignedIntegerValue];

  long long v14 = [*(id *)(*(void *)(a1 + 32) + 48) meDeviceName];
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5F5F0]) initWithStatus:v13 name:v14];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 32);
  *(void *)(v16 + 32) = v15;

  if (!v13 || ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2 ? (BOOL v18 = v14 == 0) : (BOOL v18 = 0), v18))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = *(NSObject **)(v22 + 8);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_20;
    v24[3] = &unk_1E6973540;
    v24[4] = v22;
    dispatch_async(v23, v24);
  }
  else
  {
    __int16 v19 = (void *)DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      uint64_t v21 = DNDMeDeviceStatusToString();
      *(_DWORD *)buf = 138543618;
      id v27 = v21;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "findmylocate: current 'Me Device' state loaded from store; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
        buf,
        0x16u);
    }
  }
}

uint64_t __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_20(uint64_t a1)
{
  uint64_t v2 = DNDSLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "findmylocate: current 'Me Device' state unknown / incomplete; requesting active device",
      v4,
      2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchMeDevice");
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DNDSMeDeviceService__saveDataToBackingStoreWithError___block_invoke;
  block[3] = &unk_1E6974218;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(workQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __56__DNDSMeDeviceService__saveDataToBackingStoreWithError___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_saveDataToBackingStoreWithError:", *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_saveDataToBackingStoreWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = (void *)[(DNDSMeDeviceStore *)self->_store mutableCopy];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDMeDeviceState meDeviceStatus](self->_meDeviceState, "meDeviceStatus"));
  [v5 setMeDeviceStatus:v6];

  uint64_t v7 = [(DNDMeDeviceState *)self->_meDeviceState meDeviceName];
  [v5 setMeDeviceName:v7];

  backingStore = self->_backingStore;
  id v18 = 0;
  uint64_t v9 = [(DNDSBackingStore *)backingStore writeRecord:v5 error:&v18];
  id v10 = v18;
  if (v9)
  {
    if (v9 == 1)
    {
      uint64_t v16 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v10;
        long long v12 = "failed to write 'Me Device' store, but error can be ignored; error=%{public}@";
        uint64_t v13 = v16;
        uint32_t v14 = 12;
        goto LABEL_11;
      }
    }
    else if (v9 == 2)
    {
      uint64_t v11 = DNDSLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v12 = "wrote out 'Me Device' store to file";
        uint64_t v13 = v11;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    uint64_t v15 = DNDSLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDSLogMeDeviceService, OS_LOG_TYPE_ERROR)) {
      -[DNDSMeDeviceService _queue_saveDataToBackingStoreWithError:]((uint64_t)v10, v15);
    }
    _DNDSRequestRadar(@"Failed to write 'Me Device' store", v10, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSMeDeviceService.m", 221);
  }
  if (a3 && v10) {
    *a3 = v10;
  }

  return v9 == 2;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.MeDeviceService";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v7 = [(DNDSMeDeviceService *)self meDeviceState];
  [v7 meDeviceStatus];
  uint64_t v8 = DNDMeDeviceStatusToString();
  [v6 setObject:v8 forKeyedSubscript:@"status"];

  if (!a4)
  {
    uint64_t v9 = [v7 meDeviceName];
    [v6 setObject:v9 forKeyedSubscript:@"name"];
  }
  id v10 = (void *)[v6 copy];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_meDeviceState, 0);
  objc_storeStrong((id *)&self->_findMyLocateSession, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __48__DNDSMeDeviceService__loadDataFromBackingStore__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "failed to load current 'Me Device' database, will request a radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_queue_saveDataToBackingStoreWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "failed to write 'Me Device' store, will request radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end