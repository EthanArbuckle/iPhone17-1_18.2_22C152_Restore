@interface MonthViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation MonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonthViewController";
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
  v6.receiver = self;
  v6.super_class = (Class)MonthViewControllerAccessibility;
  [(MonthViewControllerAccessibility *)&v6 viewDidLoad];
  v3 = [(MonthViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = [v3 safeValueForKey:@"rightBarButtonItem"];
  v5 = accessibilityLocalizedString(@"today");
  [v4 setAccessibilityLabel:v5];
}

@end