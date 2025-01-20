@interface PKProvisioningProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKProvisioningProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKProvisioningProgressView";
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
  v6.super_class = (Class)PKProvisioningProgressViewAccessibility;
  [(PKProvisioningProgressViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(PKProvisioningProgressViewAccessibility *)self safeUIViewForKey:@"_primaryLabel"];
  [v4 setAccessibilityTraits:v3];

  v5 = [(PKProvisioningProgressViewAccessibility *)self safeUIViewForKey:@"_primaryLabel"];
  [v5 _accessibilitySetTextViewShouldBreakUpParagraphs:0];
}

@end