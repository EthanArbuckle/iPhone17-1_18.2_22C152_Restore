@interface STOverallUsageSummaryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityNoUsageViewIfPresent;
- (id)accessibilityElements;
- (id)accessibilityLabel;
@end

@implementation STOverallUsageSummaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STOverallUsageSummaryCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STOverallUsageSummaryCell", @"weekGraphViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STOverallUsageSummaryCell", @"noUsageDataView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STNoUsageDataView", @"noDataDetailTextLabel", "@", 0);
}

- (id)_accessibilityNoUsageViewIfPresent
{
  v2 = [(STOverallUsageSummaryCellAccessibility *)self safeUIViewForKey:@"noUsageDataView"];
  if ([v2 isHidden]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(STOverallUsageSummaryCellAccessibility *)self _accessibilityNoUsageViewIfPresent];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(STOverallUsageSummaryCellAccessibility *)self _accessibilityNoUsageViewIfPresent];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 safeValueForKey:@"noDataDetailTextLabel"];
    v6 = [v5 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STOverallUsageSummaryCellAccessibility;
    v6 = [(STOverallUsageSummaryCellAccessibility *)&v8 accessibilityLabel];
  }

  return v6;
}

- (id)accessibilityElements
{
  BOOL v3 = [(STOverallUsageSummaryCellAccessibility *)self safeValueForKey:@"weekGraphViewController"];
  id v4 = [v3 accessibilityElements];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__STOverallUsageSummaryCellAccessibility_accessibilityElements__block_invoke;
  v6[3] = &unk_26514C368;
  objc_copyWeak(&v7, &location);
  [v4 enumerateObjectsUsingBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __63__STOverallUsageSummaryCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setAccessibilityContainer:WeakRetained];
}

@end