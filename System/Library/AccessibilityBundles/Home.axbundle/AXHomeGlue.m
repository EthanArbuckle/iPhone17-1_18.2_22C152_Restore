@interface AXHomeGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHomeGlue

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

void __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  char v2 = [v1 isEqualToString:@"com.apple.Home"];

  v3 = [MEMORY[0x263F229D0] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_4;
  v4[3] = &__block_descriptor_33_e29_v16__0__AXValidationManager_8l;
  char v5 = v2;
  [v3 performValidations:&__block_literal_global_272 withPreValidationHandler:&__block_literal_global_274 postValidationHandler:0 safeCategoryInstallationHandler:v4];
}

uint64_t __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX Home"];
  [v2 setOverrideProcessName:@"AX Home"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32))
  {
    id v2 = a2;
    [v2 installSafeCategory:@"HOAddLocationViewControllerAccessibility" canInteractWithTargetClass:1];
    [v2 installSafeCategory:@"HOTitleDescriptionAlertActionViewControllerAccessibility" canInteractWithTargetClass:1];
    [v2 installSafeCategory:@"NUIContainerStackViewAccessibility" canInteractWithTargetClass:1];
    [v2 installSafeCategory:@"UIContextMenuCellContentViewAccessibility__Home__UIKit" canInteractWithTargetClass:1];
  }
}

@end