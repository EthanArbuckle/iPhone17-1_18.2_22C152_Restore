@interface PKPaletteFloatingKeyboardController
- (BOOL)isPresentingKeyboard;
- (PKPaletteFloatingKeyboardController)init;
- (id)keyboardSelectionMenu;
- (uint64_t)_currentSystemFloatingKeyboardType;
- (void)_clearMenuStateIfNecessary;
- (void)_presentOrDismissWithKeyboardType:(uint64_t)a1;
- (void)_setTraitsForActiveKeyboard:(void *)a3 forResponder:;
- (void)_updateKeyboardInputModeToFloatingKeyboardType:(uint64_t)a1;
- (void)_updateKeyboardMenuIfNecessary;
- (void)dealloc;
- (void)didChangeInputMode;
- (void)dismissWithReason:(uint64_t)a1;
- (void)notifyDelegateDidChangeKeyboardType;
- (void)presentOrDismissIfPresented;
- (void)setDelegate:(uint64_t)a1;
@end

@implementation PKPaletteFloatingKeyboardController

- (PKPaletteFloatingKeyboardController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaletteFloatingKeyboardController;
  v2 = [(PKPaletteFloatingKeyboardController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1908] keyboardInputModeWithIdentifier:@"emoji@sw=Emoji"];
    emojiInputMode = v2->_emojiInputMode;
    v2->_emojiInputMode = (UIKeyboardInputMode *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_didChangeInputMode name:*MEMORY[0x1E4FB3028] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3028] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteFloatingKeyboardController;
  [(PKPaletteFloatingKeyboardController *)&v4 dealloc];
}

- (void)setDelegate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id obj = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));

    id v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 24), obj);
      -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType](a1);
      id v3 = obj;
    }
  }
}

- (void)notifyDelegateDidChangeKeyboardType
{
  if (a1)
  {
    v2 = (id *)(a1 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained(v2);
      [v5 floatingKeyboardController:a1 didChangeKeyboardType:__PKFloatingKeyboardType];
    }
  }
}

- (void)didChangeInputMode
{
  if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard]((uint64_t)self)) {
    return;
  }
  if (self && __PKFloatingKeyboardType == 1)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;

    if (v5 - self->_latestUserInitiatedInputModeChangeTimestamp < 1.0)
    {
      uint64_t v6 = __PKFloatingKeyboardType;
      if (__PKFloatingKeyboardType == 1)
      {
        objc_super v7 = [MEMORY[0x1E4FB1910] sharedInputModeController];
        [v7 updateCurrentInputMode:self->_emojiInputMode];

        uint64_t v6 = __PKFloatingKeyboardType;
      }
      -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:]((uint64_t)self, v6);
      return;
    }
    goto LABEL_12;
  }
  if (self) {
LABEL_12:
  }
    __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType]((uint64_t)self);

  -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType]((uint64_t)self);
}

- (BOOL)isPresentingKeyboard
{
  if (!a1) {
    return 0;
  }
  v1 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  v2 = [v1 _overrideTextInputTraits];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateKeyboardInputModeToFloatingKeyboardType:(uint64_t)a1
{
  if (a1)
  {
    if (a2 == 1)
    {
      id v6 = [MEMORY[0x1E4FB1900] sharedInstance];
      v2 = [*(id *)(a1 + 32) identifier];
      [v6 setInputMode:v2 userInitiated:1];
    }
    else
    {
      if (a2) {
        return;
      }
      id v6 = [MEMORY[0x1E4FB1900] sharedInstance];
      v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
      BOOL v3 = [v2 currentInputModeInPreference];
      double v4 = [v3 identifier];
      [v6 setInputMode:v4 userInitiated:1];
    }
  }
}

- (void)_updateKeyboardMenuIfNecessary
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (val && !val[1])
  {
    objc_initWeak(&location, val);
    v2 = (void *)_PKUIKitBundle_kitBundle;
    if (!_PKUIKitBundle_kitBundle)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v4 = (void *)_PKUIKitBundle_kitBundle;
      _PKUIKitBundle_kitBundle = v3;

      v2 = (void *)_PKUIKitBundle_kitBundle;
    }
    id v5 = v2;
    v20 = [v5 localizedStringForKey:@"Keyboard" value:@"Keyboard" table:@"Localizable"];

    id v6 = (void *)MEMORY[0x1E4FB13F0];
    objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_keyboardButtonImage");
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke;
    v23[3] = &unk_1E64C8B68;
    objc_copyWeak(&v24, &location);
    v8 = [v6 actionWithTitle:v20 image:v7 identifier:@"Keyboard" handler:v23];

    v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = val[4];
    v11 = [v10 extendedDisplayName];
    v12 = objc_msgSend(MEMORY[0x1E4FB1818], "pk_emojiButtonImage");
    id v13 = val[4];
    v14 = [v13 primaryLanguage];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke_2;
    v21[3] = &unk_1E64C8B68;
    objc_copyWeak(&v22, &location);
    v15 = [v9 actionWithTitle:v11 image:v12 identifier:v14 handler:v21];

    v16 = (void *)MEMORY[0x1E4FB1970];
    v26[0] = v8;
    v26[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v18 = [v16 menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v17];

    id v19 = val[1];
    val[1] = (id)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
}

void __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPaletteFloatingKeyboardController _presentOrDismissWithKeyboardType:]((uint64_t)WeakRetained, 0);
}

- (void)_presentOrDismissWithKeyboardType:(uint64_t)a1
{
  if (a1)
  {
    if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1) || __PKFloatingKeyboardType == a2)
    {
      if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
      {
        -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented](a1);
      }
      else
      {
        __PKFloatingKeyboardType = a2;
        -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented](a1);
        -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:](a1, a2);
        id v5 = [MEMORY[0x1E4F1C9C8] date];
        [v5 timeIntervalSinceReferenceDate];
        *(void *)(a1 + 40) = v4;
      }
    }
    else
    {
      -[PKPaletteFloatingKeyboardController _updateKeyboardInputModeToFloatingKeyboardType:](a1, a2);
      __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType](a1);
      -[PKPaletteFloatingKeyboardController notifyDelegateDidChangeKeyboardType](a1);
    }
  }
}

void __69__PKPaletteFloatingKeyboardController__updateKeyboardMenuIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPaletteFloatingKeyboardController _presentOrDismissWithKeyboardType:]((uint64_t)WeakRetained, 1);
}

- (void)_clearMenuStateIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = objc_msgSend(*(id *)(a1 + 8), "children", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAttributes:0];
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

- (id)keyboardSelectionMenu
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1;
    -[PKPaletteFloatingKeyboardController _updateKeyboardMenuIfNecessary](a1);
    -[PKPaletteFloatingKeyboardController _clearMenuStateIfNecessary](v2);
    a1 = (id *)*(id *)(v2 + 8);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)presentOrDismissIfPresented
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 17))
    {
      uint64_t v2 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        v16 = "-[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]";
        _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Ignoring %s as we are processing an internally requested reloadInputViews", (uint8_t *)&v15, 0xCu);
      }
    }
    else if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
    {
      -[PKPaletteFloatingKeyboardController dismissWithReason:](a1, @"Toggling off as keyboard is already presented");
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v5 = objc_loadWeakRetained((id *)(a1 + 24));
        long long v6 = [v5 responderForFloatingKeyboardController:a1];
      }
      else
      {
        long long v6 = 0;
      }
      os_log_t v7 = os_log_create("com.apple.pencilkit", "PKPalette");
      long long v8 = v7;
      if (v6)
      {
        long long v9 = v7;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [NSNumber numberWithInteger:__PKFloatingKeyboardType];
          int v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Presenting keyboard for type: %@", (uint8_t *)&v15, 0xCu);
        }
        uint64_t v11 = __PKFloatingKeyboardType;
        id v12 = v6;
        long long v8 = objc_loadWeakRetained((id *)(a1 + 24));
        if (!-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v8 floatingKeyboardControllerWillShow:a1];
        }
        if (v11 == 1)
        {
          id v13 = [MEMORY[0x1E4FB1910] sharedInputModeController];
          [v13 updateCurrentInputMode:*(void *)(a1 + 32)];
        }
        v14 = [MEMORY[0x1E4FB1D98] defaultTextInputTraits];
        [v14 setForceFloatingKeyboard:1];
        [v14 setAcceptsInitialEmojiKeyboard:1];
        -[PKPaletteFloatingKeyboardController _setTraitsForActiveKeyboard:forResponder:](a1, v14, v12);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Attempted presenting a UCB-Keyboard but could not get a responder", (uint8_t *)&v15, 2u);
      }
    }
  }
}

- (void)dismissWithReason:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 17))
    {
      id WeakRetained = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 136315138;
        id v12 = "-[PKPaletteFloatingKeyboardController dismissWithReason:]";
        _os_log_debug_impl(&dword_1C44F8000, WeakRetained, OS_LOG_TYPE_DEBUG, "Ignoring %s as we are processing an internally requested reloadInputViews", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1))
    {
      __PKFloatingKeyboardType = -[PKPaletteFloatingKeyboardController _currentSystemFloatingKeyboardType](a1);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      if (-[PKPaletteFloatingKeyboardController isPresentingKeyboard](a1) && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained floatingKeyboardControllerWillHide:a1];
      }
      id v5 = objc_loadWeakRetained((id *)(a1 + 24));
      long long v6 = [v5 responderForFloatingKeyboardController:a1];

      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v6, "set_textInputSource:", 3);
      }
      -[PKPaletteFloatingKeyboardController _setTraitsForActiveKeyboard:forResponder:](a1, 0, v6);
      os_log_t v7 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing UCB-Keyboard with reason: '%@'", (uint8_t *)&v11, 0xCu);
      }

      id v8 = objc_loadWeakRetained((id *)(a1 + 24));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 24));
        [v10 floatingKeyboardController:a1 didDismissWithReason:v3];
      }
    }
    else
    {
      id WeakRetained = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1C44F8000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Attempted dismissal, but UCB-Keyboard is not presented. Reason: '%@'", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_setTraitsForActiveKeyboard:(void *)a3 forResponder:
{
  id v5 = (void *)MEMORY[0x1E4FB18E0];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 activeKeyboard];
  objc_msgSend(v8, "set_overrideTextInputTraits:", v7);

  *(unsigned char *)(a1 + 17) = 1;
  [v6 reloadInputViews];

  *(unsigned char *)(a1 + 17) = 0;
}

- (uint64_t)_currentSystemFloatingKeyboardType
{
  uint64_t v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  uint64_t v3 = [v2 currentInputMode];

  LODWORD(a1) = [v3 isEqual:*(void *)(a1 + 32)];
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiInputMode, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cachedKeyboardMenu, 0);
}

@end