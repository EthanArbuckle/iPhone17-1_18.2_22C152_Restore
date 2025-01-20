@interface ARCoachingButton
- (ARCoachingButton)initWithButton:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 largeImageInsets:(UIEdgeInsets)a7;
- (ARCoachingButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6;
- (ARCoachingButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7;
- (ARCoachingControlBlurredBackgroundView)blurredBackgroundView;
- (ARCoachingWrappedButton)button;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)title;
- (UIColor)black35PercentColor;
- (UIColor)black70PercentColor;
- (UIColor)blue100PercentColor;
- (UIColor)blue50PercentColor;
- (UIColor)white100PercentColor;
- (UIColor)white26PercentColor;
- (UIColor)white35PercentColor;
- (UIColor)white52PercentColor;
- (UIColor)white70PercentColor;
- (UIColor)white75PercentColor;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)largeImageInsets;
- (UIFont)boldFont;
- (UIFont)regularFont;
- (UIImage)image;
- (id)_colorDarkenedIfNeededForColor:(id)a3;
- (int64_t)buttonStyle;
- (int64_t)controlStyle;
- (int64_t)currentStyle;
- (int64_t)textStyle;
- (void)_didUpdateContentSizeCategory:(id)a3;
- (void)_didUpdateDarkenColorsSetting:(id)a3;
- (void)_updateTitleStyleForButton:(id)a3 withControlStyle:(int64_t)a4;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)layoutSubviews;
- (void)setBlack35PercentColor:(id)a3;
- (void)setBlack70PercentColor:(id)a3;
- (void)setBlue100PercentColor:(id)a3;
- (void)setBlue50PercentColor:(id)a3;
- (void)setBlurredBackgroundView:(id)a3;
- (void)setBoldFont:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonStyle:(int64_t)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setControlStyle:(int64_t)a3;
- (void)setCurrentStyle:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLargeImageInsets:(UIEdgeInsets)a3;
- (void)setRegularFont:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTextStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setWhite100PercentColor:(id)a3;
- (void)setWhite26PercentColor:(id)a3;
- (void)setWhite35PercentColor:(id)a3;
- (void)setWhite52PercentColor:(id)a3;
- (void)setWhite70PercentColor:(id)a3;
- (void)setWhite75PercentColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCurrentAppearanceIfNeeded;
@end

@implementation ARCoachingButton

- (ARCoachingButton)initWithButton:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 largeImageInsets:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  v79[8] = *MEMORY[0x263EF8340];
  id v16 = a3;
  v78.receiver = self;
  v78.super_class = (Class)ARCoachingButton;
  double v17 = *MEMORY[0x263F001A8];
  double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  v21 = -[ARCoachingButton initWithFrame:](&v78, sel_initWithFrame_, *MEMORY[0x263F001A8], v18, v19, v20);
  v22 = v21;
  if (v21)
  {
    id v77 = v16;
    [(ARCoachingButton *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = -[ARCoachingControlBlurredBackgroundView initWithFrame:backgroundStyle:controlStyle:]([ARCoachingControlBlurredBackgroundView alloc], "initWithFrame:backgroundStyle:controlStyle:", a4 == 1, a6, v17, v18, v19, v20);
    blurredBackgroundView = v22->_blurredBackgroundView;
    v22->_blurredBackgroundView = v23;

    [(ARCoachingControlBlurredBackgroundView *)v22->_blurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ARCoachingButton *)v22 addSubview:v22->_blurredBackgroundView];
    p_button = (id *)&v22->_button;
    objc_storeStrong((id *)&v22->_button, a3);
    [(ARCoachingWrappedButton *)v22->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ARCoachingButton *)v22 addSubview:v22->_button];
    v22->_buttonStyle = a4;
    v22->_textStyle = a5;
    v22->_controlStyle = a6;
    v22->_largeImageInsets.CGFloat top = top;
    v22->_largeImageInsets.CGFloat left = left;
    v22->_largeImageInsets.CGFloat bottom = bottom;
    v22->_largeImageInsets.CGFloat right = right;
    uint64_t v26 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.35];
    white35PercentColor = v22->_white35PercentColor;
    v22->_white35PercentColor = (UIColor *)v26;

    uint64_t v28 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    white100PercentColor = v22->_white100PercentColor;
    v22->_white100PercentColor = (UIColor *)v28;

    uint64_t v30 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.7];
    white70PercentColor = v22->_white70PercentColor;
    v22->_white70PercentColor = (UIColor *)v30;

    uint64_t v32 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.35];
    black35PercentColor = v22->_black35PercentColor;
    v22->_black35PercentColor = (UIColor *)v32;

    uint64_t v34 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.7];
    black70PercentColor = v22->_black70PercentColor;
    v22->_black70PercentColor = (UIColor *)v34;

    uint64_t v36 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    blue100PercentColor = v22->_blue100PercentColor;
    v22->_blue100PercentColor = (UIColor *)v36;

    uint64_t v38 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:0.5];
    blue50PercentColor = v22->_blue50PercentColor;
    v22->_blue50PercentColor = (UIColor *)v38;

    uint64_t v40 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.75];
    white75PercentColor = v22->_white75PercentColor;
    v22->_white75PercentColor = (UIColor *)v40;

    uint64_t v42 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.52];
    white52PercentColor = v22->_white52PercentColor;
    v22->_white52PercentColor = (UIColor *)v42;

    uint64_t v44 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.26];
    white26PercentColor = v22->_white26PercentColor;
    v22->_white26PercentColor = (UIColor *)v44;

    if (a6 == 2)
    {
      double v46 = 0.4;
    }
    else
    {
      if (a6 != 3)
      {
LABEL_7:
        v67 = (void *)MEMORY[0x263F08938];
        v76 = [(ARCoachingControlBlurredBackgroundView *)v22->_blurredBackgroundView leadingAnchor];
        v75 = [(ARCoachingButton *)v22 leadingAnchor];
        v74 = [v76 constraintEqualToAnchor:v75];
        v79[0] = v74;
        v73 = [(ARCoachingControlBlurredBackgroundView *)v22->_blurredBackgroundView trailingAnchor];
        v72 = [(ARCoachingButton *)v22 trailingAnchor];
        v71 = [v73 constraintEqualToAnchor:v72];
        v79[1] = v71;
        v70 = [(ARCoachingControlBlurredBackgroundView *)v22->_blurredBackgroundView topAnchor];
        v69 = [(ARCoachingButton *)v22 topAnchor];
        v68 = [v70 constraintEqualToAnchor:v69];
        v79[2] = v68;
        v66 = [(ARCoachingControlBlurredBackgroundView *)v22->_blurredBackgroundView bottomAnchor];
        v65 = [(ARCoachingButton *)v22 bottomAnchor];
        v64 = [v66 constraintEqualToAnchor:v65];
        v79[3] = v64;
        v63 = [*p_button leadingAnchor];
        v62 = [(ARCoachingButton *)v22 leadingAnchor];
        v61 = [v63 constraintEqualToAnchor:v62];
        v79[4] = v61;
        v60 = [*p_button trailingAnchor];
        v48 = [(ARCoachingButton *)v22 trailingAnchor];
        v49 = [v60 constraintEqualToAnchor:v48];
        v79[5] = v49;
        v50 = [*p_button topAnchor];
        v51 = [(ARCoachingButton *)v22 topAnchor];
        v52 = [v50 constraintEqualToAnchor:v51];
        v79[6] = v52;
        v53 = [*p_button bottomAnchor];
        v54 = [(ARCoachingButton *)v22 bottomAnchor];
        v55 = [v53 constraintEqualToAnchor:v54];
        v79[7] = v55;
        v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:8];
        [v67 activateConstraints:v56];

        v57 = [MEMORY[0x263F08A00] defaultCenter];
        [v57 addObserver:v22 selector:sel__didUpdateDarkenColorsSetting_ name:*MEMORY[0x263F1CDF0] object:0];

        v58 = [MEMORY[0x263F08A00] defaultCenter];
        [v58 addObserver:v22 selector:sel__didUpdateContentSizeCategory_ name:*MEMORY[0x263F1D158] object:0];

        id v16 = v77;
        goto LABEL_8;
      }
      double v46 = 0.55;
    }
    v47 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:v46];
    [*p_button setBackgroundColor:v47];

    goto LABEL_7;
  }
LABEL_8:

  return v22;
}

- (ARCoachingButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6
{
  return [(ARCoachingButton *)self initWithTitle:a3 buttonStyle:a4 textStyle:a5 controlStyle:a6 adjustsFontForContentSizeCategory:0];
}

- (ARCoachingButton)initWithTitle:(id)a3 buttonStyle:(int64_t)a4 textStyle:(int64_t)a5 controlStyle:(int64_t)a6 adjustsFontForContentSizeCategory:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v13 = [ARCoachingWrappedButton alloc];
  v14 = -[ARCoachingWrappedButton initWithFrame:](v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(ARCoachingWrappedButton *)v14 setTitle:v12 forState:0];

  v15 = [(ARCoachingWrappedButton *)v14 titleLabel];
  [v15 setAdjustsFontForContentSizeCategory:v7];

  id v16 = -[ARCoachingButton initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:](self, "initWithButton:buttonStyle:textStyle:controlStyle:largeImageInsets:", v14, a4, a5, a6, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  [(ARCoachingButton *)v16 _updateTitleStyleForButton:v14 withControlStyle:a6];

  return v16;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(ARCoachingButton *)self button];
  [v9 addTarget:v8 action:a4 forControlEvents:a5];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(ARCoachingButton *)self button];
  if (v6)
  {
    BOOL v7 = [(ARCoachingButton *)self button];
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", width, height);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    -[ARCoachingButton systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", width, height);
    double v9 = v12;
    double v11 = v13;
  }

  double v14 = v9;
  double v15 = v11;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = [(ARCoachingButton *)self button];
  if (v10)
  {
    double v13 = [(ARCoachingButton *)self button];
    *(float *)&double v14 = a4;
    *(float *)&double v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    -[ARCoachingButton systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
    double v17 = v20;
    double v19 = v21;
  }

  double v22 = v17;
  double v23 = v19;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(ARCoachingButton *)self button];
  if (v3)
  {
    v4 = [(ARCoachingButton *)self button];
    [v4 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ARCoachingButton;
    [(ARCoachingButton *)&v13 intrinsicContentSize];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(ARCoachingButton *)self button];
  objc_msgSend(v7, "setContentEdgeInsets:", top, left, bottom, right);
}

- (UIEdgeInsets)contentEdgeInsets
{
  v2 = [(ARCoachingButton *)self button];
  [v2 contentEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (UIFont)regularFont
{
  if (!self->_regularFont)
  {
    double v3 = [(ARCoachingButton *)self button];
    double v4 = [v3 titleLabel];
    int v5 = [v4 adjustsFontForContentSizeCategory];

    if (v5) {
      [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B8]];
    }
    else {
    double v6 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D2C0] maximumContentSizeCategory:*MEMORY[0x263F1D160]];
    }
    regularFont = self->_regularFont;
    self->_regularFont = v6;
  }
  double v8 = self->_regularFont;

  return v8;
}

- (UIFont)boldFont
{
  boldFont = self->_boldFont;
  if (!boldFont)
  {
    double v4 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0] addingSymbolicTraits:2 options:0];
    int v5 = (void *)MEMORY[0x263F1C658];
    double v6 = [(ARCoachingButton *)self regularFont];
    [v6 pointSize];
    objc_msgSend(v5, "fontWithDescriptor:size:", v4);
    double v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
    double v8 = self->_boldFont;
    self->_boldFont = v7;

    boldFont = self->_boldFont;
  }

  return boldFont;
}

- (void)setControlStyle:(int64_t)a3
{
  if (self->_controlStyle != a3 && [(ARCoachingButton *)self currentStyle] != 2)
  {
    self->_controlStyle = a3;
    int v5 = [(ARCoachingButton *)self blurredBackgroundView];
    [v5 setControlStyle:a3];

    id v6 = [(ARCoachingButton *)self button];
    [(ARCoachingButton *)self _updateTitleStyleForButton:v6 withControlStyle:a3];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingButton;
  -[ARCoachingButton setEnabled:](&v9, sel_setEnabled_);
  int v5 = [(ARCoachingButton *)self blurredBackgroundView];
  [v5 setEnabled:v3];

  id v6 = [(ARCoachingButton *)self button];
  int v7 = [v6 isEnabled];

  if (v7 != v3)
  {
    double v8 = [(ARCoachingButton *)self button];
    [v8 setEnabled:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingButton;
  -[ARCoachingButton setSelected:](&v9, sel_setSelected_);
  int v5 = [(ARCoachingButton *)self blurredBackgroundView];
  [v5 setSelected:v3];

  id v6 = [(ARCoachingButton *)self button];
  int v7 = [v6 isSelected];

  if (v7 != v3)
  {
    double v8 = [(ARCoachingButton *)self button];
    [v8 setSelected:v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARCoachingButton;
  -[ARCoachingButton setHighlighted:](&v9, sel_setHighlighted_);
  int v5 = [(ARCoachingButton *)self blurredBackgroundView];
  [v5 setHighlighted:v3];

  id v6 = [(ARCoachingButton *)self button];
  int v7 = [v6 isHighlighted];

  if (v7 != v3)
  {
    double v8 = [(ARCoachingButton *)self button];
    [v8 setHighlighted:v3];
  }
}

- (id)_colorDarkenedIfNeededForColor:(id)a3
{
  id v3 = a3;
  if (UIAccessibilityDarkerSystemColorsEnabled()
    && (double v10 = 0.0,
        double v11 = 0.0,
        double v8 = 0.0,
        double v9 = 0.0,
        [v3 getHue:&v11 saturation:&v10 brightness:&v9 alpha:&v8]))
  {
    if (v9 == 0.0)
    {
      id v4 = [v3 colorWithAlphaComponent:v8 / 0.75];
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x263F1C550]);
      id v4 = (id)[v7 initWithHue:v11 saturation:v10 brightness:v9 * 0.75 alpha:v8];
    }
  }
  else
  {
    id v4 = v3;
  }
  int v5 = v4;

  return v5;
}

- (void)_updateTitleStyleForButton:(id)a3 withControlStyle:(int64_t)a4
{
  v55[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 titleForState:0];
  if (v7)
  {
    if ([(ARCoachingButton *)self buttonStyle] == 1
      || [(ARCoachingButton *)self textStyle] == 1)
    {
      uint64_t v8 = [(ARCoachingButton *)self boldFont];
      uint64_t v42 = [(ARCoachingButton *)self boldFont];
      uint64_t v9 = [(ARCoachingButton *)self boldFont];
    }
    else
    {
      uint64_t v8 = [(ARCoachingButton *)self regularFont];
      uint64_t v42 = [(ARCoachingButton *)self regularFont];
      uint64_t v9 = [(ARCoachingButton *)self regularFont];
    }
    v43 = (void *)v9;
    uint64_t v10 = [(ARCoachingButton *)self boldFont];
    if (a4 == 3)
    {
      uint64_t v11 = [(ARCoachingButton *)self white75PercentColor];
      uint64_t v38 = [(ARCoachingButton *)self white52PercentColor];
      v41 = [(ARCoachingButton *)self white26PercentColor];
      uint64_t v40 = [(ARCoachingButton *)self blue100PercentColor];
      uint64_t v13 = [(ARCoachingButton *)self white26PercentColor];
    }
    else
    {
      if (a4 == 2)
      {
        uint64_t v11 = [(ARCoachingButton *)self white100PercentColor];
        uint64_t v38 = [(ARCoachingButton *)self white70PercentColor];
        v41 = [(ARCoachingButton *)self white35PercentColor];
        uint64_t v40 = [(ARCoachingButton *)self white70PercentColor];
        v39 = [(ARCoachingButton *)self white35PercentColor];
        uint64_t v12 = [(ARCoachingButton *)self white35PercentColor];
LABEL_15:
        v27 = (void *)v12;
        v37 = (void *)v11;
        uint64_t v14 = *MEMORY[0x263F1C238];
        uint64_t v34 = (void *)v8;
        v55[0] = v8;
        uint64_t v15 = *MEMORY[0x263F1C240];
        v54[0] = v14;
        v54[1] = v15;
        double v16 = [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v11];
        v55[1] = v16;
        uint64_t v36 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

        v35 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v36];
        [v6 setAttributedTitle:v35 forState:0];
        v52[1] = v15;
        v53[0] = v42;
        v52[0] = v14;
        double v17 = [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v38];
        v53[1] = v17;
        v33 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v33];
        [v6 setAttributedTitle:v32 forState:1];
        v50[1] = v15;
        v51[0] = v43;
        v50[0] = v14;
        double v18 = [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v41];
        v51[1] = v18;
        v31 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v31];
        [v6 setAttributedTitle:v30 forState:2];
        v49[0] = v10;
        v48[0] = v14;
        v48[1] = v15;
        double v19 = [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v40];
        v49[1] = v19;
        v29 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

        uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v29];
        [v6 setAttributedTitle:v28 forState:4];
        v46[1] = v15;
        v47[0] = v10;
        v46[0] = v14;
        [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v39];
        v21 = double v20 = (void *)v10;
        v47[1] = v21;
        double v22 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

        double v23 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v22];
        [v6 setAttributedTitle:v23 forState:5];
        v44[1] = v15;
        v45[0] = v20;
        v44[0] = v14;
        v24 = [(ARCoachingButton *)self _colorDarkenedIfNeededForColor:v27];
        v45[1] = v24;
        v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];

        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v25];
        [v6 setAttributedTitle:v26 forState:6];

        goto LABEL_16;
      }
      if ([(ARCoachingButton *)self buttonStyle] == 1)
      {
        uint64_t v11 = [(ARCoachingButton *)self blue100PercentColor];
        uint64_t v38 = [(ARCoachingButton *)self black70PercentColor];
        [(ARCoachingButton *)self blue50PercentColor];
      }
      else
      {
        uint64_t v11 = [(ARCoachingButton *)self black70PercentColor];
        uint64_t v38 = [(ARCoachingButton *)self black70PercentColor];
        [(ARCoachingButton *)self black35PercentColor];
      v41 = };
      uint64_t v40 = [(ARCoachingButton *)self blue100PercentColor];
      uint64_t v13 = [(ARCoachingButton *)self black70PercentColor];
    }
    v39 = (void *)v13;
    uint64_t v12 = [(ARCoachingButton *)self blue50PercentColor];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_didUpdateDarkenColorsSetting:(id)a3
{
  id v4 = [(ARCoachingButton *)self button];
  [(ARCoachingButton *)self _updateTitleStyleForButton:v4 withControlStyle:[(ARCoachingButton *)self controlStyle]];
}

- (void)_didUpdateContentSizeCategory:(id)a3
{
  regularFont = self->_regularFont;
  self->_regularFont = 0;

  boldFont = self->_boldFont;
  self->_boldFont = 0;

  id v6 = [(ARCoachingButton *)self button];
  [(ARCoachingButton *)self _updateTitleStyleForButton:v6 withControlStyle:[(ARCoachingButton *)self controlStyle]];
}

- (NSString)title
{
  return (NSString *)[(ARCoachingWrappedButton *)self->_button titleForState:0];
}

- (void)setTitle:(id)a3
{
  [(ARCoachingWrappedButton *)self->_button setTitle:a3 forState:0];
  button = self->_button;
  int64_t v5 = [(ARCoachingButton *)self controlStyle];

  [(ARCoachingButton *)self _updateTitleStyleForButton:button withControlStyle:v5];
}

- (UIImage)image
{
  return (UIImage *)[(ARCoachingWrappedButton *)self->_button imageForState:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ARCoachingButton;
  [(ARCoachingButton *)&v3 layoutSubviews];
  [(ARCoachingButton *)self updateCurrentAppearanceIfNeeded];
}

- (void)updateCurrentAppearanceIfNeeded
{
  objc_super v3 = [MEMORY[0x263F1CB00] _currentTraitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if ([(ARCoachingButton *)self currentStyle] != v4)
  {
    if (v4 == 2)
    {
      int64_t v5 = [(ARCoachingButton *)self blurredBackgroundView];
      [v5 setControlStyle:3];

      id v6 = [(ARCoachingButton *)self button];
      id v7 = self;
      uint64_t v8 = v6;
      int64_t v9 = 3;
    }
    else
    {
      int64_t v10 = [(ARCoachingButton *)self controlStyle];
      uint64_t v11 = [(ARCoachingButton *)self blurredBackgroundView];
      [v11 setControlStyle:v10];

      id v6 = [(ARCoachingButton *)self button];
      int64_t v9 = [(ARCoachingButton *)self controlStyle];
      id v7 = self;
      uint64_t v8 = v6;
    }
    [(ARCoachingButton *)v7 _updateTitleStyleForButton:v8 withControlStyle:v9];

    [(ARCoachingButton *)self setCurrentStyle:v4];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARCoachingButton;
  [(ARCoachingButton *)&v4 traitCollectionDidChange:a3];
  [(ARCoachingButton *)self updateCurrentAppearanceIfNeeded];
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (UIEdgeInsets)largeImageInsets
{
  double top = self->_largeImageInsets.top;
  double left = self->_largeImageInsets.left;
  double bottom = self->_largeImageInsets.bottom;
  double right = self->_largeImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLargeImageInsets:(UIEdgeInsets)a3
{
  self->_largeImageInsets = a3;
}

- (void)setImage:(id)a3
{
}

- (ARCoachingWrappedButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (ARCoachingControlBlurredBackgroundView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (void)setBlurredBackgroundView:(id)a3
{
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (void)setRegularFont:(id)a3
{
}

- (void)setBoldFont:(id)a3
{
}

- (UIColor)white35PercentColor
{
  return self->_white35PercentColor;
}

- (void)setWhite35PercentColor:(id)a3
{
}

- (UIColor)white100PercentColor
{
  return self->_white100PercentColor;
}

- (void)setWhite100PercentColor:(id)a3
{
}

- (UIColor)white70PercentColor
{
  return self->_white70PercentColor;
}

- (void)setWhite70PercentColor:(id)a3
{
}

- (UIColor)black35PercentColor
{
  return self->_black35PercentColor;
}

- (void)setBlack35PercentColor:(id)a3
{
}

- (UIColor)black70PercentColor
{
  return self->_black70PercentColor;
}

- (void)setBlack70PercentColor:(id)a3
{
}

- (UIColor)blue100PercentColor
{
  return self->_blue100PercentColor;
}

- (void)setBlue100PercentColor:(id)a3
{
}

- (UIColor)blue50PercentColor
{
  return self->_blue50PercentColor;
}

- (void)setBlue50PercentColor:(id)a3
{
}

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

- (void)setCurrentStyle:(int64_t)a3
{
  self->_currentStyle = a3;
}

- (UIColor)white75PercentColor
{
  return self->_white75PercentColor;
}

- (void)setWhite75PercentColor:(id)a3
{
}

- (UIColor)white52PercentColor
{
  return self->_white52PercentColor;
}

- (void)setWhite52PercentColor:(id)a3
{
}

- (UIColor)white26PercentColor
{
  return self->_white26PercentColor;
}

- (void)setWhite26PercentColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_white26PercentColor, 0);
  objc_storeStrong((id *)&self->_white52PercentColor, 0);
  objc_storeStrong((id *)&self->_white75PercentColor, 0);
  objc_storeStrong((id *)&self->_blue50PercentColor, 0);
  objc_storeStrong((id *)&self->_blue100PercentColor, 0);
  objc_storeStrong((id *)&self->_black70PercentColor, 0);
  objc_storeStrong((id *)&self->_black35PercentColor, 0);
  objc_storeStrong((id *)&self->_white70PercentColor, 0);
  objc_storeStrong((id *)&self->_white100PercentColor, 0);
  objc_storeStrong((id *)&self->_white35PercentColor, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);

  objc_storeStrong((id *)&self->_regularFont, 0);
}

@end