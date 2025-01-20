@interface PKPassPaymentContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PKPassPaymentContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassPaymentContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerViewAccessibility;
  [(PKPassPaymentContainerViewAccessibility *)&v4 _transitionViewsFromPayState:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end