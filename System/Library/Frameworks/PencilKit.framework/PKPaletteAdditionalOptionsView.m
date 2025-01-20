@interface PKPaletteAdditionalOptionsView
- (BOOL)enableKeyboardButtons;
- (BOOL)isAutoHideOn;
- (BOOL)isFingerDrawsOn;
- (BOOL)shouldHideHoverPreviewToggle;
- (BOOL)shouldShowFingerDrawsOption;
- (BOOL)shouldShowResetHandwritingEducationPane;
- (BOOL)shouldShowTapToRadarOption;
- (BOOL)showsPlusButton;
- (BOOL)showsShapeButton;
- (BOOL)showsTextButton;
- (BOOL)wantsEllipsisButtonVisible;
- (BOOL)wantsInputAssistantViewVisible;
- (CGRect)plusButtonFrame;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)ellipsisButtonHeightConstraint;
- (NSLayoutConstraint)ellipsisButtonWidthConstraint;
- (NSLayoutConstraint)plusButtonHeightConstraint;
- (NSLayoutConstraint)plusButtonWidthConstraint;
- (NSLayoutConstraint)shapeButtonHeightConstraint;
- (NSLayoutConstraint)shapeButtonWidthConstraint;
- (NSLayoutConstraint)textButtonHeightConstraint;
- (NSLayoutConstraint)textButtonWidthConstraint;
- (PKPaletteAdditionalOptionsView)initWithFrame:(CGRect)a3;
- (PKPaletteAdditionalOptionsViewDelegate)delegate;
- (PKPaletteButton)ellipsisButton;
- (PKPaletteButton)plusButton;
- (PKPaletteButton)returnKeyButton;
- (PKPaletteButton)shapeButton;
- (PKPaletteButton)textButton;
- (PKPaletteButtonGroupView)keyboardButtonGroupView;
- (PKPaletteKeyboardButton)keyboardButton;
- (PKPaletteMoreOptionsViewController)moreOptionsViewController;
- (PKPalettePopoverPresenting)palettePopoverPresenting;
- (UIStackView)contentStackView;
- (UIStackView)plusEllipsisStackView;
- (UIStackView)textShapeStackView;
- (UIViewController)presentedPopoverViewController;
- (double)scalingFactor;
- (id)_keyboardButtonGroupViewButtons;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)floatingKeyboardType;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_didSelectEllipsisButton:(id)a3;
- (void)_handleAutoRefineSettingsDidChange;
- (void)_handleKeyboardButton;
- (void)_handleReturnKeyButton;
- (void)_handleSceneWillDeactivateNotification:(id)a3;
- (void)_pencilInteractionPrefersPencilOnlyDrawsDidChange;
- (void)_setPlusButton:(id)a3;
- (void)_updateMoreOptionsViewControllerAutoRefineState;
- (void)_updateUI;
- (void)didMoveToWindow;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3;
- (void)moreOptionsViewControllerDidSelectResetHandwritingEducationPane:(id)a3;
- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3;
- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3;
- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3;
- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3;
- (void)setAutoHideOn:(BOOL)a3;
- (void)setContentStackView:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setEllipsisButton:(id)a3;
- (void)setEllipsisButtonHeightConstraint:(id)a3;
- (void)setEllipsisButtonWidthConstraint:(id)a3;
- (void)setEnableKeyboardButtons:(BOOL)a3;
- (void)setFloatingKeyboardType:(int64_t)a3;
- (void)setIsFingerDrawsOn:(BOOL)a3;
- (void)setKeyboardButton:(id)a3;
- (void)setKeyboardButtonGroupView:(id)a3;
- (void)setMoreOptionsViewController:(id)a3;
- (void)setPalettePopoverPresenting:(id)a3;
- (void)setPlusButton:(id)a3;
- (void)setPlusButtonHeightConstraint:(id)a3;
- (void)setPlusButtonWidthConstraint:(id)a3;
- (void)setPlusEllipsisStackView:(id)a3;
- (void)setPresentedPopoverViewController:(id)a3;
- (void)setReturnKeyButton:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setShapeButtonHeightConstraint:(id)a3;
- (void)setShapeButtonWidthConstraint:(id)a3;
- (void)setShouldHideHoverPreviewToggle:(BOOL)a3;
- (void)setShouldShowFingerDrawsOption:(BOOL)a3;
- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3;
- (void)setShouldShowTapToRadarOption:(BOOL)a3;
- (void)setShowsPlusButton:(BOOL)a3;
- (void)setShowsShapeButton:(BOOL)a3;
- (void)setShowsTextButton:(BOOL)a3;
- (void)setTextButton:(id)a3;
- (void)setTextButtonHeightConstraint:(id)a3;
- (void)setTextButtonWidthConstraint:(id)a3;
- (void)setTextShapeStackView:(id)a3;
- (void)setWantsEllipsisButtonVisible:(BOOL)a3;
- (void)setWantsInputAssistantViewVisible:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePopoverUI;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PKPaletteAdditionalOptionsView

- (PKPaletteAdditionalOptionsView)initWithFrame:(CGRect)a3
{
  v78[4] = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)PKPaletteAdditionalOptionsView;
  v3 = -[PKPaletteAdditionalOptionsView initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = [(PKPaletteAdditionalOptionsView *)v3 traitCollection];
    if ([v5 userInterfaceIdiom]) {
      char v6 = [MEMORY[0x1E4FB1A80] prefersPencilOnlyDrawing] ^ 1;
    }
    else {
      char v6 = 1;
    }
    v4->_isFingerDrawsOn = v6;

    objc_initWeak(&location, v4);
    v7 = [PKUIPencilInteractionObserver alloc];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke;
    v73[3] = &unk_1E64C5998;
    objc_copyWeak(&v74, &location);
    v8 = (PKUIPencilInteractionObserver *)-[PKUIPencilInteractionObserver initWithPrefersPencilOnlyDrawsDidChangeHandler:](v7, v73);
    pencilInteractionObserver = v4->_pencilInteractionObserver;
    v4->_pencilInteractionObserver = v8;

    v10 = [PKAutoRefineSettingsObserver alloc];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_2;
    v71[3] = &unk_1E64C6690;
    objc_copyWeak(&v72, &location);
    v11 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v10, v71);
    autoRefineSettingsObserver = v4->_autoRefineSettingsObserver;
    v4->_autoRefineSettingsObserver = v11;

    v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v13;

    [(UIStackView *)v4->_contentStackView setAlignment:3];
    [(UIStackView *)v4->_contentStackView setAxis:0];
    [(UIStackView *)v4->_contentStackView setDistribution:0];
    [(UIStackView *)v4->_contentStackView setSpacing:12.0];
    [(UIStackView *)v4->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteAdditionalOptionsView *)v4 addSubview:v4->_contentStackView];
    v66 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [(UIStackView *)v4->_contentStackView topAnchor];
    v69 = [(PKPaletteAdditionalOptionsView *)v4 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v78[0] = v68;
    v67 = [(UIStackView *)v4->_contentStackView leadingAnchor];
    v15 = [(PKPaletteAdditionalOptionsView *)v4 leadingAnchor];
    v16 = [v67 constraintEqualToAnchor:v15];
    v78[1] = v16;
    v17 = [(UIStackView *)v4->_contentStackView bottomAnchor];
    v18 = [(PKPaletteAdditionalOptionsView *)v4 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v78[2] = v19;
    v20 = [(UIStackView *)v4->_contentStackView trailingAnchor];
    v21 = [(PKPaletteAdditionalOptionsView *)v4 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v78[3] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
    [v66 activateConstraints:v23];

    v24 = +[PKPaletteButton keyboardButton];
    [(PKPaletteAdditionalOptionsView *)v4 setKeyboardButton:v24];

    v25 = [(PKPaletteAdditionalOptionsView *)v4 keyboardButton];
    [v25 addTarget:v4 action:sel__handleKeyboardButton forControlEvents:64];

    v26 = +[PKPaletteButton returnKeyButton];
    [(PKPaletteAdditionalOptionsView *)v4 setReturnKeyButton:v26];

    v27 = [(PKPaletteAdditionalOptionsView *)v4 returnKeyButton];
    [v27 addTarget:v4 action:sel__handleReturnKeyButton forControlEvents:64];

    v28 = objc_alloc_init(PKPaletteButtonGroupView);
    keyboardButtonGroupView = v4->_keyboardButtonGroupView;
    v4->_keyboardButtonGroupView = v28;

    [(PKPaletteButtonGroupView *)v4->_keyboardButtonGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_contentStackView addArrangedSubview:v4->_keyboardButtonGroupView];
    v30 = +[PKPaletteButton plusButton];
    [(PKPaletteAdditionalOptionsView *)v4 _setPlusButton:v30];

    v31 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    textShapeStackView = v4->_textShapeStackView;
    v4->_textShapeStackView = v31;

    [(UIStackView *)v4->_textShapeStackView setAxis:1];
    [(UIStackView *)v4->_textShapeStackView setDistribution:0];
    [(UIStackView *)v4->_textShapeStackView setAlignment:3];
    [(UIStackView *)v4->_textShapeStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_textShapeStackView setSpacing:12.0];
    [(UIStackView *)v4->_contentStackView addArrangedSubview:v4->_textShapeStackView];
    uint64_t v33 = +[PKPaletteButton textButton];
    textButton = v4->_textButton;
    v4->_textButton = (PKPaletteButton *)v33;

    [(PKPaletteButton *)v4->_textButton setAccessibilityIdentifier:@"Text Button"];
    [(UIStackView *)v4->_textShapeStackView addArrangedSubview:v4->_textButton];
    v35 = [(PKPaletteButton *)v4->_textButton widthAnchor];
    uint64_t v36 = [v35 constraintEqualToConstant:0.0];
    textButtonWidthConstraint = v4->_textButtonWidthConstraint;
    v4->_textButtonWidthConstraint = (NSLayoutConstraint *)v36;

    v38 = [(PKPaletteButton *)v4->_textButton heightAnchor];
    uint64_t v39 = [v38 constraintEqualToConstant:0.0];
    textButtonHeightConstraint = v4->_textButtonHeightConstraint;
    v4->_textButtonHeightConstraint = (NSLayoutConstraint *)v39;

    LODWORD(v41) = 1148846080;
    [(PKPaletteButton *)v4->_textButton setContentHuggingPriority:0 forAxis:v41];
    LODWORD(v42) = 1148846080;
    [(PKPaletteButton *)v4->_textButton setContentHuggingPriority:1 forAxis:v42];
    uint64_t v43 = +[PKPaletteButton shapeButton];
    shapeButton = v4->_shapeButton;
    v4->_shapeButton = (PKPaletteButton *)v43;

    [(PKPaletteButton *)v4->_shapeButton setAccessibilityIdentifier:@"Shape Button"];
    [(UIStackView *)v4->_textShapeStackView addArrangedSubview:v4->_shapeButton];
    v45 = [(PKPaletteButton *)v4->_shapeButton widthAnchor];
    uint64_t v46 = [v45 constraintEqualToConstant:0.0];
    shapeButtonWidthConstraint = v4->_shapeButtonWidthConstraint;
    v4->_shapeButtonWidthConstraint = (NSLayoutConstraint *)v46;

    v48 = [(PKPaletteButton *)v4->_shapeButton heightAnchor];
    uint64_t v49 = [v48 constraintEqualToConstant:0.0];
    shapeButtonHeightConstraint = v4->_shapeButtonHeightConstraint;
    v4->_shapeButtonHeightConstraint = (NSLayoutConstraint *)v49;

    LODWORD(v51) = 1148846080;
    [(PKPaletteButton *)v4->_shapeButton setContentHuggingPriority:0 forAxis:v51];
    LODWORD(v52) = 1148846080;
    [(PKPaletteButton *)v4->_shapeButton setContentHuggingPriority:1 forAxis:v52];
    v4->_wantsEllipsisButtonVisible = 1;
    uint64_t v53 = +[PKPaletteButton ellipsisButton];
    ellipsisButton = v4->_ellipsisButton;
    v4->_ellipsisButton = (PKPaletteButton *)v53;

    [(PKPaletteButton *)v4->_ellipsisButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteButton *)v4->_ellipsisButton addTarget:v4 action:sel__didSelectEllipsisButton_ forControlEvents:64];
    [(UIStackView *)v4->_contentStackView addArrangedSubview:v4->_ellipsisButton];
    v55 = [(PKPaletteButton *)v4->_ellipsisButton widthAnchor];
    uint64_t v56 = [v55 constraintEqualToConstant:0.0];
    ellipsisButtonWidthConstraint = v4->_ellipsisButtonWidthConstraint;
    v4->_ellipsisButtonWidthConstraint = (NSLayoutConstraint *)v56;

    v58 = [(PKPaletteButton *)v4->_ellipsisButton heightAnchor];
    uint64_t v59 = [v58 constraintEqualToConstant:0.0];
    ellipsisButtonHeightConstraint = v4->_ellipsisButtonHeightConstraint;
    v4->_ellipsisButtonHeightConstraint = (NSLayoutConstraint *)v59;

    LODWORD(v61) = 1148846080;
    [(PKPaletteButton *)v4->_ellipsisButton setContentHuggingPriority:0 forAxis:v61];
    LODWORD(v62) = 1148846080;
    [(PKPaletteButton *)v4->_ellipsisButton setContentHuggingPriority:1 forAxis:v62];
    v77[0] = v4->_textButtonWidthConstraint;
    v77[1] = v4->_textButtonHeightConstraint;
    v77[2] = v4->_shapeButtonWidthConstraint;
    v77[3] = v4->_shapeButtonHeightConstraint;
    v63 = (void *)MEMORY[0x1E4F28DC8];
    v77[4] = v4->_ellipsisButtonWidthConstraint;
    v77[5] = v4->_ellipsisButtonHeightConstraint;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:6];
    [v63 activateConstraints:v64];

    [(PKPaletteAdditionalOptionsView *)v4 _updateUI];
    objc_destroyWeak(&v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pencilInteractionPrefersPencilOnlyDrawsDidChange];
}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_3;
  v4[3] = &unk_1E64C5998;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);
}

void __48__PKPaletteAdditionalOptionsView_initWithFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutoRefineSettingsDidChange];
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = [(PKPaletteAdditionalOptionsView *)self superview];

  if (!a3 && v5)
  {
    [(PKPaletteAdditionalOptionsView *)self dismissPalettePopoverWithCompletion:0];
  }
}

- (void)didMoveToWindow
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaletteAdditionalOptionsView *)self window];

  if (v3)
  {
    v4 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL didTapOnPencilSettings = self->_didTapOnPencilSettings;
      v10[0] = 67174657;
      v10[1] = didTapOnPencilSettings;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "didMoveToWindow, didTapOnPencilSettings: %{private}d", (uint8_t *)v10, 8u);
    }

    char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4FB2EA8];
    v8 = [(PKPaletteAdditionalOptionsView *)self window];
    v9 = [v8 windowScene];
    [v6 addObserver:self selector:sel__handleSceneWillDeactivateNotification_ name:v7 object:v9];
  }
}

- (void)_handleSceneWillDeactivateNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL didTapOnPencilSettings = self->_didTapOnPencilSettings;
    v8[0] = 67174657;
    v8[1] = didTapOnPencilSettings;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "scene will deactivate, didTapOnPencilSettings: %{private}d", (uint8_t *)v8, 8u);
  }

  if (self->_didTapOnPencilSettings)
  {
    self->_BOOL didTapOnPencilSettings = 0;
    char v6 = os_log_create("com.apple.pencilkit", "AdditionalOptions");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "dismissis More Options popover", (uint8_t *)v8, 2u);
    }

    uint64_t v7 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v7 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)_pencilInteractionPrefersPencilOnlyDrawsDidChange
{
  self->_isFingerDrawsOn = [MEMORY[0x1E4FB1A80] prefersPencilOnlyDrawing] ^ 1;
  BOOL v3 = [(PKPaletteAdditionalOptionsView *)self isFingerDrawsOn];
  id v4 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v4 setIsFingerDrawsOn:v3];
}

- (void)_handleAutoRefineSettingsDidChange
{
  BOOL v3 = os_log_create("com.apple.pencilkit", "PKPaletteAdditionalOptionsView");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change", v4, 2u);
  }

  [(PKPaletteAdditionalOptionsView *)self _updateMoreOptionsViewControllerAutoRefineState];
}

- (void)setPlusButton:(id)a3
{
  if (self->_plusButton != a3)
  {
    -[PKPaletteAdditionalOptionsView _setPlusButton:](self, "_setPlusButton:");
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)_setPlusButton:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = (PKPaletteButton *)a3;
  if (self->_plusButton)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__PKPaletteAdditionalOptionsView__setPlusButton___block_invoke;
    v18[3] = &unk_1E64C61C0;
    v18[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v18];
    plusButton = self->_plusButton;
  }
  else
  {
    plusButton = 0;
  }
  self->_plusButton = v4;
  char v6 = v4;

  [(PKPaletteButton *)self->_plusButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_plusButton];
  uint64_t v7 = [(PKPaletteButton *)self->_plusButton widthAnchor];
  v8 = [v7 constraintEqualToConstant:0.0];
  plusButtonWidthConstraint = self->_plusButtonWidthConstraint;
  self->_plusButtonWidthConstraint = v8;

  v10 = [(PKPaletteButton *)self->_plusButton heightAnchor];
  uint64_t v11 = [v10 constraintEqualToConstant:0.0];
  plusButtonHeightConstraint = self->_plusButtonHeightConstraint;
  self->_plusButtonHeightConstraint = v11;

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = self->_plusButtonHeightConstraint;
  v19[0] = self->_plusButtonWidthConstraint;
  v19[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v13 activateConstraints:v15];

  LODWORD(v16) = 1148846080;
  [(PKPaletteButton *)self->_plusButton setContentHuggingPriority:0 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [(PKPaletteButton *)self->_plusButton setContentHuggingPriority:1 forAxis:v17];
}

uint64_t __49__PKPaletteAdditionalOptionsView__setPlusButton___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) removeFromSuperview];
}

- (void)setShowsPlusButton:(BOOL)a3
{
  if (self->_showsPlusButton != a3)
  {
    self->_showsPlusButton = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setShowsTextButton:(BOOL)a3
{
  if (self->_showsTextButton != a3)
  {
    self->_showsTextButton = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setShowsShapeButton:(BOOL)a3
{
  if (self->_showsShapeButton != a3)
  {
    self->_showsShapeButton = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setWantsEllipsisButtonVisible:(BOOL)a3
{
  if (self->_wantsEllipsisButtonVisible != a3)
  {
    self->_wantsEllipsisButtonVisible = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setWantsInputAssistantViewVisible:(BOOL)a3
{
  if (self->_wantsInputAssistantViewVisible != a3)
  {
    self->_wantsInputAssistantViewVisible = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setEnableKeyboardButtons:(BOOL)a3
{
  if (self->_enableKeyboardButtons != a3)
  {
    self->_enableKeyboardButtons = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setFloatingKeyboardType:(int64_t)a3
{
  if (self->_floatingKeyboardType != a3)
  {
    self->_floatingKeyboardType = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setShouldShowFingerDrawsOption:(BOOL)a3
{
  if (self->_shouldShowFingerDrawsOption != a3)
  {
    self->_shouldShowFingerDrawsOption = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setShouldShowTapToRadarOption:(BOOL)a3
{
  if (self->_shouldShowTapToRadarOption != a3)
  {
    self->_shouldShowTapToRadarOption = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3
{
  if (self->_shouldShowResetHandwritingEducationPane != a3)
  {
    self->_shouldShowResetHandwritingEducationPane = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PKPaletteAdditionalOptionsView *)self contentStackView];
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateUI
{
  [(PKPaletteAdditionalOptionsView *)self invalidateIntrinsicContentSize];
  double v3 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
  double v4 = [(PKPaletteAdditionalOptionsView *)self window];
  double v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __43__PKPaletteAdditionalOptionsView__updateUI__block_invoke;
  v81[3] = &unk_1E64C8030;
  v81[4] = self;
  BOOL v82 = v6;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v81];
  double v7 = 6.0;
  double v8 = 6.0;
  if (![(PKPaletteAdditionalOptionsView *)self showsShapeButton])
  {
    if ([(PKPaletteAdditionalOptionsView *)self showsTextButton]) {
      double v8 = 6.0;
    }
    else {
      double v8 = 12.0;
    }
  }
  double v9 = 28.0;
  if (!v6)
  {
    [(PKPaletteAdditionalOptionsView *)self scalingFactor];
    double v7 = v8 * v10;
    double v9 = 36.0;
  }
  uint64_t v11 = [(PKPaletteAdditionalOptionsView *)self contentStackView];
  [v11 setSpacing:v7];

  unint64_t v12 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
  BOOL v14 = v12 == 2 || v12 == 8;
  v15 = [(PKPaletteAdditionalOptionsView *)self contentStackView];
  [v15 setAxis:v14];

  unint64_t v16 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
  BOOL v18 = v16 != 2 && v16 != 8;
  v19 = [(PKPaletteAdditionalOptionsView *)self textShapeStackView];
  [v19 setAxis:v18];

  [(PKPaletteAdditionalOptionsView *)self scalingFactor];
  double v21 = v20 * 12.0;
  v22 = [(PKPaletteAdditionalOptionsView *)self textShapeStackView];
  [v22 setSpacing:v21];

  [(PKPaletteAdditionalOptionsView *)self scalingFactor];
  double v24 = v9 * v23;
  double v25 = v9 * v23;
  v26 = [(PKPaletteAdditionalOptionsView *)self plusButtonWidthConstraint];
  [v26 setConstant:v24];

  v27 = [(PKPaletteAdditionalOptionsView *)self plusButtonHeightConstraint];
  [v27 setConstant:v25];

  v28 = [(PKPaletteAdditionalOptionsView *)self ellipsisButtonWidthConstraint];
  [v28 setConstant:v24];

  v29 = [(PKPaletteAdditionalOptionsView *)self ellipsisButtonHeightConstraint];
  [v29 setConstant:v25];

  v30 = [(PKPaletteAdditionalOptionsView *)self textButtonWidthConstraint];
  [v30 setConstant:v24];

  v31 = [(PKPaletteAdditionalOptionsView *)self textButtonHeightConstraint];
  [v31 setConstant:v25];

  v32 = [(PKPaletteAdditionalOptionsView *)self shapeButtonWidthConstraint];
  [v32 setConstant:v24];

  uint64_t v33 = [(PKPaletteAdditionalOptionsView *)self shapeButtonHeightConstraint];
  [v33 setConstant:v25];

  [(PKPaletteAdditionalOptionsView *)self scalingFactor];
  double v35 = v34;
  uint64_t v36 = [(PKPaletteAdditionalOptionsView *)self textButton];
  [v36 setScalingFactor:v35];

  [(PKPaletteAdditionalOptionsView *)self scalingFactor];
  double v38 = v37;
  uint64_t v39 = [(PKPaletteAdditionalOptionsView *)self shapeButton];
  [v39 setScalingFactor:v38];

  [(PKPaletteAdditionalOptionsView *)self scalingFactor];
  double v41 = v40;
  double v42 = [(PKPaletteAdditionalOptionsView *)self keyboardButtonGroupView];
  [v42 setScalingFactor:v41];

  unint64_t v43 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
  BOOL v45 = v43 != 2 && v43 != 8;
  uint64_t v46 = [(PKPaletteAdditionalOptionsView *)self keyboardButtonGroupView];
  [v46 setAxis:v45];

  v47 = [(PKPaletteAdditionalOptionsView *)self keyboardButtonGroupView];
  [v47 removeAllButtons];

  v48 = [(PKPaletteAdditionalOptionsView *)self keyboardButtonGroupView];
  uint64_t v49 = [(PKPaletteAdditionalOptionsView *)self _keyboardButtonGroupViewButtons];
  [v48 addButtonsFromArray:v49];

  double v51 = *MEMORY[0x1E4FB12A8];
  double v50 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v52 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v53 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  if (!v6
    && ([(PKPaletteAdditionalOptionsView *)self showsShapeButton]
     || [(PKPaletteAdditionalOptionsView *)self showsTextButton]))
  {
    unint64_t v54 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
    BOOL v55 = v54 == 8 || v54 == 2;
    double v50 = 0.0;
    double v53 = 6.0;
    if (v55) {
      double v52 = 6.0;
    }
    else {
      double v52 = 0.0;
    }
    unint64_t v56 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
    if (v56 != 4 && v56 != 1) {
      double v53 = 0.0;
    }
    double v51 = 0.0;
  }
  v58 = [(PKPaletteAdditionalOptionsView *)self keyboardButtonGroupView];
  objc_msgSend(v58, "setAdditionalContentMargins:", v51, v50, v52, v53);

  int64_t v59 = [(PKPaletteAdditionalOptionsView *)self floatingKeyboardType];
  v60 = [(PKPaletteAdditionalOptionsView *)self keyboardButton];
  [v60 setFloatingKeyboardType:v59];

  double v61 = [(PKPaletteAdditionalOptionsView *)self delegate];
  double v62 = [v61 keyboardSelectionMenuForAdditionalOptionsView:self];
  v63 = [(PKPaletteAdditionalOptionsView *)self keyboardButton];
  [v63 setKeyboardSelectionMenu:v62];

  BOOL v64 = [(PKPaletteAdditionalOptionsView *)self enableKeyboardButtons];
  v65 = [(PKPaletteAdditionalOptionsView *)self keyboardButton];
  [v65 setEnableKeyboardToggle:v64];

  BOOL v66 = [(PKPaletteAdditionalOptionsView *)self enableKeyboardButtons];
  v67 = [(PKPaletteAdditionalOptionsView *)self returnKeyButton];
  [v67 setEnabled:v66];

  v68 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
  if ([v68 userInterfaceIdiom]) {
    goto LABEL_43;
  }
  v69 = [MEMORY[0x1E4F28B50] mainBundle];
  v70 = [v69 bundleIdentifier];
  int v71 = [v70 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v71)
  {
    id v72 = [(PKPaletteAdditionalOptionsView *)self plusButton];
    [v72 setOverrideUserInterfaceStyle:2];

    v73 = [(PKPaletteAdditionalOptionsView *)self ellipsisButton];
    [v73 setOverrideUserInterfaceStyle:2];

    id v74 = [(PKPaletteAdditionalOptionsView *)self textButton];
    [v74 setOverrideUserInterfaceStyle:2];

    v68 = [(PKPaletteAdditionalOptionsView *)self shapeButton];
    [v68 setOverrideUserInterfaceStyle:2];
LABEL_43:
  }
  BOOL v75 = [(PKPaletteAdditionalOptionsView *)self shouldShowFingerDrawsOption];
  objc_super v76 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v76 setShouldShowFingerDrawsOption:v75];

  BOOL v77 = [(PKPaletteAdditionalOptionsView *)self shouldShowTapToRadarOption];
  v78 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v78 setShouldShowTapToRadarOption:v77];

  BOOL v79 = [(PKPaletteAdditionalOptionsView *)self shouldShowResetHandwritingEducationPane];
  v80 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v80 setShouldShowResetHandwritingEducationPane:v79];
}

void __43__PKPaletteAdditionalOptionsView__updateUI__block_invoke(uint64_t a1)
{
  v49[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) plusButton];
  [v2 removeFromSuperview];

  double v3 = [*(id *)(a1 + 32) contentStackView];
  double v4 = [*(id *)(a1 + 32) plusButton];
  [v3 insertArrangedSubview:v4 atIndex:0];

  double v5 = [*(id *)(a1 + 32) ellipsisButton];
  [v5 removeFromSuperview];

  BOOL v6 = [*(id *)(a1 + 32) contentStackView];
  double v7 = [*(id *)(a1 + 32) ellipsisButton];
  [v6 insertArrangedSubview:v7 atIndex:1];

  if (([*(id *)(a1 + 32) showsTextButton] & 1) != 0
    || [*(id *)(a1 + 32) showsShapeButton])
  {
    double v8 = [*(id *)(a1 + 32) textShapeStackView];
    [v8 removeFromSuperview];

    double v9 = [*(id *)(a1 + 32) contentStackView];
    double v10 = [*(id *)(a1 + 32) textShapeStackView];
    [v9 insertArrangedSubview:v10 atIndex:0];
  }
  uint64_t v11 = [*(id *)(a1 + 32) keyboardButtonGroupView];
  [v11 removeFromSuperview];

  unint64_t v12 = [*(id *)(a1 + 32) contentStackView];
  v13 = [*(id *)(a1 + 32) keyboardButtonGroupView];
  [v12 insertArrangedSubview:v13 atIndex:0];

  uint64_t v14 = [*(id *)(a1 + 32) showsPlusButton] ^ 1;
  v15 = [*(id *)(a1 + 32) plusButton];
  [v15 setHidden:v14];

  uint64_t v16 = [*(id *)(a1 + 32) showsTextButton] ^ 1;
  double v17 = [*(id *)(a1 + 32) textButton];
  [v17 setHidden:v16];

  uint64_t v18 = [*(id *)(a1 + 32) showsShapeButton] ^ 1;
  v19 = [*(id *)(a1 + 32) shapeButton];
  [v19 setHidden:v18];

  uint64_t v20 = [*(id *)(a1 + 32) wantsEllipsisButtonVisible] ^ 1;
  double v21 = [*(id *)(a1 + 32) ellipsisButton];
  [v21 setHidden:v20];

  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = [*(id *)(a1 + 32) wantsInputAssistantViewVisible] ^ 1;
  }
  double v23 = [*(id *)(a1 + 32) keyboardButtonGroupView];
  [v23 setHidden:v22];

  if ([*(id *)(a1 + 32) showsTextButton]) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [*(id *)(a1 + 32) showsShapeButton] ^ 1;
  }
  double v25 = [*(id *)(a1 + 32) textShapeStackView];
  [v25 setHidden:v24];

  v26 = [*(id *)(a1 + 32) textButton];
  [v26 removeFromSuperview];

  v27 = [*(id *)(a1 + 32) shapeButton];
  [v27 removeFromSuperview];

  uint64_t v28 = [*(id *)(a1 + 32) edgeLocation];
  v29 = [*(id *)(a1 + 32) textShapeStackView];
  v30 = *(void **)(a1 + 32);
  if (v28 == 2)
  {
    v31 = [v30 shapeButton];
    [v29 addArrangedSubview:v31];

    v32 = [*(id *)(a1 + 32) textShapeStackView];
    [*(id *)(a1 + 32) textButton];
  }
  else
  {
    uint64_t v33 = [v30 textButton];
    [v29 addArrangedSubview:v33];

    v32 = [*(id *)(a1 + 32) textShapeStackView];
    [*(id *)(a1 + 32) shapeButton];
  double v34 = };
  [v32 addArrangedSubview:v34];

  double v35 = [*(id *)(a1 + 32) plusEllipsisStackView];
  [v35 removeFromSuperview];

  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) showsPlusButton])
  {
    if ([*(id *)(a1 + 32) wantsEllipsisButtonVisible])
    {
      uint64_t v36 = [*(id *)(a1 + 32) plusButton];
      [v36 removeFromSuperview];

      double v37 = [*(id *)(a1 + 32) ellipsisButton];
      [v37 removeFromSuperview];

      id v38 = objc_alloc(MEMORY[0x1E4FB1C60]);
      uint64_t v39 = [*(id *)(a1 + 32) plusButton];
      v49[0] = v39;
      double v40 = [*(id *)(a1 + 32) ellipsisButton];
      v49[1] = v40;
      double v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      double v42 = (void *)[v38 initWithArrangedSubviews:v41];
      [*(id *)(a1 + 32) setPlusEllipsisStackView:v42];

      unint64_t v43 = [*(id *)(a1 + 32) plusEllipsisStackView];
      [v43 setAxis:1];

      v44 = [*(id *)(a1 + 32) plusEllipsisStackView];
      [v44 setDistribution:1];

      BOOL v45 = [*(id *)(a1 + 32) plusEllipsisStackView];
      [v45 setAlignment:3];

      uint64_t v46 = [*(id *)(a1 + 32) plusEllipsisStackView];
      [v46 setSpacing:12.0];

      v47 = [*(id *)(a1 + 32) contentStackView];
      v48 = [*(id *)(a1 + 32) plusEllipsisStackView];
      [v47 addArrangedSubview:v48];
    }
  }
}

- (id)_keyboardButtonGroupViewButtons
{
  _DWORD v10[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKPaletteAdditionalOptionsView *)self edgeLocation];
  if (v3 == 2 || v3 == 8)
  {
    double v4 = [(PKPaletteAdditionalOptionsView *)self returnKeyButton];
    v10[0] = v4;
    double v5 = [(PKPaletteAdditionalOptionsView *)self keyboardButton];
    v10[1] = v5;
    BOOL v6 = v10;
  }
  else
  {
    double v4 = [(PKPaletteAdditionalOptionsView *)self keyboardButton];
    v9[0] = v4;
    double v5 = [(PKPaletteAdditionalOptionsView *)self returnKeyButton];
    v9[1] = v5;
    BOOL v6 = v9;
  }
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v7;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
}

- (void)_didSelectEllipsisButton:(id)a3
{
  id v57 = a3;
  double v4 = [(PKPaletteAdditionalOptionsView *)self palettePopoverPresenting];
  double v5 = [v4 palettePopoverPresentingController];

  if (v5)
  {
    id v6 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    if (v6)
    {
      double v7 = v6;
      if ([v6 isBeingPresented])
      {

LABEL_11:
        goto LABEL_12;
      }
      char v8 = [v7 isBeingDismissed];

      if (v8) {
        goto LABEL_12;
      }
    }
    double v9 = objc_alloc_init(PKPaletteMoreOptionsViewController);
    [(PKPaletteAdditionalOptionsView *)self setMoreOptionsViewController:v9];

    double v10 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [(PKPaletteAdditionalOptionsView *)self setPresentedPopoverViewController:v10];

    BOOL v11 = [(PKPaletteAdditionalOptionsView *)self shouldShowTapToRadarOption];
    unint64_t v12 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v12 setShouldShowTapToRadarOption:v11];

    BOOL v13 = [(PKPaletteAdditionalOptionsView *)self shouldShowResetHandwritingEducationPane];
    uint64_t v14 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v14 setShouldShowResetHandwritingEducationPane:v13];

    uint64_t v15 = PKCurrentDeviceSupportsPencil();
    uint64_t v16 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v16 setShouldShowOpenPencilSettingsOption:v15];

    BOOL v17 = [(PKPaletteAdditionalOptionsView *)self isAutoHideOn];
    uint64_t v18 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v18 setAutoHideOn:v17];

    BOOL v19 = [(PKPaletteAdditionalOptionsView *)self isFingerDrawsOn];
    uint64_t v20 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v20 setIsFingerDrawsOn:v19];

    [(PKPaletteAdditionalOptionsView *)self _updateMoreOptionsViewControllerAutoRefineState];
    double v21 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
    uint64_t v22 = [(PKPaletteAdditionalOptionsView *)self window];
    double v23 = [v22 windowScene];
    BOOL v24 = !PKUseCompactSize(v21, v23);
    double v25 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v25 setShouldShowAutoMinimizeOption:v24];

    v26 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v26 setDelegate:self];

    BOOL v27 = [(PKPaletteAdditionalOptionsView *)self shouldShowFingerDrawsOption];
    uint64_t v28 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    [v28 setShouldShowFingerDrawsOption:v27];

    v29 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    v30 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
    [v29 updateUIForTraitCollection:v30];

    v31 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    [v31 setModalPresentationStyle:7];

    v32 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    uint64_t v33 = [v32 popoverPresentationController];
    [v33 setDelegate:self];

    double v34 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
    double v35 = [(PKPaletteAdditionalOptionsView *)self window];
    uint64_t v36 = [v35 windowScene];
    if (PKUseCompactSize(v34, v36)) {
      uint64_t v37 = 2;
    }
    else {
      uint64_t v37 = PKUIPopoverPermittedArrowDirectionsForEdge([(PKPaletteAdditionalOptionsView *)self edgeLocation]);
    }
    id v38 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    uint64_t v39 = [v38 popoverPresentationController];
    [v39 setPermittedArrowDirections:v37];

    [v57 bounds];
    CGRect v60 = CGRectInset(v59, -5.0, -5.0);
    double x = v60.origin.x;
    double y = v60.origin.y;
    double width = v60.size.width;
    double height = v60.size.height;
    v44 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    BOOL v45 = [v44 popoverPresentationController];
    objc_msgSend(v45, "setSourceRect:", x, y, width, height);

    uint64_t v46 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    v47 = [v46 popoverPresentationController];
    [v47 setSourceView:v57];

    v48 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    uint64_t v49 = [v48 popoverPresentationController];
    [v49 _setShouldDisableInteractionDuringTransitions:0];

    double v50 = [(PKPaletteAdditionalOptionsView *)self palettePopoverPresenting];
    double v51 = [v50 palettePopoverPassthroughViews];
    double v52 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    double v53 = [v52 popoverPresentationController];
    [v53 setPassthroughViews:v51];

    unint64_t v54 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    BOOL v55 = [v54 popoverPresentationController];
    [v55 _setIgnoresKeyboardNotifications:1];

    [(PKPaletteAdditionalOptionsView *)self updatePopoverUI];
    unint64_t v56 = [(PKPaletteAdditionalOptionsView *)self palettePopoverPresenting];
    LODWORD(v55) = [v56 shouldPalettePresentPopover];

    if (!v55) {
      goto LABEL_12;
    }
    double v7 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    [v5 presentViewController:v7 animated:1 completion:0];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)updatePopoverUI
{
  id v4 = [(PKPaletteAdditionalOptionsView *)self palettePopoverPresenting];
  unint64_t v3 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
  [v4 updatePalettePopover:v3];
}

- (void)_updateMoreOptionsViewControllerAutoRefineState
{
  BOOL v3 = +[PKSettingsDaemon autoRefineEnabled];
  id v4 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v4 setIsAutoRefineOn:v3];
}

- (void)moreOptionsViewControllerDidToggleAutoHide:(id)a3
{
  -[PKPaletteAdditionalOptionsView setAutoHideOn:](self, "setAutoHideOn:", [a3 isAutoHideOn]);
  id v4 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidToggleAutoHide___block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __77__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidToggleAutoHide___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "additionalOptionsView:didToggleAutoHideOption:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isAutoHideOn"));
}

- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3
{
  uint64_t v4 = [a3 isFingerDrawsOn];
  int v5 = v4;
  [(PKPaletteAdditionalOptionsView *)self setIsFingerDrawsOn:v4];
  +[PKSettingsDaemon setPrefersPencilOnlyDrawing:v5 ^ 1u];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordDrawWithFingerToggle:]((uint64_t)v6);
}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  self->_BOOL didTapOnPencilSettings = 1;
  +[PKSettingsDaemon openPencilPreferences];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordJumpToSettings]((uint64_t)v3);
}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  uint64_t v4 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidSelectTapToRadar___block_invoke;
  v5[3] = &unk_1E64C61C0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __79__PKPaletteAdditionalOptionsView_moreOptionsViewControllerDidSelectTapToRadar___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 additionalOptionsViewDidPressTapToRadarButton:*(void *)(a1 + 32)];
}

- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.pencilkit", "PKPaletteAdditionalOptionsView");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [v3 isAutoRefineOn];
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Did toggle AutoRefine to %{BOOL}d", (uint8_t *)v5, 8u);
  }

  +[PKSettingsDaemon setAutoRefineEnabled:](PKSettingsDaemon, "setAutoRefineEnabled:", [v3 isAutoRefineOn]);
}

- (void)moreOptionsViewControllerDidSelectResetHandwritingEducationPane:(id)a3
{
  +[PKWelcomeController resetEducationPane];
  id v4 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteAdditionalOptionsView;
  [(PKPaletteAdditionalOptionsView *)&v13 traitCollectionDidChange:v4];
  int v5 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  uint64_t v7 = [v4 horizontalSizeClass];

  if (v6 != v7)
  {
    char v8 = [(PKPaletteAdditionalOptionsView *)self moreOptionsViewController];
    double v9 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
    [v8 updateUIForTraitCollection:v9];

    [(PKPaletteAdditionalOptionsView *)self _updateUI];
  }
  double v10 = [(PKPaletteAdditionalOptionsView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];
  uint64_t v12 = [v4 userInterfaceStyle];

  if (v11 != v12) {
    [(PKPaletteAdditionalOptionsView *)self updatePopoverUI];
  }
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  id v4 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];

  if (v4)
  {
    int v5 = [(PKPaletteAdditionalOptionsView *)self presentedPopoverViewController];
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (CGRect)plusButtonFrame
{
  id v2 = [(PKPaletteAdditionalOptionsView *)self plusButton];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)_handleKeyboardButton
{
  double v3 = [(PKPaletteAdditionalOptionsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaletteAdditionalOptionsView *)self delegate];
    [v5 additionalOptionsViewDidPressKeyboardButton:self];
  }
}

- (void)_handleReturnKeyButton
{
  double v3 = [(PKPaletteAdditionalOptionsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaletteAdditionalOptionsView *)self delegate];
    [v5 additionalOptionsViewDidPressReturnKeyButton:self];
  }
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPalettePopoverPresenting)palettePopoverPresenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_palettePopoverPresenting);

  return (PKPalettePopoverPresenting *)WeakRetained;
}

- (void)setPalettePopoverPresenting:(id)a3
{
}

- (PKPaletteAdditionalOptionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteAdditionalOptionsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteButton)plusButton
{
  return self->_plusButton;
}

- (PKPaletteButton)textButton
{
  return self->_textButton;
}

- (void)setTextButton:(id)a3
{
}

- (PKPaletteButton)shapeButton
{
  return self->_shapeButton;
}

- (BOOL)showsPlusButton
{
  return self->_showsPlusButton;
}

- (BOOL)showsTextButton
{
  return self->_showsTextButton;
}

- (BOOL)showsShapeButton
{
  return self->_showsShapeButton;
}

- (BOOL)isAutoHideOn
{
  return self->_autoHideOn;
}

- (void)setAutoHideOn:(BOOL)a3
{
  self->_autoHideOn = a3;
}

- (BOOL)isFingerDrawsOn
{
  return self->_isFingerDrawsOn;
}

- (void)setIsFingerDrawsOn:(BOOL)a3
{
  self->_isFingerDrawsOn = a3;
}

- (BOOL)shouldShowFingerDrawsOption
{
  return self->_shouldShowFingerDrawsOption;
}

- (BOOL)shouldShowTapToRadarOption
{
  return self->_shouldShowTapToRadarOption;
}

- (BOOL)shouldShowResetHandwritingEducationPane
{
  return self->_shouldShowResetHandwritingEducationPane;
}

- (BOOL)wantsEllipsisButtonVisible
{
  return self->_wantsEllipsisButtonVisible;
}

- (BOOL)wantsInputAssistantViewVisible
{
  return self->_wantsInputAssistantViewVisible;
}

- (BOOL)enableKeyboardButtons
{
  return self->_enableKeyboardButtons;
}

- (int64_t)floatingKeyboardType
{
  return self->_floatingKeyboardType;
}

- (BOOL)shouldHideHoverPreviewToggle
{
  return self->_shouldHideHoverPreviewToggle;
}

- (void)setShouldHideHoverPreviewToggle:(BOOL)a3
{
  self->_shouldHideHoverPreviewToggle = a3;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (UIStackView)textShapeStackView
{
  return self->_textShapeStackView;
}

- (void)setTextShapeStackView:(id)a3
{
}

- (UIStackView)plusEllipsisStackView
{
  return self->_plusEllipsisStackView;
}

- (void)setPlusEllipsisStackView:(id)a3
{
}

- (PKPaletteButton)ellipsisButton
{
  return self->_ellipsisButton;
}

- (void)setEllipsisButton:(id)a3
{
}

- (PKPaletteButtonGroupView)keyboardButtonGroupView
{
  return self->_keyboardButtonGroupView;
}

- (void)setKeyboardButtonGroupView:(id)a3
{
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
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

- (PKPaletteMoreOptionsViewController)moreOptionsViewController
{
  return self->_moreOptionsViewController;
}

- (void)setMoreOptionsViewController:(id)a3
{
}

- (UIViewController)presentedPopoverViewController
{
  return self->_presentedPopoverViewController;
}

- (void)setPresentedPopoverViewController:(id)a3
{
}

- (NSLayoutConstraint)plusButtonWidthConstraint
{
  return self->_plusButtonWidthConstraint;
}

- (void)setPlusButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)plusButtonHeightConstraint
{
  return self->_plusButtonHeightConstraint;
}

- (void)setPlusButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)ellipsisButtonWidthConstraint
{
  return self->_ellipsisButtonWidthConstraint;
}

- (void)setEllipsisButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)ellipsisButtonHeightConstraint
{
  return self->_ellipsisButtonHeightConstraint;
}

- (void)setEllipsisButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)textButtonWidthConstraint
{
  return self->_textButtonWidthConstraint;
}

- (void)setTextButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)textButtonHeightConstraint
{
  return self->_textButtonHeightConstraint;
}

- (void)setTextButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)shapeButtonWidthConstraint
{
  return self->_shapeButtonWidthConstraint;
}

- (void)setShapeButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)shapeButtonHeightConstraint
{
  return self->_shapeButtonHeightConstraint;
}

- (void)setShapeButtonHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_shapeButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_plusButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_plusButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_presentedPopoverViewController, 0);
  objc_storeStrong((id *)&self->_moreOptionsViewController, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_keyboardButtonGroupView, 0);
  objc_storeStrong((id *)&self->_ellipsisButton, 0);
  objc_storeStrong((id *)&self->_plusEllipsisStackView, 0);
  objc_storeStrong((id *)&self->_textShapeStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_shapeButton, 0);
  objc_storeStrong((id *)&self->_textButton, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_palettePopoverPresenting);
  objc_storeStrong((id *)&self->_autoRefineSettingsObserver, 0);

  objc_storeStrong((id *)&self->_pencilInteractionObserver, 0);
}

@end