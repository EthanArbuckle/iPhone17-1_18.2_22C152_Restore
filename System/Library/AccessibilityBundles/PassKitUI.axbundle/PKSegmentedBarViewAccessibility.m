@interface PKSegmentedBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (id)accessibilityValueLabels;
- (void)setAccessibilityValueLabels:(id)a3;
@end

@implementation PKSegmentedBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSegmentedBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKRewardsSummaryChartBarConfiguration"];
  [v3 validateClass:@"PKSegmentedBarView" hasInstanceVariable:@"_configuration" withType:"<PKSegmentedBarConfiguration>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setAccessibilityValueLabels:(id)a3
{
}

- (id)accessibilityValueLabels
{
  v11[4] = *MEMORY[0x263EF8340];
  id v3 = [(PKSegmentedBarViewAccessibility *)self safeValueForKey:@"_configuration"];
  v4 = __UIAccessibilityCastAsProtocol();

  NSClassFromString(&cfstr_Pkrewardssumma.isa);
  if (objc_opt_isKindOfClass())
  {
    v5 = AXFormatFloatWithPercentage();
    v11[0] = v5;
    v6 = AXFormatFloatWithPercentage();
    v11[1] = v6;
    v7 = AXFormatFloatWithPercentage();
    v11[2] = v7;
    v8 = accessibilityLocalizedString(@"bonus.category");
    v11[3] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  }
  else
  {
    v9 = [(PKSegmentedBarViewAccessibility *)self _accessibilityValueForKey:@"accessibilityValueLabels"];
  }

  return v9;
}

- (id)accessibilityValue
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  char v35 = 0;
  id v3 = [(PKSegmentedBarViewAccessibility *)self safeValueForKey:@"_configuration"];
  v4 = __UIAccessibilityCastAsProtocol();

  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v5 = [(PKSegmentedBarViewAccessibility *)self accessibilityValueLabels];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    v9 = 0;
    uint64_t v10 = *(void *)v32;
    v11 = @"PKRewardsSummaryChartBarConfiguration";
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v8;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = v13 + v12;
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
        if (objc_msgSend(v4, "numberOfSegments", v26, v27, v28) > v13 + v12)
        {
          NSClassFromString(&v11->isa);
          if (objc_opt_isKindOfClass())
          {
            v16 = (void *)MEMORY[0x263F08A30];
            v29 = v9;
            uint64_t v17 = v7;
            v18 = v11;
            uint64_t v19 = v10;
            v20 = v5;
            v21 = NSNumber;
            [v4 valueForSegmentAtIndex:v14];
            v22 = objc_msgSend(v21, "numberWithDouble:");
            v23 = [v16 localizedStringFromNumber:v22 numberStyle:2];

            v5 = v20;
            uint64_t v10 = v19;
            v11 = v18;
            uint64_t v7 = v17;
            v9 = v29;
          }
          else
          {
            [v4 valueForSegmentAtIndex:v13 + v12];
            v23 = AXFormatFloat();
          }
          v27 = v23;
          v28 = @"__AXStringForVariablesSentinel";
          uint64_t v26 = v15;
          uint64_t v24 = __UIAXStringForVariables();

          v9 = (void *)v24;
          uint64_t v13 = v30;
        }
        ++v12;
      }
      while (v7 != v12);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
      int v8 = v13 + v12;
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end