@interface STHistoricalNotificationsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation STHistoricalNotificationsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STHistoricalNotificationsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(STHistoricalNotificationsCellAccessibility *)self safeValueForKey:@"_historicalUsageViewController"];
  v5 = [v4 accessibilityElements];

  [v3 axSafelyAddObjectsFromArray:v5];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__STHistoricalNotificationsCellAccessibility_accessibilityElements__block_invoke;
  v7[3] = &unk_26514C368;
  objc_copyWeak(&v8, &location);
  [v3 enumerateObjectsUsingBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v3;
}

void __67__STHistoricalNotificationsCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 setAccessibilityContainer:WeakRetained];
}

@end