@interface DKInkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDirectTouchable;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_axDirectTouchTimer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axInvalidateTimerAndReschedule:(BOOL)a3;
- (void)_axSetDirectTouchTimer:(id)a3;
- (void)_axSetIsDirectTouchable:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DKInkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DKInkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsDirectTouchable
{
  return MEMORY[0x270F0A438](self, &__DKInkView___axIsDirectTouchable);
}

- (void)_axSetIsDirectTouchable:(BOOL)a3
{
}

- (id)_axDirectTouchTimer
{
}

- (void)_axSetDirectTouchTimer:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DKInkView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"superview", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v2 = [(DKInkViewAccessibility *)self superview];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityLabel
{
  if ([(DKInkViewAccessibility *)self _axIsDirectTouchable])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(@"writeboard.input.label");
  }

  return v2;
}

- (id)accessibilityHint
{
  if ([(DKInkViewAccessibility *)self _axIsDirectTouchable])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityLocalizedString(@"writeboard.input.hint");
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)DKInkViewAccessibility;
  unint64_t v3 = [(DKInkViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(DKInkViewAccessibility *)self _axIsDirectTouchable];
  uint64_t v5 = *MEMORY[0x263F1CEE0];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)accessibilityActivate
{
  if ([(DKInkViewAccessibility *)self _axIsDirectTouchable])
  {
    v6.receiver = self;
    v6.super_class = (Class)DKInkViewAccessibility;
    return [(DKInkViewAccessibility *)&v6 accessibilityActivate];
  }
  else
  {
    BOOL v3 = 1;
    [(DKInkViewAccessibility *)self _axSetIsDirectTouchable:1];
    [(DKInkViewAccessibility *)self _axInvalidateTimerAndReschedule:1];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
    BOOL v4 = accessibilityLocalizedString(@"writeboard.start.writing");
    UIAccessibilitySpeak();
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DKInkViewAccessibility;
  [(DKInkViewAccessibility *)&v5 touchesBegan:a3 withEvent:a4];
  [(DKInkViewAccessibility *)self _axInvalidateTimerAndReschedule:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DKInkViewAccessibility;
  [(DKInkViewAccessibility *)&v5 touchesEnded:a3 withEvent:a4];
  [(DKInkViewAccessibility *)self _axInvalidateTimerAndReschedule:1];
}

- (void)_axInvalidateTimerAndReschedule:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(DKInkViewAccessibility *)self _axDirectTouchTimer];
  [v5 invalidate];

  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__DKInkViewAccessibility__axInvalidateTimerAndReschedule___block_invoke;
    v7[3] = &unk_26511DD18;
    v7[4] = self;
    objc_super v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v7 block:2.0];
  }
  else
  {
    objc_super v6 = 0;
  }
  [(DKInkViewAccessibility *)self _axSetDirectTouchTimer:v6];
}

void __58__DKInkViewAccessibility__axInvalidateTimerAndReschedule___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axSetIsDirectTouchable:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 32));
  accessibilityLocalizedString(@"writeboard.stop.writing");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();
}

@end