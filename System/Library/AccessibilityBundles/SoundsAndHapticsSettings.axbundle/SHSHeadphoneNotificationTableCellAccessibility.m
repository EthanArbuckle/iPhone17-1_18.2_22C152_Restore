@interface SHSHeadphoneNotificationTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsChartsV2;
- (id)_accessibilityChartSummary;
- (id)_accessibilityDataSeries;
- (id)accessibilityChartDescriptor;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityLoadChartInformation;
- (void)layoutSubviews;
@end

@implementation SHSHeadphoneNotificationTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SHSHeadphoneNotificationTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SHSHeadphoneNotificationTableCell" isKindOfClass:@"PSTableCell"];
  [v3 validateClass:@"SHSHeadphoneNotificationTableCell" hasInstanceVariable:@"_notificationData" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SHSHeadphoneNotificationTableCell", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  [(SHSHeadphoneNotificationTableCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityLoadChartInformation];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"headphone.notifications.title");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  return [(SHSHeadphoneNotificationTableCellAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CF20];
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  [(SHSHeadphoneNotificationTableCellAccessibility *)&v3 layoutSubviews];
  [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadChartInformation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26 = objc_opt_new();
  v25 = objc_opt_new();
  objc_super v3 = objc_opt_new();
  v4 = objc_opt_new();
  [v3 setDateFormat:@"MMM"];
  v24 = v4;
  [v4 setDateFormat:@"MMMM"];
  v23 = self;
  [(SHSHeadphoneNotificationTableCellAccessibility *)self safeArrayForKey:@"_notificationData"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        v12 = [v11 objectForKey:@"count"];
        v13 = __UIAccessibilityCastAsClass();

        objc_opt_class();
        v14 = [v11 objectForKey:@"month"];
        v15 = __UIAccessibilityCastAsClass();

        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          v17 = [v3 dateFromString:v15];
          v18 = [v24 stringFromDate:v17];

          [v26 addObject:v18];
          [v25 addObject:v13];
          int v19 = [v13 intValue];
          if ((int)v9 >= v19) {
            uint64_t v9 = v19;
          }
          else {
            uint64_t v9 = v9;
          }
          int v20 = [v13 intValue];
          if ((int)v7 <= v20) {
            uint64_t v7 = v20;
          }
          else {
            uint64_t v7 = v7;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0x7FFFFFFFLL;
  }

  [(SHSHeadphoneNotificationTableCellAccessibility *)v23 _accessibilitySetRetainedValue:v26 forKey:@"kAXHeadphoneNotificationGraphXLabels"];
  [(SHSHeadphoneNotificationTableCellAccessibility *)v23 _accessibilitySetRetainedValue:v25 forKey:@"kAXHeadphoneNotificationGraphYValues"];
  v21 = [NSNumber numberWithInt:v9];
  [(SHSHeadphoneNotificationTableCellAccessibility *)v23 _accessibilitySetRetainedValue:v21 forKey:@"kAXHeadphoneNotificationGraphYAxisMin"];

  v22 = [NSNumber numberWithInt:v7];
  [(SHSHeadphoneNotificationTableCellAccessibility *)v23 _accessibilitySetRetainedValue:v22 forKey:@"kAXHeadphoneNotificationGraphYAxisMax"];
}

- (id)accessibilityChartDescriptor
{
  v23[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphXLabels"];
  id v4 = objc_alloc(MEMORY[0x263EFABC0]);
  uint64_t v5 = accessibilityLocalizedString(@"headphone.notifications.xaxis");
  uint64_t v6 = (void *)[v4 initWithTitle:v5 categoryOrder:v3];

  uint64_t v7 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphYAxisMin"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphYAxisMax"];
  [v10 doubleValue];
  double v12 = v11;

  id v13 = objc_alloc(MEMORY[0x263EFABF8]);
  v14 = accessibilityLocalizedString(@"headphone.notifications.yaxis");
  v15 = (void *)[v13 initWithTitle:v14 lowerBound:0 upperBound:&__block_literal_global_0 gridlinePositions:v9 valueDescriptionProvider:v12];

  id v16 = objc_alloc(MEMORY[0x263EFABC8]);
  v17 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityDataSeriesName];
  v18 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityChartSummary];
  int v19 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityDataSeries];
  v23[0] = v19;
  int v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  v21 = (void *)[v16 initWithTitle:v17 summary:v18 xAxisDescriptor:v6 yAxisDescriptor:v15 series:v20];

  return v21;
}

id __78__SHSHeadphoneNotificationTableCellAccessibility_accessibilityChartDescriptor__block_invoke(double a1)
{
  v2 = NSString;
  objc_super v3 = accessibilityLocalizedString(@"notification.value");
  id v4 = objc_msgSend(v2, "stringWithFormat:", v3, (int)a1);

  return v4;
}

- (id)_accessibilityChartSummary
{
  v2 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphXLabels"];
  objc_super v3 = NSString;
  id v4 = accessibilityLocalizedString(@"headphone.notifications.chart.summary");
  uint64_t v5 = [v2 firstObject];
  uint64_t v6 = [v2 lastObject];
  uint64_t v7 = objc_msgSend(v3, "stringWithFormat:", v4, v5, v6);

  return v7;
}

- (id)_accessibilityDataSeries
{
  objc_super v3 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphYValues"];
  v21 = self;
  id v4 = [(SHSHeadphoneNotificationTableCellAccessibility *)self _accessibilityValueForKey:@"kAXHeadphoneNotificationGraphXLabels"];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v3 count];
  if (v5 >= v6) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  double v8 = objc_opt_new();
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v10 = (void *)MEMORY[0x263EFABE0];
      double v11 = [v4 objectAtIndexedSubscript:i];
      double v12 = [v10 valueWithCategory:v11];

      id v13 = (void *)MEMORY[0x263EFABE0];
      v14 = [v3 objectAtIndexedSubscript:i];
      [v14 doubleValue];
      v15 = objc_msgSend(v13, "valueWithNumber:");

      id v16 = (void *)[objc_alloc(MEMORY[0x263EFABD8]) initWithX:v12 y:v15];
      [v8 addObject:v16];
    }
  }
  id v17 = objc_alloc(MEMORY[0x263EFABE8]);
  v18 = [(SHSHeadphoneNotificationTableCellAccessibility *)v21 _accessibilityDataSeriesName];
  int v19 = (void *)[v17 initWithName:v18 isContinuous:0 dataPoints:v8];

  return v19;
}

@end