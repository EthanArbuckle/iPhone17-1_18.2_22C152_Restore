@interface HUQuickControlSwitchViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (double)_accessibilitySwitchValue;
- (id)_accessibilityControlItem;
- (id)_accessibilityControlName;
- (id)_accessibilitySingleControlHostViewController;
- (id)_accessibilityStateForPrimaryCharacteristic;
- (id)accessibilityIdentifier;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSwitchValue:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation HUQuickControlSwitchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSwitchView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSwitchView", @"wellView", "@", 0);
  [v3 validateClass:@"HUQuickControlSwitchView" hasInstanceVariable:@"_switchValue" withType:"CGFloat"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSwitchView", @"setSwitchValue:", "v", "d", 0);
  [v3 validateClass:@"_HUQuickControlSingleControlHostView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"controlItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFPrimaryStateControlItem", @"primaryStateCharacteristicType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFItem", @"latestResults", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlElasticSliderInteractionCoordinator", @"_updateModelValue:roundValue:notifyDelegate:", "v", "{?=dd}", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlElasticSliderInteractionCoordinator", @"setActiveGestureValueType:", "v", "Q", 0);
}

- (id)accessibilityIdentifier
{
  return @"QuickControlSwitch";
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v2 = [(HUQuickControlSwitchViewAccessibility *)self safeValueForKey:@"wellView"];
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

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8] | *MEMORY[0x263F1CEE8];
}

- (void)accessibilityIncrement
{
  [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
  if (v3 != 1.0)
  {
    [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySetSwitchValue:1.0];
  }
}

- (void)accessibilityDecrement
{
  [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
  if (v3 != 0.0)
  {
    [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySetSwitchValue:0.0];
  }
}

- (double)_accessibilitySwitchValue
{
  [(HUQuickControlSwitchViewAccessibility *)self safeCGFloatForKey:@"_switchValue"];
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
  BOOL v4 = v3 == 1.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = 1.0;
  }
  [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySetSwitchValue:v5];
  return 1;
}

- (void)_accessibilitySetSwitchValue:(double)a3
{
}

void __70__HUQuickControlSwitchViewAccessibility__accessibilitySetSwitchValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSwitchValue:*(double *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _accessibilityValueForKey:AXControlUpdateDelegateKey];
  [v2 setActiveGestureValueType:0];
  objc_msgSend(v2, "_updateModelValue:roundValue:notifyDelegate:", 1, 1, 0.0, *(double *)(a1 + 40));
}

- (id)_accessibilitySingleControlHostViewController
{
  id v2 = [(HUQuickControlSwitchViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_11 startWithSelf:0];
  double v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __86__HUQuickControlSwitchViewAccessibility__accessibilitySingleControlHostViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456509F0](@"_HUQuickControlSingleControlHostView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityControlItem
{
  id v2 = [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySingleControlHostViewController];
  double v3 = [v2 safeValueForKey:@"controlItem"];

  return v3;
}

- (id)_accessibilityControlName
{
  objc_opt_class();
  double v3 = [(HUQuickControlSwitchViewAccessibility *)self _accessibilityControlItem];
  BOOL v4 = [v3 safeValueForKey:@"latestResults"];
  double v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  double v6 = [v5 objectForKeyedSubscript:@"title"];
  double v7 = __UIAccessibilityCastAsClass();

  return v7;
}

- (id)_accessibilityStateForPrimaryCharacteristic
{
  double v3 = [(HUQuickControlSwitchViewAccessibility *)self _accessibilityControlItem];
  BOOL v4 = [v3 safeValueForKey:@"primaryStateCharacteristicType"];

  if (([v4 isEqualToString:*MEMORY[0x263F0C0B0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F0C510]])
  {
    [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
    double v6 = vabdd_f64(1.0, v5);
    double v7 = @"state.lock.locked";
    double v8 = @"state.lock.unlocked";
  }
  else if (([v4 isEqualToString:*MEMORY[0x263F0C040]] & 1) != 0 {
         || [v4 isEqualToString:*MEMORY[0x263F0C4A8]])
  }
  {
    [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
    double v6 = vabdd_f64(1.0, v9);
    double v7 = @"state.door.closed";
    double v8 = @"state.door.open";
  }
  else
  {
    [(HUQuickControlSwitchViewAccessibility *)self _accessibilitySwitchValue];
    double v6 = vabdd_f64(1.0, v10);
    double v7 = @"state.switch.off";
    double v8 = @"state.switch.on";
  }
  if (v6 >= 0.01) {
    double v11 = v7;
  }
  else {
    double v11 = v8;
  }
  double v12 = accessibilityHomeUILocalizedString(v11);

  return v12;
}

@end