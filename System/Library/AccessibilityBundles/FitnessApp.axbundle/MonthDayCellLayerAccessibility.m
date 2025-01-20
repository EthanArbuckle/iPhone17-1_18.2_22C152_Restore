@interface MonthDayCellLayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MonthDayCellLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonthDayCellLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"ActivitySummaryCache", @"sharedInstance", "@", 0);
  [v3 validateClass:@"MonthDayCellLayer" hasInstanceVariable:@"_hasWorkout" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MonthDayCellLayer", @"isFutureDay", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarDayCell", @"representsToday", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarDayCell", @"date", "@", 0);
  [v3 validateClass:@"MonthDayCellLayer" isKindOfClass:@"HKCalendarDayCell"];
  [v3 validateClass:@"MonthWeekView"];
  [v3 validateClass:@"MonthScrollViewController"];
  [v3 validateClass:@"MonthViewController"];
}

- (id)accessibilityLabel
{
  if ([(MonthDayCellLayerAccessibility *)self safeBoolForKey:@"representsToday"])
  {
    id v3 = accessibilityLocalizedString(@"today");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [(MonthDayCellLayerAccessibility *)self safeValueForKey:@"date"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [(MonthDayCellLayerAccessibility *)self accessibilityContainer];
  AXSafeClassFromString();
  objc_opt_isKindOfClass();

  v9 = AXDateStringForFormat();
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MonthDayCellLayerAccessibility;
  return UIAccessibilityTraitButton | [(MonthDayCellLayerAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  if ([(MonthDayCellLayerAccessibility *)self safeBoolForKey:@"isFutureDay"])
  {
    objc_super v3 = accessibilityLocalizedString(@"no.data");
  }
  else
  {
    v4 = [(MonthDayCellLayerAccessibility *)self safeValueForKey:@"date"];
    v5 = __UIAccessibilitySafeClass();

    v6 = accessibilityFitnessStringForDate(v5, 1);
    if ([(MonthDayCellLayerAccessibility *)self safeBoolForKey:@"_hasWorkout"])
    {
      v11 = accessibilityLocalizedString(@"worked.out");
      v7 = __UIAXStringForVariables();
    }
    else
    {
      v7 = 0;
    }
    v8 = __UIAXStringForVariables();

    if (objc_msgSend(v8, "length", v6, @"__AXStringForVariablesSentinel"))
    {
      id v9 = v8;
    }
    else
    {
      accessibilityLocalizedString(@"no.data");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_super v3 = v9;
  }

  return v3;
}

- (CGRect)accessibilityFrame
{
  [(MonthDayCellLayerAccessibility *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5 + 70.0;
  CGFloat v8 = v7 + 20.0;
  CGFloat v10 = v9 + -10.0;
  v11 = [(MonthDayCellLayerAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v4;
  v20.size.CGFloat width = v8;
  v20.size.CGFloat height = v6;
  CGRect v21 = UIAccessibilityConvertFrameToScreenCoordinates(v20, v11);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end