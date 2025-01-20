@interface AXHomeUIServiceGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHomeUIServiceGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __52__AXHomeUIServiceGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __52__AXHomeUIServiceGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXHomeUIServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX HomeUIService"];
  [v2 setOverrideProcessName:@"AX HomeUIService"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __52__AXHomeUIServiceGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"HSPCCameraScanViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HSSetupTroubleshootingTipCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HSPCPasscodeEntryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HSPCDetectedViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end