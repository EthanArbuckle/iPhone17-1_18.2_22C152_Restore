@interface IOSBasedChromeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)mapViewDidFinishLoadingMap:(id)a3;
@end

@implementation IOSBasedChromeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IOSBasedChromeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IOSBasedChromeViewControllerAccessibility;
  [(IOSBasedChromeViewControllerAccessibility *)&v3 mapViewDidFinishLoadingMap:a3];
  UIAccessibilityPostNotification(0xBD4u, 0);
}

@end