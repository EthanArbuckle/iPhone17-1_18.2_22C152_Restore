@interface PUCinematicSubjectIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXDispatchTimer)timer;
- (BOOL)isAccessibilityElement;
- (id)_axCountdownTimer;
- (id)_axVideoEditOverlayViewController;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (void)_axUpdateElementFrame;
- (void)_setAXCountdownTimer:(id)a3;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)setTimer:(id)a3;
@end

@implementation PUCinematicSubjectIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCinematicSubjectIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCountdownTimer
{
}

- (void)_setAXCountdownTimer:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUVideoEditOverlayViewController"];
  [v3 validateClass:@"PUVideoEditOverlayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCinematicSubjectIndicator", @"shape", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  unint64_t v2 = [(PUCinematicSubjectIndicatorAccessibility *)self safeIntegerForKey:@"shape"] - 1;
  if (v2 > 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = accessibilityPULocalizedString(off_2650A7DB8[v2]);
  }

  return v3;
}

- (id)accessibilityHint
{
  unint64_t v2 = [(PUCinematicSubjectIndicatorAccessibility *)self safeIntegerForKey:@"shape"];
  if (v2 > 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = accessibilityPULocalizedString(off_2650A7DD0[v2]);
  }

  return v3;
}

- (id)_axVideoEditOverlayViewController
{
  unint64_t v2 = [(PUCinematicSubjectIndicatorAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:1];
  id v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __77__PUCinematicSubjectIndicatorAccessibility__axVideoEditOverlayViewController__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Puvideoeditove_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  v9.receiver = self;
  v9.super_class = (Class)PUCinematicSubjectIndicatorAccessibility;
  [(PUCinematicSubjectIndicatorAccessibility *)&v9 accessibilityElementDidBecomeFocused];
  id v3 = [(PUCinematicSubjectIndicatorAccessibility *)self _axVideoEditOverlayViewController];
  [v3 _axSetCinematicSubjectIndicatorDidBecomeFocused:1];
  v4 = [(PUCinematicSubjectIndicatorAccessibility *)self _axCountdownTimer];
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F21398]);
    v4 = (void *)[v5 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(PUCinematicSubjectIndicatorAccessibility *)self _setAXCountdownTimer:v4];
  }
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__PUCinematicSubjectIndicatorAccessibility_accessibilityElementDidBecomeFocused__block_invoke;
  v6[3] = &unk_2650A7D98;
  objc_copyWeak(&v7, &location);
  [v4 afterDelay:v6 processBlock:0.05];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __80__PUCinematicSubjectIndicatorAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axUpdateElementFrame];
}

- (void)accessibilityElementDidLoseFocus
{
  id v3 = [(PUCinematicSubjectIndicatorAccessibility *)self _axVideoEditOverlayViewController];
  [v3 _axSetCinematicSubjectIndicatorDidBecomeFocused:0];
  v5.receiver = self;
  v5.super_class = (Class)PUCinematicSubjectIndicatorAccessibility;
  [(PUCinematicSubjectIndicatorAccessibility *)&v5 accessibilityElementDidLoseFocus];
  v4 = [(PUCinematicSubjectIndicatorAccessibility *)self _axCountdownTimer];
  [v4 cancel];
}

- (void)_axUpdateElementFrame
{
  id v3 = [(PUCinematicSubjectIndicatorAccessibility *)self _axCountdownTimer];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F21398]);
    id v3 = (void *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(PUCinematicSubjectIndicatorAccessibility *)self _setAXCountdownTimer:v3];
  }
  if ([(PUCinematicSubjectIndicatorAccessibility *)self accessibilityElementIsFocused])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81298], self);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__PUCinematicSubjectIndicatorAccessibility__axUpdateElementFrame__block_invoke;
    v5[3] = &unk_2650A7D98;
    objc_copyWeak(&v6, &location);
    [v3 afterDelay:v5 processBlock:0.05];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __65__PUCinematicSubjectIndicatorAccessibility__axUpdateElementFrame__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axUpdateElementFrame];
}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end