@interface AXGameCenterGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXGameCenterGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_274);
  }
}

void __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_278 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_286];
}

uint64_t __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke_2()
{
  id v0 = [MEMORY[0x263F1C5C0] currentDevice];
  [v0 userInterfaceIdiom];

  return 1;
}

uint64_t __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"GameCenter"];
  [v2 setValidationTargetName:@"GameCenter Accessibility Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

@end