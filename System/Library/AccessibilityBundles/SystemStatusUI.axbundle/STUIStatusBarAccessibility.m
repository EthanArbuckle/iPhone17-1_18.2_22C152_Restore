@interface STUIStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_axElementWithinFocused;
- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIsHitTesting:(BOOL)a3;
- (void)_prepareVisualProviderIfNeeded;
- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5;
@end

@implementation STUIStatusBarAccessibility

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarAccessibility;
  [(STUIStatusBarAccessibility *)&v6 _updateDisplayedItemsWithData:a3 styleAttributes:a4 extraAnimations:a5];
  if ([(STUIStatusBarAccessibility *)self _axElementWithinFocused]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (BOOL)_axElementWithinFocused
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = _UIAccessibilityFocusedElements();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __53__STUIStatusBarAccessibility__axElementWithinFocused__block_invoke;
        v12[3] = &unk_26515C808;
        v12[4] = self;
        v9 = [v8 _accessibilityFindAncestor:v12 startWithSelf:0];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)STUIStatusBarAccessibility;
  [(STUIStatusBarAccessibility *)&v38 _accessibilityLoadAccessibilityInformation];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [(STUIStatusBarAccessibility *)self safeDictionaryForKey:@"_regions"];
  obuint64_t j = [v2 allValues];

  uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v35;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v35 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v8 = [v7 safeUIViewForKey:@"contentView"];
        objc_initWeak(&location, v7);
        v31[0] = v5;
        v31[1] = 3221225472;
        v31[2] = __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v31[3] = &unk_26515C7B8;
        objc_copyWeak(&v32, &location);
        [v8 _setAccessibilityElementsHiddenBlock:v31];
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v3);
  }

  v22 = [(STUIStatusBarAccessibility *)self safeValueForKey:@"visualProvider"];
  [v22 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  v9 = [(STUIStatusBarAccessibility *)self safeValueForKey:@"items"];
  v21 = __UIAccessibilityCastAsClass();

  if ((_BYTE)location) {
    abort();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obja = [v21 allValues];
  uint64_t v10 = [obja countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obja);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        LOBYTE(location) = 0;
        uint64_t v14 = __UIAccessibilitySafeClass();
        if ((_BYTE)location) {
          abort();
        }
        long long v15 = (void *)v14;
        if (v14)
        {
          LOBYTE(location) = 0;
          objc_opt_class();
          long long v16 = [(STUIStatusBarAccessibility *)self safeValueForKey:@"displayItemStates"];
          v17 = __UIAccessibilityCastAsClass();

          if ((_BYTE)location) {
            abort();
          }
          uint64_t v18 = [v13 safeValueForKey:@"identifier"];
          LOBYTE(location) = 0;
          v19 = [v17 objectForKey:v18];
          v20 = __UIAccessibilitySafeClass();

          if ((_BYTE)location) {
            abort();
          }
          if (v20)
          {
            id v26 = v20;
            AXPerformSafeBlock();
          }
          objc_msgSend(v13, "_accessibilityLoadAccessibilityInformation", v21);
        }
      }
      uint64_t v10 = [obja countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v10);
  }
}

- (void)_prepareVisualProviderIfNeeded
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(STUIStatusBarAccessibility *)self safeUIViewForKey:@"foregroundView"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__STUIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke;
  v5[3] = &unk_26515C7B8;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityElementsHiddenBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarAccessibility;
  [(STUIStatusBarAccessibility *)&v4 _prepareVisualProviderIfNeeded];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarItem"];
  [v3 validateClass:@"STUIStatusBarDisplayItem"];
  [v3 validateClass:@"STUIStatusBarDisplayItemState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"items", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"displayItemStates", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"currentAggregatedData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"styleAttributes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"visualProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"foregroundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"_prepareVisualProviderIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItem", @"displayItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItem", @"identifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItem", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItem", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItemState", @"enabilityStatus", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItemPlacementState", @"region", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarRegion", @"overriddenStyleAttributes", "@", 0);
  [v3 validateClass:@"STUIStatusBar" hasInstanceVariable:@"_regions" withType:"NSDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarRegion", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarRegion", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItemState", @"currentPlacementState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItemState", @"_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarStyleAttributes", @"styleAttributesWithOverrides:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"_frameForActionable:actionInsets:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarRegion", @"displayItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItem", @"item", "@", 0);
  [v3 validateClass:@"STUIStatusBarNavigationItem" isKindOfClass:@"STUIStatusBarItem"];
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

uint64_t __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isEnabled"] ^ 1;

  return v2;
}

void __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] safeIntegerForKey:@"enabilityStatus"];
  if (v2 == 3)
  {
    uint64_t v7 = [a1[4] _updateForUpdatedData:0 updatedStyleAttributes:0 updatedEnability:MEMORY[0x263EFFA80]];
    if (!v7) {
      return;
    }
  }
  else
  {
    if (v2 != 2) {
      return;
    }
    id v3 = [a1[5] safeValueForKey:@"currentAggregatedData"];
    objc_super v4 = [a1[4] safeValueForKeyPath:@"currentPlacementState.region.overriddenStyleAttributes"];
    uint64_t v5 = [a1[5] safeValueForKey:@"styleAttributes"];
    id v6 = [v5 styleAttributesWithOverrides:v4];
    id v8 = [a1[4] _updateForUpdatedData:v3 updatedStyleAttributes:v6 updatedEnability:MEMORY[0x263EFFA88]];

    uint64_t v7 = (uint64_t)v8;
    if (!v8) {
      return;
    }
  }
  id v9 = (id)v7;
  [a1[6] _accessibilitySetRetainedValue:v7 forKey:@"AccessibilityStatusBarUpdateData"];
}

- (void)_axSetIsHitTesting:(BOOL)a3
{
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(STUIStatusBarAccessibility *)self _axSetIsHitTesting:1];
  v72.receiver = self;
  v72.super_class = (Class)STUIStatusBarAccessibility;
  id v8 = -[STUIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v72, sel__accessibilityHitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    id v9 = self;
    uint64_t v10 = [(STUIStatusBarAccessibility *)v9 superview];
    objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    [(STUIStatusBarAccessibility *)v9 frame];
    v77.double x = v12;
    v77.double y = v14;
    if (CGRectContainsPoint(v78, v77))
    {
      char v71 = 0;
      objc_opt_class();
      long long v15 = [(STUIStatusBarAccessibility *)v9 safeValueForKey:@"items"];
      long long v16 = __UIAccessibilityCastAsClass();

      id v60 = v7;
      v54 = self;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      obuint64_t j = [v16 allValues];
      uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        v61 = 0;
        uint64_t v19 = *(void *)v68;
        double v20 = 1.79769313e308;
        uint64_t v55 = *(void *)v68;
        do
        {
          uint64_t v21 = 0;
          uint64_t v56 = v18;
          do
          {
            if (*(void *)v68 != v19) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v67 + 1) + 8 * v21);
            MEMORY[0x245665C20](@"STUIStatusBarItem");
            if (objc_opt_isKindOfClass())
            {
              char v71 = 0;
              objc_opt_class();
              v23 = [v22 safeValueForKey:@"displayItems"];
              v24 = __UIAccessibilityCastAsClass();

              if (v71) {
                abort();
              }
              v58 = v24;
              uint64_t v59 = v21;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              v25 = [v24 allValues];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v73 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v64;
                do
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v64 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    long long v30 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                    MEMORY[0x245665C20](@"STUIStatusBarDisplayItem");
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && [v30 safeBoolForKey:@"isEnabled"])
                    {
                      v31 = [v30 safeUIViewForKey:@"view"];
                      id v32 = [MEMORY[0x263F1C920] mainScreen];
                      v33 = [v32 coordinateSpace];
                      [v31 center];
                      double v35 = v34;
                      double v37 = v36;
                      objc_super v38 = [v31 superview];
                      objc_msgSend(v33, "convertPoint:fromCoordinateSpace:", v38, v35, v37);
                      double v40 = v39;
                      double v42 = v41;

                      AX_CGPointGetDistanceToPoint();
                      double v44 = v43;
                      v45 = [MEMORY[0x263F22968] server];
                      v46 = [v45 medusaApps];
                      unint64_t v47 = [v46 count];

                      if (v47 < 2)
                      {
                        double v48 = 1.79769313e308;
                      }
                      else
                      {
                        [v31 frame];
                        double v48 = fmax(CGRectGetWidth(v79), 50.0);
                      }
                      if (v44 <= v48 && v44 < v20)
                      {
                        v62.receiver = v9;
                        v62.super_class = (Class)STUIStatusBarAccessibility;
                        v50 = -[STUIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v62, sel__accessibilityHitTest_withEvent_, v60, v40, v42);
                        v51 = v50;
                        if (v50)
                        {
                          id v52 = v50;

                          v61 = v52;
                          double v20 = v44;
                        }
                      }
                    }
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v73 count:16];
                }
                while (v27);
              }

              uint64_t v19 = v55;
              uint64_t v18 = v56;
              uint64_t v21 = v59;
            }
            ++v21;
          }
          while (v21 != v18);
          uint64_t v18 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
        }
        while (v18);
      }
      else
      {
        v61 = 0;
      }

      self = v54;
      id v7 = v60;
    }
    else
    {
      v61 = 0;
    }

    id v8 = v61;
  }
  [(STUIStatusBarAccessibility *)self _axSetIsHitTesting:0];

  return v8;
}

- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5
{
  return 1;
}

uint64_t __60__STUIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1)
{
  if (AXRequestingClient() != 3) {
    return 0;
  }
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axElementWithinFocused])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained(v2);
    if (v5) {
      uint64_t v4 = __UIAccessibilityGetAssociatedBool() ^ 1;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  return v4;
}

BOOL __53__STUIStatusBarAccessibility__axElementWithinFocused__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)accessibilityElements
{
  if (AXProcessIsSpringBoard() && AXDeviceHasJindo() && UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(id)*MEMORY[0x263F1D020] _accessibilityStatusBarElements:1 sorted:1];
  }
  else if ([(STUIStatusBarAccessibility *)self _axElementWithinFocused])
  {
    v5.receiver = self;
    v5.super_class = (Class)STUIStatusBarAccessibility;
    id v3 = [(STUIStatusBarAccessibility *)&v5 accessibilityElements];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    char v36 = 0;
    objc_opt_class();
    uint64_t v10 = [v9 safeValueForKey:@"displayItems"];
    double v11 = __UIAccessibilityCastAsClass();

    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v32 + 1) + 8 * i) safeValueForKey:@"item"];
          MEMORY[0x245665C20](@"STUIStatusBarNavigationItem");
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            double top = *MEMORY[0x263F1D1C0];
            double left = *(double *)(MEMORY[0x263F1D1C0] + 8);
            double bottom = *(double *)(MEMORY[0x263F1D1C0] + 16);
            double right = *(double *)(MEMORY[0x263F1D1C0] + 24);
            goto LABEL_12;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  v31.receiver = self;
  v31.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _frameForActionable:actionInsets:](&v31, sel__frameForActionable_actionInsets_, v9, top, left, bottom, right);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

@end