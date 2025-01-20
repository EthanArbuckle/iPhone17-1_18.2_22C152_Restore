@interface AXPodcastGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPodcastGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_370 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_376];

    _Failover = [objc_allocWithZone((Class)AXPodcastGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXPodcastGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTSwitch", @"isOn", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"isEditing", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIImage", @"nowPlayingIcon", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIImage", @"unplayedIcon", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIImage", @"halfPlayedIcon", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIImage", @"infoIcon", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPodcastPlaylistCell", @"isAdded", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAVPlayer", @"playbackSpeed", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTTableViewCell", @"leftAccessoryView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAddPodcastCellAccessoryView", @"isAdded", "B", 0);
  [v2 validateClass:@"MTAddPodcastCellAccessoryView" hasInstanceVariable:@"_added" withType:"c"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"seekCommand", "@", 0);
  [v2 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredBackwardJumpIntervals"];
  [v2 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredForwardJumpIntervals"];

  return 1;
}

uint64_t __46__AXPodcastGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Podcasts"];
  [v2 setOverrideProcessName:@"Podcasts"];

  return MEMORY[0x270F0A270]();
}

void __46__AXPodcastGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PodcastsUIApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITransitionViewAccessibility__Podcasts__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTUIViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTUIImageAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTEpisodeDownloadCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTPodcastPlaylistCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTPodcastInfoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTEpisodeLockupAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTEpisodeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MarmosetUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTSwitchAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MarmosetUITextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTAddPodcastCellAccessoryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTActionButtonContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTPodcastCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTLabelStackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTUIStatusBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EpisodeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeLockupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EditorialCardCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MiniPlayerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingTransportButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NowPlayingEpisodeUpsellBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PlayerTimeControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TitleSectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BrickCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ArtworkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MusicLibraryAddKeepLocalControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PlaybackStatusViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ProductRatingCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RatingRowViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ReviewRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GlyphButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIScrollViewAccessibility__Podcasts__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SongCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ProductTapToRateCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LargeLockupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PowerSwooshCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UpsellBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SwiftUIAccessibilityNode__Podcasts__SwiftUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DeprecatedChapterCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTSwitchCellAccessibility_temp" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ArtworkWithPlaybackStatusViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MTPodcastPlaylistSheetHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIButtonBarButtonAccessibility__Podcasts__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AccountDetailCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CachingArtworkViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ChartEpisodeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ModernTitleHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EpisodeInfoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PlayControlsStackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EpisodeStateControlsStackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MultiShowEpisodeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SingleShowEpisodeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ModernProductReviewCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchLandingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ExternalLinkCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ChevronButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LinkListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OldEpisodeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HighlightItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ShowcaseCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InformationCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ShowMetadataViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CircleListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FollowNavButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PodcastsContextUIButtonAccessibility" canInteractWithTargetClass:1];
}

@end