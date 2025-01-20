@interface _DKCloudUtilities
+ (BOOL)isCloudKitEnabled;
+ (BOOL)isSyncAvailableAndEnabled;
+ (BOOL)isSyncAvailableAndEnabledWithVerboseLogging:(BOOL)a3;
+ (BOOL)isUnitTesting;
+ (NSString)containerIdentifier;
+ (id)sharedInstance;
+ (void)setCloudKitEnabled:(BOOL)a3;
+ (void)setUnitTesting:(BOOL)a3;
- (BOOL)isCloudSyncAvailable;
- (BOOL)isSingleDevice;
- (BOOL)isSiriCloudSyncEnabled;
- (BOOL)supportsDeviceToDeviceEncryption;
- (_DKCloudUtilities)init;
- (id)containerKeyValueStore;
- (id)keyValueStore;
- (void)_accountDidChange:(id)a3;
- (void)_fetchAccountInfoWithCompletionHandler:(void *)a1;
- (void)_fetchCloudKitConfigurationAndStatus;
- (void)_performUpdateNumberOfSyncedDevicesWithAttempt:(void *)a3 completionHandler:;
- (void)_updateAccountInfo:(void *)a3 error:;
- (void)_updateNumberOfSyncedDevicesWithCompletionHandler:(uint64_t)a1;
- (void)dealloc;
- (void)deleteRemoteStateWithReply:(id)a3;
- (void)init;
- (void)isSingleDevice;
- (void)setCloudSyncAvailable:(BOOL)a3;
@end

@implementation _DKCloudUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___DKCloudUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized != -1) {
    dispatch_once(&sharedInstance_initialized, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

+ (NSString)containerIdentifier
{
  return (NSString *)@"com.apple.knowledgestore4";
}

+ (BOOL)isCloudKitEnabled
{
  return _DKIsCloudKitEnabled;
}

+ (void)setCloudKitEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = @"disabled";
    if (v3) {
      v5 = @"enabled";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "Cloud kit is being %@", (uint8_t *)&v6, 0xCu);
  }

  _DKIsCloudKitEnabled = v3;
}

+ (BOOL)isUnitTesting
{
  return _DKIsUnitTesting;
}

+ (void)setUnitTesting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = @"disabled";
    if (v3) {
      v5 = @"enabled";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "Unit tesing is being %@", (uint8_t *)&v6, 0xCu);
  }

  _DKIsUnitTesting = v3;
}

+ (BOOL)isSyncAvailableAndEnabled
{
  return [a1 isSyncAvailableAndEnabledWithVerboseLogging:0];
}

+ (BOOL)isSyncAvailableAndEnabledWithVerboseLogging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = +[_DKCloudUtilities sharedInstance];
  int v6 = [v5 isCloudSyncAvailable];

  uint64_t v7 = +[_DKCloudUtilities sharedInstance];
  [(id)v7 isSiriCloudSyncEnabled];

  LODWORD(v7) = [a1 isCloudKitEnabled];
  int v8 = v7 & ~[a1 isUnitTesting] & v6;
  if (v3)
  {
    v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ([a1 isCloudKitEnabled]) {
        v10 = @"yes";
      }
      else {
        v10 = @"no";
      }
      if (v6) {
        v11 = @"yes";
      }
      else {
        v11 = @"no";
      }
      int v15 = 138413570;
      if ([a1 isUnitTesting]) {
        v12 = @"yes";
      }
      else {
        v12 = @"no";
      }
      v16 = v10;
      if (v8) {
        v13 = @"yes";
      }
      else {
        v13 = @"no";
      }
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = @"yes";
      __int16 v21 = 2112;
      v22 = @"yes";
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "isCloudKitEnabled = %@, isCloudSyncAvailable = %@, syncEnabledByPolicy = %@, siriCloudSyncEnabled = %@, isUnitTesting = %@, isSyncAvailableAndEnabled = %@", (uint8_t *)&v15, 0x3Eu);
    }
  }
  return v8;
}

- (_DKCloudUtilities)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DKCloudUtilities;
  v2 = [(_DKCloudUtilities *)&v16 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.coreduet.cloud.utilities", v3);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v4;

    if (_DKIsUnitTesting
      || !+[_DKCloudUtilities isCloudKitEnabled])
    {
      v2->_supportsDeviceToDeviceEncryption = 0;
    }
    else
    {
      v2->_supportsDeviceToDeviceEncryption = 0;
      int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v2 selector:sel__accountDidChange_ name:*MEMORY[0x1E4F19BE0] object:0];

      uint64_t v7 = v2->_fetchQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __25___DKCloudUtilities_init__block_invoke;
      v14[3] = &unk_1E560D578;
      int v15 = v2;
      int v8 = v14;
      v9 = v7;
      v10 = (void *)os_transaction_create();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
      block[3] = &unk_1E560D978;
      id v18 = v10;
      id v19 = v8;
      id v11 = v10;
      dispatch_async(v9, block);
    }
    v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      [(_DKCloudUtilities *)(uint64_t)v2 init];
    }
  }
  return v2;
}

- (id)keyValueStore
{
  if (a1)
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    BOOL v3 = +[_DKSync2Coordinator keyValueStoreForDomain:]((uint64_t)_DKSync2Coordinator, v2);
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (void)_fetchCloudKitConfigurationAndStatus
{
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    BOOL v3 = +[_DKSyncSerializer underlyingQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke;
    v4[3] = &unk_1E560D578;
    v4[4] = a1;
    [v2 performWithMinimumIntervalInSecondsOf:@"FetchAccountInfo" name:v3 queue:v4 activityBlock:60.0];
  }
}

- (void)dealloc
{
  if (!_DKIsUnitTesting && +[_DKCloudUtilities isCloudKitEnabled])
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F19BE0] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKCloudUtilities;
  [(_DKCloudUtilities *)&v4 dealloc];
}

- (id)containerKeyValueStore
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = NSString;
    v2 = (objc_class *)objc_opt_class();
    BOOL v3 = NSStringFromClass(v2);
    v9[0] = v3;
    objc_super v4 = +[_DKCloudUtilities containerIdentifier];
    v9[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    int v6 = [v1 pathWithComponents:v5];

    uint64_t v7 = +[_DKSync2Coordinator keyValueStoreForDomain:]((uint64_t)_DKSync2Coordinator, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)isCloudSyncAvailable
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setCloudSyncAvailable:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

- (BOOL)isSingleDevice
{
  BOOL v3 = -[_DKCloudUtilities keyValueStore]((uint64_t)self);
  objc_super v4 = [v3 arrayForKey:@"_DKCloudSyncDevices"];

  if (v4) {
    BOOL v5 = (unint64_t)[v4 count] < 2;
  }
  else {
    BOOL v5 = 0;
  }
  if (isSingleDevice_firstTime != 1 || self->_isSingleDevice != v5)
  {
    isSingleDevice_firstTime = 1;
    int v6 = +[_CDLogging syncChannel];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v7) {
        -[_DKCloudUtilities isSingleDevice](v4);
      }
    }
    else if (v7)
    {
      -[_DKCloudUtilities isSingleDevice]();
    }
  }
  self->_isSingleDevice = v5;

  return v5;
}

- (BOOL)isSiriCloudSyncEnabled
{
  v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 cloudSyncEnabled];

  return v3;
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)_accountDidChange:(id)a3
{
  fetchQueue = self->_fetchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39___DKCloudUtilities__accountDidChange___block_invoke;
  v8[3] = &unk_1E560D578;
  v8[4] = self;
  objc_super v4 = v8;
  BOOL v5 = fetchQueue;
  int v6 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
  block[3] = &unk_1E560D978;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  dispatch_async(v5, block);
}

- (void)_updateNumberOfSyncedDevicesWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  objc_super v4 = v3;
  if (a1)
  {
    BOOL v5 = *(void **)(a1 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E560D618;
    v8[4] = a1;
    id v9 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E560DA20;
    id v7 = v9;
    [v5 performNoMoreOftenInDaysThan:@"UpdateNumberOfSyncedDevices" name:v8 activityBlock:v6 throttleBlock:1.0];
  }
}

- (void)_fetchAccountInfoWithCompletionHandler:(void *)a1
{
  location[5] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:]();
    }

    BOOL v5 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.knowledgestore4"];
    if (v5)
    {
      objc_initWeak(location, a1);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E560D9D0;
      objc_copyWeak(&v8, location);
      id v7 = v3;
      [v5 accountInfoWithCompletionHandler:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }
  }
}

- (void)_updateAccountInfo:(void *)a3 error:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[_CDLogging syncChannel];
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_DKCloudUtilities _updateAccountInfo:error:].cold.4();
      }

      int v9 = *(unsigned __int8 *)(a1 + 24);
      if (v9 != [v5 supportsDeviceToDeviceEncryption])
      {
        +[_DKCloudUtilities isSyncAvailableAndEnabledWithVerboseLogging:1];
        id v10 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[_DKCloudUtilities _updateAccountInfo:error:](v5);
        }

        *(unsigned char *)(a1 + 24) = [v5 supportsDeviceToDeviceEncryption];
        +[_DKCloudUtilities isSyncAvailableAndEnabledWithVerboseLogging:1];
      }
      *(unsigned char *)(a1 + 24) = [v5 supportsDeviceToDeviceEncryption];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_DKCloudUtilities _updateAccountInfo:error:](v6);
      }

      if (*(unsigned char *)(a1 + 24))
      {
        id v11 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[_DKCloudUtilities _updateAccountInfo:error:]();
        }
      }
      *(unsigned char *)(a1 + 24) = 0;
    }
    v12 = dispatch_get_global_queue(2, 0);
    v13 = (void *)os_transaction_create();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
    v15[3] = &unk_1E560D978;
    id v16 = v13;
    id v17 = &__block_literal_global_554;
    id v14 = v13;
    dispatch_async(v12, v15);
  }
}

- (void)deleteRemoteStateWithReply:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, uint64_t, void))a3;
  if (+[_DKCloudUtilities isUnitTesting]
    || !+[_DKCloudUtilities isCloudKitEnabled])
  {
    v3[2](v3, 1, 0);
  }
  else
  {
    objc_super v4 = (void *)os_transaction_create();
    id v5 = (void *)MEMORY[0x1E4F19EC8];
    id v6 = +[_DKCloudUtilities containerIdentifier];
    id v7 = [v5 containerWithIdentifier:v6];

    id v8 = [v7 privateCloudDatabase];
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"com.apple.coredata.cloudkit.zone"];
    id v10 = objc_alloc(MEMORY[0x1E4F1A180]);
    id v11 = [v9 zoneID];
    v21[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v13 = (void *)[v10 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v12];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke;
    id v18 = &unk_1E560D9F8;
    id v19 = v4;
    v20 = v3;
    id v14 = v4;
    [v13 setModifyRecordZonesCompletionBlock:&v15];
    objc_msgSend(v8, "addOperation:", v13, v15, v16, v17, v18);
  }
}

- (void)_performUpdateNumberOfSyncedDevicesWithAttempt:(void *)a3 completionHandler:
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v27 = (void *)os_transaction_create();
    id v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:]();
    }
    v30 = v5;

    v29 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.knowledgestore4"];
    v28 = [v29 privateCloudDatabase];
    id v7 = -[_DKCloudUtilities keyValueStore](a1);
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"metadata_zone"];
    uint64_t v9 = [v8 zoneID];
    id v10 = -[_DKCloudUtilities containerKeyValueStore](a1);
    uint64_t v11 = [v10 dataForKey:@"_DKCloudSyncMetadataChangeToken"];
    v49[0] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    v13 = objc_opt_new();
    if (v11)
    {
      id v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
      [v13 setPreviousServerChangeToken:v14];
    }
    uint64_t v47 = v9;
    v48 = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v26 = (void *)v11;
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A070]) initWithRecordZoneIDs:v12 optionsByRecordZoneID:v15];
    [v16 setFetchAllChanges:1];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke;
    v44[3] = &unk_1E560DA48;
    id v17 = v7;
    id v45 = v17;
    uint64_t v46 = a1;
    [v16 setRecordChangedBlock:v44];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_584;
    v41[3] = &unk_1E560DA70;
    id v18 = v17;
    id v42 = v18;
    uint64_t v43 = a1;
    [v16 setRecordWithIDWasDeletedBlock:v41];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_2;
    v39[3] = &unk_1E560DA98;
    __int16 v25 = (void *)v9;
    id v19 = (void *)v12;
    id v20 = v10;
    id v40 = v20;
    [v16 setRecordZoneFetchCompletionBlock:v39];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3;
    v31[3] = &unk_1E560DAC0;
    id v32 = v18;
    id v33 = v8;
    uint64_t v38 = a2;
    id v34 = v20;
    uint64_t v35 = a1;
    id v36 = v27;
    id v37 = v30;
    id v21 = v27;
    id v22 = v20;
    id v23 = v8;
    id v24 = v18;
    [v16 setFetchRecordZoneChangesCompletionBlock:v31];
    [v28 addOperation:v16];

    id v5 = v30;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityThrottler, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 24)) {
    v2 = @"enabled";
  }
  else {
    v2 = @"disabled";
  }
  int v3 = 138412290;
  objc_super v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Cloud sync initialized to %@", (uint8_t *)&v3, 0xCu);
}

- (void)isSingleDevice
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "There are %@ devices syncing", v4, v5, v6, v7, 2u);
}

- (void)_fetchAccountInfoWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch account info: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchAccountInfoWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Fetching account info", v2, v3, v4, v5, v6);
}

- (void)_updateAccountInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Device to device encryption is being disabled due to error fetching account info", v2, v3, v4, v5, v6);
}

- (void)_updateAccountInfo:(void *)a1 error:.cold.2(void *a1)
{
  uint64_t v2 = [a1 domain];
  [a1 code];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_5(&dword_18ECEB000, v3, v4, "Failed to fetch account info: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);
}

- (void)_updateAccountInfo:(void *)a1 error:.cold.3(void *a1)
{
  [a1 supportsDeviceToDeviceEncryption];
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "Device to device encryption is %@", v3, v4, v5, v6, 2u);
}

- (void)_updateAccountInfo:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Fetched account info", v2, v3, v4, v5, v6);
}

- (void)_performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Fetching number of sync devices", v2, v3, v4, v5, v6);
}

@end