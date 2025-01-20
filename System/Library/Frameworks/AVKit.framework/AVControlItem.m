@interface AVControlItem
- (AVControlItem)initWithTitle:(id)a3 type:(int64_t)a4;
- (AVControlItemDelegate)delegate;
- (BOOL)isEnabled;
- (BOOL)isSecondGenerationControl;
- (NSString)accessibilityIdentifier;
- (NSString)identifier;
- (NSString)title;
- (UIColor)tintColor;
- (UIImage)image;
- (UIMenu)menu;
- (UIView)view;
- (id)_formattedTitleString;
- (id)accessibilityAttributedHint;
- (id)accessibilityAttributedLabel;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)action;
- (id)titleFont;
- (int64_t)type;
- (void)_buttonTouchUpInside:(id)a3;
- (void)_createButton;
- (void)_notifyDelegateOfChangesIfNeeded;
- (void)_updateButton;
- (void)_updateShowsMenuAsPrimaryActionStateIfNeeded;
- (void)_updateTintColor;
- (void)setAccessibilityAttributedHint:(id)a3;
- (void)setAccessibilityAttributedLabel:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setSecondGenerationControl:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation AVControlItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

- (BOOL)isSecondGenerationControl
{
  return self->_secondGenerationControl;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setDelegate:(id)a3
{
}

- (AVControlItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVControlItemDelegate *)WeakRetained;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)action
{
  return self->_action;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)type
{
  return self->_type;
}

- (void)_updateShowsMenuAsPrimaryActionStateIfNeeded
{
  [(AVButton *)self->_button setShowsMenuAsPrimaryAction:self->_action == 0];
}

- (void)_updateButton
{
  button = self->_button;
  v4 = [(AVControlItem *)self title];
  [(AVButton *)button setAccessibilityLabel:v4];

  [(AVButton *)self->_button setEnabled:[(AVControlItem *)self isEnabled]];
  v5 = self->_button;
  v6 = [(AVControlItem *)self image];
  [(AVButton *)v5 setImage:v6 forState:0];

  v7 = [(AVControlItem *)self image];

  if (v7) {
    [(AVButton *)self->_button setAppliesTransformToImageViewWhenHighlighted:1];
  }
  BOOL secondGenerationControl = self->_secondGenerationControl;
  uint64_t v9 = [(AVControlItem *)self image];
  v10 = (void *)v9;
  if (secondGenerationControl)
  {
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      v11 = [(AVControlItem *)self _formattedTitleString];
    }

    [(AVButton *)self->_button setAttributedTitle:v11 forState:0];
  }
  else
  {
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      v11 = [(AVControlItem *)self title];
    }

    [(AVButton *)self->_button setTitle:v11 forState:0];
  }

  v12 = [(AVButton *)self->_button titleLabel];
  v13 = [(AVControlItem *)self titleFont];
  [v12 setFont:v13];

  [(AVControlItem *)self _notifyDelegateOfChangesIfNeeded];
}

- (void)_notifyDelegateOfChangesIfNeeded
{
  uint64_t v3 = [(AVControlItem *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(AVControlItem *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(AVControlItem *)self delegate];
      [v7 controlItemDidUpdateVisualConfiguration:self];
    }
  }
}

- (id)_formattedTitleString
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (self->_secondGenerationControl)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F24388]);
    id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
    v5 = [(AVControlItem *)self title];
    v15[0] = *MEMORY[0x1E4FB06F8];
    char v6 = [(AVControlItem *)self titleFont];
    uint64_t v7 = *MEMORY[0x1E4F24368];
    v16[0] = v6;
    v16[1] = v3;
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    v15[1] = v7;
    v15[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
    v16[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v11 = (void *)[v4 initWithString:v5 attributes:v10];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13 = [(AVControlItem *)self title];
    v11 = (void *)[v12 initWithString:v13 attributes:0];
  }

  return v11;
}

- (void)_buttonTouchUpInside:(id)a3
{
  id v4 = [(AVControlItem *)self action];

  if (v4)
  {
    v5 = [(AVControlItem *)self action];
    v5[2]();
  }
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)[(AVButton *)self->_button accessibilityIdentifier];
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (id)accessibilityAttributedHint
{
  return (id)[(AVButton *)self->_button accessibilityAttributedHint];
}

- (void)setAccessibilityAttributedHint:(id)a3
{
}

- (id)accessibilityHint
{
  return (id)[(AVButton *)self->_button accessibilityHint];
}

- (void)setAccessibilityHint:(id)a3
{
}

- (id)accessibilityAttributedLabel
{
  return (id)[(AVButton *)self->_button accessibilityAttributedLabel];
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
}

- (id)accessibilityLabel
{
  return [(AVButton *)self->_button accessibilityLabel];
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (void)_createButton
{
  button = self->_button;
  if (button)
  {
    self->_button = 0;
  }
  BOOL v4 = !self->_secondGenerationControl && self->_type == 2;
  v5 = +[AVButton buttonWithAccessibilityIdentifier:self->_title isSecondGeneration:self->_secondGenerationControl];
  char v6 = self->_button;
  self->_button = v5;

  [(AVButton *)self->_button addTarget:self action:sel__buttonTouchUpInside_ forControlEvents:64];
  [(AVButton *)self->_button setUsesBackgroundEffectViewForTextOnlyButtons:v4];
  [(AVControlItem *)self setTitleFont:0];
  [(AVControlItem *)self setTintColor:0];

  [(AVControlItem *)self _updateButton];
}

- (UIView)view
{
  return (UIView *)self->_button;
}

- (void)setSecondGenerationControl:(BOOL)a3
{
  if (self->_secondGenerationControl != a3)
  {
    self->_BOOL secondGenerationControl = a3;
    [(AVControlItem *)self _createButton];
  }
}

- (void)_updateTintColor
{
  id v3 = [(AVControlItem *)self tintColor];
  +[AVBackdropView applyGlyphTintColor:v3 toView:self->_button];

  [(AVControlItem *)self _notifyDelegateOfChangesIfNeeded];
}

- (id)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    double v5 = 20.0;
    if (!self->_secondGenerationControl) {
      double v5 = 12.0;
    }
    id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v5];
  }
  id obj = v4;
  if (([(UIFont *)self->_titleFont isEqual:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, obj);
    [(AVControlItem *)self _updateButton];
  }
}

- (void)setTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (!v4)
  {
    id v4 = +[AVBackdropView secondaryGlyphTintColor];
  }
  p_tintColor = &self->_tintColor;
  if (self->_tintColor != v4)
  {
    char v6 = v4;
    objc_storeStrong((id *)p_tintColor, v4);
    p_tintColor = (UIColor **)[(AVControlItem *)self _updateTintColor];
    id v4 = v6;
  }

  MEMORY[0x1F41817F8](p_tintColor, v4);
}

- (void)setMenu:(id)a3
{
  id v6 = a3;
  id v4 = [(AVButton *)self->_button menu];

  double v5 = v6;
  if (v4 != v6)
  {
    [(AVButton *)self->_button setMenu:v6];
    [(AVControlItem *)self _updateShowsMenuAsPrimaryActionStateIfNeeded];
    [(AVControlItem *)self _updateButton];
    double v5 = v6;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(AVControlItem *)self _updateButton];
  }
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    [(AVControlItem *)self _updateButton];
    p_image = (UIImage **)[(AVControlItem *)self _updateTintColor];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    id v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    [(AVControlItem *)self _updateButton];
    [(AVControlItem *)self _updateTintColor];
  }
}

- (void)setAction:(id)a3
{
  if (self->_action != a3)
  {
    id v4 = (void *)[a3 copy];
    id action = self->_action;
    self->_id action = v4;

    [(AVControlItem *)self _updateShowsMenuAsPrimaryActionStateIfNeeded];
  }
}

- (UIMenu)menu
{
  return (UIMenu *)[(AVButton *)self->_button menu];
}

- (AVControlItem)initWithTitle:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVControlItem;
  uint64_t v7 = [(AVControlItem *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_type = a4;
    v7->_enabled = 1;
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_BOOL secondGenerationControl = 1;
    [(AVControlItem *)v7 _createButton];
  }

  return v7;
}

@end