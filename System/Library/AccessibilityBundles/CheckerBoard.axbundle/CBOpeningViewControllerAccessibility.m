@interface CBOpeningViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didTappedStartDiagnosticsButton;
@end

@implementation CBOpeningViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CBOpeningViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didTappedStartDiagnosticsButton
{
  v2.receiver = self;
  v2.super_class = (Class)CBOpeningViewControllerAccessibility;
  [(CBOpeningViewControllerAccessibility *)&v2 didTappedStartDiagnosticsButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end