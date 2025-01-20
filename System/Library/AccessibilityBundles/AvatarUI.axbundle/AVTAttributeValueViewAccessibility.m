@interface AVTAttributeValueViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AVTAttributeValueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAttributeValueView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeValueView", @"selectionLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CALayer", @"opacity", "f", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeValueViewAccessibility;
  v2 = [(AVTAttributeValueViewAccessibility *)&v5 accessibilityLabel];
  if (![v2 rangeOfString:@"EARRINGS_"])
  {
    uint64_t v3 = accessibilityLocalizedString(v2);

    v2 = (void *)v3;
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)AVTAttributeValueViewAccessibility;
  unint64_t v3 = [(AVTAttributeValueViewAccessibility *)&v9 accessibilityTraits];
  v4 = [(AVTAttributeValueViewAccessibility *)self safeValueForKey:@"selectionLayer"];
  [v4 safeFloatForKey:@"opacity"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (v6 <= 0.0) {
    uint64_t v5 = 0;
  }
  unint64_t v7 = v5 | v3;

  return v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end