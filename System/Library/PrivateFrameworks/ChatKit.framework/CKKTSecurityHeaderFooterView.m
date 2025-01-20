@interface CKKTSecurityHeaderFooterView
+ (double)footerVerticalPadding;
+ (id)footerReuseIdentifier;
+ (id)headerReuseIdentifier;
+ (id)reuseIdentifier;
- (CKKTSecurityHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (UITextView)ktSecurityTextView;
- (void)layoutSubviews;
- (void)setKtSecurityTextView:(id)a3;
@end

@implementation CKKTSecurityHeaderFooterView

+ (id)headerReuseIdentifier
{
  return @"CKDetailsKTSecurityHeaderFooterView_reuseIdentifier_header";
}

+ (id)footerReuseIdentifier
{
  return @"CKDetailsKTSecurityHeaderFooterView_reuseIdentifier_footer";
}

+ (id)reuseIdentifier
{
  return @"CKDetailsKTSecurityHeaderFooterView_reuseIdentifier";
}

+ (double)footerVerticalPadding
{
  return 8.0;
}

- (CKKTSecurityHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKKTSecurityHeaderFooterView;
  return [(CKKTSecurityHeaderFooterView *)&v4 initWithReuseIdentifier:a3];
}

- (void)setKtSecurityTextView:(id)a3
{
  v5 = (UITextView *)a3;
  p_ktSecurityTextView = &self->_ktSecurityTextView;
  ktSecurityTextView = self->_ktSecurityTextView;
  if (ktSecurityTextView != v5)
  {
    v10 = v5;
    if (!ktSecurityTextView
      || ([(UITextView *)ktSecurityTextView removeFromSuperview],
          v8 = *p_ktSecurityTextView,
          *p_ktSecurityTextView = 0,
          v8,
          v5 = v10,
          !*p_ktSecurityTextView))
    {
      objc_storeStrong((id *)&self->_ktSecurityTextView, a3);
      v9 = [(CKKTSecurityHeaderFooterView *)self contentView];
      [v9 addSubview:*p_ktSecurityTextView];
      [(CKKTSecurityHeaderFooterView *)self setNeedsLayout];

      v5 = v10;
    }
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CKKTSecurityHeaderFooterView;
  [(CKKTSecurityHeaderFooterView *)&v23 layoutSubviews];
  v3 = [(CKKTSecurityHeaderFooterView *)self contentView];
  objc_super v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 theme];
  v6 = [v5 detailsHeaderFooterContentViewBackgroundColor];
  [v3 setBackgroundColor:v6];

  v7 = [(CKKTSecurityHeaderFooterView *)self backgroundView];
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 detailsHeaderFooterContentViewBackgroundColor];
  [v7 setBackgroundColor:v10];

  v11 = [(CKKTSecurityHeaderFooterView *)self contentView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [(CKKTSecurityHeaderFooterView *)self ktSecurityTextView];
  +[CKKTSecurityHeaderFooterView footerVerticalPadding];
  CGFloat v22 = v21;
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  CGRect v25 = CGRectInset(v24, 0.0, v22);
  objc_msgSend(v20, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
}

- (UITextView)ktSecurityTextView
{
  return self->_ktSecurityTextView;
}

- (void).cxx_destruct
{
}

@end