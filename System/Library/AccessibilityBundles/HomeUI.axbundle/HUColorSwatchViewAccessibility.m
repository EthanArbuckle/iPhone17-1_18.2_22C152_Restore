@interface HUColorSwatchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation HUColorSwatchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUColorSwatchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorSwatchView", @"selectionState", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorSwatchView", @"color", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityPath
{
  [(HUColorSwatchViewAccessibility *)self accessibilityFrame];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  v6 = (void *)MEMORY[0x263F1C478];
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v14) * 0.5;

  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  uint64_t v3 = [(HUColorSwatchViewAccessibility *)self safeUnsignedIntegerForKey:@"selectionState"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (v3 != 2) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  uint64_t v3 = [(HUColorSwatchViewAccessibility *)self safeValueForKey:@"color"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  v5 = AXColorStringForColor();

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(@"colorswatch.selected.hint");
}

@end