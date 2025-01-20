@interface AKTextAttributesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)createRowAlignmentCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddAlignmentLabels:(id)a3;
@end

@implementation AKTextAttributesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKTextAttributesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AKSegmentedCtrl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKTextAttributesViewController", @"tableView: cellForRowAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKTextAttributesViewController", @"createRowAlignmentCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSegmentedCtrl", @"segmentAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSegmentedCtrl", @"tagForSegment:", "q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKTextAttributesViewController", @"presetFontController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKTextAttributesViewController", @"currentFontFamilyName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKFontListController", @"fonts", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  [(AKTextAttributesViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(AKTextAttributesViewControllerAccessibility *)self safeValueForKey:@"alignmentTableCell"];
  v4 = __UIAccessibilityCastAsClass();

  [(AKTextAttributesViewControllerAccessibility *)self _axAddAlignmentLabels:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  v8 = [(AKTextAttributesViewControllerAccessibility *)&v22 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  v9 = [(AKTextAttributesViewControllerAccessibility *)self safeValueForKey:@"presetFontController"];
  v10 = [v9 safeValueForKey:@"fonts"];
  v11 = __UIAccessibilityCastAsClass();

  unint64_t v12 = [v7 row];
  if (v12 < [v11 count])
  {
    objc_opt_class();
    v13 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    v14 = __UIAccessibilityCastAsClass();

    uint64_t v15 = [(AKTextAttributesViewControllerAccessibility *)self safeValueForKey:@"currentFontFamilyName"];
    v16 = (void *)v15;
    uint64_t v17 = *MEMORY[0x263F1CEE8];
    if (v14 && v15)
    {
      v18 = [v14 familyName];
      int v19 = [v18 containsString:v16];

      uint64_t v20 = *MEMORY[0x263F1CF38];
      if (!v19) {
        uint64_t v20 = 0;
      }
      v17 |= v20;
    }
    [v8 setAccessibilityTraits:v17];
  }

  return v8;
}

- (void)_axAddAlignmentLabels:(id)a3
{
  id v11 = a3;
  id v3 = [v11 contentView];
  v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global];

  uint64_t v5 = [v4 safeUnsignedIntegerForKey:@"segmentCount"];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy__0;
      v18 = __Block_byref_object_dispose__0;
      id v19 = 0;
      id v13 = v4;
      AXPerformSafeBlock();
      id v8 = (id)v15[5];

      _Block_object_dispose(&v14, 8);
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      id v12 = v13;
      AXPerformSafeBlock();
      unint64_t v9 = v15[3];

      _Block_object_dispose(&v14, 8);
      if (v9 < 4)
      {
        v10 = accessibilityLocalizedString(off_2651040D8[v9]);
        [v8 setAccessibilityLabel:v10];
      }
    }
  }
}

uint64_t __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245640800](@"AKSegmentedCtrl");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke_314(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) segmentAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

uint64_t __69__AKTextAttributesViewControllerAccessibility__axAddAlignmentLabels___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tagForSegment:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)createRowAlignmentCell
{
  char v7 = 0;
  objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)AKTextAttributesViewControllerAccessibility;
  id v3 = [(AKTextAttributesViewControllerAccessibility *)&v6 createRowAlignmentCell];
  v4 = __UIAccessibilityCastAsClass();

  if (v7) {
    abort();
  }
  [(AKTextAttributesViewControllerAccessibility *)self _axAddAlignmentLabels:v4];

  return v4;
}

@end