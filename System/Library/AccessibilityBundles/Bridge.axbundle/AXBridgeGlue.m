@interface AXBridgeGlue
+ (id)accessibilityBundles;
+ (void)_handleNanoETSettings;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBridgeGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AXBridgeGlue_accessibilityInitializeBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, block);
  }
}

uint64_t __45__AXBridgeGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_273];

  v3 = *(void **)(a1 + 32);

  return [v3 _handleNanoETSettings];
}

uint64_t __45__AXBridgeGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __45__AXBridgeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX Bridge"];
  [v2 setOverrideProcessName:@"AX Bridge"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __45__AXBridgeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CheckmarkChoiceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSDiscoverCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSBuddyNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSHelloAppleWatchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSFeatureHighlightRowViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSFaceGalleryHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSPasscodeAdvancedViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSPasscodeChoiceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSUnifiedOptinFYIViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSSetupControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSSecurePairingHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BridgeUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BridgeNSStringAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSManualFlowViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSGetStartedViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSSetupFinishedViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSSecurePairingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSPasskeyEntryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSPairedDeviceListTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSInstallSpinnerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSUnlockPlaceholderViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSHeadphoneLevelLimitSliderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"COSSOSTriggerAnimationCellAccessibility" canInteractWithTargetClass:1];
}

+ (void)_handleNanoETSettings
{
  id v2 = [MEMORY[0x263F22850] sharedInstance];
  [v2 addHandler:&__block_literal_global_346 forBundleName:@"ETSettings"];
}

uint64_t __37__AXBridgeGlue__handleNanoETSettings__block_invoke()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __37__AXBridgeGlue__handleNanoETSettings__block_invoke_2()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_350 withPreValidationHandler:&__block_literal_global_352 postValidationHandler:&__block_literal_global_358 safeCategoryInstallationHandler:&__block_literal_global_360];
}

uint64_t __37__AXBridgeGlue__handleNanoETSettings__block_invoke_3()
{
  return 1;
}

uint64_t __37__AXBridgeGlue__handleNanoETSettings__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX Bridge - ETPeople"];
  [v2 setOverrideProcessName:@"AX Bridge - ETPeople"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end