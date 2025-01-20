@interface AXBLookingGlassManager
+ (void)initializeMonitor;
+ (void)showLookingGlassMenu;
- (AXBLookingGlassManager)init;
- (void)_showLookingGlassMenu;
- (void)_updateLookingGlassServicesIfNeeded;
- (void)init;
@end

@implementation AXBLookingGlassManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_8 != -1) {
    dispatch_once(&initializeMonitor_onceToken_8, &__block_literal_global_15);
  }
}

uint64_t __43__AXBLookingGlassManager_initializeMonitor__block_invoke()
{
  _SharedLookingGlassManager = objc_alloc_init(AXBLookingGlassManager);

  return MEMORY[0x270F9A758]();
}

+ (void)showLookingGlassMenu
{
}

- (AXBLookingGlassManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXBLookingGlassManager;
  v2 = [(AXBLookingGlassManager *)&v6 init];
  if (v2)
  {
    v3 = AXLogLookingGlass();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[AXBLookingGlassManager init](v3);
    }

    v4 = (const void *)_AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption()) {
      [(AXBLookingGlassManager *)v2 _updateLookingGlassServicesIfNeeded];
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  return v2;
}

- (void)_updateLookingGlassServicesIfNeeded
{
  if (LookingGlassServicesLibraryCore())
  {
    id v2 = [getLookingGlassServicesClass() sharedInstance];
    [v2 updateLookingGlassServices];
  }
}

- (void)_showLookingGlassMenu
{
  if (LookingGlassServicesLibraryCore())
  {
    id v2 = AXLogLookingGlassUI();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "About to show looking glass menu", v4, 2u);
    }

    v3 = [getLookingGlassServicesClass() sharedInstance];
    [v3 showLookingGlassMenu];
  }
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_241F5C000, log, OS_LOG_TYPE_DEBUG, "Initializing monitor: AXBLookingGlassManager", v1, 2u);
}

@end