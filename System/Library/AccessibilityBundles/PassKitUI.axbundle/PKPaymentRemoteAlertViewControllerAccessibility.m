@interface PKPaymentRemoteAlertViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentRemoteAlertViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentRemoteAlertViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentRemoteAlertViewControllerAccessibility;
  [(PKPaymentRemoteAlertViewControllerAccessibility *)&v3 viewWillAppear:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __66__PKPaymentRemoteAlertViewControllerAccessibility_viewWillAppear___block_invoke()
{
}

@end