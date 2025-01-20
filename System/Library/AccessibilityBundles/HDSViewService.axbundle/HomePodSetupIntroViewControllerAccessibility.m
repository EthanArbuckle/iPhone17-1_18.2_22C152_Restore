@interface HomePodSetupIntroViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)handleTapOnInfoButton;
@end

@implementation HomePodSetupIntroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HDSViewService.HomePodSetupIntroViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)handleTapOnInfoButton
{
  v2.receiver = self;
  v2.super_class = (Class)HomePodSetupIntroViewControllerAccessibility;
  [(HomePodSetupIntroViewControllerAccessibility *)&v2 handleTapOnInfoButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end