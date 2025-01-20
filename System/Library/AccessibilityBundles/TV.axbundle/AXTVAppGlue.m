@interface AXTVAppGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTVAppGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __44__AXTVAppGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __44__AXTVAppGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __44__AXTVAppGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"TV App AX Bundle"];
  [v2 setOverrideProcessName:@"TV"];

  return MEMORY[0x270F0A270]();
}

void __44__AXTVAppGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
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
  [v2 installSafeCategory:@"_TVInfoCellViewAccessibility" canInteractWithTargetClass:1];
}

@end