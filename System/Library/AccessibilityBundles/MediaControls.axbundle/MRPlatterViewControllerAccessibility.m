@interface MRPlatterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)headerViewButtonPressed:(id)a3;
@end

@implementation MRPlatterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRPlatterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)headerViewButtonPressed:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MRPlatterViewControllerAccessibility;
  [(MRPlatterViewControllerAccessibility *)&v3 headerViewButtonPressed:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end