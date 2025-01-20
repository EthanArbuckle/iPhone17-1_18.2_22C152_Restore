@interface CKAppStripLayout
+ (double)maxHeight;
+ (double)minHeight;
- (BOOL)shouldDimPluginCells;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldShowCellBorders;
- (CGSize)collectionViewContentSize;
- (CGSize)collectionViewContentSizeForLayoutMode:(unint64_t)a3;
- (CKAppStripLayout)init;
- (_Spec)_specForLayoutMode:(SEL)a3;
- (id)_attributesForLayoutMode:(unint64_t)a3;
- (id)_currentAttributes;
- (id)_currentSupplementryAttributes;
- (id)_generateAttributesForSpec:(_Spec *)a3;
- (id)_generateSupplementryAttributesForSpec:(_Spec *)a3 minified:(BOOL)a4;
- (id)_supplementryAttributesForLayoutMode:(unint64_t)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_favoritesCount;
- (int64_t)_itemCount;
- (int64_t)_recentsCount;
- (unint64_t)layoutMode;
- (void)finishLayoutModeTransition;
- (void)invalidateCachedLayout;
- (void)prepareForLayoutModeTransition;
- (void)prepareLayout;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setShouldDimPluginCells:(BOOL)a3;
- (void)setShouldShowCellBorders:(BOOL)a3;
@end

@implementation CKAppStripLayout

- (CKAppStripLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKAppStripLayout;
  result = [(CKAppStripLayout *)&v3 init];
  if (result) {
    result->_layoutMode = 0;
  }
  return result;
}

- (CGSize)collectionViewContentSizeForLayoutMode:(unint64_t)a3
{
  uint64_t v5 = [(CKAppStripLayout *)self _itemCount];
  [(CKAppStripLayout *)self _specForLayoutMode:a3];
  double v6 = 0.0;
  double v7 = 0.0 * (double)(v5 - 1) + 0.0 * (double)v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)invalidateCachedLayout
{
  minifiedAttributes = self->_minifiedAttributes;
  self->_minifiedAttributes = 0;

  magnifiedAttributes = self->_magnifiedAttributes;
  self->_magnifiedAttributes = 0;

  supplementryMinifiedAttributes = self->_supplementryMinifiedAttributes;
  self->_supplementryMinifiedAttributes = 0;

  supplementryMagnifiedAttributes = self->_supplementryMagnifiedAttributes;
  self->_supplementryMagnifiedAttributes = 0;

  v7.receiver = self;
  v7.super_class = (Class)CKAppStripLayout;
  [(CKAppStripLayout *)&v7 invalidateLayout];
}

- (void)prepareForLayoutModeTransition
{
  self->_inLayoutModeTransition = 1;
}

- (void)finishLayoutModeTransition
{
  self->_inLayoutModeTransition = 0;
}

+ (double)minHeight
{
  return 38.0;
}

+ (double)maxHeight
{
  return 68.0;
}

- (int64_t)_itemCount
{
  int64_t v3 = [(CKAppStripLayout *)self _favoritesCount];
  return [(CKAppStripLayout *)self _recentsCount] + v3;
}

- (int64_t)_favoritesCount
{
  int64_t v3 = [(CKAppStripLayout *)self collectionView];
  v4 = [v3 delegate];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CKAppStripLayout *)self collectionView];
  int64_t v6 = [v5 numberOfItemsInSection:0];

  return v6;
}

- (int64_t)_recentsCount
{
  int64_t v3 = [(CKAppStripLayout *)self collectionView];
  v4 = [v3 delegate];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CKAppStripLayout *)self collectionView];
  int64_t v6 = [v5 numberOfItemsInSection:1];

  return v6;
}

- (id)_currentAttributes
{
  unint64_t v3 = [(CKAppStripLayout *)self layoutMode];

  return [(CKAppStripLayout *)self _attributesForLayoutMode:v3];
}

- (id)_currentSupplementryAttributes
{
  unint64_t v3 = [(CKAppStripLayout *)self layoutMode];

  return [(CKAppStripLayout *)self _supplementryAttributesForLayoutMode:v3];
}

- (id)_attributesForLayoutMode:(unint64_t)a3
{
  unint64_t v3 = &OBJC_IVAR___CKAppStripLayout__magnifiedAttributes;
  if (!a3) {
    unint64_t v3 = &OBJC_IVAR___CKAppStripLayout__minifiedAttributes;
  }
  id v4 = *(id *)((char *)&self->super.super.isa + *v3);

  return v4;
}

- (id)_supplementryAttributesForLayoutMode:(unint64_t)a3
{
  unint64_t v3 = &OBJC_IVAR___CKAppStripLayout__supplementryMagnifiedAttributes;
  if (!a3) {
    unint64_t v3 = &OBJC_IVAR___CKAppStripLayout__supplementryMinifiedAttributes;
  }
  id v4 = *(id *)((char *)&self->super.super.isa + *v3);

  return v4;
}

- (id)_generateAttributesForSpec:(_Spec *)a3
{
  uint64_t v5 = [(CKAppStripLayout *)self _favoritesCount];
  int64_t v20 = [(CKAppStripLayout *)self _recentsCount];
  int64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[CKAppStripLayout _itemCount](self, "_itemCount"));
  unint64_t v7 = 0x1E4F28000uLL;
  v8 = (char *)&unk_1EB43B000;
  if (v5 < 1)
  {
    double v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      v11 = [*(id *)(v7 + 3416) indexPathForItem:v9 inSection:0];
      [v8 + 2008 layoutAttributesForCellWithIndexPath:v11];
      v12 = v8;
      v14 = unint64_t v13 = v7;
      objc_msgSend(v14, "setSize:", a3->var0.width, a3->var0.height);
      objc_msgSend(v14, "setFrame:", v10, 0.0, a3->var0.width, a3->var0.height);
      objc_msgSend(v14, "setShowsBorder:", -[CKAppStripLayout shouldShowCellBorders](self, "shouldShowCellBorders"));
      [v14 setAppStripSize:a3->var4];
      [v6 addObject:v14];
      double v10 = v10 + a3->var3 + a3->var0.width;

      unint64_t v7 = v13;
      v8 = v12;

      ++v9;
    }
    while (v5 != v9);
  }
  if (CKIsRunningInCameraAppsClient())
  {
    uint64_t v15 = v20;
  }
  else
  {
    uint64_t v15 = v20;
    if (v20) {
      double v10 = v10 + a3->var1.width + a3->var2 * 2.0;
    }
  }
  if (v15 >= 1)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v17 = [*(id *)(v7 + 3416) indexPathForItem:i inSection:1];
      v18 = [v8 + 2008 layoutAttributesForCellWithIndexPath:v17];
      objc_msgSend(v18, "setSize:", a3->var0.width, a3->var0.height);
      objc_msgSend(v18, "setFrame:", v10, 0.0, a3->var0.width, a3->var0.height);
      objc_msgSend(v18, "setShowsBorder:", -[CKAppStripLayout shouldShowCellBorders](self, "shouldShowCellBorders"));
      [v18 setAppStripSize:a3->var4];
      [v6 addObject:v18];
      double v10 = v10 + a3->var3 + a3->var0.width;
    }
  }

  return v6;
}

- (id)_generateSupplementryAttributesForSpec:(_Spec *)a3 minified:(BOOL)a4
{
  BOOL v4 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(CKAppStripLayout *)self _favoritesCount];
  int64_t v8 = [(CKAppStripLayout *)self _recentsCount];
  int v9 = CKIsRunningInCameraAppsClient();
  double v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v9 && v7 && v8)
  {
    v11 = &OBJC_IVAR___CKAppStripLayout__magnifiedAttributes;
    if (v4) {
      v11 = &OBJC_IVAR___CKAppStripLayout__minifiedAttributes;
    }
    id v12 = *(id *)((char *)&self->super.super.isa + *v11);
    unint64_t v13 = [v12 objectAtIndex:v7 - 1];
    v14 = [v12 objectAtIndex:v7];
    uint64_t v15 = (void *)MEMORY[0x1E4F428A0];
    v16 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
    v17 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    v18 = [v15 layoutAttributesForSupplementaryViewOfKind:v16 withIndexPath:v17];

    objc_msgSend(v18, "setSize:", a3->var1.width, a3->var1.height);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [v13 frame];
    double MaxX = CGRectGetMaxX(v26);
    [v14 frame];
    double v21 = MaxX + (CGRectGetMinX(v27) - MaxX) * 0.5 - a3->var1.width * 0.5;
    if (CKMainScreenScale_once_45 != -1) {
      dispatch_once(&CKMainScreenScale_once_45, &__block_literal_global_114);
    }
    double v22 = *(double *)&CKMainScreenScale_sMainScreenScale_45;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_45 == 0.0) {
      double v22 = 1.0;
    }
    objc_msgSend(v18, "setFrame:", round(v21 * v22) / v22, v19, a3->var1.width, a3->var1.height);
    v24[0] = v18;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  }

  return v10;
}

- (_Spec)_specForLayoutMode:(SEL)a3
{
  if (a4)
  {
    retstr->var0 = (CGSize)_MagnifiedSpec;
    retstr->var1 = (CGSize)unk_18F81CD60;
    *(_OWORD *)&retstr->var2 = xmmword_18F81CD70;
    retstr->var4 = 1;
  }
  else
  {
    retstr->var4 = 0;
    retstr->var0 = (CGSize)_MinifiedSpec;
    retstr->var1 = (CGSize)unk_18F81CD28;
    *(_OWORD *)&retstr->var2 = xmmword_18F81CD38;
  }
  return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v5 = [(CKAppStripLayout *)self collectionView];
  [v5 bounds];
  BOOL v8 = v7 != height || v6 != width;

  return v8;
}

- (CGSize)collectionViewContentSize
{
  unint64_t v3 = [(CKAppStripLayout *)self layoutMode];

  [(CKAppStripLayout *)self collectionViewContentSizeForLayoutMode:v3];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)prepareLayout
{
  [(CKAppStripLayout *)self invalidateCachedLayout];
  if (!self->_minifiedAttributes)
  {
    uint64_t v14 = 0;
    long long v11 = _MinifiedSpec;
    long long v12 = unk_18F81CD28;
    long long v13 = xmmword_18F81CD38;
    unint64_t v3 = [(CKAppStripLayout *)self _generateAttributesForSpec:&v11];
    minifiedAttributes = self->_minifiedAttributes;
    self->_minifiedAttributes = v3;
  }
  if (!self->_magnifiedAttributes)
  {
    long long v11 = _MagnifiedSpec;
    long long v12 = unk_18F81CD60;
    long long v13 = xmmword_18F81CD70;
    uint64_t v14 = 1;
    double v5 = [(CKAppStripLayout *)self _generateAttributesForSpec:&v11];
    magnifiedAttributes = self->_magnifiedAttributes;
    self->_magnifiedAttributes = v5;
  }
  if (!self->_supplementryMinifiedAttributes)
  {
    uint64_t v14 = 0;
    long long v11 = _MinifiedSpec;
    long long v12 = unk_18F81CD28;
    long long v13 = xmmword_18F81CD38;
    double v7 = [(CKAppStripLayout *)self _generateSupplementryAttributesForSpec:&v11 minified:1];
    supplementryMinifiedAttributes = self->_supplementryMinifiedAttributes;
    self->_supplementryMinifiedAttributes = v7;
  }
  if (!self->_supplementryMagnifiedAttributes)
  {
    long long v11 = _MagnifiedSpec;
    long long v12 = unk_18F81CD60;
    long long v13 = xmmword_18F81CD70;
    uint64_t v14 = 1;
    int v9 = [(CKAppStripLayout *)self _generateSupplementryAttributesForSpec:&v11 minified:0];
    supplementryMagnifiedAttributes = self->_supplementryMagnifiedAttributes;
    self->_supplementryMagnifiedAttributes = v9;
  }
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  uint64_t v6 = [v4 section];

  if (v6 == 1) {
    v5 += [(CKAppStripLayout *)self _favoritesCount];
  }
  if (self->_inLayoutModeTransition)
  {
    if ([(CKAppStripLayout *)self layoutMode])
    {
      double v7 = self;
      uint64_t v8 = 0;
    }
    else
    {
      double v7 = self;
      uint64_t v8 = 1;
    }
    int v9 = [(CKAppStripLayout *)v7 _attributesForLayoutMode:v8];
  }
  else
  {
    int v9 = [(CKAppStripLayout *)self _currentAttributes];
  }
  double v10 = v9;
  long long v11 = [v9 objectAtIndexedSubscript:v5];

  return v11;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  uint64_t v6 = [v4 section];

  if (v6 == 1) {
    v5 += [(CKAppStripLayout *)self _favoritesCount];
  }
  double v7 = [(CKAppStripLayout *)self _currentAttributes];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    double v10 = 0;
  }
  else
  {
    int v9 = [(CKAppStripLayout *)self _currentAttributes];
    double v10 = [v9 objectAtIndexedSubscript:v5];
  }

  return v10;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a4 item];
  unint64_t v8 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
  int v9 = [v6 isEqualToString:v8];

  if (v9
    && ([(CKAppStripLayout *)self _currentSupplementryAttributes],
        double v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 count],
        v10,
        v7 < v11))
  {
    if (self->_inLayoutModeTransition)
    {
      if ([(CKAppStripLayout *)self layoutMode])
      {
        long long v12 = self;
        uint64_t v13 = 0;
      }
      else
      {
        long long v12 = self;
        uint64_t v13 = 1;
      }
      uint64_t v15 = [(CKAppStripLayout *)v12 _supplementryAttributesForLayoutMode:v13];
    }
    else
    {
      uint64_t v15 = [(CKAppStripLayout *)self _currentSupplementryAttributes];
    }
    v16 = v15;
    uint64_t v14 = [v15 objectAtIndexedSubscript:v7];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
  int v9 = [v7 isEqualToString:v8];

  if (v9
    && (unint64_t v10 = [v6 row],
        [(CKAppStripLayout *)self _currentSupplementryAttributes],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 count],
        v11,
        v10 < v12))
  {
    uint64_t v13 = [(CKAppStripLayout *)self _currentSupplementryAttributes];
    uint64_t v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  uint64_t v6 = [v4 section];

  if (v6 == 1) {
    v5 += [(CKAppStripLayout *)self _favoritesCount];
  }
  id v7 = [(CKAppStripLayout *)self _currentAttributes];
  unint64_t v8 = [v7 objectAtIndexedSubscript:v5];

  return v8;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
  int v9 = [v7 isEqualToString:v8];

  if (v9
    && (unint64_t v10 = [v6 row],
        [(CKAppStripLayout *)self _currentSupplementryAttributes],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 count],
        v11,
        v10 < v12))
  {
    uint64_t v13 = [(CKAppStripLayout *)self _currentSupplementryAttributes];
    uint64_t v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[CKAppStripLayout _itemCount](self, "_itemCount"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v9 = [(CKAppStripLayout *)self _currentAttributes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v14 frame];
        v44.origin.CGFloat x = v15;
        v44.origin.CGFloat y = v16;
        v44.size.CGFloat width = v17;
        v44.size.CGFloat height = v18;
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        if (CGRectIntersectsRect(v42, v44)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v19 = [(CKAppStripLayout *)self _currentSupplementryAttributes];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        [v24 frame];
        v45.origin.CGFloat x = v25;
        v45.origin.CGFloat y = v26;
        v45.size.CGFloat width = v27;
        v45.size.CGFloat height = v28;
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        if (CGRectIntersectsRect(v43, v45)) {
          [v8 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  return v8;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];

  if (v9 == 1) {
    v8 += [(CKAppStripLayout *)self _favoritesCount];
  }
  uint64_t v10 = [(CKAppStripLayout *)self _currentAttributes];
  uint64_t v11 = [v10 objectAtIndexedSubscript:v8];

  uint64_t v12 = (void *)[v11 copy];
  objc_msgSend(v12, "setCenter:", x, y);

  return v12;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)shouldDimPluginCells
{
  return self->_shouldDimPluginCells;
}

- (void)setShouldDimPluginCells:(BOOL)a3
{
  self->_shouldDimPluginCells = a3;
}

- (BOOL)shouldShowCellBorders
{
  return self->_shouldShowCellBorders;
}

- (void)setShouldShowCellBorders:(BOOL)a3
{
  self->_shouldShowCellBorders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementryMagnifiedAttributes, 0);
  objc_storeStrong((id *)&self->_supplementryMinifiedAttributes, 0);
  objc_storeStrong((id *)&self->_magnifiedAttributes, 0);

  objc_storeStrong((id *)&self->_minifiedAttributes, 0);
}

@end