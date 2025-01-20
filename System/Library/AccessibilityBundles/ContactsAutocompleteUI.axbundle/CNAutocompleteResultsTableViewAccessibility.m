@interface CNAutocompleteResultsTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CNAutocompleteResultsTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAutocompleteResultsTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNAutocompleteResultsTableView" isKindOfClass:@"UITableView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableView", @"selectRowAtIndexPath:animated:scrollPosition:", "v", "@", "B", "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"table.results.label");
}

@end