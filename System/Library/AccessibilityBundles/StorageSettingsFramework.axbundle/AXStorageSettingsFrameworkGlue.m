@interface AXStorageSettingsFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStorageSettingsFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __63__AXStorageSettingsFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_278 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_286];
}

uint64_t __63__AXStorageSettingsFrameworkGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __63__AXStorageSettingsFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Storage Settings"];
  [v2 setOverrideProcessName:@"Storage Settings"];

  return MEMORY[0x270F0A270]();
}

void __63__AXStorageSettingsFrameworkGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"STStorageTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STStorageAppHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STStorageAppCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STStorageTipCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STStorageTipInfoCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STStorageItemCellAccessibility" canInteractWithTargetClass:1];
}

@end