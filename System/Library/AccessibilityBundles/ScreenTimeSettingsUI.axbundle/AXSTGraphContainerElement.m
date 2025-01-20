@interface AXSTGraphContainerElement
- (AXChartDescriptor)accessibilityChartDescriptor;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilitySupportsChartsV2;
- (double)_updateYValueForType:(double)a3;
- (id)_accessibilityChartSummary;
- (id)_accessibilityDataSeries;
- (id)_accessibilityXAxis;
- (id)_accessibilityYAxis;
- (id)_axBarElements;
- (id)_axTimeValues;
- (id)_axXAxisLabels;
- (int64_t)accessibilityContainerType;
- (int64_t)mode;
- (unint64_t)itemType;
- (void)setAccessibilityChartDescriptor:(id)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation AXSTGraphContainerElement

- (int64_t)accessibilityContainerType
{
  return 13;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFABC8]);
  v4 = [(AXSTGraphContainerElement *)self _accessibilitySeriesTitle];
  v5 = [(AXSTGraphContainerElement *)self _accessibilityChartSummary];
  v6 = [(AXSTGraphContainerElement *)self _accessibilityXAxis];
  v7 = [(AXSTGraphContainerElement *)self _accessibilityYAxis];
  v8 = [(AXSTGraphContainerElement *)self _accessibilityDataSeries];
  v12[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v10 = (void *)[v3 initWithTitle:v4 summary:v5 xAxisDescriptor:v6 yAxisDescriptor:v7 series:v9];

  return (AXChartDescriptor *)v10;
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)_axXAxisLabels
{
  v2 = [(AXSTGraphContainerElement *)self _axBarElements];
  id v3 = [v2 axMapObjectsUsingBlock:&__block_literal_global];

  return v3;
}

id __43__AXSTGraphContainerElement__axXAxisLabels__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityLabel];
  id v3 = [v2 componentsSeparatedByString:@","];
  v4 = [v3 firstObject];

  return v4;
}

- (id)_accessibilityXAxis
{
  id v3 = objc_alloc(MEMORY[0x263EFABC0]);
  v4 = accessibilityLocalizedString(@"graph.x.axis.description.time");
  v5 = [(AXSTGraphContainerElement *)self _axXAxisLabels];
  v6 = (void *)[v3 initWithTitle:v4 categoryOrder:v5];

  return v6;
}

- (id)_accessibilityYAxis
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(AXSTGraphContainerElement *)self itemType];
  if (v3 - 1 >= 4)
  {
    if (v3 == 5)
    {
      v5 = @"graph.notifications.unit";
      goto LABEL_11;
    }
    if (v3 == 6)
    {
      v5 = @"graph.pickups.unit";
      goto LABEL_11;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_12;
  }
  int64_t v4 = [(AXSTGraphContainerElement *)self mode];
  if (!v4)
  {
    v5 = @"graph.hours.unit";
    goto LABEL_11;
  }
  if (v4 != 1) {
    goto LABEL_8;
  }
  v5 = @"graph.minutes.unit";
LABEL_11:
  v6 = accessibilityLocalizedString(v5);
LABEL_12:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [(AXSTGraphContainerElement *)self _axTimeValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v14 doubleValue];
        if (v12 >= v15) {
          double v12 = v15;
        }
        [v14 doubleValue];
        if (v11 < v16) {
          double v11 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }

  id v17 = objc_alloc(MEMORY[0x263EFABF8]);
  v18 = accessibilityLocalizedString(@"graph.y.axis.description.usage");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48__AXSTGraphContainerElement__accessibilityYAxis__block_invoke;
  v22[3] = &unk_26514C1F8;
  id v23 = v6;
  id v19 = v6;
  v20 = (void *)[v17 initWithTitle:v18 lowerBound:0 upperBound:v22 gridlinePositions:v12 valueDescriptionProvider:v11];

  return v20;
}

id __48__AXSTGraphContainerElement__accessibilityYAxis__block_invoke(uint64_t a1, double a2)
{
  unint64_t v3 = [NSString stringWithFormat:@"%.2f", *(void *)&a2];
  int64_t v4 = NSString;
  v5 = accessibilityLocalizedString(@"chart.value.and.unit");
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3, *(void *)(a1 + 32));

  return v6;
}

- (id)_axTimeValues
{
  unint64_t v3 = [(AXSTGraphContainerElement *)self _axBarElements];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AXSTGraphContainerElement__axTimeValues__block_invoke;
  v6[3] = &unk_26514C220;
  v6[4] = self;
  int64_t v4 = [v3 axMapObjectsUsingBlock:v6];

  return v4;
}

id __42__AXSTGraphContainerElement__axTimeValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = NSNumber;
  v5 = *(void **)(a1 + 32);
  objc_opt_class();
  v6 = [v3 safeValueForKey:@"dataPoint"];
  v7 = [v6 safeValueForKey:@"total"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  [v8 doubleValue];
  objc_msgSend(v5, "_updateYValueForType:");
  uint64_t v9 = objc_msgSend(v4, "numberWithDouble:");

  return v9;
}

- (id)_accessibilityDataSeries
{
  id v3 = [(AXSTGraphContainerElement *)self _axXAxisLabels];
  v22 = self;
  int64_t v4 = [(AXSTGraphContainerElement *)self _axTimeValues];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v3 count];
  if (v5 >= v6) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  uint64_t v8 = objc_opt_new();
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = [v3 axSafeObjectAtIndex:i];
      double v11 = [v4 axSafeObjectAtIndex:i];
      [v11 doubleValue];
      double v13 = v12;

      id v14 = objc_alloc(MEMORY[0x263EFABD8]);
      double v15 = [MEMORY[0x263EFABE0] valueWithCategory:v10];
      double v16 = [MEMORY[0x263EFABE0] valueWithNumber:v13];
      id v17 = (void *)[v14 initWithX:v15 y:v16];

      [v8 addObject:v17];
    }
  }
  id v18 = objc_alloc(MEMORY[0x263EFABE8]);
  id v19 = [(AXSTGraphContainerElement *)v22 _accessibilitySeriesTitle];
  v20 = (void *)[v18 initWithName:v19 isContinuous:0 dataPoints:v8];

  return v20;
}

- (double)_updateYValueForType:(double)a3
{
  if ([(AXSTGraphContainerElement *)self itemType] == 1
    || [(AXSTGraphContainerElement *)self itemType] == 2
    || [(AXSTGraphContainerElement *)self itemType] == 3
    || [(AXSTGraphContainerElement *)self itemType] == 4)
  {
    if (![(AXSTGraphContainerElement *)self mode])
    {
      double v5 = 3600.0;
      return a3 / v5;
    }
    if ([(AXSTGraphContainerElement *)self mode] == 1)
    {
      double v5 = 60.0;
      return a3 / v5;
    }
  }
  return a3;
}

- (id)_accessibilityChartSummary
{
  id v3 = [(AXSTGraphContainerElement *)self _axXAxisLabels];
  int64_t v4 = [(AXSTGraphContainerElement *)self _accessibilitySeriesTitle];
  if ([v4 length] && objc_msgSend(v3, "count"))
  {
    double v5 = accessibilityLocalizedString(@"chart.summary.format");
    unint64_t v6 = NSString;
    int v7 = [v3 firstObject];
    uint64_t v8 = [v3 lastObject];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v5, v4, v7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_axBarElements
{
  v2 = [(AXSTGraphContainerElement *)self accessibilityElements];
  id v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_317);

  return v3;
}

uint64_t __43__AXSTGraphContainerElement__axBarElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565EFD0](@"STBarView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setAccessibilityChartDescriptor:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (void).cxx_destruct
{
}

@end