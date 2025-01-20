@interface StocksAssistantChartViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation StocksAssistantChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StocksAssistantChartView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"stocks.graph.chart");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(StocksAssistantChartViewAccessibility *)self safeValueForKey:@"_graph"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end