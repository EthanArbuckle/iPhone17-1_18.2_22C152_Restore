@interface TimeDurationPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation TimeDurationPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.TimeDurationPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.TimeDurationPicker", @"accessibilityDurationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.TimeDurationPicker", @"increase", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.TimeDurationPicker", @"decrease", "v", 0);
}

- (id)automationElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 subviews];
  v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);

  return v4;
}

uint64_t __53__TimeDurationPickerAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(TimeDurationPickerAccessibility *)self safeValueForKey:@"accessibilityDurationLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

@end