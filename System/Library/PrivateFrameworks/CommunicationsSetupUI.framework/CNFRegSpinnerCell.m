@interface CNFRegSpinnerCell
- (CNFRegSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation CNFRegSpinnerCell

- (CNFRegSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNFRegSpinnerCell;
  v4 = [(CNFRegSpinnerCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v5;

    [(UIActivityIndicatorView *)v4->_activityIndicator startAnimating];
    v7 = [(CNFRegSpinnerCell *)v4 contentView];
    [v7 addSubview:v4->_activityIndicator];

    [(CNFRegSpinnerCell *)v4 setNeedsLayout];
  }
  return v4;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = CNFRegSpinnerCell;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  v3 = [(CNFRegSpinnerCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  rect.origin.x = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UIActivityIndicatorView *)self->_activityIndicator frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double MidX = CGRectGetMidX(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  CGFloat v21 = MidX - CGRectGetWidth(v25) * 0.5;
  v26.origin.x = rect.origin.x;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  double MidY = CGRectGetMidY(v26);
  v27.origin.x = v21;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v21, MidY - CGRectGetHeight(v27) * 0.5, v17, v19);
}

- (void).cxx_destruct
{
}

@end