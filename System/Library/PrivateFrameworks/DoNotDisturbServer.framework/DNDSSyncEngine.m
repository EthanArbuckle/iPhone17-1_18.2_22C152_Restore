@interface DNDSSyncEngine
+ (DNDSSyncEngine)sharedInstance;
- (BOOL)_lock_encryptionAvailable;
- (BOOL)_lock_isSyncAvailable;
- (BOOL)_lock_isSyncEnabled;
- (BOOL)_lock_isSyncPreferenceEnabled;
- (BOOL)hasLocalChanges;
- (BOOL)isSyncAvailable;
- (BOOL)isSyncEnabled;
- (BOOL)isSyncPreferenceEnabled;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 keybag:(id)a5 syncEnabled:(BOOL)a6;
- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 syncEngine:(id)a5 keybag:(id)a6 syncEnabled:(BOOL)a7;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_lock_currentUserRecordID;
- (id)_lock_dataSourceForRecord:(id)a3;
- (id)_lock_dataSourceForZoneID:(id)a3;
- (id)_lock_dataSources;
- (id)_lock_syncEngine;
- (id)_zoneIDForRecord:(id)a3;
- (id)lastChanceRecordForRecordID:(id)a3;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (int64_t)_lock_currentAccountStatus;
- (unint64_t)cloudSyncState;
- (void)_fetchAccountStateWithCompletionHandler:(id)a3;
- (void)_handleAccountFetchWithUpdatedUserRecordID:(id)a3 updatedAccountStatus:(int64_t)a4 updatedEncryptionAvailable:(BOOL)a5 updatedSyncEnabled:(BOOL)a6;
- (void)_initialSyncForDataSource:(id)a3 withZoneName:(id)a4;
- (void)_initialSyncForDataSources;
- (void)_lock_destroySyncEngine;
- (void)_lock_purgeData;
- (void)_lock_setCurrentAccountStatus:(int64_t)a3;
- (void)_lock_setCurrentUserRecordID:(id)a3;
- (void)_lock_setEncryptionAvailable:(BOOL)a3;
- (void)_migrateOldStoresWithSyncEnabledState:(BOOL)a3;
- (void)_purgeDataFromDataSources;
- (void)_retryLastChanceRecords;
- (void)_retryLastChanceRecordsForDataSource:(id)a3 withZoneName:(id)a4;
- (void)_syncEngineQueue_updateAccountWithSyncEnabledState:(BOOL)a3;
- (void)_updateAccountWithCurrentSyncEnabledState;
- (void)_updateAccountWithSyncEnabledState:(BOOL)a3;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4;
- (void)fetchChanges:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)handleDeletedRecordID:(id)a3;
- (void)handleFetchedRecord:(id)a3;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)purgeZoneWithID:(id)a3;
- (void)removeZoneWithID:(id)a3;
- (void)sendChangesWithCompletionHandler:(id)a3;
- (void)setDataSource:(id)a3 forZoneName:(id)a4;
- (void)setSyncPreferenceEnabled:(BOOL)a3;
- (void)setTesting:(BOOL)a3;
- (void)sync:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
@end

@implementation DNDSSyncEngine

+ (DNDSSyncEngine)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_34);
  }
  v2 = (void *)sharedInstance_shared;
  return (DNDSSyncEngine *)v2;
}

void __32__DNDSSyncEngine_sharedInstance__block_invoke()
{
  v0 = [DNDSSyncEngineMetadataStore alloc];
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_syncEngineMetadataFileURL");
  v10 = [(DNDSSyncEngineMetadataStore *)v0 initWithURL:v1];

  v2 = [DNDSSyncEngineLastChanceDataStore alloc];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_syncEngineLastChanceFileURL");
  v4 = [(DNDSSyncEngineLastChanceDataStore *)v2 initWithURL:v3];

  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 BOOLForKey:@"disableCloudSync"] ^ 1;

  v7 = +[DNDSKeybag sharedInstance];
  v8 = [[DNDSSyncEngine alloc] initWithMetadataStore:v10 lastChanceDataStore:v4 keybag:v7 syncEnabled:v6];
  v9 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v8;
}

- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 keybag:(id)a5 syncEnabled:(BOOL)a6
{
  uint64_t v6 = [(DNDSSyncEngine *)self initWithMetadataStore:a3 lastChanceDataStore:a4 syncEngine:0 keybag:a5 syncEnabled:a6];
  v7 = v6;
  if (v6)
  {
    v6->_allowSyncEngineCreation = 1;
    if (v6->_state.featureEnabled)
    {
      uint64_t v8 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.donotdisturbd"];
      container = v7->_container;
      v7->_container = (CKContainer *)v8;

      [(DNDSSyncEngine *)v7 _updateAccountWithCurrentSyncEnabledState];
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:v7 selector:sel__cloudKitAccountChanged_ name:*MEMORY[0x1E4F19BE0] object:0];
    }
  }
  return v7;
}

- (DNDSSyncEngine)initWithMetadataStore:(id)a3 lastChanceDataStore:(id)a4 syncEngine:(id)a5 keybag:(id)a6 syncEnabled:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v40.receiver = self;
  v40.super_class = (Class)DNDSSyncEngine;
  v17 = [(DNDSSyncEngine *)&v40 init];
  v18 = v17;
  if (v17)
  {
    id v36 = v16;
    id v35 = v15;
    id v19 = v13;
    v17->_lock._os_unfair_lock_opaque = 0;
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.donotdisturb.server.DNDSSyncEngine", v20);
    syncEngineQueue = v18->_syncEngineQueue;
    v18->_syncEngineQueue = (OS_dispatch_queue *)v21;

    dispatch_source_t v23 = dispatch_source_create(MEMORY[0x1E4F14448], 0, 0, (dispatch_queue_t)v18->_syncEngineQueue);
    accountUpdateSource = v18->_accountUpdateSource;
    v18->_accountUpdateSource = (OS_dispatch_source *)v23;

    v25 = v18->_accountUpdateSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke;
    handler[3] = &unk_1E6973540;
    v26 = v18;
    v39 = v26;
    dispatch_source_set_event_handler(v25, handler);
    dispatch_activate((dispatch_object_t)v18->_accountUpdateSource);
    uint64_t v27 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v28 = v26[6];
    v26[6] = (id)v27;

    objc_storeStrong(v26 + 1, a3);
    objc_storeStrong(v26 + 8, a4);
    objc_storeStrong(v26 + 7, a3);
    *((unsigned char *)v26 + 78) = 0;
    objc_storeStrong(v26 + 2, a5);
    *((unsigned char *)v26 + 73) = 1;
    *((unsigned char *)v26 + 76) = 1;
    *((unsigned char *)v26 + 72) = a7;
    *((unsigned char *)v26 + 74) = [v26[7] accountStatus] == 1;
    *((unsigned char *)v26 + 75) = [v26[7] isEncryptionAvailable];
    unint64_t v29 = *((unsigned int *)v26 + 18) | ((unint64_t)*((unsigned __int16 *)v26 + 38) << 32);
    if ((v29 & 0x10000000000) != 0 || (v29 & 0x101010101) == 0x101010101)
    {
      v30 = DNDSLogCloudSync;
      id v13 = v19;
      id v15 = v35;
      if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:
        objc_storeStrong(v26 + 11, a6);
        [v26[11] addObserver:v26];
        DNDSRegisterSysdiagnoseDataProvider(v26);

        id v16 = v36;
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      v31 = "Sync engine will be enabled on startup";
    }
    else
    {
      if ((v26[9] & 0xFF00) != 0)
      {
        id v13 = v19;
      }
      else
      {
        v32 = DNDSLogCloudSync;
        id v13 = v19;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Sync engine will be disabled on startup because of feature flag", buf, 2u);
        }
        LOBYTE(v29) = *((unsigned char *)v26 + 72);
      }
      id v15 = v35;
      if (!(_BYTE)v29)
      {
        v33 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3052000, v33, OS_LOG_TYPE_DEFAULT, "Sync engine will be disabled on startup because user setting is disabled", buf, 2u);
        }
      }
      if (*((unsigned char *)v26 + 74)) {
        goto LABEL_18;
      }
      v30 = DNDSLogCloudSync;
      if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v31 = "Sync engine will be disabled on startup because of missing account";
    }
    _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_18;
  }
LABEL_19:

  return v18;
}

uint64_t __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke(uint64_t a1)
{
  v2 = *(dispatch_source_t **)(a1 + 32);
  uintptr_t data = dispatch_source_get_data(v2[5]);
  if (data - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke_cold_1(v4, data);
    }
    v2 = *(dispatch_source_t **)(a1 + 32);
  }
  return [(dispatch_source_t *)v2 _syncEngineQueue_updateAccountWithSyncEnabledState:data != 1];
}

- (unint64_t)cloudSyncState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state.encryptionAvailable) {
    uint64_t v4 = (4 * self->_state.accountAvailable) | 2;
  }
  else {
    uint64_t v4 = 4 * self->_state.accountAvailable;
  }
  unint64_t v5 = v4 | self->_state.syncEnabled;
  if (self->_state.supportedDevice) {
    unint64_t v6 = v5 | 8;
  }
  else {
    unint64_t v6 = v5;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isSyncAvailable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(DNDSSyncEngine *)v2 _lock_isSyncAvailable];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSyncEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(DNDSSyncEngine *)v2 _lock_isSyncEnabled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSyncPreferenceEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state.syncEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSyncPreferenceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state.syncEnabled == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    unint64_t v6 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      if (v3) {
        v7 = "enabled";
      }
      int v8 = 136446210;
      v9 = v7;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Sync engine changing to %{public}s", (uint8_t *)&v8, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
    [(DNDSSyncEngine *)self _updateAccountWithSyncEnabledState:v3];
  }
}

- (void)setTesting:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state.testing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDataSource:(id)a3 forZoneName:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  if (v6)
  {
    uint64_t v9 = [(NSMapTable *)sourcesByZoneName objectForKey:v7];
    if (!v9
      || (uint64_t v10 = (void *)v9,
          [(NSMapTable *)self->_sourcesByZoneName objectForKey:v7],
          id v11 = (id)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11 == v6))
    {
      [(NSMapTable *)self->_sourcesByZoneName setObject:v6 forKey:v7];
      int v12 = [(DNDSSyncEngineMetadataStoring *)self->_metadataStore addZoneName:v7];
      os_unfair_lock_unlock(&self->_lock);
      if (v12)
      {
        id v13 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v7;
          _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Performing initial sync for new zone: %@", (uint8_t *)&v14, 0xCu);
        }
        [(DNDSSyncEngine *)self _initialSyncForDataSource:v6 withZoneName:v7];
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    [(DNDSSyncEngine *)self _retryLastChanceRecordsForDataSource:v6 withZoneName:v7];
  }
  else
  {
    [(NSMapTable *)sourcesByZoneName removeObjectForKey:v7];
    [(DNDSSyncEngineMetadataStoring *)self->_metadataStore removeZoneName:v7];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    int v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Adding record IDs to save: %{public}@; to delete: %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    uint64_t v9 = [(DNDSSyncEngine *)self _lock_syncEngine];
    [v9 addRecordIDsToSave:v6 recordIDsToDelete:v7];

    if (!self->_syncEngine && self->_allowSyncEngineCreation)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_FAULT)) {
        -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:]();
      }
      _DNDSRequestRadar(@"RecordID change was made before sync engine availability.", 0, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSyncEngine.m", 329);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    int v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Adding zones to save: %{public}@; to delete: %{public}@",
        (uint8_t *)&v10,
        0x16u);
    }
    uint64_t v9 = [(DNDSSyncEngine *)self _lock_syncEngine];
    [v9 addRecordZonesToSave:v6 recordZoneIDsToDelete:v7];

    if (!self->_syncEngine && self->_allowSyncEngineCreation)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_FAULT)) {
        -[DNDSSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]();
      }
      _DNDSRequestRadar(@"RecordZoneID change was made before sync engine availability.", 0, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSyncEngine.m", 346);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)sendChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    id v6 = [(DNDSSyncEngine *)self _lock_syncEngine];
    [v6 modifyPendingChangesWithCompletionHandler:v4];
  }
  else
  {
    id v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__DNDSSyncEngine_sendChangesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E69752F0;
    id v9 = v4;
    dispatch_async(v7, block);
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __51__DNDSSyncEngine_sendChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchChanges:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    int v8 = DNDSLogCloudSync;
    BOOL v9 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Forcing sync engine fetch", buf, 2u);
      }
      int v10 = [(DNDSSyncEngine *)self _lock_syncEngine];
      [v10 setNeedsToFetchChanges];
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Requesting sync engine fetch", buf, 2u);
    }
    __int16 v12 = [(DNDSSyncEngine *)self _lock_syncEngine];
    [v12 fetchChangesWithCompletionHandler:v6];
  }
  else
  {
    id v11 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__DNDSSyncEngine_fetchChanges_withCompletionHandler___block_invoke;
    block[3] = &unk_1E69752F0;
    id v14 = v6;
    dispatch_async(v11, block);

    __int16 v12 = v14;
  }

  os_unfair_lock_unlock(p_lock);
}

uint64_t __53__DNDSSyncEngine_fetchChanges_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sync:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(DNDSSyncEngine *)self isSyncEnabled])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E6975340;
    v13[4] = self;
    id v14 = v6;
    id v7 = v6;
    [(DNDSSyncEngine *)self fetchChanges:v4 withCompletionHandler:v13];
    int v8 = v14;
  }
  else
  {
    BOOL v9 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_36;
    block[3] = &unk_1E69752F0;
    id v12 = v6;
    id v10 = v6;
    dispatch_async(v9, block);

    int v8 = v12;
  }
}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = DNDSLogCloudSync;
  BOOL v5 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Error fetching changes: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Fetched changes", buf, 2u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_34;
    v7[3] = &unk_1E6975318;
    id v6 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 sendChangesWithCompletionHandler:v7];
  }
}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = DNDSLogCloudSync;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_34_cold_1();
    }
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Sent changes", v6, 2u);
    }
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

uint64_t __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleFetchedRecord:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSSyncEngineMetadataStoring *)self->_store addRecord:v4];
  BOOL v5 = [(DNDSSyncEngine *)self _zoneIDForRecord:v4];
  id v6 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v5];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v7 = [v6 syncEngine:self wantsRecord:v4];
  switch(v7)
  {
    case 0:
      v17 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        id v19 = [v4 recordID];
        v20 = [v19 recordName];
        int v25 = 138543618;
        v26 = v5;
        __int16 v27 = 2114;
        id v28 = v20;
        _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find data source with zoneID %{public}@ for record %{public}@; sending to last-chance store",
          (uint8_t *)&v25,
          0x16u);
      }
      goto LABEL_14;
    case 2:
      dispatch_queue_t v21 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        dispatch_source_t v23 = [v4 recordID];
        v24 = [v23 recordName];
        int v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Record %{public}@ is from the future; saving what we can and sending to last-chance store",
          (uint8_t *)&v25,
          0xCu);
      }
      [v6 syncEngine:self didFetchRecord:v4];
LABEL_14:
      os_unfair_lock_lock(&self->_lock);
      [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore addRecord:v4];
      os_unfair_lock_unlock(&self->_lock);
      break;
    case 1:
      lastChanceStore = self->_lastChanceStore;
      BOOL v9 = [v4 recordID];
      id v10 = [(DNDSSyncEngineLastChanceDataStoring *)lastChanceStore recordWithID:v9];

      if (v10)
      {
        uint64_t v11 = (void *)DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = v11;
          id v13 = [v4 recordID];
          id v14 = [v13 recordName];
          int v25 = 138543362;
          v26 = v14;
          _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Record %{public}@ overrides a previously-stored record in the last-chance store.", (uint8_t *)&v25, 0xCu);
        }
        id v15 = self->_lastChanceStore;
        uint64_t v16 = [v4 recordID];
        [(DNDSSyncEngineLastChanceDataStoring *)v15 removeRecordWithID:v16];
      }
      [v6 syncEngine:self didFetchRecord:v4];
      break;
  }
}

- (void)handleDeletedRecordID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = [v4 zoneID];
  id v6 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v5];

  [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore removeRecordWithID:v4];
  [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordWithID:v4];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v7 = DNDSLogCloudSync;
  BOOL v8 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      [(DNDSSyncEngine *)(uint64_t)v4 handleDeletedRecordID:v7];
    }
    [v6 syncEngine:self recordWithIDWasDeleted:v4];
  }
  else if (v8)
  {
    -[DNDSSyncEngine handleDeletedRecordID:]();
  }
}

- (void)removeZoneWithID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  uint64_t v7 = [v5 zoneName];
  id v11 = [(NSMapTable *)sourcesByZoneName objectForKey:v7];

  [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore removeRecordsWithZoneID:v5];
  [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordsWithZoneID:v5];
  metadataStore = self->_metadataStore;
  BOOL v9 = [v5 zoneName];
  [(DNDSSyncEngineMetadataStoring *)metadataStore removeZoneName:v9];

  os_unfair_lock_unlock(p_lock);
  id v10 = [v5 zoneName];

  [(DNDSSyncEngine *)self _initialSyncForDataSource:v11 withZoneName:v10];
}

- (void)purgeZoneWithID:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v5];
  uint64_t v7 = [(DNDSSyncEngineMetadataStoring *)self->_store recordIDsWithZoneID:v5];
  [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore removeRecordsWithZoneID:v5];
  [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordsWithZoneID:v5];
  metadataStore = self->_metadataStore;
  BOOL v9 = [v5 zoneName];
  [(DNDSSyncEngineMetadataStoring *)metadataStore removeZoneName:v9];

  os_unfair_lock_unlock(p_lock);
  [v6 syncEngine:self zoneWithIDWasDeleted:v5 removingRecordIDs:v7];
  os_unfair_lock_lock(p_lock);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v5];
  id v11 = [(DNDSSyncEngine *)self _lock_syncEngine];
  v14[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v11 addRecordZonesToSave:v12 recordZoneIDsToDelete:0];

  os_unfair_lock_unlock(p_lock);
  id v13 = [v5 zoneName];

  [(DNDSSyncEngine *)self _initialSyncForDataSource:v6 withZoneName:v13];
}

- (BOOL)hasLocalChanges
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(DNDSSyncEngine *)self _lock_syncEngine];
  char v5 = [v4 hasPendingModifications];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)lastChanceRecordForRecordID:(id)a3
{
  return (id)[(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore recordWithID:a3];
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Deleted record: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordWithID:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    id v8 = [v5 recordID];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Fetched record: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(DNDSSyncEngine *)self handleFetchedRecord:v5];
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    id v8 = [v5 recordID];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Saved record: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSSyncEngineMetadataStoring *)self->_store addRecord:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5 = a4;
  id v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Updated metadata", v7, 2u);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSSyncEngineMetadataStoring *)self->_store setMetadata:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
    -[DNDSSyncEngine syncEngine:failedToDeleteRecordWithID:error:](v11);
  }
  os_unfair_lock_lock(&self->_lock);
  id v12 = [v9 zoneID];
  id v13 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v12];
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    [v13 syncEngine:self failedToDeleteRecordWithID:v9 error:v10];
  }
  else
  {
    id v14 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      -[DNDSSyncEngine syncEngine:failedToDeleteRecordWithID:error:]((uint64_t)v12, v14, v9);
    }
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
    -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.8(v11);
  }
  id v12 = [v10 domain];
  char v13 = [v12 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v13)
  {
    uint64_t v14 = [v10 code];
    if (v14 > 25)
    {
      switch(v14)
      {
        case 26:
          id v15 = [(DNDSSyncEngine *)self _zoneIDForRecord:v9];
          v31 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            v33 = [v15 zoneName];
            *(_DWORD *)buf = 138543362;
            v50 = v33;
            _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Zone %{public}@ not found; pushing zone to server",
              buf,
              0xCu);
          }
          if (!v15)
          {
            if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
              -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.5();
            }
            goto LABEL_35;
          }
          id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v15];
          v48 = v19;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
          [(DNDSSyncEngine *)self addRecordZonesToSave:v34 recordZoneIDsToDelete:0];

          v22 = [v9 recordID];
          v47 = v22;
          id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
          [(DNDSSyncEngine *)self addRecordIDsToSave:v35 recordIDsToDelete:0];

LABEL_25:
LABEL_34:

LABEL_35:
          goto LABEL_36;
        case 28:
          id v15 = [(DNDSSyncEngine *)self _zoneIDForRecord:v9];
          id v36 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v37 = v36;
            v38 = [v15 zoneName];
            *(_DWORD *)buf = 138543362;
            v50 = v38;
            _os_log_impl(&dword_1D3052000, v37, OS_LOG_TYPE_DEFAULT, "User deleted zone %{public}@; deleting zone",
              buf,
              0xCu);
          }
          if (v15)
          {
            [(DNDSSyncEngine *)self syncEngine:v8 zoneWithIDWasPurged:v15];
          }
          else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
          {
            -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.6();
          }
          goto LABEL_35;
        case 112:
          id v15 = [(DNDSSyncEngine *)self _zoneIDForRecord:v9];
          uint64_t v16 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = [v15 zoneName];
            *(_DWORD *)buf = 138543362;
            v50 = v18;
            _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Missing identity for zone %{public}@; deleting and recreating zone",
              buf,
              0xCu);
          }
          if (!v15)
          {
            objc_super v40 = DNDSLogCloudSync;
            if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D3052000, v40, OS_LOG_TYPE_DEFAULT, "ZoneID is nil; ignoring record", buf, 2u);
            }
            goto LABEL_35;
          }
          os_unfair_lock_lock(&self->_lock);
          id v19 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v15];
          v20 = [(DNDSSyncEngine *)self _lock_syncEngine];
          v46 = v15;
          dispatch_queue_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
          [v20 addRecordZonesToSave:0 recordZoneIDsToDelete:v21];

          [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordsWithZoneID:v15];
          os_unfair_lock_unlock(&self->_lock);
          v22 = [v15 zoneName];
          [(DNDSSyncEngine *)self _initialSyncForDataSource:v19 withZoneName:v22];
          goto LABEL_25;
      }
      goto LABEL_37;
    }
    if (v14 == 11)
    {
      v39 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v39, OS_LOG_TYPE_DEFAULT, "Record is unknown on the server; flushing metadata and resending",
          buf,
          2u);
      }
      id v15 = [v9 recordID];
      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
          -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.4();
        }
        goto LABEL_35;
      }
      os_unfair_lock_lock(&self->_lock);
      [(DNDSSyncEngineMetadataStoring *)self->_store removeRecordWithID:v15];
      os_unfair_lock_unlock(&self->_lock);
      v51 = v15;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      [(DNDSSyncEngine *)self addRecordIDsToSave:v19 recordIDsToDelete:0];
      goto LABEL_34;
    }
    if (v14 != 14)
    {
LABEL_37:
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:]();
      }
      goto LABEL_36;
    }
    v24 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Server record has changed; resolving conflict", buf, 2u);
    }
    os_unfair_lock_lock(&self->_lock);
    int v25 = [(DNDSSyncEngine *)self _zoneIDForRecord:v9];
    v26 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v25];
    if (v26)
    {
      v45 = v25;
      __int16 v27 = [v10 userInfo];
      id v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

      uint64_t v29 = [v10 userInfo];
      v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F19D08]];

      if (v28)
      {
        [(DNDSSyncEngineMetadataStoring *)self->_store addRecord:v28];
        os_unfair_lock_unlock(&self->_lock);
        [v26 syncEngine:self resolveConflictBetweenClientRecord:v30 andServerRecord:v28];
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
        v41 = [v30 recordID];

        if (v41)
        {
          v42 = [v30 recordID];
          v52[0] = v42;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
          [(DNDSSyncEngine *)self addRecordIDsToSave:v43 recordIDsToDelete:0];
        }
        else
        {
          v44 = (void *)DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
            -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:](v44, v9);
          }
        }
      }
      int v25 = v45;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:]();
      }
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    dispatch_source_t v23 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      -[DNDSSyncEngine syncEngine:failedToSaveRecord:error:].cold.7(v23);
    }
  }
LABEL_36:
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    id v29 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Creating record to save: %{public}@", (uint8_t *)&v28, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  id v9 = [v7 zoneID];
  id v10 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v9];
  if (!v10)
  {
    os_unfair_lock_unlock(&self->_lock);
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = [(DNDSSyncEngineMetadataStoring *)self->_store recordWithID:v7];
  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    id v12 = [v10 syncEngine:self recordTypeForRecordID:v7];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:v12 recordID:v7];
  }
  uint64_t v13 = [v10 syncEngine:self prepareRecordToSave:v11];
  if (v13 == 2)
  {
    uint64_t v14 = (void *)DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      uint64_t v16 = [v11 recordID];
      v17 = [v16 recordName];
      int v28 = 138543362;
      id v29 = v17;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Record %{public}@ has changes from the future; saving healed modifications to last-chance store",
        (uint8_t *)&v28,
        0xCu);
    }
    os_unfair_lock_lock(&self->_lock);
    [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore addRecord:v11];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (v13 != 1)
    {
      if (v13) {
        goto LABEL_21;
      }
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine syncEngine:recordToSaveForRecordID:]();
      }

      goto LABEL_13;
    }
    lastChanceStore = self->_lastChanceStore;
    id v19 = [v11 recordID];
    v20 = [(DNDSSyncEngineLastChanceDataStoring *)lastChanceStore recordWithID:v19];

    if (v20)
    {
      dispatch_queue_t v21 = (void *)DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        dispatch_source_t v23 = [v11 recordID];
        v24 = [v23 recordName];
        int v28 = 138543362;
        id v29 = v24;
        _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Record %{public}@ was overridden locally; removing record in last-chance store.",
          (uint8_t *)&v28,
          0xCu);
      }
      int v25 = self->_lastChanceStore;
      v26 = [v11 recordID];
      [(DNDSSyncEngineLastChanceDataStoring *)v25 removeRecordWithID:v26];
    }
  }
LABEL_21:

  return v11;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Record was deleted: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(DNDSSyncEngine *)self handleDeletedRecordID:v6];
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  id v7 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v6];

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Zone was deleted: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(DNDSSyncEngine *)self removeZoneWithID:v5];
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Zone was purged: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(DNDSSyncEngine *)self purgeZoneWithID:v5];
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  id v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Keybag unlocked", v5, 2u);
  }
  [(DNDSSyncEngine *)self _updateAccountWithCurrentSyncEnabledState];
  [(DNDSSyncEngine *)self _retryLastChanceRecords];
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.DNDSSyncEngine";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = [NSNumber numberWithBool:self->_allowSyncEngineCreation];
  [v6 setObject:v7 forKeyedSubscript:@"allowSyncEngineCreation"];

  id v8 = [NSNumber numberWithBool:self->_state.accountAvailable];
  [v6 setObject:v8 forKeyedSubscript:@"accountAvailable"];

  uint64_t v9 = [NSNumber numberWithBool:self->_state.encryptionAvailable];
  [v6 setObject:v9 forKeyedSubscript:@"encryptionAvailable"];

  uint64_t v10 = [NSNumber numberWithBool:self->_state.featureEnabled];
  [v6 setObject:v10 forKeyedSubscript:@"featureEnabled"];

  uint64_t v11 = [NSNumber numberWithBool:self->_state.supportedDevice];
  [v6 setObject:v11 forKeyedSubscript:@"supportedDevice"];

  id v12 = [NSNumber numberWithBool:self->_state.syncEnabled];
  [v6 setObject:v12 forKeyedSubscript:@"syncEnabled"];

  uint64_t v13 = [NSNumber numberWithBool:self->_state.testing];
  [v6 setObject:v13 forKeyedSubscript:@"testing"];

  uint64_t v14 = [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore records];
  id v15 = [v14 allValues];

  objc_super v40 = v6;
  if (v4) {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  }
  else {
  v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v15;
  uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v54;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v54 != v42) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v53 + 1) + 8 * v16);
        v46 = NSString;
        uint64_t v48 = v16;
        v18 = [v17 recordType];
        v45 = [v17 recordID];
        id v19 = [v45 recordName];
        v20 = [v17 recordID];
        dispatch_queue_t v21 = [v20 zoneID];
        v22 = [v21 zoneName];
        dispatch_source_t v23 = [v17 recordID];
        v24 = [v23 zoneID];
        int v25 = [v24 ownerName];
        uint64_t v47 = [v46 stringWithFormat:@"%@ %@:%@(%@)", v18, v19, v22, v25, lock];

        if (v4)
        {
          [v43 addObject:v43];
          v26 = (void *)v47;
        }
        else
        {
          __int16 v27 = [v17 values];
          int v28 = (void *)[v27 mutableCopy];

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v57[0] = @"DNDSModeConfigurationsRecordMainPartition";
          v57[1] = @"DNDSModeConfigurationsRecordSecondaryPartition";
          id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v50 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                id v35 = [v17 encryptedValues];
                id v36 = [v35 objectForKey:v34];

                if (v36)
                {
                  v37 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v36 options:0 error:0];
                  [v28 setObject:v37 forKeyedSubscript:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }
            while (v31);
          }

          v26 = (void *)v47;
          [v43 setObject:v28 forKeyedSubscript:v47];
        }
        uint64_t v16 = v48 + 1;
      }
      while (v48 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v44);
  }

  [v40 setObject:v43 forKeyedSubscript:@"lastChanceStore"];
  os_unfair_lock_unlock(lock);

  return v40;
}

- (id)_zoneIDForRecord:(id)a3
{
  id v3 = [a3 recordID];
  BOOL v4 = [v3 zoneID];

  return v4;
}

- (void)_retryLastChanceRecords
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  keybag = self->_keybag;
  if (!keybag || [(DNDSKeybagStateProviding *)keybag hasUnlockedSinceBoot])
  {
    os_unfair_lock_lock(p_lock);
    id v5 = [(NSMapTable *)self->_sourcesByZoneName dictionaryRepresentation];
    os_unfair_lock_unlock(p_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v13);
          [(DNDSSyncEngine *)self _retryLastChanceRecordsForDataSource:v12 withZoneName:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_retryLastChanceRecordsForDataSource:(id)a3 withZoneName:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  keybag = self->_keybag;
  if (!keybag || [(DNDSKeybagStateProviding *)keybag hasUnlockedSinceBoot])
  {
    id v30 = v7;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:v7];
    os_unfair_lock_lock(&self->_lock);
    lastChanceStore = self->_lastChanceStore;
    id v29 = v9;
    uint64_t v11 = [v9 zoneID];
    id v12 = [(DNDSSyncEngineLastChanceDataStoring *)lastChanceStore recordsWithZoneID:v11];

    os_unfair_lock_unlock(&self->_lock);
    long long v13 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v20 = [v6 syncEngine:self wantsRecord:v19];
          if (v20)
          {
            uint64_t v21 = v20;
            [v6 syncEngine:self didFetchRecord:v19];
            if (v21 == 1) {
              [v13 addObject:v19];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v16);
    }

    os_unfair_lock_lock(&self->_lock);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v13;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = self->_lastChanceStore;
          int v28 = [*(id *)(*((void *)&v31 + 1) + 8 * j) recordID];
          [(DNDSSyncEngineLastChanceDataStoring *)v27 removeRecordWithID:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }

    os_unfair_lock_unlock(&self->_lock);
    id v7 = v30;
  }
}

- (void)_updateAccountWithCurrentSyncEnabledState
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL syncEnabled = self->_state.syncEnabled;
  os_unfair_lock_unlock(p_lock);
  accountUpdateSource = self->_accountUpdateSource;
  if (syncEnabled) {
    uintptr_t v6 = 2;
  }
  else {
    uintptr_t v6 = 1;
  }
  dispatch_source_merge_data(accountUpdateSource, v6);
}

- (void)_updateAccountWithSyncEnabledState:(BOOL)a3
{
  accountUpdateSource = self->_accountUpdateSource;
  if (a3) {
    uintptr_t v4 = 2;
  }
  else {
    uintptr_t v4 = 1;
  }
  dispatch_source_merge_data(accountUpdateSource, v4);
}

- (void)_syncEngineQueue_updateAccountWithSyncEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncEngineQueue);
  uintptr_t v6 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Updating account", buf, 2u);
  }
  [(DNDSSyncEngine *)self _migrateOldStoresWithSyncEnabledState:v3];
  os_unfair_lock_lock(p_lock);
  BOOL v7 = [(DNDSSyncEngine *)self _lock_isSyncPreferenceEnabled];
  BOOL featureEnabled = self->_state.featureEnabled;
  BOOL supportedDevice = self->_state.supportedDevice;
  os_unfair_lock_unlock(p_lock);
  if (!supportedDevice)
  {
    uint64_t v10 = DNDSLogCloudSync;
    if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Ignoring account change because device is unsupported";
LABEL_9:
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    return;
  }
  if (!featureEnabled)
  {
    uint64_t v10 = DNDSLogCloudSync;
    if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Ignoring account change because feature is not enabled";
    goto LABEL_9;
  }
  keybag = self->_keybag;
  if (keybag && ([(DNDSKeybagStateProviding *)keybag hasUnlockedSinceBoot] & 1) == 0)
  {
    os_unfair_lock_lock(p_lock);
    id v14 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Device is locked", buf, 2u);
    }
    uint64_t v15 = [(DNDSSyncEngine *)self _lock_currentUserRecordID];
    self->_state.accountAvailable = v15 != 0;
    self->_state.encryptionAvailable = [(DNDSSyncEngine *)self _lock_encryptionAvailable];
    uint64_t v16 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = "available";
      if (self->_state.accountAvailable) {
        uint64_t v18 = "available";
      }
      else {
        uint64_t v18 = "unavailable";
      }
      if (!self->_state.encryptionAvailable) {
        uint64_t v17 = "unavailable";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Initial account state is %s; encryption is %s",
        buf,
        0x16u);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_syncEngineQueue);
    container = self->_container;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke;
    v19[3] = &unk_1E6975390;
    v19[4] = self;
    BOOL v20 = v3;
    BOOL v21 = v7;
    [(CKContainer *)container accountStatusWithCompletionHandler:v19];
  }
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_cold_1();
    }
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  }
  else
  {
    uintptr_t v6 = *(os_unfair_lock_s **)(a1 + 32);
    if (a2 == 1)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_76;
      v15[3] = &unk_1E6975368;
      v15[4] = v6;
      v15[5] = 1;
      char v16 = *(unsigned char *)(a1 + 40);
      [(os_unfair_lock_s *)v6 _fetchAccountStateWithCompletionHandler:v15];
    }
    else
    {
      os_unfair_lock_lock(v6 + 6);
      BOOL v7 = objc_msgSend(*(id *)(a1 + 32), "_lock_currentUserRecordID");
      switch(a2)
      {
        case 0:
          uint64_t v8 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = 0;
          uint64_t v9 = "Sync engine will be disabled because of an error: %@";
          uint64_t v10 = v8;
          uint32_t v11 = 12;
          goto LABEL_20;
        case 2:
          id v12 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          *(_WORD *)buf = 0;
          long long v13 = "Sync engine will be disabled because account is restricted";
          goto LABEL_14;
        case 3:
          id v12 = DNDSLogCloudSync;
          if (!os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          *(_WORD *)buf = 0;
          long long v13 = "Sync engine will be disabled because no account exists";
LABEL_14:
          _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_15:
          *(unsigned char *)(*(void *)(a1 + 32) + 72) = *(unsigned char *)(a1 + 40);
          if (!v7) {
            goto LABEL_22;
          }
          *(unsigned char *)(*(void *)(a1 + 32) + 74) = 0;
          *(unsigned char *)(*(void *)(a1 + 32) + 75) = 0;
          objc_msgSend(*(id *)(a1 + 32), "_lock_purgeData");
          objc_msgSend(*(id *)(a1 + 32), "_lock_destroySyncEngine");
          objc_msgSend(*(id *)(a1 + 32), "_lock_setCurrentAccountStatus:", a2);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
          if (*(unsigned char *)(a1 + 41)) {
            [*(id *)(a1 + 32) _purgeDataFromDataSources];
          }
          break;
        case 4:
          uint64_t v14 = DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v9 = "Sync engine will be disabled because the account is unavailable";
            uint64_t v10 = v14;
            uint32_t v11 = 2;
LABEL_20:
            _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
          }
          goto LABEL_21;
        default:
LABEL_21:
          *(unsigned char *)(*(void *)(a1 + 32) + 72) = *(unsigned char *)(a1 + 40);
LABEL_22:
          objc_msgSend(*(id *)(a1 + 32), "_lock_destroySyncEngine");
          objc_msgSend(*(id *)(a1 + 32), "_lock_setCurrentAccountStatus:", a2);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
          break;
      }
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
    }
  }
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_76(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_76_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleAccountFetchWithUpdatedUserRecordID:v7 updatedAccountStatus:*(void *)(a1 + 40) updatedEncryptionAvailable:a3 updatedSyncEnabled:*(unsigned __int8 *)(a1 + 48)];
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
}

- (void)_fetchAccountStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  container = self->_container;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E69753E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CKContainer *)container accountInfoWithCompletionHandler:v7];
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    unsigned int v7 = ([v5 deviceToDeviceEncryptionAvailability] >> 1) & 1;
    id v8 = *(void **)(*(void *)(a1 + 32) + 80);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_79;
    v9[3] = &unk_1E69753B8;
    id v10 = *(id *)(a1 + 40);
    char v11 = v7;
    [v8 fetchUserRecordIDWithCompletionHandler:v9];
  }
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR)) {
      __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_79_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    unsigned int v7 = [v5 recordName];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_handleAccountFetchWithUpdatedUserRecordID:(id)a3 updatedAccountStatus:(int64_t)a4 updatedEncryptionAvailable:(BOOL)a5 updatedSyncEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v10 = [(DNDSSyncEngine *)self _lock_encryptionAvailable];
  uint64_t v11 = [(DNDSSyncEngine *)self _lock_currentUserRecordID];
  BOOL syncEnabled = self->_state.syncEnabled;
  BOOL featureEnabled = self->_state.featureEnabled;
  __int16 v36 = *(_WORD *)&self->_state.supportedDevice;
  long long v13 = DNDSLogCloudSync;
  BOOL v14 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  BOOL v15 = v7;
  if (v7)
  {
    if (v10)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is available", buf, 2u);
      }
      unint64_t v16 = 0;
      BOOL v34 = 1;
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is newly available", buf, 2u);
      }
      BOOL v34 = 1;
      unint64_t v16 = 6;
    }
  }
  else if (v10)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is newly unavailable", buf, 2u);
    }
    BOOL v34 = 0;
    unint64_t v16 = 7;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Encryption is not available", buf, 2u);
    }
    unint64_t v16 = 0;
    BOOL v34 = 0;
  }
  if (syncEnabled && !v6)
  {
    uint64_t v17 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Sync enabled state is newly disabled", buf, 2u);
    }
    unint64_t v16 = 5;
LABEL_26:
    p_os_unfair_lock_t lock = &self->_lock;
    goto LABEL_27;
  }
  uint64_t v18 = DNDSLogCloudSync;
  BOOL v19 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (!syncEnabled && v6)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Sync enabled state is newly enabled", buf, 2u);
    }
    unint64_t v16 = 4;
    goto LABEL_26;
  }
  p_os_unfair_lock_t lock = &self->_lock;
  if (v6)
  {
    if (!v19) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Sync enabled state is unchanged from enabled";
  }
  else
  {
    if (!v19) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    uint64_t v26 = "Sync enabled state is unchanged from disabled";
  }
  _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
LABEL_27:
  if (v9 | v11)
  {
    if (v9)
    {
      if (v11)
      {
        int v23 = [(id)v9 isEqualToString:v11];
        __int16 v24 = DNDSLogCloudSync;
        BOOL v25 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "User record ID is unchanged", buf, 2u);
          }
          BOOL v22 = 1;
        }
        else
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "User record ID has changed", buf, 2u);
          }
          BOOL v22 = 1;
          unint64_t v16 = 3;
        }
      }
      else
      {
        int v28 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          unint64_t v16 = 2;
          _os_log_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEFAULT, "New user record was added", buf, 2u);
          BOOL v22 = 1;
        }
        else
        {
          BOOL v22 = 1;
          unint64_t v16 = 2;
        }
      }
    }
    else
    {
      __int16 v27 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "User record was removed", buf, 2u);
      }
      BOOL v22 = 0;
      unint64_t v16 = 1;
    }
  }
  else
  {
    BOOL v21 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v21, OS_LOG_TYPE_DEFAULT, "User record is unchanged from nil", buf, 2u);
    }
    BOOL v22 = 0;
  }
  self->_state.BOOL syncEnabled = v6;
  self->_state.BOOL featureEnabled = featureEnabled;
  self->_state.accountAvailable = v22;
  self->_state.encryptionAvailable = v34;
  *(_WORD *)&self->_state.BOOL supportedDevice = v36;
  id v29 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v30 = *(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
    if ((~v30 & 0x101010101) != 0) {
      int v31 = (v30 >> 40) & 1;
    }
    else {
      int v31 = 1;
    }
    if (v31) {
      long long v32 = "enabled";
    }
    else {
      long long v32 = "disabled";
    }
    *(_DWORD *)buf = 136315138;
    long long v38 = v32;
    _os_log_impl(&dword_1D3052000, v29, OS_LOG_TYPE_DEFAULT, "Sync engine resolved state: %s", buf, 0xCu);
  }
  switch(v16)
  {
    case 1uLL:
      [(DNDSSyncEngine *)self _lock_purgeData];
      [(DNDSSyncEngine *)self _lock_destroySyncEngine];
      [(DNDSSyncEngine *)self _lock_setCurrentAccountStatus:a4];
      [(DNDSSyncEngine *)self _lock_setEncryptionAvailable:v15];
      os_unfair_lock_unlock(p_lock);
      [(DNDSSyncEngine *)self _purgeDataFromDataSources];
      goto LABEL_72;
    case 2uLL:
      [(DNDSSyncEngine *)self _lock_setCurrentUserRecordID:v9];
      [(DNDSSyncEngine *)self _lock_setCurrentAccountStatus:a4];
      [(DNDSSyncEngine *)self _lock_setEncryptionAvailable:v15];
      os_unfair_lock_unlock(p_lock);
      goto LABEL_70;
    case 3uLL:
    case 5uLL:
      [(DNDSSyncEngine *)self _lock_purgeData];
      [(DNDSSyncEngine *)self _lock_destroySyncEngine];
      [(DNDSSyncEngine *)self _lock_setCurrentUserRecordID:v9];
      goto LABEL_63;
    case 7uLL:
      [(DNDSSyncEngine *)self _lock_destroySyncEngine];
      [(DNDSSyncEngine *)self _lock_setCurrentAccountStatus:a4];
      [(DNDSSyncEngine *)self _lock_setEncryptionAvailable:v15];
      os_unfair_lock_unlock(p_lock);
      goto LABEL_72;
    default:
LABEL_63:
      [(DNDSSyncEngine *)self _lock_setCurrentAccountStatus:a4];
      [(DNDSSyncEngine *)self _lock_setEncryptionAvailable:v15];
      os_unfair_lock_unlock(p_lock);
      if (v16 <= 6)
      {
        if (((1 << v16) & 0x54) != 0
          || ((1 << v16) & 0xA) != 0
          && ([(DNDSSyncEngine *)self _purgeDataFromDataSources], (v16 & 6) == 2))
        {
LABEL_70:
          [(DNDSSyncEngine *)self _initialSyncForDataSources];
        }
      }
LABEL_72:

      return;
  }
}

- (id)_lock_syncEngine
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_allowSyncEngineCreation)
  {
    id v8 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "_allowSyncEngineCreation == NO", buf, 2u);
    }
    goto LABEL_14;
  }
  keybag = self->_keybag;
  if (!keybag || ([(DNDSKeybagStateProviding *)keybag hasUnlockedSinceBoot] & 1) != 0)
  {
    unint64_t v4 = *(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
    if ((v4 & 0x10000000000) == 0 && (v4 & 0x101010101) != 0x101010101)
    {
      id v5 = DNDSLogCloudSync;
      if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = 0;
        BOOL v6 = "Skipping sync engine creation because sync is disabled.";
        BOOL v7 = (uint8_t *)&v20;
LABEL_18:
        _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    syncEngine = self->_syncEngine;
    if (syncEngine)
    {
LABEL_15:
      uint64_t v17 = syncEngine;
      goto LABEL_20;
    }
    BOOL v10 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Sync engine will start", v19, 2u);
    }
    uint64_t v11 = [(CKContainer *)self->_container privateCloudDatabase];
    id v12 = objc_alloc(MEMORY[0x1E4F1A3E0]);
    long long v13 = [(DNDSSyncEngineMetadataStoring *)self->_metadataStore metadata];
    BOOL v14 = (void *)[v12 initWithDatabase:v11 dataSource:self metadata:v13];

    [v14 setApsMachServiceName:@"com.apple.aps.donotdisturb.sync-engine"];
    BOOL v15 = (DNDSSyncEngineSynchronizing *)[objc_alloc(MEMORY[0x1E4F1A3D8]) initWithConfiguration:v14];
    unint64_t v16 = self->_syncEngine;
    self->_syncEngine = v15;

LABEL_14:
    syncEngine = self->_syncEngine;
    goto LABEL_15;
  }
  id v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v21 = 0;
    BOOL v6 = "Skipping sync engine creation because the device has not unlocked.";
    BOOL v7 = v21;
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v17 = 0;
LABEL_20:
  return v17;
}

- (void)_lock_destroySyncEngine
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_allowSyncEngineCreation && self->_syncEngine)
  {
    BOOL v3 = DNDSLogCloudSync;
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Destroying sync engine", v5, 2u);
    }
    syncEngine = self->_syncEngine;
    self->_syncEngine = 0;
  }
}

- (void)_lock_purgeData
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Purging sync engine data", v4, 2u);
  }
  [(DNDSSyncEngineMetadataStoring *)self->_metadataStore purge];
  [(DNDSSyncEngineLastChanceDataStoring *)self->_lastChanceStore purge];
}

- (id)_lock_dataSources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v4 = self->_sourcesByZoneName;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = -[NSMapTable objectForKey:](self->_sourcesByZoneName, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_lock_currentAccountStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  metadataStore = self->_metadataStore;
  return [(DNDSSyncEngineMetadataStoring *)metadataStore accountStatus];
}

- (void)_lock_setCurrentAccountStatus:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = [(DNDSSyncEngineMetadataStoring *)self->_metadataStore accountStatus];
  uint64_t v6 = (void *)DNDSLogCloudSync;
  BOOL v7 = os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT);
  if (v5 == a3)
  {
    if (v7)
    {
      id v8 = v6;
      unint64_t v9 = CKStringFromAccountStatus();
      int v12 = 138543362;
      long long v13 = v9;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Account status is unchanged: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      BOOL v10 = v6;
      long long v11 = CKStringFromAccountStatus();
      int v12 = 138543362;
      long long v13 = v11;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Account status has changed to: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    [(DNDSSyncEngineMetadataStoring *)self->_metadataStore setAccountStatus:a3];
  }
}

- (id)_lock_currentUserRecordID
{
  os_unfair_lock_assert_owner(&self->_lock);
  metadataStore = self->_metadataStore;
  return (id)[(DNDSSyncEngineMetadataStoring *)metadataStore userRecordID];
}

- (BOOL)_lock_encryptionAvailable
{
  os_unfair_lock_assert_owner(&self->_lock);
  metadataStore = self->_metadataStore;
  return [(DNDSSyncEngineMetadataStoring *)metadataStore isEncryptionAvailable];
}

- (void)_lock_setEncryptionAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(DNDSSyncEngineMetadataStoring *)self->_metadataStore isEncryptionAvailable] != v3)
  {
    metadataStore = self->_metadataStore;
    [(DNDSSyncEngineMetadataStoring *)metadataStore setEncryptionAvailable:v3];
  }
}

- (void)_lock_setCurrentUserRecordID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "User record ID has changed to: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(DNDSSyncEngineMetadataStoring *)self->_metadataStore setUserRecordID:v4];
}

- (BOOL)_lock_isSyncEnabled
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = *(unsigned int *)&self->_state.syncEnabled;
  unint64_t v4 = v3 | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
  if ((v4 & 0x10000000000) != 0) {
    return 1;
  }
  BOOL v5 = HIDWORD(v4) & 1;
  return (~v3 & 0x1010101) == 0 && v5;
}

- (BOOL)_lock_isSyncAvailable
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = *(unsigned int *)&self->_state.syncEnabled;
  unint64_t v4 = v3 | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32);
  if ((v4 & 0x10000000000) != 0) {
    return 1;
  }
  BOOL v5 = HIDWORD(v4) & 1;
  return (~v3 & 0x1010100) == 0 && v5;
}

- (BOOL)_lock_isSyncPreferenceEnabled
{
  return ((*(unsigned int *)&self->_state.syncEnabled | ((unint64_t)*(unsigned __int16 *)&self->_state.supportedDevice << 32)) & 0x10000000001) != 0;
}

- (id)_lock_dataSourceForZoneID:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sourcesByZoneName = self->_sourcesByZoneName;
  id v7 = [v5 zoneName];

  uint64_t v8 = [(NSMapTable *)sourcesByZoneName objectForKey:v7];

  return v8;
}

- (id)_lock_dataSourceForRecord:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  int v6 = [(DNDSSyncEngine *)self _zoneIDForRecord:v5];

  id v7 = [(DNDSSyncEngine *)self _lock_dataSourceForZoneID:v6];

  return v7;
}

- (void)_purgeDataFromDataSources
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  unint64_t v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Purging data from data sources", buf, 2u);
  }
  os_unfair_lock_lock(p_lock);
  BOOL syncEnabled = self->_state.syncEnabled;
  int v6 = [(NSMapTable *)self->_sourcesByZoneName dictionaryRepresentation];
  os_unfair_lock_unlock(p_lock);
  if (syncEnabled)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v15 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          long long v13 = [(NSMapTable *)self->_sourcesByZoneName objectForKey:v12];
          uint64_t v14 = DNDSLogCloudSync;
          if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v21 = v12;
            _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Purging data from zone %{public}@", buf, 0xCu);
          }
          [v13 purgeRecordsForSyncEngine:self];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }

    int v6 = v15;
  }
}

- (void)_initialSyncForDataSources
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  unint64_t v4 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Performing initial sync for data sources", buf, 2u);
  }
  os_unfair_lock_lock(p_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    id v5 = [(DNDSSyncEngine *)self _lock_syncEngine];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [(NSMapTable *)self->_sourcesByZoneName dictionaryRepresentation];
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v15);
          [(DNDSSyncEngine *)self _initialSyncForDataSource:v14 withZoneName:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (void)_initialSyncForDataSource:(id)a3 withZoneName:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSSyncEngine *)self _lock_isSyncEnabled])
  {
    id v8 = [(DNDSSyncEngine *)self _lock_syncEngine];

    os_unfair_lock_unlock(&self->_lock);
    if (v8)
    {
      uint64_t v9 = [v6 recordIDsForSyncEngine:self];
      if ([v9 count])
      {
        uint64_t v10 = DNDSLogCloudSync;
        if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          id v12 = v7;
          _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Performing initial sync for zone %{public}@", (uint8_t *)&v11, 0xCu);
        }
        [(DNDSSyncEngine *)self addRecordIDsToSave:v9 recordIDsToDelete:0];
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_migrateOldStoresWithSyncEnabledState:(BOOL)a3
{
  v71[4] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = BSCurrentUserDirectory();
  v71[0] = v5;
  v71[1] = @"Library";
  v71[2] = @"DoNotDisturb";
  v71[3] = @"DB";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
  id v7 = [v4 fileURLWithPathComponents:v6];

  id v8 = [v7 URLByAppendingPathComponent:@"LocalModeConfigurations.json"];
  uint64_t v9 = [v7 URLByAppendingPathComponent:@"LocalModeConfigurationsSecure.json"];
  v58 = [v7 URLByAppendingPathComponent:@"LocalGlobalConfiguration.json"];
  uint64_t v10 = [v7 URLByAppendingPathComponent:@"SyncedGlobalConfiguration.json"];
  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v8 path];
  int v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    uint64_t v14 = DNDSLogGeneral;
    BOOL v15 = os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Erasing configurations from old local stores", buf, 2u);
      }
      long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_globalConfigurationBackingStoreFileURL");
      id v62 = 0;
      char v18 = [v16 moveItemAtURL:v10 toURL:v17 error:&v62];
      id v19 = v62;

      if ((v18 & 1) == 0)
      {
        __int16 v20 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v19;
          _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Could not delete old synced global store: %@", buf, 0xCu);
        }
      }
      uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v61 = v19;
      char v22 = [v21 removeItemAtURL:v8 error:&v61];
      id v23 = v61;

      if ((v22 & 1) == 0)
      {
        __int16 v24 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v23;
          _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Could not delete old mode store: %@", buf, 0xCu);
        }
      }
      BOOL v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v60 = v23;
      char v26 = [v25 removeItemAtURL:v9 error:&v60];
      id v27 = v60;

      if ((v26 & 1) == 0)
      {
        int v28 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v27;
          _os_log_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEFAULT, "Could not delete old secure mode store: %@", buf, 0xCu);
        }
      }
      id v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v59 = v27;
      char v30 = [v29 removeItemAtURL:v58 error:&v59];
      id v31 = v59;

      if ((v30 & 1) == 0)
      {
        long long v32 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v31;
          _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Could not delete old global store: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Migrating configurations from old local stores", buf, 2u);
      }
      long long v33 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v9);
      BOOL v34 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsBackingStoreFileURL");
      id v68 = 0;
      char v35 = [v33 removeItemAtURL:v34 error:&v68];
      id v36 = v68;

      if ((v35 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:].cold.4();
      }
      long long v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v38 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsSecureBackingStoreFileURL");
      id v67 = v36;
      char v39 = [v37 removeItemAtURL:v38 error:&v67];
      id v40 = v67;

      if ((v39 & 1) == 0)
      {
        uint64_t v41 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v40;
          _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Could not delete secure mode store: %@", buf, 0xCu);
        }
      }
      uint64_t v42 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v66 = v40;
      char v43 = [v42 removeItemAtURL:v10 error:&v66];
      id v44 = v66;

      if ((v43 & 1) == 0)
      {
        v45 = DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v44;
          _os_log_impl(&dword_1D3052000, v45, OS_LOG_TYPE_DEFAULT, "Could not delete old synced global store: %@", buf, 0xCu);
        }
      }
      v46 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v47 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsBackingStoreFileURL");
      id v65 = v44;
      char v48 = [v46 moveItemAtURL:v8 toURL:v47 error:&v65];
      id v49 = v65;

      if ((v48 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:]();
      }
      long long v50 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v51 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_modeConfigurationsSecureBackingStoreFileURL");
      id v64 = v49;
      char v52 = [v50 moveItemAtURL:v57 toURL:v51 error:&v64];
      id v53 = v64;

      if ((v52 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:]();
      }
      long long v54 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v55 = objc_msgSend(MEMORY[0x1E4F1CB10], "dnds_globalConfigurationBackingStoreFileURL");
      id v63 = v53;
      char v56 = [v54 moveItemAtURL:v58 toURL:v55 error:&v63];
      id v31 = v63;

      if ((v56 & 1) == 0 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSSyncEngine _migrateOldStoresWithSyncEnabledState:]();
      }
      uint64_t v9 = v57;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_lastChanceStore, 0);
  objc_storeStrong((id *)&self->_metadataStore, 0);
  objc_storeStrong((id *)&self->_sourcesByZoneName, 0);
  objc_storeStrong((id *)&self->_accountUpdateSource, 0);
  objc_storeStrong((id *)&self->_syncEngineQueue, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __90__DNDSSyncEngine_initWithMetadataStore_lastChanceDataStore_syncEngine_keybag_syncEnabled___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = [(id)OUTLINED_FUNCTION_2_1() numberWithUnsignedLong:a2];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v2, OS_LOG_TYPE_ERROR, "Unexpected value in sync dispatch source: %@", v6, 0xCu);
}

- (void)addRecordIDsToSave:recordIDsToDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D3052000, v0, OS_LOG_TYPE_FAULT, "RecordID change was made before sync engine availability.", v1, 2u);
}

- (void)addRecordZonesToSave:recordZoneIDsToDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D3052000, v0, OS_LOG_TYPE_FAULT, "RecordZoneID change was made before sync engine availability.", v1, 2u);
}

void __45__DNDSSyncEngine_sync_withCompletionHandler___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error sending changes: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleDeletedRecordID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not find a source for removing record with ID %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleDeletedRecordID:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Removing record with ID %{public}@ from source %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)syncEngine:(uint64_t)a1 failedToDeleteRecordWithID:(void *)a2 error:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  int v11 = [a3 recordName];
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v5, v6, "Failed to find data source with zoneID %{public}@ for record %{public}@", v7, v8, v9, v10, 2u);
}

- (void)syncEngine:(void *)a1 failedToDeleteRecordWithID:error:.cold.2(void *a1)
{
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_2_1() recordName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v4, v5, "Failed to delete record %{public}@: %{public}@", v6, v7, v8, v9, v10);
}

- (void)syncEngine:failedToSaveRecord:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Unhandled error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)syncEngine:failedToSaveRecord:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to find data source with zoneID %{public}@", v2, v3, v4, v5, v6);
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:(void *)a2 error:.cold.3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 recordID];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v3, OS_LOG_TYPE_ERROR, "Both server and client record IDs are nil for record ID %{public}@", v5, 0xCu);
}

- (void)syncEngine:failedToSaveRecord:error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Record ID is nil; ignoring unknown item", v2, v3, v4, v5, v6);
}

- (void)syncEngine:failedToSaveRecord:error:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Zone ID is nil; ignoring record", v2, v3, v4, v5, v6);
}

- (void)syncEngine:failedToSaveRecord:error:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "ZoneID is nil; ignoring deleted zone", v2, v3, v4, v5, v6);
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:error:.cold.7(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v5, v6, "Unexpected error encountered when saving record %{public}@: %{public}@", v7, v8, v9, v10, v11);
}

- (void)syncEngine:(void *)a1 failedToSaveRecord:error:.cold.8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_2_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v5, v6, "Failed to save record %{public}@: %{public}@", v7, v8, v9, v10, v11);
}

- (void)syncEngine:recordToSaveForRecordID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to create record to save: %{public}@", v2, v3, v4, v5, v6);
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not fetch account status: %@", v2, v3, v4, v5, v6);
}

void __69__DNDSSyncEngine__syncEngineQueue_updateAccountWithSyncEnabledState___block_invoke_76_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not fetch account state: %{public}@", v2, v3, v4, v5, v6);
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not fetch account info ID: %{public}@", v2, v3, v4, v5, v6);
}

void __58__DNDSSyncEngine__fetchAccountStateWithCompletionHandler___block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not fetch user record ID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not replace global store with old store: %@", v2, v3, v4, v5, v6);
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not replace secure mode store with old store: %@", v2, v3, v4, v5, v6);
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not replace mode store with old store: %@", v2, v3, v4, v5, v6);
}

- (void)_migrateOldStoresWithSyncEnabledState:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not delete mode store: %@", v2, v3, v4, v5, v6);
}

@end