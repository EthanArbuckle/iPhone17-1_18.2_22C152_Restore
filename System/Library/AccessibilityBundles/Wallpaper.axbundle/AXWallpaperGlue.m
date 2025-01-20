@interface AXWallpaperGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWallpaperGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:&__block_literal_global_284 safeCategoryInstallationHandler:&__block_literal_global_287];

    _Failover = [objc_allocWithZone((Class)AXWallpaperGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __48__AXWallpaperGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __48__AXWallpaperGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Wallpaper AX Bundle"];
  [v2 setOverrideProcessName:@"Wallpaper"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

uint64_t __48__AXWallpaperGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"WallpaperPreviewCellAccessibility" canInteractWithTargetClass:1];
}

@end