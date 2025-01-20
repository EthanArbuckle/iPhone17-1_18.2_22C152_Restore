@interface AXSearchSettingsBundleGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSearchSettingsBundleGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_277 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_283];
}

uint64_t __59__AXSearchSettingsBundleGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __59__AXSearchSettingsBundleGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Search Settings Bundle"];
  [v2 setOverrideProcessName:@"Search Settings Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __59__AXSearchSettingsBundleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"SearchSettingsControllerAccessibility" canInteractWithTargetClass:1];
}

@end