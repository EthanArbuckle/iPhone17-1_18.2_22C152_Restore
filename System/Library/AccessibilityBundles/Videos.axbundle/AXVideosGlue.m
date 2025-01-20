@interface AXVideosGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVideosGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXVideosGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __45__AXVideosGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __45__AXVideosGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Videos AX Bundle"];
  [v2 setOverrideProcessName:@"Videos"];

  return MEMORY[0x270F0A270]();
}

void __45__AXVideosGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"VideosContentRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosDetailHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosPlaybackViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosPosterCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosChaptersTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosTVEpisodesTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosRelatedStoreItemsCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUITableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosRentalCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosExtrasLockupElementViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUITableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosContentRatingWrapperViewAccessibility" canInteractWithTargetClass:1];
}

@end