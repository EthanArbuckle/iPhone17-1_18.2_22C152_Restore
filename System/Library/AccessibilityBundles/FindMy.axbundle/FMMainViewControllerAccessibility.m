@interface FMMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FMMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMMainViewController";
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
  v4.receiver = self;
  v4.super_class = (Class)FMMainViewControllerAccessibility;
  [(FMMainViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(FMMainViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 accessibilitySetIdentification:@"FMMainView"];
}

@end