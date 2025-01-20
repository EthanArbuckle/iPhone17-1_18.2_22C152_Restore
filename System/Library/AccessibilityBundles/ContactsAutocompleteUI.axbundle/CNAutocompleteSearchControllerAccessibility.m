@interface CNAutocompleteSearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation CNAutocompleteSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAutocompleteSearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAutocompleteSearchController", @"autocompleteResultsController:didSelectRecipient:atIndex:", "v", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAutocompleteSearchController", @"composeField", "@", 0);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteSearchControllerAccessibility;
  [(CNAutocompleteSearchControllerAccessibility *)&v8 autocompleteResultsController:a3 didSelectRecipient:a4 atIndex:a5];
  UIAccessibilityNotifications v6 = *MEMORY[0x263F1CE18];
  v7 = [(CNAutocompleteSearchControllerAccessibility *)self safeValueForKey:@"composeField"];
  UIAccessibilityPostNotification(v6, v7);
}

@end