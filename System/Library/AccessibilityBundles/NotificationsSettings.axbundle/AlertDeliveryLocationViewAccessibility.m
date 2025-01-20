@interface AlertDeliveryLocationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AlertDeliveryLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AlertDeliveryLocationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AlertDeliveryLocationView" hasInstanceVariable:@"_typeLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AlertDeliveryLocationView", @"selected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AlertDeliveryLocationView", @"type", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(AlertDeliveryLocationViewAccessibility *)self safeUnsignedIntegerForKey:@"type"];
  if (v2 > 2) {
    id v3 = &stru_26F756D10;
  }
  else {
    id v3 = off_26513F030[v2];
  }

  return accessibilityLocalizedString(v3);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(AlertDeliveryLocationViewAccessibility *)self safeBoolForKey:@"selected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityIdentifier
{
  uint64_t v2 = [(AlertDeliveryLocationViewAccessibility *)self safeValueForKey:@"_typeLabel"];
  int v3 = [v2 accessibilityLabel];

  return v3;
}

@end