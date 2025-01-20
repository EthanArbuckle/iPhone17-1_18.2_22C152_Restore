@interface CHASActivitySetupGoalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityPerformButtonActionForButton:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CHASActivitySetupGoalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHASActivitySetupGoalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHASActivitySetupGoalView" hasInstanceVariable:@"_goalLabel" withType:"UILabel"];
  [v3 validateClass:@"CHASActivitySetupGoalView" hasInstanceVariable:@"_unitLabel" withType:"UILabel"];
  [v3 validateClass:@"CHASActivitySetupGoalView" hasInstanceVariable:@"_minusButton" withType:"UIButton"];
  [v3 validateClass:@"CHASActivitySetupGoalView" hasInstanceVariable:@"_plusButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHASActivitySetupGoalView", @"buttonController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIValueAdjustmentButtonController", @"_performPlusMinusActionWithButton:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(CHASActivitySetupGoalViewAccessibility *)self safeValueForKey:@"_goalLabel"];
  v4 = __UIAccessibilityCastAsClass();

  char v12 = 0;
  objc_opt_class();
  v5 = [(CHASActivitySetupGoalViewAccessibility *)self safeValueForKey:@"_unitLabel"];
  v6 = __UIAccessibilityCastAsClass();

  if (v4 && v6)
  {
    v7 = [v4 text];
    v10 = [v6 text];
    v8 = __AXStringForVariables();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CHASActivitySetupGoalViewAccessibility;
    v8 = [(CHASActivitySetupGoalViewAccessibility *)&v11 accessibilityValue];
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityPerformButtonActionForButton:(id)a3
{
  id v4 = a3;
  v5 = [(CHASActivitySetupGoalViewAccessibility *)self safeValueForKey:@"buttonController"];
  objc_opt_class();
  v6 = [(CHASActivitySetupGoalViewAccessibility *)self safeValueForKey:v4];
  v7 = __UIAccessibilityCastAsClass();

  if (v5 && v7)
  {
    id v8 = v5;
    id v9 = v7;
    AXPerformSafeBlock();
  }
}

id __85__CHASActivitySetupGoalViewAccessibility__accessibilityPerformButtonActionForButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPlusMinusActionWithButton:*(void *)(a1 + 40)];
}

@end