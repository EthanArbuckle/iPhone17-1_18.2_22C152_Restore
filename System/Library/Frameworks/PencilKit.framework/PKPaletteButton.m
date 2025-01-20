@interface PKPaletteButton
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (id)UCBButton;
+ (id)ellipsisButton;
+ (id)emojiKeyboardButton;
+ (id)keyboardButton;
+ (id)plusButton;
+ (id)redoButton;
+ (id)returnKeyButton;
+ (id)shapeButton;
+ (id)textButton;
+ (id)undoButton;
- (BOOL)_wantsCustomBackgroundColor;
- (BOOL)_wantsCustomTintColor;
- (BOOL)hasContextMenuVisible;
- (BOOL)useCompactLayout;
- (CGAffineTransform)_buttonTransform;
- (CGSize)intrinsicContentSize;
- (NSHashTable)observers;
- (PKPaletteButton)initWithFrame:(CGRect)a3;
- (PKPaletteButton)initWithImage:(id)a3;
- (PKPaletteButtonDelegate)delegate;
- (UIButton)button;
- (UIMenu)menu;
- (UIPointerInteraction)pointerInteraction;
- (double)scalingFactor;
- (id)_backgroundColor;
- (id)_tintColorForCurrentState;
- (id)_uiButtonInstance;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_notifyIntrinsicContentSizeDidChange;
- (void)_updateUI;
- (void)addIntrinsicContentSizeObserver:(id)a3;
- (void)layoutSubviews;
- (void)removeIntrinsicContentSizeObserver:(id)a3;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenu:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUseCompactLayout:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteButton

+ (id)undoButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_undoButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Undo-Button"];

  return v4;
}

+ (id)redoButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_redoButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Redo-Button"];

  return v4;
}

+ (id)ellipsisButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_ellipsisButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"More-Button"];

  return v4;
}

+ (id)plusButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_plusButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Plus-Button"];

  return v4;
}

+ (id)UCBButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_UCBButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Scribble-Compact-Button"];

  return v4;
}

+ (id)keyboardButton
{
  v2 = [PKPaletteKeyboardButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_keyboardButtonImage");
  v4 = [(PKPaletteKeyboardButton *)v2 initWithImage:v3];

  [(PKPaletteKeyboardButton *)v4 setAccessibilityIdentifier:@"Scribble-Keyboard-Button"];

  return v4;
}

+ (id)emojiKeyboardButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_emojiButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Scribble-Emoji-Button"];

  return v4;
}

+ (id)returnKeyButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_returnKeyButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  [(PKPaletteButton *)v4 setAccessibilityIdentifier:@"Scribble-Small-Return-Button"];

  return v4;
}

+ (id)textButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_textButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  return v4;
}

+ (id)shapeButton
{
  v2 = [PKPaletteButton alloc];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_shapeButtonImage");
  v4 = [(PKPaletteButton *)v2 initWithImage:v3];

  return v4;
}

- (PKPaletteButton)initWithFrame:(CGRect)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  v5 = [(PKPaletteButton *)self initWithImage:v4];

  return v5;
}

- (PKPaletteButton)initWithImage:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaletteButton;
  v5 = -[PKPaletteButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_scalingFactor = 1.0;
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    if (!PKIsVisionDevice())
    {
      uint64_t v9 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      button = v6->_button;
      v6->_button = (UIButton *)v9;

      [(UIButton *)v6->_button setUserInteractionEnabled:0];
      [(UIButton *)v6->_button setImage:v4 forState:0];
      [(PKPaletteButton *)v6 addSubview:v6->_button];
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v6];
    pointerInteraction = v6->_pointerInteraction;
    v6->_pointerInteraction = (UIPointerInteraction *)v11;

    [(PKPaletteButton *)v6 addInteraction:v6->_pointerInteraction];
    v13 = [(PKPaletteButton *)v6 _uiButtonInstance];
    [v13 setShowsLargeContentViewer:1];

    id v14 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PKPaletteButton *)v6 addInteraction:v14];

    -[PKPaletteButton setHitTestInsets:](v6, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
    [(PKPaletteButton *)v6 _updateUI];
  }

  return v6;
}

- (void)setMenu:(id)a3
{
  id v6 = a3;
  id v5 = [(PKPaletteButton *)self menu];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    [(PKPaletteButton *)self setContextMenuInteractionEnabled:v6 != 0];
    [(PKPaletteButton *)self setShowsMenuAsPrimaryAction:v6 != 0];
  }
}

- (BOOL)hasContextMenuVisible
{
  v2 = [(PKPaletteButton *)self _uiButtonInstance];
  if ([v2 isHeld]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isHighlighted];
  }

  return v3;
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    [(PKPaletteButton *)self _updateUI];
  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)_uiButtonInstance
{
  if (PKIsVisionDevice())
  {
    char v3 = self;
  }
  else
  {
    char v3 = [(PKPaletteButton *)self button];
  }

  return v3;
}

- (void)addIntrinsicContentSizeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteButton *)self observers];
  [v5 addObject:v4];
}

- (void)removeIntrinsicContentSizeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteButton *)self observers];
  [v5 removeObject:v4];
}

- (void)_notifyIntrinsicContentSizeDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v3 = [(PKPaletteButton *)self observers];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) buttonDidChangeIntrinsicContentSize:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (CGSize)intrinsicContentSize
{
  char v3 = [(PKPaletteButton *)self traitCollection];
  uint64_t v4 = [(PKPaletteButton *)self window];
  uint64_t v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);
  double v7 = PKPaletteButtonSize(v6);
  double v9 = v8;

  [(PKPaletteButton *)self scalingFactor];
  double v11 = v9 * v10;
  double v12 = v7 * v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteButton;
  [(PKPaletteButton *)&v14 layoutSubviews];
  if (!PKIsVisionDevice())
  {
    [(PKPaletteButton *)self bounds];
    double MidX = CGRectGetMidX(v15);
    uint64_t v4 = [(PKPaletteButton *)self layer];
    [v4 setCornerRadius:MidX];

    [(PKPaletteButton *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(PKPaletteButton *)self button];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (id)_tintColorForCurrentState
{
  if ([(PKPaletteButton *)self _wantsCustomTintColor])
  {
    char v3 = [(PKPaletteButton *)self delegate];
    uint64_t v4 = objc_msgSend(v3, "paletteButton:tintColorForState:", self, -[PKPaletteButton state](self, "state"));
LABEL_5:
    double v5 = (void *)v4;

    goto LABEL_13;
  }
  if ([(PKPaletteButton *)self isHighlighted])
  {
    char v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v4 = [v3 colorWithAlphaComponent:0.5];
    goto LABEL_5;
  }
  if ([(PKPaletteButton *)self isEnabled])
  {
    if ([(PKPaletteButton *)self isSelected]) {
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }
  double v5 = (void *)v6;
LABEL_13:

  return v5;
}

- (BOOL)_wantsCustomTintColor
{
  char v3 = [(PKPaletteButton *)self delegate];
  if (v3)
  {
    uint64_t v4 = [(PKPaletteButton *)self delegate];
    char v5 = objc_msgSend(v4, "paletteButton:wantsCustomTintColorForState:", self, -[PKPaletteButton state](self, "state"));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_backgroundColor
{
  if ([(PKPaletteButton *)self _wantsCustomBackgroundColor])
  {
    char v3 = [(PKPaletteButton *)self delegate];
    uint64_t v4 = objc_msgSend(v3, "paletteButton:backgroundColorForState:", self, -[PKPaletteButton state](self, "state"));
LABEL_7:
    uint64_t v6 = (void *)v4;

    goto LABEL_13;
  }
  if ([(PKPaletteButton *)self useCompactLayout])
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    if ([(PKPaletteButton *)self isHighlighted])
    {
      char v3 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteButtonBackgroundColor");
      uint64_t v4 = [v3 colorWithAlphaComponent:0.5];
      goto LABEL_7;
    }
    if (![(PKPaletteButton *)self isEnabled]
      && ([(PKPaletteButton *)self isEnabled] & 1) != 0)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteButtonBackgroundColor");
  }
  uint64_t v6 = (void *)v5;
LABEL_13:

  return v6;
}

- (BOOL)_wantsCustomBackgroundColor
{
  char v3 = [(PKPaletteButton *)self delegate];
  if (v3)
  {
    uint64_t v4 = [(PKPaletteButton *)self delegate];
    char v5 = objc_msgSend(v4, "paletteButton:wantsCustomBackgroundColorForState:", self, -[PKPaletteButton state](self, "state"));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteButton *)self isHidden] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    [(PKPaletteButton *)&v5 setHidden:v3];
    [(PKPaletteButton *)self _notifyIntrinsicContentSizeDidChange];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    [(PKPaletteButton *)&v5 setEnabled:v3];
    [(PKPaletteButton *)self _updateUI];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    [(PKPaletteButton *)&v5 setHighlighted:v3];
    [(PKPaletteButton *)self _updateUI];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    [(PKPaletteButton *)&v5 setSelected:v3];
    [(PKPaletteButton *)self _updateUI];
  }
}

- (void)_updateUI
{
  if (!PKIsVisionDevice())
  {
    uint64_t v3 = [(PKPaletteButton *)self isEnabled];
    uint64_t v4 = [(PKPaletteButton *)self button];
    [v4 setEnabled:v3];

    uint64_t v5 = [(PKPaletteButton *)self isSelected];
    uint64_t v6 = [(PKPaletteButton *)self button];
    [v6 setSelected:v5];

    uint64_t v7 = [(PKPaletteButton *)self isHighlighted];
    double v8 = [(PKPaletteButton *)self button];
    [v8 setHighlighted:v7];

    [(PKPaletteButton *)self _buttonTransform];
    double v9 = [(PKPaletteButton *)self button];
    v12[0] = v12[3];
    v12[1] = v12[4];
    v12[2] = v12[5];
    [v9 setTransform:v12];

    double v10 = [(PKPaletteButton *)self _backgroundColor];
    [(PKPaletteButton *)self setBackgroundColor:v10];

    double v11 = [(PKPaletteButton *)self _tintColorForCurrentState];
    [(PKPaletteButton *)self setTintColor:v11];
  }
}

- (CGAffineTransform)_buttonTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  BOOL v7 = [(PKPaletteButton *)self useCompactLayout];
  [(PKPaletteButton *)self scalingFactor];
  double v9 = v8;
  if (v7)
  {
    double v9 = v8 * 0.75;
    [(PKPaletteButton *)self scalingFactor];
    double v11 = v10 * 0.75;
  }
  else
  {
    [(PKPaletteButton *)self scalingFactor];
    double v11 = v12;
  }

  return CGAffineTransformMakeScale(retstr, v9, v11);
}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    [(PKPaletteButton *)self _updateUI];
    [(PKPaletteButton *)self invalidateIntrinsicContentSize];
    [(PKPaletteButton *)self _notifyIntrinsicContentSizeDidChange];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteButton;
  [(PKPaletteButton *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKPaletteButton *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    BOOL v7 = [(PKPaletteButton *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteButton *)self _updateUI];
  [(PKPaletteButton *)self invalidateIntrinsicContentSize];
  [(PKPaletteButton *)self _notifyIntrinsicContentSizeDidChange];
LABEL_6:
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x1E4FB1678];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKPaletteButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E64CAAE0;
  objc_copyWeak(&v10, &location);
  BOOL v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __73__PKPaletteButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained menu];

  return v2;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a5, "rect", a3, a4);
  CGRect v9 = CGRectInset(v8, -8.0, -8.0);
  id v5 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [v5 view];

  CGRect v8 = (void *)[v6 initWithView:v7];
  CGRect v9 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v8];
  id v10 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];

  return v10;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_menu, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end