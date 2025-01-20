@interface EKEventViewControllerDefaultImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation EKEventViewControllerDefaultImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventViewControllerDefaultImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventViewControllerDefaultImpl", @"loadView", "v", 0);
  [v3 validateClass:@"EKEventViewControllerDefaultImpl" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerDefaultImplAccessibility;
  [(EKEventViewControllerDefaultImplAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(EKEventViewControllerDefaultImplAccessibility *)self safeValueForKey:@"_tableView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"EventDetailsContainer"];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventViewControllerDefaultImplAccessibility;
  [(EKEventViewControllerDefaultImplAccessibility *)&v3 loadView];
  [(EKEventViewControllerDefaultImplAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end