@interface SCATPromptView
- (NSString)prompt;
- (void)_updatePromptBackdropViewMask;
- (void)layoutSubviews;
- (void)setPrompt:(id)a3;
@end

@implementation SCATPromptView

- (void)setPrompt:(id)a3
{
  id v16 = a3;
  v4 = [(SCATPromptView *)self prompt];
  unsigned __int8 v5 = [v4 isEqualToString:v16];

  v6 = v16;
  if ((v5 & 1) == 0)
  {
    if ([v16 length])
    {
      v7 = +[SCATStyleProvider sharedStyleProvider];
      if (!self->_backdropView)
      {
        v8 = (_UIBackdropView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithFrame:privateStyle:", objc_msgSend(v7, "pointPickerPromptBackdropStyle"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        backdropView = self->_backdropView;
        self->_backdropView = v8;

        [(SCATPromptView *)self insertSubview:self->_backdropView atIndex:0];
      }
      promptLabel = self->_promptLabel;
      if (!promptLabel)
      {
        v11 = (UILabel *)objc_alloc_init((Class)UILabel);
        v12 = self->_promptLabel;
        self->_promptLabel = v11;

        [(UILabel *)self->_promptLabel setTextAlignment:1];
        v13 = [v7 pointPickerPromptTextColor];
        [(UILabel *)self->_promptLabel setTextColor:v13];

        v14 = [v7 pointPickerPromptFont];
        [(UILabel *)self->_promptLabel setFont:v14];

        [(UILabel *)self->_promptLabel setNumberOfLines:0];
        [(SCATPromptView *)self addSubview:self->_promptLabel];
        promptLabel = self->_promptLabel;
      }
      [(UILabel *)promptLabel setText:v16];
      [(SCATPromptView *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)self->_promptLabel removeFromSuperview];
      v15 = self->_promptLabel;
      self->_promptLabel = 0;

      [(_UIBackdropView *)self->_backdropView removeFromSuperview];
      v7 = self->_backdropView;
      self->_backdropView = 0;
    }

    v6 = v16;
  }
}

- (NSString)prompt
{
  return [(UILabel *)self->_promptLabel text];
}

- (void)_updatePromptBackdropViewMask
{
  [(_UIBackdropView *)self->_backdropView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  v7 = +[UIScreen mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v26.width = v4;
  v26.height = v6;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v9);

  [(_UIBackdropView *)self->_backdropView bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = +[SCATStyleProvider sharedStyleProvider];
  [v18 pointPickerPromptCornerRadius];
  v20 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v19);
  [v20 fill];

  UIGraphicsGetImageFromCurrentImageContext();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v21 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v21 setGrayscaleTintMaskImage:v24];

  v22 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v22 setColorTintMaskImage:v24];

  v23 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v23 setFilterMaskImage:v24];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SCATPromptView;
  [(SCATPromptView *)&v20 layoutSubviews];
  if (self->_promptLabel)
  {
    [(SCATPromptView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = +[SCATStyleProvider sharedStyleProvider];
    [v11 pointPickerPromptPadding];
    double v13 = v12;

    -[UILabel sizeThatFits:](self->_promptLabel, "sizeThatFits:", v8 + v13 * -2.0, v10 + v13 * -2.0);
    double v15 = v14;
    double v17 = v16;
    CGFloat v18 = v4 + (v8 - v14) * 0.5;
    CGFloat v19 = v6 + v10 * 0.5 + (v10 * 0.5 - v16) * 0.5;
    v21.origin.x = v18;
    v21.origin.y = v19;
    v21.size.width = v15;
    v21.size.height = v17;
    CGRect v22 = CGRectIntegral(v21);
    -[UILabel setFrame:](self->_promptLabel, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    v23.size.width = v15 + v13 * 2.0;
    v23.size.height = v17 + v13 * 2.0;
    v23.origin.x = v18 - v13;
    v23.origin.y = v19 - v13;
    CGRect v24 = CGRectIntegral(v23);
    -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    [(SCATPromptView *)self _updatePromptBackdropViewMask];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_storeStrong((id *)&self->_promptLabel, 0);
}

@end