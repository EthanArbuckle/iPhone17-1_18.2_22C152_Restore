@interface HUTitleControlCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axControlElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUTitleControlCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTitleControlCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTitleControlCell", @"controlView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTitleControlCell", @"controlTitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(HUTitleControlCellAccessibility *)self safeValueForKey:@"controlTitle"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(HUTitleControlCellAccessibility *)self _axControlElement];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(HUTitleControlCellAccessibility *)self _axControlElement];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(HUTitleControlCellAccessibility *)self _axControlElement];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)_axControlElement
{
  v2 = [(HUTitleControlCellAccessibility *)self safeValueForKey:@"controlView"];
  unint64_t v3 = [v2 _accessibilityFindSubviewDescendant:&__block_literal_global_12];

  return v3;
}

uint64_t __52__HUTitleControlCellAccessibility__axControlElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end