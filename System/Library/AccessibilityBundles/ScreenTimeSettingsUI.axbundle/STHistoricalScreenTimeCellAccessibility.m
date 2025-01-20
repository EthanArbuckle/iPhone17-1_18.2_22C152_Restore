@interface STHistoricalScreenTimeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation STHistoricalScreenTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STHistoricalScreenTimeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STHistoricalScreenTimeCell" hasInstanceVariable:@"_historicalUsageViewController" withType:"STHistoricalUsageViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STHistoricalScreenTimeCell", @"topItemsView", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(STHistoricalScreenTimeCellAccessibility *)self safeValueForKey:@"_historicalUsageViewController"];
  v5 = [v4 accessibilityElements];

  [v3 axSafelyAddObjectsFromArray:v5];
  v6 = [(STHistoricalScreenTimeCellAccessibility *)self safeUIViewForKey:@"topItemsView"];
  [v3 axSafelyAddObject:v6];

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__STHistoricalScreenTimeCellAccessibility_accessibilityElements__block_invoke;
  v8[3] = &unk_26514C368;
  objc_copyWeak(&v9, &location);
  [v3 enumerateObjectsUsingBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __64__STHistoricalScreenTimeCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setAccessibilityContainer:WeakRetained];
}

@end