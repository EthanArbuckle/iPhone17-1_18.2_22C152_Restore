@interface UIPrintPanelViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation UIPrintPanelViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrintPanelViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)UIPrintPanelViewControllerAccessibility;
  [(UIPrintPanelViewControllerAccessibility *)&v5 dismissPrintPanelWithAction:a3 animated:a4 completionHandler:a5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end