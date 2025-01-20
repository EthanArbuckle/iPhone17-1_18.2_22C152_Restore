@interface AXCompanionStingSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCompanionStingSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXCompanionStingSettingsGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __61__AXCompanionStingSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __61__AXCompanionStingSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CompanionStingSettings AX"];
  [v2 setOverrideProcessName:@"CompanionStingSettings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __61__AXCompanionStingSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"CSLPRFStingGesturePaneCellAccessibility" canInteractWithTargetClass:1];
}

@end