@interface AVTUserInfoView
+ (double)textVerticalPadding;
- (BOOL)isRegisteredForCategorySizeChange;
- (NSArray)activeConstraints;
- (NSDirectionalEdgeInsets)textInsets;
- (NSString)text;
- (UIColor)containerBackgroundColor;
- (UILabel)userInfoLabel;
- (UIVisualEffectView)userInfoEffectView;
- (void)_configure;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setActiveConstraints:(id)a3;
- (void)setContainerBackgroundColor:(id)a3;
- (void)setIsRegisteredForCategorySizeChange:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextInsets:(NSDirectionalEdgeInsets)a3;
- (void)setUserInfoEffectView:(id)a3;
- (void)setUserInfoLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation AVTUserInfoView

+ (double)textVerticalPadding
{
  return 8.0;
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)AVTUserInfoView;
  [(AVTUserInfoView *)&v7 didMoveToWindow];
  v3 = [(AVTUserInfoView *)self window];

  if (!v3)
  {
    v6 = [(AVTUserInfoView *)self window];

    if (v6) {
      return;
    }
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263F1D158] object:0];
    goto LABEL_8;
  }
  v4 = [(AVTUserInfoView *)self userInfoEffectView];

  if (!v4) {
    [(AVTUserInfoView *)self _configure];
  }
  if (![(AVTUserInfoView *)self isRegisteredForCategorySizeChange])
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
LABEL_8:

    [(AVTUserInfoView *)self setIsRegisteredForCategorySizeChange:v3 != 0];
  }
}

- (void)setContainerBackgroundColor:(id)a3
{
  if (self->_containerBackgroundColor != a3)
  {
    self->_containerBackgroundColor = (UIColor *)a3;
    userInfoEffectView = self->_userInfoEffectView;
    id v4 = a3;
    id v5 = [(UIVisualEffectView *)userInfoEffectView contentView];
    [v5 setBackgroundColor:v4];
  }
}

- (void)_configure
{
  *(_OWORD *)&self->_textInsets.top = xmmword_20AFF22B0;
  *(_OWORD *)&self->_textInsets.bottom = xmmword_20AFF22B0;
  id v18 = [MEMORY[0x263F1C480] effectWithBlurRadius:20.0];
  v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v18];
  id v4 = [(UIVisualEffectView *)v3 contentView];
  id v5 = [(AVTUserInfoView *)self containerBackgroundColor];
  if (v5)
  {
    [v4 setBackgroundColor:v5];
  }
  else
  {
    v6 = +[AVTUIColorRepository appBackgroundColor];
    [v4 setBackgroundColor:v6];
  }
  objc_super v7 = [(UIVisualEffectView *)v3 contentView];
  [v7 setAlpha:0.649999976];

  [(UIVisualEffectView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(UIVisualEffectView *)v3 layer];
  [v8 setMasksToBounds:1];

  userInfoEffectView = self->_userInfoEffectView;
  self->_userInfoEffectView = v3;
  v10 = v3;

  id v11 = objc_alloc(MEMORY[0x263F1C768]);
  v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[AVTUIColorRepository userInfoLabelColor];
  [(UILabel *)v12 setTextColor:v13];

  [(UILabel *)v12 setTextAlignment:1];
  [(UILabel *)v12 setNumberOfLines:2];
  [(UILabel *)v12 setAdjustsFontSizeToFitWidth:0];
  [(UILabel *)v12 setBaselineAdjustment:1];
  v14 = +[AVTUIFontRepository userInfoLabelFont];
  [(UILabel *)v12 setFont:v14];

  userInfoLabel = self->_userInfoLabel;
  self->_userInfoLabel = v12;
  v16 = v12;

  [(AVTUserInfoView *)self addSubview:v10];
  v17 = [(UIVisualEffectView *)v10 contentView];

  [v17 addSubview:v16];
  [(AVTUserInfoView *)self setUserInteractionEnabled:0];
  [(AVTUserInfoView *)self setNeedsUpdateConstraints];
}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  self->_textInsets = a3;
  [(AVTUserInfoView *)self setNeedsUpdateConstraints];
}

- (NSString)text
{
  v2 = [(AVTUserInfoView *)self userInfoLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTUserInfoView *)self userInfoLabel];
  [v5 setText:v4];

  [(AVTUserInfoView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v38[10] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)AVTUserInfoView;
  [(AVTUserInfoView *)&v37 updateConstraints];
  v3 = [(AVTUserInfoView *)self window];

  if (v3)
  {
    uint64_t v4 = [(AVTUserInfoView *)self activeConstraints];
    if (v4) {
      [MEMORY[0x263F08938] deactivateConstraints:v4];
    }
    [(AVTUserInfoView *)self centerYAnchor];
    v36 = v24 = (void *)v4;
    v35 = [(UIVisualEffectView *)self->_userInfoEffectView centerYAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v38[0] = v34;
    v33 = [(AVTUserInfoView *)self centerXAnchor];
    v32 = [(UIVisualEffectView *)self->_userInfoEffectView centerXAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v38[1] = v31;
    v30 = [(AVTUserInfoView *)self leadingAnchor];
    v29 = [(UIVisualEffectView *)self->_userInfoEffectView leadingAnchor];
    v28 = [v30 constraintLessThanOrEqualToAnchor:v29];
    v38[2] = v28;
    v27 = [(AVTUserInfoView *)self trailingAnchor];
    v26 = [(UIVisualEffectView *)self->_userInfoEffectView trailingAnchor];
    v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26];
    v38[3] = v25;
    v23 = [(AVTUserInfoView *)self topAnchor];
    v22 = [(UIVisualEffectView *)self->_userInfoEffectView topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v38[4] = v21;
    v20 = [(AVTUserInfoView *)self bottomAnchor];
    v19 = [(UIVisualEffectView *)self->_userInfoEffectView bottomAnchor];
    id v18 = [v20 constraintEqualToAnchor:v19];
    v38[5] = v18;
    v17 = [(UIVisualEffectView *)self->_userInfoEffectView topAnchor];
    v16 = [(UILabel *)self->_userInfoLabel topAnchor];
    v15 = [v17 constraintEqualToAnchor:v16 constant:-self->_textInsets.top];
    v38[6] = v15;
    v14 = [(UIVisualEffectView *)self->_userInfoEffectView bottomAnchor];
    id v5 = [(UILabel *)self->_userInfoLabel bottomAnchor];
    v6 = [v14 constraintEqualToAnchor:v5 constant:self->_textInsets.bottom];
    v38[7] = v6;
    objc_super v7 = [(UIVisualEffectView *)self->_userInfoEffectView leadingAnchor];
    v8 = [(UILabel *)self->_userInfoLabel leadingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:-self->_textInsets.leading];
    v38[8] = v9;
    v10 = [(UIVisualEffectView *)self->_userInfoEffectView trailingAnchor];
    id v11 = [(UILabel *)self->_userInfoLabel trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:self->_textInsets.trailing];
    v38[9] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:10];

    [MEMORY[0x263F08938] activateConstraints:v13];
    [(AVTUserInfoView *)self setActiveConstraints:v13];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AVTUserInfoView;
  [(AVTUserInfoView *)&v7 layoutSubviews];
  v3 = [(AVTUserInfoView *)self userInfoEffectView];
  [v3 bounds];
  CGFloat v4 = CGRectGetHeight(v8) * 0.5;
  id v5 = [(AVTUserInfoView *)self userInfoEffectView];
  v6 = [v5 layer];
  [v6 setCornerRadius:v4];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v5 = +[AVTUIFontRepository userInfoLabelFont];
  CGFloat v4 = [(AVTUserInfoView *)self userInfoLabel];
  [v4 setFont:v5];
}

- (NSDirectionalEdgeInsets)textInsets
{
  double top = self->_textInsets.top;
  double leading = self->_textInsets.leading;
  double bottom = self->_textInsets.bottom;
  double trailing = self->_textInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIColor)containerBackgroundColor
{
  return self->_containerBackgroundColor;
}

- (BOOL)isRegisteredForCategorySizeChange
{
  return self->_isRegisteredForCategorySizeChange;
}

- (void)setIsRegisteredForCategorySizeChange:(BOOL)a3
{
  self->_isRegisteredForCategorySizeChange = a3;
}

- (UIVisualEffectView)userInfoEffectView
{
  return self->_userInfoEffectView;
}

- (void)setUserInfoEffectView:(id)a3
{
}

- (UILabel)userInfoLabel
{
  return self->_userInfoLabel;
}

- (void)setUserInfoLabel:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_userInfoLabel, 0);
  objc_storeStrong((id *)&self->_userInfoEffectView, 0);
}

@end