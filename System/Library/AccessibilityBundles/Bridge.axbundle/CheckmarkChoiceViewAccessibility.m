@interface CheckmarkChoiceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CheckmarkChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CheckmarkChoiceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CheckmarkChoiceView" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"CheckmarkChoiceView" hasInstanceVariable:@"_checkmark" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(CheckmarkChoiceViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_label"];
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)CheckmarkChoiceViewAccessibility;
  unint64_t v3 = [(CheckmarkChoiceViewAccessibility *)&v11 accessibilityTraits];
  objc_opt_class();
  v4 = [(CheckmarkChoiceViewAccessibility *)self safeValueForKey:@"_checkmark"];
  v5 = __UIAccessibilityCastAsClass();

  unint64_t v6 = *MEMORY[0x263F1CEE8] | v3;
  v7 = [v5 image];

  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v6 | v8;

  return v9;
}

@end