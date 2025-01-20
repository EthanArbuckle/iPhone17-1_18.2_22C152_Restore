@interface RecentlyPlayedCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RecentlyPlayedCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecentlyPlayedTodayExtension.RecentlyPlayedCollectionCell";
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
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(RecentlyPlayedCollectionCellAccessibility *)self safeValueForKey:@"accessibilityMediaTitle"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end