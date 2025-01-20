@interface SUUIRedeemCameraViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4;
@end

@implementation SUUIRedeemCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIRedeemCameraViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemCameraViewControllerAccessibility;
  [(SUUIRedeemCameraViewControllerAccessibility *)&v7 codeRedeemerController:a3 didEndWithInfo:a4];
  if (([(SUUIRedeemCameraViewControllerAccessibility *)self safeBoolForKey:@"_enabled"] & 1) == 0)
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    v6 = accessibilityLocalizedString(@"redeem.code.validation");
    UIAccessibilityPostNotification(v5, v6);
  }
}

@end