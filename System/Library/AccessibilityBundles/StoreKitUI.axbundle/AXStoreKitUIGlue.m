@interface AXStoreKitUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStoreKitUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXStoreKitUIGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_377 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_386];
  }
}

uint64_t __49__AXStoreKitUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIComposeTextField", @"initWithConfiguration: style:", "@", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIRatingStarsCache", @"ratingStarsImageForRating:", "@", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStarRatingControl", @"setUserRating:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStarRatingControl", @"userRating", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIOverlayContainerViewController", @"_popViewControllers", "v", 0);
  [v2 validateClass:@"SKUIComposeTextField" hasInstanceVariable:@"_configuration" withType:"SKUIComposeTextFieldConfiguration"];
  [v2 validateClass:@"SKUISwooshView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIItemCollectionViewCell", @"layout", "@", 0);
  [v2 validateClass:@"SKUIItemCellLayout" hasInstanceVariable:@"_itemOfferButton" withType:"SKUIItemOfferButton"];
  [v2 validateClass:@"SKUIIPadCustomerReviewsHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v2 validateClass:@"SKUIReviewsHistogramView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageFeatureView", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIProductPageFeatureView", @"subtitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIOverlayContainerViewController", @"backstopControl", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIBrickCollectionViewCell", @"accessibilityLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIIPadCustomerReviewsHeaderView", @"initWithClientContext:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUILink", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIIPhoneProductPageViewController", @"_shareButtonAction:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftTextFieldTableViewCell", @"label", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftTextFieldTableViewCell", @"value", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftTextFieldTableViewCell", @"textField", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftRecipientTableViewCell", @"recipientAddresses", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIGiftRecipientTableViewCell", @"label", "@", 0);

  return 1;
}

uint64_t __49__AXStoreKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"StoreKitUI AX Bundle"];
  [v2 setOverrideProcessName:@"StoreKitUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __49__AXStoreKitUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SK_UIBarButtonItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SK_UITableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SK_UICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISettingsTableViewCellAcccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStorePageSectionsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUILockupSwooshCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUILockupSwooshCellLayoutAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIImageCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIDownloadsCellViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIDocumentContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIItemTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftDateTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISegmentedTableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageFeaturesViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIComposeTextFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBrickCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISwooshViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIHorizontalListViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIItemOfferButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIRatingStarsCacheAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIOverlayContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductInformationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStarRatingControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUITextBoxViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIItemCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBrowseHeaderCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIIPhoneProductPageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIItemBrowseCellLayoutAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBannerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUILockupItemCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIReviewsHistogramViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIIPadCustomerReviewsHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftTextFieldTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftRecipientTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIReviewListTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIToggleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageHeaderLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIItemBrowseTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISearchControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageTableExpandableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUILockupItemCellLayoutAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIIPhoneSlideshowCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageReviewsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICircleProgressIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftComposeViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageTableUpdateHistorySectionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftTextTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIRedeemCameraViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageInAppPurchaseTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIHorizontalLockupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIRoundedRectButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStackListCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStackItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBadgeTextAttachmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIAttributedStringViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUITabularLockupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStarRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIVerticalLockupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStyledButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIChartColumnHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIButtonCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUILabelViewElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStarBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIViewElementSlideshowControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProductPageOverlayControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIShelfPageSectionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICarouselPageSectionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUISearchFieldTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICardViewElementCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStarRatingViewElementViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIButtonViewElementAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIReviewCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUITracklistLockupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBarRatingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIVideoThumbnailViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStyledImageButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIShelfCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIBrowseItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIHorizontalLockupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIPreviewProgressIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIOverlayContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUITabBarControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICrossFadingTabBarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIPlayButtonControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIScrollingTabBarContentCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStandardInteractiveSegmentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIIndexBarControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIOnboardingCircleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIOnboardingProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIScrollingSegmentedControllerCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIScrollingSegmentedControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_SKUIModalSheetNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIProfileSettingDescriptionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIEditProfileSettingDescriptionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIPhysicalCirclesViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIOnboardingAffiliationCirclesViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIViewReusePoolAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUICrossFadingTabBarAcccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIImageDeckViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIGiftThemePickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIPageControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIStackedBarCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIFlexibleSegmentedControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIReviewInAppRatingButtonViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUIReviewInAppRatingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKUI_UIViewAccessibility" canInteractWithTargetClass:1];
}

@end