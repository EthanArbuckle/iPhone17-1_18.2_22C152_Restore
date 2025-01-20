@interface DNDSIDSSyncEngine
- (BOOL)_queue_cancelInflightExpirationTimer;
- (BOOL)_queue_cancelRetryTimer;
- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7;
- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5;
- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5 role:(unint64_t)a6 syncState:(unint64_t)a7 inflightExpirationTime:(unint64_t)a8;
- (NSString)sysdiagnoseDataIdentifier;
- (double)_queue_earliestExpirationTimeSinceNowForInflightMetadata;
- (id)_queue_dataSourceForZone:(id)a3;
- (id)inflightMetadata;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)pairSyncState;
- (void)_queue_handleAckMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_handleMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_handleReplaceMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_handleResyncMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_handleUnlockMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_handleUpdateMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4;
- (void)_queue_removeAllInflightMetadata;
- (void)_queue_removeAllInflightMetadataWithExpirationDate:(id)a3;
- (void)_queue_resetRetryTimer;
- (void)_queue_restartInflightExpirationTimer;
- (void)_queue_sendAckWithMetadata:(id)a3 forAction:(id)a4 toDeviceWithIdentifier:(id)a5;
- (void)_queue_sendModifiedRecordIDs:(id)a3 deletedRecordIDs:(id)a4 toDeviceWithIdentifier:(id)a5;
- (void)_queue_sendResyncMessageToDeviceWithIdentifier:(id)a3;
- (void)_queue_sendUnlockMessageToDeviceWithIdentifier:(id)a3;
- (void)_queue_startInflightExpirationTimer;
- (void)_queue_startRetryTimer;
- (void)_queue_syncDataSourcesToDeviceWithIdentifier:(id)a3;
- (void)_queue_validate;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)setDataSource:(id)a3 forZone:(id)a4;
- (void)setDidFireMetadataExpirationTimer:(id)a3;
- (void)setDidReceiveUnlockMessage:(id)a3;
- (void)setPairedDevice:(id)a3 syncEnabled:(BOOL)a4;
- (void)sync;
- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7;
- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)validate;
@end

@implementation DNDSIDSSyncEngine

- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5
{
  return [(DNDSIDSSyncEngine *)self initWithMetadataStore:a3 syncService:a4 keybag:a5 role:0 syncState:3 inflightExpirationTime:86400];
}

- (DNDSIDSSyncEngine)initWithMetadataStore:(id)a3 syncService:(id)a4 keybag:(id)a5 role:(unint64_t)a6 syncState:(unint64_t)a7 inflightExpirationTime:(unint64_t)a8
{
  id v33 = a3;
  id v15 = a4;
  id v16 = a5;
  v35.receiver = self;
  v35.super_class = (Class)DNDSIDSSyncEngine;
  v17 = [(DNDSIDSSyncEngine *)&v35 init];
  if (v17)
  {
    if ((a7 & 2) != 0)
    {
      v18 = DNDSLogIDSSyncEngine;
      BOOL v20 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
      if (a7)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          v19 = "IDS sync engine is available";
          goto LABEL_10;
        }
      }
      else if (v20)
      {
        *(_WORD *)buf = 0;
        v19 = "IDS sync engine is disabled because of unsupported device";
        goto LABEL_10;
      }
    }
    else
    {
      v18 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "IDS sync engine is disabled because of feature flag";
LABEL_10:
        _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      }
    }
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.donotdisturb.server.DNDSIDSSyncEngine", v21);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v17->_role = a6;
    v17->_syncState = a7;
    v17->_retriesAvailable = 3;
    uint64_t v24 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    sourcesByZone = v17->_sourcesByZone;
    v17->_sourcesByZone = (NSMapTable *)v24;

    objc_storeStrong((id *)&v17->_metadataStore, a3);
    v17->_inflightExpirationTime = a8;
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    inflightDateByRequestIdentifier = v17->_inflightDateByRequestIdentifier;
    v17->_inflightDateByRequestIdentifier = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    inflightMetadataByRequestIdentifier = v17->_inflightMetadataByRequestIdentifier;
    v17->_inflightMetadataByRequestIdentifier = (NSMutableDictionary *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
    inflightMetadata = v17->_inflightMetadata;
    v17->_inflightMetadata = (NSMutableSet *)v30;

    objc_storeStrong((id *)&v17->_syncService, a4);
    [(DNDSSyncService *)v17->_syncService setDelegate:v17];
    objc_storeStrong((id *)&v17->_keybag, a5);
    [(DNDSSyncService *)v17->_syncService resume];
    [v16 addObserver:v17];
    [(DNDSIDSSyncEngine *)v17 validate];
    DNDSRegisterSysdiagnoseDataProvider(v17);
  }

  return v17;
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__DNDSIDSSyncEngine_addRecordIDsToSave_recordIDsToDelete___block_invoke;
  block[3] = &unk_1E69734A0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __58__DNDSIDSSyncEngine_addRecordIDsToSave_recordIDsToDelete___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((~*(_DWORD *)(*(void *)(a1 + 32) + 32) & 7) != 0)
  {
    v3 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 134349056;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring records as the sync engine is disabled: %{public}llu", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(*(void *)(a1 + 32) + 40) setDeletedAtDate:v5 forRecordIDs:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 40) setLastModifiedDate:v5 forRecordIDs:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_resetRetryTimer");
    v2 = [*(id *)(*(void *)(a1 + 32) + 24) deviceIdentifier];
    if (v2) {
      objc_msgSend(*(id *)(a1 + 32), "_queue_syncDataSourcesToDeviceWithIdentifier:", v2);
    }
  }
}

- (void)setDataSource:(id)a3 forZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DNDSIDSSyncEngine_setDataSource_forZone___block_invoke;
  block[3] = &unk_1E69734A0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __43__DNDSIDSSyncEngine_setDataSource_forZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v2)
  {
    id v5 = [v3 objectForKey:v4];
    if (!v5 || (uint64_t v6 = *(void *)(a1 + 32), v5, !v6))
    {
      [*(id *)(*(void *)(a1 + 40) + 8) setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
      objc_msgSend(*(id *)(a1 + 40), "_queue_resetRetryTimer");
    }
  }
  else
  {
    [v3 removeObjectForKey:v4];
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) deviceIdentifier];
  uint64_t v8 = v7;
  if (*(void *)(a1 + 32) && v7)
  {
    uint64_t v10 = v7;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_queue_syncDataSourcesToDeviceWithIdentifier:", v7);
    uint64_t v8 = v10;
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

- (void)setPairedDevice:(id)a3 syncEnabled:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DNDSIDSSyncEngine_setPairedDevice_syncEnabled___block_invoke;
  block[3] = &unk_1E69734C8;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __49__DNDSIDSSyncEngine_setPairedDevice_syncEnabled___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = (*(_DWORD *)(*(void *)(a1 + 32) + 32) >> 2) & 1;
  if (v3 != v2)
  {
    uint64_t v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v5 = "enabled";
      }
      else {
        id v5 = "disabled";
      }
      int v27 = 136446210;
      uint64_t v28 = v5;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "IDS sync engine changed to %{public}s", (uint8_t *)&v27, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(*(void *)(a1 + 32) + 32) & 0xFFFFFFFFFFFFFFFBLL | (4 * *(unsigned __int8 *)(a1 + 48));
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if ((~*(_DWORD *)(v6 + 32) & 3) != 0)
  {
    id v9 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(const char **)(*(void *)(a1 + 32) + 32);
      int v27 = 134349056;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring paired device/enabled change as the sync engine is not available: %{public}llu", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = 0;
    goto LABEL_33;
  }
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(v6 + 24);
  if (v7 != v8 && (!v7 || !v8 || (objc_msgSend(v7, "isEqual:") & 1) == 0))
  {
    id v13 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(*(void *)(a1 + 32) + 24);
      id v15 = v13;
      id v16 = [v14 deviceIdentifier];
      v17 = [*(id *)(a1 + 40) deviceIdentifier];
      int v27 = 138543618;
      uint64_t v28 = v16;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Paired device changed from %{public}@ to %{public}@", (uint8_t *)&v27, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_resetRetryTimer");
    v18 = *(void **)(a1 + 40);
    if (v18
      && (unint64_t)[v18 configurationSyncProtocolVersion] >= 0xB
      && (unint64_t)[*(id *)(a1 + 40) configurationSyncProtocolVersion] <= 0xC
      && [*(id *)(a1 + 40) syncServiceType] == 1)
    {
      uint64_t v19 = [*(id *)(a1 + 40) copy];
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(v20 + 24);
      *(void *)(v20 + 24) = v19;
    }
    else
    {
      dispatch_queue_t v22 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(const char **)(a1 + 40);
        int v27 = 138412290;
        uint64_t v28 = v23;
        _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring paired device not supported by IDS Sync Engine: %@", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v24 = *(void *)(a1 + 32);
      v21 = *(void **)(v24 + 24);
      *(void *)(v24 + 24) = 0;
    }

    goto LABEL_29;
  }
  if (v3 != v2)
  {
LABEL_29:
    objc_msgSend(*(id *)(a1 + 32), "_queue_validate");
    id v12 = [*(id *)(a1 + 40) deviceIdentifier];
    if (v12)
    {
      char v25 = [*(id *)(*(void *)(a1 + 32) + 40) hasPerformedInitialSyncForPairedDeviceIdentifier:v12];
      uint64_t v26 = *(void **)(a1 + 32);
      if (v25) {
        objc_msgSend(v26, "_queue_syncDataSourcesToDeviceWithIdentifier:", v12);
      }
      else {
        objc_msgSend(v26, "_queue_sendResyncMessageToDeviceWithIdentifier:", v12);
      }
    }
LABEL_33:
  }
}

- (void)setDidReceiveUnlockMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__DNDSIDSSyncEngine_setDidReceiveUnlockMessage___block_invoke;
  v7[3] = &unk_1E69734F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__DNDSIDSSyncEngine_setDidReceiveUnlockMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 128);
  *(void *)(v3 + 128) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setDidFireMetadataExpirationTimer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__DNDSIDSSyncEngine_setDidFireMetadataExpirationTimer___block_invoke;
  v7[3] = &unk_1E69734F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __55__DNDSIDSSyncEngine_setDidFireMetadataExpirationTimer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 136) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (unint64_t)pairSyncState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__DNDSIDSSyncEngine_pairSyncState__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DNDSIDSSyncEngine_pairSyncState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)validate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__DNDSIDSSyncEngine_validate__block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__DNDSIDSSyncEngine_validate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_validate");
}

- (void)sync
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__DNDSIDSSyncEngine_sync__block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __25__DNDSIDSSyncEngine_sync__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((~*(_DWORD *)(v1 + 32) & 7) == 0
    && *(void *)(v1 + 24)
    && [*(id *)(v1 + 48) hasUnlockedSinceBoot])
  {
    unint64_t v3 = *(id **)(a1 + 32);
    id v4 = [v3[3] deviceIdentifier];
    objc_msgSend(v3, "_queue_syncDataSourcesToDeviceWithIdentifier:", v4);
  }
}

- (id)inflightMetadata
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__DNDSIDSSyncEngine_inflightMetadata__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __37__DNDSIDSSyncEngine_inflightMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)syncService:(id)a3 didReceiveMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  block[3] = &unk_1E69734A0;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_sync(queue, block);
}

void __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (_DWORD *)a1[4];
  if ((~v2[8] & 7) != 0)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
      __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1();
    }
  }
  else
  {
    objc_msgSend(v2, "_queue_handleMessage:fromPairedDeviceIdentifier:", a1[5], a1[6]);
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[6];
    objc_msgSend(v3, "_queue_syncDataSourcesToDeviceWithIdentifier:", v4);
  }
}

- (BOOL)syncService:(id)a3 shouldAcceptIncomingMessage:(id)a4 withVersionNumber:(unint64_t)a5 messageType:(id)a6 fromDeviceIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke;
  v19[3] = &unk_1E6973568;
  id v20 = v11;
  v21 = self;
  id v22 = v12;
  id v23 = v13;
  uint64_t v24 = &v26;
  unint64_t v25 = a5;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_sync(queue, v19);
  LOBYTE(queue) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)queue;
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16)
    && [*(id *)(a1 + 48) isEqualToString:@"syncEngine"])
  {
    if ((~*(_DWORD *)(*(void *)v1 + 32) & 7) != 0)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
        __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_3();
      }
    }
    else
    {
      uint64_t v3 = [*(id *)(*(void *)v1 + 24) deviceIdentifier];
      char v4 = [v3 isEqualToString:*(void *)(a1 + 56)];

      if (v4)
      {
        if ((unint64_t)(*(void *)(a1 + 72) - 13) > 0xFFFFFFFFFFFFFFFDLL)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
        {
          __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
      {
        __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_2();
      }
    }
  }
}

- (void)syncService:(id)a3 didSendWithRequestIdentifier:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke;
  v14[3] = &unk_1E6973590;
  BOOL v17 = a5;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_sync(queue, v14);
}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v1 = *(id **)(a1 + 32);
  if ((~*((_DWORD *)v1 + 8) & 7) != 0)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
      __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_2();
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
        __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_1();
      }
      objc_msgSend(*v2, "_queue_startRetryTimer");
      uint64_t v1 = (id *)*v2;
    }
    char v4 = [v1[12] objectForKeyedSubscript:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 112) minusSet:v4];
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_restartInflightExpirationTimer");
    id v5 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [v4 count];
      uint64_t v8 = [*((id *)*v2 + 14) count];
      int v13 = 134349312;
      uint64_t v14 = v7;
      __int16 v15 = 2050;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Removed %{public}llu inflight records; %{public}llu remaining",
        (uint8_t *)&v13,
        0x16u);
    }
    id v9 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)*((void *)*v2 + 12);
      id v11 = v9;
      uint64_t v12 = [v10 count];
      int v13 = 134349056;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "%{public}llu outstanding request identifiers", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__DNDSIDSSyncEngine_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __52__DNDSIDSSyncEngine_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((~*(_DWORD *)(v1 + 32) & 7) == 0)
  {
    uint64_t v3 = *(void **)(v1 + 24);
    if (v3)
    {
      char v4 = [v3 deviceIdentifier];
      objc_msgSend((id)v1, "_queue_sendUnlockMessageToDeviceWithIdentifier:", v4);

      id v5 = DNDSLogIDSSyncEngine;
      if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Sync because keybag is unlocked", buf, 2u);
      }
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      LOBYTE(v6) = [v6 isValidAtDate:v7];

      if ((v6 & 1) == 0)
      {
        uint64_t v8 = DNDSLogIDSSyncEngine;
        if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Metadata store is invalid; purging", v11, 2u);
        }
        [*(id *)(*(void *)(a1 + 32) + 40) purge];
      }
      id v9 = *(id **)(a1 + 32);
      id v10 = [v9[3] deviceIdentifier];
      objc_msgSend(v9, "_queue_syncDataSourcesToDeviceWithIdentifier:", v10);
    }
  }
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.DNDSIDSSyncEngine";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__DNDSIDSSyncEngine_sysdiagnoseDataForDate_redacted___block_invoke;
  v10[3] = &unk_1E69735B8;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = self;
  dispatch_sync(queue, v10);
  id v8 = v7;

  return v8;
}

void __53__DNDSIDSSyncEngine_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 8) dictionaryRepresentation];
  uint64_t v3 = [v2 allKeys];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"zones"];

  char v4 = [*(id *)(*(void *)(a1 + 40) + 24) deviceIdentifier];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"pairedDevice"];

  id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 32)];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"syncState"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 80)];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"retriesAvailable"];

  id v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 40) + 88)];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"inflightExpirationTime"];

  id v8 = [*(id *)(*(void *)(a1 + 40) + 112) description];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"inflightMetadata"];

  id v9 = [*(id *)(*(void *)(a1 + 40) + 96) description];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"inflightMetadataByRequestIdentifier"];

  id v10 = [*(id *)(*(void *)(a1 + 40) + 104) description];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"inflightDateByRequestIdentifier"];

  id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 120)];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"role"];
}

- (id)_queue_dataSourceForZone:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(NSMapTable *)self->_sourcesByZone objectForKey:v5];

  return v6;
}

- (void)_queue_syncDataSourcesToDeviceWithIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    uint64_t v20 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v21 = "Will not sync because keybag is locked";
    goto LABEL_18;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    uint64_t v20 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v21 = "Will not sync because sync is inactive";
LABEL_18:
    id v22 = v20;
LABEL_19:
    _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_20;
  }
  id v5 = DNDSLogIDSSyncEngine;
  BOOL v6 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v6) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v21 = "Will not sync because pairedDeviceIdentifier is nil";
    id v22 = v5;
    goto LABEL_19;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Performing sync for all data sources", buf, 2u);
  }
  id v23 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore modifiedRecordIDsForPairedDeviceIdentifier:v4];
  id v7 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore deletedRecordIDsForPairedDeviceIdentifier:v4];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = self->_sourcesByZone;
  uint64_t v10 = [(NSMapTable *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(NSMapTable *)self->_sourcesByZone objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        __int16 v15 = [v14 recordIDsForIDSSyncEngine:self];
        [v8 addObjectsFromArray:v15];
      }
      uint64_t v11 = [(NSMapTable *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore unknownRecordIDsInRecordIDs:v8];
  metadataStore = self->_metadataStore;
  v18 = [MEMORY[0x1E4F1C9C8] date];
  [(DNDSIDSSyncEngineMetadataStoring *)metadataStore setLastModifiedDate:v18 forRecordIDs:v16];

  uint64_t v19 = [v16 arrayByAddingObjectsFromArray:v23];
  [(DNDSIDSSyncEngine *)self _queue_sendModifiedRecordIDs:v19 deletedRecordIDs:v7 toDeviceWithIdentifier:v4];

LABEL_20:
}

- (void)_queue_sendAckWithMetadata:(id)a3 forAction:(id)a4 toDeviceWithIdentifier:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    char v29 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v30 = "Will not send ack because keybag is locked";
LABEL_18:
    _os_log_impl(&dword_1D3052000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_19;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    char v29 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v30 = "Will not send ack because sync is inactive";
    goto LABEL_18;
  }
  uint64_t v11 = DNDSLogIDSSyncEngine;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      *(_DWORD *)buf = 138543618;
      id v51 = v9;
      __int16 v52 = 2050;
      uint64_t v53 = [v8 count];
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Sending ack for action %{public}@ with %{public}llu record metadata items", buf, 0x16u);
    }
    int v13 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    v38 = objc_alloc_init(DNDSContactProvider);
    v39 = v13;
    uint64_t v14 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:3 redactSensitiveData:0 contactProvider:v38 applicationIdentifierMapper:v13];
    __int16 v15 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v40 = v8;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentationWithContext:v14];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v18);
    }

    v47[0] = @"action";
    v47[1] = @"ackAction";
    v48[0] = @"ack";
    v48[1] = v9;
    v48[2] = v15;
    v47[2] = @"metadataAck";
    v47[3] = @"syncDate";
    id v22 = NSNumber;
    id v23 = [MEMORY[0x1E4F1C9C8] date];
    [v23 timeIntervalSinceReferenceDate];
    long long v24 = objc_msgSend(v22, "numberWithDouble:");
    v48[3] = v24;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];

    long long v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    syncService = self->_syncService;
    unint64_t v28 = [(DNDSPairedDevice *)self->_pairedDevice configurationSyncProtocolVersion];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke;
    v41[3] = &unk_1E69735E0;
    id v42 = v16;
    [(DNDSSyncService *)syncService sendMessage:v25 withVersionNumber:v28 messageType:@"syncEngine" toDestinations:v26 completionHandler:v41];

    id v8 = v40;
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncEngine _queue_sendAckWithMetadata:forAction:toDeviceWithIdentifier:](v11, v31, v32, v33, v34, v35, v36, v37);
  }
LABEL_19:
}

void __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void *)DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      int v9 = 134349056;
      uint64_t v10 = [v7 count];
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Sent %{public}llu record metadata items in ack", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke_cold_1();
  }
}

- (void)_queue_sendUnlockMessageToDeviceWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    id v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)int v9 = 0;
    id v8 = "Will not send unlock message because keybag is locked";
LABEL_8:
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_9;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    id v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)int v9 = 0;
    id v8 = "Will not send unlock message because sync is inactive";
    goto LABEL_8;
  }
  uint64_t v10 = @"action";
  v11[0] = @"unlock";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(DNDSSyncService *)self->_syncService sendMessage:v5 withVersionNumber:[(DNDSPairedDevice *)self->_pairedDevice configurationSyncProtocolVersion] messageType:@"syncEngine" toDestinations:v6 completionHandler:&__block_literal_global];

LABEL_9:
}

void __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Sent unlock message", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke_cold_1();
  }
}

- (void)_queue_sendResyncMessageToDeviceWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    id v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)int v9 = 0;
    id v8 = "Will not sync because keybag is locked";
LABEL_8:
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_9;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    id v7 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)int v9 = 0;
    id v8 = "Will not send resync message because sync is inactive";
    goto LABEL_8;
  }
  uint64_t v10 = @"action";
  v11[0] = @"resync";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(DNDSSyncService *)self->_syncService sendMessage:v5 withVersionNumber:[(DNDSPairedDevice *)self->_pairedDevice configurationSyncProtocolVersion] messageType:@"syncEngine" toDestinations:v6 completionHandler:&__block_literal_global_83];

LABEL_9:
}

void __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = DNDSLogIDSSyncEngine;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Sent resync message", v6, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
  {
    __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke_cold_1();
  }
}

- (void)_queue_sendModifiedRecordIDs:(id)a3 deletedRecordIDs:(id)a4 toDeviceWithIdentifier:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    uint64_t v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = "Will not send records because keybag is locked";
LABEL_20:
    _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    goto LABEL_69;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    uint64_t v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = "Will not send records because sync is inactive";
    goto LABEL_20;
  }
  if (!v10)
  {
    uint64_t v18 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    *(_WORD *)buf = 0;
    uint64_t v19 = "Will not send records because pairedDeviceIdentifier is nil";
    goto LABEL_20;
  }
  if (![v8 count] && !objc_msgSend(v9, "count")) {
    goto LABEL_69;
  }
  uint64_t v11 = (void *)DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    *(_DWORD *)buf = 134349312;
    uint64_t v101 = [v8 count];
    __int16 v102 = 2048;
    uint64_t v103 = [v9 count];
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Sending %{public}llu modified records and %{publi}llu deleted record IDs", buf, 0x16u);
  }
  unint64_t role = self->_role;
  v73 = v9;
  id v71 = v10;
  if (role == 1) {
    goto LABEL_13;
  }
  if (!role)
  {
    int v14 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore hasPerformedInitialSyncForPairedDeviceIdentifier:v10];
    __int16 v15 = DNDSLogIDSSyncEngine;
    BOOL v16 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Paired device has never synced; sending as replace",
          buf,
          2u);
      }
      [(DNDSIDSSyncEngine *)self _queue_removeAllInflightMetadata];
      [(DNDSIDSSyncEngine *)self _queue_cancelInflightExpirationTimer];
      uint64_t v17 = @"replace";
      goto LABEL_25;
    }
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Paired device has synced before; sending as update",
        buf,
        2u);
    }
LABEL_13:
    uint64_t v17 = @"update";
LABEL_25:
    v68 = v17;
    goto LABEL_26;
  }
  v68 = 0;
LABEL_26:
  uint64_t v20 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v69 = objc_alloc_init(DNDSContactProvider);
  v70 = v20;
  v78 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:3 redactSensitiveData:0 contactProvider:v69 applicationIdentifierMapper:v20];
  v76 = [MEMORY[0x1E4F1CA48] array];
  v21 = [MEMORY[0x1E4F1CA80] set];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v72 = v8;
  obuint64_t j = v8;
  uint64_t v22 = [obj countByEnumeratingWithState:&v88 objects:v99 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v89 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v26 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        long long v27 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore recordMetadataForRecordID:v26];
        if (v27)
        {
          if ([(NSMutableSet *)self->_inflightMetadata containsObject:v27])
          {
            unint64_t v28 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              char v29 = v28;
              uint64_t v30 = [v27 recordID];
              *(_DWORD *)buf = 138543362;
              uint64_t v101 = (uint64_t)v30;
              _os_log_impl(&dword_1D3052000, v29, OS_LOG_TYPE_DEFAULT, "Metadata for modified record with ID %{public}@ is already syncing", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v31 = [[DNDSIDSRecord alloc] initWithMetadata:v27];
            uint64_t v32 = [v26 zone];
            uint64_t v33 = [(DNDSIDSSyncEngine *)self _queue_dataSourceForZone:v32];

            [v33 idsSyncEngine:self prepareRecordToSave:v31];
            uint64_t v34 = [(DNDSIDSRecord *)v31 dictionaryRepresentationWithContext:v78];
            if (v34)
            {
              [v76 addObject:v34];
              [v21 addObject:v27];
            }
            else
            {
              uint64_t v35 = (void *)DNDSLogIDSSyncEngine;
              if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
                -[DNDSIDSSyncEngine _queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:](&v97, v35, v27, &v98);
              }
            }
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v88 objects:v99 count:16];
    }
    while (v23);
  }

  v75 = [MEMORY[0x1E4F1CA48] array];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v36 = v73;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v85 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore recordMetadataForRecordID:*(void *)(*((void *)&v84 + 1) + 8 * j)];
        if (v41)
        {
          if ([(NSMutableSet *)self->_inflightMetadata containsObject:v41])
          {
            id v42 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              long long v43 = v42;
              long long v44 = [v41 recordID];
              *(_DWORD *)buf = 138543362;
              uint64_t v101 = (uint64_t)v44;
              _os_log_impl(&dword_1D3052000, v43, OS_LOG_TYPE_DEFAULT, "Metadata for deleted record with ID %{public}@ is already syncing", buf, 0xCu);
            }
          }
          else
          {
            long long v45 = [v41 dictionaryRepresentationWithContext:v78];
            if (v45)
            {
              [v75 addObject:v45];
              [v21 addObject:v41];
            }
            else
            {
              long long v46 = (void *)DNDSLogIDSSyncEngine;
              if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
                -[DNDSIDSSyncEngine _queue_sendModifiedRecordIDs:deletedRecordIDs:toDeviceWithIdentifier:](&v94, v46, v41, &v95);
              }
            }
          }
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v38);
  }

  uint64_t v47 = [v21 count];
  v48 = DNDSLogIDSSyncEngine;
  BOOL v49 = os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT);
  if (v47)
  {
    id v10 = v71;
    id v8 = v72;
    if (v49)
    {
      v50 = v48;
      uint64_t v51 = [v76 count];
      uint64_t v52 = [v75 count];
      *(_DWORD *)buf = 134349312;
      uint64_t v101 = v51;
      __int16 v102 = 2050;
      uint64_t v103 = v52;
      _os_log_impl(&dword_1D3052000, v50, OS_LOG_TYPE_DEFAULT, "Syncing %{public}llu modifications and %{public}llu deletions", buf, 0x16u);
    }
    v92[0] = @"action";
    v92[1] = @"modifiedRecords";
    v93[0] = v68;
    v93[1] = v76;
    v92[2] = @"deletedMetadata";
    v93[2] = v75;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];
    v74 = [MEMORY[0x1E4F1CAD0] setWithObject:v71];
    uint64_t v54 = [MEMORY[0x1E4F29128] UUID];
    v55 = [v54 UUIDString];

    [(NSMutableDictionary *)self->_inflightMetadataByRequestIdentifier setObject:v21 forKeyedSubscript:v55];
    v56 = [MEMORY[0x1E4F1C9C8] date];
    [(NSMutableDictionary *)self->_inflightDateByRequestIdentifier setObject:v56 forKeyedSubscript:v55];

    [(NSMutableSet *)self->_inflightMetadata unionSet:v21];
    [(DNDSIDSSyncEngine *)self _queue_restartInflightExpirationTimer];
    v57 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      uint64_t v59 = [v21 count];
      uint64_t v60 = [(NSMutableSet *)self->_inflightMetadata count];
      *(_DWORD *)buf = 134349312;
      uint64_t v101 = v59;
      __int16 v102 = 2050;
      uint64_t v103 = v60;
      _os_log_impl(&dword_1D3052000, v58, OS_LOG_TYPE_DEFAULT, "Added %{public}llu inflight records; %{public}llu remaining",
        buf,
        0x16u);
    }
    v61 = (void *)DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      inflightMetadataByRequestIdentifier = self->_inflightMetadataByRequestIdentifier;
      v63 = v61;
      uint64_t v64 = [(NSMutableDictionary *)inflightMetadataByRequestIdentifier count];
      *(_DWORD *)buf = 134349056;
      uint64_t v101 = v64;
      _os_log_impl(&dword_1D3052000, v63, OS_LOG_TYPE_DEFAULT, "%{public}llu outstanding request identifiers", buf, 0xCu);
    }
    syncService = self->_syncService;
    unint64_t v66 = [(DNDSPairedDevice *)self->_pairedDevice configurationSyncProtocolVersion];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke;
    v79[3] = &unk_1E6973650;
    v79[4] = self;
    id v80 = v55;
    id v81 = obj;
    id v82 = v36;
    id v83 = v21;
    id v67 = v55;
    [(DNDSSyncService *)syncService sendMessage:v53 withVersionNumber:v66 messageType:@"syncEngine" toDestinations:v74 identifyingCompletionHandler:v79];
  }
  else
  {
    id v10 = v71;
    id v8 = v72;
    if (v49)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Update message is empty; will not send", buf, 2u);
    }
  }

  id v9 = v73;
LABEL_69:
}

void __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2;
  v13[3] = &unk_1E6973628;
  v13[4] = v9;
  id v14 = *(id *)(a1 + 40);
  char v20 = a2;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = v7;
  id v18 = *(id *)(a1 + 64);
  id v19 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_sync(v10, v13);
}

uint64_t __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 96) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)DNDSLogIDSSyncEngine;
  if (*(unsigned char *)(a1 + 88))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void **)(a1 + 48);
      id v4 = v2;
      uint64_t v5 = [v3 count];
      uint64_t v6 = [*(id *)(a1 + 56) count];
      int v9 = 134349312;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Sent %{public}llu modified record IDs and %{publi}llu deleted record IDs", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:*(void *)(a1 + 72) forKeyedSubscript:*(void *)(a1 + 64)];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v7 forKeyedSubscript:*(void *)(a1 + 64)];

    return objc_msgSend(*(id *)(a1 + 32), "_queue_restartInflightExpirationTimer");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
      __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2_cold_1();
    }
    [*(id *)(*(void *)(a1 + 32) + 112) minusSet:*(void *)(a1 + 72)];
    return objc_msgSend(*(id *)(a1 + 32), "_queue_startRetryTimer");
  }
}

- (void)_queue_startRetryTimer
{
}

void __43__DNDSIDSSyncEngine__queue_startRetryTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 134349056;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Retry timer fired (attempt #%{public}llu)", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRetryTimer");
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[3];
  if (v5)
  {
    uint64_t v6 = [v5 deviceIdentifier];
    objc_msgSend(v4, "_queue_syncDataSourcesToDeviceWithIdentifier:", v6);
  }
}

- (void)_queue_resetRetryTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(DNDSIDSSyncEngine *)self _queue_cancelRetryTimer])
  {
    uint64_t v3 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Resetting retry timer", v4, 2u);
    }
    self->_retriesAvailable = 3;
  }
}

- (BOOL)_queue_cancelRetryTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    id v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling retry timer", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_retryTimer);
    uint64_t v5 = self->_retryTimer;
    self->_retryTimer = 0;
  }
  return retryTimer != 0;
}

- (double)_queue_earliestExpirationTimeSinceNowForInflightMetadata
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_inflightDateByRequestIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_inflightDateByRequestIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * v8), (void)v16);
        uint64_t v10 = [v9 earlierDate:v3];

        if (v10 == v9)
        {
          id v11 = v9;

          uint64_t v3 = v11;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [v3 dateByAddingTimeInterval:(double)self->_inflightExpirationTime];
  [v12 timeIntervalSinceNow];
  double v14 = v13;

  return v14;
}

- (void)_queue_restartInflightExpirationTimer
{
  [(DNDSIDSSyncEngine *)self _queue_cancelInflightExpirationTimer];
  [(DNDSIDSSyncEngine *)self _queue_startInflightExpirationTimer];
}

- (void)_queue_startInflightExpirationTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NSMutableSet *)self->_inflightMetadata count])
  {
    id v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "No inflight metadata; will not start expiration timer";
LABEL_13:
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    return;
  }
  if (([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    id v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Will not set expiration timer because keybag is locked";
    goto LABEL_13;
  }
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    id v11 = DNDSLogIDSSyncEngine;
    if (!os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Will not set expiration retry timer because sync is inactive";
    goto LABEL_13;
  }
  [(DNDSIDSSyncEngine *)self _queue_earliestExpirationTimeSinceNowForInflightMetadata];
  int64_t v4 = (unint64_t)(v3 * 1000000000.0);
  uint64_t v5 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v15 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Expiration timer will fire in %llus", buf, 0xCu);
  }
  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  inflightExpirationTimer = self->_inflightExpirationTimer;
  self->_inflightExpirationTimer = v6;

  uint64_t v8 = self->_inflightExpirationTimer;
  dispatch_time_t v9 = dispatch_time(0, v4);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v10 = self->_inflightExpirationTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __56__DNDSIDSSyncEngine__queue_startInflightExpirationTimer__block_invoke;
  handler[3] = &unk_1E6973540;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_inflightExpirationTimer);
}

uint64_t __56__DNDSIDSSyncEngine__queue_startInflightExpirationTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Expiration timer fired", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelInflightExpirationTimer");
  double v3 = *(void **)(a1 + 32);
  int64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v3, "_queue_removeAllInflightMetadataWithExpirationDate:", v4);

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 136);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_queue_cancelInflightExpirationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  inflightExpirationTimer = self->_inflightExpirationTimer;
  if (inflightExpirationTimer)
  {
    int64_t v4 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling expiration timer", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_inflightExpirationTimer);
    uint64_t v5 = self->_inflightExpirationTimer;
    self->_inflightExpirationTimer = 0;
  }
  return inflightExpirationTimer != 0;
}

- (void)_queue_removeAllInflightMetadata
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableSet *)self->_inflightMetadata removeAllObjects];
  [(NSMutableDictionary *)self->_inflightMetadataByRequestIdentifier removeAllObjects];
  inflightDateByRequestIdentifier = self->_inflightDateByRequestIdentifier;
  [(NSMutableDictionary *)inflightDateByRequestIdentifier removeAllObjects];
}

- (void)_queue_removeAllInflightMetadataWithExpirationDate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = self->_inflightDateByRequestIdentifier;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_inflightDateByRequestIdentifier objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 dateByAddingTimeInterval:(double)self->_inflightExpirationTime];
        id v13 = [v4 laterDate:v12];

        if (v13 == v4) {
          [v21 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v21;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        char v20 = [(NSMutableDictionary *)self->_inflightMetadataByRequestIdentifier objectForKeyedSubscript:v19];
        [(NSMutableDictionary *)self->_inflightMetadataByRequestIdentifier setObject:0 forKeyedSubscript:v19];
        [(NSMutableDictionary *)self->_inflightDateByRequestIdentifier setObject:0 forKeyedSubscript:v19];
        [(NSMutableSet *)self->_inflightMetadata minusSet:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)_queue_handleMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((~LODWORD(self->_syncState) & 7) != 0)
  {
    dispatch_time_t v9 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Will not handle message because sync is inactive", v10, 2u);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(v6, "bs_safeStringForKey:", @"action");
    if ([v8 isEqualToString:@"update"])
    {
      [(DNDSIDSSyncEngine *)self _queue_handleUpdateMessage:v6 fromPairedDeviceIdentifier:v7];
    }
    else if ([v8 isEqualToString:@"replace"])
    {
      [(DNDSIDSSyncEngine *)self _queue_handleReplaceMessage:v6 fromPairedDeviceIdentifier:v7];
    }
    else if ([v8 isEqualToString:@"ack"])
    {
      [(DNDSIDSSyncEngine *)self _queue_handleAckMessage:v6 fromPairedDeviceIdentifier:v7];
    }
    else if ([v8 isEqualToString:@"unlock"])
    {
      [(DNDSIDSSyncEngine *)self _queue_handleUnlockMessage:v6 fromPairedDeviceIdentifier:v7];
    }
    else if ([v8 isEqualToString:@"resync"])
    {
      [(DNDSIDSSyncEngine *)self _queue_handleResyncMessage:v6 fromPairedDeviceIdentifier:v7];
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
    {
      -[DNDSIDSSyncEngine _queue_handleMessage:fromPairedDeviceIdentifier:]();
    }
  }
}

- (void)_queue_handleResyncMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Received resync message", v8, 2u);
  }
  [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore removePairedDeviceIdentifier:v6];
  [(DNDSIDSSyncEngine *)self _queue_removeAllInflightMetadata];
  [(DNDSIDSSyncEngine *)self _queue_cancelInflightExpirationTimer];
  [(DNDSIDSSyncEngine *)self _queue_syncDataSourcesToDeviceWithIdentifier:v6];
}

- (void)_queue_handleAckMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = objc_msgSend(v6, "bs_safeArrayForKey:", @"metadataAck");
  long long v26 = objc_msgSend(v6, "bs_safeNumberForKey:", @"syncDate");
  uint64_t v8 = objc_msgSend(v6, "bs_safeStringForKey:", @"ackAction");
  dispatch_time_t v9 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v8;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Received ack message for action %{public}@", buf, 0xCu);
  }
  long long v25 = (void *)v8;
  long long v23 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  long long v24 = objc_alloc_init(DNDSContactProvider);
  uint64_t v10 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:3 redactSensitiveData:0 contactProvider:v24 applicationIdentifierMapper:v23];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:*(void *)(*((void *)&v28 + 1) + 8 * i) context:v10];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  long long v18 = (void *)MEMORY[0x1E4F1C9C8];
  [v26 doubleValue];
  uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  if ([v25 isEqualToString:@"replace"])
  {
    char v20 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Paired device has performed an initial sync", buf, 2u);
    }
    [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore setPerformedInitialSyncForPairedDeviceIdentifier:v27];
  }
  unint64_t role = self->_role;
  if (role == 1)
  {
    [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore setSyncDate:v19 forRecordsMatchingMetadata:v11 forPairedDeviceIdentifier:v27];
    long long v22 = v23;
    if (([(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore hasPerformedInitialSyncForPairedDeviceIdentifier:v27] & 1) == 0)[(DNDSIDSSyncEngine *)self _queue_sendResyncMessageToDeviceWithIdentifier:v27]; {
  }
    }
  else
  {
    long long v22 = v23;
    if (!role
      && [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore hasPerformedInitialSyncForPairedDeviceIdentifier:v27])
    {
      [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore setSyncDate:v19 forRecordsMatchingMetadata:v11 forPairedDeviceIdentifier:v27];
    }
  }
}

- (void)_queue_handleUnlockMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v9 = 0;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Received unlock message", v9, 2u);
  }
  didReceiveUnlockMessage = (void (**)(void))self->_didReceiveUnlockMessage;
  if (didReceiveUnlockMessage) {
    didReceiveUnlockMessage[2]();
  }
  [(DNDSIDSSyncEngine *)self _queue_removeAllInflightMetadata];
  [(DNDSIDSSyncEngine *)self _queue_cancelInflightExpirationTimer];
  [(DNDSIDSSyncEngine *)self _queue_syncDataSourcesToDeviceWithIdentifier:v6];
}

- (void)_queue_handleUpdateMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Received update message", buf, 2u);
  }
  if (self->_role
    || ([(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore hasPerformedInitialSyncForPairedDeviceIdentifier:v7] & 1) != 0)
  {
    id v70 = v7;
    dispatch_time_t v9 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    v63 = objc_alloc_init(DNDSContactProvider);
    uint64_t v64 = v9;
    id v72 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:3 redactSensitiveData:0 contactProvider:v63 applicationIdentifierMapper:v9];
    uint64_t v10 = objc_msgSend(v6, "bs_safeArrayForKey:", @"modifiedRecords");
    v65 = v6;
    v62 = objc_msgSend(v6, "bs_safeArrayForKey:", @"deletedMetadata");
    id v71 = [MEMORY[0x1E4F1CA48] array];
    v69 = [MEMORY[0x1E4F1C9C8] date];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v67 = *(id *)v78;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(id *)v78 != v67) {
            objc_enumerationMutation(obj);
          }
          id v14 = +[DNDSIDSRecord newWithDictionaryRepresentation:*(void *)(*((void *)&v77 + 1) + 8 * i) context:v72];
          metadataStore = self->_metadataStore;
          uint64_t v16 = [v14 recordID];
          id v17 = [(DNDSIDSSyncEngineMetadataStoring *)metadataStore recordMetadataForRecordID:v16];

          if (!v17) {
            goto LABEL_14;
          }
          long long v18 = [v17 lastModified];
          uint64_t v19 = [v14 metadata];
          char v20 = [v19 lastModified];
          uint64_t v21 = [v18 earlierDate:v20];
          long long v22 = [v17 lastModified];

          if (v21 == v22)
          {
LABEL_14:
            long long v24 = [v14 recordID];
            long long v25 = [v24 zone];
            long long v26 = [(DNDSIDSSyncEngine *)self _queue_dataSourceForZone:v25];

            id v27 = self->_metadataStore;
            long long v28 = [v14 metadata];
            long long v89 = v28;
            long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
            [(DNDSIDSSyncEngineMetadataStoring *)v27 updateMetadata:v29];

            long long v30 = self->_metadataStore;
            long long v31 = [v14 recordID];
            long long v88 = v31;
            uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
            [(DNDSIDSSyncEngineMetadataStoring *)v30 setSyncDate:v69 forRecordIDs:v32 forPairedDeviceIdentifier:v70];

            uint64_t v33 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              id v85 = v14;
              __int16 v86 = 2114;
              long long v87 = v26;
              _os_log_impl(&dword_1D3052000, v33, OS_LOG_TYPE_DEFAULT, "Sending modified record %{private}@ to data source %{public}@", buf, 0x16u);
            }
            [v26 idsSyncEngine:self didFetchRecord:v14];
          }
          else
          {
            long long v23 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              id v85 = v14;
              _os_log_error_impl(&dword_1D3052000, v23, OS_LOG_TYPE_ERROR, "Incoming modified record %{private}@ has an older lastModified date than the existing record", buf, 0xCu);
            }
          }
          uint64_t v34 = [v14 metadata];
          [v71 addObject:v34];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v77 objects:v90 count:16];
      }
      while (v12);
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v68 = v62;
    uint64_t v35 = [v68 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v74 != v37) {
            objc_enumerationMutation(v68);
          }
          id v39 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:*(void *)(*((void *)&v73 + 1) + 8 * j) context:v72];
          id v40 = self->_metadataStore;
          v41 = [v39 recordID];
          id v42 = [(DNDSIDSSyncEngineMetadataStoring *)v40 recordMetadataForRecordID:v41];

          if (!v42) {
            goto LABEL_28;
          }
          long long v43 = [v42 lastModified];
          long long v44 = [v39 lastModified];
          long long v45 = [v43 earlierDate:v44];
          long long v46 = [v42 lastModified];

          if (v45 == v46)
          {
LABEL_28:
            v48 = [v39 recordID];
            BOOL v49 = [v48 zone];
            v50 = [(DNDSIDSSyncEngine *)self _queue_dataSourceForZone:v49];

            uint64_t v51 = self->_metadataStore;
            id v82 = v39;
            uint64_t v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
            [(DNDSIDSSyncEngineMetadataStoring *)v51 updateMetadata:v52];

            uint64_t v53 = self->_metadataStore;
            uint64_t v54 = [v39 recordID];
            id v81 = v54;
            v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
            [(DNDSIDSSyncEngineMetadataStoring *)v53 setSyncDate:v69 forRecordIDs:v55 forPairedDeviceIdentifier:v70];

            v56 = (void *)DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              v58 = [v39 recordID];
              *(_DWORD *)buf = 138478083;
              id v85 = v58;
              __int16 v86 = 2114;
              long long v87 = v50;
              _os_log_impl(&dword_1D3052000, v57, OS_LOG_TYPE_DEFAULT, "Sending deleted recordID %{private}@ to data source %{public}@", buf, 0x16u);
            }
            uint64_t v59 = [v39 recordID];
            [v50 idsSyncEngine:self recordWithIDWasDeleted:v59];
          }
          else
          {
            uint64_t v47 = DNDSLogIDSSyncEngine;
            if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              id v85 = v39;
              _os_log_error_impl(&dword_1D3052000, v47, OS_LOG_TYPE_ERROR, "Incoming deleted metadata %{private}@ has an older lastModified date than the existing metadata", buf, 0xCu);
            }
          }
          [v71 addObject:v39];
        }
        uint64_t v36 = [v68 countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v36);
    }

    id v6 = v65;
    uint64_t v60 = objc_msgSend(v65, "bs_safeStringForKey:", @"action");
    id v7 = v70;
    [(DNDSIDSSyncEngine *)self _queue_sendAckWithMetadata:v71 forAction:v60 toDeviceWithIdentifier:v70];
  }
  else
  {
    v61 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v61, OS_LOG_TYPE_DEFAULT, "Ignoring update from paired device that we have never synced with", buf, 2u);
    }
  }
}

- (void)_queue_handleReplaceMessage:(id)a3 fromPairedDeviceIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = DNDSLogIDSSyncEngine;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Received replace message", buf, 2u);
  }
  if (self->_role)
  {
    dispatch_time_t v9 = (void *)[(NSMapTable *)self->_sourcesByZone copy];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * v14), (void)v24);
          [v15 purgeRecordsForIDSSyncEngine:self];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore purge];
    [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore setPerformedInitialSyncForPairedDeviceIdentifier:v7];
    [(DNDSIDSSyncEngine *)self _queue_handleUpdateMessage:v6 fromPairedDeviceIdentifier:v7];
  }
  else
  {
    uint64_t v16 = DNDSLogIDSSyncEngine;
    if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_ERROR)) {
      -[DNDSIDSSyncEngine _queue_handleReplaceMessage:fromPairedDeviceIdentifier:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_queue_validate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(DNDSIDSSyncEngine *)self _queue_removeAllInflightMetadata];
  [(DNDSIDSSyncEngine *)self _queue_cancelInflightExpirationTimer];
  if ((~LODWORD(self->_syncState) & 7) == 0)
  {
    if (self->_pairedDevice)
    {
      if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
      {
        metadataStore = self->_metadataStore;
        id v4 = [MEMORY[0x1E4F1C9C8] date];
        LOBYTE(metadataStore) = [(DNDSIDSSyncEngineMetadataStoring *)metadataStore isValidAtDate:v4];

        if ((metadataStore & 1) == 0)
        {
          uint64_t v5 = DNDSLogIDSSyncEngine;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSSyncEngine, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v7 = 0;
            _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Metadata store is invalid; purging and syncing",
              v7,
              2u);
          }
          [(DNDSIDSSyncEngineMetadataStoring *)self->_metadataStore purge];
          id v6 = [(DNDSPairedDevice *)self->_pairedDevice deviceIdentifier];
          [(DNDSIDSSyncEngine *)self _queue_syncDataSourcesToDeviceWithIdentifier:v6];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFireMetadataExpirationTimer, 0);
  objc_storeStrong(&self->_didReceiveUnlockMessage, 0);
  objc_storeStrong((id *)&self->_inflightMetadata, 0);
  objc_storeStrong((id *)&self->_inflightDateByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightMetadataByRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightExpirationTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_sourcesByZone, 0);
}

void __102__DNDSIDSSyncEngine_syncService_didReceiveMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Ignoring incoming message as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2050;
  uint64_t v3 = 12;
  _os_log_error_impl(&dword_1D3052000, v0, OS_LOG_TYPE_ERROR, "*** PLEASE UPDATE DEVICES *** Rejecting incoming message as the version number is not supported by this sync protocol: versionNumber=%{public}lu, currentVersionNumber=%{public}lu", v1, 0x16u);
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Rejecting incoming message as it is not from the active device: deviceIdentifier=%{public}@, pairedDevice=%{public}@", v2, 0x16u);
}

void __112__DNDSIDSSyncEngine_syncService_shouldAcceptIncomingMessage_withVersionNumber_messageType_fromDeviceIdentifier___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Rejecting incoming message as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error in didSendWithRequestIdentifier sending record modifications: %{public}@", v2, v3, v4, v5, v6);
}

void __80__DNDSIDSSyncEngine_syncService_didSendWithRequestIdentifier_withSuccess_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Ignoring message send callback as the sync engine is disabled: %{public}llu", v2, v3, v4, v5, v6);
}

- (void)_queue_sendAckWithMetadata:(uint64_t)a3 forAction:(uint64_t)a4 toDeviceWithIdentifier:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__DNDSIDSSyncEngine__queue_sendAckWithMetadata_forAction_toDeviceWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error sending metadata ack: %{public}@", v2, v3, v4, v5, v6);
}

void __68__DNDSIDSSyncEngine__queue_sendUnlockMessageToDeviceWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to send unlock message: %{public}@", v2, v3, v4, v5, v6);
}

void __68__DNDSIDSSyncEngine__queue_sendResyncMessageToDeviceWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to send resync message: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_sendModifiedRecordIDs:(void *)a3 deletedRecordIDs:(void *)a4 toDeviceWithIdentifier:.cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 recordID];
  *a1 = 138412290;
  *a4 = v8;
  OUTLINED_FUNCTION_4(&dword_1D3052000, v9, v10, "Deleted record metadata could not be serialized: %@");
}

- (void)_queue_sendModifiedRecordIDs:(void *)a3 deletedRecordIDs:(void *)a4 toDeviceWithIdentifier:.cold.2(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 recordID];
  *a1 = 138412290;
  *a4 = v8;
  OUTLINED_FUNCTION_4(&dword_1D3052000, v9, v10, "Modified record could not be serialized: %@");
}

void __90__DNDSIDSSyncEngine__queue_sendModifiedRecordIDs_deletedRecordIDs_toDeviceWithIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error in sendMessage sending record modifications: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_handleMessage:fromPairedDeviceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unknown action %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_handleReplaceMessage:(uint64_t)a3 fromPairedDeviceIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end