@interface AXPhotoLibraryServicesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPhotoLibraryServicesGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_308 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_317];
}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PhotoLibraryServices AX Bundle"];
  [v2 setOverrideProcessName:@"PhotoLibraryServices Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __59__AXPhotoLibraryServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"PLManagedAssetAccessibility" canInteractWithTargetClass:1];
}

@end