@interface CKDetailsSharedWithYouHeaderFooterView
+ (double)bottomPadding;
+ (double)topPadding;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UITextView)sharedWithYouTextView;
- (void)layoutSubviews;
- (void)setSharedWithYouTextView:(id)a3;
@end

@implementation CKDetailsSharedWithYouHeaderFooterView

+ (id)reuseIdentifier
{
  return @"CKDetailsSharedWithYouHeaderFooterView_reuseIdentifier";
}

- (void)setSharedWithYouTextView:(id)a3
{
  id v5 = a3;
  if (!self->_sharedWithYouTextView)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_sharedWithYouTextView, a3);
    v6 = [(CKDetailsSharedWithYouHeaderFooterView *)self contentView];
    [v6 addSubview:self->_sharedWithYouTextView];

    [(CKDetailsSharedWithYouHeaderFooterView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (void)layoutSubviews
{
  *(void *)&rect.size.width = self;
  *(void *)&rect.size.height = CKDetailsSharedWithYouHeaderFooterView;
  [(CGSize *)(objc_super *)&rect.size layoutSubviews];
  v3 = [(CKDetailsSharedWithYouHeaderFooterView *)self contentView];
  v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 theme];
  v6 = [v5 detailsHeaderFooterContentViewBackgroundColor];
  [v3 setBackgroundColor:v6];

  id v7 = [(CKDetailsSharedWithYouHeaderFooterView *)self backgroundView];
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
  [v7 setBackgroundColor:v10];

  v11 = [(CKDetailsSharedWithYouHeaderFooterView *)self contentView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [(CKDetailsSharedWithYouHeaderFooterView *)self sharedWithYouTextView];
  v21 = [(CKDetailsSharedWithYouHeaderFooterView *)self contentView];
  [v21 layoutMargins];
  double v23 = v22;
  double v25 = v24;

  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v32) - (v23 + v25), 1.79769313e308);
  double v27 = v26;
  rect.origin.y = v28;
  [(id)objc_opt_class() topPadding];
  double v30 = v29;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection])
  {
    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    double v27 = CGRectGetWidth(v33) - (v23 + v25);
    double v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, v30, v27, rect.origin.y, *(void *)&v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CKDetailsSharedWithYouHeaderFooterView *)self sharedWithYouTextView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  [(id)objc_opt_class() topPadding];
  double v11 = v10;
  [(id)objc_opt_class() bottomPadding];
  double v13 = v9 + v11 + v12;
  double v14 = v7;
  result.double height = v13;
  result.double width = v14;
  return result;
}

+ (double)topPadding
{
  return 8.0;
}

+ (double)bottomPadding
{
  v2 = +[CKUIBehavior sharedBehaviors];
  if ([v2 isAccessibilityPreferredContentSizeCategory]) {
    double v3 = 16.0;
  }
  else {
    double v3 = 8.0;
  }

  return v3;
}

- (UITextView)sharedWithYouTextView
{
  return self->_sharedWithYouTextView;
}

- (void).cxx_destruct
{
}

@end