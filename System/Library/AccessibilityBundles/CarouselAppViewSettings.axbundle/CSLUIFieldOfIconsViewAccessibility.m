@interface CSLUIFieldOfIconsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityScrollToChild:(id)a3 animated:(BOOL)a4;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)accessibilityScrollUpPage;
- (CGSize)_accessibilityScrollSize;
- (Hex)_axHexForIconView:(id)a3;
- (id)_accessibilityHitTestSubviews;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (void)_accessibilityAnnounceUpdatedPositionForElement:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMoveElement:(id)a3 left:(BOOL)a4;
- (void)_accessibilityMoveIconLeft:(id)a3;
- (void)_accessibilityMoveIconRight:(id)a3;
- (void)_accessibilityStartJiggleMode:(id)a3;
- (void)_axUpdateIconElements;
- (void)hexAppGraph:(id)a3 addedNodes:(id)a4 removedNodes:(id)a5 movedNodes:(id)a6;
- (void)setLayout:(id)a3 percentComplete:(double)a4 animated:(BOOL)a5 options:(unint64_t)a6;
@end

@implementation CSLUIFieldOfIconsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLUIFieldOfIconsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"hexAppGraph: addedNodes: removedNodes: movedNodes:", "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"contentOffsetToCenterHex:", "{CGPoint=dd}", "{Hex=ii}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIIconView", @"node", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLHexAppNode", @"hex", "{Hex=ii}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"setContentOffset:animated:", "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"setLayout: percentComplete: animated: options:", "v", "@", "d", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIFieldOfIconsView", @"inertialUpdater:willDecelerateWithTarget:", "{CGPoint=dd}", "@", "{CGPoint=dd}", 0);
  [v3 validateClass:@"CSLUIFieldOfIconsView" hasInstanceVariable:@"_inertialUpdater" withType:"CSLUIInertialUpdater"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLUIInertialUpdater", @"addDragDelta:", "v", "{CGPoint=dd}", 0);
  [v3 validateClass:@"CSLUIFieldOfIconsView" hasInstanceVariable:@"_didPanDrag" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSLHexAppGraph", @"moveNode: toHex: final:", "v", "@", "{Hex=ii}", "B", 0);
  [v3 validateClass:@"CSLUIFieldOfIconsView" hasInstanceVariable:@"_iconGraph" withType:"CSLHexAppGraph"];
  [v3 validateClass:@"CSLUIFieldOfIconsView" hasInstanceVariable:@"_actionDelegate" withType:"<CSLUIHexIconActionDelegate>"];
  [v3 validateProtocol:@"CSLUIHexIconActionDelegate" hasMethod:@"handleLongPress" isInstanceMethod:1 isRequired:1];
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  return [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityScrollToChild:a3 animated:0];
}

- (BOOL)_accessibilityScrollToChild:(id)a3 animated:(BOOL)a4
{
  id v4 = a3;
  NSSelectorFromString(&cfstr_Node.isa);
  char v5 = objc_opt_respondsToSelector();
  if (v5)
  {
    id v7 = v4;
    AXPerformSafeBlock();
  }
  return v5 & 1;
}

uint64_t __75__CSLUIFieldOfIconsViewAccessibility__accessibilityScrollToChild_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "contentOffsetToCenterHex:", objc_msgSend(*(id *)(a1 + 32), "_axHexForIconView:", *(void *)(a1 + 40)));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);

  return objc_msgSend(v2, "setContentOffset:animated:", v3);
}

- (CGSize)_accessibilityScrollSize
{
  [(CSLUIFieldOfIconsViewAccessibility *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollUpPage
{
  [(CSLUIFieldOfIconsViewAccessibility *)self safeCGPointForKey:@"_contentOffset"];
  if (v4 == 0.0)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke;
    v16 = &unk_265111FF8;
    v17 = self;
    uint64_t v18 = v3;
    double v19 = v4;
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3010000000;
    v9 = "";
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    AXPerformSafeBlock();
    long long v12 = *((_OWORD *)v7 + 2);
    _Block_object_dispose(&v6, 8);
  }
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
  return 1;
}

uint64_t __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  [v1 _accessibilityScrollSize];
  double v4 = -v3;

  return objc_msgSend(v1, "setContentOffset:animated:", 0, v2, v4);
}

uint64_t __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [v2 _accessibilityScrollSize];
  uint64_t result = objc_msgSend(v2, "inertialUpdater:willDecelerateWithTarget:", 0, 0.0, -v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  return result;
}

void __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_inertialUpdater"];
  objc_msgSend(v2, "addDragDelta:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)accessibilityScrollDownPage
{
  uint64_t v3 = 0;
  double v4 = &v3;
  uint64_t v5 = 0x3010000000;
  uint64_t v6 = "";
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  AXPerformSafeBlock();
  long long v9 = *((_OWORD *)v4 + 2);
  _Block_object_dispose(&v3, 8);
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
  return 1;
}

uint64_t __65__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollDownPage__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 _accessibilityScrollSize];
  uint64_t result = [v2 inertialUpdater:0 willDecelerateWithTarget:0.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

void __65__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollDownPage__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_inertialUpdater"];
  objc_msgSend(v2, "addDragDelta:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (Hex)_axHexForIconView:(id)a3
{
  uint64_t v3 = [a3 safeValueForKey:@"node"];
  uint64_t v4 = (Hex *)[v3 safeIvarForKey:@"_hex"];

  if (v4) {
    return *v4;
  }
  else {
    return (Hex)0;
  }
}

- (void)_axUpdateIconElements
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (([(CSLUIFieldOfIconsViewAccessibility *)self safeBoolForKey:@"_didPanDrag"] & 1) == 0)
  {
    uint64_t v3 = [(CSLUIFieldOfIconsViewAccessibility *)self safeValueForKey:@"_iconViewDict"];
    uint64_t v4 = [v3 allValues];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __59__CSLUIFieldOfIconsViewAccessibility__axUpdateIconElements__block_invoke;
    v35[3] = &unk_265112048;
    v35[4] = self;
    uint64_t v5 = [v4 sortedArrayUsingComparator:v35];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      long long v9 = @"isEditing";
      unint64_t v10 = 0x263F1C000uLL;
      do
      {
        uint64_t v11 = 0;
        v29 = sel__accessibilityMoveIconRight_;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
          int v13 = -[CSLUIFieldOfIconsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", v9, v29);
          id v14 = objc_alloc(*(Class *)(v10 + 912));
          if (v13)
          {
            v15 = accessibilityLocalizedString(@"app.move.left");
            v16 = (void *)[v14 initWithName:v15 target:self selector:sel__accessibilityMoveIconLeft_];

            [v16 _accessibilitySetAssignedValue:v12 forKey:@"kAXOwningElement"];
            id v17 = objc_alloc(*(Class *)(v10 + 912));
            accessibilityLocalizedString(@"app.move.right");
            uint64_t v18 = v7;
            uint64_t v19 = v8;
            unint64_t v20 = v10;
            v22 = v21 = v9;
            v23 = (void *)[v17 initWithName:v22 target:self selector:v29];

            [v23 _accessibilitySetAssignedValue:v12 forKey:@"kAXOwningElement"];
            v37[0] = v16;
            v37[1] = v23;
            v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
            [v12 setAccessibilityCustomActions:v24];

            long long v9 = v21;
            unint64_t v10 = v20;
            uint64_t v8 = v19;
            uint64_t v7 = v18;
          }
          else
          {
            v25 = accessibilityLocalizedString(@"apps.arrange");
            v16 = (void *)[v14 initWithName:v25 target:self selector:sel__accessibilityStartJiggleMode_];

            v36 = v16;
            v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
            [v12 setAccessibilityCustomActions:v26];

            [v16 _accessibilitySetAssignedValue:v12 forKey:@"kAXOwningElement"];
          }

          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v7);
    }

    v27 = (void *)[obj mutableCopy];
    [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilitySetRetainedValue:v27 forKey:@"AccessibilityElementsKey"];
    v28 = [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityFirstElementForFocus];
    [v28 _setAccessibilityServesAsFirstElement:1];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

uint64_t __59__CSLUIFieldOfIconsViewAccessibility__axUpdateIconElements__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 _axHexForIconView:a2];
  int v8 = v7;
  unint64_t v9 = HIDWORD(v7);
  uint64_t v10 = [*(id *)(a1 + 32) _axHexForIconView:v6];

  if ((float)((float)SHIDWORD(v10) + -0.00000011921) > (float)(int)v9) {
    return -1;
  }
  if ((float)((float)SHIDWORD(v10) + 0.00000011921) < (float)(int)v9) {
    return 1;
  }
  if ((float)((float)(int)v10 + -0.00000011921) <= (float)v8)
  {
    if ((float)((float)(int)v10 + 0.00000011921) >= (float)v8) {
      return 0;
    }
    BOOL v12 = [*(id *)(a1 + 32) _accessibilityIsRTL] == 0;
    uint64_t v13 = -1;
  }
  else
  {
    BOOL v12 = [*(id *)(a1 + 32) _accessibilityIsRTL] == 0;
    uint64_t v13 = 1;
  }
  if (v12) {
    return -v13;
  }
  else {
    return v13;
  }
}

- (id)accessibilityElements
{
  uint64_t v3 = [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityValueForKey:@"AccessibilityElementsKey"];
  if (!v3)
  {
    [(CSLUIFieldOfIconsViewAccessibility *)self _axUpdateIconElements];
    uint64_t v3 = [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityValueForKey:@"AccessibilityElementsKey"];
  }

  return v3;
}

- (void)hexAppGraph:(id)a3 addedNodes:(id)a4 removedNodes:(id)a5 movedNodes:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  [(CSLUIFieldOfIconsViewAccessibility *)&v7 hexAppGraph:a3 addedNodes:a4 removedNodes:a5 movedNodes:a6];
  [(CSLUIFieldOfIconsViewAccessibility *)self _axUpdateIconElements];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  [(CSLUIFieldOfIconsViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CSLUIFieldOfIconsViewAccessibility *)self _axUpdateIconElements];
}

- (id)_accessibilityHitTestSubviews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_opt_class();
  uint64_t v4 = [(CSLUIFieldOfIconsViewAccessibility *)self safeValueForKey:@"subviews"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) subviews];
        if (v10) {
          [v3 addObjectsFromArray:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return @"CSLLauncherView";
}

- (void)_accessibilityStartJiggleMode:(id)a3
{
  id v4 = [(CSLUIFieldOfIconsViewAccessibility *)self safeValueForKey:@"_actionDelegate"];
  id v3 = (id)[v4 safeValueForKey:@"handleLongPress"];
}

- (void)_accessibilityMoveElement:(id)a3 left:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CSLUIFieldOfIconsViewAccessibility *)self accessibilityElements];
  unint64_t v8 = [v7 indexOfObject:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = v8;
    if (v8 && v4)
    {
      unint64_t v10 = v8 - 1;
    }
    else
    {
      if (v4 || v8 >= [v7 count] - 1) {
        goto LABEL_10;
      }
      unint64_t v10 = v9 + 1;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v6 safeValueForKey:@"node"];
      long long v12 = [v7 objectAtIndex:v10];
      [(CSLUIFieldOfIconsViewAccessibility *)self _axHexForIconView:v12];

      v16 = v11;
      id v13 = v11;
      AXPerformSafeBlock();
      long long v14 = [(CSLUIFieldOfIconsViewAccessibility *)self safeValueForKey:@"_iconGraph"];
      id v15 = (id)[v14 safeValueForKey:@"commitMove"];
    }
  }
LABEL_10:
  [(CSLUIFieldOfIconsViewAccessibility *)self accessibilityScrollToVisibleWithChild:v6];
  [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityAnnounceUpdatedPositionForElement:v6];
}

void __69__CSLUIFieldOfIconsViewAccessibility__accessibilityMoveElement_left___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_iconGraph"];
  [v2 moveNode:*(void *)(a1 + 40) toHex:*(void *)(a1 + 48) final:1];
}

- (void)_accessibilityMoveIconLeft:(id)a3
{
  id v4 = [a3 _accessibilityValueForKey:@"kAXOwningElement"];
  [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityMoveElement:v4 left:1];
}

- (void)_accessibilityMoveIconRight:(id)a3
{
  id v4 = [a3 _accessibilityValueForKey:@"kAXOwningElement"];
  [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityMoveElement:v4 left:0];
  [(CSLUIFieldOfIconsViewAccessibility *)self accessibilityScrollToVisibleWithChild:v4];
  [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityAnnounceUpdatedPositionForElement:v4];
}

- (void)_accessibilityAnnounceUpdatedPositionForElement:(id)a3
{
  id v4 = a3;
  id v17 = [(CSLUIFieldOfIconsViewAccessibility *)self accessibilityElements];
  uint64_t v5 = (char *)[v17 indexOfObject:v4];

  if ((unint64_t)v5 < [v17 count] - 1)
  {
    id v6 = NSString;
    uint64_t v7 = accessibilityLocalizedString(@"app.moved.before");
    unint64_t v8 = [v17 objectAtIndex:v5 + 1];
    unint64_t v9 = [v8 accessibilityLabel];
    unint64_t v10 = objc_msgSend(v6, "stringWithFormat:", v7, v9);

    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unint64_t v10 = 0;
  if (v5)
  {
LABEL_5:
    uint64_t v11 = NSString;
    long long v12 = accessibilityLocalizedString(@"app.moved.after");
    id v13 = [v17 objectAtIndex:v5 - 1];
    long long v14 = [v13 accessibilityLabel];
    objc_msgSend(v11, "stringWithFormat:", v12, v14);
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  if ([v5 length] || objc_msgSend(v10, "length"))
  {
    UIAccessibilityNotifications v15 = *MEMORY[0x263F1CDC8];
    v16 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v15, v16);
  }
}

- (void)setLayout:(id)a3 percentComplete:(double)a4 animated:(BOOL)a5 options:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  -[CSLUIFieldOfIconsViewAccessibility setLayout:percentComplete:animated:options:](&v10, sel_setLayout_percentComplete_animated_options_, a3, a5, a6);
  [(CSLUIFieldOfIconsViewAccessibility *)self _axUpdateIconElements];
  if (a4 == 1.0)
  {
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE18];
    unint64_t v9 = [(CSLUIFieldOfIconsViewAccessibility *)self _accessibilityFirstElementForFocus];
    UIAccessibilityPostNotification(v8, v9);
  }
}

@end