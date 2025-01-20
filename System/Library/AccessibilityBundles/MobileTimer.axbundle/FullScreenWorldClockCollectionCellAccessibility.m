@interface FullScreenWorldClockCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation FullScreenWorldClockCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FullScreenWorldClockCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end