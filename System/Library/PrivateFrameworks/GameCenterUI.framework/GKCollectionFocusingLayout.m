@interface GKCollectionFocusingLayout
- (BOOL)shouldUpdateVisibleCellLayoutAttributes;
- (CGSize)sizeForFooterInSection:(int64_t)a3;
- (CGSize)sizeForHeaderInSection:(int64_t)a3;
- (CGSize)sizeForItemAtIndexPath:(id)a3;
- (GKCollectionFocusingLayout)init;
- (NSIndexPath)focusedIndexPath;
- (UICollectionViewLayoutAttributes)topHeaderAttributes;
- (UIEdgeInsets)sectionInset;
- (double)focusHeaderOffset;
- (double)focusScaleFactor;
- (double)headerToItemSpacing;
- (double)minimumInteritemSpacingForSectionAtIndex:(int64_t)a3;
- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3;
- (double)topHeaderHeight;
- (id)focusAdjustedAttributesForItemAttributes:(id)a3;
- (id)focusAdjustedAttributesForSupplementaryViewAttributes:(id)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_updateFocusFrameForCellAtIndexPath:(id)a3;
- (void)_updateFocusOffsetsForSectionHeadersWithAnimationCoordinator:(id)a3;
- (void)awakeFromNib;
- (void)setFocusHeaderOffset:(double)a3;
- (void)setFocusScaleFactor:(double)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setHeaderToItemSpacing:(double)a3;
- (void)setTopHeaderAttributes:(id)a3;
- (void)setTopHeaderHeight:(double)a3;
@end

@implementation GKCollectionFocusingLayout

- (GKCollectionFocusingLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionFocusingLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_focusHeaderOffset = 20.0;
    [(GKCollectionFocusingLayout *)v2 applyDefaults];
  }
  return v3;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionFocusingLayout;
  [(GKCollectionFocusingLayout *)&v3 awakeFromNib];
  [(GKCollectionFocusingLayout *)self applyDefaults];
}

- (BOOL)shouldUpdateVisibleCellLayoutAttributes
{
  return 1;
}

- (void)setFocusedIndexPath:(id)a3
{
  objc_super v5 = (NSIndexPath *)a3;
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath != v5)
  {
    v7 = focusedIndexPath;
    objc_storeStrong((id *)&self->_focusedIndexPath, a3);
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __50__GKCollectionFocusingLayout_setFocusedIndexPath___block_invoke;
    v13 = &unk_1E5F63350;
    v14 = self;
    v15 = v7;
    v9 = v7;
    [v8 animateWithDuration:4 delay:&v10 options:0 animations:0.3 completion:0.0];
    [(GKCollectionFocusingLayout *)self invalidateLayout];
  }
}

double *__50__GKCollectionFocusingLayout_setFocusedIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFocusOffsetsForSectionHeadersWithAnimationCoordinator:0];
  result = *(double **)(a1 + 32);
  if (result[70] != 1.0)
  {
    [result _updateFocusFrameForCellAtIndexPath:*(void *)(a1 + 40)];
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[71];
    return (double *)[v3 _updateFocusFrameForCellAtIndexPath:v4];
  }
  return result;
}

- (void)_updateFocusOffsetsForSectionHeadersWithAnimationCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(GKCollectionFocusingLayout *)self collectionView];
  uint64_t v6 = [v5 numberOfSections];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *MEMORY[0x1E4FB2770];
    unint64_t v10 = 0x1E4F28000uLL;
    uint64_t v32 = *MEMORY[0x1E4FB2770];
    do
    {
      uint64_t v11 = [*(id *)(v10 + 3416) indexPathForItem:0 inSection:v8];
      v12 = [v5 _visibleSupplementaryViewOfKind:v9 atIndexPath:v11];
      if (v12)
      {
        v13 = [(GKCollectionFocusingLayout *)self layoutAttributesForSupplementaryViewOfKind:v9 atIndexPath:v11];
        [v12 frame];
        double v15 = v14;
        [v13 frame];
        if (v15 != v16)
        {
          [v12 frame];
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          [v13 frame];
          double v24 = v23;
          if (v4)
          {
            [v12 frame];
            uint64_t v25 = v7;
            v26 = v5;
            v27 = self;
            unint64_t v28 = v10;
            BOOL v30 = v29 <= v24;
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __91__GKCollectionFocusingLayout__updateFocusOffsetsForSectionHeadersWithAnimationCoordinator___block_invoke;
            v33[3] = &unk_1E5F66058;
            id v34 = v12;
            double v35 = v18;
            double v36 = v24;
            double v37 = v20;
            double v38 = v22;
            BOOL v31 = v30;
            unint64_t v10 = v28;
            self = v27;
            objc_super v5 = v26;
            uint64_t v7 = v25;
            uint64_t v9 = v32;
            [v4 addCoordinatedAnimationsForAnimation:v31 animations:v33 completion:0];
          }
          else
          {
            objc_msgSend(v12, "setFrame:", v18, v23, v20, v22);
            [v12 layoutIfNeeded];
          }
        }
      }
      ++v8;
    }
    while (v7 != v8);
  }
}

uint64_t __91__GKCollectionFocusingLayout__updateFocusOffsetsForSectionHeadersWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_updateFocusFrameForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v21 = v4;
    uint64_t v6 = [(GKCollectionFocusingLayout *)self collectionView];
    uint64_t v7 = [v6 cellForItemAtIndexPath:v21];

    if (v7)
    {
      uint64_t v8 = [(GKCollectionFocusingLayout *)self layoutAttributesForItemAtIndexPath:v21];
      [v7 frame];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [v8 frame];
      v24.origin.x = v17;
      v24.origin.y = v18;
      v24.size.width = v19;
      v24.size.height = v20;
      v23.origin.x = v10;
      v23.origin.y = v12;
      v23.size.width = v14;
      v23.size.height = v16;
      if (!CGRectEqualToRect(v23, v24))
      {
        [v8 frame];
        objc_msgSend(v7, "setFrame:");
        [v7 layoutIfNeeded];
      }
    }
    id v5 = v21;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (UIEdgeInsets)sectionInset
{
  v22.receiver = self;
  v22.super_class = (Class)GKCollectionFocusingLayout;
  [(UICollectionViewFlowLayout *)&v22 sectionInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(GKCollectionFocusingLayout *)self collectionView];
  CGFloat v12 = [v11 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v13 = [(GKCollectionFocusingLayout *)self collectionView];
    [v12 collectionView:v13 layout:self insetForSectionAtIndex:0];
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)minimumInteritemSpacingForSectionAtIndex:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GKCollectionFocusingLayout;
  [(UICollectionViewFlowLayout *)&v12 minimumInteritemSpacing];
  double v6 = v5;
  double v7 = [(GKCollectionFocusingLayout *)self collectionView];
  double v8 = [v7 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v9 = [(GKCollectionFocusingLayout *)self collectionView];
    [v8 collectionView:v9 layout:self minimumInteritemSpacingForSectionAtIndex:a3];
    double v6 = v10;
  }
  return v6;
}

- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)GKCollectionFocusingLayout;
  [(UICollectionViewFlowLayout *)&v12 minimumLineSpacing];
  double v6 = v5;
  double v7 = [(GKCollectionFocusingLayout *)self collectionView];
  double v8 = [v7 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v9 = [(GKCollectionFocusingLayout *)self collectionView];
    [v8 collectionView:v9 layout:self minimumLineSpacingForSectionAtIndex:a3];
    double v6 = v10;
  }
  return v6;
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(GKCollectionFocusingLayout *)self collectionView];
  double v10 = [v9 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v11 = [(GKCollectionFocusingLayout *)self collectionView];
    [v10 collectionView:v11 layout:self sizeForItemAtIndexPath:v4];
    double v6 = v12;
    double v8 = v13;
  }
  double v14 = v6;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeForHeaderInSection:(int64_t)a3
{
  [(UICollectionViewFlowLayout *)self headerReferenceSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(GKCollectionFocusingLayout *)self collectionView];
  double v10 = [v9 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v11 = [(GKCollectionFocusingLayout *)self collectionView];
    [v10 collectionView:v11 layout:self referenceSizeForHeaderInSection:a3];
    double v6 = v12;
    double v8 = v13;
  }
  double v14 = v6;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeForFooterInSection:(int64_t)a3
{
  [(UICollectionViewFlowLayout *)self footerReferenceSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(GKCollectionFocusingLayout *)self collectionView];
  double v10 = [v9 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v11 = [(GKCollectionFocusingLayout *)self collectionView];
    [v10 collectionView:v11 layout:self referenceSizeForFooterInSection:a3];
    double v6 = v12;
    double v8 = v13;
  }
  double v14 = v6;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)focusAdjustedAttributesForItemAttributes:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_focusScaleFactor != 1.0)
  {
    double v6 = [v4 indexPath];
    double v7 = [(GKCollectionFocusingLayout *)self focusedIndexPath];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      double v9 = (void *)[v5 copy];

      [v9 frame];
      objc_msgSend(v9, "setFrame:", v12 - (self->_focusScaleFactor * v10 - v10) * 0.5, v13 - (self->_focusScaleFactor * v11 - v11) * 0.5, self->_focusScaleFactor * v10, self->_focusScaleFactor * v11);
      double v5 = v9;
    }
  }

  return v5;
}

- (id)focusAdjustedAttributesForSupplementaryViewAttributes:(id)a3
{
  id v4 = a3;
  focusedIndexPath = self->_focusedIndexPath;
  double v6 = v4;
  if (focusedIndexPath)
  {
    uint64_t v7 = [(NSIndexPath *)focusedIndexPath section];
    int v8 = [v4 indexPath];
    if (v7 < [v8 section]) {
      goto LABEL_9;
    }
    double v9 = [v4 representedElementKind];
    int v10 = [v9 isEqual:*MEMORY[0x1E4FB2770]];

    double v6 = v4;
    if (!v10) {
      goto LABEL_11;
    }
    int v8 = [(GKCollectionFocusingLayout *)self layoutAttributesForItemAtIndexPath:self->_focusedIndexPath];
    [v4 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGFloat v18 = v17;
    [v8 frame];
    double v23 = v19;
    double v24 = v20;
    double v25 = v21;
    double v26 = v22;
    if (self->_focusScaleFactor == 1.0)
    {
      double v23 = v19 - (v21 * 1.208 - v21) * 0.5;
      double v24 = v20 - (v22 * 1.208 - v22) * 0.5;
      double v26 = v22 * 1.208;
      double v25 = v21 * 1.208;
    }
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    double rect = v18;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v23;
    v35.origin.y = v24;
    v35.size.width = v25;
    v35.size.height = v26;
    if (MaxX < CGRectGetMinX(v35)) {
      goto LABEL_9;
    }
    v36.origin.x = v23;
    v36.origin.y = v24;
    v36.size.width = v25;
    v36.size.height = v26;
    double MinY = CGRectGetMinY(v36);
    v37.origin.x = v12;
    v37.origin.y = v14;
    v37.size.width = v16;
    v37.size.height = rect;
    double v29 = MinY - CGRectGetMaxY(v37);
    v38.origin.x = v23;
    v38.origin.y = v24;
    v38.size.width = v25;
    v38.size.height = v26;
    if (v29 >= CGRectGetHeight(v38) * 0.5)
    {
LABEL_9:
      double v6 = v4;
    }
    else
    {
      double v30 = v14 - self->_focusHeaderOffset;
      double v6 = (void *)[v4 copy];

      objc_msgSend(v6, "setFrame:", v12, v30, v16, rect);
    }
  }
LABEL_11:

  return v6;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKCollectionFocusingLayout;
  id v4 = [(UICollectionViewFlowLayout *)&v7 layoutAttributesForItemAtIndexPath:a3];
  double v5 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForItemAttributes:v4];

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionFocusingLayout;
  double v5 = [(UICollectionViewFlowLayout *)&v8 layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:a4];
  double v6 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForSupplementaryViewAttributes:v5];

  return v6;
}

- (double)topHeaderHeight
{
  return self->_topHeaderHeight;
}

- (void)setTopHeaderHeight:(double)a3
{
  self->_topHeaderHeight = a3;
}

- (double)focusScaleFactor
{
  return self->_focusScaleFactor;
}

- (void)setFocusScaleFactor:(double)a3
{
  self->_focusScaleFactor = a3;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (double)focusHeaderOffset
{
  return self->_focusHeaderOffset;
}

- (void)setFocusHeaderOffset:(double)a3
{
  self->_focusHeaderOffset = a3;
}

- (double)headerToItemSpacing
{
  return self->_headerToItemSpacing;
}

- (void)setHeaderToItemSpacing:(double)a3
{
  self->_headerToItemSpacing = a3;
}

- (UICollectionViewLayoutAttributes)topHeaderAttributes
{
  return self->_topHeaderAttributes;
}

- (void)setTopHeaderAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topHeaderAttributes, 0);

  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
}

@end