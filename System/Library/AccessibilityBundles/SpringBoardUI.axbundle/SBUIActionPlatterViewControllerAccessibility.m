@interface SBUIActionPlatterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHideKeylinesContainerView;
- (void)loadView;
@end

@implementation SBUIActionPlatterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIActionPlatterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIActionPlatterViewController", @"loadView", "v", 0);
  [v3 validateClass:@"SBUIActionPlatterViewController" hasInstanceVariable:@"_keylinesContainerView" withType:"UIView"];
}

- (void)_axHideKeylinesContainerView
{
  id v2 = [(SBUIActionPlatterViewControllerAccessibility *)self safeValueForKey:@"_keylinesContainerView"];
  [v2 setAccessibilityElementsHidden:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionPlatterViewControllerAccessibility;
  [(SBUIActionPlatterViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBUIActionPlatterViewControllerAccessibility *)self _axHideKeylinesContainerView];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionPlatterViewControllerAccessibility;
  [(SBUIActionPlatterViewControllerAccessibility *)&v3 loadView];
  [(SBUIActionPlatterViewControllerAccessibility *)self _axHideKeylinesContainerView];
}

@end