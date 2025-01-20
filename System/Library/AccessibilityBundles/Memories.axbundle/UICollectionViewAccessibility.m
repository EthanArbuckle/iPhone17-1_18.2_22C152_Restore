@interface UICollectionViewAccessibility
@end

@implementation UICollectionViewAccessibility

double __83__UICollectionViewAccessibility__Memories__UIKit__accessibilityScrollWidthDistance__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  [v2 _sizeForItemAtIndexPath:v3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;

  uint64_t v7 = [*(id *)(a1 + 40) numberOfItemsInSection:0];
  double result = (*(double *)(a1 + 64) - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) * (double)v7)
         / (double)(v7 - 1);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

@end