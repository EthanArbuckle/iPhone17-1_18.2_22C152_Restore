@interface HKGraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsContinuous;
- (BOOL)_accessibilitySupportsChartsV2;
- (double)_accessibilityScaledYValue:(double)a3;
- (id)_accessibilityChartElements;
- (id)_accessibilityChartSummary;
- (id)_accessibilityDataSeries;
- (id)_accessibilitySeriesTitle;
- (id)_accessibilityXAxis;
- (id)_accessibilityYAxis;
- (id)accessibilityChartDescriptor;
- (void)_accessibilityClearElements;
- (void)_accessibilitySetChartElements:(id)a3;
- (void)_updateGraphViewConfigurationIfNecessary;
@end

@implementation HKGraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKGraphView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphView", @"_updateGraphViewConfigurationIfNecessary", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
}

- (id)_accessibilityChartElements
{
}

- (void)_accessibilitySetChartElements:(id)a3
{
}

- (void)_updateGraphViewConfigurationIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)HKGraphViewAccessibility;
  [(HKGraphViewAccessibility *)&v3 _updateGraphViewConfigurationIfNecessary];
  [(HKGraphViewAccessibility *)self _accessibilityClearElements];
}

- (void)_accessibilityClearElements
{
  [(HKGraphViewAccessibility *)self _accessibilitySetChartElements:0];
  v4 = [(HKGraphViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v3 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

uint64_t __55__HKGraphViewAccessibility__accessibilityClearElements__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityClearChildren];
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)accessibilityChartDescriptor
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewGraphElementsSeriesDescription"];
  if (!v3)
  {
    v4 = [(HKGraphViewAccessibility *)self _accessibilityDataSeries];
    v12[0] = v4;
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  id v5 = objc_alloc(MEMORY[0x263EFABC8]);
  v6 = [(HKGraphViewAccessibility *)self _accessibilitySeriesTitle];
  v7 = [(HKGraphViewAccessibility *)self _accessibilityChartSummary];
  v8 = [(HKGraphViewAccessibility *)self _accessibilityXAxis];
  v9 = [(HKGraphViewAccessibility *)self _accessibilityYAxis];
  v10 = (void *)[v5 initWithTitle:v6 summary:v7 xAxisDescriptor:v8 yAxisDescriptor:v9 series:v3];

  return v10;
}

- (id)_accessibilityDataSeries
{
  v2 = self;
  id v3 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewGraphElementsYValues"];
  v4 = [(HKGraphViewAccessibility *)v2 _accessibilityValueForKey:@"kAXGraphViewGraphElementsXValues"];
  unint64_t v5 = [v3 count];
  unint64_t v6 = [v4 count];
  if (v5 >= v6) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  v8 = objc_opt_new();
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v10 = [v3 objectAtIndexedSubscript:i];
      [v10 doubleValue];
      -[HKGraphViewAccessibility _accessibilityScaledYValue:](v2, "_accessibilityScaledYValue:");
      double v12 = v11;

      id v13 = objc_alloc(MEMORY[0x263EFABD8]);
      v14 = v2;
      v15 = v3;
      v16 = (void *)MEMORY[0x263EFABE0];
      [v4 objectAtIndexedSubscript:i];
      v18 = v17 = v4;
      v19 = [v16 valueWithCategory:v18];
      v20 = [MEMORY[0x263EFABE0] valueWithNumber:v12];
      v21 = (void *)[v13 initWithX:v19 y:v20];

      id v3 = v15;
      v2 = v14;

      v4 = v17;
      [v8 addObject:v21];
    }
  }
  id v22 = objc_alloc(MEMORY[0x263EFABE8]);
  v23 = [(HKGraphViewAccessibility *)v2 _accessibilitySeriesTitle];
  v24 = objc_msgSend(v22, "initWithName:isContinuous:dataPoints:", v23, -[HKGraphViewAccessibility _accessibilityIsContinuous](v2, "_accessibilityIsContinuous"), v8);

  return v24;
}

- (double)_accessibilityScaledYValue:(double)a3
{
  v4 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewYAxisMin"];
  [v4 doubleValue];
  double v6 = v5;

  for (; a3 < v6; a3 = a3 * 10.0)
    ;
  return a3;
}

- (id)_accessibilitySeriesTitle
{
  v2 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewDisplayName"];
  if (!v2) {
    v2 = &stru_26F6BBCE0;
  }

  return v2;
}

- (id)_accessibilityXAxis
{
  id v3 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewXAxisTitle"];
  if (!v3)
  {
    id v3 = accessibilityLocalizedString(@"time.axis.title");
  }
  v4 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewGraphElementsXValues"];
  double v5 = (void *)[objc_alloc(MEMORY[0x263EFABC0]) initWithTitle:v3 categoryOrder:v4];

  return v5;
}

- (id)_accessibilityYAxis
{
  id v3 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewYAxisValueUnit"];
  if (!v3)
  {
    id v3 = accessibilityLocalizedString(@"chart.value.and.unit");
  }
  v4 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewYValueDescriptorBlock"];
  if (!v4)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __47__HKGraphViewAccessibility__accessibilityYAxis__block_invoke;
    v18 = &unk_265125E00;
    v19 = self;
    id v20 = v3;
    v4 = (void *)MEMORY[0x24564FBB0](&v15);
  }
  double v5 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewYAxisMin", v15, v16, v17, v18, v19];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewYAxisMax"];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = objc_alloc(MEMORY[0x263EFABF8]);
  double v12 = [(HKGraphViewAccessibility *)self _accessibilitySeriesTitle];
  id v13 = (void *)[v11 initWithTitle:v12 lowerBound:0 upperBound:v4 gridlinePositions:v7 valueDescriptionProvider:v10];

  return v13;
}

id __47__HKGraphViewAccessibility__accessibilityYAxis__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityScaledYValue:");
  uint64_t v3 = v2;
  v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [*(id *)(a1 + 32) _accessibilityValueForKey:@"kAXGraphViewUnit"];
  double v7 = objc_msgSend(v4, "stringWithFormat:", v5, v3, v6);

  return v7;
}

- (BOOL)_accessibilityIsContinuous
{
  return [(HKGraphViewAccessibility *)self _accessibilityIntegerValueForKey:@"kAXGraphViewDataSeriesType"] == 1;
}

- (id)_accessibilityChartSummary
{
  uint64_t v3 = [(HKGraphViewAccessibility *)self _accessibilityValueForKey:@"kAXGraphViewGraphElementsXValues"];
  v4 = [(HKGraphViewAccessibility *)self _accessibilitySeriesTitle];
  if ([v4 length] && objc_msgSend(v3, "count"))
  {
    uint64_t v5 = accessibilityLocalizedString(@"chart.summary.format");
    double v6 = NSString;
    double v7 = [v3 firstObject];
    v8 = [v3 lastObject];
    double v9 = objc_msgSend(v6, "stringWithFormat:", v5, v4, v7, v8);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

@end