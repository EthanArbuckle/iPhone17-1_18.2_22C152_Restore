@interface QLDetailItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6;
@end

@implementation QLDetailItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLDetailItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLDetailItemViewController", @"_setActionButtonView:animated:actionButtonLabel:informationVisible:", "v", "@", "B", "@", "B", 0);
  [v3 validateClass:@"QLDetailItemViewController" hasInstanceVariable:@"_actionIconButton" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)QLDetailItemViewControllerAccessibility;
  [(QLDetailItemViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLDetailItemViewControllerAccessibility *)self safeUIViewForKey:@"_actionIconButton"];
  v4 = [(QLDetailItemViewControllerAccessibility *)self safeUIViewForKey:@"_actionIconButton"];
  v5 = __UIAccessibilitySafeClass();

  objc_msgSend(v3, "setIsAccessibilityElement:", objc_msgSend(v5, "isEnabled"));
}

- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)QLDetailItemViewControllerAccessibility;
  [(QLDetailItemViewControllerAccessibility *)&v7 _setActionButtonView:a3 animated:a4 actionButtonLabel:a5 informationVisible:a6];
  [(QLDetailItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end