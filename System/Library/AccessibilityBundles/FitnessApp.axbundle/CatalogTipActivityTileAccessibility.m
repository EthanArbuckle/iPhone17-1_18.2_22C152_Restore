@interface CatalogTipActivityTileAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation CatalogTipActivityTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.CatalogTipActivityTile";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CatalogTipActivityTileAccessibility;
  return UIAccessibilityTraitButton | [(CatalogTipActivityTileAccessibility *)&v3 accessibilityTraits];
}

@end