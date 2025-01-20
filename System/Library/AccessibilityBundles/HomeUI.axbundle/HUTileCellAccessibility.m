@interface HUTileCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation HUTileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTileCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUTileCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"HomeUI.TileCellContentView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HomeUI.TileCellContentView", @"standardLabels", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUTileCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUTileCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 contentView];
  v4 = [v3 safeArrayForKey:@"standardLabels"];

  v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);

  v6 = AXLabelForElements();

  return v6;
}

uint64_t __45__HUTileCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityViewIsVisible];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)automationElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 contentView];
  v4 = [v3 subviews];

  return v4;
}

@end