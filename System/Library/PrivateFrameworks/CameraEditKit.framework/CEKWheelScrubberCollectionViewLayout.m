@interface CEKWheelScrubberCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CEKWheelScrubberCollectionViewLayout)init;
- (CEKWheelScrubberCollectionViewLayoutDelegate)wheelScrubberDelegate;
- (CGSize)_cachedContentSize;
- (CGSize)collectionViewContentSize;
- (NSArray)_cachedLayoutAttributesCells;
- (UIEdgeInsets)contentInsets;
- (double)_circularlyWrapped:(double)a3 forCenter:(double)a4 radius:(double)a5 scale:(double)a6;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)layoutDirection;
- (int64_t)layoutOrder;
- (void)_setCachedContentSize:(CGSize)a3;
- (void)_setCachedLayoutAttributesCells:(id)a3;
- (void)prepareLayout;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLayoutOrder:(int64_t)a3;
- (void)setWheelScrubberDelegate:(id)a3;
@end

@implementation CEKWheelScrubberCollectionViewLayout

- (CEKWheelScrubberCollectionViewLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)CEKWheelScrubberCollectionViewLayout;
  v2 = [(CEKWheelScrubberCollectionViewLayout *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_layoutDirection = 0;
    v2->_layoutOrder = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    [(CEKWheelScrubberCollectionViewLayout *)self invalidateLayout];
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)prepareLayout
{
  v69.receiver = self;
  v69.super_class = (Class)CEKWheelScrubberCollectionViewLayout;
  [(CEKWheelScrubberCollectionViewLayout *)&v69 prepareLayout];
  [(CEKWheelScrubberCollectionViewLayout *)self contentInsets];
  double MaxY = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  v11 = [(CEKWheelScrubberCollectionViewLayout *)self collectionView];
  v12 = [v11 dataSource];
  int64_t v13 = [(CEKWheelScrubberCollectionViewLayout *)self layoutDirection];
  int64_t v14 = [(CEKWheelScrubberCollectionViewLayout *)self layoutOrder];
  v65 = v12;
  uint64_t v15 = [v12 collectionView:v11 numberOfItemsInSection:0];
  v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "numberOfSections") + objc_msgSend(v11, "numberOfSections") * v15 - 1);
  BOOL v62 = v13 == 0;
  uint64_t v60 = v10;
  if ([v11 numberOfSections])
  {
    unint64_t v17 = 0;
    uint64_t v63 = *MEMORY[0x1E4FB2770];
    v64 = v11;
    if (v14 == 1) {
      uint64_t v18 = -1;
    }
    else {
      uint64_t v18 = 1;
    }
    double v19 = 0.0;
    int64_t v66 = v14;
    while (1)
    {
      if (v17)
      {
        v20 = (void *)MEMORY[0x1E4FB15E0];
        v21 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v17];
        v22 = [v20 layoutAttributesForSupplementaryViewOfKind:v63 withIndexPath:v21];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
        v24 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v17];
        [WeakRetained wheelScrubberCollectionViewLayout:self sizeForItemAtIndexPath:v24];
        double v26 = v25;

        +[CEKWheelScrubberSectionDividerView dividerViewWidth];
        if (v13) {
          double v28 = v26;
        }
        else {
          double v28 = v27;
        }
        if (v13) {
          double v29 = v27;
        }
        else {
          double v29 = v26;
        }
        objc_msgSend(v22, "setFrame:", v6, MaxY, v28, v29, v60);
        [v16 addObject:v22];
        +[CEKWheelScrubberSectionDividerView dividerViewWidth];
        if (v13) {
          double v31 = v30;
        }
        else {
          double v31 = -0.0;
        }
        double v32 = MaxY + v31;
        if (v13) {
          double v30 = -0.0;
        }
        double v33 = v6 + v30;

        int64_t v14 = v66;
      }
      else
      {
        double v32 = MaxY;
        double v33 = v6;
      }
      uint64_t v34 = objc_msgSend(v65, "collectionView:numberOfItemsInSection:", v11, v17, v60);
      if (!v34) {
        break;
      }
      unint64_t v35 = v34 - 1;
      if (v14 == 1) {
        unint64_t v36 = v34 - 1;
      }
      else {
        unint64_t v36 = 0;
      }
      do
      {
        v37 = [MEMORY[0x1E4F28D58] indexPathForItem:v36 inSection:v17];
        id v38 = objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
        [v38 wheelScrubberCollectionViewLayout:self sizeForItemAtIndexPath:v37];
        double v40 = v39;
        double v42 = v41;

        double v43 = v33;
        double v44 = v32;
        double v45 = v40;
        double v46 = v42;
        if (v13)
        {
          double MaxY = CGRectGetMaxY(*(CGRect *)&v43);
          v70.origin.x = v33;
          v70.origin.y = v32;
          v70.size.width = v40;
          v70.size.height = v42;
          double MaxX = CGRectGetMaxX(v70);
          double v6 = v33;
        }
        else
        {
          double v6 = CGRectGetMaxX(*(CGRect *)&v43);
          v71.origin.x = v33;
          v71.origin.y = v32;
          v71.size.width = v40;
          v71.size.height = v42;
          double MaxX = CGRectGetMaxY(v71);
          double MaxY = v32;
        }
        if (v19 < MaxX) {
          double v19 = MaxX;
        }
        v48 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v37];
        objc_msgSend(v48, "setFrame:", v33, v32, v40, v42);
        [v16 addObject:v48];
        v36 += v18;

        double v33 = v6;
        double v32 = MaxY;
      }
      while (v36 <= v35);
      ++v17;
      v11 = v64;
      int64_t v14 = v66;
      if (v17 >= [v64 numberOfSections]) {
        goto LABEL_33;
      }
    }
  }
  else
  {
    double v19 = 0.0;
LABEL_33:
    objc_msgSend(v11, "bounds", v60);
    double v53 = v51;
    double v54 = v52;
    if (v13)
    {
      CGFloat MidY = CGRectGetMidY(*(CGRect *)&v49);
      double v6 = v19;
      double v19 = MaxY;
      double v53 = v54;
    }
    else
    {
      CGFloat MidY = CGRectGetMidX(*(CGRect *)&v49);
    }
    double v56 = v8 + v19;
    v57 = [v11 traitCollection];
    [v57 displayScale];
    uint64_t v59 = v58;

    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __53__CEKWheelScrubberCollectionViewLayout_prepareLayout__block_invoke;
    v67[3] = &unk_1E63CD9F8;
    BOOL v68 = v62;
    v67[4] = self;
    *(CGFloat *)&v67[5] = MidY;
    *(double *)&v67[6] = v53 * 0.5;
    v67[7] = v59;
    [v16 enumerateObjectsUsingBlock:v67];
    -[CEKWheelScrubberCollectionViewLayout _setCachedContentSize:](self, "_setCachedContentSize:", v61 + v6, v56);
    [(CEKWheelScrubberCollectionViewLayout *)self _setCachedLayoutAttributesCells:v16];
  }
}

void __53__CEKWheelScrubberCollectionViewLayout_prepareLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (*(unsigned char *)(a1 + 64)) {
    double MinX = CGRectGetMinX(*(CGRect *)&v4);
  }
  else {
    double MinX = CGRectGetMinY(*(CGRect *)&v4);
  }
  double v13 = MinX;
  CGFloat v14 = v8;
  CGFloat v15 = v9;
  double v16 = v10;
  double v17 = v11;
  if (*(unsigned char *)(a1 + 64)) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  }
  else {
    double MaxX = CGRectGetMaxY(*(CGRect *)&v14);
  }
  double v19 = MaxX;
  [*(id *)(a1 + 32) _circularlyWrapped:v13 forCenter:*(double *)(a1 + 40) radius:*(double *)(a1 + 48) scale:*(double *)(a1 + 56)];
  double v21 = v20;
  [*(id *)(a1 + 32) _circularlyWrapped:v19 forCenter:*(double *)(a1 + 40) radius:*(double *)(a1 + 48) scale:*(double *)(a1 + 56)];
  double v23 = v22;
  if (*(unsigned char *)(a1 + 64))
  {
    double MidX = (v21 + v22) * 0.5;
    v30.origin.x = v8;
    v30.origin.y = v9;
    v30.size.width = v10;
    v30.size.height = v11;
    double MidY = CGRectGetMidY(v30);
    double v26 = 1.0;
    double v27 = 0.0;
    if (v10 > 0.0) {
      double v27 = (v23 - v21) / v10;
    }
  }
  else
  {
    v31.origin.x = v8;
    v31.origin.y = v9;
    v31.size.width = v10;
    v31.size.height = v11;
    double MidX = CGRectGetMidX(v31);
    double MidY = (v21 + v23) * 0.5;
    double v26 = 0.0;
    double v27 = 1.0;
    if (v11 > 0.0) {
      double v26 = (v23 - v21) / v11;
    }
  }
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v10, v11);
  objc_msgSend(v3, "setCenter:", MidX, MidY);
  CGAffineTransformMakeScale(&v29, v27, v26);
  CGAffineTransform v28 = v29;
  [v3 setTransform:&v28];
}

- (double)_circularlyWrapped:(double)a3 forCenter:(double)a4 radius:(double)a5 scale:(double)a6
{
  double v6 = (a3 - a4) / a5;
  long double v7 = -1.57079633;
  if (v6 >= -1.57079633)
  {
    long double v7 = v6;
    if (v6 > 1.57079633) {
      long double v7 = 1.57079633;
    }
  }
  sin(v7);
  UIRoundToScale();
  return result;
}

- (CGSize)collectionViewContentSize
{
  double width = self->__cachedContentSize.width;
  double height = self->__cachedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLayoutDirection:(int64_t)a3
{
  if (self->_layoutDirection != a3)
  {
    self->_layoutDirection = a3;
    [(CEKWheelScrubberCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setLayoutOrder:(int64_t)a3
{
  if (self->_layoutOrder != a3)
  {
    self->_layoutOrder = a3;
    [(CEKWheelScrubberCollectionViewLayout *)self invalidateLayout];
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long double v7 = [(CEKWheelScrubberCollectionViewLayout *)self _cachedLayoutAttributesCells];
  CGFloat v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__CEKWheelScrubberCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v11[3] = &unk_1E63CDA20;
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v9 = v8;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v11];

  return v9;
}

void __74__CEKWheelScrubberCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  if (CGRectIntersectsRect(v5, *(CGRect *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  unint64_t v4 = [a3 item];
  CGRect v5 = [(CEKWheelScrubberCollectionViewLayout *)self _cachedLayoutAttributesCells];
  double v6 = v5;
  if ((v4 & 0x8000000000000000) != 0 || v4 >= [v5 count])
  {
    long double v7 = 0;
  }
  else
  {
    long double v7 = [v6 objectAtIndexedSubscript:v4];
  }

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return (id)[MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withIndexPath:a4];
}

- (CEKWheelScrubberCollectionViewLayoutDelegate)wheelScrubberDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wheelScrubberDelegate);
  return (CEKWheelScrubberCollectionViewLayoutDelegate *)WeakRetained;
}

- (void)setWheelScrubberDelegate:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)layoutOrder
{
  return self->_layoutOrder;
}

- (CGSize)_cachedContentSize
{
  double width = self->__cachedContentSize.width;
  double height = self->__cachedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setCachedContentSize:(CGSize)a3
{
  self->__cachedContentSize = a3;
}

- (NSArray)_cachedLayoutAttributesCells
{
  return self->__cachedLayoutAttributesCells;
}

- (void)_setCachedLayoutAttributesCells:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLayoutAttributesCells, 0);
  objc_destroyWeak((id *)&self->_wheelScrubberDelegate);
}

@end