@interface TrendDetailChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityGraphData;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation TrendDetailChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendDetailChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"accessibilityDateIntervalForIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"accessibilityQuantityForIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"chartMaxLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"accessibilityUnit", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailChartView", @"barStops", "@", 0);
}

- (id)accessibilityElements
{
  v2 = self;
  id v40 = [(TrendDetailChartViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];
  if (!v40)
  {
    v38 = [(TrendDetailChartViewAccessibility *)v2 _accessibilityGraphData];
    v41 = (char *)[v38 count];
    id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    [(TrendDetailChartViewAccessibility *)v2 _accessibilitySetRetainedValue:v3 forKey:kUIAccessibilityStorageKeyChildren];
    v4 = [(TrendDetailChartViewAccessibility *)v2 safeUIViewForKey:@"titleLabel"];
    [v4 _accessibilityAddTrait:UIAccessibilityTraitHeader];
    id v40 = v3;
    [v3 addObject:v4];
    id v5 = objc_alloc_init((Class)NSDateIntervalFormatter);
    [v5 setTimeStyle:0];
    v37 = v5;
    [v5 setDateTemplate:@"MMMMdyyyy"];
    LOBYTE(v42) = 0;
    objc_opt_class();
    v39 = __UIAccessibilityCastAsClass();
    if ((uint64_t)v41 >= 1 && v39)
    {
      v34 = v4;
      [v4 frame];
      double v7 = v6 + v6;
      [v39 frame];
      float v9 = v8;
      double v36 = floorf(v9) - v7;
      [v39 frame];
      v10 = 0;
      double v12 = v11 / (double)(uint64_t)v41;
      double v13 = 2.22507386e-308;
      double v14 = 1.79769313e308;
      v15 = &unk_183E0;
      v35 = v2;
      do
      {
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x3032000000;
        v45 = __Block_byref_object_copy__0;
        v46 = __Block_byref_object_dispose__0;
        id v47 = 0;
        AXPerformSafeBlock();
        id v16 = (id)v43[5];
        _Block_object_dispose(&v42, 8);

        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x3032000000;
        v45 = __Block_byref_object_copy__0;
        v46 = __Block_byref_object_dispose__0;
        id v47 = 0;
        v17 = v15;
        AXPerformSafeBlock();
        id v18 = (id)v43[5];
        _Block_object_dispose(&v42, 8);

        LOBYTE(v42) = 0;
        objc_opt_class();
        v19 = [(TrendDetailChartViewAccessibility *)v2 safeValueForKey:@"accessibilityUnit"];
        v20 = __UIAccessibilityCastAsClass();

        if ((_BYTE)v42) {
          abort();
        }
        if (v20 && v18 && v16 && [v16 isCompatibleWithUnit:v20])
        {
          [v16 doubleValueForUnit:v20];
          double v22 = v21;
          id v23 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:v39];
          v24 = [v38 objectAtIndexedSubscript:v10];
          [v24 floatValue];
          double v26 = v12 + v25;

          objc_msgSend(v23, "setAccessibilityFrameInContainerSpace:", v26, v7, v12, v36);
          v27 = [v37 stringFromDateInterval:v18];
          [v23 setAccessibilityLabel:v27];

          v28 = accessibilityLocalizedString(@"trends.value.with.unit");
          v29 = AXFormatFloat();
          v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29, v20);
          [v23 setAccessibilityValue:v30];

          v2 = v35;
          [v40 addObject:v23];
          if (v22 > v13) {
            double v13 = v22;
          }
          if (v22 < v14) {
            double v14 = v22;
          }
        }
        ++v10;
        v15 = v17;
      }
      while (v41 != v10);
      v31 = +[NSNumber numberWithDouble:floor(v14 * 100.0 + 0.5) / 100.0];
      [(TrendDetailChartViewAccessibility *)v2 _accessibilitySetRetainedValue:v31 forKey:@"kAXTrendDetailGraphCachedMin"];

      v32 = +[NSNumber numberWithDouble:floor(v13 * 100.0 + 0.5) / 100.0];
      [(TrendDetailChartViewAccessibility *)v2 _accessibilitySetRetainedValue:v32 forKey:@"kAXTrendDetailGraphCachedMax"];

      v4 = v34;
    }
    [(TrendDetailChartViewAccessibility *)v2 _accessibilitySetRetainedValue:v40 forKey:kUIAccessibilityStorageKeyChildren];
  }

  return v40;
}

uint64_t __58__TrendDetailChartViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityQuantityForIndex:*(unsigned int *)(a1 + 48)];

  return _objc_release_x1();
}

uint64_t __58__TrendDetailChartViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityDateIntervalForIndex:*(unsigned int *)(a1 + 48)];

  return _objc_release_x1();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)TrendDetailChartViewAccessibility;
  [(TrendDetailChartViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TrendDetailChartViewAccessibility *)self safeArrayForKey:@"barStops"];
  v4 = v3;
  if (v3
    && [v3 count]
    && ([v4 firstObject],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    double v7 = self;
    double v8 = v4;
  }
  else
  {
    double v7 = self;
    double v8 = 0;
  }
  [(TrendDetailChartViewAccessibility *)v7 _accessibilitySetRetainedValue:v8 forKey:@"kAXTrendDetailGraphElements"];
  [(TrendDetailChartViewAccessibility *)self _accessibilitySetRetainedValue:0 forKey:kUIAccessibilityStorageKeyChildren];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TrendDetailChartViewAccessibility;
  [(TrendDetailChartViewAccessibility *)&v3 layoutSubviews];
  [(TrendDetailChartViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityGraphData
{
  return [(TrendDetailChartViewAccessibility *)self _accessibilityValueForKey:@"kAXTrendDetailGraphElements"];
}

@end