@interface PKTextInputWindowFirstResponderController
- (BOOL)_isResponderEditableTextInput:(id)a3;
- (BOOL)paletteFloatingMode;
- (NSNotification)_delayedNotification;
- (NSNotificationCenter)_notificationCenter;
- (PKTextInputWindowFirstResponder)firstResponder;
- (PKTextInputWindowFirstResponderController)init;
- (PKTextInputWindowFirstResponderController)initWithNotificationCenter:(id)a3;
- (PKTextInputWindowFirstResponderControllerDelegate)delegate;
- (void)_forceControllerToReload:(id)a3;
- (void)_handleTextInputSourceDidChange:(id)a3;
- (void)_textInputResponderDidChangeNotificationHandler:(id)a3;
- (void)_updateFirstResponder:(id)a3 isVisible:(BOOL)a4 sendDelegateCallback:(BOOL)a5;
- (void)dealloc;
- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setFirstResponder:(id)a3;
- (void)setPaletteFloatingMode:(BOOL)a3;
- (void)set_delayedNotification:(id)a3;
- (void)set_notificationCenter:(id)a3;
- (void)textInputSourceDidChange:(id)a3;
- (void)updateFirstResponderFromWindowScene:(id)a3 sendDelegateCallback:(BOOL)a4;
@end

@implementation PKTextInputWindowFirstResponderController

- (PKTextInputWindowFirstResponderController)init
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(PKTextInputWindowFirstResponderController *)self initWithNotificationCenter:v3];

  return v4;
}

- (PKTextInputWindowFirstResponderController)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputWindowFirstResponderController;
  v6 = [(PKTextInputWindowFirstResponderController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__notificationCenter, a3);
    [(NSNotificationCenter *)v7->__notificationCenter addObserver:v7 selector:sel__textInputResponderDidChangeNotificationHandler_ name:*MEMORY[0x1E4FB3050] object:0];
    [(NSNotificationCenter *)v7->__notificationCenter addObserver:v7 selector:sel_textInputSourceDidChange_ name:*MEMORY[0x1E4FB3080] object:0];
    [(NSNotificationCenter *)v7->__notificationCenter addObserver:v7 selector:sel__forceControllerToReload_ name:@"PKTextInputWindowFirstResponderControllerReloadNotification" object:0];
  }

  return v7;
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->__notificationCenter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputWindowFirstResponderController;
  [(PKTextInputWindowFirstResponderController *)&v3 dealloc];
}

- (void)_updateFirstResponder:(id)a3 isVisible:(BOOL)a4 sendDelegateCallback:(BOOL)a5
{
  BOOL v35 = a5;
  BOOL v5 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = [MEMORY[0x1E4F29060] currentThread];
    *(_DWORD *)buf = 67109378;
    BOOL v37 = v5;
    __int16 v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_INFO, "Notify first responder did change, isVisible: %d, thread: %@", buf, 0x12u);
  }
  if (v7) {
    BOOL v10 = v5;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v11 = [(PKTextInputWindowFirstResponderController *)self _isResponderEditableTextInput:v7];
  if (v11)
  {
    v12 = PKScribbleInteractionInTextInput(v7);
    uint64_t v13 = v12 != 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = PKHasScribbleInteractionInView(v7);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [v7 view];
        uint64_t v13 = PKHasScribbleInteractionInView(v14);
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
  }
  uint64_t v15 = objc_opt_class();
  v16 = PKDynamicCast(v15, v7);
  v17 = v16;
  if (v16)
  {
    v18 = [v16 inputAssistantItem];
    v19 = [v17 _responderWindow];
    v20 = [v19 windowScene];

    if (!v7) {
      goto LABEL_18;
    }
  }
  else
  {
    v18 = 0;
    v20 = 0;
    if (!v7)
    {
LABEL_18:
      [(PKTextInputWindowFirstResponderController *)self setFirstResponder:0];
      goto LABEL_19;
    }
  }
  v21 = [(PKTextInputWindowFirstResponderController *)self delegate];
  v22 = [v21 windowScene];

  if (v20 != v22) {
    goto LABEL_18;
  }
  if ([(PKTextInputWindowFirstResponderController *)self paletteFloatingMode]) {
    int64_t v24 = 3;
  }
  else {
    int64_t v24 = +[PKTextInputUtilities responderTextInputSource:v7];
  }
  v25 = [[PKTextInputWindowFirstResponder alloc] initWithIsVisible:v10 isEditableTextInput:v11 hasScribbleInteraction:v13 textInputSource:v24 inputAssistantItem:v18];
  [(PKTextInputWindowFirstResponderController *)self setFirstResponder:v25];

  uint64_t v26 = +[PKTextInputElementsFinder shouldDisableInputAssistantForTextInput:]((uint64_t)PKTextInputElementsFinder, v7);
  v27 = [(PKTextInputWindowFirstResponderController *)self firstResponder];
  [v27 setDisableInputAssistant:v26];

  v28 = [MEMORY[0x1E4F28B50] mainBundle];
  v29 = [v28 bundleIdentifier];
  int v30 = [v29 isEqual:@"com.apple.mobilenotes"];

  if (v30)
  {
    NSClassFromString(&cfstr_Ictextview.isa);
    id v31 = v7;
    do
    {
      if (objc_opt_isKindOfClass())
      {

        goto LABEL_32;
      }
      uint64_t v32 = [v31 nextResponder];

      id v31 = (id)v32;
    }
    while (v32);
    NSClassFromString(&cfstr_Icinktoolpicke.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
LABEL_32:
    v33 = [(PKTextInputWindowFirstResponderController *)self firstResponder];
    [v33 setDisableInputAssistant:1];

    v34 = [(PKTextInputWindowFirstResponderController *)self firstResponder];
    [v34 setNotesHandwritingResponder:1];
  }
LABEL_19:
  if (v35)
  {
    v23 = [(PKTextInputWindowFirstResponderController *)self delegate];
    [v23 windowFirstResponderController:self didChangeFirstResponder:v7];
  }
}

- (void)updateFirstResponderFromWindowScene:(id)a3 sendDelegateCallback:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x1E4FB1F48];
  id v7 = a3;
  id v10 = [v6 keyWindow];
  id v8 = [v10 windowScene];

  if (v8 == v7)
  {
    objc_super v9 = [v10 firstResponder];
    [(PKTextInputWindowFirstResponderController *)self _updateFirstResponder:v9 isVisible:1 sendDelegateCallback:v4];
  }
}

- (void)_textInputResponderDidChangeNotificationHandler:(id)a3
{
  id v4 = a3;
  if ([(PKTextInputWindowFirstResponderController *)self paletteFloatingMode])
  {
    BOOL v5 = [(PKTextInputWindowFirstResponderController *)self _delayedNotification];

    [(PKTextInputWindowFirstResponderController *)self set_delayedNotification:v4];
    if (!v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__PKTextInputWindowFirstResponderController__textInputResponderDidChangeNotificationHandler___block_invoke;
      block[3] = &unk_1E64C61C0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB3040]];

    [(PKTextInputWindowFirstResponderController *)self _updateFirstResponder:v7 isVisible:v7 != 0 sendDelegateCallback:1];
  }
}

void __93__PKTextInputWindowFirstResponderController__textInputResponderDidChangeNotificationHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _delayedNotification];
  objc_super v3 = [v2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB3040]];

  objc_msgSend(*(id *)(a1 + 32), "_updateFirstResponder:isVisible:sendDelegateCallback:");
  objc_msgSend(*(id *)(a1 + 32), "set_delayedNotification:", 0);
}

- (void)textInputSourceDidChange:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__handleTextInputSourceDidChange_ object:v5];
  [(PKTextInputWindowFirstResponderController *)self performSelector:sel__handleTextInputSourceDidChange_ withObject:v5 afterDelay:0.1];
}

- (void)_handleTextInputSourceDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [MEMORY[0x1E4F29060] currentThread];
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Received textInputSourceDidChange, thread: %@", buf, 0xCu);
  }
  id v7 = [(PKTextInputWindowFirstResponderController *)self firstResponder];

  if (v7)
  {
    id v8 = [v4 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB3040]];

    id v10 = [v4 userInfo];
    BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB3078]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 integerValue] == 2)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_INFO, "Skip textInputSourceDidChange notification.", buf, 2u);
      }
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __77__PKTextInputWindowFirstResponderController__handleTextInputSourceDidChange___block_invoke;
      v17 = &unk_1E64C5F60;
      v18 = self;
      id v19 = v9;
      uint64_t v13 = (void (**)(void))_Block_copy(&v14);
      if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v14, v15, v16, v17, v18)) {
        v13[2](v13);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v13);
      }
    }
  }
}

uint64_t __77__PKTextInputWindowFirstResponderController__handleTextInputSourceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFirstResponder:isVisible:sendDelegateCallback:");
}

- (void)_forceControllerToReload:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"PKTextInputWindowFirstResponderControllerReloadResponderKey"];

  -[PKTextInputWindowFirstResponderController _updateFirstResponder:isVisible:sendDelegateCallback:](self, "_updateFirstResponder:isVisible:sendDelegateCallback:");
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  BOOL v5 = a4;
  id v7 = [a3 responder];
  [(PKTextInputWindowFirstResponderController *)self _updateFirstResponder:v7 isVisible:v5 sendDelegateCallback:1];
}

- (BOOL)_isResponderEditableTextInput:(id)a3
{
  if (a3) {
    return +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, a3);
  }
  else {
    return 0;
  }
}

- (PKTextInputWindowFirstResponderControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputWindowFirstResponderControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputWindowFirstResponder)firstResponder
{
  return self->_firstResponder;
}

- (void)setFirstResponder:(id)a3
{
}

- (BOOL)paletteFloatingMode
{
  return self->_paletteFloatingMode;
}

- (void)setPaletteFloatingMode:(BOOL)a3
{
  self->_paletteFloatingMode = a3;
}

- (NSNotificationCenter)_notificationCenter
{
  return self->__notificationCenter;
}

- (void)set_notificationCenter:(id)a3
{
}

- (NSNotification)_delayedNotification
{
  return self->__delayedNotification;
}

- (void)set_delayedNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delayedNotification, 0);
  objc_storeStrong((id *)&self->__notificationCenter, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end