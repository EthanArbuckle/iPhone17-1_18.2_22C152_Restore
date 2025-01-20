@interface TodayCardChinLockupListIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TodayCardChinLockupListIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.TodayCardChinLockupListIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityAppStoreLocalizedString(@"app.suggestion");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TodayCardChinLockupListIconViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TodayCardChinLockupListIconViewAccessibility *)&v3 accessibilityTraits];
}

@end