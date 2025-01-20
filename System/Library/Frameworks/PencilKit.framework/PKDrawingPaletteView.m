@interface PKDrawingPaletteView
- (BOOL)_canHandlePencilInteraction;
- (BOOL)_canReplaceToolAtIndex:(unint64_t)a3 withTool:(id)a4;
- (BOOL)_canSelectToolAtIndex:(unint64_t)a3;
- (BOOL)_canShowFingerDrawsOption;
- (BOOL)_hasToolWithIdentifier:(id)a3;
- (BOOL)_isPaletteContentViewHidden;
- (BOOL)_shouldShowFingerDrawsOption;
- (BOOL)_wantsClearBackgroundColor;
- (BOOL)canShowResetHandwritingEducationPane;
- (BOOL)colorPickerShouldDisplayColorSelection:(id)a3;
- (BOOL)colorSwatchesVisible;
- (BOOL)enableKeyboardButtons;
- (BOOL)hasContextMenuVisible;
- (BOOL)hasHandwritingTool;
- (BOOL)isAnnotationSupportEnabled;
- (BOOL)isEditingExternalElementsSelection;
- (BOOL)isEditingOpacity;
- (BOOL)isEditingStrokeSelection;
- (BOOL)isEditingTextSelection;
- (BOOL)isEllipsisButtonVisible;
- (BOOL)isExtendedColorPickerVisible;
- (BOOL)isFingerDrawsOptionEnabled;
- (BOOL)isHandwritingToolSelected;
- (BOOL)isPalettePresentingPopover;
- (BOOL)isPencilInteractionEnabledWhenNotVisible;
- (BOOL)isQuickNoteUI;
- (BOOL)prefersLargeContextualEditingUI;
- (BOOL)shouldAdjustShadowRadiusForMinimized;
- (BOOL)shouldHideHoverPreviewToggle;
- (BOOL)showsLassoToolEditingView;
- (BOOL)showsPlusButton;
- (BOOL)showsShapeButton;
- (BOOL)showsTextButton;
- (BOOL)toolPicker:(id)a3 canSelectTool:(id)a4 fromTap:(BOOL)a5;
- (BOOL)useEqualSpacingLayoutInCompactSize;
- (BOOL)wantsBottomLineDividerVisibleInCompactSize;
- (BOOL)wantsClearBackgroundColorInCompactSize;
- (BOOL)wantsEllipsisButtonVisibleInCompactSize;
- (BOOL)wantsMulticolorSwatchShadowInCompactSize;
- (BOOL)wantsScrollableTools;
- (BOOL)wantsUndoRedoButtonsShadowInCompactSize;
- (BOOL)wantsUndoRedoButtonsVisibleInCompactSize;
- (CGRect)plusButtonFrame;
- (CGRect)toolPickerViewSourceRectForPopoverPresentation:(id)a3 fromCorner:(unint64_t)a4;
- (CGSize)paletteSizeForEdge:(unint64_t)a3;
- (NSArray)inputAssistantItems;
- (NSArray)tools;
- (NSLayoutConstraint)compactContentViewHeightConstraint;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSString)lassoToolEditingViewIdentifier;
- (PKDrawingPaletteView)init;
- (PKDrawingPaletteView)initWithTools:(id)a3;
- (PKDrawingPaletteView)initWithTools:(id)a3 wantsEllipsisButtonVisibleInCompactSize:(BOOL)a4;
- (PKPaletteButton)_plusButton;
- (PKPaletteContentView)contentView;
- (PKPaletteFloatingKeyboardController)floatingKeyboardController;
- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider;
- (PKPaletteTapToRadarCommand)tapToRadarCommand;
- (PKPaletteToolView)selectedToolView;
- (PKPaletteViewAnnotationDelegate)annotationDelegate;
- (PKTextInputWindowFirstResponder)windowFirstResponder;
- (PKTextInputWindowFirstResponderController)firstResponderController;
- (PKTool)selectedTool;
- (UIPencilInteraction)pencilInteraction;
- (UIView)bottomLineDividerView;
- (UIView)contextualEditingView;
- (UIView)lassoToolEditingView;
- (UIView)opacityEditingView;
- (UIViewController)plusButtonViewController;
- (UIViewController)presentedPopoverViewController;
- (UIViewController)shapeButtonViewController;
- (UIViewController)textButtonViewController;
- (UIWindow)_hostingWindow;
- (UIWindowScene)windowScene;
- (double)_paletteHeightForVerticalOrientation;
- (double)_paletteWidthForHorizontalOrientation;
- (double)_toolsContainerWidth;
- (double)borderWidthForTraitCollection:(id)a3;
- (double)compactPaletteHeight;
- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)interItemToolsSpacingInCompactSize;
- (double)interItemUndoRedoButtonsSpacing;
- (double)interItemUndoRedoButtonsSpacingInCompactSize;
- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5;
- (id)_clippingViewBackgroundColor:(BOOL)a3;
- (id)_currentFirstResponder;
- (id)_paletteToolViewAtIndex:(unint64_t)a3;
- (id)_selectedToolViewInToolPicker;
- (id)borderColorForTraitCollection:(id)a3;
- (id)contentScrollView;
- (id)keyboardSelectionMenuForAdditionalOptionsView:(id)a3;
- (id)keyboardSelectionMenuForContentView:(id)a3;
- (id)toolPickerView:(id)a3 viewForToolAtIndex:(int64_t)a4;
- (id)undoManager;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)colorUserInterfaceStyle;
- (int64_t)contextEditingMode;
- (int64_t)floatingKeyboardType;
- (int64_t)numberOfToolsInToolPickerView:(id)a3;
- (int64_t)selectedAnnotationType;
- (unint64_t)_indexOfGenerationTool;
- (unint64_t)_indexOfToolPassingTest:(id)a3;
- (unint64_t)indexOfSelectedTool;
- (unint64_t)paletteViewType;
- (void)_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:(unint64_t)a3 needsContainerViewLayout:(BOOL)a4;
- (void)_dictationAvailabilityDidChange:(id)a3;
- (void)_didTapPlusButton:(id)a3;
- (void)_didTapShapeButton:(id)a3;
- (void)_didTapTextButton:(id)a3;
- (void)_dismissEyeDropper;
- (void)_installPaletteContentViewInView:(id)a3;
- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4;
- (void)_performPencilInteraction:(id)a3 preferredAction:(int64_t)a4;
- (void)_performPencilPreferredActionShowColorPalette;
- (void)_performPencilPreferredActionShowInkAttributes;
- (void)_performPencilPreferredActionSwitchEraser;
- (void)_performPencilPreferredActionSwitchPrevious;
- (void)_presentOrDismissFloatingKeyboard;
- (void)_presentViewController:(id)a3 asPopoverFromItem:(id)a4;
- (void)_presentViewController:(id)a3 asPopoverFromView:(id)a4;
- (void)_presentViewController:(void *)a3 configurationBlock:;
- (void)_releaseUndoManager;
- (void)_reloadImageForToolItem:(id)a3;
- (void)_replaceToolAtIndex:(unint64_t)a3 withTool:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_scrollToolViewAtIndex:(unint64_t)a3 toVisibleAnimated:(BOOL)a4;
- (void)_selectToolAtIndex:(unint64_t)a3 updateUI:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)_setPlusButton:(id)a3;
- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5;
- (void)_setSelectedToolColor:(id)a3 ignoreColorOpacity:(BOOL)a4 isContinuousColorSelection:(BOOL)a5;
- (void)_setTools:(id)a3 resetSelectedTool:(BOOL)a4 updateUI:(BOOL)a5 notifyDelegate:(BOOL)a6;
- (void)_toolViewStateDidChange:(id)a3;
- (void)_updateHandwritingAssistantItemsFromResponder:(id)a3;
- (void)_updateKeyboardSceneDelegateInputAssistantSupressionState;
- (void)_updateToolPreviewContentsAnimated:(BOOL)a3;
- (void)_updateToolPreviewPositionForEdge:(unint64_t)a3;
- (void)_updateToolsContainerScrollingEnabled;
- (void)_updateUI;
- (void)_updateUIReloadTools:(BOOL)a3;
- (void)_willDockPaletteToCorner:(unint64_t)a3;
- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5;
- (void)additionalOptionsView:(id)a3 didToggleAutoHideOption:(BOOL)a4;
- (void)additionalOptionsViewDidPressReturnKeyButton:(id)a3;
- (void)additionalOptionsViewDidPressTapToRadarButton:(id)a3;
- (void)colorPickerDidChangeSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5;
- (void)configureForDockedAtCorner;
- (void)configureForDockedAtEdge:(unint64_t)a3;
- (void)contentViewDidResize:(id)a3;
- (void)contentViewDidSelectInputAssistantReturnKeyItem:(id)a3;
- (void)dealloc;
- (void)didChangePaletteScaleFactor;
- (void)didEndAppearanceAnimation;
- (void)didMoveToWindow;
- (void)dismissContextMenu;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)endOpacityEditing;
- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4;
- (void)floatingKeyboardControllerWillHide:(id)a3;
- (void)floatingKeyboardControllerWillShow:(id)a3;
- (void)handwritingEducationPaneSettingsDidChange;
- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4;
- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5;
- (void)layoutSubviews;
- (void)pencilInteractionDidTap:(id)a3;
- (void)selectToolAtIndex:(unint64_t)a3;
- (void)setAnnotationDelegate:(id)a3;
- (void)setBottomLineDividerView:(id)a3;
- (void)setColorSwatchesVisible:(BOOL)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setCompactContentViewHeightConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setContextEditingMode:(int64_t)a3;
- (void)setEditingExternalElementsSelection:(BOOL)a3;
- (void)setEditingStrokeSelection:(BOOL)a3;
- (void)setEditingTextSelection:(BOOL)a3;
- (void)setFingerDrawsOptionEnabled:(BOOL)a3;
- (void)setFirstResponderController:(id)a3;
- (void)setFloatingKeyboardController:(id)a3;
- (void)setInputAssistantButtonProvider:(id)a3;
- (void)setInterItemToolsSpacingInCompactSize:(double)a3;
- (void)setInterItemUndoRedoButtonsSpacing:(double)a3;
- (void)setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3;
- (void)setIsEditingOpacity:(BOOL)a3;
- (void)setIsQuickNoteUI:(BOOL)a3;
- (void)setLassoToolEditingViewIdentifier:(id)a3;
- (void)setPencilInteractionEnabledWhenNotVisible:(BOOL)a3;
- (void)setPlusButtonViewController:(id)a3;
- (void)setPrefersLargeContextualEditingUI:(BOOL)a3;
- (void)setPresentedPopoverViewController:(id)a3;
- (void)setSelectedAnnotationType:(int64_t)a3;
- (void)setShadowVisible:(BOOL)a3;
- (void)setShapeButtonViewController:(id)a3;
- (void)setShouldHideHoverPreviewToggle:(BOOL)a3;
- (void)setShowsLassoToolEditingView:(BOOL)a3;
- (void)setShowsPlusButton:(BOOL)a3;
- (void)setShowsShapeButton:(BOOL)a3;
- (void)setShowsTextButton:(BOOL)a3;
- (void)setTapToRadarCommand:(id)a3;
- (void)setTextButtonViewController:(id)a3;
- (void)setTools:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setUseEqualSpacingLayoutInCompactSize:(BOOL)a3;
- (void)setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3;
- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3;
- (void)setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3;
- (void)setWantsMulticolorSwatchShadowInCompactSize:(BOOL)a3;
- (void)setWantsUndoRedoButtonsShadowInCompactSize:(BOOL)a3;
- (void)setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3;
- (void)set_hostingWindow:(id)a3;
- (void)showImageWandTipWithController:(id)a3;
- (void)startOpacityEditing;
- (void)toolPicker:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5;
- (void)toolPickerDidToggleRulerTool:(id)a3;
- (void)toolPreviewDidChangeToolColor:(id)a3 isContinuousColorSelection:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)undoRedoViewDidTapRedo:(id)a3;
- (void)undoRedoViewDidTapUndo:(id)a3;
- (void)updateColorPickerSelectedColor;
- (void)updateHandwritingAssistantItems;
- (void)updatePopoverUI;
- (void)updateUndoRedo;
- (void)willStartAppearanceAnimation:(BOOL)a3;
- (void)windowFirstResponderController:(id)a3 didChangeFirstResponder:(id)a4;
@end

@implementation PKDrawingPaletteView

- (PKDrawingPaletteView)init
{
  return [(PKDrawingPaletteView *)self initWithTools:MEMORY[0x1E4F1CBF0]];
}

- (PKDrawingPaletteView)initWithTools:(id)a3
{
  id v4 = a3;
  v5 = [(PKDrawingPaletteView *)self initWithTools:v4 wantsEllipsisButtonVisibleInCompactSize:PKIsPadDevice()];

  return v5;
}

- (PKDrawingPaletteView)initWithTools:(id)a3 wantsEllipsisButtonVisibleInCompactSize:(BOOL)a4
{
  id v6 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKDrawingPaletteView;
  v7 = -[PKPaletteView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    [(PKDrawingPaletteView *)v7 setAccessibilityIdentifier:@"Drawing-Palette"];
    v9 = objc_alloc_init(PKPaletteToolViewFactory);
    toolViewFactory = v8->_toolViewFactory;
    v8->_toolViewFactory = v9;

    v11 = objc_alloc_init(PKPaletteBackgroundColorFactory);
    backgroundColorFactory = v8->_backgroundColorFactory;
    v8->_backgroundColorFactory = v11;

    v8->_wantsClearBackgroundColorInCompactSize = 0;
    v8->_wantsEllipsisButtonVisibleInCompactSize = a4;
    v8->_wantsBottomLineDividerVisibleInCompactSize = 1;
    v8->_pencilInteractionEnabledWhenNotVisible = 0;
    uint64_t v13 = [v6 copy];
    tools = v8->_tools;
    v8->_tools = (NSArray *)v13;

    v8->_indexOfSelectedTool = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = [v6 count];
    double v16 = 7.0;
    if (v15 < 8) {
      double v16 = 5.0;
    }
    v8->_interItemToolsSpacingInCompactSize = v16;
    v8->_interItemUndoRedoButtonsSpacing = 12.0;
    v8->_interItemUndoRedoButtonsSpacingInCompactSize = 12.0;
    v17 = objc_alloc_init(PKTextInputWindowFirstResponderController);
    firstResponderController = v8->_firstResponderController;
    v8->_firstResponderController = v17;

    [(PKTextInputWindowFirstResponderController *)v8->_firstResponderController setDelegate:v8];
    v19 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    floatingKeyboardController = v8->_floatingKeyboardController;
    v8->_floatingKeyboardController = v19;

    -[PKPaletteFloatingKeyboardController setDelegate:]((uint64_t)v8->_floatingKeyboardController, v8);
    v21 = objc_alloc_init(PKPaletteInputAssistantButtonProvider);
    inputAssistantButtonProvider = v8->_inputAssistantButtonProvider;
    v8->_inputAssistantButtonProvider = v21;

    SEL v23 = NSSelectorFromString(&cfstr_Showinkpicker.isa);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __78__PKDrawingPaletteView_initWithTools_wantsEllipsisButtonVisibleInCompactSize___block_invoke;
    v53[3] = &__block_descriptor_40_e67_B24__0__PKPaletteInputAssistantButtonProvider_8__UIBarButtonItem_16l;
    v53[4] = v23;
    [(PKPaletteInputAssistantButtonProvider *)v8->_inputAssistantButtonProvider setInclusionFilter:v53];
    v24 = [(PKPaletteView *)v8 containerView];
    v25 = [v24 contentView];
    [(PKDrawingPaletteView *)v8 _installPaletteContentViewInView:v25];

    v26 = [(PKDrawingPaletteView *)v8 contentView];
    [v26 setDelegate:v8];

    v27 = [(PKDrawingPaletteView *)v8 contentView];
    v28 = [v27 undoRedoView];
    [v28 setDelegate:v8];

    v29 = [(PKDrawingPaletteView *)v8 contentView];
    v30 = [v29 toolPickerView];
    [v30 setDelegate:v8];

    v31 = [(PKDrawingPaletteView *)v8 contentView];
    v32 = [v31 colorPickerView];
    [v32 setDelegate:v8];

    v33 = [(PKDrawingPaletteView *)v8 contentView];
    v34 = [v33 additionalOptionsView];
    [v34 setDelegate:v8];

    v35 = [(PKDrawingPaletteView *)v8 contentView];
    v36 = [v35 additionalOptionsView];
    [v36 setPalettePopoverPresenting:v8];

    v37 = [(PKDrawingPaletteView *)v8 contentView];
    v38 = [v37 additionalOptionsView];
    v39 = [v38 plusButton];
    [v39 addTarget:v8 action:sel__didTapPlusButton_ forControlEvents:64];

    v40 = [(PKDrawingPaletteView *)v8 contentView];
    v41 = [v40 additionalOptionsView];
    v42 = [v41 textButton];
    [v42 addTarget:v8 action:sel__didTapTextButton_ forControlEvents:64];

    v43 = [(PKDrawingPaletteView *)v8 contentView];
    v44 = [v43 additionalOptionsView];
    v45 = [v44 shapeButton];
    [v45 addTarget:v8 action:sel__didTapShapeButton_ forControlEvents:64];

    v46 = [(PKPaletteView *)v8 toolPreview];
    [v46 setDelegate:v8];

    [(PKDrawingPaletteView *)v8 updateColorPickerSelectedColor];
    uint64_t v47 = +[PKPencilInteraction fallbackPencilInteraction]();
    pencilInteraction = v8->_pencilInteraction;
    v8->_pencilInteraction = (UIPencilInteraction *)v47;

    [(UIPencilInteraction *)v8->_pencilInteraction setDelegate:v8];
    [(PKDrawingPaletteView *)v8 addInteraction:v8->_pencilInteraction];
    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    bottomLineDividerView = v8->_bottomLineDividerView;
    v8->_bottomLineDividerView = v49;

    [(PKDrawingPaletteView *)v8 addSubview:v8->_bottomLineDividerView];
    -[PKPaletteView setPalettePopoverLayoutSceneMargins:](v8, "setPalettePopoverLayoutSceneMargins:", 10.0, 10.0, 10.0, 10.0);
    [(PKDrawingPaletteView *)v8 _updateUI];
    v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v51 addObserver:v8 selector:sel__dictationAvailabilityDidChange_ name:*MEMORY[0x1E4FB2BB0] object:0];
  }
  return v8;
}

BOOL __78__PKDrawingPaletteView_initWithTools_wantsEllipsisButtonVisibleInCompactSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 action] != *(void *)(a1 + 32);
}

- (void)_dictationAvailabilityDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Dictation availability did change: %@. Update UI.", (uint8_t *)&v6, 0xCu);
  }

  [(PKDrawingPaletteView *)self _updateUI];
}

- (void)didChangePaletteScaleFactor
{
  v4.receiver = self;
  v4.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v4 didChangePaletteScaleFactor];
  v3 = [(PKDrawingPaletteView *)self contentView];
  [v3 paletteViewStateDidChangeScaleFactor:self];

  [(PKDrawingPaletteView *)self _updateUI];
  [(PKDrawingPaletteView *)self setNeedsUpdateConstraints];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)PKDrawingPaletteView;
  [(PKDrawingPaletteView *)&v7 didMoveToWindow];
  v3 = [(PKDrawingPaletteView *)self window];

  if (v3)
  {
    firstResponderController = self->_firstResponderController;
    v5 = [(PKDrawingPaletteView *)self windowScene];
    [(PKTextInputWindowFirstResponderController *)firstResponderController updateFirstResponderFromWindowScene:v5 sendDelegateCallback:0];
  }
  else
  {
    v5 = [(PKDrawingPaletteView *)self floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v5, @"Palette UI moved to nil window.");
  }

  int v6 = [(PKDrawingPaletteView *)self windowScene];
  [(PKDrawingPaletteView *)self setIsQuickNoteUI:PKIsQuickNoteWindowScene(v6)];
}

- (id)contentScrollView
{
  v2 = [(PKDrawingPaletteView *)self contentView];
  v3 = [v2 toolPickerView];
  objc_super v4 = [v3 scrollView];

  return v4;
}

- (void)dealloc
{
  [(PKDrawingPaletteView *)self _releaseUndoManager];
  v3.receiver = self;
  v3.super_class = (Class)PKDrawingPaletteView;
  [(PKDrawingPaletteView *)&v3 dealloc];
}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.75;
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  return 0.8;
}

- (void)_installPaletteContentViewInView:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[PKPaletteContentView alloc] initWithPaletteViewStateObservable:self];
  [(PKDrawingPaletteView *)self setContentView:v5];

  int v6 = [(PKDrawingPaletteView *)self contentView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [(PKDrawingPaletteView *)self contentView];
  [v4 addSubview:v7];

  uint64_t v8 = [(PKDrawingPaletteView *)self contentView];
  v9 = [v8 bottomAnchor];
  v10 = [v4 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v11;

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(PKDrawingPaletteView *)self contentView];
  v29 = [v30 topAnchor];
  v28 = [v4 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  uint64_t v13 = self->_contentViewBottomConstraint;
  v31[0] = v27;
  v31[1] = v13;
  v14 = [(PKDrawingPaletteView *)self contentView];
  uint64_t v15 = [v14 leftAnchor];
  double v16 = [v4 leftAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v31[2] = v17;
  v18 = [(PKDrawingPaletteView *)self contentView];
  v19 = [v18 rightAnchor];
  v20 = [v4 rightAnchor];

  v21 = [v19 constraintEqualToAnchor:v20];
  v31[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v26 activateConstraints:v22];

  SEL v23 = [(PKPaletteContentView *)self->_contentView heightAnchor];
  [(PKDrawingPaletteView *)self compactPaletteHeight];
  objc_msgSend(v23, "constraintEqualToConstant:");
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  compactContentViewHeightConstraint = self->_compactContentViewHeightConstraint;
  self->_compactContentViewHeightConstraint = v24;
}

- (id)borderColorForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1618] clearColor];
  if (!PKIsVisionDevice())
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] systemGray4Color];
    }
    else
    {
      objc_super v7 = [(PKDrawingPaletteView *)self window];
      uint64_t v8 = [v7 windowScene];
      if (PKUseCompactSize(v4, v8))
      {

LABEL_9:
        goto LABEL_10;
      }
      uint64_t v9 = [v4 userInterfaceStyle];

      if (v9 != 2) {
        goto LABEL_10;
      }
      uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.172549024 green:0.172549024 blue:0.180392161 alpha:1.0];
    }
    objc_super v7 = v5;
    v5 = (void *)v6;
    goto LABEL_9;
  }
LABEL_10:
  id v10 = v5;

  return v10;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (!PKIsVisionDevice())
  {
    uint64_t v6 = [(PKDrawingPaletteView *)self window];
    objc_super v7 = [v6 windowScene];
    BOOL v8 = PKUseCompactSize(v4, v7);

    if (!v8)
    {
      double v5 = 1.0;
      if (!UIAccessibilityDarkerSystemColorsEnabled())
      {
        if ([v4 userInterfaceStyle] == 2) {
          double v5 = 0.5;
        }
        else {
          double v5 = 0.0;
        }
      }
    }
  }

  return v5;
}

- (void)setShadowVisible:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v5 setShadowVisible:a3];
  id v4 = [(PKPaletteView *)self internalDelegate];
  [v4 paletteViewStateDidChange:self updatePaletteAppearance:1];
}

- (double)shadowOpacity
{
  BOOL v2 = [(PKPaletteView *)self shadowVisible];
  double result = 0.0;
  if (v2)
  {
    BOOL v4 = UIAccessibilityDarkerSystemColorsEnabled();
    double result = 0.25;
    if (v4) {
      return 0.5;
    }
  }
  return result;
}

- (double)shadowRadius
{
  BOOL v2 = [(PKPaletteView *)self shadowVisible];
  double result = 0.0;
  if (v2)
  {
    BOOL v4 = UIAccessibilityDarkerSystemColorsEnabled();
    double result = 38.0;
    if (v4) {
      return 15.0;
    }
  }
  return result;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return !UIAccessibilityDarkerSystemColorsEnabled();
}

- (void)setWantsUndoRedoButtonsShadowInCompactSize:(BOOL)a3
{
  if (self->_wantsUndoRedoButtonsShadowInCompactSize != a3)
  {
    self->_wantsUndoRedoButtonsShadowInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setWantsMulticolorSwatchShadowInCompactSize:(BOOL)a3
{
  if (self->_wantsMulticolorSwatchShadowInCompactSize != a3)
  {
    self->_wantsMulticolorSwatchShadowInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)_updateUI
{
}

- (void)_updateUIReloadTools:(BOOL)a3
{
  BOOL v3 = a3;
  v66[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_super v5 = [(PKDrawingPaletteView *)self contentView];
    uint64_t v6 = [v5 toolPickerView];
    [v6 reloadToolViewsWithDataSource:self];
  }
  objc_super v7 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v8 = [(PKDrawingPaletteView *)self contentViewBottomConstraint];
  v66[0] = v8;
  uint64_t v9 = [(PKDrawingPaletteView *)self compactContentViewHeightConstraint];
  v66[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  [v7 deactivateConstraints:v10];

  v11 = [(PKDrawingPaletteView *)self traitCollection];
  v12 = [(PKDrawingPaletteView *)self window];
  uint64_t v13 = [v12 windowScene];
  LODWORD(v10) = PKUseCompactSize(v11, v13);

  v14 = (void *)MEMORY[0x1E4F28DC8];
  if (v10)
  {
    uint64_t v15 = [(PKDrawingPaletteView *)self compactContentViewHeightConstraint];
    v65 = v15;
    double v16 = &v65;
  }
  else
  {
    uint64_t v15 = [(PKDrawingPaletteView *)self contentViewBottomConstraint];
    v64 = v15;
    double v16 = &v64;
  }
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v14 activateConstraints:v17];

  v18 = [(PKDrawingPaletteView *)self contentView];
  v19 = [v18 undoRedoView];
  [v19 updateUI];

  int64_t v20 = [(PKDrawingPaletteView *)self colorUserInterfaceStyle];
  v21 = [(PKDrawingPaletteView *)self contentView];
  v22 = [v21 colorPickerView];
  [v22 setColorUserInterfaceStyle:v20];

  int64_t v23 = [(PKDrawingPaletteView *)self colorUserInterfaceStyle];
  v24 = [(PKDrawingPaletteView *)self contentView];
  v25 = [v24 toolPickerView];
  [v25 setColorUserInterfaceStyle:v23];

  BOOL v26 = [(PKPaletteView *)self isAutoHideEnabled];
  v27 = [(PKDrawingPaletteView *)self contentView];
  v28 = [v27 additionalOptionsView];
  [v28 setAutoHideOn:v26];

  BOOL v29 = [(PKDrawingPaletteView *)self _shouldShowFingerDrawsOption];
  v30 = [(PKDrawingPaletteView *)self contentView];
  v31 = [v30 additionalOptionsView];
  [v31 setShouldShowFingerDrawsOption:v29];

  int64_t v32 = [(PKDrawingPaletteView *)self colorUserInterfaceStyle];
  v33 = [(PKPaletteView *)self toolPreview];
  [v33 setColorUserInterfaceStyle:v32];

  [(PKDrawingPaletteView *)self _updateToolsContainerScrollingEnabled];
  if ([(PKPaletteView *)self useCompactSize]
    || (unint64_t)([(PKPaletteView *)self palettePosition] - 1) > 3)
  {
    if ((unint64_t)([(PKPaletteView *)self palettePosition] - 5) <= 3)
    {
      unint64_t v36 = [(PKPaletteView *)self palettePosition] - 5;
      if (v36 > 3) {
        uint64_t v37 = -1;
      }
      else {
        uint64_t v37 = qword_1C482C0A8[v36];
      }
      unint64_t v38 = [(PKPaletteView *)self edgeLocationToDockFromCorner:v37];
      [(PKPaletteView *)self _updateContainerSizeConstraintsForEdge:v38];
      [(PKDrawingPaletteView *)self _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:v38 needsContainerViewLayout:1];
      [(PKDrawingPaletteView *)self _updateToolPreviewPositionForEdge:v38];
    }
  }
  else
  {
    unint64_t v34 = [(PKPaletteView *)self palettePosition] - 1;
    if (v34 > 3) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = qword_1C482C108[v34];
    }
    [(PKPaletteView *)self _updateContainerSizeConstraintsForEdge:v35];
  }
  [(PKPaletteView *)self paletteScaleFactor];
  double v40 = v39;
  v41 = [(PKPaletteView *)self containerView];
  [v41 setScalingFactor:v40];

  unint64_t indexOfSelectedTool = self->_indexOfSelectedTool;
  if (indexOfSelectedTool != 0x7FFFFFFFFFFFFFFFLL)
  {
    v43 = [(PKDrawingPaletteView *)self contentView];
    v44 = [v43 toolPickerView];
    [v44 selectToolViewAtIndex:indexOfSelectedTool];

    v45 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
    v46 = [v45 tool];
    if ([v46 isLassoTool])
    {
    }
    else
    {
      uint64_t v47 = [(PKDrawingPaletteView *)self selectedTool];
      int v48 = [v47 _isLassoTool];

      if (!v48) {
        goto LABEL_22;
      }
    }
    v49 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
    [v49 setSupportsDisplayingSelectedColor:0];

LABEL_22:
    [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
    uint64_t v50 = [(PKPaletteView *)self paletteViewHosting];
    if (v50)
    {
      v51 = (void *)v50;
      v52 = [(PKPaletteView *)self paletteViewHosting];
      char v53 = [v52 isPaletteVisualStateMinimized];

      if (v53)
      {
LABEL_24:
        uint64_t v54 = 1;
LABEL_30:
        [(PKDrawingPaletteView *)self _updateToolPreviewContentsAnimated:v54];
        [(PKPaletteView *)self _updateToolPreviewVisibility];
        goto LABEL_31;
      }
    }
    else if ((unint64_t)([(PKPaletteView *)self palettePosition] - 5) < 4)
    {
      goto LABEL_24;
    }
    unint64_t v55 = [(PKPaletteView *)self palettePosition] - 1;
    if (v55 > 3) {
      uint64_t v56 = 0;
    }
    else {
      uint64_t v56 = qword_1C482C108[v55];
    }
    [(PKDrawingPaletteView *)self _updateToolPreviewPositionForEdge:v56];
    uint64_t v54 = 0;
    goto LABEL_30;
  }
LABEL_31:
  [(PKDrawingPaletteView *)self _updateKeyboardSceneDelegateInputAssistantSupressionState];
  if ([(PKDrawingPaletteView *)self isHandwritingToolSelected])
  {
    [(PKDrawingPaletteView *)self updateHandwritingAssistantItems];
  }
  else
  {
    v57 = [(PKDrawingPaletteView *)self floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v57, @"Handwriting tool no longer selected");
  }
  if (![(PKDrawingPaletteView *)self isAnnotationSupportEnabled]
    && [(PKDrawingPaletteView *)self selectedAnnotationType])
  {
    [(PKDrawingPaletteView *)self setSelectedAnnotationType:0];
  }
  v58 = [(PKDrawingPaletteView *)self bottomLineDividerView];
  int v59 = [v58 isDescendantOfView:self];

  if ([(PKDrawingPaletteView *)self wantsBottomLineDividerVisibleInCompactSize]|| !v59)
  {
    if ((![(PKDrawingPaletteView *)self wantsBottomLineDividerVisibleInCompactSize] | v59))goto LABEL_43; {
    v60 = [(PKDrawingPaletteView *)self bottomLineDividerView];
    }
    [(PKDrawingPaletteView *)self addSubview:v60];
  }
  else
  {
    v60 = [(PKDrawingPaletteView *)self bottomLineDividerView];
    [v60 removeFromSuperview];
  }

LABEL_43:
  if (v3)
  {
    v61 = [(PKDrawingPaletteView *)self contentView];
    [v61 paletteViewStateDidChange:self];

    v62 = [(PKPaletteView *)self internalDelegate];
    [v62 paletteViewStateDidChange:self];

    v63 = [(PKPaletteView *)self delegate];
    [v63 paletteViewContentSizeDidChange:self];
  }
}

- (BOOL)_canShowFingerDrawsOption
{
  BOOL v2 = [(PKDrawingPaletteView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != 0;

  return v3;
}

- (BOOL)_shouldShowFingerDrawsOption
{
  BOOL v3 = [(PKDrawingPaletteView *)self _canShowFingerDrawsOption];
  if (v3)
  {
    LOBYTE(v3) = [(PKDrawingPaletteView *)self isFingerDrawsOptionEnabled];
  }
  return v3;
}

- (void)_updateToolsContainerScrollingEnabled
{
  BOOL v3 = [(PKDrawingPaletteView *)self contentView];
  id v4 = [v3 toolPickerView];
  int v5 = [v4 isScrollingEnabled];
  int v6 = [(PKDrawingPaletteView *)self wantsScrollableTools];

  if (v5 != v6)
  {
    id v7 = [(PKDrawingPaletteView *)self contentView];
    [v7 paletteViewStateDidChange:self];
  }
}

- (BOOL)wantsScrollableTools
{
  BOOL v3 = [(PKDrawingPaletteView *)self tools];
  uint64_t v4 = [v3 count];

  if (v4 < 8) {
    return 0;
  }
  int v5 = [(PKDrawingPaletteView *)self windowScene];
  BOOL v6 = PKIsSmallestQuickNoteWindowScene(v5);

  double v7 = 7.0;
  if (v6) {
    double v7 = 6.0;
  }
  return v7 < (double)v4;
}

- (BOOL)isExtendedColorPickerVisible
{
  BOOL v2 = [(PKDrawingPaletteView *)self contentView];
  BOOL v3 = [v2 colorPickerView];
  char v4 = [v3 _isExtendedColorPickerVisible];

  return v4;
}

- (void)_dismissEyeDropper
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  [v2 dismissEyeDropper];
}

- (double)compactPaletteHeight
{
  return 75.0;
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  if (a3 == 8 || a3 == 2)
  {
    [(PKDrawingPaletteView *)self _paletteHeightForVerticalOrientation];
    double v5 = v4;
    double v6 = 122.0;
  }
  else
  {
    [(PKDrawingPaletteView *)self _paletteWidthForHorizontalOrientation];
    double v6 = v7;
    double v5 = 122.0;
  }
  [(PKPaletteView *)self paletteScaleFactor];
  double v9 = v5 * v8;
  double v10 = v6 * v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (double)_paletteHeightForVerticalOrientation
{
  PKPaletteButtonSize(0);
  double v4 = v3;
  double v5 = v3 + 48.0 + 36.0;
  [(PKDrawingPaletteView *)self _toolsContainerWidth];
  double v7 = v6 + v5 + 36.0;
  PKPaletteColorSwatchesSize(1);
  double v9 = v8 + v7 + 26.0;
  if ([(PKDrawingPaletteView *)self showsPlusButton]
    || [(PKDrawingPaletteView *)self showsTextButton]
    || [(PKDrawingPaletteView *)self showsShapeButton])
  {
    double v9 = v4 + 6.0 + v9;
  }
  double v10 = v4 + v9;
  BOOL v11 = [(PKDrawingPaletteView *)self showsPlusButton];
  double v12 = 48.0;
  if (!v11) {
    double v12 = 26.0;
  }
  return v10 + v12;
}

- (double)_paletteWidthForHorizontalOrientation
{
  double v3 = PKPaletteButtonSize(0);
  [(PKDrawingPaletteView *)self _toolsContainerWidth];
  double v5 = PKPaletteColorSwatchesSize(0) + v4 + v3 * 2.0 + 12.0 + 26.0 + 36.0 + 36.0 + 26.0;
  if ([(PKDrawingPaletteView *)self showsTextButton]
    || [(PKDrawingPaletteView *)self showsShapeButton])
  {
    double v5 = v3 + 6.0 + v5;
  }
  BOOL v6 = [(PKDrawingPaletteView *)self showsPlusButton];
  double v7 = v3 + 12.0;
  if (!v6) {
    double v7 = -0.0;
  }
  double v8 = v5 + v7;
  if ([(PKDrawingPaletteView *)self isEllipsisButtonVisible]) {
    double v9 = v3;
  }
  else {
    double v9 = -0.0;
  }
  return v9 + v8 + 26.0;
}

- (double)_toolsContainerWidth
{
  id v2 = [(PKDrawingPaletteView *)self tools];
  unint64_t v3 = [v2 count];

  uint64_t v4 = v3 - 1;
  if (v3 == 1) {
    return 46.0;
  }
  double v6 = 15.0;
  if (v4 < 8) {
    double v6 = 12.0;
  }
  double v7 = (double)v3 * 46.0 + v6 * (double)(unint64_t)v4;
  double v8 = [MEMORY[0x1E4F28B50] mainBundle];
  double v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.mobilenotes"];

  if (v10)
  {
    BOOL v11 = PKIsVisionDevice();
    double v12 = 372.0;
    if (v11) {
      double v12 = 534.0;
    }
    if (v12 >= v7) {
      double v7 = v12;
    }
  }
  if (PKIsVisionDevice())
  {
    BOOL v13 = PKIsVisionDevice();
    double result = 372.0;
    if (v13) {
      double result = 534.0;
    }
  }
  else
  {
    double result = 394.0;
  }
  if (result >= v7) {
    return v7;
  }
  return result;
}

- (void)updatePopoverUI
{
  unint64_t v3 = [(PKDrawingPaletteView *)self contentView];
  uint64_t v4 = [v3 toolPickerView];
  [v4 updatePopoverUI];

  double v5 = [(PKDrawingPaletteView *)self contentView];
  double v6 = [v5 colorPickerView];
  [v6 updatePopoverUI];

  id v8 = [(PKDrawingPaletteView *)self contentView];
  double v7 = [v8 additionalOptionsView];
  [v7 updatePopoverUI];
}

- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->_wantsClearBackgroundColorInCompactSize != a3)
  {
    self->_wantsClearBackgroundColorInCompactSize = a3;
    [(PKDrawingPaletteView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v28 layoutSubviews];
  [(PKDrawingPaletteView *)self updateUndoRedo];
  BOOL v3 = [(PKDrawingPaletteView *)self _wantsClearBackgroundColor];
  uint64_t v4 = [(PKDrawingPaletteView *)self _clippingViewBackgroundColor:v3];
  double v5 = [(PKPaletteView *)self clippingView];
  [v5 setBackgroundColor:v4];

  double v6 = [(PKPaletteView *)self clippingView];
  [v6 bounds];
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;

  if (![(PKPaletteView *)self useCompactSize])
  {
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    CGRect v30 = CGRectInset(v29, -6.0, -6.0);
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;
  }
  uint64_t v15 = [(PKPaletteView *)self backgroundMaterialView];
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  double v16 = [(PKPaletteView *)self backgroundMaterialView];
  [v16 setHidden:v3];

  [(PKDrawingPaletteView *)self compactPaletteHeight];
  double v18 = v17;
  [(PKDrawingPaletteView *)self bounds];
  double v19 = CGRectGetWidth(v31);
  int64_t v20 = [(PKDrawingPaletteView *)self bottomLineDividerView];
  objc_msgSend(v20, "setFrame:", 0.0, v18, v19, 1.0);

  if ([(PKPaletteView *)self useCompactSize]) {
    objc_msgSend(MEMORY[0x1E4FB1618], "pk_separatorLineColor");
  }
  else {
  v21 = [MEMORY[0x1E4FB1618] clearColor];
  }
  v22 = [(PKDrawingPaletteView *)self bottomLineDividerView];
  [v22 setBackgroundColor:v21];

  int64_t v23 = [MEMORY[0x1E4F28B50] mainBundle];
  v24 = [v23 bundleIdentifier];
  char v25 = [v24 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v25)
  {
    uint64_t v26 = 2;
  }
  else
  {
    int64_t v23 = [(PKDrawingPaletteView *)self traitCollection];
    uint64_t v26 = [v23 userInterfaceStyle];
  }
  v27 = [(PKDrawingPaletteView *)self bottomLineDividerView];
  [v27 setOverrideUserInterfaceStyle:v26];

  if ((v25 & 1) == 0) {
  if ([(PKDrawingPaletteView *)self isQuickNoteUI])
  }
    [(PKDrawingPaletteView *)self _updateToolsContainerScrollingEnabled];
}

- (BOOL)_wantsClearBackgroundColor
{
  if (PKIsVisionDevice())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(PKPaletteView *)self useCompactSize];
    if (v3)
    {
      LOBYTE(v3) = [(PKDrawingPaletteView *)self wantsClearBackgroundColorInCompactSize];
    }
  }
  return v3;
}

- (id)_clippingViewBackgroundColor:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  BOOL v3 = -[PKPaletteBackgroundColorFactory makeBackgroundColor](self->_backgroundColorFactory);
  }

  return v3;
}

- (void)setUseEqualSpacingLayoutInCompactSize:(BOOL)a3
{
  if (self->_useEqualSpacingLayoutInCompactSize != a3)
  {
    self->_useEqualSpacingLayoutInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setAnnotationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationDelegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_annotationDelegate, obj);
    [(PKDrawingPaletteView *)self setShowsPlusButton:[(PKDrawingPaletteView *)self isAnnotationSupportEnabled]];
    double v5 = obj;
  }
}

- (BOOL)isAnnotationSupportEnabled
{
  id v2 = [(PKDrawingPaletteView *)self annotationDelegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateUndoRedo
{
  BOOL v3 = [(PKPaletteView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(PKPaletteView *)self delegate];
    id v12 = [v5 paletteViewUndoManager:self];
  }
  else
  {
    id v12 = 0;
  }
  [(PKDrawingPaletteView *)self setUndoManager:v12];
  uint64_t v6 = [v12 canUndo];
  double v7 = [(PKDrawingPaletteView *)self contentView];
  id v8 = [v7 undoRedoView];
  [v8 setUndoEnabled:v6];

  uint64_t v9 = [v12 canRedo];
  int v10 = [(PKDrawingPaletteView *)self contentView];
  double v11 = [v10 undoRedoView];
  [v11 setRedoEnabled:v9];
}

- (NSArray)inputAssistantItems
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKDrawingPaletteView *)self window];
  char v4 = [v3 windowScene];

  double v5 = [(__CFString *)v4 keyboardSceneDelegate];
  if (v5)
  {
    BOOL v6 = [(PKPaletteView *)self isVisible];
    BOOL v7 = [(PKDrawingPaletteView *)self isHandwritingToolSelected];
    uint64_t v8 = [v5 shouldSuppressInputAssistantUpdates];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7 && v6)
    {
      if ((_os_feature_enabled_impl() | v8) == 1)
      {
        int v10 = [(PKDrawingPaletteView *)self inputAssistantButtonProvider];
        uint64_t v9 = [v10 buttonsForCurrentConfiguration];
      }
      else
      {
        id v12 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = @"UIKeyboardSceneDelegate.shouldSuppressInputAssistantUpdates is 'NO' yet something requested inputAssistantItems";
          _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__PKDrawingPaletteView_inputAssistantItems__block_invoke;
        block[3] = &unk_1E64C61C0;
        double v19 = @"UIKeyboardSceneDelegate.shouldSuppressInputAssistantUpdates is 'NO' yet something requested inputAssistantItems";
        if (inputAssistantItems_onceToken != -1) {
          dispatch_once(&inputAssistantItems_onceToken, block);
        }

        uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = [NSNumber numberWithBool:v7];
      uint64_t v15 = [NSNumber numberWithBool:v6];
      double v16 = [NSNumber numberWithBool:v8];
      *(_DWORD *)buf = 138413058;
      v21 = v13;
      __int16 v22 = 2112;
      int64_t v23 = v14;
      __int16 v24 = 2112;
      char v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_INFO, "Returning %@ input assistant item(s). isVisible = %@, isHandwritingToolSelected = %@, shouldSuppressInputAssistantUpdates = %@", buf, 0x2Au);
    }
  }
  else
  {
    double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v21 = v4;
      __int16 v22 = 2048;
      int64_t v23 = 0;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_INFO, "No input assistant items. Either drawing palette is not in a scene (%p), or has not input responder controller (%p).", buf, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v9;
}

void __43__PKDrawingPaletteView_inputAssistantItems__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_fault_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)enableKeyboardButtons
{
  uint64_t v3 = [(PKDrawingPaletteView *)self window];
  int v4 = [v3 windowScene];
  uint64_t v5 = [v4 keyboardSceneDelegate];

  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 hasNullInputView];
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = [(PKDrawingPaletteView *)self window];
  uint64_t v8 = [v7 windowScene];
  uint64_t v9 = [v8 screen];
  int v10 = [v9 _isEmbeddedScreen];

  if (v10)
  {
    double v11 = [(PKDrawingPaletteView *)self firstResponderController];
    id v12 = [v11 firstResponder];
    char v13 = [v12 isEditableTextInput];
    if (v6) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v13;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)floatingKeyboardType
{
  return __PKFloatingKeyboardType;
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (undoManager)
  {
    uint64_t v3 = undoManager;
  }
  else
  {
    uint64_t v3 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    [(PKDrawingPaletteView *)self setUndoManager:v3];
  }

  return v3;
}

- (void)setUndoManager:(id)a3
{
  uint64_t v5 = (NSUndoManager *)a3;
  p_undoManager = &self->_undoManager;
  undoManager = self->_undoManager;
  uint64_t v9 = v5;
  if (undoManager != v5)
  {
    if (undoManager) {
      [(PKDrawingPaletteView *)self _releaseUndoManager];
    }
    objc_storeStrong((id *)&self->_undoManager, a3);
    if (*p_undoManager)
    {
      uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__changeWasUndone_ name:*MEMORY[0x1E4F28A80] object:*p_undoManager];
      [v8 addObserver:self selector:sel__changeWasRedone_ name:*MEMORY[0x1E4F28A78] object:*p_undoManager];
      [v8 addObserver:self selector:sel__changeWasDone_ name:*MEMORY[0x1E4F28A68] object:*p_undoManager];
    }
  }
}

- (void)_releaseUndoManager
{
  if (self->_undoManager)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A80] object:self->_undoManager];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A78] object:self->_undoManager];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A68] object:self->_undoManager];
    undoManager = self->_undoManager;
    self->_undoManager = 0;
  }
}

- (unint64_t)paletteViewType
{
  return 1;
}

- (PKPaletteButton)_plusButton
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  uint64_t v3 = [v2 additionalOptionsView];
  id v4 = [v3 plusButton];

  return (PKPaletteButton *)v4;
}

- (void)_setPlusButton:(id)a3
{
  id v6 = a3;
  id v4 = [(PKDrawingPaletteView *)self contentView];
  uint64_t v5 = [v4 additionalOptionsView];
  [v5 setPlusButton:v6];

  [v6 addTarget:self action:sel__didTapPlusButton_ forControlEvents:64];
}

- (void)setShowsPlusButton:(BOOL)a3
{
  if (self->_showsPlusButton != a3)
  {
    self->_showsPlusButton = a3;
    id v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewStateDidChange:self];

    uint64_t v5 = [(PKDrawingPaletteView *)self contentView];
    [v5 paletteViewStateDidChange:self];

    id v6 = [(PKPaletteView *)self delegate];
    [v6 paletteViewContentSizeDidChange:self];

    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (void)setPlusButtonViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  if (self->_plusButtonViewController != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)&self->_plusButtonViewController, a3);
    id v6 = [(PKDrawingPaletteView *)self contentView];
    [v6 paletteViewStateDidChange:self];

    uint64_t v5 = v7;
  }
}

- (void)setShowsTextButton:(BOOL)a3
{
  if (self->_showsTextButton != a3)
  {
    self->_showsTextButton = a3;
    id v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewStateDidChange:self];

    uint64_t v5 = [(PKDrawingPaletteView *)self contentView];
    [v5 paletteViewStateDidChange:self];

    id v6 = [(PKPaletteView *)self delegate];
    [v6 paletteViewContentSizeDidChange:self];

    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (void)setShowsShapeButton:(BOOL)a3
{
  if (self->_showsShapeButton != a3)
  {
    self->_showsShapeButton = a3;
    id v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewStateDidChange:self];

    uint64_t v5 = [(PKDrawingPaletteView *)self contentView];
    [v5 paletteViewStateDidChange:self];

    id v6 = [(PKPaletteView *)self delegate];
    [v6 paletteViewContentSizeDidChange:self];

    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (void)setWantsUndoRedoButtonsVisibleInCompactSize:(BOOL)a3
{
  if (self->_wantsUndoRedoButtonsVisibleInCompactSize != a3)
  {
    self->_wantsUndoRedoButtonsVisibleInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setWantsEllipsisButtonVisibleInCompactSize:(BOOL)a3
{
  if (self->_wantsEllipsisButtonVisibleInCompactSize != a3)
  {
    self->_wantsEllipsisButtonVisibleInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setWantsBottomLineDividerVisibleInCompactSize:(BOOL)a3
{
  if (self->_wantsBottomLineDividerVisibleInCompactSize != a3)
  {
    self->_wantsBottomLineDividerVisibleInCompactSize = a3;
    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (BOOL)isEllipsisButtonVisible
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  char v3 = [v2 isEllipsisButtonVisible];

  return v3;
}

- (BOOL)isPalettePresentingPopover
{
  v27.receiver = self;
  v27.super_class = (Class)PKDrawingPaletteView;
  if ([(PKPaletteView *)&v27 isPalettePresentingPopover]) {
    return 1;
  }
  id v4 = [(PKPaletteView *)self palettePopoverPresentingController];
  uint64_t v5 = [v4 presentedViewController];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v7 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v8 = [(PKDrawingPaletteView *)self annotationDelegate];
    uint64_t v9 = [v7 bundleForClass:objc_opt_class()];

    if (v6 == v9) {
      goto LABEL_6;
    }
  }
  int v10 = [v5 popoverPresentationController];
  double v11 = [v10 sourceView];
  id v12 = [(PKDrawingPaletteView *)self contextualEditingView];
  char v13 = [v11 isDescendantOfView:v12];

  if (v13) {
    goto LABEL_6;
  }
  uint64_t v15 = [v5 popoverPresentationController];
  double v16 = [v15 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  double v18 = [v5 popoverPresentationController];
  double v19 = [v18 sourceItem];
  char v20 = [v19 isDescendantOfView:self];

  if (v20)
  {
LABEL_6:
    char v3 = 1;
  }
  else
  {
LABEL_11:
    v21 = [v5 popoverPresentationController];
    __int16 v22 = [v21 sourceItem];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      __int16 v24 = [v5 popoverPresentationController];
      char v25 = [v24 sourceItem];
      __int16 v26 = [v25 view];
      char v3 = [v26 isDescendantOfView:self];
    }
    else
    {
      char v3 = 0;
    }
  }

  return v3;
}

- (BOOL)hasContextMenuVisible
{
  v6.receiver = self;
  v6.super_class = (Class)PKDrawingPaletteView;
  if ([(PKPaletteView *)&v6 hasContextMenuVisible]) {
    return 1;
  }
  id v4 = [(PKDrawingPaletteView *)self _plusButton];
  char v3 = [v4 hasContextMenuVisible];

  return v3;
}

- (void)dismissContextMenu
{
  id v2 = [(PKDrawingPaletteView *)self _plusButton];
  [v2 dismissContextMenu];
}

- (void)_setSelectedToolColor:(id)a3 ignoreColorOpacity:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  uint64_t v8 = [(PKDrawingPaletteView *)self contentView];
  uint64_t v9 = [v8 toolPickerView];
  int v10 = [v9 selectedToolView];

  if ([v10 supportsDisplayingSelectedColor])
  {
    double v11 = [v10 tool];
    id v12 = [v11 inkingTool];

    if (v12)
    {
      char v13 = [v12 ink];

      if (v13)
      {
        BOOL v14 = [v12 ink];
        uint64_t v15 = [v14 color];
        [v15 alphaComponent];
        double v17 = v16;

        if (a4)
        {
          id v18 = [v22 colorWithAlphaComponent:v17];
        }
        else
        {
          id v18 = v22;
        }
        double v19 = v18;
        [v12 setInkColor:v18];
        char v20 = [(NSArray *)self->_tools objectAtIndexedSubscript:self->_indexOfSelectedTool];
        v21 = +[PKToolFromPaletteTool toolByApplyingPropertiesFromPaletteTool:v12 toTool:v20];

        [(PKDrawingPaletteView *)self _replaceToolAtIndex:self->_indexOfSelectedTool withTool:v21 notifyDelegate:!v5];
      }
    }
  }
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (void)setFingerDrawsOptionEnabled:(BOOL)a3
{
  if (self->_fingerDrawsOptionEnabled != a3)
  {
    self->_fingerDrawsOptionEnabled = a3;
    [(PKDrawingPaletteView *)self _updateUI];
  }
}

- (void)setEditingStrokeSelection:(BOOL)a3
{
  if (self->_editingStrokeSelection != a3)
  {
    self->_editingStrokeSelection = a3;
    [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
  }
}

- (void)setEditingTextSelection:(BOOL)a3
{
  if (self->_editingTextSelection != a3)
  {
    self->_editingTextSelection = a3;
    uint64_t v4 = [(PKDrawingPaletteView *)self isEditingTextSelection];
    [(PKDrawingPaletteView *)self setContextEditingMode:v4];
  }
}

- (void)setEditingExternalElementsSelection:(BOOL)a3
{
  if (self->_editingExternalElementsSelection != a3)
  {
    self->_editingExternalElementsSelection = a3;
    if ([(PKDrawingPaletteView *)self isEditingExternalElementsSelection]) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 0;
    }
    [(PKDrawingPaletteView *)self setContextEditingMode:v4];
    [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
  }
}

- (void)setShowsLassoToolEditingView:(BOOL)a3
{
  if (self->_showsLassoToolEditingView != a3)
  {
    self->_showsLassoToolEditingView = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_lassoToolEditingViewIdentifier;
  objc_super v6 = (NSString *)v4;
  id v12 = v6;
  if (v5 == v6)
  {

    uint64_t v9 = v12;
LABEL_9:

    uint64_t v8 = v12;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    uint64_t v8 = v12;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  uint64_t v8 = v12;
  if (!v7)
  {
LABEL_8:
    int v10 = (NSString *)[(NSString *)v8 copy];
    lassoToolEditingViewIdentifier = self->_lassoToolEditingViewIdentifier;
    self->_lassoToolEditingViewIdentifier = v10;

    uint64_t v9 = [(PKDrawingPaletteView *)self contentView];
    [v9 setLassoToolEditingViewIdentifier:self->_lassoToolEditingViewIdentifier];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setColorSwatchesVisible:(BOOL)a3
{
  if (self->_colorSwatchesVisible != a3)
  {
    self->_colorSwatchesVisible = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setPrefersLargeContextualEditingUI:(BOOL)a3
{
  if (self->_prefersLargeContextualEditingUI != a3)
  {
    self->_prefersLargeContextualEditingUI = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setSelectedAnnotationType:(int64_t)a3
{
  if (self->_selectedAnnotationType == a3) {
    return;
  }
  uint64_t v5 = 0;
  self->_selectedAnnotationType = a3;
  if (a3 > 10)
  {
    if (a3 == 11)
    {
      uint64_t v5 = 3;
      goto LABEL_10;
    }
    if (a3 != 12) {
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    if (a3 == 10)
    {
      uint64_t v5 = 1;
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v5 = 2;
  }
LABEL_10:
  [(PKDrawingPaletteView *)self setContextEditingMode:v5];

  [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
}

- (void)updateColorPickerSelectedColor
{
  int64_t v3 = [(PKDrawingPaletteView *)self contextEditingMode];
  if ((unint64_t)(v3 - 1) < 3)
  {
    id v4 = [(PKDrawingPaletteView *)self annotationDelegate];
    uint64_t v5 = [v4 paletteViewSelectedAnnotationColor:self];
LABEL_3:
    id v25 = (id)v5;
LABEL_4:

    goto LABEL_17;
  }
  if (v3 == 4)
  {
    BOOL v14 = [(PKPaletteView *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v4 = [(PKPaletteView *)self delegate];
      uint64_t v5 = [v4 paletteViewCurrentSelectionColor:self];
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
    BOOL v6 = [(PKDrawingPaletteView *)self isEditingStrokeSelection];
    BOOL v7 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
    id v4 = v7;
    if (v6)
    {
      uint64_t v8 = [v7 tool];
      if (![v8 isLassoTool])
      {
        id v25 = 0;
LABEL_27:

        goto LABEL_4;
      }
      uint64_t v9 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
      if (![v9 supportsDisplayingSelectedColor])
      {
        id v25 = 0;
        goto LABEL_26;
      }
      int v10 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
      double v11 = [v10 tool];
      id v12 = [v11 inkingTool];
      char v13 = [v12 ink];
      id v25 = [v13 color];

LABEL_15:
LABEL_26:

      goto LABEL_27;
    }
    int v16 = [v7 supportsDisplayingSelectedColor];

    if (v16)
    {
      id v4 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
      uint64_t v8 = [v4 tool];
      uint64_t v9 = [v8 inkingTool];
      int v10 = [v9 ink];
      id v25 = [v10 color];
      goto LABEL_15;
    }
  }
  id v25 = 0;
LABEL_17:
  double v17 = [(PKDrawingPaletteView *)self contentView];
  id v18 = [v17 colorPickerView];
  [v18 setSelectedColor:v25];

  double v19 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  uint64_t v20 = [v19 configuration];
  v21 = (void *)v20;
  if (v20)
  {
    if (*(unsigned char *)(v20 + 18)) {
      BOOL v22 = *(unsigned char *)(v20 + 19) != 0;
    }
    else {
      BOOL v22 = 1;
    }
  }
  else
  {
    BOOL v22 = 0;
  }
  char v23 = [(PKDrawingPaletteView *)self contentView];
  __int16 v24 = [v23 colorPickerView];
  [v24 setSupportsAlpha:v22];
}

- (id)_selectedToolViewInToolPicker
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  int64_t v3 = [v2 toolPickerView];
  id v4 = [v3 selectedToolView];

  return v4;
}

- (BOOL)_isPaletteContentViewHidden
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  int64_t v3 = [v2 toolPickerView];
  char v4 = [v3 isHidden];

  return v4;
}

- (void)_updateToolPreviewPositionForEdge:(unint64_t)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  if (v5 && [(PKPaletteView *)self isToolPreviewInstalled])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v7 = [(PKPaletteView *)self toolPreviewCenterXConstraint];
    v29[0] = v7;
    uint64_t v8 = [(PKPaletteView *)self toolPreviewCenterYConstraint];
    v29[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v6 deactivateConstraints:v9];

    if (a3 == 8 || a3 == 2)
    {
      int v10 = [(PKPaletteView *)self toolPreview];
      double v11 = [v10 centerXAnchor];
      id v12 = [(PKPaletteView *)self containerView];
      char v13 = [v12 centerXAnchor];
      BOOL v14 = [v11 constraintEqualToAnchor:v13];
      [(PKPaletteView *)self setToolPreviewCenterXConstraint:v14];

      char v15 = [(PKPaletteView *)self toolPreview];
      int v16 = [v15 centerYAnchor];
      double v17 = [v5 centerYAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];
      [(PKPaletteView *)self setToolPreviewCenterYConstraint:v18];
    }
    else
    {
      double v19 = [(PKPaletteView *)self toolPreview];
      uint64_t v20 = [v19 centerXAnchor];
      v21 = [v5 centerXAnchor];
      BOOL v22 = [v20 constraintEqualToAnchor:v21];
      [(PKPaletteView *)self setToolPreviewCenterXConstraint:v22];

      char v15 = [(PKPaletteView *)self toolPreview];
      int v16 = [v15 centerYAnchor];
      double v17 = [(PKPaletteView *)self containerView];
      id v18 = [v17 centerYAnchor];
      char v23 = [v16 constraintEqualToAnchor:v18];
      [(PKPaletteView *)self setToolPreviewCenterYConstraint:v23];
    }
    __int16 v24 = (void *)MEMORY[0x1E4F28DC8];
    id v25 = [(PKPaletteView *)self toolPreviewCenterXConstraint];
    v28[0] = v25;
    __int16 v26 = [(PKPaletteView *)self toolPreviewCenterYConstraint];
    v28[1] = v26;
    objc_super v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v24 activateConstraints:v27];
  }
}

- (void)_updateToolPreviewContentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  id v8 = [v5 tool];

  BOOL v6 = [(PKPaletteView *)self toolPreview];
  [v6 showPreviewForTool:v8 animated:v3];

  BOOL v7 = [(PKPaletteView *)self toolPreview];
  [v7 setEdgeLocation:4];
}

- (void)undoRedoViewDidTapUndo:(id)a3
{
  char v4 = [(PKDrawingPaletteView *)self undoManager];
  [v4 undo];

  [(PKDrawingPaletteView *)self setNeedsLayout];

  +[PKTextInputUtilities markAnalyticsForUndo];
}

- (void)undoRedoViewDidTapRedo:(id)a3
{
  char v4 = [(PKDrawingPaletteView *)self undoManager];
  [v4 redo];

  [(PKDrawingPaletteView *)self setNeedsLayout];

  +[PKTextInputUtilities markAnalyticsForRedo];
}

- (UIWindowScene)windowScene
{
  id v2 = [(PKDrawingPaletteView *)self window];
  BOOL v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (void)windowFirstResponderController:(id)a3 didChangeFirstResponder:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  BOOL v7 = [v6 _responderWindow];
  id v8 = [v7 windowScene];
  uint64_t v9 = [(PKDrawingPaletteView *)self window];
  int v10 = [v9 windowScene];

  if (v8 != v10) {
    goto LABEL_9;
  }
  double v11 = [v21 firstResponder];
  int v12 = [v11 isNotesHandwritingResponder];

  if (v12)
  {
    [(PKDrawingPaletteView *)self _updateHandwritingAssistantItemsFromResponder:v6];
    char v13 = [(PKDrawingPaletteView *)self contentView];
    [v13 paletteViewStateDidChangeEnableKeyboardButtons:self];

    BOOL v14 = [(PKPaletteView *)self internalDelegate];
    [v14 paletteViewStateDidChangeEnableKeyboardButtons:self];
  }
  else
  {
    char v15 = [(PKDrawingPaletteView *)self selectedTool];
    int v16 = [v15 ink];
    char v17 = [v16 _isHandwritingInk];

    if (v17) {
      goto LABEL_7;
    }
    BOOL v14 = [(PKDrawingPaletteView *)self floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v14, @"First Responder is not for the handwriting tool");
  }

LABEL_7:
  id v18 = [(PKPaletteView *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(PKPaletteView *)self delegate];
    [v20 paletteViewFirstResponderDidUpdate:self];
  }
LABEL_9:
}

- (PKTextInputWindowFirstResponder)windowFirstResponder
{
  id v2 = [(PKDrawingPaletteView *)self firstResponderController];
  BOOL v3 = [v2 firstResponder];

  return (PKTextInputWindowFirstResponder *)v3;
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self firstResponderController];
  [v3 setPaletteFloatingMode:1];
}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self firstResponderController];
  [v3 setPaletteFloatingMode:0];
}

- (void)floatingKeyboardController:(id)a3 didChangeKeyboardType:(int64_t)a4
{
  uint64_t v5 = [(PKDrawingPaletteView *)self contentView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PKDrawingPaletteView *)self contentView];
    [v7 paletteViewStateDidChangeFloatingKeyboardType:self];
  }
}

- (BOOL)toolPicker:(id)a3 canSelectTool:(id)a4 fromTap:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [v7 tool];
  char v9 = [v8 isRulerTool];

  if (v9)
  {
    char v10 = 0;
  }
  else
  {
    double v11 = [(PKDrawingPaletteView *)self _hostingWindow];
    if (v5)
    {
      int v12 = [v7 tool];
      char v13 = 0;
      if ([v12 isGenerationTool] && v11)
      {
        BOOL v14 = +[PKGenerationModelAvailabilityController sharedInstance];
        char v13 = [v14 presentGreymatterAvailabilityAlertControllerInWindow:v11];
      }
    }
    else
    {
      char v13 = 0;
    }
    char v10 = v13 ^ 1;
  }
  return v10;
}

- (void)toolPicker:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = [(PKDrawingPaletteView *)self contentView];
  id v8 = [v7 colorPickerView];
  [v8 reloadColorsForCurrentColorPickerMode];

  [(PKDrawingPaletteView *)self _selectToolAtIndex:a5 updateUI:1 notifyDelegate:1];
}

- (void)toolPickerDidToggleRulerTool:(id)a3
{
  char v4 = [(PKPaletteView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PKPaletteView *)self delegate];
    [v6 paletteViewDidToggleRuler:self];
  }
}

- (double)toolPickerView:(id)a3 widthForToolAtIndex:(int64_t)a4 isCompactSize:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  char v9 = [(PKDrawingPaletteView *)self contentView];
  [v9 toolPickerView:v8 widthForToolAtIndex:a4 isCompactSize:v5];
  double v11 = v10;

  return v11;
}

- (CGRect)toolPickerViewSourceRectForPopoverPresentation:(id)a3 fromCorner:(unint64_t)a4
{
  [(PKDrawingPaletteView *)self bounds];

  return CGRectInset(*(CGRect *)&v4, 0.0, -5.0);
}

- (void)colorPickerDidChangeSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [a3 selectedColor];
  if (v8)
  {
    char v9 = v8;
    [(PKDrawingPaletteView *)self _setSelectedColor:v8 isFromExtendedColorPicker:v6 isContinuousColorSelection:v5];
    id v8 = v9;
  }
}

- (void)_setSelectedColor:(id)a3 isFromExtendedColorPicker:(BOOL)a4 isContinuousColorSelection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v22 = a3;
  id v8 = [(PKPaletteView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [(PKPaletteView *)self delegate];
    int v10 = [v9 paletteView:self shouldChangeSelectedToolColor:v22];

    if (!v10)
    {
      int v11 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (![(PKDrawingPaletteView *)self isEditingStrokeSelection]) {
    [(PKDrawingPaletteView *)self _setSelectedToolColor:v22 ignoreColorOpacity:!v6 isContinuousColorSelection:v5];
  }
  int v12 = [(PKDrawingPaletteView *)self selectedTool];
  int v13 = [v12 _isLassoTool];

  if (v13)
  {
    BOOL editingStrokeSelection = self->_editingStrokeSelection;
    char v15 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
    [v15 setSupportsDisplayingSelectedColor:editingStrokeSelection];

    [(PKDrawingPaletteView *)self _setSelectedToolColor:v22 ignoreColorOpacity:!v6 isContinuousColorSelection:v5];
  }
  int v11 = 0;
LABEL_10:
  int v16 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  char v17 = [v16 tool];
  if (([v17 isLassoTool] & 1) != 0
    || [(PKDrawingPaletteView *)self isEditingStrokeSelection])
  {
  }
  else
  {
    int v21 = v11 | [(PKDrawingPaletteView *)self isEditingExternalElementsSelection];

    if (v21 != 1) {
      goto LABEL_16;
    }
  }
  id v18 = [(PKPaletteView *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(PKPaletteView *)self delegate];
    [v20 paletteView:self didChangeColor:v22];
  }
LABEL_16:
  [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
  [(PKDrawingPaletteView *)self _updateToolPreviewContentsAnimated:0];
}

- (BOOL)colorPickerShouldDisplayColorSelection:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  char v4 = [v3 supportsDisplayingSelectedColor];

  return v4;
}

- (void)_reloadImageForToolItem:(id)a3
{
  id v15 = a3;
  NSUInteger v4 = [(NSArray *)self->_tools count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSArray *)self->_tools objectAtIndexedSubscript:v6];
      id v8 = [v7 _toolPickerItemIdentifier];
      char v9 = [v15 identifier];
      int v10 = [v8 isEqualToString:v9];

      if (v10) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    int v11 = [(PKDrawingPaletteView *)self contentView];
    int v12 = [v11 toolPickerView];
    int v13 = [v12 toolViews];
    BOOL v14 = [v13 objectAtIndexedSubscript:v6];
    [v14 _setToolImageNeedsReload];
  }
LABEL_7:
}

- (void)hostView:(id)a3 willDockPaletteToPosition:(int64_t)a4 prepareForExpansion:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v8 hostView:a3 willDockPaletteToPosition:a4 prepareForExpansion:a5];
  uint64_t v6 = [(PKDrawingPaletteView *)self contentView];
  id v7 = [v6 toolPickerView];
  [v7 updateClippingViewEdgesVisibility];
}

- (void)hostView:(id)a3 didDockPaletteToPosition:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v5 hostView:a3 didDockPaletteToPosition:a4];
  [(PKPaletteView *)self _saveOptions];
}

- (void)_willDockPaletteToEdge:(unint64_t)a3 prepareForExpansion:(BOOL)a4 isPaletteChangingOrientation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView _willDockPaletteToEdge:prepareForExpansion:isPaletteChangingOrientation:](&v12, sel__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation_);
  char v9 = [(PKDrawingPaletteView *)self contentView];
  [v9 setEdgeLocation:a3];

  int v10 = [(PKDrawingPaletteView *)self contentView];
  [v10 setCornerLocation:-1];

  [(PKDrawingPaletteView *)self setNeedsLayout];
  [(PKDrawingPaletteView *)self layoutIfNeeded];
  if (v6)
  {
    if (v5)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __96__PKDrawingPaletteView__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation___block_invoke;
      v11[3] = &unk_1E64C61E8;
      v11[4] = self;
      v11[5] = a3;
      [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v11];
    }
    else
    {
      [(PKDrawingPaletteView *)self _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:a3 needsContainerViewLayout:0];
      [(PKDrawingPaletteView *)self _updateToolPreviewPositionForEdge:a3];
      [(PKDrawingPaletteView *)self _updateToolPreviewContentsAnimated:0];
    }
  }
}

uint64_t __96__PKDrawingPaletteView__willDockPaletteToEdge_prepareForExpansion_isPaletteChangingOrientation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:*(void *)(a1 + 40) needsContainerViewLayout:0];
  [*(id *)(a1 + 32) _updateToolPreviewPositionForEdge:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateToolPreviewContentsAnimated:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_willDockPaletteToCorner:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKDrawingPaletteView;
  -[PKPaletteView _willDockPaletteToCorner:](&v8, sel__willDockPaletteToCorner_);
  BOOL v5 = [(PKDrawingPaletteView *)self contentView];
  [v5 dismissPalettePopoverWithCompletion:0];

  [(PKDrawingPaletteView *)self _updateToolPreviewPositionForEdge:[(PKPaletteView *)self lastPaletteEdgePositionWhileDragging]];
  [(PKDrawingPaletteView *)self _updateToolPreviewContentsAnimated:0];
  BOOL v6 = [(PKDrawingPaletteView *)self contentView];
  [v6 setCornerLocation:a3];

  id v7 = [(PKDrawingPaletteView *)self contentView];
  [v7 setEdgeLocation:15];
}

- (void)_centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:(unint64_t)a3 needsContainerViewLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  if (v28 && v4)
  {
    id v7 = [(PKPaletteView *)self containerView];
    [v7 layoutIfNeeded];
  }
  else if (!v28)
  {
    goto LABEL_10;
  }
  objc_super v8 = [(PKDrawingPaletteView *)self contentView];
  char v9 = [v8 toolPickerView];
  [v9 scrollSelectedToolViewToVisibleAnimated:0];

  int v10 = [(PKPaletteView *)self containerView];
  [v28 center];
  double v12 = v11;
  double v14 = v13;
  id v15 = [v28 superview];
  objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
  double v17 = v16;
  double v19 = v18;

  [(PKDrawingPaletteView *)self paletteSizeForEdge:a3];
  if (a3 == 8 || a3 == 2)
  {
    double v22 = v21 * 0.5 - v19;
    char v23 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
    [v23 setConstant:v22];

    __int16 v24 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
  }
  else
  {
    double v25 = v20 * 0.5 - v17;
    __int16 v26 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
    [v26 setConstant:v25];

    __int16 v24 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
  }
  objc_super v27 = v24;
  [v24 setConstant:0.0];

LABEL_10:
}

- (void)toolPreviewDidChangeToolColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [a3 toolColor];
  if (v6)
  {
    id v7 = v6;
    [(PKDrawingPaletteView *)self _setSelectedToolColor:v6 ignoreColorOpacity:0 isContinuousColorSelection:v4];
    [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
    BOOL v6 = v7;
  }
}

- (void)_didTapPlusButton:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PKDrawingPaletteView *)self plusButtonViewController];

  if (v4)
  {
    BOOL v5 = [(PKDrawingPaletteView *)self plusButtonViewController];
    [(PKDrawingPaletteView *)self _presentViewController:v5 asPopoverFromView:v6];
  }
  else
  {
    BOOL v5 = [(PKDrawingPaletteView *)self annotationDelegate];
    [v5 paletteViewDidSelectPlusButton:self];
  }
}

- (void)_didTapTextButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingPaletteView *)self textButtonViewController];
  [(PKDrawingPaletteView *)self _presentViewController:v5 asPopoverFromView:v4];
}

- (void)_didTapShapeButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingPaletteView *)self shapeButtonViewController];
  [(PKDrawingPaletteView *)self _presentViewController:v5 asPopoverFromView:v4];
}

- (void)_presentViewController:(id)a3 asPopoverFromItem:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKDrawingPaletteView__presentViewController_asPopoverFromItem___block_invoke;
  v8[3] = &unk_1E64CB700;
  id v9 = v6;
  id v7 = v6;
  -[PKDrawingPaletteView _presentViewController:configurationBlock:](self, a3, v8);
}

uint64_t __65__PKDrawingPaletteView__presentViewController_asPopoverFromItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSourceItem:*(void *)(a1 + 32)];
}

- (void)_presentViewController:(void *)a3 configurationBlock:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v7 = [a1 palettePopoverPresentingController];
    if (!v7) {
      goto LABEL_7;
    }
    objc_super v8 = (void *)v7;
    id v9 = v5;
    if ([v9 isBeingPresented])
    {

      goto LABEL_7;
    }
    int v10 = [v9 isBeingDismissed];

    if (v10)
    {
LABEL_7:
      double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        id v25 = v5;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Can't present view controller: %@", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_9;
    }
    [v9 setModalPresentationStyle:7];
    double v12 = [v9 popoverPresentationController];
    v6[2](v6, v12);

    double v13 = [v9 popoverPresentationController];
    [v13 setDelegate:a1];

    double v14 = [a1 traitCollection];
    id v15 = [a1 window];
    double v16 = [v15 windowScene];
    if (PKUseCompactSize(v14, v16))
    {
      uint64_t v17 = 2;
    }
    else
    {
      unint64_t v18 = [a1 palettePosition] - 1;
      if (v18 > 7) {
        uint64_t v17 = 15;
      }
      else {
        uint64_t v17 = qword_1C482C0C8[v18];
      }
    }
    double v19 = [v9 popoverPresentationController];
    [v19 setPermittedArrowDirections:v17];

    double v20 = [v9 popoverPresentationController];
    [v20 _setShouldDisableInteractionDuringTransitions:0];

    double v21 = [a1 palettePopoverPassthroughViews];
    double v22 = [v9 popoverPresentationController];
    [v22 setPassthroughViews:v21];

    char v23 = [v9 popoverPresentationController];
    [v23 _setIgnoresKeyboardNotifications:1];

    [a1 updatePalettePopover:v9];
    if ([a1 shouldPalettePresentPopover]
      && ([a1 isPalettePresentingPopover] & 1) == 0)
    {
      [a1 setPresentedPopoverViewController:v9];
      double v11 = [a1 palettePopoverPresentingController];
      [v11 presentViewController:v9 animated:1 completion:0];
LABEL_9:
    }
  }
}

- (void)_presentViewController:(id)a3 asPopoverFromView:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKDrawingPaletteView__presentViewController_asPopoverFromView___block_invoke;
  v8[3] = &unk_1E64CB700;
  id v9 = v6;
  id v7 = v6;
  -[PKDrawingPaletteView _presentViewController:configurationBlock:](self, a3, v8);
}

void __65__PKDrawingPaletteView__presentViewController_asPopoverFromView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 bounds];
  CGRect v7 = CGRectInset(v6, -5.0, -5.0);
  objc_msgSend(v4, "setSourceRect:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  [v4 setSourceView:*(void *)(a1 + 32)];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)additionalOptionsView:(id)a3 didToggleAutoHideOption:(BOOL)a4
{
}

- (void)additionalOptionsViewDidPressReturnKeyButton:(id)a3
{
}

- (void)additionalOptionsViewDidPressTapToRadarButton:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self tapToRadarCommand];
  [v3 execute];
}

- (id)keyboardSelectionMenuForAdditionalOptionsView:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self floatingKeyboardController];
  id v4 = -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v3);

  return v4;
}

- (void)_presentOrDismissFloatingKeyboard
{
  id v2 = [(PKDrawingPaletteView *)self floatingKeyboardController];
  -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v2);
}

- (void)contentViewDidSelectInputAssistantReturnKeyItem:(id)a3
{
}

- (id)keyboardSelectionMenuForContentView:(id)a3
{
  id v3 = [(PKDrawingPaletteView *)self floatingKeyboardController];
  id v4 = -[PKPaletteFloatingKeyboardController keyboardSelectionMenu](v3);

  return v4;
}

- (void)contentViewDidResize:(id)a3
{
  id v4 = [(PKPaletteView *)self internalDelegate];
  [v4 paletteViewStateDidChange:self];

  id v5 = [(PKPaletteView *)self delegate];
  [v5 paletteViewContentSizeDidChange:self];
}

- (void)_performPencilInteraction:(id)a3 preferredAction:(int64_t)a4
{
  CGRect v6 = [(PKDrawingPaletteView *)self windowScene];

  if (v6
    && ([(PKDrawingPaletteView *)self windowScene],
        CGRect v7 = objc_claimAutoreleasedReturnValue(),
        +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v7), objc_super v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 _paletteViewVisible], v8, v7, v9))
  {
    int v10 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Ignore pencil interaction", buf, 2u);
    }
  }
  else
  {
    double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v53 = 0;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Received pencil interaction", v53, 2u);
    }

    double v12 = [(PKPaletteView *)self hoverDelegate];
    [v12 paletteViewPencilDidTap:self];

    if ([(PKPaletteView *)self isVisible]
      && (unint64_t)([(PKPaletteView *)self palettePosition] - 1) <= 3)
    {
      double v12 = [(PKPaletteView *)self paletteViewHosting];
      double v13 = [v12 tooltipPresentationHandle];
      int v14 = 1;
    }
    else
    {
      int v14 = 0;
      double v13 = 0;
    }
    id v15 = [(PKDrawingPaletteView *)self contentView];
    double v16 = [v15 toolPickerView];
    [v16 setTooltipPresentationHandle:v13];

    if (v14)
    {
    }
    switch(a4)
    {
      case 1:
        [(PKDrawingPaletteView *)self _performPencilPreferredActionSwitchEraser];
        goto LABEL_16;
      case 2:
        [(PKDrawingPaletteView *)self _performPencilPreferredActionSwitchPrevious];
LABEL_16:
        uint64_t v17 = [(PKPaletteView *)self paletteViewHosting];
        unint64_t v18 = [v17 hostingView];

        double v19 = [(PKDrawingPaletteView *)self selectedToolView];
        double v20 = [v19 toolName];

        double v21 = [(PKPaletteView *)self hoverDelegate];
        [v21 paletteViewPencilDidTap:self];

        double v22 = [(PKPaletteView *)self _paletteViewHoverView];
        if (v22) {
          BOOL v23 = v18 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        char v24 = !v23;
        if (!v23)
        {
          [(PKPaletteView *)self _paletteViewHoverLocation];
          double v25 = *MEMORY[0x1E4F1DB30];
          double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          double v29 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v22, v18, v27, v28, *MEMORY[0x1E4F1DB30], v26);
          double v31 = v30;
          int64_t v32 = [(PKPaletteView *)self paletteViewHosting];
          v33 = [v32 tooltipPresentationHandle];
          unint64_t v34 = [(PKDrawingPaletteView *)self traitCollection];
          objc_msgSend(v33, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v20, v18, 4, v34, v29, v31, v25, v26, 28.0);
        }
        uint64_t v35 = [(PKPaletteView *)self hoverDelegate];
        [v35 paletteViewHoverDidSwitchToolsViaPencilInteraction:self];

        if ((v24 & 1) == 0
          && v18
          && [(PKPaletteView *)self isVisible]
          && (unint64_t)([(PKPaletteView *)self palettePosition] - 5) <= 3)
        {
          unint64_t v36 = [(PKPaletteView *)self palettePosition] - 1;
          int64_t v37 = [(PKPaletteView *)self palettePosition];
          if (v36 > 3)
          {
            if ((unint64_t)(v37 - 5) >= 2)
            {
              [(PKPaletteView *)self palettePosition];
              uint64_t v38 = 4;
            }
            else
            {
              uint64_t v38 = 1;
            }
          }
          else if ((unint64_t)(v37 - 1) >= 4)
          {
            uint64_t v38 = 0;
          }
          else
          {
            uint64_t v38 = qword_1C482C108[v37 - 1];
          }
          v41 = [(PKPaletteView *)self paletteViewHosting];
          v42 = [v41 tooltipPresentationHandle];
          [(PKDrawingPaletteView *)self bounds];
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          v51 = [(PKDrawingPaletteView *)self traitCollection];
          objc_msgSend(v42, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v20, self, v38, v51, v44, v46, v48, v50, 10.0);
        }
        int v40 = 0;
        goto LABEL_43;
      case 3:
        [(PKDrawingPaletteView *)self _performPencilPreferredActionShowColorPalette];
        goto LABEL_36;
      case 4:
        [(PKDrawingPaletteView *)self _performPencilPreferredActionShowInkAttributes];
        goto LABEL_36;
      default:
        double v39 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_DEFAULT, "Ignore Pencil interaction", v52, 2u);
        }

LABEL_36:
        int v40 = 1;
LABEL_43:
        if ([(PKPaletteView *)self isVisible]
          || ((v40 | ![(PKDrawingPaletteView *)self isPencilInteractionEnabledWhenNotVisible]) & 1) != 0)
        {
          return;
        }
        int v10 = [(PKPaletteView *)self internalDelegate];
        [v10 paletteViewShowFeedbackForToolChange:self];
        break;
    }
  }
}

- (void)pencilInteractionDidTap:(id)a3
{
  id v8 = a3;
  id v4 = +[PKStatisticsManager sharedStatisticsManager]();
  [MEMORY[0x1E4FB1A80] preferredTapAction];
  -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v4);

  id v5 = [(PKPaletteView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    CGRect v7 = [(PKPaletteView *)self delegate];
    [v7 paletteView:self didReceivePencilInteractionDidTap:v8];
  }
  -[PKDrawingPaletteView _performPencilInteraction:preferredAction:](self, "_performPencilInteraction:preferredAction:", v8, [MEMORY[0x1E4FB1A80] preferredTapAction]);
}

- (void)_pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl() && ![v6 _phase])
  {
    CGRect v7 = +[PKStatisticsManager sharedStatisticsManager]();
    [MEMORY[0x1E4FB1A80] preferredSqueezeAction];
    -[PKStatisticsManager recordPencilAction:doubleTap:]((uint64_t)v7);

    -[PKDrawingPaletteView _performPencilInteraction:preferredAction:](self, "_performPencilInteraction:preferredAction:", v8, [MEMORY[0x1E4FB1A80] preferredSqueezeAction]);
  }
}

- (void)_performPencilPreferredActionSwitchEraser
{
  BOOL v3 = [(PKDrawingPaletteView *)self _canHandlePencilInteraction];
  id v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Switch to or from eraser tool", v8, 2u);
    }

    [(PKDrawingPaletteView *)self dismissContextMenu];
    [(PKDrawingPaletteView *)self dismissPalettePopoverWithCompletion:0];
    BOOL v6 = (unint64_t)([(PKPaletteView *)self palettePosition] - 9) < 0xFFFFFFFFFFFFFFFCLL;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    CGRect v7 = [v4 toolPickerView];
    [v7 toggleSelectedToolAndEraserAnimated:v6];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }
}

- (void)_performPencilPreferredActionSwitchPrevious
{
  BOOL v3 = [(PKDrawingPaletteView *)self _canHandlePencilInteraction];
  id v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Switch to previous tool", v8, 2u);
    }

    [(PKDrawingPaletteView *)self dismissContextMenu];
    [(PKDrawingPaletteView *)self dismissPalettePopoverWithCompletion:0];
    BOOL v6 = (unint64_t)([(PKPaletteView *)self palettePosition] - 9) < 0xFFFFFFFFFFFFFFFCLL;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    CGRect v7 = [v4 toolPickerView];
    [v7 toggleSelectedToolAndLastSelectedToolAnimated:v6];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }
}

- (void)_performPencilPreferredActionShowColorPalette
{
  BOOL v3 = [(PKDrawingPaletteView *)self _canHandlePencilInteraction];
  id v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Show color palette", buf, 2u);
    }

    [(PKDrawingPaletteView *)self dismissContextMenu];
    if ((unint64_t)([(PKPaletteView *)self palettePosition] - 5) <= 3)
    {
      BOOL v6 = [(PKPaletteView *)self toolPreview];
      [v6 toggleColorSelectionPopover];

      return;
    }
    id v4 = [(PKDrawingPaletteView *)self contentView];
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke;
    v8[3] = &unk_1E64CB728;
    void v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke_2;
    v7[3] = &unk_1E64C61C0;
    [v4 _dismissPalettePopoverUsingConfirmationBlock:v8 completion:v7];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }
}

BOOL __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 contentView];
  id v5 = [v4 colorPickerView];

  return v5 != v3;
}

void __69__PKDrawingPaletteView__performPencilPreferredActionShowColorPalette__block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) showsLassoToolEditingView]) {
    goto LABEL_4;
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0
    || ([*(id *)(a1 + 32) delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 toggleLassoToolEditingViewColorPickerForPaletteView:*(void *)(a1 + 32)],
        v4,
        (v5 & 1) == 0))
  {
LABEL_4:
    id v6 = [*(id *)(a1 + 32) contentView];
    [v6 toggleColorSelectionPopover];
  }
}

- (void)_performPencilPreferredActionShowInkAttributes
{
  BOOL v3 = [(PKDrawingPaletteView *)self _canHandlePencilInteraction];
  id v4 = os_log_create("com.apple.pencilkit", "PKPalette");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Show ink attributes", buf, 2u);
    }

    [(PKDrawingPaletteView *)self dismissContextMenu];
    id v4 = [(PKDrawingPaletteView *)self contentView];
    id v6 = [v4 colorPickerView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PKDrawingPaletteView__performPencilPreferredActionShowInkAttributes__block_invoke;
    v7[3] = &unk_1E64C61C0;
    v7[4] = self;
    [v6 dismissPalettePopoverWithCompletion:v7];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Can't handle pencil interaction.", buf, 2u);
  }
}

void __70__PKDrawingPaletteView__performPencilPreferredActionShowInkAttributes__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _paletteViewHoverView];

  if (v2)
  {
    [*(id *)(a1 + 32) palettePopoverSourceRectToPresentViewController:0];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v13 = [*(id *)(a1 + 32) palettePopoverSourceView];
  }
  else
  {
    id v13 = 0;
    double v4 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v11 = [*(id *)(a1 + 32) contentView];
  double v12 = [v11 toolPickerView];
  objc_msgSend(v12, "toggleSelectedToolAttributesPopoverFromRect:inView:", v13, v4, v6, v8, v10);
}

- (BOOL)_canHandlePencilInteraction
{
  id v2 = self;
  if ([(PKPaletteView *)self isVisible])
  {
    double v3 = [(PKPaletteView *)v2 paletteViewHosting];
    LODWORD(v2) = [v3 isPaletteDragging] ^ 1;
  }
  else
  {
    if (![(PKDrawingPaletteView *)v2 isPencilInteractionEnabledWhenNotVisible]|| ([(PKPaletteView *)v2 delegate], double v4 = objc_claimAutoreleasedReturnValue(), v5 = objc_opt_respondsToSelector(), v4, (v5 & 1) == 0))
    {
      LOBYTE(v2) = 0;
      return (char)v2;
    }
    double v3 = [(PKPaletteView *)v2 delegate];
    LOBYTE(v2) = [v3 shouldHandlePencilInteractionWhenNotVisible:v2];
  }

  return (char)v2;
}

- (void)configureForDockedAtCorner
{
  v3.receiver = self;
  v3.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v3 configureForDockedAtCorner];
  [(PKDrawingPaletteView *)self _centerPaletteContainerSubviewToCurrentlySelectedToolForEdge:[(PKPaletteView *)self lastPaletteEdgePositionWhileDragging] needsContainerViewLayout:0];
  [(PKDrawingPaletteView *)self _updateToolPreviewPositionForEdge:[(PKPaletteView *)self lastPaletteEdgePositionWhileDragging]];
  [(PKDrawingPaletteView *)self _updateToolPreviewContentsAnimated:0];
}

- (void)configureForDockedAtEdge:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v6 configureForDockedAtEdge:a3];
  double v4 = [(PKPaletteView *)self paletteContainerCenterXConstraint];
  [v4 setConstant:0.0];

  char v5 = [(PKPaletteView *)self paletteContainerCenterYConstraint];
  [v5 setConstant:0.0];
}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v14 willStartAppearanceAnimation:a3];
  [(PKDrawingPaletteView *)self _updateKeyboardSceneDelegateInputAssistantSupressionState];
  double v4 = [(PKDrawingPaletteView *)self contentView];
  [v4 paletteViewStateDidChangeIsVisible:self];

  if ((unint64_t)([(PKPaletteView *)self palettePosition] - 5) <= 3) {
    [(PKDrawingPaletteView *)self configureForDockedAtCorner];
  }
  char v5 = [(PKDrawingPaletteView *)self contentView];
  objc_super v6 = [v5 layer];
  [v6 setShouldRasterize:1];

  double v7 = [(PKDrawingPaletteView *)self contentView];
  double v8 = [v7 layer];
  [v8 setPreloadsCache:1];

  double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = v10;
  double v12 = [(PKDrawingPaletteView *)self contentView];
  id v13 = [v12 layer];
  [v13 setRasterizationScale:v11];
}

- (void)didEndAppearanceAnimation
{
  v9.receiver = self;
  v9.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v9 didEndAppearanceAnimation];
  objc_super v3 = [(PKDrawingPaletteView *)self contentView];
  double v4 = [v3 layer];
  [v4 setShouldRasterize:0];

  char v5 = [(PKDrawingPaletteView *)self contentView];
  objc_super v6 = [v5 layer];
  [v6 setPreloadsCache:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKDrawingPaletteView_didEndAppearanceAnimation__block_invoke;
  block[3] = &unk_1E64C61C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (![(PKPaletteView *)self isVisible])
  {
    double v7 = [(PKDrawingPaletteView *)self floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v7, @"Cleaning up keyboard state as palette isn't visible");

    [(PKDrawingPaletteView *)self setSelectedAnnotationType:0];
  }
}

uint64_t __49__PKDrawingPaletteView_didEndAppearanceAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateKeyboardSceneDelegateInputAssistantSupressionState];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateHandwritingAssistantItems];
}

- (void)startOpacityEditing
{
  v36[4] = *MEMORY[0x1E4F143B8];
  if (![(PKDrawingPaletteView *)self isEditingOpacity])
  {
    objc_super v3 = [(PKDrawingPaletteView *)self opacityEditingView];

    if (!v3)
    {
      double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      opacityEditingView = self->_opacityEditingView;
      self->_opacityEditingView = v4;

      objc_super v6 = [(PKDrawingPaletteView *)self opacityEditingView];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v7 = [(PKDrawingPaletteView *)self opacityEditingView];
      [(PKDrawingPaletteView *)self addSubview:v7];

      double v8 = [(PKDrawingPaletteView *)self opacityEditingView];
      [v8 setAlpha:0.0];

      double v19 = (void *)MEMORY[0x1E4F28DC8];
      double v31 = [(PKDrawingPaletteView *)self opacityEditingView];
      double v29 = [v31 bottomAnchor];
      double v30 = [(PKPaletteView *)self containerView];
      double v28 = [v30 bottomAnchor];
      double v27 = [v29 constraintEqualToAnchor:v28];
      v36[0] = v27;
      double v26 = [(PKDrawingPaletteView *)self opacityEditingView];
      char v24 = [v26 leftAnchor];
      double v25 = [(PKPaletteView *)self containerView];
      BOOL v23 = [v25 leftAnchor];
      double v22 = [v24 constraintEqualToAnchor:v23];
      v36[1] = v22;
      double v21 = [(PKDrawingPaletteView *)self opacityEditingView];
      double v20 = [v21 rightAnchor];
      objc_super v9 = [(PKPaletteView *)self containerView];
      double v10 = [v9 rightAnchor];
      double v11 = [v20 constraintEqualToAnchor:v10];
      v36[2] = v11;
      double v12 = [(PKDrawingPaletteView *)self opacityEditingView];
      id v13 = [v12 topAnchor];
      objc_super v14 = [(PKPaletteView *)self containerView];
      id v15 = [v14 topAnchor];
      double v16 = [v13 constraintEqualToAnchor:v15];
      v36[3] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
      [v19 activateConstraints:v17];
    }
    objc_initWeak(&location, self);
    unint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __43__PKDrawingPaletteView_startOpacityEditing__block_invoke;
    v33[3] = &unk_1E64C5998;
    objc_copyWeak(&v34, &location);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __43__PKDrawingPaletteView_startOpacityEditing__block_invoke_2;
    v32[3] = &unk_1E64C6730;
    v32[4] = self;
    [v18 animateWithDuration:6 delay:v33 options:v32 animations:0.5 completion:0.0];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
}

void __43__PKDrawingPaletteView_startOpacityEditing__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained containerView];
  [v3 setAlpha:0.0];

  id v5 = objc_loadWeakRetained(v1);
  double v4 = [v5 opacityEditingView];
  [v4 setAlpha:1.0];
}

uint64_t __43__PKDrawingPaletteView_startOpacityEditing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsEditingOpacity:1];
}

- (void)endOpacityEditing
{
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PKDrawingPaletteView_endOpacityEditing__block_invoke;
  v5[3] = &unk_1E64C5998;
  objc_copyWeak(&v6, &location);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PKDrawingPaletteView_endOpacityEditing__block_invoke_2;
  v4[3] = &unk_1E64C6730;
  v4[4] = self;
  [v3 animateWithDuration:6 delay:v5 options:v4 animations:0.5 completion:0.0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__PKDrawingPaletteView_endOpacityEditing__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained containerView];
  [v3 setAlpha:1.0];

  id v5 = objc_loadWeakRetained(v1);
  double v4 = [v5 opacityEditingView];
  [v4 setAlpha:0.0];
}

uint64_t __41__PKDrawingPaletteView_endOpacityEditing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsEditingOpacity:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDrawingPaletteView;
  [(PKPaletteView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 horizontalSizeClass];
  id v6 = [(PKDrawingPaletteView *)self traitCollection];
  if (v5 == [v6 horizontalSizeClass])
  {
    uint64_t v7 = [v4 verticalSizeClass];
    double v8 = [(PKDrawingPaletteView *)self traitCollection];
    uint64_t v9 = [v8 verticalSizeClass];

    if (v7 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKDrawingPaletteView *)self dismissPalettePopoverWithCompletion:0];
  [(PKDrawingPaletteView *)self _updateUI];
  [(PKDrawingPaletteView *)self setNeedsLayout];
  [(PKDrawingPaletteView *)self setNeedsUpdateConstraints];
LABEL_6:
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke;
  v7[3] = &unk_1E64C6B40;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PKDrawingPaletteView;
  id v5 = v4;
  [(PKPaletteView *)&v6 dismissPalettePopoverWithCompletion:v7];
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  if ([*(id *)(a1 + 32) isPalettePresentingPopover])
  {
    objc_super v3 = [*(id *)(a1 + 32) palettePopoverPresentingController];
    id v4 = [v3 presentedViewController];
    char v5 = [v4 isBeingDismissed];

    if ((v5 & 1) == 0)
    {
      objc_super v6 = [MEMORY[0x1E4FB1900] activeInstance];
      char v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0
        || ([MEMORY[0x1E4FB1900] activeInstance],
            id v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v8 isDictationPopoverPresented],
            v8,
            (v9 & 1) == 0))
      {
        objc_super v10 = [*(id *)(a1 + 32) palettePopoverPresentingController];
        uint64_t v11 = [v10 presentedViewController];
        if (v11)
        {
          double v12 = (void *)v11;
          id v13 = [*(id *)(a1 + 32) palettePopoverPresentingController];
          objc_super v14 = [v13 presentedViewController];
          char v15 = [v14 isBeingDismissed];

          if ((v15 & 1) == 0)
          {
            dispatch_group_enter(v2);
            objc_initWeak(&location, *(id *)(a1 + 32));
            double v16 = [*(id *)(a1 + 32) palettePopoverPresentingController];
            uint64_t v17 = [v16 presentedViewController];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_2;
            v32[3] = &unk_1E64CB750;
            v33 = v2;
            objc_copyWeak(&v34, &location);
            [v17 dismissViewControllerAnimated:1 completion:v32];

            objc_destroyWeak(&v34);
            objc_destroyWeak(&location);
          }
        }
        else
        {
        }
        unint64_t v18 = [*(id *)(a1 + 32) presentedPopoverViewController];

        if (v18)
        {
          dispatch_group_enter(v2);
          objc_initWeak(&location, *(id *)(a1 + 32));
          double v19 = [*(id *)(a1 + 32) presentedPopoverViewController];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_3;
          void v29[3] = &unk_1E64CB750;
          double v30 = v2;
          objc_copyWeak(&v31, &location);
          [v19 dismissViewControllerAnimated:1 completion:v29];

          objc_destroyWeak(&v31);
          objc_destroyWeak(&location);
        }
        dispatch_group_enter(v2);
        double v20 = [*(id *)(a1 + 32) contentView];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_4;
        v27[3] = &unk_1E64C61C0;
        double v21 = v2;
        double v28 = v21;
        [v20 dismissPalettePopoverWithCompletion:v27];

        double v22 = [*(id *)(a1 + 32) annotationDelegate];

        if (v22)
        {
          dispatch_group_enter(v21);
          BOOL v23 = [*(id *)(a1 + 32) annotationDelegate];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_5;
          v25[3] = &unk_1E64C61C0;
          double v26 = v21;
          [v23 dismissPalettePopoverWithCompletion:v25];
        }
      }
    }
  }
  char v24 = *(void **)(a1 + 40);
  if (v24) {
    dispatch_group_notify(v2, MEMORY[0x1E4F14428], v24);
  }
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPresentedPopoverViewController:0];
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPresentedPopoverViewController:0];
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_4(uint64_t a1)
{
}

void __60__PKDrawingPaletteView_dismissPalettePopoverWithCompletion___block_invoke_5(uint64_t a1)
{
}

- (CGRect)plusButtonFrame
{
  objc_super v3 = [(PKDrawingPaletteView *)self contentView];
  [v3 plusButtonFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(PKDrawingPaletteView *)self contentView];
  -[PKDrawingPaletteView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)setContextEditingMode:(int64_t)a3
{
  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 setContextEditingMode:self->_contextEditingMode];
  }
}

- (UIView)contextualEditingView
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  objc_super v3 = [v2 contextualEditingView];

  return (UIView *)v3;
}

- (UIView)lassoToolEditingView
{
  id v2 = [(PKDrawingPaletteView *)self contentView];
  objc_super v3 = [v2 lassoToolEditingView];

  return (UIView *)v3;
}

- (BOOL)hasHandwritingTool
{
  return [(PKDrawingPaletteView *)self _hasToolWithIdentifier:@"com.apple.ink.handwriting"];
}

- (BOOL)_hasToolWithIdentifier:(id)a3
{
  id v4 = a3;
  tools = self->_tools;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PKDrawingPaletteView__hasToolWithIdentifier___block_invoke;
  v8[3] = &unk_1E64CB778;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(tools) = [(NSArray *)tools indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)tools;
}

uint64_t __47__PKDrawingPaletteView__hasToolWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 ink];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (BOOL)isHandwritingToolSelected
{
  id v2 = [(PKDrawingPaletteView *)self selectedTool];
  objc_super v3 = [v2 ink];
  char v4 = [v3 _isHandwritingInk];

  return v4;
}

- (void)handwritingEducationPaneSettingsDidChange
{
  id v3 = [(PKDrawingPaletteView *)self contentView];
  [v3 paletteViewStateDidChange:self];
}

- (BOOL)canShowResetHandwritingEducationPane
{
  id v2 = +[PKHandwritingEducationPaneSettings sharedInstance]();
  char v3 = -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v2);

  return v3;
}

- (void)_updateKeyboardSceneDelegateInputAssistantSupressionState
{
  if ([(PKDrawingPaletteView *)self isHandwritingToolSelected]) {
    BOOL v3 = [(PKPaletteView *)self isVisible];
  }
  else {
    BOOL v3 = 0;
  }
  id v6 = [(PKDrawingPaletteView *)self window];
  char v4 = [v6 windowScene];
  uint64_t v5 = [v4 keyboardSceneDelegate];
  [v5 setShouldSuppressInputAssistantUpdates:v3];
}

- (void)updateHandwritingAssistantItems
{
  id v3 = [(PKDrawingPaletteView *)self _currentFirstResponder];
  [(PKDrawingPaletteView *)self _updateHandwritingAssistantItemsFromResponder:v3];
}

- (void)_updateHandwritingAssistantItemsFromResponder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKDrawingPaletteView *)self inputAssistantButtonProvider];
  id v6 = [v5 inputAssistantItem];
  id v31 = [v4 inputAssistantItem];

  double v7 = [(PKDrawingPaletteView *)self inputAssistantButtonProvider];
  double v8 = [v7 inputAssistantItem];
  id v9 = [v8 leadingBarButtonGroups];
  double v10 = [v4 inputAssistantItem];
  double v11 = [v10 leadingBarButtonGroups];
  unint64_t v12 = v9;
  unint64_t v13 = v11;
  double v14 = (void *)v13;
  int64_t v32 = v6;
  if (!(v12 | v13)) {
    goto LABEL_2;
  }
  if (v12 && v13)
  {
    char v16 = [(id)v12 isEqualToArray:v13];

    if (v16)
    {
LABEL_2:
      int v15 = 1;
      goto LABEL_14;
    }
  }
  else
  {
  }
  double v30 = [(PKDrawingPaletteView *)self inputAssistantButtonProvider];
  double v29 = [v30 inputAssistantItem];
  double v17 = [v29 trailingBarButtonGroups];
  double v28 = [v4 inputAssistantItem];
  double v18 = [v28 trailingBarButtonGroups];
  unint64_t v19 = v17;
  unint64_t v20 = v18;
  double v21 = (void *)v20;
  if (v19 | v20)
  {
    int v15 = 0;
    if (v19 && v20) {
      int v15 = [(id)v19 isEqualToArray:v20];
    }
  }
  else
  {
    int v15 = 1;
  }

LABEL_14:
  double v22 = [v4 inputAssistantItem];
  double v23 = [(PKDrawingPaletteView *)self inputAssistantButtonProvider];
  [v23 setInputAssistantItem:v22];

  if (v32 != v31 || v15)
  {
    double v24 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = -[NSObject _pkDebugStringRepresentation](v4);
      *(_DWORD *)buf = 138412290;
      id v34 = v25;
      _os_log_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEFAULT, "Input assistant items did change from responder: %@", buf, 0xCu);
    }
    double v26 = [(PKDrawingPaletteView *)self contentView];
    [v26 paletteViewStateDidChangeInputAssistantItems:self];

    double v27 = [(PKPaletteView *)self internalDelegate];
    [v27 paletteViewStateDidChangeInputAssistantItems:self];
  }
}

- (id)_currentFirstResponder
{
  id v3 = [(PKPaletteView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(PKPaletteView *)self delegate];
    id v6 = [v5 paletteViewCurrentFirstResponder:self];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setTools:(id)a3
{
}

- (void)_setTools:(id)a3 resetSelectedTool:(BOOL)a4 updateUI:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v21 = a3;
  if ((-[NSArray isEqual:](self->_tools, "isEqual:") & 1) == 0)
  {
    double v10 = (NSArray *)[v21 copy];
    tools = self->_tools;
    self->_tools = v10;

    if (v8) {
      self->_unint64_t indexOfSelectedTool = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v7) {
      [(PKDrawingPaletteView *)self _updateUIReloadTools:1];
    }
  }
  if (v6)
  {
    unint64_t v12 = self->_toolsWhenLastNotifyingDelegate;
    unint64_t v13 = (unint64_t)v21;
    if (v13 | v12)
    {
      double v14 = (void *)v13;
      if (v13 && v12)
      {
        BOOL v15 = [(id)v12 isEqualToArray:v13];

        if (v15) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      char v16 = (NSArray *)[v14 copy];
      toolsWhenLastNotifyingDelegate = self->_toolsWhenLastNotifyingDelegate;
      self->_toolsWhenLastNotifyingDelegate = v16;

      double v18 = [(PKPaletteView *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        unint64_t v20 = [(PKPaletteView *)self delegate];
        [v20 paletteViewToolsDidChange:self];
      }
    }
  }
LABEL_15:
}

- (void)_replaceToolAtIndex:(unint64_t)a3 withTool:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([(PKDrawingPaletteView *)self _canReplaceToolAtIndex:a3 withTool:v8])
  {
    id v9 = (void *)[(NSArray *)self->_tools mutableCopy];
    [v9 replaceObjectAtIndex:a3 withObject:v8];
    double v10 = (void *)[v9 copy];
    [(PKDrawingPaletteView *)self _setTools:v10 resetSelectedTool:0 updateUI:0 notifyDelegate:v5];
  }
  else
  {
    double v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      unint64_t v13 = a3;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Can't replace tool at index: %lu with tool: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)_canReplaceToolAtIndex:(unint64_t)a3 withTool:(id)a4
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL
      && [(NSArray *)self->_tools indexOfObjectIdenticalTo:a4] != a3;
}

- (void)selectToolAtIndex:(unint64_t)a3
{
}

- (void)_selectToolAtIndex:(unint64_t)a3 updateUI:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_indexOfSelectedTool != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    if (-[PKDrawingPaletteView _canSelectToolAtIndex:](self, "_canSelectToolAtIndex:"))
    {
      self->_unint64_t indexOfSelectedTool = a3;
      if (v6)
      {
        [(PKDrawingPaletteView *)self _updateUI];
        id v9 = [(PKDrawingPaletteView *)self contentView];
        [v9 paletteViewStateDidChangeSelectedTool:self];
      }
      if (v5)
      {
        double v10 = [(PKPaletteView *)self delegate];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          id v14 = [(NSArray *)self->_tools objectAtIndex:self->_indexOfSelectedTool];
          int v12 = [(PKPaletteView *)self delegate];
          [v12 paletteView:self didSelectTool:v14 atIndex:self->_indexOfSelectedTool];
        }
      }
    }
    else
    {
      unint64_t v13 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = a3;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Can't select tool at index: %lu", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_canSelectToolAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tools count] > a3;
}

- (PKTool)selectedTool
{
  if (self->_indexOfSelectedTool == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = -[NSArray objectAtIndex:](self->_tools, "objectAtIndex:");
  }

  return (PKTool *)v2;
}

- (PKPaletteToolView)selectedToolView
{
  id v3 = [(PKDrawingPaletteView *)self selectedTool];

  if (v3)
  {
    char v4 = [(PKDrawingPaletteView *)self _selectedToolViewInToolPicker];
  }
  else
  {
    char v4 = 0;
  }

  return (PKPaletteToolView *)v4;
}

- (void)setInterItemToolsSpacingInCompactSize:(double)a3
{
  if (vabdd_f64(self->_interItemToolsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->_interItemToolsSpacingInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (void)setInterItemUndoRedoButtonsSpacingInCompactSize:(double)a3
{
  if (vabdd_f64(self->_interItemUndoRedoButtonsSpacingInCompactSize, a3) >= 0.00999999978)
  {
    self->_interItemUndoRedoButtonsSpacingInCompactSize = a3;
    id v4 = [(PKDrawingPaletteView *)self contentView];
    [v4 paletteViewStateDidChange:self];
  }
}

- (int64_t)numberOfToolsInToolPickerView:(id)a3
{
  return [(NSArray *)self->_tools count];
}

- (id)toolPickerView:(id)a3 viewForToolAtIndex:(int64_t)a4
{
  BOOL v5 = [(NSArray *)self->_tools objectAtIndex:a4];
  BOOL v6 = -[PKPaletteToolViewFactory makePaletteToolViewForTool:]((uint64_t)self->_toolViewFactory, v5);
  [v6 addTarget:self action:sel__toolViewStateDidChange_ forControlEvents:4096];

  return v6;
}

- (void)_toolViewStateDidChange:(id)a3
{
  id v4 = [a3 tool];
  BOOL v5 = [(NSArray *)self->_tools objectAtIndexedSubscript:[(PKDrawingPaletteView *)self indexOfSelectedTool]];
  id v6 = +[PKToolFromPaletteTool toolByApplyingPropertiesFromPaletteTool:v4 toTool:v5];

  [(PKDrawingPaletteView *)self _replaceToolAtIndex:[(PKDrawingPaletteView *)self indexOfSelectedTool] withTool:v6 notifyDelegate:1];
  [(PKDrawingPaletteView *)self updateColorPickerSelectedColor];
}

- (unint64_t)_indexOfGenerationTool
{
  return [(PKDrawingPaletteView *)self _indexOfToolPassingTest:&__block_literal_global_94];
}

uint64_t __46__PKDrawingPaletteView__indexOfGenerationTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ink];
  uint64_t v3 = [v2 _isGenerationTool];

  return v3;
}

- (unint64_t)_indexOfToolPassingTest:(id)a3
{
  id v4 = a3;
  tools = self->_tools;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PKDrawingPaletteView__indexOfToolPassingTest___block_invoke;
  v9[3] = &unk_1E64C60B0;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSArray *)tools indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __48__PKDrawingPaletteView__indexOfToolPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_paletteToolViewAtIndex:(unint64_t)a3
{
  id v4 = [(PKDrawingPaletteView *)self contentView];
  BOOL v5 = [v4 toolPickerView];
  id v6 = [v5 toolViews];
  unint64_t v7 = [v6 objectAtIndex:a3];

  return v7;
}

- (void)_scrollToolViewAtIndex:(unint64_t)a3 toVisibleAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PKDrawingPaletteView *)self contentView];
  id v6 = [v7 toolPickerView];
  [v6 scrollToolViewAtIndex:a3 toVisibleAnimated:v4];
}

- (void)showImageWandTipWithController:(id)a3
{
  id v4 = a3;
  if ([v4 tipStatusIsInvalid])
  {
    BOOL v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Unable to present Image Wand Tip; invalid";
LABEL_13:
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([v4 tipStatusIsPending])
  {
    BOOL v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Unable to present Image Wand Tip; pending";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (([v4 tipStatusIsAvailable] & 1) == 0)
  {
    BOOL v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Unable to present Image Wand Tip; unavailable";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v7 = [(PKPaletteView *)self paletteViewHosting];
  int v8 = [v7 isPaletteDragging];

  if (v8)
  {
    BOOL v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Unable to present Image Wand Tip; palette is dragging";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  unint64_t v9 = [(PKDrawingPaletteView *)self _indexOfGenerationTool];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v6 = "Unable to present Image Wand Tip; image wand tool not found";
    goto LABEL_13;
  }
  unint64_t v10 = v9;
  unint64_t v11 = [(PKPaletteView *)self palettePosition] - 1;
  BOOL v12 = v11 < 4;
  if (v11 <= 3)
  {
    unint64_t v13 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Scroll Image Wand Tool to visible", buf, 2u);
    }

    [(PKDrawingPaletteView *)self _scrollToolViewAtIndex:v10 toVisibleAnimated:1];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PKDrawingPaletteView_showImageWandTipWithController___block_invoke;
  v14[3] = &unk_1E64CB7A0;
  BOOL v17 = v12;
  v14[4] = self;
  unint64_t v16 = v10;
  id v15 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v14);

LABEL_15:
}

void __55__PKDrawingPaletteView_showImageWandTipWithController___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = [v3 _paletteToolViewAtIndex:*(void *)(a1 + 48)];
LABEL_3:
    BOOL v5 = (void *)v4;

    id v2 = v5;
    goto LABEL_4;
  }
  if ((unint64_t)([v3 palettePosition] - 5) <= 3
    && [*(id *)(a1 + 32) isToolPreviewInstalled])
  {
    uint64_t v4 = [*(id *)(a1 + 32) toolPreview];
    goto LABEL_3;
  }
LABEL_4:
  id v6 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Show image wand tip", v15, 2u);
  }

  id v7 = [*(id *)(a1 + 32) window];
  int v8 = [v7 windowScene];
  unint64_t v9 = [v8 windows];
  unint64_t v10 = [v9 firstObject];
  unint64_t v11 = [v10 tintColor];

  BOOL v12 = *(void **)(a1 + 40);
  unint64_t v13 = [*(id *)(a1 + 32) palettePopoverPresentingController];
  id v14 = [*(id *)(a1 + 32) palettePopoverPassthroughViews];
  objc_msgSend(v12, "showTipWithPresentationViewController:sourceItem:passthroughViews:permittedArrowDirections:tintColor:animated:", v13, v2, v14, objc_msgSend(*(id *)(a1 + 32), "palettePopoverPermittedArrowDirections"), v11, 1);
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)isFingerDrawsOptionEnabled
{
  return self->_fingerDrawsOptionEnabled;
}

- (BOOL)shouldHideHoverPreviewToggle
{
  return self->_shouldHideHoverPreviewToggle;
}

- (void)setShouldHideHoverPreviewToggle:(BOOL)a3
{
  self->_shouldHideHoverPreviewToggle = a3;
}

- (BOOL)showsPlusButton
{
  return self->_showsPlusButton;
}

- (UIViewController)plusButtonViewController
{
  return self->_plusButtonViewController;
}

- (BOOL)showsTextButton
{
  return self->_showsTextButton;
}

- (UIViewController)textButtonViewController
{
  return self->_textButtonViewController;
}

- (void)setTextButtonViewController:(id)a3
{
}

- (BOOL)showsShapeButton
{
  return self->_showsShapeButton;
}

- (UIViewController)shapeButtonViewController
{
  return self->_shapeButtonViewController;
}

- (void)setShapeButtonViewController:(id)a3
{
}

- (NSArray)tools
{
  return self->_tools;
}

- (unint64_t)indexOfSelectedTool
{
  return self->_indexOfSelectedTool;
}

- (double)interItemToolsSpacingInCompactSize
{
  return self->_interItemToolsSpacingInCompactSize;
}

- (double)interItemUndoRedoButtonsSpacingInCompactSize
{
  return self->_interItemUndoRedoButtonsSpacingInCompactSize;
}

- (BOOL)isPencilInteractionEnabledWhenNotVisible
{
  return self->_pencilInteractionEnabledWhenNotVisible;
}

- (void)setPencilInteractionEnabledWhenNotVisible:(BOOL)a3
{
  self->_pencilInteractionEnabledWhenNotVisible = a3;
}

- (BOOL)wantsClearBackgroundColorInCompactSize
{
  return self->_wantsClearBackgroundColorInCompactSize;
}

- (BOOL)wantsUndoRedoButtonsVisibleInCompactSize
{
  return self->_wantsUndoRedoButtonsVisibleInCompactSize;
}

- (BOOL)wantsEllipsisButtonVisibleInCompactSize
{
  return self->_wantsEllipsisButtonVisibleInCompactSize;
}

- (BOOL)wantsBottomLineDividerVisibleInCompactSize
{
  return self->_wantsBottomLineDividerVisibleInCompactSize;
}

- (BOOL)useEqualSpacingLayoutInCompactSize
{
  return self->_useEqualSpacingLayoutInCompactSize;
}

- (BOOL)wantsMulticolorSwatchShadowInCompactSize
{
  return self->_wantsMulticolorSwatchShadowInCompactSize;
}

- (BOOL)wantsUndoRedoButtonsShadowInCompactSize
{
  return self->_wantsUndoRedoButtonsShadowInCompactSize;
}

- (PKPaletteContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactContentViewHeightConstraint
{
  return self->_compactContentViewHeightConstraint;
}

- (void)setCompactContentViewHeightConstraint:(id)a3
{
}

- (UIView)bottomLineDividerView
{
  return self->_bottomLineDividerView;
}

- (void)setBottomLineDividerView:(id)a3
{
}

- (BOOL)isEditingOpacity
{
  return self->_isEditingOpacity;
}

- (void)setIsEditingOpacity:(BOOL)a3
{
  self->_isEditingOpacitdouble y = a3;
}

- (double)interItemUndoRedoButtonsSpacing
{
  return self->_interItemUndoRedoButtonsSpacing;
}

- (void)setInterItemUndoRedoButtonsSpacing:(double)a3
{
  self->_interItemUndoRedoButtonsSpacing = a3;
}

- (PKTextInputWindowFirstResponderController)firstResponderController
{
  return self->_firstResponderController;
}

- (void)setFirstResponderController:(id)a3
{
}

- (PKPaletteInputAssistantButtonProvider)inputAssistantButtonProvider
{
  return self->_inputAssistantButtonProvider;
}

- (void)setInputAssistantButtonProvider:(id)a3
{
}

- (UIViewController)presentedPopoverViewController
{
  return self->_presentedPopoverViewController;
}

- (void)setPresentedPopoverViewController:(id)a3
{
}

- (BOOL)isQuickNoteUI
{
  return self->_isQuickNoteUI;
}

- (void)setIsQuickNoteUI:(BOOL)a3
{
  self->_isQuickNoteUI = a3;
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (UIWindow)_hostingWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__hostingWindow);

  return (UIWindow *)WeakRetained;
}

- (void)set_hostingWindow:(id)a3
{
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (PKPaletteTapToRadarCommand)tapToRadarCommand
{
  return self->_tapToRadarCommand;
}

- (void)setTapToRadarCommand:(id)a3
{
}

- (PKPaletteFloatingKeyboardController)floatingKeyboardController
{
  return self->_floatingKeyboardController;
}

- (void)setFloatingKeyboardController:(id)a3
{
}

- (PKPaletteViewAnnotationDelegate)annotationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationDelegate);

  return (PKPaletteViewAnnotationDelegate *)WeakRetained;
}

- (int64_t)selectedAnnotationType
{
  return self->_selectedAnnotationType;
}

- (UIView)opacityEditingView
{
  return self->_opacityEditingView;
}

- (BOOL)showsLassoToolEditingView
{
  return self->_showsLassoToolEditingView;
}

- (NSString)lassoToolEditingViewIdentifier
{
  return self->_lassoToolEditingViewIdentifier;
}

- (BOOL)isEditingStrokeSelection
{
  return self->_editingStrokeSelection;
}

- (BOOL)isEditingTextSelection
{
  return self->_editingTextSelection;
}

- (BOOL)isEditingExternalElementsSelection
{
  return self->_editingExternalElementsSelection;
}

- (BOOL)colorSwatchesVisible
{
  return self->_colorSwatchesVisible;
}

- (BOOL)prefersLargeContextualEditingUI
{
  return self->_prefersLargeContextualEditingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);
  objc_storeStrong((id *)&self->_opacityEditingView, 0);
  objc_destroyWeak((id *)&self->_annotationDelegate);
  objc_storeStrong((id *)&self->_floatingKeyboardController, 0);
  objc_storeStrong((id *)&self->_tapToRadarCommand, 0);
  objc_destroyWeak((id *)&self->__hostingWindow);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_presentedPopoverViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantButtonProvider, 0);
  objc_storeStrong((id *)&self->_firstResponderController, 0);
  objc_storeStrong((id *)&self->_bottomLineDividerView, 0);
  objc_storeStrong((id *)&self->_compactContentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_tools, 0);
  objc_storeStrong((id *)&self->_shapeButtonViewController, 0);
  objc_storeStrong((id *)&self->_textButtonViewController, 0);
  objc_storeStrong((id *)&self->_plusButtonViewController, 0);
  objc_storeStrong((id *)&self->_toolsWhenLastNotifyingDelegate, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_backgroundColorFactory, 0);

  objc_storeStrong((id *)&self->_toolViewFactory, 0);
}

@end