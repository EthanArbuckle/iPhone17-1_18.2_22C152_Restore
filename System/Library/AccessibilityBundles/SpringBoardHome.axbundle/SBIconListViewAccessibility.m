@interface SBIconListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsListViewEmptyForDragAndDrop;
- (BOOL)_accessibilityProvidesScannerGroupElements;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityMaxFuzzyHitTestDistance;
- (id)__axDragElements;
- (id)_accessibilityAdditionalElements;
- (id)_accessibilityEmptyListDropString;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScannerGroupElements;
- (id)_axDragElements;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
- (id)automationElements;
- (void)_axSetDragElements:(id)a3;
- (void)_updateEditingStateForIcons:(id)a3 animated:(BOOL)a4;
@end

@implementation SBIconListViewAccessibility

- (void)_updateEditingStateForIcons:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListViewAccessibility;
  [(SBIconListViewAccessibility *)&v5 _updateEditingStateForIcons:a3 animated:a4];
  [(SBIconListViewAccessibility *)self _axSetDragElements:0];
}

- (void)_axSetDragElements:(id)a3
{
}

+ (id)safeCategoryTargetClassName
{
  return @"SBIconListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axDragElements
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBDockIconListView"];
  [v3 validateClass:@"SBIconListView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBIconListView" hasInstanceVariable:@"_model" withType:"SBIconListModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"layoutIconsNow", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconViewForIcon:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"isLayoutReversed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"rowAtPoint:", "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"columnAtPoint:", "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"indexForCoordinate:forOrientation:", "Q", "{SBIconCoordinate=qq}", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconImageSize", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"iconAtIndex:", "@", "Q", 0);
  [v3 validateClass:@"SBIconListModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"icons", "@", 0);
  [v3 validateClass:@"SBIcon"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isPlaceholder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"orientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"coordinateForIconAtIndex:", "{SBIconCoordinate=qq}", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconRowsForCurrentOrientation", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"gridSizeClass", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconGridSizeForClass:", "{SBHIconGridSize=SS}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"indexForIcon:", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"displayedModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"gridCellInfoWithOptions:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListGridCellInfo", @"enumerateEmptyGridCellIndexesUsingBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"coordinateForGridCellIndex:gridCellInfoOptions:", "{SBIconCoordinate=qq}", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"rectForCellAtIconCoordinate:metrics:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{SBIconCoordinate=qq}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"layoutMetrics", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"_updateEditingStateForIcons:animated:", "v", "@", "B", 0);
  [v3 validateClass:@"SBRootFolder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"folder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"isEditing", "B", 0);
}

- (id)automationElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v16 = 0;
  objc_opt_class();
  id v3 = [(SBIconListViewAccessibility *)self safeValueForKey:@"_model"];
  v4 = [v3 safeValueForKey:@"icons"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          id v11 = (id)[(SBIconListViewAccessibility *)self iconViewForIcon:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v12 = (id)[(SBIconListViewAccessibility *)self safeValueForKey:@"layoutIconsNow"];
  v15.receiver = self;
  v15.super_class = (Class)SBIconListViewAccessibility;
  v13 = [(SBIconListViewAccessibility *)&v15 automationElements];

  return v13;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  LOBYTE(v27) = 0;
  objc_opt_class();
  uint64_t v8 = [(SBIconListViewAccessibility *)self safeValueForKey:@"_model"];
  v9 = [v8 safeValueForKey:@"icons"];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  id v11 = __UIAccessibilityCastAsClass();
  id v12 = v11;
  if (!objc_msgSend(v11, "pointInside:withEvent:", v7, x, y)
    || (NSClassFromString(&cfstr_Sbiconlistview_1.isa), (objc_opt_isKindOfClass() & 1) != 0)
    || ![v10 count])
  {
    v65.receiver = self;
    v65.super_class = (Class)SBIconListViewAccessibility;
    -[SBIconListViewAccessibility _accessibilityHitTest:withEvent:](&v65, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v30 = 0;
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 3221225472;
    v59 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v60 = &unk_265157FF0;
    v61 = self;
    v62 = &v27;
    double v63 = x;
    double v64 = y;
    AXPerformSafeBlock();
    uint64_t v21 = v28[3];
    _Block_object_dispose(&v27, 8);
    if (v21) {
      goto LABEL_19;
    }
    LOBYTE(v27) = 0;
    objc_opt_class();
    uint64_t v22 = __UIAccessibilityCastAsClass();
    if (!(_BYTE)v27)
    {
      id v23 = v22;
      [v22 bounds];
      objc_msgSend(v23, "convertRect:toView:", v12);
      if (CGRectGetMinY(v67) > y)
      {

        id v20 = 0;
      }
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v30 = 0;
  uint64_t v49 = MEMORY[0x263EF8330];
  uint64_t v50 = 3221225472;
  v51 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2;
  v52 = &unk_265157FF0;
  v53 = self;
  v54 = &v27;
  double v55 = x;
  double v56 = y;
  AXPerformSafeBlock();
  uint64_t v13 = v28[3];
  _Block_object_dispose(&v27, 8);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v30 = 0;
  uint64_t v41 = MEMORY[0x263EF8330];
  uint64_t v42 = 3221225472;
  v43 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3;
  v44 = &unk_265157FF0;
  v45 = self;
  v46 = &v27;
  double v47 = x;
  double v48 = y;
  AXPerformSafeBlock();
  uint64_t v14 = v28[3];
  _Block_object_dispose(&v27, 8);
  if ([(SBIconListViewAccessibility *)self safeBoolForKey:@"isLayoutReversed"])
  {
    objc_super v15 = [(SBIconListViewAccessibility *)self window];
    char v16 = [v15 windowScene];
    unint64_t v17 = [v16 interfaceOrientation] - 3;

    if (v17 > 1)
    {
      LOBYTE(v27) = 0;
      objc_opt_class();
      v24 = [(SBIconListViewAccessibility *)self safeValueForKey:@"icons"];
      long long v19 = __UIAccessibilityCastAsClass();

      if (!(_BYTE)v27)
      {
        uint64_t v13 = [v19 count] + ~v13;
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v27) = 0;
      objc_opt_class();
      long long v18 = [(SBIconListViewAccessibility *)self safeValueForKey:@"icons"];
      long long v19 = __UIAccessibilityCastAsClass();

      if (!(_BYTE)v27)
      {
        uint64_t v14 = [v19 count] + ~v14;
LABEL_16:

        goto LABEL_17;
      }
    }
LABEL_22:
    abort();
  }
LABEL_17:
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v30 = 0;
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  v35 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_4;
  v36 = &unk_265157FF0;
  v37 = self;
  v38 = &v27;
  uint64_t v39 = v14;
  uint64_t v40 = v13;
  AXPerformSafeBlock();
  _Block_object_dispose(&v27, 8);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  AXPerformSafeBlock();
  id v25 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  id v23 = v25;
  AXPerformSafeBlock();
  id v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
LABEL_18:

LABEL_19:

  return v20;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rowAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "columnAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rowAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "indexForCoordinate:forOrientation:", *(void *)(a1 + 48) + 1, *(void *)(a1 + 56) + 1, objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", @"_orientation"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_393(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_model"];
  uint64_t v2 = [v5 iconAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_394(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityScannerGroupElements
{
  v53[2] = *MEMORY[0x263EF8340];
  id v25 = [MEMORY[0x263EFF980] array];
  v26 = [(SBIconListViewAccessibility *)self safeValueForKey:@"_model"];
  LOBYTE(v41) = 0;
  objc_opt_class();
  uint64_t v3 = [v26 safeValueForKey:@"icons"];
  v4 = __UIAccessibilityCastAsClass();

  unint64_t v5 = [(SBIconListViewAccessibility *)self safeUnsignedIntegerForKey:@"iconRowsForCurrentOrientation"];
  if (v5 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v44 = 0;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke;
    v49[3] = &unk_265158128;
    v49[4] = self;
    id v50 = v26;
    v51 = &v41;
    [v4 enumerateObjectsUsingBlock:v49];
    unint64_t v6 = v42[3];

    _Block_object_dispose(&v41, 8);
    unint64_t v5 = v6;
  }
  unint64_t v24 = v5;
  if (v5)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v22 = v38;
    id v20 = v28;
    uint64_t v21 = v32;
    unint64_t v7 = 1;
    do
    {
      v46[0] = v23;
      v46[1] = 3221225472;
      v46[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_3;
      v46[3] = &unk_265158150;
      v46[4] = self;
      id v8 = v26;
      id v47 = v8;
      unint64_t v48 = v7;
      v9 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v46, v20, v21, v22);
      uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_4];
      id v11 = [v10 firstObject];

      id v12 = [v11 safeStringForKey:@"gridSizeClass"];
      uint64_t v41 = 0;
      uint64_t v42 = &v41;
      uint64_t v43 = 0x2810000000;
      v44 = &unk_2425EB325;
      int v45 = 0;
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38[0] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_6;
      v38[1] = &unk_265157EC0;
      uint64_t v40 = &v41;
      v38[2] = self;
      id v13 = v12;
      id v39 = v13;
      AXPerformSafeBlock();
      uint64_t v14 = *((unsigned __int16 *)v42 + 17);

      _Block_object_dispose(&v41, 8);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v32[0] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_7;
      v32[1] = &unk_265158198;
      v32[2] = self;
      id v33 = v8;
      unint64_t v34 = v7;
      uint64_t v35 = v7 + v14 - 1;
      objc_super v15 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v31);
      char v16 = [MEMORY[0x263EFF980] array];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v28[0] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_9;
      v28[1] = &unk_2651581C0;
      id v29 = v16;
      v30 = self;
      id v17 = v16;
      [v15 enumerateObjectsUsingBlock:v27];
      v52[0] = @"GroupTraits";
      v52[1] = @"GroupElements";
      v53[0] = &unk_26F7F1F00;
      v53[1] = v17;
      long long v18 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
      [v25 axSafelyAddObject:v18];

      v7 += v14;
    }
    while (v7 <= v24);
  }

  return v25;
}

void __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3010000000;
  id v11 = &unk_2425EB325;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  AXPerformSafeBlock();
  unint64_t v5 = v9[5];

  _Block_object_dispose(&v8, 8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v5 > *(void *)(v6 + 24)) {
    *(void *)(v6 + 24) = v5;
  }
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(void *)(a1 + 48)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

BOOL __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_2425EB325;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  AXPerformSafeBlock();
  uint64_t v4 = v10[5];

  _Block_object_dispose(&v9, 8);
  BOOL v5 = v4 == *(void *)(a1 + 48);

  return v5;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_4(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(void *)(a1 + 48)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 safeStringForKey:@"gridSizeClass"];
  uint64_t v6 = [v4 safeStringForKey:@"gridSizeClass"];

  uint64_t v7 = SBAccessibilityGridSizeComparison(v5, v6);
  return v7;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) iconGridSizeForClass:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = result;
  return result;
}

BOOL __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_2425EB325;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  AXPerformSafeBlock();
  uint64_t v5 = v10[5];

  _Block_object_dispose(&v9, 8);
  BOOL v6 = v5 >= *(void *)(a1 + 48) && v5 <= *(void *)(a1 + 56);

  return v6;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_8(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(void *)(a1 + 48)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

void __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  id v6 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  [v4 axSafelyAddObject:v5];
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_10(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (id)__axDragElements
{
  id v3 = [(SBIconListViewAccessibility *)self _axDragElements];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    [(SBIconListViewAccessibility *)self safeValueForKey:@"displayedModel"];
    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__5;
    long long v19 = __Block_byref_object_dispose__5;
    id v20 = 0;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    id v5 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    uint64_t v11 = MEMORY[0x263EF8330];
    id v12 = v5;
    uint64_t v13 = v4;
    id v6 = v4;
    id v7 = v14;
    id v8 = v5;
    AXPerformSafeBlock();
    -[SBIconListViewAccessibility _axSetDragElements:](self, "_axSetDragElements:", v6, v11, 3221225472, __47__SBIconListViewAccessibility___axDragElements__block_invoke_2, &unk_265158238, self);
  }
  uint64_t v9 = [(SBIconListViewAccessibility *)self _axDragElements];

  return v9;
}

uint64_t __47__SBIconListViewAccessibility___axDragElements__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) gridCellInfoWithOptions:0];

  return MEMORY[0x270F9A758]();
}

void __47__SBIconListViewAccessibility___axDragElements__block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__SBIconListViewAccessibility___axDragElements__block_invoke_3;
  v3[3] = &unk_265158210;
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 56);
  [v2 enumerateEmptyGridCellIndexesUsingBlock:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__SBIconListViewAccessibility___axDragElements__block_invoke_3(id *a1, uint64_t a2)
{
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  id v32 = (double *)&v31;
  uint64_t v33 = 0x3010000000;
  unint64_t v34 = &unk_2425EB325;
  long long v35 = 0uLL;
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  id v39 = __47__SBIconListViewAccessibility___axDragElements__block_invoke_4;
  uint64_t v40 = &unk_2651580B0;
  uint64_t v42 = &v31;
  id v41 = a1[4];
  uint64_t v43 = a2;
  AXPerformSafeBlock();
  id v4 = (void *)*((void *)v32 + 4);
  id v5 = (void *)*((void *)v32 + 5);

  _Block_object_dispose(&v31, 8);
  uint64_t v31 = 0;
  id v32 = (double *)&v31;
  uint64_t v33 = 0x4010000000;
  unint64_t v34 = &unk_2425EB325;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_copyWeak(v30, a1 + 6);
  v30[1] = v4;
  v30[2] = v5;
  AXPerformSafeBlock();
  double v6 = v32[4];
  double v7 = v32[5];
  double v8 = v32[6];
  double v9 = v32[7];
  objc_destroyWeak(v30);
  _Block_object_dispose(&v31, 8);
  id v10 = objc_alloc(MEMORY[0x263F1C3A8]);
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v12 = (void *)[v10 initWithAccessibilityContainer:WeakRetained];

  objc_msgSend(v12, "setAccessibilityFrame:", v6, v7, v8, v9);
  uint64_t v13 = accessibilityLocalizedString(@"empty.app.slot");
  [v12 setAccessibilityLabel:v13];

  [v12 setAccessibilityTraits:*MEMORY[0x263F81398]];
  id v14 = NSString;
  uint64_t v15 = accessibilityLocalizedString(@"app.grid.location");
  char v16 = MEMORY[0x245663CF0](v5);
  uint64_t v17 = MEMORY[0x245663CF0](v4);
  long long v18 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v17);

  [v12 setAccessibilityValue:v18];
  long long v19 = NSString;
  id v20 = accessibilityLocalizedString(@"place.app.at.location");
  uint64_t v21 = AXSBIconControllerSharedInstance();
  uint64_t v22 = [v21 _axDragManager];
  uint64_t v23 = [v22 _axGrabbedIconsLabel];
  unint64_t v24 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v23, v18);

  LOBYTE(v31) = 0;
  objc_opt_class();
  id v25 = objc_loadWeakRetained(a1 + 6);
  v26 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v31) {
    abort();
  }
  id v27 = objc_alloc(MEMORY[0x263F1C3B8]);
  AX_CGRectGetCenter();
  v28 = objc_msgSend(v27, "initWithName:point:inView:", v24, v26);
  v44[0] = v28;
  id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  [v12 setAccessibilityDropPointDescriptors:v29];

  [a1[5] addObject:v12];
}

uint64_t __47__SBIconListViewAccessibility___axDragElements__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) coordinateForGridCellIndex:*(void *)(a1 + 48) gridCellInfoOptions:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = result;
  *(void *)(v3 + 40) = v4;
  return result;
}

void __47__SBIconListViewAccessibility___axDragElements__block_invoke_5(uint64_t a1)
{
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [v8 safeValueForKey:@"layoutMetrics"];
  objc_msgSend(v8, "rectForCellAtIconCoordinate:metrics:", *(void *)(a1 + 48), *(void *)(a1 + 56), v2);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  void v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
}

- (id)_accessibilityAdditionalElements
{
  uint64_t v3 = [(SBIconListViewAccessibility *)self safeValueForKeyPath:@"displayedModel.folder"];
  NSClassFromString(&cfstr_Sbrootfolder.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(SBIconListViewAccessibility *)self safeBoolForKey:@"isEditing"] & 1) != 0)
  {
    uint64_t v4 = AXSBIconControllerSharedInstance();
    uint64_t v5 = [v4 _axDragManager];
    int v6 = [v5 _axIsIconDragging];

    if (v6)
    {
      uint64_t v7 = [(SBIconListViewAccessibility *)self __axDragElements];
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = AXSBIconControllerSharedInstance();
  uint64_t v4 = [v3 _axDragManager];
  if ([v4 _axIsIconDragging]) {
    BOOL v5 = [(SBIconListViewAccessibility *)self _accessibilityIsListViewEmptyForDragAndDrop];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  uint64_t v3 = AXSBIconControllerSharedInstance();
  uint64_t v4 = [v3 _axDragManager];
  if ([v4 _axIsIconDragging])
  {
    BOOL v5 = [(SBIconListViewAccessibility *)self _accessibilityIsListViewEmptyForDragAndDrop];

    if (v5)
    {
      accessibilityLocalizedString(@"empty.page");
      int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v6 = &stru_26F7E8EF8;
LABEL_6:

  return v6;
}

- (id)accessibilityDropPointDescriptors
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = AXSBIconControllerSharedInstance();
  uint64_t v4 = [v3 _axDragManager];
  if ([v4 _axIsIconDragging])
  {
    BOOL v5 = [(SBIconListViewAccessibility *)self _accessibilityIsListViewEmptyForDragAndDrop];

    if (v5)
    {
      int v6 = AXSBIconControllerSharedInstance();
      uint64_t v7 = [v6 _axDragManager];
      id v8 = [v7 _axGrabbedIconsLabel];

      double v9 = NSString;
      id v10 = [(SBIconListViewAccessibility *)self _accessibilityEmptyListDropString];
      uint64_t v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

      objc_opt_class();
      id v12 = __UIAccessibilityCastAsClass();
      id v13 = objc_alloc(MEMORY[0x263F1C3B8]);
      [v12 bounds];
      UIRectGetCenter();
      id v14 = objc_msgSend(v13, "initWithName:point:inView:", v11, v12);
      v17[0] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v15 = (void *)MEMORY[0x263EFFA68];
LABEL_6:

  return v15;
}

- (id)_accessibilityEmptyListDropString
{
  return accessibilityLocalizedString(@"move.to.new.page");
}

- (BOOL)_accessibilityIsListViewEmptyForDragAndDrop
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_opt_class();
  uint64_t v3 = [(SBIconListViewAccessibility *)self safeValueForKey:@"_model"];
  uint64_t v4 = [v3 safeValueForKey:@"icons"];
  BOOL v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 &= [*(id *)(*((void *)&v12 + 1) + 8 * i) safeBoolForKey:@"isPlaceholder"];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  [(SBIconListViewAccessibility *)self safeCGSizeForKey:@"iconImageSize"];
  return v2 * 1.5;
}

@end