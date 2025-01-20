@interface SBUIRemoteAlertServiceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation SBUIRemoteAlertServiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIRemoteAlertServiceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIRemoteAlertServiceViewControllerAccessibility;
  [(SBUIRemoteAlertServiceViewControllerAccessibility *)&v4 prepareForActivationWithContext:a3 completion:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
}

@end