@interface AVTZIndexEngagementListCollectionViewLayout
- (AVTUIEnvironment)environment;
- (AVTZIndexEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3 minAlphaFactor:(double)a4 environment:(id)a5;
- (NSIndexPath)backIndexPath;
- (NSIndexPath)plusButtonIndexPath;
- (UICollectionViewUpdateItem)currentUpdateItem;
- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3;
- (double)alphaForElementWithAttributes:(id)a3;
- (double)alphaForPadElementWithEngagement:(double)a3;
- (double)minAlphaFactor;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (int64_t)zIndexForElementWithAttributes:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)setBackIndexPath:(id)a3;
- (void)setCurrentUpdateItem:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setMinAlphaFactor:(double)a3;
- (void)setPlusButtonIndexPath:(id)a3;
@end

@implementation AVTZIndexEngagementListCollectionViewLayout

- (AVTZIndexEngagementListCollectionViewLayout)initWithEngagementLayout:(id)a3 minAlphaFactor:(double)a4 environment:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  v10 = [(AVTEngagementListCollectionViewLayout *)&v13 initWithEngagementLayout:a3];
  v11 = v10;
  if (v10)
  {
    v10->_minAlphaFactor = a4;
    objc_storeStrong((id *)&v10->_environment, a5);
  }

  return v11;
}

- (UIEdgeInsets)engagementInsetsForCollectionViewBounds:(CGSize)a3
{
  v3 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  [v3 defaultCellSize];
  double v5 = v4 * -0.5;

  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v5;
  double v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (void)setBackIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_backIndexPath = &self->_backIndexPath;
  if (self->_backIndexPath != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_backIndexPath, a3);
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_backIndexPath, v5);
}

- (void)setPlusButtonIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_plusButtonIndexPath = &self->_plusButtonIndexPath;
  if (self->_plusButtonIndexPath != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_plusButtonIndexPath, a3);
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_plusButtonIndexPath, v5);
}

- (int64_t)zIndexForElementWithAttributes:(id)a3
{
  double v4 = [a3 indexPath];
  double v5 = [(AVTZIndexEngagementListCollectionViewLayout *)self backIndexPath];
  int v6 = [v4 isEqual:v5];

  return v6 ^ 1u;
}

- (double)alphaForElementWithAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTZIndexEngagementListCollectionViewLayout *)self environment];
  if ([v5 deviceIsPad])
  {
  }
  else
  {
    int v6 = [(AVTZIndexEngagementListCollectionViewLayout *)self environment];
    char v7 = [v6 deviceIsMac];

    if ((v7 & 1) == 0)
    {
      double v8 = [v4 indexPath];
      double v9 = [(AVTZIndexEngagementListCollectionViewLayout *)self plusButtonIndexPath];
      char v10 = [v8 isEqual:v9];

      double v11 = 1.0;
      if (v10) {
        goto LABEL_10;
      }
    }
  }
  [v4 frame];
  double Width = CGRectGetWidth(v30);
  objc_super v13 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  [v13 engagedCellSize];
  double v15 = Width / v14;

  v16 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  [v16 defaultCellSize];
  double v18 = v17;
  v19 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
  [v19 engagedCellSize];
  double v21 = v18 / v20;

  double v22 = (1.0 - v15) / (1.0 - v21);
  [(AVTZIndexEngagementListCollectionViewLayout *)self minAlphaFactor];
  double v24 = v23;
  v25 = [(AVTZIndexEngagementListCollectionViewLayout *)self environment];
  if ([v25 deviceIsPad])
  {
  }
  else
  {
    v26 = [(AVTZIndexEngagementListCollectionViewLayout *)self environment];
    int v27 = [v26 deviceIsMac];

    if (!v27)
    {
      double v11 = 1.0 - v22 * (1.0 - v24);
      goto LABEL_10;
    }
  }
  [(AVTZIndexEngagementListCollectionViewLayout *)self alphaForPadElementWithEngagement:v22];
  double v11 = v28;
LABEL_10:

  return v11;
}

- (double)alphaForPadElementWithEngagement:(double)a3
{
  return exp(a3 * -2.4574) * 0.9996;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  id v4 = -[AVTEngagementListCollectionViewLayout layoutAttributesForElementsInRect:](&v15, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setZIndex:", -[AVTZIndexEngagementListCollectionViewLayout zIndexForElementWithAttributes:](self, "zIndexForElementWithAttributes:", v9));
        [(AVTZIndexEngagementListCollectionViewLayout *)self alphaForElementWithAttributes:v9];
        objc_msgSend(v9, "setAlpha:");
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  id v4 = [(AVTEngagementListCollectionViewLayout *)&v6 layoutAttributesForItemAtIndexPath:a3];
  objc_msgSend(v4, "setZIndex:", -[AVTZIndexEngagementListCollectionViewLayout zIndexForElementWithAttributes:](self, "zIndexForElementWithAttributes:", v4));
  [(AVTZIndexEngagementListCollectionViewLayout *)self alphaForElementWithAttributes:v4];
  objc_msgSend(v4, "setAlpha:");
  return v4;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  [(AVTZIndexEngagementListCollectionViewLayout *)&v7 prepareForCollectionViewUpdates:v4];
  if ([v4 count] != 1)
  {
    uint64_t v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Expected only one collection view update!" userInfo:0];
    [v5 raise];
  }
  objc_super v6 = [v4 firstObject];
  [(AVTZIndexEngagementListCollectionViewLayout *)self setCurrentUpdateItem:v6];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  uint64_t v5 = [(AVTZIndexEngagementListCollectionViewLayout *)&v33 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  objc_super v6 = [(AVTZIndexEngagementListCollectionViewLayout *)self currentUpdateItem];
  if ([v6 updateAction])
  {
  }
  else
  {
    objc_super v7 = [(AVTZIndexEngagementListCollectionViewLayout *)self currentUpdateItem];
    double v8 = [v7 indexPathAfterUpdate];
    int v9 = [v8 isEqual:v4];

    if (v9)
    {
      char v10 = [(AVTZIndexEngagementListCollectionViewLayout *)self collectionView];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      v19 = [(AVTEngagementListCollectionViewLayout *)self ignoredProposedContentOffset];

      if (v19)
      {
        double v20 = [(AVTEngagementListCollectionViewLayout *)self ignoredProposedContentOffset];
        [v20 CGPointValue];
        double v12 = v21;
        double v14 = v22;
      }
      double v23 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
      objc_msgSend(v23, "initialFrameForAppearingElementAtOriginForVisibleBounds:", v12, v14, v16, v18);
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      [v5 setAlpha:0.0];
      objc_msgSend(v5, "setFrame:", v25, v27, v29, v31);
    }
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  uint64_t v5 = [(AVTZIndexEngagementListCollectionViewLayout *)&v21 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  objc_super v6 = [(AVTZIndexEngagementListCollectionViewLayout *)self currentUpdateItem];
  if ([v6 updateAction] == 1)
  {
    objc_super v7 = [(AVTZIndexEngagementListCollectionViewLayout *)self currentUpdateItem];
    double v8 = [v7 indexPathBeforeUpdate];
    int v9 = [v8 isEqual:v4];

    if (v9)
    {
      char v10 = [(AVTEngagementListCollectionViewLayout *)self engagementLayout];
      double v11 = [(AVTZIndexEngagementListCollectionViewLayout *)self collectionView];
      [v11 bounds];
      objc_msgSend(v10, "finalFrameForDisappearingElementAtOriginForVisibleBounds:");
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      [v5 setAlpha:0.0];
      objc_msgSend(v5, "setFrame:", v13, v15, v17, v19);
    }
  }
  else
  {
  }
  return v5;
}

- (void)finalizeCollectionViewUpdates
{
  [(AVTZIndexEngagementListCollectionViewLayout *)self setCurrentUpdateItem:0];
  v3.receiver = self;
  v3.super_class = (Class)AVTZIndexEngagementListCollectionViewLayout;
  [(AVTZIndexEngagementListCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
}

- (NSIndexPath)backIndexPath
{
  return self->_backIndexPath;
}

- (NSIndexPath)plusButtonIndexPath
{
  return self->_plusButtonIndexPath;
}

- (UICollectionViewUpdateItem)currentUpdateItem
{
  return self->_currentUpdateItem;
}

- (void)setCurrentUpdateItem:(id)a3
{
}

- (double)minAlphaFactor
{
  return self->_minAlphaFactor;
}

- (void)setMinAlphaFactor:(double)a3
{
  self->_minAlphaFactor = a3;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_currentUpdateItem, 0);
  objc_storeStrong((id *)&self->_plusButtonIndexPath, 0);
  objc_storeStrong((id *)&self->_backIndexPath, 0);
}

@end