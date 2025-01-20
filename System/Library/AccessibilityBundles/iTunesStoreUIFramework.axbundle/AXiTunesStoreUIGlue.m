@interface AXiTunesStoreUIGlue
+ (void)_webKitInitialized;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXiTunesStoreUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v3 = [MEMORY[0x263F229D0] sharedInstance];
    [v3 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_543 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_552];

    uint64_t v4 = [objc_allocWithZone((Class)AXiTunesStoreUIGlue) init];
    v5 = (void *)_Failover;
    _Failover = v4;

    AXPerformBlockOnMainThreadAfterDelay();
  }
  if ([(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"_accessibilityWebKitLoaded"])
  {
    [a1 _webKitInitialized];
  }
  else
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:a1 selector:sel__webKitInitialized name:@"UIApplicationLoadedWebKit" object:0];
  }
}

uint64_t __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SUBannerCellConfiguration"];
  [v2 validateClass:@"SUCompletionCellConfiguration"];
  [v2 validateClass:@"SUTableCell"];
  [v2 validateClass:@"SUMaskedView"];
  [v2 validateClass:@"SUTableCellContentView"];
  [v2 validateClass:@"SUItemOfferButton"];
  [v2 validateClass:@"SUStorePageViewController"];
  [v2 validateClass:@"SUCellConfigurationCache"];
  [v2 validateClass:@"SUTermsAndConditionsView"];
  [v2 validateClass:@"SULinkControl"];
  [v2 validateClass:@"SUReviewsButton"];
  [v2 validateClass:@"SUReviewCellConfiguration"];
  [v2 validateClass:@"SUReviewsHeaderCellConfiguration"];
  [v2 validateClass:@"SULoadMoreCellConfiguration"];
  [v2 validateClass:@"SUTextContentView"];
  [v2 validateClass:@"SUPlaceholderViewController"];
  [v2 validateClass:@"SUViewController"];
  [v2 validateClass:@"SUItem"];
  [v2 validateClass:@"SUItemCellConfiguration"];
  [v2 validateClass:@"SUOverlayBackgroundViewController"];
  [v2 validateClass:@"SUSubtitledButton"];
  [v2 validateClass:@"SUNavigationButton"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SUStoreController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SUClientController", @"sharedController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ISUDownload", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ISUDownload", @"artistName", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTouchCaptureView", @"passThroughViews", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTableHeaderView", @"subtitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTableHeaderView", @"title", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUStoreController", @"storeContentLanguage", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUStorePageViewController", @"reloadForSectionsWithGroup:", "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemOfferButton", @"_reloadButton", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUArrayCellConfiguration", @"_accessibilityStringsArrayPointer", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUCellConfigurationCache", @"configurationForRow:", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTermsAndConditionsView", @"_termsAndConditionsControl", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemOfferButton", @"itemOfferButtonStyle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTextContentView", @"placeholder", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUDeferredUISegmentedControl", @"_commitDeferredInterfaceUpdates", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUStorePageViewController", @"_handleViewControllerBecameReady:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"setTopExtensionViewColor:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUComposeTextFieldConfiguration", @"label", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItem", @"reviewStatistics", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemReviewStatistics", @"numberOfUserRatings", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemReviewStatistics", @"averageUserRating", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItem", @"contentRating", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUItemContentRating", @"isExplicitContent", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableView", @"_accessibilityUIScrollViewScrollStatus", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableView", @"_accessibilityHeaderElement", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUClientController", @"rootViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTabBarController", @"overlayBackgroundViewController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUSubtitledButton", @"currentSubtitle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownload", @"status", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isFailed", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SSDownloadStatus", @"isPaused", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTableCell", @"showHighlight", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUStorePageViewController", @"_setActiveChildViewController: shouldTearDown:", "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"init", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"_accessibilityPerformScrollUp", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"_accessibilityPerformScrollDown", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"_accessibilityPerformScrollLeft", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"_accessibilityPerformScrollRight", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUScriptNotificationObserver", @"_accessibilityPerformEscape", "v", 0);
  [v2 validateClass:@"SUStorePageViewController" hasInstanceVariable:@"_segmentedControl" withType:"SUSegmentedControl"];
  [v2 validateClass:@"SUItemCellConfiguration" hasInstanceVariable:@"_representedObject" withType:"@"];
  [v2 validateClass:@"SUCellConfiguration" hasInstanceVariable:@"_representedObject" withType:"@"];
  [v2 validateClass:@"SUTableCell" hasInstanceVariable:@"_configurationView" withType:"SUTableCellContentView"];
  [v2 validateClass:@"SUTableCellContentView" hasInstanceVariable:@"_configuration" withType:"SUCellConfiguration"];
  [v2 validateClass:@"SUCellConfigurationCache" hasInstanceVariable:@"_configurations" withType:"NSMutableArray"];
  [v2 validateClass:@"SULinkControl" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v2 validateClass:@"SUReviewsButton" hasInstanceVariable:@"_userRating" withType:"f"];
  [v2 validateClass:@"SUStorePageViewController" hasInstanceVariable:@"_activeChildViewController" withType:"SUViewController"];
  [v2 validateClass:@"SUOverlayBackgroundViewController" hasInstanceVariable:@"_viewControllers" withType:"NSMutableArray"];
  [v2 validateClass:@"SUOverlayBackgroundViewController" hasInstanceVariable:@"_selectedViewControllerIndex" withType:"q"];

  return 1;
}

uint64_t __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"iTunes Store UI AX Bundle"];
  [v2 setOverrideProcessName:@"iTunes Store UI"];

  return MEMORY[0x270F0A270]();
}

void __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SUTableCellContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUItemOfferButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUCompletionCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTouchCaptureViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUCellConfigurationCacheAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUBannerCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUBannerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUStructuredPageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTermsAndConditionsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUReviewsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUStorePageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUReviewCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUReviewsHeaderCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SULoadMoreCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTextContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUDeferredUISegmentedControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUShortLinkCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTallLinkCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUThreeLineTrackCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SULoadMoreMediaCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUItemCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUMaskedViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTwoLineTrackCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUTableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUButtonCellConfigurationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUSubtitledButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUNavigationButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUScriptNotificationObserverAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SURedeemCameraViewControllerAccessibility" canInteractWithTargetClass:1];
}

+ (void)_webKitInitialized
{
}

void __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_669 withPreValidationHandler:&__block_literal_global_680 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_688];
}

uint64_t __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SUWebViewController", @"_removePlaceholderBackgroundView", "v", 0);
  [v2 validateClass:@"SUWebView"];

  return 1;
}

uint64_t __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"iTunesStoreUI Web Framework AX Bundle"];
  [v2 setOverrideProcessName:@"iTunesStoreUI - Web"];

  return MEMORY[0x270F0A270]();
}

void __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SUWebViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUWebViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUUIWebDocumentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SUiBooksOverrideWebViewAccessibility" canInteractWithTargetClass:1];
}

@end