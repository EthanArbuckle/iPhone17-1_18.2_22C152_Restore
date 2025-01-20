@interface AXDictionarySettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDictionarySettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __57__AXDictionarySettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __57__AXDictionarySettingsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXDictionarySettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Dictionary Settings"];
  [v2 setOverrideProcessName:@"Dictionary Settings"];

  return MEMORY[0x270F0A270]();
}

uint64_t __57__AXDictionarySettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"DSDictionaryTableCellAccessibility" canInteractWithTargetClass:1];
}

@end