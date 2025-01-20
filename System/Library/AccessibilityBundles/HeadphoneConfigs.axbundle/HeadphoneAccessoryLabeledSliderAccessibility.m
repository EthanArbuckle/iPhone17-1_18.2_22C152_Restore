@interface HeadphoneAccessoryLabeledSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setValue:(float)a3 animated:(BOOL)a4 objectChange:(BOOL)a5;
@end

@implementation HeadphoneAccessoryLabeledSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_", @"selectedIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_", @"setValue:animated:objectChange:", "v", "f", "B", "B", 0);
  [v3 validateClass:@"_TtGC16HeadphoneConfigs31HeadphoneAccessoryLabeledSliderVSo17AAAutoANCStrength_" hasSwiftField:@"ticks" withSwiftType:"Array<String>"];
}

- (void)accessibilityIncrement
{
  objc_opt_class();
  id v3 = [(HeadphoneAccessoryLabeledSliderAccessibility *)self safeSwiftValueForKey:@"ticks"];
  v4 = __UIAccessibilityCastAsClass();

  char v9 = 0;
  objc_opt_class();
  v5 = [(HeadphoneAccessoryLabeledSliderAccessibility *)self safeValueForKey:@"selectedIndex"];
  v6 = __UIAccessibilityCastAsClass();

  unint64_t v7 = [v6 integerValue];
  if (![v4 count] || (v7 & 0x8000000000000000) != 0 || v7 >= objc_msgSend(v4, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
    [(HeadphoneAccessoryLabeledSliderAccessibility *)&v8 accessibilityIncrement];
  }
  else
  {
    [v4 count];
    AXPerformSafeBlock();
  }
}

uint64_t __70__HeadphoneAccessoryLabeledSliderAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedIndex:*(void *)(a1 + 40)];
}

- (void)accessibilityDecrement
{
  objc_opt_class();
  id v3 = [(HeadphoneAccessoryLabeledSliderAccessibility *)self safeValueForKey:@"selectedIndex"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 integerValue];
  AXPerformSafeBlock();
}

uint64_t __70__HeadphoneAccessoryLabeledSliderAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedIndex:*(void *)(a1 + 40)];
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(HeadphoneAccessoryLabeledSliderAccessibility *)self safeSwiftValueForKey:@"ticks"];
  v4 = __UIAccessibilityCastAsClass();

  char v13 = 0;
  objc_opt_class();
  v5 = [(HeadphoneAccessoryLabeledSliderAccessibility *)self safeValueForKey:@"selectedIndex"];
  v6 = __UIAccessibilityCastAsClass();

  unint64_t v7 = [v6 integerValue];
  unint64_t v8 = [v4 count];
  if ((v7 & 0x8000000000000000) != 0 || v7 >= v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
    uint64_t v9 = [(HeadphoneAccessoryLabeledSliderAccessibility *)&v12 accessibilityValue];
  }
  else
  {
    uint64_t v9 = [v4 objectAtIndex:v7];
  }
  v10 = (void *)v9;

  return v10;
}

- (void)setValue:(float)a3 animated:(BOOL)a4 objectChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v11.receiver = self;
  v11.super_class = (Class)HeadphoneAccessoryLabeledSliderAccessibility;
  *(float *)&double v10 = a3;
  [(HeadphoneAccessoryLabeledSliderAccessibility *)&v11 setValue:v6 animated:IsVoiceOverRunning | v5 objectChange:v10];
}

@end