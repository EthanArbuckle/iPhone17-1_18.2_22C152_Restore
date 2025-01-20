@interface _SFAutoFillInputViewButton
- (void)layoutSubviews;
@end

@implementation _SFAutoFillInputViewButton

- (void)layoutSubviews
{
  [(_SFAutoFillInputViewButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_SFAutoFillInputViewButton *)self layoutMargins];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  double Width = CGRectGetWidth(v23);
  v20 = [(_SFAutoFillInputViewButton *)self titleLabel];
  [v20 setPreferredMaxLayoutWidth:Width];

  v22.receiver = self;
  v22.super_class = (Class)_SFAutoFillInputViewButton;
  [(_SFAutoFillInputViewButton *)&v22 layoutSubviews];
  v21 = [(_SFAutoFillInputViewButton *)self titleLabel];
  objc_msgSend(v21, "setFrame:", v12, v14, v16, v18);
}

@end