@interface AXCameraGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCameraGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_277 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_286];

    uint64_t v3 = [objc_allocWithZone((Class)AXCameraGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;
  }
  v5 = [MEMORY[0x263F22850] sharedInstance];
  [v5 addHandler:&__block_literal_global_294 forFramework:@"CameraKit"];

  id v6 = [MEMORY[0x263F22850] sharedInstance];
  [v6 addHandler:&__block_literal_global_305 forFramework:@"PhotosUI"];
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Camera AX Bundle"];
  [v2 setOverrideProcessName:@"Camera Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"CAMApplicationAccessibility__Camera__CameraUI" canInteractWithTargetClass:1];
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return MEMORY[0x270F0A258](&__block_literal_global_296, 0.25);
}

void __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_5()
{
  v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CameraKit"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return MEMORY[0x270F0A258](&__block_literal_global_307, 0.25);
}

void __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_7()
{
  v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PhotosUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

@end