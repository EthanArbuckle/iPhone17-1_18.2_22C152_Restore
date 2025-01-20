@interface DockedHeaderView
- (DockedHeaderView)initWithFrame:(CGRect)a3;
- (MUIGradientView)bottomExtensionView;
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)contentView;
- (double)bottomInset;
- (double)cornerRadius;
- (id)backgroundColor;
- (void)_createPrimaryViews;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBottomExtensionView:(id)a3;
- (void)setBottomInset:(double)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation DockedHeaderView

- (DockedHeaderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DockedHeaderView;
  v3 = -[DockedHeaderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DockedHeaderView *)v3 setOpaque:0];
    v5 = +[UIColor clearColor];
    [(DockedHeaderView *)v4 setBackgroundColor:v5];

    v6 = [(DockedHeaderView *)v4 layer];
    [v6 setAllowsGroupOpacity:1];

    [(DockedHeaderView *)v4 _createPrimaryViews];
  }
  return v4;
}

- (void)_createPrimaryViews
{
  id v3 = objc_alloc((Class)UIView);
  [(DockedHeaderView *)self bounds];
  id v13 = [v3 initWithFrame:];
  -[DockedHeaderView setBackgroundView:](self, "setBackgroundView:");

  id v14 = [(DockedHeaderView *)self backgroundView];
  [v14 setAutoresizingMask:18];

  id v15 = [(DockedHeaderView *)self backgroundView];
  v4 = [v15 layer];
  [v4 setMaskedCorners:3];

  id v16 = [(DockedHeaderView *)self backgroundView];
  [v16 setUserInteractionEnabled:0];

  id v17 = [(DockedHeaderView *)self backgroundView];
  v5 = [v17 layer];
  [v5 setAllowsGroupOpacity:1];

  id v18 = [(DockedHeaderView *)self backgroundView];
  -[DockedHeaderView addSubview:](self, "addSubview:");

  id v6 = objc_alloc((Class)UIView);
  [(DockedHeaderView *)self bounds];
  id v19 = [v6 initWithFrame:];
  -[DockedHeaderView setContentView:](self, "setContentView:");

  id v20 = [(DockedHeaderView *)self contentView];
  v7 = [v20 layer];
  [v7 setAllowsGroupOpacity:1];

  id v21 = [(DockedHeaderView *)self contentView];
  -[DockedHeaderView addSubview:](self, "addSubview:");

  id v8 = objc_alloc((Class)UILabel);
  id v22 = [(DockedHeaderView *)self contentView];
  [v22 bounds];
  id v9 = [v8 initWithFrame:];
  [(DockedHeaderView *)self setTitleLabel:v9];

  id v23 = +[UIFont boldSystemFontOfSize:17.0];
  v10 = [(DockedHeaderView *)self titleLabel];
  [v10 setFont:v23];

  id v24 = [(DockedHeaderView *)self titleLabel];
  [v24 setTextAlignment:1];

  id v25 = [(DockedHeaderView *)self titleLabel];
  [v25 setAutoresizingMask:18];

  id v26 = [(DockedHeaderView *)self titleLabel];
  v11 = [v26 layer];
  [v11 setAllowsGroupOpacity:1];

  id v27 = [(DockedHeaderView *)self contentView];
  v12 = [(DockedHeaderView *)self titleLabel];
  [v27 addSubview:v12];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    id v5 = [(DockedHeaderView *)self backgroundView];
    [v5 _setContinuousCornerRadius:a3];

    id v6 = [(DockedHeaderView *)self backgroundView];
    [v6 setClipsToBounds:1];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)DockedHeaderView;
  [(DockedHeaderView *)&v15 layoutSubviews];
  [(DockedHeaderView *)self safeAreaInsets];
  double v4 = v3;
  [(DockedHeaderView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(DockedHeaderView *)self layoutMargins];
  double v10 = v6 + v9;
  double v12 = v8 - (v9 + v11);
  [(DockedHeaderView *)self bounds];
  CGFloat v13 = CGRectGetHeight(v16) - v4;
  id v14 = [(DockedHeaderView *)self contentView];
  [v14 setFrame:v10, 0.0, v12, v13];
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    double v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    double v6 = [(DockedHeaderView *)self titleLabel];
    [v6 setText:v7];
  }
}

- (id)backgroundColor
{
  v2 = [(DockedHeaderView *)self backgroundView];
  double v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  double v4 = [(DockedHeaderView *)self backgroundView];
  [v4 setBackgroundColor:v5];
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (MUIGradientView)bottomExtensionView
{
  return self->_bottomExtensionView;
}

- (void)setBottomExtensionView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomExtensionView, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end