@interface CCUISteppedSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsButtonModuleWhenCollapsed;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityValue;
- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setNumberOfSteps:(unint64_t)a3;
@end

@implementation CCUISteppedSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUISteppedSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUISteppedSliderView" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISteppedSliderView", @"step", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISteppedSliderView", @"numberOfSteps", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISteppedSliderView", @"setNumberOfSteps:", "v", "Q", 0);
  [v3 validateClass:@"CCUIBaseSliderView" hasInstanceVariable:@"_expanded" withType:"BOOL"];
  [v3 validateClass:@"CCUISteppedSliderView" isKindOfClass:@"CCUIBaseSliderView"];
  [v3 validateClass:@"CCUIButtonModuleViewController"];
}

- (BOOL)isAccessibilityElement
{
  if ([(CCUISteppedSliderViewAccessibility *)self safeBoolForKey:@"_expanded"]) {
    return 1;
  }
  else {
    return ![(CCUISteppedSliderViewAccessibility *)self _axIsButtonModuleWhenCollapsed];
  }
}

- (id)accessibilityValue
{
  uint64_t v3 = [(CCUISteppedSliderViewAccessibility *)self _accessibilityGetBlockForAttribute:3];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    [(CCUISteppedSliderViewAccessibility *)self safeUnsignedIntegerForKey:@"step"];
    [(CCUISteppedSliderViewAccessibility *)self safeUnsignedIntegerForKey:@"numberOfSteps"];
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"control.center.step.slider.value");
    v8 = AXFormatInteger();
    v9 = AXFormatInteger();
    v5 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  }

  return v5;
}

- (BOOL)accessibilityActivate
{
  v2 = [(CCUISteppedSliderViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:1];
  uint64_t v3 = v2;
  if (v2)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return v3 != 0;
}

uint64_t __59__CCUISteppedSliderViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245648F70](@"CCUIContentModuleContainerViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __59__CCUISteppedSliderViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityViewController];
  [v1 expandModule];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3
{
}

uint64_t __88__CCUISteppedSliderViewAccessibility__accessibilityAdjustSliderValueInForwardDirection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendActionsForControlEvents:1];
  [*(id *)(a1 + 32) setStep:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
  v2 = *(void **)(a1 + 32);

  return [v2 sendActionsForControlEvents:64];
}

- (id)accessibilityCustomActions
{
  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderViewAccessibility;
  v2 = [(CCUISteppedSliderViewAccessibility *)&v5 accessibilityCustomActions];
  uint64_t v3 = AXGuaranteedMutableArray();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();

  return v3;
}

- (void)setNumberOfSteps:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderViewAccessibility;
  [(CCUISteppedSliderViewAccessibility *)&v6 setNumberOfSteps:a3];
  if (UIAccessibilityControlCenterModuleIsExpanded())
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&setNumberOfSteps__LastOutput > 1.0)
    {
      UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
      objc_super v5 = [(CCUISteppedSliderViewAccessibility *)self _accessibilityAXAttributedValue];
      UIAccessibilityPostNotification(v4, v5);

      setNumberOfSteps__LastOutput = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (BOOL)_axIsButtonModuleWhenCollapsed
{
  v2 = [(CCUISteppedSliderViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_308 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __68__CCUISteppedSliderViewAccessibility__axIsButtonModuleWhenCollapsed__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x245648F70](@"CCUIButtonModuleViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end