@interface TrendDetailDailyAverageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityGraphData;
- (id)_axDayStringForIndex:(int)a3 withFormatter:(id)a4;
- (id)_axLabelForIndex:(int)a3 withFormatter:(id)a4;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation TrendDetailDailyAverageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendDetailDailyAverageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"accessibiliytQuantity365ForIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"accessibiliytQuantity90ForIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"accessibilityDayForStopIndex:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"dayStops", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendDetailDailyAverageView", @"accessibilityUnit", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];
  if (!v3)
  {
    v4 = [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityGraphData];
    id v3 = +[NSMutableArray arrayWithCapacity:7];
    [(TrendDetailDailyAverageViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:kUIAccessibilityStorageKeyChildren];
    v5 = [(TrendDetailDailyAverageViewAccessibility *)self safeUIViewForKey:@"titleLabel"];
    [v5 _accessibilityAddTrait:UIAccessibilityTraitHeader];
    [v3 addObject:v5];
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    objc_opt_class();
    v7 = __UIAccessibilityCastAsClass();
    if (v7 && [v4 count] == (char *)&dword_4 + 3)
    {
      [v5 frame];
      double v9 = v8 + v8;
      [v7 frame];
      float v11 = v10;
      double v12 = floorf(v11) - v9;
      v13 = [v4 objectAtIndexedSubscript:1];
      [v13 floatValue];
      float v15 = v14;
      v16 = [v4 objectAtIndexedSubscript:0];
      [v16 floatValue];
      double v18 = (float)(v15 - v17);

      for (uint64_t i = 0; i != 7; ++i)
      {
        v20 = [(TrendDetailDailyAverageViewAccessibility *)self _axLabelForIndex:i withFormatter:v6];
        if (v20)
        {
          id v21 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:v7];
          v22 = [v4 objectAtIndexedSubscript:i];
          [v22 floatValue];
          double v24 = v23;

          objc_msgSend(v21, "setAccessibilityFrameInContainerSpace:", v24, v9, v18, v12);
          [v21 setAccessibilityLabel:v20];
          [v3 addObject:v21];
        }
      }
    }
    [(TrendDetailDailyAverageViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:kUIAccessibilityStorageKeyChildren];
  }

  return v3;
}

- (id)_axLabelForIndex:(int)a3 withFormatter:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v39) = 0;
  objc_opt_class();
  v7 = [(TrendDetailDailyAverageViewAccessibility *)self safeValueForKey:@"accessibilityUnit"];
  double v8 = __UIAccessibilityCastAsClass();

  if (v8)
  {
    uint64_t v9 = [(TrendDetailDailyAverageViewAccessibility *)self _axDayStringForIndex:v4 withFormatter:v6];
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__3;
    v43 = __Block_byref_object_dispose__3;
    id v44 = 0;
    AXPerformSafeBlock();
    id v10 = (id)v40[5];
    _Block_object_dispose(&v39, 8);

    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__3;
    v43 = __Block_byref_object_dispose__3;
    id v44 = 0;
    AXPerformSafeBlock();
    id v11 = (id)v40[5];
    _Block_object_dispose(&v39, 8);

    v37 = v10;
    [v10 doubleValueForUnit:v8];
    double v13 = floor(v12 * 100.0 + 0.5) / 100.0;
    v36 = v11;
    [v11 doubleValueForUnit:v8];
    double v15 = floor(v14 * 100.0 + 0.5);
    if (v13 >= v15 / 100.0) {
      double v16 = v15 / 100.0;
    }
    else {
      double v16 = v13;
    }
    if (v13 >= v15 / 100.0) {
      double v17 = v13;
    }
    else {
      double v17 = v15 / 100.0;
    }
    double v18 = [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityValueForKey:@"kAXTrendDailyDetailGraphCachedMin"];
    v19 = [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityValueForKey:@"kAXTrendDailyDetailGraphCachedMax"];
    if (!v18 || ([v18 doubleValue], v20 > v16))
    {
      id v21 = +[NSNumber numberWithDouble:v16];
      [(TrendDetailDailyAverageViewAccessibility *)self _accessibilitySetRetainedValue:v21 forKey:@"kAXTrendDailyDetailGraphCachedMin"];
    }
    v35 = (void *)v9;
    id v38 = v6;
    if (!v19 || ([v19 doubleValue], v22 < v17))
    {
      float v23 = +[NSNumber numberWithDouble:v17];
      [(TrendDetailDailyAverageViewAccessibility *)self _accessibilitySetRetainedValue:v23 forKey:@"kAXTrendDailyDetailGraphCachedMax"];
    }
    double v24 = accessibilityLocalizedString(@"trends.365.day.average");
    v33 = accessibilityLocalizedString(@"trends.value.with.unit");
    v25 = AXFormatFloat();
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v25, v8);
    accessibilityLocalizedString(@"trends.90.day.average");
    v27 = v34 = v19;
    v28 = accessibilityLocalizedString(@"trends.value.with.unit");
    v29 = AXFormatFloat();
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29, v8);
    v30 = __AXStringForVariables();

    id v6 = v38;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

uint64_t __75__TrendDetailDailyAverageViewAccessibility__axLabelForIndex_withFormatter___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibiliytQuantity90ForIndex:*(unsigned int *)(a1 + 48)];

  return _objc_release_x1();
}

uint64_t __75__TrendDetailDailyAverageViewAccessibility__axLabelForIndex_withFormatter___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibiliytQuantity365ForIndex:*(unsigned int *)(a1 + 48)];

  return _objc_release_x1();
}

- (id)_axDayStringForIndex:(int)a3 withFormatter:(id)a4
{
  id v4 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__3;
  double v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  AXPerformSafeBlock();
  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  if ((int)[v5 intValue] < 1)
  {
    double v8 = 0;
  }
  else
  {
    signed int v6 = [v5 intValue] - 1;
    v7 = [v4 weekdaySymbols];
    if ((unint64_t)[v7 count] <= v6)
    {
      double v8 = 0;
    }
    else
    {
      double v8 = [v7 objectAtIndex:v6];
    }
  }

  return v8;
}

uint64_t __79__TrendDetailDailyAverageViewAccessibility__axDayStringForIndex_withFormatter___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityDayForStopIndex:*(unsigned int *)(a1 + 48)];

  return _objc_release_x1();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)TrendDetailDailyAverageViewAccessibility;
  [(TrendDetailDailyAverageViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TrendDetailDailyAverageViewAccessibility *)self safeArrayForKey:@"dayStops"];
  id v4 = v3;
  if (v3
    && [v3 count]
    && ([v4 firstObject],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v7 = self;
    double v8 = v4;
  }
  else
  {
    v7 = self;
    double v8 = 0;
  }
  [(TrendDetailDailyAverageViewAccessibility *)v7 _accessibilitySetRetainedValue:v8 forKey:@"kAXTrendDetailDailyAveragesGraphElements"];
  [(TrendDetailDailyAverageViewAccessibility *)self _accessibilitySetRetainedValue:0 forKey:kUIAccessibilityStorageKeyChildren];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TrendDetailDailyAverageViewAccessibility;
  [(TrendDetailDailyAverageViewAccessibility *)&v3 layoutSubviews];
  [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityGraphData
{
  return [(TrendDetailDailyAverageViewAccessibility *)self _accessibilityValueForKey:@"kAXTrendDetailDailyAveragesGraphElements"];
}

@end