@interface STHistoricalPickupsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation STHistoricalPickupsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STHistoricalPickupsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STHistoricalPickupsCell" hasInstanceVariable:@"_historicalUsageViewController" withType:"STHistoricalUsageViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STHistoricalPickupsCell", @"pickupMetricsView", "@", 0);
  [v3 validateClass:@"STHistoricalPickupsCell" hasInstanceVariable:@"_firstUsedAfterPickupLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(STHistoricalPickupsCellAccessibility *)self safeValueForKey:@"_historicalUsageViewController"];
  v5 = [v4 accessibilityElements];

  [v3 axSafelyAddObjectsFromArray:v5];
  v6 = [(STHistoricalPickupsCellAccessibility *)self safeUIViewForKey:@"pickupMetricsView"];
  [v3 axSafelyAddObject:v6];

  v7 = [(STHistoricalPickupsCellAccessibility *)self safeUIViewForKey:@"_firstUsedAfterPickupLabel"];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  [v3 axSafelyAddObject:v7];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__STHistoricalPickupsCellAccessibility_accessibilityElements__block_invoke;
  v9[3] = &unk_26514C368;
  objc_copyWeak(&v10, &location);
  [v3 enumerateObjectsUsingBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v3;
}

void __61__STHistoricalPickupsCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setAccessibilityContainer:WeakRetained];
}

@end