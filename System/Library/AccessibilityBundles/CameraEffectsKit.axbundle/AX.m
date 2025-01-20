@interface AX
@end

@implementation AX

void __49__AX_FunCamFilterCarousel_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessibilityContainer];
  [v2 collectionView:*(void *)(a1 + 40) didSelectItemAtIndexPath:*(void *)(a1 + 48)];
}

void __49__AX_FunCamFilterCarousel_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessibilityContainer];
  [v2 collectionView:*(void *)(a1 + 40) didSelectItemAtIndexPath:*(void *)(a1 + 48)];
}

@end