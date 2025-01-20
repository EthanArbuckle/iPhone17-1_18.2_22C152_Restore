@interface HKStackedButtonView
+ (double)_buttonSpacingForValue:(double)a3;
+ (double)_footerTextSpacingForValue:(double)a3;
+ (id)_footerFontTextStyle;
+ (id)_footerTextBoldFont;
+ (id)_footerTextFont;
+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 delegate:(id)a6;
+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 footerTextAlignment:(int64_t)a6 delegate:(id)a7;
+ (id)createButtonBackgroundView;
- (BOOL)bottomAdjustsForHomeButtonlessScreen;
- (BOOL)isBlurHidden;
- (HKStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8;
- (HKStackedButtonViewDelegate)delegate;
- (NSArray)buttonSpacingConstraints;
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
- (void)_updateConstraintsForButtons;
- (void)_updateForCurrentSizeCategory;
- (void)actionButtonTapped:(id)a3;
- (void)alignBlurViewHorizontalConstraintsWithView:(id)a3;
- (void)setBackgroundBlurEffect:(id)a3;
- (void)setBackgroundBlurView:(id)a3;
- (void)setBackgroundBlurViewLeadingConstraint:(id)a3;
- (void)setBackgroundBlurViewTrailingConstraint:(id)a3;
- (void)setBlurHidden:(BOOL)a3;
- (void)setBoldFooterText:(id)a3;
- (void)setBottomAdjustsForHomeButtonlessScreen:(BOOL)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setButtonMode:(int64_t)a3;
- (void)setButtonSpacingConstraints:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstTopAnchor:(id)a3;
- (void)setFirstTopConstant:(double)a3;
- (void)setFooterText:(id)a3;
- (void)setFooterTextAlignment:(int64_t)a3;
- (void)setFooterTextLabel:(id)a3;
- (void)setLastButtonMode:(int64_t)a3;
- (void)setStyles:(id)a3;
- (void)setTitles:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKStackedButtonView

- (HKStackedButtonView)initWithButtonTitles:(id)a3 styles:(id)a4 footerText:(id)a5 boldFooterText:(id)a6 footerTextAlignment:(int64_t)a7 delegate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v25 = a5;
  id v17 = a6;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HKStackedButtonView;
  v19 = -[HKStackedButtonView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_titles, a3);
    objc_storeStrong((id *)&v20->_styles, a4);
    objc_storeStrong((id *)&v20->_footerText, a5);
    objc_storeStrong((id *)&v20->_boldFooterText, a6);
    v20->_footerTextAlignment = a7;
    uint64_t v21 = [v15 count];
    if (v21 != [v16 count])
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v20 file:@"HKStackedButtonView.m" lineNumber:79 description:@"Titles and styles must have equal counts"];
    }
    objc_storeWeak((id *)&v20->_delegate, v18);
    [(HKStackedButtonView *)v20 _setUpBlurEffect];
    [(HKStackedButtonView *)v20 _setUpButtons];
  }

  return v20;
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 delegate:(id)a6
{
  return (id)[a1 buddyStackedButtonViewWithTitles:a3 footerText:a4 boldFooterText:a5 footerTextAlignment:4 delegate:a6];
}

+ (id)buddyStackedButtonViewWithTitles:(id)a3 footerText:(id)a4 boldFooterText:(id)a5 footerTextAlignment:(int64_t)a6 delegate:(id)a7
{
  v11 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HKStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke;
  v20[3] = &unk_1E6D56D50;
  id v21 = v16;
  id v17 = v16;
  [v15 enumerateObjectsUsingBlock:v20];
  id v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithButtonTitles:v15 styles:v17 footerText:v14 boldFooterText:v13 footerTextAlignment:a6 delegate:v12];

  return v18;
}

uint64_t __111__HKStackedButtonView_buddyStackedButtonViewWithTitles_footerText_boldFooterText_footerTextAlignment_delegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3) {
    v4 = &unk_1F3C228B8;
  }
  else {
    v4 = &unk_1F3C228A0;
  }
  return [v3 addObject:v4];
}

- (void)setLastButtonMode:(int64_t)a3
{
  if (self->_lastButtonMode != a3)
  {
    self->_lastButtonMode = a3;
    [(HKStackedButtonView *)self _updateBottomConstraint];
  }
}

- (void)setBottomAdjustsForHomeButtonlessScreen:(BOOL)a3
{
  if (self->_bottomAdjustsForHomeButtonlessScreen != a3)
  {
    self->_bottomAdjustsForHomeButtonlessScreen = a3;
    [(HKStackedButtonView *)self _updateBottomConstraint];
  }
}

- (void)setBlurHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_blurHidden = a3;
  v5 = [(HKStackedButtonView *)self backgroundBlurView];
  [v5 setHidden:v3];

  if (v3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [(HKStackedButtonView *)self setBackgroundColor:v6];
}

- (void)alignBlurViewHorizontalConstraintsWithView:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HKStackedButtonView *)self backgroundBlurViewLeadingConstraint];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(HKStackedButtonView *)self backgroundBlurViewLeadingConstraint];
    v24[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v6 deactivateConstraints:v8];

    [(HKStackedButtonView *)self setBackgroundBlurViewLeadingConstraint:0];
  }
  v9 = [(HKStackedButtonView *)self backgroundBlurViewTrailingConstraint];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F28DC8];
    v11 = [(HKStackedButtonView *)self backgroundBlurViewTrailingConstraint];
    v23 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v10 deactivateConstraints:v12];

    [(HKStackedButtonView *)self setBackgroundBlurViewTrailingConstraint:0];
  }
  id v13 = [(HKStackedButtonView *)self backgroundBlurView];
  id v14 = [v13 leadingAnchor];
  id v15 = [v4 leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [(HKStackedButtonView *)self setBackgroundBlurViewLeadingConstraint:v16];

  id v17 = [(HKStackedButtonView *)self backgroundBlurView];
  id v18 = [v17 trailingAnchor];
  v19 = [v4 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19];
  [(HKStackedButtonView *)self setBackgroundBlurViewTrailingConstraint:v20];

  id v21 = [(HKStackedButtonView *)self backgroundBlurViewLeadingConstraint];
  [v21 setActive:1];

  v22 = [(HKStackedButtonView *)self backgroundBlurViewTrailingConstraint];
  [v22 setActive:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKStackedButtonView;
  [(HKStackedButtonView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HKStackedButtonView *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKStackedButtonView *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)actionButtonTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(HKStackedButtonView *)self delegate];
  uint64_t v5 = [v4 tag];

  [v6 stackedButtonView:self didTapButtonAtIndex:v5];
}

- (void)_setUpButtons
{
  BOOL v3 = [(HKStackedButtonView *)self _createButtons];
  [(HKStackedButtonView *)self setButtons:v3];

  [(HKStackedButtonView *)self _setUpFooterText];
  [(HKStackedButtonView *)self _assignConstraintsForButtons];
  [(HKStackedButtonView *)self _updateConstraintsForButtons];
  [(HKStackedButtonView *)self _createViewBottomConstraint];
  [(HKStackedButtonView *)self _updateBottomConstraint];
}

- (void)_setUpBlurEffect
{
  BOOL v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:0];
  [(HKStackedButtonView *)self setBackgroundBlurEffect:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
  uint64_t v5 = [(HKStackedButtonView *)self backgroundBlurEffect];
  id v6 = (void *)[v4 initWithEffect:v5];
  [(HKStackedButtonView *)self setBackgroundBlurView:v6];

  v7 = [(HKStackedButtonView *)self backgroundBlurView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v8 = [(HKStackedButtonView *)self backgroundBlurView];
  [(HKStackedButtonView *)self addSubview:v8];

  objc_super v9 = [(HKStackedButtonView *)self backgroundBlurView];
  objc_msgSend(v9, "hk_alignVerticalConstraintsWithView:margin:", self, 0.0);

  [(HKStackedButtonView *)self alignBlurViewHorizontalConstraintsWithView:self];
  [(HKStackedButtonView *)self setBlurHidden:0];
}

- (id)_createButtons
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(HKStackedButtonView *)self titles];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__HKStackedButtonView__createButtons__block_invoke;
  v9[3] = &unk_1E6D555E0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __37__HKStackedButtonView__createButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  id v5 = [*(id *)(a1 + 32) styles];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1)
  {
    v11 = (void *)MEMORY[0x1E4FB14D0];
    objc_super v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
    uint64_t v10 = objc_msgSend(v11, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v9, v14, *(void *)(a1 + 32), sel_actionButtonTapped_);
    goto LABEL_5;
  }
  if (!v7)
  {
    char v8 = (void *)MEMORY[0x1E4FB14D0];
    objc_super v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
    uint64_t v10 = objc_msgSend(v8, "hk_buttonTintedWithColor:title:target:action:", v9, v14, *(void *)(a1 + 32), sel_actionButtonTapped_);
LABEL_5:
    id v12 = (void *)v10;

    goto LABEL_7;
  }
  id v12 = 0;
LABEL_7:
  id v13 = [v12 titleLabel];
  [v13 setAdjustsFontForContentSizeCategory:1];

  [v12 setTag:a3];
  [*(id *)(a1 + 40) addObject:v12];
  [*(id *)(a1 + 32) addSubview:v12];
}

- (void)_setUpFooterText
{
  BOOL v3 = [(HKStackedButtonView *)self footerText];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(HKStackedButtonView *)self setFooterTextLabel:v4];

    id v5 = [(HKStackedButtonView *)self _attributedFooterText];
    id v6 = [(HKStackedButtonView *)self footerTextLabel];
    [v6 setAttributedText:v5];

    uint64_t v7 = [(HKStackedButtonView *)self footerTextLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    char v8 = [(HKStackedButtonView *)self footerTextLabel];
    [v8 setNumberOfLines:0];

    objc_super v9 = [(HKStackedButtonView *)self footerTextLabel];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    int64_t v10 = [(HKStackedButtonView *)self footerTextAlignment];
    v11 = [(HKStackedButtonView *)self footerTextLabel];
    [v11 setTextAlignment:v10];

    id v12 = [(HKStackedButtonView *)self footerTextLabel];
    [(HKStackedButtonView *)self addSubview:v12];

    id v13 = [(HKStackedButtonView *)self footerTextLabel];
    objc_msgSend(v13, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    [(id)objc_opt_class() _footerTextSpacingForValue:40.0];
    -[HKStackedButtonView setFirstTopConstant:](self, "setFirstTopConstant:");
    id v14 = [(HKStackedButtonView *)self footerTextLabel];
    id v15 = [v14 firstBaselineAnchor];
    id v16 = [(HKStackedButtonView *)self topAnchor];
    [(HKStackedButtonView *)self firstTopConstant];
    id v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
    [v17 setActive:1];

    id v20 = [(HKStackedButtonView *)self footerTextLabel];
    id v18 = [v20 lastBaselineAnchor];
    [(HKStackedButtonView *)self setFirstTopAnchor:v18];
  }
  else
  {
    v19 = [(HKStackedButtonView *)self topAnchor];
    [(HKStackedButtonView *)self setFirstTopAnchor:v19];

    [(HKStackedButtonView *)self setFirstTopConstant:0.0];
  }
}

- (void)_assignConstraintsForButtons
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(HKStackedButtonView *)self buttons];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HKStackedButtonView *)self buttons];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int64_t v10 = __51__HKStackedButtonView__assignConstraintsForButtons__block_invoke;
  v11 = &unk_1E6D56D78;
  id v12 = self;
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v8];

  objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:", v7, v8, v9, v10, v11, v12);
  [(HKStackedButtonView *)self setButtonSpacingConstraints:v7];
}

void __51__HKStackedButtonView__assignConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v25 = a2;
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", *(void *)(a1 + 32), 0.0);
  id v5 = *(void **)(a1 + 32);
  if (a3)
  {
    id v6 = [v5 buttons];
    id v7 = [v6 objectAtIndexedSubscript:a3 - 1];

    uint64_t v8 = [*(id *)(a1 + 32) styles];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3 - 1];
    uint64_t v10 = [v9 integerValue];

    if (v10 == 1)
    {
      uint64_t v11 = [v7 bottomAnchor];
    }
    else
    {
      if (v10)
      {
        id v16 = 0;
LABEL_11:
        id v17 = [*(id *)(a1 + 32) styles];
        id v18 = [v17 objectAtIndexedSubscript:a3];
        uint64_t v19 = [v18 integerValue];

        if (v19 == 1)
        {
          uint64_t v20 = [v25 bottomAnchor];
        }
        else
        {
          if (v19)
          {
            id v21 = 0;
            goto LABEL_17;
          }
          uint64_t v20 = [v25 lastBaselineAnchor];
        }
        id v21 = (void *)v20;
LABEL_17:
        v22 = *(void **)(a1 + 40);
        v23 = [v21 constraintEqualToAnchor:v16];
        [v22 addObject:v23];

        goto LABEL_21;
      }
      uint64_t v11 = [v7 lastBaselineAnchor];
    }
    id v16 = (void *)v11;
    goto LABEL_11;
  }
  id v12 = [v5 styles];
  id v13 = [v12 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 integerValue];

  if (v14 == 1)
  {
    uint64_t v15 = [v25 topAnchor];
    goto LABEL_19;
  }
  id v7 = 0;
  if (!v14)
  {
    uint64_t v15 = [v25 firstBaselineAnchor];
LABEL_19:
    id v7 = (void *)v15;
  }
  v24 = *(void **)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) firstTopAnchor];
  id v21 = [v7 constraintEqualToAnchor:v16];
  [v24 addObject:v21];
LABEL_21:
}

- (void)_updateConstraintsForButtons
{
  BOOL v3 = [(HKStackedButtonView *)self buttonSpacingConstraints];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__HKStackedButtonView__updateConstraintsForButtons__block_invoke;
  v4[3] = &unk_1E6D56DA0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __51__HKStackedButtonView__updateConstraintsForButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  id v5 = [*(id *)(a1 + 32) styles];
  id v6 = v5;
  if (a3)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3 - 1];
    uint64_t v8 = [v7 integerValue];

    double v9 = 36.0;
    if (v8 != 1) {
      double v9 = 0.0;
    }
    if (v8) {
      double v10 = v9;
    }
    else {
      double v10 = 44.0;
    }
    uint64_t v11 = objc_opt_class();
    double v12 = v10;
    goto LABEL_8;
  }
  id v13 = [v5 objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 integerValue];

  if (v14 == 1)
  {
    [*(id *)(a1 + 32) firstTopConstant];
    if (v15 != 0.0)
    {
      uint64_t v16 = objc_opt_class();
      [*(id *)(a1 + 32) firstTopConstant];
      uint64_t v11 = (void *)v16;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen");
  }
  else if (!v14)
  {
    uint64_t v11 = objc_opt_class();
    double v12 = 32.0;
LABEL_8:
    [v11 _buttonSpacingForValue:v12];
  }
  objc_msgSend(v17, "setConstant:");
}

- (void)_createViewBottomConstraint
{
  BOOL v3 = [(HKStackedButtonView *)self styles];
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1)
  {
    id v6 = [(HKStackedButtonView *)self bottomAnchor];
    id v7 = [(HKStackedButtonView *)self buttons];
    uint64_t v8 = [v7 lastObject];
    uint64_t v9 = [v8 bottomAnchor];
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v6 = [(HKStackedButtonView *)self bottomAnchor];
    id v7 = [(HKStackedButtonView *)self buttons];
    uint64_t v8 = [v7 lastObject];
    uint64_t v9 = [v8 lastBaselineAnchor];
  }
  double v10 = (void *)v9;
  uint64_t v11 = [v6 constraintEqualToAnchor:v9];
  [(HKStackedButtonView *)self setBottomConstraint:v11];

LABEL_6:
  id v12 = [(HKStackedButtonView *)self bottomConstraint];
  [v12 setActive:1];
}

- (void)_updateBottomConstraint
{
  id v4 = [(HKStackedButtonView *)self styles];
  uint64_t v5 = [v4 lastObject];
  uint64_t v6 = [v5 integerValue];

  if ([(HKStackedButtonView *)self lastButtonMode] == 1)
  {
    id v7 = [(HKStackedButtonView *)self titles];
    uint64_t v8 = [v7 count];

    if (v8 != 1 && v6 != 1)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"HKStackedButtonView.m" lineNumber:379 description:@"Tried to use 'Primary in Flow' with a button count other than 1 and style other than Rounded Rect"];
    }
  }
  double v10 = 0.0;
  if (v6 == 1)
  {
    int64_t v11 = [(HKStackedButtonView *)self lastButtonMode];
    double v12 = 60.0;
    if (v11 != 1) {
      double v12 = 0.0;
    }
    if (v11) {
      double v10 = v12;
    }
    else {
      double v10 = 44.0;
    }
  }
  else if (!v6)
  {
    double v10 = 30.0;
  }
  if ([(HKStackedButtonView *)self bottomAdjustsForHomeButtonlessScreen]) {
    double v10 = v10 + 14.0;
  }
  [(id)objc_opt_class() _buttonSpacingForValue:v10];
  double v14 = v13;
  id v15 = [(HKStackedButtonView *)self bottomConstraint];
  [v15 setConstant:v14];
}

- (void)_updateForCurrentSizeCategory
{
  BOOL v3 = [(HKStackedButtonView *)self footerText];

  if (v3)
  {
    id v4 = [(HKStackedButtonView *)self _attributedFooterText];
    uint64_t v5 = [(HKStackedButtonView *)self footerTextLabel];
    [v5 setAttributedText:v4];

    [(HKStackedButtonView *)self setNeedsLayout];
  }
  [(HKStackedButtonView *)self _updateBottomConstraint];
  [(HKStackedButtonView *)self _updateConstraintsForButtons];
}

- (id)_attributedFooterText
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E48];
  id v4 = [(HKStackedButtonView *)self footerText];
  uint64_t v5 = *MEMORY[0x1E4FB2950];
  uint64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  id v7 = [(HKStackedButtonView *)self boldFooterText];
  uint64_t v8 = objc_msgSend(v3, "hk_attributedStringForText:style:color:boldText:", v4, v5, v6, v7);

  return v8;
}

+ (id)createButtonBackgroundView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  BOOL v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v2 setBackgroundColor:v3];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v2, "hk_maskAllCornersWithRadius:", 10.0);
  return v2;
}

- (id)firstBaselineAnchor
{
  id v2 = [(HKStackedButtonView *)self buttons];
  BOOL v3 = [v2 firstObject];
  id v4 = [v3 firstBaselineAnchor];

  return v4;
}

- (id)lastBaselineAnchor
{
  id v2 = [(HKStackedButtonView *)self buttons];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 lastBaselineAnchor];

  return v4;
}

+ (id)_footerFontTextStyle
{
  return (id)*MEMORY[0x1E4FB2950];
}

+ (id)_footerTextFont
{
  id v2 = (void *)MEMORY[0x1E4FB08E0];
  BOOL v3 = [(id)objc_opt_class() _footerFontTextStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

+ (id)_footerTextBoldFont
{
  id v2 = (void *)MEMORY[0x1E4FB08E0];
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
  id v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_scalableFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 0x8000);
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

- (BOOL)bottomAdjustsForHomeButtonlessScreen
{
  return self->_bottomAdjustsForHomeButtonlessScreen;
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

- (NSArray)buttonSpacingConstraints
{
  return self->_buttonSpacingConstraints;
}

- (void)setButtonSpacingConstraints:(id)a3
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

- (HKStackedButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKStackedButtonViewDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_buttonSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end