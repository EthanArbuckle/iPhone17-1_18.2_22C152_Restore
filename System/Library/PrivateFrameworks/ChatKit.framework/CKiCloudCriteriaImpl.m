@interface CKiCloudCriteriaImpl
+ (BOOL)iCloudBackupEnabledSystemWide;
+ (id)createBackupManager;
+ (id)sharedInstance;
+ (int64_t)otherDevicesCount;
- (void)fetchCloudStorageUsageInformationWithCompletion:(id)a3;
@end

@implementation CKiCloudCriteriaImpl

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_61);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __38__CKiCloudCriteriaImpl_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKiCloudCriteriaImpl);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (void)fetchCloudStorageUsageInformationWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F179C8] defaultStore];
  v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4BFE0]) initDetailedRequestWithAccount:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CKiCloudCriteriaImpl_fetchCloudStorageUsageInformationWithCompletion___block_invoke;
  v8[3] = &unk_1E5624EC0;
  id v9 = v3;
  id v7 = v3;
  [v6 performRequestWithHandler:v8];
}

void __72__CKiCloudCriteriaImpl_fetchCloudStorageUsageInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = [v10 error];

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [v9 debugDescription];
        *(_DWORD *)buf = 138412290;
        double v23 = *(double *)&v13;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "performRequestWithHandler for quota request failed with error %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v14 = [v10 availableStorageInBytes];
    v15 = [v10 usedStorageInBytes];
    v16 = [v10 totalStorageInBytes];
    unint64_t v21 = [v14 unsignedLongValue];
    unint64_t v17 = [v15 unsignedLongValue];
    unint64_t v18 = [v16 unsignedLongValue];
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        double v23 = (double)(v21 >> 20);
        __int16 v24 = 2048;
        double v25 = (double)(v17 >> 20);
        __int16 v26 = 2048;
        double v27 = (double)(v18 >> 20);
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Quota Returned: availableStorageInBytes={%g MB} usedStorageInBytes={%g MB} totalStorageInBytes={%g MB}", buf, 0x20u);
      }
    }
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      (*(void (**)(uint64_t, unint64_t, unint64_t, unint64_t))(v20 + 16))(v20, v21, v17, v18);
    }
  }
}

+ (BOOL)iCloudBackupEnabledSystemWide
{
  v2 = +[CKiCloudCriteriaImpl createBackupManager];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isBackupEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)createBackupManager
{
  if (createBackupManager_onceToken != -1) {
    dispatch_once(&createBackupManager_onceToken, &__block_literal_global_7);
  }
  id v2 = (id)createBackupManager_MBManagerClass;
  if (createBackupManager_MBManagerClass) {
    id v2 = objc_alloc_init((Class)createBackupManager_MBManagerClass);
  }

  return v2;
}

void __43__CKiCloudCriteriaImpl_createBackupManager__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  createBackupManager_MBManagerClass = MEMORY[0x192FBA860](@"MBManager", @"MobileBackup");
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      if (createBackupManager_MBManagerClass) {
        v1 = @"YES";
      }
      else {
        v1 = @"NO";
      }
      int v2 = 138412290;
      id v3 = v1;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Loaded MBManagerClass: %@", (uint8_t *)&v2, 0xCu);
    }
  }
}

+ (int64_t)otherDevicesCount
{
  id v2 = objc_alloc(MEMORY[0x1E4F6AB90]);
  id v3 = (void *)[v2 initWithService:*MEMORY[0x1E4F6AA78]];
  uint64_t v4 = [v3 devices];
  int64_t v5 = [v4 count];

  return v5;
}

@end