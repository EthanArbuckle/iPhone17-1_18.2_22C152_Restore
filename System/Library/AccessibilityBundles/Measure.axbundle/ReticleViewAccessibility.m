@interface ReticleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)axIsFocusedOnRectangle;
- (CGRect)_axFrameForReticleElement;
- (id)_axHintForReticleElement;
- (id)_axLastAnnouncementForReticleState;
- (id)_axReticleElement;
- (id)_axStringForReticleState;
- (id)accessibilityElements;
- (id)axFirstLabelElement;
- (int64_t)_axReticleState;
- (unint64_t)_axTraitsForReticleElement;
- (void)_axAnnounceReticleState;
- (void)_axAnnounceReticleStateAfterDelay;
- (void)_axSetLastAnnouncementForReticleState:(id)a3;
- (void)_axSetReticleElement:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation ReticleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.ReticleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.ReticleView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"setAlpha:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ReticleView", @"setState:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ReticleView", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ReticleView", @"currentDiameter", "f", 0);
}

- (id)axFirstLabelElement
{
  id v3 = AXMeasureLabelView();
  v4 = [v3 _accessibilityLabelElementsWithAccessibilityContainer:self];
  v5 = [v4 firstObject];

  return v5;
}

- (BOOL)axIsFocusedOnRectangle
{
  v2 = AXMeasureAccessibilityStateObserver();
  char v3 = [v2 axHasSuggestedRectangle];

  return v3;
}

- (id)_axReticleElement
{
}

- (void)_axSetReticleElement:(id)a3
{
}

- (id)accessibilityElements
{
  char v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ReticleViewAccessibility *)self _axReticleElement];
  if (!v4)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke;
    v14[3] = &unk_26512F8C8;
    objc_copyWeak(&v15, &location);
    [v4 _setAccessibilityFrameBlock:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_2;
    v12[3] = &unk_26512F8F0;
    objc_copyWeak(&v13, &location);
    [v4 _setAccessibilityLabelBlock:v12];
    [v4 _setAccessibilityValueBlock:&__block_literal_global_2];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_4;
    v10[3] = &unk_26512F8F0;
    objc_copyWeak(&v11, &location);
    [v4 _setAccessibilityHintBlock:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__ReticleViewAccessibility_accessibilityElements__block_invoke_5;
    v8[3] = &unk_26512F938;
    objc_copyWeak(&v9, &location);
    [v4 _setAccessibilityTraitsBlock:v8];
    [(ReticleViewAccessibility *)self _axSetReticleElement:v4];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  [v3 addObject:v4];
  v5 = AXMeasureLabelView();
  v6 = [v5 _accessibilityLabelElementsWithAccessibilityContainer:self];

  if ([v6 count]) {
    [v3 addObjectsFromArray:v6];
  }

  return v3;
}

double __49__ReticleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axFrameForReticleElement];
  double v3 = v2;

  return v3;
}

id __49__ReticleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _axStringForReticleState];

  return v2;
}

id __49__ReticleViewAccessibility_accessibilityElements__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _axHintForReticleElement];

  return v2;
}

uint64_t __49__ReticleViewAccessibility_accessibilityElements__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _axTraitsForReticleElement];

  return v2;
}

- (CGRect)_axFrameForReticleElement
{
  [(ReticleViewAccessibility *)self safeFloatForKey:@"currentDiameter"];
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  [v2 bounds];
  UIRectCenteredRect();

  UIAccessibilityFrameForBounds();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_axHintForReticleElement
{
  v6.receiver = self;
  v6.super_class = (Class)ReticleViewAccessibility;
  double v3 = [(ReticleViewAccessibility *)&v6 accessibilityHint];
  if ([(ReticleViewAccessibility *)self axIsFocusedOnRectangle])
  {
    uint64_t v4 = accessibilityLocalizedString(@"RETICLE_HINT_RECTANGLE");

    double v3 = (void *)v4;
  }

  return v3;
}

- (unint64_t)_axTraitsForReticleElement
{
  return *MEMORY[0x263F1CF68];
}

- (int64_t)_axReticleState
{
  return [(ReticleViewAccessibility *)self safeIntegerForKey:@"state"];
}

- (id)_axStringForReticleState
{
  [(ReticleViewAccessibility *)self _axReticleState];
  double v3 = @"RETICLE_STATE_NONE";
  switch((unint64_t)@"RETICLE_STATE_NONE")
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      if ([(ReticleViewAccessibility *)self axIsFocusedOnRectangle]) {
        double v3 = @"RETICLE_STATE_GOOD_RECTANGLE";
      }
      else {
        double v3 = @"RETICLE_STATE_GOOD";
      }
      goto LABEL_7;
    case 2uLL:
      double v3 = @"RETICLE_STATE_POOR";
      goto LABEL_7;
    case 3uLL:
      double v3 = @"RETICLE_STATE_INVALID";
LABEL_7:
      accessibilityLocalizedString(v3);
      double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v3;
}

- (id)_axLastAnnouncementForReticleState
{
}

- (void)_axSetLastAnnouncementForReticleState:(id)a3
{
}

- (void)_axAnnounceReticleState
{
  id v4 = [(ReticleViewAccessibility *)self _axLastAnnouncementForReticleState];
  double v3 = [(ReticleViewAccessibility *)self _axStringForReticleState];
  if (!v4 || ([v4 isEqualToString:v3] & 1) == 0)
  {
    AXMeasureSpeakMeasurementAnnouncement(v3);
    [(ReticleViewAccessibility *)self _axSetLastAnnouncementForReticleState:v3];
  }
}

- (void)_axAnnounceReticleStateAfterDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__axAnnounceReticleState object:0];

  [(ReticleViewAccessibility *)self performSelector:sel__axAnnounceReticleState withObject:0 afterDelay:0.3];
}

- (void)setState:(int64_t)a3
{
  int64_t v5 = [(ReticleViewAccessibility *)self _axReticleState];
  v9.receiver = self;
  v9.super_class = (Class)ReticleViewAccessibility;
  [(ReticleViewAccessibility *)&v9 setState:a3];
  if (v5 != a3)
  {
    objc_opt_class();
    objc_super v6 = __UIAccessibilityCastAsClass();
    [v6 alpha];
    double v8 = v7;

    if (v8 >= 1.0) {
      [(ReticleViewAccessibility *)self _axAnnounceReticleStateAfterDelay];
    }
  }
}

- (void)setAlpha:(double)a3
{
  char v9 = 0;
  objc_opt_class();
  int64_t v5 = __UIAccessibilityCastAsClass();
  [v5 alpha];
  double v7 = v6;

  v8.receiver = self;
  v8.super_class = (Class)ReticleViewAccessibility;
  [(ReticleViewAccessibility *)&v8 setAlpha:a3];
  if (a3 >= 1.0 && v7 <= 0.0) {
    [(ReticleViewAccessibility *)self _axAnnounceReticleStateAfterDelay];
  }
}

@end