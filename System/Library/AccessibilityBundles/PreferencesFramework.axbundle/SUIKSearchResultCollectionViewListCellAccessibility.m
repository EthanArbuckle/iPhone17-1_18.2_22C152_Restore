@interface SUIKSearchResultCollectionViewListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation SUIKSearchResultCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUIKSearchResultCollectionViewListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end