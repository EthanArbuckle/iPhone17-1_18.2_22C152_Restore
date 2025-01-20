@interface SBIconControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCloseOpenFolder;
- (BOOL)_axIsShowingAppLibrary;
- (BOOL)_axIsShowingHomeScreenTodayView;
- (BOOL)_axIsSidebarPinned;
- (BOOL)_axNeedsToDismissHomeScreenTodayView;
- (SBIconControllerAccessibility)init;
- (id)_axCurrentPageControl;
- (id)_axDragManager;
- (id)_axIconScrollView;
- (id)_axLabelForIcons:(id)a3;
- (int64_t)_accessibilityCurrentPageIndex;
- (int64_t)_accessibilityIconListCount;
- (int64_t)_accessibilityIconListIndex;
- (void)_accessibilityMarkIconAsAnimating:(id)a3;
- (void)_accessibilitySwitchControlStatusChanged;
- (void)_accessibilityVoiceOverStatusChanged;
- (void)_axHideAppLibrary;
- (void)_axHideTodayView;
- (void)_axShowAppLibrary;
- (void)_axShowTodayView;
@end

@implementation SBIconControllerAccessibility

- (id)_axDragManager
{
  return (id)[(SBIconControllerAccessibility *)self safeValueForKey:@"iconDragManager"];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBIconController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_currentFolderController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"presentLibraryForIconManager:windowScene:animated:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"presentTodayOverlayForIconManager:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"dismissTodayOverlay", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"dismissHomeScreenOverlaysAnimated:completion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"todayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"overlayLibraryViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"isMainDisplayLibraryViewVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"isTodayOverlayPresented", "B", 0);
  [v3 validateClass:@"SBTodayViewController" isKindOfClass:@"SBHTodayViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHTodayViewController", @"listView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryViewController", @"containerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibrarySearchController", @"searchBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHSearchBar", @"searchTextField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"icons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"currentPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"minimumPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isFolderIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"isFull", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isLeafIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"nodeIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"openedFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"closeFolderAnimated:withCompletion:", "v", "B", "@?", 0);
  [v3 validateClass:@"SBFolderIcon" hasInstanceVariable:@"_folder" withType:"SBFolder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"homeScreenViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenViewController", @"iconContentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconDragManager", "@", 0);
  [v3 validateClass:@"SBIconDragManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"performSpringLoadedInteractionForIconDragOnIconView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"containsNodeIdentifier:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"icon", "@", 0);
  [v3 validateClass:@"SBFolderController"];
  [v3 validateClass:@"SBFolderController" hasInstanceVariable:@"_contentView" withType:"SBFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"setCurrentPageIndex:animated:", "B", "q", "B", 0);
  [v3 validateClass:@"SBFolderView"];
  [v3 validateClass:@"SBFolderView" hasInstanceVariable:@"_pageControl" withType:"SBIconListPageControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"iconManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"_rootFolderController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"rootFolderView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"_overscrollScrollPanGestureRecognizerDidUpdate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenDefaults", @"isSidebarPinned", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"_captureInitialSearchScrollTrackingState", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"_cleanUpAfterScrolling", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"dndStateService", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"isModalAppLibrarySupported", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"modalLibraryController", "@", 0);
  [v3 validateClass:@"SBModalLibraryController" hasProperty:@"libraryViewController" withType:"@"];
  [v3 validateClass:@"SBDefaults"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBDefaults", @"localDefaults", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLocalDefaults", @"homeScreenDefaults", "@", 0);
}

- (SBIconControllerAccessibility)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBIconControllerAccessibility;
  v2 = [(SBIconControllerAccessibility *)&v6 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__accessibilityVoiceOverStatusChanged name:*MEMORY[0x263F1CF90] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__accessibilitySwitchControlStatusChanged name:*MEMORY[0x263F1CEB8] object:0];
  }
  return v2;
}

- (void)_accessibilitySwitchControlStatusChanged
{
  if (!UIAccessibilityIsSwitchControlRunning())
  {
    [(SBIconControllerAccessibility *)self _accessibilityStatusChanged];
  }
}

- (void)_accessibilityVoiceOverStatusChanged
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    [(SBIconControllerAccessibility *)self _accessibilityStatusChanged];
  }
}

- (id)_axLabelForIcons:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    v7 = &stru_26F7D3690;
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "accessibilityLabel", v11, v12);
        v12 = @"__AXStringForVariablesSentinel";
        __UIAXStringForVariables();
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11, @"__AXStringForVariablesSentinel");
    }
    while (v5);
  }
  else
  {
    v7 = &stru_26F7D3690;
  }

  return v7;
}

- (void)_accessibilityMarkIconAsAnimating:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
  id v7 = v3;
  if (!SBAXDroppedIconsAnimatingIntoPlace)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
    SBAXDroppedIconsAnimatingIntoPlace = (uint64_t)v5;

    id v3 = v7;
    uint64_t v4 = (void *)SBAXDroppedIconsAnimatingIntoPlace;
  }
  if (([v4 containsObject:v3] & 1) == 0) {
    [(id)SBAXDroppedIconsAnimatingIntoPlace axSafelyAddObject:v7];
  }
}

- (BOOL)_accessibilityCloseOpenFolder
{
  return 1;
}

void __62__SBIconControllerAccessibility__accessibilityCloseOpenFolder__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"iconManager"];
  [v1 closeFolderAnimated:1 withCompletion:0];
}

- (int64_t)_accessibilityIconListIndex
{
  v2 = [(SBIconControllerAccessibility *)self _axCurrentPageControl];
  int64_t v3 = [v2 currentPage];

  return v3;
}

- (int64_t)_accessibilityIconListCount
{
  v2 = [(SBIconControllerAccessibility *)self _axCurrentPageControl];
  int64_t v3 = [v2 numberOfPages];

  return v3;
}

- (id)_axCurrentPageControl
{
  v2 = [(SBIconControllerAccessibility *)self safeValueForKey:@"_currentFolderController"];
  int64_t v3 = [v2 safeValueForKey:@"_contentView"];
  objc_opt_class();
  uint64_t v4 = [v3 safeValueForKey:@"_pageControl"];
  id v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (id)_axIconScrollView
{
  v2 = [(SBIconControllerAccessibility *)self safeValueForKey:@"homeScreenViewController"];
  int64_t v3 = [v2 safeUIViewForKey:@"iconContentView"];

  objc_opt_class();
  uint64_t v4 = [v3 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Sbiconscrollvi.isa)];
  id v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (void)_axShowTodayView
{
  if ([(SBIconControllerAccessibility *)self _axIsShowingAppLibrary]) {
    [(SBIconControllerAccessibility *)self _axHideAppLibrary];
  }
  AXPerformSafeBlock();
  int64_t v3 = accessibilityLocalizedString(@"did.show.today.view.announcement");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

void __49__SBIconControllerAccessibility__axShowTodayView__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  AXSBHIconManagerFromSharedIconController();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 presentTodayOverlayForIconManager:v2];
}

- (void)_axHideTodayView
{
  if ([(SBIconControllerAccessibility *)self _axIsShowingHomeScreenTodayView])
  {
    AXPerformSafeBlock();
    int64_t v3 = [(SBIconControllerAccessibility *)self _accessibilityCurrentPageIndex];
    unsigned int IsPad = AXDeviceIsPad();
    id v5 = AXSBScrollDescriptionForCurrentPage(v3 + IsPad);
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

uint64_t __49__SBIconControllerAccessibility__axHideTodayView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissTodayOverlay];
}

- (void)_axShowAppLibrary
{
  AXPerformSafeBlock();
  id v2 = AXLibraryViewController(@"activeDisplayWindowScene");
  int64_t v3 = [v2 safeValueForKeyPath:@"containerViewController.searchBar.searchTextField"];

  uint64_t v4 = accessibilityLocalizedString(@"did.show.app.library.announcement");
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v3);
}

void __50__SBIconControllerAccessibility__axShowAppLibrary__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  AXSBHIconManagerFromSharedIconController();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = AXWindowScene(@"activeDisplayWindowScene");
  [v1 presentLibraryForIconManager:v3 windowScene:v2 animated:1];
}

- (void)_axHideAppLibrary
{
  if ([(SBIconControllerAccessibility *)self _axIsShowingAppLibrary]) {
    AXPerformSafeBlock();
  }
}

uint64_t __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke_2;
  v3[3] = &unk_265153E80;
  v3[4] = v1;
  return [v1 dismissHomeScreenOverlaysAnimated:1 completion:v3];
}

void __50__SBIconControllerAccessibility__axHideAppLibrary__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _accessibilityCurrentPageIndex];
  unsigned int IsPad = AXDeviceIsPad();
  AXSBScrollDescriptionForCurrentPage(v1 + IsPad);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (BOOL)_axIsShowingAppLibrary
{
  id v2 = AXSBHIconManagerFromSharedIconController();
  char v3 = [v2 safeBoolForKey:@"isMainDisplayLibraryViewVisible"];

  return v3;
}

- (BOOL)_axIsShowingHomeScreenTodayView
{
  return [(SBIconControllerAccessibility *)self safeBoolForKey:@"isTodayOverlayPresented"];
}

- (BOOL)_axIsSidebarPinned
{
  id v2 = [NSClassFromString(&cfstr_Sbdefaults.isa) safeValueForKeyPath:@"localDefaults.homeScreenDefaults"];
  char v3 = [v2 safeBoolForKey:@"isSidebarPinned"];

  return v3;
}

- (BOOL)_axNeedsToDismissHomeScreenTodayView
{
  if ([(SBIconControllerAccessibility *)self _axIsSidebarPinned]) {
    return 0;
  }

  return [(SBIconControllerAccessibility *)self _axIsShowingHomeScreenTodayView];
}

- (int64_t)_accessibilityCurrentPageIndex
{
  id v2 = [(SBIconControllerAccessibility *)self safeValueForKey:@"_currentFolderController"];
  uint64_t v3 = [v2 safeIntegerForKey:@"currentPageIndex"];
  int64_t v4 = v3 - [v2 safeIntegerForKey:@"minimumPageIndex"];

  return v4;
}

@end