@interface AXMobileSafariGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileSafariGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];

    v3 = [MEMORY[0x263F22850] sharedInstance];
    [v3 addHandler:&__block_literal_global_302 forFramework:@"AVKit"];

    v4 = [MEMORY[0x263F22850] sharedInstance];
    [v4 addHandler:&__block_literal_global_315 forFramework:@"StoreKitUI"];

    v5 = [MEMORY[0x263F22850] sharedInstance];
    [v5 addHandler:&__block_literal_global_325 forFramework:@"SearchUI"];

    _Failover = [objc_allocWithZone((Class)AXMobileSafariGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

  return 1;
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"_accessibilityTextMarkerRangeForSelection", "@", 0);
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Safari AX Bundle"];
  [v2 setOverrideProcessName:@"MobileSafari"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MobileSafariUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SafariUIApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SafariUIDimmingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SafariUIPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIWebBrowserFindOnPageHighlighterAccessibility" canInteractWithTargetClass:1];
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_6()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AVKit"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_8()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ios.StoreKitUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_9()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SearchUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];

  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

@end