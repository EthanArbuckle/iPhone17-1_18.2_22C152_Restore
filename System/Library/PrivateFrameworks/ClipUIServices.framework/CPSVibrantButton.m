@interface CPSVibrantButton
- (CPSVibrantButton)initWithButtonType:(int64_t)a3;
- (UIButton)uiButton;
- (void)setAdjustFontSizeToFitWidth:(BOOL)a3;
- (void)updateCornerRadius;
@end

@implementation CPSVibrantButton

- (CPSVibrantButton)initWithButtonType:(int64_t)a3
{
  v40[8] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)CPSVibrantButton;
  v4 = -[CPSVibrantButton initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F43028]);
    v6 = [MEMORY[0x1E4F427D8] effectWithStyle:10];
    uint64_t v7 = [v5 initWithEffect:v6];
    effectView = v4->_effectView;
    v4->_effectView = (UIVisualEffectView *)v7;

    [(UIVisualEffectView *)v4->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v9 = [MEMORY[0x1E4F427E0] buttonWithType:a3];
    button = v4->_button;
    v4->_button = (UIButton *)v9;

    [(UIButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSVibrantButton *)v4 addSubview:v4->_effectView];
    [(CPSVibrantButton *)v4 addSubview:v4->_button];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(UIVisualEffectView *)v4->_effectView leadingAnchor];
    v37 = [(CPSVibrantButton *)v4 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v40[0] = v36;
    v35 = [(UIVisualEffectView *)v4->_effectView bottomAnchor];
    v34 = [(CPSVibrantButton *)v4 bottomAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v40[1] = v33;
    v32 = [(UIVisualEffectView *)v4->_effectView topAnchor];
    v31 = [(CPSVibrantButton *)v4 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v40[2] = v30;
    v28 = [(UIVisualEffectView *)v4->_effectView trailingAnchor];
    v27 = [(CPSVibrantButton *)v4 trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v40[3] = v26;
    v25 = [(UIButton *)v4->_button leadingAnchor];
    v24 = [(UIVisualEffectView *)v4->_effectView leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v40[4] = v23;
    v22 = [(UIButton *)v4->_button bottomAnchor];
    v11 = [(CPSVibrantButton *)v4 bottomAnchor];
    v12 = [v22 constraintEqualToAnchor:v11];
    v40[5] = v12;
    v13 = [(UIButton *)v4->_button topAnchor];
    v14 = [(CPSVibrantButton *)v4 topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v40[6] = v15;
    v16 = [(UIButton *)v4->_button trailingAnchor];
    v17 = [(CPSVibrantButton *)v4 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v40[7] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:8];
    [v29 activateConstraints:v19];

    v20 = v4;
  }

  return v4;
}

- (void)updateCornerRadius
{
  [(CPSVibrantButton *)self layoutIfNeeded];
  UIButtonType v3 = [(UIButton *)self->_button buttonType];
  double v4 = 10.0;
  if (v3 == UIButtonTypeClose)
  {
    [(CPSVibrantButton *)self bounds];
    double v4 = CGRectGetWidth(v7) * 0.5;
  }
  effectView = self->_effectView;

  [(UIVisualEffectView *)effectView _setContinuousCornerRadius:v4];
}

- (UIButton)uiButton
{
  return self->_button;
}

- (void)setAdjustFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIButton *)self->_button titleLabel];
  [v4 setAdjustsFontSizeToFitWidth:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_effectView, 0);
}

@end