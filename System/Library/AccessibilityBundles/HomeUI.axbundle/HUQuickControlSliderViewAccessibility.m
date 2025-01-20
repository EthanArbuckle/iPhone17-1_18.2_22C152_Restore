@interface HUQuickControlSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHasSecondarySlider;
- (BOOL)_axSetAdjustsMax;
- (BOOL)_axSetAdjustsMin;
- (BOOL)_axShouldAdjustSecondary;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (double)_axCurrentAdjustableValue;
- (double)_axCurrentPrimary;
- (double)_axCurrentSecondary;
- (id)_accessibilityControlItem;
- (id)_accessibilityControlName;
- (id)_accessibilitySingleControlHostViewController;
- (id)accessibilityCustomActions;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axSetShouldAdjustSecondary:(BOOL)a3;
- (void)_axUpdateControlValue:(double)a3 incrementing:(BOOL)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation HUQuickControlSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"sliderValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"setSliderValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"secondarySliderValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"setSecondarySliderValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlViewControllerAccessibility", @"accessibilityControlServiceName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"backgroundView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_continuousCornerRadius", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"profile", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderViewProfile", @"hasSecondaryValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlElasticSliderInteractionCoordinator", @"setActiveGestureValueType:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"showOffState", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlElasticSliderInteractionCoordinator", @"gestureTransformer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlElasticSliderInteractionCoordinator", @"gestureTransformer:sliderValueDidChange:", "v", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSliderView", @"_permittedValueRange", "{?=dd}", 0);
  [v3 validateClass:@"_HUQuickControlSingleControlHostView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"controlItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFControlItem", @"valueSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFSimpleAggregatedCharacteristicValueSource", @"allServices", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HMService", @"name", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axShouldAdjustSecondary
{
  return MEMORY[0x270F09620](self, &__HUQuickControlSliderViewAccessibility___axShouldAdjustSecondary);
}

- (void)_axSetShouldAdjustSecondary:(BOOL)a3
{
}

- (id)accessibilityCustomActions
{
  v12[2] = *MEMORY[0x263EF8340];
  if ([(HUQuickControlSliderViewAccessibility *)self _axHasSecondarySlider])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    v4 = accessibilityHomeUILocalizedString(@"controls.adjust.max");
    v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axSetAdjustsMax];

    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityHomeUILocalizedString(@"controls.adjust.min");
    v8 = (void *)[v6 initWithName:v7 target:self selector:sel__axSetAdjustsMin];

    v12[0] = v8;
    v12[1] = v5;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUQuickControlSliderViewAccessibility;
    v9 = [(HUQuickControlSliderViewAccessibility *)&v11 accessibilityCustomActions];
  }

  return v9;
}

- (BOOL)_axSetAdjustsMax
{
  return 1;
}

- (BOOL)_axSetAdjustsMin
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSliderViewAccessibility;
  return *MEMORY[0x263F1CED8] | [(HUQuickControlSliderViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
}

- (id)accessibilityValue
{
  if ([(HUQuickControlSliderViewAccessibility *)self safeBoolForKey:@"showOffState"])
  {
    accessibilityHomeUILocalizedString(@"service.cell.state.off");
  }
  else
  {
    [(HUQuickControlSliderViewAccessibility *)self _axCurrentPrimary];
    AXFormatFloatWithPercentage();
  objc_super v3 = };

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"QuickControlSlider";
}

- (void)accessibilityIncrement
{
  [(HUQuickControlSliderViewAccessibility *)self _axCurrentAdjustableValue];
  double v4 = v3 + 0.0500000007;
  if (v4 > 1.0) {
    double v4 = 1.0;
  }

  [(HUQuickControlSliderViewAccessibility *)self _axUpdateControlValue:1 incrementing:v4];
}

- (void)accessibilityDecrement
{
  [(HUQuickControlSliderViewAccessibility *)self _axCurrentAdjustableValue];
  double v4 = v3 + -0.0500000007;
  if (v4 < 0.0) {
    double v4 = 0.0;
  }

  [(HUQuickControlSliderViewAccessibility *)self _axUpdateControlValue:0 incrementing:v4];
}

- (double)_axCurrentAdjustableValue
{
  if ([(HUQuickControlSliderViewAccessibility *)self _axHasSecondarySlider]
    && [(HUQuickControlSliderViewAccessibility *)self _axShouldAdjustSecondary])
  {
    [(HUQuickControlSliderViewAccessibility *)self _axCurrentSecondary];
  }
  else
  {
    [(HUQuickControlSliderViewAccessibility *)self _axCurrentPrimary];
  }
  return result;
}

- (double)_axCurrentPrimary
{
  [(HUQuickControlSliderViewAccessibility *)self safeDoubleForKey:@"sliderValue"];
  return result;
}

- (double)_axCurrentSecondary
{
  [(HUQuickControlSliderViewAccessibility *)self safeDoubleForKey:@"secondarySliderValue"];
  return result;
}

- (void)_axUpdateControlValue:(double)a3 incrementing:(BOOL)a4
{
  double v4 = [(HUQuickControlSliderViewAccessibility *)self safeValueForKey:@"_permittedValueRange"];
  v5[0] = 0;
  v5[1] = 0;
  [v4 getValue:v5 size:16];
  AXPerformSafeBlock();
}

void __76__HUQuickControlSliderViewAccessibility__axUpdateControlValue_incrementing___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _axHasSecondarySlider]) {
    int v2 = [*(id *)(a1 + 32) _axShouldAdjustSecondary];
  }
  else {
    int v2 = 0;
  }
  double v3 = [*(id *)(a1 + 32) _accessibilityValueForKey:AXControlUpdateDelegateKey];
  id v8 = v3;
  if (v2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [v3 setActiveGestureValueType:v4];
  v5 = [v8 safeValueForKey:@"gestureTransformer"];
  [v8 gestureTransformer:v5 sliderValueDidChange:*(double *)(a1 + 40)];

  [v8 setActiveGestureValueType:0];
  id v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 40);
  if (v2) {
    [v6 setSecondarySliderValue:v7];
  }
  else {
    [v6 setSliderValue:v7];
  }
}

- (id)_accessibilitySingleControlHostViewController
{
  int v2 = [(HUQuickControlSliderViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:0];
  double v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __86__HUQuickControlSliderViewAccessibility__accessibilitySingleControlHostViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456509F0](@"_HUQuickControlSingleControlHostView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityControlItem
{
  id v2 = [(HUQuickControlSliderViewAccessibility *)self _accessibilitySingleControlHostViewController];
  double v3 = [v2 safeValueForKey:@"controlItem"];

  return v3;
}

- (id)_accessibilityControlName
{
  id v2 = [(HUQuickControlSliderViewAccessibility *)self _accessibilityControlItem];
  double v3 = [v2 safeValueForKeyPath:@"valueSource.allServices"];

  objc_opt_class();
  uint64_t v4 = [v3 anyObject];
  v5 = [v4 safeValueForKey:@"name"];
  id v6 = __UIAccessibilityCastAsClass();

  return v6;
}

- (BOOL)_axHasSecondarySlider
{
  id v2 = [(HUQuickControlSliderViewAccessibility *)self safeValueForKey:@"profile"];
  char v3 = [v2 safeBoolForKey:@"hasSecondaryValue"];

  return v3;
}

- (CGRect)accessibilityFrame
{
  [(HUQuickControlSliderViewAccessibility *)self safeCGFloatForKey:@"_continuousCornerRadius"];
  double v4 = v3;
  double v5 = v3 * 0.5;
  id v6 = [(HUQuickControlSliderViewAccessibility *)self safeValueForKey:@"backgroundView"];
  [v6 accessibilityFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8 - v5;
  double v16 = v10 - v5;
  double v17 = v4 + v12;
  double v18 = v4 + v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

@end