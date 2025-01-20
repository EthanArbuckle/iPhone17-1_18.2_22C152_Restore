@interface SBSwitcherControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateContentViewControllerIfNeeded;
@end

@implementation SBSwitcherControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_updateContentViewControllerIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"switcherCoordinator", "@", 0);
}

- (void)_updateContentViewControllerIfNeeded
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherControllerAccessibility;
  [(SBSwitcherControllerAccessibility *)&v4 _updateContentViewControllerIfNeeded];
  id v3 = [(SBSwitcherControllerAccessibility *)self safeValueForKey:@"switcherCoordinator"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end