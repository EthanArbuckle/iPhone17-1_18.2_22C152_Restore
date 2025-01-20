@interface ArcadeHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (int64_t)_accessibilitySortPriority;
@end

@implementation ArcadeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.ArcadeHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.ArcadeHeaderView" isKindOfClass:@"AppStore.TitleHeaderView"];
  [v3 validateClass:@"AppStore.TitleHeaderView" hasSwiftField:@"accessoryView" withSwiftType:"Optional<UIView>"];
}

- (int64_t)_accessibilitySortPriority
{
  return 10;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ArcadeHeaderViewAccessibility *)self safeSwiftValueForKey:@"accessoryView"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end