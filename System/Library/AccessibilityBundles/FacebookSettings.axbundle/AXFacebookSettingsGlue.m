@interface AXFacebookSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXFacebookSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_283 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_292];
}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SLFacebookRegistrationEmailPrompt" hasInstanceVariable:@"_orLabel" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SLFacebookRegistrationEmailPrompt", @"textField: shouldChangeCharactersInRange: replacementString:", "B", "@", "{_NSRange=QQ}", "@", 0);

  return 1;
}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Facebook Settings AX Bundle"];
  [v2 setOverrideProcessName:@"FacebookSettings"];

  return MEMORY[0x270F0A270]();
}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"SLFacebookRegistrationEmailPromptAccessibility" canInteractWithTargetClass:1];
}

@end