@interface MKPlaceHeaderButton
- (BOOL)_isTintColorWhite;
- (MKPlaceHeaderButton)init;
- (MKPlaceHeaderButton)initWithPrimaryType:(unint64_t)a3;
- (_MKPlaceActionButtonController)buttonController;
- (id)_primaryButtonColor;
- (id)_primaryButtonTextColor;
- (void)_contentSizeDidChange;
- (void)_setVibrantView;
- (void)_updateStyleNonPrimaryButton;
- (void)_updateStylePrimaryButton;
- (void)applyButtonDefaultConfiguration;
- (void)buttonSelected:(id)a3;
- (void)infoCardThemeChanged;
- (void)placeActionButtonControllerTextDidChange:(id)a3;
- (void)setButtonController:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPrimaryTitle:(id)a3;
- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4;
- (void)updateButtonWithHighlighted:(BOOL)a3;
@end

@implementation MKPlaceHeaderButton

- (MKPlaceHeaderButton)init
{
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceHeaderButton;
  v2 = [(MKPlaceHeaderButton *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MKPlaceHeaderButton *)v2 titleLabel];
    [v4 setNumberOfLines:3];

    v5 = [(MKPlaceHeaderButton *)v3 titleLabel];
    [v5 setMinimumScaleFactor:0.699999988];

    v6 = [(MKPlaceHeaderButton *)v3 titleLabel];
    [v6 setAdjustsFontSizeToFitWidth:1];
  }
  return v3;
}

- (MKPlaceHeaderButton)initWithPrimaryType:(unint64_t)a3
{
  v4 = [(MKPlaceHeaderButton *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_primary = 1;
    v4->_buttonType = a3;
    [(MKPlaceHeaderButton *)v4 applyButtonDefaultConfiguration];
    [(MKPlaceHeaderButton *)v5 _setVibrantView];
    [(MKPlaceHeaderButton *)v5 _updateStylePrimaryButton];
  }
  return v5;
}

- (void)setButtonController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_buttonController, obj);
    [obj setDelegate:self];

    -[MKPlaceHeaderButton setEnabled:](self, "setEnabled:", [obj disabled] ^ 1);
    [(MKPlaceHeaderButton *)self applyButtonDefaultConfiguration];
    [(MKPlaceHeaderButton *)self _updateStyleNonPrimaryButton];
    id v6 = objc_loadWeakRetained((id *)&self->_buttonController);
    v7 = [v6 buttonTitle];
    id v8 = objc_loadWeakRetained((id *)&self->_buttonController);
    v9 = [v8 buttonSubTitle];
    [(MKPlaceHeaderButton *)self setPrimaryTitle:v7 subtitle:v9];

    [(MKPlaceHeaderButton *)self _setVibrantView];
  }
}

- (void)_setVibrantView
{
  v28[4] = *MEMORY[0x1E4F143B8];
  if (self->_primary) {
    goto LABEL_14;
  }
  if (![(MKPlaceHeaderButton *)self _isTintColorWhite]) {
    goto LABEL_11;
  }
  if (self->_primary)
  {
LABEL_14:
    if (![(MKPlaceHeaderButton *)self _isTintColorWhite])
    {
      if (self->_primary) {
        return;
      }
      goto LABEL_7;
    }
LABEL_11:
    v9 = [MKVibrantView alloc];
    v10 = -[MKVibrantView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    vibrantView = self->_vibrantView;
    self->_vibrantView = v10;

    [(MKVibrantView *)self->_vibrantView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKVibrantView *)self->_vibrantView setBackgroundColor:v12];

    [(MKVibrantView *)self->_vibrantView setUserInteractionEnabled:0];
    [(MKVibrantView *)self->_vibrantView setContinuousCornerRadius:8.0];
    [(MKPlaceHeaderButton *)self insertSubview:self->_vibrantView atIndex:0];
    v23 = (void *)MEMORY[0x1E4F28DC8];
    id v27 = [(MKVibrantView *)self->_vibrantView topAnchor];
    v25 = [(MKPlaceHeaderButton *)self topAnchor];
    v24 = [v27 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v13 = [(MKVibrantView *)self->_vibrantView bottomAnchor];
    v14 = [(MKPlaceHeaderButton *)self bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v28[1] = v15;
    v16 = [(MKVibrantView *)self->_vibrantView leadingAnchor];
    v17 = [(MKPlaceHeaderButton *)self leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v28[2] = v18;
    v19 = [(MKVibrantView *)self->_vibrantView trailingAnchor];
    v20 = [(MKPlaceHeaderButton *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v28[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v23 activateConstraints:v22];

    return;
  }
LABEL_7:
  if ([(MKPlaceHeaderButton *)self _isTintColorWhite])
  {
    v3 = [(MKPlaceHeaderButton *)self layer];
    [v3 setCornerRadius:8.0];

    uint64_t v4 = *MEMORY[0x1E4F39EA8];
    id v5 = [(MKPlaceHeaderButton *)self layer];
    [v5 setCornerCurve:v4];

    id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.200000003];
    uint64_t v7 = [v6 CGColor];
    id v8 = [(MKPlaceHeaderButton *)self layer];
    [v8 setBorderColor:v7];

    id v26 = [(MKPlaceHeaderButton *)self layer];
    [v26 setBorderWidth:1.0];
  }
}

- (void)_contentSizeDidChange
{
  v3 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v4 = (void *)MEMORY[0x1E4F42A38];
  int v5 = _MKPlaceCardUseSmallerFont();
  id v6 = (void *)MEMORY[0x1E4F43890];
  if (!v5) {
    id v6 = (void *)MEMORY[0x1E4F438C0];
  }
  uint64_t v7 = [v4 preferredFontDescriptorWithTextStyle:*v6 addingSymbolicTraits:2 options:0];
  id v8 = [v3 fontWithDescriptor:v7 size:0.0];
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 52.0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  if (self->_primary)
  {
    id WeakRetained = [(MKPlaceHeaderButton *)self titleLabel];
    v9 = [WeakRetained attributedText];
    [(MKPlaceHeaderButton *)self setPrimaryTitle:v9];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    v9 = [WeakRetained buttonTitle];
    id v10 = objc_loadWeakRetained((id *)&self->_buttonController);
    v11 = [v10 buttonSubTitle];
    [(MKPlaceHeaderButton *)self setPrimaryTitle:v9 subtitle:v11];
  }
}

- (void)infoCardThemeChanged
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHeaderButton;
  [(UIView *)&v7 infoCardThemeChanged];
  if (self->_primary)
  {
    [(MKPlaceHeaderButton *)self _updateStylePrimaryButton];
  }
  else
  {
    [(MKPlaceHeaderButton *)self _updateStyleNonPrimaryButton];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    uint64_t v4 = [WeakRetained buttonTitle];
    id v5 = objc_loadWeakRetained((id *)&self->_buttonController);
    id v6 = [v5 buttonSubTitle];
    [(MKPlaceHeaderButton *)self setPrimaryTitle:v4 subtitle:v6];
  }
}

- (void)applyButtonDefaultConfiguration
{
  [(MKPlaceHeaderButton *)self _accessibilitySetInterfaceStyleIntent:1];
  -[MKPlaceHeaderButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 5.0, 10.0, 5.0, 10.0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained) {
    [(MKPlaceHeaderButton *)self addTarget:self action:sel_buttonSelected_ forControlEvents:0x2000];
  }
  [(MKPlaceHeaderButton *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = [(MKPlaceHeaderButton *)self heightAnchor];
  id v5 = (void *)MEMORY[0x1E4F42A30];
  id v6 = (void *)MEMORY[0x1E4F42A38];
  int v7 = _MKPlaceCardUseSmallerFont();
  id v8 = (void *)MEMORY[0x1E4F43890];
  if (!v7) {
    id v8 = (void *)MEMORY[0x1E4F438C0];
  }
  v9 = [v6 preferredFontDescriptorWithTextStyle:*v8 addingSymbolicTraits:2 options:0];
  id v10 = [v5 fontWithDescriptor:v9 size:0.0];
  objc_msgSend(v10, "_mapkit_scaledValueForValue:", 52.0);
  objc_msgSend(v4, "constraintEqualToConstant:");
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v11;

  [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)buttonSelected:(id)a3
{
  id v4 = a3;
  if (!self->_primary)
  {
    id v8 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    id v6 = [WeakRetained buttonSelectedBlock];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v8;
      }
      else {
        id v7 = 0;
      }
      ((void (**)(void, id))v6)[2](v6, v7);
    }

    id v4 = v8;
  }
}

- (BOOL)_isTintColorWhite
{
  v2 = [(UIView *)self mk_theme];
  v3 = [v2 tintColor];
  id v4 = [MEMORY[0x1E4F428B8] whiteColor];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_primaryButtonTextColor
{
  return (id)[MEMORY[0x1E4F428B8] whiteColor];
}

- (id)_primaryButtonColor
{
  unint64_t buttonType = self->_buttonType;
  if (buttonType <= 4)
  {
    if (buttonType == 2)
    {
      id v4 = [(UIView *)self mk_theme];
      if ([v4 isDarkTheme])
      {
        double v6 = 0.243137255;
        double v7 = 0.776470602;
        double v8 = 0.333333343;
      }
      else
      {
        double v6 = 0.270000011;
        double v7 = 0.860000014;
        double v8 = 0.370000005;
      }
      uint64_t v5 = [MEMORY[0x1E4F428B8] colorWithRed:v6 green:v7 blue:v8 alpha:1.0];
    }
    else
    {
      id v4 = [(UIView *)self mk_theme];
      uint64_t v5 = [v4 tintColor];
    }
    v2 = (void *)v5;
  }

  return v2;
}

- (void)setPrimaryTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v10 = [(MKPlaceHeaderButton *)self _primaryButtonTextColor];
  double v6 = (void *)[v4 mutableCopy];
  uint64_t v7 = *MEMORY[0x1E4F42510];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E4F42510], v10, 0, v5);
  [(MKPlaceHeaderButton *)self setAttributedTitle:v6 forState:0];
  double v8 = [v10 colorWithAlphaComponent:0.25];
  v9 = (void *)[v4 mutableCopy];

  objc_msgSend(v9, "addAttribute:value:range:", v7, v8, 0, v5);
  [(MKPlaceHeaderButton *)self setAttributedTitle:v9 forState:1];
}

- (void)_updateStylePrimaryButton
{
  if (self->_primary)
  {
    [(MKPlaceHeaderButton *)self updateButtonWithHighlighted:self->_buttonHighlighted];
    if (![(MKPlaceHeaderButton *)self _isTintColorWhite])
    {
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"Button");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      [(MKPlaceHeaderButton *)self setBackgroundImage:v3 forState:0];
    }
  }
}

- (void)_updateStyleNonPrimaryButton
{
  if (!self->_primary) {
    [(MKPlaceHeaderButton *)self updateButtonWithHighlighted:self->_buttonHighlighted];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  self->_buttonHighlighted = a3;
  -[MKPlaceHeaderButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:");
}

- (void)updateButtonWithHighlighted:(BOOL)a3
{
  if (a3)
  {
    if (self->_primary && ![(MKPlaceHeaderButton *)self _isTintColorWhite])
    {
      id v7 = [(UIView *)self mk_theme];
      uint64_t v5 = [v7 headerPrimaryButtonHighlightedColor];
      [(MKPlaceHeaderButton *)self setTintColor:v5];
      goto LABEL_9;
    }
    id v7 = [(UIView *)self mk_theme];
    uint64_t v4 = [v7 buttonHighlightedColor];
LABEL_8:
    uint64_t v5 = (void *)v4;
    double v6 = [(MKVibrantView *)self->_vibrantView contentView];
    [v6 setBackgroundColor:v5];

LABEL_9:
    goto LABEL_10;
  }
  if (!self->_primary || [(MKPlaceHeaderButton *)self _isTintColorWhite])
  {
    id v7 = [(UIView *)self mk_theme];
    uint64_t v4 = [v7 buttonNormalColor];
    goto LABEL_8;
  }
  id v7 = [(MKPlaceHeaderButton *)self _primaryButtonColor];
  [(MKPlaceHeaderButton *)self setTintColor:v7];
LABEL_10:
}

- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  double v6 = (__CFString *)a3;
  id v7 = a4;
  double v8 = v7;
  if (v6) {
    v9 = v6;
  }
  else {
    v9 = &stru_1ED919588;
  }
  if ([v7 length])
  {
    double v10 = 0.0;
    double v11 = -1.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F437F8];
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  -[MKPlaceHeaderButton setContentEdgeInsets:](self, "setContentEdgeInsets:", v11, v10, v12, v13);
  uint64_t v14 = [v8 length];
  id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v16 = *MEMORY[0x1E4F42508];
  if (v14)
  {
    uint64_t v47 = *MEMORY[0x1E4F42508];
    v17 = (void *)MEMORY[0x1E4F42A30];
    v18 = (void *)MEMORY[0x1E4F42A38];
    int v19 = _MKPlaceCardUseSmallerFont();
    uint64_t v20 = *MEMORY[0x1E4F43890];
    uint64_t v21 = *MEMORY[0x1E4F438C0];
    if (v19) {
      uint64_t v22 = *MEMORY[0x1E4F43890];
    }
    else {
      uint64_t v22 = *MEMORY[0x1E4F438C0];
    }
    v23 = objc_msgSend(v18, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v22, 2, 0, v9);
    v24 = [v17 fontWithDescriptor:v23 size:0.0];
    v48 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v26 = (void *)[v15 initWithString:v9 attributes:v25];

    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v26 appendAttributedString:v27];

    id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v45 = v16;
    v29 = (void *)MEMORY[0x1E4F42A30];
    if (_MKPlaceCardUseSmallerFont()) {
      uint64_t v30 = v20;
    }
    else {
      uint64_t v30 = v21;
    }
    v31 = [v29 preferredFontForTextStyle:v30];
    [v31 pointSize];
    v32 = objc_msgSend(v29, "systemFontOfSize:weight:");
    v46 = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v34 = (void *)[v28 initWithString:v8 attributes:v33];
    [v26 appendAttributedString:v34];
  }
  else
  {
    uint64_t v49 = *MEMORY[0x1E4F42508];
    v35 = (void *)MEMORY[0x1E4F42A30];
    v36 = (void *)MEMORY[0x1E4F42A38];
    int v37 = _MKPlaceCardUseSmallerFont();
    v38 = (void *)MEMORY[0x1E4F43890];
    if (!v37) {
      v38 = (void *)MEMORY[0x1E4F438C0];
    }
    v31 = objc_msgSend(v36, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v38, 2, 0, v9);
    v32 = [v35 fontWithDescriptor:v31 size:0.0];
    v50[0] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v26 = (void *)[v15 initWithString:v9 attributes:v33];
  }

  v39 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  v40 = (void *)[v39 mutableCopy];

  [v40 setAlignment:1];
  [v40 setParagraphSpacing:-3.0];
  [v40 setLineBreakMode:5];
  uint64_t v41 = [v26 length];
  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v40, 0, v41);
  if ([(MKPlaceHeaderButton *)self isEnabled])
  {
    v42 = [(UIView *)self mk_theme];
    [v42 tintColor];
  }
  else
  {
    v42 = [MEMORY[0x1E4F428B8] labelColor];
    [v42 colorWithAlphaComponent:0.3];
  v43 = };

  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E4F42510], v43, 0, v41);
  [(MKPlaceHeaderButton *)self setAttributedTitle:v26 forState:0];
}

- (void)placeActionButtonControllerTextDidChange:(id)a3
{
  p_buttonController = &self->_buttonController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonController);

  if (WeakRetained == v5)
  {
    id v10 = objc_loadWeakRetained((id *)p_buttonController);
    id v7 = [v10 buttonTitle];
    id v8 = objc_loadWeakRetained((id *)p_buttonController);
    v9 = [v8 buttonSubTitle];
    [(MKPlaceHeaderButton *)self setPrimaryTitle:v7 subtitle:v9];
  }
}

- (_MKPlaceActionButtonController)buttonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  return (_MKPlaceActionButtonController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonController);
  objc_storeStrong((id *)&self->_vibrantView, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end