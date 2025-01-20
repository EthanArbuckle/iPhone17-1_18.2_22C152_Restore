@interface AXVideosUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXVideosUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_280 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_289];

    _Failover = [objc_allocWithZone((Class)AXVideosUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __47__AXVideosUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"VUIOverlayView" hasProperty:@"titleLabel" withType:"@"];
  [v2 validateClass:@"VUICollectionViewFeaturedView" hasProperty:@"overlayView" withType:"@"];

  return 1;
}

uint64_t __47__AXVideosUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"VideosUI AX Bundle"];
  [v2 setOverrideProcessName:@"VideosUI"];

  return MEMORY[0x270F09468]();
}

void __47__AXVideosUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AccessibilityNodeAccessibility__VideosUI__SwiftUI" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_CollectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_CardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_FocusableTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_MonogramLockupCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_MultiPlayerContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_UnifiedOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_CardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_InlinePlaybackViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUILabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIUpNextButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIUpNextRequestManagerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIMediaTagsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIFocusableTextViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUITextBadgeAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUITextBadgeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIOfferViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIVideoAdvisoryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIVideoAdvisoryLegendViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIVisualEffectLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIBaseCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIPromoMetadataViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RootSideBarProfileViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_QueryDescriptionBannerViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_AttributionTextViewUIKitAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIRoundButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUILibraryLockupViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUICollectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUILibraryEpisodeListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUILibraryProductInfoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIProductLockupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIEpisodeDetailViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIDownloadButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIAccessView_iOSAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUISeasonPickerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIDownloadEntityTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIListLockupCollectionViewCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUILibraryMenuItemViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosExtrasLockupElementViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosExtrasGridCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosExtrasCarouselCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SearchListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIAccountSettingsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MediaShowcaseHostingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_SportsCanonicalBannerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_MultiPlayerGrabberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OrdinalListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_FloatingCardHostingCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_OfferListLockupCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIFavoriteBannerCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUISportsScoreboardViewModelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIFeaturedCellOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIMenuSectionHeaderCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VUIScorecardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OrdinalCardCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_BrandLockupCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ViewControllerHostingCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FeaturedLockupCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HintListCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoomBannerCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UberNavigationBarTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"VideosUI_QueryDescriptionBarAccessibility" canInteractWithTargetClass:1];
}

@end