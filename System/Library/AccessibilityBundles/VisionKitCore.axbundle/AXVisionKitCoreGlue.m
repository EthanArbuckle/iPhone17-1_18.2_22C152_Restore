@interface AXVisionKitCoreGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVisionKitCoreGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

    _Failover = [objc_allocWithZone((Class)AXVisionKitCoreGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __52__AXVisionKitCoreGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXVisionKitCoreGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"VisionKitCore AX"];
  [v2 setOverrideProcessName:@"VisionKitCore"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __52__AXVisionKitCoreGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"VKCVisualSearchResultItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCImageVisualSearchViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCCornerLookupButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCVisualSearchCornerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCImageTextSelectionView_iOSAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCDataDetectorElementViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKImageAnalysisButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKKeyboardCameraGuidanceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCImageAnalysisBaseViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKCImageSubjectHighlightViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VKImageAnalysisBarButtonItemAccessibility" canInteractWithTargetClass:1];
}

@end