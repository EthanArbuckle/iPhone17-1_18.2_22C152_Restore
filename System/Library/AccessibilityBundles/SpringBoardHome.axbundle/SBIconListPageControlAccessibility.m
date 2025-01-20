@interface SBIconListPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityGoToNextPage;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)_axHasOpenFolder;
- (BOOL)_axIsControlCenter;
- (BOOL)_axIsLastPage;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScrollAncestor;
- (id)_axDelegate;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityCurrentPageIndex;
- (unint64_t)accessibilityTraits;
- (void)_axSetNewPage:(int64_t)a3;
- (void)accessibilityDecrement;
@end

@implementation SBIconListPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconListPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIconListPageControl"];
  [v3 validateClass:@"SBIconListPageControl" isKindOfClass:@"UIPageControl"];
  [v3 validateClass:@"SBIconListPageControl" hasInstanceVariable:@"_delegate" withType:"<SBIconListPageControlDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  [v3 validateClass:@"SBIconListPageControl" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  [v3 validateClass:@"SBFolderView"];
  [v3 validateClass:@"SBFolderController"];
  [v3 validateClass:@"SBFolderController" hasInstanceVariable:@"_contentView" withType:"SBFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListPageControl", @"actsAsButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"currentPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"minimumPageIndex", "q", 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v11.receiver = self;
    v11.super_class = (Class)SBIconListPageControlAccessibility;
    -[SBIconListPageControlAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (SBIconListPageControlAccessibility *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  [(SBIconListPageControlAccessibility *)self bounds];
  CGRect v15 = CGRectInset(v14, 0.0, -25.0);
  v13.double x = x;
  v13.double y = y;
  if (CGRectContainsPoint(v15, v13))
  {
    v8 = self;
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)_accessibilityScrollAncestor
{
  v2 = [(SBIconListPageControlAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfolderview.isa)];
  id v3 = [v2 safeValueForKey:@"_scrollView"];

  return v3;
}

- (BOOL)_axIsLastPage
{
  if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter])
  {
    uint64_t v3 = [(SBIconListPageControlAccessibility *)self _accessibilityCurrentPageIndex];
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    uint64_t v5 = [v4 numberOfPages];
  }
  else
  {
    v4 = AXSBIconControllerSharedInstance();
    v6 = [v4 safeValueForKey:@"_accessibilityIconListIndex"];
    uint64_t v3 = [v6 integerValue];

    id v7 = [v4 safeValueForKey:@"_accessibilityIconListCount"];
    uint64_t v5 = [v7 integerValue];
  }
  return v3 + 1 >= v5;
}

- (id)_axDelegate
{
  v2 = [(SBIconListPageControlAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Controlcenteru.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    AXSBIconControllerSharedInstance();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)_axIsControlCenter
{
  v2 = [(SBIconListPageControlAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Controlcenteru.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityActivate
{
  if ([(SBIconListPageControlAccessibility *)self safeBoolForKey:@"actsAsButton"]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBIconListPageControlAccessibility;
  return [(SBIconListPageControlAccessibility *)&v4 accessibilityActivate];
}

- (BOOL)_accessibilityGoToNextPage
{
  if (![(SBIconListPageControlAccessibility *)self _axIsLastPage])
  {
    objc_super v4 = [(SBIconListPageControlAccessibility *)self _axDelegate];
    if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter]
      || [(SBIconListPageControlAccessibility *)self _axHasOpenFolder]
      || ([v4 _axNeedsToDismissHomeScreenTodayView] & 1) == 0)
    {
      int64_t v5 = [(SBIconListPageControlAccessibility *)self _accessibilityCurrentPageIndex];
      objc_opt_class();
      v6 = __UIAccessibilityCastAsClass();
      uint64_t v7 = [v6 numberOfPages];

      if (v5 >= v7)
      {

        return 0;
      }
      [(SBIconListPageControlAccessibility *)self _axSetNewPage:v5 + 1];
    }
    else
    {
      [v4 _axHideTodayView];
    }

    return 1;
  }
  if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter]
    || [(SBIconListPageControlAccessibility *)self _axHasOpenFolder])
  {
    return 0;
  }
  id v3 = AXSBIconControllerSharedInstance();
  if (![v3 _axIsShowingHomeScreenTodayView])
  {
    [v3 _axShowAppLibrary];

    return 1;
  }

  return 0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    [(SBIconListPageControlAccessibility *)self accessibilityDecrement];
    return 1;
  }
  if (a3 == 2)
  {
    [(SBIconListPageControlAccessibility *)self accessibilityIncrement];
    return 1;
  }
  return 0;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  if (_AXSAutomationEnabled()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBIconListPageControlAccessibility;
  return [(SBIconListPageControlAccessibility *)&v4 _accessibilityViewIsVisible];
}

- (void)accessibilityDecrement
{
  uint64_t v3 = [(SBIconListPageControlAccessibility *)self _accessibilityCurrentPageIndex];
  uint64_t v4 = v3 - 1;
  if (v3 < 1)
  {
    if (![(SBIconListPageControlAccessibility *)self _axIsControlCenter]
      && ![(SBIconListPageControlAccessibility *)self _axHasOpenFolder])
    {
      AXSBIconControllerSharedInstance();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (([v5 _axIsShowingHomeScreenTodayView] & 1) == 0) {
        [v5 _axShowTodayView];
      }
    }
  }
  else
  {
    [(SBIconListPageControlAccessibility *)self _axSetNewPage:v4];
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)accessibilityHint
{
  if ([(SBIconListPageControlAccessibility *)self _axHasOpenFolder])
  {
LABEL_2:
    uint64_t v3 = 0;
    goto LABEL_5;
  }
  if (![(SBIconListPageControlAccessibility *)self safeBoolForKey:@"actsAsButton"])
  {
    if (![(SBIconListPageControlAccessibility *)self _axIsControlCenter]
      && ![(SBIconListPageControlAccessibility *)self _accessibilityCurrentPageIndex])
    {
      id v5 = AXSBIconControllerSharedInstance();
      if ([v5 _axIsShowingHomeScreenTodayView]) {
        v6 = @"will.hide.today.view.hint";
      }
      else {
        v6 = @"will.show.today.view.hint";
      }
      uint64_t v3 = accessibilityLocalizedString(v6);

      goto LABEL_5;
    }
    goto LABEL_2;
  }
  uint64_t v3 = accessibilityLocalizedString(@"page.management.hint");
LABEL_5:

  return v3;
}

- (int64_t)_accessibilityCurrentPageIndex
{
  if (AXProcessIsCarPlay())
  {
    objc_opt_class();
    uint64_t v3 = __UIAccessibilityCastAsClass();
    int64_t v4 = [v3 currentPage] + 1;
  }
  else
  {
    if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter]) {
      [(SBIconListPageControlAccessibility *)self _axDelegate];
    }
    else {
    uint64_t v3 = AXSBCurrentFolderController();
    }
    uint64_t v5 = [v3 safeIntegerForKey:@"minimumPageIndex"];
    v6 = [(SBIconListPageControlAccessibility *)self safeValueForKey:@"delegate"];
    uint64_t v7 = [v6 safeIntegerForKey:@"currentPageIndex"];

    int64_t v4 = v7 - v5;
  }

  return v4;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(SBIconListPageControlAccessibility *)self _accessibilityCurrentPageIndex];
  LOBYTE(v12) = 0;
  objc_opt_class();
  int64_t v4 = __UIAccessibilityCastAsClass();
  uint64_t v5 = [v4 numberOfPages];

  uint64_t v6 = v5 & ~(v5 >> 63);
  if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter])
  {
    uint64_t v12 = 0;
    CGPoint v13 = &v12;
    uint64_t v14 = 0x3032000000;
    CGRect v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    AXPerformSafeBlock();
    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    uint64_t v8 = AXControlCenterPageStatus(v3, v5 & ~(v5 >> 63), v7);
  }
  else
  {
    if ([(SBIconListPageControlAccessibility *)self _axHasOpenFolder]
      || AXDeviceIsPad())
    {
      ++v3;
    }
    v9 = NSString;
    accessibilityLocalizedString(@"springboard.page.status");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend(v9, "localizedStringWithFormat:", v7, v3, v6);
  }
  v10 = (void *)v8;

  return v10;
}

void __56__SBIconListPageControlAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axDelegate];
  uint64_t v2 = [v5 indicatorDescriptionForPageIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_axSetNewPage:(int64_t)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__4;
  v4[4] = __Block_byref_object_dispose__4;
  if ([(SBIconListPageControlAccessibility *)self _axIsControlCenter]) {
    [(SBIconListPageControlAccessibility *)self _axDelegate];
  }
  else {
    AXSBCurrentFolderController();
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformBlockOnMainThreadAfterDelay();
  _Block_object_dispose(v4, 8);
}

void __52__SBIconListPageControlAccessibility__axSetNewPage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setCurrentPageIndex:animated:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "safeIntegerForKey:", @"minimumPageIndex")+ *(void *)(a1 + 40), 1);
  MEMORY[0x245663DE0](*MEMORY[0x263F1CE68]);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE30];

  UIAccessibilityPostNotification(v1, &stru_26F7E8EF8);
}

- (BOOL)_axHasOpenFolder
{
  uint64_t v2 = AXSBHIconManagerFromSharedIconController();
  char v3 = [v2 safeBoolForKey:@"hasOpenFolder"];

  return v3;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  if ([(SBIconListPageControlAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    char v3 = AXSBCurrentFolderController();
    int64_t v4 = [v3 safeValueForKey:@"_contentView"];
    id v5 = [(SBIconListPageControlAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfolderview.isa)];
    BOOL v6 = v4 == v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconListPageControlAccessibility;
    return [(SBIconListPageControlAccessibility *)&v8 canBecomeFocused];
  }
  return v6;
}

@end