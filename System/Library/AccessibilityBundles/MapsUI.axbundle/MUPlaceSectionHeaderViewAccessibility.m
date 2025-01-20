@interface MUPlaceSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPlaceSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUPlaceSectionHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MUPlaceSectionHeaderView" hasInstanceVariable:@"_seeAllButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MUPlaceSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (id)accessibilityHint
{
  return (id)[(MUPlaceSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_seeAllButton"];
}

- (unint64_t)accessibilityTraits
{
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceSectionHeaderViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEF8] | [(MUPlaceSectionHeaderViewAccessibility *)&v11 accessibilityTraits];
  v4 = [(MUPlaceSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_seeAllButton"];
  v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  uint64_t v8 = *MEMORY[0x263F1CEE8];
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v3 | v8;

  return v9;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MUPlaceSectionHeaderViewAccessibility *)self safeUIViewForKey:@"_seeAllButton"];
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