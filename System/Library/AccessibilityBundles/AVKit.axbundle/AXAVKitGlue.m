@interface AXAVKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXAVKitGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global_5 withPreValidationHandler:&__block_literal_global_282 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_288];

    uint64_t v3 = [objc_allocWithZone((Class)AXAVKitGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_368 forFramework:@"MediaPlayer"];
  }
}

uint64_t __44__AXAVKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __44__AXAVKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AVKit"];
  [v2 setOverrideProcessName:@"AVKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __44__AXAVKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AVButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVActionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVTransportControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlaybackControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlayerViewControllerContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVTouchIgnoringViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVScrubberAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlaybackControlsRoutePickerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVTurboModePlaybackControlsPlaceholderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlaybackControlsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlayerLayerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessFluidSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessControlsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileTitlebarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessTimelineViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessVolumeControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVVolumeButtonControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessPlaybackControlButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVMobileChromelessContentTabsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPlayerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPictureInPicturePlatformAdapterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPictureInPictureViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AVPictureInPictureUIViewAccessibility" canInteractWithTargetClass:1];
}

void __44__AXAVKitGlue_accessibilityInitializeBundle__block_invoke_4()
{
  v0 = (void *)MEMORY[0x263F811C8];
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = NSString;
  MEMORY[0x24563F350]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 stringWithFormat:@"%@/%@", v5, @"MediaPlayerUIFramework.axbundle"];
  v4 = [v1 bundleWithPath:v3];
  [v0 loadAccessibilityBundleForBundle:v4 didLoadCallback:0];
}

@end