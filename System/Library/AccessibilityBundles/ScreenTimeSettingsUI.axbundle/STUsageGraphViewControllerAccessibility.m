@interface STUsageGraphViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (unint64_t)_axDataSetItemType;
@end

@implementation STUsageGraphViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUsageGraphViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageGraphViewController", @"weeklyAverageLine", "@", 0);
  [v3 validateClass:@"STUsageGraphViewController" hasInstanceVariable:@"_titleView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageGraphViewController", @"barViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageGraphViewController", @"dataSet", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STBarView", @"dataPoint", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageItem", @"totalUsage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageItem", @"itemType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataPoint", @"total", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataSet", @"itemType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataSet", @"total", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageReportGraphDataPoint", @"date", "@", 0);
}

- (unint64_t)_axDataSetItemType
{
  v2 = [(STUsageGraphViewControllerAccessibility *)self safeValueForKey:@"dataSet"];
  unint64_t v3 = [v2 safeUnsignedIntegerForKey:@"itemType"];

  return v3;
}

- (id)accessibilityElements
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(STUsageGraphViewControllerAccessibility *)self safeUIViewForKey:@"_titleView"];
  [v3 axSafelyAddObject:v4];

  v5 = [(STUsageGraphViewControllerAccessibility *)self _accessibilityValueForKey:@"container"];
  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = [AXSTGraphContainerElement alloc];
    v7 = [(STUsageGraphViewControllerAccessibility *)self safeUIViewForKey:@"view"];
    v5 = [(AXSTGraphContainerElement *)v6 initWithAccessibilityContainer:v7];

    [(AXSTGraphContainerElement *)v5 setMode:0];
    [(STUsageGraphViewControllerAccessibility *)self _accessibilitySetRetainedValue:v5 forKey:@"container"];
    [(AXSTGraphContainerElement *)v5 setShouldGroupAccessibilityChildren:1];
    objc_initWeak(&from, v5);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke;
    v31[3] = &unk_26514C390;
    objc_copyWeak(&v32, &from);
    [(AXSTGraphContainerElement *)v5 _setAccessibilityFrameBlock:v31];
    [(AXSTGraphContainerElement *)v5 setIsAccessibilityElement:0];
    v8 = accessibilityLocalizedString(@"weekly.summary.chart");
    [(AXSTGraphContainerElement *)v5 setAccessibilityLabel:v8];

    [(AXSTGraphContainerElement *)v5 setItemType:[(STUsageGraphViewControllerAccessibility *)self _axDataSetItemType]];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_2;
    v28[3] = &unk_26514C3B8;
    objc_copyWeak(&v29, &location);
    objc_copyWeak(&v30, &from);
    [(AXSTGraphContainerElement *)v5 _setAccessibilityElementsBlock:v28];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  [v3 addObject:v5];
  v9 = [(STUsageGraphViewControllerAccessibility *)self safeUIViewForKey:@"weeklyAverageLine"];
  v10 = v9;
  if (v9 && ([v9 isHidden] & 1) == 0)
  {
    v11 = [(STUsageGraphViewControllerAccessibility *)self safeValueForKey:@"dataSet"];
    uint64_t v12 = [v11 safeUnsignedIntegerForKey:@"itemType"];
    LOBYTE(location) = 0;
    objc_opt_class();
    v13 = [v11 safeValueForKey:@"total"];
    v14 = __UIAccessibilityCastAsClass();

    if ((_BYTE)location) {
      abort();
    }
    [v14 doubleValue];
    double v16 = v15;

    double v17 = v16 / 7.0;
    if (v12 == 5)
    {
      v18 = NSString;
      v19 = accessibilityLocalizedString(@"per.day.interpolation");
      v20 = NSString;
      v21 = @"notifications.count.format";
    }
    else
    {
      if (v12 != 6)
      {
        v25 = NSString;
        v19 = accessibilityLocalizedString(@"per.day.interpolation");
        v22 = MEMORY[0x24565EF70](v17 < 60.0, v17);
        v24 = objc_msgSend(v25, "stringWithFormat:", v19, v22);
        goto LABEL_12;
      }
      v18 = NSString;
      v19 = accessibilityLocalizedString(@"per.day.interpolation");
      v20 = NSString;
      v21 = @"pickups.count.format";
    }
    v22 = accessibilityLocalizedString(v21);
    v23 = objc_msgSend(v20, "stringWithFormat:", v22, (int)v17);
    v24 = objc_msgSend(v18, "stringWithFormat:", v19, v23);

LABEL_12:
    [v10 setIsAccessibilityElement:1];
    objc_msgSend(v10, "setAccessibilityTraits:", objc_msgSend(v10, "accessibilityTraits") & ~*MEMORY[0x263F1CF00]);
    v26 = accessibilityLocalizedString(@"weekly.average.line.label");
    [v10 setAccessibilityLabel:v26];

    [v10 setAccessibilityValue:v24];
    [v3 addObject:v10];
  }

  return v3;
}

double __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityChildrenUnionContentFrame];
  double v3 = v2;

  return v3;
}

id __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained safeArrayForKey:@"barViews"];
  v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_3];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_4;
  v7[3] = &unk_26514C368;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [v5 enumerateObjectsUsingBlock:v7];
  objc_destroyWeak(&v8);

  return v5;
}

BOOL __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  double v3 = [v2 safeValueForKey:@"dataPoint"];
  v4 = [v3 safeValueForKey:@"total"];
  v5 = __UIAccessibilityCastAsClass();

  [v5 doubleValue];
  BOOL v7 = v6 > 0.0;

  return v7;
}

void __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setAccessibilityContainer:WeakRetained];
}

@end