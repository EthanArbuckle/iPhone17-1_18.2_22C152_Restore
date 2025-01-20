@interface AMUIInfographViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5;
@end

@implementation AMUIInfographViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUIInfographViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIInfographViewController", @"launchConfirmationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIInfographViewController", @"_showLaunchConfirmationForApplicationWithBundleIdentifier:withActions:iconView:", "v", "@", "@", "@", 0);
}

- (void)_showLaunchConfirmationForApplicationWithBundleIdentifier:(id)a3 withActions:(id)a4 iconView:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)AMUIInfographViewControllerAccessibility;
  [(AMUIInfographViewControllerAccessibility *)&v12 _showLaunchConfirmationForApplicationWithBundleIdentifier:a3 withActions:a4 iconView:v8];
  if (v8)
  {
    v9 = [(AMUIInfographViewControllerAccessibility *)self safeValueForKey:@"launchConfirmationView"];
    [v9 setIsAccessibilityElementBlock:&__block_literal_global_0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2;
    v10[3] = &unk_2651036F0;
    id v11 = v8;
    [v9 setAccessibilityLabelBlock:v10];
  }
}

uint64_t __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke()
{
  return 1;
}

id __123__AMUIInfographViewControllerAccessibility__showLaunchConfirmationForApplicationWithBundleIdentifier_withActions_iconView___block_invoke_2(uint64_t a1)
{
  v2 = NSString;
  id v3 = accessibilityLocalizedString(@"widget.launched");
  uint64_t v4 = [*(id *)(a1 + 32) accessibilityLabel];
  v5 = (void *)v4;
  v6 = &stru_26F5FE668;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

@end