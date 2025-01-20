@interface ICDeviceAccessManager
+ (id)sharedAccessManager;
- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4;
- (BOOL)validateBundleIdentifierInstalled:(id)a3;
- (ICDeviceAccessManager)init;
- (NSArray)allBundleIdentifiers;
- (NSArray)bundleIdentifiersAccessingExternalCameras;
- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus;
- (OS_dispatch_queue)deviceAccessQueue;
- (id)bundleIdentifiersWithAccessType:(id)a3;
- (int)openDB:(id)a3;
- (sqlite3)externalMediaAccessDB;
- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4;
- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4;
- (void)addBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5;
- (void)revokeBundleIdentifier:(id)a3;
- (void)setDeviceAccessQueue:(id)a3;
- (void)setExternalMediaAccessDB:(sqlite3 *)a3;
- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4;
- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5;
@end

@implementation ICDeviceAccessManager

- (ICDeviceAccessManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ICDeviceAccessManager;
  v2 = [(ICDeviceAccessManager *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ICDeviceAccessManagerQueue", 0);
    deviceAccessQueue = v2->_deviceAccessQueue;
    v2->_deviceAccessQueue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v6 = [(ICDeviceAccessManager *)v2 deviceAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__ICDeviceAccessManager_init__block_invoke;
    block[3] = &unk_1E63D74D0;
    v2 = v2;
    v11 = v2;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    dispatch_async(v6, block);

    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v7, v8);
    if (!*((unsigned char *)v15 + 24))
    {

      v2 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  return v2;
}

void __29__ICDeviceAccessManager_init__block_invoke(uint64_t a1)
{
  v2 = [@"/var/mobile/Library/com.apple.imagecapture" stringByAppendingPathComponent:@"externalDeviceAccess.db"];
  dispatch_queue_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/com.apple.imagecapture"];

  if ((v4 & 1) == 0)
  {
    dispatch_semaphore_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = 0;
    [v5 createDirectoryAtPath:@"/var/mobile/Library/com.apple.imagecapture" withIntermediateDirectories:0 attributes:0 error:&v11];
  }
  if ([*(id *)(a1 + 32) openDB:v2])
  {
    __ICOSLogCreate();
    v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      v7 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      v6 = [v7 stringByAppendingString:@".."];
    }
    dispatch_time_t v8 = [NSString stringWithFormat:@"Failed to open/create database"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], "CREATE TABLE IF NOT EXISTS external_device_access (ID INTEGER PRIMARY KEY AUTOINCREMENT, bundle_id TEXT, date_added INTEGER, read_access INTEGER, write_access INTEGER, control_informed INTEGER)", 0, 0, &errmsg))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_14;
    }
    __ICOSLogCreate();
    v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      v9 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      v6 = [v9 stringByAppendingString:@".."];
    }
    dispatch_time_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create table: external_device_access - %s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)openDB:(id)a3
{
  char v4 = (const char *)[a3 UTF8String];

  return sqlite3_open(v4, &self->_externalMediaAccessDB);
}

- (void)dealloc
{
  if (sqlite3_close(self->_externalMediaAccessDB))
  {
    __ICOSLogCreate();
    dispatch_queue_t v3 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      char v4 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      dispatch_queue_t v3 = [v4 stringByAppendingString:@".."];
    }
    dispatch_semaphore_t v5 = [NSString stringWithFormat:@"Failed to close database"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICDeviceAccessManager;
  [(ICDeviceAccessManager *)&v6 dealloc];
}

+ (id)sharedAccessManager
{
  if (sharedAccessManager_onceToken != -1) {
    dispatch_once(&sharedAccessManager_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)sharedAccessManager_mgr;

  return v2;
}

uint64_t __44__ICDeviceAccessManager_sharedAccessManager__block_invoke()
{
  sharedAccessManager_mgr = objc_alloc_init(ICDeviceAccessManager);

  return MEMORY[0x1F41817F8]();
}

- (NSArray)bundleIdentifiersAccessingExternalCameras
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:@"read_access"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKeyedSubscript:@"bundle_id"];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICDeviceAccessManager *)self bundleIdentifier:v6 stateForAccessType:@"write_access"];
  unint64_t v8 = [(ICDeviceAccessManager *)self bundleIdentifier:v6 stateForAccessType:@"read_access"];
  if (v7)
  {
    if (v4) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    [(ICDeviceAccessManager *)self updateBundleIdentifier:v6 accessType:@"write_access" withState:v9];
    __ICOSLogCreate();
    v10 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      long long v11 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
      v10 = [v11 stringByAppendingString:@".."];
    }
    long long v12 = [NSString stringWithFormat:@"%@ Setting (write) Access State %d", v6, v4];
    long long v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      v10 = v10;
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = [(__CFString *)v10 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1BEEFF000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __ICOSLogCreate();
    v10 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      long long v14 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
      v10 = [v14 stringByAppendingString:@".."];
    }
    long long v12 = [NSString stringWithFormat:@"%@ (write) Access State Unknown, not updating", v6];
    long long v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
  }

  if (v8)
  {
    if (v4) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    [(ICDeviceAccessManager *)self updateBundleIdentifier:v6 accessType:@"read_access" withState:v16];
    __ICOSLogCreate();
    char v17 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      objc_super v18 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
      char v17 = [v18 stringByAppendingString:@".."];
    }
    v19 = [NSString stringWithFormat:@"%@ Setting (read) Access State %d", v6, v4, *(_OWORD *)buf, *(void *)&buf[16], v32];
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:
      char v17 = v17;
      v22 = v20;
      uint64_t v23 = [(__CFString *)v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_1BEEFF000, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __ICOSLogCreate();
    char v17 = @"PrivacySettings";
    if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
    {
      v21 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
      char v17 = [v21 stringByAppendingString:@".."];
    }
    v19 = [NSString stringWithFormat:@"%@ (read) Access State Unknown, not updating", v6];
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
  }

  __ICOSLogCreate();
  v24 = @"DEPRECATED";
  if ((unint64_t)[@"DEPRECATED" length] >= 0x15)
  {
    v25 = objc_msgSend(@"DEPRECATED", "substringWithRange:", 0, 18);
    v24 = [v25 stringByAppendingString:@".."];
  }
  v26 = [NSString stringWithFormat:@"updateApplicationWithBundleIdentifier:%@ withStatus:%d", v6, v4, *(void *)buf, *(_OWORD *)&buf[8]];
  v27 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v24;
    v29 = v27;
    uint64_t v30 = [(__CFString *)v28 UTF8String];
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    _os_log_impl(&dword_1BEEFF000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v64 = [MEMORY[0x1E4F1CA48] array];
  v60 = self;
  [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:@"read_access"];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v70 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        unint64_t v8 = [v7 objectForKeyedSubscript:@"read_access"];
        int v9 = [v8 intValue];

        if (v9 == 1)
        {
          uint64_t v10 = 0;
          goto LABEL_10;
        }
        if (v9 == 2)
        {
          uint64_t v10 = 1;
LABEL_10:
          long long v11 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v12 = [NSNumber numberWithBool:v10];
          [(__CFString *)v11 setObject:v12 forKeyedSubscript:@"whitelisted"];

          long long v13 = [v7 objectForKeyedSubscript:@"bundle_id"];
          [(__CFString *)v11 setObject:v13 forKeyedSubscript:@"bundle_id"];

          [v64 addObject:v11];
          __ICOSLogCreate();
          long long v14 = @"PrivacySettings";
          if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
          {
            v15 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
            long long v14 = [v15 stringByAppendingString:@".."];
          }
          uint64_t v16 = NSString;
          char v17 = [v7 objectForKeyedSubscript:@"bundle_id"];
          objc_super v18 = [v16 stringWithFormat:@"%@ (read) Access State %d, adding", v17, v10];

          v19 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v14;
            v21 = v19;
            uint64_t v22 = [(__CFString *)v20 UTF8String];
            *(_DWORD *)buf = 136446466;
            uint64_t v75 = v22;
            __int16 v76 = 2114;
            v77 = v18;
            _os_log_impl(&dword_1BEEFF000, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
        __ICOSLogCreate();
        long long v11 = @"PrivacySettings";
        if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
        {
          uint64_t v23 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
          long long v11 = [v23 stringByAppendingString:@".."];
        }
        v24 = NSString;
        v25 = [v7 objectForKeyedSubscript:@"bundle_id"];
        long long v14 = [v24 stringWithFormat:@"%@ (read) Access State Unknown, not adding", v25];

        v26 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          long long v11 = v11;
          objc_super v18 = v26;
          uint64_t v27 = [(__CFString *)v11 UTF8String];
          *(_DWORD *)buf = 136446466;
          uint64_t v75 = v27;
          __int16 v76 = 2114;
          v77 = v14;
          _os_log_impl(&dword_1BEEFF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_18:
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v4);
  }
  [(ICDeviceAccessManager *)v60 bundleIdentifiersWithAccessType:@"write_access"];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v61 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (!v28) {
    goto LABEL_41;
  }
  uint64_t v29 = v28;
  uint64_t v63 = *(void *)v66;
  do
  {
    for (uint64_t j = 0; j != v29; ++j)
    {
      if (*(void *)v66 != v63) {
        objc_enumerationMutation(v61);
      }
      v31 = *(void **)(*((void *)&v65 + 1) + 8 * j);
      uint64_t v32 = [v31 objectForKeyedSubscript:@"write_access"];
      int v33 = [v32 intValue];

      if (v33 == 1)
      {
        uint64_t v34 = 0;
        goto LABEL_30;
      }
      if (v33 == 2)
      {
        uint64_t v34 = 1;
LABEL_30:
        v35 = [MEMORY[0x1E4F1CA60] dictionary];
        v36 = [NSNumber numberWithBool:v34];
        [(__CFString *)v35 setObject:v36 forKeyedSubscript:@"whitelisted"];

        v37 = [v31 objectForKeyedSubscript:@"bundle_id"];
        [(__CFString *)v35 setObject:v37 forKeyedSubscript:@"bundle_id"];

        [v64 addObject:v35];
        __ICOSLogCreate();
        v38 = @"PrivacySettings";
        if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
        {
          v39 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
          v38 = [v39 stringByAppendingString:@".."];
        }
        v40 = NSString;
        v41 = [v31 objectForKeyedSubscript:@"bundle_id"];
        v42 = [v40 stringWithFormat:@"%@ (write) Access State %d, adding", v41, v34];

        v43 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v38;
          v45 = v43;
          uint64_t v46 = [(__CFString *)v44 UTF8String];
          *(_DWORD *)buf = 136446466;
          uint64_t v75 = v46;
          __int16 v76 = 2114;
          v77 = v42;
          _os_log_impl(&dword_1BEEFF000, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        goto LABEL_38;
      }
      __ICOSLogCreate();
      v35 = @"PrivacySettings";
      if ((unint64_t)[@"PrivacySettings" length] >= 0x15)
      {
        v47 = objc_msgSend(@"PrivacySettings", "substringWithRange:", 0, 18);
        v35 = [v47 stringByAppendingString:@".."];
      }
      v48 = NSString;
      v49 = [v31 objectForKeyedSubscript:@"bundle_id"];
      v38 = [v48 stringWithFormat:@"%@ (write) Access State Unknown, not adding", v49];

      v50 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v35;
        v42 = v50;
        uint64_t v51 = [(__CFString *)v35 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v75 = v51;
        __int16 v76 = 2114;
        v77 = v38;
        _os_log_impl(&dword_1BEEFF000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_38:
      }
    }
    uint64_t v29 = [v61 countByEnumeratingWithState:&v65 objects:v73 count:16];
  }
  while (v29);
LABEL_41:
  __ICOSLogCreate();
  v52 = @"DEPRECATED";
  if ((unint64_t)[@"DEPRECATED" length] >= 0x15)
  {
    v53 = objc_msgSend(@"DEPRECATED", "substringWithRange:", 0, 18);
    v52 = [v53 stringByAppendingString:@".."];
  }
  v54 = [NSString stringWithFormat:@"bundleIdentifiersAccessingExternalCamerasWithStatus: %@", v64];
  v55 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v56 = v52;
    v57 = v55;
    uint64_t v58 = [(__CFString *)v56 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v75 = v58;
    __int16 v76 = 2114;
    v77 = v54;
    _os_log_impl(&dword_1BEEFF000, v57, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  return (NSArray *)v64;
}

- (NSArray)allBundleIdentifiers
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke;
  block[3] = &unk_1E63D74D0;
  dispatch_semaphore_t v9 = v3;
  uint64_t v10 = &v11;
  void block[4] = self;
  uint64_t v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

void __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], (const char *)objc_msgSend(@"SELECT bundle_id FROM external_device_access;", "UTF8String"),
         (int (__cdecl *)(void *, int, char **, char **))ICAcessQuery,
         v2,
         &errmsg))
  {
    __ICOSLogCreate();
    dispatch_semaphore_t v3 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      uint64_t v4 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      dispatch_semaphore_t v3 = [v4 stringByAppendingString:@".."];
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDeviceAccessManager *)self allBundleIdentifiers];
  if ([v5 containsObject:v4])
  {
    __ICOSLogCreate();
    id v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      unint64_t v7 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      id v6 = [v7 stringByAppendingString:@".."];
    }
    unint64_t v8 = [NSString stringWithFormat:@"%@ is already in the database, will not be added again", v4];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = [(ICDeviceAccessManager *)self deviceAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__ICDeviceAccessManager_addBundleIdentifier___block_invoke;
    block[3] = &unk_1E63D7700;
    id v13 = v4;
    long long v14 = self;
    dispatch_semaphore_t v15 = v9;
    id v6 = v9;
    dispatch_async(v10, block);

    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v6, v11);

    unint64_t v8 = v13;
  }
}

void __45__ICDeviceAccessManager_addBundleIdentifier___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  [v8 timeIntervalSince1970];
  objc_msgSend(v2, "stringWithFormat:", @"INSERT INTO external_device_access(bundle_id,date_added,read_access,write_access,control_informed) VALUES ('%@',%lu,%lu,%lu,%lu);",
    v3,
    (unint64_t)v4,
    0,
    0,
  uint64_t v5 = 0);
  id v6 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v7 = v5;
  sqlite3_exec(v6, (const char *)[v7 UTF8String], 0, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  dispatch_time_t v11 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICDeviceAccessManager_updateBundleIdentifier_accessType_withState___block_invoke;
  block[3] = &unk_1E63D7A60;
  dispatch_semaphore_t v20 = v10;
  unint64_t v21 = a5;
  id v17 = v9;
  id v18 = v8;
  v19 = self;
  long long v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, block);

  dispatch_time_t v15 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v12, v15);
}

void __69__ICDeviceAccessManager_updateBundleIdentifier_accessType_withState___block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"UPDATE external_device_access SET %@ = %lu WHERE bundle_id = '%@';",
    *(void *)(a1 + 32),
    *(void *)(a1 + 64),
  id v2 = *(void *)(a1 + 40));
  errmsg = 0;
  uint64_t v3 = (sqlite3 *)[*(id *)(a1 + 48) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)bundleIdentifiersWithAccessType:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  dispatch_semaphore_t v20 = __Block_byref_object_copy__1;
  unint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ICDeviceAccessManager_bundleIdentifiersWithAccessType___block_invoke;
  v12[3] = &unk_1E63D7A88;
  id v13 = v4;
  id v14 = self;
  dispatch_semaphore_t v15 = v5;
  id v16 = &v17;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v12);

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v9);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

void __57__ICDeviceAccessManager_bundleIdentifiersWithAccessType___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT bundle_id, %@ FROM external_device_access;",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))ICAcessStatusQuery, v2, &errmsg))
  {
    __ICOSLogCreate();
    dispatch_semaphore_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      dispatch_semaphore_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)xpc_connection_copy_entitlement_value();
  dispatch_time_t v9 = v8;
  if (v8 && xpc_BOOL_get_value(v8))
  {
    unint64_t v10 = 2;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    xpc_connection_get_audit_token();
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    memset(&v16, 0, sizeof(v16));
    long long v12 = SecTaskCreateWithAuditToken(v11, &v16);
    if (v12)
    {
      id v13 = v12;
      *(void *)v16.val = 0;
      id v14 = (__CFString *)SecTaskCopySigningIdentifier(v12, (CFErrorRef *)&v16);
      CFRelease(v13);
    }
    else
    {
      id v14 = 0;
    }
    unint64_t v10 = [(ICDeviceAccessManager *)self bundleIdentifier:v14 stateForAccessType:v7];
  }
  return v10;
}

- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(ICDeviceAccessManager *)self validateBundleIdentifierInstalled:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = v7;
  id v8 = [(ICDeviceAccessManager *)self bundleIdentifiersWithAccessType:v7];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        dispatch_semaphore_t v15 = [v14 objectForKeyedSubscript:@"bundle_id"];
        int v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          long long v17 = [v14 objectForKeyedSubscript:v19];
          unint64_t v11 = (int)[v17 intValue];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)revokeBundleIdentifier:(id)a3
{
  id v4 = a3;
  __ICOSLogCreate();
  dispatch_semaphore_t v5 = @"icaccess";
  if ((unint64_t)[@"icaccess" length] >= 0x15)
  {
    id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
    dispatch_semaphore_t v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = [NSString stringWithFormat:@"Revoking Application BundleID %@", v4];
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
    __29__ICDeviceAccessManager_init__block_invoke_cold_1();
  }

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICDeviceAccessManager_revokeBundleIdentifier___block_invoke;
  block[3] = &unk_1E63D7700;
  id v14 = v4;
  dispatch_semaphore_t v15 = self;
  dispatch_semaphore_t v16 = v8;
  uint64_t v10 = v8;
  id v11 = v4;
  dispatch_async(v9, block);

  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v10, v12);
}

void __48__ICDeviceAccessManager_revokeBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM external_device_access WHERE bundle_id IS '%@';",
  id v2 = *(void *)(a1 + 32));
  errmsg = 0;
  id v3 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    dispatch_semaphore_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      dispatch_semaphore_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)validateBundleIdentifierInstalled:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  id v41 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v5 = [(ICDeviceAccessManager *)self deviceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDeviceAccessManager_validateBundleIdentifierInstalled___block_invoke;
  block[3] = &unk_1E63D7A88;
  id v6 = v3;
  id v32 = v6;
  int v33 = self;
  v35 = &v36;
  id v7 = v4;
  uint64_t v34 = v7;
  dispatch_async(v5, block);

  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v8);
  id v30 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v30];
  id v10 = v30;
  v24 = v10;
  if (v9 && !v10)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = (id)v37[5];
    uint64_t v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v46, 16, v24);
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          dispatch_semaphore_t v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKeyedSubscript:@"bundle_id"];
          char v16 = [v15 isEqualToString:v6];

          if (v16)
          {

            BOOL v22 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v46 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  __ICOSLogCreate();
  if ((unint64_t)[@"icaccess" length] < 0x15)
  {
    long long v18 = @"icaccess";
  }
  else
  {
    long long v17 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
    long long v18 = [v17 stringByAppendingString:@".."];
  }
  uint64_t v19 = [NSString stringWithFormat:@"Bundle was not found to be installed on the device, revoking access defensively to require the user to re-authorize upon install.", v24];
  long long v20 = (id)_gICOSLog;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [(__CFString *)v18 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v43 = v21;
    __int16 v44 = 2114;
    v45 = v19;
    _os_log_impl(&dword_1BEEFF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  [(ICDeviceAccessManager *)self revokeBundleIdentifier:v6];
  BOOL v22 = 0;
LABEL_19:

  _Block_object_dispose(&v36, 8);
  return v22;
}

void __59__ICDeviceAccessManager_validateBundleIdentifierInstalled___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_t v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))ICAcessStatusQuery, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), &errmsg))
  {
    __ICOSLogCreate();
    dispatch_semaphore_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      dispatch_semaphore_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5
{
  id v6 = (void (**)(id, uint64_t, CFOptionFlags))a5;
  SInt32 error = 0;
  id v7 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v7)
  {
    dispatch_time_t v8 = v7;
    CFOptionFlags v9 = 0;
    CFUserNotificationReceiveResponse(v7, 0.0, &v9);
    v6[2](v6, 1, v9);
    CFRelease(v8);
  }
}

- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    dispatch_time_t v8 = +[ICDeviceAccessManager sharedAccessManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__ICDeviceAccessManager_captureUserIntentForBundleIdentifier_withNotification___block_invoke;
    v12[3] = &unk_1E63D7AB0;
    id v14 = &v15;
    CFOptionFlags v9 = v7;
    uint64_t v13 = v9;
    [v8 displayAlertForApplication:v5 withNotification:v6 completionBlock:v12];

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

intptr_t __79__ICDeviceAccessManager_captureUserIntentForBundleIdentifier_withNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (sqlite3)externalMediaAccessDB
{
  return self->_externalMediaAccessDB;
}

- (void)setExternalMediaAccessDB:(sqlite3 *)a3
{
  self->_externalMediaAccessDB = a3;
}

- (OS_dispatch_queue)deviceAccessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __29__ICDeviceAccessManager_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = v0;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BEEFF000, v4, v5, "%{public}20s ! %{public}@", v6, v7, v8, v9, v10);
}

@end