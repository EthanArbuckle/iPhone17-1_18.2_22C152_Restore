@interface AXMobileSafariUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMobileSafariUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __53__AXMobileSafariUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_319 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_328];
}

uint64_t __53__AXMobileSafariUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"_bookmarksPresentationStyle", "q", 0);
  [v2 validateClass:@"TabGroupSwitcherViewController"];
  [v2 validateClass:@"TabGroupSwitcherViewController" hasInstanceVariable:@"_tabGroups" withType:"NSArray"];
  [v2 validateClass:@"TabGroupSwitcherViewController" hasInstanceVariable:@"_tabController" withType:"TabController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TabGroupSwitcherViewController", @"capsuleCollectionView:contentViewForItemAtIndex:", "@", "@", "q", 0);
  [v2 validateClass:@"TabController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabGroup", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"setActiveTabGroupUUID:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"tabCollectionViewProvider", "@", 0);
  [v2 validateClass:@"TabOverview"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"performUpdatesWithoutTabCloseAnimation:", "v", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"activeProfileIdentifier", "@", 0);
  [v2 validateClass:@"BrowserController" hasInstanceVariable:@"_profileTitleInScene" withType:"NSString"];

  return 1;
}

uint64_t __53__AXMobileSafariUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MobileSafariUI Bundle"];
  [v2 setOverrideProcessName:@"MobileSafariUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __53__AXMobileSafariUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"MobileSafariUIToolbarButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BookmarksBarLabelButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BookmarksBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BookmarksNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BookmarksTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BrowserControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BrowserToolbarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ReadingListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ReadingListTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabDocumentAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SidebarContentDimmingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DownloadTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ContinuousReadingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabThumbnailCloseButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabBarItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabOverviewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"BrowserRootViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CatalogViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UnifiedFieldAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"StepperViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CapsuleNavigationBarRegistrationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabGroupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TabCollectionViewManagerAccessibility" canInteractWithTargetClass:1];
}

@end