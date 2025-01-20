@interface SFStartPageCustomizationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityBriefLabel;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SFStartPageCustomizationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFStartPageCustomizationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFStartPageCustomizationCell" hasInstanceVariable:@"_switch" withType:"UISwitch"];
  [v3 validateClass:@"SFStartPageCustomizationCell" isKindOfClass:@"UICollectionViewListCell"];
  [v3 validateClass:@"SFStartPageCustomizationCell" hasInstanceVariable:@"_contentView" withType:"UIView"];
  [v3 validateClass:@"UIListContentView" hasInstanceVariable:@"_textLabel" withType:"UILabel"];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SFStartPageCustomizationCellAccessibility;
  unint64_t v3 = [(SFStartPageCustomizationCellAccessibility *)&v7 accessibilityTraits];
  v4 = [(SFStartPageCustomizationCellAccessibility *)self safeValueForKey:@"_switch"];
  unint64_t v5 = [v4 accessibilityTraits] | v3;

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SFStartPageCustomizationCellAccessibility *)self safeValueForKey:@"_switch"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityValue
{
  v2 = [(SFStartPageCustomizationCellAccessibility *)self safeValueForKey:@"_switch"];
  double v3 = [v2 accessibilityValue];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  double v3 = [(SFStartPageCustomizationCellAccessibility *)self safeValueForKey:@"_switch"];
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCustomizationCellAccessibility;
  double v4 = [(SFStartPageCustomizationCellAccessibility *)&v10 _accessibilitySupplementaryFooterViews];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke;
  v8[3] = &unk_265135FE0;
  id v9 = v3;
  id v5 = v3;
  double v6 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v8);

  return v6;
}

BOOL __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
  v9[3] = &unk_265135FB8;
  id v10 = v3;
  id v5 = v3;
  double v6 = [v4 _accessibilityFindAncestor:v9 startWithSelf:1];
  BOOL v7 = v6 == 0;

  return v7;
}

BOOL __83__SFStartPageCustomizationCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)_accessibilityBriefLabel
{
  return (id)[(SFStartPageCustomizationCellAccessibility *)self safeValueForKeyPath:@"_contentView._textLabel.text"];
}

@end