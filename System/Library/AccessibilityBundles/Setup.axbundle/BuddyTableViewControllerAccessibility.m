@interface BuddyTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BuddyTableViewControllerAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkTableViewAsNotAXElement;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddyTableViewController", @"tableView", "@", 0);
  [v3 validateClass:@"BuddyTableViewController" hasInstanceVariable:@"_tableView" withType:"UITableView"];
}

- (void)_accessibilityMarkTableViewAsNotAXElement
{
  objc_opt_class();
  id v3 = [(BuddyTableViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BuddyTableViewControllerAccessibility;
  [(BuddyTableViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(BuddyTableViewControllerAccessibility *)self _accessibilityMarkTableViewAsNotAXElement];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)BuddyTableViewControllerAccessibility;
  [(BuddyTableViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(BuddyTableViewControllerAccessibility *)self _accessibilityMarkTableViewAsNotAXElement];
}

- (BuddyTableViewControllerAccessibility)init
{
  v7.receiver = self;
  v7.super_class = (Class)BuddyTableViewControllerAccessibility;
  v2 = [(BuddyTableViewControllerAccessibility *)&v7 init];
  objc_super v3 = [(BuddyTableViewControllerAccessibility *)v2 safeValueForKey:@"_containerView"];
  [v3 setAccessibilityIdentifier:@"BuddyContainerView"];

  objc_super v4 = [(BuddyTableViewControllerAccessibility *)v2 safeValueForKey:@"_tableView"];
  [v4 setAccessibilityIdentifier:@"BuddyTableView"];

  v5 = [(BuddyTableViewControllerAccessibility *)v2 safeValueForKey:@"_tableView"];
  [v5 setAccessibilityLabel:&stru_26F7B12C0];

  return v2;
}

@end