@interface MapViewModeGridButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityViewModel;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation MapViewModeGridButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapViewModeGridButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MapViewModeGridButtonView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapViewModeGridButtonView", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapViewModeGridButtonViewModel", @"selected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapViewModeGridButtonViewModel", @"overflowMenu", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(MapViewModeGridButtonViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityViewModel
{
  return (id)[(MapViewModeGridButtonViewAccessibility *)self safeValueForKey:@"viewModel"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  id v3 = [(MapViewModeGridButtonViewAccessibility *)self _accessibilityViewModel];
  int v4 = [v3 safeBoolForKey:@"selected"];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityCustomActions
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = [(MapViewModeGridButtonViewAccessibility *)self _accessibilityViewModel];
  int v4 = [v3 safeValueForKey:@"overflowMenu"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = AXMapsLocString(@"ADDITIONAL_FILTERS");
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __68__MapViewModeGridButtonViewAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_26512D700;
    objc_copyWeak(&v14, &location);
    v7 = (void *)[v5 initWithName:v6 actionHandler:&v10];
    v16[0] = v7;
    v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
  }
  else
  {
    v8 = 0;
  }

  objc_destroyWeak(&location);

  return v8;
}

uint64_t __68__MapViewModeGridButtonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeUIViewForKey:@"_overflowButton"];

  [v2 _accessibilityShowContextMenuForElement:v2 targetPointValue:0];
  return 1;
}

@end