@interface SBDockIconListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)shouldGroupAccessibilityChildren;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)_accessibilityEmptyListDropString;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScannerGroupElements;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation SBDockIconListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDockIconListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIconListModel"];
  [v3 validateClass:@"SBIconListView"];
  [v3 validateClass:@"SBDockIconListView" isKindOfClass:@"SBIconListView"];
  [v3 validateClass:@"SBIconListView" hasInstanceVariable:@"_model" withType:"SBIconListModel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"isEmpty", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"visibleIcons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"icons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconLocation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"displayedIconViewForIcon:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewAccessibility", @"_accessibilityEmptyListDropString", "@", 0);
  [v3 validateClass:@"SBFloatingDockViewController" hasInstanceVariable:@"_libraryPodIconView" withType:"SBIconView"];
}

- (id)_accessibilityEmptyListDropString
{
  return accessibilityLocalizedString(@"move.to.dock");
}

- (id)accessibilityLabel
{
  v2 = [(SBDockIconListViewAccessibility *)self safeStringForKey:@"iconLocation"];
  if ([v2 isEqualToString:@"SBIconLocationFloatingDockSuggestions"]) {
    id v3 = @"suggestions";
  }
  else {
    id v3 = @"dock";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (AXDeviceIsPad()
    && (NSClassFromString(&cfstr_Sbdocksuggesti.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBDockIconListViewAccessibility;
    uint64_t v8 = -[SBDockIconListViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
  }
  else
  {
    uint64_t v8 = -[SBDockIconListViewAccessibility _accessibilityBaseHitTest:withEvent:](self, "_accessibilityBaseHitTest:withEvent:", v7, x, y);
  }
  v9 = (void *)v8;

  return v9;
}

- (id)accessibilityElements
{
  v2 = [(SBDockIconListViewAccessibility *)self _accessibilitySubviews];
  id v3 = [v2 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v16 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [(SBDockIconListViewAccessibility *)self safeValueForKey:@"_model"];
  id obj = [v3 safeArrayForKey:@"icons"];

  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = 0;
        v18 = &v17;
        uint64_t v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__1;
        v21 = __Block_byref_object_dispose__1;
        id v22 = 0;
        AXPerformSafeBlock();
        id v7 = (id)v18[5];
        _Block_object_dispose(&v17, 8);

        [v16 axSafelyAddObject:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v4);
  }

  NSClassFromString(&cfstr_Sbdocksuggesti.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(SBDockIconListViewAccessibility *)self _accessibilityViewController];
    v9 = [v8 safeValueForKey:@"floatingDockViewController"];

    v10 = [v9 safeValueForKey:@"_libraryPodIconView"];
    [v16 axSafelyAddObject:v10];
  }
  objc_super v11 = [v16 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  v27[0] = @"GroupTraits";
  v27[1] = @"GroupElements";
  v28[0] = &unk_26F7F1ED0;
  v28[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v29 = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];

  return v13;
}

uint64_t __69__SBDockIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) displayedIconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end