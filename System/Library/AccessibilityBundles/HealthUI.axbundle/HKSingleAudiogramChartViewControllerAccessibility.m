@interface HKSingleAudiogramChartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCollectSeriesDataForGraphView:(id)a3;
- (id)_axHearingSensitivityFormatter;
- (id)_axSelectedXCoordinateForGraphView:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetupGraphViewDescription;
- (void)_axUpdateAXElementsForGraphView;
- (void)_axUpdateSelectionAXElementsForGraphView;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphViewDidEndSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HKSingleAudiogramChartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKSingleAudiogramChartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKSingleAudiogramChartViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSingleAudiogramChartViewController", @"graphView:didUpdateSelectedPoint:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSingleAudiogramChartViewController", @"graphViewDidEndSelection:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSingleAudiogramChartViewController", @"_formattedFrequencyStringForFrequency:", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSingleAudiogramChartViewController", @"scalarGraphViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSingleAudiogramChartViewController", @"annotationViewDataSource", "@", 0);
  [v3 validateClass:@"HKAudiogramAnnotationViewDataSource" hasSwiftFieldOfAnyClass:@"hearingSensitivityFormatter"];
  [v3 validateClass:@"HKInteractiveChartHearingSensitivityFormatter" isKindOfClass:@"HKInteractiveChartDataFormatter"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartDataFormatter", @"formattedSelectedRangeLabelDataWithChartData:context:", "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKInteractiveChartDataFormatter", @"valueStringFromNumber:", "@", "@", 0);
  [v3 validateClass:@"HKScalarGraphViewController" isKindOfClass:@"HKGraphViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphViewController", @"graphView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphView", @"allSeries", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphView", @"overlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphView", @"enumerateVisibleCoordinatesForSeries:block:", "v", "@", "@?", 0);
  [v3 validateClass:@"HKGraphView" hasInstanceVariable:@"_seriesGroupRows" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKGraphSeries", @"visibleValueRange", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKValueRange", @"minValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKValueRange", @"maxValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKLineSeriesBlockCoordinate", @"userInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKLineSeriesBlockCoordinate", @"coordinate", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAudiogramChartData", @"frequencyHertz", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAudiogramChartData", @"sensitivityDBHL", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAudiogramChartData", @"isLeftEar", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSelectedRangeData", @"titleOverride", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSelectedRangeData", @"attributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKGraphViewSeriesGroup", @"selectionContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKGraphViewSelectionContext", @"selectedRangeBoundariesXValue", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)HKSingleAudiogramChartViewControllerAccessibility;
  [(HKSingleAudiogramChartViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axSetupGraphViewDescription];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axUpdateAXElementsForGraphView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKSingleAudiogramChartViewControllerAccessibility;
  [(HKSingleAudiogramChartViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axSetupGraphViewDescription];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axUpdateAXElementsForGraphView];
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKSingleAudiogramChartViewControllerAccessibility;
  [(HKSingleAudiogramChartViewControllerAccessibility *)&v5 graphView:a3 didUpdateSelectedPoint:a4];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axUpdateSelectionAXElementsForGraphView];
}

- (void)graphViewDidEndSelection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKSingleAudiogramChartViewControllerAccessibility;
  [(HKSingleAudiogramChartViewControllerAccessibility *)&v4 graphViewDidEndSelection:a3];
  [(HKSingleAudiogramChartViewControllerAccessibility *)self _axUpdateSelectionAXElementsForGraphView];
}

- (void)_axSetupGraphViewDescription
{
  objc_super v3 = [(HKSingleAudiogramChartViewControllerAccessibility *)self safeValueForKey:@"scalarGraphViewController"];
  objc_super v4 = [v3 safeUIViewForKey:@"graphView"];

  if (v4)
  {
    [v4 _accessibilitySetShouldHitTestFallBackToNearestChild:1];
    objc_super v5 = accessibilityYodelLocalizedString(@"frequency.axis.title");
    [v4 _accessibilitySetRetainedValue:v5 forKey:@"kAXGraphViewXAxisTitle"];

    v6 = accessibilityYodelLocalizedString(@"audiogram.value.and.unit");
    [v4 _accessibilitySetRetainedValue:v6 forKey:@"kAXGraphViewYAxisValueUnit"];
    char v20 = 0;
    objc_opt_class();
    v7 = __UIAccessibilityCastAsClass();
    v8 = [v7 navigationController];
    v9 = [v8 navigationBar];
    v10 = [v9 topItem];
    v11 = [v10 title];
    [v4 _accessibilitySetRetainedValue:v11 forKey:@"kAXGraphViewDisplayName"];

    v12 = [(HKSingleAudiogramChartViewControllerAccessibility *)self _axHearingSensitivityFormatter];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __81__HKSingleAudiogramChartViewControllerAccessibility__axSetupGraphViewDescription__block_invoke;
    v17[3] = &unk_265125E00;
    id v18 = v12;
    id v19 = v6;
    id v13 = v6;
    id v14 = v12;
    v15 = (void *)MEMORY[0x24564FBB0](v17);
    v16 = (void *)MEMORY[0x24564FBB0]();
    [v4 _accessibilitySetRetainedValue:v16 forKey:@"kAXGraphViewYValueDescriptorBlock"];
  }
}

id __81__HKSingleAudiogramChartViewControllerAccessibility__axSetupGraphViewDescription__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  id v5 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  v2 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 40), v7[5], v4, 3221225472, __81__HKSingleAudiogramChartViewControllerAccessibility__axSetupGraphViewDescription__block_invoke_422, &unk_265125DD8);

  _Block_object_dispose(&v6, 8);

  return v2;
}

void __81__HKSingleAudiogramChartViewControllerAccessibility__axSetupGraphViewDescription__block_invoke_422(uint64_t a1)
{
  objc_opt_class();
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  uint64_t v4 = [v2 valueStringFromNumber:v3];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_axUpdateAXElementsForGraphView
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  v2 = [(HKSingleAudiogramChartViewControllerAccessibility *)self safeValueForKey:@"scalarGraphViewController"];
  v64 = [v2 safeUIViewForKey:@"graphView"];

  if (v64)
  {
    v58 = [(HKSingleAudiogramChartViewControllerAccessibility *)self _axHearingSensitivityFormatter];
    objc_super v3 = [(HKSingleAudiogramChartViewControllerAccessibility *)self _axCollectSeriesDataForGraphView:v64];
    v61 = [(HKSingleAudiogramChartViewControllerAccessibility *)self _axSelectedXCoordinateForGraphView:v64];
    [v61 floatValue];
    float v5 = v4;
    id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    obuint64_t j = v3;
    uint64_t v62 = [obj countByEnumeratingWithState:&v104 objects:v111 count:16];
    if (v62)
    {
      uint64_t v6 = (uint64_t)(float)(v5 + -1.0);
      uint64_t v57 = *(void *)v105;
      double v7 = *MEMORY[0x263F00148];
      double v8 = (double)(v6 + 2);
      double v9 = (double)v6;
      uint64_t v55 = *MEMORY[0x263F1CF38];
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v105 != v57) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          uint64_t v98 = 0;
          v99 = &v98;
          uint64_t v100 = 0x3032000000;
          v101 = __Block_byref_object_copy_;
          v102 = __Block_byref_object_dispose_;
          id v103 = 0;
          id v11 = objc_opt_new();
          long long v97 = 0u;
          long long v96 = 0u;
          long long v95 = 0u;
          long long v94 = 0u;
          id v65 = v10;
          uint64_t v12 = [v65 countByEnumeratingWithState:&v94 objects:v110 count:16];
          double v13 = v7;
          if (v12)
          {
            uint64_t v14 = *(void *)v95;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v95 != v14) {
                  objc_enumerationMutation(v65);
                }
                v16 = *(void **)(*((void *)&v94 + 1) + 8 * j);
                v17 = [v16 safeValueForKey:@"userInfo"];
                [v11 axSafelyAddObject:v17];
                [v16 safeCGPointForKey:@"coordinate"];
                double v13 = v18;
                [v17 safeDoubleForKey:@"frequencyHertz"];
                uint64_t v20 = v19;
                [v17 safeDoubleForKey:@"sensitivityDBHL"];
                double v22 = v21;
                int v23 = [v17 safeBoolForKey:@"isLeftEar"];
                uint64_t v87 = MEMORY[0x263EF8330];
                uint64_t v88 = 3221225472;
                v89 = __84__HKSingleAudiogramChartViewControllerAccessibility__axUpdateAXElementsForGraphView__block_invoke;
                v90 = &unk_265125DD8;
                v92 = &v98;
                v91 = self;
                uint64_t v93 = v20;
                AXPerformSafeBlock();
                id v24 = objc_alloc(MEMORY[0x263EFABD8]);
                v25 = [MEMORY[0x263EFABE0] valueWithCategory:v99[5]];
                v26 = [MEMORY[0x263EFABE0] valueWithNumber:v22];
                v27 = (void *)[v24 initWithX:v25 y:v26];

                if (v23) {
                  v28 = v68;
                }
                else {
                  v28 = v67;
                }
                [v28 axSafelyAddObject:v27];
              }
              uint64_t v12 = [v65 countByEnumeratingWithState:&v94 objects:v110 count:16];
            }
            while (v12);
          }

          [v60 axSafelyAddObject:v99[5]];
          uint64_t v81 = 0;
          v82 = &v81;
          uint64_t v83 = 0x3032000000;
          v84 = __Block_byref_object_copy_;
          v85 = __Block_byref_object_dispose_;
          id v86 = 0;
          uint64_t v74 = MEMORY[0x263EF8330];
          uint64_t v75 = 3221225472;
          v76 = __84__HKSingleAudiogramChartViewControllerAccessibility__axUpdateAXElementsForGraphView__block_invoke_2;
          v77 = &unk_265125E28;
          v80 = &v81;
          id v78 = v58;
          id v66 = v11;
          id v79 = v66;
          AXPerformSafeBlock();
          v29 = objc_opt_new();
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v30 = (id)v82[5];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v109 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v71;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v71 != v32) {
                  objc_enumerationMutation(v30);
                }
                v34 = *(void **)(*((void *)&v70 + 1) + 8 * k);
                v35 = [v34 safeStringForKey:@"titleOverride"];
                [v29 axSafelyAddObject:v35];
                objc_opt_class();
                v36 = [v34 safeValueForKey:@"attributedString"];
                v37 = __UIAccessibilityCastAsClass();

                v38 = [v37 string];
                [v29 axSafelyAddObject:v38];
              }
              uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v109 count:16];
            }
            while (v31);
          }

          v39 = [v64 safeUIViewForKey:@"overlayView"];
          v40 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v64];
          v41 = MEMORY[0x24564F8D0](v29);
          [v39 frame];
          double v43 = v42;
          [v64 frame];
          double v45 = v44;
          [v64 frame];
          objc_msgSend(v40, "setAccessibilityFrameInContainerSpace:", v13 + v43, v45, 3.0);
          [v40 setAccessibilityLabel:v41];
          v46 = [NSNumber numberWithDouble:v13];
          [v40 _accessibilitySetRetainedValue:v46 forKey:@"kAXAccessibilityHealthUIAudiogramChartPointX"];

          BOOL v47 = v13 > v8 || v61 == 0;
          if (!v47 && v13 >= v9) {
            [v40 setAccessibilityTraits:v55];
          }
          [v59 addObject:v40];

          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(&v98, 8);
        }
        uint64_t v62 = [obj countByEnumeratingWithState:&v104 objects:v111 count:16];
      }
      while (v62);
    }

    [v64 setAccessibilityElements:v59];
    [v64 _accessibilitySetRetainedValue:v60 forKey:@"kAXGraphViewGraphElementsXValues"];
    id v48 = objc_alloc(MEMORY[0x263EFABE8]);
    v49 = accessibilityYodelLocalizedString(@"left.ear");
    v50 = (void *)[v48 initWithName:v49 isContinuous:1 dataPoints:v68];

    id v51 = objc_alloc(MEMORY[0x263EFABE8]);
    v52 = accessibilityYodelLocalizedString(@"right.ear");
    v53 = (void *)[v51 initWithName:v52 isContinuous:1 dataPoints:v67];

    v108[0] = v50;
    v108[1] = v53;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:2];
    [v64 _accessibilitySetRetainedValue:v54 forKey:@"kAXGraphViewGraphElementsSeriesDescription"];
  }
}

void __84__HKSingleAudiogramChartViewControllerAccessibility__axUpdateAXElementsForGraphView__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) _formattedFrequencyStringForFrequency:*(double *)(a1 + 48)];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  float v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __84__HKSingleAudiogramChartViewControllerAccessibility__axUpdateAXElementsForGraphView__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) formattedSelectedRangeLabelDataWithChartData:*(void *)(a1 + 40) context:0];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  float v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axCollectSeriesDataForGraphView:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v29 = 0;
  objc_opt_class();
  uint64_t v4 = [v3 safeValueForKey:@"allSeries"];
  float v5 = __UIAccessibilityCastAsClass();

  double v22 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    double v9 = 0;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      id v11 = v8;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(obj);
        }
        double v13 = [*(id *)(*((void *)&v25 + 1) + 8 * v10) safeValueForKey:@"visibleValueRange"];
        char v29 = 0;
        objc_opt_class();
        uint64_t v14 = [v13 safeValueForKey:@"minValue"];
        double v9 = __UIAccessibilityCastAsClass();

        if (v29) {
          goto LABEL_15;
        }

        char v29 = 0;
        objc_opt_class();
        v15 = [v13 safeValueForKey:@"maxValue"];
        double v8 = __UIAccessibilityCastAsClass();

        if (v29) {
LABEL_15:
        }
          abort();

        id v23 = v3;
        id v24 = v22;
        AXPerformSafeBlock();

        ++v10;
        id v11 = v8;
        uint64_t v12 = v9;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
    double v9 = 0;
  }

  [v3 _accessibilitySetRetainedValue:v9 forKey:@"kAXGraphViewYAxisMin"];
  [v3 _accessibilitySetRetainedValue:v8 forKey:@"kAXGraphViewYAxisMax"];
  v16 = [v22 allKeys];
  v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_0];

  double v18 = [v22 objectsForKeys:v17 notFoundMarker:MEMORY[0x263EFFA68]];

  return v18;
}

void __86__HKSingleAudiogramChartViewControllerAccessibility__axCollectSeriesDataForGraphView___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __86__HKSingleAudiogramChartViewControllerAccessibility__axCollectSeriesDataForGraphView___block_invoke_2;
  v3[3] = &unk_265125E50;
  id v4 = *(id *)(a1 + 48);
  [v1 enumerateVisibleCoordinatesForSeries:v2 block:v3];
}

void __86__HKSingleAudiogramChartViewControllerAccessibility__axCollectSeriesDataForGraphView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 safeValueForKey:@"userInfo"];
    [v6 safeDoubleForKey:@"frequencyHertz"];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    if (v8)
    {
      double v9 = v8;
      [v8 axSafelyAddObject:v5];
    }
    else
    {
      v11[0] = v5;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      double v9 = (void *)[v10 mutableCopy];
    }
    [*(id *)(a1 + 32) setObject:v9 forKey:v7];
  }
}

uint64_t __86__HKSingleAudiogramChartViewControllerAccessibility__axCollectSeriesDataForGraphView___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_axUpdateSelectionAXElementsForGraphView
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(HKSingleAudiogramChartViewControllerAccessibility *)self safeValueForKey:@"scalarGraphViewController"];
  id v4 = [v3 safeUIViewForKey:@"graphView"];

  float v5 = [(HKSingleAudiogramChartViewControllerAccessibility *)self _axSelectedXCoordinateForGraphView:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    float v8 = v7;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v9 = objc_msgSend(v4, "accessibilityElements", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = (uint64_t)(float)(v8 + -1.0);
      double v13 = (double)(v12 + 2);
      double v14 = (double)v12;
      uint64_t v15 = *(void *)v28;
      uint64_t v16 = *MEMORY[0x263F1CF38];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v9);
          }
          double v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v19 = [v18 _accessibilityValueForKey:@"kAXAccessibilityHealthUIAudiogramChartPointX"];
          [v19 floatValue];
          double v21 = v20;

          if (v21 <= v13 && v21 >= v14) {
            [v18 setAccessibilityTraits:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v9 = [v4 accessibilityElements];
    uint64_t v23 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * j) setAccessibilityTraits:0];
        }
        uint64_t v24 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v24);
    }
  }
}

- (id)_axHearingSensitivityFormatter
{
  uint64_t v2 = [(HKSingleAudiogramChartViewControllerAccessibility *)self safeValueForKey:@"annotationViewDataSource"];
  id v3 = [v2 safeSwiftValueForKey:@"hearingSensitivityFormatter"];

  return v3;
}

- (id)_axSelectedXCoordinateForGraphView:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v24 = 0;
  objc_opt_class();
  id v4 = [v3 safeValueForKey:@"_seriesGroupRows"];
  float v5 = __UIAccessibilityCastAsClass();

  double v18 = v3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [*(id *)(*((void *)&v20 + 1) + 8 * v10) safeValueForKey:@"selectionContext"];
      char v24 = 0;
      objc_opt_class();
      uint64_t v12 = [v11 safeValueForKey:@"selectedRangeBoundariesXValue"];
      double v13 = __UIAccessibilityCastAsClass();

      if (v24) {
LABEL_19:
      }
        abort();
      memset(v19, 0, sizeof(v19));
      id v14 = v13;
      if ([v14 countByEnumeratingWithState:v19 objects:v25 count:16])
      {
        char v24 = 0;
        objc_opt_class();
        uint64_t v15 = __UIAccessibilityCastAsClass();
        if (v24) {
          goto LABEL_19;
        }
        uint64_t v16 = (void *)v15;
      }
      else
      {
        uint64_t v16 = 0;
      }

      if (v16) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    uint64_t v16 = 0;
  }

  return v16;
}

@end