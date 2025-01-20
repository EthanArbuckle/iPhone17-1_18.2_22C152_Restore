@interface PKPaletteKeyboardButton
- (BOOL)enableKeyboardToggle;
- (PKPaletteKeyboardButton)initWithImage:(id)a3;
- (UIMenu)keyboardSelectionMenu;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (int64_t)floatingKeyboardType;
- (void)_updateButtonImage;
- (void)_updateKeyboardToggleState;
- (void)dealloc;
- (void)setEnableKeyboardToggle:(BOOL)a3;
- (void)setFloatingKeyboardType:(int64_t)a3;
- (void)setKeyboardSelectionMenu:(id)a3;
@end

@implementation PKPaletteKeyboardButton

- (PKPaletteKeyboardButton)initWithImage:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaletteKeyboardButton;
  v5 = [(PKPaletteButton *)&v19 initWithImage:v4];
  v6 = v5;
  if (v5)
  {
    [(PKPaletteKeyboardButton *)v5 setContextMenuInteractionEnabled:1];
    objc_initWeak(&location, v6);
    v7 = +[PKTextInputLanguageSelectionController sharedInstance];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __41__PKPaletteKeyboardButton_initWithImage___block_invoke;
    v16 = &unk_1E64C7030;
    objc_copyWeak(&v17, &location);
    uint64_t v8 = [v7 registerObserver:&v13];
    observerToken = v6->_observerToken;
    v6->_observerToken = (PKTextInputLanguageSelectionToken *)v8;

    v6->_enableKeyboardToggle = 1;
    [(PKPaletteKeyboardButton *)v6 _updateKeyboardToggleState];
    v10 = [(PKPaletteButton *)v6 _uiButtonInstance];
    v11 = [v10 imageView];
    [v11 _setAnimatesContents:1];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __41__PKPaletteKeyboardButton_initWithImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)WeakRetained[64];
  WeakRetained[64] = v5;

  [WeakRetained _updateButtonImage];
  [WeakRetained setShowsMenuAsPrimaryAction:a3 != 0];
}

- (void)dealloc
{
  [(PKTextInputLanguageSelectionToken *)self->_observerToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteKeyboardButton;
  [(PKPaletteKeyboardButton *)&v3 dealloc];
}

- (void)setFloatingKeyboardType:(int64_t)a3
{
  self->_floatingKeyboardType = a3;
  [(PKPaletteKeyboardButton *)self _updateButtonImage];
}

- (void)_updateButtonImage
{
  indicatorImage = self->_indicatorImage;
  if (indicatorImage)
  {
    id v4 = indicatorImage;
  }
  else
  {
    if (self->_floatingKeyboardType == 1) {
      objc_msgSend(MEMORY[0x1E4FB1818], "pk_emojiButtonImage");
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1818], "pk_keyboardButtonImage");
    }
    id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  id v5 = [(PKPaletteButton *)self _uiButtonInstance];
  [v5 setImage:v6 forState:0];
  [v5 setNeedsLayout];
}

- (void)setEnableKeyboardToggle:(BOOL)a3
{
  self->_enableKeyboardToggle = a3;
  [(PKPaletteKeyboardButton *)self _updateKeyboardToggleState];
}

- (void)setKeyboardSelectionMenu:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSelectionMenu, a3);

  [(PKPaletteKeyboardButton *)self _updateKeyboardToggleState];
}

- (void)_updateKeyboardToggleState
{
  uint64_t v3 = [(PKPaletteKeyboardButton *)self keyboardSelectionMenu];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  id v5 = +[PKTextInputLanguageSelectionController sharedInstance];
  v6 = [v5 languageSelectionMenu];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v7 = [(PKPaletteKeyboardButton *)self enableKeyboardToggle];

  [(PKPaletteButton *)self setEnabled:v7];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E4FB1678];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKPaletteKeyboardButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E64CAAE0;
  objc_copyWeak(&v10, &location);
  BOOL v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __81__PKPaletteKeyboardButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained keyboardSelectionMenu];
  uint64_t v3 = +[PKTextInputLanguageSelectionController sharedInstance];
  id v4 = [v3 languageSelectionMenu];

  if (v4) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v7 = objc_msgSend(v2, "children", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setAttributes:", objc_msgSend(WeakRetained, "enableKeyboardToggle") ^ 1);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    v12 = (void *)MEMORY[0x1E4FB1970];
    v19[0] = v2;
    v19[1] = v4;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v6 = [v12 menuWithChildren:v13];
  }

  return v6;
}

- (int64_t)floatingKeyboardType
{
  return self->_floatingKeyboardType;
}

- (BOOL)enableKeyboardToggle
{
  return self->_enableKeyboardToggle;
}

- (UIMenu)keyboardSelectionMenu
{
  return self->_keyboardSelectionMenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSelectionMenu, 0);
  objc_storeStrong((id *)&self->_observerToken, 0);

  objc_storeStrong((id *)&self->_indicatorImage, 0);
}

@end