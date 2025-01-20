@interface AXMemoriesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMemoriesGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_297 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_306];
}

uint64_t __47__AXMemoriesGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __47__AXMemoriesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Memories AX Bundle"];
  [v2 setOverrideProcessName:@"Memories"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __47__AXMemoriesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PMiOSSliderViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PMiOSMainViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PMiOSScrubberViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewCellAccessibility__Memories__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PMRoundProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroMovieViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroSmartMusicMenuCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroAssetSuggestionsCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroEditorClipCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroContentEditorViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UICollectionViewAccessibility__Memories__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroEditorClipCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiroTimelineClipCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PMEditorRootViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PMiOSScrubberCollectionViewAccessibility" canInteractWithTargetClass:1];
}

@end