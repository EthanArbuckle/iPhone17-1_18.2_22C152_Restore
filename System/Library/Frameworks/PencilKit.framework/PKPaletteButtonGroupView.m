@interface PKPaletteButtonGroupView
- (BOOL)useEqualInterItemSpacing;
- (NSArray)buttons;
- (NSDirectionalEdgeInsets)additionalContentMargins;
- (NSLayoutConstraint)buttonStackViewBottomConstraint;
- (NSLayoutConstraint)buttonStackViewLeadingConstraint;
- (NSLayoutConstraint)buttonStackViewTopConstraint;
- (NSLayoutConstraint)buttonStackViewTrailingConstraint;
- (PKPaletteButtonGroupView)initWithFrame:(CGRect)a3;
- (UIStackView)buttonStackView;
- (double)scalingFactor;
- (int64_t)axis;
- (void)_updateUI;
- (void)addButton:(id)a3;
- (void)addButtonsFromArray:(id)a3;
- (void)removeAllButtons;
- (void)setAdditionalContentMargins:(NSDirectionalEdgeInsets)a3;
- (void)setAxis:(int64_t)a3;
- (void)setButtonStackView:(id)a3;
- (void)setButtonStackViewBottomConstraint:(id)a3;
- (void)setButtonStackViewLeadingConstraint:(id)a3;
- (void)setButtonStackViewTopConstraint:(id)a3;
- (void)setButtonStackViewTrailingConstraint:(id)a3;
- (void)setButtons:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setUseEqualInterItemSpacing:(BOOL)a3;
@end

@implementation PKPaletteButtonGroupView

- (PKPaletteButtonGroupView)initWithFrame:(CGRect)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PKPaletteButtonGroupView;
  v3 = -[PKPaletteButtonGroupView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PKPaletteButtonGroupView *)v3;
  if (v3)
  {
    *((void *)v3 + 52) = 0x3FF0000000000000;
    long long v5 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *(_OWORD *)(v3 + 472) = *MEMORY[0x1E4FB12A8];
    *(_OWORD *)(v3 + 488) = v5;
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    buttonStackView = v4->_buttonStackView;
    v4->_buttonStackView = v6;

    [(UIStackView *)v4->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_buttonStackView setAlignment:3];
    [(PKPaletteButtonGroupView *)v4 addSubview:v4->_buttonStackView];
    v8 = [(UIStackView *)v4->_buttonStackView topAnchor];
    v9 = [(PKPaletteButtonGroupView *)v4 topAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    buttonStackViewTopConstraint = v4->_buttonStackViewTopConstraint;
    v4->_buttonStackViewTopConstraint = (NSLayoutConstraint *)v10;

    v12 = [(UIStackView *)v4->_buttonStackView leadingAnchor];
    v13 = [(PKPaletteButtonGroupView *)v4 leadingAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    buttonStackViewLeadingConstraint = v4->_buttonStackViewLeadingConstraint;
    v4->_buttonStackViewLeadingConstraint = (NSLayoutConstraint *)v14;

    v16 = [(UIStackView *)v4->_buttonStackView bottomAnchor];
    v17 = [(PKPaletteButtonGroupView *)v4 bottomAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    buttonStackViewBottomConstraint = v4->_buttonStackViewBottomConstraint;
    v4->_buttonStackViewBottomConstraint = (NSLayoutConstraint *)v18;

    v20 = [(UIStackView *)v4->_buttonStackView trailingAnchor];
    v21 = [(PKPaletteButtonGroupView *)v4 trailingAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    buttonStackViewTrailingConstraint = v4->_buttonStackViewTrailingConstraint;
    v4->_buttonStackViewTrailingConstraint = (NSLayoutConstraint *)v22;

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v28[0] = v4->_buttonStackViewTopConstraint;
    v28[1] = v4->_buttonStackViewLeadingConstraint;
    v28[2] = v4->_buttonStackViewBottomConstraint;
    v28[3] = v4->_buttonStackViewTrailingConstraint;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v24 activateConstraints:v25];

    [(PKPaletteButtonGroupView *)v4 _updateUI];
    [(PKPaletteButtonGroupView *)v4 setShouldGroupAccessibilityChildren:1];
  }
  return v4;
}

- (void)addButton:(id)a3
{
  id v4 = a3;
  id v6 = [(PKPaletteButtonGroupView *)self buttons];
  long long v5 = [v6 arrayByAddingObject:v4];

  [(PKPaletteButtonGroupView *)self setButtons:v5];
}

- (void)addButtonsFromArray:(id)a3
{
  id v4 = a3;
  id v6 = [(PKPaletteButtonGroupView *)self buttons];
  long long v5 = [v6 arrayByAddingObjectsFromArray:v4];

  [(PKPaletteButtonGroupView *)self setButtons:v5];
}

- (void)removeAllButtons
{
}

- (void)setButtons:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  long long v5 = v4;
  if (self->_buttons != v4)
  {
    id v6 = (NSArray *)[(NSArray *)v4 copy];
    buttons = self->_buttons;
    self->_buttons = v6;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v8 = [(PKPaletteButtonGroupView *)self buttonStackView];
    v9 = [v8 arrangedSubviews];
    uint64_t v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1C8784520]();
          v17 = [(PKPaletteButtonGroupView *)self buttonStackView];
          [v17 removeArrangedSubview:v15];

          [v15 removeFromSuperview];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v18 = v5;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          objc_msgSend(v23, "removeFromSuperview", (void)v25);
          v24 = [(PKPaletteButtonGroupView *)self buttonStackView];
          [v24 addArrangedSubview:v23];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }

    [(PKPaletteButtonGroupView *)self _updateUI];
  }
}

- (int64_t)axis
{
  v2 = [(PKPaletteButtonGroupView *)self buttonStackView];
  int64_t v3 = [v2 axis];

  return v3;
}

- (void)setAxis:(int64_t)a3
{
  id v4 = [(PKPaletteButtonGroupView *)self buttonStackView];
  [v4 setAxis:a3];
}

- (void)setUseEqualInterItemSpacing:(BOOL)a3
{
  if (self->_useEqualInterItemSpacing != a3)
  {
    self->_useEqualInterItemSpacing = a3;
    [(PKPaletteButtonGroupView *)self _updateUI];
  }
}

- (void)setAdditionalContentMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_additionalContentMargins.leading != a3.leading
    || self->_additionalContentMargins.top != a3.top
    || self->_additionalContentMargins.trailing != a3.trailing
    || self->_additionalContentMargins.bottom != a3.bottom)
  {
    self->_additionalContentMargins = a3;
    [(PKPaletteButtonGroupView *)self _updateUI];
  }
}

- (void)_updateUI
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteButtonGroupView *)self useEqualInterItemSpacing]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [(PKPaletteButtonGroupView *)self buttonStackView];
  [v4 setDistribution:v3];

  if ([(PKPaletteButtonGroupView *)self useEqualInterItemSpacing])
  {
    double v5 = 1.17549435e-38;
  }
  else
  {
    [(PKPaletteButtonGroupView *)self scalingFactor];
    double v5 = v6 * 12.0;
  }
  v7 = [(PKPaletteButtonGroupView *)self buttonStackView];
  [v7 setSpacing:v5];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v8 = [(PKPaletteButtonGroupView *)self buttons];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [(PKPaletteButtonGroupView *)self scalingFactor];
        objc_msgSend(v13, "setScalingFactor:");
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  [(PKPaletteButtonGroupView *)self additionalContentMargins];
  double v15 = v14;
  [(PKPaletteButtonGroupView *)self scalingFactor];
  double v17 = v15 * v16;
  uint64_t v18 = [(PKPaletteButtonGroupView *)self buttonStackViewTopConstraint];
  [v18 setConstant:v17];

  [(PKPaletteButtonGroupView *)self additionalContentMargins];
  double v20 = v19;
  [(PKPaletteButtonGroupView *)self scalingFactor];
  double v22 = v20 * v21;
  v23 = [(PKPaletteButtonGroupView *)self buttonStackViewLeadingConstraint];
  [v23 setConstant:v22];

  [(PKPaletteButtonGroupView *)self additionalContentMargins];
  double v25 = v24;
  [(PKPaletteButtonGroupView *)self scalingFactor];
  double v27 = -(v25 * v26);
  long long v28 = [(PKPaletteButtonGroupView *)self buttonStackViewBottomConstraint];
  [v28 setConstant:v27];

  [(PKPaletteButtonGroupView *)self additionalContentMargins];
  double v30 = v29;
  [(PKPaletteButtonGroupView *)self scalingFactor];
  double v32 = -(v30 * v31);
  v33 = [(PKPaletteButtonGroupView *)self buttonStackViewTrailingConstraint];
  [v33 setConstant:v32];
}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    [(PKPaletteButtonGroupView *)self _updateUI];
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)useEqualInterItemSpacing
{
  return self->_useEqualInterItemSpacing;
}

- (NSDirectionalEdgeInsets)additionalContentMargins
{
  double top = self->_additionalContentMargins.top;
  double leading = self->_additionalContentMargins.leading;
  double bottom = self->_additionalContentMargins.bottom;
  double trailing = self->_additionalContentMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (NSLayoutConstraint)buttonStackViewTopConstraint
{
  return self->_buttonStackViewTopConstraint;
}

- (void)setButtonStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonStackViewLeadingConstraint
{
  return self->_buttonStackViewLeadingConstraint;
}

- (void)setButtonStackViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonStackViewBottomConstraint
{
  return self->_buttonStackViewBottomConstraint;
}

- (void)setButtonStackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonStackViewTrailingConstraint
{
  return self->_buttonStackViewTrailingConstraint;
}

- (void)setButtonStackViewTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end