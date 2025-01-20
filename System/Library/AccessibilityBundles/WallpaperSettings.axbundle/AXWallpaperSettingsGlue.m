@interface AXWallpaperSettingsGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWallpaperSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global_796 withPreValidationHandler:&__block_literal_global_798 postValidationHandler:&__block_literal_global_807 safeCategoryInstallationHandler:&__block_literal_global_810];

    _Failover = [objc_allocWithZone((Class)AXWallpaperSettingsGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __56__AXWallpaperSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __56__AXWallpaperSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WallpaperSettings AX Bundle"];
  [v2 setOverrideProcessName:@"WallpaperSettings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __56__AXWallpaperSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WSBundleCollectionOptionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WallpaperPhotoCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI" canInteractWithTargetClass:1];
}

@end