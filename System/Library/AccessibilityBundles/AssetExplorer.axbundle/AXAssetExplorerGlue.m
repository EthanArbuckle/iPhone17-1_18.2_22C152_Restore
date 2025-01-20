@interface AXAssetExplorerGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAssetExplorerGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __52__AXAssetExplorerGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_298 withPreValidationHandler:&__block_literal_global_300 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_309];
}

uint64_t __52__AXAssetExplorerGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXAssetExplorerGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AssetExplorer AX Bundle"];
  [v2 setOverrideProcessName:@"AssetExplorer"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __52__AXAssetExplorerGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AERoundedCornerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AEExplorerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AEMessagesShelfRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AEMessagesShelfViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end