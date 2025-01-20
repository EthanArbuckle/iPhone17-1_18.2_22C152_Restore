@interface FIUIChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFKAShouldProcessChildren;
- (CGRect)accessibilityFrame:(id)a3;
- (id)_accessibilityChartSlices;
- (id)accessibilityLabel:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateChartSlices;
- (void)_setAccessibilityChartSlices:(id)a3;
- (void)dealloc;
- (void)reloadData;
@end

@implementation FIUIChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIChartView", @"reloadData", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIChartView", @"_chartRect", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIChartView", @"dateInterval", "@", 0);
  [v3 validateClass:@"FIUIChartView" hasInstanceVariable:@"_containerView" withType:"UIView"];
  [v3 validateClass:@"FIUIChartView" hasInstanceVariable:@"_chartSeries" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIChartView", @"dataSource", "@", 0);
}

- (id)_accessibilityChartSlices
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NSArray___accessibilityChartSlices);
}

- (void)_setAccessibilityChartSlices:(id)a3
{
}

- (void)_axUpdateChartSlices
{
  id v10 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"dataSource"];
  id v3 = [(FIUIChartViewAccessibility *)self safeUIViewForKey:@"_containerView"];
  if ([v10 _accessibilityShouldUseSlices])
  {
    v4 = (char *)[v10 _accessibilityNumberOfSlices];
    if (v4)
    {
      v5 = v4;
      v6 = +[NSMutableArray arrayWithCapacity:v4];
      for (i = 0; i != v5; ++i)
      {
        v8 = [[FIUIChartViewSliceAccessibilityElement alloc] initWithAccessibilityContainer:self];
        [(FIUIChartViewSliceAccessibilityElement *)v8 setSliceIndex:i];
        [(FIUIChartViewSliceAccessibilityElement *)v8 setAccessibilityDelegate:self];
        [v6 addObject:v8];
      }
      [v3 setAccessibilityElements:v6];
      [(FIUIChartViewAccessibility *)self _setAccessibilityChartSlices:v6];
    }
    else
    {
      [v3 setAccessibilityElements:0];
    }
  }
  else
  {
    v9 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"_chartSeries"];
    [v3 setAccessibilityElements:v9];
  }
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)dealloc
{
  id v3 = [(FIUIChartViewAccessibility *)self _accessibilityChartSlices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setAccessibilityDelegate:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FIUIChartViewAccessibility;
  [(FIUIChartViewAccessibility *)&v8 dealloc];
}

- (CGRect)accessibilityFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"_chartRect"];
  [v5 CGRectValue];
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = [v4 sliceIndex];
  v15 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"dataSource"];
  id v16 = [v15 _accessibilityNumberOfSlices];
  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  v31.origin.x = v7 + CGRectGetWidth(v30) * (double)(unint64_t)v14 / (double)(unint64_t)v16;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  CGRectGetWidth(v31);
  v17 = [(FIUIChartViewAccessibility *)self safeUIViewForKey:@"_containerView"];
  UIAccessibilityFrameForBounds();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)accessibilityLabel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"dateInterval"];
  double v6 = __UIAccessibilityCastAsClass();

  double v7 = [v6 startDate];

  double v8 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"dataSource"];
  [v8 _accessibilityTimeIntervalPerSlice];
  double v10 = v9;
  CGFloat v11 = objc_msgSend(v7, "dateByAddingTimeInterval:", v9 * (double)(unint64_t)objc_msgSend(v4, "sliceIndex"));
  double v12 = objc_msgSend(v7, "dateByAddingTimeInterval:", v10 * (double)((unint64_t)objc_msgSend(v4, "sliceIndex") + 1));
  CGFloat v13 = accessibilityLocalizedString(@"chart.slice.date.format");
  id v14 = AXClockTimeStringForDate();
  v15 = AXClockTimeStringForDate();
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v15);

  v17 = [(FIUIChartViewAccessibility *)self safeValueForKey:@"dataSource"];
  double v20 = objc_msgSend(v17, "_accessibilityQuantityForSliceAtIndex:", objc_msgSend(v4, "sliceIndex"));
  double v18 = __AXStringForVariables();

  return v18;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartViewAccessibility;
  [(FIUIChartViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(FIUIChartViewAccessibility *)self _axUpdateChartSlices];
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  return 0;
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartViewAccessibility;
  [(FIUIChartViewAccessibility *)&v3 reloadData];
  [(FIUIChartViewAccessibility *)self _axUpdateChartSlices];
}

@end