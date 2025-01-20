@interface AXCameraKitGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCameraKitGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_316 withPreValidationHandler:&__block_literal_global_318 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_327];

  id v1 = [MEMORY[0x263F21388] sharedInstance];
  [v1 addHandler:&__block_literal_global_333 forFramework:@"Photos"];
}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CameraKit AX Bundle"];
  [v2 setOverrideProcessName:@"CameraKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F21300]];

  if ((v4 & 1) == 0) {
    [v5 installSafeCategory:@"CMKShutterButtonAccessibility" canInteractWithTargetClass:1];
  }
}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return MEMORY[0x270F09440](&__block_literal_global_335, 0.25);
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_6()
{
  v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Photos"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

@end