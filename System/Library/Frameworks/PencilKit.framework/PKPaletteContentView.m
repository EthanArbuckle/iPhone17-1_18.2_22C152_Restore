@interface PKPaletteContentView
- (BOOL)_contextEditingModeWantsContextualEditingViewVisible;
- (BOOL)_isHandwritingToolSelected;
- (BOOL)_useCompactSize;
- (BOOL)_useEqualSpacingStackViewDistribution;
- (BOOL)_wantsAdditionalOptionsViewVisible;
- (BOOL)_wantsUndoRedoButtonsShadow;
- (BOOL)_wantsUndoRedoButtonsVisible;
- (BOOL)isEllipsisButtonVisible;
- (BOOL)isUsingSmallestSupportedWidth;
- (CGRect)plusButtonFrame;
- (NSLayoutConstraint)additionalOptionsViewCompactHeightConstraint;
- (NSLayoutConstraint)additionalOptionsViewCompactWidthConstraint;
- (NSLayoutConstraint)stackViewBottomConstraint;
- (NSLayoutConstraint)stackViewCenterXConstraint;
- (NSLayoutConstraint)stackViewCompactLeftConstraint;
- (NSLayoutConstraint)stackViewCompactRightConstraint;
- (NSLayoutConstraint)stackViewLeftConstraint;
- (NSLayoutConstraint)stackViewRightConstraint;
- (NSLayoutConstraint)stackViewTopConstraint;
- (NSLayoutConstraint)toolAndColorPickerContainerViewHeightConstraint;
- (NSLayoutConstraint)toolAndColorPickerContainerViewWidthConstraint;
- (NSLayoutConstraint)toolPickerViewHeightConstraint;
- (NSLayoutConstraint)toolPickerViewWidthConstraint;
- (NSString)lassoToolEditingViewIdentifier;
- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView;
- (PKDrawingPaletteViewStateSubject)paletteViewState;
- (PKPaletteAdditionalOptionsView)additionalOptionsView;
- (PKPaletteColorPickerView)colorPickerView;
- (PKPaletteContentView)initWithPaletteViewStateObservable:(id)a3;
- (PKPaletteContentViewDelegate)delegate;
- (PKPaletteToolPickerAndColorPickerView)toolAndColorPickerContainerView;
- (PKPaletteToolPickerView)toolPickerView;
- (PKPaletteUndoRedoView)undoRedoView;
- (UIStackView)stackView;
- (UITapGestureRecognizer)lassoToolTapGestureRecognizerInCompact;
- (UIView)contextualEditingView;
- (UIView)lassoToolEditingView;
- (double)_interItemToolsSpacing;
- (double)_stackViewSpacing;
- (double)_undoRedoButtonsInterItemSpacing;
- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)paletteButton:(id)a3 backgroundColorForState:(unint64_t)a4;
- (id)paletteButton:(id)a3 tintColorForState:(unint64_t)a4;
- (int64_t)_stackViewDistribution;
- (int64_t)contextEditingMode;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_configureMenuForKeyboardButton:(id)a3;
- (void)_configureReturnKeyButton:(id)a3;
- (void)_didTapLassoToolInCompact;
- (void)_dismissPalettePopoverUsingConfirmationBlock:(id)a3 completion:(id)a4;
- (void)_handleKeyboardButtonPressed;
- (void)_handleReturnKeyButtonPressed;
- (void)_installAdditionalOptionsView;
- (void)_installStackView;
- (void)_installUndoRedoButtonsView;
- (void)_updateAdditionalOptionsViewVisibility;
- (void)_updateColorPickerContainerViewLocationInHierarchy;
- (void)_updateUI;
- (void)_updateUIResetUnselectedToolsVisible:(BOOL)a3;
- (void)colorPickerContainerView:(id)a3 willDismissInputAssistantView:(id)a4;
- (void)colorPickerContainerView:(id)a3 willPresentInputAssistantView:(id)a4;
- (void)dismissEyeDropper;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)paletteViewStateDidChange:(id)a3;
- (void)paletteViewStateDidChangeIsVisible:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setAdditionalOptionsViewCompactHeightConstraint:(id)a3;
- (void)setAdditionalOptionsViewCompactWidthConstraint:(id)a3;
- (void)setContextEditingMode:(int64_t)a3;
- (void)setContextualEditingView:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setLassoToolEditingViewIdentifier:(id)a3;
- (void)setLassoToolTapGestureRecognizerInCompact:(id)a3;
- (void)setPaletteViewState:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewBottomConstraint:(id)a3;
- (void)setStackViewCenterXConstraint:(id)a3;
- (void)setStackViewCompactLeftConstraint:(id)a3;
- (void)setStackViewCompactRightConstraint:(id)a3;
- (void)setStackViewLeftConstraint:(id)a3;
- (void)setStackViewRightConstraint:(id)a3;
- (void)setStackViewTopConstraint:(id)a3;
- (void)setToolAndColorPickerContainerView:(id)a3;
- (void)setToolAndColorPickerContainerViewHeightConstraint:(id)a3;
- (void)setToolAndColorPickerContainerViewWidthConstraint:(id)a3;
- (void)setToolPickerViewHeightConstraint:(id)a3;
- (void)setToolPickerViewWidthConstraint:(id)a3;
- (void)setUsingSmallestSupportedWidth:(BOOL)a3;
- (void)toggleColorSelectionPopover;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteContentView

- (PKPaletteContentView)initWithPaletteViewStateObservable:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKPaletteContentView;
  v5 = [(PKPaletteContentView *)&v39 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_paletteViewState, v4);
    [(PKPaletteContentView *)v6 _installStackView];
    [(PKPaletteContentView *)v6 _installUndoRedoButtonsView];
    v7 = [(PKPaletteContentView *)v6 undoRedoView];
    v8 = [v7 undoButton];
    [v8 setDelegate:v6];

    v9 = [(PKPaletteContentView *)v6 undoRedoView];
    v10 = [v9 redoButton];
    [v10 setDelegate:v6];

    v11 = objc_alloc_init(PKPaletteToolPickerAndColorPickerView);
    toolAndColorPickerContainerView = v6->_toolAndColorPickerContainerView;
    v6->_toolAndColorPickerContainerView = v11;

    [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_paletteViewState);
    v14 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView colorPickerContainerView];
    [v14 setPaletteViewState:WeakRetained];

    v15 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView colorPickerContainerView];
    [v15 setDelegate:v6];

    [(UIStackView *)v6->_stackView addArrangedSubview:v6->_toolAndColorPickerContainerView];
    v16 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView widthAnchor];
    v17 = [(UIStackView *)v6->_stackView widthAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    toolAndColorPickerContainerViewWidthConstraint = v6->_toolAndColorPickerContainerViewWidthConstraint;
    v6->_toolAndColorPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v18;

    v20 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView heightAnchor];
    v21 = [(UIStackView *)v6->_stackView heightAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    toolAndColorPickerContainerViewHeightConstraint = v6->_toolAndColorPickerContainerViewHeightConstraint;
    v6->_toolAndColorPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1148829696;
    [(NSLayoutConstraint *)v6->_toolAndColorPickerContainerViewWidthConstraint setPriority:v24];
    LODWORD(v25) = 1148829696;
    [(NSLayoutConstraint *)v6->_toolAndColorPickerContainerViewHeightConstraint setPriority:v25];
    v26 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView toolPickerView];
    v27 = [v26 widthAnchor];
    uint64_t v28 = [v27 constraintEqualToConstant:0.0];
    toolPickerViewWidthConstraint = v6->_toolPickerViewWidthConstraint;
    v6->_toolPickerViewWidthConstraint = (NSLayoutConstraint *)v28;

    v30 = [(PKPaletteToolPickerAndColorPickerView *)v6->_toolAndColorPickerContainerView toolPickerView];
    v31 = [v30 heightAnchor];
    uint64_t v32 = [v31 constraintEqualToConstant:0.0];
    toolPickerViewHeightConstraint = v6->_toolPickerViewHeightConstraint;
    v6->_toolPickerViewHeightConstraint = (NSLayoutConstraint *)v32;

    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contextualEditingView = v6->_contextualEditingView;
    v6->_contextualEditingView = v34;

    [(UIView *)v6->_contextualEditingView setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    lassoToolTapGestureRecognizerInCompact = v6->_lassoToolTapGestureRecognizerInCompact;
    v6->_lassoToolTapGestureRecognizerInCompact = v36;

    [(UITapGestureRecognizer *)v6->_lassoToolTapGestureRecognizerInCompact addTarget:v6 action:sel__didTapLassoToolInCompact];
    [(PKPaletteContentView *)v6 _installAdditionalOptionsView];
    [(PKPaletteContentView *)v6 _updateUI];
  }

  return v6;
}

- (void)toggleColorSelectionPopover
{
  if ([(PKPaletteContentView *)self _isHandwritingToolSelected])
  {
    v3 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Can't present color picker popover when the handwriting tool is currently selected.", buf, 2u);
    }
  }
  else
  {
    id v4 = [(PKPaletteContentView *)self colorPickerView];
    [v4 toggleColorSelectionPopover];
  }
}

- (void)_installStackView
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  stackView = self->_stackView;
  self->_stackView = v3;

  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(PKPaletteContentView *)self addSubview:self->_stackView];
  v5 = [(UIStackView *)self->_stackView topAnchor];
  v6 = [(PKPaletteContentView *)self topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  stackViewTopConstraint = self->_stackViewTopConstraint;
  self->_stackViewTopConstraint = v7;

  v9 = [(PKPaletteContentView *)self bottomAnchor];
  v10 = [(UIStackView *)self->_stackView bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v11;

  v13 = [(UIStackView *)self->_stackView leftAnchor];
  v14 = [(PKPaletteContentView *)self leftAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  stackViewLeftConstraint = self->_stackViewLeftConstraint;
  self->_stackViewLeftConstraint = v15;

  v17 = [(PKPaletteContentView *)self rightAnchor];
  uint64_t v18 = [(UIStackView *)self->_stackView rightAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  stackViewRightConstraint = self->_stackViewRightConstraint;
  self->_stackViewRightConstraint = v19;

  LODWORD(v21) = 1148829696;
  [(NSLayoutConstraint *)self->_stackViewLeftConstraint setPriority:v21];
  LODWORD(v22) = 1148829696;
  [(NSLayoutConstraint *)self->_stackViewRightConstraint setPriority:v22];
  LODWORD(v23) = 1148829696;
  [(NSLayoutConstraint *)self->_stackViewTopConstraint setPriority:v23];
  LODWORD(v24) = 1148829696;
  [(NSLayoutConstraint *)self->_stackViewBottomConstraint setPriority:v24];
  double v25 = [(UIStackView *)self->_stackView centerXAnchor];
  v26 = [(PKPaletteContentView *)self centerXAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  stackViewCenterXConstraint = self->_stackViewCenterXConstraint;
  self->_stackViewCenterXConstraint = v27;

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v30 = self->_stackViewBottomConstraint;
  v33[0] = self->_stackViewTopConstraint;
  v33[1] = v30;
  v31 = self->_stackViewRightConstraint;
  v33[2] = self->_stackViewLeftConstraint;
  v33[3] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  [v29 activateConstraints:v32];
}

- (void)_installUndoRedoButtonsView
{
  v3 = objc_alloc_init(PKPaletteUndoRedoView);
  undoRedoView = self->_undoRedoView;
  self->_undoRedoView = v3;

  [(PKPaletteUndoRedoView *)self->_undoRedoView setTranslatesAutoresizingMaskIntoConstraints:0];
  stackView = self->_stackView;
  v6 = self->_undoRedoView;

  [(UIStackView *)stackView addArrangedSubview:v6];
}

- (PKPaletteToolPickerView)toolPickerView
{
  v2 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v3 = [v2 toolPickerView];

  return (PKPaletteToolPickerView *)v3;
}

- (PKPaletteColorPickerView)colorPickerView
{
  v2 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v3 = [v2 colorPickerView];

  return (PKPaletteColorPickerView *)v3;
}

- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView
{
  v2 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v3 = [v2 paletteInputAssistantView];

  return (PKDrawingPaletteInputAssistantView *)v3;
}

- (void)_installAdditionalOptionsView
{
  v3 = objc_alloc_init(PKPaletteAdditionalOptionsView);
  additionalOptionsView = self->_additionalOptionsView;
  self->_additionalOptionsView = v3;

  [(PKPaletteAdditionalOptionsView *)self->_additionalOptionsView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_additionalOptionsView];
  v5 = [(PKPaletteAdditionalOptionsView *)self->_additionalOptionsView widthAnchor];
  v6 = [v5 constraintEqualToConstant:28.0];
  [(PKPaletteContentView *)self setAdditionalOptionsViewCompactWidthConstraint:v6];

  id v10 = [(PKPaletteAdditionalOptionsView *)self->_additionalOptionsView heightAnchor];
  v7 = [(PKPaletteContentView *)self stackView];
  v8 = [v7 heightAnchor];
  v9 = [v10 constraintEqualToAnchor:v8];
  [(PKPaletteContentView *)self setAdditionalOptionsViewCompactHeightConstraint:v9];
}

- (UIView)lassoToolEditingView
{
  v2 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v3 = [v2 lassoToolEditingView];

  return (UIView *)v3;
}

- (NSString)lassoToolEditingViewIdentifier
{
  v2 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v3 = [v2 lassoToolEditingViewIdentifier];

  return (NSString *)v3;
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v5 setLassoToolEditingViewIdentifier:v4];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteContentView;
  [(PKPaletteContentView *)&v4 layoutSubviews];
  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    [(PKPaletteContentView *)self bounds];
    BOOL v3 = CGRectGetWidth(v5) <= 327.0;
  }
  else
  {
    BOOL v3 = 0;
  }
  [(PKPaletteContentView *)self setUsingSmallestSupportedWidth:v3];
}

- (void)setUsingSmallestSupportedWidth:(BOOL)a3
{
  if (self->_usingSmallestSupportedWidth != a3)
  {
    self->_usingSmallestSupportedWidth = a3;
    [(PKPaletteContentView *)self _updateUI];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteContentView;
  [(PKPaletteContentView *)&v3 safeAreaInsetsDidChange];
  [(PKPaletteContentView *)self _updateUI];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![(PKPaletteContentView *)self contextEditingMode]) {
    goto LABEL_10;
  }
  v8 = [(PKPaletteContentView *)self contextualEditingView];
  -[PKPaletteContentView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  v13 = [(PKPaletteContentView *)self contextualEditingView];
  v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);

  if (!v14)
  {
LABEL_10:
    v15 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    -[PKPaletteContentView convertPoint:toView:](self, "convertPoint:toView:", v15, x, y);
    double v17 = v16;
    double v19 = v18;

    v20 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    v14 = objc_msgSend(v20, "hitTest:withEvent:", v7, v17, v19);

    if (!v14)
    {
      v22.receiver = self;
      v22.super_class = (Class)PKPaletteContentView;
      v14 = -[PKPaletteContentView hitTest:withEvent:](&v22, sel_hitTest_withEvent_, v7, x, y);
    }
  }

  return v14;
}

- (void)setContextEditingMode:(int64_t)a3
{
  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    [(PKPaletteContentView *)self _updateUI];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteContentView *)self _updateUI];
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    [(PKPaletteContentView *)self _updateUI];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteContentView;
  [(PKPaletteContentView *)&v10 traitCollectionDidChange:v4];
  CGRect v5 = [(PKPaletteContentView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    id v7 = [(PKPaletteContentView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteContentView *)self _updateUI];
LABEL_6:
}

- (BOOL)_useCompactSize
{
  objc_super v3 = [(PKPaletteContentView *)self traitCollection];
  id v4 = [(PKPaletteContentView *)self window];
  CGRect v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateUI
{
}

- (void)_updateUIResetUnselectedToolsVisible:(BOOL)a3
{
  BOOL v323 = a3;
  v328[9] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKPaletteContentView *)self window];
  CGRect v5 = [v4 windowScene];
  int v6 = PKIsQuickNoteWindowScene(v5);

  int v317 = v6;
  [(PKPaletteContentView *)self setClipsToBounds:[(PKPaletteContentView *)self _useCompactSize] & (v6 ^ 1)];
  [(PKPaletteContentView *)self _updateColorPickerContainerViewLocationInHierarchy];
  [(PKPaletteContentView *)self _stackViewSpacing];
  double v8 = v7;
  uint64_t v9 = [(PKPaletteContentView *)self stackView];
  [v9 setSpacing:v8];

  double v10 = 3.40282347e38;
  if ([(PKPaletteContentView *)self _wantsUndoRedoButtonsVisible]
    && ![(PKPaletteContentView *)self _useCompactSize])
  {
    double v11 = [(PKPaletteContentView *)self paletteViewState];
    [v11 paletteScaleFactor];
    double v10 = v12 * 36.0;
  }
  v13 = [(PKPaletteContentView *)self stackView];
  v14 = [(PKPaletteContentView *)self undoRedoView];
  [v13 setCustomSpacing:v14 afterView:v10];

  int64_t v15 = [(PKPaletteContentView *)self _stackViewDistribution];
  double v16 = [(PKPaletteContentView *)self stackView];
  [v16 setDistribution:v15];

  double v17 = [(PKPaletteContentView *)self paletteViewState];
  [v17 paletteScaleFactor];
  double v19 = v18;
  v20 = [(PKPaletteContentView *)self undoRedoView];
  [v20 setScalingFactor:v19];

  double v21 = [(PKPaletteContentView *)self paletteViewState];
  [v21 paletteScaleFactor];
  double v23 = v22;
  double v24 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v24 setScalingFactor:v23];

  double v25 = [(PKPaletteContentView *)self paletteViewState];
  [v25 paletteScaleFactor];
  double v27 = v26;
  uint64_t v28 = [(PKPaletteContentView *)self additionalOptionsView];
  [v28 setScalingFactor:v27];

  unint64_t v29 = [(PKPaletteContentView *)self edgeLocation];
  v30 = [(PKPaletteContentView *)self undoRedoView];
  [v30 setEdgeLocation:v29];

  unint64_t v31 = [(PKPaletteContentView *)self edgeLocation];
  uint64_t v32 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v32 setEdgeLocation:v31];

  unint64_t v33 = [(PKPaletteContentView *)self cornerLocation];
  v34 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v34 setCornerLocation:v33];

  unint64_t v35 = [(PKPaletteContentView *)self edgeLocation];
  v36 = [(PKPaletteContentView *)self additionalOptionsView];
  [v36 setEdgeLocation:v35];

  [(PKPaletteContentView *)self _undoRedoButtonsInterItemSpacing];
  double v38 = v37;
  objc_super v39 = [(PKPaletteContentView *)self undoRedoView];
  [v39 setInterItemSpacing:v38];

  v324[0] = MEMORY[0x1E4F143A8];
  v324[1] = 3221225472;
  v324[2] = __61__PKPaletteContentView__updateUIResetUnselectedToolsVisible___block_invoke;
  v324[3] = &unk_1E64C61C0;
  v324[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v324];
  [(PKPaletteContentView *)self _interItemToolsSpacing];
  double v41 = v40;
  v42 = [(PKPaletteContentView *)self toolPickerView];
  [v42 setInterItemToolsSpacing:v41];

  v43 = [(PKPaletteContentView *)self additionalOptionsView];
  v44 = [v43 palettePopoverPresenting];
  v45 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v46 = [v45 colorPickerContainerView];
  [v46 setPalettePopoverPresenting:v44];

  v319 = (void *)MEMORY[0x1E4F28DC8];
  v321 = [(PKPaletteContentView *)self stackViewLeftConstraint];
  v328[0] = v321;
  v47 = [(PKPaletteContentView *)self stackViewRightConstraint];
  v328[1] = v47;
  v48 = [(PKPaletteContentView *)self stackViewCenterXConstraint];
  v328[2] = v48;
  v49 = [(PKPaletteContentView *)self toolAndColorPickerContainerViewWidthConstraint];
  v328[3] = v49;
  v50 = [(PKPaletteContentView *)self toolAndColorPickerContainerViewHeightConstraint];
  v328[4] = v50;
  v51 = [(PKPaletteContentView *)self toolPickerViewWidthConstraint];
  v328[5] = v51;
  v52 = [(PKPaletteContentView *)self toolPickerViewHeightConstraint];
  v328[6] = v52;
  v53 = [(PKPaletteContentView *)self additionalOptionsViewCompactWidthConstraint];
  v328[7] = v53;
  v54 = [(PKPaletteContentView *)self additionalOptionsViewCompactHeightConstraint];
  v328[8] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v328 count:9];
  [v319 deactivateConstraints:v55];

  v56 = [(PKPaletteContentView *)self stackViewCompactLeftConstraint];
  [v56 setActive:0];

  v57 = [(PKPaletteContentView *)self stackViewCompactRightConstraint];
  [v57 setActive:0];

  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    v58 = [(PKPaletteContentView *)self stackView];
    [v58 setAxis:0];

    v59 = [(PKPaletteContentView *)self stackViewTopConstraint];
    [v59 setConstant:5.0];

    v60 = [(PKPaletteContentView *)self stackViewBottomConstraint];
    double v61 = 0.0;
    [v60 setConstant:0.0];

    BOOL v62 = [(PKPaletteContentView *)self _useEqualSpacingStackViewDistribution];
    v63 = [(PKPaletteContentView *)self stackView];
    v64 = [v63 leftAnchor];
    v65 = [(PKPaletteContentView *)self safeAreaLayoutGuide];
    v66 = [v65 leftAnchor];
    if (v62)
    {
      double v67 = 16.0;
      if (v317) {
        double v67 = 0.0;
      }
      else {
        double v61 = -16.0;
      }
      v68 = [v64 constraintEqualToAnchor:v66 constant:v67];
      [(PKPaletteContentView *)self setStackViewCompactLeftConstraint:v68];

      v69 = [(PKPaletteContentView *)self stackView];
      v70 = [v69 rightAnchor];
      v71 = [(PKPaletteContentView *)self safeAreaLayoutGuide];
      v72 = [v71 rightAnchor];
      uint64_t v73 = [v70 constraintEqualToAnchor:v72 constant:v61];
    }
    else
    {
      v105 = [v64 constraintGreaterThanOrEqualToAnchor:v66 constant:16.0];
      [(PKPaletteContentView *)self setStackViewCompactLeftConstraint:v105];

      v69 = [(PKPaletteContentView *)self stackView];
      v70 = [v69 rightAnchor];
      v71 = [(PKPaletteContentView *)self safeAreaLayoutGuide];
      v72 = [v71 rightAnchor];
      uint64_t v73 = [v70 constraintLessThanOrEqualToAnchor:v72 constant:16.0];
    }
    v106 = (void *)v73;
    [(PKPaletteContentView *)self setStackViewCompactRightConstraint:v73];

    v107 = (void *)MEMORY[0x1E4F28DC8];
    v108 = [(PKPaletteContentView *)self stackViewTopConstraint];
    v327[0] = v108;
    v109 = [(PKPaletteContentView *)self stackViewBottomConstraint];
    v327[1] = v109;
    v101 = [(PKPaletteContentView *)self stackViewCenterXConstraint];
    v327[2] = v101;
    v110 = [(PKPaletteContentView *)self stackViewCompactLeftConstraint];
    v327[3] = v110;
    v111 = [(PKPaletteContentView *)self stackViewCompactRightConstraint];
    v327[4] = v111;
    v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v327 count:5];
    [v107 activateConstraints:v112];

    BOOL v113 = [(PKPaletteContentView *)self _wantsAdditionalOptionsViewVisible];
    v114 = [(PKPaletteContentView *)self additionalOptionsViewCompactWidthConstraint];
    [v114 setActive:v113];

    BOOL v115 = [(PKPaletteContentView *)self _wantsAdditionalOptionsViewVisible];
    v80 = [(PKPaletteContentView *)self additionalOptionsViewCompactHeightConstraint];
    [v80 setActive:v115];
    BOOL v116 = v323;
  }
  else
  {
    v74 = (void *)MEMORY[0x1E4F1CA48];
    v75 = [(PKPaletteContentView *)self stackViewLeftConstraint];
    v326[0] = v75;
    v76 = [(PKPaletteContentView *)self stackViewRightConstraint];
    v326[1] = v76;
    v77 = [(PKPaletteContentView *)self toolPickerViewWidthConstraint];
    v326[2] = v77;
    v78 = [(PKPaletteContentView *)self toolPickerViewHeightConstraint];
    v326[3] = v78;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v326 count:4];
    v80 = [v74 arrayWithArray:v79];

    unint64_t v81 = [(PKPaletteContentView *)self edgeLocation];
    if (v81 == 8 || v81 == 2)
    {
      v82 = [(PKPaletteContentView *)self paletteViewState];
      [v82 paletteScaleFactor];
      UIFloorToViewScale();
      double v84 = v83;
      v85 = [(PKPaletteContentView *)self toolPickerViewWidthConstraint];
      [v85 setConstant:v84];

      v86 = [(PKPaletteContentView *)self paletteViewState];
      [v86 _toolsContainerWidth];
      v87 = [(PKPaletteContentView *)self paletteViewState];
      [v87 paletteScaleFactor];
      UIFloorToViewScale();
      double v89 = v88;
      v90 = [(PKPaletteContentView *)self toolPickerViewHeightConstraint];
      [v90 setConstant:v89];

      v91 = [(PKPaletteContentView *)self stackView];
      [v91 setAxis:1];

      v92 = [(PKPaletteContentView *)self paletteViewState];
      [v92 paletteScaleFactor];
      double v94 = v93 * 48.0;
      v95 = [(PKPaletteContentView *)self stackViewTopConstraint];
      [v95 setConstant:v94];

      v96 = [(PKPaletteContentView *)self paletteViewState];
      if ([v96 showsPlusButton]) {
        double v97 = 48.0;
      }
      else {
        double v97 = 26.0;
      }
      v98 = [(PKPaletteContentView *)self paletteViewState];
      [v98 paletteScaleFactor];
      double v100 = v97 * v99;
      v101 = [(PKPaletteContentView *)self stackViewBottomConstraint];
      [v101 setConstant:v100];

      v102 = [(PKPaletteContentView *)self stackViewLeftConstraint];
      [v102 setConstant:0.0];

      v103 = [(PKPaletteContentView *)self stackViewRightConstraint];
      [v103 setConstant:0.0];

      uint64_t v104 = [(PKPaletteContentView *)self toolAndColorPickerContainerViewWidthConstraint];
    }
    else
    {
      v117 = [(PKPaletteContentView *)self paletteViewState];
      [v117 _toolsContainerWidth];
      v118 = [(PKPaletteContentView *)self paletteViewState];
      [v118 paletteScaleFactor];
      UIFloorToViewScale();
      double v120 = v119;
      v101 = [(PKPaletteContentView *)self toolPickerViewWidthConstraint];
      [v101 setConstant:v120];

      v121 = [(PKPaletteContentView *)self paletteViewState];
      [v121 paletteScaleFactor];
      UIFloorToViewScale();
      double v123 = v122;
      v124 = [(PKPaletteContentView *)self toolPickerViewHeightConstraint];
      [v124 setConstant:v123];

      v125 = [(PKPaletteContentView *)self stackView];
      [v125 setAxis:0];

      v126 = [(PKPaletteContentView *)self stackViewTopConstraint];
      [v126 setConstant:0.0];

      v127 = [(PKPaletteContentView *)self stackViewBottomConstraint];
      [v127 setConstant:0.0];

      v128 = [(PKPaletteContentView *)self paletteViewState];
      [v128 paletteScaleFactor];
      double v130 = v129 * 26.0;
      v131 = [(PKPaletteContentView *)self stackViewLeftConstraint];
      [v131 setConstant:v130];

      v132 = [(PKPaletteContentView *)self paletteViewState];
      [v132 paletteScaleFactor];
      double v134 = v133 * 26.0;
      v135 = [(PKPaletteContentView *)self stackViewRightConstraint];
      [v135 setConstant:v134];

      uint64_t v104 = [(PKPaletteContentView *)self toolAndColorPickerContainerViewHeightConstraint];
    }
    v136 = (void *)v104;
    BOOL v116 = v323;
    [v80 addObject:v104];

    [MEMORY[0x1E4F28DC8] activateConstraints:v80];
  }

  int64_t v137 = [(PKPaletteContentView *)self contextEditingMode];
  v138 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v138 setContextEditingMode:v137];

  BOOL v139 = [(PKPaletteContentView *)self _contextEditingModeWantsContextualEditingViewVisible];
  v140 = [(PKPaletteContentView *)self toolPickerView];
  [v140 setHidden:v139];

  v141 = [(PKPaletteContentView *)self paletteViewState];
  if ([v141 prefersLargeContextualEditingUI])
  {
    v142 = self;
  }
  else
  {
    v143 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    v142 = [v143 toolPickerContainerView];
  }
  v144 = [(PKPaletteContentView *)self contextualEditingView];
  v145 = [v144 superview];

  if (v145 != v142)
  {
    v146 = [(PKPaletteContentView *)self contextualEditingView];
    [v146 removeFromSuperview];

    v147 = [(PKPaletteContentView *)self contextualEditingView];
    [(PKPaletteContentView *)v142 addSubview:v147];

    v314 = (void *)MEMORY[0x1E4F28DC8];
    v322 = [(PKPaletteContentView *)self contextualEditingView];
    v320 = [v322 topAnchor];
    v318 = [(PKPaletteContentView *)v142 topAnchor];
    v316 = [v320 constraintEqualToAnchor:v318];
    v325[0] = v316;
    v315 = [(PKPaletteContentView *)self contextualEditingView];
    v148 = [v315 bottomAnchor];
    v149 = [(PKPaletteContentView *)v142 bottomAnchor];
    v150 = [v148 constraintEqualToAnchor:v149];
    v325[1] = v150;
    v151 = [(PKPaletteContentView *)self contextualEditingView];
    v152 = [v151 trailingAnchor];
    v153 = [(PKPaletteContentView *)v142 trailingAnchor];
    v154 = [v152 constraintEqualToAnchor:v153];
    v325[2] = v154;
    v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v325 count:3];
    [v314 activateConstraints:v155];

    if ([(PKPaletteContentView *)self _useCompactSize])
    {
      v156 = [(PKPaletteContentView *)self paletteViewState];
      if ([v156 wantsUndoRedoButtonsVisibleInCompactSize])
      {
        v157 = [(PKPaletteContentView *)self undoRedoView];
        v158 = [v157 trailingAnchor];
      }
      else
      {
        v158 = [(PKPaletteContentView *)v142 leadingAnchor];
      }
      BOOL v116 = v323;
    }
    else
    {
      v158 = [(PKPaletteContentView *)v142 leadingAnchor];
      BOOL v116 = v323;
    }
    v159 = [(PKPaletteContentView *)self contextualEditingView];
    v160 = [v159 leadingAnchor];
    v101 = [v160 constraintEqualToAnchor:v158];
    [v101 setActive:1];
  }
  uint64_t v161 = [(PKPaletteContentView *)self _contextEditingModeWantsContextualEditingViewVisible] ^ 1;
  v162 = [(PKPaletteContentView *)self contextualEditingView];
  [v162 setHidden:v161];

  if (![(PKPaletteContentView *)self _contextEditingModeWantsContextualEditingViewVisible])
  {
    v163 = [(PKPaletteContentView *)self contextualEditingView];
    v164 = [v163 subviews];
    [v164 makeObjectsPerformSelector:sel_removeFromSuperview];
  }
  v165 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v166 = [v165 showsPlusButton];
  v167 = [(PKPaletteContentView *)self additionalOptionsView];
  [v167 setShowsPlusButton:v166];

  v168 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v169 = [v168 showsTextButton];
  v170 = [(PKPaletteContentView *)self additionalOptionsView];
  [v170 setShowsTextButton:v169];

  v171 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v172 = [v171 showsShapeButton];
  v173 = [(PKPaletteContentView *)self additionalOptionsView];
  [v173 setShowsShapeButton:v172];

  BOOL v174 = [(PKPaletteContentView *)self isEllipsisButtonVisible];
  v175 = [(PKPaletteContentView *)self additionalOptionsView];
  [v175 setWantsEllipsisButtonVisible:v174];

  v176 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v177 = [v176 shouldHideHoverPreviewToggle];
  v178 = [(PKPaletteContentView *)self additionalOptionsView];
  [v178 setShouldHideHoverPreviewToggle:v177];

  v179 = [(PKPaletteContentView *)self contextEditingMode];
  if (v116
    || ([(PKPaletteContentView *)self paletteViewState],
        v101 = objc_claimAutoreleasedReturnValue(),
        ([v101 showsLassoToolEditingView] & 1) == 0))
  {
    int v180 = !v116;
    if ([(PKPaletteContentView *)self _useCompactSize])
    {
      uint64_t v181 = 0;
    }
    else
    {
      BOOL v182 = [(PKPaletteContentView *)self _isHandwritingToolSelected];
      if (v179) {
        uint64_t v181 = 0;
      }
      else {
        uint64_t v181 = v182;
      }
    }
  }
  else
  {
    int v180 = 1;
    uint64_t v181 = 1;
  }
  v183 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v184 = [v183 colorPickerContainerView];
  [v184 setHidden:v181];

  if (v180) {
  if (!v179
  }
    || ([(PKPaletteContentView *)self paletteViewState],
        v101 = objc_claimAutoreleasedReturnValue(),
        [v101 colorSwatchesVisible]))
  {
    BOOL v185 = v179 != 0;
    if ([(PKPaletteContentView *)self _useCompactSize]) {
      BOOL v186 = [(PKPaletteContentView *)self _isHandwritingToolSelected];
    }
    else {
      BOOL v186 = 0;
    }
  }
  else
  {
    BOOL v185 = 1;
    BOOL v186 = 1;
  }
  v187 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v188 = [v187 colorPickerView];
  [v188 setHidden:v186];

  if (v185) {
  if (v116)
  }
  {
    uint64_t v189 = 0;
  }
  else
  {
    v190 = [(PKPaletteContentView *)self paletteViewState];
    uint64_t v189 = [v190 showsLassoToolEditingView];
  }
  v191 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v191 setLassoToolEditingViewVisible:v189];

  v192 = [(PKPaletteContentView *)self paletteViewState];
  if ([v192 wantsScrollableTools]) {
    uint64_t v193 = [(PKPaletteContentView *)self _useCompactSize] & v189 ^ 1;
  }
  else {
    uint64_t v193 = 0;
  }
  v194 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v195 = [v194 toolPickerView];
  [v195 setScrollingEnabled:v193];

  if (v116)
  {
    v196 = [(PKPaletteContentView *)self toolPickerView];
    [v196 setUnselectedToolsVisible:1];

    v197 = [(PKPaletteContentView *)self additionalOptionsView];
    v198 = v197;
    uint64_t v199 = 0;
  }
  else
  {
    if ([(PKPaletteContentView *)self _useCompactSize])
    {
      v200 = [(PKPaletteContentView *)self paletteViewState];
      v201 = [v200 selectedTool];
      if ([v201 _isLassoTool])
      {
        v202 = [(PKPaletteContentView *)self paletteViewState];
        uint64_t v203 = [v202 showsLassoToolEditingView];
      }
      else
      {
        uint64_t v203 = 0;
      }
    }
    else
    {
      uint64_t v203 = 0;
    }
    v204 = [(PKPaletteContentView *)self toolPickerView];
    [v204 setUnselectedToolsVisible:v203 ^ 1];

    v205 = [(PKPaletteContentView *)self lassoToolTapGestureRecognizerInCompact];
    [v205 setEnabled:v203];

    v206 = [(PKPaletteContentView *)self toolPickerView];
    v207 = [v206 selectedToolView];
    v208 = [v207 gestureRecognizers];
    v209 = [(PKPaletteContentView *)self lassoToolTapGestureRecognizerInCompact];
    char v210 = [v208 containsObject:v209];

    if ((v210 & 1) == 0)
    {
      v211 = [(PKPaletteContentView *)self toolPickerView];
      v212 = [v211 selectedToolView];
      v213 = [(PKPaletteContentView *)self lassoToolTapGestureRecognizerInCompact];
      [v212 addGestureRecognizer:v213];
    }
    v197 = [(PKPaletteContentView *)self additionalOptionsView];
    v198 = v197;
    uint64_t v199 = v203;
  }
  [v197 setHidden:v199];

  if ([(PKPaletteContentView *)self _isHandwritingToolSelected]) {
    uint64_t v214 = (v179 == 0) & ~[(PKPaletteContentView *)self _useCompactSize];
  }
  else {
    uint64_t v214 = 0;
  }
  v215 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v215 setInputAssistantViewVisible:v214];

  if ([(PKPaletteContentView *)self _isHandwritingToolSelected])
  {
    BOOL v216 = [(PKPaletteContentView *)self _useCompactSize];
    if (v179) {
      BOOL v217 = 0;
    }
    else {
      BOOL v217 = v216;
    }
  }
  else
  {
    BOOL v217 = 0;
  }
  v218 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v219 = [v218 colorPickerContainerView];
  [v219 setShouldShowInputAssistantView:v217];

  v220 = [MEMORY[0x1E4F28B50] mainBundle];
  v221 = [v220 bundleIdentifier];
  int v222 = [v221 isEqualToString:@"com.apple.mobilenotes"];

  if (v222)
  {
    v179 = [(PKPaletteContentView *)self paletteViewState];
    v221 = [v179 inputAssistantItems];
    if ((unint64_t)[v221 count] <= 1) {
      uint64_t v223 = PKIsDeviceLocked()
    }
          && [(PKPaletteContentView *)self _isHandwritingToolSelected];
    else {
      uint64_t v223 = 1;
    }
  }
  else
  {
    BOOL v224 = [(PKPaletteContentView *)self _isHandwritingToolSelected];
    if (v179) {
      uint64_t v223 = 0;
    }
    else {
      uint64_t v223 = v224;
    }
  }
  v225 = [(PKPaletteContentView *)self additionalOptionsView];
  [v225 setWantsInputAssistantViewVisible:v223];

  if (v222)
  {
  }
  v226 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v227 = [v226 enableKeyboardButtons];
  v228 = [(PKPaletteContentView *)self additionalOptionsView];
  [v228 setEnableKeyboardButtons:v227];

  v229 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v230 = [v229 floatingKeyboardType];
  v231 = [(PKPaletteContentView *)self additionalOptionsView];
  [v231 setFloatingKeyboardType:v230];

  v232 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v233 = [v232 hasHandwritingTool];
  v234 = [(PKPaletteContentView *)self additionalOptionsView];
  [v234 setShouldShowTapToRadarOption:v233];

  v235 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v236 = [v235 canShowResetHandwritingEducationPane];
  v237 = [(PKPaletteContentView *)self additionalOptionsView];
  [v237 setShouldShowResetHandwritingEducationPane:v236];

  v238 = [MEMORY[0x1E4F28B50] mainBundle];
  v239 = [v238 bundleIdentifier];
  LODWORD(v237) = [v239 isEqualToString:@"com.apple.mobilenotes"];

  if (v237)
  {
    v240 = [(PKPaletteContentView *)self paletteViewState];
    v241 = [v240 inputAssistantItems];
    BOOL v242 = [v241 count] == 1;
  }
  else
  {
    BOOL v242 = 0;
  }
  v243 = [(PKPaletteContentView *)self paletteInputAssistantView];
  [v243 setShouldShowKeyboardButton:v242];

  v244 = [(PKPaletteContentView *)self paletteInputAssistantView];
  [v244 setShouldShowReturnKeyButton:v242];

  v245 = [(PKPaletteContentView *)self paletteViewState];
  v246 = [v245 inputAssistantItems];
  v247 = [(PKPaletteContentView *)self paletteInputAssistantView];
  [v247 setButtons:v246];

  v248 = [(PKPaletteContentView *)self paletteViewState];
  uint64_t v249 = [v248 enableKeyboardButtons];
  v250 = [(PKPaletteContentView *)self paletteInputAssistantView];
  [v250 setEnableKeyboardButtons:v249];

  if (v242)
  {
    v251 = [(PKPaletteContentView *)self paletteInputAssistantView];
    v252 = [v251 keyboardButton];
    [(PKPaletteContentView *)self _configureMenuForKeyboardButton:v252];

    v253 = [(PKPaletteContentView *)self paletteInputAssistantView];
    v254 = [v253 returnKeyButton];
    [(PKPaletteContentView *)self _configureReturnKeyButton:v254];
  }
  v255 = [(PKPaletteContentView *)self paletteViewState];
  if ([v255 wantsMulticolorSwatchShadowInCompactSize]) {
    BOOL v256 = [(PKPaletteContentView *)self _useCompactSize];
  }
  else {
    BOOL v256 = 0;
  }

  BOOL v257 = [(PKPaletteContentView *)self _wantsUndoRedoButtonsShadow];
  v258 = [(PKPaletteContentView *)self traitCollection];
  uint64_t v259 = [v258 userInterfaceStyle];

  if (v257 || v256)
  {
    double v263 = dbl_1C48293B0[v259 == 2];
    v264 = [MEMORY[0x1E4FB1618] blackColor];
    v260 = [v264 colorWithAlphaComponent:v263];

    float v262 = v263;
    double v261 = 10.0;
  }
  else
  {
    v260 = 0;
    double v261 = 0.0;
    float v262 = 0.0;
  }
  id v265 = v260;
  uint64_t v266 = [v265 CGColor];
  v267 = [(PKPaletteContentView *)self undoRedoView];
  v268 = [v267 undoButton];
  v269 = [v268 layer];
  [v269 setShadowColor:v266];

  v270 = [(PKPaletteContentView *)self undoRedoView];
  v271 = [v270 undoButton];
  v272 = [v271 layer];
  [v272 setShadowRadius:v261];

  v273 = [(PKPaletteContentView *)self undoRedoView];
  v274 = [v273 undoButton];
  v275 = [v274 layer];
  *(float *)&double v276 = v262;
  [v275 setShadowOpacity:v276];

  double v277 = *MEMORY[0x1E4F1DB30];
  double v278 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v279 = [(PKPaletteContentView *)self undoRedoView];
  v280 = [v279 undoButton];
  v281 = [v280 layer];
  objc_msgSend(v281, "setShadowOffset:", v277, v278);

  id v282 = v265;
  uint64_t v283 = [v282 CGColor];
  v284 = [(PKPaletteContentView *)self undoRedoView];
  v285 = [v284 redoButton];
  v286 = [v285 layer];
  [v286 setShadowColor:v283];

  v287 = [(PKPaletteContentView *)self undoRedoView];
  v288 = [v287 redoButton];
  v289 = [v288 layer];
  [v289 setShadowRadius:v261];

  v290 = [(PKPaletteContentView *)self undoRedoView];
  v291 = [v290 redoButton];
  v292 = [v291 layer];
  *(float *)&double v293 = v262;
  [v292 setShadowOpacity:v293];

  v294 = [(PKPaletteContentView *)self undoRedoView];
  v295 = [v294 redoButton];
  v296 = [v295 layer];
  objc_msgSend(v296, "setShadowOffset:", v277, v278);

  id v297 = v282;
  uint64_t v298 = [v297 CGColor];
  v299 = [(PKPaletteContentView *)self colorPickerView];
  v300 = [v299 multicolorSwatch];
  v301 = [v300 layer];
  [v301 setShadowColor:v298];

  v302 = [(PKPaletteContentView *)self colorPickerView];
  v303 = [v302 multicolorSwatch];
  v304 = [v303 layer];
  [v304 setShadowRadius:v261];

  v305 = [(PKPaletteContentView *)self colorPickerView];
  v306 = [v305 multicolorSwatch];
  v307 = [v306 layer];
  *(float *)&double v308 = v262;
  [v307 setShadowOpacity:v308];

  if (v256)
  {
    v309 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else
  {
    v309 = 0;
  }
  v310 = [(PKPaletteContentView *)self colorPickerView];
  v311 = [v310 multicolorSwatch];
  [v311 setBackgroundColor:v309];

  if (v256) {
  v312 = [(PKPaletteContentView *)self undoRedoView];
  }
  [v312 updateUI];

  v313 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v313 _updateUI];
}

uint64_t __61__PKPaletteContentView__updateUIResetUnselectedToolsVisible___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _wantsUndoRedoButtonsVisible] ^ 1;
  objc_super v3 = [*(id *)(a1 + 32) undoRedoView];
  [v3 setHidden:v2];

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateAdditionalOptionsViewVisibility];
}

- (void)_didTapLassoToolInCompact
{
  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    objc_super v3 = [(PKPaletteContentView *)self toolPickerView];
    char v4 = [v3 unselectedToolsVisible];

    if (v4)
    {
      CGRect v5 = [(PKPaletteContentView *)self paletteViewState];
      int v6 = [v5 showsLassoToolEditingView];

      if (v6)
      {
        [(PKPaletteContentView *)self _updateUI];
      }
    }
    else
    {
      [(PKPaletteContentView *)self _updateUIResetUnselectedToolsVisible:1];
    }
  }
}

- (BOOL)_wantsUndoRedoButtonsShadow
{
  if (![(PKPaletteContentView *)self _useCompactSize]) {
    return 0;
  }
  objc_super v3 = [(PKPaletteContentView *)self paletteViewState];
  if ([v3 wantsUndoRedoButtonsVisibleInCompactSize])
  {
    char v4 = [(PKPaletteContentView *)self paletteViewState];
    char v5 = [v4 wantsUndoRedoButtonsShadowInCompactSize];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateAdditionalOptionsViewVisibility
{
  BOOL v3 = [(PKPaletteContentView *)self _wantsAdditionalOptionsViewVisible];
  char v4 = [(PKPaletteContentView *)self stackView];
  char v5 = [v4 arrangedSubviews];
  int v6 = [(PKPaletteContentView *)self additionalOptionsView];
  int v7 = [v5 containsObject:v6];

  if (!v3 || (v7 & 1) != 0)
  {
    if ((v3 | v7 ^ 1)) {
      return;
    }
    id v9 = [(PKPaletteContentView *)self additionalOptionsView];
    [v9 removeFromSuperview];
  }
  else
  {
    id v9 = [(PKPaletteContentView *)self stackView];
    double v8 = [(PKPaletteContentView *)self additionalOptionsView];
    [v9 addArrangedSubview:v8];
  }
}

- (BOOL)_wantsAdditionalOptionsViewVisible
{
  BOOL v3 = [(PKPaletteContentView *)self paletteViewState];
  if ([v3 hasHandwritingTool]
    && [(PKPaletteContentView *)self isUsingSmallestSupportedWidth])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(PKPaletteContentView *)self paletteViewState];
    if (([v5 showsPlusButton] & 1) != 0
      || [(PKPaletteContentView *)self isEllipsisButtonVisible])
    {
      char v4 = 1;
    }
    else
    {
      int v6 = [(PKPaletteContentView *)self paletteViewState];
      if ([v6 showsTextButton])
      {
        char v4 = 1;
      }
      else
      {
        int v7 = [(PKPaletteContentView *)self paletteViewState];
        char v4 = [v7 showsShapeButton];
      }
    }
  }
  return v4;
}

- (void)_updateColorPickerContainerViewLocationInHierarchy
{
  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    BOOL v3 = [(PKPaletteContentView *)self paletteViewState];
    int v4 = [v3 useEqualSpacingLayoutInCompactSize];
  }
  else
  {
    int v4 = 0;
  }
  char v5 = [(PKPaletteContentView *)self stackView];
  int v6 = [v5 arrangedSubviews];
  int v7 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  double v8 = [v7 colorPickerContainerView];
  int v9 = [v6 containsObject:v8];

  double v10 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  [v10 setWantsColorPickerContainerViewInHierarchy:v4 ^ 1u];

  if ((v4 ^ 1) & 1) != 0 || (v9)
  {
    if ((v4 | v9 ^ 1)) {
      return;
    }
    id v13 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    double v11 = [v13 colorPickerContainerView];
    [v11 removeFromSuperview];
  }
  else
  {
    id v13 = [(PKPaletteContentView *)self stackView];
    double v11 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    double v12 = [v11 colorPickerContainerView];
    [v13 addArrangedSubview:v12];
  }
}

- (double)_interItemToolsSpacing
{
  if (![(PKPaletteContentView *)self _useCompactSize])
  {
    int v4 = [(PKPaletteContentView *)self toolPickerView];
    int v6 = [v4 toolViews];
    if ([v6 count] >= 8) {
      double v7 = 15.0;
    }
    else {
      double v7 = 12.0;
    }
    double v8 = [(PKPaletteContentView *)self paletteViewState];
    [v8 paletteScaleFactor];
    double v3 = v7 * v9;

    goto LABEL_8;
  }
  double v3 = 0.0;
  if (![(PKPaletteContentView *)self isUsingSmallestSupportedWidth])
  {
    int v4 = [(PKPaletteContentView *)self paletteViewState];
    [v4 interItemToolsSpacingInCompactSize];
    double v3 = v5;
LABEL_8:
  }
  return v3;
}

- (double)_undoRedoButtonsInterItemSpacing
{
  double v3 = [(PKPaletteContentView *)self paletteViewState];
  [v3 interItemUndoRedoButtonsSpacing];
  double v5 = v4;

  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    int v6 = [(PKPaletteContentView *)self paletteViewState];
    int v7 = [v6 wantsUndoRedoButtonsShadowInCompactSize];

    if (v7)
    {
      double v8 = [(PKPaletteContentView *)self paletteViewState];
      [v8 interItemUndoRedoButtonsSpacingInCompactSize];
      double v5 = v9;
    }
  }
  return v5;
}

- (BOOL)_contextEditingModeWantsContextualEditingViewVisible
{
  int64_t v3 = [(PKPaletteContentView *)self contextEditingMode];
  if (v3) {
    LOBYTE(v3) = [(PKPaletteContentView *)self contextEditingMode] != 3;
  }
  return v3;
}

- (BOOL)_wantsUndoRedoButtonsVisible
{
  if (![(PKPaletteContentView *)self _useCompactSize]) {
    return 1;
  }
  int64_t v3 = [(PKPaletteContentView *)self paletteViewState];
  char v4 = [v3 wantsUndoRedoButtonsVisibleInCompactSize];

  return v4;
}

- (BOOL)isEllipsisButtonVisible
{
  if (PKIsVisionDevice()) {
    return 0;
  }
  if (![(PKPaletteContentView *)self _useCompactSize]) {
    return 1;
  }
  char v4 = [(PKPaletteContentView *)self paletteViewState];
  char v5 = [v4 wantsEllipsisButtonVisibleInCompactSize];

  return v5;
}

- (BOOL)_isHandwritingToolSelected
{
  uint64_t v2 = [(PKPaletteContentView *)self paletteViewState];
  int64_t v3 = [v2 selectedTool];
  char v4 = [v3 ink];
  char v5 = [v4 _isHandwritingInk];

  return v5;
}

- (double)_stackViewSpacing
{
  if ([(PKPaletteContentView *)self _useCompactSize])
  {
    double v3 = 10.0;
    if ([(PKPaletteContentView *)self isUsingSmallestSupportedWidth])
    {
      double v3 = 0.0;
      if (![(PKPaletteContentView *)self _wantsUndoRedoButtonsVisible])
      {
        char v4 = [(PKPaletteContentView *)self paletteViewState];
        int v5 = [v4 hasHandwritingTool];

        if (v5) {
          return 5.0;
        }
        else {
          return 10.0;
        }
      }
    }
  }
  else
  {
    [(PKPaletteContentView *)self edgeLocation];
    int v6 = [(PKPaletteContentView *)self paletteViewState];
    [v6 paletteScaleFactor];
    double v3 = v7 * 26.0;
  }
  return v3;
}

- (int64_t)_stackViewDistribution
{
  if ([(PKPaletteContentView *)self _useEqualSpacingStackViewDistribution]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)_useEqualSpacingStackViewDistribution
{
  BOOL v3 = [(PKPaletteContentView *)self _useCompactSize];
  if (v3)
  {
    char v4 = [(PKPaletteContentView *)self paletteViewState];
    char v5 = [v4 useEqualSpacingLayoutInCompactSize];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5
{
  id v6 = a3;
  if ([(PKPaletteContentView *)self isUsingSmallestSupportedWidth]
    && ([(PKPaletteContentView *)self _wantsUndoRedoButtonsVisible]
     || ([v6 toolViews],
         double v7 = objc_claimAutoreleasedReturnValue(),
         uint64_t v8 = [v7 count],
         v7,
         v8 == 7)))
  {
    double v9 = 31.0;
  }
  else
  {
    double v9 = 34.0;
  }

  return v9;
}

- (void)_configureMenuForKeyboardButton:(id)a3
{
  id v6 = a3;
  char v4 = [(PKPaletteContentView *)self delegate];
  char v5 = [v4 keyboardSelectionMenuForContentView:self];
  [v6 setKeyboardSelectionMenu:v5];

  [v6 addTarget:self action:sel__handleKeyboardButtonPressed forControlEvents:64];
}

- (void)_configureReturnKeyButton:(id)a3
{
}

- (void)dismissEyeDropper
{
  id v2 = [(PKPaletteContentView *)self colorPickerView];
  [v2 dismissEyeDropper];
}

- (void)colorPickerContainerView:(id)a3 willPresentInputAssistantView:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaletteContentView *)self paletteViewState];
  double v7 = [v6 inputAssistantItems];
  [v5 setButtons:v7];

  [v5 setUseCompactLayout:1];
  [v5 setShouldShowKeyboardButton:1];
  [v5 setShouldShowReturnKeyButton:1];
  uint64_t v8 = [(PKPaletteContentView *)self paletteViewState];
  objc_msgSend(v5, "setEnableKeyboardButtons:", objc_msgSend(v8, "enableKeyboardButtons"));

  double v9 = [v5 keyboardButton];
  [(PKPaletteContentView *)self _configureMenuForKeyboardButton:v9];

  id v10 = [v5 returnKeyButton];

  [(PKPaletteContentView *)self _configureReturnKeyButton:v10];
}

- (void)colorPickerContainerView:(id)a3 willDismissInputAssistantView:(id)a4
{
  id v5 = [(PKPaletteContentView *)self delegate];
  [v5 contentViewDidDismissInputAssistantView:self];
}

- (void)_handleKeyboardButtonPressed
{
  id v3 = [(PKPaletteContentView *)self delegate];
  [v3 contentViewDidSelectInputAssistantKeyboardItem:self];
}

- (void)_handleReturnKeyButtonPressed
{
  id v3 = [(PKPaletteContentView *)self delegate];
  [v3 contentViewDidSelectInputAssistantReturnKeyItem:self];
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke;
  v12[3] = &unk_1E64C61C0;
  double v7 = v5;
  id v13 = v7;
  [v6 dismissPalettePopoverWithCompletion:v12];

  dispatch_group_enter(v7);
  uint64_t v8 = [(PKPaletteContentView *)self additionalOptionsView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke_2;
  v10[3] = &unk_1E64C61C0;
  double v9 = v7;
  double v11 = v9;
  [v8 dismissPalettePopoverWithCompletion:v10];

  if (v4) {
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v4);
  }
}

void __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
}

void __60__PKPaletteContentView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
{
}

- (CGRect)plusButtonFrame
{
  id v3 = [(PKPaletteContentView *)self additionalOptionsView];
  [v3 plusButtonFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(PKPaletteContentView *)self additionalOptionsView];
  -[PKPaletteContentView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)_dismissPalettePopoverUsingConfirmationBlock:(id)a3 completion:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  double v6 = (unsigned int (**)(id, void *))a3;
  block = (void (**)(void))a4;
  double v7 = dispatch_group_create();
  double v8 = [(PKPaletteContentView *)self toolPickerView];
  v27[0] = v8;
  double v9 = [(PKPaletteContentView *)self colorPickerView];
  v27[1] = v9;
  double v10 = [(PKPaletteContentView *)self additionalOptionsView];
  v27[2] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v6[2](v6, v17))
        {
          dispatch_group_enter(v7);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __80__PKPaletteContentView__dismissPalettePopoverUsingConfirmationBlock_completion___block_invoke;
          v20[3] = &unk_1E64C61C0;
          double v21 = v7;
          [v17 dismissPalettePopoverWithCompletion:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  if (dispatch_group_wait(v7, 0))
  {
    double v18 = block;
    dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
  }
  else
  {
    double v18 = block;
    if (block) {
      block[2](block);
    }
  }
}

void __80__PKPaletteContentView__dismissPalettePopoverUsingConfirmationBlock_completion___block_invoke(uint64_t a1)
{
}

- (id)paletteButton:(id)a3 tintColorForState:(unint64_t)a4
{
  id v4 = a3;
  if ([v4 isHighlighted])
  {
    double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v6 = [v5 colorWithAlphaComponent:0.5];
  }
  else
  {
    if ([v4 isEnabled]) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    double v6 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    }
  }

  return v6;
}

- (id)paletteButton:(id)a3 backgroundColorForState:(unint64_t)a4
{
  int v4 = [a3 isHighlighted];
  double v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 colorWithAlphaComponent:0.5];

    double v6 = (void *)v7;
  }

  return v6;
}

- (void)paletteViewStateDidChange:(id)a3
{
}

- (void)paletteViewStateDidChangeIsVisible:(id)a3
{
  id v4 = a3;
  [(PKPaletteContentView *)self _updateUI];
  int v5 = [v4 isVisible];

  if (v5)
  {
    id v7 = [(PKPaletteContentView *)self toolAndColorPickerContainerView];
    double v6 = [v7 toolPickerView];
    [v6 scrollSelectedToolViewToVisibleAnimated:0];
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

- (PKPaletteContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteUndoRedoView)undoRedoView
{
  return self->_undoRedoView;
}

- (PKPaletteAdditionalOptionsView)additionalOptionsView
{
  return self->_additionalOptionsView;
}

- (UIView)contextualEditingView
{
  return self->_contextualEditingView;
}

- (void)setContextualEditingView:(id)a3
{
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (PKDrawingPaletteViewStateSubject)paletteViewState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteViewState);

  return (PKDrawingPaletteViewStateSubject *)WeakRetained;
}

- (void)setPaletteViewState:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  return self->_stackViewTopConstraint;
}

- (void)setStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  return self->_stackViewBottomConstraint;
}

- (void)setStackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeftConstraint
{
  return self->_stackViewLeftConstraint;
}

- (void)setStackViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewRightConstraint
{
  return self->_stackViewRightConstraint;
}

- (void)setStackViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewCenterXConstraint
{
  return self->_stackViewCenterXConstraint;
}

- (void)setStackViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewCompactLeftConstraint
{
  return self->_stackViewCompactLeftConstraint;
}

- (void)setStackViewCompactLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewCompactRightConstraint
{
  return self->_stackViewCompactRightConstraint;
}

- (void)setStackViewCompactRightConstraint:(id)a3
{
}

- (PKPaletteToolPickerAndColorPickerView)toolAndColorPickerContainerView
{
  return self->_toolAndColorPickerContainerView;
}

- (void)setToolAndColorPickerContainerView:(id)a3
{
}

- (NSLayoutConstraint)toolAndColorPickerContainerViewHeightConstraint
{
  return self->_toolAndColorPickerContainerViewHeightConstraint;
}

- (void)setToolAndColorPickerContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolAndColorPickerContainerViewWidthConstraint
{
  return self->_toolAndColorPickerContainerViewWidthConstraint;
}

- (void)setToolAndColorPickerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewWidthConstraint
{
  return self->_toolPickerViewWidthConstraint;
}

- (void)setToolPickerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerViewHeightConstraint
{
  return self->_toolPickerViewHeightConstraint;
}

- (void)setToolPickerViewHeightConstraint:(id)a3
{
}

- (BOOL)isUsingSmallestSupportedWidth
{
  return self->_usingSmallestSupportedWidth;
}

- (UITapGestureRecognizer)lassoToolTapGestureRecognizerInCompact
{
  return self->_lassoToolTapGestureRecognizerInCompact;
}

- (void)setLassoToolTapGestureRecognizerInCompact:(id)a3
{
}

- (NSLayoutConstraint)additionalOptionsViewCompactWidthConstraint
{
  return self->_additionalOptionsViewCompactWidthConstraint;
}

- (void)setAdditionalOptionsViewCompactWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)additionalOptionsViewCompactHeightConstraint
{
  return self->_additionalOptionsViewCompactHeightConstraint;
}

- (void)setAdditionalOptionsViewCompactHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_additionalOptionsViewCompactWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolTapGestureRecognizerInCompact, 0);
  objc_storeStrong((id *)&self->_toolPickerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolAndColorPickerContainerView, 0);
  objc_storeStrong((id *)&self->_stackViewCompactRightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCompactLeftConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_paletteViewState);
  objc_storeStrong((id *)&self->_contextualEditingView, 0);
  objc_storeStrong((id *)&self->_additionalOptionsView, 0);
  objc_storeStrong((id *)&self->_undoRedoView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end