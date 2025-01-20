@interface AXMusicUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMusicUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXMusicUIGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_284 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_293];
  }
}

uint64_t __46__AXMusicUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXMusicUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MusicUI AX Bundle"];
  [v2 setOverrideProcessName:@"MusicUI"];

  return MEMORY[0x270F0A270]();
}

void __46__AXMusicUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UICollectionViewAccessibility__MusicUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITabBarButtonAccessibility__MusicUI__UIKit" canInteractWithTargetClass:1];
  if (AXDeviceIsPad()) {
    [v2 installSafeCategory:@"MusicPlaylistEditingPickerOverlayAccessibility" canInteractWithTargetClass:1];
  }
  [v2 installSafeCategory:@"SocialProfileButtonUIViewAccessibility" canInteractWithTargetClass:1];
}

@end