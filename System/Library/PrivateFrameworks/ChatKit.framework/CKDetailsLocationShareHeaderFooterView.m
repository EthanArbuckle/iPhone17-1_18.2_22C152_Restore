@interface CKDetailsLocationShareHeaderFooterView
+ (id)reuseIdentifier;
- (UITextView)locationSharingTextView;
- (void)layoutSubviews;
- (void)setLocationSharingTextView:(id)a3;
@end

@implementation CKDetailsLocationShareHeaderFooterView

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = CKDetailsLocationShareHeaderFooterView;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  v3 = [(CKDetailsLocationShareHeaderFooterView *)self contentView];
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 theme];
  v6 = [v5 detailsHeaderFooterContentViewBackgroundColor];
  [v3 setBackgroundColor:v6];

  v7 = [(CKDetailsLocationShareHeaderFooterView *)self backgroundView];
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
  [v7 setBackgroundColor:v10];

  v11 = [(CKDetailsLocationShareHeaderFooterView *)self contentView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [(CKDetailsLocationShareHeaderFooterView *)self locationSharingTextView];
  v21 = [(CKDetailsLocationShareHeaderFooterView *)self contentView];
  [v21 layoutMargins];
  double v23 = v22;
  double v25 = v24;

  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v31) - (v23 + v25), 1.79769313e308);
  double v27 = v26;
  double v29 = v28;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection])
  {
    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    double v27 = CGRectGetWidth(v32) - (v23 + v25);
    double v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, 8.0, v27, v29);
}

+ (id)reuseIdentifier
{
  return @"CKDetailsLocationShareHeaderFooterView_reuseIdentifier";
}

- (void)setLocationSharingTextView:(id)a3
{
  id v7 = a3;
  if (self->_locationSharingTextView)
  {
    v5 = [(CKDetailsLocationShareHeaderFooterView *)self locationSharingTextView];
    [v5 removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_locationSharingTextView, a3);
  v6 = [(CKDetailsLocationShareHeaderFooterView *)self contentView];
  [v6 addSubview:self->_locationSharingTextView];

  [(CKDetailsLocationShareHeaderFooterView *)self setNeedsLayout];
}

- (UITextView)locationSharingTextView
{
  return self->_locationSharingTextView;
}

- (void).cxx_destruct
{
}

@end