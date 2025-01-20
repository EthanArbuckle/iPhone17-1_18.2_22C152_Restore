@interface SRTapToEditView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRTapToEditView)initWithFrame:(CGRect)a3;
- (double)_circleToLabelHeightDifference;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)_setHighlighted:(BOOL)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SRTapToEditView

- (SRTapToEditView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SRTapToEditView;
  v3 = -[SRTapToEditView initWithFrame:](&v29, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tapToEditLabel = v3->_tapToEditLabel;
    v3->_tapToEditLabel = v5;

    v7 = v3->_tapToEditLabel;
    v8 = +[UIFont siriui_serverUtteranceCorrectionPromptFont];
    [(UILabel *)v7 setFont:v8];

    v9 = v3->_tapToEditLabel;
    v10 = +[UIColor siriui_tapToEditColor];
    [(UILabel *)v9 setTextColor:v10];

    v11 = v3->_tapToEditLabel;
    v12 = [v4 siriUILocalizedStringForKey:@"TAP_TO_EDIT" table:0];
    [(UILabel *)v11 setText:v12];

    [(UILabel *)v3->_tapToEditLabel sizeToFit];
    [(SRTapToEditView *)v3 addSubview:v3->_tapToEditLabel];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = +[UIImage imageNamed:@"Circle" inBundle:v13];
    v15 = [v14 imageWithRenderingMode:2];

    uint64_t v16 = +[SiriUIContentButton buttonWithImageTemplate:v15 style:0];
    circleButton = v3->_circleButton;
    v3->_circleButton = (SiriUIContentButton *)v16;

    [(SiriUIContentButton *)v3->_circleButton setUserInteractionEnabled:0];
    [(SiriUIContentButton *)v3->_circleButton setAlpha:0.12];
    [(SiriUIContentButton *)v3->_circleButton sizeToFit];
    [(SRTapToEditView *)v3 addSubview:v3->_circleButton];
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = +[UIImage imageNamed:@"Chevron" inBundle:v18];
    v20 = [v19 imageWithRenderingMode:2];

    if (SiriLanguageIsRTL())
    {
      uint64_t v21 = [v20 imageWithHorizontallyFlippedOrientation];

      v20 = (void *)v21;
    }
    uint64_t v22 = +[SiriUIContentButton buttonWithImageTemplate:v20 style:0];
    chevronButton = v3->_chevronButton;
    v3->_chevronButton = (SiriUIContentButton *)v22;

    [(SiriUIContentButton *)v3->_chevronButton setUserInteractionEnabled:0];
    v24 = v3->_chevronButton;
    v25 = +[UIColor siriui_tapToEditColor];
    [(SiriUIContentButton *)v24 setDefaultColorForTemplate:v25];

    v26 = v3->_chevronButton;
    v27 = +[UIColor siriui_tapToEditMaskingColor];
    [(SiriUIContentButton *)v26 setHighlightColorForTemplate:v27];

    [(SiriUIContentButton *)v3->_chevronButton sizeToFit];
    [(SRTapToEditView *)v3 addSubview:v3->_chevronButton];
    [(SiriUIContentButton *)v3->_chevronButton siriui_setBlendEffectEnabled:1];
    [(UILabel *)v3->_tapToEditLabel siriui_setBlendEffectEnabled:1];
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_tapToEditLabel, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8 + 10.0;
  -[SiriUIContentButton sizeThatFits:](self->_circleButton, "sizeThatFits:", width, height);
  double v12 = v9 + v11;
  if (v7 >= v10) {
    double v10 = v7;
  }
  result.double height = v10;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)SRTapToEditView;
  [(SRTapToEditView *)&v30 layoutSubviews];
  circleButton = self->_circleButton;
  [(SRTapToEditView *)self bounds];
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  tapToEditLabel = self->_tapToEditLabel;
  [(SRTapToEditView *)self bounds];
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v17 = v9 - v15;
  v18 = +[UIScreen mainScreen];
  [v18 scale];
  double v20 = v19;

  double v21 = v17 * -0.5;
  double v22 = floor(v17 * -0.5);
  if (v20 < 2.0) {
    double v21 = v22;
  }
  double v23 = 0.0;
  double v24 = v17 * 0.5;
  double v25 = floor(v17 * 0.5);
  if (v20 < 2.0) {
    double v24 = v25;
  }
  BOOL v26 = v17 <= 0.0;
  if (v17 > 0.0) {
    double v27 = v24;
  }
  else {
    double v27 = 0.0;
  }
  if (v26) {
    double v28 = v21;
  }
  else {
    double v28 = 0.0;
  }
  if (SiriLanguageIsRTL())
  {
    double v29 = 0.0;
    v31.origin.x = 0.0;
    v31.origin.y = v28;
    v31.size.double width = v7;
    v31.size.double height = v9;
    double v23 = CGRectGetWidth(v31) + 10.0;
  }
  else
  {
    v32.origin.x = 0.0;
    v32.origin.y = v27;
    v32.size.double width = v14;
    v32.size.double height = v16;
    double v29 = CGRectGetWidth(v32) + 10.0;
  }
  -[UILabel setFrame:](self->_tapToEditLabel, "setFrame:", v23, v27, v14, v16);
  -[SiriUIContentButton setFrame:](self->_circleButton, "setFrame:", v29, v28, v7, v9);
  -[SiriUIContentButton setFrame:](self->_chevronButton, "setFrame:", v29, v28, v7, v9);
}

- (double)firstLineBaselineOffsetFromTop
{
  [(SRTapToEditView *)self _circleToLabelHeightDifference];
  double v4 = v3;
  double v5 = [(UILabel *)self->_tapToEditLabel font];
  [v5 ascender];
  double v7 = v6;

  double v8 = v4 * 0.5;
  if (v4 <= 0.0) {
    double v8 = -0.0;
  }
  return v8 + v7;
}

- (double)baselineOffsetFromBottom
{
  [(SRTapToEditView *)self _circleToLabelHeightDifference];
  double v4 = v3;
  double v5 = [(UILabel *)self->_tapToEditLabel font];
  [v5 descender];
  double v7 = v6;
  double v8 = -v6;

  double result = v4 * 0.5 - v7;
  if (v4 <= 0.0) {
    return v8;
  }
  return result;
}

- (void)_setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  tapToEditLabel = self->_tapToEditLabel;
  if (a3) {
    +[UIColor siriui_tapToEditMaskingColor];
  }
  else {
  double v6 = +[UIColor siriui_tapToEditColor];
  }
  [(UILabel *)tapToEditLabel setTextColor:v6];

  [(SiriUIContentButton *)self->_circleButton setHighlighted:v3];
  chevronButton = self->_chevronButton;

  [(SiriUIContentButton *)chevronButton setHighlighted:v3];
}

- (double)_circleToLabelHeightDifference
{
  circleButton = self->_circleButton;
  [(SRTapToEditView *)self bounds];
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  double v7 = v6;
  tapToEditLabel = self->_tapToEditLabel;
  [(SRTapToEditView *)self bounds];
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v9, v10);
  return v7 - v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronButton, 0);
  objc_storeStrong((id *)&self->_circleButton, 0);

  objc_storeStrong((id *)&self->_tapToEditLabel, 0);
}

@end