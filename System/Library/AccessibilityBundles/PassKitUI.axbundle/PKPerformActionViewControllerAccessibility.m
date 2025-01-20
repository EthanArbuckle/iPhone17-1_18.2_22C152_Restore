@interface PKPerformActionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPerformActionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPerformActionViewController";
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
  v6.super_class = (Class)PKPerformActionViewControllerAccessibility;
  [(PKPerformActionViewControllerAccessibility *)&v6 viewDidLoad];
  objc_opt_class();
  v3 = [(PKPerformActionViewControllerAccessibility *)self safeValueForKey:@"navigationItem"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 leftBarButtonItem];
  [v5 _setAccessibilityIsNotFirstElement:0];
}

@end