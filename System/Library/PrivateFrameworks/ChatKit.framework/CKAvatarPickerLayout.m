@interface CKAvatarPickerLayout
- (BOOL)_shouldShowContactNames;
- (BOOL)isInEditingMode;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)_contentSizeForBannerLayout;
- (CGSize)_contentSizeForGroupIdentityLayout;
- (CGSize)_contentSizeForSingleAvatarLayout;
- (CGSize)collectionViewContentSize;
- (CKAvatarPickerLayout)initWithLayoutMode:(unint64_t)a3;
- (CKAvatarPickerLayoutDelegate)delegate;
- (NSArray)attrCollection;
- (NSValue)editingFrameValue;
- (UICollectionViewLayoutAttributes)avatarAttr;
- (UICollectionViewLayoutAttributes)titleSupplementaryAttr;
- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (unint64_t)_itemCount;
- (unint64_t)layoutMode;
- (void)_setupBannerLayout;
- (void)_setupGroupIdentityLayout;
- (void)_setupSingleAvatarLayout;
- (void)_setupTitleViewLayoutWithYPosition:(double)a3;
- (void)invalidateLayoutAndCache;
- (void)prepareLayout;
- (void)setAttrCollection:(id)a3;
- (void)setAvatarAttr:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingFrameValue:(id)a3;
- (void)setIsInEditingMode:(BOOL)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setTitleSupplementaryAttr:(id)a3;
@end

@implementation CKAvatarPickerLayout

- (CKAvatarPickerLayout)initWithLayoutMode:(unint64_t)a3
{
  v4 = [(CKAvatarPickerLayout *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_layoutMode = a3;
    v4->_isInEditingMode = 0;
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id location = 0;
    objc_initWeak(&location, v5);
    v7 = CKNavigationBarCollectionViewShouldAdustForEditingModeNotification;
    v8 = [MEMORY[0x1E4F28F08] mainQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__CKAvatarPickerLayout_initWithLayoutMode___block_invoke;
    v11[3] = &unk_1E5628738;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[v6 addObserverForName:v7 object:0 queue:v8 usingBlock:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __43__CKAvatarPickerLayout_initWithLayoutMode___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v12 userInfo];
  v5 = [v4 objectForKeyedSubscript:kCKNavigationBarCollectionViewKey];

  if (v5)
  {
    v6 = [WeakRetained collectionView];

    if (v5 == v6)
    {
      v7 = [v12 userInfo];
      v8 = [v7 objectForKeyedSubscript:kCKNavigationBarIsInEditingModeKey];

      if (v8) {
        uint64_t v9 = [v8 BOOLValue];
      }
      else {
        uint64_t v9 = 0;
      }
      [WeakRetained setIsInEditingMode:v9];
      if ([WeakRetained isInEditingMode])
      {
        v10 = [v12 userInfo];
        v11 = [v10 objectForKeyedSubscript:kCKNavigationBarEditFrameKey];
        [WeakRetained setEditingFrameValue:v11];
      }
      else
      {
        [WeakRetained setEditingFrameValue:0];
      }
    }
  }
}

- (void)invalidateLayoutAndCache
{
  [(CKAvatarPickerLayout *)self setAttrCollection:0];
  [(CKAvatarPickerLayout *)self setTitleSupplementaryAttr:0];
  [(CKAvatarPickerLayout *)self setAvatarAttr:0];

  [(CKAvatarPickerLayout *)self invalidateLayout];
}

- (void)setLayoutMode:(unint64_t)a3
{
  unint64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3 && layoutMode != 2) {
    self->_unint64_t layoutMode = a3;
  }
}

- (unint64_t)_itemCount
{
  v2 = [(CKAvatarPickerLayout *)self collectionView];
  unint64_t v3 = [v2 numberOfItemsInSection:0];

  return v3;
}

- (void)_setupTitleViewLayoutWithYPosition:(double)a3
{
  v5 = [(CKAvatarPickerLayout *)self delegate];
  [v5 avatarPickerLayoutTitleViewHeight];
  double v7 = v6;

  if (v7 <= 0.0) {
    double v7 = 32.0;
  }
  v8 = [(CKAvatarPickerLayout *)self collectionView];
  [v8 bounds];
  double MidX = CGRectGetMidX(v17);

  v10 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  [v10 setHidden:0];

  v11 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  objc_msgSend(v11, "setCenter:", MidX, a3 + v7 * 0.5);

  id v12 = [(CKAvatarPickerLayout *)self collectionView];
  [v12 bounds];
  double Width = CGRectGetWidth(v18);
  v14 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  objc_msgSend(v14, "setSize:", Width, v7);

  id v15 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  [v15 setAlpha:1.0];
}

- (void)_setupGroupIdentityLayout
{
  double MaxY = 0.0;
  double Width = 0.0;
  if ([(CKAvatarPickerLayout *)self isInEditingMode])
  {
    v5 = [(CKAvatarPickerLayout *)self editingFrameValue];
    [v5 CGRectValue];
    double Width = CGRectGetWidth(v21);
  }
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 groupAvatarViewSize];
  double v8 = v7;

  uint64_t v9 = [(CKAvatarPickerLayout *)self collectionView];
  [v9 bounds];
  double v10 = CGRectGetWidth(v22);

  v11 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [(CKAvatarPickerLayout *)self attrCollection];
    v14 = [v13 objectAtIndex:0];

    if (Width >= v10) {
      double v15 = Width;
    }
    else {
      double v15 = v10;
    }
    double v16 = v15 * 0.5;
    CGRect v17 = [(CKAvatarPickerLayout *)self collectionView];
    [v17 bounds];
    objc_msgSend(v14, "setSize:", v18, v8);

    if (CKMainScreenScale_once_97 != -1) {
      dispatch_once(&CKMainScreenScale_once_97, &__block_literal_global_256);
    }
    double v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_97 != 0.0) {
      double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_97;
    }
    objc_msgSend(v14, "setCenter:", round(v16 * v19) / v19, round(v8 * 0.5 * v19) / v19);
    [v14 frame];
    double MaxY = CGRectGetMaxY(v23);
    [(CKAvatarPickerLayout *)self setAvatarAttr:v14];
  }

  [(CKAvatarPickerLayout *)self _setupTitleViewLayoutWithYPosition:MaxY];
}

- (CGSize)_contentSizeForGroupIdentityLayout
{
  unint64_t v3 = [(CKAvatarPickerLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(CKAvatarPickerLayout *)self avatarAttr];
  [v6 bounds];
  double MaxX = CGRectGetMaxX(v16);

  double v8 = [(CKAvatarPickerLayout *)self avatarAttr];
  [v8 bounds];
  double MaxY = CGRectGetMaxY(v17);
  double v10 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  [v10 size];
  double v12 = MaxY + v11;

  if (MaxX >= v5) {
    double v13 = MaxX;
  }
  else {
    double v13 = v5;
  }
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setupSingleAvatarLayout
{
  double MaxY = 0.0;
  double Width = 0.0;
  if ([(CKAvatarPickerLayout *)self isInEditingMode])
  {
    double v5 = [(CKAvatarPickerLayout *)self editingFrameValue];
    [v5 CGRectValue];
    double Width = CGRectGetWidth(v21);
  }
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 avatarSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(CKAvatarPickerLayout *)self collectionView];
  [v11 bounds];
  double v12 = CGRectGetWidth(v22);

  double v13 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [(CKAvatarPickerLayout *)self attrCollection];
    CGRect v16 = [v15 objectAtIndex:0];

    if (Width >= v12) {
      double v17 = Width;
    }
    else {
      double v17 = v12;
    }
    double v18 = v17 * 0.5;
    objc_msgSend(v16, "setSize:", v8, v10);
    if (CKMainScreenScale_once_97 != -1) {
      dispatch_once(&CKMainScreenScale_once_97, &__block_literal_global_256);
    }
    double v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_97 != 0.0) {
      double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_97;
    }
    objc_msgSend(v16, "setCenter:", round(v18 * v19) / v19, round(v10 * 0.5 * v19) / v19);
    [v16 frame];
    double MaxY = CGRectGetMaxY(v23);
    [(CKAvatarPickerLayout *)self setAvatarAttr:v16];
  }

  [(CKAvatarPickerLayout *)self _setupTitleViewLayoutWithYPosition:MaxY];
}

- (CGSize)_contentSizeForSingleAvatarLayout
{
  unint64_t v3 = [(CKAvatarPickerLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(CKAvatarPickerLayout *)self avatarAttr];
  [v6 bounds];
  double MaxX = CGRectGetMaxX(v16);

  double v8 = [(CKAvatarPickerLayout *)self avatarAttr];
  [v8 bounds];
  double MaxY = CGRectGetMaxY(v17);
  double v10 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  [v10 size];
  double v12 = MaxY + v11;

  if (MaxX >= v5) {
    double v13 = MaxX;
  }
  else {
    double v13 = v5;
  }
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setupBannerLayout
{
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 bannerCellSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CKAvatarPickerLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = fmin(v7, v12);
    double v16 = fmin(v5, v10);
    CGRect v17 = [(CKAvatarPickerLayout *)self attrCollection];
    double v18 = [v17 objectAtIndex:0];

    double v19 = [(CKAvatarPickerLayout *)self collectionView];
    [v19 bounds];
    double MidX = CGRectGetMidX(v41);
    CGRect v21 = +[CKUIBehavior sharedBehaviors];
    [v21 avatarSpacingMargin];
    double v23 = MidX + (v16 + v22) * 0.0;

    v24 = +[CKUIBehavior sharedBehaviors];
    [v24 bannerAdditionalOffset];
    double v26 = v15 * 0.5 + v25;

    objc_msgSend(v18, "setCenter:", v23, v26);
    objc_msgSend(v18, "setSize:", v16, v15);
    [v18 frame];
    double MaxY = CGRectGetMaxY(v42);
    v28 = +[CKUIBehavior sharedBehaviors];
    [v28 avatarContactImageNameMargin];
    double v30 = MaxY + v29;
  }
  else
  {
    double v30 = 0.0;
  }
  v31 = +[CKUIBehavior sharedBehaviors];
  [v31 bannerTitleAdditionalOffset];
  double v33 = v30 + v32;

  v34 = [(CKAvatarPickerLayout *)self collectionView];
  [v34 bounds];
  double v35 = CGRectGetMidX(v43);

  v36 = [(CKAvatarPickerLayout *)self collectionView];
  [v36 bounds];
  double Width = CGRectGetWidth(v44);
  v38 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  objc_msgSend(v38, "setSize:", Width, 16.0);

  id v39 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  objc_msgSend(v39, "setCenter:", v35, v33);
}

- (CGSize)_contentSizeForBannerLayout
{
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 avatarSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CKAvatarPickerLayout *)self collectionView];
  [v8 bounds];
  double v10 = v9;

  double v11 = v5 + 40.0;
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 avatarContactImageNameMargin];
  double v14 = v7 + v13;
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 bannerTitleAdditionalOffset];
  double v17 = v14 + v16 + 16.0;

  if (v11 >= v10) {
    double v18 = v11;
  }
  else {
    double v18 = v10;
  }
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v6 = [(CKAvatarPickerLayout *)self collectionView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (v8 != width || v10 != height)
  {
    double v12 = [(CKAvatarPickerLayout *)self collectionView];
    [v12 bounds];
    double v13 = CGRectGetWidth(v15);

    if (v13 != width)
    {
      [(CKAvatarPickerLayout *)self setAttrCollection:0];
      [(CKAvatarPickerLayout *)self setTitleSupplementaryAttr:0];
      [(CKAvatarPickerLayout *)self setAvatarAttr:0];
    }
  }
  return 1;
}

- (CGSize)collectionViewContentSize
{
  unint64_t v3 = [(CKAvatarPickerLayout *)self layoutMode];
  if (v3 == 1)
  {
    [(CKAvatarPickerLayout *)self _contentSizeForSingleAvatarLayout];
  }
  else if (v3 == 2)
  {
    [(CKAvatarPickerLayout *)self _contentSizeForBannerLayout];
  }
  else
  {
    [(CKAvatarPickerLayout *)self _contentSizeForGroupIdentityLayout];
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)prepareLayout
{
  uint64_t v3 = [(CKAvatarPickerLayout *)self _itemCount];
  double v4 = [(CKAvatarPickerLayout *)self attrCollection];

  if (!v4)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        double v7 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
        double v8 = [MEMORY[0x1E4F428A0] layoutAttributesForCellWithIndexPath:v7];
        [v5 addObject:v8];
      }
    }
    double v9 = (void *)MEMORY[0x1E4F428A0];
    double v10 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
    double v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    double v12 = [v9 layoutAttributesForSupplementaryViewOfKind:v10 withIndexPath:v11];
    [(CKAvatarPickerLayout *)self setTitleSupplementaryAttr:v12];

    [(CKAvatarPickerLayout *)self setAttrCollection:v5];
  }
  if ([(CKAvatarPickerLayout *)self layoutMode] == 2)
  {
    [(CKAvatarPickerLayout *)self _setupBannerLayout];
  }
  else if ([(CKAvatarPickerLayout *)self layoutMode] == 3)
  {
    [(CKAvatarPickerLayout *)self _setupGroupIdentityLayout];
  }
  else if ([(CKAvatarPickerLayout *)self layoutMode] == 1)
  {
    [(CKAvatarPickerLayout *)self _setupSingleAvatarLayout];
  }
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v6 = [v4 item];

  double v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v6 = [v4 item];

  double v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4 = a3;
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CKAvatarPickerLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:]();
  }

  return 0;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4 = a3;
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CKAvatarPickerLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:]();
  }

  return 0;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  }
  else
  {
    double v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKAvatarPickerLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:]();
    }

    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CKAvatarPickerLayout.m", 270, @"Trying to use supplementaryKind that is for neither name nor title: %@", v6 object file lineNumber description];

    double v9 = 0;
  }

  return v9;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  }
  else
  {
    double v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKAvatarPickerLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:]();
    }

    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CKAvatarPickerLayout.m", 281, @"Trying to use supplementaryKind that is for neither name nor title: %@", v6 object file lineNumber description];

    double v9 = 0;
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v6 = [v4 item];

  double v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  }
  else
  {
    double v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKAvatarPickerLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:]();
    }

    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CKAvatarPickerLayout.m", 296, @"Trying to use supplementaryKind that is for neither name nor title: %@", v6 object file lineNumber description];

    double v9 = 0;
  }

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4 = a3;
  double v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CKAvatarPickerLayout layoutAttributesForDecorationViewOfKind:atIndexPath:]();
  }

  return 0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v8 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v9 = [v8 count] + 1;

  double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  double v11 = [(CKAvatarPickerLayout *)self attrCollection];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      double v14 = [(CKAvatarPickerLayout *)self attrCollection];
      unint64_t v15 = [v14 count];

      if (v13 >= v15)
      {
        double v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(CKAvatarPickerLayout *)&v34 layoutAttributesForElementsInRect:v17];
        }
      }
      else
      {
        double v16 = [(CKAvatarPickerLayout *)self attrCollection];
        double v17 = [v16 objectAtIndex:v13];

        if (v17)
        {
          [v17 frame];
          v39.origin.CGFloat x = v18;
          v39.origin.CGFloat y = v19;
          v39.size.CGFloat width = v20;
          v39.size.CGFloat height = v21;
          v37.origin.CGFloat x = x;
          v37.origin.CGFloat y = y;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = height;
          if (CGRectIntersectsRect(v37, v39)) {
            [v10 addObject:v17];
          }
        }
      }

      ++v13;
      double v22 = [(CKAvatarPickerLayout *)self attrCollection];
      unint64_t v23 = [v22 count];
    }
    while (v13 < v23);
  }
  uint64_t v24 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
  if (v24)
  {
    double v25 = (void *)v24;
    double v26 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
    [v26 frame];
    v40.origin.CGFloat x = v27;
    v40.origin.CGFloat y = v28;
    v40.size.CGFloat width = v29;
    v40.size.CGFloat height = v30;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    BOOL v31 = CGRectIntersectsRect(v38, v40);

    if (v31)
    {
      double v32 = [(CKAvatarPickerLayout *)self titleSupplementaryAttr];
      [v10 addObject:v32];
    }
  }

  return v10;
}

- (BOOL)_shouldShowContactNames
{
  return 0;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (CKAvatarPickerLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAvatarPickerLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionViewLayoutAttributes)titleSupplementaryAttr
{
  return self->_titleSupplementaryAttr;
}

- (void)setTitleSupplementaryAttr:(id)a3
{
}

- (NSArray)attrCollection
{
  return self->_attrCollection;
}

- (void)setAttrCollection:(id)a3
{
}

- (UICollectionViewLayoutAttributes)avatarAttr
{
  return self->_avatarAttr;
}

- (void)setAvatarAttr:(id)a3
{
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  self->_isInEditingMode = a3;
}

- (NSValue)editingFrameValue
{
  return self->_editingFrameValue;
}

- (void)setEditingFrameValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingFrameValue, 0);
  objc_storeStrong((id *)&self->_avatarAttr, 0);
  objc_storeStrong((id *)&self->_attrCollection, 0);
  objc_storeStrong((id *)&self->_titleSupplementaryAttr, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)layoutAttributesForSupplementaryViewOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)layoutAttributesForDecorationViewOfKind:atIndexPath:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
}

- (void)layoutAttributesForElementsInRect:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Index is out of bound for attrCollection", buf, 2u);
}

@end