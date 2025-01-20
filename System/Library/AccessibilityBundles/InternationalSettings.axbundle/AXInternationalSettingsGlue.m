@interface AXInternationalSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXInternationalSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __60__AXInternationalSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __60__AXInternationalSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __60__AXInternationalSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"International Settings"];
  [v2 setOverrideProcessName:@"International Settings"];

  return MEMORY[0x270F0A270]();
}

void __60__AXInternationalSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"ISLanguageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RegionFormatSampleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ISInternationalViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end