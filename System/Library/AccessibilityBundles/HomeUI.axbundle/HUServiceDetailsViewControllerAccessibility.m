@interface HUServiceDetailsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUServiceDetailsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUServiceDetailsViewController";
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
  v3.receiver = self;
  v3.super_class = (Class)HUServiceDetailsViewControllerAccessibility;
  [(HUServiceDetailsViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(HUServiceDetailsViewControllerAccessibility *)self _axModifyTableView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUServiceDetailsViewControllerAccessibility;
  [(HUServiceDetailsViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUServiceDetailsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end