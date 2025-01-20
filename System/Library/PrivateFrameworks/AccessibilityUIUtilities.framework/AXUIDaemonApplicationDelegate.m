@interface AXUIDaemonApplicationDelegate
+ (BOOL)isFeatureEnabled;
+ (NSString)debugFeatureName;
+ (NSString)featureEnabledStatusDidChangeNotification;
+ (OS_os_log)loggingFacility;
- (AXUIDaemonApplicationDelegate)init;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)_didUpdateToOrientation:(int64_t)a3 duration:(double)a4;
- (void)_exitIfNotEnabled;
- (void)_systemAppDidBecomeReady;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)setKeepAlive:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation AXUIDaemonApplicationDelegate

- (AXUIDaemonApplicationDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXUIDaemonApplicationDelegate;
  v2 = [(AXUIDaemonApplicationDelegate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(AXUIDaemonApplicationDelegate *)v2 _exitIfNotEnabled];
    [(AXUIDaemonApplicationDelegate *)v3 setKeepAlive:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = [(id)objc_opt_class() featureEnabledStatusDidChangeNotification];
    [v4 addObserver:v3 selector:sel__enabledPreferenceDidChange_ name:v5 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_systemAppDidBecomeReady, (CFStringRef)*MEMORY[0x1E4F493D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  [(FBSOrientationObserver *)self->_orientationObserver invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(id)objc_opt_class() featureEnabledStatusDidChangeNotification];
  [v3 removeObserver:self name:v4 object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F493D0], 0);
  v6.receiver = self;
  v6.super_class = (Class)AXUIDaemonApplicationDelegate;
  [(AXUIDaemonApplicationDelegate *)&v6 dealloc];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(id)objc_opt_class() loggingFacility];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(id)objc_opt_class() debugFeatureName];
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1C39D1000, v8, OS_LOG_TYPE_DEFAULT, "Launched %@.", buf, 0xCu);
  }
  [(AXUIDaemonApplicationDelegate *)self didFinishLaunching];
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  aBlock[3] = &unk_1E649BFC0;
  objc_copyWeak(&v15, (id *)buf);
  v10 = _Block_copy(aBlock);
  v11 = (FBSOrientationObserver *)objc_alloc_init(MEMORY[0x1E4F629F8]);
  orientationObserver = self->_orientationObserver;
  self->_orientationObserver = v11;

  [(FBSOrientationObserver *)self->_orientationObserver setHandler:v10];
  [(AXUIDaemonApplicationDelegate *)self _didUpdateToOrientation:[(FBSOrientationObserver *)self->_orientationObserver activeInterfaceOrientation] duration:0.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
  v6[3] = &unk_1E649BF98;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) orientation];
  [*(id *)(a1 + 40) duration];
  return objc_msgSend(v2, "_didUpdateToOrientation:duration:", v3);
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() loggingFacility];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(id)objc_opt_class() debugFeatureName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1C39D1000, v4, OS_LOG_TYPE_DEFAULT, "Will terminate %@.", (uint8_t *)&v6, 0xCu);
  }
  [(AXUIDaemonApplicationDelegate *)self willTerminate];
}

- (void)_didUpdateToOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = [(id)objc_opt_class() loggingFacility];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_1C39D1000, v7, OS_LOG_TYPE_DEFAULT, "Update orientation to %ld with duration %g", buf, 0x16u);
  }

  AXPerformSafeBlock();
  uint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v8 setOrientation:a3 animated:a4 > 0.0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12 = @"Duration";
  v10 = [NSNumber numberWithDouble:a4];
  v13 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"AXUIDaemonOrientationDidUpdateNotification" object:0 userInfo:v11];

  [(AXUIDaemonApplicationDelegate *)self didUpdateOrientation];
}

void __66__AXUIDaemonApplicationDelegate__didUpdateToOrientation_duration___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _setInterfaceOrientation:*(void *)(a1 + 32)];
}

- (void)_exitIfNotEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() isFeatureEnabled] & 1) == 0)
  {
    uint64_t v3 = [(id)objc_opt_class() loggingFacility];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(id)objc_opt_class() debugFeatureName];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1C39D1000, v3, OS_LOG_TYPE_DEFAULT, "Exiting %@.", (uint8_t *)&v6, 0xCu);
    }
    [(AXUIDaemonApplicationDelegate *)self setKeepAlive:0];
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v5 terminateWithSuccess];
  }
}

- (void)_systemAppDidBecomeReady
{
  if (!+[AXUIDaemonApplication usesScenes])
  {
    id v2 = [(id)objc_opt_class() loggingFacility];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C39D1000, v2, OS_LOG_TYPE_DEFAULT, "Restarting because SpringBoard just became active.", v4, 2u);
    }

    uint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 terminateWithSuccess];
  }
}

- (void)setKeepAlive:(BOOL)a3
{
  if (vproc_swap_integer())
  {
    v4 = [(id)objc_opt_class() loggingFacility];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXUIDaemonApplicationDelegate setKeepAlive:](a3, v4);
    }
  }
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->window, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
}

+ (OS_os_log)loggingFacility
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  id v2 = (OS_os_log *)MEMORY[0x1E4F14500];
  id v3 = MEMORY[0x1E4F14500];
  return v2;
}

+ (NSString)debugFeatureName
{
  return (NSString *)&stru_1F1F0EB90;
}

+ (BOOL)isFeatureEnabled
{
  return 0;
}

+ (NSString)featureEnabledStatusDidChangeNotification
{
  return (NSString *)&stru_1F1F0EB90;
}

- (void)setKeepAlive:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_ERROR, "Unable to set keep alive to %i.", (uint8_t *)v2, 8u);
}

@end