@interface AVTAttributeEditorSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createAccessoryButtonIfNeeded;
@end

@implementation AVTAttributeEditorSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAttributeEditorSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeEditorSectionHeaderView", @"displayString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeEditorSectionHeaderView", @"accessoryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeEditorSectionHeaderView", @"createAccessoryButtonIfNeeded", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  [(AVTAttributeEditorSectionHeaderViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(AVTAttributeEditorSectionHeaderViewAccessibility *)self safeUIViewForKey:@"accessoryButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __94__AVTAttributeEditorSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_26510A240;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __94__AVTAttributeEditorSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained titleLabel];
  id v3 = [v2 text];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(AVTAttributeEditorSectionHeaderViewAccessibility *)self safeValueForKey:@"displayString"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(AVTAttributeEditorSectionHeaderViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AVTAttributeEditorSectionHeaderViewAccessibility *)self safeValueForKey:@"accessoryButton"];
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
    uint64_t v5 = [(AVTAttributeEditorSectionHeaderViewAccessibility *)&v8 _accessibilitySupplementaryHeaderViews];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)createAccessoryButtonIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeEditorSectionHeaderViewAccessibility;
  [(AVTAttributeEditorSectionHeaderViewAccessibility *)&v3 createAccessoryButtonIfNeeded];
  [(AVTAttributeEditorSectionHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end