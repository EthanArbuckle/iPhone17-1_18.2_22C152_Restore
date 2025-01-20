@interface ETPaletteCircleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityBounds;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ETPaletteCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETPaletteCircleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETPaletteCircleView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETPaletteCircleView", @"isSelected", "B", 0);
  [v3 validateClass:@"ETPaletteCircleView" isKindOfClass:@"UIView"];
}

- (unint64_t)accessibilityTraits
{
  int v2 = [(ETPaletteCircleViewAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v3 = *MEMORY[0x263F1CF38];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return *MEMORY[0x263F1CEE8] | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  int v2 = [(ETPaletteCircleViewAccessibility *)self backgroundColor];
  uint64_t v3 = [v2 safeValueForKey:@"_accessibilityColorDescription"];

  return v3;
}

- (id)accessibilityHint
{
  v8.receiver = self;
  v8.super_class = (Class)ETPaletteCircleViewAccessibility;
  uint64_t v3 = [(ETPaletteCircleViewAccessibility *)&v8 accessibilityHint];
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)ETPaletteCircleViewAccessibility;
    uint64_t v4 = [(ETPaletteCircleViewAccessibility *)&v7 accessibilityHint];
  }
  else
  {
    uint64_t v4 = accessibilityLocalizedString(@"pallete.circle.hint");
  }
  v5 = (void *)v4;

  return v5;
}

- (CGRect)_accessibilityBounds
{
  v2.receiver = self;
  v2.super_class = (Class)ETPaletteCircleViewAccessibility;
  [(ETPaletteCircleViewAccessibility *)&v2 _accessibilityBounds];
  return CGRectInset(v3, -3.0, -3.0);
}

@end