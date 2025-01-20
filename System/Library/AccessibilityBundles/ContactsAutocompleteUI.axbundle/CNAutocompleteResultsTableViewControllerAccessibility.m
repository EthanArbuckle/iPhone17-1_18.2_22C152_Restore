@interface CNAutocompleteResultsTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)selectRowAtIndexPath:(id)a3;
@end

@implementation CNAutocompleteResultsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAutocompleteResultsTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)selectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteResultsTableViewControllerAccessibility;
  [(CNAutocompleteResultsTableViewControllerAccessibility *)&v9 selectRowAtIndexPath:v4];
  objc_opt_class();
  v5 = [(CNAutocompleteResultsTableViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 cellForRowAtIndexPath:v4];
  LODWORD(v5) = *MEMORY[0x263F1CDC8];
  v8 = [v7 accessibilityLabel];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v8);
}

@end