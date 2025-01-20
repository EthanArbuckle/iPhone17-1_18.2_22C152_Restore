@interface SBHStackConfigurationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBHStackConfigurationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHStackConfigurationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHStackConfigurationViewControllerAccessibility;
  [(SBHStackConfigurationViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SBHStackConfigurationViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

@end