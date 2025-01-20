@interface GKCollectionGridLayout
- (BOOL)centersItemsInExcessSpace;
- (BOOL)didPerformInitialContentInsetScroll;
- (BOOL)sectionInsetRelativeWithContentInset;
- (BOOL)shouldPerformInitialScrollToContentInsetTop;
- (CGSize)collectionViewContentSize;
- (NSDictionary)footerAttributes;
- (NSDictionary)headerAttributes;
- (NSDictionary)itemAttributes;
- (NSIndexSet)sectionsThatShowFootersWhenEmpty;
- (NSIndexSet)sectionsThatShowHeaderWhenEmpty;
- (double)extraSectionHeaderToCellSpace;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)autoWidthColumns;
- (int64_t)lastValidSection;
- (void)applyDefaults;
- (void)prepareLayout;
- (void)setAutoWidthColumns:(int64_t)a3;
- (void)setCentersItemsInExcessSpace:(BOOL)a3;
- (void)setDidPerformInitialContentInsetScroll:(BOOL)a3;
- (void)setExtraSectionHeaderToCellSpace:(double)a3;
- (void)setFooterAttributes:(id)a3;
- (void)setHeaderAttributes:(id)a3;
- (void)setItemAttributes:(id)a3;
- (void)setSectionInsetRelativeWithContentInset:(BOOL)a3;
- (void)setSectionsThatShowFootersWhenEmpty:(id)a3;
- (void)setSectionsThatShowHeaderWhenEmpty:(id)a3;
- (void)setShouldPerformInitialScrollToContentInsetTop:(BOOL)a3;
@end

@implementation GKCollectionGridLayout

- (void)applyDefaults
{
  [(UICollectionViewFlowLayout *)self setScrollDirection:0];
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 8.0, 0.0, 0.0, 0.0);
  [(UICollectionViewFlowLayout *)self setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)self setMinimumLineSpacing:12.0];
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", 144.0, 70.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](self, "setHeaderReferenceSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(GKCollectionFocusingLayout *)self setFocusScaleFactor:1.0];
  [(GKCollectionGridLayout *)self setAutoWidthColumns:0];
  [(GKCollectionFocusingLayout *)self setFocusHeaderOffset:0.0];
  [(GKCollectionGridLayout *)self setShouldPerformInitialScrollToContentInsetTop:0];

  [(GKCollectionGridLayout *)self setDidPerformInitialContentInsetScroll:0];
}

- (void)setAutoWidthColumns:(int64_t)a3
{
  if (self->_autoWidthColumns != a3)
  {
    self->_autoWidthColumns = a3;
    [(GKCollectionGridLayout *)self invalidateLayout];
  }
}

- (void)prepareLayout
{
  v3 = [(GKCollectionGridLayout *)self collectionView];
  [v3 bounds];
  if (v4 != 0.0)
  {
    double v5 = v4;
    v93.receiver = self;
    v93.super_class = (Class)GKCollectionGridLayout;
    [(GKCollectionFocusingLayout *)&v93 prepareLayout];
    v6 = [(GKCollectionGridLayout *)self collectionView];
    [v6 contentInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    if ([(GKCollectionGridLayout *)self shouldPerformInitialScrollToContentInsetTop]&& ![(GKCollectionGridLayout *)self didPerformInitialContentInsetScroll]&& v8 > 0.0)
    {
      [v3 contentOffset];
      objc_msgSend(v3, "setContentOffset:animated:", 0);
      [(GKCollectionGridLayout *)self setDidPerformInitialContentInsetScroll:1];
    }
    uint64_t v13 = [v3 numberOfSections];
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v82 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13];
    uint64_t v80 = v13;
    v81 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13];
    [(GKCollectionFocusingLayout *)self sectionInset];
    double v78 = v16;
    double v79 = v15;
    double v18 = v17;
    double v20 = v19;
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    double v22 = v21;
    double v85 = v18;
    if (self->_sectionInsetRelativeWithContentInset) {
      double v23 = v5 - v18 - v20 - v10 - v12;
    }
    else {
      double v23 = v5 - v18 - v20;
    }
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    if (v24 > 0.0)
    {
      v25 = (void *)MEMORY[0x1E4FB15E0];
      v26 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      v27 = [v25 layoutAttributesForSupplementaryViewOfKind:@"GKCollectionLayoutTopHeaderKind" withIndexPath:v26];
      [(GKCollectionFocusingLayout *)self setTopHeaderAttributes:v27];

      [(GKCollectionFocusingLayout *)self topHeaderHeight];
      double v29 = v28;
      v30 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      objc_msgSend(v30, "setFrame:", 0.0, 0.0, v5, v29);
    }
    if (v80 >= 1)
    {
      uint64_t v31 = 0;
      uint64_t v76 = *MEMORY[0x1E4FB2770];
      double v75 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v74 = *MEMORY[0x1E4FB2760];
      double v32 = v23;
      v77 = v3;
      while (1)
      {
        uint64_t v33 = [v3 numberOfItemsInSection:v31];
        v34 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v31];
        v35 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v34];
        if (!v35)
        {
          v35 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v76 withIndexPath:v34];
          [v35 setZIndex:1024];
        }
        double v36 = v79 + v22;
        [(GKCollectionFocusingLayout *)self sizeForHeaderInSection:v31];
        if (v38 > 0.0 && v37 == 0.0) {
          double v40 = v23;
        }
        else {
          double v40 = v37;
        }
        objc_msgSend(v35, "setFrame:", v85, v36, v40, v38);
        [v82 setObject:v35 forKeyedSubscript:v34];
        [v35 frame];
        double v42 = v41;
        double extraSectionHeaderToCellSpace = self->_extraSectionHeaderToCellSpace;
        [(GKCollectionFocusingLayout *)self minimumInteritemSpacingForSectionAtIndex:v31];
        double v45 = v44;
        int64_t autoWidthColumns = self->_autoWidthColumns;
        double v84 = 0.0;
        if (autoWidthColumns >= 1) {
          double v84 = (v23 - v44 * (double)(autoWidthColumns - 1)) / (double)autoWidthColumns;
        }
        double v47 = v36 + v42 + extraSectionHeaderToCellSpace + 0.0;
        [(GKCollectionFocusingLayout *)self minimumLineSpacingForSectionAtIndex:v31];
        double v49 = v48;
        if (v33 >= 1) {
          break;
        }
        double v58 = v48 + v75;
LABEL_40:
        v61 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v31];

        v62 = [(GKCollectionGridLayout *)self footerAttributes];
        v63 = [v62 objectForKeyedSubscript:v61];

        if (!v63)
        {
          v63 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v74 withIndexPath:v61];
          [v63 setZIndex:1024];
        }
        double v64 = v58 + v47;
        [(GKCollectionFocusingLayout *)self sizeForFooterInSection:v31];
        double v67 = v66;
        if (v66 > 0.0 && v65 == 0.0) {
          double v69 = v23;
        }
        else {
          double v69 = v65;
        }
        objc_msgSend(v63, "setFrame:", v85, v64, v69, v66);
        [v81 setObject:v63 forKeyedSubscript:v61];
        double v22 = v78 + v64 + v67;

        ++v31;
        v3 = v77;
        if (v31 == v80)
        {
          if (self->_centersItemsInExcessSpace && v32 < v23)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke;
            aBlock[3] = &__block_descriptor_40_e42_v16__0__UICollectionViewLayoutAttributes_8l;
            *(double *)&aBlock[4] = (v23 - (v85 + v32)) * 0.5;
            v70 = _Block_copy(aBlock);
            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_2;
            v90[3] = &unk_1E5F63418;
            id v71 = v70;
            id v91 = v71;
            [v14 enumerateKeysAndObjectsUsingBlock:v90];
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_3;
            v88[3] = &unk_1E5F63418;
            id v72 = v71;
            id v89 = v72;
            [v82 enumerateKeysAndObjectsUsingBlock:v88];
            v86[0] = MEMORY[0x1E4F143A8];
            v86[1] = 3221225472;
            v86[2] = __39__GKCollectionGridLayout_prepareLayout__block_invoke_4;
            v86[3] = &unk_1E5F63418;
            id v87 = v72;
            id v73 = v72;
            [v81 enumerateKeysAndObjectsUsingBlock:v86];
          }
          goto LABEL_52;
        }
      }
      v83 = v34;
      uint64_t v50 = 0;
      double v51 = v23;
      double v52 = v85;
      while (1)
      {
        v53 = [MEMORY[0x1E4F28D58] indexPathForItem:v50 inSection:v31];
        uint64_t v54 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v53];

        v35 = (void *)v54;
        if (!v54)
        {
          v35 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v53];
        }
        [(GKCollectionFocusingLayout *)self sizeForItemAtIndexPath:v53];
        if (v55 == 0.0) {
          break;
        }
        double v57 = v55;
        if (v55 > v23) {
          goto LABEL_32;
        }
LABEL_33:
        double v58 = v49 + v56;
        double v59 = -0.0;
        if (v57 > v51) {
          double v59 = v49 + v56;
        }
        double v47 = v47 + v59;
        if (v57 > v51) {
          double v52 = v85;
        }
        objc_msgSend(v35, "setFrame:", v52, v47, v57);
        [v14 setObject:v35 forKeyedSubscript:v53];
        double v60 = v57 + v52;
        double v52 = v45 + v60;
        double v51 = v85 + v23 - (v45 + v60);

        if (v33 == ++v50)
        {
          double v32 = v60 - v85;
          v34 = v83;
          goto LABEL_40;
        }
      }
      double v57 = v84;
      if (self->_autoWidthColumns) {
        goto LABEL_33;
      }
      double v57 = v51;
      if (v51 > 0.0) {
        goto LABEL_33;
      }
LABEL_32:
      double v57 = v23;
      goto LABEL_33;
    }
LABEL_52:
    [(GKCollectionGridLayout *)self setHeaderAttributes:v82];
    [(GKCollectionGridLayout *)self setFooterAttributes:v81];
    [(GKCollectionGridLayout *)self setItemAttributes:v14];
  }
}

void __39__GKCollectionGridLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 frame];
  [v4 setFrame:*(double *)(a1 + 32) + v3];
}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__GKCollectionGridLayout_prepareLayout__block_invoke_4(uint64_t a1)
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
  double v9 = [(GKCollectionGridLayout *)self sectionsThatShowHeaderWhenEmpty];
  if (v9)
  {
    double v10 = [(GKCollectionGridLayout *)self sectionsThatShowHeaderWhenEmpty];
    double v11 = (void *)[v10 mutableCopy];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  }

  double v12 = [(GKCollectionGridLayout *)self sectionsThatShowFootersWhenEmpty];
  if (v12)
  {
    uint64_t v13 = [(GKCollectionGridLayout *)self sectionsThatShowFootersWhenEmpty];
    v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  }

  itemAttributes = self->_itemAttributes;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke;
  v41[3] = &unk_1E5F63440;
  CGFloat v45 = x;
  CGFloat v46 = y;
  CGFloat v47 = width;
  CGFloat v48 = height;
  v41[4] = self;
  id v16 = v8;
  id v42 = v16;
  id v17 = v11;
  id v43 = v17;
  id v18 = v14;
  id v44 = v18;
  [(NSDictionary *)itemAttributes enumerateKeysAndObjectsUsingBlock:v41];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v39[3] = &unk_1E5F63468;
  v39[4] = self;
  id v19 = v16;
  id v40 = v19;
  [v17 enumerateIndexesUsingBlock:v39];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_3;
  double v36 = &unk_1E5F63468;
  double v37 = self;
  id v20 = v19;
  id v38 = v20;
  [v18 enumerateIndexesUsingBlock:&v33];
  uint64_t v21 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
  if (v21)
  {
    double v22 = (void *)v21;
    double v23 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
    [v23 frame];
    v50.origin.CGFloat x = v24;
    v50.origin.CGFloat y = v25;
    v50.size.CGFloat width = v26;
    v50.size.CGFloat height = v27;
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    BOOL v28 = CGRectIntersectsRect(v49, v50);

    if (v28)
    {
      double v29 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      [v20 addObject:v29];
    }
  }
  v30 = v38;
  id v31 = v20;

  return v31;
}

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [v5 frame];
  v13.origin.CGFloat x = v6;
  v13.origin.CGFloat y = v7;
  v13.size.CGFloat width = v8;
  v13.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 64), v13))
  {
    uint64_t v10 = [*(id *)(a1 + 32) focusAdjustedAttributesForItemAttributes:v5];

    [*(id *)(a1 + 40) addObject:v10];
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v11, "section"));
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v11, "section"));
    id v5 = (id)v10;
  }
}

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2)
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

void __60__GKCollectionGridLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a2];
  double v3 = objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", *MEMORY[0x1E4FB2760]);
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
  if ([v6 isEqualToString:@"GKCollectionLayoutTopHeaderKind"])
  {
    uint64_t v8 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
  }
  else
  {
    if (![v6 isEqualToString:*MEMORY[0x1E4FB2770]])
    {
      id v11 = [(GKCollectionGridLayout *)self footerAttributes];
      CGFloat v9 = [v11 objectForKeyedSubscript:v7];

      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
    uint64_t v8 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v7];
  }
  CGFloat v9 = (void *)v8;
  if (v8)
  {
LABEL_6:
    uint64_t v10 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForSupplementaryViewAttributes:v9];

    goto LABEL_9;
  }
LABEL_8:
  uint64_t v10 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
  [v10 setAlpha:0.0];
LABEL_9:

  return v10;
}

- (CGSize)collectionViewContentSize
{
  if (![(NSDictionary *)self->_itemAttributes count]) {
    [(GKCollectionGridLayout *)self prepareLayout];
  }
  double MaxY = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  int64_t v4 = [(GKCollectionGridLayout *)self lastValidSection];
  double v40 = MaxY;
  if ((v4 & 0x8000000000000000) == 0)
  {
    int64_t v5 = v4;
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v4];
    id v7 = [(NSDictionary *)self->_footerAttributes objectForKeyedSubscript:v6];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 frame];
      double MaxY = CGRectGetMaxY(v42);
    }
    else
    {
      CGFloat v9 = [(GKCollectionGridLayout *)self collectionView];
      uint64_t v10 = [v9 numberOfItemsInSection:v5];

      id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 - 1 inSection:v5];
      double v12 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v11];
      [v12 frame];
      double MaxY = CGRectGetMaxY(v43);
    }
  }
  CGRect v13 = [(GKCollectionGridLayout *)self collectionView];
  uint64_t v14 = [v13 numberOfSections];

  [(GKCollectionFocusingLayout *)self sectionInset];
  double v16 = v15;
  [(GKCollectionFocusingLayout *)self sectionInset];
  double v18 = v17;
  [(GKCollectionFocusingLayout *)self topHeaderHeight];
  double v20 = v19;
  uint64_t v21 = [(GKCollectionGridLayout *)self collectionView];
  [v21 bounds];
  double v23 = v22;

  CGFloat v24 = [(GKCollectionGridLayout *)self collectionView];
  [v24 adjustedContentInset];
  double v26 = v25;
  double v28 = v27;

  double v29 = [(GKCollectionGridLayout *)self collectionView];
  [v29 bounds];
  double v31 = v30;

  if (self->_sectionInsetRelativeWithContentInset)
  {
    double v32 = [(GKCollectionGridLayout *)self collectionView];
    [v32 contentInset];
    double v34 = v31 - v33;
    v35 = [(GKCollectionGridLayout *)self collectionView];
    [v35 contentInset];
    double v31 = v34 - v36;
  }
  double v37 = v23 - (v26 + v28);
  double v38 = v20 + MaxY + v16 * (double)v14 + v18 * (double)v14;
  if (v40 >= v37) {
    double v37 = v40;
  }
  if (v38 < v37) {
    double v38 = v37;
  }
  double v39 = v31;
  result.CGFloat height = v38;
  result.CGFloat width = v39;
  return result;
}

- (int64_t)lastValidSection
{
  double v3 = [(GKCollectionGridLayout *)self collectionView];
  int64_t v4 = [v3 numberOfSections];

  while (v4-- >= 1)
  {
    id v6 = [(GKCollectionGridLayout *)self collectionView];
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

- (BOOL)sectionInsetRelativeWithContentInset
{
  return self->_sectionInsetRelativeWithContentInset;
}

- (void)setSectionInsetRelativeWithContentInset:(BOOL)a3
{
  self->_sectionInsetRelativeWithContentInset = a3;
}

- (int64_t)autoWidthColumns
{
  return self->_autoWidthColumns;
}

- (double)extraSectionHeaderToCellSpace
{
  return self->_extraSectionHeaderToCellSpace;
}

- (void)setExtraSectionHeaderToCellSpace:(double)a3
{
  self->_double extraSectionHeaderToCellSpace = a3;
}

- (NSIndexSet)sectionsThatShowHeaderWhenEmpty
{
  return self->_sectionsThatShowHeaderWhenEmpty;
}

- (void)setSectionsThatShowHeaderWhenEmpty:(id)a3
{
}

- (NSIndexSet)sectionsThatShowFootersWhenEmpty
{
  return self->_sectionsThatShowFootersWhenEmpty;
}

- (void)setSectionsThatShowFootersWhenEmpty:(id)a3
{
}

- (BOOL)shouldPerformInitialScrollToContentInsetTop
{
  return self->_shouldPerformInitialScrollToContentInsetTop;
}

- (void)setShouldPerformInitialScrollToContentInsetTop:(BOOL)a3
{
  self->_shouldPerformInitialScrollToContentInsetTop = a3;
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

- (NSDictionary)footerAttributes
{
  return self->_footerAttributes;
}

- (void)setFooterAttributes:(id)a3
{
}

- (BOOL)didPerformInitialContentInsetScroll
{
  return self->_didPerformInitialContentInsetScroll;
}

- (void)setDidPerformInitialContentInsetScroll:(BOOL)a3
{
  self->_didPerformInitialContentInsetScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_headerAttributes, 0);
  objc_storeStrong((id *)&self->_itemAttributes, 0);
  objc_storeStrong((id *)&self->_sectionsThatShowFootersWhenEmpty, 0);

  objc_storeStrong((id *)&self->_sectionsThatShowHeaderWhenEmpty, 0);
}

@end