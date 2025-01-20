@interface GKCollectionColumnLayout
- (CGSize)collectionViewContentSize;
- (NSDictionary)decorationAttributes;
- (NSDictionary)footerAttributes;
- (NSDictionary)headerAttributes;
- (NSDictionary)itemAttributes;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)applyDefaults;
- (void)prepareLayout;
- (void)setDecorationAttributes:(id)a3;
- (void)setFooterAttributes:(id)a3;
- (void)setHeaderAttributes:(id)a3;
- (void)setItemAttributes:(id)a3;
@end

@implementation GKCollectionColumnLayout

- (void)applyDefaults
{
  [(UICollectionViewFlowLayout *)self setScrollDirection:0];
  -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 8.0, 0.0, 0.0, 0.0);
  [(UICollectionViewFlowLayout *)self setMinimumInteritemSpacing:16.0];
  [(UICollectionViewFlowLayout *)self setMinimumLineSpacing:8.0];
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", 144.0, 70.0);
  -[UICollectionViewFlowLayout setHeaderReferenceSize:](self, "setHeaderReferenceSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(GKCollectionFocusingLayout *)self setFocusScaleFactor:1.0];
  [(GKCollectionFocusingLayout *)self setFocusHeaderOffset:0.0];

  [(GKCollectionFocusingLayout *)self setHeaderToItemSpacing:8.0];
}

- (void)prepareLayout
{
  v3 = [(GKCollectionColumnLayout *)self collectionView];
  [v3 bounds];
  if (v4 != 0.0)
  {
    double v5 = v4;
    v80.receiver = self;
    v80.super_class = (Class)GKCollectionColumnLayout;
    [(GKCollectionFocusingLayout *)&v80 prepareLayout];
    uint64_t v6 = [v3 numberOfSections];
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v78 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    v72 = [MEMORY[0x1E4F1CA60] dictionary];
    v77 = [MEMORY[0x1E4F1CA60] dictionary];
    [(GKCollectionFocusingLayout *)self sectionInset];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = 0.0;
    double v15 = 0.0;
    uint64_t v16 = v6 - 1;
    if (v6 > 1)
    {
      uint64_t v17 = 0;
      do
      {
        [(GKCollectionFocusingLayout *)self minimumInteritemSpacingForSectionAtIndex:v17];
        double v15 = v15 + v18;
        ++v17;
      }
      while (v16 != v17);
    }
    double v19 = v5 - v11 - v13;
    double v20 = (v19 - v15) / (double)v6;
    double v21 = 0.0;
    if (v6 >= 1)
    {
      uint64_t v22 = 0;
      double v14 = 0.0;
      do
      {
        uint64_t v23 = [v3 numberOfItemsInSection:v22];
        if (v23 >= 1)
        {
          uint64_t v24 = v23;
          for (uint64_t i = 0; i != v24; ++i)
          {
            v26 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v22];
            [(GKCollectionFocusingLayout *)self sizeForItemAtIndexPath:v26];
            if (v27 == 0.0) {
              double v27 = v20;
            }
            if (v14 < v27) {
              double v14 = v27;
            }
          }
        }
        [(GKCollectionFocusingLayout *)self sizeForHeaderInSection:v22];
        if (v14 < v28) {
          double v14 = v28;
        }
        if (v22 < v16)
        {
          [(GKCollectionFocusingLayout *)self minimumInteritemSpacingForSectionAtIndex:v22];
          double v21 = v21 + v29;
        }
        ++v22;
      }
      while (v22 != v6);
    }
    if (v20 >= v14) {
      double v30 = v14;
    }
    else {
      double v30 = v20;
    }
    if (v14 > 0.0) {
      double v20 = v30;
    }
    double v31 = v19 - (v21 + v20 * (double)v6);
    if (v31 <= 0.0) {
      double v32 = -0.0;
    }
    else {
      double v32 = v31 * 0.5;
    }
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    double v34 = v33;
    [(GKCollectionFocusingLayout *)self topHeaderHeight];
    if (v35 > 0.0)
    {
      v36 = (void *)MEMORY[0x1E4FB15E0];
      v37 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      v38 = [v36 layoutAttributesForSupplementaryViewOfKind:@"GKCollectionLayoutTopHeaderKind" withIndexPath:v37];
      [(GKCollectionFocusingLayout *)self setTopHeaderAttributes:v38];

      [(GKCollectionFocusingLayout *)self topHeaderHeight];
      double v40 = v39;
      v41 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      objc_msgSend(v41, "setFrame:", 0.0, 0.0, v5, v40);
    }
    if (v6 >= 1)
    {
      uint64_t v42 = 0;
      double v43 = v11 + v32;
      double v44 = v9 + v34;
      uint64_t v73 = *MEMORY[0x1E4FB2760];
      uint64_t v74 = *MEMORY[0x1E4FB2770];
      uint64_t v75 = v6;
      v76 = v3;
      do
      {
        uint64_t v45 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v42];
        v46 = [(NSDictionary *)self->_headerAttributes objectForKeyedSubscript:v45];
        if (!v46)
        {
          v46 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v74 withIndexPath:v45];
          [v46 setZIndex:1024];
        }
        [(GKCollectionFocusingLayout *)self sizeForHeaderInSection:v42];
        if (v48 > 0.0 && v47 == 0.0) {
          double v50 = v20;
        }
        else {
          double v50 = v47;
        }
        objc_msgSend(v46, "setFrame:", v43, v44, v50, v48);
        [v78 setObject:v46 forKeyedSubscript:v45];
        [v46 frame];
        double v52 = v44 + v51;
        [(GKCollectionFocusingLayout *)self headerToItemSpacing];
        double v54 = v53 + v52;
        uint64_t v55 = [v3 numberOfItemsInSection:v42];
        v79 = (void *)v45;
        if (v55 < 1)
        {
          v59 = v46;
        }
        else
        {
          uint64_t v56 = v55;
          for (uint64_t j = 0; j != v56; ++j)
          {
            v58 = [MEMORY[0x1E4F28D58] indexPathForItem:j inSection:v42];
            v59 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v58];

            if (!v59)
            {
              v59 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v58];
            }
            [(GKCollectionFocusingLayout *)self sizeForItemAtIndexPath:v58];
            double v62 = v61;
            if (v60 == 0.0) {
              double v63 = v20;
            }
            else {
              double v63 = v60;
            }
            objc_msgSend(v59, "setFrame:", v43, v54, v63, v61);
            [v7 setObject:v59 forKeyedSubscript:v58];
            [(GKCollectionFocusingLayout *)self minimumLineSpacingForSectionAtIndex:v42];
            double v54 = v54 + v62 + v64;

            v46 = v59;
          }
        }
        v65 = [(GKCollectionColumnLayout *)self footerAttributes];
        v66 = [v65 objectForKeyedSubscript:v79];

        if (!v66)
        {
          v66 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v73 withIndexPath:v79];
          [v66 setZIndex:1024];
        }
        [(GKCollectionFocusingLayout *)self sizeForFooterInSection:v42];
        if (v68 > 0.0 && v67 == 0.0) {
          double v70 = v20;
        }
        else {
          double v70 = v67;
        }
        objc_msgSend(v66, "setFrame:", v43 + 12.0, v54, v70, v68);
        [v77 setObject:v66 forKeyedSubscript:v79];
        [(GKCollectionFocusingLayout *)self minimumInteritemSpacingForSectionAtIndex:v42];
        double v43 = v43 + v20 + v71;

        ++v42;
        v3 = v76;
      }
      while (v42 != v75);
    }
    [(GKCollectionColumnLayout *)self setHeaderAttributes:v78];
    [(GKCollectionColumnLayout *)self setItemAttributes:v7];
    [(GKCollectionColumnLayout *)self setDecorationAttributes:v72];
    [(GKCollectionColumnLayout *)self setFooterAttributes:v77];
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSDictionary count](self->_itemAttributes, "count") + 1);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0x7FEFFFFFFFFFFFFFLL;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0x10000000000000;
  itemAttributes = self->_itemAttributes;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke;
  v42[3] = &unk_1E5F64510;
  v42[4] = self;
  double v44 = v51;
  uint64_t v45 = v50;
  CGFloat v46 = x;
  CGFloat v47 = y;
  CGFloat v48 = width;
  CGFloat v49 = height;
  id v10 = v8;
  id v43 = v10;
  [(NSDictionary *)itemAttributes enumerateKeysAndObjectsUsingBlock:v42];
  headerAttributes = self->_headerAttributes;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v36[3] = &unk_1E5F64538;
  CGFloat v38 = x;
  CGFloat v39 = y;
  CGFloat v40 = width;
  CGFloat v41 = height;
  v36[4] = self;
  id v12 = v10;
  id v37 = v12;
  [(NSDictionary *)headerAttributes enumerateKeysAndObjectsUsingBlock:v36];
  footerAttributes = self->_footerAttributes;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  double v28 = __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_3;
  double v29 = &unk_1E5F64538;
  CGFloat v32 = x;
  CGFloat v33 = y;
  CGFloat v34 = width;
  CGFloat v35 = height;
  double v30 = self;
  id v14 = v12;
  id v31 = v14;
  [(NSDictionary *)footerAttributes enumerateKeysAndObjectsUsingBlock:&v26];
  double v15 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
  if (v15)
  {
    uint64_t v16 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
    [v16 frame];
    v54.origin.CGFloat x = v17;
    v54.origin.CGFloat y = v18;
    v54.size.CGFloat width = v19;
    v54.size.CGFloat height = v20;
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    BOOL v21 = CGRectIntersectsRect(v53, v54);

    if (v21)
    {
      uint64_t v22 = [(GKCollectionFocusingLayout *)self topHeaderAttributes];
      [v14 addObject:v22];
    }
  }
  uint64_t v23 = v31;
  id v24 = v14;

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v51, 8);

  return v24;
}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "focusAdjustedAttributesForItemAttributes:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 frame];
  double MinY = CGRectGetMinY(v12);
  [v10 frame];
  double MaxY = CGRectGetMaxY(v13);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (MinY < *(double *)(v4 + 24)) {
    *(double *)(v4 + 24) = MinY;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (MaxY > *(double *)(v5 + 24)) {
    *(double *)(v5 + 24) = MaxY;
  }
  [v10 frame];
  v14.origin.CGFloat x = v6;
  v14.origin.CGFloat y = v7;
  v14.size.CGFloat width = v8;
  v14.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 64), v14)) {
    [*(id *)(a1 + 40) addObject:v10];
  }
}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  [v13 frame];
  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v5;
  v15.size.CGFloat width = v6;
  v15.size.CGFloat height = v7;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v15)
    || (([v13 frame], v9 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v10 = v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v10 = 0),
        v10))
  {
    CGRect v12 = v13;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) focusAdjustedAttributesForSupplementaryViewAttributes:v13];

    [*(id *)(a1 + 40) addObject:v11];
    CGRect v12 = (void *)v11;
  }
}

void __62__GKCollectionColumnLayout_layoutAttributesForElementsInRect___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  [v13 frame];
  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v5;
  v15.size.CGFloat width = v6;
  v15.size.CGFloat height = v7;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v15)
    || (([v13 frame], v9 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v10 = v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v10 = 0),
        v10))
  {
    CGRect v12 = v13;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) focusAdjustedAttributesForSupplementaryViewAttributes:v13];

    [*(id *)(a1 + 40) addObject:v11];
    CGRect v12 = (void *)v11;
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v4];
  if (v5)
  {
    CGFloat v6 = (void *)v5;
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
    if ([v6 isEqualToString:*MEMORY[0x1E4FB2770]]) {
      uint64_t v9 = 608;
    }
    else {
      uint64_t v9 = 624;
    }
    uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.isa + v9) objectForKeyedSubscript:v7];
  }
  BOOL v10 = (void *)v8;
  if (v8)
  {
    uint64_t v11 = [(GKCollectionFocusingLayout *)self focusAdjustedAttributesForSupplementaryViewAttributes:v8];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
    [v11 setAlpha:0.0];
  }

  return v11;
}

- (CGSize)collectionViewContentSize
{
  if (![(NSDictionary *)self->_itemAttributes count]) {
    [(GKCollectionColumnLayout *)self prepareLayout];
  }
  uint64_t v27 = 0;
  double v28 = (double *)&v27;
  uint64_t v29 = 0x3010000000;
  double v30 = &unk_1AF895502;
  long long v31 = *MEMORY[0x1E4F1DB30];
  v3 = [(GKCollectionColumnLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(GKCollectionColumnLayout *)self collectionView];
      uint64_t v7 = [v6 numberOfItemsInSection:i];

      if (v7 >= 1)
      {
        uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 - 1 inSection:i];
        uint64_t v9 = [(NSDictionary *)self->_itemAttributes objectForKeyedSubscript:v8];
        double v10 = v28[5];
        [v9 frame];
        double MaxY = CGRectGetMaxY(v33);
        if (v10 >= MaxY) {
          double MaxY = v10;
        }
        v28[5] = MaxY;
      }
    }
  }
  CGRect v12 = [(GKCollectionColumnLayout *)self footerAttributes];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __53__GKCollectionColumnLayout_collectionViewContentSize__block_invoke;
  v26[3] = &unk_1E5F64560;
  v26[4] = &v27;
  [v12 enumerateKeysAndObjectsUsingBlock:v26];

  [(GKCollectionFocusingLayout *)self sectionInset];
  v28[5] = v13 + v28[5];
  [(GKCollectionFocusingLayout *)self topHeaderHeight];
  double v15 = v14 + v28[5];
  v28[5] = v15;
  uint64_t v16 = [(GKCollectionColumnLayout *)self collectionView];
  [v16 bounds];
  double v18 = v17;

  if (v15 >= v18) {
    double v19 = v15;
  }
  else {
    double v19 = v18;
  }
  v28[5] = v19;
  CGFloat v20 = [(GKCollectionColumnLayout *)self collectionView];
  [v20 bounds];
  *((void *)v28 + 4) = v21;

  double v22 = v28[4];
  double v23 = v28[5];
  _Block_object_dispose(&v27, 8);
  double v24 = v22;
  double v25 = v23;
  result.CGFloat height = v25;
  result.CGFloat width = v24;
  return result;
}

void __53__GKCollectionColumnLayout_collectionViewContentSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (([v7 isHidden] & 1) == 0)
  {
    [v7 size];
    if (v4 > 0.0)
    {
      double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      [v7 frame];
      double MaxY = CGRectGetMaxY(v9);
      if (v5 >= MaxY) {
        double MaxY = v5;
      }
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = MaxY;
    }
  }
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

- (NSDictionary)decorationAttributes
{
  return self->_decorationAttributes;
}

- (void)setDecorationAttributes:(id)a3
{
}

- (NSDictionary)footerAttributes
{
  return self->_footerAttributes;
}

- (void)setFooterAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAttributes, 0);
  objc_storeStrong((id *)&self->_decorationAttributes, 0);
  objc_storeStrong((id *)&self->_headerAttributes, 0);

  objc_storeStrong((id *)&self->_itemAttributes, 0);
}

@end