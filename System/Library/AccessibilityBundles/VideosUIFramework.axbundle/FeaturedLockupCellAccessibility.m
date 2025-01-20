@interface FeaturedLockupCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation FeaturedLockupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.FeaturedLockupCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)FeaturedLockupCellAccessibility;
  unsigned __int8 v3 = [(FeaturedLockupCellAccessibility *)&v5 canBecomeFocused];
  return v3 & ~[(FeaturedLockupCellAccessibility *)self _accessibilityIsFKARunningForFocusItem];
}

@end