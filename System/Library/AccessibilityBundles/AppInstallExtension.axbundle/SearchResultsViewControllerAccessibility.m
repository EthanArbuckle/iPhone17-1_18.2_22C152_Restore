@interface SearchResultsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation SearchResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.SearchResultsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SearchResultsViewControllerAccessibility;
  [(SearchResultsViewControllerAccessibility *)&v2 viewDidLoad];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end