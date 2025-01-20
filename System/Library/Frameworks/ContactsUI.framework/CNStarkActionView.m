@interface CNStarkActionView
+ (id)propertyTransportButtonWithDelegate:(id)a3;
+ (id)quickActionButtonWithDelegate:(id)a3;
- (BOOL)disabledButtonFocused;
- (BOOL)enabled;
- (BOOL)selected;
- (CGSize)intrinsicContentSize;
- (CNStarkActionView)initWithDelegate:(id)a3;
- (CNStarkActionViewDelegate)delegate;
- (NSString)actionType;
- (NSString)title;
- (UIButton)button;
- (UIColor)disabledFillColor;
- (UIColor)disabledGlyphColor;
- (UIColor)disabledStrokeColor;
- (UIColor)enabledFillColor;
- (UIColor)enabledGlyphColor;
- (UIColor)enabledStrokeColor;
- (UIColor)selectedFillColor;
- (UIColor)selectedGlyphColor;
- (UIColor)selectedStrokeColor;
- (UIImage)image;
- (UILabel)label;
- (double)actionBorderWidth;
- (double)actionLabelOffset;
- (double)actionPlatterSize;
- (void)clickGestureDidUpdate:(id)a3;
- (void)deselect;
- (void)notifyDelegateAboutUserChoice;
- (void)select;
- (void)setActionBorderWidth:(double)a3;
- (void)setActionLabelOffset:(double)a3;
- (void)setActionPlatterSize:(double)a3;
- (void)setActionType:(id)a3;
- (void)setDisabledButtonFocused:(BOOL)a3;
- (void)setDisabledFillColor:(id)a3;
- (void)setDisabledGlyphColor:(id)a3;
- (void)setDisabledStrokeColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledFillColor:(id)a3;
- (void)setEnabledGlyphColor:(id)a3;
- (void)setEnabledStrokeColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedFillColor:(id)a3;
- (void)setSelectedGlyphColor:(id)a3;
- (void)setSelectedStrokeColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupButton;
- (void)setupClickGestureRecognizer;
- (void)setupConstraints;
- (void)setupLabel;
- (void)stateUpdated;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForFocusedState:(BOOL)a3;
@end

@implementation CNStarkActionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedFillColor, 0);
  objc_storeStrong((id *)&self->_selectedStrokeColor, 0);
  objc_storeStrong((id *)&self->_enabledGlyphColor, 0);
  objc_storeStrong((id *)&self->_enabledFillColor, 0);
  objc_storeStrong((id *)&self->_enabledStrokeColor, 0);
  objc_storeStrong((id *)&self->_disabledGlyphColor, 0);
  objc_storeStrong((id *)&self->_disabledFillColor, 0);
  objc_storeStrong((id *)&self->_disabledStrokeColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_actionType, 0);
}

- (void)setDisabledButtonFocused:(BOOL)a3
{
  self->_disabledButtonFocused = a3;
}

- (BOOL)disabledButtonFocused
{
  return self->_disabledButtonFocused;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (UILabel)label
{
  return self->_label;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setSelectedGlyphColor:(id)a3
{
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedFillColor:(id)a3
{
}

- (UIColor)selectedFillColor
{
  return self->_selectedFillColor;
}

- (void)setSelectedStrokeColor:(id)a3
{
}

- (UIColor)selectedStrokeColor
{
  return self->_selectedStrokeColor;
}

- (void)setEnabledGlyphColor:(id)a3
{
}

- (UIColor)enabledGlyphColor
{
  return self->_enabledGlyphColor;
}

- (void)setEnabledFillColor:(id)a3
{
}

- (UIColor)enabledFillColor
{
  return self->_enabledFillColor;
}

- (void)setEnabledStrokeColor:(id)a3
{
}

- (UIColor)enabledStrokeColor
{
  return self->_enabledStrokeColor;
}

- (void)setDisabledGlyphColor:(id)a3
{
}

- (UIColor)disabledGlyphColor
{
  return self->_disabledGlyphColor;
}

- (void)setDisabledFillColor:(id)a3
{
}

- (UIColor)disabledFillColor
{
  return self->_disabledFillColor;
}

- (void)setDisabledStrokeColor:(id)a3
{
}

- (UIColor)disabledStrokeColor
{
  return self->_disabledStrokeColor;
}

- (void)setActionBorderWidth:(double)a3
{
  self->_actionBorderWidth = a3;
}

- (double)actionBorderWidth
{
  return self->_actionBorderWidth;
}

- (void)setActionLabelOffset:(double)a3
{
  self->_actionLabelOffset = a3;
}

- (double)actionLabelOffset
{
  return self->_actionLabelOffset;
}

- (void)setActionPlatterSize:(double)a3
{
  self->_actionPlatterSize = a3;
}

- (double)actionPlatterSize
{
  return self->_actionPlatterSize;
}

- (CNStarkActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNStarkActionViewDelegate *)WeakRetained;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)stateUpdated
{
  v3 = [(CNStarkActionView *)self title];
  v4 = [(CNStarkActionView *)self label];
  [v4 setText:v3];

  BOOL v5 = [(CNStarkActionView *)self enabled];
  v6 = [(CNStarkActionView *)self button];
  [v6 setEnabled:v5];

  v7 = [(CNStarkActionView *)self button];
  v8 = [(CNStarkActionView *)self image];
  [v7 setImage:v8 forState:0];

  id v42 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  v9 = [(CNStarkActionView *)self traitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v9];

  if ([(CNStarkActionView *)self enabled]
    && ([(CNStarkActionView *)self selected]
     || [(CNStarkActionView *)self isFocused]))
  {
    id v10 = [(CNStarkActionView *)self selectedStrokeColor];
    uint64_t v11 = [v10 CGColor];
    v12 = [(CNStarkActionView *)self button];
    v13 = [v12 layer];
    [v13 setBorderColor:v11];

    id v14 = [(CNStarkActionView *)self selectedFillColor];
    uint64_t v15 = [v14 CGColor];
    v16 = [(CNStarkActionView *)self button];
    v17 = [v16 layer];
    [v17 setBackgroundColor:v15];

    uint64_t v18 = [(CNStarkActionView *)self selectedGlyphColor];
  }
  else
  {
    if (![(CNStarkActionView *)self enabled])
    {
      id v30 = [(CNStarkActionView *)self disabledStrokeColor];
      uint64_t v31 = [v30 CGColor];
      v32 = [(CNStarkActionView *)self button];
      v33 = [v32 layer];
      [v33 setBorderColor:v31];

      id v34 = [(CNStarkActionView *)self disabledFillColor];
      uint64_t v35 = [v34 CGColor];
      v36 = [(CNStarkActionView *)self button];
      v37 = [v36 layer];
      [v37 setBackgroundColor:v35];

      if ([(CNStarkActionView *)self disabledButtonFocused]) {
        [(CNStarkActionView *)self selectedGlyphColor];
      }
      else {
      v38 = [(CNStarkActionView *)self disabledGlyphColor];
      }
      v39 = [(CNStarkActionView *)self button];
      [v39 setTintColor:v38];

      uint64_t v29 = +[CNUIColorRepository carPlayQuickActionButtonTitleTextColorDisabled];
      goto LABEL_12;
    }
    id v19 = [(CNStarkActionView *)self enabledStrokeColor];
    uint64_t v20 = [v19 CGColor];
    v21 = [(CNStarkActionView *)self button];
    v22 = [v21 layer];
    [v22 setBorderColor:v20];

    id v23 = [(CNStarkActionView *)self enabledFillColor];
    uint64_t v24 = [v23 CGColor];
    v25 = [(CNStarkActionView *)self button];
    v26 = [v25 layer];
    [v26 setBackgroundColor:v24];

    uint64_t v18 = [(CNStarkActionView *)self enabledGlyphColor];
  }
  v27 = (void *)v18;
  v28 = [(CNStarkActionView *)self button];
  [v28 setTintColor:v27];

  uint64_t v29 = +[CNUIColorRepository carPlayQuickActionButtonTitleTextColorEnabled];
LABEL_12:
  v40 = (void *)v29;
  v41 = [(CNStarkActionView *)self label];
  [v41 setTextColor:v40];

  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v42];
}

- (void)updateForFocusedState:(BOOL)a3
{
  [(CNStarkActionView *)self setDisabledButtonFocused:a3];

  [(CNStarkActionView *)self stateUpdated];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNStarkActionView;
  [(CNStarkActionView *)&v6 traitCollectionDidChange:a3];
  if (_AXSCarPlayEnhanceTextLegibilityEnabled()) {
    +[CNUIFontRepository carPlayQuickActionButtonTitleFontBold];
  }
  else {
  v4 = +[CNUIFontRepository carPlayQuickActionButtonTitleFont];
  }
  BOOL v5 = [(CNStarkActionView *)self label];
  [v5 setFont:v4];

  [(CNStarkActionView *)self stateUpdated];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(CNStarkActionView *)self stateUpdated];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);

  [(CNStarkActionView *)self stateUpdated];
}

- (CGSize)intrinsicContentSize
{
  [(CNStarkActionView *)self actionPlatterSize];
  double v4 = v3;
  [(CNStarkActionView *)self actionPlatterSize];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)notifyDelegateAboutUserChoice
{
  if ([(CNStarkActionView *)self enabled])
  {
    id v3 = [(CNStarkActionView *)self delegate];
    [v3 actionViewTapped:self];
  }
}

- (void)deselect
{
  [(CNStarkActionView *)self setSelected:0];

  [(CNStarkActionView *)self stateUpdated];
}

- (void)select
{
  if ([(CNStarkActionView *)self enabled])
  {
    [(CNStarkActionView *)self setSelected:1];
    [(CNStarkActionView *)self stateUpdated];
  }
}

- (void)clickGestureDidUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [(CNStarkActionView *)self choose];
  }
  else if ([v4 state] == 4 || objc_msgSend(v4, "state") == 5)
  {
    [(CNStarkActionView *)self deselect];
  }
}

- (void)setupClickGestureRecognizer
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_clickGestureDidUpdate_];
  [v3 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  [v3 setAllowedPressTypes:&unk_1ED915B60];
  [(CNStarkActionView *)self addGestureRecognizer:v3];
}

- (void)setupConstraints
{
  v33[5] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = objc_opt_new();
  uint64_t v29 = [(CNStarkActionView *)self widthAnchor];
  [(CNStarkActionView *)self actionPlatterSize];
  v27 = objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:");
  v33[0] = v27;
  v25 = [(UIButton *)self->_button topAnchor];
  id v23 = [(CNStarkActionView *)self topAnchor];
  v22 = [v25 constraintEqualToAnchor:v23];
  v33[1] = v22;
  v21 = [(UIButton *)self->_button centerXAnchor];
  id v3 = [(CNStarkActionView *)self centerXAnchor];
  id v4 = [v21 constraintEqualToAnchor:v3];
  v33[2] = v4;
  double v5 = [(UIButton *)self->_button widthAnchor];
  [(CNStarkActionView *)self actionPlatterSize];
  double v6 = objc_msgSend(v5, "constraintEqualToConstant:");
  v33[3] = v6;
  double v7 = [(UIButton *)self->_button heightAnchor];
  v8 = [(UIButton *)self->_button widthAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v33[4] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
  [v31 addObjectsFromArray:v10];

  label = self->_label;
  if (label)
  {
    id v30 = [(UILabel *)label leadingAnchor];
    v28 = [(CNStarkActionView *)self leadingAnchor];
    v26 = [v30 constraintEqualToAnchor:v28];
    v32[0] = v26;
    uint64_t v24 = [(UILabel *)self->_label firstBaselineAnchor];
    v12 = [(UIButton *)self->_button bottomAnchor];
    [(CNStarkActionView *)self actionLabelOffset];
    v13 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v12);
    v32[1] = v13;
    id v14 = [(UILabel *)self->_label trailingAnchor];
    uint64_t v15 = [(CNStarkActionView *)self trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v32[2] = v16;
    v17 = [(UILabel *)self->_label bottomAnchor];
    uint64_t v18 = [(CNStarkActionView *)self bottomAnchor];
    id v19 = [v17 constraintEqualToAnchor:v18];
    v32[3] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v31 addObjectsFromArray:v20];
  }
  [(CNStarkActionView *)self addConstraints:v31];
}

- (void)setActionType:(id)a3
{
  id v8 = a3;
  if (([v8 isEqualToString:self->_actionType] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actionType, a3);
    double v5 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_carPlayUserActionSymbolImageForActionType:", v8);
    [(CNStarkActionView *)self setImage:v5];

    double v6 = [NSString stringWithFormat:@"CNStarkActionView - %@", v8];
    double v7 = [(CNStarkActionView *)self label];
    [v7 setAccessibilityValue:v6];

    [(CNStarkActionView *)self stateUpdated];
  }
}

- (void)setupButton
{
  id v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  button = self->_button;
  self->_button = v3;

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNStarkActionView *)self actionPlatterSize];
  double v6 = v5 * 0.5;
  double v7 = [(UIButton *)self->_button layer];
  [v7 setCornerRadius:v6];

  [(CNStarkActionView *)self actionBorderWidth];
  double v9 = v8;
  id v10 = [(UIButton *)self->_button layer];
  [v10 setBorderWidth:v9];

  [(UIButton *)self->_button setAdjustsImageWhenDisabled:0];
  [(UIButton *)self->_button addTarget:self action:sel_actionViewTapped_ forControlEvents:64];
  [(UIButton *)self->_button addTarget:self action:sel_actionViewTouchDown_ forControlEvents:1];
  [(UIButton *)self->_button addTarget:self action:sel_actionViewTouchUp_ forControlEvents:192];
  uint64_t v11 = self->_button;

  [(CNStarkActionView *)self addSubview:v11];
}

- (void)setupLabel
{
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setTextAlignment:1];
  if (_AXSCarPlayEnhanceTextLegibilityEnabled()) {
    +[CNUIFontRepository carPlayQuickActionButtonTitleFontBold];
  }
  else {
  double v5 = +[CNUIFontRepository carPlayQuickActionButtonTitleFont];
  }
  [(UILabel *)self->_label setFont:v5];

  [(UILabel *)self->_label setIsAccessibilityElement:0];
  double v6 = self->_label;

  [(CNStarkActionView *)self addSubview:v6];
}

- (CNStarkActionView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNStarkActionView;
  double v5 = [(CNStarkActionView *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    double v7 = v6;
  }

  return v6;
}

+ (id)propertyTransportButtonWithDelegate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3];

  [v4 setActionPlatterSize:36.0];
  [v4 setActionBorderWidth:2.0];
  double v5 = +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorDisabled];
  [v4 setDisabledStrokeColor:v5];

  double v6 = +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorDisabled];
  [v4 setDisabledFillColor:v6];

  double v7 = +[CNUIColorRepository carPlayTransportButtonGlyphColorDisabled];
  [v4 setDisabledGlyphColor:v7];

  double v8 = +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorEnabled];
  [v4 setEnabledStrokeColor:v8];

  objc_super v9 = +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorEnabled];
  [v4 setEnabledFillColor:v9];

  id v10 = +[CNUIColorRepository carPlayTransportButtonGlyphColorEnabled];
  [v4 setEnabledGlyphColor:v10];

  uint64_t v11 = +[CNUIColorRepository carPlayTransportButtonBackgroundStrokeColorSelected];
  [v4 setSelectedStrokeColor:v11];

  v12 = +[CNUIColorRepository carPlayTransportButtonBackgroundFillColorSelected];
  [v4 setSelectedFillColor:v12];

  v13 = +[CNUIColorRepository carPlayTransportButtonGlyphColorSelected];
  [v4 setSelectedGlyphColor:v13];

  [v4 setupButton];
  [v4 setupConstraints];
  [v4 setupClickGestureRecognizer];
  [v4 stateUpdated];

  return v4;
}

+ (id)quickActionButtonWithDelegate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3];

  [v4 setActionPlatterSize:50.0];
  [v4 setActionBorderWidth:2.0];
  [v4 setActionLabelOffset:16.0];
  double v5 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorDisabled];
  [v4 setDisabledStrokeColor:v5];

  double v6 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorDisabled];
  [v4 setDisabledFillColor:v6];

  double v7 = +[CNUIColorRepository carPlayQuickActionButtonGlyphColorDisabled];
  [v4 setDisabledGlyphColor:v7];

  double v8 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorEnabled];
  [v4 setEnabledStrokeColor:v8];

  objc_super v9 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorEnabled];
  [v4 setEnabledFillColor:v9];

  id v10 = +[CNUIColorRepository carPlayQuickActionButtonGlyphColorEnabled];
  [v4 setEnabledGlyphColor:v10];

  uint64_t v11 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundStrokeColorSelected];
  [v4 setSelectedStrokeColor:v11];

  v12 = +[CNUIColorRepository carPlayQuickActionButtonBackgroundFillColorSelected];
  [v4 setSelectedFillColor:v12];

  v13 = +[CNUIColorRepository carPlayQuickActionButtonGlyphColorSelected];
  [v4 setSelectedGlyphColor:v13];

  [v4 setupLabel];
  [v4 setupButton];
  [v4 setupConstraints];
  [v4 setupClickGestureRecognizer];
  [v4 stateUpdated];

  return v4;
}

@end