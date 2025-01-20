@interface PXScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PXScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXScrollViewController";
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
  v4.super_class = (Class)PXScrollViewControllerAccessibility;
  [(PXScrollViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(PXScrollViewControllerAccessibility *)self safeValueForKey:@"updateDelegate"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

@end