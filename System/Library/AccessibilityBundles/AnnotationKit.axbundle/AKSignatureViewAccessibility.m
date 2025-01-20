@interface AKSignatureViewAccessibility
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
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AKSignatureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKSignatureView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSignatureView", @"touchesBegan: withEvent:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKSignatureView", @"touchesMoved: withEvent:", "v", "@", "@", 0);
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
  id v3 = [(AKSignatureViewAccessibility *)self _axDirectTouchTimer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F22868]);
    v5 = (void *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(AKSignatureViewAccessibility *)self _setAXDirectTouchTimer:v5];
  }
  [(AKSignatureViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CEE0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  v6 = [(AKSignatureViewAccessibility *)self _axDirectTouchTimer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__AKSignatureViewAccessibility_accessibilityActivate__block_invoke;
  v8[3] = &unk_265103FC0;
  v8[4] = self;
  [v6 afterDelay:v8 processBlock:3.0];

  return 1;
}

uint64_t __53__AKSignatureViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axStopDirectTouch];
}

- (void)_axStopDirectTouch
{
  v2 = self;
  [(AKSignatureViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF18]];
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

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureViewAccessibility;
  [(AKSignatureViewAccessibility *)&v6 touchesBegan:a3 withEvent:a4];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  v5 = accessibilityLocalizedString(@"signature.drawing.began");
  UIAccessibilityPostNotification(v4, v5);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKSignatureViewAccessibility;
  [(AKSignatureViewAccessibility *)&v7 touchesMoved:a3 withEvent:a4];
  v5 = [(AKSignatureViewAccessibility *)self _axDirectTouchTimer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__AKSignatureViewAccessibility_touchesMoved_withEvent___block_invoke;
  v6[3] = &unk_265103FC0;
  v6[4] = self;
  [v5 afterDelay:v6 processBlock:3.0];
}

uint64_t __55__AKSignatureViewAccessibility_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axStopDirectTouch];
}

@end