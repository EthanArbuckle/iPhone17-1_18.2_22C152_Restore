@interface AXVoiceTriggerUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVoiceTriggerUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = objc_alloc_init(AXVoiceTriggerUIGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __53__AXVoiceTriggerUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXVoiceTriggerUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"VoiceTriggerUI AX bundle"];
  [v2 setOverrideProcessName:@"VoiceTriggerUI"];

  return MEMORY[0x270F0A270]();
}

void __53__AXVoiceTriggerUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"VTUIEnrollTrainingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIEnrollmentBaseViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIEnrollmentSetupIntroViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIEnrollTrainingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIVoiceSelectionOptionsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIVoiceSelectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUISiriEducationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUIEnrollmentSetupIntroViewControllerOrbAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VTUISiriDataSharingOptInViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end