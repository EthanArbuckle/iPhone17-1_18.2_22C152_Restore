@interface AXMediaControlsGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMediaControlsGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_271 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MediaControls (ControlCenter)"];
  [v2 setOverrideProcessName:@"MediaControls (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 installSafeCategory:@"MRUControlCenterButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUTransportButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingLabelViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingTimeControlsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUMediaSuggestionCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUMediaSuggestionsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRURoutingTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUVolumeStepperViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUControlCenterViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUContinuousSliderViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUViewServiceRoutingViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingVolumeControlsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUSliderAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUActivityNowPlayingViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUActivityMirroringViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUActivityTrailingAccessoryViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUHapticViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsEndpointsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRPlatterViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsTransportStackViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsTransportButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsTimeControlAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsRoutingCornerViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsRelativeVolumeStepperAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsRoutingViewControllerAccessibility" canInteractWithTargetClass:1];
  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];

  [v3 installSafeCategory:@"MediaControlsParentContainerViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsRoutingButtonViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsExpandableButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsContainerViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsBluetoothListeningModeButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUNowPlayingTransportControlsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUActivityNowPlayingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUControlCenterCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUAmbientCompactNowPlayingViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUAmbientNowPlayingVolumeControlsViewAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUControlCenterRouteButtonAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUVolumeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUMediaControlsModuleMoreButtonAccessibility" canInteractWithTargetClass:1];
}

@end