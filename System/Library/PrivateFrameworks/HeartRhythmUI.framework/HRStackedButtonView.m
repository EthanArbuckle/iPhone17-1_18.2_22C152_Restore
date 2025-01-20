@interface HRStackedButtonView
+ (double)_buttonSpacingForValue:(double)a3;
+ (double)_footerTextSpacingForValue:(double)a3;
+ (double)topPadding;
+ (id)_footerFontTextStyle;
+ (id)_footerTextBoldFont;
+ (id)_footerTextFont;
+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 delegate:(id)a6;
+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 footerTextAlignment:(int64_t)a6 delegate:(id)a7;
- (BOOL)fixedBottomButtonSpacing;
- (BOOL)isBlurHidden;
- (HRStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8;
- (HRStackedButtonViewDelegate)delegate;
- (NSArray)buttons;
- (NSArray)styles;
- (NSArray)titles;
- (NSLayoutConstraint)backgroundBlurViewLeadingConstraint;
- (NSLayoutConstraint)backgroundBlurViewTrailingConstraint;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutYAxisAnchor)firstTopAnchor;
- (NSString)boldFooterText;
- (NSString)footerText;
- (UIBlurEffect)backgroundBlurEffect;
- (UILabel)footerTextLabel;
- (UIView)backgroundBlurView;
- (double)firstTopConstant;
- (id)_attributedFooterText;
- (id)_createButtons;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (int64_t)buttonMode;
- (int64_t)footerTextAlignment;
- (int64_t)lastButtonMode;
- (void)_assignConstraintsForButtons;
- (void)_createViewBottomConstraint;
- (void)_setUpBlurEffect;
- (void)_setUpButtons;
- (void)_setUpFooterText;
- (void)_updateBottomConstraint;
- (void)_updateForCurrentSizeCategory;
- (void)actionButtonTapped:(id)a3;
- (void)alignBlurViewHorizontalConstraintsWithView:(id)a3;
- (void)setBackgroundBlurEffect:(id)a3;
- (void)setBackgroundBlurView:(id)a3;
- (void)setBackgroundBlurViewLeadingConstraint:(id)a3;
- (void)setBackgroundBlurViewTrailingConstraint:(id)a3;
- (void)setBlurHidden:(BOOL)a3;
- (void)setBoldFooterText:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setButtonMode:(int64_t)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstTopAnchor:(id)a3;
- (void)setFirstTopConstant:(double)a3;
- (void)setFixedBottomButtonSpacing:(BOOL)a3;
- (void)setFooterText:(id)a3;
- (void)setFooterTextAlignment:(int64_t)a3;
- (void)setFooterTextLabel:(id)a3;
- (void)setLastButtonMode:(int64_t)a3;
- (void)setStyles:(id)a3;
- (void)setTitles:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRStackedButtonView

- (HRStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HRStackedButtonView;
  v19 = -[HRStackedButtonView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_titles, a3);
    objc_storeStrong((id *)&v20->_styles, a4);
    objc_storeStrong((id *)&v20->_footerText, a5);
    objc_storeStrong((id *)&v20->_boldFooterText, a6);
    v20->_footerTextAlignment = a7;
    objc_storeWeak((id *)&v20->_delegate, v18);
    [(HRStackedButtonView *)v20 _setUpBlurEffect];
    [(HRStackedButtonView *)v20 _setUpButtons];
  }

  return v20;
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 delegate:(id)a6
{
  return (id)[a1 buddyStackedButtonViewWithTitles:a3 footerText:a4 boldFooterText:a5 footerTextAlignment:4 delegate:a6];
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 footerTextAlignment:(int64_t)a6 delegate:(id)a7
{
  v11 = (objc_class *)MEMORY[0x263EFF980];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __111__HRStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke;
  v20[3] = &unk_2645813D8;
  id v21 = v16;
  id v17 = v16;
  [v15 enumerateObjectsUsingBlock:v20];
  id v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithButtonTitles:v15 styles:v17 footerText:v14 boldFooterText:v13 footerTextAlignment:a6 delegate:v12];

  return v18;
}

uint64_t __111__HRStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3) {
    v4 = &unk_26D2BF330;
  }
  else {
    v4 = &unk_26D2BF318;
  }
  return [v3 addObject:v4];
}

- (void)setLastButtonMode:(int64_t)a3
{
  if (self->_lastButtonMode != a3)
  {
    self->_lastButtonMode = a3;
    [(HRStackedButtonView *)self _updateBottomConstraint];
  }
}

- (void)setFixedBottomButtonSpacing:(BOOL)a3
{
  if (self->_fixedBottomButtonSpacing != a3)
  {
    self->_fixedBottomButtonSpacing = a3;
    [(HRStackedButtonView *)self _updateBottomConstraint];
  }
}

- (void)setBlurHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_blurHidden = a3;
  v5 = [(HRStackedButtonView *)self backgroundBlurView];
  [v5 setHidden:v3];

  if (v3) {
    [MEMORY[0x263F1C550] systemBackgroundColor];
  }
  else {
  id v6 = [MEMORY[0x263F1C550] clearColor];
  }
  [(HRStackedButtonView *)self setBackgroundColor:v6];
}

- (void)alignBlurViewHorizontalConstraintsWithView:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HRStackedButtonView *)self backgroundBlurViewLeadingConstraint];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F08938];
    v7 = [(HRStackedButtonView *)self backgroundBlurViewLeadingConstraint];
    v24[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [v6 deactivateConstraints:v8];

    [(HRStackedButtonView *)self setBackgroundBlurViewLeadingConstraint:0];
  }
  v9 = [(HRStackedButtonView *)self backgroundBlurViewTrailingConstraint];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F08938];
    v11 = [(HRStackedButtonView *)self backgroundBlurViewTrailingConstraint];
    objc_super v23 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    [v10 deactivateConstraints:v12];

    [(HRStackedButtonView *)self setBackgroundBlurViewTrailingConstraint:0];
  }
  id v13 = [(HRStackedButtonView *)self backgroundBlurView];
  id v14 = [v13 leadingAnchor];
  id v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [(HRStackedButtonView *)self setBackgroundBlurViewLeadingConstraint:v16];

  id v17 = [(HRStackedButtonView *)self backgroundBlurView];
  id v18 = [v17 trailingAnchor];
  v19 = [v4 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19];
  [(HRStackedButtonView *)self setBackgroundBlurViewTrailingConstraint:v20];

  id v21 = [(HRStackedButtonView *)self backgroundBlurViewLeadingConstraint];
  [v21 setActive:1];

  id v22 = [(HRStackedButtonView *)self backgroundBlurViewTrailingConstraint];
  [v22 setActive:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRStackedButtonView;
  [(HRStackedButtonView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HRStackedButtonView *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HRStackedButtonView *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)actionButtonTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(HRStackedButtonView *)self delegate];
  uint64_t v5 = [v4 tag];

  [v6 stackedButtonView:self didTapButtonAtIndex:v5];
}

+ (double)topPadding
{
  return 24.0;
}

- (void)_setUpButtons
{
  BOOL v3 = [(HRStackedButtonView *)self _createButtons];
  [(HRStackedButtonView *)self setButtons:v3];

  [(HRStackedButtonView *)self _setUpFooterText];
  [(HRStackedButtonView *)self _assignConstraintsForButtons];
  [(HRStackedButtonView *)self _createViewBottomConstraint];
  [(HRStackedButtonView *)self _updateBottomConstraint];
}

- (void)_setUpBlurEffect
{
  BOOL v3 = [MEMORY[0x263F1C480] effectWithStyle:10];
  [(HRStackedButtonView *)self setBackgroundBlurEffect:v3];

  id v4 = objc_alloc(MEMORY[0x263F1CB98]);
  uint64_t v5 = [(HRStackedButtonView *)self backgroundBlurEffect];
  id v6 = (void *)[v4 initWithEffect:v5];
  [(HRStackedButtonView *)self setBackgroundBlurView:v6];

  v7 = [(HRStackedButtonView *)self backgroundBlurView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v8 = [(HRStackedButtonView *)self backgroundBlurView];
  [(HRStackedButtonView *)self addSubview:v8];

  objc_super v9 = [(HRStackedButtonView *)self backgroundBlurView];
  objc_msgSend(v9, "hk_alignVerticalConstraintsWithView:margin:", self, 0.0);

  [(HRStackedButtonView *)self alignBlurViewHorizontalConstraintsWithView:self];
  [(HRStackedButtonView *)self setBlurHidden:0];
}

- (id)_createButtons
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HRStackedButtonView *)self titles];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__HRStackedButtonView__createButtons__block_invoke;
  v9[3] = &unk_264581400;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __37__HRStackedButtonView__createButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  id v5 = [*(id *)(a1 + 32) styles];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1)
  {
    v11 = (void *)MEMORY[0x263F1C488];
    objc_super v9 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    uint64_t v10 = objc_msgSend(v11, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v9, v16, *(void *)(a1 + 32), sel_actionButtonTapped_);
    goto LABEL_5;
  }
  if (!v7)
  {
    char v8 = (void *)MEMORY[0x263F1C488];
    objc_super v9 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    uint64_t v10 = objc_msgSend(v8, "hk_buttonTintedWithColor:title:target:action:", v9, v16, *(void *)(a1 + 32), sel_actionButtonTapped_);
LABEL_5:
    id v12 = (void *)v10;

    goto LABEL_7;
  }
  id v12 = 0;
LABEL_7:
  id v13 = [v12 titleLabel];
  [v13 setAdjustsFontForContentSizeCategory:1];

  id v14 = [NSString stringWithFormat:@"Button.%@", v16];
  id v15 = [NSString healthAccessibilityIdentifier:0 suffix:v14];
  [v12 setAccessibilityIdentifier:v15];

  [v12 setTag:a3];
  [*(id *)(a1 + 40) addObject:v12];
  [*(id *)(a1 + 32) addSubview:v12];
}

- (void)_setUpFooterText
{
  BOOL v3 = [(HRStackedButtonView *)self footerText];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(HRStackedButtonView *)self setFooterTextLabel:v4];

    id v5 = [(HRStackedButtonView *)self _attributedFooterText];
    id v6 = [(HRStackedButtonView *)self footerTextLabel];
    [v6 setAttributedText:v5];

    uint64_t v7 = [(HRStackedButtonView *)self footerTextLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    char v8 = [(HRStackedButtonView *)self footerTextLabel];
    [v8 setNumberOfLines:0];

    objc_super v9 = [(HRStackedButtonView *)self footerTextLabel];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    int64_t v10 = [(HRStackedButtonView *)self footerTextAlignment];
    v11 = [(HRStackedButtonView *)self footerTextLabel];
    [v11 setTextAlignment:v10];

    id v12 = [(HRStackedButtonView *)self footerTextLabel];
    [(HRStackedButtonView *)self addSubview:v12];

    id v13 = [(HRStackedButtonView *)self footerTextLabel];
    objc_msgSend(v13, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    [(id)objc_opt_class() _footerTextSpacingForValue:30.0];
    -[HRStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:");
    id v14 = [(HRStackedButtonView *)self footerTextLabel];
    id v15 = [v14 firstBaselineAnchor];
    id v16 = [(HRStackedButtonView *)self topAnchor];
    [(HRStackedButtonView *)self firstTopConstant];
    id v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
    [v17 setActive:1];

    id v20 = [(HRStackedButtonView *)self footerTextLabel];
    id v18 = [v20 lastBaselineAnchor];
    [(HRStackedButtonView *)self setFirstTopAnchor:v18];
  }
  else
  {
    v19 = [(HRStackedButtonView *)self topAnchor];
    [(HRStackedButtonView *)self setFirstTopAnchor:v19];

    [(HRStackedButtonView *)self setFirstTopConstant:0.0];
  }
}

- (void)_assignConstraintsForButtons
{
  BOOL v3 = [(HRStackedButtonView *)self buttons];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__HRStackedButtonView__assignConstraintsForButtons__block_invoke;
  v4[3] = &unk_264581428;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __51__HRStackedButtonView__assignConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = 0.0;
  id v25 = a2;
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", *(void *)(a1 + 32), 0.0);
  id v6 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v7 = [v6 buttons];
    char v8 = [v7 objectAtIndexedSubscript:a3 - 1];

    objc_super v9 = [*(id *)(a1 + 32) styles];
    int64_t v10 = [v9 objectAtIndexedSubscript:a3 - 1];
    uint64_t v11 = [v10 integerValue];

    if (v11 == 1)
    {
      id v12 = [v8 bottomAnchor];
      *(double *)&uint64_t v13 = 36.0;
    }
    else
    {
      if (v11)
      {
        id v12 = 0;
LABEL_11:
        id v18 = [*(id *)(a1 + 32) styles];
        v19 = [v18 objectAtIndexedSubscript:a3];
        uint64_t v20 = [v19 integerValue];

        if (v20 == 1)
        {
          uint64_t v21 = [v25 bottomAnchor];
        }
        else
        {
          if (v20)
          {
            id v22 = 0;
            goto LABEL_17;
          }
          uint64_t v21 = [v25 lastBaselineAnchor];
        }
        id v22 = (void *)v21;
LABEL_17:
        [(id)objc_opt_class() _buttonSpacingForValue:v5];
        objc_super v23 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v12);
        [v23 setActive:1];

        goto LABEL_24;
      }
      id v12 = [v8 lastBaselineAnchor];
      *(double *)&uint64_t v13 = 44.0;
    }
    double v5 = *(double *)&v13;
    goto LABEL_11;
  }
  id v14 = [v6 styles];
  id v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 1)
  {
    char v8 = [v25 topAnchor];
    [*(id *)(a1 + 32) firstTopConstant];
    if (v24 == 0.0)
    {
      double v5 = 24.0;
      goto LABEL_23;
    }
    [*(id *)(a1 + 32) firstTopConstant];
  }
  else
  {
    if (v16)
    {
      char v8 = 0;
      goto LABEL_23;
    }
    char v8 = [v25 firstBaselineAnchor];
    [(id)objc_opt_class() _buttonSpacingForValue:32.0];
  }
  double v5 = v17;
LABEL_23:
  id v12 = [*(id *)(a1 + 32) firstTopAnchor];
  id v22 = [v8 constraintEqualToAnchor:v12 constant:v5];
  [v22 setActive:1];
LABEL_24:
}

- (void)_createViewBottomConstraint
{
  BOOL v3 = [(HRStackedButtonView *)self styles];
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1)
  {
    id v6 = [(HRStackedButtonView *)self bottomAnchor];
    uint64_t v7 = [(HRStackedButtonView *)self buttons];
    char v8 = [v7 lastObject];
    uint64_t v9 = [v8 bottomAnchor];
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v6 = [(HRStackedButtonView *)self bottomAnchor];
    uint64_t v7 = [(HRStackedButtonView *)self buttons];
    char v8 = [v7 lastObject];
    uint64_t v9 = [v8 lastBaselineAnchor];
  }
  int64_t v10 = (void *)v9;
  uint64_t v11 = [v6 constraintEqualToAnchor:v9];
  [(HRStackedButtonView *)self setBottomConstraint:v11];

LABEL_6:
  id v12 = [(HRStackedButtonView *)self bottomConstraint];
  [v12 setActive:1];
}

- (void)_updateBottomConstraint
{
  BOOL v3 = [(HRStackedButtonView *)self styles];
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 integerValue];

  if ([(HRStackedButtonView *)self lastButtonMode] == 1)
  {
    id v6 = [(HRStackedButtonView *)self titles];
    [v6 count];
  }
  double v7 = 0.0;
  if (v5 == 1)
  {
    int64_t v8 = [(HRStackedButtonView *)self lastButtonMode];
    double v9 = 60.0;
    if (v8 != 1) {
      double v9 = 0.0;
    }
    if (v8) {
      double v7 = v9;
    }
    else {
      double v7 = 44.0;
    }
  }
  else if (!v5)
  {
    double v7 = 24.0;
  }
  if (![(HRStackedButtonView *)self fixedBottomButtonSpacing])
  {
    [(id)objc_opt_class() _buttonSpacingForValue:v7];
    double v7 = v10;
  }
  id v11 = [(HRStackedButtonView *)self bottomConstraint];
  [v11 setConstant:v7];
}

- (void)_updateForCurrentSizeCategory
{
  BOOL v3 = [(HRStackedButtonView *)self footerText];

  if (v3)
  {
    id v4 = [(HRStackedButtonView *)self _attributedFooterText];
    uint64_t v5 = [(HRStackedButtonView *)self footerTextLabel];
    [v5 setAttributedText:v4];

    [(HRStackedButtonView *)self setNeedsLayout];
  }
}

- (id)_attributedFooterText
{
  BOOL v3 = (void *)MEMORY[0x263F089B8];
  id v4 = [(HRStackedButtonView *)self footerText];
  uint64_t v5 = *MEMORY[0x263F1D2C0];
  id v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  double v7 = [(HRStackedButtonView *)self boldFooterText];
  int64_t v8 = objc_msgSend(v3, "hrui_attributedStringForText:style:color:boldText:", v4, v5, v6, v7);

  return v8;
}

- (id)firstBaselineAnchor
{
  v2 = [(HRStackedButtonView *)self buttons];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 firstBaselineAnchor];

  return v4;
}

- (id)lastBaselineAnchor
{
  v2 = [(HRStackedButtonView *)self buttons];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 lastBaselineAnchor];

  return v4;
}

+ (id)_footerFontTextStyle
{
  return (id)*MEMORY[0x263F1D2C0];
}

+ (id)_footerTextFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(id)objc_opt_class() _footerFontTextStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

+ (id)_footerTextBoldFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(id)objc_opt_class() _footerFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

+ (double)_footerTextSpacingForValue:(double)a3
{
  id v4 = [(id)objc_opt_class() _footerTextFont];
  [v4 _scaledValueForValue:a3];
  double v6 = v5;

  return v6;
}

+ (double)_buttonSpacingForValue:(double)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D260], 0x8000);
  [v4 _scaledValueForValue:a3];
  double v6 = v5;

  return v6;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (int64_t)lastButtonMode
{
  return self->_lastButtonMode;
}

- (BOOL)fixedBottomButtonSpacing
{
  return self->_fixedBottomButtonSpacing;
}

- (BOOL)isBlurHidden
{
  return self->_blurHidden;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
}

- (NSArray)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (void)setButtonMode:(int64_t)a3
{
  self->_buttonMode = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSString)boldFooterText
{
  return self->_boldFooterText;
}

- (void)setBoldFooterText:(id)a3
{
}

- (int64_t)footerTextAlignment
{
  return self->_footerTextAlignment;
}

- (void)setFooterTextAlignment:(int64_t)a3
{
  self->_footerTextAlignment = a3;
}

- (UILabel)footerTextLabel
{
  return self->_footerTextLabel;
}

- (void)setFooterTextLabel:(id)a3
{
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
}

- (UIView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (NSLayoutConstraint)backgroundBlurViewLeadingConstraint
{
  return self->_backgroundBlurViewLeadingConstraint;
}

- (void)setBackgroundBlurViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)backgroundBlurViewTrailingConstraint
{
  return self->_backgroundBlurViewTrailingConstraint;
}

- (void)setBackgroundBlurViewTrailingConstraint:(id)a3
{
}

- (NSLayoutYAxisAnchor)firstTopAnchor
{
  return self->_firstTopAnchor;
}

- (void)setFirstTopAnchor:(id)a3
{
}

- (double)firstTopConstant
{
  return self->_firstTopConstant;
}

- (void)setFirstTopConstant:(double)a3
{
  self->_firstTopConstant = a3;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (HRStackedButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRStackedButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstTopAnchor, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_boldFooterText, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end