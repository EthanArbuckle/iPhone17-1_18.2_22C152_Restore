@interface SKUIRedeemCameraViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)codeRedeemerController:(id)a3 didEndWithInfo:(id)a4;
@end

@implementation SKUIRedeemCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIRedeemCameraViewController";
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
  v7.super_class = (Class)SKUIRedeemCameraViewControllerAccessibility;
  [(SKUIRedeemCameraViewControllerAccessibility *)&v7 codeRedeemerController:a3 didEndWithInfo:a4];
  if (([(SKUIRedeemCameraViewControllerAccessibility *)self safeBoolForKey:@"_enabled"] & 1) == 0)
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    v6 = accessibilitySKUILocalizedString(@"redeem.code.validation");
    UIAccessibilityPostNotification(v5, v6);
  }
}

@end