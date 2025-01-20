@interface SearchUITableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)supportsRecycling;
@end

@implementation SearchUITableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsRecycling
{
  if (_AXSInvertColorsEnabledGlobalCached()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SearchUITableViewCellInvertColorsAccessibility;
  return [(SearchUITableViewCellInvertColorsAccessibility *)&v4 supportsRecycling];
}

@end