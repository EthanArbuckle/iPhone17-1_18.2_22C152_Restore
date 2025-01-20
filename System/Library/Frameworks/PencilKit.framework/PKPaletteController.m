@interface PKPaletteController
- (BOOL)_shouldOverridePaletteViewTraitCollectionTo:(id)a3;
- (BOOL)_shouldPaletteUseCompactHorizontalSizeClass;
- (BOOL)isPaletteVisible;
- (CGRect)adjustedWindowSceneBounds;
- (NSArray)trailingButtonsWithReturnKey;
- (NSArray)trailingButtonsWithoutReturnKey;
- (NSLayoutConstraint)paletteHostViewHeightConstraint;
- (NSLayoutConstraint)paletteHostViewWidthConstraint;
- (PKPaletteButton)redoButton;
- (PKPaletteButton)returnKeyButton;
- (PKPaletteButton)undoButton;
- (PKPaletteController)init;
- (PKPaletteControllerDelegate)delegate;
- (PKPaletteFloatingKeyboardController)floatingKeyboardController;
- (PKPaletteHostView)_hostView;
- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider;
- (PKPaletteKeyboardButton)keyboardButton;
- (PKPaletteTapToRadarCommand)tapToRadarCommand;
- (PKTextInputWindowFirstResponder)firstResponder;
- (PKUCBPaletteView)_paletteView;
- (id)_adjustedHorizontalSizeClassTraitCollection;
- (id)responderForFloatingKeyboardController:(id)a3;
- (int64_t)_adjustedUserInterfaceSizeClass;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)palettePosition;
- (void)_handleKeyboard;
- (void)_handleMoreButton:(id)a3;
- (void)_handleRedo;
- (void)_handleReturn;
- (void)_handleTextInputReturnKeyStateChanged:(id)a3;
- (void)_handleUndo;
- (void)_openPencilSettings;
- (void)_presentMoreOptionsPopoverFromButton:(id)a3;
- (void)_updatePaletteUI;
- (void)_updatePaletteViewTraitCollection;
- (void)_updatePaletteWithApplicationSpecificItems;
- (void)_updatePaletteWithDefaultItems;
- (void)_updateReturnKey;
- (void)_updateTrailingBarButtons;
- (void)_updateUndoRedoEnabledState;
- (void)dealloc;
- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4;
- (void)floatingKeyboardControllerWillHide:(id)a3;
- (void)floatingKeyboardControllerWillShow:(id)a3;
- (void)installInView:(id)a3;
- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3;
- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3;
- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3;
- (void)setAdjustedWindowSceneBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstResponder:(id)a3;
- (void)setFloatingKeyboardController:(id)a3;
- (void)setInputAssistantButtonProvider:(id)a3;
- (void)setKeyboardButton:(id)a3;
- (void)setPaletteHostViewHeightConstraint:(id)a3;
- (void)setPaletteHostViewWidthConstraint:(id)a3;
- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRedoButton:(id)a3;
- (void)setReturnKeyButton:(id)a3;
- (void)setTapToRadarCommand:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)set_hostView:(id)a3;
- (void)set_paletteView:(id)a3;
- (void)tearDown;
@end

@implementation PKPaletteController

- (PKPaletteController)init
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PKPaletteController;
  id v2 = [(PKPaletteController *)&v25 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleTextInputResponderCapabilitiesChanged_ name:*MEMORY[0x1E4FB3048] object:0];
    [v3 addObserver:v2 selector:sel__handleTextInputReturnKeyStateChanged_ name:*MEMORY[0x1E4FB3060] object:0];
    [v3 addObserver:v2 selector:sel__recognitionLocaleIdentifierDidChange_ name:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:0];
    v4 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    v5 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v4;

    -[PKPaletteFloatingKeyboardController setDelegate:](*((void *)v2 + 14), v2);
    v6 = objc_alloc_init(PKPaletteInputAssistantButtonProvider);
    v7 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v6;

    v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    *((void *)v2 + 16) = v9;
    *((void *)v2 + 17) = v10;
    *((void *)v2 + 18) = v11;
    *((void *)v2 + 19) = v12;

    uint64_t v13 = +[PKPaletteButton keyboardButton];
    v14 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v13;

    v15 = -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](*((id **)v2 + 14));
    [*((id *)v2 + 11) setKeyboardSelectionMenu:v15];

    [*((id *)v2 + 11) addTarget:v2 action:sel__handleKeyboard forControlEvents:64];
    uint64_t v16 = +[PKPaletteButton returnKeyButton];
    v17 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v16;

    [*((id *)v2 + 10) addTarget:v2 action:sel__handleReturn forControlEvents:64];
    v18 = +[PKPaletteButton ellipsisButton];
    [v18 addTarget:v2 action:sel__handleMoreButton_ forControlEvents:64];
    uint64_t v19 = *((void *)v2 + 10);
    v27[0] = *((void *)v2 + 11);
    v27[1] = v19;
    v27[2] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    v21 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v20;

    v26[0] = *((void *)v2 + 11);
    v26[1] = v18;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v23 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v22;
  }
  return (PKPaletteController *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3048] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3060] object:0];
  [v3 removeObserver:self name:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteController;
  [(PKPaletteController *)&v4 dealloc];
}

- (void)setAdjustedWindowSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_adjustedWindowSceneBounds, a3))
  {
    self->_adjustedWindowSceneBounds.origin.CGFloat x = x;
    self->_adjustedWindowSceneBounds.origin.CGFloat y = y;
    self->_adjustedWindowSceneBounds.size.CGFloat width = width;
    self->_adjustedWindowSceneBounds.size.CGFloat height = height;
    v8 = [(PKPaletteController *)self _paletteView];
    [v8 paletteHostingWindowSceneDidChangeBounds:self];

    [(PKPaletteController *)self _updatePaletteUI];
  }
}

- (void)_updatePaletteUI
{
  v3 = +[PKTextInputSettings sharedSettings];
  objc_super v4 = [v3 recognitionLocaleIdentifier];
  v5 = [(PKPaletteController *)self _paletteView];
  [v5 setLocaleIdentifier:v4];

  [(PKPaletteController *)self adjustedWindowSceneBounds];
  double v7 = v6;
  v8 = [(PKPaletteController *)self paletteHostViewWidthConstraint];
  [v8 setConstant:v7];

  [(PKPaletteController *)self adjustedWindowSceneBounds];
  double v10 = v9;
  uint64_t v11 = [(PKPaletteController *)self paletteHostViewHeightConstraint];
  [v11 setConstant:v10];

  [(PKPaletteController *)self _updatePaletteViewTraitCollection];
}

- (void)_updatePaletteViewTraitCollection
{
  id v4 = [(PKPaletteController *)self _adjustedHorizontalSizeClassTraitCollection];
  if (-[PKPaletteController _shouldOverridePaletteViewTraitCollectionTo:](self, "_shouldOverridePaletteViewTraitCollectionTo:"))
  {
    v3 = [(PKPaletteController *)self _hostView];
    [v3 _setLocalOverrideTraitCollection:v4];
  }
}

- (BOOL)_shouldOverridePaletteViewTraitCollectionTo:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaletteController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PKPaletteController *)self delegate];
    char v8 = [v7 paletteController:self shouldOverridePaletteViewTraitCollectionTo:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_adjustedHorizontalSizeClassTraitCollection
{
  int64_t v2 = [(PKPaletteController *)self _adjustedUserInterfaceSizeClass];
  v3 = (void *)MEMORY[0x1E4FB1E20];

  return (id)[v3 traitCollectionWithHorizontalSizeClass:v2];
}

- (int64_t)_adjustedUserInterfaceSizeClass
{
  if ([(PKPaletteController *)self _shouldPaletteUseCompactHorizontalSizeClass])
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (BOOL)_shouldPaletteUseCompactHorizontalSizeClass
{
  v3 = [(PKPaletteController *)self _paletteView];
  id v4 = [v3 window];
  v5 = [v4 windowScene];
  if ((unint64_t)([v5 interfaceOrientation] - 3) >= 2)
  {
  }
  else
  {
    [(PKPaletteController *)self adjustedWindowSceneBounds];
    double v7 = v6;
    char v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    double v10 = v9 / 3.0;

    if (v7 <= v10) {
      return 1;
    }
  }
  uint64_t v12 = [(PKPaletteController *)self _paletteView];
  uint64_t v13 = [v12 window];
  v14 = [v13 windowScene];
  if ((unint64_t)([v14 interfaceOrientation] - 1) > 1)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(PKPaletteController *)self adjustedWindowSceneBounds];
    double v16 = v15;
    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 bounds];
    BOOL v11 = v16 < v18;
  }
  return v11;
}

- (void)installInView:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v39;
    _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Installing palette UI in view: %@", (uint8_t *)location, 0xCu);
  }

  v5 = objc_alloc_init(PKUCBPaletteView);
  [(PKPaletteController *)self set_paletteView:v5];

  double v6 = [v39 window];
  double v7 = [v6 rootViewController];
  char v8 = [v7 childViewControllers];
  double v9 = [v8 firstObject];
  double v10 = [(PKPaletteController *)self _paletteView];
  [v10 setPalettePopoverPresentingController:v9];

  objc_initWeak(location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __37__PKPaletteController_installInView___block_invoke;
  v40[3] = &unk_1E64C9CF8;
  objc_copyWeak(&v41, location);
  BOOL v11 = [(PKPaletteController *)self _paletteView];
  [v11 setReturnKeyHandler:v40];

  uint64_t v12 = [PKPaletteHostView alloc];
  uint64_t v13 = [(PKPaletteController *)self _paletteView];
  v14 = [(PKPaletteHostView *)v12 initWithPaletteView:v13];
  [(PKPaletteController *)self set_hostView:v14];

  double v15 = [(PKPaletteController *)self _hostView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = [(PKPaletteController *)self _hostView];
  [v39 addSubview:v16];

  v17 = [(PKPaletteController *)self _hostView];
  double v18 = [v17 widthAnchor];
  [(PKPaletteController *)self adjustedWindowSceneBounds];
  uint64_t v20 = [v18 constraintEqualToConstant:v19];
  paletteHostViewWidthConstraint = self->_paletteHostViewWidthConstraint;
  self->_paletteHostViewWidthConstraint = v20;

  uint64_t v22 = [(PKPaletteController *)self _hostView];
  v23 = [v22 heightAnchor];
  [(PKPaletteController *)self adjustedWindowSceneBounds];
  objc_super v25 = [v23 constraintEqualToConstant:v24];
  paletteHostViewHeightConstraint = self->_paletteHostViewHeightConstraint;
  self->_paletteHostViewHeightConstraint = v25;

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(PKPaletteController *)self _hostView];
  v28 = [v38 topAnchor];
  v29 = [v39 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v42[0] = v30;
  v31 = [(PKPaletteController *)self _hostView];
  v32 = [v31 leftAnchor];
  v33 = [v39 leftAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v35 = self->_paletteHostViewWidthConstraint;
  v36 = self->_paletteHostViewHeightConstraint;
  v42[1] = v34;
  v42[2] = v35;
  v42[3] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v27 activateConstraints:v37];

  [(PKPaletteController *)self _updatePaletteWithDefaultItems];
  [(PKPaletteController *)self _updatePaletteUI];
  objc_destroyWeak(&v41);
  objc_destroyWeak(location);
}

void __37__PKPaletteController_installInView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleReturn];
}

- (void)tearDown
{
  v3 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_debug_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEBUG, "Tearing down palette UI", v6, 2u);
  }

  id v4 = [(PKPaletteController *)self floatingKeyboardController];
  -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v4, @"Tearing down palette UI");

  v5 = [(PKPaletteController *)self _hostView];
  [v5 removeFromSuperview];
}

- (BOOL)isPaletteVisible
{
  int64_t v2 = [(PKPaletteController *)self _hostView];
  char v3 = [v2 isPaletteVisible];

  return v3;
}

- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  BOOL v9 = [(PKPaletteController *)self isPaletteVisible];
  BOOL v10 = v9 ^ v6;
  if (v9 && !v6)
  {
    BOOL v11 = [(PKPaletteController *)self floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v11, @"Palette Visibility");
  }
  uint64_t v12 = [(PKPaletteController *)self _hostView];
  [v12 setPaletteVisible:v6 animated:v5 completion:v8];

  if (v10)
  {
    [(PKPaletteController *)self _updatePaletteWithApplicationSpecificItems];
  }
}

- (int64_t)palettePosition
{
  int64_t v2 = [(PKPaletteController *)self _paletteView];
  int64_t v3 = [v2 palettePosition];

  return v3;
}

- (void)setFirstResponder:(id)a3
{
  p_firstResponder = &self->_firstResponder;
  BOOL v6 = (PKTextInputWindowFirstResponder *)a3;
  if (*p_firstResponder != v6)
  {
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (*p_firstResponder)
    {
      [(PKPaletteController *)self _updatePaletteWithApplicationSpecificItems];
      [(PKPaletteController *)self _updateUndoRedoEnabledState];
      [(PKPaletteController *)self _updateReturnKey];
      [(PKPaletteController *)self _updateTrailingBarButtons];
      [(PKPaletteController *)self _updatePaletteUI];
    }
  }
}

- (void)_updatePaletteWithDefaultItems
{
  v11[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[PKPaletteButton undoButton];
  [(PKPaletteController *)self setUndoButton:v3];

  id v4 = [(PKPaletteController *)self undoButton];
  [v4 addTarget:self action:sel__handleUndo forControlEvents:64];

  BOOL v5 = +[PKPaletteButton redoButton];
  [(PKPaletteController *)self setRedoButton:v5];

  BOOL v6 = [(PKPaletteController *)self redoButton];
  [v6 addTarget:self action:sel__handleRedo forControlEvents:64];

  double v7 = [(PKPaletteController *)self undoButton];
  v11[0] = v7;
  id v8 = [(PKPaletteController *)self redoButton];
  v11[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  BOOL v10 = [(PKPaletteController *)self _paletteView];
  [v10 setLeadingBarButtons:v9];

  [(PKPaletteController *)self _updateTrailingBarButtons];
  [(PKPaletteController *)self _updateUndoRedoEnabledState];
}

- (void)_updateTrailingBarButtons
{
  if (+[PKPaletteKeyboardUtilities textInputReturnKeyTypeForEditing](PKPaletteKeyboardUtilities, "textInputReturnKeyTypeForEditing")&& (+[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings"), v3 = objc_claimAutoreleasedReturnValue(), int v4 = [v3 hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent], v3, v4))
  {
    uint64_t v5 = [(PKPaletteController *)self trailingButtonsWithoutReturnKey];
  }
  else
  {
    uint64_t v5 = [(PKPaletteController *)self trailingButtonsWithReturnKey];
  }
  id v7 = (id)v5;
  BOOL v6 = [(PKPaletteController *)self _paletteView];
  [v6 setTrailingBarButtons:v7];
}

- (void)_updateUndoRedoEnabledState
{
  id v7 = +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing];
  uint64_t v3 = [v7 canUndo];
  int v4 = [(PKPaletteController *)self undoButton];
  [v4 setEnabled:v3];

  uint64_t v5 = [v7 canRedo];
  BOOL v6 = [(PKPaletteController *)self redoButton];
  [v6 setEnabled:v5];
}

- (void)_updatePaletteWithApplicationSpecificItems
{
  uint64_t v3 = [(PKPaletteController *)self _paletteView];
  int v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  id v13 = [v5 keyboardSceneDelegate];

  if ([(PKPaletteController *)self isPaletteVisible]
    && ([(PKPaletteController *)self firstResponder],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [v13 setShouldSuppressInputAssistantUpdates:1];
    id v7 = [(PKPaletteController *)self firstResponder];
    id v8 = [v7 inputAssistantItem];
    BOOL v9 = [(PKPaletteController *)self inputAssistantButtonProvider];
    [v9 setInputAssistantItem:v8];

    BOOL v10 = [(PKPaletteController *)self inputAssistantButtonProvider];
    BOOL v11 = [v10 buttonsForCurrentConfiguration];
    uint64_t v12 = [(PKPaletteController *)self _paletteView];
    [v12 setCenteredBarButtons:v11];
  }
  else
  {
    [v13 setShouldSuppressInputAssistantUpdates:0];
    BOOL v10 = [(PKPaletteController *)self inputAssistantButtonProvider];
    [v10 setInputAssistantItem:0];
  }
}

- (void)_updateReturnKey
{
  int64_t v3 = +[PKPaletteKeyboardUtilities textInputReturnKeyTypeForEditing];
  int v4 = [(PKPaletteController *)self _paletteView];
  [v4 setReturnKeyType:v3];

  BOOL v5 = +[PKPaletteKeyboardUtilities isReturnKeyEnabled];
  BOOL v6 = [(PKPaletteController *)self returnKeyButton];
  [v6 setEnabled:v5];

  id v7 = [(PKPaletteController *)self _paletteView];
  [v7 setReturnKeyEnabled:v5];
}

- (void)_handleTextInputReturnKeyStateChanged:(id)a3
{
  [(PKPaletteController *)self _updateReturnKey];

  [(PKPaletteController *)self _updateTrailingBarButtons];
}

- (void)_handleUndo
{
  id v3 = +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing];
  [v3 undo];
  [(PKPaletteController *)self _updateUndoRedoEnabledState];
  +[PKTextInputUtilities markAnalyticsForUndo];
}

- (void)_handleRedo
{
  id v3 = +[PKPaletteKeyboardUtilities textInputUndoManagerForEditing];
  [v3 redo];
  [(PKPaletteController *)self _updateUndoRedoEnabledState];
  +[PKTextInputUtilities markAnalyticsForRedo];
}

- (void)_handleReturn
{
}

- (void)_handleKeyboard
{
  id v2 = [(PKPaletteController *)self floatingKeyboardController];
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v2);
}

- (void)_handleMoreButton:(id)a3
{
  id v7 = a3;
  int v4 = [(PKPaletteController *)self _paletteView];
  char v5 = [v4 isPalettePresentingPopover];

  if (v5)
  {
    BOOL v6 = [(PKPaletteController *)self _paletteView];
    [v6 dismissPalettePopoverWithCompletion:0];
  }
  else
  {
    [(PKPaletteController *)self _presentMoreOptionsPopoverFromButton:v7];
  }
}

- (void)_presentMoreOptionsPopoverFromButton:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_alloc_init(PKPaletteMoreOptionsViewController);
  [(PKPaletteMoreOptionsViewController *)v5 setShouldShowFingerDrawsOption:0];
  BOOL v6 = [(PKPaletteController *)self _hostView];
  id v7 = [v6 traitCollection];
  id v8 = [(PKPaletteController *)self _hostView];
  BOOL v9 = [v8 window];
  BOOL v10 = [v9 windowScene];
  [(PKPaletteMoreOptionsViewController *)v5 setShouldShowAutoMinimizeOption:!PKUseCompactSize(v7, v10)];

  [(PKPaletteMoreOptionsViewController *)v5 setShouldShowTapToRadarOption:1];
  BOOL v11 = +[PKHandwritingEducationPaneSettings sharedInstance]();
  -[PKPaletteMoreOptionsViewController setShouldShowResetHandwritingEducationPane:](v5, "setShouldShowResetHandwritingEducationPane:", -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v11));

  uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  -[PKPaletteMoreOptionsViewController setShouldShowOpenPencilSettingsOption:](v5, "setShouldShowOpenPencilSettingsOption:", [v12 _supportsPencil]);

  id v13 = [(PKPaletteController *)self _paletteView];
  -[PKPaletteMoreOptionsViewController setAutoHideOn:](v5, "setAutoHideOn:", [v13 isAutoHideEnabled]);

  [(PKPaletteMoreOptionsViewController *)v5 setDelegate:self];
  [(PKPaletteMoreOptionsViewController *)v5 setModalPresentationStyle:7];
  v14 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v14 setDelegate:self];

  double v15 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v15 _setIgnoresKeyboardNotifications:1];

  double v16 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v16 _setShouldDisableInteractionDuringTransitions:0];

  v17 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v17 setSourceView:v4];

  [v4 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v42.origin.double x = v19;
  v42.origin.double y = v21;
  v42.size.double width = v23;
  v42.size.double height = v25;
  CGRect v43 = CGRectInset(v42, -5.0, -5.0);
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  v30 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  objc_msgSend(v30, "setSourceRect:", x, y, width, height);

  v31 = [(PKPaletteController *)self _paletteView];
  v32 = [v31 paletteViewHosting];
  v33 = [v32 hostingView];
  v41[0] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v35 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v35 setPassthroughViews:v34];

  v36 = [(PKPaletteController *)self _paletteView];
  uint64_t v37 = [v36 palettePopoverPermittedArrowDirections];
  v38 = [(PKPaletteMoreOptionsViewController *)v5 popoverPresentationController];
  [v38 setPermittedArrowDirections:v37];

  id v39 = [(PKPaletteController *)self _paletteView];
  v40 = [v39 palettePopoverPresentingController];
  [v40 presentViewController:v5 animated:1 completion:0];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing];
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  id v4 = [(PKPaletteController *)self delegate];
  [v4 paletteControllerFloatingKeyboardWillShow:self];
}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  id v4 = [(PKPaletteController *)self delegate];
  [v4 paletteControllerFloatingKeyboardWillHide:self];
}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
}

- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isAutoHideOn];
  BOOL v6 = [(PKPaletteController *)self _paletteView];
  [v6 setAutoHideEnabled:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PKPaletteController_moreOptionsViewControllerDidToggleAutoHide___block_invoke;
  void v11[3] = &unk_1E64C61C0;
  v11[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v11];

  id v7 = +[PKStatisticsManager sharedStatisticsManager]();
  id v8 = [(PKPaletteController *)self _paletteView];
  uint64_t v9 = [v8 isAutoHideEnabled];
  BOOL v10 = [(PKPaletteController *)self _paletteView];
  -[PKStatisticsManager recordAutoMinimizeEnabledDidChange:type:]((uint64_t)v7, v9, [v10 paletteViewType]);
}

void __66__PKPaletteController_moreOptionsViewControllerDidToggleAutoHide___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _paletteView];
  id v2 = [v4 internalDelegate];
  id v3 = [*(id *)(a1 + 32) _paletteView];
  [v2 paletteViewStateDidChangeAutoHide:v3];
}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PKPaletteController_moreOptionsViewControllerDidSelectTapToRadar___block_invoke;
  v3[3] = &unk_1E64C61C0;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

void __68__PKPaletteController_moreOptionsViewControllerDidSelectTapToRadar___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tapToRadarCommand];
  [v1 execute];
}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaletteController_moreOptionsViewControllerDidSelectOpenPencilSettings___block_invoke;
  v3[3] = &unk_1E64C61C0;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __76__PKPaletteController_moreOptionsViewControllerDidSelectOpenPencilSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPencilSettings];
}

- (void)_openPencilSettings
{
}

- (CGRect)adjustedWindowSceneBounds
{
  double x = self->_adjustedWindowSceneBounds.origin.x;
  double y = self->_adjustedWindowSceneBounds.origin.y;
  double width = self->_adjustedWindowSceneBounds.size.width;
  double height = self->_adjustedWindowSceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PKPaletteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputWindowFirstResponder)firstResponder
{
  return self->_firstResponder;
}

- (PKPaletteTapToRadarCommand)tapToRadarCommand
{
  return self->_tapToRadarCommand;
}

- (void)setTapToRadarCommand:(id)a3
{
}

- (PKPaletteHostView)_hostView
{
  return self->__hostView;
}

- (void)set_hostView:(id)a3
{
}

- (PKUCBPaletteView)_paletteView
{
  return self->__paletteView;
}

- (void)set_paletteView:(id)a3
{
}

- (NSLayoutConstraint)paletteHostViewWidthConstraint
{
  return self->_paletteHostViewWidthConstraint;
}

- (void)setPaletteHostViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteHostViewHeightConstraint
{
  return self->_paletteHostViewHeightConstraint;
}

- (void)setPaletteHostViewHeightConstraint:(id)a3
{
}

- (PKPaletteButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (PKPaletteButton)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
}

- (PKPaletteButton)returnKeyButton
{
  return self->_returnKeyButton;
}

- (void)setReturnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyButton, a3);
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
}

- (NSArray)trailingButtonsWithReturnKey
{
  return self->_trailingButtonsWithReturnKey;
}

- (NSArray)trailingButtonsWithoutReturnKey
{
  return self->_trailingButtonsWithoutReturnKey;
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
}

- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider
{
  return self->_inputAssistantButtonProvider;
}

- (void)setInputAssistantButtonProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, 0);
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_storeStrong((id *)&self->_trailingButtonsWithoutReturnKey, 0);
  objc_storeStrong((id *)&self->_trailingButtonsWithReturnKey, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->__paletteView, 0);
  objc_storeStrong((id *)&self->__hostView, 0);
  objc_storeStrong((id *)&self->_tapToRadarCommand, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end