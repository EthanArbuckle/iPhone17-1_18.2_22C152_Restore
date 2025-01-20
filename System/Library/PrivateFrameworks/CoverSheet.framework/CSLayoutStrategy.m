@interface CSLayoutStrategy
- (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4;
- (CGRect)suggestedFrameForListForPage:(id)a3 bounds:(CGRect)a4;
- (CGRect)suggestedVisibleFrameForSleeveInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4;
- (CSPersistentContentLayoutProviding)persistentLayout;
- (UIEdgeInsets)suggestedContentInsetsForListForPage:(id)a3;
- (double)_customListWidthForPage:(id)a3 startingBounds:(CGRect)a4;
- (double)_listInsetXForPage:(id)a3;
- (unint64_t)_listLayoutForPage:(id)a3;
- (unint64_t)_listWidthStrategyForPage:(id)a3;
- (void)setPersistentLayout:(id)a3;
@end

@implementation CSLayoutStrategy

- (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentLayout);
  [WeakRetained dateTimeMostExtremeLeadingX];
  [WeakRetained dateTimeMostExtremeTrailingX];
  int v10 = [WeakRetained containsCenteredDateTimeLayout];
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRectGetMidX(v25);
  if (v10)
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRectGetWidth(v26);
    int v11 = BSFloatGreaterThanOrEqualToFloat();
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRectGetWidth(v27);
    if (v11)
    {
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      CGRectGetHeight(v28);
      if (!v4) {
        goto LABEL_7;
      }
    }
    else if (!v4)
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectGetWidth(v29);
  if (v4)
  {
LABEL_6:
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGRectGetWidth(v30);
  }
LABEL_7:
  [WeakRetained timeLabelBaselineY];
  [MEMORY[0x1E4FA5F58] timeFontMetrics];
  [WeakRetained timeLabelBaselineY];
  [WeakRetained timeToSubtitleLabelBaselineDifferenceY];
  v12 = [MEMORY[0x1E4FA5F50] labelFont];
  [v12 descender];

  SBFMainScreenScale();
  BSRectRoundForScale();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)suggestedFrameForListForPage:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  unint64_t v10 = [(CSLayoutStrategy *)self _listLayoutForPage:v9];
  if (v10)
  {
    unint64_t v11 = v10;
    -[CSLayoutStrategy _customListWidthForPage:startingBounds:](self, "_customListWidthForPage:startingBounds:", v9, x, y, width, height);
    double v13 = v12;
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double v14 = CGRectGetWidth(v26) - v13;
    if (BSFloatGreaterThanFloat())
    {
      if (v11 == 1)
      {
        double x = v14 * 0.5;
      }
      else
      {
        [(CSLayoutStrategy *)self _listInsetXForPage:v9];
        double v16 = v15;
        v27.origin.double x = x;
        v27.origin.double y = y;
        v27.size.double width = width;
        v27.size.double height = height;
        double v17 = CGRectGetWidth(v27) - (v13 + v16);
        uint64_t v18 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
        if (v11 == 2) {
          double v19 = v17;
        }
        else {
          double v19 = v16;
        }
        if (v11 == 2) {
          double v20 = v16;
        }
        else {
          double v20 = v17;
        }
        if (v18 == 1) {
          double v21 = v19;
        }
        else {
          double v21 = v20;
        }
        v28.origin.double x = x;
        v28.origin.double y = y;
        v28.size.double width = width;
        v28.size.double height = height;
        double height = CGRectGetHeight(v28);
        double y = 0.0;
        double x = v21;
      }
    }
    else
    {
      double v13 = width;
    }
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v22 = x;
  double v23 = y;
  double v24 = v13;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (UIEdgeInsets)suggestedContentInsetsForListForPage:(id)a3
{
  v3 = [(CSLayoutStrategy *)self persistentLayout];
  [v3 listMinY];
  double v5 = v4;
  [v3 bottomContentInset];
  double v7 = v6;

  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v5;
  double v11 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v8;
  result.top = v10;
  return result;
}

- (CGRect)suggestedVisibleFrameForSleeveInScreenCoordinates:(CGRect)a3 forceCenteredX:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(CSLayoutStrategy *)self persistentLayout];
  -[CSLayoutStrategy suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:](self, "suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:", v4, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v10 windowedAccessoryInset];
  double v20 = v19;
  [MEMORY[0x1E4FA5F50] labelFontMetrics];
  double v22 = v18 - v21;

  double v23 = v20 + v12;
  double v24 = v14;
  double v25 = v16 + v20 * -2.0;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (unint64_t)_listWidthStrategyForPage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 listWidthStrategy];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)_listLayoutForPage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 listLayout];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (double)_listInsetXForPage:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 listInsetX];
    double v4 = v5;
  }

  return v4;
}

- (double)_customListWidthForPage:(id)a3 startingBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  unint64_t v10 = [(CSLayoutStrategy *)self _listWidthStrategyForPage:v9];
  if (v10)
  {
    if (v10 == 1)
    {
      [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
      goto LABEL_8;
    }
    double v11 = 0.0;
    if (v10 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v9 customListWidth];
LABEL_8:
      double v11 = v12;
    }
  }
  else
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v13 = CGRectGetWidth(v16);
    [(CSLayoutStrategy *)self _listInsetXForPage:v9];
    double v11 = v13 + v14 * -2.0;
  }

  return v11;
}

- (CSPersistentContentLayoutProviding)persistentLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentLayout);

  return (CSPersistentContentLayoutProviding *)WeakRetained;
}

- (void)setPersistentLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end