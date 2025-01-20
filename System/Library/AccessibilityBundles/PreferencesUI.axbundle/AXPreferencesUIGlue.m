@interface AXPreferencesUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPreferencesUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __52__AXPreferencesUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_285 withPreValidationHandler:&__block_literal_global_287 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_293];
}

uint64_t __52__AXPreferencesUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXPreferencesUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PreferencesUI"];
  [v2 setOverrideProcessName:@"PreferencesUI"];

  return MEMORY[0x270F0A270]();
}

void __52__AXPreferencesUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PSUITouchIDPasscodeControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSUICellularPlanOptionTableCellAccessibility" canInteractWithTargetClass:1];
}

@end