@interface CKAppInstallationWatcher
+ (id)sharedInstance;
- (BOOL)observingApplicationWorkspace;
- (CKAppInstallationWatcher)init;
- (NSArray)inProgressInstallations;
- (NSMutableArray)installations;
- (NSMutableArray)observers;
- (OS_dispatch_queue)queue;
- (id)_applicationWorkspace;
- (void)_callDelegateAsynchronouslyWithProgressForAppInstallation:(id)a3 added:(BOOL)a4 updated:(BOOL)a5;
- (void)_loadBundleIdentifiersFromDiskLocked;
- (void)_saveBundleIdentifiersToDiskLocked;
- (void)_updateAppProgressWithKnownChangedProxies:(id)a3;
- (void)_updateAppProgressWithKnownChangedProxiesLocked:(id)a3;
- (void)_updateObservingApplicationWorkspaceLocked;
- (void)addObserver:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)dealloc;
- (void)fetchAllAppInstallations:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setInstallations:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObservingApplicationWorkspace:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)startListeningForAppBundleIdentifier:(id)a3;
@end

@implementation CKAppInstallationWatcher

id __62__CKAppInstallationWatcher__saveBundleIdentifiersToDiskLocked__block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 startTime];
  double v5 = v4 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 >= 86000.0)
  {
    v9 = 0;
  }
  else
  {
    v11[0] = @"BundleIdentifier";
    v6 = [v3 bundleIdentifier];
    v11[1] = @"TimeInitiated";
    v12[0] = v6;
    v7 = NSNumber;
    [v3 startTime];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    v12[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }

  return v9;
}

void __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  double v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = [v3 bundleIdentifier];
    v7 = objc_msgSend(v5, "__ck_proxyWithBundleIdentifier:", v6);

    if (!v7) {
      goto LABEL_33;
    }
    [v4 setProxy:v7];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Replacing proxy for app: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    v7 = [v3 proxy];
    if (!v7) {
      goto LABEL_33;
    }
  }
  v9 = [v7 installProgress];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Install progress for app %@ = %@", (uint8_t *)&v17, 0x16u);
    }
  }
  if (v9)
  {
    [v9 fractionCompleted];
    [v4 setPercentComplete:v11 * 100.0];
    uint64_t v12 = [v9 installState];
  }
  else
  {
    if (![v7 isInstalled]) {
      goto LABEL_17;
    }
    [v4 setPercentComplete:100.0];
    uint64_t v12 = 5;
  }
  [v4 setInstallState:v12];
LABEL_17:
  if (([v7 isInstalled] & 1) != 0 || (objc_msgSend(v4, "percentComplete"), v13 >= 100.0))
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [v7 registeredDate];
        int v17 = 138412546;
        v18 = v16;
        __int16 v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Updating install complete (%@): %@", (uint8_t *)&v17, 0x16u);
      }
    }
    [*(id *)(a1 + 40) _callDelegateAsynchronouslyWithProgressForAppInstallation:v4 added:0 updated:1];
    [*(id *)(a1 + 48) addObject:v4];
  }
  else
  {
    if ([v4 installState] == 3 || objc_msgSend(v4, "installState") == 4) {
      [*(id *)(a1 + 48) addObject:v4];
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Updating install progress: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    [*(id *)(a1 + 40) _callDelegateAsynchronouslyWithProgressForAppInstallation:v4 added:0 updated:1];
  }

LABEL_33:
}

- (void)_updateObservingApplicationWorkspaceLocked
{
  id v3 = [(CKAppInstallationWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(CKAppInstallationWatcher *)self observingApplicationWorkspace])
  {
    double v4 = [(CKAppInstallationWatcher *)self installations];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Beginning observing LaunchServices events", buf, 2u);
        }
      }
      v7 = [(CKAppInstallationWatcher *)self _applicationWorkspace];
      [v7 addObserver:self];
      uint64_t v8 = 1;
LABEL_15:

      [(CKAppInstallationWatcher *)self setObservingApplicationWorkspace:v8];
      return;
    }
  }
  if ([(CKAppInstallationWatcher *)self observingApplicationWorkspace])
  {
    v9 = [(CKAppInstallationWatcher *)self installations];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        double v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Ending observing LaunchServices events", v12, 2u);
        }
      }
      v7 = [(CKAppInstallationWatcher *)self _applicationWorkspace];
      [v7 removeObserver:self];
      uint64_t v8 = 0;
      goto LABEL_15;
    }
  }
}

void __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v3 = [*(id *)(a1 + 32) installations];
  double v4 = (void *)[v2 initWithArray:v3 copyItems:1];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke_2;
  v7[3] = &unk_1E5623828;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

BOOL __51__CKAppInstallationWatcher_inProgressInstallations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 installed] & 1) == 0
    && [v2 installState] != 4
    && [v2 installState] != 3
    && [v2 installState] != 5;

  return v3;
}

- (void)_callDelegateAsynchronouslyWithProgressForAppInstallation:(id)a3 added:(BOOL)a4 updated:(BOOL)a5
{
  v11[0] = 0;
  v11[1] = v11;
  void v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__63;
  v11[4] = __Block_byref_object_dispose__63;
  id v12 = 0;
  id v12 = (id)[a3 copy];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke;
  block[3] = &unk_1E562B288;
  BOOL v9 = a4;
  block[4] = self;
  block[5] = v11;
  BOOL v10 = a5;
  dispatch_async(MEMORY[0x1E4F14428], block);
  _Block_object_dispose(v11, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installations, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_223);
  }
  id v2 = (void *)sharedInstance_sharedInstance_2;

  return v2;
}

void __42__CKAppInstallationWatcher_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKAppInstallationWatcher);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
}

- (CKAppInstallationWatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)CKAppInstallationWatcher;
  id v2 = [(CKAppInstallationWatcher *)&v12 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ChatKit.CKAppInstallationWatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v6;

    id v8 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__CKAppInstallationWatcher_init__block_invoke;
    block[3] = &unk_1E5620C40;
    double v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

uint64_t __32__CKAppInstallationWatcher_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadBundleIdentifiersFromDiskLocked];
}

- (void)dealloc
{
  if (self->_observingApplicationWorkspace)
  {
    BOOL v3 = [(CKAppInstallationWatcher *)self _applicationWorkspace];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)CKAppInstallationWatcher;
  [(CKAppInstallationWatcher *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(CKAppInstallationWatcher *)self observers];
  id v5 = [MEMORY[0x1E4F6C428] weakRefWithObject:v4];

  [v6 addObject:v5];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__63;
  v18 = __Block_byref_object_dispose__63;
  id v19 = 0;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(CKAppInstallationWatcher *)self observers];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __43__CKAppInstallationWatcher_removeObserver___block_invoke;
  double v11 = &unk_1E562B1C0;
  id v6 = v4;
  id v12 = v6;
  double v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];

  if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11))
  {
    v7 = [(CKAppInstallationWatcher *)self observers];
    [v7 removeObjectsInArray:v15[5]];
  }
  _Block_object_dispose(&v14, 8);
}

void __43__CKAppInstallationWatcher_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 object];
  if (!v3
    || (id v4 = (void *)v3,
        [v7 object],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = *(void **)(a1 + 32),
        v5,
        v4,
        v5 == v6))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (void)startListeningForAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CKAppInstallationWatcher *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke;
    v6[3] = &unk_1E5620AF8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v2 = [*(id *)(a1 + 32) installations];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke_2;
  double v11 = &unk_1E5627F10;
  id v12 = *(id *)(a1 + 40);
  double v13 = &v14;
  [v2 enumerateObjectsUsingBlock:&v8];

  if (!*((unsigned char *)v15 + 24))
  {
    uint64_t v3 = [CKAppInstallation alloc];
    id v4 = -[CKAppInstallation initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", *(void *)(a1 + 40), v8, v9, v10, v11);
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v6;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Began listening for app installation with bundle ID %@", buf, 0xCu);
        }
      }
      id v7 = [*(id *)(a1 + 32) installations];
      [v7 addObject:v4];

      [*(id *)(a1 + 32) _callDelegateAsynchronouslyWithProgressForAppInstallation:v4 added:1 updated:0];
      [*(id *)(a1 + 32) _updateObservingApplicationWorkspaceLocked];
      [*(id *)(a1 + 32) _saveBundleIdentifiersToDiskLocked];
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __65__CKAppInstallationWatcher_startListeningForAppBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 bundleIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)fetchAllAppInstallations:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAppInstallationWatcher *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke;
  v7[3] = &unk_1E5622330;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__CKAppInstallationWatcher_fetchAllAppInstallations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_applicationWorkspace
{
  return (id)[MEMORY[0x1E4F223E0] defaultWorkspace];
}

- (void)_loadBundleIdentifiersFromDiskLocked
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKAppInstallationWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:@"/var/mobile/Library/SMS/CKAppInstallationWatcher.plist"];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CKAppInstallationWatcher__loadBundleIdentifiersFromDiskLocked__block_invoke;
    v9[3] = &unk_1E5620D50;
    id v10 = v5;
    [v4 enumerateObjectsUsingBlock:v9];
  }
  [(CKAppInstallationWatcher *)self setInstallations:v6];
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(CKAppInstallationWatcher *)self installations];
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Loaded initial watched bundle installations from disk: %@", buf, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateObservingApplicationWorkspaceLocked];
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxiesLocked:0];
}

void __64__CKAppInstallationWatcher__loadBundleIdentifiersFromDiskLocked__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v10;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 objectForKey:@"BundleIdentifier"];
  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKey:@"BundleIdentifier"];
  }

  int v7 = [v4 objectForKey:@"TimeInitiated"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  id v8 = [v4 objectForKey:@"TimeInitiated"];

  if (v6 && v8)
  {
    uint64_t v9 = [CKAppInstallation alloc];
    [v8 doubleValue];
    int v7 = -[CKAppInstallation initWithBundleIdentifier:startTime:](v9, "initWithBundleIdentifier:startTime:", v6);
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_saveBundleIdentifiersToDiskLocked
{
  uint64_t v3 = [(CKAppInstallationWatcher *)self queue];
  dispatch_assert_queue_V2(v3);

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;

  uint64_t v15 = v6;
  int v7 = [(CKAppInstallationWatcher *)self inProgressInstallations];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CKAppInstallationWatcher__saveBundleIdentifiersToDiskLocked__block_invoke;
  v13[3] = &unk_1E562B1E8;
  v13[4] = v14;
  id v8 = objc_msgSend(v7, "__imArrayByApplyingBlock:", v13);

  if ([v8 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "List of installing apps changed; updating on disk",
          v12,
          2u);
      }
    }
    [v8 writeToFile:@"/var/mobile/Library/SMS/CKAppInstallationWatcher.plist" atomically:1];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "There are no more installing apps; removing plist from disk",
          v12,
          2u);
      }
    }
    double v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 removeItemAtPath:@"/var/mobile/Library/SMS/CKAppInstallationWatcher.plist" error:0];
  }
  _Block_object_dispose(v14, 8);
}

- (void)_updateAppProgressWithKnownChangedProxies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKAppInstallationWatcher *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxies___block_invoke;
  v7[3] = &unk_1E5620AF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __70__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxies___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppProgressWithKnownChangedProxiesLocked:*(void *)(a1 + 40)];
}

- (void)_updateAppProgressWithKnownChangedProxiesLocked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [(CKAppInstallationWatcher *)self installations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke;
  v10[3] = &unk_1E562B210;
  id v7 = v4;
  id v11 = v7;
  id v12 = self;
  id v8 = v5;
  id v13 = v8;
  [v6 enumerateObjectsUsingBlock:v10];

  if ([v8 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke_57;
    v9[3] = &unk_1E562B238;
    void v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
    [(CKAppInstallationWatcher *)self _saveBundleIdentifiersToDiskLocked];
  }
}

void __76__CKAppInstallationWatcher__updateAppProgressWithKnownChangedProxiesLocked___block_invoke_57(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 installations];
  [v4 removeObject:v3];
}

void __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke_2;
  v3[3] = &unk_1E562B260;
  __int16 v5 = *(_WORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __100__CKAppInstallationWatcher__callDelegateAsynchronouslyWithProgressForAppInstallation_added_updated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    long long v4 = [v3 object];
    [v4 appInstallationWatcher:*(void *)(a1 + 32) addedAppInstallation:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    id v3 = v6;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    __int16 v5 = [v6 object];
    [v5 appInstallationWatcher:*(void *)(a1 + 32) changedAppInstallation:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    id v3 = v6;
  }
}

- (NSArray)inProgressInstallations
{
  id v2 = [(CKAppInstallationWatcher *)self installations];
  id v3 = objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &__block_literal_global_61_2);

  return (NSArray *)v3;
}

- (void)applicationInstallsDidStart:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidStart:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationInstallsDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidChange:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidUpdateIcon:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationsWillInstall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsWillInstall:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidInstall:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationsDidFailToInstall:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationInstallsDidFailToInstall:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    __int16 v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "-[CKAppInstallationWatcher applicationStateDidChange:%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAppInstallationWatcher *)self _updateAppProgressWithKnownChangedProxies:v4];
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)installations
{
  return self->_installations;
}

- (void)setInstallations:(id)a3
{
}

- (BOOL)observingApplicationWorkspace
{
  return self->_observingApplicationWorkspace;
}

- (void)setObservingApplicationWorkspace:(BOOL)a3
{
  self->_observingApplicationWorkspace = a3;
}

@end