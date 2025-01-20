@interface AXBiometricKitUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBiometricKitUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXBiometricKitUIGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:&__block_literal_global_284 safeCategoryInstallationHandler:&__block_literal_global_287];
  }
}

uint64_t __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"BiometricKitUI AX Bundle"];
  [v2 setOverrideProcessName:@"BiometricKitUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"BKUIPearlEnrollViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIPearlEnrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIPearlPillContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIPearlCoachingDeviceViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIPearlEnrollControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIFingerprintEnrollViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUICurvesViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIFingerPrintEnrollTutorialViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIButtonTrayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIJindoContainerScrollviewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BKUIPearlInstructionViewAccessibility" canInteractWithTargetClass:1];
}

@end