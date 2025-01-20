@interface CKDetailsExpanseActivityHeaderView
+ (id)reuseIdentifier;
- (UITextView)expanseActivityTextView;
- (void)layoutSubviews;
- (void)setExpanseActivityTextView:(id)a3;
@end

@implementation CKDetailsExpanseActivityHeaderView

+ (id)reuseIdentifier
{
  return @"CKDetailsExpanseActivityHeaderView_reuseIdentifier";
}

- (void)setExpanseActivityTextView:(id)a3
{
  v5 = (UITextView *)a3;
  if (self->_expanseActivityTextView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_expanseActivityTextView, a3);
    v6 = [(CKDetailsExpanseActivityHeaderView *)self contentView];
    [v6 addSubview:self->_expanseActivityTextView];

    [(CKDetailsExpanseActivityHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CKDetailsExpanseActivityHeaderView;
  [(CKDetailsExpanseActivityHeaderView *)&v36 layoutSubviews];
  v3 = [(CKDetailsExpanseActivityHeaderView *)self contentView];
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 theme];
  v6 = [v5 detailsHeaderFooterContentViewBackgroundColor];
  [v3 setBackgroundColor:v6];

  v7 = [(CKDetailsExpanseActivityHeaderView *)self backgroundView];
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
  [v7 setBackgroundColor:v10];

  v11 = [(CKDetailsExpanseActivityHeaderView *)self contentView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [(CKDetailsExpanseActivityHeaderView *)self expanseActivityTextView];
  double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v21 = [(CKDetailsExpanseActivityHeaderView *)self contentView];
  [v21 layoutMargins];
  double v23 = v22;
  double v25 = v24;

  CGFloat v33 = v15;
  CGFloat v34 = v13;
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v37) - (v23 + v25), 1.79769313e308);
  double v27 = v26;
  double v29 = v28;
  v30 = +[CKUIBehavior sharedBehaviors];
  [v30 detailsExpanseActivityDescriptionVerticalPadding];
  double v32 = v31;

  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection])
  {
    v38.origin.y = v33;
    v38.origin.x = v34;
    v38.size.width = v17;
    v38.size.height = v19;
    double v27 = CGRectGetWidth(v38) - (v23 + v25);
    double v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, v35, v27, v29 + v32);
}

- (UITextView)expanseActivityTextView
{
  return self->_expanseActivityTextView;
}

- (void).cxx_destruct
{
}

@end