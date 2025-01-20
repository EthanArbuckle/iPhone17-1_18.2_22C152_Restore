@interface GKCollectionHorizontalLayout
- (BOOL)alignItemsToTop;
- (BOOL)centersItemsInExcessSpace;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (NSDictionary)headerAttributes;
- (NSDictionary)itemAttributes;
- (double)extraSectionHeaderToCellSpace;
- (double)maxHeaderHeight;
- (double)scrollStepIntegral;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)firstValidSection;
- (int64_t)lastValidSection;
- (void)applyDefaults;
- (void)prepareLayout;
- (void)setAlignItemsToTop:(BOOL)a3;
- (void)setCentersItemsInExcessSpace:(BOOL)a3;
- (void)setExtraSectionHeaderToCellSpace:(double)a3;
- (void)setHeaderAttributes:(id)a3;
- (void)setItemAttributes:(id)a3;
- (void)setScrollStepIntegral:(double)a3;
@end

@implementation GKCollectionHorizontalLayout

- (void)applyDefaults
{
  self->_scrollStepIntegral = 0.0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (double)maxHeaderHeight
{
  v3 = [(GKCollectionHorizontalLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 < 1) {
    return 0.0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    [(GKCollectionFocusingLayout *)self sizeForHeaderInSection:v5];
    if (v7 > v6) {
      double v6 = v7;
    }
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (void)prepareLayout
{
  v3 = [(GKCollectionHorizontalLayout *)self collectionView];
  [v3 bounds];
  if (v4 != 0.0)
  {
    double v5 = v4;
    v68.receiver = self;
    v68.super_class = (Class)GKCollectionHorizontalLayout;
    [(GKCollectionFocusingLayout *)&v68 prepareLayout];
    uint64_t v6 = [v3 numberOfSections];
    double v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v57 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    [(GKCollectionFocusingLayout *)self sectionInset];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    double v15 = v9 + v14;
    [(GKCollectionHorizontalLayout *)self maxHeaderHeight];
    double v17 = v15 + v16;
    double extraSectionHeaderToCellSpace = self->_extraSectionHeaderToCellSpace;
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    uint64_t v56 = v6;
    if (v19 > 0.0)
    {
      v20 = (void *)MEMORY[0x1E4FB15E0];
      v21 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      v22 = [v20 layoutAttributesForSupplementaryViewOfKind:@"GKCollectionLayoutTopHeaderKind" withIndexPath:v21];
      [(GKCollectionFocusingLayout *)self setTopHeaderAttributes:v22];

      [(GKCollectionFocusingLayout *)self topHeaderHeight];
      double v24 = v23;
      v25 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      objc_msgSend(v25, "setFrame:", 0.0, 0.0, v5, v24);
    }
    double v26 = v17 + extraSectionHeaderToCellSpace;
    double v27 = v17 + extraSectionHeaderToCellSpace;
    if (v6 >= 1)
    {
      uint64_t v28 = 0;
      double v29 = v5 - v11 - v13;
      uint64_t v54 = *MEMORY[0x1E4FB2770];
      v55 = v3;
      double v30 = v11;
      double v31 = v29;
      double v27 = v26;
      do
      {
        uint64_t v32 = [v3 numberOfItemsInSection:v28];
        if (v32)
        {
          uint64_t v33 = v32;
          v34 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v28];
          v35 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v34];
          if (!v35)
          {
            v35 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v54 withIndexPath:v34];
            [v35 setZIndex:1024];
          }
          [(GKCollectionFocusingLayout *)self sizeForHeaderInSection:v28];
          objc_msgSend(v35, "setFrame:", v30, v15, v36, v37);
          [v57 setObject:v35 forKeyedSubscript:v34];
          if (v33 >= 1)
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              v39 = v34;
              v34 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v28];

              uint64_t v40 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v34];

              v35 = (void *)v40;
              if (!v40)
              {
                v35 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v34];
              }
              [(GKCollectionFocusingLayout *)self sizeForItemAtIndexPath:v34];
              double v43 = v41;
              if (v42 > v27) {
                double v27 = v42;
              }
              objc_msgSend(v35, "setFrame:", v30, v26, v41, v42);
              [v7 setObject:v35 forKeyedSubscript:v34];
              double v44 = v30 + v43;
              [(GKCollectionFocusingLayout *)self minimumInteritemSpacingForSectionAtIndex:v28];
              double v30 = v44 + v45;
            }
            double v31 = v44 - v11;
            v3 = v55;
            uint64_t v6 = v56;
          }
        }
        ++v28;
      }
      while (v28 != v6);
      if (self->_centersItemsInExcessSpace && v31 < v29)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke;
        aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
        *(double *)&aBlock[4] = (v29 - (v11 + v31)) * 0.5;
        v47 = _Block_copy(aBlock);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_2;
        v65[3] = &unk_1E5F63418;
        id v48 = v47;
        id v66 = v48;
        [v7 enumerateKeysAndObjectsUsingBlock:v65];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_3;
        v63[3] = &unk_1E5F63418;
        id v64 = v48;
        id v49 = v48;
        [v57 enumerateKeysAndObjectsUsingBlock:v63];
      }
    }
    if (!self->_alignItemsToTop)
    {
      [v3 frame];
      if (v26 < v50)
      {
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_4;
        v62[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
        *(double *)&v62[4] = (v50 - (v26 + v27)) * 0.5;
        v51 = _Block_copy(v62);
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_5;
        v60[3] = &unk_1E5F63418;
        id v52 = v51;
        id v61 = v52;
        [v7 enumerateKeysAndObjectsUsingBlock:v60];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_6;
        v58[3] = &unk_1E5F63418;
        id v59 = v52;
        id v53 = v52;
        [v57 enumerateKeysAndObjectsUsingBlock:v58];
      }
    }
    [(GKCollectionHorizontalLayout *)self setHeaderAttributes:v57];
    [(GKCollectionHorizontalLayout *)self setItemAttributes:v7];
  }
}

void __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 frame];
  [v4 setFrame:*(double *)(a1 + 32) + v3];
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 frame];
  objc_msgSend(v2, "setFrame:");
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__GKCollectionHorizontalLayout_prepareLayout__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSDictionary count](self->_itemAttributes, "count") + 1);
  double v9 = [MEMORY[0x1E4F28E60] indexSet];
  itemAttributes = self->_itemAttributes;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke;
  v28[3] = &unk_1E5F67048;
  CGFloat v31 = x;
  CGFloat v32 = y;
  CGFloat v33 = width;
  CGFloat v34 = height;
  v28[4] = self;
  id v11 = v8;
  id v29 = v11;
  id v12 = v9;
  id v30 = v12;
  [(NSDictionary *)itemAttributes enumerateKeysAndObjectsUsingBlock:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v26[3] = &unk_1E5F63468;
  v26[4] = self;
  id v13 = v11;
  id v27 = v13;
  [v12 enumerateIndexesUsingBlock:v26];
  uint64_t v14 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
  if (v14)
  {
    double v15 = (void *)v14;
    double v16 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
    [v16 frame];
    v36.origin.CGFloat x = v17;
    v36.origin.CGFloat y = v18;
    v36.size.CGFloat width = v19;
    v36.size.CGFloat height = v20;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    BOOL v21 = CGRectIntersectsRect(v35, v36);

    if (v21)
    {
      v22 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      [v13 addObject:v22];
    }
  }
  double v23 = v27;
  id v24 = v13;

  return v24;
}

void __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [v5 frame];
  v13.origin.CGFloat x = v6;
  v13.origin.CGFloat y = v7;
  v13.size.CGFloat width = v8;
  v13.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v13))
  {
    uint64_t v10 = [*(id *)(a1 + 32) focusAdjustedAttributesForItemAttributes:v5];

    [*(id *)(a1 + 40) addObject:v10];
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v11, "section"));
    id v5 = (id)v10;
  }
}

void __66__GKCollectionHorizontalLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a2];
  double v3 = objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", *MEMORY[0x1E4FB2770]);
  [v3 frame];
  if (v4 > 0.0)
  {
    [v3 frame];
    if (v5 > 0.0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    CGFloat v7 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForItemAttributes:v5];
  }
  else
  {
    CGFloat v7 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v4];
    [v7 setAlpha:0.0];
  }

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"GKCollectionLayoutTopHeaderKind"]) {
    [(GKCollectionFocusingLayout *)self topHeaderAttributes];
  }
  else {
  CGFloat v8 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v7];
  }
  if (v8)
  {
    CGFloat v9 = [(GKCollectionHorizontalLayout *)self collectionView];
    [v9 contentOffset];
    double v11 = v10;
    [v9 contentInset];
    double v13 = v12;
    uint64_t v14 = [v9 numberOfSections];
    if ([v7 section] >= v14 - 1)
    {
      double v16 = 0;
      double v23 = INFINITY;
    }
    else
    {
      uint64_t v40 = v9;
      id v41 = v7;
      double v15 = 0;
      double v16 = 0;
      uint64_t v17 = [v7 section] + 1;
      do
      {
        CGFloat v18 = v16;
        CGFloat v19 = v15;
        double v16 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v17];

        double v15 = [(GKCollectionHorizontalLayout *)self layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v16];

        if (v17 >= v14) {
          break;
        }
        [v15 frame];
        ++v17;
      }
      while (v20 == 0.0);
      [v15 frame];
      if (v21 <= 0.0)
      {

        double v16 = 0;
        double v23 = INFINITY;
      }
      else
      {
        [v15 frame];
        double v23 = v22;
      }

      CGFloat v9 = v40;
      id v7 = v41;
    }
    [v8 frame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [(GKCollectionFocusingLayout *)self sectionInset];
    if (v13 + v11 + v33 >= v26) {
      double v34 = v13 + v11 + v33;
    }
    else {
      double v34 = v26;
    }
    v43.origin.CGFloat x = v26;
    v43.origin.CGFloat y = v28;
    v43.size.CGFloat width = v30;
    v43.size.CGFloat height = v32;
    double v35 = v23 - CGRectGetWidth(v43);
    if (v16)
    {
      CGRect v36 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v16];
      [v36 frame];
      double v35 = v35 - (v23 - v37);
    }
    if (v34 >= v35) {
      double v34 = v35;
    }
    v38 = (void *)[v8 copy];

    objc_msgSend(v38, "setFrame:", v34, v28, v30, v32);
    id v24 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForSupplementaryViewAttributes:v38];
  }
  else
  {
    id v24 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
    [v24 setAlpha:0.0];
  }

  return v24;
}

- (CGSize)collectionViewContentSize
{
  if (![(NSDictionary *)self->_itemAttributes count]) {
    [(GKCollectionHorizontalLayout *)self prepareLayout];
  }
  [(GKCollectionFocusingLayout *)self sectionInset];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(GKCollectionHorizontalLayout *)self firstValidSection];
  if (v7 < 0)
  {
    double v17 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    CGFloat v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v7];
    CGFloat v9 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v8];
    int64_t v10 = [(GKCollectionHorizontalLayout *)self lastValidSection];
    double v11 = [(GKCollectionHorizontalLayout *)self collectionView];
    uint64_t v12 = [v11 numberOfItemsInSection:v10];

    double v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 - 1 inSection:v10];

    uint64_t v14 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v13];
    [v14 frame];
    double MaxX = CGRectGetMaxX(v29);
    [v9 frame];
    double v17 = MaxX - v16;
  }
  if (v6 <= 0.0) {
    double v18 = v4;
  }
  else {
    double v18 = v6;
  }
  double v19 = v4 + v18 + v17;
  double v20 = [(GKCollectionHorizontalLayout *)self collectionView];
  [v20 bounds];
  double v22 = v21;

  if (v19 >= v22) {
    double v22 = v19;
  }
  double v23 = [(GKCollectionHorizontalLayout *)self collectionView];
  [v23 bounds];
  double v25 = v24;

  double v26 = v22;
  double v27 = v25;
  result.CGFloat height = v27;
  result.CGFloat width = v26;
  return result;
}

- (int64_t)firstValidSection
{
  double v3 = [(GKCollectionHorizontalLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 < 1) {
    return -1;
  }
  int64_t v5 = 0;
  while (1)
  {
    double v6 = [(GKCollectionHorizontalLayout *)self collectionView];
    uint64_t v7 = [v6 numberOfItemsInSection:v5];

    if (v7 > 0) {
      break;
    }
    if (v4 == ++v5) {
      return -1;
    }
  }
  return v5;
}

- (int64_t)lastValidSection
{
  double v3 = [(GKCollectionHorizontalLayout *)self collectionView];
  int64_t v4 = [v3 numberOfSections];

  while (v4-- >= 1)
  {
    double v6 = [(GKCollectionHorizontalLayout *)self collectionView];
    uint64_t v7 = [v6 numberOfItemsInSection:v4];

    if (v7 >= 1) {
      return v4;
    }
  }
  return -1;
}

- (BOOL)centersItemsInExcessSpace
{
  return self->_centersItemsInExcessSpace;
}

- (void)setCentersItemsInExcessSpace:(BOOL)a3
{
  self->_centersItemsInExcessSpace = a3;
}

- (BOOL)alignItemsToTop
{
  return self->_alignItemsToTop;
}

- (void)setAlignItemsToTop:(BOOL)a3
{
  self->_alignItemsToTop = a3;
}

- (double)extraSectionHeaderToCellSpace
{
  return self->_extraSectionHeaderToCellSpace;
}

- (void)setExtraSectionHeaderToCellSpace:(double)a3
{
  self->_double extraSectionHeaderToCellSpace = a3;
}

- (NSDictionary)itemAttributes
{
  return self->_itemAttributes;
}

- (void)setItemAttributes:(id)a3
{
}

- (NSDictionary)headerAttributes
{
  return self->_headerAttributes;
}

- (void)setHeaderAttributes:(id)a3
{
}

- (double)scrollStepIntegral
{
  return self->_scrollStepIntegral;
}

- (void)setScrollStepIntegral:(double)a3
{
  self->_scrollStepIntegral = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAttributes, 0);

  objc_storeStrong((id *)&self->_itemAttributes, 0);
}

@end