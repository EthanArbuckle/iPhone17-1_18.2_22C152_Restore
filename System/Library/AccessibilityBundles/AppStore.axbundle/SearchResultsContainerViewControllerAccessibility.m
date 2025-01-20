@interface SearchResultsContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation SearchResultsContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.SearchResultsContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3 = [(SearchResultsContainerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
  v4.receiver = self;
  v4.super_class = (Class)SearchResultsContainerViewControllerAccessibility;
  [(SearchResultsContainerViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsContainerViewControllerAccessibility;
  [(SearchResultsContainerViewControllerAccessibility *)&v3 viewDidLoad];
  [(SearchResultsContainerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end