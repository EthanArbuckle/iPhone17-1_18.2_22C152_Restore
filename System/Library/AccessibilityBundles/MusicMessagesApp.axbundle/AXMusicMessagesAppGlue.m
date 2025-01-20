@interface AXMusicMessagesAppGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMusicMessagesAppGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXMusicMessagesAppGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_275 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_284];
  }
}

uint64_t __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MusicMessagesApp Bundle"];
  [v2 setOverrideProcessName:@"MusicMessagesApp"];

  return MEMORY[0x270F0A270]();
}

void __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"LaunchMusicCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TrackCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SharingCollectionViewHeaderAccessibility" canInteractWithTargetClass:1];
}

@end