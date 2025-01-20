@interface PosterEditingConfirmationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPresentedControllerModalizes;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PosterEditingConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoard.PosterEditingConfirmationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PosterBoard.PosterEditingConfirmationViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PosterBoard.PosterEditingConfirmationViewController" hasSwiftFieldOfAnyClass:@"continueButton"];
}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PosterEditingConfirmationViewControllerAccessibility;
  [(PosterEditingConfirmationViewControllerAccessibility *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  v5 = [(PosterEditingConfirmationViewControllerAccessibility *)self safeSwiftValueForKey:@"continueButton"];
  UIAccessibilityPostNotification(v4, v5);
}

@end