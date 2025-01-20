@interface ATXBackupService
+ (BOOL)isBackupRestore;
+ (BOOL)isCloudKitError:(id)a3;
+ (BOOL)isManateeDecryptionError:(id)a3;
+ (id)allErrorsFromCloudKitError:(id)a3;
+ (id)backupService;
+ (id)queryForBackupsWithDeviceID:(id)a3;
- (ATXBackupFileManager)backupFileManager;
- (ATXBackupService)initWithContainerIdentifier:(id)a3 backupFileManager:(id)a4;
- (ATXCloudKitClient)ckClient;
- (ATXCloudStorageSettingsListener)cloudStorageSettingsListener;
- (BOOL)isManatee;
- (BOOL)retryIfNeededInResponseToError:(id)a3 withBlock:(id)a4;
- (NSString)containerIdentifier;
- (NSString)deviceID;
- (OS_dispatch_queue)serialQueue;
- (void)backupWithCompletionHandler:(id)a3;
- (void)fetchBackupAssetWithCompletionHandler:(id)a3;
- (void)getDeviceIDWithCompletionHandler:(id)a3;
- (void)handleDeleteDataRequest;
- (void)initializeCloudKitClientWithCompletionHandler:(id)a3 withRetryBlock:(id)a4;
- (void)isManateeAvailableWithCompletionHandler:(id)a3 withRetryBlock:(id)a4;
- (void)restoreFromBackupIfNeccessary:(id)a3;
- (void)restoreFromBackupWithRetries:(unint64_t)a3 fromContainerID:(id)a4 completionHandler:(id)a5;
- (void)saveBackupAsset:(id)a3 completionHandler:(id)a4;
- (void)setBackupFileManager:(id)a3;
- (void)setCkClient:(id)a3;
- (void)setCloudStorageSettingsListener:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setIsManatee:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)setupRecordZoneWithName:(id)a3 completionHandler:(id)a4;
- (void)updateIsRestoreStarted:(BOOL)a3;
- (void)writeBackupToiCloud:(id)a3;
@end

@implementation ATXBackupService

+ (BOOL)isBackupRestore
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  LOBYTE(v6[0]) = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ATXBackupStateUserDefault", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)v6);
  int v3 = _ATXRestoreIsInProgress();
  v4 = __atxlog_handle_backup();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = AppBooleanValue != 0;
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "db restore state - %{BOOL}u, mobile backup restore state - %{BOOL}u", (uint8_t *)v6, 0xEu);
  }

  if (AppBooleanValue) {
    return 1;
  }
  else {
    return v3;
  }
}

- (ATXBackupService)initWithContainerIdentifier:(id)a3 backupFileManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXBackupService;
  uint64_t v9 = [(ATXBackupService *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerIdentifier, a3);
    objc_storeStrong((id *)&v10->_backupFileManager, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.duetexpertd.atxbackup", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    v14 = +[ATXCloudStorageSettingsListener sharedInstance];
    objc_storeWeak((id *)&v10->_cloudStorageSettingsListener, v14);

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_cloudStorageSettingsListener);
    [WeakRetained setDelegate:v10];

    id v16 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v17 = [v16 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    atxDefaults = v10->_atxDefaults;
    v10->_atxDefaults = (NSUserDefaults *)v17;

    [(ATXBackupService *)v10 updateIsRestoreStarted:0];
  }

  return v10;
}

- (void)updateIsRestoreStarted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5 = __atxlog_handle_backup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "DB restore state is: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  [(NSUserDefaults *)self->_atxDefaults setBool:v3 forKey:@"ATXBackupStateUserDefault"];
}

- (void)backupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ATXBackupService_backupWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E68AB528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __48__ATXBackupService_backupWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  [*(id *)(*(void *)(a1 + 32) + 24) writeBackupFileForD2D];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __48__ATXBackupService_backupWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E68AB500;
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 writeBackupToiCloud:v6];
}

id __48__ATXBackupService_backupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return self;
}

- (void)restoreFromBackupIfNeccessary:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke;
  v7[3] = &unk_1E68AB528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  LOBYTE(keyExistsAndHasValidFormat[0]) = 0;
  if (CFPreferencesGetAppBooleanValue(@"ATXBackupStateUserDefault", (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)keyExistsAndHasValidFormat))
  {
    BOOL v3 = __atxlog_handle_backup();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) updateIsRestoreStarted:0];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) isMobileBackupRestoreNeeded])
  {
    id v4 = __atxlog_handle_backup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keyExistsAndHasValidFormat[0]) = 0;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "restoring from MobileBackup", (uint8_t *)keyExistsAndHasValidFormat, 2u);
    }

    [*(id *)(a1 + 32) updateIsRestoreStarted:1];
    [*(id *)(*(void *)(a1 + 32) + 24) restoreFromMobileBackup];
LABEL_13:
    [*(id *)(a1 + 32) updateIsRestoreStarted:0];
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_14:
    v6();
    goto LABEL_15;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) isD2DRestoreNeeded])
  {
    id v5 = __atxlog_handle_backup();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keyExistsAndHasValidFormat[0]) = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "restoring from D2D", (uint8_t *)keyExistsAndHasValidFormat, 2u);
    }

    [*(id *)(a1 + 32) updateIsRestoreStarted:1];
    [*(id *)(*(void *)(a1 + 32) + 24) restoreFromD2D];
    goto LABEL_13;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 24) isRestoreNeeded])
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  id v7 = __atxlog_handle_backup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(keyExistsAndHasValidFormat[0]) = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "restoring from iCloud", (uint8_t *)keyExistsAndHasValidFormat, 2u);
  }

  [*(id *)(a1 + 32) updateIsRestoreStarted:1];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) containerIDForCloudKitRestore];
  objc_initWeak(keyExistsAndHasValidFormat, *(id *)(a1 + 32));
  uint64_t v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_22;
  v10[3] = &unk_1E68AB550;
  objc_copyWeak(&v13, keyExistsAndHasValidFormat);
  id v12 = *(id *)(a1 + 40);
  id v11 = v2;
  [v9 restoreFromBackupWithRetries:10 fromContainerID:v8 completionHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(keyExistsAndHasValidFormat);

LABEL_15:
}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [WeakRetained updateIsRestoreStarted:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = self;
}

- (void)writeBackupToiCloud:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudStorageSettingsListener);
  char v6 = [(id)objc_opt_class() isBackupForSiriEnabled];

  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke;
    v8[3] = &unk_1E68AB5C8;
    v8[4] = self;
    id v9 = v4;
    [(ATXBackupService *)self initializeCloudKitClientWithCompletionHandler:v8 withRetryBlock:&__block_literal_global_2];
  }
  else
  {
    id v7 = __atxlog_handle_backup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "iCloud backup is not enabled for Siri dataclass, not backing up...", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  char v6 = v5;
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke_2;
    v8[3] = &unk_1E68AB5A0;
    v8[4] = v7;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    [v7 getDeviceIDWithCompletionHandler:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 24) writeBackupFileForDeviceID:a2 pareDown:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16) == 0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ATXBackupService_writeBackupToiCloud___block_invoke_3;
  v7[3] = &unk_1E68AB578;
  char v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  [v4 saveBackupAsset:v5 completionHandler:v7];
}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_3(void *a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = __atxlog_handle_backup();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "backup file succesfully uploaded to container", v8, 2u);
    }

    [*(id *)(a1[4] + 24) commitWithContainerIdentifier:a1[5]];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __40__ATXBackupService_writeBackupToiCloud___block_invoke_3_cold_1();
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)initializeCloudKitClientWithCompletionHandler:(id)a3 withRetryBlock:(id)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(serialQueue);
  id v9 = +[ATXCloudKitClient clientWithContainerIdentifier:self->_containerIdentifier useManatee:1 callbackQueue:self->_serialQueue];
  ckClient = self->_ckClient;
  self->_ckClient = v9;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__ATXBackupService_initializeCloudKitClientWithCompletionHandler_withRetryBlock___block_invoke;
  v12[3] = &unk_1E68AB5F0;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(ATXBackupService *)self isManateeAvailableWithCompletionHandler:v12 withRetryBlock:v8];
}

void __81__ATXBackupService_initializeCloudKitClientWithCompletionHandler_withRetryBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  if (!v5 || (a2 & 1) != 0)
  {
    if (a2)
    {
      *(unsigned char *)(v6 + 16) = 1;
      id v8 = *(id *)(*(void *)(a1 + 32) + 48);
    }
    else
    {
      id v8 = [*(id *)(v6 + 48) stringByAppendingString:@".non-manatee"];
      *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
      uint64_t v9 = +[ATXCloudKitClient clientWithContainerIdentifier:v8 useManatee:0 callbackQueue:*(void *)(*(void *)(a1 + 32) + 64)];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 32);
      *(void *)(v10 + 32) = v9;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)isManateeAvailableWithCompletionHandler:(id)a3 withRetryBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  ckClient = self->_ckClient;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke;
  v11[3] = &unk_1E68AB668;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ATXCloudKitClient *)ckClient fetchAccountInfoWithCompletionHandler:v11];
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 accountStatus];
    switch(v7)
    {
      case 0:
      case 2:
      case 3:
        id v8 = objc_msgSend(NSString, "stringWithFormat:", @"CloudKit container is not accessible. Status: %ld", v7);
        id v9 = __atxlog_handle_backup();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1();
        }

        uint64_t v40 = *MEMORY[0x1E4F28568];
        v41[0] = v8;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
        id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXBackupService" code:1 userInfo:v10];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        break;
      case 1:
        BOOL v22 = ([v5 deviceToDeviceEncryptionAvailability] & 1) == 0;
        v23 = __atxlog_handle_backup();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_3();
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "Manatee is available", buf, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        break;
      case 4:
        id v12 = __atxlog_handle_backup();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_4();
        }

        *(void *)buf = 0;
        v33 = buf;
        uint64_t v34 = 0x3032000000;
        v35 = __Block_byref_object_copy_;
        v36 = __Block_byref_object_dispose_;
        id v37 = 0;
        id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v14 = *MEMORY[0x1E4F19BE0];
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_39;
        v28 = &unk_1E68AB640;
        uint64_t v15 = *(void *)(a1 + 32);
        v31 = buf;
        uint64_t v29 = v15;
        id v30 = *(id *)(a1 + 48);
        uint64_t v16 = [v13 addObserverForName:v14 object:0 queue:0 usingBlock:&v25];
        uint64_t v17 = (void *)*((void *)v33 + 5);
        *((void *)v33 + 5) = v16;

        _Block_object_dispose(buf, 8);
        goto LABEL_10;
      default:
LABEL_10:
        v18 = objc_msgSend(NSString, "stringWithFormat:", @"iCloud account status: %ld", v7, v25, v26, v27, v28, v29);
        v19 = __atxlog_handle_backup();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1();
        }

        uint64_t v38 = *MEMORY[0x1E4F28568];
        v39 = v18;
        objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXBackupService" code:1 userInfo:v20];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_39(uint64_t a1)
{
  id v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "CKAccountChangedNotification notification received", buf, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_40;
  block[3] = &unk_1E68AB618;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupRecordZoneWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v9 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v10 = (void *)[v9 initWithZoneName:v8 ownerName:*MEMORY[0x1E4F19C08]];

  ckClient = self->_ckClient;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke;
  v14[3] = &unk_1E68AB690;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v6;
  id v12 = v6;
  id v13 = v10;
  [(ATXCloudKitClient *)ckClient fetchRecordZone:v13 completionHandler:v14];
}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v7 = __atxlog_handle_backup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_2();
  }

  if (+[ATXBackupService isCloudKitError:v6]
    && [v6 code] == 26)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 32) saveRecordZone:v5 completionHandler:*(void *)(a1 + 48)];
    goto LABEL_3;
  }
  if (+[ATXBackupService isManateeDecryptionError:v6])
  {
    id v8 = __atxlog_handle_backup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_1();
    }

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_49;
    v13[3] = &unk_1E68AB578;
    v13[4] = v10;
    id v14 = v9;
    id v15 = *(id *)(a1 + 48);
    id v12 = v9;
    [v11 deleteRecordZone:v12 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_4:
}

uint64_t __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_49(void *a1)
{
  return [*(id *)(a1[4] + 32) saveRecordZone:a1[5] completionHandler:a1[6]];
}

- (void)saveBackupAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    deviceID = self->_deviceID;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke;
    v9[3] = &unk_1E68AB6E0;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    [(ATXBackupService *)self setupRecordZoneWithName:deviceID completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[ATXBackupService queryForBackupsWithDeviceID:*(void *)(*(void *)(a1 + 32) + 56)];
    id v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_51;
    v13[3] = &unk_1E68AB6B8;
    id v14 = v6;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v11;
    id v18 = *(id *)(a1 + 48);
    [v8 fetchRecords:v7 inZone:v9 completionHandler:v13];
  }
  else
  {
    id v12 = __atxlog_handle_backup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = __atxlog_handle_backup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_51_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if ([v5 count])
  {
    id v14 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    uint64_t v16 = [*(id *)(a1 + 40) zoneID];
    id v14 = (void *)[v15 initWithRecordType:@"backups" zoneID:v16];

    [v14 setObject:*(void *)(*(void *)(a1 + 48) + 56) forKeyedSubscript:@"deviceUUID"];
  }
  id v17 = __atxlog_handle_backup();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 56);
    int v21 = 138412290;
    uint64_t v22 = v18;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "backup url %@", (uint8_t *)&v21, 0xCu);
  }

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F19E50]) initWithFileURL:*(void *)(a1 + 56)];
  [v14 setObject:v19 forKeyedSubscript:@"backupFile"];
  objc_super v20 = __atxlog_handle_backup();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "uploading asset...", (uint8_t *)&v21, 2u);
  }

  [*(id *)(*(void *)(a1 + 48) + 32) saveRecord:v14 completionHandler:*(void *)(a1 + 64)];
}

- (void)fetchBackupAssetWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_backup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "fetching backup asset", buf, 2u);
  }

  id v6 = [(ATXBackupFileManager *)self->_backupFileManager deviceID];
  if ([v6 length])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:v6];
    uint64_t v8 = +[ATXBackupService queryForBackupsWithDeviceID:v6];
    ckClient = self->_ckClient;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E68AB708;
    uint64_t v12 = v4;
    [(ATXCloudKitClient *)ckClient fetchRecords:v8 inZone:v7 completionHandler:v11];
    uint64_t v10 = v12;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Unable to fetch backup asset. No device identifier set or is empty string";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXBackupService" code:1 userInfo:v7];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
    uint64_t v10 = __atxlog_handle_backup();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXBackupService fetchBackupAssetWithCompletionHandler:]();
    }
  }
}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_backup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    if ([v5 count])
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:0];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"backupFile"];
      uint64_t v10 = [v9 fileURL];
      uint64_t v11 = [v10 path];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_7;
    }
    id v7 = __atxlog_handle_backup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_7:
}

- (void)restoreFromBackupWithRetries:(unint64_t)a3 fromContainerID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke;
    aBlock[3] = &unk_1E68AB730;
    aBlock[4] = self;
    unint64_t v29 = a3;
    id v10 = v8;
    id v27 = v10;
    id v11 = v9;
    id v28 = v11;
    uint64_t v12 = _Block_copy(aBlock);
    if (v10)
    {
      uint64_t v13 = [(NSString *)self->_containerIdentifier stringByAppendingString:@".non-manatee"];
      int v14 = [v10 isEqualToString:v13];
      if (v14 & 1) != 0 || ([v10 isEqualToString:self->_containerIdentifier])
      {
        id v15 = +[ATXCloudKitClient clientWithContainerIdentifier:self->_containerIdentifier useManatee:v14 ^ 1u callbackQueue:self->_serialQueue];
        ckClient = self->_ckClient;
        self->_ckClient = v15;

        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_67;
        v23[3] = &unk_1E68AB758;
        v23[4] = self;
        id v24 = v12;
        id v25 = v11;
        [(ATXBackupService *)self fetchBackupAssetWithCompletionHandler:v23];
      }
      else
      {
        v19 = __atxlog_handle_backup();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:]();
        }

        (*((void (**)(id, void))v11 + 2))(v11, 0);
      }
    }
    else
    {
      uint64_t v18 = __atxlog_handle_backup();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:]();
      }

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_69;
      v20[3] = &unk_1E68AB780;
      v20[4] = self;
      id v21 = v12;
      id v22 = v11;
      [(ATXBackupService *)self initializeCloudKitClientWithCompletionHandler:v20 withRetryBlock:v21];
    }
  }
  else
  {
    id v17 = __atxlog_handle_backup();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXBackupService restoreFromBackupWithRetries:fromContainerID:completionHandler:]();
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restoreFromBackupWithRetries:*(void *)(a1 + 56) - 1 fromContainerID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_67(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) retryIfNeededInResponseToError:a3 withBlock:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v6 = __atxlog_handle_backup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "backup asset successfully fetched", v7, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) restoreFromBackup:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_69(uint64_t a1)
{
  id v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "initialized CloudKit client", buf, 2u);
  }

  BOOL v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_70;
  v4[3] = &unk_1E68AB758;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 fetchBackupAssetWithCompletionHandler:v4];
}

void __83__ATXBackupService_restoreFromBackupWithRetries_fromContainerID_completionHandler___block_invoke_70(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) retryIfNeededInResponseToError:a3 withBlock:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v6 = __atxlog_handle_backup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "backup asset successfully fetched", v7, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) restoreFromBackup:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getDeviceIDWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_deviceID)
  {
    v4[2](v4);
  }
  else
  {
    ckClient = self->_ckClient;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E68AB7A8;
    void v6[4] = self;
    id v7 = v4;
    [(ATXCloudKitClient *)ckClient fetchCurrentDeviceIDWithCompletionHandler:v6];
  }
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  if (![v5 length])
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_2();
    }
LABEL_7:
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v5;
  id v10 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)queryForBackupsWithDeviceID:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"deviceUUID == %@", a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"backups" predicate:v3];

  return v4;
}

- (BOOL)retryIfNeededInResponseToError:(id)a3 withBlock:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (+[ATXBackupService isCloudKitError:v6])
    {
      [(id)objc_opt_class() allErrorsFromCloudKitError:v6];
      memset(v51, 0, 64);
      uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:v51 objects:v52 count:16];
      BOOL v10 = v9 != 0;
      if (v9)
      {
        id v11 = *(void **)v51[1];
        if ([*(id *)v51[1] code] == 111)
        {
          uint64_t v12 = __atxlog_handle_backup();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:]();
          }

          uint64_t v45 = 0;
          v46 = &v45;
          uint64_t v47 = 0x3032000000;
          v48 = __Block_byref_object_copy_;
          v49 = __Block_byref_object_dispose_;
          id v50 = 0;
          uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v14 = *MEMORY[0x1E4F19C98];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke;
          v42[3] = &unk_1E68AB640;
          v44 = &v45;
          v42[4] = self;
          id v43 = v7;
          uint64_t v15 = [v13 addObserverForName:v14 object:0 queue:0 usingBlock:v42];
          uint64_t v16 = (void *)v46[5];
          v46[5] = v15;

          _Block_object_dispose(&v45, 8);
        }
        else if ([v11 code] == 110)
        {
          id v17 = __atxlog_handle_backup();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:]();
          }

          uint64_t v45 = 0;
          v46 = &v45;
          uint64_t v47 = 0x3032000000;
          v48 = __Block_byref_object_copy_;
          v49 = __Block_byref_object_dispose_;
          id v50 = 0;
          uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v19 = *MEMORY[0x1E4F19BE0];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_77;
          v39[3] = &unk_1E68AB640;
          v41 = &v45;
          v39[4] = self;
          id v40 = v7;
          uint64_t v20 = [v18 addObserverForName:v19 object:0 queue:0 usingBlock:v39];
          id v21 = (void *)v46[5];
          v46[5] = v20;

          _Block_object_dispose(&v45, 8);
        }
        else if (CKCanRetryForError())
        {
          CKRetryAfterSecondsForError();
          if (v22 >= 1.0) {
            double v23 = v22;
          }
          else {
            double v23 = 1.0;
          }
          id v24 = __atxlog_handle_backup();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:]();
          }

          id v25 = (void *)MEMORY[0x1E4F93B18];
          serialQueue = self->_serialQueue;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_80;
          v37[3] = &unk_1E68AB618;
          id v38 = v7;
          [v25 runAsyncOnQueue:serialQueue afterDelaySeconds:v37 block:v23];
        }
        else if ([v11 code] == 9)
        {
          id v27 = (void *)MEMORY[0x1E4F93B18];
          id v28 = self->_serialQueue;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_2;
          v35[3] = &unk_1E68AB618;
          id v36 = v7;
          [v27 runAsyncOnQueue:v28 afterDelaySeconds:v35 block:1.0];
        }
        else
        {
          unint64_t v29 = __atxlog_handle_backup();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.4();
          }

          id v30 = (void *)MEMORY[0x1E4F93B18];
          v31 = self->_serialQueue;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_81;
          v33[3] = &unk_1E68AB618;
          id v34 = v7;
          [v30 runAsyncOnQueue:v31 afterDelaySeconds:v33 block:10.0];
        }
      }
    }
    else
    {
      uint64_t v8 = __atxlog_handle_backup();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXBackupService retryIfNeededInResponseToError:withBlock:].cold.5();
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "CKIdentityUpdateNotification notification received", buf, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_76;
  block[3] = &unk_1E68AB618;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_77(uint64_t a1)
{
  id v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "CKAccountChangedNotification notification received", buf, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_78;
  block[3] = &unk_1E68AB618;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__ATXBackupService_retryIfNeededInResponseToError_withBlock___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allErrorsFromCloudKitError:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 code] == 2)
  {
    id v4 = [v3 userInfo];
    uint64_t v5 = *MEMORY[0x1E4F19CD8];
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v3 userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:v5];
      BOOL v10 = [v9 allValues];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else if ([v3 code] == 1)
  {
    id v11 = [v3 userInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    uint64_t v13 = [v12 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v14)
    {
      v17[0] = v12;
      BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    id v16 = v3;
    BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }

  return v10;
}

+ (BOOL)isCloudKitError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F19DD8]])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 domain];
    char v5 = [v6 isEqualToString:*MEMORY[0x1E4F19C40]];
  }
  return v5;
}

+ (BOOL)isManateeDecryptionError:(id)a3
{
  id v3 = a3;
  if (!+[ATXBackupService isCloudKitError:v3])
  {
    BOOL v4 = 0;
    goto LABEL_14;
  }
  if ([v3 code] != 112)
  {
    id v5 = v3;
    id v6 = [v5 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v7 = [v5 code];

      if (v7 == 1)
      {
        uint64_t v8 = [v5 userInfo];
        uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        uint64_t v10 = [v9 code];
        BOOL v4 = 1;
        if ((unint64_t)(v10 - 5000) < 5 || v10 == 112) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v9 = v5;
LABEL_12:
    BOOL v4 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v4 = 1;
LABEL_14:

  return v4;
}

- (void)handleDeleteDataRequest
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ATXBackupService_handleDeleteDataRequest__block_invoke;
  block[3] = &unk_1E68AB818;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __43__ATXBackupService_handleDeleteDataRequest__block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Deleting all backups", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ATXBackupService_handleDeleteDataRequest__block_invoke_83;
  v5[3] = &unk_1E68AB7F0;
  v5[4] = v3;
  return [v3 initializeCloudKitClientWithCompletionHandler:v5 withRetryBlock:&__block_literal_global_89];
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_83(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) deviceID];
    if (v7)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:v7];
      [*(id *)(*(void *)(a1 + 32) + 32) deleteRecordZone:v8 completionHandler:&__block_literal_global_86];
    }
    else
    {
      uint64_t v9 = __atxlog_handle_backup();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Skipping iCloud deletion because no backup has been made", v10, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = __atxlog_handle_backup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__ATXBackupService_handleDeleteDataRequest__block_invoke_83_cold_1();
    }
  }
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_84(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  id v5 = __atxlog_handle_backup();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Backups deleted", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __43__ATXBackupService_handleDeleteDataRequest__block_invoke_84_cold_1();
  }
}

- (ATXBackupFileManager)backupFileManager
{
  return self->_backupFileManager;
}

- (void)setBackupFileManager:(id)a3
{
}

- (ATXCloudKitClient)ckClient
{
  return self->_ckClient;
}

- (void)setCkClient:(id)a3
{
}

- (ATXCloudStorageSettingsListener)cloudStorageSettingsListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudStorageSettingsListener);
  return (ATXCloudStorageSettingsListener *)WeakRetained;
}

- (void)setCloudStorageSettingsListener:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (BOOL)isManatee
{
  return self->_isManatee;
}

- (void)setIsManatee:(BOOL)a3
{
  self->_isManatee = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_destroyWeak((id *)&self->_cloudStorageSettingsListener);
  objc_storeStrong((id *)&self->_ckClient, 0);
  objc_storeStrong((id *)&self->_backupFileManager, 0);
  objc_storeStrong((id *)&self->_atxDefaults, 0);
}

+ (id)backupService
{
  id v3 = [ATXBackupFileManager alloc];
  id v4 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  id v5 = +[_ATXDataStore sharedInstance];
  id v6 = [(ATXBackupFileManager *)v3 initWithBackupDirectory:v4 dataProviderDelegate:v5];

  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithContainerIdentifier:@"com.apple.ProactivePredictionsBackup" backupFileManager:v6];
  return v7;
}

void __50__ATXBackupService_restoreFromBackupIfNeccessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "restore state shouldn't be YES at this point", v2, v3, v4, v5, v6);
}

void __40__ATXBackupService_writeBackupToiCloud___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "backup file failed to uploaded with error: %@", v2, v3, v4, v5, v6);
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "iCloud account doesn't support end-to-end encryption: %ld", v2, v3, v4, v5, v6);
}

void __75__ATXBackupService_isManateeAvailableWithCompletionHandler_withRetryBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "account status is CKAccountStatusTemporarilyUnavailable, listening for CKAccountChangedNotification", v2, v3, v4, v5, v6);
}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Manatee identity is lost; the current record zone will no longer be readable %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __62__ATXBackupService_setupRecordZoneWithName_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error fetching record zone: %@", v2, v3, v4, v5, v6);
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error setting up record zone: %@", v2, v3, v4, v5, v6);
}

void __54__ATXBackupService_saveBackupAsset_completionHandler___block_invoke_51_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchBackupAssetWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Error fetching backup asset: %@", v2, v3, v4, v5, v6);
}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "No results with the backed up device id", v2, v3, v4, v5, v6);
}

void __58__ATXBackupService_fetchBackupAssetWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error fetching backup asset: %@", v2, v3, v4, v5, v6);
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "retry count exceeded, restore failed", v2, v3, v4, v5, v6);
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "no container identifier, falling back to existing restore flow", v2, v3, v4, v5, v6);
}

- (void)restoreFromBackupWithRetries:fromContainerID:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "unknown container identifier %@", v2, v3, v4, v5, v6);
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Fetched DeviceID was nil, error: %@", v2, v3, v4, v5, v6);
}

void __53__ATXBackupService_getDeviceIDWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Fetched DeviceID was empty string", v2, v3, v4, v5, v6);
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Keychain is still syncing, listening for CKIdentityUpdateNotification", v2, v3, v4, v5, v6);
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "listening for CKAccountChangedNotification", v2, v3, v4, v5, v6);
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Retrying retryable error %@ in %lu seconds", v2, 0x16u);
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "unrecoverable error %@", v2, v3, v4, v5, v6);
}

- (void)retryIfNeededInResponseToError:withBlock:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unknown error: (%{public}@)", v2, v3, v4, v5, v6);
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_83_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Failed to initialize CloudKit client %@", v2, v3, v4, v5, v6);
}

void __43__ATXBackupService_handleDeleteDataRequest__block_invoke_84_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting all backups: %@", v2, v3, v4, v5, v6);
}

@end