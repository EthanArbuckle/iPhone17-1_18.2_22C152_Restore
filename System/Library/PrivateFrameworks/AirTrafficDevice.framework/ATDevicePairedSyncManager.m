@interface ATDevicePairedSyncManager
+ (id)sharedPairedSyncManager;
- (ATDevicePairedSyncManager)init;
- (BOOL)hasRestriction;
- (void)_cleanupSyncState;
- (void)_triggerInitialSync;
- (void)nanoPairedDeviceStatusMonitor:(id)a3 didFinishInitialSyncForPairingIdentifier:(id)a4;
- (void)nanoPairedDeviceStatusMonitorNewActiveDevice:(id)a3;
- (void)nanoPairedDeviceStatusMonitorPairedDeviceChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ATDevicePairedSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_deviceService, 0);
}

- (void)nanoPairedDeviceStatusMonitor:(id)a3 didFinishInitialSyncForPairingIdentifier:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitor_didFinishInitialSyncForPairingIdentifier___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __100__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitor_didFinishInitialSyncForPairingIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerInitialSync];
}

- (void)nanoPairedDeviceStatusMonitorNewActiveDevice:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorNewActiveDevice___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorNewActiveDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerInitialSync];
}

- (void)nanoPairedDeviceStatusMonitorPairedDeviceChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorPairedDeviceChanged___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __78__ATDevicePairedSyncManager_nanoPairedDeviceStatusMonitorPairedDeviceChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupSyncState];
}

- (void)_triggerInitialSync
{
  id v3 = +[ATDeviceSettings sharedInstance];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setPairingSyncCompletionTime:");
  [v3 setSyncPending:1 forDataClass:@"Media"];
  [(ATDeviceService *)self->_deviceService requestSyncForPairedDeviceWithPriority:2 withCompletion:0];
}

- (void)_cleanupSyncState
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = +[ATDeviceSettings sharedInstance];
  id v3 = [MEMORY[0x1E4FB86D0] sharedMonitor];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = v3;
  v5 = [v3 allPairedDeviceGUIDs];
  v6 = [v4 setWithArray:v5];

  v7 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up sync state. allPairedDeviceGUIDs = %{public}@", buf, 0xCu);
  }

  v17 = [v2 endpointInfo];
  v8 = [v17 allKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v2 hostInfoForLibrary:v13];
        v15 = [v14 deviceGUID];
        if (!v15 || ([v6 containsObject:v15] & 1) == 0)
        {
          v16 = _ATLogCategoryDeviceSync();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v13;
            __int16 v25 = 2114;
            v26 = v15;
            _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_DEFAULT, "removing endpoint for library %{public}@. GUID=%{public}@", buf, 0x16u);
          }

          [v2 removeEndpointInfoForLibrary:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v10);
  }
}

- (BOOL)hasRestriction
{
  v2 = [MEMORY[0x1E4FB86D0] sharedMonitor];
  char v3 = [v2 isInitialSyncComplete] ^ 1;

  return v3;
}

- (void)stop
{
  id v3 = [MEMORY[0x1E4FB86D0] sharedMonitor];
  [v3 removeObserver:self];
}

- (void)start
{
  id v3 = [MEMORY[0x1E4FB86D0] sharedMonitor];
  [v3 addObserver:self];

  id v4 = +[ATDeviceSettings sharedInstance];
  [v4 removePendingSyncSettingForDataClass:@"PlayActivity-Sync"];
  [v4 synchronize];
}

- (ATDevicePairedSyncManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATDevicePairedSyncManager;
  v2 = [(ATDevicePairedSyncManager *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.AirTraffic.ATDevicePairedSyncManager.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[ATDeviceService sharedInstance];
    deviceService = v2->_deviceService;
    v2->_deviceService = (ATDeviceService *)v6;
  }
  return v2;
}

+ (id)sharedPairedSyncManager
{
  if (sharedPairedSyncManager_onceToken != -1) {
    dispatch_once(&sharedPairedSyncManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedPairedSyncManager___sharedInstance;

  return v2;
}

uint64_t __52__ATDevicePairedSyncManager_sharedPairedSyncManager__block_invoke()
{
  sharedPairedSyncManager___sharedInstance = objc_alloc_init(ATDevicePairedSyncManager);

  return MEMORY[0x1F41817F8]();
}

@end