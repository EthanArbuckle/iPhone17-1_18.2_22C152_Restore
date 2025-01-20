@interface DNDSModernAssertionSyncManager
- (BOOL)_maintainMetadataBackingStore;
- (BOOL)_saveMetadataToBackingStore;
- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7;
- (DNDSAssertionSyncManagerDataSource)dataSource;
- (DNDSAssertionSyncManagerDelegate)delegate;
- (DNDSModernAssertionSyncManager)initWithClientDetailsProvider:(id)a3 localSyncService:(id)a4 cloudSyncService:(id)a5 keybag:(id)a6;
- (NSString)sysdiagnoseDataIdentifier;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (void)_loadMetadataFromBackingStore;
- (void)_queue_handleDidSendRequestIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_queue_handleMessage:(id)a3 withVersionNumber:(unint64_t)a4 fromDeviceIdentifier:(id)a5;
- (void)_queue_sendStateSnapshotToPairedDevices:(id)a3 force:(BOOL)a4;
- (void)_queue_updateDevices;
- (void)_saveMetadataToBackingStore;
- (void)dealloc;
- (void)forceUpdateAllDevices;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)resume;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7;
- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)updateDevices:(id)a3;
- (void)updateDevices:(id)a3 force:(BOOL)a4 shouldFuzz:(BOOL)a5;
- (void)updateForModeAssertionUpdateResult:(id)a3;
- (void)updateForStateUpdate:(id)a3;
@end

@implementation DNDSModernAssertionSyncManager

- (DNDSModernAssertionSyncManager)initWithClientDetailsProvider:(id)a3 localSyncService:(id)a4 cloudSyncService:(id)a5 keybag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)DNDSModernAssertionSyncManager;
  id v15 = [(DNDSModernAssertionSyncManager *)&v30 init];
  if (v15)
  {
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.donotdisturb.server.ModernAssertionSyncManager", v16);
    v18 = (void *)*((void *)v15 + 1);
    *((void *)v15 + 1) = v17;

    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v15 + 1));
    v20 = (void *)*((void *)v15 + 2);
    *((void *)v15 + 2) = v19;

    objc_storeStrong((id *)v15 + 3, a4);
    objc_storeStrong((id *)v15 + 4, a5);
    objc_storeStrong((id *)v15 + 5, a3);
    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    v22 = (void *)*((void *)v15 + 9);
    *((void *)v15 + 9) = v21;

    *((unsigned char *)v15 + 80) = 0;
    v23 = (void *)*((void *)v15 + 12);
    *((void *)v15 + 11) = 0;
    *((void *)v15 + 12) = 0;

    *((_DWORD *)v15 + 26) = 0;
    v24 = [DNDSJSONBackingStore alloc];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_assertionSyncMetadataFileURL");
    uint64_t v27 = [(DNDSJSONBackingStore *)v24 initWithRecordClass:v25 fileURL:v26 versionNumber:0];
    v28 = (void *)*((void *)v15 + 7);
    *((void *)v15 + 7) = v27;

    [v15 _loadMetadataFromBackingStore];
    if ([v15 _maintainMetadataBackingStore]) {
      [v15 _saveMetadataToBackingStore];
    }
    if (([v14 hasUnlockedSinceBoot] & 1) == 0)
    {
      objc_storeStrong((id *)v15 + 8, a6);
      [*((id *)v15 + 8) addObserver:v15];
    }
    DNDSRegisterSysdiagnoseDataProvider(v15);
  }

  return (DNDSModernAssertionSyncManager *)v15;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModernAssertionSyncManager;
  [(DNDSModernAssertionSyncManager *)&v3 dealloc];
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__DNDSModernAssertionSyncManager_resume__block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __40__DNDSModernAssertionSyncManager_resume__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) delegate];

  if (!v2)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 24) resume];
  }
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 32) delegate];

  if (!v3)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 32) resume];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __40__DNDSModernAssertionSyncManager_resume__block_invoke_2;
  handler[3] = &unk_1E6973540;
  handler[4] = v4;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  v6 = [*(id *)(a1 + 32) dataSource];
  v7 = [v6 currentlyActivePairedDeviceForSyncManager:*(void *)(a1 + 32)];
  v8 = [v6 pairedDevicesForSyncManager:*(void *)(a1 + 32)];
  v9 = [v8 allObjects];

  v10 = DNDSLogModernAssertionSync;
  BOOL v11 = os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      *(_WORD *)dispatch_queue_t v17 = 0;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Sending forced update to local paired device on resume.", v17, 2u);
    }
    id v12 = *(void **)(a1 + 32);
    v20[0] = v7;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v12 updateDevices:v13 force:1 shouldFuzz:1];

    dispatch_source_t v19 = v7;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    uint64_t v15 = objc_msgSend(v9, "bs_differenceWithArray:", v14);

    v9 = (void *)v15;
  }
  else if (v11)
  {
    *(_WORD *)dispatch_queue_t v17 = 0;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Skipping initial state sync on resume because there isn't a paired device.", v17, 2u);
  }
  if ([v9 count])
  {
    v16 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v17 = 0;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Sending update to cloud devices on resume.", v17, 2u);
    }
    [*(id *)(a1 + 32) updateDevices:v9 force:0 shouldFuzz:1];
  }
}

uint64_t __40__DNDSModernAssertionSyncManager_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDevices");
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(DNDSModernAssertionSyncManager *)self dataSource];
  v5 = [v4 currentlyActivePairedDeviceForSyncManager:self];

  if (v5)
  {
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(DNDSModernAssertionSyncManager *)self updateDevices:v6 force:1 shouldFuzz:0];
  }
}

- (void)updateForModeAssertionUpdateResult:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 1;
  v6 = [(DNDSModernAssertionSyncManager *)self dataSource];
  v7 = [v5 assertions];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke;
  v47[3] = &unk_1E6974660;
  v47[4] = &v48;
  char v8 = objc_msgSend(v7, "bs_containsObjectPassingTest:", v47);

  if (v8) {
    goto LABEL_3;
  }
  v9 = [v5 invalidations];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_2;
  v46[3] = &unk_1E6974688;
  v46[4] = &v48;
  int v10 = objc_msgSend(v9, "bs_containsObjectPassingTest:", v46);

  if (v10)
  {
LABEL_3:
    BOOL v11 = [v6 pairedDevicesForSyncManager:self];
    id v12 = [v11 allObjects];
    goto LABEL_4;
  }
  id v14 = [v6 currentlyActivePairedDeviceForSyncManager:self];
  BOOL v11 = v14;
  if (v14)
  {
    int v15 = [v14 supportsKettle] ^ 1;
    int v16 = [v11 isICloudEnabled] ^ 1;
    if (v15) {
      goto LABEL_15;
    }
  }
  else
  {
    int v15 = 0;
    int v16 = 0;
  }
  if (!v16)
  {
    id v12 = 0;
    goto LABEL_4;
  }
LABEL_15:
  dispatch_queue_t v17 = [v11 deviceIdentifier];
  v18 = [v5 assertions];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_3;
  v44[3] = &unk_1E6973720;
  id v19 = v17;
  id v45 = v19;
  char v37 = objc_msgSend(v18, "bs_containsObjectPassingTest:", v44);

  if (v37)
  {
    int v20 = 1;
    if (!v15) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v21 = [v5 invalidations];
    objc_super v3 = (id *)v42;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_4;
    v42[3] = &unk_1E6973FA0;
    id v43 = v19;
    int v20 = objc_msgSend(v21, "bs_containsObjectPassingTest:", v42);

    v35 = &v43;
    if (!v15) {
      goto LABEL_21;
    }
  }
  v22 = [v5 invalidations];
  char v23 = objc_msgSend(v22, "bs_containsObjectPassingTest:", &__block_literal_global_17);

  if (v23)
  {
    int v24 = 1;
    char v25 = 1;
    char v26 = 1;
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v27 = [v5 assertions];
  objc_super v3 = (id *)v40;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_6;
  v40[3] = &unk_1E6973720;
  id v28 = v19;
  id v41 = v28;
  char v29 = objc_msgSend(v27, "bs_containsObjectPassingTest:", v40);

  v36 = &v41;
  if (v29)
  {
    char v26 = 0;
    int v24 = 1;
    char v25 = 1;
  }
  else
  {
    objc_super v30 = [v5 invalidations];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_7;
    v38[3] = &unk_1E6973FA0;
    id v39 = v28;
    int v24 = objc_msgSend(v30, "bs_containsObjectPassingTest:", v38);

    char v25 = 0;
    char v26 = 0;
    objc_super v3 = &v39;
  }
LABEL_24:
  if ((v20 & v24) == 1)
  {
    v31 = [v6 pairedDevicesForSyncManager:self];
    uint64_t v32 = [v31 allObjects];
  }
  else
  {
    if (!v20)
    {
      if (v24)
      {
        v54[0] = v11;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      }
      else
      {
        id v12 = 0;
      }
      goto LABEL_29;
    }
    v33 = [v6 pairedDevicesForSyncManager:self];
    v31 = (void *)[v33 mutableCopy];

    v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    [v31 minusSet:v34];

    uint64_t v32 = [v31 allObjects];
  }
  id v12 = (void *)v32;

LABEL_29:
  if ((v25 & 1) == 0) {

  }
  if ((v26 & 1) == 0) {
  if ((v37 & 1) == 0)
  }

LABEL_4:
  if ([v12 count])
  {
    [(DNDSModernAssertionSyncManager *)self updateDevices:v12 force:0 shouldFuzz:*((unsigned __int8 *)v49 + 24)];
  }
  else
  {
    id v13 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v53 = v5;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Skipping update as it should not require sync: result=%{public}@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v48, 8);
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 source];
  id v5 = [v4 deviceIdentifier];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if ([v3 isClientScheduled]) {
      char v7 = 1;
    }
    else {
      char v7 = [v3 isUserInitiated] ^ 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) &= v7;
    uint64_t v6 = [v3 isInternalScheduled] ^ 1;
  }

  return v6;
}

BOOL __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 source];
  id v5 = [v4 deviceIdentifier];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    int v7 = [v3 isUserInvalidated] ^ 1;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v8 + 24)) {
      LOBYTE(v7) = 0;
    }
    *(unsigned char *)(v8 + 24) = v7;
    v9 = [v3 assertion];
    if ([v9 isInternalScheduled]) {
      BOOL v6 = [v3 reason] != 1;
    }
    else {
      BOOL v6 = 1;
    }
  }
  return v6;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 source];
  id v5 = [v4 deviceIdentifier];
  if ([v5 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v6 = [v3 isInternalScheduled] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 reason] == 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 source];
    uint64_t v6 = [v5 deviceIdentifier];
    uint64_t v4 = [v6 isEqual:*(void *)(a1 + 32)];
  }
  return v4;
}

BOOL __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 reason] == 1)
  {
    id v3 = [v2 source];
    uint64_t v4 = [v3 deviceIdentifier];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 source];
  BOOL v5 = [v4 deviceIdentifier];
  if (v5)
  {
    uint64_t v6 = [v3 source];
    int v7 = [v6 deviceIdentifier];
    if ([v7 isEqual:*(void *)(a1 + 32)]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v3 isInternalScheduled] ^ 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __69__DNDSModernAssertionSyncManager_updateForModeAssertionUpdateResult___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 reason] == 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v5 = [v3 source];
    uint64_t v6 = [v5 deviceIdentifier];
    if (v6)
    {
      int v7 = [v3 source];
      uint64_t v8 = [v7 deviceIdentifier];
      uint64_t v4 = [v8 isEqual:*(void *)(a1 + 32)] ^ 1;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (void)updateForStateUpdate:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a3 reason] == 3)
  {
    uint64_t v4 = [(DNDSModernAssertionSyncManager *)self dataSource];
    BOOL v5 = [v4 currentlyActivePairedDeviceForSyncManager:self];

    if (v5)
    {
      if (([v5 supportsKettle] & 1) == 0)
      {
        v7[0] = v5;
        uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
        [(DNDSModernAssertionSyncManager *)self updateDevices:v6];
      }
    }
  }
}

- (void)updateDevices:(id)a3
{
}

- (void)forceUpdateAllDevices
{
  id v3 = [(DNDSModernAssertionSyncManager *)self dataSource];
  uint64_t v4 = [v3 pairedDevicesForSyncManager:self];
  id v5 = [v4 allObjects];

  [(DNDSModernAssertionSyncManager *)self updateDevices:v5 force:1 shouldFuzz:1];
}

- (void)updateDevices:(id)a3 force:(BOOL)a4 shouldFuzz:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_timerLock = &self->_timerLock;
  id v9 = a3;
  os_unfair_lock_lock(p_timerLock);
  if (v6) {
    self->_timerQueuedForceUpdate = 1;
  }
  [(NSMutableSet *)self->_timerQueuedDevices addObjectsFromArray:v9];

  if (!self->_timerQueuedTransaction)
  {
    int v10 = (OS_os_transaction *)os_transaction_create();
    timerQueuedTransaction = self->_timerQueuedTransaction;
    self->_timerQueuedTransaction = v10;
  }
  if (v5)
  {
    unint64_t v12 = +[DNDSIDSServerBagValues resolvedScheduledActivityUpdateFuzzMilliseconds];
    id v13 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = NSNumber;
      int v15 = v13;
      int v16 = [v14 numberWithUnsignedLongLong:v12];
      [v16 floatValue];
      v18 = [v14 numberWithDouble:v17 / 1000.0];
      *(_DWORD *)buf = 138412290;
      objc_super v30 = v18;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Delaying sync of fuzzable change by %@ seconds.", buf, 0xCu);
    }
    fuzzTimer = self->_fuzzTimer;
    dispatch_time_t v20 = dispatch_walltime(0, 1000000 * v12);
    dispatch_source_set_timer(fuzzTimer, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    unint64_t v21 = +[DNDSIDSServerBagValues resolvedActivityUpdateCoalescingSeconds];
    self->_timerCurrentDelay += v21;
    v22 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
    {
      char v23 = NSNumber;
      int v24 = v22;
      char v25 = [v23 numberWithUnsignedLongLong:v21];
      *(_DWORD *)buf = 138412290;
      objc_super v30 = v25;
      _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_INFO, "Delaying sync for %@ seconds to coalesce update.", buf, 0xCu);
    }
    char v26 = self->_fuzzTimer;
    dispatch_time_t v27 = dispatch_walltime(0, 1000000000 * v21);
    dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    if (self->_timerCurrentDelay > 60 * v21)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke;
      block[3] = &unk_1E6973540;
      block[4] = self;
      if (updateDevices_force_shouldFuzz__onceToken != -1) {
        dispatch_once(&updateDevices_force_shouldFuzz__onceToken, block);
      }
    }
  }
  os_unfair_lock_unlock(p_timerLock);
}

void __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke(uint64_t a1)
{
  id v2 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_FAULT)) {
    __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke_cold_1(a1, v2);
  }
  _DNDSRequestRadar(@"Focus detected excessive change rate.", 0, 1, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModernAssertionSyncManager.m", 469);
}

- (void)_queue_updateDevices
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Skipping sync due to server bag override.", v1, 2u);
}

- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  BOOL v11 = (DNDSSyncService *)a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(DNDSModernAssertionSyncManager *)self dataSource];
  int v15 = v14;
  if (self->_cloudSyncService != v11 || ![v14 isCloudSyncDisabledForSyncManager:self])
  {
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:]();
      }
      goto LABEL_8;
    }
    if (self->_cloudSyncService == v11)
    {
      BOOL v17 = 1;
      goto LABEL_20;
    }
    v18 = [v15 currentlyActivePairedDeviceForSyncManager:self];
    id v19 = [v18 deviceIdentifier];
    char v20 = [v19 isEqualToString:v13];

    uint64_t v21 = [v18 assertionSyncProtocolVersion];
    if (v20)
    {
      if (v21 == a5)
      {
        BOOL v17 = 1;
LABEL_19:

        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    {
      -[DNDSModernAssertionSyncManager syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:]();
    }
    BOOL v17 = 0;
    goto LABEL_19;
  }
  int v16 = DNDSLogModernAssertionSync;
  BOOL v17 = 0;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v23 = 0;
    _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Rejecting message because cloud sync is disabled.", v23, 2u);
LABEL_8:
    BOOL v17 = 0;
  }
LABEL_20:

  return v17;
}

- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_INFO, "Received message from sync service; syncService=%p, message=%{public}@, versionNumber=%lu, deviceIdentifier=%{public}@",
      buf,
      0x2Au);
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__DNDSModernAssertionSyncManager_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  v18[3] = &unk_1E6974078;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  unint64_t v21 = a5;
  id v16 = v13;
  id v17 = v12;
  dispatch_sync(queue, v18);
}

uint64_t __115__DNDSModernAssertionSyncManager_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    id v14 = NSNumber;
    int v15 = v13;
    id v16 = [v14 numberWithBool:v7];
    *(_DWORD *)buf = 134218754;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_INFO, "Sent message from sync service; syncService=%p, requestIdentifier=%{public}@, success=%@, error=%{public}@",
      buf,
      0x2Au);
  }
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __93__DNDSModernAssertionSyncManager_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke;
  v20[3] = &unk_1E6973590;
  v20[4] = self;
  id v21 = v11;
  BOOL v23 = v7;
  id v22 = v12;
  id v18 = v12;
  id v19 = v11;
  dispatch_sync(queue, v20);
}

uint64_t __93__DNDSModernAssertionSyncManager_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleDidSendRequestIdentifier:withSuccess:error:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_queue_handleMessage:(id)a3 withVersionNumber:(unint64_t)a4 fromDeviceIdentifier:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [(DNDSModernAssertionSyncManager *)self dataSource];
  id v11 = [v10 syncManager:self deviceForDeviceIdentifier:v9];

  if (v11)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFCLL) == 8)
    {
      id v12 = +[DNDSModeAssertionStore newWithSyncDictionaryRepresentation:v8];
      id v13 = (void *)[v12 mutableCopy];

      id v14 = +[DNDSModeAssertionStore messageDateForSyncDictionaryRepresentation:v8];
      if (v13)
      {
        int v15 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastReceivedStoreDate];
        id v16 = [v11 deviceIdentifier];
        id v17 = [v15 objectForKeyedSubscript:v16];
        id v18 = v17;
        if (v17)
        {
          id v19 = v17;
        }
        else
        {
          id v19 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        id v21 = v19;

        if ([v21 compare:v14] != -1)
        {
          id v22 = DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v49 = v9;
            __int16 v50 = 2114;
            id v51 = v14;
            __int16 v52 = 2114;
            id v53 = v21;
            _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Received store from %{public}@ is older (%{public}@) than the last received store (%{public}@).", buf, 0x20u);
          }
        }
        v42 = v21;
        BOOL v23 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastReceivedStoreDate];
        __int16 v24 = [v11 deviceIdentifier];
        [v23 setObject:v14 forKeyedSubscript:v24];

        id v25 = [MEMORY[0x1E4F1C9C8] date];
        [v13 sanitizeDatesForThreshold:v25];

        [v13 resolveSourcesForSyncFromPairedDevice:v11];
        __int16 v26 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
        id v27 = [v11 deviceIdentifier];
        __int16 v28 = [v26 objectForKeyedSubscript:v27];
        id v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        id v31 = v30;

        uint64_t v32 = [v13 lastUpdateDate];
        uint64_t v33 = [v32 compare:v31];

        v34 = [(DNDSModernAssertionSyncManager *)self delegate];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke;
        v43[3] = &unk_1E69746D0;
        id v35 = v13;
        id v44 = v35;
        id v36 = v11;
        id v45 = v36;
        id v14 = v14;
        id v46 = v14;
        [v34 syncManager:self performModeAssertionUpdatesWithHandler:v43];

        if (v33 == -1)
        {
          char v37 = (void *)DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            log = v37;
            v40 = [v36 deviceIdentifier];
            v38 = [v35 lastUpdateDate];
            *(_DWORD *)buf = 138543874;
            id v49 = v40;
            __int16 v50 = 2114;
            id v51 = v38;
            __int16 v52 = 2114;
            id v53 = v31;
            _os_log_impl(&dword_1D3052000, log, OS_LOG_TYPE_DEFAULT, "Incoming store from %{public}@ was older (%{public}@) than the store it replaced (%{public}@). Will re-send...", buf, 0x20u);
          }
          id v47 = v36;
          id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
          [(DNDSModernAssertionSyncManager *)self updateDevices:v39 force:1 shouldFuzz:1];
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:]();
      }
      id v14 = 0;
    }
    id v20 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
      -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:](v20);
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
    -[DNDSModernAssertionSyncManager _queue_handleMessage:withVersionNumber:fromDeviceIdentifier:]();
  }
LABEL_26:
}

uint64_t __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v49 = a1;
  uint64_t v4 = [*(id *)(a1 + 32) invalidations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v58 + 1) + 8 * i) assertion];
        id v10 = [v9 UUID];
        id v11 = [v9 details];
        id v12 = [v9 source];
        id v13 = [v9 startDate];
        id v14 = (id)[v3 takeAssertionWithUUID:v10 details:v11 source:v12 startDate:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v6);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  int v15 = [*(id *)(v49 + 32) invalidationRequests];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (id)[v3 invalidateAssertionsForRequest:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v17);
  }

  id v21 = (void *)MEMORY[0x1E4F5F600];
  id v22 = [*(id *)(v49 + 40) deviceIdentifier];
  uint64_t v23 = [v21 predicateForModeAssertionsWithDeviceIdentifier:v22];

  uint64_t v48 = (void *)v23;
  id v47 = [v3 modeAssertionsMatchingPredicate:v23];
  id v46 = objc_msgSend(v47, "bs_mapNoNulls:", &__block_literal_global_56);
  __int16 v24 = (void *)[v46 mutableCopy];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v25 = [*(id *)(v49 + 32) assertions];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        id v31 = [v30 UUID];
        uint64_t v32 = [v30 details];
        uint64_t v33 = [v30 source];
        v34 = [v30 startDate];
        id v35 = (id)[v3 takeAssertionWithUUID:v31 details:v32 source:v33 startDate:v34];

        [v24 removeObject:v31];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v27);
  }

  uint64_t v36 = [v24 count];
  if (v36)
  {
    uint64_t v37 = v36;
    v38 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v63 = v37;
      __int16 v64 = 2114;
      v65 = v24;
      _os_log_impl(&dword_1D3052000, v38, OS_LOG_TYPE_DEFAULT, "%lu assertion(s) were abandoned by the remote device, will invalidate: UUIDs=%{public}@", buf, 0x16u);
    }
    id v39 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:v24];
    id v40 = objc_alloc(MEMORY[0x1E4F5F650]);
    id v41 = [*(id *)(v49 + 40) deviceIdentifier];
    v42 = (void *)[v40 initWithClientIdentifier:@"com.apple.donotdisturb.sync" deviceIdentifier:v41];

    id v43 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v39 requestDate:*(void *)(v49 + 48) details:0 source:v42 reason:0 reasonOverride:0];
    id v44 = (id)[v3 invalidateAssertionsForRequest:v43];
  }
  return 1;
}

uint64_t __94__DNDSModernAssertionSyncManager__queue_handleMessage_withVersionNumber_fromDeviceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)_queue_sendStateSnapshotToPairedDevices:(id)a3 force:(BOOL)a4
{
  BOOL v39 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v6 = a3;
  dispatch_assert_queue_V2(queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [WeakRetained pairedDevicesForSyncManager:self];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke;
  void v54[3] = &unk_1E69746F8;
  id v36 = v8;
  id v55 = v36;
  id v9 = objc_msgSend(v6, "bs_filter:", v54);

  uint64_t v37 = [(DNDSModernAssertionSyncManager *)self delegate];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  long long v51 = __Block_byref_object_copy__9;
  long long v52 = __Block_byref_object_dispose__9;
  id v53 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_65;
  v47[3] = &unk_1E6974720;
  v47[4] = &v48;
  [v37 syncManager:self performModeAssertionUpdatesWithHandler:v47];
  id v10 = DNDSLogModernAssertionSync;
  BOOL v11 = os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    long long v57 = v9;
    id v12 = "Sending forced update to devices: %@";
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    long long v57 = v9;
    id v12 = "Sending update to devices: %@";
  }
  _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:
  id v41 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v62 count:16];
  if (v13)
  {
    uint64_t v40 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v16 = (void *)[(id)v49[5] mutableCopy];
        uint64_t v17 = (id)DNDSLogModernAssertionSync;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = [v15 deviceIdentifier];
          *(_DWORD *)buf = 138412546;
          long long v57 = v18;
          __int16 v58 = 2112;
          long long v59 = v16;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_INFO, "Generating message for sync to %@: %@", buf, 0x16u);
        }
        [v16 filterForSyncToPairedDevice:v15 clientDetailsProvider:self->_clientDetailsProvider];
        [v16 unresolveSourcesForSyncToPairedDevice:v15];
        id v19 = [(DNDSModernAssertionSyncManager *)self dataSource];
        [v16 downgradeAssertionsIfNeededForSyncToPairedDevice:v15 dataSource:v19 syncManager:self];

        id v20 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
        id v21 = [v15 deviceIdentifier];
        id v22 = [v20 objectForKeyedSubscript:v21];
        uint64_t v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        id v25 = v24;

        uint64_t v26 = [v16 lastUpdateDate];
        if ([v25 compare:v26] == -1 || v39)
        {
          uint64_t v28 = -[_DNDSSyncMessageGroup initWithServiceType:protocolVersion:store:]([_DNDSSyncMessageGroup alloc], "initWithServiceType:protocolVersion:store:", [v15 syncServiceType], objc_msgSend(v15, "assertionSyncProtocolVersion"), v16);
          id v29 = [v41 objectForKeyedSubscript:v28];
          BOOL v30 = v29 == 0;

          if (v30)
          {
            id v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
            [v41 setObject:v31 forKeyedSubscript:v28];
          }
          uint64_t v32 = [v41 objectForKeyedSubscript:v28];
          [v32 addObject:v15];
        }
        else
        {
          uint64_t v27 = DNDSLogModernAssertionSync;
          if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            long long v57 = v15;
            __int16 v58 = 2114;
            long long v59 = v26;
            __int16 v60 = 2114;
            long long v61 = v25;
            _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "Skipping sending store to %@ as it is the same as or earlier than the previous (current: %{public}@; previ"
              "ous: %{public}@)",
              buf,
              0x20u);
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v62 count:16];
    }
    while (v13);
  }

  if ([v41 count])
  {
    uint64_t v33 = [v41 allValues];
    v34 = objc_msgSend(v33, "bs_flatten");

    id v35 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v57 = v34;
      _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Preparing to sync to %@", buf, 0xCu);
    }
    [v37 syncManager:self prepareForSyncToDevices:v34];
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_69;
  v42[3] = &unk_1E69747B8;
  void v42[4] = self;
  [v41 enumerateKeysAndObjectsUsingBlock:v42];
  if ([v41 count]) {
    [(DNDSModernAssertionSyncManager *)self _saveMetadataToBackingStore];
  }

  _Block_object_dispose(&v48, 8);
}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = [a2 store];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_72);
  id v8 = [v6 setWithArray:v7];

  id v9 = [v5 store];
  id v10 = (void *)[v9 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  [v10 updateConfigurationModificationDatesWithDataSource:WeakRetained syncManager:*(void *)(a1 + 32)];

  id v12 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = [v10 syncDictionaryRepresentationWithDate:v12 messageUUID:v13];

  int v15 = (void *)DNDSLogModernAssertionSync;
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = DNDSStringFromSyncServiceType([v5 serviceType]);
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "protocolVersion"));
      *(_DWORD *)buf = 138543874;
      id v31 = v17;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Syncing on %{public}@ version %@: %@", buf, 0x20u);
    }
    uint64_t v19 = [v5 serviceType];
    if (v19 == 1)
    {
      uint64_t v20 = 24;
    }
    else
    {
      if (v19 != 2)
      {
        id v21 = 0;
        goto LABEL_12;
      }
      uint64_t v20 = 32;
    }
    id v21 = *(id *)(*(void *)(a1 + 32) + v20);
LABEL_12:
    uint64_t v22 = [v5 protocolVersion];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_74;
    v25[3] = &unk_1E6974790;
    id v26 = v5;
    id v23 = v8;
    uint64_t v24 = *(void *)(a1 + 32);
    id v27 = v23;
    uint64_t v28 = v24;
    id v29 = v10;
    [v21 sendMessage:v14 withVersionNumber:v22 messageType:0 toDestinations:v23 identifyingCompletionHandler:v25];

    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
    __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_69_cold_1();
  }
LABEL_13:
}

uint64_t __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deviceIdentifier];
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_74(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 48) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_75;
    block[3] = &unk_1E6974768;
    id v15 = *(id *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    id v16 = v10;
    uint64_t v17 = v11;
    id v18 = v12;
    id v19 = *(id *)(a1 + 40);
    dispatch_sync(v9, block);
  }
  else
  {
    uint64_t v13 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
      __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_74_cold_1(a1, v13, (uint64_t)v8);
    }
  }
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_75(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)DNDSLogModernAssertionSync;
  if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = DNDSStringFromSyncServiceType([v3 serviceType]);
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_INFO, "Sending %{public}@ assertions pending with identifier %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [_DNDSPendingMessageRecipients alloc];
  id v8 = [*(id *)(a1 + 56) lastUpdateDate];
  id v9 = [(_DNDSPendingMessageRecipients *)v7 initWithLastUpdateDate:v8 deviceIdentifiers:*(void *)(a1 + 64)];
  id v10 = [*(id *)(*(void *)(a1 + 48) + 48) pendingLastSentStoreDate];
  [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)_queue_handleDidSendRequestIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata pendingLastSentStoreDate];
  int v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    id v12 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata pendingLastSentStoreDate];
    [v12 setObject:0 forKeyedSubscript:v8];

    if (v6)
    {
      id v39 = v9;
      id v40 = v8;
      __int16 v13 = [v11 lastUpdateDate];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      obuint64_t j = [v11 deviceIdentifiers];
      uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (!v14) {
        goto LABEL_23;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v43;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v19 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
          uint64_t v20 = [v19 objectForKeyedSubscript:v18];
          id v21 = v20;
          if (v20)
          {
            id v22 = v20;
          }
          else
          {
            id v22 = [MEMORY[0x1E4F1C9C8] distantPast];
          }
          id v23 = v22;

          uint64_t v24 = [v23 compare:v13];
          switch(v24)
          {
            case 1:
              goto LABEL_18;
            case 0:
              id v29 = DNDSLogModernAssertionSync;
              if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                id v47 = v18;
                __int16 v48 = 2114;
                id v49 = v40;
                __int16 v50 = 2114;
                id v51 = v13;
                __int16 v52 = 2114;
                id v53 = v23;
                _os_log_impl(&dword_1D3052000, v29, OS_LOG_TYPE_INFO, "Leaving lastUpdateDate unchanged for %{public}@ (%{public}@). Got %{public}@ and already have %{public}@", buf, 0x2Au);
              }
LABEL_18:
              uint64_t v30 = DNDSLogModernAssertionSync;
              if (!os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO)) {
                break;
              }
              *(_DWORD *)buf = 138544130;
              id v47 = v18;
              __int16 v48 = 2114;
              id v49 = v40;
              __int16 v50 = 2114;
              id v51 = v13;
              __int16 v52 = 2114;
              id v53 = v23;
              id v26 = v30;
              id v27 = "Rewinding lastUpdateDate for %{public}@ (%{public}@). Got %{public}@ but already have %{public}@";
              uint32_t v28 = 42;
LABEL_20:
              _os_log_impl(&dword_1D3052000, v26, OS_LOG_TYPE_INFO, v27, buf, v28);
              break;
            case -1:
              uint64_t v25 = DNDSLogModernAssertionSync;
              if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                id v47 = v18;
                __int16 v48 = 2114;
                id v49 = v23;
                __int16 v50 = 2114;
                id v51 = v13;
                id v26 = v25;
                id v27 = "Bumping lastUpdateDate for %{public}@ from %{public}@ to %{public}@";
                uint32_t v28 = 32;
                goto LABEL_20;
              }
              break;
          }
          id v31 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
          [v31 setObject:v13 forKeyedSubscript:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (!v15)
        {
LABEL_23:

          [(DNDSModernAssertionSyncManager *)self _saveMetadataToBackingStore];
          id v8 = v40;
          id v9 = v39;
          goto LABEL_28;
        }
      }
    }
    uint64_t v36 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v36;
      v38 = [v11 deviceIdentifiers];
      *(_DWORD *)buf = 138543874;
      id v47 = v8;
      __int16 v48 = 2114;
      id v49 = v9;
      __int16 v50 = 2114;
      id v51 = v38;
      _os_log_error_impl(&dword_1D3052000, v37, OS_LOG_TYPE_ERROR, "Send request %{public}@ failed with error %{public}@. Recipients: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v32 = (void *)DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = NSNumber;
      __int16 v34 = v32;
      id v35 = [v33 numberWithBool:v6];
      *(_DWORD *)buf = 138543874;
      id v47 = v8;
      __int16 v48 = 2112;
      id v49 = v35;
      __int16 v50 = 2114;
      id v51 = v9;
      _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, "Got send results from unrecognized identifier %{public}@. success: %@, error: %{public}@", buf, 0x20u);
    }
  }
LABEL_28:
}

- (void)_loadMetadataFromBackingStore
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load load assertion sync metadata store, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (BOOL)_maintainMetadataBackingStore
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastReceivedStoreDate];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke;
  v44[3] = &unk_1E69747E0;
  id v6 = v3;
  id v45 = v6;
  id v7 = v4;
  id v46 = v7;
  objc_msgSend(v5, "bs_each:", v44);

  uint64_t v8 = [v7 count];
  BOOL v35 = v8 != 0;
  if (v8)
  {
    id v9 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Retiring device(s) from last seen metadata: %@", buf, 0xCu);
    }
    id v10 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastReceivedStoreDate];
    [v10 removeObjectsForKeys:v7];
  }
  int v11 = [MEMORY[0x1E4F1CA48] array];

  id v12 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke_83;
  v41[3] = &unk_1E69747E0;
  id v36 = v6;
  id v42 = v36;
  id v13 = v11;
  id v43 = v13;
  objc_msgSend(v12, "bs_each:", v41);

  __int16 v34 = v13;
  if ([v13 count])
  {
    uint64_t v14 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v13;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Retiring device(s) from last sent metadata: %@", buf, 0xCu);
    }
    uint64_t v15 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata lastSentStoreDate];
    [v15 removeObjectsForKeys:v13];

    BOOL v35 = 1;
  }
  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v17 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata pendingLastSentStoreDate];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v23 = self;
        uint64_t v24 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata pendingLastSentStoreDate];
        uint64_t v25 = [v24 objectForKeyedSubscript:v22];
        id v26 = [v25 lastUpdateDate];
        [v36 timeIntervalSinceDate:v26];
        double v28 = v27;

        if (v28 > 86400.0) {
          [v16 addObject:v22];
        }
        self = v23;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v19);
  }

  id v29 = v16;
  BOOL v30 = v35;
  if ([v16 count])
  {
    id v31 = DNDSLogModernAssertionSync;
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v16;
      _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "Retiring pending message(s) from metadata: %@", buf, 0xCu);
    }
    __int16 v32 = [(DNDSModernAssertionSyncMetadataStore *)self->_metadata pendingLastSentStoreDate];
    [v32 removeObjectsForKeys:v29];

    BOOL v30 = 1;
  }

  return v30;
}

void __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceDate:a3];
  if (v5 > 3024000.0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __63__DNDSModernAssertionSyncManager__maintainMetadataBackingStore__block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceDate:a3];
  if (v5 > 3024000.0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (BOOL)_saveMetadataToBackingStore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  metadata = self->_metadata;
  metadataBackingStore = self->_metadataBackingStore;
  id v12 = 0;
  uint64_t v4 = [(DNDSBackingStore *)metadataBackingStore writeRecord:metadata error:&v12];
  id v5 = v12;
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v10 = DNDSLogModernAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v5;
        id v7 = "Failed to write assertion sync metadata store, but error can be ignored; error=%{public}@";
        uint64_t v8 = v10;
        uint32_t v9 = 12;
        goto LABEL_11;
      }
    }
    else if (v4 == 2)
    {
      uint64_t v6 = DNDSLogModernAssertionSync;
      if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v7 = "Wrote out assertion sync metadata store.";
        uint64_t v8 = v6;
        uint32_t v9 = 2;
LABEL_11:
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModernAssertionSync, OS_LOG_TYPE_ERROR)) {
      -[DNDSModernAssertionSyncManager _saveMetadataToBackingStore]();
    }
    _DNDSRequestRadar(@"Failed to write sync metadata", v5, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModernAssertionSyncManager.m", 878);
  }

  return v4 == 2;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.AssertionSync";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", 3, a4);
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __66__DNDSModernAssertionSyncManager_sysdiagnoseDataForDate_redacted___block_invoke;
  id v13 = &unk_1E69735B8;
  id v14 = self;
  id v15 = v5;
  id v7 = v5;
  dispatch_sync(queue, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __66__DNDSModernAssertionSyncManager_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) lastReceivedStoreDate];
  uint64_t v42 = v1;
  if ([v2 count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x1E4F28C10];
          uint64_t v11 = [v4 objectForKeyedSubscript:v9];
          id v12 = [v10 localizedStringFromDate:v11 dateStyle:1 timeStyle:1];
          id v13 = [NSString stringWithFormat:@"device %@", v9];
          [v3 setObject:v12 forKeyedSubscript:v13];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v6);
    }

    id v14 = (void *)[v3 copy];
    uint64_t v1 = v42;
    [*(id *)(v42 + 40) setObject:v14 forKeyedSubscript:@"last-received-dates"];
  }
  id v15 = [*(id *)(*(void *)(v1 + 32) + 48) lastSentStoreDate];

  if ([v15 count])
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v40 = v15;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          id v23 = (void *)MEMORY[0x1E4F28C10];
          uint64_t v24 = [v17 objectForKeyedSubscript:v22];
          uint64_t v25 = [v23 localizedStringFromDate:v24 dateStyle:1 timeStyle:1];
          id v26 = [NSString stringWithFormat:@"device %@", v22];
          [v16 setObject:v25 forKeyedSubscript:v26];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v19);
    }

    double v27 = (void *)[v16 copy];
    uint64_t v1 = v42;
    [*(id *)(v42 + 40) setObject:v27 forKeyedSubscript:@"last-sent-dates"];

    id v15 = v40;
  }
  double v28 = [*(id *)(*(void *)(v1 + 32) + 48) pendingLastSentStoreDate];

  if ([v28 count])
  {
    id v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v41 = v28;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * k);
          id v36 = [v30 objectForKeyedSubscript:v35];
          long long v37 = [v36 description];
          long long v38 = [NSString stringWithFormat:@"message %@", v35];
          [v29 setObject:v37 forKeyedSubscript:v38];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v32);
    }

    long long v39 = (void *)[v29 copy];
    [*(id *)(v42 + 40) setObject:v39 forKeyedSubscript:@"pending-messages"];

    double v28 = v41;
  }
}

- (DNDSAssertionSyncManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSAssertionSyncManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSAssertionSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSAssertionSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_timerQueuedTransaction, 0);
  objc_storeStrong((id *)&self->_timerQueuedDevices, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_metadataBackingStore, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_cloudSyncService, 0);
  objc_storeStrong((id *)&self->_localSyncService, 0);
  objc_storeStrong((id *)&self->_fuzzTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__DNDSModernAssertionSyncManager_updateDevices_force_shouldFuzz___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 88);
  id v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedLongLong:v3];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1D3052000, v4, OS_LOG_TYPE_FAULT, "Coalescing timer has delayed sync for %@ seconds. This may indicate a rogue trigger.", v6, 0xCu);
}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1D3052000, v0, OS_LOG_TYPE_ERROR, "*** PLEASE UPDATE DEVICES *** Rejecting incoming message as the version number is not supported by this sync protocol: versionNumber=%lu, currentVersionNumber=%lu", v1, 0x16u);
}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Rejecting incoming message as it is not from the active device: deviceIdentifier=%{public}@, pairedDevice=%{public}@", v2, 0x16u);
}

- (void)syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Rejecting incoming message with unhandled messageType: %@", v2, v3, v4, v5, v6);
}

- (void)_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to find paired device for device identifier %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_handleMessage:(os_log_t)log withVersionNumber:fromDeviceIdentifier:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Error decoding the assertion store from sync message", v1, 2u);
}

- (void)_queue_handleMessage:withVersionNumber:fromDeviceIdentifier:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1D3052000, v0, OS_LOG_TYPE_ERROR, "Received impossible version number: versionNumber=%lu, currentVersionNumber=%lu", v1, 0x16u);
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unable to generate store message for %@", v2, v3, v4, v5, v6);
}

void __80__DNDSModernAssertionSyncManager__queue_sendStateSnapshotToPairedDevices_force___block_invoke_74_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = DNDSStringFromSyncServiceType([v4 serviceType]);
  OUTLINED_FUNCTION_5();
  __int16 v9 = 2112;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Error sending %{public}@ assertions to %@: error=%{public}@", v8, 0x20u);
}

- (void)_saveMetadataToBackingStore
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to write assertion sync metadata store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end