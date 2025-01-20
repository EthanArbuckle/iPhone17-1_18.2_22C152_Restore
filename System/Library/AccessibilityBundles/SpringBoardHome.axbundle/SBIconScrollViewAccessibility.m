@interface SBIconScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCCScrollToNextPage;
- (BOOL)_accessibilityCCScrollToPreviousPage;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)_accessibilityRemembersLastFocusedChild;
- (BOOL)_accessibilitySBScrollToNextPage;
- (BOOL)_accessibilitySBScrollToPreviousPage;
- (BOOL)_axIsControlCenter;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollToTopSupported;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityScrollUpPageSupported;
- (BOOL)accessibilityViewIsModal;
- (BOOL)shouldGroupAccessibilityChildren;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)_accessibilityCurrentFolderIconForPage:(int64_t)a3;
- (id)_accessibilityFolderContentView;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityScrollStatus:(BOOL)a3;
- (id)automationElements;
- (int64_t)_accessibilityAdjustedPageIndexForPageIndex:(int64_t)a3;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityPageActionForNextGesture:(int64_t *)a3;
- (unint64_t)_accessibilityPageActionForPreviousGesture:(int64_t *)a3;
- (void)_accessibilityActivateSpotlight;
- (void)_accessibilityScrollToPage:(int64_t)a3;
@end

@implementation SBIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"presentSpotlightFromSource:animated:completionHandler:", "B", "Q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isShowingLeadingCustomView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isShowingSpotlightOrLeadingCustomView", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"icons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconViewForIcon:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  [v3 validateClass:@"SBFolderController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"setCurrentPageIndex: animated: completion:", "B", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"iconListViewAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"_depth", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"minimumPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"firstIconPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"pageCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"currentPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"leadingCustomViewPageIndex", "q", 0);
  [v3 validateClass:@"SBIconScrollView" isKindOfClass:@"BSUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSUIScrollView", @"delegate", "@", 0);
  [v3 validateClass:@"SBRootFolderController" isKindOfClass:@"SBFolderController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"firstIconPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderController", @"isDisplayingWidgetIntroductionOnPage:", "B", "q", 0);
  [v3 validateClass:@"SBFolderController"];
  [v3 validateClass:@"SBFolderController" hasInstanceVariable:@"_contentView" withType:"SBFolderView"];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [(SBIconScrollViewAccessibility *)self safeValueForKeyPath:@"delegate.delegate"];
  [v2 safeIntegerForKey:@"firstIconPageIndex"];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = v2;
  AXPerformSafeBlock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SBIconScrollViewAccessibility_accessibilityViewIsModal__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDisplayingWidgetIntroductionOnPage:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (BOOL)accessibilityScrollToTopSupported
{
  return 0;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)_accessibilityCurrentFolderIconForPage:(int64_t)a3
{
  char v3 = AXSBCurrentFolderController();
  if (v3 && (NSClassFromString(&cfstr_Sbrootfolderco_0.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    id v18 = 0;
    id v12 = v3;
    AXPerformSafeBlock();
    id v5 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    LOBYTE(v13) = 0;
    objc_opt_class();
    uint64_t v6 = [v5 icons];
    v7 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v13) {
      abort();
    }
    uint64_t v8 = [v7 firstObject];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    id v18 = 0;
    id v10 = v5;
    id v11 = v8;
    AXPerformSafeBlock();
    id v4 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __72__SBIconScrollViewAccessibility__accessibilityCurrentFolderIconForPage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) iconListViewAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

uint64_t __72__SBIconScrollViewAccessibility__accessibilityCurrentFolderIconForPage___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityScrollStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = AXSBIconControllerSharedInstance();
  id v5 = [v4 safeValueForKey:@"_accessibilityIconListIndex"];
  int v6 = [v5 intValue];

  if (v3)
  {
    v7 = [v4 safeValueForKey:@"_accessibilityIconListCount"];
    int v8 = [v7 intValue] - 1;

    if (v6 < v8)
    {
      int v9 = 1;
LABEL_6:
      int v10 = v6 + v9;
      id v11 = AXSBHIconManagerFromSharedIconController();
      int v12 = [v11 safeBoolForKey:@"isShowingLeadingCustomView"];

      if (v12) {
        uint64_t v13 = -1;
      }
      else {
        uint64_t v13 = v10;
      }
      v14 = AXSBScrollDescriptionForCurrentPage(v13);
      goto LABEL_11;
    }
  }
  else if (v6 >= 2)
  {
    int v9 = -1;
    goto LABEL_6;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)automationElements
{
  v2 = AXSBCurrentFolderController();
  BOOL v3 = [v2 safeValueForKey:@"_contentView"];
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"_iconListViews"];
  id v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (id)_accessibilityScrollStatus
{
  v2 = AXSBIconControllerSharedInstance();
  BOOL v3 = [v2 safeValueForKey:@"_accessibilityIconListIndex"];
  int v4 = [v3 intValue] + 1;

  id v5 = AXSBScrollDescriptionForCurrentPage(v4);

  return v5;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  v2 = AXSBHIconManagerFromSharedIconController();
  char v3 = [v2 safeBoolForKey:@"isShowingSpotlightOrLeadingCustomView"];

  return v3 ^ 1;
}

- (BOOL)accessibilityScrollUpPage
{
  if ([(SBIconScrollViewAccessibility *)self _axIsControlCenter]) {
    return 0;
  }
  char v3 = AXSBHIconManagerFromSharedIconController();
  char v4 = [v3 safeBoolForKey:@"isShowingSpotlightOrLeadingCustomView"];

  if (v4) {
    return 0;
  }
  [(SBIconScrollViewAccessibility *)self _accessibilityActivateSpotlight];
  return 1;
}

- (BOOL)_axIsControlCenter
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if ([(SBIconScrollViewAccessibility *)self _axIsControlCenter])
  {
    if (a3 != 4)
    {
      if (a3 == 3)
      {
        return [(SBIconScrollViewAccessibility *)self _accessibilityCCScrollToPreviousPage];
      }
      return 0;
    }
    return [(SBIconScrollViewAccessibility *)self _accessibilityCCScrollToNextPage];
  }
  if (![(SBIconScrollViewAccessibility *)self _accessibilityApplicationIsRTL])
  {
    if (a3 == 2) {
      goto LABEL_19;
    }
    if (a3 != 1) {
      goto LABEL_22;
    }
LABEL_13:
    return [(SBIconScrollViewAccessibility *)self _accessibilitySBScrollToPreviousPage];
  }
  if (a3 == 2) {
    goto LABEL_13;
  }
  if (a3 == 1)
  {
LABEL_19:
    return [(SBIconScrollViewAccessibility *)self _accessibilitySBScrollToNextPage];
  }
LABEL_22:
  int v6 = AXSBIconControllerSharedInstance();
  v7 = [v6 safeValueForKey:@"_accessibilityIconListCount"];
  uint64_t v8 = [v7 integerValue];
  if (a3 != 3 || v8 != 1)
  {

    return 0;
  }
  BOOL v9 = [(SBIconScrollViewAccessibility *)self accessibilityScrollUpPageSupported];

  if (!v9) {
    return 0;
  }

  return [(SBIconScrollViewAccessibility *)self accessibilityScrollUpPage];
}

- (void)_accessibilityActivateSpotlight
{
  v2 = accessibilityLocalizedString(@"spotlight.visible");
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  id v3 = [MEMORY[0x263F22968] server];
  [v3 toggleSpotlight];
}

- (BOOL)_accessibilitySBScrollToNextPage
{
  id v3 = [(SBIconScrollViewAccessibility *)self _accessibilityFolderContentView];
  uint64_t v4 = [v3 safeIntegerForKey:@"currentPageIndex"];

  uint64_t v8 = v4;
  unint64_t v5 = [(SBIconScrollViewAccessibility *)self _accessibilityPageActionForNextGesture:&v8];
  switch(v5)
  {
    case 3uLL:
      int v6 = AXSBIconControllerSharedInstance();
      [v6 _axShowAppLibrary];
LABEL_7:

      return 1;
    case 2uLL:
      int v6 = AXSBIconControllerSharedInstance();
      [v6 _axHideTodayView];
      goto LABEL_7;
    case 0uLL:
      [(SBIconScrollViewAccessibility *)self _accessibilityScrollToPage:v8];
      return 1;
  }
  return 0;
}

- (BOOL)_accessibilitySBScrollToPreviousPage
{
  id v3 = [(SBIconScrollViewAccessibility *)self _accessibilityFolderContentView];
  uint64_t v4 = [v3 safeIntegerForKey:@"currentPageIndex"];

  uint64_t v8 = v4;
  unint64_t v5 = [(SBIconScrollViewAccessibility *)self _accessibilityPageActionForPreviousGesture:&v8];
  switch(v5)
  {
    case 4uLL:
      int v6 = AXSBIconControllerSharedInstance();
      [v6 _axHideAppLibrary];
LABEL_7:

      return 1;
    case 1uLL:
      int v6 = AXSBIconControllerSharedInstance();
      [v6 _axShowTodayView];
      goto LABEL_7;
    case 0uLL:
      [(SBIconScrollViewAccessibility *)self _accessibilityScrollToPage:v8];
      return 1;
  }
  return 0;
}

- (BOOL)_accessibilityCCScrollToNextPage
{
  v2 = [(SBIconScrollViewAccessibility *)self safeValueForKey:@"delegate"];
  uint64_t v3 = [v2 safeIntegerForKey:@"minimumPageIndex"];
  uint64_t v4 = [v2 safeIntegerForKey:@"currentPageIndex"] + 1 - v3;
  uint64_t v5 = [v2 safeIntegerForKey:@"pageCount"];
  if (v4 < v5)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    uint64_t v15 = __Block_byref_object_dispose__7;
    id v16 = 0;
    id v10 = v2;
    AXPerformSafeBlock();
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    id v9 = v10;
    id v7 = v6;
    AXPerformSafeBlock();
  }
  return v4 < v5;
}

uint64_t __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) indicatorDescriptionForPageIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

void __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_3;
  v6[3] = &unk_2651582B0;
  long long v9 = *(_OWORD *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 setCurrentPageIndex:v2 animated:1 completion:v6];
}

void __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = AXControlCenterPageStatus(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 32));
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  id v4 = *(void **)(a1 + 40);

  UIAccessibilityPostNotification(v3, v4);
}

- (BOOL)_accessibilityCCScrollToPreviousPage
{
  uint64_t v2 = [(SBIconScrollViewAccessibility *)self safeValueForKey:@"delegate"];
  [v2 safeIntegerForKey:@"minimumPageIndex"];
  uint64_t v3 = [v2 safeIntegerForKey:@"currentPageIndex"] - 1;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  LOBYTE(v14) = 0;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke;
  v20 = &unk_2651580B0;
  v22 = &v11;
  id v4 = v2;
  id v21 = v4;
  uint64_t v23 = v3;
  AXPerformSafeBlock();
  int v5 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    uint64_t v15 = __Block_byref_object_dispose__7;
    id v16 = 0;
    id v10 = v4;
    AXPerformSafeBlock();
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    [v10 safeIntegerForKey:@"pageCount"];
    id v9 = v10;
    id v7 = v6;
    AXPerformSafeBlock();
  }
  return v5 != 0;
}

uint64_t __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isValidPageIndex:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) indicatorDescriptionForPageIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

void __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_4;
  v6[3] = &unk_2651582B0;
  long long v9 = *(_OWORD *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 setCurrentPageIndex:v2 animated:1 completion:v6];
}

void __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = AXControlCenterPageStatus(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 32));
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  id v4 = *(void **)(a1 + 40);

  UIAccessibilityPostNotification(v3, v4);
}

- (BOOL)_accessibilityRemembersLastFocusedChild
{
  return 0;
}

- (unint64_t)_accessibilityPageActionForPreviousGesture:(int64_t *)a3
{
  uint64_t v5 = AXSBIconControllerSharedInstance();
  char v6 = [v5 _axIsShowingAppLibrary];

  if (v6) {
    return 4;
  }
  uint64_t v8 = [(SBIconScrollViewAccessibility *)self _accessibilityFolderContentView];
  uint64_t v9 = [v8 safeIntegerForKey:@"minimumPageIndex"];

  int64_t v10 = *a3;
  int64_t v11 = *a3 - 1;
  *a3 = v11;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  AXPerformSafeBlock();
  int v12 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  BOOL IsRootFolder = AXSBFolderControllerIsRootFolder();
  if (v12) {
    return IsRootFolder && AXDeviceIsPhone() && v11 == v9;
  }
  if (IsRootFolder && AXDeviceIsPad() && v10 <= v9) {
    return 1;
  }
  return 5;
}

void __76__SBIconScrollViewAccessibility__accessibilityPageActionForPreviousGesture___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityFolderContentView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _isValidPageIndex:*(void *)(a1 + 48)];
}

- (unint64_t)_accessibilityPageActionForNextGesture:(int64_t *)a3
{
  uint64_t v5 = AXSBIconControllerSharedInstance();
  char v6 = [v5 _axNeedsToDismissHomeScreenTodayView];

  if (v6) {
    return 2;
  }
  int64_t v8 = *a3 + 1;
  *a3 = v8;
  uint64_t v9 = AXSBIconControllerSharedInstance();
  uint64_t v10 = [v9 safeIntegerForKey:@"_accessibilityIconListCount"];

  int64_t v11 = [(SBIconScrollViewAccessibility *)self _accessibilityFolderContentView];
  uint64_t v12 = [v11 safeIntegerForKey:@"minimumPageIndex"];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  AXPerformSafeBlock();
  int v13 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  if (!v13) {
    return 5;
  }
  if (AXSBFolderControllerIsRootFolder())
  {
    uint64_t v14 = v8 - v12;
    if (AXDeviceIsPhone())
    {
      if (v14 > v10) {
        return 3;
      }
    }
    if (AXDeviceIsPad() && v14 == v10) {
      return 3;
    }
  }
  return 0;
}

void __72__SBIconScrollViewAccessibility__accessibilityPageActionForNextGesture___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityFolderContentView];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _isValidPageIndex:*(void *)(a1 + 48)];
}

- (int64_t)_accessibilityAdjustedPageIndexForPageIndex:(int64_t)a3
{
  if ((AXDeviceIsPad() & 1) != 0 || !AXSBFolderControllerIsRootFolder()) {
    ++a3;
  }
  return a3;
}

- (id)_accessibilityFolderContentView
{
  id v2 = AXSBCurrentFolderController();
  UIAccessibilityNotifications v3 = [v2 safeValueForKey:@"_contentView"];

  return v3;
}

- (void)_accessibilityScrollToPage:(int64_t)a3
{
}

void __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke(uint64_t a1)
{
  id v2 = AXSBCurrentFolderController();
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2;
  char v6 = &unk_265158300;
  objc_msgSend(v2, "setCurrentPageIndex:animated:completion:", MEMORY[0x263EF8330], 3221225472, __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2, &unk_265158300, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityFolderContentView];
  uint64_t v3 = [v2 safeIntegerForKey:@"minimumPageIndex"];

  uint64_t v4 = AXSBScrollDescriptionForCurrentPage([*(id *)(a1 + 32) _accessibilityAdjustedPageIndexForPageIndex:*(void *)(a1 + 40)] - v3);
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  LODWORD(v4) = *MEMORY[0x263F1CE68];
  uint64_t v5 = [*(id *)(a1 + 32) _accessibilityCurrentFolderIconForPage:*(void *)(a1 + 40)];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v5);

  UIAccessibilityNotifications v6 = *MEMORY[0x263F1CE18];
  id v7 = (void *)*MEMORY[0x263F21A08];

  UIAccessibilityPostNotification(v6, v7);
}

@end