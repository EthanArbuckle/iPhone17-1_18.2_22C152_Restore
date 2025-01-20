@interface TitleHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)_accessibilitySortPriority;
@end

@implementation TitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.TitleHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  v3 = [(TitleHeaderViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 containsString:@"scrollablePill"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TitleHeaderViewAccessibility;
  return [(TitleHeaderViewAccessibility *)&v6 _accessibilitySortPriority];
}

@end