@interface CKBrowserSwitcherFooterAccessoryCell
+ (id)reuseIdentifier;
+ (id)supplementryViewKind;
- (CKBrowserSwitcherFooterAccessoryCell)initWithFrame:(CGRect)a3;
- (UIView)seperatorView;
- (double)maxHeight;
- (double)minHeight;
- (void)layoutSubviews;
- (void)setMaxHeight:(double)a3;
- (void)setMinHeight:(double)a3;
- (void)setSeperatorView:(id)a3;
@end

@implementation CKBrowserSwitcherFooterAccessoryCell

+ (id)supplementryViewKind
{
  return @"CKBrowserSwitcherFooterAccessoryCellKind";
}

+ (id)reuseIdentifier
{
  return @"CKBrowserSwitcherFooterAccesssoryReuseIdentifier";
}

- (CKBrowserSwitcherFooterAccessoryCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherFooterAccessoryCell;
  v3 = -[CKBrowserSwitcherFooterAccessoryCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 theme];
    v8 = [v7 browserAppStripSeperatorBackgroundColor];
    [v5 setBackgroundColor:v8];

    [(CKBrowserSwitcherFooterAccessoryCell *)v3 addSubview:v5];
    [(CKBrowserSwitcherFooterAccessoryCell *)v3 setSeperatorView:v5];
  }
  return v3;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)CKBrowserSwitcherFooterAccessoryCell;
  [(CKBrowserSwitcherFooterAccessoryCell *)&v25 layoutSubviews];
  [(CKBrowserSwitcherFooterAccessoryCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKBrowserSwitcherFooterAccessoryCell *)self seperatorView];
  [(CKBrowserSwitcherFooterAccessoryCell *)self bringSubviewToFront:v11];

  v12 = [(CKBrowserSwitcherFooterAccessoryCell *)self seperatorView];
  v13 = [v12 layer];
  [v13 setCornerRadius:v8];

  v14 = [(CKBrowserSwitcherFooterAccessoryCell *)self seperatorView];
  v15 = [v14 layer];
  [v15 setMasksToBounds:1];

  [(CKBrowserSwitcherFooterAccessoryCell *)self minHeight];
  double v17 = v16;
  [(CKBrowserSwitcherFooterAccessoryCell *)self maxHeight];
  if (v10 >= (v17 + v18) * 0.5) {
    double v19 = 8.0;
  }
  else {
    double v19 = 6.0;
  }
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  CGRect v27 = CGRectInset(v26, 0.0, v19);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  v24 = [(CKBrowserSwitcherFooterAccessoryCell *)self seperatorView];
  objc_msgSend(v24, "setFrame:", x, y, width, height);
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (UIView)seperatorView
{
  return self->_seperatorView;
}

- (void)setSeperatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end