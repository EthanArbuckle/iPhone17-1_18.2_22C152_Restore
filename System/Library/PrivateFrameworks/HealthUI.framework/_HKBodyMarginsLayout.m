@interface _HKBodyMarginsLayout
- (CGSize)intrinsicContentSize;
- (UIView)bodyView;
- (UIView)leftMarginView;
- (UIView)rightMarginView;
- (_HKBodyMarginsLayout)init;
- (double)_maximumViewHeight;
- (double)_totalViewWidth;
- (void)_invalidateLayout;
- (void)layoutSubviews;
- (void)setBodyView:(id)a3;
- (void)setLeftMarginView:(id)a3;
- (void)setRightMarginView:(id)a3;
@end

@implementation _HKBodyMarginsLayout

- (_HKBodyMarginsLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)_HKBodyMarginsLayout;
  v2 = -[_HKBodyMarginsLayout initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    leftMarginView = v2->_leftMarginView;
    v2->_leftMarginView = 0;

    bodyView = v3->_bodyView;
    v3->_bodyView = 0;

    rightMarginView = v3->_rightMarginView;
    v3->_rightMarginView = 0;
  }
  return v3;
}

- (void)setLeftMarginView:(id)a3
{
  id v6 = a3;
  if ((-[UIView isEqual:](self->_leftMarginView, "isEqual:") & 1) == 0)
  {
    v5 = [(_HKBodyMarginsLayout *)self leftMarginView];
    [v5 removeFromSuperview];

    objc_storeStrong((id *)&self->_leftMarginView, a3);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_HKBodyMarginsLayout *)self addSubview:v6];
    [(_HKBodyMarginsLayout *)self _invalidateLayout];
  }
}

- (void)setBodyView:(id)a3
{
  id v6 = a3;
  if ((-[UIView isEqual:](self->_bodyView, "isEqual:") & 1) == 0)
  {
    v5 = [(_HKBodyMarginsLayout *)self bodyView];
    [v5 removeFromSuperview];

    objc_storeStrong((id *)&self->_bodyView, a3);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_HKBodyMarginsLayout *)self addSubview:v6];
    [(_HKBodyMarginsLayout *)self _invalidateLayout];
  }
}

- (void)setRightMarginView:(id)a3
{
  id v6 = a3;
  if ((-[UIView isEqual:](self->_rightMarginView, "isEqual:") & 1) == 0)
  {
    v5 = [(_HKBodyMarginsLayout *)self rightMarginView];
    [v5 removeFromSuperview];

    objc_storeStrong((id *)&self->_rightMarginView, a3);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_HKBodyMarginsLayout *)self addSubview:v6];
    [(_HKBodyMarginsLayout *)self _invalidateLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  [(_HKBodyMarginsLayout *)self _totalViewWidth];
  double v4 = v3;
  [(_HKBodyMarginsLayout *)self _maximumViewHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)_HKBodyMarginsLayout;
  [(_HKBodyMarginsLayout *)&v31 layoutSubviews];
  [(_HKBodyMarginsLayout *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(_HKBodyMarginsLayout *)self leftMarginView];
  double v8 = 0.0;
  if (v7)
  {
    v9 = (void *)v7;
    v10 = [(_HKBodyMarginsLayout *)self leftMarginView];
    char v11 = [v10 isHidden];

    if ((v11 & 1) == 0)
    {
      v12 = [(_HKBodyMarginsLayout *)self leftMarginView];
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v4, v6);
      double v8 = v13;

      v14 = [(_HKBodyMarginsLayout *)self leftMarginView];
      objc_msgSend(v14, "setFrame:", 0.0, 0.0, v8, v6);
    }
  }
  uint64_t v15 = [(_HKBodyMarginsLayout *)self rightMarginView];
  if (v15
    && (v16 = (void *)v15,
        [(_HKBodyMarginsLayout *)self rightMarginView],
        v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 isHidden],
        v17,
        v16,
        (v18 & 1) == 0))
  {
    v20 = [(_HKBodyMarginsLayout *)self rightMarginView];
    objc_msgSend(v20, "systemLayoutSizeFittingSize:", v4, v6);
    double v22 = v21;

    double v19 = v4 - v22;
    v23 = [(_HKBodyMarginsLayout *)self rightMarginView];
    objc_msgSend(v23, "setFrame:", v4 - v22, 0.0, v22, v6);
  }
  else
  {
    double v19 = v4;
  }
  uint64_t v24 = [(_HKBodyMarginsLayout *)self bodyView];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_HKBodyMarginsLayout *)self bodyView];
    char v27 = [v26 isHidden];

    if ((v27 & 1) == 0)
    {
      if (v8 > 0.0) {
        double v8 = v8 + 16.0;
      }
      double v28 = v19 + -16.0;
      if (v19 >= v4) {
        double v28 = v19;
      }
      double v29 = v28 - v8;
      v30 = [(_HKBodyMarginsLayout *)self bodyView];
      objc_msgSend(v30, "setFrame:", v8, 0.0, v29, v6);
    }
  }
}

- (void)_invalidateLayout
{
  [(_HKBodyMarginsLayout *)self invalidateIntrinsicContentSize];
  [(_HKBodyMarginsLayout *)self setNeedsLayout];
}

- (double)_maximumViewHeight
{
  [(_HKBodyMarginsLayout *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(_HKBodyMarginsLayout *)self leftMarginView];
  double v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = (void *)v5;
    double v8 = [(_HKBodyMarginsLayout *)self leftMarginView];
    char v9 = [v8 isHidden];

    if ((v9 & 1) == 0)
    {
      v10 = [(_HKBodyMarginsLayout *)self leftMarginView];
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      double v12 = v11;

      double v6 = fmax(v12, 0.0);
    }
  }
  uint64_t v13 = [(_HKBodyMarginsLayout *)self rightMarginView];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [(_HKBodyMarginsLayout *)self rightMarginView];
    char v16 = [v15 isHidden];

    if ((v16 & 1) == 0)
    {
      v17 = [(_HKBodyMarginsLayout *)self rightMarginView];
      objc_msgSend(v17, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      double v19 = v18;

      if (v6 < v19) {
        double v6 = v19;
      }
    }
  }
  uint64_t v20 = [(_HKBodyMarginsLayout *)self bodyView];
  if (v20)
  {
    double v21 = (void *)v20;
    double v22 = [(_HKBodyMarginsLayout *)self bodyView];
    char v23 = [v22 isHidden];

    if ((v23 & 1) == 0)
    {
      uint64_t v24 = [(_HKBodyMarginsLayout *)self bodyView];
      objc_msgSend(v24, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      double v26 = v25;

      if (v6 < v26) {
        double v6 = v26;
      }
    }
  }
  double result = 1.0;
  if (v6 >= 1.0) {
    return v6;
  }
  return result;
}

- (double)_totalViewWidth
{
  [(_HKBodyMarginsLayout *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(_HKBodyMarginsLayout *)self leftMarginView];
  double v6 = 0.0;
  if (v5
    && (uint64_t v7 = (void *)v5,
        [(_HKBodyMarginsLayout *)self leftMarginView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isHidden],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    double v11 = [(_HKBodyMarginsLayout *)self leftMarginView];
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    double v13 = v12;

    double v6 = v13 + 0.0;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v14 = [(_HKBodyMarginsLayout *)self rightMarginView];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    char v16 = [(_HKBodyMarginsLayout *)self rightMarginView];
    char v17 = [v16 isHidden];

    if ((v17 & 1) == 0)
    {
      double v18 = [(_HKBodyMarginsLayout *)self rightMarginView];
      objc_msgSend(v18, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      double v20 = v19;

      double v6 = v6 + v20;
      ++v10;
    }
  }
  uint64_t v21 = [(_HKBodyMarginsLayout *)self bodyView];
  if (v21)
  {
    double v22 = (void *)v21;
    char v23 = [(_HKBodyMarginsLayout *)self bodyView];
    char v24 = [v23 isHidden];

    if ((v24 & 1) == 0)
    {
      double v25 = [(_HKBodyMarginsLayout *)self bodyView];
      objc_msgSend(v25, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
      double v27 = v26;

      double v6 = v6 + v27;
      ++v10;
    }
  }
  double result = v6 + (double)(v10 - 1) * 16.0;
  if (result < 1.0) {
    return 1.0;
  }
  return result;
}

- (UIView)leftMarginView
{
  return self->_leftMarginView;
}

- (UIView)bodyView
{
  return self->_bodyView;
}

- (UIView)rightMarginView
{
  return self->_rightMarginView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightMarginView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_leftMarginView, 0);
}

@end