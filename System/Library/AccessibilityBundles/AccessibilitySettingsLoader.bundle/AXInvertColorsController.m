@interface AXInvertColorsController
+ (void)_updateStatus;
+ (void)initializeMonitoring;
+ (void)loadInvertColorsBundle;
@end

@implementation AXInvertColorsController

+ (void)initializeMonitoring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleInvertColorsPreload, (CFStringRef)*MEMORY[0x263F8B338], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:a1 selector:sel__updateStatus name:*MEMORY[0x263F1CE10] object:0];

  [a1 _updateStatus];
}

+ (void)_updateStatus
{
  if (UIAccessibilityIsInvertColorsEnabled() || _AXSShouldLoadInvertBundles())
  {
    [a1 loadInvertColorsBundle];
  }
}

+ (void)loadInvertColorsBundle
{
  if (loadInvertColorsBundle_onceToken != -1) {
    dispatch_once(&loadInvertColorsBundle_onceToken, &__block_literal_global_5);
  }
}

void __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v0 = AXAccessibilityBundlesDirectory();
  v1 = (void *)MEMORY[0x263F086E0];
  v2 = [v0 stringByAppendingPathComponent:@"InvertColorsManager.bundle"];
  v3 = [v1 bundleWithPath:v2];

  v4 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_24016D000, v4, OS_LOG_TYPE_INFO, "Invert colors bundle %{public}@", buf, 0xCu);
  }

  if (([v3 isLoaded] & 1) == 0)
  {
    id v10 = 0;
    int v5 = [v3 loadAndReturnError:&v10];
    v6 = v10;
    v7 = v6;
    if (!v5 || v6)
    {
      v9 = AXLogInvertColorsLoadBundles();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1((uint64_t)v3, (uint64_t)v7, v9);
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v3, "principalClass"), "initialize");
      v7 = AXLogInvertColorsLoadBundles();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      v8 = (void *)[v3 principalClass];
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      v9 = v8;
      _os_log_impl(&dword_24016D000, v7, OS_LOG_TYPE_INFO, "Loading: %{public}@", buf, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:
}

void __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_24016D000, log, OS_LOG_TYPE_ERROR, "Could not load: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end