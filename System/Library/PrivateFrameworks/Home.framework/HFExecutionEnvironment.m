@interface HFExecutionEnvironment
+ (BOOL)isCarousel;
+ (BOOL)isHomeApp;
+ (BOOL)isHomeControlService;
+ (BOOL)isHomeEnergyWidget;
+ (BOOL)isHomeNotification;
+ (BOOL)isHomeRelatedProcess;
+ (BOOL)isHomeUIService;
+ (BOOL)isHomeWidget;
+ (BOOL)isHomeWidgetIntents;
+ (BOOL)isHomeWidgetInteractive;
+ (BOOL)isHomeWidgetRelatedProcess;
+ (BOOL)isMacShortcuts;
+ (BOOL)isSettings;
+ (BOOL)isShortcuts;
+ (BOOL)isSpringBoard;
+ (BOOL)isWatchApp;
+ (BOOL)isWatchWidget;
+ (HFExecutionEnvironment)sharedInstance;
+ (id)stringForHFExecutionEnvironmentRunningState:(unint64_t)a3;
+ (void)_disablePreferencesCloudBackup;
- (BOOL)isActive;
- (BOOL)macScreenIsLocked;
- (HFExecutionEnvironment)init;
- (NSDate)appForegroundStartTime;
- (NSHashTable)observers;
- (int64_t)hostProcess;
- (unint64_t)runningState;
- (void)_recordMetricsForAppRunningState;
- (void)addObserver:(id)a3;
- (void)dispatchMessageToObserversWithBlock:(id)a3;
- (void)executionEnvironmentDidBecomeActive;
- (void)executionEnvironmentDidEnterBackground;
- (void)executionEnvironmentWillEnterForeground;
- (void)executionEnvironmentWillResignActive;
- (void)removeObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAppForegroundStartTime:(id)a3;
- (void)setMacScreenIsLocked:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setRunningState:(unint64_t)a3;
@end

@implementation HFExecutionEnvironment

+ (BOOL)isSpringBoard
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 100;

  return v3;
}

+ (BOOL)isHomeWidgetInteractive
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 6;

  return v3;
}

+ (BOOL)isHomeWidgetRelatedProcess
{
  if (([a1 isHomeWidget] & 1) != 0
    || ([a1 isHomeEnergyWidget] & 1) != 0
    || ([a1 isHomeWidgetInteractive] & 1) != 0)
  {
    return 1;
  }
  return [a1 isWatchWidget];
}

+ (BOOL)isHomeWidget
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 5;

  return v3;
}

+ (BOOL)isHomeEnergyWidget
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 7;

  return v3;
}

+ (BOOL)isHomeControlService
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 3;

  return v3;
}

+ (BOOL)isHomeUIService
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 2;

  return v3;
}

+ (HFExecutionEnvironment)sharedInstance
{
  if (qword_26AB2EFD8 != -1) {
    dispatch_once(&qword_26AB2EFD8, &__block_literal_global_68);
  }
  v2 = (void *)_MergedGlobals_242;
  return (HFExecutionEnvironment *)v2;
}

- (int64_t)hostProcess
{
  if (qword_26AB2EFE8 != -1) {
    dispatch_once(&qword_26AB2EFE8, &__block_literal_global_9_2);
  }
  return qword_26AB2EFE0;
}

uint64_t __62__HFExecutionEnvironment_dispatchMessageToObserversWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)isHomeApp
{
  v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 0;

  return v3;
}

- (void)addObserver:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFExecutionEnvironment *)self observers];
  [v5 addObject:v4];

  v6 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Added execution env observer: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)removeObserver:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFExecutionEnvironment *)self observers];
  [v5 removeObject:v4];

  v6 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Removed execution env observer: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)executionEnvironmentDidBecomeActive
{
  BOOL v3 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Application became active", buf, 2u);
  }

  [(HFExecutionEnvironment *)self setRunningState:0];
  [(HFExecutionEnvironment *)self setActive:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HFExecutionEnvironment_executionEnvironmentDidBecomeActive__block_invoke;
  v4[3] = &unk_2640930A8;
  v4[4] = self;
  [(HFExecutionEnvironment *)self dispatchMessageToObserversWithBlock:v4];
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)dispatchMessageToObserversWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(HFExecutionEnvironment *)self observers];
  v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    v10 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __62__HFExecutionEnvironment_dispatchMessageToObserversWithBlock___block_invoke;
        v14[3] = &unk_26408DF88;
        id v13 = v4;
        v14[4] = v12;
        id v15 = v13;
        dispatch_async(v10, v14);

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

void __61__HFExecutionEnvironment_executionEnvironmentDidBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 executionEnvironmentDidBecomeActive:*(void *)(a1 + 32)];
  }
}

- (void)_recordMetricsForAppRunningState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFExecutionEnvironment *)self runningState];
  if (v3 == 1)
  {
    uint64_t v7 = [(HFExecutionEnvironment *)self appForegroundStartTime];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF910] date];
      uint64_t v9 = [(HFExecutionEnvironment *)self appForegroundStartTime];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      [(HFExecutionEnvironment *)self setAppForegroundStartTime:0];
      if (v11 <= 1.0) {
        return;
      }
      v6 = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v12 = [v6 allHomesFuture];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__HFExecutionEnvironment__recordMetricsForAppRunningState__block_invoke;
      v15[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
      *(double *)&v15[4] = v11;
      id v13 = (id)[v12 addCompletionBlock:v15];
    }
    else
    {
      v6 = HFLogForCategory(6uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Expected appForegroundStartTime to be non-nil when entering background so we could record total foreground time. No metrics will be recorded.", buf, 2u);
      }
    }
  }
  else
  {
    if (v3) {
      return;
    }
    id v4 = [(HFExecutionEnvironment *)self appForegroundStartTime];

    if (v4)
    {
      v5 = HFLogForCategory(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v14 = [(HFExecutionEnvironment *)self appForegroundStartTime];
        *(_DWORD *)buf = 138412290;
        long long v17 = v14;
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Expected appForegroundStartTime to be nil when entering foreground but found value: %@", buf, 0xCu);
      }
    }
    v6 = [MEMORY[0x263EFF910] date];
    [(HFExecutionEnvironment *)self setAppForegroundStartTime:v6];
  }
}

- (unint64_t)runningState
{
  return self->_runningState;
}

- (void)setRunningState:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_runningState == a3)
  {
    if (!a3)
    {
      v5 = [(HFExecutionEnvironment *)self appForegroundStartTime];

      if (!v5)
      {
        [(HFExecutionEnvironment *)self _recordMetricsForAppRunningState];
      }
    }
  }
  else
  {
    v6 = HFLogForCategory(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = +[HFExecutionEnvironment stringForHFExecutionEnvironmentRunningState:a3];
      *(_DWORD *)buf = 138412290;
      double v10 = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Running state is now '%@'", buf, 0xCu);
    }
    self->_runningState = a3;
    [(HFExecutionEnvironment *)self _recordMetricsForAppRunningState];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__HFExecutionEnvironment_setRunningState___block_invoke;
    v8[3] = &unk_2640930A8;
    v8[4] = self;
    [(HFExecutionEnvironment *)self dispatchMessageToObserversWithBlock:v8];
  }
}

- (NSDate)appForegroundStartTime
{
  return self->_appForegroundStartTime;
}

- (void)setAppForegroundStartTime:(id)a3
{
}

+ (void)_disablePreferencesCloudBackup
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  unint64_t v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"com.apple.Home.group"];

  id v4 = [NSString stringWithFormat:@"Library/Preferences/%@.plist", @"com.apple.Home.group"];
  v5 = [v3 URLByAppendingPathComponent:v4];
  uint64_t v6 = *MEMORY[0x263EFFAD8];
  id v10 = 0;
  char v7 = [v5 setResourceValue:MEMORY[0x263EFFA88] forKey:v6 error:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = HFLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = @"com.apple.Home.group";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "Failed to set resource flag for disabling iCloud backups on %@ preferences. Error: %@", buf, 0x16u);
    }
  }
}

- (BOOL)isActive
{
  return self->_active;
}

uint64_t __30__HFExecutionEnvironment_init__block_invoke()
{
  return +[HFExecutionEnvironment _disablePreferencesCloudBackup];
}

uint64_t __40__HFExecutionEnvironment_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HFExecutionEnvironment);
  uint64_t v1 = _MergedGlobals_242;
  _MergedGlobals_242 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFExecutionEnvironment)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFExecutionEnvironment;
  v2 = [(HFExecutionEnvironment *)&v8 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_runningState = 0;
    v2->_macScreenIsLocked = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    if (![(HFExecutionEnvironment *)v3 hostProcess])
    {
      uint64_t v6 = dispatch_get_global_queue(-2, 0);
      dispatch_async(v6, &__block_literal_global_4_2);
    }
  }
  return v3;
}

void __37__HFExecutionEnvironment_hostProcess__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v13 = [v0 bundleIdentifier];

  uint64_t v1 = HFHomeAppBundleID();
  char v2 = [v13 isEqualToString:v1];

  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = HFNanoHomeAppBundleID();
    char v5 = [v13 isEqualToString:v4];

    if (v5)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v6 = HFNanoHomeWidgetBundleID();
      char v7 = [v13 isEqualToString:v6];

      if (v7)
      {
        uint64_t v3 = 8;
      }
      else
      {
        objc_super v8 = HFHomeUIServiceBundleID();
        char v9 = [v13 isEqualToString:v8];

        if (v9)
        {
          uint64_t v3 = 2;
        }
        else
        {
          id v10 = HFHomeControlServiceBundleID();
          char v11 = [v13 isEqualToString:v10];

          if (v11)
          {
            uint64_t v3 = 3;
          }
          else if ([v13 isEqualToString:@"com.apple.Home.HomeNotification"])
          {
            uint64_t v3 = 4;
          }
          else if ([v13 isEqualToString:@"com.apple.Home.HomeWidget"])
          {
            uint64_t v3 = 5;
          }
          else if ([v13 isEqualToString:@"com.apple.Home.HomeEnergyWidgets"])
          {
            uint64_t v3 = 7;
          }
          else if ([v13 isEqualToString:@"com.apple.Home.HomeWidget.Interactive"])
          {
            uint64_t v3 = 6;
          }
          else if ([v13 isEqualToString:@"com.apple.Home.HomeWidgetIntentsExtension"])
          {
            uint64_t v3 = 10;
          }
          else if ([v13 isEqualToString:@"com.apple.springboard"])
          {
            uint64_t v3 = 100;
          }
          else if ([v13 isEqualToString:@"com.apple.Carousel"])
          {
            uint64_t v3 = 101;
          }
          else if ([v13 isEqualToString:@"com.apple.Preferences"])
          {
            uint64_t v3 = 102;
          }
          else if ([v13 isEqualToString:@"com.apple.proximitycontrold"])
          {
            uint64_t v3 = 104;
          }
          else if ([v13 isEqualToString:@"com.apple.PCViewService"])
          {
            uint64_t v3 = 105;
          }
          else if ([v13 isEqualToString:@"com.apple.HomeControlServiceTestApp"])
          {
            uint64_t v3 = 103;
          }
          else if ([v13 isEqualToString:@"com.apple.WorkflowUI.CatalystContentExtension"])
          {
            uint64_t v3 = 106;
          }
          else
          {
            int v12 = [v13 isEqualToString:@"com.apple.shortcuts"];
            uint64_t v3 = 107;
            if (!v12) {
              uint64_t v3 = -1;
            }
          }
        }
      }
    }
  }
  qword_26AB2EFE0 = v3;
}

+ (BOOL)isWatchApp
{
  char v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 1;

  return v3;
}

+ (BOOL)isWatchWidget
{
  char v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 8;

  return v3;
}

+ (BOOL)isCarousel
{
  char v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 101;

  return v3;
}

+ (BOOL)isSettings
{
  char v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 102;

  return v3;
}

+ (BOOL)isMacShortcuts
{
  char v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 106;

  return v3;
}

+ (BOOL)isShortcuts
{
  if ([a1 isMacShortcuts]) {
    return 1;
  }
  BOOL v3 = +[HFExecutionEnvironment sharedInstance];
  BOOL v2 = [v3 hostProcess] == 107;

  return v2;
}

+ (BOOL)isHomeNotification
{
  BOOL v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 4;

  return v3;
}

+ (BOOL)isHomeWidgetIntents
{
  BOOL v2 = +[HFExecutionEnvironment sharedInstance];
  BOOL v3 = [v2 hostProcess] == 10;

  return v3;
}

+ (BOOL)isHomeRelatedProcess
{
  if (([a1 isHomeApp] & 1) != 0
    || ([a1 isWatchApp] & 1) != 0
    || ([a1 isWatchWidget] & 1) != 0
    || ([a1 isHomeUIService] & 1) != 0
    || ([a1 isHomeControlService] & 1) != 0
    || ([a1 isHomeNotification] & 1) != 0
    || ([a1 isHomeWidget] & 1) != 0
    || ([a1 isHomeEnergyWidget] & 1) != 0)
  {
    return 1;
  }
  return [a1 isHomeWidgetInteractive];
}

void __42__HFExecutionEnvironment_setRunningState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 executionEnvironmentRunningStateDidChange:*(void *)(a1 + 32)];
  }
}

- (void)executionEnvironmentWillEnterForeground
{
  id v3 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Application entering foreground", buf, 2u);
  }

  [(HFExecutionEnvironment *)self setRunningState:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__HFExecutionEnvironment_executionEnvironmentWillEnterForeground__block_invoke;
  v4[3] = &unk_2640930A8;
  v4[4] = self;
  [(HFExecutionEnvironment *)self dispatchMessageToObserversWithBlock:v4];
}

void __65__HFExecutionEnvironment_executionEnvironmentWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 executionEnvironmentWillEnterForeground:*(void *)(a1 + 32)];
  }
}

- (void)executionEnvironmentWillResignActive
{
  id v3 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Application resigning active", buf, 2u);
  }

  [(HFExecutionEnvironment *)self setActive:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__HFExecutionEnvironment_executionEnvironmentWillResignActive__block_invoke;
  v4[3] = &unk_2640930A8;
  v4[4] = self;
  [(HFExecutionEnvironment *)self dispatchMessageToObserversWithBlock:v4];
}

void __62__HFExecutionEnvironment_executionEnvironmentWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 executionEnvironmentWillResignActive:*(void *)(a1 + 32)];
  }
}

- (void)executionEnvironmentDidEnterBackground
{
  id v3 = HFLogForCategory(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Application entered background", buf, 2u);
  }

  [(HFExecutionEnvironment *)self setRunningState:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HFExecutionEnvironment_executionEnvironmentDidEnterBackground__block_invoke;
  v4[3] = &unk_2640930A8;
  v4[4] = self;
  [(HFExecutionEnvironment *)self dispatchMessageToObserversWithBlock:v4];
}

void __64__HFExecutionEnvironment_executionEnvironmentDidEnterBackground__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 executionEnvironmentDidEnterBackground:*(void *)(a1 + 32)];
  }
}

void __58__HFExecutionEnvironment__recordMetricsForAppRunningState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "accessories", (void)v12);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v16[0] = @"foregroundDuration";
  char v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v17[0] = v9;
  v16[1] = @"userHasAccessories";
  id v10 = [NSNumber numberWithBool:v4];
  v17[1] = v10;
  char v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  +[HFAnalytics sendEvent:0 withData:v11];
}

+ (id)stringForHFExecutionEnvironmentRunningState:(unint64_t)a3
{
  id v3 = @"inactive";
  if (a3 == 1) {
    id v3 = @"background";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"foreground";
  }
}

- (BOOL)macScreenIsLocked
{
  return self->_macScreenIsLocked;
}

- (void)setMacScreenIsLocked:(BOOL)a3
{
  self->_macScreenIsLocked = a3;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appForegroundStartTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end