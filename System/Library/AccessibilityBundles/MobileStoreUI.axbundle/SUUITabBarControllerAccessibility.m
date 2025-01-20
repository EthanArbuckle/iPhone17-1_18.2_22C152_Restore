@interface SUUITabBarControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation SUUITabBarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUITabBarController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUITabBarController" hasInstanceVariable:@"_floatingOverlayView" withType:"SUUIFloatingOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUITabBarController", @"setFloatingOverlayViewController: animated:", "v", "@", "B", 0);
}

- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUUITabBarControllerAccessibility;
  [(SUUITabBarControllerAccessibility *)&v6 setFloatingOverlayViewController:a3 animated:a4];
  v5 = [(SUUITabBarControllerAccessibility *)self safeValueForKey:@"_floatingOverlayView"];
  [v5 setAccessibilityIdentifier:@"FloatingPreview"];
}

@end