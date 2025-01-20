@interface SBRootFolderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityHitTestSubviews;
- (id)_accessibilitySubviews;
- (id)automationElements;
- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4;
- (void)setIdleText:(id)a3;
- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4;
@end

@implementation SBRootFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBRootFolderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBRootFolderView"];
  [v3 validateClass:@"_SBRootFolderLayoutWrapperView"];
  [v3 validateClass:@"SBRootFolderViewPageManagementLayoutManager"];
  [v3 validateClass:@"SBRootFolderView" isKindOfClass:@"SBFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"firstIconListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"widgetIntroductionPopover", "@", 0);
  [v3 validateClass:@"SBFolderView" hasInstanceVariable:@"_scrollView" withType:"SBIconScrollView"];
  [v3 validateClass:@"SBRootFolderView" hasInstanceVariable:@"_searchableLeadingCustomWrapperView" withType:"_SBRootFolderLayoutWrapperView"];
  [v3 validateClass:@"SBRootFolderView" hasInstanceVariable:@"_searchPulldownWrapperView" withType:"_SBRootFolderLayoutWrapperView"];
  [v3 validateClass:@"SBRootFolderView" hasInstanceVariable:@"_searchableTrailingCustomWrapperView" withType:"_SBRootFolderLayoutWrapperView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"setIdleText:", "v", "@", 0);
  [v3 validateClass:@"SBHPageManagementCellViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBRootFolderViewPageManagementLayoutManager" hasInstanceVariable:@"_iconViewControllersByIcon" withType:"NSMapTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBViewControllerTransitionContext", @"animator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFramewiseInteractiveTransitionAnimator", @"isPresenting", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"isPageManagementUIVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"specialLayoutManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"todayViewVisibilityProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"widgetButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"doneButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"scrollAccessoryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRootFolderView", @"setSpecialLayoutManager:completionHandler:", "v", "@", "@?", 0);
}

- (id)automationElements
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_searchPulldownWrapperView"];
  if ([v4 _accessibilityViewIsVisible]) {
    [v3 addObject:v4];
  }
  v5 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_searchableLeadingCustomWrapperView"];
  if ([v5 _accessibilityViewIsVisible]) {
    [v3 addObject:v5];
  }
  v6 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_searchableTrailingCustomWrapperView"];
  if ([v6 _accessibilityViewIsVisible]) {
    [v3 addObject:v6];
  }
  if ([(SBRootFolderViewAccessibility *)self safeBoolForKey:@"isPageManagementUIVisible"])
  {
    v27 = v5;
    v28 = v4;
    char v33 = 0;
    objc_opt_class();
    v7 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"specialLayoutManager"];
    v8 = [v7 safeValueForKey:@"_iconViewControllersByIcon"];
    v9 = __UIAccessibilityCastAsClass();

    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * i), v27, v28, (void)v29);
          v16 = [v15 safeValueForKey:@"view"];
          [v3 axSafelyAddObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    v5 = v27;
    v4 = v28;
  }
  v17 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"widgetButton", v27, v28];
  [v3 axSafelyAddObject:v17];

  v18 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"doneButton"];
  [v3 axSafelyAddObject:v18];

  v19 = [(SBRootFolderViewAccessibility *)self safeUIViewForKey:@"firstIconListView"];
  v20 = [v19 safeUIViewForKey:@"widgetIntroductionPopover"];
  if ([v20 _accessibilityViewIsVisible]) {
    [v3 addObject:v20];
  }
  v21 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"folder"];
  v22 = [v21 automationElements];
  [v3 addObjectsFromArray:v22];

  if (AXDeviceIsPad()) {
    v23 = @"pageControl";
  }
  else {
    v23 = @"scrollAccessoryView";
  }
  v24 = [(SBRootFolderViewAccessibility *)self safeValueForKey:v23];
  [v3 axSafelyAddObject:v24];

  v25 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"dockView"];
  [v3 axSafelyAddObject:v25];

  return v3;
}

- (id)_accessibilitySubviews
{
  id v3 = [(SBRootFolderViewAccessibility *)self subviews];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_idleTextView"];
  uint64_t v6 = [v4 indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v4, "count") - 1, v6);
  }

  return v4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbdockview.isa)];
  uint64_t v9 = [v7 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbdockview.isa)];
  id v10 = (void *)v9;
  if (!v8 || v9)
  {
    if (v8 || !v9)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBRootFolderViewAccessibility;
      int64_t v11 = [(SBRootFolderViewAccessibility *)&v13 _accessibilityCompareElement:v6 toElement:v7];
    }
    else
    {
      int64_t v11 = -1;
    }
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

- (id)_accessibilityHitTestSubviews
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(SBRootFolderViewAccessibility *)self subviews];
    v4 = (void *)[v3 mutableCopy];

    v5 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_idleTextView"];
    uint64_t v6 = [v4 indexOfObject:v5];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v4, "count") - 1, v6);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderViewAccessibility;
    v4 = [(SBRootFolderViewAccessibility *)&v8 _accessibilityHitTestSubviews];
  }

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderViewAccessibility;
  -[SBRootFolderViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v7;
  AXPerformSafeBlock();
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v8;
}

void __65__SBRootFolderViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if ((isKindOfClass & 1) != 0 || !v3)
  {
    id v9 = v3;
    v4 = [*(id *)(a1 + 32) safeUIViewForKey:@"_scrollView"];
    [*(id *)(a1 + 32) safeCGFloatForKey:@"todayViewVisibilityProgress"];
    if (v5 > 0.0 && ([v9 isDescendantOfView:v4] & 1) == 0)
    {
      uint64_t v6 = [*(id *)(a1 + 32) safeUIViewForKey:@"_searchableLeadingCustomWrapperView"];
      objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v6, *(double *)(a1 + 56), *(double *)(a1 + 64));
      id v7 = objc_msgSend(v6, "_accessibilityHitTest:withEvent:", *(void *)(a1 + 40));
      if (v7) {
        id v8 = v7;
      }
      else {
        id v8 = v9;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    }
  }
}

- (void)setIdleText:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderViewAccessibility;
  [(SBRootFolderViewAccessibility *)&v7 setIdleText:a3];
  v4 = [(SBRootFolderViewAccessibility *)self safeValueForKey:@"_idleTextView"];
  double v5 = v4;
  if (v4)
  {
    [v4 setIsAccessibilityElement:1];
    uint64_t v6 = [v5 safeValueForKey:@"text"];
    [v5 setAccessibilityLabel:v6];
  }
}

- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__SBRootFolderViewAccessibility_setSpecialLayoutManager_completionHandler___block_invoke;
  v12[3] = &unk_265158460;
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x245664140](v12);
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderViewAccessibility;
  [(SBRootFolderViewAccessibility *)&v11 setSpecialLayoutManager:v8 completionHandler:v10];
}

void __75__SBRootFolderViewAccessibility_setSpecialLayoutManager_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  NSClassFromString(&cfstr_Sbrootfoldervi_1.isa);
  if (objc_opt_isKindOfClass())
  {
    accessibilityLocalizedString(@"page.management.showing");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

@end