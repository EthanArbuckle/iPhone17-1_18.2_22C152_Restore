@interface SearchResultsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation SearchResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchResultsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchResultsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SearchResultsViewController" isKindOfClass:@"ListViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ListViewController", @"tableView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewControllerAccessibility;
  [(SearchResultsViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SearchResultsViewControllerAccessibility *)self safeValueForKey:@"tableView"];
  v4 = accessibilityUIKitLocalizedString();
  [v3 setAccessibilityLabel:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewControllerAccessibility;
  [(SearchResultsViewControllerAccessibility *)&v3 viewDidLoad];
  [(SearchResultsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end