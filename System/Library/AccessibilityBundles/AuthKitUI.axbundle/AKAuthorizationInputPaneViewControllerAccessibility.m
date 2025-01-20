@interface AKAuthorizationInputPaneViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_clearButton;
@end

@implementation AKAuthorizationInputPaneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKAuthorizationInputPaneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_clearButton
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationInputPaneViewControllerAccessibility;
  v2 = [(AKAuthorizationInputPaneViewControllerAccessibility *)&v4 _clearButton];
  [v2 _setAccessibilityLabelBlock:&__block_literal_global];

  return v2;
}

id __67__AKAuthorizationInputPaneViewControllerAccessibility__clearButton__block_invoke()
{
  return accessibilityLocalizedString(@"clear.button");
}

@end