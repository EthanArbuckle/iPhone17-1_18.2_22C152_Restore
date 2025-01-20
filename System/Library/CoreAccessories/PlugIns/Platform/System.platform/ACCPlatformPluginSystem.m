@interface ACCPlatformPluginSystem
- (BOOL)createFolder:(const char *)a3 mode:(unsigned __int16)a4;
- (BOOL)isAppInstalledWithBundleID:(id)a3;
- (BOOL)isAppVisibleInCurrentMode:(id)a3;
- (BOOL)isApplicationInForeground:(id)a3;
- (BOOL)isApplicationRunning:(id)a3;
- (BOOL)isDeviceLockSettingEnabled;
- (BOOL)isDeviceLocked;
- (BOOL)isLockScreenUIDisplayed;
- (BOOL)isRunning;
- (BOOL)launchURL:(id)a3;
- (BOOL)supportsExternalAccessoryBackgroundMode:(id)a3;
- (BOOL)unlockedSinceBoot;
- (NSLock)applicationStateLock;
- (NSMutableDictionary)activeProcessAssertions;
- (NSString)pluginName;
- (id)_convertDictionaryToPlatformACCDictionary:(id)a3;
- (id)appNameForBundleID:(id)a3;
- (id)applicationInfoForBundleID:(id)a3;
- (id)applicationInfoForPID:(int)a3;
- (id)applicationsInstalledWithExternalAccessoryProtocol:(id)a3;
- (id)mediaLibraryUIDString:(BOOL)a3;
- (int64_t)timeSinceBootInSecs;
- (void)_observeApplicationState:(id)a3;
- (void)cancelProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4;
- (void)initPlugin;
- (void)launchApplication:(id)a3 options:(int)a4;
- (void)launchBundleIDToBackground:(id)a3;
- (void)setActiveProcessAssertions:(id)a3;
- (void)setApplicationStateLock:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startObservingApplicationState;
- (void)startObservingFirstUnlockNotification;
- (void)startPlugin;
- (void)stopObservingApplicationState;
- (void)stopPlugin;
- (void)takeOneTimeProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4;
- (void)toggleProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4;
@end

@implementation ACCPlatformPluginSystem

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  init_logging();
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  activeProcessAssertions = self->_activeProcessAssertions;
  self->_activeProcessAssertions = v3;

  v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  applicationStateLock = self->_applicationStateLock;
  self->_applicationStateLock = v5;

  v7 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  [v7 setNeedsUserInteractivePriority:1];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [v7 setTransitionHandler:&__block_literal_global_142];
  v8 = (void *)MEMORY[0x263F3F728];
  v9 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  v10 = [v8 monitorWithConfiguration:v9];
  mainDisplayLayoutMonitor = self->_mainDisplayLayoutMonitor;
  self->_mainDisplayLayoutMonitor = v10;

  v12 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x263F28178]);
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = v12;

  [(ACCPlatformPluginSystem *)self setIsRunning:0];
  objc_destroyWeak(&location);
}

- (void)startPlugin
{
}

- (void)stopPlugin
{
  v3 = [(BKSApplicationStateMonitor *)self->_appStateMonitor handler];
  [v3 invalidate];

  [(ACCPlatformPluginSystem *)self setIsRunning:0];
}

- (void)launchApplication:(id)a3 options:(int)a4
{
  char v4 = a4;
  v42[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 length])
  {
    v7 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v8 = *MEMORY[0x263F3F5E8];
    v41[0] = *MEMORY[0x263F3F608];
    v41[1] = v8;
    v42[0] = MEMORY[0x263EFFA88];
    v42[1] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    v10 = [v7 dictionaryWithDictionary:v9];

    if (v4)
    {
      v11 = [(FBSDisplayLayoutMonitor *)self->_mainDisplayLayoutMonitor currentLayout];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v12 = [v11 elements];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
LABEL_5:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
          if ([v17 level] == 1 && objc_msgSend(v17, "layoutRole") == 1) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v14) {
              goto LABEL_5;
            }
            goto LABEL_12;
          }
        }
        v18 = [v17 bundleIdentifier];

        if (!v18) {
          goto LABEL_26;
        }
        v19 = (void *)[objc_alloc(MEMORY[0x263F08E48]) initWithPreviousApplication:v18];
        id v30 = 0;
        v20 = [v19 asBSActionWithResponder:0 error:&v30];
        id v21 = v30;
        if (v20)
        {
          v39 = v20;
          v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
          [v10 setObject:v22 forKeyedSubscript:*MEMORY[0x263F3F580]];
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
            }
            v22 = MEMORY[0x263EF8438];
            id v23 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[ACCPlatformPluginSystem launchApplication:options:]((uint64_t)v18);
          }
        }
      }
      else
      {
LABEL_12:
        v18 = v12;
      }

LABEL_26:
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      v24 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v6;
      __int16 v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_2249D5000, v24, OS_LOG_TYPE_DEFAULT, "Launch app: %@ with options: %@", buf, 0x16u);
    }

    id v26 = objc_alloc_init(MEMORY[0x263F3F790]);
    v27 = [MEMORY[0x263F3F778] optionsWithDictionary:v10];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke;
    v28[3] = &unk_2646E7C00;
    id v29 = v6;
    [v26 openApplication:v29 withOptions:v27 completion:v28];
  }
}

void __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke_cold_2(a1);
    }
  }
  else
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      v10 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_2249D5000, v10, OS_LOG_TYPE_DEFAULT, "Launched app: %@!", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BOOL)isAppVisibleInCurrentMode:(id)a3
{
  id v3 = a3;
  id v4 = WeakLinkClass(@"LSApplicationProxy", 1uLL);
  id v5 = WeakLinkClass(@"LSApplicationWorkspace", 1uLL);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v6 = [v5 defaultWorkspace];
  int v7 = [v6 applicationIsInstalled:v3];

  if (v7)
  {
    BOOL v8 = [v4 applicationProxyForIdentifier:v3];
    int v9 = [v5 defaultWorkspace];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__ACCPlatformPluginSystem_isAppVisibleInCurrentMode___block_invoke;
    v13[3] = &unk_2646E7C28;
    uint64_t v15 = &v16;
    id v10 = v8;
    id v14 = v10;
    [v9 enumerateBundlesOfType:4 block:v13];
  }
  char v11 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v11;
}

uint64_t __53__ACCPlatformPluginSystem_isAppVisibleInCurrentMode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (id)applicationsInstalledWithExternalAccessoryProtocol:(id)a3
{
  id v3 = (void *)SBSCopyDisplayIdentifiersForExternalAccessoryProtocol();
  return v3;
}

- (BOOL)launchURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [NSURL URLWithString:a3];
  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  int v5 = [v4 openSensitiveURL:v3 withOptions:0];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    BOOL v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = @"no";
    if (v5) {
      int v9 = @"yes";
    }
    int v11 = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_2249D5000, v8, OS_LOG_TYPE_DEFAULT, "Launching URL %@ was successful = %@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (BOOL)isAppInstalledWithBundleID:(id)a3
{
  id v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  int v5 = [v3 defaultWorkspace];
  char v6 = [v5 applicationIsInstalled:v4];

  return v6;
}

- (id)appNameForBundleID:(id)a3
{
  id v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 localizedName];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)supportsExternalAccessoryBackgroundMode:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v3];
  int v5 = v4;
  if (v4)
  {
    char v6 = [v4 UIBackgroundModes];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [v6 containsObject:@"external-accessory"];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        BOOL v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPluginSystem supportsExternalAccessoryBackgroundMode:]();
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)startObservingApplicationState
{
  id v3 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v3 lock];

  if ((gbApplicationStateMonitoringStarted & 1) == 0)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    char v7 = __57__ACCPlatformPluginSystem_startObservingApplicationState__block_invoke;
    BOOL v8 = &unk_2646E7C50;
    objc_copyWeak(&v9, &location);
    [(BKSApplicationStateMonitor *)self->_appStateMonitor setHandler:&v5];
    gbApplicationStateMonitoringStarted = 1;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  id v4 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v4 unlock];
}

void __57__ACCPlatformPluginSystem_startObservingApplicationState__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _observeApplicationState:v3];
}

- (void)stopObservingApplicationState
{
  id v3 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v3 lock];

  if (gbApplicationStateMonitoringStarted == 1)
  {
    [(BKSApplicationStateMonitor *)self->_appStateMonitor setHandler:0];
    gbApplicationStateMonitoringStarted = 0;
  }
  id v4 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v4 unlock];
}

- (void)_observeApplicationState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v5 lock];

  uint64_t v6 = [v4 valueForKey:*MEMORY[0x263F28160]];
  char v7 = [v4 valueForKey:*MEMORY[0x263F28158]];
  BOOL v8 = [(ACCPlatformPluginSystem *)self _convertDictionaryToPlatformACCDictionary:v4];

  id v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ACCPlatformPluginSystem__observeApplicationState___block_invoke;
  block[3] = &unk_2646E7C78;
  id v13 = v8;
  id v10 = v8;
  dispatch_async(v9, block);

  int v11 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v11 unlock];
}

void __52__ACCPlatformPluginSystem__observeApplicationState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_2249D5000, v4, OS_LOG_TYPE_DEFAULT, "Posting application state change %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"ACCPlatformApplicationNotificationStateChanged" object:0 userInfo:*(void *)(a1 + 32)];
}

- (id)_convertDictionaryToPlatformACCDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  uint64_t v6 = [v4 valueForKey:*MEMORY[0x263F28160]];
  int v7 = [v4 valueForKey:*MEMORY[0x263F28170]];
  uint64_t v8 = [v4 valueForKey:*MEMORY[0x263F28158]];

  if (v6) {
    [v5 setObject:v6 forKey:@"ACCPlatformApplicationStateKey"];
  }
  if (v7) {
    [v5 setObject:v7 forKey:@"ACCPlatformApplicationStateProcessIDKey"];
  }
  if (v8) {
    [v5 setObject:v8 forKey:@"ACCPlatformApplicationStateDisplayIDKey"];
  }

  return v5;
}

- (id)applicationInfoForPID:(int)a3
{
  id v4 = [(BKSApplicationStateMonitor *)self->_appStateMonitor applicationInfoForPID:*(void *)&a3];
  uint64_t v5 = [(ACCPlatformPluginSystem *)self _convertDictionaryToPlatformACCDictionary:v4];

  return v5;
}

- (id)applicationInfoForBundleID:(id)a3
{
  id v4 = [(BKSApplicationStateMonitor *)self->_appStateMonitor applicationInfoForApplication:a3];
  uint64_t v5 = [(ACCPlatformPluginSystem *)self _convertDictionaryToPlatformACCDictionary:v4];

  return v5;
}

- (BOOL)isApplicationInForeground:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACCPlatformPluginSystem *)self applicationInfoForBundleID:v4];
  uint64_t v6 = [v5 objectForKey:@"ACCPlatformApplicationStateKey"];
  int v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 unsignedIntValue];
    BOOL v10 = v8 > 4 && v8 != 16;
    if (v8 < 5 || v8 == 16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        id v12 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPluginSystem isApplicationInForeground:]();
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        id v12 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_2249D5000, v12, OS_LOG_TYPE_DEFAULT, "app bundleID %@ is in foreground", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isApplicationRunning:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACCPlatformPluginSystem *)self applicationInfoForBundleID:v4];
  uint64_t v6 = [v5 objectForKey:@"ACCPlatformApplicationStateKey"];
  int v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 unsignedIntValue];
    BOOL v9 = v8 != 16 && v8 > 2;
    if (v8 > 0x10 || ((1 << v8) & 0x10007) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        int v11 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_2249D5000, v11, OS_LOG_TYPE_DEFAULT, "app bundleID %@ is actively running", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        int v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPluginSystem isApplicationRunning:]();
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)takeOneTimeProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"accessoryd.%@.%d.oneTime.assertion]", v5, v4];
  int v7 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.accessoryd" name:@"OneTime"];
  v31[0] = v7;
  unsigned int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  id v29 = __Block_byref_object_dispose_;
  id v30 = (id)0xAAAAAAAAAAAAAAAALL;
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  BOOL v10 = [MEMORY[0x263F64630] targetWithPid:v4];
  id v30 = (id)[v9 initWithExplanation:v6 target:v10 attributes:v8];

  int v11 = (void *)v26[5];
  id v24 = 0;
  int v12 = [v11 acquireWithError:&v24];
  id v13 = v24;
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects <= 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = !v14;
  if (v12)
  {
    if (v15)
    {
      id v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      id v16 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ACCPlatformPluginSystem takeOneTimeProcessAssertionForBundleID:applicationPid:]();
    }

    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke;
    block[3] = &unk_2646E7CA0;
    v22 = v6;
    id v23 = &v25;
    dispatch_after(v19, MEMORY[0x263EF83A0], block);
    uint64_t v17 = v22;
  }
  else
  {
    if (v15)
    {
      uint64_t v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      uint64_t v17 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginSystem takeOneTimeProcessAssertionForBundleID:applicationPid:]();
    }
  }

  _Block_object_dispose(&v25, 8);
}

void __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (void)toggleProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v7 lock];

  uint64_t v8 = [(ACCPlatformPluginSystem *)self activeProcessAssertions];
  uint64_t v9 = [NSNumber numberWithInt:v4];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    time_t v11 = time(0);
    if (v11 - [(ACCPlatformProcessAssertion *)v10 startTime] >= 3)
    {
      int v12 = [(ACCPlatformProcessAssertion *)v10 processAssertionTimer];
      dispatch_time_t v13 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);

      [(ACCPlatformProcessAssertion *)v10 setStartTime:time(0)];
    }
  }
  else
  {
    BOOL v14 = [NSString stringWithFormat:@"accessoryd.%@.%d.assertion]", v6, v4];
    int v15 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.accessoryd" name:@"OneTime"];
    v28[0] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

    uint64_t v10 = [[ACCPlatformProcessAssertion alloc] initWithBundleIdentifier:v6 processAssertionName:v14 rbsAttributes:v16 pid:v4];
    if (v10)
    {
      uint64_t v17 = [(ACCPlatformPluginSystem *)self activeProcessAssertions];
      id v18 = [NSNumber numberWithInt:v4];
      [v17 setObject:v10 forKey:v18];

      dispatch_time_t v19 = [(ACCPlatformProcessAssertion *)v10 processAssertionTimer];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __76__ACCPlatformPluginSystem_toggleProcessAssertionForBundleID_applicationPid___block_invoke;
      handler[3] = &unk_2646E7CC8;
      id v20 = v10;
      uint64_t v25 = v20;
      id v26 = self;
      int v27 = v4;
      dispatch_source_set_event_handler(v19, handler);

      id v21 = [(ACCPlatformProcessAssertion *)v20 processAssertionTimer];
      dispatch_time_t v22 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  id v23 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v23 unlock];
}

void __76__ACCPlatformPluginSystem_toggleProcessAssertionForBundleID_applicationPid___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) attributes];
    int v11 = 138412290;
    int v12 = v5;
    _os_log_impl(&dword_2249D5000, v4, OS_LOG_TYPE_DEFAULT, "process assertion timer expired, invalidating process assertion %@", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) invalidate];
  id v6 = [*(id *)(a1 + 32) processAssertionTimer];
  dispatch_source_set_timer(v6, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  [*(id *)(a1 + 32) setStartTime:0];
  uint64_t v7 = [*(id *)(a1 + 40) applicationStateLock];
  [v7 lock];

  uint64_t v8 = [*(id *)(a1 + 40) activeProcessAssertions];
  uint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v8 removeObjectForKey:v9];

  uint64_t v10 = [*(id *)(a1 + 40) applicationStateLock];
  [v10 unlock];
}

- (void)cancelProcessAssertionForBundleID:(id)a3 applicationPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v7 lock];

  uint64_t v8 = [(ACCPlatformPluginSystem *)self activeProcessAssertions];
  uint64_t v9 = [NSNumber numberWithInt:v4];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      int v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_2249D5000, v11, OS_LOG_TYPE_DEFAULT, "Found an active repeating assertion to cancel, %@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v13 = [v10 processAssertionTimer];
    dispatch_source_set_timer(v13, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

    [v10 setStartTime:time(0)];
    [v10 invalidate];
    BOOL v14 = [(ACCPlatformPluginSystem *)self activeProcessAssertions];
    int v15 = [NSNumber numberWithInt:v4];
    [v14 removeObjectForKey:v15];
  }
  id v16 = [(ACCPlatformPluginSystem *)self applicationStateLock];
  [v16 unlock];
}

- (void)launchBundleIDToBackground:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ACCPlatformPluginSystem *)self isApplicationRunning:v4])
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_2249D5000, v12, OS_LOG_TYPE_DEFAULT, "App %@ is already running.", buf, 0xCu);
    }

    uint64_t v13 = (void *)MEMORY[0x263F64570];
    BOOL v14 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:v4];
    id v18 = 0;
    uint64_t v8 = [v13 handleForPredicate:v14 error:&v18];
    id v7 = v18;

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        int v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginSystem launchBundleIDToBackground:]((uint64_t)v4);
      }
LABEL_24:

      goto LABEL_25;
    }
    if (!v8)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        int v15 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginSystem launchBundleIDToBackground:]();
      }
      goto LABEL_24;
    }
    -[ACCPlatformPluginSystem toggleProcessAssertionForBundleID:applicationPid:](self, "toggleProcessAssertionForBundleID:applicationPid:", v4, [v8 pid]);
  }
  else
  {
    id v7 = objc_alloc_init((Class)WeakLinkClass(@"UIAccessoryBackgroundTaskAction", 0));
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, 0);
    uint64_t v9 = *MEMORY[0x263F3F580];
    v24[0] = *MEMORY[0x263F3F598];
    v24[1] = v9;
    v25[0] = MEMORY[0x263EFFA88];
    v25[1] = v8;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    int v11 = [MEMORY[0x263F3F808] sharedService];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke;
    v19[3] = &unk_2646E7CF0;
    id v20 = v4;
    id v21 = self;
    [v11 openApplication:v20 options:v10 withResult:v19];
  }
LABEL_25:
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects <= 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (!v3)
  {
    if (v6)
    {
      uint64_t v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v11;
      _os_log_impl(&dword_2249D5000, v8, OS_LOG_TYPE_DEFAULT, "Launching app %@ to bg succeeded, taking process assertion", buf, 0xCu);
    }

    id v12 = (void *)MEMORY[0x263F64570];
    uint64_t v13 = (void *)(a1 + 32);
    BOOL v14 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:*(void *)(a1 + 32)];
    id v25 = 0;
    int v15 = [v12 handleForPredicate:v14 error:&v25];
    id v7 = v25;

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_3(v13);
      }
    }
    else
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "toggleProcessAssertionForBundleID:applicationPid:", *(void *)(a1 + 32), objc_msgSend(v15, "pid"));
LABEL_34:

        goto LABEL_35;
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_1((uint64_t)v13, v16, v19, v20, v21, v22, v23, v24);
      }
    }

    goto LABEL_34;
  }
  if (v6)
  {
    id v7 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_6(a1);
  }
LABEL_35:
}

- (BOOL)unlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)isDeviceLocked
{
  int v2 = MKBGetDeviceLockState();
  BOOL result = 0;
  if (v2 && v2 != 3)
  {
    if ((v2 - 1) >= 2)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
        }
        id v4 = MEMORY[0x263EF8438];
        id v5 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_2249D5000, v4, OS_LOG_TYPE_DEFAULT, "Doesn't support isDeviceLocked API, treating as unlocked", v6, 2u);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDeviceLockSettingEnabled
{
  return MKBGetDeviceLockState() != 3;
}

- (int64_t)timeSinceBootInSecs
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)int v6 = 0x1500000001;
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = 0xAAAAAAAAAAAAAAAALL;
  size_t v4 = 16;
  if (sysctl(v6, 2u, v5, &v4, 0, 0) == -1) {
    return 0;
  }
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v3.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v3, 0);
  return v3.tv_sec - v5[0];
}

- (BOOL)isLockScreenUIDisplayed
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v7 = 0;
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x22A61B640](v2, (char *)&v7 + 1, &v7);
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = HIBYTE(v7);
    _os_log_impl(&dword_2249D5000, v5, OS_LOG_TYPE_INFO, "device lockScreenDisplayed = %d", buf, 8u);
  }

  return HIBYTE(v7) != 0;
}

- (BOOL)createFolder:(const char *)a3 mode:(unsigned __int16)a4
{
  if (a3)
  {
    int v5 = mkdir(a3, a4);
    if (!v5) {
      return 1;
    }
    int v6 = v5;
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginSystem createFolder:mode:]((uint64_t)a3, v6, v12);
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginSystem createFolder:mode:](v12);
    }
  }

  return 0;
}

- (id)mediaLibraryUIDString:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = ACCGetOSVersion();
    id v4 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    int v5 = [v4 uniqueIdentifier];

    int v6 = [NSString stringWithFormat:@"%@-%@-%@", v5, @"4954524C", v3];
  }
  else
  {
    BOOL v3 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    if (_getMediaLibraryHelper___mediaLibraryHelperInitOnce != -1) {
      dispatch_once(&_getMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global_347);
    }
    id v7 = (id)_getMediaLibraryHelper___mediaLibraryHelper;
    int v5 = ACCGetOSVersion();
    id v8 = [v3 uniqueIdentifier];
    int v9 = [v7 showMusic];
    id v10 = @"M";
    if (!v9) {
      id v10 = @"N";
    }
    uint64_t v11 = v10;
    int v12 = [v7 showPodcasts];
    uint64_t v13 = @"P";
    if (!v12) {
      uint64_t v13 = @"N";
    }
    BOOL v14 = v13;
    int v15 = [v7 showAudioBooks];

    int v6 = &stru_26D7C3278;
    if (v5 && v8)
    {
      id v16 = @"B";
      if (!v15) {
        id v16 = @"N";
      }
      int v6 = [NSString stringWithFormat:@"%@-%@%@%@-%@", v8, v11, v14, v16, v5];
    }
  }
  return v6;
}

- (void)startObservingFirstUnlockNotification
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2249D5000, v4, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since last boot. Waiting For first unlock", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  int v5 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke;
  handler[3] = &__block_descriptor_36_e8_v12__0i8l;
  int v7 = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)buf, v5, handler);
}

void __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke(uint64_t a1)
{
  notify_cancel(*(_DWORD *)(a1 + 32));
  v1 = dispatch_get_global_queue(0, 0);
  dispatch_async(v1, &__block_literal_global_217);
}

void __64__ACCPlatformPluginSystem_startObservingFirstUnlockNotification__block_invoke_2()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }
    BOOL v2 = MEMORY[0x263EF8438];
    id v1 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2249D5000, v2, OS_LOG_TYPE_DEFAULT, "Posting first unlock notification", v4, 2u);
  }

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"ACCPlatformApplicationFirstUnlockNotification" object:0 userInfo:0];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)activeProcessAssertions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveProcessAssertions:(id)a3
{
}

- (NSLock)applicationStateLock
{
  return self->_applicationStateLock;
}

- (void)setApplicationStateLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateLock, 0);
  objc_storeStrong((id *)&self->_activeProcessAssertions, 0);
  objc_storeStrong((id *)&self->_mainDisplayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

- (void)launchApplication:(uint64_t)a1 options:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2249D5000, v1, v2, "Error creating GCGameControllerActivationContext action for %@: %@", (void)v3, DWORD2(v3));
}

void __53__ACCPlatformPluginSystem_launchApplication_options___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2249D5000, v1, v2, "Error launching %@:\n%@", (void)v3, DWORD2(v3));
}

- (void)supportsExternalAccessoryBackgroundMode:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_2249D5000, v1, OS_LOG_TYPE_DEBUG, "client '%@' supports background EA = %d", v2, 0x12u);
}

- (void)isApplicationInForeground:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2249D5000, v0, v1, "app bundleID %@ is in background", v2, v3, v4, v5, v6);
}

- (void)isApplicationRunning:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2249D5000, v0, v1, "app bundleID %@ is NOT actively running", v2, v3, v4, v5, v6);
}

- (void)takeOneTimeProcessAssertionForBundleID:applicationPid:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_2249D5000, v0, v1, "acquired one-time assertion %@", v2, v3, v4, v5, v6);
}

- (void)takeOneTimeProcessAssertionForBundleID:applicationPid:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2249D5000, v0, v1, "unable to take one-time process assertion for %@", v2, v3, v4, v5, v6);
}

void __81__ACCPlatformPluginSystem_takeOneTimeProcessAssertionForBundleID_applicationPid___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchBundleIDToBackground:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2249D5000, v0, v1, "Unable to take assertion. ProcessHandle is NULL, cannot locate PID for %@", v2, v3, v4, v5, v6);
}

- (void)launchBundleIDToBackground:(uint64_t)a1 .cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2249D5000, v1, v2, "error fetching PID for app with bundleID:%@ error:%@", (void)v3, DWORD2(v3));
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_3(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2249D5000, v1, v2, "error fetching PID for app with bundleID:%@ error:%@", (void)v3, DWORD2(v3));
}

void __54__ACCPlatformPluginSystem_launchBundleIDToBackground___block_invoke_cold_6(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2249D5000, v1, v2, "error launching app %@: %@", (void)v3, DWORD2(v3));
}

- (void)createFolder:(os_log_t)log mode:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2249D5000, log, OS_LOG_TYPE_ERROR, "null folderPath", v1, 2u);
}

- (void)createFolder:(NSObject *)a3 mode:.cold.3(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = *__error();
  int v7 = 136315650;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl(&dword_2249D5000, a3, OS_LOG_TYPE_ERROR, "Error mkdir %s %d:%d", (uint8_t *)&v7, 0x18u);
}

@end