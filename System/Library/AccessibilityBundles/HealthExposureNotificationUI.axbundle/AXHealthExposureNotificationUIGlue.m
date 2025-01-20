@interface AXHealthExposureNotificationUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHealthExposureNotificationUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXHealthExposureNotificationUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __67__AXHealthExposureNotificationUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __67__AXHealthExposureNotificationUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"HealthExposureNotificationUI AX"];
  [v2 setOverrideProcessName:@"HealthExposureNotificationUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __67__AXHealthExposureNotificationUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NumberedTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VerificationCheckmarkCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VerificationSymptomDateEntryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RegionSelectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VerificationSummaryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OnboardingWelcomeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OnboardingInfoViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OnboardingHeaderViewAccessibility" canInteractWithTargetClass:1];
}

@end