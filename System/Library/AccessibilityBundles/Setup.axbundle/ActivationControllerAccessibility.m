@interface ActivationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidLayoutSubviews;
@end

@implementation ActivationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return &stru_26F7B12C0;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)ActivationControllerAccessibility;
  [(ActivationControllerAccessibility *)&v2 viewDidLayoutSubviews];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end