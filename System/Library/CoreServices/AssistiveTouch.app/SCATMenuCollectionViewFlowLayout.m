@interface SCATMenuCollectionViewFlowLayout
- (BOOL)isDockStyle;
- (BOOL)isPopoverStyle;
- (BOOL)willIncludeTitleLabels;
- (CGSize)collectionViewContentSize;
- (CGSize)menuItemSize;
- (CGSize)menuItemSpacing;
- (SCATMenuCollectionViewFlowLayout)init;
- (SCATMenuStyleAttributes)dockStyleAttributes;
- (SCATMenuStyleAttributes)popoverStyleAttributes;
- (double)_heightForAllRows:(unint64_t)a3 itemsPerRow:(unint64_t)a4;
- (double)_maxHeightForRow:(unint64_t)a3 itemsPerRow:(unint64_t)a4;
- (double)_xValueForDockItemAtIndex:(unint64_t)a3 layoutAttributes:(id)a4;
- (double)menuItemHorizontalSpacingAfterItemAtIndex:(unint64_t)a3;
- (double)minimumLineSpacing;
- (id)_rowToFrameDictionaryForAttributes:(id)a3 itemsPerRow:(unint64_t)a4;
- (id)effectiveStyleAttributes;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutDelegate;
- (id)menuSheet;
- (id)scatStyle;
- (unint64_t)maxItemsPerRow;
- (unint64_t)maxRows;
- (unint64_t)maxVisibleItems;
- (unint64_t)numberOfMenuItems;
- (void)_initStyleAttributes;
- (void)column:(unint64_t *)a3 row:(unint64_t *)a4 forItemAtIndex:(unint64_t)a5;
- (void)optimalNumberOfRows:(unint64_t *)a3 itemsPerRow:(unint64_t *)a4 forTotalNumberOfItems:(unint64_t)a5;
- (void)setDockStyleAttributes:(id)a3;
- (void)setPopoverStyleAttributes:(id)a3;
@end

@implementation SCATMenuCollectionViewFlowLayout

- (SCATMenuCollectionViewFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATMenuCollectionViewFlowLayout;
  v2 = [(SCATMenuCollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SCATMenuCollectionViewFlowLayout *)v2 _initStyleAttributes];
  }
  return v3;
}

- (void)_initStyleAttributes
{
  v3 = +[SCATMenuStyleAttributes popoverStyleAttributes];
  [(SCATMenuCollectionViewFlowLayout *)self setPopoverStyleAttributes:v3];

  id v4 = +[SCATMenuStyleAttributes dockStyleAttributes];
  [(SCATMenuCollectionViewFlowLayout *)self setDockStyleAttributes:v4];
}

- (double)minimumLineSpacing
{
  [(SCATMenuCollectionViewFlowLayout *)self menuItemSpacing];
  return v2;
}

- (id)layoutDelegate
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self collectionView];
  v3 = [v2 delegate];

  return v3;
}

- (id)scatStyle
{
  return +[SCATStyleProvider sharedStyleProvider];
}

- (id)menuSheet
{
  v3 = [(SCATMenuCollectionViewFlowLayout *)self layoutDelegate];
  id v4 = [(SCATMenuCollectionViewFlowLayout *)self collectionView];
  objc_super v5 = [v3 menuSheetForCollectionView:v4];

  return v5;
}

- (unint64_t)numberOfMenuItems
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self collectionView];
  id v3 = [v2 numberOfItemsInSection:0];

  return (unint64_t)v3;
}

- (BOOL)willIncludeTitleLabels
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self menuSheet];
  unsigned __int8 v3 = [v2 shouldIncludeTextLabels];

  return v3;
}

- (BOOL)isPopoverStyle
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self menuSheet];
  BOOL v3 = [v2 presentationMode] == 0;

  return v3;
}

- (BOOL)isDockStyle
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self menuSheet];
  BOOL v3 = [v2 presentationMode] == (id)1;

  return v3;
}

- (id)effectiveStyleAttributes
{
  BOOL v3 = [(SCATMenuCollectionViewFlowLayout *)self menuSheet];
  id v4 = [v3 presentationMode];

  if (v4)
  {
    if (v4 == (id)1)
    {
      objc_super v5 = [(SCATMenuCollectionViewFlowLayout *)self dockStyleAttributes];
    }
  }
  else
  {
    objc_super v5 = [(SCATMenuCollectionViewFlowLayout *)self popoverStyleAttributes];
  }

  return v5;
}

- (CGSize)menuItemSize
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self effectiveStyleAttributes];
  [(id)objc_opt_class() itemSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)menuItemSpacing
{
  double v3 = +[SCATScannerManager sharedManager];
  unsigned __int8 v4 = [v3 isLandscape];
  double v5 = [(SCATMenuCollectionViewFlowLayout *)self effectiveStyleAttributes];
  double v6 = v5;
  if (v4) {
    [v5 itemSpacingLandscape];
  }
  else {
    [v5 itemSpacingPortrait];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)maxItemsPerRow
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self effectiveStyleAttributes];
  id v3 = [v2 maxItemsPerRow];

  return (unint64_t)v3;
}

- (unint64_t)maxRows
{
  double v2 = [(SCATMenuCollectionViewFlowLayout *)self effectiveStyleAttributes];
  id v3 = [v2 maxRows];

  return (unint64_t)v3;
}

- (double)menuItemHorizontalSpacingAfterItemAtIndex:(unint64_t)a3
{
  [(SCATMenuCollectionViewFlowLayout *)self menuItemSpacing];
  double v6 = v5;
  if (![(SCATMenuCollectionViewFlowLayout *)self isDockStyle]) {
    _AXAssert();
  }
  double v7 = [(SCATMenuCollectionViewFlowLayout *)self menuSheet];
  double v8 = [v7 menuItemStruts];

  if (v8)
  {
    double v9 = [v8 objectAtIndex:a3];
    [v9 doubleValue];
    double v6 = v10;
  }
  return v6;
}

- (unint64_t)maxVisibleItems
{
  unint64_t v3 = [(SCATMenuCollectionViewFlowLayout *)self maxRows];
  return [(SCATMenuCollectionViewFlowLayout *)self maxItemsPerRow] * v3;
}

- (void)optimalNumberOfRows:(unint64_t *)a3 itemsPerRow:(unint64_t *)a4 forTotalNumberOfItems:(unint64_t)a5
{
  if ([(SCATMenuCollectionViewFlowLayout *)self isPopoverStyle])
  {
    unint64_t v9 = [(SCATMenuCollectionViewFlowLayout *)self maxVisibleItems];
    if (v9 >= a5) {
      unint64_t v10 = a5;
    }
    else {
      unint64_t v10 = v9;
    }
    unint64_t v11 = [(SCATMenuCollectionViewFlowLayout *)self maxItemsPerRow];
    unint64_t v12 = [(SCATMenuCollectionViewFlowLayout *)self maxRows];
    double v13 = ceil((double)v10 / (double)v11);
    if (v13 > (double)v12) {
      double v13 = (double)v12;
    }
    unint64_t v14 = (unint64_t)v13;
    if (v10 < v11 && v14 == 1) {
      unint64_t v16 = v10;
    }
    else {
      unint64_t v16 = v11;
    }
    switch(v10)
    {
      case 5uLL:
      case 6uLL:
        unint64_t v14 = 2;
        unint64_t v16 = 3;
        break;
      case 7uLL:
      case 8uLL:
        unint64_t v14 = 2;
        unint64_t v16 = 4;
        break;
      case 9uLL:
        if (AXDeviceIsPad())
        {
          unint64_t v14 = 2;
          unint64_t v16 = 5;
        }
        else if ((AXDeviceIsPhone() & 1) != 0 || AXDeviceIsPod())
        {
          unint64_t v16 = 3;
          unint64_t v14 = 3;
        }
        break;
      case 0xAuLL:
        if (AXDeviceIsPad())
        {
          unint64_t v16 = 5;
          unint64_t v14 = 2;
        }
        break;
      default:
        break;
    }
  }
  else if ([(SCATMenuCollectionViewFlowLayout *)self isDockStyle])
  {
    unint64_t v14 = [(SCATMenuCollectionViewFlowLayout *)self maxRows];
    unint64_t v16 = [(SCATMenuCollectionViewFlowLayout *)self numberOfMenuItems];
  }
  else
  {
    _AXAssert();
    unint64_t v16 = 0;
    unint64_t v14 = 0;
  }
  if (a4) {
    *a4 = v16;
  }
  if (a3) {
    *a3 = v14;
  }
}

- (void)column:(unint64_t *)a3 row:(unint64_t *)a4 forItemAtIndex:(unint64_t)a5
{
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  [(SCATMenuCollectionViewFlowLayout *)self optimalNumberOfRows:&v12 itemsPerRow:&v11 forTotalNumberOfItems:[(SCATMenuCollectionViewFlowLayout *)self numberOfMenuItems]];
  unint64_t v8 = 0;
  unint64_t v9 = -1;
  unint64_t v10 = v11;
  do
  {
    ++v9;
    v8 += v11;
  }
  while (v8 <= a5);
  if (a4) {
    *a4 = v9;
  }
  if (a3) {
    *a3 = a5 % v10;
  }
}

- (id)_rowToFrameDictionaryForAttributes:(id)a3 itemsPerRow:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v5 count])
  {
    unint64_t v7 = 0;
    if (a4 <= 1) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = a4;
    }
    do
    {
      if (!a4) {
        _AXAssert();
      }
      unint64_t v9 = [v5 objectAtIndex:v7];
      unint64_t v10 = +[NSNumber numberWithUnsignedInteger:v7 / v8];
      unint64_t v11 = [v6 objectForKey:v10];
      [v11 CGRectValue];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;

      [v9 frame];
      double Height = CGRectGetHeight(v30);
      v31.origin.x = v13;
      v31.origin.y = v15;
      v31.size.width = v17;
      v31.size.height = v19;
      if (Height > CGRectGetHeight(v31))
      {
        [v9 frame];
        v28[0] = v21;
        v28[1] = v22;
        v28[2] = v23;
        v28[3] = v24;
        v25 = +[NSValue valueWithBytes:v28 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v26 = +[NSNumber numberWithUnsignedInteger:v7 / v8];
        [v6 setObject:v25 forKeyedSubscript:v26];
      }
      ++v7;
    }
    while (v7 < (unint64_t)[v5 count]);
  }

  return v6;
}

- (double)_xValueForDockItemAtIndex:(unint64_t)a3 layoutAttributes:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [v6 objectAtIndex:a3];
  [v7 frame];
  if (a3)
  {
    unint64_t v9 = +[HNDAccessibilityManager sharedManager];
    unsigned __int8 v10 = [v9 applicationIsRTL];

    unint64_t v11 = a3 - 1;
    double v12 = [v6 objectAtIndex:a3 - 1];
    [v12 frame];
    if (v10)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
      [(SCATMenuCollectionViewFlowLayout *)self menuItemHorizontalSpacingAfterItemAtIndex:v11];
      double v19 = MinX - v18;
      [v7 frame];
      double v20 = v19 - CGRectGetWidth(v24);
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v13);
      [(SCATMenuCollectionViewFlowLayout *)self menuItemHorizontalSpacingAfterItemAtIndex:v11];
      double v20 = MaxX + v22;
    }
  }
  else
  {
    double v20 = v8;
  }

  return v20;
}

- (double)_heightForAllRows:(unint64_t)a3 itemsPerRow:(unint64_t)a4
{
  if (!a3) {
    return 0.0;
  }
  uint64_t v7 = 0;
  double v8 = 0.0;
  do
  {
    [(SCATMenuCollectionViewFlowLayout *)self _maxHeightForRow:v7 itemsPerRow:a4];
    double v8 = v8 + v9;
    ++v7;
  }
  while (a3 != v7);
  return v8;
}

- (double)_maxHeightForRow:(unint64_t)a3 itemsPerRow:(unint64_t)a4
{
  uint64_t v7 = [(SCATMenuCollectionViewFlowLayout *)self collectionView];
  double v8 = [v7 delegate];

  unint64_t v9 = [(SCATMenuCollectionViewFlowLayout *)self numberOfMenuItems];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    double v12 = 0.0;
    do
    {
      if (v11 / a4 == a3)
      {
        uint64_t v13 = [(SCATMenuCollectionViewFlowLayout *)self collectionView];
        double v14 = [v8 collectionView:v13 menuItemForItemAtIndex:v11];

        if ([(SCATMenuCollectionViewFlowLayout *)self willIncludeTitleLabels])
        {
          CGFloat v15 = [v14 title];
        }
        else
        {
          CGFloat v15 = 0;
        }
        +[SCATMenuItemCell cellSizeForTitle:v15];
        if (v12 < v16) {
          double v12 = v16;
        }
      }
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SCATMenuCollectionViewFlowLayout;
  unsigned __int8 v4 = -[SCATMenuCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v24, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  [(SCATMenuCollectionViewFlowLayout *)self optimalNumberOfRows:&v23 itemsPerRow:&v22 forTotalNumberOfItems:[(SCATMenuCollectionViewFlowLayout *)self numberOfMenuItems]];
  id v5 = [(SCATMenuCollectionViewFlowLayout *)self _rowToFrameDictionaryForAttributes:v4 itemsPerRow:v22];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = v22;
      if (!v22)
      {
        _AXAssert();
        unint64_t v7 = v22;
      }
      if (v7 <= 1) {
        unint64_t v7 = 1;
      }
      unint64_t v8 = v6 / v7;
      unint64_t v9 = [v4 objectAtIndex:v6];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v14 = +[NSNumber numberWithUnsignedInteger:v8];
      CGFloat v15 = [v5 objectForKeyedSubscript:v14];
      [v15 CGRectValue];
      double v17 = v16;
      double v19 = v18;

      if ([(SCATMenuCollectionViewFlowLayout *)self isDockStyle])
      {
        [(SCATMenuCollectionViewFlowLayout *)self _xValueForDockItemAtIndex:v6 layoutAttributes:v4];
        double v11 = v20;
      }
      objc_msgSend(v9, "setFrame:", v11, v17, v13, v19);

      ++v6;
    }
    while (v6 < (unint64_t)[v4 count]);
  }

  return v4;
}

- (CGSize)collectionViewContentSize
{
  unint64_t v3 = [(SCATMenuCollectionViewFlowLayout *)self numberOfMenuItems];
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  [(SCATMenuCollectionViewFlowLayout *)self optimalNumberOfRows:&v20 itemsPerRow:&v19 forTotalNumberOfItems:v3];
  [(SCATMenuCollectionViewFlowLayout *)self menuItemSize];
  double v5 = v4;
  [(SCATMenuCollectionViewFlowLayout *)self menuItemSpacing];
  double v7 = v6;
  double v9 = v8;
  [(SCATMenuCollectionViewFlowLayout *)self _heightForAllRows:v20 itemsPerRow:v19];
  double v11 = v10;
  uint64_t v12 = v20;
  if ([(SCATMenuCollectionViewFlowLayout *)self isDockStyle])
  {
    double v13 = v5 * (double)v3;
    unint64_t v14 = v3 - 1;
    if (v3 != 1)
    {
      uint64_t v15 = 0;
      do
      {
        [(SCATMenuCollectionViewFlowLayout *)self menuItemHorizontalSpacingAfterItemAtIndex:v15];
        double v13 = v13 + v16;
        ++v15;
      }
      while (v14 != v15);
    }
  }
  else
  {
    double v13 = v7 * (double)(v19 - 1) + (double)v19 * v5;
  }
  double v17 = v11 + (double)(unint64_t)(v12 - 1) * v9;
  double v18 = v13;
  result.height = v17;
  result.width = v18;
  return result;
}

- (SCATMenuStyleAttributes)popoverStyleAttributes
{
  return self->_popoverStyleAttributes;
}

- (void)setPopoverStyleAttributes:(id)a3
{
}

- (SCATMenuStyleAttributes)dockStyleAttributes
{
  return self->_dockStyleAttributes;
}

- (void)setDockStyleAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockStyleAttributes, 0);

  objc_storeStrong((id *)&self->_popoverStyleAttributes, 0);
}

@end