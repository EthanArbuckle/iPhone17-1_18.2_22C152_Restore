@interface FIUIChartUniformBarSeriesAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLabelForBarYPoint:(double)a3 withValue:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateAccessibilityElements;
- (void)layoutSubviews;
@end

@implementation FIUIChartUniformBarSeriesAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIChartUniformBarSeries";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FIUIChartUniformBarSeries" isKindOfClass:@"UIView"];
  [v3 validateClass:@"FIUIChartUniformBarSeries" isKindOfClass:@"FIUIChartSeries"];
  [v3 validateClass:@"FIUIChartUniformBarSeries" hasInstanceVariable:@"_plotPoints" withType:"NSArray"];
  [v3 validateClass:@"FIUIChartUniformBarSeries" hasInstanceVariable:@"_barWidth" withType:"d"];
  [v3 validateProtocol:@"FIUIChartPoint" hasRequiredInstanceMethod:@"xValue"];
}

- (id)_accessibilityLabelForBarYPoint:(double)a3 withValue:(id)a4
{
  if (a3 == 0.0) {
    v4 = @"chart.inactive.hour";
  }
  else {
    v4 = @"chart.active.hour";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartUniformBarSeriesAccessibility;
  [(FIUIChartUniformBarSeriesAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(FIUIChartUniformBarSeriesAccessibility *)self _axUpdateAccessibilityElements];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIChartUniformBarSeriesAccessibility;
  [(FIUIChartUniformBarSeriesAccessibility *)&v3 layoutSubviews];
  [(FIUIChartUniformBarSeriesAccessibility *)self _axUpdateAccessibilityElements];
}

- (void)_axUpdateAccessibilityElements
{
  objc_super v3 = +[FIUIChartBarAccessibilityElement accessibilityElementsForBarSeries:self];
  [(FIUIChartUniformBarSeriesAccessibility *)self setAccessibilityElements:v3];

  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

@end