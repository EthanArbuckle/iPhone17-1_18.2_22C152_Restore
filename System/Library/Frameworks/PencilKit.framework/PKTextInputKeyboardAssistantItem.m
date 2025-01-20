@interface PKTextInputKeyboardAssistantItem
- (PKPaletteFloatingKeyboardController)floatingKeyboardController;
- (PKTextInputKeyboardAssistantItem)init;
- (PKTextInputKeyboardAssistantItemDelegate)delegate;
- (id)_currentInteraction;
- (id)responderForFloatingKeyboardController:(id)a3;
- (void)_updateImageAndNotify;
- (void)dealloc;
- (void)didAction:(id)a3;
- (void)didDisplayAssistantItem;
- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4;
- (void)floatingKeyboardControllerWillHide:(id)a3;
- (void)floatingKeyboardControllerWillShow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFloatingKeyboardController:(id)a3;
@end

@implementation PKTextInputKeyboardAssistantItem

- (PKTextInputKeyboardAssistantItem)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKTextInputKeyboardAssistantItem;
  id v2 = [(UIBarItem *)&v15 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_keyboardButtonImage");
    [v2 setImage:v3];

    [v2 setTarget:v2];
    [v2 setAction:sel_didAction_];
    v4 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    v5 = (void *)*((void *)v2 + 54);
    *((void *)v2 + 54) = v4;

    -[PKPaletteFloatingKeyboardController setDelegate:](*((void *)v2 + 54), v2);
    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__PKTextInputKeyboardAssistantItem_init__block_invoke;
    v12[3] = &unk_1E64CA810;
    objc_copyWeak(&v13, &location);
    [v2 _setSecondaryActionsProvider:v12];
    v6 = +[PKTextInputLanguageSelectionController sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__PKTextInputKeyboardAssistantItem_init__block_invoke_2;
    v10[3] = &unk_1E64C7030;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [v6 registerObserver:v10];
    v8 = (void *)*((void *)v2 + 52);
    *((void *)v2 + 52) = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (PKTextInputKeyboardAssistantItem *)v2;
}

id __40__PKTextInputKeyboardAssistantItem_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
  v3 = [v2 languageSelectionMenu];

  v4 = [WeakRetained floatingKeyboardController];
  v5 = -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v4);

  v6 = +[PKPaletteKeyboardUtilities combinedMenuFromKeyboardMenu:v5 withLanguageMenu:v3];

  return v6;
}

void __40__PKTextInputKeyboardAssistantItem_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [WeakRetained floatingKeyboardController];
  v9 = -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v8);

  v10 = +[PKPaletteKeyboardUtilities combinedMenuFromKeyboardMenu:v9 withLanguageMenu:v6];

  [WeakRetained setMenu:v10];
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 51, a2);
    [WeakRetained _updateImageAndNotify];
  }
}

- (void)dealloc
{
  [(PKTextInputLanguageSelectionToken *)self->_observerToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputKeyboardAssistantItem;
  [(PKTextInputKeyboardAssistantItem *)&v3 dealloc];
}

- (void)didAction:(id)a3
{
  id v3 = [(PKTextInputKeyboardAssistantItem *)self floatingKeyboardController];
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v3);
}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
  self->_floatingKeyboardType = a4;
  [(PKTextInputKeyboardAssistantItem *)self _updateImageAndNotify];
}

- (void)_updateImageAndNotify
{
  indicatorImage = self->_indicatorImage;
  if (indicatorImage)
  {
    v4 = indicatorImage;
  }
  else
  {
    if (self->_floatingKeyboardType == 1) {
      objc_msgSend(MEMORY[0x1E4FB1818], "pk_emojiButtonImage");
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1818], "pk_keyboardButtonImage");
    }
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v4;
  [(PKTextInputKeyboardAssistantItem *)self setImage:v4];
  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]
    && ([(PKTextInputKeyboardAssistantItem *)self delegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
    double v8 = v7;
    v9 = [(PKTextInputKeyboardAssistantItem *)self delegate];
    [v9 keyboardAssistantItemAnimateUpdateSymbolDisplay:self withDuration:v8];
  }
  else
  {
    v10 = [(PKTextInputKeyboardAssistantItem *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_13;
    }
    v9 = [(PKTextInputKeyboardAssistantItem *)self delegate];
    [v9 keyboardAssistantItemUpdateSymbolDisplay:self];
  }

LABEL_13:
}

- (void)didDisplayAssistantItem
{
  id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
  [v2 notifyLanguageDidChange];
}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing];
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  v4 = [(PKTextInputKeyboardAssistantItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(PKTextInputKeyboardAssistantItem *)self delegate];
    [v6 keyboardAssistantItemWillShowKeyboard:self];
  }
  id v7 = [(PKTextInputKeyboardAssistantItem *)self _currentInteraction];
  if (objc_opt_respondsToSelector()) {
    [v7 textInputPaletteControllerFloatingKeyboardWillShow:0];
  }
}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  v4 = [(PKTextInputKeyboardAssistantItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(PKTextInputKeyboardAssistantItem *)self delegate];
    [v6 keyboardAssistantItemWillHideKeyboard:self];
  }
  id v7 = [(PKTextInputKeyboardAssistantItem *)self _currentInteraction];
  if (objc_opt_respondsToSelector()) {
    [v7 textInputPaletteControllerFloatingKeyboardWillHide:0];
  }
}

- (id)_currentInteraction
{
  id v2 = [(PKTextInputKeyboardAssistantItem *)self view];
  id v3 = [v2 _responderWindow];
  v4 = [v3 windowScene];

  char v5 = +[PKTextInputInteraction interactionForScene:v4];

  return v5;
}

- (PKTextInputKeyboardAssistantItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputKeyboardAssistantItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observerToken, 0);

  objc_storeStrong((id *)&self->_indicatorImage, 0);
}

@end