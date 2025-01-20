@interface UICollectionViewLayout(AVTCollectionViewLayout)
- (double)centerForCenteringElementAtIndex:()AVTCollectionViewLayout visibleBoundsSize:proposedOrigin:;
- (double)finalFrameForDisappearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout;
- (double)frameForElementAtIndex:()AVTCollectionViewLayout visibleBounds:;
- (double)initialFrameForAppearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout;
- (id)indexesForElementsInRect:()AVTCollectionViewLayout visibleBounds:numberOfItems:;
@end

@implementation UICollectionViewLayout(AVTCollectionViewLayout)

- (double)frameForElementAtIndex:()AVTCollectionViewLayout visibleBounds:
{
  v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  v5 = [a1 layoutAttributesForItemAtIndexPath:v4];
  [v5 frame];
  double v7 = v6;

  return v7;
}

- (id)indexesForElementsInRect:()AVTCollectionViewLayout visibleBounds:numberOfItems:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v10 = [MEMORY[0x263F089C8] indexSet];
  v11 = objc_msgSend(a1, "layoutAttributesForElementsInRect:", a2, a3, a4, a5);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v16 indexPath];
        uint64_t v18 = [v17 section];

        if (!v18)
        {
          v19 = [v16 indexPath];
          objc_msgSend(v10, "addIndex:", objc_msgSend(v19, "row"));
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  v20 = (void *)[v10 copy];

  return v20;
}

- (double)centerForCenteringElementAtIndex:()AVTCollectionViewLayout visibleBoundsSize:proposedOrigin:
{
  v4 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  v5 = [a1 layoutAttributesForItemAtIndexPath:v4];

  [v5 frame];
  UIRectGetCenter();
  double v7 = v6;

  return v7;
}

- (double)initialFrameForAppearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout
{
  v2 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  v3 = [a1 initialLayoutAttributesForAppearingItemAtIndexPath:v2];

  [v3 frame];
  double v5 = v4;

  return v5;
}

- (double)finalFrameForDisappearingElementAtOriginForVisibleBounds:()AVTCollectionViewLayout
{
  v2 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  v3 = [a1 finalLayoutAttributesForDisappearingItemAtIndexPath:v2];

  [v3 frame];
  double v5 = v4;

  return v5;
}

@end