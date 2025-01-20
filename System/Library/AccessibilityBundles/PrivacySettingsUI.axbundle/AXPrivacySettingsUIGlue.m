@interface AXPrivacySettingsUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPrivacySettingsUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_282];

    _Failover = [objc_allocWithZone((Class)AXPrivacySettingsUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __56__AXPrivacySettingsUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PUILocationServicesCell"];
  [v2 validateClass:@"PUILocationUsageMixin"];

  return 1;
}

uint64_t __56__AXPrivacySettingsUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PrivacySettingsUI AX"];
  [v2 setOverrideProcessName:@"PrivacySettingsUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __56__AXPrivacySettingsUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PUILocationServicesCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUILocationServicesAuthLevelCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUITrackerOnboardingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUILockdownModeOnboardingCellAccessibility" canInteractWithTargetClass:1];
}

@end