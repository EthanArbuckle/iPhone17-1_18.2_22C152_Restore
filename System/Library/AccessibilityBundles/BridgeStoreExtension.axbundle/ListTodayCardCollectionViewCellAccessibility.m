@interface ListTodayCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation ListTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.ListTodayCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BridgeStoreExtension.ListTodayCardCollectionViewCell" hasSwiftField:@"labelsView" withSwiftType:"TodayCardLabelsView"];
  [v3 validateClass:@"BridgeStoreExtension.ListTodayCardCollectionViewCell" hasSwiftField:@"lockupContainer" withSwiftType:"TodayListCardLockupContainer"];
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ListTodayCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"labelsView"];
  [v4 setIsAccessibilityElement:1];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v3 axSafelyAddObject:v4];
  objc_opt_class();
  v5 = [(ListTodayCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"lockupContainer"];
  v6 = __UIAccessibilityCastAsClass();

  [v3 axSafelyAddObject:v6];

  return v3;
}

@end