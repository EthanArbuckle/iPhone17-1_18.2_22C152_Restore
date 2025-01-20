@interface _UIStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_axElementWithinFocused;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (uint64_t)_axGetIsHitTesting;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIsHitTesting:(BOOL)a3;
- (void)_prepareVisualProviderIfNeeded;
- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5;
@end

@implementation _UIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  id v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIStatusBarItem";
  objc_msgSend(location[0], "validateClass:");
  v4 = @"_UIStatusBarDisplayItem";
  objc_msgSend(location[0], "validateClass:");
  v10 = @"_UIStatusBarDisplayItemState";
  objc_msgSend(location[0], "validateClass:");
  v8 = @"_UIStatusBar";
  v11 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"displayItemStates", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"currentAggregatedData", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"styleAttributes", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"visualProvider", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"foregroundView", v11, 0);
  v9 = "v";
  [location[0] validateClass:v8 hasInstanceMethod:@"_prepareVisualProviderIfNeeded" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"displayItems", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"identifier", v11, 0);
  v6 = @"isEnabled";
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"view", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"enabilityStatus", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItemPlacementState", @"region", v11, 0);
  v5 = @"_UIStatusBarRegion";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v8 hasInstanceVariable:@"_regions" withType:"NSDictionary"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"contentView", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v6, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", v9, v11, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"currentPlacementState", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v11, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarStyleAttributes", @"styleAttributesWithOverrides:", v11, 0);
  objc_storeStrong(v13, v12);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v54 = self;
  SEL v53 = a2;
  v52.receiver = self;
  v52.super_class = (Class)_UIStatusBarAccessibility;
  [(_UIStatusBarAccessibility *)&v52 _accessibilityLoadAccessibilityInformation];
  memset(__b, 0, sizeof(__b));
  id v18 = (id)[v54 safeDictionaryForKey:@"_regions"];
  id obj = (id)[v18 allValues];

  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
  if (v16)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0;
    unint64_t v15 = v16;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id val = *(id *)(__b[1] + 8 * v14);
      id v49 = (id)[val safeUIViewForKey:@"contentView"];
      objc_initWeak(&location, val);
      id v11 = v49;
      uint64_t v42 = MEMORY[0x263EF8330];
      int v43 = -1073741824;
      int v44 = 0;
      v45 = __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v46 = &unk_2650ADF60;
      objc_copyWeak(&v47, &location);
      [v11 _setAccessibilityElementsHiddenBlock:&v42];
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      objc_storeStrong(&v49, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0;
        unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  id v41 = (id)[v54 safeValueForKey:@"visualProvider"];
  [v41 _accessibilityLoadAccessibilityInformation];
  char v39 = 0;
  objc_opt_class();
  id v10 = (id)[v54 safeValueForKey:@"items"];
  id v38 = (id)__UIAccessibilityCastAsClass();

  id v37 = v38;
  objc_storeStrong(&v38, 0);
  id v40 = v37;
  memset(v35, 0, sizeof(v35));
  id v8 = (id)[v37 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:v35 objects:v55 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)v35[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)v35[2] != v5) {
        objc_enumerationMutation(v8);
      }
      id v36 = *(id *)(v35[1] + 8 * v6);
      char v33 = 0;
      id v32 = (id)__UIAccessibilitySafeClass();
      if (v33) {
        abort();
      }
      id v31 = v32;
      objc_storeStrong(&v32, 0);
      id v34 = v31;
      if (v31)
      {
        char v29 = 0;
        objc_opt_class();
        id v3 = (id)[v54 safeValueForKey:@"displayItemStates"];
        id v28 = (id)__UIAccessibilityCastAsClass();

        if (v29) {
          abort();
        }
        id v27 = v28;
        objc_storeStrong(&v28, 0);
        id v30 = v27;
        id v26 = (id)[v36 safeValueForKey:@"identifier"];
        char v24 = 0;
        id v2 = (id)[v30 objectForKey:v26];
        id v23 = (id)__UIAccessibilitySafeClass();

        if (v24) {
          abort();
        }
        id v22 = v23;
        objc_storeStrong(&v23, 0);
        id v25 = v22;
        if (v22)
        {
          id v19 = v25;
          id v20 = v54;
          id v21 = v36;
          AXPerformSafeBlock();
          objc_storeStrong(&v21, 0);
          objc_storeStrong(&v20, 0);
          objc_storeStrong(&v19, 0);
        }
        [v36 _accessibilityLoadAccessibilityInformation];
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v30, 0);
      }
      objc_storeStrong(&v34, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v8 countByEnumeratingWithState:v35 objects:v55 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
}

- (uint64_t)_axGetIsHitTesting
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (void)_axSetIsHitTesting:(BOOL)a3
{
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  CGPoint v66 = a3;
  id v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  [v65 _axSetIsHitTesting:1];
  v62.receiver = v65;
  v62.super_class = (Class)_UIStatusBarAccessibility;
  id v63 = -[_UIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v62, sel__accessibilityHitTest_withEvent_, location[0], v66.x, v66.y);
  if (!v63)
  {
    id v61 = v65;
    id v34 = (id)[v61 superview];
    objc_msgSend(v34, "convertPoint:toView:", v61, v66.x, v66.y);
    point.x = v4;
    point.y = v5;

    [v61 frame];
    CGRect rect = v73;
    if (CGRectContainsPoint(v73, point))
    {
      double v58 = 1.79769313e308;
      char v56 = 0;
      objc_opt_class();
      id v33 = (id)[v65 safeValueForKey:@"items"];
      id v55 = (id)__UIAccessibilityCastAsClass();

      id v54 = v55;
      objc_storeStrong(&v55, 0);
      id v57 = v54;
      memset(__b, 0, sizeof(__b));
      id obj = (id)[v54 allValues];
      uint64_t v32 = [obj countByEnumeratingWithState:__b objects:v70 count:16];
      if (v32)
      {
        uint64_t v28 = *(void *)__b[2];
        uint64_t v29 = 0;
        unint64_t v30 = v32;
        while (1)
        {
          uint64_t v27 = v29;
          if (*(void *)__b[2] != v28) {
            objc_enumerationMutation(obj);
          }
          id v53 = *(id *)(__b[1] + 8 * v29);
          NSClassFromString(&cfstr_Uistatusbarite_2.isa);
          if (objc_opt_isKindOfClass())
          {
            char v50 = 0;
            objc_opt_class();
            id v26 = (id)[v53 safeValueForKey:@"displayItems"];
            id v49 = (id)__UIAccessibilityCastAsClass();

            if (v50) {
              abort();
            }
            id v48 = v49;
            objc_storeStrong(&v49, 0);
            id v51 = v48;
            memset(v46, 0, sizeof(v46));
            id v24 = (id)[v48 allValues];
            uint64_t v25 = [v24 countByEnumeratingWithState:v46 objects:v69 count:16];
            if (v25)
            {
              uint64_t v21 = *(void *)v46[2];
              uint64_t v22 = 0;
              unint64_t v23 = v25;
              while (1)
              {
                uint64_t v20 = v22;
                if (*(void *)v46[2] != v21) {
                  objc_enumerationMutation(v24);
                }
                id v47 = *(id *)(v46[1] + 8 * v22);
                NSClassFromString(&cfstr_Uistatusbardis.isa);
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && ([v47 safeBoolForKey:@"isEnabled"] & 1) != 0)
                {
                  id v45 = (id)[v47 safeUIViewForKey:@"view"];
                  double v43 = 0.0;
                  double v44 = 0.0;
                  id v17 = (id)[MEMORY[0x263F1C920] mainScreen];
                  id v16 = (id)[v17 coordinateSpace];
                  [v45 center];
                  double v41 = v6;
                  double v42 = v7;
                  id v15 = (id)[v45 superview];
                  [v16 convertPoint:v41 fromCoordinateSpace:v42];
                  double v43 = v8;
                  double v44 = v9;

                  double v40 = 0.0;
                  AX_CGPointGetDistanceToPoint();
                  double v40 = v10;
                  double v39 = 0.0;
                  id v19 = (id)[MEMORY[0x263F22968] server];
                  id v18 = (id)[v19 medusaApps];
                  double v39 = (double)(unint64_t)[v18 count];

                  double v38 = 0.0;
                  if (v39 <= 1.0)
                  {
                    double v14 = 1.79769313e308;
                  }
                  else
                  {
                    objc_msgSend(v45, "frame", v39);
                    CGRect v37 = v74;
                    double Width = CGRectGetWidth(v74);
                    uint64_t v68 = 0x4049000000000000;
                    double v67 = Width;
                    double v14 = fmax(50.0, Width);
                  }
                  double v38 = v14;
                  if (v40 <= v14 && v40 < v58)
                  {
                    v35.receiver = v65;
                    v35.super_class = (Class)_UIStatusBarAccessibility;
                    id v36 = -[_UIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v35, sel__accessibilityHitTest_withEvent_, location[0], v43, v44);
                    if (v36)
                    {
                      objc_storeStrong(&v63, v36);
                      double v58 = v40;
                    }
                    objc_storeStrong(&v36, 0);
                  }
                  objc_storeStrong(&v45, 0);
                }
                ++v22;
                if (v20 + 1 >= v23)
                {
                  uint64_t v22 = 0;
                  unint64_t v23 = [v24 countByEnumeratingWithState:v46 objects:v69 count:16];
                  if (!v23) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v51, 0);
          }
          ++v29;
          if (v27 + 1 >= v30)
          {
            uint64_t v29 = 0;
            unint64_t v30 = [obj countByEnumeratingWithState:__b objects:v70 count:16];
            if (!v30) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v57, 0);
    }
    objc_storeStrong(&v61, 0);
  }
  [v65 _axSetIsHitTesting:0];
  id v13 = v63;
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);

  return v13;
}

- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5
{
  id location[3] = self;
  id location[2] = (id)a2;
  location[1] = a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)_prepareVisualProviderIfNeeded
{
  id v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = (id)[(_UIStatusBarAccessibility *)v11 safeUIViewForKey:@"foregroundView"];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __59___UIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke;
  double v8 = &unk_2650ADF60;
  objc_copyWeak(v9, location);
  [v2 _setAccessibilityElementsHiddenBlock:&v4];

  v3.receiver = v11;
  v3.super_class = (Class)_UIStatusBarAccessibility;
  [(_UIStatusBarAccessibility *)&v3 _prepareVisualProviderIfNeeded];
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
}

- (BOOL)_axElementWithinFocused
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v21 = self;
  SEL v20 = a2;
  memset(__b, 0, sizeof(__b));
  id obj = (id)_UIAccessibilityFocusedElements();
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(__b[1] + 8 * v6);
      objc_super v3 = v19;
      uint64_t v11 = MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      double v14 = __52___UIStatusBarAccessibility__axElementWithinFocused__block_invoke;
      id v15 = &unk_2650AE790;
      id v16 = v21;
      id location = (id)[v3 _accessibilityFindAncestor:&v11 startWithSelf:0];
      if (location)
      {
        char v22 = 1;
        int v10 = 1;
      }
      else
      {
        int v10 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong((id *)&v16, 0);
      if (v10) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v7) {
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
LABEL_11:
    int v10 = 0;
  }

  if (!v10) {
    char v22 = 0;
  }
  return v22 & 1;
}

- (id)accessibilityElements
{
  double v8 = self;
  SEL v7 = a2;
  if ([(_UIStatusBarAccessibility *)self _axElementWithinFocused])
  {
    char v6 = 0;
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsClass();
    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v9 = (id)[v4 subviews];
  }
  else
  {
    id v9 = 0;
  }
  id v2 = v9;

  return v2;
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarAccessibility;
  [(_UIStatusBarAccessibility *)&v7 _updateDisplayedItemsWithData:location[0] styleAttributes:v9 extraAnimations:v8];
  if ([(_UIStatusBarAccessibility *)v11 _axElementWithinFocused]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end