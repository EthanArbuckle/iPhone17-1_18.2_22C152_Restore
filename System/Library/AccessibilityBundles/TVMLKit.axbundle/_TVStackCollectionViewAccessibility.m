@interface _TVStackCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation _TVStackCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end