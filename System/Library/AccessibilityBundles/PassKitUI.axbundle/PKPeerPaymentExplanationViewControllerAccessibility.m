@interface PKPeerPaymentExplanationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentExplanationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentExplanationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationViewController", @"explanationView", "@", 0);
  [v3 validateClass:@"PKPeerPaymentExplanationViewController" isKindOfClass:@"PKExplanationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationView", @"imageView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentExplanationViewControllerAccessibility;
  [(PKPeerPaymentExplanationViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPeerPaymentExplanationViewControllerAccessibility *)self safeValueForKey:@"explanationView"];
  v4 = [v3 safeValueForKey:@"imageView"];

  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"card.snapshot.label");
  [v4 setAccessibilityLabel:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentExplanationViewControllerAccessibility;
  [(PKPeerPaymentExplanationViewControllerAccessibility *)&v3 viewDidLoad];
  [(PKPeerPaymentExplanationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end