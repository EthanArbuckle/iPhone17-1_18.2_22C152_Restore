@interface LabeledSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_accessibilityIncreaseAmount:(BOOL)a3;
- (float)_accessibilityLabeledSliderValue;
- (id)accessibilityValue;
- (void)_accessibilityReportModeChanged;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation LabeledSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Setup.LabeledSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Setup.LabeledSlider" hasSwiftField:@"labels" withSwiftType:"Array<UILabel>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Setup.BuddyAppearanceController", @"modeChanged", "v", 0);
}

- (float)_accessibilityLabeledSliderValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 value];
  float v4 = v3;

  return v4;
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  BOOL v3 = a3;
  [(LabeledSliderAccessibility *)self _accessibilityLabeledSliderValue];
  float v5 = -1.01;
  if (v3) {
    float v5 = 1.01;
  }
  return (float)(v5 + v4);
}

- (void)_accessibilityReportModeChanged
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v14 = 0;
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  [v3 allTargets];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v9, "modeChanged", (void)v10);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

- (void)accessibilityIncrement
{
  v3.receiver = self;
  v3.super_class = (Class)LabeledSliderAccessibility;
  [(LabeledSliderAccessibility *)&v3 accessibilityIncrement];
  [(LabeledSliderAccessibility *)self _accessibilityReportModeChanged];
}

- (void)accessibilityDecrement
{
  v3.receiver = self;
  v3.super_class = (Class)LabeledSliderAccessibility;
  [(LabeledSliderAccessibility *)&v3 accessibilityDecrement];
  [(LabeledSliderAccessibility *)self _accessibilityReportModeChanged];
}

- (id)accessibilityValue
{
  objc_super v3 = [(LabeledSliderAccessibility *)self safeSwiftArrayForKey:@"labels"];
  [(LabeledSliderAccessibility *)self _accessibilityLabeledSliderValue];
  int v5 = llroundf(v4);
  unint64_t v6 = v5 & ~(v5 >> 31);
  if ([v3 count] <= v6)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
    v8 = __UIAccessibilityCastAsClass();

    v9 = [v8 accessibilityLabel];
  }

  return v9;
}

@end