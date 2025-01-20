@interface AXDefaultMediaPlayerGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXDefaultMediaPlayerGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];
}

uint64_t __57__AXDefaultMediaPlayerGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __57__AXDefaultMediaPlayerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileQuickLook Default Player AX Bundle"];
  [v2 setOverrideProcessName:@"MobileQuickLook Default Player"];

  return MEMORY[0x270F09468]();
}

@end