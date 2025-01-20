@interface PKSpendingSummaryChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsContinuous;
- (BOOL)_accessibilitySupportsChartsV2;
- (id)_accessibilityChartSummary;
- (id)_accessibilityDataSeries;
- (id)_accessibilitySeriesTitle;
- (id)_accessibilityXAxis;
- (id)_accessibilityYAxis;
- (id)_axSpendingValues;
- (id)_axStartDates;
- (id)_axStringFromCurrency:(id)a3;
- (id)accessibilityChartDescriptor;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (void)layoutSubviews;
@end

@implementation PKSpendingSummaryChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSpendingSummaryChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKSpendingSummaryChartView" hasInstanceVariable:@"_summary" withType:"PKSpendingSummary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummary", @"spendingsPerCalendarUnit", "@", 0);
  [v3 validateClass:@"PKSpendingSummaryChartView" hasInstanceVariable:@"_bars" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummaryChartView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummary", @"summaryType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummary", @"startDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummary", @"endDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSpendingSummary", @"totalSpending", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCurrencyAmount", @"currency", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCurrencyAmount", @"amount", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"spending.summary.label");
}

- (id)_axStringFromCurrency:(id)a3
{
  return (id)[a3 minimalFormattedStringValue];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryChartViewAccessibility;
  [(PKSpendingSummaryChartViewAccessibility *)&v3 layoutSubviews];
  [(PKSpendingSummaryChartViewAccessibility *)self _accessibilitySetRetainedValue:0 forKey:@"accessibilityElements"];
}

- (id)accessibilityElements
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v2 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilityValueForKey:@"accessibilityElements"];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    char v68 = 0;
    v4 = [(PKSpendingSummaryChartViewAccessibility *)self safeValueForKey:@"_summary"];
    v5 = __UIAccessibilitySafeClass();

    uint64_t v6 = [v5 safeIntegerForKey:@"summaryType"];
    v7 = [(PKSpendingSummaryChartViewAccessibility *)self safeValueForKey:@"_summary"];
    v8 = [v7 safeArrayForKey:@"spendingsPerCalendarUnit"];

    v48 = [MEMORY[0x263EFF980] array];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = [(PKSpendingSummaryChartViewAccessibility *)self safeArrayForKey:@"_bars"];
    uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v56)
    {
      unint64_t v9 = 0;
      uint64_t v54 = *(void *)v65;
      uint64_t v46 = v6;
      v47 = v8;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v65 != v54) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (objc_msgSend(v11, "_accessibilityViewIsVisible", v43, v44))
          {
            if (v9 >= [v8 count])
            {
              v14 = 0;
            }
            else
            {
              char v68 = 0;
              v12 = [v8 objectAtIndexedSubscript:v9];
              uint64_t v13 = __UIAccessibilitySafeClass();

              if (v68) {
                goto LABEL_40;
              }
              v14 = (void *)v13;
            }
            v15 = [[UIAXPKSpendingElement alloc] initWithAccessibilityContainer:self];
            v63[0] = MEMORY[0x263EF8330];
            v63[1] = 3221225472;
            v63[2] = __64__PKSpendingSummaryChartViewAccessibility_accessibilityElements__block_invoke;
            v63[3] = &unk_2651411D0;
            v63[4] = v11;
            [(UIAXPKSpendingElement *)v15 _setAccessibilityFrameBlock:v63];
            char v68 = 0;
            v16 = [v14 safeValueForKey:@"startDate"];
            v58 = __UIAccessibilitySafeClass();

            if (v68) {
              goto LABEL_40;
            }
            char v68 = 0;
            v17 = [v14 safeValueForKey:@"endDate"];
            uint64_t v18 = __UIAccessibilitySafeClass();

            if (v68) {
              goto LABEL_40;
            }
            [(UIAXPKSpendingElement *)v15 setStartDate:v58];
            [(UIAXPKSpendingElement *)v15 setEndDate:v18];
            v57 = v14;
            if (v6 == 1)
            {
              v19 = NSString;
              v25 = accessibilityLocalizedString(@"date.range");
              uint64_t v20 = i;
              AXDateStringForFormat();
              v22 = uint64_t v21 = v18;
              v23 = AXDateStringForFormat();
              v24 = objc_msgSend(v19, "stringWithFormat:", v25, v22, v23);
              [(UIAXPKSpendingElement *)v15 setAccessibilityLabel:v24];

              v14 = v57;
              uint64_t i = v20;

              uint64_t v18 = v21;
            }
            else
            {
              v25 = AXDateStringForFormat();
              [(UIAXPKSpendingElement *)v15 setAccessibilityLabel:v25];
            }

            char v68 = 0;
            v26 = [v14 safeValueForKey:@"totalSpending"];
            v27 = __UIAccessibilitySafeClass();

            if (v68) {
LABEL_40:
            }
              abort();
            v28 = [v27 amount];
            [v28 doubleValue];
            -[UIAXPKSpendingElement setChartValue:](v15, "setChartValue:");

            v50 = v27;
            v29 = [v27 currency];
            v52 = v15;
            [(UIAXPKSpendingElement *)v15 setCurrency:v29];

            v30 = [v14 safeArrayForKey:@"orderedSpendingCategories"];
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v69 count:16];
            uint64_t v53 = i;
            v51 = (void *)v18;
            if (v31)
            {
              uint64_t v32 = v31;
              v33 = 0;
              uint64_t v34 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v60 != v34) {
                    objc_enumerationMutation(v30);
                  }
                  v36 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if ((unint64_t)[v30 count] < 2)
                    {
                      v38 = 0;
                    }
                    else
                    {
                      v37 = [v36 totalAmount];
                      v38 = [(PKSpendingSummaryChartViewAccessibility *)self _axStringFromCurrency:v37];
                    }
                    objc_msgSend(v36, "merchantCategory", v43, v44, v45);
                    PKLocalizedStringFromMerchantCategory();
                    v44 = v38;
                    v43 = v45 = @"__AXStringForVariablesSentinel";
                    uint64_t v39 = __UIAXStringForVariables();

                    v33 = (void *)v39;
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v59 objects:v69 count:16];
              }
              while (v32);
            }
            else
            {
              v33 = 0;
            }
            v40 = -[PKSpendingSummaryChartViewAccessibility _axStringFromCurrency:](self, "_axStringFromCurrency:", v50, v43, v44, v45);
            v43 = v33;
            v44 = @"__AXStringForVariablesSentinel";
            v41 = __UIAXStringForVariables();
            [(UIAXPKSpendingElement *)v52 setAccessibilityValue:v41];

            [v48 addObject:v52];
            ++v9;

            uint64_t v6 = v46;
            v8 = v47;
            uint64_t i = v53;
          }
        }
        uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v56);
    }

    [(PKSpendingSummaryChartViewAccessibility *)self _accessibilitySetRetainedValue:v48 forKey:@"accessibilityElements"];
    id v3 = v48;
  }

  return v3;
}

uint64_t __64__PKSpendingSummaryChartViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityFrame];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)_axStartDates
{
  v2 = [(PKSpendingSummaryChartViewAccessibility *)self accessibilityElements];
  id v3 = [v2 axMapObjectsUsingBlock:&__block_literal_global_6];

  return v3;
}

uint64_t __56__PKSpendingSummaryChartViewAccessibility__axStartDates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityLabel];
}

- (id)_axSpendingValues
{
  v2 = [(PKSpendingSummaryChartViewAccessibility *)self accessibilityElements];
  id v3 = [v2 axMapObjectsUsingBlock:&__block_literal_global_395];

  return v3;
}

uint64_t __60__PKSpendingSummaryChartViewAccessibility__axSpendingValues__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 chartValue];

  return objc_msgSend(v2, "numberWithDouble:");
}

- (id)accessibilityChartDescriptor
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFABC8]);
  v4 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilitySeriesTitle];
  v5 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilityChartSummary];
  uint64_t v6 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilityXAxis];
  v7 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilityYAxis];
  v8 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilityDataSeries];
  v12[0] = v8;
  unint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v10 = (void *)[v3 initWithTitle:v4 summary:v5 xAxisDescriptor:v6 yAxisDescriptor:v7 series:v9];

  return v10;
}

- (id)_accessibilityDataSeries
{
  id v3 = [(PKSpendingSummaryChartViewAccessibility *)self _axStartDates];
  v22 = self;
  v4 = [(PKSpendingSummaryChartViewAccessibility *)self _axSpendingValues];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v3 count];
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
      v10 = [v3 axSafeObjectAtIndex:i];
      v11 = [v4 axSafeObjectAtIndex:i];
      [v11 doubleValue];
      double v13 = v12;

      id v14 = objc_alloc(MEMORY[0x263EFABD8]);
      v15 = [MEMORY[0x263EFABE0] valueWithCategory:v10];
      v16 = [MEMORY[0x263EFABE0] valueWithNumber:v13];
      v17 = (void *)[v14 initWithX:v15 y:v16];

      [v8 addObject:v17];
    }
  }
  id v18 = objc_alloc(MEMORY[0x263EFABE8]);
  v19 = [(PKSpendingSummaryChartViewAccessibility *)v22 _accessibilitySeriesTitle];
  uint64_t v20 = objc_msgSend(v18, "initWithName:isContinuous:dataPoints:", v19, -[PKSpendingSummaryChartViewAccessibility _accessibilityIsContinuous](v22, "_accessibilityIsContinuous"), v8);

  return v20;
}

- (id)_accessibilitySeriesTitle
{
  id v3 = [(PKSpendingSummaryChartViewAccessibility *)self safeValueForKey:@"_summary"];
  v4 = __UIAccessibilitySafeClass();

  uint64_t v5 = [v4 safeIntegerForKey:@"summaryType"];
  switch(v5)
  {
    case 2:
      unint64_t v6 = @"yearly.spending.summary";
      goto LABEL_7;
    case 1:
      unint64_t v6 = @"monthly.spending.summary";
      goto LABEL_7;
    case 0:
      unint64_t v6 = @"weekly.spending.summary";
LABEL_7:
      int v7 = accessibilityLocalizedString(v6);
      goto LABEL_9;
  }
  int v7 = [(PKSpendingSummaryChartViewAccessibility *)self accessibilityLabel];
LABEL_9:

  return v7;
}

- (id)_accessibilityXAxis
{
  v2 = [(PKSpendingSummaryChartViewAccessibility *)self _axStartDates];
  id v3 = objc_alloc(MEMORY[0x263EFABC0]);
  v4 = accessibilityLocalizedString(@"graph.x.axis.description.time");
  uint64_t v5 = (void *)[v3 initWithTitle:v4 categoryOrder:v2];

  return v5;
}

- (id)_accessibilityYAxis
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(PKSpendingSummaryChartViewAccessibility *)self accessibilityElements];
  v4 = [v3 firstObject];
  uint64_t v5 = [v4 currency];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v6 = [(PKSpendingSummaryChartViewAccessibility *)self accessibilityElements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v13 chartValue];
        if (v11 >= v14) {
          double v11 = v14;
        }
        [v13 chartValue];
        if (v10 < v15) {
          double v10 = v15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }

  id v16 = objc_alloc(MEMORY[0x263EFABF8]);
  v17 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilitySeriesTitle];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__PKSpendingSummaryChartViewAccessibility__accessibilityYAxis__block_invoke;
  v21[3] = &unk_265141218;
  id v22 = v5;
  id v18 = v5;
  v19 = (void *)[v16 initWithTitle:v17 lowerBound:0 upperBound:v21 gridlinePositions:v11 valueDescriptionProvider:v10];

  return v19;
}

id __62__PKSpendingSummaryChartViewAccessibility__accessibilityYAxis__block_invoke(uint64_t a1, double a2)
{
  id v3 = [NSString stringWithFormat:@"%.2f", *(void *)&a2];
  v4 = NSString;
  uint64_t v5 = accessibilityLocalizedString(@"chart.value.and.unit");
  unint64_t v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3, *(void *)(a1 + 32));

  return v6;
}

- (BOOL)_accessibilityIsContinuous
{
  return 0;
}

- (id)_accessibilityChartSummary
{
  id v3 = [(PKSpendingSummaryChartViewAccessibility *)self _axStartDates];
  v4 = [(PKSpendingSummaryChartViewAccessibility *)self _accessibilitySeriesTitle];
  if ([v4 length] && objc_msgSend(v3, "count"))
  {
    uint64_t v5 = accessibilityLocalizedString(@"chart.summary.format");
    unint64_t v6 = NSString;
    uint64_t v7 = [v3 firstObject];
    uint64_t v8 = [v3 lastObject];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v5, v4, v7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end