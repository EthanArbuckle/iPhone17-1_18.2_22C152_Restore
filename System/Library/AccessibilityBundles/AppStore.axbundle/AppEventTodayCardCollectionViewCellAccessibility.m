@interface AppEventTodayCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation AppEventTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.AppEventTodayCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(AppEventTodayCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"formattedDateView"];
  [v3 axSafelyAddObject:v4];
  v7.receiver = self;
  v7.super_class = (Class)AppEventTodayCardCollectionViewCellAccessibility;
  v5 = [(AppEventTodayCardCollectionViewCellAccessibility *)&v7 accessibilityElements];
  [v3 axSafelyAddObjectsFromArray:v5];

  return v3;
}

@end