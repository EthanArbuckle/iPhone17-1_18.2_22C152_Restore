@interface CNPropertyNoteCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNPropertyNoteCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPropertyNoteCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyNoteCell", @"labelLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPropertyNoteCell", @"textView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyNoteCellAccessibility;
  [(CNPropertyNoteCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(CNPropertyNoteCellAccessibility *)self safeValueForKey:@"textView"];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __77__CNPropertyNoteCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8 = &unk_265118160;
  objc_copyWeak(&v9, &location);
  [v3 _setAccessibilityLabelBlock:&v5];

  v4 = [(CNPropertyNoteCellAccessibility *)self safeValueForKey:@"labelLabel", v5, v6, v7, v8];
  [v4 setIsAccessibilityElement:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __77__CNPropertyNoteCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"labelLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(CNPropertyNoteCellAccessibility *)self safeValueForKey:@"labelLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CNPropertyNoteCellAccessibility *)self safeValueForKey:@"textView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

@end