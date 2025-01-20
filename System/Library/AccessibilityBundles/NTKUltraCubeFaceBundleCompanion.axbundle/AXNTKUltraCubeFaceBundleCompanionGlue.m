@interface AXNTKUltraCubeFaceBundleCompanionGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXNTKUltraCubeFaceBundleCompanionGlue

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

void __70__AXNTKUltraCubeFaceBundleCompanionGlue_accessibilityInitializeBundle__block_invoke(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&__block_literal_global_280 withPreValidationHandler:&__block_literal_global_282 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_288];
}

BOOL __70__AXNTKUltraCubeFaceBundleCompanionGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __70__AXNTKUltraCubeFaceBundleCompanionGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AX NTKUltraCubeFaceBundleCompanion"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AX NTKUltraCubeFaceBundleCompanion"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __70__AXNTKUltraCubeFaceBundleCompanionGlue_accessibilityInitializeBundle__block_invoke_4(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"_NTKCUltraCubePhotoListViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"NTK_PUPhotoEditAdjustmentCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"NTK_PUAdjustmentsViewControllerAccessibility" canInteractWithTargetClass:1];
  +[AXNanoTimeKitGlue installNanoTimeKitClasses:v2];
}

@end