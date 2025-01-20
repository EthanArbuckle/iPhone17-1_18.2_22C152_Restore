@interface GKCenteringScrollView
- (UIView)contentView;
- (UIView)footerView;
- (void)centerContentViewIfDesirable;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setFooterView:(id)a3;
@end

@implementation GKCenteringScrollView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKCenteringScrollView;
  [(GKCenteringScrollView *)&v3 layoutSubviews];
  [(GKCenteringScrollView *)self centerContentViewIfDesirable];
}

- (void)centerContentViewIfDesirable
{
  if (self->_contentView)
  {
    [(GKCenteringScrollView *)self bounds];
    CGFloat v4 = v3;
    double v6 = v5;
    CGFloat rect = v7;
    double v9 = v8;
    [(UIView *)self->_contentView frame];
    CGFloat v44 = v11;
    CGFloat v45 = v10;
    CGFloat v43 = v12;
    double v14 = v13;
    [(GKCenteringScrollView *)self contentInset];
    double v16 = v15;
    double v18 = v17;
    [(GKCenteringScrollView *)self safeAreaInsets];
    double v19 = v16 + v18;
    double v20 = v9 - (v16 + v18);
    if (v20 > v14)
    {
      UIRectCenteredYInRect();
      -[UIView setFrame:](self->_contentView, "setFrame:");
    }
    CGFloat v42 = v6;
    [(GKCenteringScrollView *)self contentSize];
    double v22 = v21;
    double v24 = v23;
    v25 = [(GKCenteringScrollView *)self contentView];
    [v25 frame];
    double v27 = v26;

    if (v22 > v27)
    {
      v28 = [(GKCenteringScrollView *)self contentView];
      [v28 frame];
      double v30 = v29;

      -[GKCenteringScrollView setContentSize:](self, "setContentSize:", v30, v24);
    }
    footerView = self->_footerView;
    if (footerView)
    {
      [(UIView *)footerView frame];
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      if (v20 <= v14)
      {
        v49.origin.y = v44;
        v49.origin.x = v45;
        v49.size.width = v43;
        v49.size.height = v14;
        double MaxY = CGRectGetMaxY(v49);
        double v39 = v37;
      }
      else
      {
        v48.origin.x = v4;
        v48.origin.y = v42;
        v48.size.width = rect;
        v48.size.height = v9;
        double MaxY = CGRectGetMaxY(v48);
        double v39 = v19 + v37;
      }
      v40 = self->_footerView;
      double v41 = MaxY - (v39 + 8.0);
      -[UIView setFrame:](v40, "setFrame:", v33, v41, v35, v37);
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end