@interface TrendListMetricViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TrendListMetricViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendListMetricView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendListMetricView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendListMetricView", @"trendString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.TrendListMetricView", @"valueLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(TrendListMetricViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(TrendListMetricViewAccessibility *)self safeStringForKey:@"trendString"];
  v5 = [(TrendListMetricViewAccessibility *)self safeValueForKey:@"valueLabel"];
  v6 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 3, v3, v4, v5);
  v7 = AXLabelForElements();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TrendListMetricViewAccessibility;
  return UIAccessibilityTraitButton | [(TrendListMetricViewAccessibility *)&v3 accessibilityTraits];
}

@end