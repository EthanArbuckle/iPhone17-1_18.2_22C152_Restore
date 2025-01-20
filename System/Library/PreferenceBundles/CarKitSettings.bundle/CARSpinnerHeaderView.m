@interface CARSpinnerHeaderView
- (BOOL)isAnimating;
- (CARSpinnerHeaderView)initWithSpecifier:(id)a3;
- (NSString)title;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)titleLabel;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setSpinnerView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation CARSpinnerHeaderView

- (CARSpinnerHeaderView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CARSpinnerHeaderView;
  v5 = [(CARSpinnerHeaderView *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(CARSpinnerHeaderView *)v5 setAutoresizingMask:2];
    v7 = [v4 name];
    v8 = +[NSLocale currentLocale];
    v9 = [v7 uppercaseStringWithLocale:v8];

    id v10 = objc_alloc_init((Class)UILabel);
    v11 = +[UITableViewHeaderFooterView _defaultFontForTableViewStyle:1 isSectionHeader:1];
    [v10 setFont:v11];

    v12 = +[UITableViewHeaderFooterView _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
    [v10 setColor:v12];

    [v10 setText:v9];
    [(CARSpinnerHeaderView *)v6 setTitleLabel:v10];
    v16.receiver = v6;
    v16.super_class = (Class)CARSpinnerHeaderView;
    [(CARSpinnerHeaderView *)&v16 addSubview:v10];
    id v13 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(CARSpinnerHeaderView *)v6 setSpinnerView:v13];
    v15.receiver = v6;
    v15.super_class = (Class)CARSpinnerHeaderView;
    [(CARSpinnerHeaderView *)&v15 addSubview:v13];
  }
  return v6;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  v6 = [(CARSpinnerHeaderView *)self titleLabel];
  v7 = +[NSLocale currentLocale];
  v8 = [v5 uppercaseStringWithLocale:v7];

  [v6 setText:v8];

  [(CARSpinnerHeaderView *)self setNeedsLayout];
}

- (double)preferredHeightForWidth:(double)a3
{
  v3 = [(CARSpinnerHeaderView *)self spinnerView];
  [v3 frame];
  double v5 = v4 + 24.0;

  return v5;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CARSpinnerHeaderView;
  [(CARSpinnerHeaderView *)&v26 layoutSubviews];
  v3 = [(CARSpinnerHeaderView *)self titleLabel];
  [v3 sizeToFit];

  double v4 = [(CARSpinnerHeaderView *)self titleLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  v9 = [(CARSpinnerHeaderView *)self spinnerView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  v14 = [(CARSpinnerHeaderView *)self superview];
  [v14 layoutMargins];
  double v16 = v15;
  double v18 = v17;

  if ([UIApp userInterfaceLayoutDirection])
  {
    [(CARSpinnerHeaderView *)self bounds];
    double v16 = v19 - v18 - v6;
  }
  [(CARSpinnerHeaderView *)self frame];
  double v21 = v20 - v8 + -6.0;
  if ([UIApp userInterfaceLayoutDirection]) {
    double v22 = v16 + -10.0 - v11;
  }
  else {
    double v22 = v6 + v16 + 10.0;
  }
  v27.origin.x = v16;
  v27.origin.y = v21;
  v27.size.width = v6;
  v27.size.height = v8;
  CGFloat v23 = CGRectGetMidY(v27) + v13 * -0.5;
  v24 = [(CARSpinnerHeaderView *)self titleLabel];
  v28.origin.x = v16;
  v28.origin.y = v21;
  v28.size.width = v6;
  v28.size.height = v8;
  CGRect v29 = CGRectIntegral(v28);
  objc_msgSend(v24, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);

  v25 = [(CARSpinnerHeaderView *)self spinnerView];
  v30.origin.x = v22;
  v30.origin.y = v23;
  v30.size.width = v11;
  v30.size.height = v13;
  CGRect v31 = CGRectIntegral(v30);
  objc_msgSend(v25, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void)startAnimating
{
  id v2 = [(CARSpinnerHeaderView *)self spinnerView];
  [v2 startAnimating];
}

- (void)stopAnimating
{
  id v2 = [(CARSpinnerHeaderView *)self spinnerView];
  [v2 stopAnimating];
}

- (BOOL)isAnimating
{
  id v2 = [(CARSpinnerHeaderView *)self spinnerView];
  unsigned __int8 v3 = [v2 isAnimating];

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end