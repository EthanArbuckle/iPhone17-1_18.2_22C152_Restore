@interface ActivityStandChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityGraphData;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ActivityStandChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.ActivityStandChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v3 = [(ActivityStandChartViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];
  if (!v3)
  {
    v4 = [(ActivityStandChartViewAccessibility *)self _accessibilityGraphData];
    v5 = (char *)[v4 count];
    uint64_t v6 = +[NSMutableArray arrayWithCapacity:v5];
    -[ActivityStandChartViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:");
    id v7 = objc_alloc_init((Class)NSDateIntervalFormatter);
    v8 = +[NSCalendar currentCalendar];
    v9 = +[NSDate date];
    uint64_t v10 = [v8 startOfDayForDate:v9];

    objc_opt_class();
    v38 = __UIAccessibilityCastAsClass();
    v37 = (void *)v6;
    v11 = (void *)v10;
    v12 = v38;
    if (v4)
    {
      if (v38)
      {
        [v38 frame];
        double v14 = v13;
        [v38 frame];
        if (v5)
        {
          int v16 = 0;
          v17 = 0;
          float v18 = v14;
          double v19 = floorf(v18);
          float v20 = v15 / (double)(unint64_t)v5;
          double v21 = ceilf(v20);
          v33 = v5 - 1;
          v34 = v4;
          v35 = v11;
          v36 = v5;
          do
          {
            v22 = [v4 objectAtIndex:v17];
            [v22 CGPointValue];
            float v24 = v23;
            if (v24 <= 0.0) {
              v25 = @"stand.goal.inactive";
            }
            else {
              v25 = @"stand.goal.active";
            }
            v26 = accessibilityLocalizedString(v25);
            v27 = +[NSDate dateWithTimeInterval:v11 sinceDate:(double)v16];
            if (v33 == v17) {
              CFStringRef v28 = @"h:mma";
            }
            else {
              CFStringRef v28 = @"ha";
            }
            v29 = +[NSDate dateWithTimeInterval:v27 sinceDate:dbl_17960[v33 == v17]];
            [v7 setDateTemplate:v28];
            v30 = [v7 stringFromDate:v27 toDate:v29];
            id v31 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:v12];
            objc_msgSend(v31, "setAccessibilityFrameInContainerSpace:", v21 * (double)(int)v17, 0.0, v21, v19);
            [v31 setAccessibilityLabel:v30];
            [v31 setAccessibilityValue:v26];
            [v37 addObject:v31];

            v12 = v38;
            v4 = v34;

            v11 = v35;
            ++v17;
            v16 += 3600;
          }
          while (v36 != v17);
        }
      }
    }
    [(ActivityStandChartViewAccessibility *)self _accessibilitySetRetainedValue:v37 forKey:kUIAccessibilityStorageKeyChildren];

    v3 = v37;
  }

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)ActivityStandChartViewAccessibility;
  [(ActivityStandChartViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  v3 = [(ActivityStandChartViewAccessibility *)self safeArrayForKey:@"standChartPoints"];
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
    id v7 = self;
    v8 = v4;
  }
  else
  {
    id v7 = self;
    v8 = 0;
  }
  [(ActivityStandChartViewAccessibility *)v7 _accessibilitySetRetainedValue:v8 forKey:@"kAXDayViewCellGraphElements"];
  [(ActivityStandChartViewAccessibility *)self _accessibilitySetRetainedValue:0 forKey:kUIAccessibilityStorageKeyChildren];
}

- (id)_accessibilityGraphData
{
  return [(ActivityStandChartViewAccessibility *)self _accessibilityValueForKey:@"kAXDayViewCellGraphElements"];
}

@end