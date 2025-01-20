@interface AVTEdgeDisappearingCollectionViewLayout
- (BOOL)enableEdgeDisappearing;
- (BOOL)isRTL;
- (BOOL)pinHeaderToVisible;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (UICollectionViewLayoutAttributes)fixedHeaderLayoutAttributes;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)modifyLayoutAttributes:(id)a3;
- (void)prepareLayout;
- (void)setEnableEdgeDisappearing:(BOOL)a3;
- (void)setFixedHeaderLayoutAttributes:(id)a3;
- (void)setPinHeaderToVisible:(BOOL)a3;
@end

@implementation AVTEdgeDisappearingCollectionViewLayout

- (BOOL)isRTL
{
  v2 = [(AVTEdgeDisappearingCollectionViewLayout *)self collectionView];
  char v3 = [v2 _shouldReverseLayoutDirection];

  return v3;
}

- (void)prepareLayout
{
  [(AVTEdgeDisappearingCollectionViewLayout *)self setFixedHeaderLayoutAttributes:0];
  v3.receiver = self;
  v3.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v3 prepareLayout];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v20, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)[v4 mutableCopy];

  if ([(AVTEdgeDisappearingCollectionViewLayout *)self pinHeaderToVisible])
  {
    uint64_t v6 = *MEMORY[0x263F1D120];
    v7 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
    v19.receiver = self;
    v19.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
    v8 = [(UICollectionViewFlowLayout *)&v19 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];

    if (v8)
    {
      [v5 addObject:v8];
      [(AVTEdgeDisappearingCollectionViewLayout *)self modifyLayoutAttributes:v8];
      [(AVTEdgeDisappearingCollectionViewLayout *)self setFixedHeaderLayoutAttributes:v8];
    }
  }
  if ([(AVTEdgeDisappearingCollectionViewLayout *)self enableEdgeDisappearing])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[AVTEdgeDisappearingCollectionViewLayout modifyLayoutAttributes:](self, "modifyLayoutAttributes:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v5;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTEdgeDisappearingCollectionViewLayout;
  v4 = [(UICollectionViewFlowLayout *)&v6 layoutAttributesForItemAtIndexPath:a3];
  if ([(AVTEdgeDisappearingCollectionViewLayout *)self enableEdgeDisappearing]) {
    [(AVTEdgeDisappearingCollectionViewLayout *)self modifyLayoutAttributes:v4];
  }
  return v4;
}

- (void)modifyLayoutAttributes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTEdgeDisappearingCollectionViewLayout *)self isRTL];
  if ([v4 representedElementCategory])
  {
    if ([(AVTEdgeDisappearingCollectionViewLayout *)self pinHeaderToVisible])
    {
      objc_super v6 = [v4 representedElementKind];
      v7 = (void *)*MEMORY[0x263F1D120];

      if (v6 == v7)
      {
        v8 = [(AVTEdgeDisappearingCollectionViewLayout *)self collectionView];
        [v8 bounds];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        long long v17 = [(AVTEdgeDisappearingCollectionViewLayout *)self collectionView];
        [v17 _effectiveContentInset];
        double v19 = v10 + v18;
        CGFloat v21 = v12 + v20;
        double v23 = v14 - (v18 + v22);
        double v25 = v16 - (v20 + v24);

        [v4 frame];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        CGFloat rect = v21;
        double v34 = v19;
        double v35 = v21;
        double v36 = v23;
        double v37 = v25;
        if (v5)
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v34);
          v68.origin.x = v27;
          v68.origin.y = v29;
          v68.size.width = v31;
          v68.size.height = v33;
          if (MaxX < CGRectGetMaxX(v68))
          {
            v69.origin.x = v19;
            v69.origin.y = rect;
            v69.size.width = v23;
            v69.size.height = v25;
            double v39 = CGRectGetMaxX(v69);
            v70.origin.x = v27;
            v70.origin.y = v29;
            v70.size.width = v31;
            v70.size.height = v33;
            double v27 = v39 - CGRectGetWidth(v70);
          }
        }
        else
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v34);
          v73.origin.x = v27;
          v73.origin.y = v29;
          v73.size.width = v31;
          v73.size.height = v33;
          if (MinX > CGRectGetMinX(v73))
          {
            v74.origin.x = v19;
            v74.origin.y = rect;
            v74.size.width = v23;
            v74.size.height = v25;
            double v27 = CGRectGetMinX(v74);
          }
        }
        objc_msgSend(v4, "setFrame:", v27, v29, v31, v33);
      }
    }
  }
  else
  {
    [v4 frame];
    double v44 = v40;
    if (v5)
    {
      double v45 = CGRectGetMaxX(*(CGRect *)&v40);
      v46 = [(AVTEdgeDisappearingCollectionViewLayout *)self collectionView];
      [v46 contentOffset];
      double v48 = v47;

      if ([(AVTEdgeDisappearingCollectionViewLayout *)self pinHeaderToVisible])
      {
        v49 = [(AVTEdgeDisappearingCollectionViewLayout *)self fixedHeaderLayoutAttributes];

        if (v49)
        {
          v50 = [(AVTEdgeDisappearingCollectionViewLayout *)self fixedHeaderLayoutAttributes];
          [v50 frame];
          double v48 = CGRectGetMinX(v71);
        }
      }
      double v51 = v45 - v48;
      double v52 = -1.0;
    }
    else
    {
      v53 = [(AVTEdgeDisappearingCollectionViewLayout *)self collectionView];
      [v53 contentOffset];
      double v55 = v54;

      if ([(AVTEdgeDisappearingCollectionViewLayout *)self pinHeaderToVisible])
      {
        v56 = [(AVTEdgeDisappearingCollectionViewLayout *)self fixedHeaderLayoutAttributes];

        if (v56)
        {
          v57 = [(AVTEdgeDisappearingCollectionViewLayout *)self fixedHeaderLayoutAttributes];
          [v57 frame];
          double v55 = CGRectGetMaxX(v72);
        }
      }
      double v51 = -(v44 - v55);
      double v52 = 1.0;
    }
    [v4 size];
    double v59 = v51 / v58;
    if (v59 > 1.0) {
      double v59 = 1.0;
    }
    double v60 = fmax(v59, 0.0);
    [v4 size];
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeTranslation(&v67, v52 * (v61 * (v60 * 0.5)), 0.0);
    CGAffineTransform v65 = v67;
    CGAffineTransformScale(&v66, &v65, 1.0 - v60, 1.0 - v60);
    CGAffineTransform v67 = v66;
    CGAffineTransform v64 = v66;
    [v4 setTransform:&v64];
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)enableEdgeDisappearing
{
  return self->_enableEdgeDisappearing;
}

- (void)setEnableEdgeDisappearing:(BOOL)a3
{
  self->_enableEdgeDisappearing = a3;
}

- (BOOL)pinHeaderToVisible
{
  return self->_pinHeaderToVisible;
}

- (void)setPinHeaderToVisible:(BOOL)a3
{
  self->_pinHeaderToVisible = a3;
}

- (UICollectionViewLayoutAttributes)fixedHeaderLayoutAttributes
{
  return self->_fixedHeaderLayoutAttributes;
}

- (void)setFixedHeaderLayoutAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end