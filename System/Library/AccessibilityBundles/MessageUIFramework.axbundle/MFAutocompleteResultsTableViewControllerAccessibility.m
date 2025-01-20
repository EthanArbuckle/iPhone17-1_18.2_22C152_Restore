@interface MFAutocompleteResultsTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3;
@end

@implementation MFAutocompleteResultsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFAutocompleteResultsTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFAutocompleteResultsTableViewControllerAccessibility;
  [(MFAutocompleteResultsTableViewControllerAccessibility *)&v3 _selectSearchResultsRecipientAtIndexPath:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end