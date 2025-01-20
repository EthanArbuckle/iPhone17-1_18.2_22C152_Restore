@interface AKInkSignatureViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axDirectTouchTimer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)_axStopDirectTouch;
- (void)_setAXDirectTouchTimer:(id)a3;
- (void)canvasViewDidStartNewStroke:(id)a3;
- (void)canvasViewDrawingDidChange:(id)a3;
@end

@implementation AKInkSignatureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKInkSignatureView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AKInkSignatureView" conformsToProtocol:@"PKCanvasViewDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKInkSignatureView", @"canvasViewDrawingDidChange:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"signature.label");
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"signature.hint");
}

- (id)_axDirectTouchTimer
{
}

- (void)_setAXDirectTouchTimer:(id)a3
{
}

- (BOOL)accessibilityActivate
{
  id v3 = [(AKInkSignatureViewAccessibility *)self _axDirectTouchTimer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F22868]);
    v5 = (void *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(AKInkSignatureViewAccessibility *)self _setAXDirectTouchTimer:v5];
  }
  [(AKInkSignatureViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CEE0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  v6 = [(AKInkSignatureViewAccessibility *)self _axDirectTouchTimer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__AKInkSignatureViewAccessibility_accessibilityActivate__block_invoke;
  v8[3] = &unk_265103FC0;
  v8[4] = self;
  [v6 afterDelay:v8 processBlock:3.0];

  return 1;
}

uint64_t __56__AKInkSignatureViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axStopDirectTouch];
}

- (void)_axStopDirectTouch
{
  v2 = self;
  [(AKInkSignatureViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF18]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v2);
  LODWORD(v2) = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"signature.drawing.ended");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2 = -1.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)canvasViewDidStartNewStroke:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKInkSignatureViewAccessibility;
  [(AKInkSignatureViewAccessibility *)&v5 canvasViewDidStartNewStroke:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  id v4 = accessibilityLocalizedString(@"signature.drawing.began");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureViewAccessibility;
  [(AKInkSignatureViewAccessibility *)&v6 canvasViewDrawingDidChange:a3];
  id v4 = [(AKInkSignatureViewAccessibility *)self _axDirectTouchTimer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__AKInkSignatureViewAccessibility_canvasViewDrawingDidChange___block_invoke;
  v5[3] = &unk_265103FC0;
  v5[4] = self;
  [v4 afterDelay:v5 processBlock:3.0];
}

uint64_t __62__AKInkSignatureViewAccessibility_canvasViewDrawingDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axStopDirectTouch];
}

@end