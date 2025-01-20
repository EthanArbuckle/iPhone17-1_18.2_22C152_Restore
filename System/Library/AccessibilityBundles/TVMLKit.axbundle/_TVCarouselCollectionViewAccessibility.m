@interface _TVCarouselCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityRepresentsInfiniteCollection;
@end

@implementation _TVCarouselCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCarouselCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityRepresentsInfiniteCollection
{
  return 1;
}

@end