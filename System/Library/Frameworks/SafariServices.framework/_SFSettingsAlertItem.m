@interface _SFSettingsAlertItem
+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7;
+ (id)optionGroupOptionWithAttributedTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7;
+ (id)optionsGroupWithTitle:(id)a3 action:(int64_t)a4 subItemAction:(int64_t)a5 controller:(id)a6;
+ (id)paletteWithAction:(int64_t)a3 controller:(id)a4;
+ (id)singleLineButtonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7;
+ (id)stepperWithController:(id)a3 action:(int64_t)a4 handler:(id)a5;
- (BOOL)isConfigurable;
- (BOOL)isEnabled;
- (BOOL)isFavorited;
- (BOOL)isSelected;
- (BOOL)keepsMenuPresented;
- (BOOL)showsIndicatorDot;
- (BOOL)showsStatusAlert;
- (NSArray)componentsArrangement;
- (NSArray)subItems;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSString)accessibilityIdentifier;
- (NSString)badgeText;
- (NSString)menuAction;
- (NSString)subtitle;
- (NSString)textStyle;
- (NSString)title;
- (SFSettingsAlertItemView)view;
- (SFSettingsAlertItemView)viewAsUIView;
- (UIColor)overrideColor;
- (UIColor)tintColor;
- (UIImage)icon;
- (UIImageView)statusImageView;
- (UIMenu)popUpMenu;
- (UIView)badgeView;
- (_SFSettingsAlertButton)viewAsButton;
- (_SFSettingsAlertItem)group;
- (_SFSettingsAlertItem)initWithType:(int64_t)a3 action:(int64_t)a4;
- (id)controller;
- (id)handler;
- (id)selectionHandler;
- (id)viewConfigurationBlock;
- (int64_t)actionType;
- (int64_t)type;
- (void)_buttonCommonInitWithTextStyle:(id)a3 icon:(id)a4 handler:(id)a5;
- (void)_updateButtonSubtitle;
- (void)_updateButtonTitle;
- (void)addObserver:(id)a3;
- (void)notifyObserversItemDidUpdate;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBadgeText:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setComponentsArrangement:(id)a3;
- (void)setController:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFavorited:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setIcon:(id)a3;
- (void)setKeepsMenuPresented:(BOOL)a3;
- (void)setPopUpMenu:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setShowsIndicatorDot:(BOOL)a3;
- (void)setShowsStatusAlert:(BOOL)a3;
- (void)setStatusImageView:(id)a3;
- (void)setSubItems:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextStyle:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpSelectionHandlerIfNeededWithViewController:(id)a3;
- (void)setView:(id)a3;
- (void)setViewConfigurationBlock:(id)a3;
- (void)updateOptionsGroupDetailLabel;
@end

@implementation _SFSettingsAlertItem

- (_SFSettingsAlertItem)initWithType:(int64_t)a3 action:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertItem;
  v6 = [(_SFSettingsAlertItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_actionType = a4;
    v6->_enabled = 1;
    v8 = v6;
  }

  return v7;
}

- (void)_buttonCommonInitWithTextStyle:(id)a3 icon:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(_SFSettingsAlertItem *)self setTextStyle:a3];
  [(_SFSettingsAlertItem *)self setIcon:v9];

  [(_SFSettingsAlertItem *)self setHandler:v8];
  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(_SFSettingsAlertItem *)self setTintColor:v10];
}

+ (id)buttonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithType:0 action:a6];
  [v16 setTitle:v15];

  [v16 _buttonCommonInitWithTextStyle:v14 icon:v13 handler:v12];

  return v16;
}

+ (id)singleLineButtonWithTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithType:1 action:a6];
  [v16 setTitle:v15];

  [v16 _buttonCommonInitWithTextStyle:v14 icon:v13 handler:v12];

  return v16;
}

+ (id)stepperWithController:(id)a3 action:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithType:2 action:a4];
  [v10 setController:v9];

  [v10 setHandler:v8];

  return v10;
}

+ (id)optionsGroupWithTitle:(id)a3 action:(int64_t)a4 subItemAction:(int64_t)a5 controller:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)a1) initWithType:3 action:a4];
  [v12 setTitle:v11];

  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  id v14 = [v10 values];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke;
  v24[3] = &unk_1E5C76148;
  id v25 = v10;
  id v26 = v13;
  int64_t v27 = a5;
  id v15 = v13;
  id v16 = v10;
  v17 = objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", v24);
  [v12 setSubItems:v17];

  [v12 setHandler:&__block_literal_global_35];
  v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
  v19 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v20 = [v18 flattenedImageWithColor:v19];
  v21 = [v20 imageWithRenderingMode:1];
  [v12 setIcon:v21];

  v22 = [MEMORY[0x1E4FB1618] labelColor];
  [v12 setTintColor:v22];

  [v12 setController:v16];
  [v12 setTextStyle:*MEMORY[0x1E4FB28C8]];
  [v12 setViewConfigurationBlock:&__block_literal_global_15];

  return v12;
}

+ (id)optionGroupOptionWithAttributedTitle:(id)a3 textStyle:(id)a4 icon:(id)a5 action:(int64_t)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithType:4 action:a6];
  [v16 setAttributedTitle:v15];

  [v16 _buttonCommonInitWithTextStyle:v14 icon:v13 handler:v12];

  return v16;
}

+ (id)paletteWithAction:(int64_t)a3 controller:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:5 action:a3];
  [v7 setController:v6];

  return v7;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  id v4 = [(_SFSettingsAlertItem *)self view];
  [v4 setSelected:v3];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id v4 = [(_SFSettingsAlertItem *)self view];
    [v4 setEnabled:v3];
  }
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeWeak((id *)&self->_view, obj);
    objc_msgSend(obj, "setEnabled:", -[_SFSettingsAlertItem isEnabled](self, "isEnabled"));
    objc_msgSend(obj, "setSelected:", -[_SFSettingsAlertItem isSelected](self, "isSelected"));
    v5 = [(_SFSettingsAlertItem *)self accessibilityIdentifier];
    id v6 = [(_SFSettingsAlertItem *)self viewAsUIView];
    [v6 setAccessibilityIdentifier:v5];
  }
}

- (void)setSubItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  subItems = self->_subItems;
  if (subItems != v4 && ![(NSArray *)subItems isEqualToArray:v4])
  {
    id v6 = (NSArray *)[(NSArray *)v4 copy];
    v7 = self->_subItems;
    self->_subItems = v6;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v4;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 192), self);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  accessibilityIdentifier = self->_accessibilityIdentifier;
  self->_accessibilityIdentifier = v5;

  id v7 = [(_SFSettingsAlertItem *)self viewAsUIView];
  [v7 setAccessibilityIdentifier:v4];
}

- (void)updateOptionsGroupDetailLabel
{
  if (self->_type == 3)
  {
    id v3 = self->_controller;
    id v4 = [v3 values];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53___SFSettingsAlertItem_updateOptionsGroupDetailLabel__block_invoke;
    v14[3] = &unk_1E5C761B0;
    id v5 = v3;
    id v15 = v5;
    id v6 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v14);

    id v7 = [(_SFSettingsAlertItem *)self viewAsButton];
    id v8 = [v7 accessoryView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v7 accessoryView];
    }
    else
    {
      uint64_t v10 = objc_alloc_init(_SFOptionsGroupDetailLabel);
      [(_SFOptionsGroupDetailLabel *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(_SFOptionsGroupDetailLabel *)v10 setTextColor:v11];

      [(_SFOptionsGroupDetailLabel *)v10 setUserInteractionEnabled:0];
      [(_SFOptionsGroupDetailLabel *)v10 setNumberOfLines:0];
      LODWORD(v12) = 1144733696;
      [(_SFOptionsGroupDetailLabel *)v10 setContentCompressionResistancePriority:0 forAxis:v12];
      [v7 setAccessoryView:v10];
    }
    long long v13 = [v5 attributedStringForValue:v6];
    [(_SFOptionsGroupDetailLabel *)v10 setAttributedText:v13];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)a3;
  title = self->_title;
  if (title != v4)
  {
    uint64_t v10 = v4;
    BOOL v6 = [(NSString *)title isEqualToString:v4];
    id v4 = v10;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v10 copy];
      id v8 = self->_title;
      self->_title = v7;

      attributedTitle = self->_attributedTitle;
      self->_attributedTitle = 0;

      [(_SFSettingsAlertItem *)self _updateButtonTitle];
      id v4 = v10;
    }
  }
}

- (void)setAttributedTitle:(id)a3
{
  id v4 = (NSAttributedString *)a3;
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != v4)
  {
    uint64_t v11 = v4;
    BOOL v6 = [(NSAttributedString *)attributedTitle isEqualToAttributedString:v4];
    id v4 = v11;
    if (!v6)
    {
      id v7 = [(NSAttributedString *)v11 string];
      title = self->_title;
      self->_title = v7;

      uint64_t v9 = (NSAttributedString *)[(NSAttributedString *)v11 copy];
      uint64_t v10 = self->_attributedTitle;
      self->_attributedTitle = v9;

      [(_SFSettingsAlertItem *)self _updateButtonTitle];
      id v4 = v11;
    }
  }
}

- (void)_updateButtonTitle
{
  id v3 = [(_SFSettingsAlertItem *)self view];
  id v4 = v3;
  if (self->_attributedTitle) {
    objc_msgSend(v3, "setAttributedText:");
  }
  else {
    [v3 setText:self->_title];
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = (NSString *)a3;
  subtitle = self->_subtitle;
  if (subtitle != v4)
  {
    double v12 = v4;
    BOOL v6 = [(NSString *)subtitle isEqualToString:v4];
    id v4 = v12;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v12 copy];
      id v8 = self->_subtitle;
      self->_subtitle = v7;

      attributedSubtitle = self->_attributedSubtitle;
      self->_attributedSubtitle = 0;

      uint64_t v10 = self->_subtitle;
      uint64_t v11 = [(_SFSettingsAlertItem *)self view];
      [v11 setDetailText:v10];

      id v4 = v12;
    }
  }
}

- (void)setAttributedSubtitle:(id)a3
{
  id v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = [v8 string];
    subtitle = self->_subtitle;
    self->_subtitle = v4;

    BOOL v6 = (NSAttributedString *)[v8 copy];
    attributedSubtitle = self->_attributedSubtitle;
    self->_attributedSubtitle = v6;

    [(_SFSettingsAlertItem *)self _updateButtonSubtitle];
  }
}

- (void)_updateButtonSubtitle
{
  id v3 = [(_SFSettingsAlertItem *)self view];
  id v4 = v3;
  if (self->_attributedSubtitle) {
    objc_msgSend(v3, "setAttributedDetailText:");
  }
  else {
    [v3 setDetailText:self->_subtitle];
  }
}

- (SFSettingsAlertItemView)viewAsUIView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = WeakRetained;
  }
  else {
    id v3 = 0;
  }

  return (SFSettingsAlertItemView *)v3;
}

- (_SFSettingsAlertButton)viewAsButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = WeakRetained;
  }
  else {
    id v3 = 0;
  }

  return (_SFSettingsAlertButton *)v3;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
  id v5 = a3;
  id v6 = [(_SFSettingsAlertItem *)self viewAsButton];
  [v6 setAccessoryView:v5];
}

- (void)setStatusImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageView, a3);
  id v5 = a3;
  id v6 = [(_SFSettingsAlertItem *)self viewAsButton];
  [v6 setStatusImageView:v5];
}

- (void)setComponentsArrangement:(id)a3
{
  id v4 = a3;
  id v5 = (NSArray *)[v4 copy];
  componentsArrangement = self->_componentsArrangement;
  self->_componentsArrangement = v5;

  id v7 = [(_SFSettingsAlertItem *)self viewAsButton];
  [v7 setComponentsArrangement:v4];
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = a3;
  id v6 = [(_SFSettingsAlertItem *)self view];
  [v6 setImage:v5];
}

- (void)setShowsIndicatorDot:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsIndicatorDot = a3;
  id v4 = [(_SFSettingsAlertItem *)self viewAsButton];
  [v4 setShowsIndicatorDot:v3];
}

- (NSString)menuAction
{
  unint64_t v2 = self->_actionType - 9;
  if (v2 > 0x25) {
    BOOL v3 = (id *)MEMORY[0x1E4F78678];
  }
  else {
    BOOL v3 = (id *)qword_1E5C76268[v2];
  }
  return (NSString *)*v3;
}

- (BOOL)isConfigurable
{
  unint64_t v2 = [(_SFSettingsAlertItem *)self menuAction];
  char v3 = SFIsMenuActionConfigurable();

  return v3;
}

- (BOOL)isFavorited
{
  char v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = [(_SFSettingsAlertItem *)self menuAction];
  char v5 = objc_msgSend(v3, "browsingAssistant_isMenuActionFavorited:", v4);

  return v5;
}

- (void)setFavorited:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = [(_SFSettingsAlertItem *)self menuAction];
  objc_msgSend(v6, "browsingAssistant_setMenuActionFavorited:favorited:", v5, v3);
}

- (void)setUpSelectionHandlerIfNeededWithViewController:(id)a3
{
  if (!self->_selectionHandler)
  {
    id v4 = a3;
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72___SFSettingsAlertItem_setUpSelectionHandlerIfNeededWithViewController___block_invoke;
    v7[3] = &unk_1E5C761D8;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    char v5 = (void *)MEMORY[0x1AD0C36A0](v7);
    id selectionHandler = self->_selectionHandler;
    self->_id selectionHandler = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (UIColor)overrideColor
{
  tintColor = self->_tintColor;
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  if ([(UIColor *)tintColor isEqual:v4]) {
    char v5 = 0;
  }
  else {
    char v5 = self->_tintColor;
  }
  id v6 = v5;

  return v6;
}

- (void)notifyObserversItemDidUpdate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(NSPointerArray *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) menuItemDidUpdate:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSPointerArray *)observers addPointer:v4];
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (NSArray)componentsArrangement
{
  return self->_componentsArrangement;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)keepsMenuPresented
{
  return self->_keepsMenuPresented;
}

- (void)setKeepsMenuPresented:(BOOL)a3
{
  self->_keepsMenuPresented = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (BOOL)showsIndicatorDot
{
  return self->_showsIndicatorDot;
}

- (id)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (NSArray)subItems
{
  return self->_subItems;
}

- (id)viewConfigurationBlock
{
  return self->_viewConfigurationBlock;
}

- (void)setViewConfigurationBlock:(id)a3
{
}

- (SFSettingsAlertItemView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (SFSettingsAlertItemView *)WeakRetained;
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void)setBadgeText:(id)a3
{
}

- (UIMenu)popUpMenu
{
  return self->_popUpMenu;
}

- (void)setPopUpMenu:(id)a3
{
}

- (BOOL)showsStatusAlert
{
  return self->_showsStatusAlert;
}

- (void)setShowsStatusAlert:(BOOL)a3
{
  self->_showsStatusAlert = a3;
}

- (_SFSettingsAlertItem)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (_SFSettingsAlertItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_popUpMenu, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_viewConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_subItems, 0);
  objc_storeStrong(&self->_controller, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_componentsArrangement, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end