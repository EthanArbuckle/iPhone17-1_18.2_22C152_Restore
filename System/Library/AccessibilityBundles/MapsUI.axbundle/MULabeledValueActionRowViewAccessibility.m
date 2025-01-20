@interface MULabeledValueActionRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MULabeledValueActionRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MULabeledValueActionRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MULabeledValueActionRowView" hasInstanceVariable:@"_titleLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MULabeledValueActionRowView" hasInstanceVariable:@"_valueLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MULabeledValueActionRowView" hasInstanceVariable:@"_tertiaryLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MULabeledValueActionRowView" hasInstanceVariable:@"_actionPlatterView" withType:"MUCirclePlatterView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MULabeledValueActionRowViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _valueLabel, _tertiaryLabel"];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)MULabeledValueActionRowViewAccessibility;
  unint64_t v3 = [(MULabeledValueActionRowViewAccessibility *)&v7 accessibilityTraits];
  v4 = [(MULabeledValueActionRowViewAccessibility *)self safeValueForKey:@"_actionPlatterView"];

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MULabeledValueActionRowViewAccessibility *)self safeValueForKey:@"_actionPlatterView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end