@interface STSimpleScheduleListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySelectedSpecifier;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkSelectedSpecifier;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STSimpleScheduleListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSimpleScheduleListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STSimpleScheduleListController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"specifiers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"startTimeSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"endTimeSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"startTimePickerSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"endTimePickerSpecifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSimpleScheduleListController", @"tableView:didSelectRowAtIndexPath:", "v", "@", "@", 0);
}

- (id)_accessibilitySelectedSpecifier
{
  objc_opt_class();
  id v3 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"startTimePickerSpecifier"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  v5 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"endTimePickerSpecifier"];
  v6 = __UIAccessibilityCastAsSafeCategory();

  v7 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"specifiers"];
  if ([v7 containsObject:v4]) {
    v8 = v4;
  }
  else {
    v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (void)_accessibilityMarkSelectedSpecifier
{
  objc_opt_class();
  id v3 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"startTimeSpecifier"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  v5 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"endTimeSpecifier"];
  v6 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  v7 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"startTimePickerSpecifier"];
  v8 = __UIAccessibilityCastAsSafeCategory();

  objc_opt_class();
  id v9 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"endTimePickerSpecifier"];
  v10 = __UIAccessibilityCastAsSafeCategory();

  v11 = [(STSimpleScheduleListControllerAccessibility *)self _accessibilitySelectedSpecifier];
  [v4 _accessibilitySetIsExpandedSTUICell:v8 == v11];
  [v6 _accessibilitySetIsExpandedSTUICell:v10 == v11];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  [(STSimpleScheduleListControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"startTimeSpecifier"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 _accessibilitySetIsExpandableSTUICell:1];
  objc_opt_class();
  v5 = [(STSimpleScheduleListControllerAccessibility *)self safeValueForKey:@"endTimeSpecifier"];
  v6 = __UIAccessibilityCastAsSafeCategory();

  [v6 _accessibilitySetIsExpandableSTUICell:1];
  [(STSimpleScheduleListControllerAccessibility *)self _accessibilityMarkSelectedSpecifier];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  [(STSimpleScheduleListControllerAccessibility *)&v4 viewDidAppear:a3];
  [(STSimpleScheduleListControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STSimpleScheduleListControllerAccessibility;
  [(STSimpleScheduleListControllerAccessibility *)&v5 tableView:a3 didSelectRowAtIndexPath:a4];
  [(STSimpleScheduleListControllerAccessibility *)self _accessibilityMarkSelectedSpecifier];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end