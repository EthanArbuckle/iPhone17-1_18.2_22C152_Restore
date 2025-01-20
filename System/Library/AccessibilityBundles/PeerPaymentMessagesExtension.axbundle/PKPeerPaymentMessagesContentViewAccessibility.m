@interface PKPeerPaymentMessagesContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPeerPaymentMessagesContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentMessagesContentView";
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
  v6.super_class = (Class)PKPeerPaymentMessagesContentViewAccessibility;
  [(PKPeerPaymentMessagesContentViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(PKPeerPaymentMessagesContentViewAccessibility *)self safeValueForKey:@"_imageView"];
  [v3 setIsAccessibilityElement:1];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:v4 & ~*MEMORY[0x263F1CF00]];
  v5 = accessibilityPeerPaymentLocalizedString(@"apple.pay.logo");
  [v3 setAccessibilityLabel:v5];
}

@end