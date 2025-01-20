@interface ATDeviceService
+ (ATDeviceService)sharedInstance;
- (ATDeviceService)init;
- (BOOL)run;
- (BOOL)stop;
- (id)_deviceMessageLink;
- (id)allMessageLinkProxyListeners;
- (id)proxyListenerForMessageLink:(id)a3;
- (void)_addObserversToMessageLink:(id)a3;
- (void)_cancelSyncForMessageLink:(id)a3;
- (void)_endStartupTransaction;
- (void)_removeObserversFromMessageLink:(id)a3;
- (void)_requestSyncForLibrary:(id)a3 onMessageLink:(id)a4;
- (void)_scheduleNewSyncIfNeeded;
- (void)_setupStartupTransaction;
- (void)addMessageLink:(id)a3;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)cancelAssetTransferForFailedAsset:(id)a3;
- (void)cancelSyncWithCompletion:(id)a3;
- (void)clearSyncDataWithCompletion:(id)a3;
- (void)dealloc;
- (void)getAssetMetricswithCompletion:(id)a3;
- (void)getDataRestoreIsCompleteWithCompletion:(id)a3;
- (void)getSyncStateWithCompletion:(id)a3;
- (void)handleDataMigrationFinished;
- (void)idsServiceDevicesDidChange:(id)a3;
- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3;
- (void)keepATCAlive:(BOOL)a3 withCompletion:(id)a4;
- (void)listener:(id)a3 didReceiveMessageLinkRequest:(id)a4;
- (void)lowBatteryNotificationWithCompletion:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)openDeviceMessageLinkWithPriority:(int)a3 withCompletion:(id)a4;
- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5;
- (void)prioritizeAsset:(id)a3 withCompletion:(id)a4;
- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5;
- (void)registerForStatusOfDataclasses:(id)a3 enabled:(id)a4 withCompletion:(id)a5;
- (void)removeMessageLink:(id)a3;
- (void)requestKeybagSyncToPairedDeviceWithCompletion:(id)a3;
- (void)requestSyncForLibrary:(id)a3 withCompletion:(id)a4;
- (void)requestSyncForPairedDeviceWithPriority:(int)a3 withCompletion:(id)a4;
- (void)restoreFromDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)syncChangesForDataClass:(id)a3 withPriority:(int)a4;
- (void)syncClient:(id)a3 hasChangesWithPriority:(int)a4;
@end

@implementation ATDeviceService

- (void)registerForStatusOfDataclasses:(id)a3 enabled:(id)a4 withCompletion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = v8;
    __int16 v22 = 2050;
    uint64_t v23 = [v9 longLongValue];
    _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_DEFAULT, "register for status:%{public}@ enabled:%{public}lld", (uint8_t *)&v20, 0x16u);
  }

  xpcListener = self->_xpcListener;
  v13 = [MEMORY[0x1E4F29268] currentConnection];
  v14 = [(ATXPCListener *)xpcListener proxyForConnection:v13];

  if (([v9 BOOLValue] & 1) != 0 || objc_msgSend(v8, "count"))
  {
    v15 = [MEMORY[0x1E4F478E0] sharedMonitor];
    [v15 addObserver:v14];

    v16 = [MEMORY[0x1E4F478E0] sharedMonitor];
    v17 = v16;
    id v18 = v8;
  }
  else
  {
    v19 = [MEMORY[0x1E4F478E0] sharedMonitor];
    [v19 removeObserver:v14];

    v16 = [MEMORY[0x1E4F478E0] sharedMonitor];
    v17 = v16;
    id v18 = 0;
  }
  [v16 setDataClasses:v18 forObserver:v14];

  v10[2](v10, 0);
}

+ (ATDeviceService)sharedInstance
{
  if (sharedInstance_onceToken_1315 != -1) {
    dispatch_once(&sharedInstance_onceToken_1315, &__block_literal_global_1316);
  }
  v2 = (void *)__sharedInstance;

  return (ATDeviceService *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_startupTransaction, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_eventScheduler, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_legacyDeviceSyncManager, 0);
  objc_storeStrong((id *)&self->_deviceSyncManager, 0);
  objc_storeStrong((id *)&self->_statusObserverListener, 0);
  objc_storeStrong((id *)&self->_messageLinkProxyListeners, 0);
  objc_storeStrong((id *)&self->_proxyListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_pairedSyncManager, 0);
  objc_storeStrong((id *)&self->_legacyLockdownListener, 0);

  objc_storeStrong((id *)&self->_lockdownListener, 0);
}

- (void)handleDataMigrationFinished
{
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "data migration finished - resuming restore", v5, 2u);
  }

  [(ATDeviceSettings *)self->_settings setHasCompletedDataMigration:1];
  [(ATDeviceSettings *)self->_settings synchronize];
  v4 = +[ATRestoreManager sharedManager];
  [v4 restoreSessionActiveWithCompletion:&__block_literal_global_196];
}

void __46__ATDeviceService_handleDataMigrationFinished__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[ATRestoreManager sharedManager];
    [v3 resume];
  }
  else
  {
    v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "no active restore session - ignoring", buf, 2u);
    }
  }
}

- (void)_scheduleNewSyncIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATDeviceSettings *)self->_settings dataClassesNeedingSync];
  v4 = (void *)[v3 mutableCopy];

  v28 = v4;
  obuint64_t j = (id)[v4 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v5 = +[ATClientController sharedInstance];
  v6 = [v5 allClients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_1F33F0650])
        {
          v12 = [v11 syncDataClass];
          uint64_t v13 = [v12 length];

          if (v13)
          {
            v14 = [v11 syncDataClass];
            [obj removeObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obja = obj;
  uint64_t v15 = [obja countByEnumeratingWithState:&v35 objects:v46 count:16];
  v16 = v28;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obja);
        }
        int v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v21 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v20;
          _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "Removing sync-pending flag for unsupported data class '%{public}@'", buf, 0xCu);
        }

        [v28 removeObject:v20];
        [(ATDeviceSettings *)self->_settings setSyncPending:0 forDataClass:v20];
      }
      uint64_t v17 = [obja countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v17);
  }

  if ([v28 count]
    && ![(ATDevicePairedSyncManager *)self->_pairedSyncManager hasRestriction])
  {
    if ([(ATIDSService *)self->_idsService hasPairedDevice])
    {
      __int16 v22 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v28;
        _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_DEFAULT, "still have pending changes - requesting a new sync. dataclasses:%{public}@", buf, 0xCu);
      }

      [(ATDeviceService *)self requestSyncForPairedDeviceWithPriority:2 withCompletion:&__block_literal_global_194];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v28;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v32;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v32 != v26) {
              objc_enumerationMutation(v23);
            }
            [(ATDeviceSettings *)self->_settings setSyncPending:0 forDataClass:*(void *)(*((void *)&v31 + 1) + 8 * k)];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v25);
      }

      v16 = v28;
    }
  }
}

void __43__ATDeviceService__scheduleNewSyncIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_ERROR, "sync request failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)_deviceMessageLink
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ATService *)self messageLinks];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_cancelSyncForMessageLink:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "cancelling all sync on message link %{public}@", (uint8_t *)&v8, 0xCu);
  }

  p_super = self->_deviceSyncManager;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = self->_legacyDeviceSyncManager;

    p_super = &v7->super;
  }
  [(ATDeviceSyncManager *)p_super cancelSyncOnMessageLink:v4];
}

- (void)_requestSyncForLibrary:(id)a3 onMessageLink:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ATLegacyDeviceSyncManager *)self->_legacyDeviceSyncManager initiateSyncForLibrary:v7 onMessageLink:v6];
  }
  else {
    [(ATDeviceSyncManager *)self->_deviceSyncManager initiateSyncOnMessageLink:v6];
  }
}

- (void)_removeObserversFromMessageLink:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = +[ATClientController sharedInstance];
  id v6 = [v5 allClients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_1F33DD908]) {
          [v4 removeObserver:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v4 removeObserver:self->_deviceSyncManager];
  if (self->_pairedSyncManager) {
    objc_msgSend(v4, "removeObserver:");
  }
}

- (void)_addObserversToMessageLink:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = +[ATClientController sharedInstance];
  id v6 = [v5 allClients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_1F33DD908]) {
          [v4 addObserver:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [v4 addObserver:self->_deviceSyncManager];
  [v4 addRequestHandler:self forDataClass:@"Control"];
  long long v12 = objc_alloc_init(ATDeviceProvisioningHandler);
  [v4 addObserver:v12];
  [v4 addRequestHandler:v12 forDataClass:@"Provisioning"];
  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F478A0]) initWithMessageLink:v4];
  long long v14 = [MEMORY[0x1E4F47890] sharedInstance];
  [v14 addAssetLink:v13];

  [v13 open];
  if (self->_pairedSyncManager) {
    objc_msgSend(v4, "addObserver:");
  }
}

- (void)_endStartupTransaction
{
  if ([(MSVXPCTransaction *)self->_startupTransaction isActive])
  {
    startupTransaction = self->_startupTransaction;
    [(MSVXPCTransaction *)startupTransaction endTransaction];
  }
}

- (void)_setupStartupTransaction
{
  [(MSVXPCTransaction *)self->_startupTransaction beginTransaction];
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v3;

  id v5 = self->_sigTermSrc;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43__ATDeviceService__setupStartupTransaction__block_invoke;
  handler[3] = &unk_1E6B88B40;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigTermSrc);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__ATDeviceService__setupStartupTransaction__block_invoke_2;
  v8[3] = &unk_1E6B88B40;
  v8[4] = self;
  dispatch_after(v6, queue, v8);
}

void __43__ATDeviceService__setupStartupTransaction__block_invoke(uint64_t a1)
{
}

uint64_t __43__ATDeviceService__setupStartupTransaction__block_invoke_2(uint64_t a1)
{
  id v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[21])
  {
    dispatch_source_cancel(v2[21]);
    id v2 = *(dispatch_source_t **)(a1 + 32);
  }

  return [(dispatch_source_t *)v2 _endStartupTransaction];
}

- (void)idsServiceDevicesDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([a3 hasPairedDevice] & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(ATDeviceSettings *)self->_settings dataClassesNeedingSync];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(ATDeviceSettings *)self->_settings setSyncPending:0 forDataClass:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)syncClient:(id)a3 hasChangesWithPriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 syncDataClass];
  [(ATDeviceService *)self syncChangesForDataClass:v6 withPriority:v4];
}

- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "initiating download sessions", buf, 2u);
  }

  uint64_t v5 = dispatch_group_create();
  id v6 = +[ATClientController sharedInstance];
  uint64_t v7 = [v6 clientForDataclass:@"Media"];

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v5);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke;
    v20[3] = &unk_1E6B88B40;
    id v21 = v5;
    [v7 initiateAssetDownloadsWithCompletion:v20];
    char v8 = 0;
    long long v9 = v21;
  }
  else
  {
    long long v9 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "Could not load sync client for dataclass=media", buf, 2u);
    }
    char v8 = 1;
  }

  if (MSVDeviceIsWatch())
  {
    long long v10 = +[ATClientController sharedInstance];
    long long v11 = [v10 clientForDataclass:@"Podcasts"];

    if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v5);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_179;
      v18[3] = &unk_1E6B88B40;
      v19 = v5;
      [v11 initiateAssetDownloadsWithCompletion:v18];
      long long v12 = v19;
    }
    else
    {
      long long v12 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "Could not load sync client for dataclass=podcasts", buf, 2u);
      }
      char v8 = 1;
    }
  }
  long long v13 = dispatch_get_global_queue(25, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_180;
  v15[3] = &unk_1E6B87BC0;
  char v17 = v8;
  id v16 = v3;
  id v14 = v3;
  dispatch_group_notify(v5, v13, v15);
}

void __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "finished initiating download session for dataclass=media", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_179(uint64_t a1)
{
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "finished initiating download session for dataclass=podcasts", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __63__ATDeviceService_initiateAssetDownloadSessionsWithCompletion___block_invoke_180(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:*MEMORY[0x1E4F4A258] object:0];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)syncChangesForDataClass:(id)a3 withPriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ATDeviceSettings *)self->_settings endpointInfo];
  char v8 = v7;
  if (v7 && [v7 count])
  {
    unsigned int v24 = v4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v9 = [v8 allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      id v23 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) objectForKey:@"HostInfo"];
          uint64_t v15 = [v14 enabledDataClasses];
          if (!v15
            || (id v16 = (void *)v15,
                [v14 enabledDataClasses],
                char v17 = objc_claimAutoreleasedReturnValue(),
                char v18 = [v17 containsObject:v6],
                v17,
                v16,
                (v18 & 1) != 0))
          {

            char v8 = v23;
            uint64_t v4 = v24;
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
        char v8 = v23;
        if (v11) {
          continue;
        }
        break;
      }
    }

    v19 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v6;
      _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "blocking sync request because no known endpoints support dataClass %{public}@", buf, 0xCu);
    }
  }
  else
  {
LABEL_15:
    [(ATDeviceSettings *)self->_settings setSyncPending:1 forDataClass:v6];
    uint64_t v20 = [(ATDeviceService *)self _deviceMessageLink];
    if (v20)
    {
      v19 = v20;
      id v21 = [(ATDeviceSyncManager *)self->_deviceSyncManager initiateSyncForDataClass:v6 onMessageLink:v20];
    }
    else
    {
      if ([(ATIDSService *)self->_idsService hasPairedDevice])
      {
        [(ATDeviceService *)self openDeviceMessageLinkWithPriority:v4 withCompletion:&__block_literal_global_170];
      }
      else
      {
        __int16 v22 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D9A2D000, v22, OS_LOG_TYPE_ERROR, "not initiating a sync as we don't have a paired device", buf, 2u);
        }
      }
      v19 = 0;
    }
  }
}

void __56__ATDeviceService_syncChangesForDataClass_withPriority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_ERROR, "failed to open device link. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)getDataRestoreIsCompleteWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v5 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
  char v6 = [v5 isDeviceClassCUnlocked];

  if (v6)
  {
    uint64_t v7 = +[ATRestoreManager sharedManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__ATDeviceService_getDataRestoreIsCompleteWithCompletion___block_invoke;
    v11[3] = &unk_1E6B87B98;
    long long v13 = &v14;
    id v12 = v4;
    [v7 restoreSessionActiveWithCompletion:v11];
  }
  else
  {
    BOOL v8 = [(ATDeviceSettings *)self->_settings activeRestoreType] == 0;
    *((unsigned char *)v15 + 24) = v8;
    long long v9 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v15 + 24);
      *(_DWORD *)buf = 67109120;
      int v19 = v10;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "device is locked - restoreComplete %d", buf, 8u);
    }

    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, *((unsigned __int8 *)v15 + 24));
    }
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __58__ATDeviceService_getDataRestoreIsCompleteWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 ^ 1;
  id v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "restoreComplete %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAssetMetricswithCompletion:(id)a3
{
  id v3 = a3;
  int v4 = +[ATDeviceDiskUsageProvider sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __49__ATDeviceService_getAssetMetricswithCompletion___block_invoke;
  v6[3] = &unk_1E6B87B70;
  id v7 = v3;
  id v5 = v3;
  [v4 getUpdatedUsageWithCompletion:v6];
}

uint64_t __49__ATDeviceService_getAssetMetricswithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openDeviceMessageLinkWithPriority:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  idsService = self->_idsService;
  char v6 = (void (**)(id, void))a4;
  [(ATIDSService *)idsService requestConnectionToPairedDeviceWithPriority:+[ATIDSService openSocketPriorityFromATPendingChangePriority:v4]];
  v6[2](v6, 0);
}

- (void)getSyncStateWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  uint64_t v4 = [(ATLegacyDeviceSyncManager *)self->_legacyDeviceSyncManager currentSyncState];
  if (v5) {
    v5[2](v5, 0, v4);
  }
}

- (void)keepATCAlive:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v6 = (void (**)(id, void))a4;
  id v7 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = "enabling";
    if (v4) {
      BOOL v8 = "disabling";
    }
    int v9 = 136315138;
    int v10 = v8;
    _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_DEFAULT, "idle exit %s", (uint8_t *)&v9, 0xCu);
  }

  [(MSVXPCTransaction *)self->_xpcTransaction beginTransaction];
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)lowBatteryNotificationWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  BOOL v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "low battery notification", v5, 2u);
  }

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)clearSyncDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  id v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "clearing sync data", v6, 2u);
  }

  [(ATDeviceSettings *)self->_settings removeEndpointInfoForLibrary:0];
  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void))a5;
  int v10 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "purge partial asset dataclass:%{public}@, id:%{public}@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v11 = [MEMORY[0x1E4F4A2A8] sharedInstance];
  [v11 purgeAssetWithIdentifier:v7 dataclass:v8];

  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)cancelAssetTransferForFailedAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling asset:%{public}@", buf, 0x16u);
  }

  char v6 = [MEMORY[0x1E4F47890] sharedInstance];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = [v4 dataclass];
  int v9 = [v4 identifier];
  int v10 = [v7 predicateWithFormat:@"dataclass = %@ and identifier = %@", v8, v9];
  [v6 cancelAllAssetsMatchingPredicate:v10 excludeActiveDownloads:0 withError:0 completion:0];
}

- (void)prioritizeAsset:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ prioritize asset:%{public}@", buf, 0x16u);
  }

  int v9 = [MEMORY[0x1E4F47890] sharedInstance];
  if ([v6 isRestore] && (objc_msgSend(v9, "assetIsEnqueued:", v6) & 1) == 0)
  {
    id v11 = v6;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v9 enqueueAssets:v10];
  }
  [v9 prioritizeAsset:v6];
  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4 withCompletion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F4A2B0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithIdentifier:v11 dataclass:v10 prettyName:0];

  [v12 setIsRestore:1];
  [(ATDeviceService *)self prioritizeAsset:v12 withCompletion:v9];
}

- (void)cancelSyncWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATDeviceService_cancelSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E6B88088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __44__ATDeviceService_cancelSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "messageLinks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _cancelSyncForMessageLink:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestKeybagSyncToPairedDeviceWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "request keybag sync to paired device", v6, 2u);
  }

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ATSyncKeybagToPairedDeviceRequestNotification" object:0];

  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)requestSyncForPairedDeviceWithPriority:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void (**)(id, void))a4;
  id v7 = [(ATDeviceService *)self _deviceMessageLink];
  long long v8 = v7;
  if (v7)
  {
    long long v9 = [v7 identifier];
    [(ATDeviceService *)self _requestSyncForLibrary:v9 onMessageLink:v8];

    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__ATDeviceService_requestSyncForPairedDeviceWithPriority_withCompletion___block_invoke;
    v10[3] = &unk_1E6B88618;
    long long v11 = v6;
    [(ATDeviceService *)self openDeviceMessageLinkWithPriority:v4 withCompletion:v10];
  }
}

void __73__ATDeviceService_requestSyncForPairedDeviceWithPriority_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "failed to open device link. err=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)requestSyncForLibrary:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "request sync for library %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    long long v9 = [(ATService *)self messageLinkForIdentifier:v6];
    if (v9) {
      [(ATDeviceService *)self _requestSyncForLibrary:v6 onMessageLink:v9];
    }
  }
  else
  {
    long long v10 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [(ATService *)self messageLinks];
      *(_DWORD *)buf = 138543362;
      id v15 = v11;
      _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEFAULT, "library id not specified - syncing all (%{public}@)", buf, 0xCu);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ATDeviceService_requestSyncForLibrary_withCompletion___block_invoke;
    block[3] = &unk_1E6B88B40;
    block[4] = self;
    dispatch_async(queue, block);
  }
  v7[2](v7, 0);
}

void __56__ATDeviceService_requestSyncForLibrary_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [*(id *)(a1 + 32) messageLinks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = _ATLogCategoryFramework();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v7;
          _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "requesting sync for %{public}@", buf, 0xCu);
        }

        long long v9 = *(void **)(a1 + 32);
        long long v10 = [v7 identifier];
        [v9 _requestSyncForLibrary:v10 onMessageLink:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)restoreFromDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x1E4F47890] sharedInstance];
        long long v9 = (void *)MEMORY[0x1E4F28F60];
        long long v10 = [v7 bundleIdentifier];
        long long v11 = [v9 predicateWithFormat:@"dataclass = %@ and identifier = %@", @"Application", v10];
        [v8 cancelAllAssetsMatchingPredicate:v11 excludeActiveDownloads:0 withError:0 completion:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [(ATDeviceService *)self prioritizeAsset:v9 forDataclass:@"Application" withCompletion:&__block_literal_global_153];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)listener:(id)a3 didReceiveMessageLinkRequest:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (ATDeviceService *)a4;
  long long v9 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    long long v36 = self;
    __int16 v37 = 2114;
    id v38 = v7;
    __int16 v39 = 2114;
    long long v40 = v8;
    _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ did receieve message link request %{public}@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v12 = [(ATService *)self messageLinks];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          char v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v17 close];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v14);
    }

LABEL_17:
    [(ATDeviceService *)self _addObserversToMessageLink:v8];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ATConcreteService *)v8 addObserver:self->_legacyDeviceSyncManager];
    long long v10 = [[ATLocalCloudAssetLink alloc] initWithMessageLink:v8];
    long long v11 = [MEMORY[0x1E4F47890] sharedInstance];
    [v11 addAssetLink:v10];

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_17;
  }
  unsigned int v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"ATDeviceService.m", 392, @"received unknown message link type from lockdown listener: %@", v8 object file lineNumber description];

LABEL_18:
  [(ATDeviceService *)self addMessageLink:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = [(ATService *)self observers];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v22++) service:self willOpenMessageLink:v8];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  if (([(ATDeviceService *)v8 open] & 1) == 0)
  {
    id v23 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      long long v36 = v8;
      __int16 v37 = 2114;
      id v38 = v7;
      _os_log_impl(&dword_1D9A2D000, v23, OS_LOG_TYPE_ERROR, "failed to open message link %{public}@ from listener %{public}@", buf, 0x16u);
    }

    [(ATDeviceService *)v8 close];
  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 errorWithDomain:@"ATError" code:21 userInfo:0];
  id v9 = [v6 responseWithError:v8 parameters:0];

  [v7 sendResponse:v9 withCompletion:0];
}

- (void)messageLinkWasClosed:(id)a3
{
  id v4 = a3;
  [(ATDeviceService *)self _removeObserversFromMessageLink:v4];
  v6.receiver = self;
  v6.super_class = (Class)ATDeviceService;
  [(ATConcreteService *)&v6 messageLinkWasClosed:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(ATDeviceService *)self _scheduleNewSyncIfNeeded];
  }
}

- (void)removeMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ATDeviceService_removeMessageLink___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __37__ATDeviceService_removeMessageLink___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:*(void *)(a1 + 40)];
  [v2 stop];
  [*(id *)(*(void *)(a1 + 32) + 104) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ATDeviceService;
  objc_msgSendSuper2(&v4, sel_removeMessageLink_, v3);
  if (![*(id *)(*(void *)(a1 + 32) + 104) count]) {
    [*(id *)(*(void *)(a1 + 32) + 152) endTransaction];
  }
}

- (void)addMessageLink:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__ATDeviceService_addMessageLink___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __34__ATDeviceService_addMessageLink___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 104) count]) {
    [*(id *)(*(void *)(a1 + 32) + 152) beginTransaction];
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F478C8]) initWithMessageLink:*(void *)(a1 + 40)];
  [v2 start];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v2 forKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ATDeviceService;
  objc_msgSendSuper2(&v4, sel_addMessageLink_, v3);
}

- (id)allMessageLinkProxyListeners
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1278;
  long long v10 = __Block_byref_object_dispose__1279;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ATDeviceService_allMessageLinkProxyListeners__block_invoke;
  v5[3] = &unk_1E6B88210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__ATDeviceService_allMessageLinkProxyListeners__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 104) objectEnumerator];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)proxyListenerForMessageLink:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1278;
  queue = self->_queue;
  uint64_t v16 = __Block_byref_object_dispose__1279;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ATDeviceService_proxyListenerForMessageLink___block_invoke;
  block[3] = &unk_1E6B88B90;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __47__ATDeviceService_proxyListenerForMessageLink___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 104) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)stop
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", buf, 0xCu);
  }

  [(ATXPCListener *)self->_xpcListener stop];
  [(ATLockdownListener *)self->_legacyLockdownListener stop];
  [(ATLockdownListener *)self->_lockdownListener stop];
  [(ATIDSService *)self->_idsService stop];
  [(ATServiceProxyListener *)self->_proxyListener stop];
  [(ATStatusObserverListener *)self->_statusObserverListener stop];
  id v4 = +[ATHostWakeupService sharedInstance];
  [v4 stop];

  [(ATDevicePairedSyncManager *)self->_pairedSyncManager stop];
  id v5 = [MEMORY[0x1E4F4A2A8] sharedInstance];
  [v5 evacuate];

  id v6 = [MEMORY[0x1E4F478B0] sharedInstance];
  [v6 stop];

  v8.receiver = self;
  v8.super_class = (Class)ATDeviceService;
  return [(ATConcreteService *)&v8 stop];
}

- (BOOL)run
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v28 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting up", buf, 0xCu);
  }

  [(ATDeviceService *)self _setupStartupTransaction];
  id v4 = [MEMORY[0x1E4F4A2A8] sharedInstance];
  [v4 evacuate];

  v25.receiver = self;
  v25.super_class = (Class)ATDeviceService;
  if (![(ATConcreteService *)&v25 run]) {
    goto LABEL_8;
  }
  [(ATServiceProxyListener *)self->_proxyListener start];
  [(ATStatusObserverListener *)self->_statusObserverListener start];
  id v5 = [MEMORY[0x1E4F478D8] sharedSessionServer];
  [v5 start];

  id v6 = +[ATDevicePairedSyncManager sharedPairedSyncManager];
  pairedSyncManager = self->_pairedSyncManager;
  self->_pairedSyncManager = v6;

  [(ATDevicePairedSyncManager *)self->_pairedSyncManager start];
  legacyLockdownListener = self->_legacyLockdownListener;
  if (!legacyLockdownListener || [(ATLockdownListener *)legacyLockdownListener start])
  {
    lockdownListener = self->_lockdownListener;
    if (lockdownListener) {
      int v10 = [(ATLockdownListener *)lockdownListener start];
    }
    else {
      int v10 = 1;
    }
  }
  else
  {
LABEL_8:
    int v10 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = +[ATClientController sharedInstance];
  uint64_t v12 = [v11 allClients];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v17 conformsToProtocol:&unk_1F33F0650]) {
          [v17 setDelegate:self];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }

  if (v10)
  {
    uint64_t v18 = [MEMORY[0x1E4FB8708] sharedSecurityInfo];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __22__ATDeviceService_run__block_invoke;
    v20[3] = &unk_1E6B88B40;
    void v20[4] = self;
    [v18 performBlockAfterFirstUnlock:v20];
  }
  return v10;
}

void __22__ATDeviceService_run__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 80) start] & 1) == 0)
  {
    uint64_t v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
      int v17 = 138543362;
      uint64_t v18 = v3;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_ERROR, "failed to start %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v4 = objc_alloc_init(ATStoreAssetLink);
  id v5 = [MEMORY[0x1E4F47890] sharedInstance];
  [v5 addAssetLink:v4];

  [(ATStoreAssetLink *)v4 open];
  if ([*(id *)(*(void *)(a1 + 32) + 136) useNewDownloadService]) {
    id v6 = ATStoreMediaAssetLink;
  }
  else {
    id v6 = ATMPStoreAssetLink;
  }
  id v7 = objc_alloc_init(v6);
  objc_super v8 = [MEMORY[0x1E4F47890] sharedInstance];
  [v8 addAssetLink:v7];

  [v7 open];
  id v9 = [MEMORY[0x1E4F478B0] sharedInstance];
  [v9 start];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleDataMigratorFinishedNotification, (CFStringRef)*MEMORY[0x1E4F4A238], 0, CFNotificationSuspensionBehaviorDrop);
  uint64_t v11 = +[ATRestoreManager sharedManager];
  [v11 restoreSessionActiveWithCompletion:&__block_literal_global_115];

  [*(id *)(a1 + 32) _scheduleNewSyncIfNeeded];
  uint64_t v12 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_DEFAULT, "atc startup complete", (uint8_t *)&v17, 2u);
  }

  uint64_t v13 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v14 = *MEMORY[0x1E4F4A2A0];
  CFNotificationCenterPostNotification(v13, (CFNotificationName)*MEMORY[0x1E4F4A2A0], 0, 0, 1u);
  uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:v14 object:0];

  [*(id *)(*(void *)(a1 + 32) + 144) start];
  uint64_t v16 = +[ATHostWakeupService sharedInstance];
  [v16 start];
}

void __22__ATDeviceService_run__block_invoke_112(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"not active";
    if (a2) {
      id v4 = @"active";
    }
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "A restore session is %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (a2)
  {
    id v5 = +[ATRestoreManager sharedManager];
    [v5 resume];
  }
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_sigTermSrc);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = 0;

  int atcRunningToken = self->_atcRunningToken;
  if (atcRunningToken)
  {
    notify_set_state(atcRunningToken, 0);
    notify_post("com.apple.atc.started");
    notify_cancel(self->_atcRunningToken);
    self->_int atcRunningToken = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F4A238], 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ATDeviceService;
  [(ATDeviceService *)&v6 dealloc];
}

- (ATDeviceService)init
{
  v36.receiver = self;
  v36.super_class = (Class)ATDeviceService;
  uint64_t v2 = [(ATConcreteService *)&v36 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceService.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc_init(ATXPCListener);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v5;

    [(ATXPCListener *)v2->_xpcListener run];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F478D0]) initWithService:v2];
    proxyListener = v2->_proxyListener;
    v2->_proxyListener = (ATServiceProxyListener *)v7;

    id v9 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    messageLinkProxyListeners = v2->_messageLinkProxyListeners;
    v2->_messageLinkProxyListeners = v9;

    uint64_t v11 = (ATStatusObserverListener *)objc_alloc_init(MEMORY[0x1E4F478E8]);
    statusObserverListener = v2->_statusObserverListener;
    v2->_statusObserverListener = v11;

    uint64_t v13 = [[ATLockdownListener alloc] initWithServiceName:@"com.apple.atc"];
    legacyLockdownListener = v2->_legacyLockdownListener;
    v2->_legacyLockdownListener = v13;

    [(ATMessageLinkListener *)v2->_legacyLockdownListener setDelegate:v2];
    uint64_t v15 = [[ATLockdownListener alloc] initWithServiceName:@"com.apple.atc2"];
    lockdownListener = v2->_lockdownListener;
    v2->_lockdownListener = v15;

    [(ATMessageLinkListener *)v2->_lockdownListener setDelegate:v2];
    int v17 = objc_alloc_init(ATLegacyDeviceSyncManager);
    legacyDeviceSyncManager = v2->_legacyDeviceSyncManager;
    v2->_legacyDeviceSyncManager = v17;

    uint64_t v19 = +[ATDeviceSettings sharedInstance];
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v19;

    uint64_t v21 = [MEMORY[0x1E4F478B8] sharedInstance];
    eventScheduler = v2->_eventScheduler;
    v2->_eventScheduler = (ATEventScheduler *)v21;

    uint64_t v23 = +[ATDeviceSyncManager deviceSyncManager];
    deviceSyncManager = v2->_deviceSyncManager;
    v2->_deviceSyncManager = (ATDeviceSyncManager *)v23;

    objc_super v25 = [ATIDSService alloc];
    long long v26 = [(ATDeviceSettings *)v2->_settings serviceName];
    uint64_t v27 = [(ATIDSService *)v25 initWithServiceName:v26];
    idsService = v2->_idsService;
    v2->_idsService = (ATIDSService *)v27;

    [(ATMessageLinkListener *)v2->_idsService setDelegate:v2];
    [(ATIDSService *)v2->_idsService addListener:v2];
    notify_register_check("com.apple.atc.started", &v2->_atcRunningToken);
    notify_set_state(v2->_atcRunningToken, 1uLL);
    notify_post("com.apple.atc.started");
    uint64_t v29 = dispatch_get_global_queue(0, 0);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v29, &__block_literal_global_26);

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F77A50]) initWithName:@"com.apple.atc.service.startup"];
    startupTransaction = v2->_startupTransaction;
    v2->_startupTransaction = (MSVXPCTransaction *)v30;

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F77A50]) initWithName:@"com.apple.atc.service"];
    xpcTransaction = v2->_xpcTransaction;
    v2->_xpcTransaction = (MSVXPCTransaction *)v32;

    if (MGGetSInt32Answer() == 6)
    {
      long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:10485760 diskPath:0];
      [MEMORY[0x1E4F29078] setSharedURLCache:v34];
    }
  }
  return v2;
}

uint64_t __33__ATDeviceService_sharedInstance__block_invoke()
{
  __sharedInstance = objc_alloc_init(ATDeviceService);

  return MEMORY[0x1F41817F8]();
}

@end