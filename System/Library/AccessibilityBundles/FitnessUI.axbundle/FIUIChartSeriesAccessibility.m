@interface FIUIChartSeriesAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityChartPointForDataSetAtIndex:(int64_t)a3;
@end

@implementation FIUIChartSeriesAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIChartSeries";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIChartSeries", @"dataSet", "@", 0);
  [v3 validateClass:@"FIUIChartDataSet" hasInstanceVariable:@"_points" withType:"NSArray"];
}

- (id)_accessibilityChartPointForDataSetAtIndex:(int64_t)a3
{
  id v3 = [(FIUIChartSeriesAccessibility *)self safeValueForKey:@"dataSet"];
  [v3 safeArrayForKey:@"_points"];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __74__FIUIChartSeriesAccessibility__accessibilityChartPointForDataSetAtIndex___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

@end