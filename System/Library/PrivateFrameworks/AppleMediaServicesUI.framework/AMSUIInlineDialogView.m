@interface AMSUIInlineDialogView
- (BOOL)_layoutHeightDependsOnWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_contentView;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (void)layoutSubviews;
@end

@implementation AMSUIInlineDialogView

- (id)_contentView
{
  v2 = [(AMSUIInlineDialogView *)self subviews];
  v3 = [v2 firstObject];

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIInlineDialogView;
  [(AMSUIInlineDialogView *)&v4 layoutSubviews];
  v3 = [(AMSUIInlineDialogView *)self _contentView];
  if (v3)
  {
    [(AMSUIInlineDialogView *)self bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(AMSUIInlineDialogView *)self _contentView];
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sizeThatFits:", width, height);
    double width = v7;
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  double v10 = width;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

@end