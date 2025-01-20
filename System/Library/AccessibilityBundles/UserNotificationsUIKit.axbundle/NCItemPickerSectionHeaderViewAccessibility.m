@interface NCItemPickerSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityIsSelected;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation NCItemPickerSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCItemPickerSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"countLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"backgroundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"checkmarkButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"selected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"_checkmarkButtonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"_section", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerSectionHeaderView", @"_section", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCItemPickerViewController", @"_isSectionExpanded", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"countLabel"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  BOOL v3 = [(NCItemPickerSectionHeaderViewAccessibility *)self accessibilityIsSelected];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"backgroundView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityPath
{
  uint64_t v2 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"backgroundView"];
  double v3 = [v2 accessibilityPath];

  return v3;
}

- (id)accessibilityCustomActions
{
  double v3 = [MEMORY[0x263EFF980] array];
  v18.receiver = self;
  v18.super_class = (Class)NCItemPickerSectionHeaderViewAccessibility;
  double v4 = [(NCItemPickerSectionHeaderViewAccessibility *)&v18 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  BOOL v5 = [(NCItemPickerSectionHeaderViewAccessibility *)self accessibilityIsSelected];
  double v6 = @"digest.apps.select.all";
  if (v5) {
    double v6 = @"digest.apps.unselect.all";
  }
  double v7 = v6;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x263F1C390]);
  double v9 = accessibilityLocalizedString(v7);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  double v14 = __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke;
  v15 = &unk_2651616F8;
  objc_copyWeak(&v16, &location);
  double v10 = (void *)[v8 initWithName:v9 actionHandler:&v12];

  objc_msgSend(v3, "axSafelyAddObject:", v10, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 safeValueForKey:@"checkmarkButton"];
  [v2 _checkmarkButtonPressed:v1];
}

- (int64_t)_accessibilityExpandedStatus
{
  id v3 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"_section"];
  uint64_t v4 = [v3 unsignedIntegerValue];

  id v5 = [(NCItemPickerSectionHeaderViewAccessibility *)self safeValueForKey:@"delegate"];
  double v6 = [v5 safeArrayForKey:@"_isSectionExpanded"];
  double v7 = [v6 objectAtIndex:v4];
  int v8 = [v7 BOOLValue];

  if (v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 2;
  }

  return v9;
}

- (BOOL)accessibilityIsSelected
{
  return [(NCItemPickerSectionHeaderViewAccessibility *)self safeBoolForKey:@"selected"];
}

@end