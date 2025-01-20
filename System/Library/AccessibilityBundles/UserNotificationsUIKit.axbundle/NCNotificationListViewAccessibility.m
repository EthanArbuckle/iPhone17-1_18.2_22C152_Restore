@interface NCNotificationListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHasMultipleViews;
- (BOOL)_axShouldForwardToListCell;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityListCell;
- (id)_accessibilityRevealHintView;
- (id)_accessibilitySubviews;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)automationElements;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4;
@end

@implementation NCNotificationListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationListView"];
  [v3 validateClass:@"NCDigestSummaryPlatterView"];
  [v3 validateClass:@"NCNotificationSummaryPlatterView"];
  [v3 validateClass:@"NCNotificationListSectionRevealHintView"];
  [v3 validateClass:@"_UIScrollViewScrollIndicator"];
  [v3 validateClass:@"NCNotificationListView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"NCNotificationListView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"isGrouped", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_minimumContentOffset", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"_recycleViewIfNecessary:withDataSource:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"headerView", "@", 0);
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  char v18 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 superview];
  MEMORY[0x2456680B0](@"NCNotificationListView");
  if (objc_opt_isKindOfClass())
  {
    v17.receiver = self;
    v17.super_class = (Class)NCNotificationListViewAccessibility;
    [(NCNotificationListViewAccessibility *)&v17 _accessibilityVisibleContentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x263F1D1C0];
    double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (unint64_t)accessibilityTraits
{
  if (![(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell]) {
    return *MEMORY[0x263F1CF18];
  }
  id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
  unint64_t v4 = [v3 accessibilityTraits];

  return v4;
}

- (id)accessibilityPath
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 accessibilityPath];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 accessibilityLabel];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell]
    && ([(NCNotificationListViewAccessibility *)self _accessibilityListCell],
        id v3 = objc_claimAutoreleasedReturnValue(),
        MEMORY[0x2456680B0](@"NCDigestSummaryPlatterView"),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    double v5 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    [v5 accessibilityActivationPoint];
    double v7 = v6;
    double v9 = v8;

    double v10 = v7;
    double v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationListViewAccessibility;
    [(NCNotificationListViewAccessibility *)&v12 accessibilityActivationPoint];
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)accessibilityActivate
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    MEMORY[0x2456680B0](@"NCDigestSummaryPlatterView");
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      double v5 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
      MEMORY[0x2456680B0](@"NCNotificationSummaryPlatterView");
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_8:
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);

        goto LABEL_9;
      }
    }
    double v7 = [(NCNotificationListViewAccessibility *)self safeDictionaryForKey:@"visibleViews"];
    double v8 = [v7 objectForKey:&unk_26F81DFA0];

    if (v8)
    {
      id v9 = v8;

      id v3 = v9;
    }

    goto LABEL_8;
  }
LABEL_9:
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationListViewAccessibility;
  return [(NCNotificationListViewAccessibility *)&v11 accessibilityActivate];
}

- (id)accessibilityHint
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    v2 = accessibilityLocalizedString(@"notification.cell.collapsed.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)accessibilityCustomActions
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 accessibilityCustomActions];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(NCNotificationListViewAccessibility *)self _accessibilityRevealHintView];
  if ([v8 _accessibilityIsHintTitleVisible]
    && ([v8 accessibilityContainer],
        id v9 = (NCNotificationListViewAccessibility *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9 == self)
    && ([v8 bounds], v15.x = x, v15.double y = y, CGRectContainsPoint(v16, v15)))
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NCNotificationListViewAccessibility;
    -[NCNotificationListViewAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v11 = v10;

  return v11;
}

- (id)_accessibilitySubviews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListViewAccessibility;
  unint64_t v4 = [(NCNotificationListViewAccessibility *)&v8 _accessibilitySubviews];
  [v3 axSafelyAddObjectsFromArray:v4];

  double v5 = [(NCNotificationListViewAccessibility *)self _accessibilityRevealHintView];
  if ([v5 _accessibilityIsHintTitleVisible])
  {
    double v6 = [v5 accessibilityContainer];

    if (v6 != self) {
      [v3 axSafelyAddObject:v5];
    }
  }

  return v3;
}

- (id)accessibilityIdentifier
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 accessibilityIdentifier];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)automationElements
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 automationElements];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationListViewAccessibility;
    unint64_t v4 = [(NCNotificationListViewAccessibility *)&v6 automationElements];
  }

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(NCNotificationListViewAccessibility *)self _axShouldForwardToListCell])
  {
    id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
    unint64_t v4 = [v3 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationListViewAccessibility;
    unint64_t v4 = [(NCNotificationListViewAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }

  return v4;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  MEMORY[0x2456680B0](@"_UIScrollViewScrollIndicator");
  if (objc_opt_isKindOfClass())
  {
    char v5 = 1;
  }
  else
  {
    LOBYTE(insets.left) = 0;
    objc_opt_class();
    objc_super v6 = __UIAccessibilityCastAsClass();
    [v6 adjustedContentInset];
    insets.top = v7;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v4 accessibilityFrame];
    UIAccessibilityFrameToBounds();
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v22 = [MEMORY[0x263F1C920] mainScreen];
    [v22 bounds];
    double v24 = v23;

    double v25 = v24 / 3.0;
    v26 = AXLogScrollToVisible();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v67.origin.double x = v15;
      v67.origin.double y = v17;
      v67.size.width = v19;
      v67.size.height = v21;
      v58 = NSStringFromCGRect(v67);
      v68.top = insets.top;
      v68.left = v9;
      v68.bottom = v11;
      v68.right = v13;
      v59 = NSStringFromUIEdgeInsets(v68);
      LODWORD(insets.left) = 138412802;
      *(void *)((char *)&insets.left + 4) = v58;
      WORD2(insets.bottom) = 2112;
      *(void *)((char *)&insets.bottom + 6) = v59;
      HIWORD(insets.right) = 2048;
      double v63 = v25;
      _os_log_debug_impl(&dword_24268C000, v26, OS_LOG_TYPE_DEBUG, "Scrolling within notifications. Original: %@, computed using insets %@, with a modified topInset of %f", (uint8_t *)&insets.left, 0x20u);
    }
    UIRectInset();
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    v35 = AXLogScrollToVisible();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v69.origin.double x = v28;
      v69.origin.double y = v30;
      v69.size.width = v32;
      v69.size.height = v34;
      v60 = NSStringFromCGRect(v69);
      LODWORD(insets.left) = 138412290;
      *(void *)((char *)&insets.left + 4) = v60;
      _os_log_debug_impl(&dword_24268C000, v35, OS_LOG_TYPE_DEBUG, "Expanded: %@", (uint8_t *)&insets.left, 0xCu);
    }
    [(NCNotificationListViewAccessibility *)self safeCGPointForKey:@"_minimumContentOffset"];
    double v37 = v36;
    v65.origin.double x = v28;
    v65.origin.double y = v30;
    v65.size.width = v32;
    v65.size.height = v34;
    if (CGRectGetMinY(v65) < v37)
    {
      v66.origin.double x = v28;
      v66.origin.double y = v30;
      v66.size.width = v32;
      v66.size.height = v34;
      CGRectGetMinY(v66);
      UIRectInset();
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      v46 = AXLogScrollToVisible();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v70.origin.double x = v39;
        v70.origin.double y = v41;
        v70.size.width = v43;
        v70.size.height = v45;
        v61 = NSStringFromCGRect(v70);
        LODWORD(insets.left) = 138412290;
        *(void *)((char *)&insets.left + 4) = v61;
        _os_log_debug_impl(&dword_24268C000, v46, OS_LOG_TYPE_DEBUG, "Clipped on top: %@", (uint8_t *)&insets.left, 0xCu);
      }
    }
    UIAccessibilityFrameForBounds();
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    LOBYTE(insets.left) = 0;
    objc_opt_class();
    uint64_t v55 = __UIAccessibilityCastAsClass();
    if (LOBYTE(insets.left)) {
      abort();
    }
    v56 = (void *)v55;
    char v5 = -[NCNotificationListViewAccessibility _accessibilityScrollToFrame:forView:](self, "_accessibilityScrollToFrame:forView:", v55, v48, v50, v52, v54);
  }
  return v5;
}

- (id)_accessibilityRevealHintView
{
  v2 = [(NCNotificationListViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_6];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

uint64_t __67__NCNotificationListViewAccessibility__accessibilityRevealHintView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"NCNotificationListSectionRevealHintView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axShouldForwardToListCell
{
  id v3 = [(NCNotificationListViewAccessibility *)self _accessibilityListCell];
  BOOL v4 = v3
    && [(NCNotificationListViewAccessibility *)self safeBoolForKey:@"isGrouped"]
    && [(NCNotificationListViewAccessibility *)self _axHasMultipleViews];

  return v4;
}

- (id)_accessibilityListCell
{
  id v2 = [(NCNotificationListViewAccessibility *)self safeDictionaryForKey:@"visibleViews"];
  id v3 = [v2 objectForKey:&unk_26F81DFB8];

  MEMORY[0x2456680B0](@"NCNotificationListCell");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x2456680B0](@"NCDigestSummaryPlatterView"), (objc_opt_isKindOfClass() & 1) != 0)
    || (MEMORY[0x2456680B0](@"NCNotificationSummaryPlatterView"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_axHasMultipleViews
{
  id v2 = [(NCNotificationListViewAccessibility *)self safeDictionaryForKey:@"visibleViews"];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListViewAccessibility;
  id v6 = a3;
  [(NCNotificationListViewAccessibility *)&v9 _recycleViewIfNecessary:v6 withDataSource:a4];
  MEMORY[0x2456680B0](@"NCNotificationSummaryPlatterView");
  LOBYTE(a4) = objc_opt_isKindOfClass();

  if (a4)
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE18];
    double v8 = [(NCNotificationListViewAccessibility *)self safeValueForKey:@"headerView", v9.receiver, v9.super_class];
    UIAccessibilityPostNotification(v7, v8);
  }
}

@end