@interface HighlightCalendarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HighlightCalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthVisualization.HighlightCalendarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarView", @"accessibilityWeekdayLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthVisualization.HighlightCalendarView", @"accessibilityMonthLabels", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HighlightCalendarViewAccessibility;
  [(HighlightCalendarViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HighlightCalendarViewAccessibility *)self safeArrayForKey:@"accessibilityWeekdayLabels"];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_0];

  v4 = [(HighlightCalendarViewAccessibility *)self safeArrayForKey:@"accessibilityMonthLabels"];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_281];
}

uint64_t __80__HighlightCalendarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsAccessibilityElement:0];
}

uint64_t __80__HighlightCalendarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsAccessibilityElement:0];
}

@end