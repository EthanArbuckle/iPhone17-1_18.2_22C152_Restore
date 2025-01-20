@interface ATXLockscreenBlacklist
+ (ATXLockscreenBlacklist)sharedInstance;
+ (id)appsLockedOrHiddenByAppProtection;
- (ATXLockscreenBlacklist)init;
- (BOOL)isPredictionGloballyDisabled;
- (id)blacklist;
- (void)dealloc;
- (void)init;
@end

@implementation ATXLockscreenBlacklist

- (ATXLockscreenBlacklist)init
{
  v27.receiver = self;
  v27.super_class = (Class)ATXLockscreenBlacklist;
  v2 = [(ATXLockscreenBlacklist *)&v27 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__ATXLockscreenBlacklist_init__block_invoke;
    aBlock[3] = &unk_1E68B3240;
    objc_copyWeak(&v25, &location);
    v7 = v2;
    v24 = v7;
    v8 = _Block_copy(aBlock);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __30__ATXLockscreenBlacklist_init__block_invoke_24;
    v21[3] = &unk_1E68B3268;
    id v10 = v8;
    id v22 = v10;
    uint64_t v11 = [v9 addObserverForName:@"com.apple.duetexpertd.prefschanged" object:0 queue:0 usingBlock:v21];
    id notificationCenterToken = v7->_notificationCenterToken;
    v7->_id notificationCenterToken = (id)v11;

    v13 = (const char *)[@"com.apple.duetexpertd.prefschanged" UTF8String];
    p_libnotifyToken = &v7->_libnotifyToken;
    v15 = dispatch_get_global_queue(9, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__ATXLockscreenBlacklist_init__block_invoke_2_26;
    handler[3] = &unk_1E68B3290;
    id v16 = v10;
    id v20 = v16;
    LODWORD(v10) = notify_register_dispatch(v13, p_libnotifyToken, v15, handler);

    if (v10)
    {
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXLockscreenBlacklist init](v17);
      }
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__ATXLockscreenBlacklist_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] runWithLockAcquired:&__block_literal_global_143];
    uint64_t v5 = __atxlog_handle_default();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v6)
      {
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        int v11 = 138412290;
        v12 = v8;
        v9 = "%@ - lockscreen blacklist update before daemon launch";
LABEL_7:
        _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      }
    }
    else if (v6)
    {
      id v10 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v10);
      int v11 = 138412290;
      v12 = v8;
      v9 = "%@ - lockscreen blacklist update";
      goto LABEL_7;
    }

    ATXUpdatePredictionsImmediatelyWithReason(15);
  }
}

void __30__ATXLockscreenBlacklist_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)a2[1];
  a2[1] = 0;
  id v3 = a2;

  id v4 = (id)v3[2];
  v3[2] = 0;
}

uint64_t __30__ATXLockscreenBlacklist_init__block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__ATXLockscreenBlacklist_init__block_invoke_2_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  int libnotifyToken = self->_libnotifyToken;
  if (libnotifyToken) {
    notify_cancel(libnotifyToken);
  }
  if (self->_notificationCenterToken)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_notificationCenterToken];
  }
  v5.receiver = self;
  v5.super_class = (Class)ATXLockscreenBlacklist;
  [(ATXLockscreenBlacklist *)&v5 dealloc];
}

+ (ATXLockscreenBlacklist)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ATXLockscreenBlacklist_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken9 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken9, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_33;
  return (ATXLockscreenBlacklist *)v2;
}

void __40__ATXLockscreenBlacklist_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_33;
  sharedInstance__pasExprOnceResult_33 = v1;
}

- (id)blacklist
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__68;
  v12 = __Block_byref_object_dispose__68;
  id v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ATXLockscreenBlacklist_blacklist__block_invoke;
  v7[3] = &unk_1E68B32B8;
  v7[4] = self;
  v7[5] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  id v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  objc_super v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ATXLockscreenBlacklist_blacklist__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
  else
  {
    objc_super v5 = (void *)CFPreferencesCopyValue(@"LockscreenSuggestionsDisabledBundles", @"com.apple.duetexpertd", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    BOOL v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    uint64_t v8 = v7;

    v9 = (void *)[v8 mutableCopy];
    [v9 removeObject:@"com.apple.application"];
    [v9 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v9 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v9 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    if ([v8 containsObject:@"com.apple.DocumentsApp"])
    {
      [v9 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
      [v9 addObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
      [v9 addObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];

    int v11 = +[_ATXGlobals sharedInstance];
    v12 = [v11 blacklistedAppsForLockscreenPredictions];
    uint64_t v13 = [v10 setByAddingObjectsFromArray:v12];
    id v14 = v3[1];
    v3[1] = (id)v13;

    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      id v18 = v3[1];
      int v19 = 138412546;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v18;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%@ read lockscreen action blacklist: %@", (uint8_t *)&v19, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[1]);
  }
}

- (BOOL)isPredictionGloballyDisabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXLockscreenBlacklist_isPredictionGloballyDisabled__block_invoke;
  v5[3] = &unk_1E68B32B8;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __54__ATXLockscreenBlacklist_isPredictionGloballyDisabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v3 = a2;
  id v4 = (void *)v3[2];
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFPreferencesGetAppBooleanValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared", 0) != 0;
    uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v6 = (void *)v3[2];
    v3[2] = v5;

    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 1024;
      int v14 = v10;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - read lockscreen action global disabled: %d", (uint8_t *)&v11, 0x12u);
    }
  }
}

+ (id)appsLockedOrHiddenByAppProtection
{
  v2 = objc_opt_new();
  char v3 = [v2 hiddenOrLockedBundleIDs];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  v2 = @"com.apple.duetexpertd.prefschanged";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Failed to register notification callback for %@", (uint8_t *)&v1, 0xCu);
}

@end