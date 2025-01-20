@interface SKUITabBarControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation SKUITabBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUITabBarController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUITabBarController" hasInstanceVariable:@"_floatingOverlayView" withType:"SKUIFloatingOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUITabBarController", @"setFloatingOverlayViewController: animated:", "v", "@", "B", 0);
}

- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SKUITabBarControllerAccessibility;
  [(SKUITabBarControllerAccessibility *)&v6 setFloatingOverlayViewController:a3 animated:a4];
  v5 = [(SKUITabBarControllerAccessibility *)self safeValueForKey:@"_floatingOverlayView"];
  [v5 setAccessibilityIdentifier:@"FloatingPreview"];
}

@end