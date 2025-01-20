@interface SUUIProductPageOverlayControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_showOverlayViewController;
@end

@implementation SUUIProductPageOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageOverlayController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_showOverlayViewController
{
  v2.receiver = self;
  v2.super_class = (Class)SUUIProductPageOverlayControllerAccessibility;
  [(SUUIProductPageOverlayControllerAccessibility *)&v2 _showOverlayViewController];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end