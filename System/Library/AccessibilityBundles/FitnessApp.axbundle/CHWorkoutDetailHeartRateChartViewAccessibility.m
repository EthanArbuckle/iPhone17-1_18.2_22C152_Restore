@interface CHWorkoutDetailHeartRateChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldUseSlices;
- (double)_accessibilityTimeIntervalPerSlice;
- (float)_decimalForDate:(id)a3;
- (id)_accessibilityQuantityForSliceAtIndex:(unint64_t)a3;
- (id)_axDateInterval;
- (id)accessibilityElements;
- (unint64_t)_accessibilityHoursPerSlice;
- (unint64_t)_accessibilityNumberOfSlices;
@end

@implementation CHWorkoutDetailHeartRateChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutDetailHeartRateChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHWorkoutDetailHeartRateChartView" conformsToProtocol:@"FIUIChartDataSource"];
  [v3 validateClass:@"CHWorkoutDetailHeartRateChartView" hasInstanceVariable:@"_heartRateReadings" withType:"NSArray"];
  [v3 validateClass:@"CHWorkoutDetailHeartRateChartView" hasInstanceVariable:@"_heartRateChartPoints" withType:"NSMutableArray"];
  [v3 validateClass:@"CHWorkoutDetailHeartRateChartView" hasInstanceVariable:@"_chartView" withType:"FIUIChartView"];
  [v3 validateClass:@"CHWorkoutDetailHeartRateChartView" hasInstanceVariable:@"_hasAdequateDataForDisplay" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHWorkoutDetailHeartRateChartView", @"_dateInterval", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKQuantity", @"ch_beatsPerMinute", "d", 0);
}

- (id)accessibilityElements
{
  v2 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self safeValueForKey:@"_chartView"];
  id v3 = [v2 safeUIViewForKey:@"_containerView"];
  v4 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (BOOL)_accessibilityShouldUseSlices
{
  return [(CHWorkoutDetailHeartRateChartViewAccessibility *)self safeBoolForKey:@"_hasAdequateDataForDisplay"];
}

- (unint64_t)_accessibilityNumberOfSlices
{
  return 8;
}

- (id)_accessibilityQuantityForSliceAtIndex:(unint64_t)a3
{
  v5 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self _axDateInterval];
  v6 = v5;
  if (!v5)
  {
    v15 = 0;
    goto LABEL_25;
  }
  v7 = [v5 startDate];
  [(CHWorkoutDetailHeartRateChartViewAccessibility *)self _accessibilityTimeIntervalPerSlice];
  v9 = [v7 dateByAddingTimeInterval:v8 * (double)a3];

  v10 = [v6 startDate];
  [(CHWorkoutDetailHeartRateChartViewAccessibility *)self _accessibilityTimeIntervalPerSlice];
  v12 = [v10 dateByAddingTimeInterval:v11 * (double)(a3 + 1)];

  id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v9 endDate:v12];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v14 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self safeArrayForKey:@"_heartRateReadings"];
  v15 = (char *)[v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v15) {
    goto LABEL_23;
  }
  v30 = v9;
  v31 = v6;
  uint64_t v16 = *(void *)v33;
  double v17 = 2.22507386e-308;
  double v18 = 1.79769313e308;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(v14);
      }
      objc_opt_class();
      v20 = __UIAccessibilityCastAsClass();
      v21 = v20;
      if (v20)
      {
        v22 = [v20 date];
        unsigned int v23 = [v13 containsDate:v22];

        if (v23)
        {
          v24 = [v21 quantity];
          [v24 safeDoubleForKey:@"ch_beatsPerMinute"];
          double v26 = (double)(uint64_t)llround(v25);

          if (v17 < v26) {
            double v17 = v26;
          }
          if (v18 > v26) {
            double v18 = v26;
          }
        }
      }
    }
    v15 = (char *)[v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v15);

  if (v17 == 2.22507386e-308)
  {
    v9 = v30;
    v6 = v31;
  }
  else
  {
    v9 = v30;
    v6 = v31;
    if (v18 != 1.79769313e308)
    {
      if (vabdd_f64(v17, v18) >= 2.22044605e-16)
      {
        v14 = accessibilityLocalizedString(@"heart.rate.graph.range");
        v27 = AXFormatFloat();
        v28 = AXFormatFloat();
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v27, v28);
        v15 = (char *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = accessibilityLocalizedString(@"heart.rate.graph.single");
        v27 = AXFormatFloat();
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v27);
        v15 = (char *)objc_claimAutoreleasedReturnValue();
      }

LABEL_23:
    }
  }

LABEL_25:

  return v15;
}

- (double)_accessibilityTimeIntervalPerSlice
{
  id v3 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self _axDateInterval];
  [v3 duration];
  double v5 = v4
     / (double)[(CHWorkoutDetailHeartRateChartViewAccessibility *)self _accessibilityNumberOfSlices];

  return v5;
}

- (unint64_t)_accessibilityHoursPerSlice
{
  id v3 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self _axDateInterval];
  [v3 duration];
  unint64_t v5 = (unint64_t)(v4
                        / 3600.0
                        / (double)[(CHWorkoutDetailHeartRateChartViewAccessibility *)self _accessibilityNumberOfSlices]);

  return v5;
}

- (id)_axDateInterval
{
  objc_opt_class();
  id v3 = [(CHWorkoutDetailHeartRateChartViewAccessibility *)self safeValueForKeyPath:@"dateInterval"];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (float)_decimalForDate:(id)a3
{
  id v3 = a3;
  double v4 = +[NSCalendar currentCalendar];
  unint64_t v5 = [v4 components:224 fromDate:v3];

  float v6 = (float)(uint64_t)[v5 hour];
  float v7 = (float)((float)(uint64_t)[v5 minute] / 60.0) + v6;
  float v8 = v7 + (float)((float)(uint64_t)[v5 second] / 3600.0);

  return v8;
}

@end