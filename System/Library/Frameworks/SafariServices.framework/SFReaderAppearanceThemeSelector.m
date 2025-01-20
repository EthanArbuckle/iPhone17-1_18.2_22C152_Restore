@interface SFReaderAppearanceThemeSelector
+ (double)requiredHeight;
+ (id)themeSelectorWithBlock:(id)a3;
- (BOOL)isSelectedValue:(id)a3;
- (NSArray)values;
- (SFReaderAppearanceThemeSelector)initWithFrame:(CGRect)a3;
- (id)_buttonForTheme:(int64_t)a3;
- (id)_imageForTheme:(int64_t)a3 selected:(BOOL)a4;
- (id)_themeButtonImageWithFillColor:(id)a3 strokeColor:(id)a4 selected:(BOOL)a5;
- (id)imageForValue:(id)a3;
- (id)selectedThemeChangedBlock;
- (id)selectedValue;
- (int64_t)_themeForButton:(id)a3;
- (int64_t)selectedTheme;
- (void)_changeSelectionForTheme:(int64_t)a3 selected:(BOOL)a4;
- (void)_createThemeButtons;
- (void)_themeButtonAction:(id)a3;
- (void)_updateSelectedTheme;
- (void)selectValue:(id)a3;
- (void)setSelectedTheme:(int64_t)a3;
- (void)setSelectedThemeChangedBlock:(id)a3;
@end

@implementation SFReaderAppearanceThemeSelector

+ (id)themeSelectorWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  [a1 requiredHeight];
  v7 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, 320.0, v6);
  [v7 setSelectedThemeChangedBlock:v4];

  return v7;
}

- (SFReaderAppearanceThemeSelector)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFReaderAppearanceThemeSelector;
  v3 = -[SFReaderAppearanceThemeSelector initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(SFReaderAppearanceThemeSelector *)v3 _createThemeButtons];
    [(SFReaderAppearanceThemeSelector *)v4 _updateSelectedTheme];
    id v5 = v4;
  }

  return v4;
}

+ (double)requiredHeight
{
  return 58.0;
}

- (void)setSelectedTheme:(int64_t)a3
{
  if (self->_selectedTheme != a3)
  {
    self->_selectedTheme = a3;
    [(SFReaderAppearanceThemeSelector *)self _updateSelectedTheme];
    id selectedThemeChangedBlock = self->_selectedThemeChangedBlock;
    if (selectedThemeChangedBlock)
    {
      id v5 = (void (*)(void))*((void *)selectedThemeChangedBlock + 2);
      v5();
    }
  }
}

- (void)_updateSelectedTheme
{
  BOOL v3 = self->_selectedTheme == 0;
  id v4 = [(SFReaderAppearanceThemeSelector *)self _buttonForTheme:0];
  [v4 setSelected:v3];

  BOOL v5 = self->_selectedTheme == 1;
  double v6 = [(SFReaderAppearanceThemeSelector *)self _buttonForTheme:1];
  [v6 setSelected:v5];

  BOOL v7 = self->_selectedTheme == 2;
  v8 = [(SFReaderAppearanceThemeSelector *)self _buttonForTheme:2];
  [v8 setSelected:v7];

  BOOL v9 = self->_selectedTheme == 3;
  id v10 = [(SFReaderAppearanceThemeSelector *)self _buttonForTheme:3];
  [v10 setSelected:v9];
}

- (void)_changeSelectionForTheme:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SFReaderAppearanceThemeSelector *)self _buttonForTheme:a3];
  [v5 setSelected:v4];
}

- (id)_buttonForTheme:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.super.super.isa + *off_1E5C74F30[a3]);
  }
  return v4;
}

- (int64_t)_themeForButton:(id)a3
{
  id v4 = (UIButton *)a3;
  if (self->_whiteButton == v4)
  {
    int64_t v5 = 0;
  }
  else if (self->_sepiaButton == v4)
  {
    int64_t v5 = 1;
  }
  else if (self->_grayButton == v4)
  {
    int64_t v5 = 2;
  }
  else if (self->_nightButton == v4)
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_createThemeButtons
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __54__SFReaderAppearanceThemeSelector__createThemeButtons__block_invoke;
  v45[3] = &unk_1E5C74F10;
  v45[4] = self;
  uint64_t v3 = MEMORY[0x1AD0C36A0](v45, a2);
  (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  id v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
  whiteButton = self->_whiteButton;
  self->_whiteButton = v4;

  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  double v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
  sepiaButton = self->_sepiaButton;
  self->_sepiaButton = v6;

  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 2);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  grayButton = self->_grayButton;
  self->_grayButton = v8;

  [(UIButton *)self->_grayButton setAccessibilityIgnoresInvertColors:1];
  v40 = (void *)v3;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 3);
  id v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nightButton = self->_nightButton;
  self->_nightButton = v10;

  [(UIButton *)self->_nightButton setAccessibilityIgnoresInvertColors:1];
  v12 = self->_sepiaButton;
  v48[0] = self->_whiteButton;
  v48[1] = v12;
  v13 = self->_nightButton;
  v48[2] = self->_grayButton;
  v48[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  v15 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v14];
  stackView = self->_stackView;
  self->_stackView = v15;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setSpacing:17.0];
  [(SFReaderAppearanceThemeSelector *)self addSubview:self->_stackView];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(*((void *)&v41 + 1) + 8 * v21) attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
        [(SFReaderAppearanceThemeSelector *)self addConstraint:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v19);
  }

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(UIStackView *)self->_stackView centerXAnchor];
  v38 = [(SFReaderAppearanceThemeSelector *)self centerXAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v46[0] = v37;
  v36 = [(UIStackView *)self->_stackView topAnchor];
  v35 = [(SFReaderAppearanceThemeSelector *)self topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:9.0];
  v46[1] = v34;
  v32 = [(UIStackView *)self->_stackView leadingAnchor];
  v23 = [(SFReaderAppearanceThemeSelector *)self leadingAnchor];
  v24 = [v32 constraintGreaterThanOrEqualToAnchor:v23 constant:17.0];
  v46[2] = v24;
  v25 = [(SFReaderAppearanceThemeSelector *)self trailingAnchor];
  v26 = [(UIStackView *)self->_stackView trailingAnchor];
  v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26 constant:17.0];
  v46[3] = v27;
  v28 = [(SFReaderAppearanceThemeSelector *)self bottomAnchor];
  v29 = [(UIStackView *)self->_stackView bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:9.0];
  v46[4] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
  [v33 activateConstraints:v31];
}

id __54__SFReaderAppearanceThemeSelector__createThemeButtons__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[SFReaderThemeButton buttonWithType:0];
  int64_t v5 = [*(id *)(a1 + 32) _imageForTheme:a2 selected:0];
  [v4 setImage:v5 forState:0];

  double v6 = [*(id *)(a1 + 32) _imageForTheme:a2 selected:1];
  [v4 setImage:v6 forState:4];

  BOOL v7 = WBSReaderThemeLocalizedName();
  [v4 setAccessibilityLabel:v7];

  [v4 setFocusGroupIdentifier:0];
  [v4 addTarget:*(void *)(a1 + 32) action:sel__themeButtonAction_ forControlEvents:0x2000];

  return v4;
}

- (id)_imageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(SFReaderAppearanceThemeSelector *)self tintColor];
  }
  else {
  double v6 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", a3, 0.0, 0.2);
  }
  BOOL v7 = WBSReaderThemeColor();
  v8 = [(SFReaderAppearanceThemeSelector *)self _themeButtonImageWithFillColor:v7 strokeColor:v6 selected:v4];

  return v8;
}

- (id)_themeButtonImageWithFillColor:(id)a3 strokeColor:(id)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = (void *)MEMORY[0x1E4FB1BA8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 mainScreen];
  [v10 scale];
  double v12 = v11;

  v22.width = 40.0;
  v22.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
  v13 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, 40.0, 40.0);
  [v8 setFill];

  [v13 fill];
  if (v5)
  {
    v14 = (void *)MEMORY[0x1E4FB14C0];
    double v15 = 36.0;
    double v16 = 2.0;
    double v17 = 2.0;
  }
  else
  {
    double v16 = 1.0 / v12;
    v14 = (void *)MEMORY[0x1E4FB14C0];
    double v15 = 1.0 / v12 * -2.0 + 40.0;
    double v17 = 1.0 / v12;
  }
  uint64_t v18 = objc_msgSend(v14, "bezierPathWithOvalInRect:", v16, v17, v15, v15);
  [v9 setFill];

  [v18 fill];
  uint64_t v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (void)_themeButtonAction:(id)a3
{
  int64_t v4 = [(SFReaderAppearanceThemeSelector *)self _themeForButton:a3];

  [(SFReaderAppearanceThemeSelector *)self setSelectedTheme:v4];
}

- (NSArray)values
{
  return (NSArray *)&unk_1EFBDF8F8;
}

- (id)selectedValue
{
  v2 = NSNumber;
  int64_t v3 = [(SFReaderAppearanceThemeSelector *)self selectedTheme];

  return (id)[v2 numberWithInteger:v3];
}

- (id)imageForValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SFReaderAppearanceThemeSelector *)self isSelectedValue:v4];
  uint64_t v6 = [v4 integerValue];

  return [(SFReaderAppearanceThemeSelector *)self _imageForTheme:v6 selected:v5];
}

- (BOOL)isSelectedValue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SFReaderAppearanceThemeSelector *)self selectedValue];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void)selectValue:(id)a3
{
  uint64_t v4 = [a3 integerValue];

  [(SFReaderAppearanceThemeSelector *)self setSelectedTheme:v4];
}

- (int64_t)selectedTheme
{
  return self->_selectedTheme;
}

- (id)selectedThemeChangedBlock
{
  return self->_selectedThemeChangedBlock;
}

- (void)setSelectedThemeChangedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedThemeChangedBlock, 0);
  objc_storeStrong((id *)&self->_nightButton, 0);
  objc_storeStrong((id *)&self->_grayButton, 0);
  objc_storeStrong((id *)&self->_sepiaButton, 0);
  objc_storeStrong((id *)&self->_whiteButton, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end