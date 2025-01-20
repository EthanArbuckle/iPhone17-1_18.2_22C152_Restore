@interface SUUIViewElementSlideshowControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentFromParentViewController:(id)a3;
@end

@implementation SUUIViewElementSlideshowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIViewElementSlideshowController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)presentFromParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewElementSlideshowControllerAccessibility;
  [(SUUIViewElementSlideshowControllerAccessibility *)&v3 presentFromParentViewController:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end