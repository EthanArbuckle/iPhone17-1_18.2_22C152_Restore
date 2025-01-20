@interface _HKDateContentLayout
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (UIView)dateView;
- (_HKDateContentLayout)init;
- (double)_maximumViewWidth;
- (double)_totalViewHeight;
- (int64_t)_viewCount;
- (void)_invalidateLayout;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setDateView:(id)a3;
@end

@implementation _HKDateContentLayout

- (_HKDateContentLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKDateContentLayout;
  v2 = -[_HKDateContentLayout initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    contentView = v2->_contentView;
    v2->_contentView = 0;

    dateView = v3->_dateView;
    v3->_dateView = 0;
  }
  return v3;
}

- (void)setContentView:(id)a3
{
  id v6 = a3;
  if ((-[UIView isEqual:](self->_contentView, "isEqual:") & 1) == 0)
  {
    v5 = [(_HKDateContentLayout *)self contentView];
    [v5 removeFromSuperview];

    objc_storeStrong((id *)&self->_contentView, a3);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_HKDateContentLayout *)self addSubview:v6];
    [(_HKDateContentLayout *)self _invalidateLayout];
  }
}

- (void)setDateView:(id)a3
{
  id v6 = a3;
  if ((-[UIView isEqual:](self->_dateView, "isEqual:") & 1) == 0)
  {
    v5 = [(_HKDateContentLayout *)self dateView];
    [v5 removeFromSuperview];

    objc_storeStrong((id *)&self->_dateView, a3);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(_HKDateContentLayout *)self addSubview:v6];
    [(_HKDateContentLayout *)self _invalidateLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  [(_HKDateContentLayout *)self _maximumViewWidth];
  double v4 = v3;
  [(_HKDateContentLayout *)self _totalViewHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)_HKDateContentLayout;
  [(_HKDateContentLayout *)&v25 layoutSubviews];
  [(_HKDateContentLayout *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(_HKDateContentLayout *)self dateView];
  double v8 = v6;
  if (v7)
  {
    v9 = (void *)v7;
    v10 = [(_HKDateContentLayout *)self dateView];
    char v11 = [v10 isHidden];

    double v8 = v6;
    if ((v11 & 1) == 0)
    {
      v12 = [(_HKDateContentLayout *)self dateView];
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v4, v6);
      double v14 = v13;

      double v8 = v6 - v14;
      v15 = [(_HKDateContentLayout *)self dateView];
      objc_msgSend(v15, "setFrame:", 0.0, v6 - v14, v4, v14);
    }
  }
  uint64_t v16 = [(_HKDateContentLayout *)self contentView];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_HKDateContentLayout *)self contentView];
    char v19 = [v18 isHidden];

    if ((v19 & 1) == 0)
    {
      v20 = [(_HKDateContentLayout *)self contentView];
      objc_msgSend(v20, "systemLayoutSizeFittingSize:", v4, v6);
      double v22 = v21;

      if (v8 - v22 >= 0.0) {
        double v23 = v8 - v22;
      }
      else {
        double v23 = 0.0;
      }
      v24 = [(_HKDateContentLayout *)self contentView];
      objc_msgSend(v24, "setFrame:", 0.0, v23, v4, v8 - v23);
    }
  }
}

- (void)_invalidateLayout
{
  [(_HKDateContentLayout *)self invalidateIntrinsicContentSize];
  [(_HKDateContentLayout *)self setNeedsLayout];
}

- (double)_maximumViewWidth
{
  [(_HKDateContentLayout *)self bounds];
  double v4 = v3;
  double v5 = [(_HKDateContentLayout *)self dateView];

  if (v5)
  {
    double v6 = [(_HKDateContentLayout *)self dateView];
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    double v8 = v7;

    double v9 = fmax(v8, 0.0);
  }
  else
  {
    double v9 = 0.0;
  }
  v10 = [(_HKDateContentLayout *)self contentView];

  if (v10)
  {
    char v11 = [(_HKDateContentLayout *)self contentView];
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", 1.79769313e308, v4);
    double v13 = v12;

    if (v9 < v13) {
      double v9 = v13;
    }
  }
  double result = 1.0;
  if (v9 >= 1.0) {
    return v9;
  }
  return result;
}

- (double)_totalViewHeight
{
  [(_HKDateContentLayout *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(_HKDateContentLayout *)self dateView];
  double v6 = 0.0;
  if (v5)
  {
    double v7 = (void *)v5;
    double v8 = [(_HKDateContentLayout *)self dateView];
    char v9 = [v8 isHidden];

    if ((v9 & 1) == 0)
    {
      v10 = [(_HKDateContentLayout *)self dateView];
      objc_msgSend(v10, "systemLayoutSizeFittingSize:", v4, 1.79769313e308);
      double v12 = v11;

      double v6 = v12 + 0.0;
    }
  }
  uint64_t v13 = [(_HKDateContentLayout *)self contentView];
  if (v13)
  {
    double v14 = (void *)v13;
    v15 = [(_HKDateContentLayout *)self contentView];
    char v16 = [v15 isHidden];

    if ((v16 & 1) == 0)
    {
      v17 = [(_HKDateContentLayout *)self contentView];
      objc_msgSend(v17, "systemLayoutSizeFittingSize:", v4, 1.79769313e308);
      double v19 = v18;

      double v6 = v6 + v19;
    }
  }
  double result = 1.0;
  if (v6 >= 1.0) {
    return v6;
  }
  return result;
}

- (int64_t)_viewCount
{
  uint64_t v3 = [(_HKDateContentLayout *)self dateView];
  if (v3)
  {
    double v4 = (void *)v3;
    uint64_t v5 = [(_HKDateContentLayout *)self dateView];
    int64_t v6 = [v5 isHidden] ^ 1;
  }
  else
  {
    int64_t v6 = 0;
  }
  uint64_t v7 = [(_HKDateContentLayout *)self contentView];
  if (v7)
  {
    double v8 = (void *)v7;
    char v9 = [(_HKDateContentLayout *)self contentView];
    uint64_t v10 = [v9 isHidden] ^ 1;

    v6 += v10;
  }
  return v6;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)dateView
{
  return self->_dateView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end