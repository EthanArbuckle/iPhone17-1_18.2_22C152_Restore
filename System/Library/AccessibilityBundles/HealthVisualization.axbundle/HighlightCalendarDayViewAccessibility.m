@interface HighlightCalendarDayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axProjectionValues:(int64_t)a3 projectionKind:(id)a4;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation HighlightCalendarDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthVisualization.HighlightCalendarDayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarDayView", @"axDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarDayView", @"axProjectionKind", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarDayView", @"axProbability", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarDayView", @"axCircleState", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(HighlightCalendarDayViewAccessibility *)self safeIntegerForKey:@"axCircleState"] != 0;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(HighlightCalendarDayViewAccessibility *)self safeValueForKey:@"axDate"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = _AXGetStringForDay(v4);

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(HighlightCalendarDayViewAccessibility *)self safeIntegerForKey:@"axProbability"];
  v4 = [(HighlightCalendarDayViewAccessibility *)self safeStringForKey:@"axProjectionKind"];
  v5 = [(HighlightCalendarDayViewAccessibility *)self _axProjectionValues:v3 projectionKind:v4];

  return v5;
}

- (id)_axProjectionValues:(int64_t)a3 projectionKind:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HighlightCalendarDayViewAccessibility *)self safeIntegerForKey:@"axCircleState"];
  if (v6)
  {
    if (a3 == 2)
    {
      if ([v6 isEqualToString:@"menstruation"]) {
        v8 = @"predicted.period";
      }
      else {
        v8 = @"predicted.fertile";
      }
      goto LABEL_14;
    }
    if (a3 == 1 && [v6 isEqualToString:@"menstruation"])
    {
      v8 = @"possible.period";
LABEL_14:
      uint64_t v9 = accessibilityLocalizedString(v8);
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (v7 == 1)
  {
    v8 = @"data.logged";
    goto LABEL_14;
  }
  if (v7 != 3)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = UIAXStringForAllChildren();
LABEL_15:
  v10 = (void *)v9;
LABEL_16:

  return v10;
}

@end