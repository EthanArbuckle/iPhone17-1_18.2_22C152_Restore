@interface PKPaymentMoreInformationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation PKPaymentMoreInformationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentMoreInformationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentMoreInformationViewController", @"loadView", "v", 0);
  [v3 validateClass:@"PKPaymentMoreInformationViewController" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentMoreInformationViewControllerAccessibility;
  [(PKPaymentMoreInformationViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(PKPaymentMoreInformationViewControllerAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentMoreInformationViewControllerAccessibility;
  [(PKPaymentMoreInformationViewControllerAccessibility *)&v3 loadView];
  [(PKPaymentMoreInformationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end