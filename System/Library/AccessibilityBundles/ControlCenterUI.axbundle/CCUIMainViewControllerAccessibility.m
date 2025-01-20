@interface CCUIMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CCUIMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIMainViewControllerAccessibility;
  [(CCUIMainViewControllerAccessibility *)&v4 viewDidAppear:a3];
  v3 = accessibilityLocalizedString(@"control.center.showing");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIMainViewControllerAccessibility;
  [(CCUIMainViewControllerAccessibility *)&v3 viewDidDisappear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end