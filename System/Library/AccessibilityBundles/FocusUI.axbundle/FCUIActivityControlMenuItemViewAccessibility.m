@interface FCUIActivityControlMenuItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FCUIActivityControlMenuItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCUIActivityControlMenuItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FCUIActivityControlMenuItemView" hasInstanceVariable:@"_activationDescriptionLabel" withType:"UILabel"];
  [v3 validateClass:@"FCUIActivityControlMenuItemView" hasInstanceVariable:@"_activationDetailsLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityControlMenuItemView", @"isSelected", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FCUIActivityControlMenuItemViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_activationDescriptionLabel, _activationDetailsLabel"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(FCUIActivityControlMenuItemViewAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

@end