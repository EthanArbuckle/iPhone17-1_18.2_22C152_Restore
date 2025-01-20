@interface SearchHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateTraits;
- (void)layoutSubviews;
@end

@implementation SearchHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobilePhone.SearchHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MobilePhone.SearchHeaderCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"MobilePhone.SearchHeaderCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
}

- (void)_axUpdateTraits
{
  objc_opt_class();
  id v3 = [(SearchHeaderCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SearchHeaderCellAccessibility;
  [(SearchHeaderCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SearchHeaderCellAccessibility *)self _axUpdateTraits];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SearchHeaderCellAccessibility;
  [(SearchHeaderCellAccessibility *)&v3 layoutSubviews];
  [(SearchHeaderCellAccessibility *)self _axUpdateTraits];
}

@end