@interface PKPaymentSetupAssistantRegistrationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupAssistantRegistrationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentSetupAssistantRegistrationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentSetupAssistantRegistrationViewController" isKindOfClass:@"PKExplanationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationViewController", @"explanationView", "@", 0);
  [v3 validateClass:@"PKExplanationView" hasInstanceVariable:@"_logoImageView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupAssistantRegistrationViewControllerAccessibility;
  [(PKPaymentSetupAssistantRegistrationViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPaymentSetupAssistantRegistrationViewControllerAccessibility *)self safeValueForKey:@"explanationView"];
  v4 = [v3 safeValueForKey:@"_logoImageView"];

  v5 = accessibilityLocalizedString(@"apple.pay.label");
  [v4 setAccessibilityLabel:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupAssistantRegistrationViewControllerAccessibility;
  [(PKPaymentSetupAssistantRegistrationViewControllerAccessibility *)&v3 viewDidLoad];
  [(PKPaymentSetupAssistantRegistrationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end