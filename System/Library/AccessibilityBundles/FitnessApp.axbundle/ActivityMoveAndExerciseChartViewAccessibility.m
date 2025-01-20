@interface ActivityMoveAndExerciseChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGraphData;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ActivityMoveAndExerciseChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.ActivityMoveAndExerciseChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.ActivityMoveAndExerciseChartView", @"moveAndExerciseChartPoints", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.ActivityMoveAndExerciseChartView", @"moveAndExerciseChartMaxYValue", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.ActivityMoveAndExerciseChartView", @"moveAndExerciseChartViewType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.ActivityMoveAndExerciseChartView", @"accessibilityReloadData", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v2 = self;
  id v3 = [(ActivityMoveAndExerciseChartViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];
  if (!v3)
  {
    v37 = +[NSMutableArray arrayWithCapacity:8];
    -[ActivityMoveAndExerciseChartViewAccessibility _accessibilitySetRetainedValue:forKey:](v2, "_accessibilitySetRetainedValue:forKey:");
    id v36 = objc_alloc_init((Class)NSDateIntervalFormatter);
    v4 = +[NSCalendar currentCalendar];
    v5 = +[NSDate date];
    v35 = [v4 startOfDayForDate:v5];

    objc_opt_class();
    v6 = __UIAccessibilityCastAsClass();
    uint64_t v7 = [(ActivityMoveAndExerciseChartViewAccessibility *)v2 _accessibilityGraphData];
    v8 = (void *)v7;
    v38 = v6;
    if (v6 && v7)
    {
      [v6 frame];
      float v10 = v9;
      double v11 = floorf(v10);
      [v6 frame];
      float v13 = v12 * 0.125;
      double v14 = floorf(v13);
      uint64_t v15 = (uint64_t)[v8 count];
      uint64_t v16 = 0;
      uint64_t v17 = (uint64_t)rintf((float)(v15 / 8));
      v34 = v2;
      do
      {
        uint64_t v18 = v17 * v16;
        uint64_t v19 = v16 + 1;
        if (v17 * (v16 + 1) >= v15) {
          uint64_t v20 = v15;
        }
        else {
          uint64_t v20 = v17 * (v16 + 1);
        }
        float v21 = 0.0;
        while (v18 < v20)
        {
          v22 = [v8 objectAtIndex:v18];
          [v22 CGPointValue];
          float v21 = v23 + v21;

          ++v18;
        }
        signed int v24 = [(ActivityMoveAndExerciseChartViewAccessibility *)v2 safeIntForKey:@"moveAndExerciseChartViewType"];
        if ((unint64_t)(v24 - 1) >= 2)
        {
          if (v24)
          {
            v26 = 0;
            goto LABEL_17;
          }
          v25 = accessibilityLocalizedString(@"calories.format");
          v27 = AXFormatFloat();
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v27);
        }
        else
        {
          v25 = accessibilityLocalizedString(@"minutes.format");
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, (int)v21);
        }

LABEL_17:
        v28 = +[NSDate dateWithTimeInterval:v35 sinceDate:(double)(10800 * (int)v16)];
        if (v16 == 7) {
          CFStringRef v29 = @"h:mma";
        }
        else {
          CFStringRef v29 = @"hxa";
        }
        v30 = +[NSDate dateWithTimeInterval:v28 sinceDate:dbl_17940[v16 == 7]];
        [v36 setDateTemplate:v29];
        v31 = [v36 stringFromDate:v28 toDate:v30];
        id v32 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:v38];
        objc_msgSend(v32, "setAccessibilityFrameInContainerSpace:", v14 * (double)(int)v16, 0.0, v14, v11);
        [v32 setAccessibilityLabel:v31];
        [v32 setAccessibilityValue:v26];
        [v37 addObject:v32];

        ++v16;
        v2 = v34;
      }
      while (v19 != 8);
    }
    id v3 = v37;
    [(ActivityMoveAndExerciseChartViewAccessibility *)v2 _accessibilitySetRetainedValue:v37 forKey:kUIAccessibilityStorageKeyChildren];
  }

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)ActivityMoveAndExerciseChartViewAccessibility;
  [(ActivityMoveAndExerciseChartViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ActivityMoveAndExerciseChartViewAccessibility *)self safeArrayForKey:@"moveAndExerciseChartPoints"];
  v4 = v3;
  if (v3
    && [v3 count]
    && ([v4 firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v7 = self;
    v8 = v4;
  }
  else
  {
    uint64_t v7 = self;
    v8 = 0;
  }
  [(ActivityMoveAndExerciseChartViewAccessibility *)v7 _accessibilitySetRetainedValue:v8 forKey:@"kAXDayViewCellGraphElements"];
  [(ActivityMoveAndExerciseChartViewAccessibility *)self _accessibilitySetRetainedValue:0 forKey:kUIAccessibilityStorageKeyChildren];
}

- (id)_accessibilityGraphData
{
  return [(ActivityMoveAndExerciseChartViewAccessibility *)self _accessibilityValueForKey:@"kAXDayViewCellGraphElements"];
}

@end