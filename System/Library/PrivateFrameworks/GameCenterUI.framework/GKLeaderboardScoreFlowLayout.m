@interface GKLeaderboardScoreFlowLayout
- (BOOL)isInsertingItemsAbove;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGSize)contentSizeBeforeInsertingItemsAbove;
- (double)heightOfInsertedItems;
- (double)initialContentOffset;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)setContentSizeBeforeInsertingItemsAbove:(CGSize)a3;
- (void)setHeightOfInsertedItems:(double)a3;
- (void)setInitialContentOffset:(double)a3;
- (void)setIsInsertingItemsAbove:(BOOL)a3;
@end

@implementation GKLeaderboardScoreFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(GKLeaderboardScoreFlowLayout *)self heightOfInsertedItems];
  double v7 = y + v6;
  [(GKLeaderboardScoreFlowLayout *)self setHeightOfInsertedItems:0.0];
  double v8 = x;
  double v9 = v7;
  result.double y = v9;
  result.CGFloat x = v8;
  return result;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKLeaderboardScoreFlowLayout;
  [(GKLeaderboardScoreFlowLayout *)&v19 prepareForCollectionViewUpdates:v4];
  if ([(GKLeaderboardScoreFlowLayout *)self isInsertingItemsAbove])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (!objc_msgSend(v11, "updateAction", (void)v15))
          {
            v12 = [v11 indexPathAfterUpdate];
            if (v12)
            {
              v13 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v12];
              [v13 frame];
              double v9 = v9 + v14;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    [(GKLeaderboardScoreFlowLayout *)self setHeightOfInsertedItems:v9];
  }
}

- (BOOL)isInsertingItemsAbove
{
  return self->_isInsertingItemsAbove;
}

- (void)setIsInsertingItemsAbove:(BOOL)a3
{
  self->_isInsertingItemsAbove = a3;
}

- (double)heightOfInsertedItems
{
  return self->_heightOfInsertedItems;
}

- (void)setHeightOfInsertedItems:(double)a3
{
  self->_heightOfInsertedItems = a3;
}

- (CGSize)contentSizeBeforeInsertingItemsAbove
{
  double width = self->_contentSizeBeforeInsertingItemsAbove.width;
  double height = self->_contentSizeBeforeInsertingItemsAbove.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSizeBeforeInsertingItemsAbove:(CGSize)a3
{
  self->_contentSizeBeforeInsertingItemsAbove = a3;
}

- (double)initialContentOffset
{
  return self->_initialContentOffset;
}

- (void)setInitialContentOffset:(double)a3
{
  self->_initialContentOffset = a3;
}

@end