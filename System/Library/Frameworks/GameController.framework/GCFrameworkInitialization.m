@interface GCFrameworkInitialization
+ (id)initOperationQueue;
+ (id)initQueue;
+ (void)controllerManagerDidOpen;
+ (void)enableControllerSupportWithReason:(int64_t)a3;
+ (void)enableKeyboardSupportWithReason:(int64_t)a3;
+ (void)enableMouseSupportWithReason:(int64_t)a3;
+ (void)initializeFramework;
+ (void)listenForObservers;
@end

@implementation GCFrameworkInitialization

+ (void)listenForObservers
{
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      v2 = getGCInitLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "Listening for observers to dependent notifications", v3, 2u);
      }
    }
    _CFNotificationCenterRegisterDependentNotificationList();
  }
}

+ (void)controllerManagerDidOpen
{
  v2 = +[GCFrameworkInitialization initQueue];
  dispatch_async(v2, &__block_literal_global_6);
}

uint64_t __53__GCFrameworkInitialization_controllerManagerDidOpen__block_invoke()
{
  if (gc_isInternalBuild())
  {
    v1 = getGCInitLogger();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_220998000, v1, OS_LOG_TYPE_DEFAULT, "GCControllerManager did open", v2, 2u);
    }
  }
  return currentProcessIsGameControllerDaemon();
}

+ (id)initQueue
{
  if (initQueue_onceToken != -1) {
    dispatch_once(&initQueue_onceToken, &__block_literal_global_96);
  }
  v2 = (void *)initQueue_queue;

  return v2;
}

void __38__GCFrameworkInitialization_initQueue__block_invoke()
{
}

+ (id)initOperationQueue
{
  if (initOperationQueue_onceToken != -1) {
    dispatch_once(&initOperationQueue_onceToken, &__block_literal_global_98);
  }
  v2 = (void *)initOperationQueue_queue;

  return v2;
}

void __47__GCFrameworkInitialization_initOperationQueue__block_invoke()
{
  uint64_t v0 = +[NSOperationQueue mainQueue];
  v1 = (void *)initOperationQueue_queue;
  initOperationQueue_queue = v0;
}

+ (void)enableControllerSupportWithReason:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    v4 = getGCInitLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        v5 = @"Unknown";
      }
      else {
        v5 = off_26D22AE80[a3 - 1];
      }
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "enableControllerSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if (enableControllerSupportWithReason__onceToken != -1) {
    dispatch_once(&enableControllerSupportWithReason__onceToken, &__block_literal_global_101_0);
  }
}

void __63__GCFrameworkInitialization_enableControllerSupportWithReason___block_invoke()
{
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    uint64_t v0 = +[GCFrameworkInitialization initQueue];
    dispatch_async(v0, &__block_literal_global_103);
  }
}

uint64_t __63__GCFrameworkInitialization_enableControllerSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework];
}

+ (void)enableMouseSupportWithReason:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    v4 = getGCInitLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        v5 = @"Unknown";
      }
      else {
        v5 = off_26D22AE80[a3 - 1];
      }
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "enableMouseSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if (enableMouseSupportWithReason__onceToken != -1) {
    dispatch_once(&enableMouseSupportWithReason__onceToken, &__block_literal_global_105);
  }
}

void __58__GCFrameworkInitialization_enableMouseSupportWithReason___block_invoke()
{
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    uint64_t v0 = +[GCFrameworkInitialization initQueue];
    dispatch_async(v0, &__block_literal_global_107);
  }
}

uint64_t __58__GCFrameworkInitialization_enableMouseSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework];
}

+ (void)enableKeyboardSupportWithReason:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    v4 = getGCInitLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        v5 = @"Unknown";
      }
      else {
        v5 = off_26D22AE80[a3 - 1];
      }
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "enableKeyboardSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if (enableKeyboardSupportWithReason__onceToken != -1) {
    dispatch_once(&enableKeyboardSupportWithReason__onceToken, &__block_literal_global_109);
  }
}

void __61__GCFrameworkInitialization_enableKeyboardSupportWithReason___block_invoke()
{
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    uint64_t v0 = +[GCFrameworkInitialization initQueue];
    dispatch_async(v0, &__block_literal_global_111);
  }
}

uint64_t __61__GCFrameworkInitialization_enableKeyboardSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework];
}

+ (void)initializeFramework
{
  v2 = +[GCFrameworkInitialization initQueue];
  dispatch_assert_queue_V2(v2);

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      v13 = getGCInitLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Attempting to initialize framework...", buf, 2u);
      }
    }
    if (_initializedFramework == 1)
    {
      if (gc_isInternalBuild())
      {
        v3 = getGCInitLogger();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = 0;
          v4 = "Framework has already been initialized or is already being initialized, skipping.";
          v5 = (uint8_t *)&v17;
          int v6 = v3;
          os_log_type_t v7 = OS_LOG_TYPE_INFO;
LABEL_22:
          _os_log_impl(&dword_220998000, v6, v7, v4, v5, 2u);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else
    {
      _initializedFramework = 1;
      if (gc_isInternalBuild())
      {
        v14 = getGCLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "GCControllerManagerInit begin", v16, 2u);
        }
      }
      v8 = (void *)MEMORY[0x223C6E130]();
      id v9 = +[_GCControllerManager sharedInstance];
      if (GCApplicationIsAlmond()) {
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_114);
      }
      v10 = +[_GCControllerManager sharedInstance];
      [v10 open];

      if ((currentProcessIsGameControllerDaemon() & 1) == 0)
      {
        v11 = +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
        v12 = +[_GCControllerManager sharedInstance];
        -[_GCCurrentApplicationForegroundMonitor addObserver:notifyCurrent:](v11, v12, 1);
      }
      if (gc_isInternalBuild())
      {
        v3 = getGCInitLogger();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = 0;
          v4 = "Framework initialized!";
          v5 = (uint8_t *)&v15;
          int v6 = v3;
          os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_22;
        }
LABEL_23:
      }
    }
  }
}

void __48__GCFrameworkInitialization_initializeFramework__block_invoke()
{
  id v0 = +[NSUserDefaults standardUserDefaults];
  [v0 registerDefaults:&unk_26D2878A0];
}

@end