@interface CCUIDisplayBackgroundViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUIDisplayBackgroundViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIDisplayBackgroundViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIDisplayBackgroundViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIDisplayBackgroundViewController", @"nightShiftButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIDisplayBackgroundViewController", @"trueToneButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  [(CCUIDisplayBackgroundViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIDisplayBackgroundViewControllerAccessibility *)self safeValueForKey:@"nightShiftButton"];
  [v3 _accessibilityLoadAccessibilityInformation];

  v4 = [(CCUIDisplayBackgroundViewControllerAccessibility *)self safeValueForKey:@"trueToneButton"];
  [v4 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  [(CCUIDisplayBackgroundViewControllerAccessibility *)&v3 viewDidLoad];
  [(CCUIDisplayBackgroundViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIDisplayBackgroundViewControllerAccessibility;
  [(CCUIDisplayBackgroundViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(CCUIDisplayBackgroundViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end