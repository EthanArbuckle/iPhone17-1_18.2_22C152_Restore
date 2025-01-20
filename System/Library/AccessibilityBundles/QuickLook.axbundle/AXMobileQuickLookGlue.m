@interface AXMobileQuickLookGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileQuickLookGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];

    uint64_t v3 = [objc_allocWithZone((Class)AXMobileQuickLookGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_333 forFramework:@"PDFKit"];
  }
}

uint64_t __54__AXMobileQuickLookGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __54__AXMobileQuickLookGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileQuickLook AX Bundle"];
  [v2 setOverrideProcessName:@"MobileQuickLook"];

  return MEMORY[0x270F09468]();
}

void __54__AXMobileQuickLookGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"QLPreviewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLDetailItemViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLLoadingItemViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLOverlayPlayButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLToolbarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLMediaItemViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLImageItemViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLImageItemTransformerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLMediaUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLVideoScrubberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLLivePhotoItemViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLPreviewCollectionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QLImageAnalysisManagerAccessibility" canInteractWithTargetClass:1];
}

void __54__AXMobileQuickLookGlue_accessibilityInitializeBundle__block_invoke_4()
{
  v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_240268000, v0, OS_LOG_TYPE_DEFAULT, "Loading PDFKit", v3, 2u);
  }

  v1 = (void *)MEMORY[0x263F811C8];
  id v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PDFKit"];
  [v1 loadAccessibilityBundleForBundle:v2 didLoadCallback:&__block_literal_global_341];
}

void __54__AXMobileQuickLookGlue_accessibilityInitializeBundle__block_invoke_338(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_240268000, v3, OS_LOG_TYPE_DEFAULT, "Loaded PDFKit %d", (uint8_t *)v4, 8u);
  }
}

@end