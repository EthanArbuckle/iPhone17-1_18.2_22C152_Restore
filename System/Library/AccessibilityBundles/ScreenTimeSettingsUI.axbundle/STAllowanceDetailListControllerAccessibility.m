@interface STAllowanceDetailListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkSelectedSpecifier;
- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STAllowanceDetailListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STAllowanceDetailListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STAllowanceDetailListController", @"_showOrHidePickerSpecifierForSpecifier:highlight:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STAllowanceDetailListController", @"timeSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STAllowanceDetailListController", @"selectedTimeSpecifier", "@", 0);
}

- (void)_accessibilityMarkSelectedSpecifier
{
  objc_opt_class();
  id v3 = [(STAllowanceDetailListControllerAccessibility *)self safeValueForKey:@"timeSpecifier"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  v5 = [(STAllowanceDetailListControllerAccessibility *)self safeValueForKey:@"selectedTimeSpecifier"];
  v6 = __UIAccessibilityCastAsSafeCategory();

  [v4 _accessibilitySetIsExpandedSTUICell:v4 == v6];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  [(STAllowanceDetailListControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(STAllowanceDetailListControllerAccessibility *)self safeValueForKey:@"timeSpecifier"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 _accessibilitySetIsExpandableSTUICell:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  [(STAllowanceDetailListControllerAccessibility *)&v4 viewDidAppear:a3];
  [(STAllowanceDetailListControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  [(STAllowanceDetailListControllerAccessibility *)&v5 _showOrHidePickerSpecifierForSpecifier:a3 highlight:a4];
  [(STAllowanceDetailListControllerAccessibility *)self _accessibilityMarkSelectedSpecifier];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end