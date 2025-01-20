@interface BKUIPearlEnrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityDetailLabel;
- (id)_accessibilityInstructionLabel;
- (id)_accessibilityInstructionView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axProvidePositioningInstruction;
- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setSubstate:(int)a3 animated:(BOOL)a4;
- (void)finalizeInstructionAnimation;
- (void)viewDidLoad;
@end

@implementation BKUIPearlEnrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlEnrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BKUIPearlPillContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewController", @"bottomContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewBottomContainer", @"instructionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"instructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"detailLabel", "@", 0);
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_state" withType:"int"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_substate" withType:"int"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_enrollView" withType:"BKUIPearlEnrollView"];
  [v3 validateClass:@"BKUIPearlEnrollView" hasInstanceVariable:@"_pillContainer" withType:"BKUIPearlPillContainerView"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewController", @"finalizeInstructionAnimation", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewController", @"_setState:animated:completion:", "v", "i", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewController", @"_setSubstate:animated:", "v", "i", "B", 0);
}

- (id)_accessibilityInstructionView
{
  v2 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeValueForKey:@"bottomContainer"];
  id v3 = [v2 safeValueForKey:@"instructionView"];

  return v3;
}

- (id)_accessibilityInstructionLabel
{
  v2 = [(BKUIPearlEnrollViewControllerAccessibility *)self _accessibilityInstructionView];
  id v3 = [v2 safeValueForKey:@"instructionLabel"];

  return v3;
}

- (id)_accessibilityDetailLabel
{
  v2 = [(BKUIPearlEnrollViewControllerAccessibility *)self _accessibilityInstructionView];
  id v3 = [v2 safeValueForKey:@"detailLabel"];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  [(BKUIPearlEnrollViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BKUIPearlEnrollViewControllerAccessibility *)self _accessibilityInstructionLabel];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  objc_opt_class();
  v4 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeValueForKeyPath:@"_enrollView._pillContainer"];
  v5 = __UIAccessibilityCastAsSafeCategory();

  [v5 _accessibilitySetPearlEnrollViewController:self];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  [(BKUIPearlEnrollViewControllerAccessibility *)&v3 viewDidLoad];
  [(BKUIPearlEnrollViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)finalizeInstructionAnimation
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  [(BKUIPearlEnrollViewControllerAccessibility *)&v5 finalizeInstructionAnimation];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  v4 = [(BKUIPearlEnrollViewControllerAccessibility *)self _accessibilityInstructionLabel];
  UIAccessibilityPostNotification(v3, v4);
}

- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  int v9 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeIntForKey:@"_state"];
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  [(BKUIPearlEnrollViewControllerAccessibility *)&v11 _setState:v6 animated:v5 completion:v8];

  if (v9 != v6 && UIAccessibilityIsVoiceOverRunning())
  {
    if (v6 == 5)
    {
      v10 = accessibilityLocalizedString(@"pearl.positioning.correct");
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
    else if (v6 == 3)
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __76__BKUIPearlEnrollViewControllerAccessibility__setState_animated_completion___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) safeIntForKey:@"_substate"];
  if ([*(id *)(a1 + 32) safeIntForKey:@"_state"] == 3 && v2 <= 9)
  {
    accessibilityLocalizedString(@"pearl.positioning.help");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)_axProvidePositioningInstruction
{
  unsigned int v2 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeIntForKey:@"_substate"] - 1;
  if (v2 <= 0xE && ((0x7F03u >> v2) & 1) != 0)
  {
    accessibilityLocalizedString(off_26510E678[v2]);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();
  }
}

- (void)_setSubstate:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeIntForKey:@"_substate"];
  v10.receiver = self;
  v10.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  [(BKUIPearlEnrollViewControllerAccessibility *)&v10 _setSubstate:v5 animated:v4];
  int v8 = [(BKUIPearlEnrollViewControllerAccessibility *)self safeIntForKey:@"_state"];
  if ((v8 & 0xFFFFFFFD) == 5)
  {
    if (v7 == v5 || !(v5 | v7)) {
      return;
    }
  }
  else if (v5 < 0xA || v8 != 4 || v7 == v5)
  {
    return;
  }
  AXPerformBlockOnMainThreadAfterDelay();
  if ((v5 - 11) < 5 || (v5 & 0xFFFFFFF7) - 1 <= 1) {
    id v9 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axProvidePositioningInstruction selector:0 userInfo:0 repeats:5.0];
  }
}

void __68__BKUIPearlEnrollViewControllerAccessibility__setSubstate_animated___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _accessibilityInstructionLabel];
  id v3 = [*(id *)(a1 + 32) _accessibilityDetailLabel];
  unsigned int v2 = __UIAXStringForVariables();
  UIAccessibilitySpeak();
}

@end