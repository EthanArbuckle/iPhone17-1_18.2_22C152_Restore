@interface ATDeviceSettings
+ (ATDeviceSettings)sharedInstance;
- (ATDeviceSettings)init;
- (BOOL)fairPlayEnabled;
- (BOOL)grappaEnabled;
- (BOOL)hasCompletedDataMigration;
- (BOOL)isDeviceLinkClient;
- (BOOL)isSyncPendingForDataClass:(id)a3;
- (BOOL)restoreBatchingEnabled;
- (BOOL)useNewDownloadService;
- (BOOL)watchProxyDownloadsDisabled;
- (NSArray)dataClassesNeedingSync;
- (NSString)interfaceName;
- (NSString)libraryIdentifier;
- (NSString)serviceDomain;
- (NSString)serviceName;
- (NSString)serviceType;
- (double)lastAuthenticationDialogResponseTime;
- (double)pairingSyncCompletionTime;
- (id)_endpointInfoForLibrary:(id)a3;
- (id)endpointInfo;
- (id)getCurrentInstallDisposition;
- (id)getPreExistingStoreIdentifiers;
- (id)hostInfoForLibrary:(id)a3;
- (id)lastSyncTimeForLibrary:(id)a3 dataClass:(id)a4;
- (id)syncStateForLibrary:(id)a3 dataClass:(id)a4;
- (int)activeRestoreType;
- (unint64_t)restoreBatchSize;
- (unint64_t)versionForDataclass:(id)a3;
- (void)_setEndpointInfo:(id)a3 forLibrary:(id)a4;
- (void)removeEndpointInfoForLibrary:(id)a3;
- (void)removePendingSyncSettingForDataClass:(id)a3;
- (void)setActiveRestoreType:(int)a3;
- (void)setCurrentInstallDisposition:(id)a3;
- (void)setEndpointInfo:(id)a3;
- (void)setHasCompletedDataMigration:(BOOL)a3;
- (void)setHostInfo:(id)a3 forLibrary:(id)a4;
- (void)setLastAuthenticationDialogResponseTime:(double)a3;
- (void)setPairingSyncCompletionTime:(double)a3;
- (void)setPreExistingStoreIdentifiers:(id)a3;
- (void)setSyncPending:(BOOL)a3 forDataClass:(id)a4;
- (void)setSyncState:(id)a3 forLibrary:(id)a4 dataClass:(id)a5;
- (void)setVersion:(unint64_t)a3 forDataclass:(id)a4;
- (void)synchronize;
- (void)updateLastSyncTimeForLibrary:(id)a3 dataClass:(id)a4;
@end

@implementation ATDeviceSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_setEndpointInfo:(id)a3 forLibrary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ATDeviceSettings *)self endpointInfo];
  v8 = (void *)[v7 mutableCopy];

  if (!v8) {
    v8 = objc_opt_new();
  }
  [v8 setValue:v9 forKey:v6];
  [(ATDeviceSettings *)self setEndpointInfo:v8];
}

- (id)_endpointInfoForLibrary:(id)a3
{
  id v4 = a3;
  v5 = [(ATDeviceSettings *)self endpointInfo];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (unint64_t)versionForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATDeviceSettings_versionForDataclass___block_invoke;
  block[3] = &unk_1E6B88B90;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__ATDeviceSettings_versionForDataclass___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKey:@"DataclassVersion"];
  if (v2)
  {
    id v4 = v2;
    v3 = [v2 objectForKey:a1[5]];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v3 unsignedIntegerValue];

    v2 = v4;
  }
}

- (void)setVersion:(unint64_t)a3 forDataclass:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATDeviceSettings_setVersion_forDataclass___block_invoke;
  block[3] = &unk_1E6B88728;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __44__ATDeviceSettings_setVersion_forDataclass___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKey:@"DataclassVersion"];
  id v4 = (id)[v2 mutableCopy];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v4 setObject:v3 forKey:a1[5]];

  [*(id *)(a1[4] + 8) setObject:v4 forKey:@"DataclassVersion"];
}

- (void)setPairingSyncCompletionTime:(double)a3
{
  userDefaults = self->_userDefaults;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSUserDefaults *)userDefaults setObject:v4 forKey:@"PairingSyncCompletionTime"];
}

- (void)updateLastSyncTimeForLibrary:(id)a3 dataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATDeviceSettings_updateLastSyncTimeForLibrary_dataClass___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __59__ATDeviceSettings_updateLastSyncTimeForLibrary_dataClass___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  id v6 = (id)[v2 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v3 = [v6 objectForKey:@"LastSyncTimes"];
  id v4 = (void *)[v3 mutableCopy];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:v4 forKey:@"LastSyncTimes"];
  }
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setValue:v5 forKey:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _setEndpointInfo:v6 forLibrary:*(void *)(a1 + 40)];
}

- (id)lastSyncTimeForLibrary:(id)a3 dataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3366;
  v21 = __Block_byref_object_dispose__3367;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ATDeviceSettings_lastSyncTimeForLibrary_dataClass___block_invoke;
  v13[3] = &unk_1E6B88238;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __53__ATDeviceSettings_lastSyncTimeForLibrary_dataClass___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  id v9 = (id)[v2 mutableCopy];

  v3 = v9;
  if (v9)
  {
    id v4 = [v9 objectForKey:@"LastSyncTimes"];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 valueForKey:*(void *)(a1 + 48)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    v3 = v9;
  }
}

- (void)setHostInfo:(id)a3 forLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ATDeviceSettings_setHostInfo_forLibrary___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __43__ATDeviceSettings_setHostInfo_forLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  id v5 = (id)[v2 mutableCopy];

  v3 = v5;
  if (!v5)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  if (v4) {
    [v3 setObject:v4 forKey:@"HostInfo"];
  }
  else {
    [v3 removeObjectForKey:@"HostInfo"];
  }
  [*(id *)(a1 + 32) _setEndpointInfo:v6 forLibrary:*(void *)(a1 + 40)];
}

- (id)hostInfoForLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3366;
  v16 = __Block_byref_object_dispose__3367;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ATDeviceSettings_hostInfoForLibrary___block_invoke;
  block[3] = &unk_1E6B88B90;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__ATDeviceSettings_hostInfoForLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  id v11 = (id)[v2 mutableCopy];

  v3 = v11;
  if (!v11)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v12 = v3;
  id v4 = [v3 objectForKey:@"HostInfo"];
  uint64_t v5 = [v4 mutableCopy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)setSyncState:(id)a3 forLibrary:(id)a4 dataClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__ATDeviceSettings_setSyncState_forLibrary_dataClass___block_invoke;
  v15[3] = &unk_1E6B88308;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  uint64_t v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __54__ATDeviceSettings_setSyncState_forLibrary_dataClass___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v11 = 138543874;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "setSyncState: %{public}@, forLibrary: %{public}@ dataClass: %{public}@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 56) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  id v7 = (void *)[v6 mutableCopy];

  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v8 = [v7 objectForKey:@"SyncState"];
  id v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    [v9 setObject:v10 forKey:*(void *)(a1 + 48)];
  }
  else {
    [v9 removeObjectForKey:*(void *)(a1 + 48)];
  }
  [v7 setObject:v9 forKey:@"SyncState"];
  [*(id *)(a1 + 56) _setEndpointInfo:v7 forLibrary:*(void *)(a1 + 40)];
}

- (id)syncStateForLibrary:(id)a3 dataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3366;
  v21 = __Block_byref_object_dispose__3367;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__ATDeviceSettings_syncStateForLibrary_dataClass___block_invoke;
  v13[3] = &unk_1E6B88238;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __50__ATDeviceSettings_syncStateForLibrary_dataClass___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _endpointInfoForLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    id v8 = v2;
    uint64_t v3 = [v2 objectForKey:@"SyncState"];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 objectForKey:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    v2 = v8;
  }
}

- (id)getPreExistingStoreIdentifiers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ATDeviceSettingPreExistingStoreAccountIDs"];
  if (v3)
  {
    if (_NSIsNSData())
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = objc_opt_class();
      id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
      id v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:0];

      goto LABEL_8;
    }
    id v9 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "removing invalid current preExistingStoreIdentifiers", buf, 2u);
    }

    [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"ATDeviceSettingPreExistingStoreAccountIDs"];
  }
  id v8 = 0;
LABEL_8:
  id v10 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v13 = v8;
    _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_DEBUG, "preExistingStoreIdentifiers=%{public}@", buf, 0xCu);
  }

  return v8;
}

- (void)setPreExistingStoreIdentifiers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v10 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v10];
    id v6 = v10;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      [(NSUserDefaults *)self->_userDefaults setObject:v5 forKey:@"ATDeviceSettingPreExistingStoreAccountIDs"];
    }
    else
    {
      id v9 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = v7;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_DEFAULT, "Could not serialize known store identifiers. error=%{public}@", buf, 0xCu);
      }
    }
  }
}

- (id)getCurrentInstallDisposition
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ATDeviceSettingCurrentInstallDisposition"];
  if (v3)
  {
    int v4 = _NSIsNSDictionary();
    uint64_t v5 = _ATLogCategoryFramework();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138543362;
        id v9 = v3;
        _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEBUG, "returning current installConfig=%{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "removing invalid current installConfig info", (uint8_t *)&v8, 2u);
      }

      [(NSUserDefaults *)self->_userDefaults removeObjectForKey:@"ATDeviceSettingCurrentInstallDisposition"];
      id v6 = v3;
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (void)setCurrentInstallDisposition:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "setting current installConfig info to %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"ATDeviceSettingCurrentInstallDisposition"];
}

- (void)setActiveRestoreType:(int)a3
{
  CFPreferencesSetAppValue(@"RestoreType", (CFPropertyListRef)[NSNumber numberWithUnsignedInt:*(void *)&a3], @"com.apple.atc");
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];

  CFPreferencesSynchronize(@"com.apple.atc", v3, v4);
}

- (void)setHasCompletedDataMigration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "setting setHasCompletedDataMigration to %d", (uint8_t *)v6, 8u);
  }

  CFPreferencesSetAppValue(@"DataMigrated", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.atc");
  CFPreferencesSynchronize(@"com.apple.atc", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"ATHasCompletedMigrationNotificationName", 0, 0, 1u);
}

- (BOOL)watchProxyDownloadsDisabled
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"WatchProxyDownloadsDisabled"];

  if (!v3) {
    return 0;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"WatchProxyDownloadsDisabled"];
}

- (BOOL)useNewDownloadService
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"UseNewDownloadService"];

  if (!v3) {
    return 1;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"UseNewDownloadService"];
}

- (unint64_t)restoreBatchSize
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"RestoreBatchSize"];

  if (!v3) {
    return 20;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults integerForKey:@"RestoreBatchSize"];
}

- (BOOL)restoreBatchingEnabled
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"RestoreBatchingEnabled"];

  if (!v3) {
    return 1;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"RestoreBatchingEnabled"];
}

- (BOOL)grappaEnabled
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"GrappaEnabled"];

  if (!v3) {
    return 1;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"GrappaEnabled"];
}

- (BOOL)fairPlayEnabled
{
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"FairPlayEnabled"];

  if (!v3) {
    return 1;
  }
  userDefaults = self->_userDefaults;

  return [(NSUserDefaults *)userDefaults BOOLForKey:@"FairPlayEnabled"];
}

- (void)setLastAuthenticationDialogResponseTime:(double)a3
{
  userDefaults = self->_userDefaults;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSUserDefaults *)userDefaults setObject:v4 forKey:@"ATDeviceSettingLastAuthenticationDialogResponseTime"];
}

- (double)lastAuthenticationDialogResponseTime
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ATDeviceSettingLastAuthenticationDialogResponseTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)pairingSyncCompletionTime
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"PairingSyncCompletionTime"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSArray)dataClassesNeedingSync
{
  return (NSArray *)[(NSUserDefaults *)self->_userDefaults objectForKey:@"DataClassesNeedingSync"];
}

- (BOOL)isSyncPendingForDataClass:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATDeviceSettings_isSyncPendingForDataClass___block_invoke;
  block[3] = &unk_1E6B88B90;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __46__ATDeviceSettings_isSyncPendingForDataClass___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 8) objectForKey:@"DataClassesNeedingSync"];
  if (v2) {
    LOBYTE(v2) = [v2 containsObject:a1[5]];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v2;

  return MEMORY[0x1F41817F8]();
}

- (void)removePendingSyncSettingForDataClass:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ATDeviceSettings_removePendingSyncSettingForDataClass___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __57__ATDeviceSettings_removePendingSyncSettingForDataClass___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(NSObject **)(a1 + 32);
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "removing sync pending setting for dataclass %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:@"DataClassesNeedingSync"];
    if ([v4 containsObject:*(void *)(a1 + 32)])
    {
      uint64_t v5 = [v4 mutableCopy];
      [v5 removeObject:*(void *)(a1 + 32)];
      id v6 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = v5;
        _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "updating sync pending for %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 40) + 8) setObject:v5 forKey:@"DataClassesNeedingSync"];
    }
    else
    {
      uint64_t v5 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(NSObject **)(a1 + 32);
        int v8 = 138543362;
        id v9 = v7;
        _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_DEFAULT, "dataclass: %{public}@ is not pending sync", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)setSyncPending:(BOOL)a3 forDataClass:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ATDeviceSettings_setSyncPending_forDataClass___block_invoke;
  block[3] = &unk_1E6B88688;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __48__ATDeviceSettings_setSyncPending_forDataClass___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"DataClassesNeedingSync"];
  id v6 = v2;
  if (v2)
  {
    double v3 = (void *)[v2 mutableCopy];
  }
  else
  {
    double v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    if (([v3 containsObject:v5] & 1) == 0) {
      [v4 addObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    [v3 removeObject:v5];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v4 forKey:@"DataClassesNeedingSync"];
}

- (void)removeEndpointInfoForLibrary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATDeviceSettings_removeEndpointInfoForLibrary___block_invoke;
  v7[3] = &unk_1E6B88B68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __49__ATDeviceSettings_removeEndpointInfoForLibrary___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 endpointInfo];
    id v5 = (id)[v4 mutableCopy];

    [v5 removeObjectForKey:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setEndpointInfo:v5];
  }
  else
  {
    [v2 setEndpointInfo:0];
  }
}

- (void)setEndpointInfo:(id)a3
{
  userDefaults = self->_userDefaults;
  if (a3) {
    [(NSUserDefaults *)userDefaults setObject:a3 forKey:@"EndpointInfo"];
  }
  else {
    [(NSUserDefaults *)userDefaults removeObjectForKey:@"EndpointInfo"];
  }
}

- (id)endpointInfo
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:@"EndpointInfo"];
}

- (NSString)interfaceName
{
  return [(NSUserDefaults *)self->_userDefaults stringForKey:@"InterfaceName"];
}

- (NSString)serviceType
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"ServiceType"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = @"_atc2._tcp";
  }

  return (NSString *)v4;
}

- (NSString)serviceDomain
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"ServiceDomain"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = @"local";
  }

  return (NSString *)v4;
}

- (NSString)serviceName
{
  v2 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"ServiceName"];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = @"com.apple.private.alloy.airtraffic";
  }

  return (NSString *)v4;
}

- (int)activeRestoreType
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:@"RestoreType"];
}

- (BOOL)hasCompletedDataMigration
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"DataMigrated"];
}

- (NSString)libraryIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3366;
  id v10 = __Block_byref_object_dispose__3367;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ATDeviceSettings_libraryIdentifier__block_invoke;
  v5[3] = &unk_1E6B88210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __37__ATDeviceSettings_libraryIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) stringForKey:@"LibraryIdentifier"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!v2)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v9 setObject:v10 forKey:@"LibraryIdentifier"];
  }
}

- (BOOL)isDeviceLinkClient
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"IsDeviceClient"];
}

- (void)synchronize
{
}

- (ATDeviceSettings)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATDeviceSettings;
  uint64_t v2 = [(ATDeviceSettings *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v3 bundleIdentifier];
    int v5 = [v4 isEqual:@"com.apple.atc"];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.atc"];
    }
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v6;

    uint64_t v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_t v10 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

+ (ATDeviceSettings)sharedInstance
{
  if (sharedInstance_onceToken_3385 != -1) {
    dispatch_once(&sharedInstance_onceToken_3385, &__block_literal_global_3386);
  }
  uint64_t v2 = (void *)__sharedInstance_3387;

  return (ATDeviceSettings *)v2;
}

uint64_t __34__ATDeviceSettings_sharedInstance__block_invoke()
{
  __sharedInstance_3387 = objc_alloc_init(ATDeviceSettings);

  return MEMORY[0x1F41817F8]();
}

@end