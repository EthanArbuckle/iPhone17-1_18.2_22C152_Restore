@interface PXCuratedLibraryZoomLevelControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (Class)_axCuratedLibraryUIViewControllerClass;
- (id)_axSiblingScrollView;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAdjustZoomLevel:(BOOL)a3;
- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3;
- (void)_updateSegmentedControl;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setSelectedZoomLevel:(int64_t)a3;
@end

@implementation PXCuratedLibraryZoomLevelControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCuratedLibraryZoomLevelControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"selectedZoomLevel", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"zoomLevelIdentifiers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"setSelectedZoomLevel:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"zoomLevelIdentifiers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewModel", @"setZoomLevel:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewModel", @"performChanges:", "v", "@?", 0);
  [v3 validateClass:@"PXCuratedLibraryUIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"gridView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGView", @"scrollViewController", "@", 0);
  [v3 validateClass:@"PXUIScrollViewController"];
  [v3 validateClass:@"PXUIScrollViewController" hasInstanceVariable:@"_scrollView" withType:"_PXUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryZoomLevelControl", @"_updateSegmentedControl", "v", 0);
  [v3 validateClass:@"PXCuratedLibraryUIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"isCollapsed", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  [(PXCuratedLibraryZoomLevelControlAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_2];
  v4 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeValueForKey:@"zoomLevelIdentifiers"];
  uint64_t v5 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeIntegerForKey:@"selectedZoomLevel"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_2650A6210;
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  [v3 enumerateObjectsUsingBlock:v7];
}

uint64_t __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E3C60](@"UIButton");
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v9 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v4, "tag"));
  uint64_t v6 = [v5 integerValue];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v8[3] = &__block_descriptor_48_e5_Q8__0l;
  uint64_t v7 = *(void *)(a1 + 40);
  v8[4] = v6;
  v8[5] = v7;
  [v4 _setAccessibilityTraitsBlock:v8];
}

uint64_t __91__PXCuratedLibraryZoomLevelControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(a1 + 40)) {
    uint64_t v1 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v1 = 0;
  }
  return v1 | *MEMORY[0x263F1CEE8];
}

- (void)_updateSegmentedControl
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  [(PXCuratedLibraryZoomLevelControlAccessibility *)&v3 _updateSegmentedControl];
  [(PXCuratedLibraryZoomLevelControlAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3;
}

- (BOOL)accessibilityElementsHidden
{
  objc_opt_class();
  objc_super v3 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeValueForKey:@"delegate"];
  v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 safeBoolForKey:@"isCollapsed"];
  return v5;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(@"photos.zoom.level.picker");
}

- (id)accessibilityValue
{
  uint64_t v2 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeIntegerForKey:@"selectedZoomLevel"];

  return (id)MEMORY[0x270F53CC8](v2, 0);
}

- (id)accessibilityPath
{
  [(PXCuratedLibraryZoomLevelControlAccessibility *)self accessibilityFrame];
  uint64_t v2 = (void *)MEMORY[0x263F1C478];

  return (id)objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  return *MEMORY[0x263F1CED8] | [(PXCuratedLibraryZoomLevelControlAccessibility *)&v3 accessibilityTraits];
}

- (void)_axAdjustZoomLevel:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeArrayForKey:@"zoomLevelIdentifiers"];
  uint64_t v6 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeIntegerForKey:@"selectedZoomLevel"];
  uint64_t v7 = [NSNumber numberWithInteger:v6];
  uint64_t v8 = [v5 indexOfObject:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v3)
    {
      if (v8 + 1 >= (unint64_t)[v5 count]) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = v8 + 1;
      }
    }
    else if (v8)
    {
      unint64_t v9 = v8 - 1;
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < [v5 count])
    {
      objc_super v10 = [v5 objectAtIndex:v9];
      [v10 integerValue];

      v12 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self safeValueForKey:@"viewModel"];
      id v11 = v12;
      AXPerformSafeBlock();
    }
  }
}

uint64_t __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedZoomLevel:*(void *)(a1 + 48)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke_2;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  uint64_t v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 48);
  return [v2 performChanges:v4];
}

uint64_t __68__PXCuratedLibraryZoomLevelControlAccessibility__axAdjustZoomLevel___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

- (void)setSelectedZoomLevel:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryZoomLevelControlAccessibility;
  [(PXCuratedLibraryZoomLevelControlAccessibility *)&v5 setSelectedZoomLevel:a3];
  v4 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self _axSiblingScrollView];
  [v4 _axSetPXGScrollViewElements:0];
}

- (id)_axSiblingScrollView
{
  uint64_t v2 = [(PXCuratedLibraryZoomLevelControlAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_545 startWithSelf:1];
  BOOL v3 = [v2 _accessibilityViewController];

  v4 = [v3 safeValueForKey:@"gridView"];
  objc_super v5 = [v4 safeValueForKey:@"scrollViewController"];

  MEMORY[0x2455E3C60](@"PXUIScrollViewController");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 safeValueForKey:@"_scrollView"];
    uint64_t v7 = [v6 accessibilityIdentification];
    char v8 = [v7 isEqualToString:@"AXCuratedLibraryScrollView"];

    if (v8) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = 0;
LABEL_5:

  return v6;
}

uint64_t __69__PXCuratedLibraryZoomLevelControlAccessibility__axSiblingScrollView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E3C60](@"PXCuratedLibraryUIViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end