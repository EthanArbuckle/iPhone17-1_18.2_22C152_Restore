@interface FKAGridPointPickerView
- (CGPoint)selectedScreenPoint;
- (CGRect)_frameForIndex:(unint64_t)a3 withinFrame:(CGRect)a4;
- (CGRect)_selectableFrame;
- (FKAGridPointPickerView)initWithFrame:(CGRect)a3;
- (NSIndexPath)indexPath;
- (NSMutableArray)cellViews;
- (unint64_t)_columnForIndex:(unint64_t)a3 numberOfColumns:(unint64_t)a4;
- (unint64_t)_indexForRow:(unint64_t)a3 column:(unint64_t)a4 numberOfColumns:(unint64_t)a5;
- (unint64_t)_numberOfColumns;
- (unint64_t)_numberOfRows;
- (unint64_t)_numberOfRowsWithinFrame:(CGRect)a3;
- (unint64_t)_rowForIndex:(unint64_t)a3 numberOfColumns:(unint64_t)a4;
- (unint64_t)selectedIndex;
- (void)_addCellViewForIndex:(unint64_t)a3;
- (void)_resetCellViewsForCurrentSelectableFrame;
- (void)drillIn;
- (void)drillOut;
- (void)layoutSubviews;
- (void)moveSelectionDown;
- (void)moveSelectionLeft;
- (void)moveSelectionRight;
- (void)moveSelectionUp;
- (void)setBounds:(CGRect)a3;
- (void)setCellViews:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIndexPath:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
@end

@implementation FKAGridPointPickerView

- (FKAGridPointPickerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FKAGridPointPickerView;
  v3 = -[FKAGridPointPickerView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    indexPath = v3->_indexPath;
    v3->_indexPath = (NSIndexPath *)v4;

    uint64_t v6 = +[NSMutableArray array];
    cellViews = v3->_cellViews;
    v3->_cellViews = (NSMutableArray *)v6;

    [(FKAGridPointPickerView *)v3 _resetCellViewsForCurrentSelectableFrame];
  }
  return v3;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FKAGridPointPickerView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)FKAGridPointPickerView;
  -[FKAGridPointPickerView setBounds:](&v13, "setBounds:", x, y, width, height);
  if (v9 != width || v11 != height) {
    [(FKAGridPointPickerView *)self _resetCellViewsForCurrentSelectableFrame];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FKAGridPointPickerView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)FKAGridPointPickerView;
  -[FKAGridPointPickerView setFrame:](&v13, "setFrame:", x, y, width, height);
  if (v9 != width || v11 != height) {
    [(FKAGridPointPickerView *)self _resetCellViewsForCurrentSelectableFrame];
  }
}

- (void)layoutSubviews
{
  [(FKAGridPointPickerView *)self _selectableFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(FKAGridPointPickerView *)self cellViews];
  uint64_t v12 = (uint64_t)[v11 count];

  unint64_t v13 = [(FKAGridPointPickerView *)self _numberOfRows];
  if (v12 != [(FKAGridPointPickerView *)self _numberOfColumns] * v13)
  {
    v14 = FKALogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1000148EC(v12, v14);
    }
  }
  if (v12)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      v16 = [(FKAGridPointPickerView *)self cellViews];
      v17 = [v16 objectAtIndexedSubscript:i];

      -[FKAGridPointPickerView _frameForIndex:withinFrame:](self, "_frameForIndex:withinFrame:", i, v4, v6, v8, v10);
      objc_msgSend(v17, "setFrame:");
    }
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  selectedIndedouble x = self->_selectedIndex;
  if (selectedIndex != a3)
  {
    double v6 = [(FKAGridPointPickerView *)self cellViews];
    id v7 = [v6 count];

    if (selectedIndex < (unint64_t)v7)
    {
      double v8 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2];
      double v9 = [(FKAGridPointPickerView *)self cellViews];
      double v10 = [v9 objectAtIndexedSubscript:self->_selectedIndex];
      [v10 setBackgroundColor:v8];
    }
    double v11 = [(FKAGridPointPickerView *)self cellViews];
    id v12 = [v11 count];
    unint64_t v13 = [(FKAGridPointPickerView *)self _numberOfRows];
    unint64_t v14 = [(FKAGridPointPickerView *)self _numberOfColumns] * v13;

    if (v12 != (id)v14) {
      _AXAssert();
    }
    v15 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.4];
    v16 = [(FKAGridPointPickerView *)self cellViews];
    v17 = [v16 objectAtIndexedSubscript:a3];
    [v17 setBackgroundColor:v15];

    self->_selectedIndedouble x = a3;
  }
}

- (void)setIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_indexPath = &self->_indexPath;
  if (self->_indexPath != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_indexPath, a3);
    p_indexPath = (NSIndexPath **)[(FKAGridPointPickerView *)self _resetCellViewsForCurrentSelectableFrame];
    double v5 = v7;
  }

  _objc_release_x1(p_indexPath, v5);
}

- (CGPoint)selectedScreenPoint
{
  double v3 = [(FKAGridPointPickerView *)self cellViews];
  double v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[FKAGridPointPickerView selectedIndex](self, "selectedIndex"));

  double v5 = [(FKAGridPointPickerView *)self window];
  [v4 bounds];
  AX_CGRectGetCenter();
  objc_msgSend(v4, "convertPoint:toView:", 0);
  objc_msgSend(v5, "convertPoint:toWindow:", 0);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)moveSelectionLeft
{
  unint64_t v3 = [(FKAGridPointPickerView *)self selectedIndex];
  if (v3 % [(FKAGridPointPickerView *)self _numberOfColumns])
  {
    double v4 = (char *)[(FKAGridPointPickerView *)self selectedIndex] - 1;
    [(FKAGridPointPickerView *)self setSelectedIndex:v4];
  }
}

- (void)moveSelectionRight
{
  unint64_t v3 = [(FKAGridPointPickerView *)self _numberOfColumns];
  if ([(FKAGridPointPickerView *)self selectedIndex] % v3 < v3 - 1)
  {
    double v4 = (char *)[(FKAGridPointPickerView *)self selectedIndex] + 1;
    [(FKAGridPointPickerView *)self setSelectedIndex:v4];
  }
}

- (void)moveSelectionUp
{
  unint64_t v3 = [(FKAGridPointPickerView *)self _numberOfColumns];
  if (v3 <= [(FKAGridPointPickerView *)self selectedIndex])
  {
    double v4 = (char *)[(FKAGridPointPickerView *)self selectedIndex] - v3;
    [(FKAGridPointPickerView *)self setSelectedIndex:v4];
  }
}

- (void)moveSelectionDown
{
  unint64_t v3 = [(FKAGridPointPickerView *)self _numberOfRows];
  unint64_t v4 = [(FKAGridPointPickerView *)self _numberOfColumns];
  if ([(FKAGridPointPickerView *)self selectedIndex] / v4 < v3 - 1)
  {
    double v5 = (char *)[(FKAGridPointPickerView *)self selectedIndex] + v4;
    [(FKAGridPointPickerView *)self setSelectedIndex:v5];
  }
}

- (void)drillIn
{
  unint64_t v3 = [(FKAGridPointPickerView *)self indexPath];
  unint64_t v4 = objc_msgSend(v3, "indexPathByAddingIndex:", -[FKAGridPointPickerView selectedIndex](self, "selectedIndex"));
  [(FKAGridPointPickerView *)self setIndexPath:v4];

  unint64_t v5 = [(FKAGridPointPickerView *)self _numberOfRows];
  unint64_t v6 = [(FKAGridPointPickerView *)self _numberOfColumns];
  unint64_t v7 = [(FKAGridPointPickerView *)self _indexForRow:v5 >> 1 column:v6 >> 1 numberOfColumns:v6];

  [(FKAGridPointPickerView *)self setSelectedIndex:v7];
}

- (void)drillOut
{
  unint64_t v3 = [(FKAGridPointPickerView *)self indexPath];
  unint64_t v4 = (char *)[v3 length];

  if (v4)
  {
    unint64_t v5 = [(FKAGridPointPickerView *)self indexPath];
    id v6 = [v5 indexAtPosition:v4 - 1];

    unint64_t v7 = [(FKAGridPointPickerView *)self indexPath];
    double v8 = [v7 indexPathByRemovingLastIndex];
    [(FKAGridPointPickerView *)self setIndexPath:v8];

    [(FKAGridPointPickerView *)self setSelectedIndex:v6];
  }
}

- (CGRect)_selectableFrame
{
  [(FKAGridPointPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(FKAGridPointPickerView *)self indexPath];
  id v12 = (char *)[v11 length];

  if (v12)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      unint64_t v14 = [(FKAGridPointPickerView *)self indexPath];
      id v15 = [v14 indexAtPosition:i];

      -[FKAGridPointPickerView _frameForIndex:withinFrame:](self, "_frameForIndex:withinFrame:", v15, v4, v6, v8, v10);
      double v4 = v16;
      double v6 = v17;
      double v8 = v18;
      double v10 = v19;
    }
  }
  double v20 = v4;
  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)_resetCellViewsForCurrentSelectableFrame
{
  unint64_t v3 = [(FKAGridPointPickerView *)self _numberOfRows];
  unint64_t v4 = [(FKAGridPointPickerView *)self _numberOfColumns];
  unint64_t v5 = v4 * v3;
  double v6 = [(FKAGridPointPickerView *)self cellViews];
  unint64_t v7 = (unint64_t)[v6 count];

  double v8 = (char *)(v7 - v4 * v3);
  if (v7 <= v4 * v3)
  {
    if (v7 < v5)
    {
      do
        [(FKAGridPointPickerView *)self _addCellViewForIndex:v7++];
      while (v5 != v7);
    }
  }
  else
  {
    unint64_t v9 = v4 * v3;
    do
    {
      double v10 = [(FKAGridPointPickerView *)self cellViews];
      double v11 = [v10 objectAtIndexedSubscript:v9];
      [v11 removeFromSuperview];

      ++v9;
    }
    while (v7 != v9);
    id v12 = [(FKAGridPointPickerView *)self cellViews];
    objc_msgSend(v12, "removeObjectsInRange:", v5, v8);
  }
  [(FKAGridPointPickerView *)self setSelectedIndex:[(FKAGridPointPickerView *)self _indexForRow:v3 >> 1 column:v4 >> 1 numberOfColumns:v4]];

  [(FKAGridPointPickerView *)self setNeedsLayout];
}

- (void)_addCellViewForIndex:(unint64_t)a3
{
  id v14 = (id)objc_opt_new();
  unint64_t v5 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:dbl_100022390[[(FKAGridPointPickerView *)self selectedIndex] == a3]];
  [v14 setBackgroundColor:v5];

  double v6 = [(FKAGridPointPickerView *)self traitCollection];
  unint64_t v7 = [v6 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v7)) {
    double v8 = 4.0;
  }
  else {
    double v8 = 2.0;
  }
  unint64_t v9 = [v14 layer];
  [v9 setBorderWidth:v8];

  id v10 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
  id v11 = [v10 CGColor];
  id v12 = [v14 layer];
  [v12 setBorderColor:v11];

  unint64_t v13 = [(FKAGridPointPickerView *)self cellViews];
  [v13 addObject:v14];

  [(FKAGridPointPickerView *)self addSubview:v14];
}

- (unint64_t)_numberOfRows
{
  [(FKAGridPointPickerView *)self _selectableFrame];

  return -[FKAGridPointPickerView _numberOfRowsWithinFrame:](self, "_numberOfRowsWithinFrame:");
}

- (unint64_t)_numberOfRowsWithinFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3)) {
    return 3;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat v8 = CGRectGetHeight(v14) / 3.0;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v9 = v8 / (CGRectGetWidth(v15) / 3.0);
  unint64_t v10 = 3;
  while (1)
  {
    unint64_t v7 = v10;
    if (v9 <= 1.0) {
      break;
    }
    double v11 = v9;
    v10 += 2;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGFloat v12 = CGRectGetHeight(v16) / (double)v10;
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double v9 = v12 / (CGRectGetWidth(v17) / 3.0);
    if (v9 < 1.0)
    {
      if (1.0 / v9 < v11) {
        v7 += 2;
      }
      return v7;
    }
  }
  return v7;
}

- (unint64_t)_numberOfColumns
{
  return 3;
}

- (unint64_t)_indexForRow:(unint64_t)a3 column:(unint64_t)a4 numberOfColumns:(unint64_t)a5
{
  return a4 + a5 * a3;
}

- (unint64_t)_rowForIndex:(unint64_t)a3 numberOfColumns:(unint64_t)a4
{
  return a3 / a4;
}

- (unint64_t)_columnForIndex:(unint64_t)a3 numberOfColumns:(unint64_t)a4
{
  return a3 % a4;
}

- (CGRect)_frameForIndex:(unint64_t)a3 withinFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  unint64_t v10 = -[FKAGridPointPickerView _numberOfRowsWithinFrame:](self, "_numberOfRowsWithinFrame:");
  unint64_t v11 = [(FKAGridPointPickerView *)self _numberOfColumns];
  unint64_t v12 = [(FKAGridPointPickerView *)self _rowForIndex:a3 numberOfColumns:v11];
  unint64_t v13 = [(FKAGridPointPickerView *)self _columnForIndex:a3 numberOfColumns:v11];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v15 = MinX + CGRectGetWidth(v24) * (double)v13 / (double)v11;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v17 = MinY + CGRectGetHeight(v26) * (double)v12 / (double)v10;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat v18 = CGRectGetWidth(v27) / (double)v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v19 = CGRectGetHeight(v28) / (double)v10;
  double v20 = v15;
  double v21 = v17;
  double v22 = v18;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSMutableArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellViews, 0);

  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end