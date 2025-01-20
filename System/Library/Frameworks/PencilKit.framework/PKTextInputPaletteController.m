@interface PKTextInputPaletteController
- (BOOL)_canShowPaletteUI;
- (BOOL)_isFirstResponderEditableTextInputWithPencilTextInputSource;
- (BOOL)_isFirstResponderInputAssistantEnabled;
- (BOOL)_isFirstResponderVisible;
- (BOOL)_isWritingStateActive;
- (BOOL)_shouldPaletteBeVisible;
- (BOOL)isPaletteVisible;
- (CGRect)editingOverlayContainerSceneBounds;
- (PKPaletteController)_paletteController;
- (PKPaletteFloatingKeyboardController)_floatingKeyboardController;
- (PKTextInputPaletteController)init;
- (PKTextInputPaletteController)initWithTextInputSettings:(id)a3;
- (PKTextInputPaletteControllerDelegate)delegate;
- (PKTextInputSettings)_textInputSettings;
- (PKTextInputWindowFirstResponderController)_windowFirstResponderController;
- (UIWindowScene)windowScene;
- (id)_paletteControllerContainerView;
- (id)paletteTapToRadarCommandConfiguration:(id)a3;
- (id)responderForFloatingKeyboardController:(id)a3;
- (void)_peformPaletteVisibilityUpdate;
- (void)_setWritingStateActive:(BOOL)a3;
- (void)_setupPaletteControllerIfNeededWithView:(id)a3 wantsPaletteVisible:(BOOL)a4;
- (void)_updatePaletteVisibility;
- (void)dealloc;
- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3;
- (void)floatingKeyboardControllerWillHide:(id)a3;
- (void)floatingKeyboardControllerWillShow:(id)a3;
- (void)paletteControllerFloatingKeyboardWillHide:(id)a3;
- (void)paletteControllerFloatingKeyboardWillShow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3;
- (void)set_floatingKeyboardController:(id)a3;
- (void)set_paletteController:(id)a3;
- (void)set_textInputSettings:(id)a3;
- (void)set_windowFirstResponderController:(id)a3;
- (void)updateFirstResponderVisibility;
@end

@implementation PKTextInputPaletteController

- (PKTextInputPaletteController)init
{
  v3 = +[PKTextInputSettings sharedSettings];
  v4 = [(PKTextInputPaletteController *)self initWithTextInputSettings:v3];

  return v4;
}

- (PKTextInputPaletteController)initWithTextInputSettings:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKTextInputPaletteController;
  v6 = [(PKTextInputPaletteController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__textInputSettings, a3);
    v8 = objc_alloc_init(PKTextInputWindowFirstResponderController);
    windowFirstResponderController = v7->__windowFirstResponderController;
    v7->__windowFirstResponderController = v8;

    [(PKTextInputWindowFirstResponderController *)v7->__windowFirstResponderController setDelegate:v7];
    v10 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    floatingKeyboardController = v7->__floatingKeyboardController;
    v7->__floatingKeyboardController = v10;

    -[PKPaletteFloatingKeyboardController setDelegate:]((uint64_t)v7->__floatingKeyboardController, v7);
    v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 bounds];
    v7->_editingOverlayContainerSceneBounds.origin.x = v13;
    v7->_editingOverlayContainerSceneBounds.origin.y = v14;
    v7->_editingOverlayContainerSceneBounds.size.width = v15;
    v7->_editingOverlayContainerSceneBounds.size.height = v16;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__recognitionLocaleIdentifierDidChange_ name:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputPaletteController;
  [(PKTextInputPaletteController *)&v4 dealloc];
}

- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_editingOverlayContainerSceneBounds, a3))
  {
    self->_editingOverlayContainerSceneBounds.origin.CGFloat x = x;
    self->_editingOverlayContainerSceneBounds.origin.CGFloat y = y;
    self->_editingOverlayContainerSceneBounds.size.CGFloat width = width;
    self->_editingOverlayContainerSceneBounds.size.CGFloat height = height;
    [(PKTextInputPaletteController *)self _updatePaletteVisibility];
  }
}

- (void)_setWritingStateActive:(BOOL)a3
{
  BOOL writingStateActive = self->__writingStateActive;
  if (writingStateActive != a3)
  {
    self->__BOOL writingStateActive = a3;
    if (writingStateActive || !a3) {
      [(PKTextInputPaletteController *)self _updatePaletteVisibility];
    }
    else {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updatePaletteVisibility object:0];
    }
  }
}

- (UIWindowScene)windowScene
{
  v3 = [(PKTextInputPaletteController *)self delegate];
  objc_super v4 = [v3 paletteControllerContainerView:self];
  id v5 = [v4 window];
  v6 = [v5 windowScene];

  return (UIWindowScene *)v6;
}

- (id)_paletteControllerContainerView
{
  v3 = [(PKTextInputPaletteController *)self delegate];
  objc_super v4 = [v3 paletteControllerContainerView:self];

  return v4;
}

- (BOOL)_canShowPaletteUI
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v4 = [(PKTextInputPaletteController *)self _textInputSettings];
  char v5 = [(id)v4 isScribbleActive];

  v6 = [(PKTextInputPaletteController *)self _textInputSettings];
  LOBYTE(v4) = [v6 UCBPaletteEnabled];

  return v5 & v4;
}

- (void)updateFirstResponderVisibility
{
  id v4 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  v3 = [(PKTextInputPaletteController *)self windowScene];
  [v4 updateFirstResponderFromWindowScene:v3 sendDelegateCallback:1];
}

- (BOOL)isPaletteVisible
{
  v2 = [(PKTextInputPaletteController *)self _paletteController];
  char v3 = [v2 isPaletteVisible];

  return v3;
}

- (BOOL)_isFirstResponderEditableTextInputWithPencilTextInputSource
{
  v2 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  char v3 = [v2 firstResponder];
  char v4 = [v3 isEditableTextInputWithPencilTextInputSource];

  return v4;
}

- (BOOL)_isFirstResponderVisible
{
  v2 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  char v3 = [v2 firstResponder];
  char v4 = [v3 isVisible];

  return v4;
}

- (BOOL)_isFirstResponderInputAssistantEnabled
{
  v2 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  char v3 = [v2 firstResponder];
  char v4 = [v3 disableInputAssistant] ^ 1;

  return v4;
}

- (BOOL)_shouldPaletteBeVisible
{
  if (![(PKTextInputPaletteController *)self _canShowPaletteUI]
    || ![(PKTextInputPaletteController *)self _isFirstResponderVisible]
    || ![(PKTextInputPaletteController *)self _isFirstResponderEditableTextInputWithPencilTextInputSource]|| ![(PKTextInputPaletteController *)self isPaletteVisible]&& [(PKTextInputPaletteController *)self _isWritingStateActive]|| ![(PKTextInputPaletteController *)self _isFirstResponderInputAssistantEnabled])
  {
    return 0;
  }
  char v3 = [(PKTextInputPaletteController *)self windowScene];
  char v4 = [v3 _isKeyWindowScene];

  return v4;
}

- (void)_updatePaletteVisibility
{
}

- (void)_peformPaletteVisibilityUpdate
{
  BOOL v3 = [(PKTextInputPaletteController *)self _shouldPaletteBeVisible];
  char v4 = [(PKTextInputPaletteController *)self _paletteController];
  int v5 = v3 ^ [v4 isPaletteVisible];

  if (v5 == 1)
  {
    v6 = _PKSignpostLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteVisibilityChanged", (const char *)&unk_1C48540E6, buf, 2u);
    }

    v7 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteVisibilityChanged\"", v26, 2u);
    }
  }
  v8 = [(PKTextInputPaletteController *)self _paletteControllerContainerView];
  [(PKTextInputPaletteController *)self _setupPaletteControllerIfNeededWithView:v8 wantsPaletteVisible:v3];
  v9 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  v10 = [v9 firstResponder];
  v11 = [(PKTextInputPaletteController *)self _paletteController];
  [v11 setFirstResponder:v10];

  [(PKTextInputPaletteController *)self editingOverlayContainerSceneBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(PKTextInputPaletteController *)self _paletteController];
  objc_msgSend(v20, "setAdjustedWindowSceneBounds:", v13, v15, v17, v19);

  v21 = [(PKTextInputPaletteController *)self _paletteController];
  [v21 setPaletteVisible:v3 animated:1 completion:0];

  if (v5)
  {
    v22 = _PKSignpostLog();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteVisibilityChanged", (const char *)&unk_1C48540E6, v25, 2u);
    }

    v23 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_INFO, "END \"TextInputPaletteVisibilityChanged\"", v24, 2u);
    }
  }
}

- (void)_setupPaletteControllerIfNeededWithView:(id)a3 wantsPaletteVisible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && v4)
  {
    v7 = (PKPaletteTapToRadarCommand *)os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1C44F8000, &v7->super, OS_LOG_TYPE_ERROR, "Wants palette visible but the provided view is nil", (uint8_t *)&v24, 2u);
    }
LABEL_32:

    goto LABEL_33;
  }
  v8 = [(PKTextInputPaletteController *)self _paletteController];
  if (!v6 || v8)
  {
  }
  else if (v4)
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138412290;
      id v25 = v6;
      _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "Creating new palette controller to install in view: %@", (uint8_t *)&v24, 0xCu);
    }

    v10 = _PKSignpostLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteInstall", (const char *)&unk_1C48540E6, (uint8_t *)&v24, 2u);
    }

    v11 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteInstall\"", (uint8_t *)&v24, 2u);
    }

    double v12 = objc_alloc_init(PKPaletteController);
    [(PKTextInputPaletteController *)self set_paletteController:v12];

    double v13 = [(PKTextInputPaletteController *)self _paletteController];
    [v13 setDelegate:self];

    double v14 = [(PKTextInputPaletteController *)self _paletteController];
    [v14 installInView:v6];

    double v15 = _PKSignpostLog();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteInstall", (const char *)&unk_1C48540E6, (uint8_t *)&v24, 2u);
    }

    double v16 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_INFO, "END \"TextInputPaletteInstall\"", (uint8_t *)&v24, 2u);
    }

    v7 = [[PKPaletteTapToRadarCommand alloc] initWithDelegate:self];
    double v17 = [(PKTextInputPaletteController *)self _paletteController];
    [v17 setTapToRadarCommand:v7];

    goto LABEL_32;
  }
  double v18 = [(PKTextInputPaletteController *)self _paletteController];

  if (!v6 && v18)
  {
    double v19 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEBUG, "Tearing down palette controller", (uint8_t *)&v24, 2u);
    }

    v20 = _PKSignpostLog();
    if (os_signpost_enabled(v20))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteTearDown", (const char *)&unk_1C48540E6, (uint8_t *)&v24, 2u);
    }

    v21 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteTearDown\"", (uint8_t *)&v24, 2u);
    }

    v22 = [(PKTextInputPaletteController *)self _paletteController];
    [v22 tearDown];

    [(PKTextInputPaletteController *)self set_paletteController:0];
    v23 = _PKSignpostLog();
    if (os_signpost_enabled(v23))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C44F8000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteTearDown", (const char *)&unk_1C48540E6, (uint8_t *)&v24, 2u);
    }

    v7 = (PKPaletteTapToRadarCommand *)os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C44F8000, &v7->super, OS_LOG_TYPE_INFO, "END \"TextInputPaletteTearDown\"", (uint8_t *)&v24, 2u);
    }
    goto LABEL_32;
  }
LABEL_33:
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(PKTextInputPaletteController *)self _paletteController];
  v7 = [v8 tapToRadarCommand];
  objc_msgSend(v7, "editingOverlayContainerDidChangeToSceneBounds:", x, y, width, height);
}

- (id)paletteTapToRadarCommandConfiguration:(id)a3
{
  BOOL v4 = objc_alloc_init(PKPaletteTapToRadarConfiguration);
  int v5 = [(PKTextInputPaletteController *)self delegate];
  id v6 = [v5 paletteControllerDebugSharpenerLog:self];

  if ([v6 hasContent]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  [(PKPaletteTapToRadarConfiguration *)v4 setDebugSharpenerLog:v7];
  id v8 = [(PKTextInputPaletteController *)self _paletteControllerContainerView];
  v9 = [v8 window];
  v10 = [v9 rootViewController];
  v11 = [v10 childViewControllers];
  double v12 = [v11 firstObject];
  [(PKPaletteTapToRadarConfiguration *)v4 setPresentationViewController:v12];

  return v4;
}

- (void)paletteControllerFloatingKeyboardWillHide:(id)a3
{
  BOOL v4 = [(PKTextInputPaletteController *)self delegate];
  [v4 textInputPaletteControllerFloatingKeyboardWillHide:self];

  id v5 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  [v5 setPaletteFloatingMode:0];
}

- (void)paletteControllerFloatingKeyboardWillShow:(id)a3
{
  BOOL v4 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  [v4 setPaletteFloatingMode:1];

  id v5 = [(PKTextInputPaletteController *)self delegate];
  [v5 textInputPaletteControllerFloatingKeyboardWillShow:self];
}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing];
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  BOOL v4 = [(PKTextInputPaletteController *)self delegate];
  [v4 textInputPaletteControllerFloatingKeyboardWillHide:self];

  id v5 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  [v5 setPaletteFloatingMode:0];
}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  BOOL v4 = [(PKTextInputPaletteController *)self _windowFirstResponderController];
  [v4 setPaletteFloatingMode:1];

  id v5 = [(PKTextInputPaletteController *)self delegate];
  [v5 textInputPaletteControllerFloatingKeyboardWillShow:self];
}

- (PKPaletteFloatingKeyboardController)_floatingKeyboardController
{
  return self->__floatingKeyboardController;
}

- (void)set_floatingKeyboardController:(id)a3
{
}

- (PKTextInputPaletteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputPaletteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isWritingStateActive
{
  return self->__writingStateActive;
}

- (CGRect)editingOverlayContainerSceneBounds
{
  double x = self->_editingOverlayContainerSceneBounds.origin.x;
  double y = self->_editingOverlayContainerSceneBounds.origin.y;
  double width = self->_editingOverlayContainerSceneBounds.size.width;
  double height = self->_editingOverlayContainerSceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PKTextInputSettings)_textInputSettings
{
  return self->__textInputSettings;
}

- (void)set_textInputSettings:(id)a3
{
}

- (PKTextInputWindowFirstResponderController)_windowFirstResponderController
{
  return self->__windowFirstResponderController;
}

- (void)set_windowFirstResponderController:(id)a3
{
}

- (PKPaletteController)_paletteController
{
  return self->__paletteController;
}

- (void)set_paletteController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__paletteController, 0);
  objc_storeStrong((id *)&self->__windowFirstResponderController, 0);
  objc_storeStrong((id *)&self->__textInputSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->__floatingKeyboardController, 0);
}

@end