@interface ArcadeHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilitySupplementaryFooterViews;
- (int64_t)_accessibilitySortPriority;
@end

@implementation ArcadeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.ArcadeHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return 10;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ArcadeHeaderViewAccessibility *)self safeSwiftValueForKey:@"accessoryView"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end