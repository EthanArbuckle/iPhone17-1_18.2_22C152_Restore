@interface CEKExpandingSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsSliderExpanded;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (double)_axCurrentSliderValue;
- (double)_axMaximumValue;
- (double)_axMinimumValue;
- (id)_axSemanticStyle;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
- (void)_axChangeValueInDirection:(int64_t)a3 withLargeStep:(BOOL)a4;
- (void)_handleExpansionAnimationTimerFired:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CEKExpandingSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKExpandingSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_valueLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_levelIndicatorView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_handleExpansionAnimationTimerFired:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_setExpanded:animated:shouldNotify:", "v", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"setValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"expanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKExpandingSlider", @"_slider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"value", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"maximumValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"minimumValue", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CEKExpandingSliderAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
  id v3 = [v2 localizedLowercaseString];

  return v3;
}

- (id)accessibilityValue
{
  return (id)[(CEKExpandingSliderAccessibility *)self _accessibilityStringForLabelKeyValues:@"_valueLabel"];
}

- (CGRect)accessibilityFrame
{
  v24.receiver = self;
  v24.super_class = (Class)CEKExpandingSliderAccessibility;
  [(CEKExpandingSliderAccessibility *)&v24 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(CEKExpandingSliderAccessibility *)self _axIsSliderExpanded])
  {
    v11 = (void *)MEMORY[0x263EFF8C0];
    v12 = [(CEKExpandingSliderAccessibility *)self safeValueForKey:@"_titleLabel"];
    v13 = [(CEKExpandingSliderAccessibility *)self safeValueForKey:@"_valueLabel"];
    v14 = [(CEKExpandingSliderAccessibility *)self safeUIViewForKey:@"_levelIndicatorView"];
    v15 = objc_msgSend(v11, "axArrayByIgnoringNilElementsWithCount:", 3, v12, v13, v14);

    UIAXFrameForElements();
    double v4 = v16;
    double v6 = v17;
    double v8 = v18;
    double v10 = v19;
  }
  double v20 = v4;
  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)accessibilityActivate
{
  if ([(CEKExpandingSliderAccessibility *)self _axIsSliderExpanded])
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    double v7 = __56__CEKExpandingSliderAccessibility_accessibilityActivate__block_invoke;
    double v8 = &unk_26509F038;
    double v9 = self;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CEKExpandingSliderAccessibility;
    return [(CEKExpandingSliderAccessibility *)&v4 accessibilityActivate];
  }
}

void __56__CEKExpandingSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setExpanded:0 animated:1 shouldNotify:1];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];
  double v3 = *(void **)(a1 + 32);

  UIAccessibilityPostNotification(v2, v3);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CEKExpandingSliderAccessibility;
  unint64_t v3 = [(CEKExpandingSliderAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(CEKExpandingSliderAccessibility *)self _axIsSliderExpanded];
  uint64_t v5 = *MEMORY[0x263F1CED8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 1) {
    -[CEKExpandingSliderAccessibility _axChangeValueInDirection:withLargeStep:](self, "_axChangeValueInDirection:withLargeStep:");
  }
  return v3 < 2;
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CEKExpandingSliderAccessibility *)self _axIsSliderExpanded]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_handleExpansionAnimationTimerFired:(id)a3
{
  id v4 = a3;
  if (![(CEKExpandingSliderAccessibility *)self _axIsSliderExpanded]
    || !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)CEKExpandingSliderAccessibility;
    [(CEKExpandingSliderAccessibility *)&v5 _handleExpansionAnimationTimerFired:v4];
  }
}

- (void)_axChangeValueInDirection:(int64_t)a3 withLargeStep:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = [(CEKExpandingSliderAccessibility *)self _axSemanticStyle];
  double v8 = [v7 safeStringForKey:@"displayName"];

  double v9 = 1.0;
  if (v4) {
    double v9 = 10.0;
  }
  if (a3 == 1)
  {
    double v10 = (double *)&v14;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v11 = __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke_2;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_8;
    }
    double v10 = (double *)v16;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v11 = __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke;
  }
  *((void *)v10 + 2) = v11;
  *((void *)v10 + 3) = &unk_26509F060;
  *((void *)v10 + 4) = self;
  v10[5] = v9;
  AXPerformSafeBlock();
LABEL_8:
  v12 = [(CEKExpandingSliderAccessibility *)self _axSemanticStyle];
  v13 = [v12 safeStringForKey:@"displayName"];

  if (([v8 isEqualToString:v13] & 1) == 0) {
    UIAccessibilitySpeakOrQueueIfNeeded();
  }
}

uint64_t __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axCurrentSliderValue];
  double v3 = v2;
  [*(id *)(a1 + 32) _axMaximumValue];
  if (v3 < v4) {
    double v3 = v3 + *(double *)(a1 + 40) * 0.01;
  }
  [*(id *)(a1 + 32) setValue:v3];
  objc_super v5 = *(void **)(a1 + 32);

  return [v5 sendActionsForControlEvents:4096];
}

uint64_t __75__CEKExpandingSliderAccessibility__axChangeValueInDirection_withLargeStep___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _axCurrentSliderValue];
  double v3 = v2;
  [*(id *)(a1 + 32) _axMinimumValue];
  if (v3 > v4) {
    double v3 = v3 + *(double *)(a1 + 40) * -0.01;
  }
  [*(id *)(a1 + 32) setValue:v3];
  objc_super v5 = *(void **)(a1 + 32);

  return [v5 sendActionsForControlEvents:4096];
}

- (BOOL)_axIsSliderExpanded
{
  return [(CEKExpandingSliderAccessibility *)self safeBoolForKey:@"expanded"];
}

- (double)_axCurrentSliderValue
{
  double v2 = [(CEKExpandingSliderAccessibility *)self safeValueForKey:@"_slider"];
  [v2 safeCGFloatForKey:@"value"];
  double v4 = v3;

  return v4;
}

- (double)_axMinimumValue
{
  double v2 = [(CEKExpandingSliderAccessibility *)self safeValueForKey:@"_slider"];
  [v2 safeCGFloatForKey:@"minimumValue"];
  double v4 = v3;

  return v4;
}

- (double)_axMaximumValue
{
  double v2 = [(CEKExpandingSliderAccessibility *)self safeValueForKey:@"_slider"];
  [v2 safeCGFloatForKey:@"maximumValue"];
  double v4 = v3;

  return v4;
}

- (id)_axSemanticStyle
{
  double v2 = [(CEKExpandingSliderAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E1420](@"CAMSemanticStyleControl", a2)];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 safeValueForKey:@"semanticStyle"];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

@end