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
  return @"MusicApplication.SearchResultsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicApplication.SearchResultsViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SearchResultsViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v6 = 0;
  objc_opt_class();
  id v3 = [(SearchResultsViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityViewIsModal:1];
  v5.receiver = self;
  v5.super_class = (Class)SearchResultsViewControllerAccessibility;
  [(SearchResultsViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultsViewControllerAccessibility;
  [(SearchResultsViewControllerAccessibility *)&v3 viewDidLoad];
  [(SearchResultsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end