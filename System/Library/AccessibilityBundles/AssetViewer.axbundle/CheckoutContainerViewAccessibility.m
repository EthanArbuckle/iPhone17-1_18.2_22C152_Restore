@interface CheckoutContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CheckoutContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AssetViewer.CheckoutContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.CheckoutContainerView", @"verticalTextStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.CheckoutContainerView", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CheckoutContainerViewAccessibility;
  [(CheckoutContainerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CheckoutContainerViewAccessibility *)self safeValueForKey:@"verticalTextStackView"];
  [v3 setShouldGroupAccessibilityChildren:1];

  v4 = [(CheckoutContainerViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48]];
}

@end