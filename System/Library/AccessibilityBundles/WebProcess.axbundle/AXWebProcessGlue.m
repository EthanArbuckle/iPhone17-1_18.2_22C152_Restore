@interface AXWebProcessGlue
+ (void)_initializeAXRuntime;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWebProcessGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }

  [a1 _initializeAXRuntime];
}

void __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke()
{
  +[UIAccessibilityLoader _accessibilityInitializeRuntimeOverrides];
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_279 withPreValidationHandler:&__block_literal_global_288 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_297];
}

uint64_t __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"WKAccessibilityWebPageObject"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObject", @"pageScale", "d", 0);

  return 1;
}

uint64_t __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WebProcess AX Bundle"];
  [v2 setOverrideProcessName:@"WebProcess"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __49__AXWebProcessGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WKNSObjectAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKAccessibilityWebPageObjectAccessibility" canInteractWithTargetClass:1];
}

+ (void)_initializeAXRuntime
{
  id v3 = [MEMORY[0x263F21688] sharedManager];
  [v3 setAttributeCallback:&__block_literal_global_307];
  [v3 setParameterizedAttributeCallback:&__block_literal_global_310];
  [v3 setSetAttributeCallback:&__block_literal_global_313];
  [v3 setPerformActionCallback:&__block_literal_global_316];
  [v3 setHitTestCallback:&__block_literal_global_319];
  [v3 setApplicationElementCallback:&__block_literal_global_323];
  [v3 setOutgoingValuePreprocessor:&__block_literal_global_338];
  [v3 setClientObserverCallback:&__block_literal_global_342];
  [v3 start];
  _UIAXInitializeConstantValues();
  +[UIAccessibilityLoader _performInitialAccessibilityBundleLoad:1 monitorForFutureLoadEvents:1 trackingMode:2];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"AccessibilityCategoryInstalled" object:0];
}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = _AXElementForAXUIElementUniqueId();
  AXServerCacheSetEnabled();
  v6 = [v5 _iosAccessibilityAttributeValue:a4];
  AXServerCacheSetEnabled();

  return v6;
}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = _AXElementForAXUIElementUniqueId();
  AXServerCacheSetEnabled();
  v8 = [v7 _iosAccessibilityAttributeValue:a4 forParameter:v6];

  AXServerCacheSetEnabled();

  return v8;
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  _AXElementForAXUIElementUniqueId();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AXServerCacheSetEnabled();
  [v7 _iosAccessibilitySetValue:v6 forAttribute:a4];

  AXServerCacheSetEnabled();
}

uint64_t __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v8 = a5;
  v9 = _AXElementForAXUIElementUniqueId();
  AXServerCacheSetEnabled();
  uint64_t v10 = [v9 _iosAccessibilityPerformAction:a4 withValue:v8 fencePort:a6];

  AXServerCacheSetEnabled();
  return v10;
}

id __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5(double a1, double a2)
{
  v4 = _AXElementForAXUIElementUniqueId();
  v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5_cold_1((uint64_t)v4, v5, a1, a2);
  }

  AXServerCacheSetEnabled();
  id v6 = objc_msgSend(v4, "accessibilityHitTest:", a1, a2);
  AXServerCacheSetEnabled();

  return v6;
}

uint64_t __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_320()
{
  return [MEMORY[0x263F21678] remoteElementForBlock:&__block_literal_global_328];
}

BOOL __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_2_325(uint64_t a1, void *a2)
{
  id v2 = [a2 accessibilityElements];
  id v3 = [v2 firstObject];

  MEMORY[0x2455E8120](@"WKAccessibilityWebPageObject");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 safeValueForKey:@"accessibilityRootObjectWrapper"],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    [v4 safeCGRectForKey:@"accessibilityElementRect"];
    BOOL v8 = v7 > 0.0 && v6 > 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_3_335()
{
}

void __40__AXWebProcessGlue__initializeAXRuntime__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v6 = NSStringFromPoint(*(NSPoint *)&a3);
  int v7 = 138412546;
  BOOL v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  _os_log_debug_impl(&dword_2404CB000, a2, OS_LOG_TYPE_DEBUG, "Web hit test: %@ > %@", (uint8_t *)&v7, 0x16u);
}

@end