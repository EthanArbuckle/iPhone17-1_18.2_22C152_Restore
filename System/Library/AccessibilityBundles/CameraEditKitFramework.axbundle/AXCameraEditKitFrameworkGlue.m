@interface AXCameraEditKitFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCameraEditKitFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_297 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_306];
}

uint64_t __61__AXCameraEditKitFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __61__AXCameraEditKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CameraEditKit Framework AX Bundle"];
  [v2 setOverrideProcessName:@"CameraEditKit Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __61__AXCameraEditKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CEKLightingControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKApertureSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKWheelScrubberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKApertureButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKBadgeTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CEKExpandingSliderAccessibility" canInteractWithTargetClass:1];
}

@end