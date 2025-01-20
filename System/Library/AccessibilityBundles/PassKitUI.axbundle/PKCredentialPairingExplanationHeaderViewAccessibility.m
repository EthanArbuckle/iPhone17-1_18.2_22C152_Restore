@interface PKCredentialPairingExplanationHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKCredentialPairingExplanationHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCredentialPairingExplanationHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)PKCredentialPairingExplanationHeaderViewAccessibility;
  [(PKCredentialPairingExplanationHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(PKCredentialPairingExplanationHeaderViewAccessibility *)self safeUIViewForKey:@"_imageView"];
  [v3 setIsAccessibilityElement:1];

  v4 = accessibilityLocalizedStringAlisha(@"car.pairing.instructions");
  v5 = [(PKCredentialPairingExplanationHeaderViewAccessibility *)self safeUIViewForKey:@"_imageView"];
  [v5 setAccessibilityLabel:v4];
}

@end