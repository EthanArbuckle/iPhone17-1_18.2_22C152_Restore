@interface UICollectionViewListCellAccessibility
@end

@implementation UICollectionViewListCellAccessibility

uint64_t __82__UICollectionViewListCellAccessibility__Music__UIKit__axIsInViewControllerClass___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end