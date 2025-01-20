@interface ProductTapToRateCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOnlyComparesByXAxis;
@end

@implementation ProductTapToRateCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.ProductTapToRateCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end