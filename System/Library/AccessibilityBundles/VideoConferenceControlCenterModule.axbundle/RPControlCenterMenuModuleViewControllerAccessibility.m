@interface RPControlCenterMenuModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCountdownTimer;
- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits;
- (void)_axSpeakAndGo:(int64_t)a3;
- (void)_setAXCountdownTimer:(id)a3;
- (void)transitionToCountdownState;
- (void)updateStateAndUI;
@end

@implementation RPControlCenterMenuModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RPControlCenterMenuModuleViewController";
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RPControlCenterMenuModuleViewController", @"updateStateAndUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RPControlCenterMenuModuleViewController", @"transitionToCountdownState", "v", 0);
}

- (void)updateStateAndUI
{
  v4.receiver = self;
  v4.super_class = (Class)RPControlCenterMenuModuleViewControllerAccessibility;
  [(RPControlCenterMenuModuleViewControllerAccessibility *)&v4 updateStateAndUI];
  id v3 = [(RPControlCenterMenuModuleViewControllerAccessibility *)self _axCountdownTimer];
  [v3 cancel];
}

- (void)_axSpeakAndGo:(int64_t)a3
{
  v5 = AXFormatInteger();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  if (a3 >= 2)
  {
    v6 = [(RPControlCenterMenuModuleViewControllerAccessibility *)self _axCountdownTimer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__RPControlCenterMenuModuleViewControllerAccessibility__axSpeakAndGo___block_invoke;
    v7[3] = &unk_265165250;
    v7[4] = self;
    v7[5] = a3;
    [v6 afterDelay:v7 processBlock:1.0];
  }
}

uint64_t __70__RPControlCenterMenuModuleViewControllerAccessibility__axSpeakAndGo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axSpeakAndGo:*(void *)(a1 + 40) - 1];
}

- (void)transitionToCountdownState
{
  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterMenuModuleViewControllerAccessibility;
  [(RPControlCenterMenuModuleViewControllerAccessibility *)&v5 transitionToCountdownState];
  id v3 = [(RPControlCenterMenuModuleViewControllerAccessibility *)self _axCountdownTimer];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F21398]);
    id v3 = (void *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(RPControlCenterMenuModuleViewControllerAccessibility *)self _setAXCountdownTimer:v3];
  }
  [(RPControlCenterMenuModuleViewControllerAccessibility *)self _axSpeakAndGo:3];
}

- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits
{
  return *MEMORY[0x263F1CF40];
}

@end