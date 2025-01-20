@interface CNContactListSectionHeaderFooterView
- (UIVisualEffectView)visualEffectView;
- (void)layoutSubviews;
- (void)setVisualEffectView:(id)a3;
@end

@implementation CNContactListSectionHeaderFooterView

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CNContactListSectionHeaderFooterView;
  [(CNContactListSectionHeaderFooterView *)&v19 layoutSubviews];
  [(CNContactListSectionHeaderFooterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = +[CNContactStyle currentStyle];
  int v12 = [v11 usesInsetPlatterStyle];

  if (v12)
  {
    v20.origin.double x = v4;
    v20.origin.double y = v6;
    v20.size.double width = v8;
    v20.size.double height = v10;
    CGRect v21 = CGRectInset(v20, 8.0, 0.0);
    double x = v21.origin.x;
    double y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    v17 = [(CNContactListSectionHeaderFooterView *)self backgroundView];
    objc_msgSend(v17, "setFrame:", x, y, width, height);

    v18 = [(CNContactListSectionHeaderFooterView *)self backgroundView];
    [v18 _setContinuousCornerRadius:8.0];
  }
}

- (void).cxx_destruct
{
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

@end