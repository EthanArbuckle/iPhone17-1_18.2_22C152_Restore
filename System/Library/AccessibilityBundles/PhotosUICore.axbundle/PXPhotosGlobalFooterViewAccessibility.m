@interface PXPhotosGlobalFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityInternalTextLinks;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axAccessoryView;
- (id)_axFilterView;
- (id)_axFooterElement;
- (id)_axLabel;
- (id)_axSubtitle1TextView;
- (id)accessibilityElements;
- (void)_setAXFooterElement:(id)a3;
@end

@implementation PXPhotosGlobalFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosGlobalFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_subtitle2Label" withType:"UILabel"];
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_subtitle1TextView" withType:"UITextView"];
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_progressView" withType:"UIProgressView"];
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_filterView" withType:"UIView"];
  [v3 validateClass:@"PXPhotosGlobalFooterView" hasInstanceVariable:@"_accessoryView" withType:"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_axFilterView
{
  return (id)[(PXPhotosGlobalFooterViewAccessibility *)self safeValueForKey:@"_filterView"];
}

- (id)_axAccessoryView
{
  return (id)[(PXPhotosGlobalFooterViewAccessibility *)self safeValueForKey:@"_accessoryView"];
}

- (id)_axFooterElement
{
}

- (void)_setAXFooterElement:(id)a3
{
}

- (id)accessibilityElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(PXPhotosGlobalFooterViewAccessibility *)self _axAccessoryView];
  v5 = v4;
  if (v4 && ([v4 safeBoolForKey:@"isHidden"] & 1) == 0)
  {
    v6 = [v5 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_3];
    [v3 addObjectsFromArray:v6];
  }
  v7 = [(PXPhotosGlobalFooterViewAccessibility *)self _axFooterElement];

  if (!v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [(PXPhotosGlobalFooterViewAccessibility *)self _accessibilityBounds];
    objc_msgSend(v8, "setBounds:");
    objc_initWeak(&location, self);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke_2;
    v15 = &unk_2650A6320;
    objc_copyWeak(&v16, &location);
    [v8 setAccessibilityLabelBlock:&v12];
    -[PXPhotosGlobalFooterViewAccessibility _setAXFooterElement:](self, "_setAXFooterElement:", v8, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v9 = [(PXPhotosGlobalFooterViewAccessibility *)self _axFooterElement];
  [v3 axSafelyAddObject:v9];

  v10 = (void *)[v3 copy];

  return v10;
}

uint64_t __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

id __62__PXPhotosGlobalFooterViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axLabel];

  return v2;
}

- (id)_axLabel
{
  id v3 = [(PXPhotosGlobalFooterViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [(PXPhotosGlobalFooterViewAccessibility *)self safeValueForKey:@"_subtitle2Label"];
  v5 = [(PXPhotosGlobalFooterViewAccessibility *)self safeValueForKey:@"_progressView"];
  if ([v5 safeBoolForKey:@"isHidden"])
  {
    v6 = 0;
  }
  else
  {
    v7 = [v5 accessibilityLabel];
    v15 = [v5 accessibilityValue];
    id v16 = @"__AXStringForVariablesSentinel";
    v6 = __UIAXStringForVariables();
  }
  v8 = [(PXPhotosGlobalFooterViewAccessibility *)self _axFilterView];
  v9 = [v3 accessibilityLabel];
  v10 = [(PXPhotosGlobalFooterViewAccessibility *)self _axSubtitle1TextView];
  v11 = [v10 accessibilityValue];
  uint64_t v12 = [v4 accessibilityLabel];
  if ([v8 safeBoolForKey:@"isHidden"])
  {
    uint64_t v13 = __UIAXStringForVariables();
  }
  else
  {
    v17 = [v8 accessibilityLabel];
    uint64_t v13 = __UIAXStringForVariables();
  }

  return v13;
}

- (id)_axSubtitle1TextView
{
  return (id)[(PXPhotosGlobalFooterViewAccessibility *)self safeUIViewForKey:@"_subtitle1TextView"];
}

- (id)_accessibilityInternalTextLinks
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(PXPhotosGlobalFooterViewAccessibility *)self _axSubtitle1TextView];
  v5 = [v4 _accessibilityInternalTextLinks];
  v6 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v5);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  v9 = v8;

  v10 = [(PXPhotosGlobalFooterViewAccessibility *)self _axAccessoryView];
  v11 = [v10 _accessibilityInternalTextLinks];
  [v9 axSafelyAddObjectsFromArray:v11];

  return v9;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(PXPhotosGlobalFooterViewAccessibility *)self _axFilterView];
  id v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

@end