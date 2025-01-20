@interface CAMZoomControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsVerticalAdjustableElement;
- (BOOL)_axHandleZoomControlActivate;
- (BOOL)_axIsZoomToggleOnly;
- (BOOL)accessibilityActivate;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (double)_axDisplayZoomValue;
- (double)_axMaximumZoomFactor;
- (double)_axMinimumZoomFactor;
- (double)_axRoundedZoomFactor:(double)a3;
- (double)_axZoomFactor;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (int64_t)_axZoomControlMode;
- (unint64_t)accessibilityTraits;
- (void)_axSetZoomFactorForDisplayValue:(double)a3;
- (void)_setAXZoomFactor:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CAMZoomControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMZoomControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"zoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_displayMaximumZoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_displayMinimumZoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"displayZoomValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_setZoomFactor:interactionType:shouldNotifyDelegate:", "v", "d", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"continueTrackingWithTouch: withEvent:", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomFactorForDisplayZoomValue:", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_handleButtonTapped:forAccessoryTap:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_displayZoomFactors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_isButtonPlatterSupportedForConfiguration", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_buttonPlatter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomButtonPlatter", @"_allButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomButtonPlatter", @"zoomFactorButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomButtonPlatter", @"isCollapsed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"zoomButtonContentType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"zoomButtonSymbol", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomControlMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"orientation", "q", 0);
  [v3 validateClass:@"CAMZoomPoint"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CAMZoomPoint", @"significantIndexesInZoomPoints:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomPoints", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"_zoomFactors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomControl", @"zoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomPoint", @"displayZoomFactor", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMZoomButton", @"_focalLengthLabel", "@", 0);
}

- (double)_axDisplayZoomValue
{
  [(CAMZoomControlAccessibility *)self safeCGFloatForKey:@"displayZoomValue"];
  return result;
}

- (double)_axMaximumZoomFactor
{
  [(CAMZoomControlAccessibility *)self safeCGFloatForKey:@"_displayMaximumZoomFactor"];
  return result;
}

- (double)_axMinimumZoomFactor
{
  [(CAMZoomControlAccessibility *)self safeCGFloatForKey:@"_displayMinimumZoomFactor"];
  return result;
}

- (void)_axSetZoomFactorForDisplayValue:(double)a3
{
}

uint64_t __63__CAMZoomControlAccessibility__axSetZoomFactorForDisplayValue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 _axRoundedZoomFactor:*(double *)(a1 + 40)];
  objc_msgSend(v2, "_zoomFactorForDisplayZoomValue:");
  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_setZoomFactor:interactionType:shouldNotifyDelegate:", 1, 1);
}

- (int64_t)_axZoomControlMode
{
  return [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"_zoomControlMode"];
}

- (BOOL)_axIsZoomToggleOnly
{
  return [(CAMZoomControlAccessibility *)self _axZoomControlMode] == 3
      || [(CAMZoomControlAccessibility *)self _axZoomControlMode] == 4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonContentType"];
  if (!v3)
  {
    v4 = @"bravo.zoomcontrol";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = @"ffc.zoomcontrol";
LABEL_5:
    v5 = accessibilityCameraUILocalizedString(v4);
    goto LABEL_7;
  }
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  v5 = [(CAMZoomControlAccessibility *)&v7 accessibilityLabel];
LABEL_7:

  return v5;
}

- (id)accessibilityValue
{
  if ([(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonContentType"] != 1)
  {
    [(CAMZoomControlAccessibility *)self _axDisplayZoomValue];
    v5 = AXFormatMagnificationFactor();
    goto LABEL_9;
  }
  uint64_t v3 = [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonSymbol"];
  if (v3 == 1)
  {
    v4 = @"zoomed.in";
    goto LABEL_7;
  }
  if (!v3)
  {
    v4 = @"zoomed.out";
LABEL_7:
    v5 = accessibilityCameraUILocalizedString(v4);
    goto LABEL_9;
  }
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  v5 = [(CAMZoomControlAccessibility *)&v7 accessibilityValue];
LABEL_9:

  return v5;
}

- (void)accessibilityIncrement
{
  [(CAMZoomControlAccessibility *)self _axMaximumZoomFactor];
  double v4 = v3;
  [(CAMZoomControlAccessibility *)self _axDisplayZoomValue];
  if (v5 + 0.1 <= v4)
  {
    -[CAMZoomControlAccessibility _axSetZoomFactorForDisplayValue:](self, "_axSetZoomFactorForDisplayValue:");
  }
}

- (void)accessibilityDecrement
{
  [(CAMZoomControlAccessibility *)self _axMinimumZoomFactor];
  double v4 = v3;
  [(CAMZoomControlAccessibility *)self _axDisplayZoomValue];
  if (v5 + -0.1 >= v4)
  {
    -[CAMZoomControlAccessibility _axSetZoomFactorForDisplayValue:](self, "_axSetZoomFactorForDisplayValue:");
  }
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(CAMZoomControlAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CAMZoomControlAccessibility *)self safeBoolForKey:@"_zoomDialEnabled"];
  uint64_t v5 = *MEMORY[0x263F1CED8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityHint
{
  unint64_t v3 = @"zoom.toggle.hint";
  if ([(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonContentType"] == 1)
  {
    uint64_t v4 = [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonSymbol"];
    uint64_t v5 = @"zoomed.in.hint";
    if (v4) {
      uint64_t v5 = @"zoom.toggle.hint";
    }
    if (v4 == 1) {
      unint64_t v3 = @"zoomed.out.hint";
    }
    else {
      unint64_t v3 = v5;
    }
  }
  v6 = accessibilityCameraUILocalizedString(v3);

  return v6;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonContentType"];
  if ([(CAMZoomControlAccessibility *)self safeBoolForKey:@"_isButtonPlatterSupportedForConfiguration"])
  {
    uint64_t v4 = [(CAMZoomControlAccessibility *)self safeValueForKey:@"_buttonPlatter"];
    uint64_t v5 = [v4 safeArrayForKey:@"_allButtons"];
    v6 = [v4 safeValueForKey:@"zoomFactorButton"];
    objc_super v7 = [(CAMZoomControlAccessibility *)self safeValueForKey:@"_zoomPoints"];
    v8 = [(CAMZoomControlAccessibility *)self safeValueForKey:@"_zoomFactors"];
    [(CAMZoomControlAccessibility *)self safeCGFloatForKey:@"zoomFactor"];
    if (v5)
    {
      v9 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v8, "count"), 1280, &__block_literal_global_18);

      uint64_t v11 = [v5 indexOfObject:v6];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = v11;
        v13 = [v8 objectAtIndexedSubscript:v10];
        if ([v8 count] <= (unint64_t)(v10 + 1)) {
          uint64_t v14 = v10;
        }
        else {
          uint64_t v14 = v10 + 1;
        }
        v15 = [v8 objectAtIndexedSubscript:v14];
        [v13 doubleValue];
        double v17 = v16;
        [v15 doubleValue];
        double v19 = v18;
        LODWORD(v20) = floor(v18) > floor(v17);
        if (v18 == v17) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v20;
        }
        uint64_t v21 = v12 + v20;
        if (v21 == [v5 count]) {
          uint64_t v21 = 0;
        }
        v22 = [v5 objectAtIndexedSubscript:v21];
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        v32 = __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke_2;
        v33 = &unk_2650A0358;
        uint64_t v38 = v21;
        id v34 = v8;
        double v39 = v19;
        double v40 = v17;
        id v35 = v7;
        id v36 = v4;
        v37 = self;
        id v23 = v22;
        AXPerformSafeBlock();
      }
    }

    return 1;
  }
  if (v3 == 1)
  {
    v29.receiver = self;
    v29.super_class = (Class)CAMZoomControlAccessibility;
    BOOL v24 = [(CAMZoomControlAccessibility *)&v29 accessibilityActivate];
    uint64_t v25 = [(CAMZoomControlAccessibility *)self safeIntegerForKey:@"zoomButtonSymbol"];
    if (v25)
    {
      if (v25 != 1)
      {
        v28 = 0;
        goto LABEL_24;
      }
      v26 = @"zoomed.out";
    }
    else
    {
      v26 = @"zoomed.in";
    }
    v28 = accessibilityCameraUILocalizedString(v26);
LABEL_24:
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    return v24;
  }

  return [(CAMZoomControlAccessibility *)self _axHandleZoomControlActivate];
}

uint64_t __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __52__CAMZoomControlAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 72) + 1;
  uint64_t v3 = *(void **)(a1 + 32);
  if ([v3 count] <= v2) {
    unint64_t v2 = *(void *)(a1 + 72);
  }
  id v18 = [v3 objectAtIndexedSubscript:v2];
  [v18 doubleValue];
  double v4 = floor(*(double *)(a1 + 80));
  double v6 = floor(v5);
  if (v4 > floor(*(double *)(a1 + 88)) && v4 == v6)
  {
    unint64_t v9 = *(void *)(a1 + 72);
    BOOL v8 = v9 < [*(id *)(a1 + 40) count];
  }
  else
  {
    BOOL v8 = 0;
  }
  int v10 = [*(id *)(a1 + 48) safeBoolForKey:@"isCollapsed"];
  if (v8 || v10)
  {
    uint64_t v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 72)];
    uint64_t v12 = *(void **)(a1 + 56);
    [v11 safeCGFloatForKey:@"displayZoomFactor"];
    objc_msgSend(v12, "_axSetZoomFactorForDisplayValue:");
  }
  else
  {
    [*(id *)(a1 + 56) _handleButtonTapped:*(void *)(a1 + 64) forAccessoryTap:0];
  }
  [*(id *)(a1 + 56) _axDisplayZoomValue];
  v13 = [*(id *)(a1 + 48) safeValueForKey:@"zoomFactorButton"];
  uint64_t v14 = [v13 safeValueForKey:@"_focalLengthLabel"];
  v15 = [v14 accessibilityLabel];
  double v17 = AXFormatMagnificationFactor();
  double v16 = __UIAXStringForVariables();
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (BOOL)_axHandleZoomControlActivate
{
  return 1;
}

void __59__CAMZoomControlAccessibility__axHandleZoomControlActivate__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"_zoomButton"];
  [*(id *)(a1 + 32) _handleButtonTapped:v3 forAccessoryTap:0];
  [*(id *)(a1 + 32) _axDisplayZoomValue];
  unint64_t v2 = AXFormatMagnificationFactor();
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(CAMZoomControlAccessibility *)self safeBoolForKey:@"_isButtonPlatterSupportedForConfiguration"])id v3 = @"_buttonPlatter"; {
  else
  }
    id v3 = @"_zoomButton";
  double v4 = [(CAMZoomControlAccessibility *)self safeValueForKey:v3];
  [v4 accessibilityActivationPoint];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)_axZoomFactor
{
  MEMORY[0x270F09628](self, &__CAMZoomControlAccessibility___axZoomFactor);
  return result;
}

- (void)_setAXZoomFactor:(double)a3
{
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomControlAccessibility;
  BOOL v5 = [(CAMZoomControlAccessibility *)&v7 continueTrackingWithTouch:a3 withEvent:a4];
  [(CAMZoomControlAccessibility *)self _axDisplayZoomValue];
  AXPerformSafeBlock();
  return v5;
}

void __67__CAMZoomControlAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axRoundedZoomFactor:*(double *)(a1 + 40)];
  double v3 = v2;
  [*(id *)(a1 + 32) _axZoomFactor];
  if (v3 != v4)
  {
    [*(id *)(a1 + 32) _setAXZoomFactor:v3];
    AXFormatMagnificationFactor();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();
  }
}

- (double)_axRoundedZoomFactor:(double)a3
{
  return round(a3 * 10.0) / 10.0 + 0.000001;
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return (unint64_t)([(CAMZoomControlAccessibility *)self safeIntegerForKey:@"orientation"]- 3) < 2;
}

- (id)automationElements
{
  double v2 = (void *)MEMORY[0x263EFF8C0];
  double v3 = [(CAMZoomControlAccessibility *)self safeValueForKey:@"_buttonPlatter"];
  double v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end