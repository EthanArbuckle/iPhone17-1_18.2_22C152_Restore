@interface CNContactGridViewLayout
- (BOOL)needsUpdateLayout;
- (NSIndexPath)selectedIndexPath;
- (double)offsetAfter;
- (double)offsetBefore;
- (double)selectedItemWidthOffset;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)numberOfColumns;
- (void)_updateLayoutMetrics;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)setNeedsUpdateLayout:(BOOL)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setOffsetAfter:(double)a3;
- (void)setOffsetBefore:(double)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedItemWidthOffset:(double)a3;
@end

@implementation CNContactGridViewLayout

- (void).cxx_destruct
{
}

- (void)setSelectedItemWidthOffset:(double)a3
{
  self->_selectedItemWidthOffset = a3;
}

- (double)selectedItemWidthOffset
{
  return self->_selectedItemWidthOffset;
}

- (void)setOffsetAfter:(double)a3
{
  self->_offsetAfter = a3;
}

- (double)offsetAfter
{
  return self->_offsetAfter;
}

- (void)setOffsetBefore:(double)a3
{
  self->_offsetBefore = a3;
}

- (double)offsetBefore
{
  return self->_offsetBefore;
}

- (void)setNeedsUpdateLayout:(BOOL)a3
{
  self->_needsUpdateLayout = a3;
}

- (BOOL)needsUpdateLayout
{
  return self->_needsUpdateLayout;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CNContactGridViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  v13[3] = &unk_1E5499E28;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = _Block_copy(v13);
  v11 = _Block_copy(v10);

  return v11;
}

void __77__CNContactGridViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  [v3 frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v4[2](v4, 1);
}

- (void)setSelectedIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    [(CNContactGridViewLayout *)self setNeedsUpdateLayout:1];
    v5 = v6;
  }
}

- (void)_updateLayoutMetrics
{
  v3 = [(CNContactGridViewLayout *)self collectionView];
  int v4 = [v3 _shouldReverseLayoutDirection];

  if (v4) {
    double v5 = -1.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = [(CNContactGridViewLayout *)self numberOfColumns];
  NSInteger v7 = [(NSIndexPath *)self->_selectedIndexPath item] % v6;
  id v8 = [(CNContactGridViewLayout *)self collectionView];
  [v8 frame];
  double Width = CGRectGetWidth(v98);

  [(UICollectionViewFlowLayout *)self itemSize];
  NSInteger v11 = v6 - 1;
  double v12 = (Width - (double)v6 * v10) / (double)(v6 - 1);
  [(UICollectionViewFlowLayout *)self itemSize];
  double v14 = v13;
  selectedIndexPath = self->_selectedIndexPath;
  v97.receiver = self;
  v97.super_class = (Class)CNContactGridViewLayout;
  v16 = [(UICollectionViewFlowLayout *)&v97 layoutAttributesForItemAtIndexPath:selectedIndexPath];
  [v16 frame];
  CGFloat v21 = v17;
  CGFloat v22 = v18;
  CGFloat v23 = v19;
  CGFloat v24 = v20;
  double v94 = Width;
  double v96 = v14;
  if (v7 >= v11)
  {
    double v25 = 0.0;
    if ((v4 & 1) == 0)
    {
      v26 = [(CNContactGridViewLayout *)self collectionView];
      [v26 frame];
      double v25 = CGRectGetWidth(v99);
    }
  }
  else if (v4)
  {
    double v25 = CGRectGetMinX(*(CGRect *)&v17) - v12;
  }
  else
  {
    double v25 = v12 + CGRectGetMaxX(*(CGRect *)&v17);
  }
  v27 = [(CNContactGridViewLayout *)self collectionView];
  v28 = [v27 cellForItemAtIndexPath:self->_selectedIndexPath];

  [v28 maximumActionsWidth];
  double v30 = v29;
  [(id)objc_opt_class() actionsLeftMargin];
  [(CNContactGridViewLayout *)self setSelectedItemWidthOffset:v30 + v31];
  [(CNContactGridViewLayout *)self selectedItemWidthOffset];
  double v33 = v32;
  CGFloat v34 = v21;
  CGFloat v35 = v22;
  CGFloat v36 = v23;
  CGFloat v37 = v24;
  if (v4) {
    double v38 = CGRectGetMinX(*(CGRect *)&v34) - v25;
  }
  else {
    double v38 = v25 - CGRectGetMaxX(*(CGRect *)&v34);
  }
  double v39 = v33 - v38;
  if (v39 <= 0.0)
  {
    double v66 = 0.0;
    [(CNContactGridViewLayout *)self setOffsetBefore:0.0];
LABEL_32:
    [(CNContactGridViewLayout *)self setOffsetAfter:v66];
    goto LABEL_33;
  }
  double v40 = v96 + v12;
  [(CNContactGridViewLayout *)self setOffsetBefore:-(v5 * v39) * 0.5];
  [(CNContactGridViewLayout *)self setOffsetAfter:v5 * v39 * 0.5];
  CGFloat v41 = v21;
  CGFloat v42 = v22;
  CGFloat v43 = v23;
  CGFloat v44 = v24;
  if (v4)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v41);
    [(CNContactGridViewLayout *)self offsetBefore];
    double v47 = MinX + v46;
    [(CNContactGridViewLayout *)self selectedItemWidthOffset];
    double v49 = v47 - v48;
    if (v49 < 0.0)
    {
      [(CNContactGridViewLayout *)self offsetBefore];
      [(CNContactGridViewLayout *)self setOffsetBefore:v50 - v49];
      [(CNContactGridViewLayout *)self offsetAfter];
      [(CNContactGridViewLayout *)self setOffsetAfter:v51 - v49];
    }
    v100.origin.x = v21;
    v100.origin.y = v22;
    v100.size.width = v23;
    v100.size.height = v24;
    double MaxX = CGRectGetMaxX(v100);
    [(CNContactGridViewLayout *)self offsetBefore];
    double v54 = MaxX + v53 - v95;
    if (v54 > 0.0)
    {
      [(CNContactGridViewLayout *)self offsetBefore];
      [(CNContactGridViewLayout *)self setOffsetBefore:v55 - v54];
      [(CNContactGridViewLayout *)self offsetAfter];
      [(CNContactGridViewLayout *)self setOffsetAfter:v56 - v54];
    }
    v101.origin.x = v21;
    v101.origin.y = v22;
    v101.size.width = v23;
    v101.size.height = v24;
    double v57 = CGRectGetMaxX(v101);
    [(CNContactGridViewLayout *)self offsetBefore];
    double v59 = v57 + v58 - v95 - ceil((v57 + v58 - v95) / v40) * v40;
    [(CNContactGridViewLayout *)self offsetBefore];
    [(CNContactGridViewLayout *)self setOffsetBefore:v60 - v59];
    [(CNContactGridViewLayout *)self offsetAfter];
    [(CNContactGridViewLayout *)self setOffsetAfter:v61 - v59];
    v102.origin.x = v21;
    v102.origin.y = v22;
    v102.size.width = v23;
    v102.size.height = v24;
    CGFloat v62 = CGRectGetMinX(v102) - v40;
    [(CNContactGridViewLayout *)self offsetAfter];
    double v64 = v62 + v63;
    if (v64 <= 0.0)
    {
      [(UICollectionViewFlowLayout *)self itemSize];
      double v65 = v64 + v88;
    }
    else
    {
      double v65 = v64 - floor(v64 / v40) * v40;
    }
    [(CNContactGridViewLayout *)self offsetAfter];
    double v66 = v89 - v65;
    goto LABEL_32;
  }
  double v67 = CGRectGetMaxX(*(CGRect *)&v41);
  [(CNContactGridViewLayout *)self offsetBefore];
  double v69 = v67 + v68;
  [(CNContactGridViewLayout *)self selectedItemWidthOffset];
  double v71 = v69 + v70 - v95;
  if (v71 > 0.0)
  {
    [(CNContactGridViewLayout *)self offsetBefore];
    [(CNContactGridViewLayout *)self setOffsetBefore:v72 - v71];
    [(CNContactGridViewLayout *)self offsetAfter];
    [(CNContactGridViewLayout *)self setOffsetAfter:v73 - v71];
  }
  v103.origin.x = v21;
  v103.origin.y = v22;
  v103.size.width = v23;
  v103.size.height = v24;
  double v74 = CGRectGetMinX(v103);
  [(CNContactGridViewLayout *)self offsetBefore];
  double v76 = v74 + v75;
  if (v74 + v75 < 0.0)
  {
    [(CNContactGridViewLayout *)self offsetBefore];
    [(CNContactGridViewLayout *)self setOffsetBefore:v77 - v76];
    [(CNContactGridViewLayout *)self offsetAfter];
    [(CNContactGridViewLayout *)self setOffsetAfter:v78 - v76];
  }
  v104.origin.x = v21;
  v104.origin.y = v22;
  v104.size.width = v23;
  v104.size.height = v24;
  double v79 = CGRectGetMinX(v104);
  [(CNContactGridViewLayout *)self offsetBefore];
  double v81 = v79 + v80 - floor((v79 + v80) / v40) * v40;
  [(CNContactGridViewLayout *)self offsetBefore];
  [(CNContactGridViewLayout *)self setOffsetBefore:v82 - v81];
  [(CNContactGridViewLayout *)self offsetAfter];
  [(CNContactGridViewLayout *)self setOffsetAfter:v83 - v81];
  v105.origin.x = v21;
  v105.origin.y = v22;
  v105.size.width = v23;
  v105.size.height = v24;
  double v84 = v40 + CGRectGetMaxX(v105);
  [(CNContactGridViewLayout *)self offsetAfter];
  double v86 = v95 - (v84 + v85);
  if (v86 > 0.0)
  {
    [(CNContactGridViewLayout *)self offsetAfter];
    double v66 = v86 - floor(v86 / v40) * v40 + v87;
    goto LABEL_32;
  }
  [(UICollectionViewFlowLayout *)self itemSize];
  if (v90 > -v86)
  {
    [(UICollectionViewFlowLayout *)self itemSize];
    double v92 = v86 + v91;
    [(CNContactGridViewLayout *)self offsetAfter];
    double v66 = v93 + v92;
    goto LABEL_32;
  }
LABEL_33:
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CNContactGridViewLayout;
  double v5 = [(UICollectionViewFlowLayout *)&v34 layoutAttributesForItemAtIndexPath:v4];
  uint64_t v6 = (void *)[v5 copy];

  if (self->_selectedIndexPath)
  {
    double v33 = v6;
    if ([(CNContactGridViewLayout *)self needsUpdateLayout])
    {
      [(CNContactGridViewLayout *)self _updateLayoutMetrics];
      [(CNContactGridViewLayout *)self setNeedsUpdateLayout:0];
    }
    NSInteger v7 = [(NSIndexPath *)self->_selectedIndexPath section];
    uint64_t v8 = [v4 section];
    uint64_t v9 = [(CNContactGridViewLayout *)self numberOfColumns];
    uint64_t v10 = [(NSIndexPath *)self->_selectedIndexPath item];
    uint64_t v11 = [v4 item];
    NSInteger v12 = [(NSIndexPath *)self->_selectedIndexPath item];
    uint64_t v13 = [v4 item];
    double v14 = [(CNContactGridViewLayout *)self collectionView];
    int v32 = [v14 _shouldReverseLayoutDirection];

    BOOL v15 = v8 == v7;
    uint64_t v6 = v33;
    if (v15 && v13 / v9 == v12 / v9)
    {
      uint64_t v16 = v10 % v9;
      uint64_t v17 = v11 % v9;
      [v33 frame];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      if (v17 == v16)
      {
        [(CNContactGridViewLayout *)self offsetBefore];
        double v27 = v19 + v26;
        if (v32)
        {
          [(CNContactGridViewLayout *)self selectedItemWidthOffset];
          double v27 = v27 - v28;
        }
        [(CNContactGridViewLayout *)self selectedItemWidthOffset];
        double v23 = v23 + v29;
      }
      else
      {
        if (v17 < v16) {
          [(CNContactGridViewLayout *)self offsetBefore];
        }
        else {
          [(CNContactGridViewLayout *)self offsetAfter];
        }
        double v27 = v19 + v30;
      }
      objc_msgSend(v33, "setFrame:", v27, v21, v23, v25);
    }
  }

  return v6;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CNContactGridViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v28, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = v4;
  uint64_t v6 = v4;
  if (self->_selectedIndexPath)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v23 = [(CNContactGridViewLayout *)self numberOfColumns];
    NSInteger v7 = [(NSIndexPath *)self->_selectedIndexPath section];
    double v22 = self;
    NSInteger v8 = [(NSIndexPath *)self->_selectedIndexPath item];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v21 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      uint64_t v13 = v8 / v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = [v15 indexPath];
          uint64_t v17 = [v16 section];
          uint64_t v18 = [v16 item];
          if (v17 == v7 && v18 / v23 == v13)
          {
            uint64_t v19 = [(CNContactGridViewLayout *)v22 layoutAttributesForItemAtIndexPath:v16];

            id v15 = (id)v19;
          }
          [v6 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    double v5 = v21;
  }

  return v6;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactGridViewLayout;
  [(CNContactGridViewLayout *)&v3 prepareForCollectionViewUpdates:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(UICollectionViewFlowLayout *)self sectionInset];
  objc_msgSend(v4, "setSectionInset:");
  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
  objc_msgSend(v4, "setMinimumLineSpacing:");
  [(UICollectionViewFlowLayout *)self itemSize];
  objc_msgSend(v4, "setItemSize:");
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  objc_msgSend(v4, "setMinimumInteritemSpacing:");
  objc_msgSend(v4, "setNumberOfColumns:", -[CNContactGridViewLayout numberOfColumns](self, "numberOfColumns"));
  return v4;
}

@end