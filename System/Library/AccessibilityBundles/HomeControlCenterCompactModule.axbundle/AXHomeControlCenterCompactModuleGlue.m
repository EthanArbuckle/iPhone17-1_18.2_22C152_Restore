@interface AXHomeControlCenterCompactModuleGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHomeControlCenterCompactModuleGlue

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

void __69__AXHomeControlCenterCompactModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

uint64_t __69__AXHomeControlCenterCompactModuleGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __69__AXHomeControlCenterCompactModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Compact Home Module (ControlCenter)"];
  [v2 setOverrideProcessName:@"Compact Home Module (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __69__AXHomeControlCenterCompactModuleGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"HUCCCompactModuleContentViewControllerAccessibility" canInteractWithTargetClass:1];
  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

@end