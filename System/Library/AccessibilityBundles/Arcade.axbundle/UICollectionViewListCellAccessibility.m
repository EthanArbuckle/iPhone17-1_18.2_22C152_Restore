@interface UICollectionViewListCellAccessibility
@end

@implementation UICollectionViewListCellAccessibility

uint64_t __77__UICollectionViewListCellAccessibility__AppStore__UIKit__axIsInPageFacetsVC__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456419D0](@"Arcade.PageFacetsViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end