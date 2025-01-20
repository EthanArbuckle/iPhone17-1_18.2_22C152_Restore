@interface AXMusicGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMusicGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_339 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_348];

    _Failover = [objc_allocWithZone((Class)AXMusicGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __44__AXMusicGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"likeCommand", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"dislikeCommand", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"seekCommand", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  [v2 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredBackwardJumpIntervals"];
  [v2 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredForwardJumpIntervals"];
  [v2 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"jumpByInterval:"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isEnabled", "B", 0);

  return 1;
}

uint64_t __44__AXMusicGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Music AX"];
  [v2 setOverrideProcessName:@"Music"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __44__AXMusicGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIButtonAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UILabelAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UICollectionViewAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIViewControllerAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MusicUINavigationButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BottomPlayerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingControlsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PlayerTimeControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingTransportButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingShuffleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingRepeatButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MusicUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SyncedLyricsLineViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingAutoPlayButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITransitionViewAccessibility__MusicUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SymbolButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SyncedLyricsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonBarButtonAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LyricsSelectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VolumeSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VerticalToggleSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AudioTraitButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VocalsAttenuationSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"QRCodeOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ReactionsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingQueueCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingQueueHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingQueueAddCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingQueueControlsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UICollectionViewListCellAccessibility__Music__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingRouteSharePlayTogetherControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SidebarMenuViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingQueueRepeatCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LibraryMainViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WindowAccessibility" canInteractWithTargetClass:1];
}

@end