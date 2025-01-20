@interface HKInteractiveChartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)_axConfigureGraphAccessibilityFromData:(id)a3 forGraphView:(id)a4;
+ (void)_axConfigureGraphViewInfoFromData:(id)a3 forGraphView:(id)a4;
+ (void)_axTrimAndInterpolateValues:(id *)a3 withXvalues:(id *)a4;
- (id)_displayNameForDisplayType:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5;
- (void)_setDateSelectorToVisibleRange;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphViewDidEndSelection:(id)a3;
@end

@implementation HKInteractiveChartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKInteractiveChartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKGraphZoomLevelConfiguration"];
  [v3 validateClass:@"HKAccessibilityData"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"HKGraphZoomLevelConfiguration", @"timeScopeForDateRange:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"_setDateSelectorToVisibleRange", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"_replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:", "v", "q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKTimeScopeControl", @"selectedTimeScope", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"primaryGraphViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphViewController", @"graphView", "@", 0);
  [v3 validateClass:@"HKInteractiveChartViewController" hasInstanceVariable:@"_currentTimeView" withType:"HKCurrentTimeView"];
  [v3 validateClass:@"HKInteractiveChartViewController" hasInstanceVariable:@"_currentValueView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"accessibilityDataForChart", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityData", @"accessibilitySpans", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilitySpan", @"dataComprehensionMinYValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilitySpan", @"dataComprehensionMaxYValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilitySpan", @"dataComprehensionUnitForChart", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilitySpan", @"dataSeriesType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityData", @"accessibilityPointData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityPointData", @"horizontalTimeCoordinate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityPointData", @"values", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityPointData", @"horizontalScreenCoordinate", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityValue", @"valueTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityValue", @"valueType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityValue", @"valueDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAccessibilityValue", @"valueAsNumber", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"_displayNameForDisplayType:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"_currentValueEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"lollipopController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"graphView:didUpdateSelectedPoint:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartViewController", @"graphViewDidEndSelection:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayType", @"localization", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKDisplayTypeLocalization", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKLollipopController", @"isVisible", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  [(HKInteractiveChartViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HKInteractiveChartViewControllerAccessibility *)self safeValueForKey:@"accessibilityDataForChart"];
  v4 = [(HKInteractiveChartViewControllerAccessibility *)self safeValueForKey:@"primaryGraphViewController"];
  v5 = [v4 safeUIViewForKey:@"graphView"];

  [(id)objc_opt_class() _axConfigureGraphViewInfoFromData:v3 forGraphView:v5];
  [(id)objc_opt_class() _axConfigureGraphAccessibilityFromData:v3 forGraphView:v5];
}

+ (void)_axConfigureGraphViewInfoFromData:(id)a3 forGraphView:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  MEMORY[0x24564F8C0](@"HKAccessibilityData");
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 safeDictionaryForKey:@"accessibilitySpans"];
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v13), (void)v20);
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      v15 = [v8 firstObject];
      uint64_t v16 = [v15 safeValueForKey:@"dataComprehensionMinYValue"];
      if (v16) {
        v17 = (void *)v16;
      }
      else {
        v17 = &unk_26F6C04E8;
      }
      objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v17, @"kAXGraphViewYAxisMin", (void)v20);
      v18 = [v15 safeValueForKey:@"dataComprehensionMaxYValue"];
      [v6 _accessibilitySetRetainedValue:v18 forKey:@"kAXGraphViewYAxisMax"];

      v19 = [v15 safeStringForKey:@"dataComprehensionUnitForChart"];
      [v6 _accessibilitySetRetainedValue:v19 forKey:@"kAXGraphViewUnit"];

      objc_msgSend(v6, "_accessibilitySetIntegerValue:forKey:", objc_msgSend(v15, "safeIntegerForKey:", @"dataSeriesType"), @"kAXGraphViewDataSeriesType");
    }
  }
}

+ (void)_axConfigureGraphAccessibilityFromData:(id)a3 forGraphView:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x24564F8C0](@"HKAccessibilityData");
  if (objc_opt_isKindOfClass())
  {
    id v34 = a1;
    id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v36 = v6;
    [v6 safeArrayForKey:@"accessibilityPointData"];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (!v8) {
      goto LABEL_26;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    uint64_t v37 = *(void *)v56;
    id v38 = v7;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v39 = v9;
      do
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
        MEMORY[0x24564F8C0](@"HKAccessibilityPointData");
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v7];
          v47 = [v12 safeStringForKey:@"horizontalTimeCoordinate"];
          objc_msgSend(v13, "setAccessibilityLabel:");
          v46 = v12;
          v14 = [v12 safeArrayForKey:@"values"];
          v15 = objc_opt_new();
          v48 = v13;
          v45 = v14;
          if ([v14 count])
          {
            uint64_t v44 = v11;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id v16 = v14;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v59 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v52;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v52 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  long long v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                  long long v22 = objc_msgSend(v21, "safeStringForKey:", @"valueTitle", v34);
                  if (([v15 containsObject:v22] & 1) == 0) {
                    [v15 addObject:v22];
                  }
                  long long v23 = [v21 safeStringForKey:@"valueType"];
                  [v15 axSafelyAddObject:v23];

                  v24 = [v21 safeStringForKey:@"valueDescription"];
                  [v15 axSafelyAddObject:v24];
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v59 count:16];
              }
              while (v18);
            }

            uint64_t v25 = MEMORY[0x24564F8D0](v15);
            v26 = [v16 lastObject];
            v27 = [v26 safeValueForKey:@"valueAsNumber"];

            if (v27)
            {
              [v40 addObject:v27];
              uint64_t v10 = v37;
              id v7 = v38;
              uint64_t v9 = v39;
              uint64_t v11 = v44;
LABEL_23:

              [v41 addObject:v47];
              [v48 setAccessibilityValue:v25];
              [v46 safeCGFloatForKey:@"horizontalScreenCoordinate"];
              double v29 = v28 + -5.0;
              [v7 frame];
              double v31 = v30;
              [v7 frame];
              objc_msgSend(v48, "setAccessibilityFrameInContainerSpace:", v29, v31, 10.0);
              [v42 addObject:v48];

              goto LABEL_24;
            }
            uint64_t v10 = v37;
            id v7 = v38;
            uint64_t v9 = v39;
            uint64_t v11 = v44;
          }
          else
          {
            uint64_t v25 = 0;
          }
          v27 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v34);
          [v40 addObject:v27];
          goto LABEL_23;
        }
LABEL_24:
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (!v9)
      {
LABEL_26:
        objc_msgSend(v7, "setAccessibilityElements:", v42, v34);
        id v49 = v41;
        id v50 = v40;
        [v35 _axTrimAndInterpolateValues:&v50 withXvalues:&v49];
        id v32 = v50;

        id v33 = v49;
        [v7 _accessibilitySetRetainedValue:v32 forKey:@"kAXGraphViewGraphElementsYValues"];
        [v7 _accessibilitySetRetainedValue:v33 forKey:@"kAXGraphViewGraphElementsXValues"];

        id v6 = v36;
        break;
      }
    }
  }
}

+ (void)_axTrimAndInterpolateValues:(id *)a3 withXvalues:(id *)a4
{
  if (a3)
  {
    if (a4)
    {
      if ([*a3 count])
      {
        if ([*a4 count])
        {
          uint64_t v6 = [*a3 count];
          if (v6 == [*a4 count])
          {
            unint64_t v7 = 0x263EFF000uLL;
            if ([*a3 count])
            {
              uint64_t v8 = 0;
              while (1)
              {
                uint64_t v9 = [*a3 objectAtIndexedSubscript:v8];
                uint64_t v10 = [MEMORY[0x263EFF9D0] null];
                int v11 = [v9 isEqual:v10];

                if (!v11) {
                  break;
                }
                if ([*a3 count] <= (unint64_t)++v8) {
                  goto LABEL_12;
                }
              }
              if (!v8) {
                goto LABEL_13;
              }
LABEL_12:
              objc_msgSend(*a3, "removeObjectsInRange:", 0, v8);
              objc_msgSend(*a4, "removeObjectsInRange:", 0, v8);
            }
LABEL_13:
            if ([*a3 count])
            {
              int v12 = [*a3 count];
              int v13 = v12 - 1;
              if (v12 >= 1)
              {
                uint64_t v14 = (v12 - 1);
                while (1)
                {
                  v15 = [*a3 objectAtIndexedSubscript:v14];
                  id v16 = [MEMORY[0x263EFF9D0] null];
                  int v17 = [v15 isEqual:v16];

                  if (!v17) {
                    break;
                  }
                  if (v14-- <= 0)
                  {
                    LODWORD(v14) = -1;
                    break;
                  }
                }
                int v19 = v13 - v14;
                if (v13 > (int)v14)
                {
                  uint64_t v20 = v19;
                  objc_msgSend(*a3, "removeObjectsInRange:", (int)v14 + 1, v19);
                  objc_msgSend(*a4, "removeObjectsInRange:", (int)v14 + 1, v20);
                }
              }
              if ((unint64_t)[*a3 count] >= 3)
              {
                int v46 = [*a3 count];
                if (v46 >= 1)
                {
                  uint64_t v21 = 0;
                  do
                  {
                    uint64_t v22 = v21 << 32;
                    uint64_t v23 = (int)v21;
                    while (1)
                    {
                      v24 = [*a3 objectAtIndexedSubscript:v23];
                      uint64_t v25 = [*(id *)(v7 + 2512) null];
                      char v26 = [v24 isEqual:v25];

                      if (v26) {
                        break;
                      }
                      ++v23;
                      v22 += 0x100000000;
                      if (v23 >= v46) {
                        return;
                      }
                    }
                    if ((int)v23 >= v46) {
                      break;
                    }
                    uint64_t v27 = 0;
                    uint64_t v21 = v22 >> 32;
                    int v28 = 1;
                    uint64_t v45 = v22 >> 32;
                    while (1)
                    {
                      double v29 = [*a3 objectAtIndexedSubscript:v21];
                      unint64_t v30 = v7;
                      double v31 = [*(id *)(v7 + 2512) null];
                      int v32 = [v29 isEqual:v31];

                      if (!v32) {
                        break;
                      }
                      ++v21;
                      ++v28;
                      ++v27;
                      unint64_t v7 = v30;
                      if (v46 == v21) {
                        return;
                      }
                    }
                    id v33 = [*a3 objectAtIndexedSubscript:(int)v23 - 1];
                    [v33 doubleValue];
                    double v35 = v34;

                    id v36 = [*a3 objectAtIndexedSubscript:v21];
                    [v36 doubleValue];
                    double v38 = v37;

                    uint64_t v39 = v45;
                    if ((int)v23 < (int)v21)
                    {
                      double v40 = (v38 - v35) / (double)v28;
                      do
                      {
                        id v41 = NSNumber;
                        id v42 = [*a3 objectAtIndexedSubscript:v39 - 1];
                        [v42 doubleValue];
                        uint64_t v44 = [v41 numberWithDouble:v40 + v43];
                        [*a3 setObject:v44 atIndexedSubscript:v39];

                        ++v39;
                        --v27;
                      }
                      while (v27);
                    }
                    unint64_t v7 = v30;
                  }
                  while ((int)v21 < v46);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_setDateSelectorToVisibleRange
{
  v3.receiver = self;
  v3.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  [(HKInteractiveChartViewControllerAccessibility *)&v3 _setDateSelectorToVisibleRange];
  [(HKInteractiveChartViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility _replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:](&v5, sel__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated_, a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __117__HKInteractiveChartViewControllerAccessibility__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 view];
  v2 = [v1 _accessibilityViewAncestorIsKindOf:objc_opt_class()];

  [v2 _accessibilityClearChildren];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_displayNameForDisplayType:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  id v4 = a3;
  objc_super v5 = [(HKInteractiveChartViewControllerAccessibility *)&v10 _displayNameForDisplayType:v4];
  uint64_t v6 = objc_msgSend(v4, "safeValueForKeyPath:", @"localization.displayName", v10.receiver, v10.super_class);

  unint64_t v7 = [(HKInteractiveChartViewControllerAccessibility *)self safeValueForKey:@"primaryGraphViewController"];
  uint64_t v8 = [v7 safeUIViewForKey:@"graphView"];

  [v8 _accessibilitySetRetainedValue:v6 forKey:@"kAXGraphViewDisplayName"];

  return v5;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  [(HKInteractiveChartViewControllerAccessibility *)&v10 graphView:a3 didUpdateSelectedPoint:a4];
  int v5 = [(HKInteractiveChartViewControllerAccessibility *)self safeBoolForKey:@"_currentValueEnabled"];
  uint64_t v6 = [(HKInteractiveChartViewControllerAccessibility *)self safeValueForKey:@"lollipopController"];
  uint64_t v7 = [v6 safeBoolForKey:@"isVisible"];

  if (v5) {
    uint64_t v8 = @"_currentValueView";
  }
  else {
    uint64_t v8 = @"_currentTimeView";
  }
  uint64_t v9 = [(HKInteractiveChartViewControllerAccessibility *)self safeUIViewForKey:v8];
  [v9 setAccessibilityElementsHidden:v7];
}

- (void)graphViewDidEndSelection:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  [(HKInteractiveChartViewControllerAccessibility *)&v5 graphViewDidEndSelection:a3];
  id v4 = [(HKInteractiveChartViewControllerAccessibility *)self safeUIViewForKey:@"_currentValueView"];
  [v4 setAccessibilityElementsHidden:0];
}

@end