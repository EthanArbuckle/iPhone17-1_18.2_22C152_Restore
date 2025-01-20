@interface AXCameraEffectsKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCameraEffectsKitGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXCameraEffectsKitGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXCameraEffectsKitGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXCameraEffectsKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CameraEffectsKit AX"];
  [v2 setOverrideProcessName:@"CameraEffectsKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __55__AXCameraEffectsKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CFXCaptureViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXEffectEditorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXPreviewViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXEffectBrowserViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXFilterEffectPickerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXFilterPickerCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXPlayButtonViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CFXControlsViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end