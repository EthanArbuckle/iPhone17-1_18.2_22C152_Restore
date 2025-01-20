@interface AppStore_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)_accessibilityVisibleItemDenominator;
@end

@implementation AppStore_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityVisibleItemDenominator
{
  v3 = [(AppStore_UICollectionViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"AXArticlePageViewCollectionView"];

  double result = 6.0;
  if ((v4 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AppStore_UICollectionViewAccessibility;
    [(AppStore_UICollectionViewAccessibility *)&v6 _accessibilityVisibleItemDenominator];
  }
  return result;
}

@end