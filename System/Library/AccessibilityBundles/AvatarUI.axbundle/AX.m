@interface AX
@end

@implementation AX

void __49__AX_FunCamAvatarCarousel_accessibilityIncrement__block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  [WeakRetained collectionView:a1[5] didSelectItemAtIndexPath:a1[6]];
}

void __49__AX_FunCamAvatarCarousel_accessibilityDecrement__block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  [WeakRetained collectionView:a1[5] didSelectItemAtIndexPath:a1[6]];
}

@end