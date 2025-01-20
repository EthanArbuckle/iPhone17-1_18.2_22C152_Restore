@interface SCATGridPointPickerView
- (BOOL)isCenterPointVisible;
- (CGPath)pathForCenterPointAtSelectionPath:(id)a3;
- (CGRect)_availableFrameForCenterPointAtSelectionPath:(id)a3;
- (CGRect)frameForCenterPointAtSelectionPath:(id)a3;
- (CGRect)frameForSelectionPath:(id)a3;
- (NSIndexPath)currentSelectionPath;
- (SCATGridPointPickerView)initWithFrame:(CGRect)a3;
- (id)centerPointImageForGrid:(id)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_updateGridProperties;
- (void)layoutSubviews;
- (void)setCenterPointVisible:(BOOL)a3;
- (void)setCurrentSelectionPath:(id)a3;
@end

@implementation SCATGridPointPickerView

- (SCATGridPointPickerView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SCATGridPointPickerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v6 = -[SCATGridPointPickerView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v6)
  {
    v7 = +[SCATStyleProvider sharedStyleProvider];
    v8 = -[SCATGridView initWithFrame:]([SCATGridView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    grid = v6->_grid;
    v6->_grid = v8;

    [(SCATGridView *)v6->_grid setDelegate:v6];
    [(SCATGridView *)v6->_grid setAutoresizingMask:18];
    [(SCATGridView *)v6->_grid setNumberOfColumns:3];
    [v7 gridLineThickness];
    -[SCATGridView setLineThickness:](v6->_grid, "setLineThickness:");
    v10 = [v7 gridColor];
    [(SCATGridView *)v6->_grid setLineColor:v10];

    v11 = [v7 gridShadowColor];
    [(SCATGridView *)v6->_grid setShadowColor:v11];

    [v7 gridShadowOffset];
    -[SCATGridView setShadowOffset:](v6->_grid, "setShadowOffset:");
    [(SCATGridPointPickerView *)v6 _updateGridProperties];
    [(SCATGridPointPickerView *)v6 addSubview:v6->_grid];
  }
  return v6;
}

- (unint64_t)numberOfRows
{
  return 3;
}

- (unint64_t)numberOfColumns
{
  return 3;
}

- (BOOL)isCenterPointVisible
{
  return [(SCATGridView *)self->_grid isCenterPointVisible];
}

- (void)setCenterPointVisible:(BOOL)a3
{
}

- (CGRect)frameForSelectionPath:(id)a3
{
  id v4 = a3;
  [(SCATGridPointPickerView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = (char *)[v4 length];
  if (v13)
  {
    v14 = v13;
    for (i = 0; i != v14; ++i)
    {
      double v16 = (double)(unint64_t)[v4 indexAtPosition:i];
      if (i)
      {
        double v10 = v10 / (double)[(SCATGridPointPickerView *)self numberOfColumns];
        double v6 = v6 + v16 * v10;
      }
      else
      {
        double v12 = v12 / (double)[(SCATGridPointPickerView *)self numberOfRows];
        double v8 = v8 + v16 * v12;
      }
    }
  }
  v25.origin.CGFloat x = v6;
  v25.origin.CGFloat y = v8;
  v25.size.CGFloat width = v10;
  v25.size.CGFloat height = v12;
  CGRect v26 = CGRectIntegral(v25);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)frameForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = +[SCATStyleProvider sharedStyleProvider];
  [(SCATGridPointPickerView *)self _availableFrameForCenterPointAtSelectionPath:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v5, "gridCenterPointFrameWithAvailableFrame:", v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGPath)pathForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = +[SCATStyleProvider sharedStyleProvider];
  [(SCATGridPointPickerView *)self _availableFrameForCenterPointAtSelectionPath:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = (CGPath *)objc_msgSend(v5, "gridCenterPointPathWithAvailableFrame:", v7, v9, v11, v13);
  return v14;
}

- (CGRect)_availableFrameForCenterPointAtSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    long long v26 = xmmword_1001978B0;
    double v8 = +[NSIndexPath indexPathWithIndexes:&v26 length:2];
    goto LABEL_5;
  }
  unsigned __int8 v6 = [v4 length];
  double v7 = [v5 indexPathByAddingIndex:1];
  double v8 = v7;
  if (v6)
  {
LABEL_5:
    [(SCATGridPointPickerView *)self frameForSelectionPath:v8];
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
    double v17 = v21;
    goto LABEL_6;
  }
  double v9 = [v7 indexPathByAddingIndex:1];
  [(SCATGridPointPickerView *)self frameForSelectionPath:v9];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

LABEL_6:
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  double v25 = v17;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)_updateGridProperties
{
  v3 = [(SCATGridPointPickerView *)self currentSelectionPath];
  [(SCATGridPointPickerView *)self frameForSelectionPath:v3];
  -[SCATGridView setFrame:](self->_grid, "setFrame:");

  [(SCATGridView *)self->_grid frame];
  double v5 = v4;
  [(SCATGridPointPickerView *)self bounds];
  [(SCATGridView *)self->_grid setShowsLeftBorder:v5 > v6];
  [(SCATGridView *)self->_grid frame];
  double MaxX = CGRectGetMaxX(v17);
  [(SCATGridPointPickerView *)self bounds];
  [(SCATGridView *)self->_grid setShowsRightBorder:MaxX < CGRectGetMaxX(v18)];
  [(SCATGridView *)self->_grid frame];
  double v9 = v8;
  [(SCATGridPointPickerView *)self bounds];
  [(SCATGridView *)self->_grid setShowsTopBorder:v9 > v10];
  [(SCATGridView *)self->_grid frame];
  double MaxY = CGRectGetMaxY(v19);
  [(SCATGridPointPickerView *)self bounds];
  [(SCATGridView *)self->_grid setShowsBottomBorder:MaxY < CGRectGetMaxY(v20)];
  double v12 = [(SCATGridPointPickerView *)self currentSelectionPath];
  unsigned __int8 v13 = [v12 length];

  grid = self->_grid;
  if (v13) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 3;
  }

  [(SCATGridView *)grid setNumberOfRows:v15];
}

- (void)setCurrentSelectionPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  p_currentSelectionPath = &self->_currentSelectionPath;
  if (self->_currentSelectionPath != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_currentSelectionPath, a3);
    p_currentSelectionPath = (NSIndexPath **)[(SCATGridPointPickerView *)self _updateGridProperties];
    double v5 = v7;
  }

  _objc_release_x1(p_currentSelectionPath, v5);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SCATGridPointPickerView;
  [(SCATPromptView *)&v4 layoutSubviews];
  v3 = [(SCATGridPointPickerView *)self currentSelectionPath];
  [(SCATGridPointPickerView *)self frameForSelectionPath:v3];
  -[SCATGridView setFrame:](self->_grid, "setFrame:");
}

- (id)centerPointImageForGrid:(id)a3
{
  objc_super v4 = [(SCATGridPointPickerView *)self currentSelectionPath];
  [(SCATGridPointPickerView *)self _availableFrameForCenterPointAtSelectionPath:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = +[SCATStyleProvider sharedStyleProvider];
  double v10 = objc_msgSend(v9, "gridCenterPointImageWithAvailableSize:", v6, v8);

  return v10;
}

- (NSIndexPath)currentSelectionPath
{
  return self->_currentSelectionPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectionPath, 0);

  objc_storeStrong((id *)&self->_grid, 0);
}

@end