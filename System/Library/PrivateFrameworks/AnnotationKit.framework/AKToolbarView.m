@interface AKToolbarView
+ (id)redoButtonImage;
+ (id)redoButtonImageWithStyle:(unint64_t)a3;
+ (id)undoButtonImage;
+ (id)undoButtonImageWithStyle:(unint64_t)a3;
- (AKController)annotationController;
- (AKToolbarView)initWithFrame:(CGRect)a3;
- (AKToolbarViewOpacityEditingDelegate)opacityEditingDelegate;
- (BOOL)_hasSelectedAnnotations;
- (BOOL)_setToolPickerVisible:(BOOL)a3 forResponder:(id)a4;
- (BOOL)_toolPicker:(id)a3 shouldChangeSelectedToolColor:(id)a4;
- (BOOL)alwaysShowUndoButton;
- (BOOL)canBecomeFirstResponder;
- (BOOL)contentsHidden;
- (BOOL)isPresentingPopover;
- (BOOL)isPresentingPopovers;
- (BOOL)isShareButtonHidden;
- (BOOL)isToolPickerVisible;
- (BOOL)isTranslucent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldHide;
- (BOOL)shouldUseCompactHeight;
- (BOOL)shouldUseCompactWidth;
- (BOOL)supportsOpacityEditing;
- (BOOL)undoRedoButtonsHidden;
- (BOOL)useNewFullscreenPalette;
- (BOOL)wantsClearBackgroundColorInCompactSize;
- (CGRect)frameObscuredInView:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (PKToolPicker)toolPicker;
- (SEL)shareButtonAction;
- (UIEdgeInsets)_safeAreaInsetsWithCachingIfNeeded;
- (id)_paletteView;
- (id)_toolPickerPopoverConfiguration;
- (id)_toolPickerUndoManager:(id)a3;
- (id)createUndoViewController;
- (id)createUndoViewControllerWithActionHandler:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)paletteViewSelectedAnnotationColor:(id)a3;
- (id)popoverPresentingController;
- (id)presentedViewController;
- (id)selectedAnnotations;
- (id)shareButtonTarget;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)layoutForSize:(CGSize)a3;
- (void)_annotationSelectionNotification:(id)a3;
- (void)_askAnnotationControllerDelegateToEnterFullScreen:(BOOL)a3;
- (void)_cleanupAfterUndoAlert;
- (void)_clearPresentedPopoverPointers;
- (void)_configureCustomDetentPresentationIfNeeded:(id)a3;
- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_dismissImageDescriptionViewController;
- (void)_forceToolPickerVisibleForViewStateChange:(BOOL)a3;
- (void)_installAttributesPickerButtonInPaletteContextEditingViewIfNeeded;
- (void)_presentImageDescriptionViewController;
- (void)_presentViewController:(id)a3 animated:(BOOL)a4;
- (void)_redo:(id)a3;
- (void)_saveCachedSafeAreaInsets;
- (void)_setCurrentOverlaysToolPickerVisible:(BOOL)a3;
- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4;
- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4 sourceRect:(CGRect)a5;
- (void)_setupPaletteViewIfNecessary;
- (void)_shouldUseCachedSafeAreaInsets:(BOOL)a3;
- (void)_showMarkupToolsPopover:(id)a3;
- (void)_showShapeAttributes:(id)a3;
- (void)_showShapeAttributesPopover:(id)a3;
- (void)_showShapesPicker:(id)a3;
- (void)_showSignaturesPopover:(id)a3 fromSourceView:(id)a4 sourceRect:(CGRect)a5;
- (void)_showTextAttributes:(id)a3;
- (void)_showTextStylePopover:(id)a3;
- (void)_showUndoAlertPopover:(id)a3;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)_undo:(id)a3;
- (void)_undoAll:(id)a3;
- (void)_undoLongPress:(id)a3;
- (void)_undoManagerNotification:(id)a3;
- (void)_updateAttributeControllerInk:(id)a3;
- (void)_updatePalette;
- (void)_updatePaletteUI;
- (void)_updateTraitCollectionForViewControllerIfNecessary:(id)a3;
- (void)attributePicker:(id)a3 didSelectToolWithTag:(int64_t)a4 attributeTag:(int64_t)a5;
- (void)dealloc;
- (void)didDismissPopover;
- (void)didDismissPopoverAndRestorePalette;
- (void)didMoveToWindow;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)dismissPresentedPopovers;
- (void)dismissPresentedPopoversAnimated:(BOOL)a3;
- (void)endAnnotationEditing;
- (void)endOpacityEditing;
- (void)forceHideRuler;
- (void)hideModernToolbarView;
- (void)imageDescriptionViewControllerDidCancel:(id)a3;
- (void)imageDescriptionViewControllerDidDismiss:(id)a3;
- (void)imageDescriptionViewControllerDidSave:(id)a3;
- (void)layoutSubviews;
- (void)paletteViewDidSelectPlusButton:(id)a3;
- (void)revalidateItems;
- (void)setAlpha:(double)a3;
- (void)setAlwaysShowUndoButton:(BOOL)a3;
- (void)setAnnotationController:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5;
- (void)setContentsHidden:(BOOL)a3;
- (void)setContentsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidden:(BOOL)a3;
- (void)setInk:(id)a3;
- (void)setOpacityEditingDelegate:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4;
- (void)setShareButtonAction:(SEL)a3;
- (void)setShareButtonHidden:(BOOL)a3;
- (void)setShareButtonTarget:(id)a3;
- (void)setSupportsOpacityEditing:(BOOL)a3;
- (void)setToolPicker:(id)a3;
- (void)setTranslucent:(BOOL)a3;
- (void)setUndoRedoButtonsHidden:(BOOL)a3;
- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3;
- (void)signatureCreationControllerDidCreateSignature:(id)a3;
- (void)signaturesViewControllerContinueToCreateSignature:(id)a3;
- (void)signaturesViewControllerContinueToManageSignatures:(id)a3;
- (void)signaturesViewControllerDidCancel:(id)a3;
- (void)signaturesViewControllerDidSelectSignature:(id)a3;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)toolsList:(id)a3 didSelectToolWithTag:(int64_t)a4;
- (void)toolsListDidSelectOpacityItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateCurrentOverlaysToolPickerVisibility;
- (void)willMoveToWindow:(id)a3;
@end

@implementation AKToolbarView

- (AKToolbarView)initWithFrame:(CGRect)a3
{
  v86[1] = *MEMORY[0x263EF8340];
  v83.receiver = self;
  v83.super_class = (Class)AKToolbarView;
  v3 = -[AKToolbarView initWithFrame:](&v83, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_undoRedoButtonsHidden = 0;
    v3->_alwaysShowUndoButton = 0;
    v3->_shareButtonHidden = 0;
    v3->_showAttributePicker = 0;
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel__undoManagerNotification_ name:*MEMORY[0x263F08638] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel__undoManagerNotification_ name:*MEMORY[0x263F08630] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel__undoManagerNotification_ name:*MEMORY[0x263F08640] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v4 selector:sel__annotationSelectionNotification_ name:off_268923F60[0] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v4 selector:sel__textEffectsWindowIsHosted_ name:*MEMORY[0x263F1D770] object:0];

    v10 = [AKToolbarBackgroundView alloc];
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v15 = -[AKToolbarBackgroundView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x263F001A8], v12, v13, v14);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (AKToolbarBackgroundView *)v15;

    [(AKToolbarBackgroundView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = -[_AKNonMinibarToolbar initWithFrame:]([_AKNonMinibarToolbar alloc], "initWithFrame:", v11, v12, v13, v14);
    toolbar = v4->_toolbar;
    v4->_toolbar = &v17->super;

    [(UIToolbar *)v4->_toolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIToolbar *)v4->_toolbar setOpaque:0];
    [(UIToolbar *)v4->_toolbar setTranslucent:1];
    v19 = [MEMORY[0x263F1C550] clearColor];
    [(UIToolbar *)v4->_toolbar setBackgroundColor:v19];

    v20 = v4->_toolbar;
    id v21 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [(UIToolbar *)v20 setBackgroundImage:v21 forToolbarPosition:0 barMetrics:0];

    v22 = v4->_toolbar;
    id v23 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [(UIToolbar *)v22 setShadowImage:v23 forToolbarPosition:0];

    id v24 = objc_alloc(MEMORY[0x263F1C468]);
    v25 = +[AKToolbarView undoButtonImage];
    uint64_t v26 = [v24 initWithImage:v25 style:0 target:v4 action:sel__undo_];
    undoButton = v4->_undoButton;
    v4->_undoButton = (UIBarButtonItem *)v26;

    v28 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v4 action:sel__undoLongPress_];
    v86[0] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:1];
    [(UIBarButtonItem *)v4->_undoButton _setGestureRecognizers:v29];

    uint64_t v30 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
    undoRedoFixedSpace = v4->_undoRedoFixedSpace;
    v4->_undoRedoFixedSpace = (UIBarButtonItem *)v30;

    BOOL v32 = sub_237630030();
    double v33 = 10.0;
    if (v32) {
      double v33 = 19.0;
    }
    [(UIBarButtonItem *)v4->_undoRedoFixedSpace setWidth:v33];
    id v34 = objc_alloc(MEMORY[0x263F1C468]);
    v35 = +[AKToolbarView redoButtonImage];
    uint64_t v36 = [v34 initWithImage:v35 style:0 target:v4 action:sel__redo_];
    redoButton = v4->_redoButton;
    v4->_redoButton = (UIBarButtonItem *)v36;

    uint64_t v38 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:9 target:0 action:0];
    shareButton = v4->_shareButton;
    v4->_shareButton = (UIBarButtonItem *)v38;

    id v40 = objc_alloc(MEMORY[0x263F1C468]);
    v41 = [MEMORY[0x263F1C6B0] akImageNamed:@"AKModern_Add"];
    uint64_t v42 = [v40 initWithImage:v41 style:0 target:v4 action:sel__showShapesPicker_];
    shapesPickerButton = v4->_shapesPickerButton;
    v4->_shapesPickerButton = (UIBarButtonItem *)v42;

    uint64_t v44 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
    attributesAddShapeFixedSpace = v4->_attributesAddShapeFixedSpace;
    v4->_attributesAddShapeFixedSpace = (UIBarButtonItem *)v44;

    BOOL v46 = sub_237630030();
    double v47 = 37.0;
    if (!v46) {
      double v47 = 0.0;
    }
    [(UIBarButtonItem *)v4->_attributesAddShapeFixedSpace setWidth:v47];
    v82 = [MEMORY[0x263F1C6B0] systemImageNamed:@"textformat.size"];
    id v48 = objc_alloc(MEMORY[0x263F1C468]);
    v49 = [MEMORY[0x263F1C6B0] akImageNamed:@"AKModern_TextAttributes"];
    uint64_t v50 = [v48 initWithImage:v49 style:0 target:v4 action:sel__showTextAttributes_];
    attributesPickerBarButton = v4->_attributesPickerBarButton;
    v4->_attributesPickerBarButton = (UIBarButtonItem *)v50;

    uint64_t v52 = +[AKAttributesPickerButton buttonWithType:0];
    attributesPickerButton = v4->_attributesPickerButton;
    v4->_attributesPickerButton = (AKAttributesPickerButton *)v52;

    [(AKAttributesPickerButton *)v4->_attributesPickerButton addTarget:v4 action:sel__showTextAttributes_ forControlEvents:64];
    [(AKAttributesPickerButton *)v4->_attributesPickerButton setImage:v82 forState:0];
    v54 = v4->_attributesPickerButton;
    id v55 = objc_alloc_init(MEMORY[0x263F1C770]);
    [(AKAttributesPickerButton *)v54 addInteraction:v55];

    [(AKAttributesPickerButton *)v4->_attributesPickerButton setShowsLargeContentViewer:1];
    v56 = [(AKAttributesPickerButton *)v4->_attributesPickerButton widthAnchor];
    uint64_t v57 = [v56 constraintEqualToConstant:36.0];
    attributesPickerButtonWidthConstraint = v4->_attributesPickerButtonWidthConstraint;
    v4->_attributesPickerButtonWidthConstraint = (NSLayoutConstraint *)v57;

    v59 = [(AKAttributesPickerButton *)v4->_attributesPickerButton heightAnchor];
    uint64_t v60 = [v59 constraintEqualToConstant:36.0];
    attributesPickerButtonHeigthConstraint = v4->_attributesPickerButtonHeigthConstraint;
    v4->_attributesPickerButtonHeigthConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)MEMORY[0x263F08938];
    v85[0] = v4->_attributesPickerButtonWidthConstraint;
    v85[1] = v4->_attributesPickerButtonHeigthConstraint;
    v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:2];
    [v62 activateConstraints:v63];

    -[UIView ak_addSubview:withEdgeInsets:](v4, "ak_addSubview:withEdgeInsets:", v4->_backgroundView, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    [(AKToolbarView *)v4 addSubview:v4->_toolbar];
    v64 = [(UIToolbar *)v4->_toolbar leftAnchor];
    v65 = [(AKToolbarView *)v4 leftAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];

    v67 = [(UIToolbar *)v4->_toolbar rightAnchor];
    v68 = [(AKToolbarView *)v4 rightAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];

    v70 = [(UIToolbar *)v4->_toolbar bottomAnchor];
    v71 = [(AKToolbarView *)v4 bottomAnchor];
    [(AKToolbarView *)v4 _safeAreaInsetsWithCachingIfNeeded];
    uint64_t v73 = [v70 constraintEqualToAnchor:v71 constant:-(v72 + 13.0)];
    toolbarBottomConstraint = v4->_toolbarBottomConstraint;
    v4->_toolbarBottomConstraint = (NSLayoutConstraint *)v73;

    v75 = (void *)MEMORY[0x263F08938];
    v84[0] = v66;
    v84[1] = v69;
    v84[2] = v4->_toolbarBottomConstraint;
    v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:3];
    [v75 activateConstraints:v76];

    v77 = [(AKToolbarView *)v4 heightAnchor];
    uint64_t v78 = [v77 constraintEqualToConstant:0.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v78;

    LODWORD(v80) = 1144750080;
    [(NSLayoutConstraint *)v4->_heightConstraint setPriority:v80];
    [(NSLayoutConstraint *)v4->_heightConstraint setActive:1];
    [(UIBarButtonItem *)v4->_undoButton setAccessibilityIdentifier:@"undo-button"];
    [(UIBarButtonItem *)v4->_redoButton setAccessibilityIdentifier:@"redo-button"];
    [(UIBarButtonItem *)v4->_shareButton setAccessibilityIdentifier:@"share-button"];
    [(UIBarButtonItem *)v4->_shapesPickerButton setAccessibilityIdentifier:@"shapes-picker-button"];
    [(UIBarButtonItem *)v4->_attributesPickerBarButton setAccessibilityIdentifier:@"attributes-picker-button"];
    [(AKAttributesPickerButton *)v4->_attributesPickerButton setAccessibilityIdentifier:@"attributes-picker-button"];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v4 dealloc];
}

- (BOOL)useNewFullscreenPalette
{
  return 1;
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v7 didMoveToWindow];
  v3 = [(AKToolbarView *)self window];
  if (!v3 || (sub_23763682C() & 1) != 0 || (_UIApplicationIsExtension() & 1) != 0)
  {
  }
  else
  {
    objc_super v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.ScreenshotServicesService"];

    if ((v6 & 1) == 0) {
      [(AKToolbarView *)self _setupPaletteViewIfNecessary];
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKToolbarView;
  -[AKToolbarView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3 && (_UIApplicationIsExtension() & 1) == 0) {
    [(AKToolbarView *)self _forceToolPickerVisibleForViewStateChange:0];
  }
}

- (void)hideModernToolbarView
{
  [(AKToolbarBackgroundView *)self->_backgroundView setHidden:1];
  toolbar = self->_toolbar;

  [(UIToolbar *)toolbar setHidden:1];
}

- (id)_paletteView
{
  v2 = [(AKToolbarView *)self toolPicker];
  v3 = [v2 _paletteView];

  return v3;
}

- (PKToolPicker)toolPicker
{
  toolPicker = self->_toolPicker;
  if (!toolPicker)
  {
    objc_super v4 = (PKToolPicker *)objc_alloc_init(MEMORY[0x263F14C08]);
    objc_super v5 = self->_toolPicker;
    self->_toolPicker = v4;

    [(PKToolPicker *)self->_toolPicker setStateAutosaveName:@"com.apple.AnnotationKit"];
    [(PKToolPicker *)self->_toolPicker _setShowsHandwritingTool:0];
    [(PKToolPicker *)self->_toolPicker addObserver:self];
    [(PKToolPicker *)self->_toolPicker setColorUserInterfaceStyle:1];
    [(PKToolPicker *)self->_toolPicker setVisible:1 forFirstResponder:self];
    toolPicker = self->_toolPicker;
  }

  return toolPicker;
}

- (BOOL)isToolPickerVisible
{
  toolPicker = self->_toolPicker;
  if (toolPicker) {
    LOBYTE(toolPicker) = [(PKToolPicker *)toolPicker isVisible];
  }
  return (char)toolPicker;
}

- (id)_toolPickerPopoverConfiguration
{
  return (id)MEMORY[0x270F9A6D0](self->_toolPicker, sel__popoverPresentationConfiguration);
}

- (void)_setupPaletteViewIfNecessary
{
  v3 = [(AKToolbarView *)self window];
  if (v3)
  {
    BOOL didSetupToolPicker = self->_didSetupToolPicker;

    if (!didSetupToolPicker)
    {
      self->_BOOL didSetupToolPicker = 1;
      v8 = [(AKToolbarView *)self window];
      AKLog(@"Did successfully set up palette for window: %@");

      [(AKToolbarView *)self hideModernToolbarView];
      id v9 = [(AKToolbarView *)self popoverPresentingController];
      if (!v9
        || ([(AKToolbarView *)self toolPicker],
            objc_super v5 = objc_claimAutoreleasedReturnValue(),
            [v5 _presentationController],
            id v6 = (id)objc_claimAutoreleasedReturnValue(),
            v6,
            v5,
            v9 != v6))
      {
        objc_super v7 = [(AKToolbarView *)self toolPicker];
        [v7 _setPresentationController:v9];
      }
      [(AKToolbarView *)self _updatePalette];
    }
  }
}

- (void)_forceToolPickerVisibleForViewStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AKToolbarView *)self window];
  id v6 = [v5 firstResponder];

  [(AKToolbarView *)self becomeFirstResponder];
  if (v6)
  {
    objc_super v7 = self;
    if (v6 != self)
    {
      v8 = [(AKToolbarView *)self window];
      id v9 = [v8 firstResponder];

      objc_super v7 = v9;
    }
  }
  else
  {
    objc_super v7 = self;
  }
  v10 = v7;
  [(AKToolbarView *)self _setToolPickerVisible:v3 forResponder:v7];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_setToolPickerVisible:(BOOL)a3 forResponder:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    [(AKToolbarView *)self _setupPaletteViewIfNecessary];
    [(AKToolbarView *)self updateCurrentOverlaysToolPickerVisibility];
  }
  objc_super v7 = [(AKToolbarView *)self toolPicker];
  int v8 = [v7 isVisible];

  id v9 = [(AKToolbarView *)self toolPicker];
  [v9 setVisible:v4 forFirstResponder:v6];

  [(AKToolbarView *)self _setCurrentOverlaysToolPickerVisible:v4];
  if (v4)
  {
    v10 = [(AKToolbarView *)self _paletteView];
    if (v10) {
      int v11 = v8;
    }
    else {
      int v11 = 0;
    }

    if (v11 == 1)
    {
      double v12 = [(AKToolbarView *)self toolPicker];
      double v13 = [v12 selectedTool];
      double v14 = [v13 ink];
      [(AKToolbarView *)self _updateAttributeControllerInk:v14];
    }
  }

  return 1;
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v4 setHidden:a3];
  [(AKToolbarView *)self _updatePalette];
}

- (void)setAlpha:(double)a3
{
  [(AKToolbarView *)self alpha];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v7 setAlpha:a3];
  if (v6 != a3) {
    [(AKToolbarView *)self _updatePalette];
  }
}

- (void)_updateAttributeControllerInk:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(AKToolbarView *)self annotationController];
  double v5 = [v4 attributeController];
  double v6 = [v5 ink];
  char v7 = [v6 isEqual:v9];

  if ((v7 & 1) == 0)
  {
    int v8 = [(AKMinimalUserInterfaceItem *)[AKMinimalInkChooserUserInterfaceItem alloc] initWithTag:765300];
    [(AKMinimalInkChooserUserInterfaceItem *)v8 setInk:v9];
    [v4 performActionForSender:v8];
  }
}

- (BOOL)shouldHide
{
  if ([(AKToolbarView *)self isHidden]) {
    return 1;
  }
  [(AKToolbarView *)self alpha];
  if (v3 < 1.0) {
    return 1;
  }

  return [(AKToolbarView *)self contentsHidden];
}

- (void)endAnnotationEditing
{
  id v3 = [(AKToolbarView *)self annotationController];
  v2 = [v3 attributeController];
  [v2 annotationEditingDidEndWithCompletion:0];
}

- (void)forceHideRuler
{
  id v3 = [(AKToolbarView *)self annotationController];
  v2 = [v3 attributeController];
  [v2 forceHideRuler];
}

- (void)_updatePalette
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(AKToolbarView *)self shouldHide])
  {
    id v3 = [(AKToolbarView *)self toolPicker];
    [v3 setRulerActive:0];

    objc_super v4 = os_log_create("com.apple.annotationkit", "AKToolbarView");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_23760E000, v4, OS_LOG_TYPE_DEFAULT, "AKToolbarView did force hide tool picker due to hidden, alpha, or contentsHidden %@", buf, 0xCu);
    }

    double v5 = [(AKToolbarView *)self annotationController];
    double v6 = [v5 attributeController];

    if (v6)
    {
      char v7 = [v5 attributeController];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = sub_237630C4C;
      v18[3] = &unk_264CDAE40;
      v18[4] = self;
      [v7 annotationEditingDidEndWithCompletion:v18];
    }
    else
    {
      int v11 = [(AKToolbarView *)self toolPicker];
      int v12 = [v11 isVisible];

      if (v12) {
        [(AKToolbarView *)self _forceToolPickerVisibleForViewStateChange:0];
      }
    }
  }
  else
  {
    [(AKToolbarView *)self _setupPaletteViewIfNecessary];
    [(AKToolbarView *)self updateCurrentOverlaysToolPickerVisibility];
    int v8 = [(AKToolbarView *)self toolPicker];
    char v9 = [v8 isVisible];

    if ((v9 & 1) == 0)
    {
      v10 = os_log_create("com.apple.annotationkit", "AKToolbarView");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_23760E000, v10, OS_LOG_TYPE_DEFAULT, "ToolPicker: AKToolbarView did force show tool picker due to hidden, alpha, or contentsHidden %@", buf, 0xCu);
      }

      [(AKToolbarView *)self _forceToolPickerVisibleForViewStateChange:1];
    }
  }
  double v13 = [(AKToolbarView *)self toolPicker];
  [v13 _setShowsPlusButton:1];

  double v14 = [(AKToolbarView *)self toolPicker];
  [v14 _setAnnotationDelegate:self];

  uint64_t v15 = [(AKToolbarView *)self toolPicker];
  objc_msgSend(v15, "set_delegate:", self);

  v16 = os_log_create("com.apple.annotationkit", "AKToolbarView");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(AKToolbarView *)self toolPicker];
    *(_DWORD *)buf = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_23760E000, v16, OS_LOG_TYPE_DEFAULT, "ToolPicker: AKToolbarView did set annotationDelegate to %@ for toolpicker %@", buf, 0x16u);
  }
  [(AKToolbarView *)self _updatePaletteUI];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  int v8 = [(AKToolbarView *)self toolPicker];
  char v9 = [v8 _paletteHostView];
  -[AKToolbarView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(AKToolbarView *)self toolPicker];
  uint64_t v15 = [v14 _paletteHostView];
  LOBYTE(v9) = objc_msgSend(v15, "pointInside:withEvent:", v7, v11, v13);

  return (char)v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(AKToolbarView *)self contentsHidden])
  {
    int v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AKToolbarView;
    int v8 = -[AKToolbarView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }

  return v8;
}

- (void)setAnnotationController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
  id v17 = v4;
  objc_storeWeak((id *)&self->_annotationController, v17);
  [WeakRetained setModernToolbarView:0];
  [v17 setModernToolbarView:self];
  if (WeakRetained)
  {
    double v6 = [WeakRetained toolController];
    uint64_t v7 = [v6 toolMode];

    int v8 = [WeakRetained attributeController];
    char v9 = [v8 strokeColor];

    if (!v9)
    {
      char v9 = [MEMORY[0x263F1C550] blackColor];
    }
    objc_super v10 = [(AKMinimalUserInterfaceItem *)[AKMinimalColorChooserUserInterfaceItem alloc] initWithTag:765101];
    [(AKMinimalColorChooserUserInterfaceItem *)v10 setColor:v9];
    [v17 performActionForSender:v10];
    double v11 = [v17 toolController];
    uint64_t v12 = [v11 toolMode];

    if (v7 != v12)
    {
      if (v7 == 4)
      {
        double v13 = [[AKMinimalUserInterfaceItem alloc] initWithTag:764017];
        [v17 performActionForSender:v13];
      }
      else
      {
        double v13 = [v17 toolController];
        [(AKMinimalUserInterfaceItem *)v13 resetToDefaultMode];
      }
    }
  }
  else
  {
    char v9 = [v17 attributeController];
    [v9 setDefaultInk];
  }

  double v14 = [(AKToolbarView *)self toolPicker];
  uint64_t v15 = [v14 selectedTool];
  v16 = [v15 ink];
  [(AKToolbarView *)self _updateAttributeControllerInk:v16];

  [(AKToolbarView *)self updateCurrentOverlaysToolPickerVisibility];
  [(AKToolbarView *)self revalidateItems];
}

- (void)updateCurrentOverlaysToolPickerVisibility
{
  id v3 = [(AKToolbarView *)self toolPicker];
  -[AKToolbarView _setCurrentOverlaysToolPickerVisible:](self, "_setCurrentOverlaysToolPickerVisible:", [v3 isVisible]);
}

- (void)_setCurrentOverlaysToolPickerVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
  double v5 = [WeakRetained currentPageController];
  double v6 = [(AKToolbarView *)self toolPicker];
  [v5 _updateOverlayVisibilityWithToolPicker:v6 visible:v3];

  unint64_t v7 = [WeakRetained currentPageIndex] + 1;
  int v8 = [WeakRetained pageControllers];
  unint64_t v9 = [v8 count];

  if (v7 < v9)
  {
    objc_super v10 = [WeakRetained pageControllers];
    double v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(WeakRetained, "currentPageIndex") + 1);

    uint64_t v12 = [(AKToolbarView *)self toolPicker];
    [v11 _updateOverlayVisibilityWithToolPicker:v12 visible:v3];
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v2 = [(AKToolbarView *)self shouldUseCompactWidth];
  double v3 = *MEMORY[0x263F1D7C8];
  double v4 = 75.0;
  if (!v2) {
    double v4 = *MEMORY[0x263F1D7C8];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if ([(AKToolbarView *)self shouldUseCompactWidth]) {
    double v5 = 75.0;
  }
  else {
    double v5 = 0.0;
  }
  [(AKToolbarView *)self _safeAreaInsetsWithCachingIfNeeded];
  double v7 = v5 + v6;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (unint64_t)layoutForSize:(CGSize)a3
{
  return [(AKToolbarView *)self shouldUseCompactWidth];
}

- (void)setWantsClearBackgroundColorInCompactSize:(BOOL)a3
{
  if (self->_wantsClearBackgroundColorInCompactSize != a3)
  {
    self->_wantsClearBackgroundColorInCompactSize = a3;
    [(AKToolbarView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v40[3] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v36 layoutSubviews];
  double v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  if (![(AKToolbarView *)self shouldUseCompactWidth])
  {
    undoRedoFixedSpace = self->_undoRedoFixedSpace;
    if (self->_showAttributePicker)
    {
      v38[0] = self->_undoButton;
      v38[1] = undoRedoFixedSpace;
      v38[2] = self->_redoButton;
      v38[3] = v3;
      attributesAddShapeFixedSpace = self->_attributesAddShapeFixedSpace;
      v38[4] = self->_attributesPickerBarButton;
      v38[5] = attributesAddShapeFixedSpace;
      v38[6] = self->_shapesPickerButton;
      double v11 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v12 = v38;
      uint64_t v13 = 7;
    }
    else
    {
      v37[0] = self->_undoButton;
      v37[1] = undoRedoFixedSpace;
      v37[2] = self->_redoButton;
      v37[3] = v3;
      v37[4] = self->_shapesPickerButton;
      double v11 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v12 = v37;
      uint64_t v13 = 5;
    }
    double v4 = [v11 arrayWithObjects:v12 count:v13];
    double v15 = 13.0;
    goto LABEL_17;
  }
  double v4 = [MEMORY[0x263EFF980] array];
  double v5 = [(AKToolbarView *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v6 == 2)
  {
    double v7 = self->_undoRedoFixedSpace;
    v40[0] = self->_undoButton;
    v40[1] = v7;
    v40[2] = self->_redoButton;
    double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
    [v4 addObjectsFromArray:v8];

    goto LABEL_12;
  }
  if (self->_alwaysShowUndoButton)
  {
    uint64_t v14 = 424;
LABEL_8:
    [v4 addObject:*(Class *)((char *)&self->super.super.super.isa + v14)];
    goto LABEL_12;
  }
  if (!self->_shareButtonHidden)
  {
    uint64_t v14 = 440;
    goto LABEL_8;
  }
LABEL_12:
  [v4 addObject:v3];
  if (self->_showAttributePicker)
  {
    attributesPickerBarButton = self->_attributesPickerBarButton;
    v39[0] = v3;
    v39[1] = attributesPickerBarButton;
    shapesPickerButton = self->_shapesPickerButton;
    v39[2] = v3;
    v39[3] = shapesPickerButton;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
    [v4 addObjectsFromArray:v18];
  }
  else
  {
    [v4 addObject:self->_shapesPickerButton];
  }
  v19 = [(AKToolbarView *)self traitCollection];
  uint64_t v20 = [v19 horizontalSizeClass];

  double v15 = 0.0;
  if (v20 == 2) {
    NSLog(&cfstr_OkShowTheUndoR.isa);
  }
LABEL_17:
  if (self->_shareButtonHidden)
  {
    __int16 v21 = (void *)[v4 mutableCopy];
    [v21 removeObject:self->_shareButton];

    double v4 = v21;
  }
  if (self->_undoRedoButtonsHidden && !self->_alwaysShowUndoButton)
  {
    v22 = (void *)[v4 mutableCopy];
    [v22 removeObject:self->_undoButton];
    [v22 removeObject:self->_undoRedoFixedSpace];
    [v22 removeObject:self->_redoButton];

    double v4 = v22;
  }
  [(AKToolbarView *)self _safeAreaInsetsWithCachingIfNeeded];
  [(NSLayoutConstraint *)self->_toolbarBottomConstraint setConstant:-(v15 + v23)];
  [(UIToolbar *)self->_toolbar setItems:v4 animated:0];
  [(UIToolbar *)self->_toolbar layoutIfNeeded];
  if ([(AKToolbarView *)self shouldUseCompactWidth]) {
    double v24 = 75.0;
  }
  else {
    double v24 = 0.0;
  }
  [(AKToolbarView *)self _safeAreaInsetsWithCachingIfNeeded];
  [(NSLayoutConstraint *)self->_heightConstraint setConstant:v24 + v25];
  if ([(AKToolbarView *)self useNewFullscreenPalette])
  {
    [(AKToolbarView *)self hideModernToolbarView];
    uint64_t v26 = [(AKToolbarView *)self popoverPresentingController];
    v27 = [(AKToolbarView *)self toolPicker];
    [v27 _setPresentationController:v26];

    BOOL v28 = [(AKToolbarView *)self wantsClearBackgroundColorInCompactSize];
    v29 = [(AKToolbarView *)self toolPicker];
    [v29 _setWantsClearBackgroundColorInCompactSize:v28];

    uint64_t v30 = [(AKToolbarView *)self traitCollection];
    uint64_t v31 = [v30 userInterfaceStyle];

    if (v31 == 2)
    {
      BOOL v32 = [MEMORY[0x263F1C550] systemDarkGrayColor];
      p_attributesPickerButton = &self->_attributesPickerButton;
      [(AKAttributesPickerButton *)self->_attributesPickerButton setBackgroundColor:v32];

      [MEMORY[0x263F1C550] whiteColor];
    }
    else
    {
      id v34 = [MEMORY[0x263F1C550] systemLightGrayColor];
      p_attributesPickerButton = &self->_attributesPickerButton;
      [(AKAttributesPickerButton *)self->_attributesPickerButton setBackgroundColor:v34];

      [MEMORY[0x263F1C550] systemDarkGrayTintColor];
    v35 = };
    [(AKAttributesPickerButton *)*p_attributesPickerButton setTintColor:v35];
  }
}

- (void)updateConstraints
{
  if ([(AKToolbarView *)self shouldUseCompactWidth])
  {
    [(NSLayoutConstraint *)self->_attributesPickerButtonWidthConstraint setConstant:28.0];
  }
  else
  {
    double v3 = [(AKToolbarView *)self _paletteView];
    [v3 paletteScaleFactor];
    [(NSLayoutConstraint *)self->_attributesPickerButtonWidthConstraint setConstant:v4 * 36.0];
  }
  if ([(AKToolbarView *)self shouldUseCompactWidth])
  {
    [(NSLayoutConstraint *)self->_attributesPickerButtonHeigthConstraint setConstant:28.0];
  }
  else
  {
    double v5 = [(AKToolbarView *)self _paletteView];
    [v5 paletteScaleFactor];
    [(NSLayoutConstraint *)self->_attributesPickerButtonHeigthConstraint setConstant:v6 * 36.0];
  }
  v7.receiver = self;
  v7.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v7 updateConstraints];
}

- (void)_saveCachedSafeAreaInsets
{
  p_cachedSafeAreaInsets = &self->_cachedSafeAreaInsets;
  [(AKToolbarView *)self safeAreaInsets];
  p_cachedSafeAreaInsets->top = v3;
  p_cachedSafeAreaInsets->left = v4;
  p_cachedSafeAreaInsets->bottom = v5;
  p_cachedSafeAreaInsets->right = v6;
}

- (void)_shouldUseCachedSafeAreaInsets:(BOOL)a3
{
  self->_shouldUseCachedSafeAreaInsets = a3;
}

- (UIEdgeInsets)_safeAreaInsetsWithCachingIfNeeded
{
  if (self->_shouldUseCachedSafeAreaInsets)
  {
    double top = self->_cachedSafeAreaInsets.top;
    double left = self->_cachedSafeAreaInsets.left;
    double bottom = self->_cachedSafeAreaInsets.bottom;
    double right = self->_cachedSafeAreaInsets.right;
  }
  else
  {
    [(AKToolbarView *)self safeAreaInsets];
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v5 setBackgroundColor:a3];
  CGFloat v4 = [(AKToolbarView *)self backgroundColor];
  [(AKToolbarBackgroundView *)self->_backgroundView setBackgroundColor:v4];
}

- (void)setOpaque:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v4 setOpaque:a3];
  [(AKToolbarBackgroundView *)self->_backgroundView setOpaque:[(AKToolbarView *)self isOpaque]];
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
  -[AKToolbarBackgroundView setTranslucent:](self->_backgroundView, "setTranslucent:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AKToolbarView;
  [(AKToolbarView *)&v20 traitCollectionDidChange:v4];
  objc_super v5 = [(AKToolbarView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    double v8 = [(AKToolbarView *)self toolPicker];
    unint64_t v9 = [(AKToolbarView *)self traitCollection];
    [v8 _updatePaletteTraitCollection:v9];
  }
  objc_super v10 = [(AKToolbarView *)self traitCollection];
  uint64_t v11 = [v10 horizontalSizeClass];
  uint64_t v12 = [v4 horizontalSizeClass];

  if (v11 != v12)
  {
    [(AKToolbarView *)self setNeedsUpdateConstraints];
    [(AKToolbarView *)self setNeedsLayout];
  }
  uint64_t v13 = [(AKToolbarView *)self presentedViewController];
  [(AKToolbarView *)self _updateTraitCollectionForViewControllerIfNecessary:v13];

  uint64_t v14 = [(AKToolbarView *)self traitCollection];
  int v15 = [v14 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v15)
  {
    v16 = [(AKToolbarView *)self presentedViewController];
    id v17 = [v16 popoverPresentationController];

    if (v17)
    {
      v18 = [(AKToolbarView *)self presentedViewController];
      v19 = [v18 popoverPresentationController];
      [v19 traitCollectionDidChange:v4];
    }
  }
}

- (BOOL)shouldUseCompactWidth
{
  CGFloat v3 = [(AKToolbarView *)self traitCollection];
  if ([v3 userInterfaceIdiom])
  {
    id v4 = [(AKToolbarView *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == 1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)shouldUseCompactHeight
{
  CGFloat v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  BOOL v5 = [(AKToolbarView *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  return !v4 || v6 == 1;
}

- (void)setContentsHidden:(BOOL)a3
{
}

- (void)setContentsHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_contentsHidden != a3)
  {
    BOOL v5 = a4;
    BOOL v6 = a3;
    self->_contentsHidden = a3;
    double v7 = (double)!a3;
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_237631E34;
    v11[3] = &unk_264CDAFF8;
    objc_copyWeak(v12, &location);
    v12[1] = *(id *)&v7;
    uint64_t v8 = MEMORY[0x237E1E250](v11);
    unint64_t v9 = (void *)v8;
    if (v5)
    {
      if (v6)
      {
        [(AKToolbarView *)self _saveCachedSafeAreaInsets];
        [(AKToolbarView *)self _shouldUseCachedSafeAreaInsets:1];
      }
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237631EA8;
      v10[3] = &unk_264CDB020;
      v10[4] = self;
      [MEMORY[0x263F1CB60] _animateUsingDefaultTimingWithOptions:6 animations:v9 completion:v10];
    }
    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  [(AKToolbarView *)self _updatePalette];
}

- (id)selectedAnnotations
{
  BOOL v2 = [(AKToolbarView *)self annotationController];
  CGFloat v3 = [v2 currentPageController];
  uint64_t v4 = [v3 pageModelController];

  BOOL v5 = [v4 selectedAnnotations];

  return v5;
}

- (id)createUndoViewController
{
  return (id)MEMORY[0x270F9A6D0](self, sel_createUndoViewControllerWithActionHandler_);
}

- (id)createUndoViewControllerWithActionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKToolbarView *)self annotationController];
  BOOL v6 = [v5 delegate];
  double v7 = [v6 undoManagerForAnnotationController:v5];

  uint64_t v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v8 setModalPresentationStyle:7];
  unint64_t v9 = [v8 popoverPresentationController];
  [v9 setDelegate:self];

  objc_super v10 = [v8 popoverPresentationController];
  [v10 setPermittedArrowDirections:3];

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_2376323D8;
  v43[3] = &unk_264CDB048;
  id v11 = v4;
  id v44 = v11;
  uint64_t v12 = (void *)MEMORY[0x237E1E250](v43);
  objc_initWeak(&location, self);
  if ([v5 validateUndo:0])
  {
    uint64_t v13 = +[AKController akBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"Undo" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

    int v15 = [v7 undoActionName];
    id v31 = v11;
    double v33 = v15;
    if ([v15 length])
    {
      uint64_t v16 = [NSString stringWithFormat:@"%@ %@", v14, v15];

      uint64_t v14 = (void *)v16;
    }
    id v17 = (void *)MEMORY[0x263F1C3F0];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_2376323F0;
    v39[3] = &unk_264CDB070;
    objc_copyWeak(&v41, &location);
    BOOL v32 = v12;
    id v18 = v12;
    id v40 = v18;
    v19 = [v17 actionWithTitle:v14 style:0 handler:v39];
    uint64_t v30 = v7;
    [v8 addAction:v19];
    objc_super v20 = (void *)MEMORY[0x263F1C3F0];
    __int16 v21 = +[AKController akBundle];
    v22 = [v21 localizedStringForKey:@"Undo All" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = sub_237632458;
    v36[3] = &unk_264CDB070;
    objc_copyWeak(&v38, &location);
    id v37 = v18;
    double v23 = [v20 actionWithTitle:v22 style:0 handler:v36];

    [v8 addAction:v23];
    uint64_t v12 = v32;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v41);

    double v7 = v30;
    id v11 = v31;
  }
  double v24 = (void *)MEMORY[0x263F1C3F0];
  double v25 = +[AKController akBundle];
  uint64_t v26 = [v25 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2376324C0;
  v34[3] = &unk_264CDB098;
  id v27 = v12;
  id v35 = v27;
  BOOL v28 = [v24 actionWithTitle:v26 style:1 handler:v34];
  [v8 addAction:v28];

  objc_destroyWeak(&location);

  return v8;
}

- (void)_updatePaletteUI
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  CGFloat v3 = [(AKToolbarView *)self annotationController];
  [v3 currentPageController];
  uint64_t v42 = v41 = v3;
  id v4 = [v3 currentPageController];
  BOOL v5 = [v4 pageModelController];

  id v40 = v5;
  [v5 selectedAnnotations];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          char isKindOfClass = 0;
          char v12 = 0;
          uint64_t v14 = sel__showTextAttributes_;
          int v13 = 1;
          int v15 = @"textformat.size";
          goto LABEL_15;
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector())
        {
          char v12 = isKindOfClass ^ 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char isKindOfClass = 0;
  char v12 = 0;
LABEL_13:

  int v13 = 0;
  uint64_t v14 = sel__showShapeAttributes_;
  int v15 = @"square.fill.on.circle.fill";
LABEL_15:
  uint64_t v16 = [(AKToolbarView *)self _paletteView];
  [v16 paletteScaleFactor];
  if (v17 == 1.0)
  {
    if ([(AKToolbarView *)self shouldUseCompactWidth]) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = -1;
    }
  }
  else
  {
    uint64_t v18 = 1;
  }

  v19 = [MEMORY[0x263F1C658] defaultFontForTextStyle:*MEMORY[0x263F1D260]];
  objc_super v20 = (void *)MEMORY[0x263F1C6C8];
  [v19 pointSize];
  __int16 v21 = objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, v18);
  v22 = [MEMORY[0x263F1C6B0] systemImageNamed:v15 withConfiguration:v21];
  [(UIBarButtonItem *)self->_attributesPickerBarButton setAction:v14];
  [(UIBarButtonItem *)self->_attributesPickerBarButton setImage:v22];
  self->_showAttributePicker = (v12 | v13) & ([v6 count] != 0);
  if ([(AKToolbarView *)self useNewFullscreenPalette] && self->_showAttributePicker)
  {
    if (v13) {
      uint64_t v23 = 10;
    }
    else {
      uint64_t v23 = 1;
    }
    double v24 = [(AKToolbarView *)self _paletteView];
    [v24 setSelectedAnnotationType:v23];

    double v25 = [v42 inkPageOverlayController];
    uint64_t v26 = [v25 inkOverlayView];
    id v27 = [v26 canvasView];
    BOOL v28 = [v27 _selectionInteraction];

    [v28 setEnabled:0];
    [(AKAttributesPickerButton *)self->_attributesPickerButton removeTarget:self action:sel__showTextAttributes_ forControlEvents:64];
    [(AKAttributesPickerButton *)self->_attributesPickerButton removeTarget:self action:sel__showShapeAttributes_ forControlEvents:64];
    [(AKAttributesPickerButton *)self->_attributesPickerButton addTarget:self action:v14 forControlEvents:64];
    [(AKAttributesPickerButton *)self->_attributesPickerButton setImage:v22 forState:0];
    v29 = [(AKAttributesPickerButton *)self->_attributesPickerButton superview];
    uint64_t v30 = [(AKToolbarView *)self _paletteView];
    id v31 = [v30 contextualEditingView];

    if (v29 != v31) {
      [(AKToolbarView *)self _installAttributesPickerButtonInPaletteContextEditingViewIfNeeded];
    }
    BOOL v32 = v42;
  }
  else
  {
    double v33 = [(AKToolbarView *)self _paletteView];
    id v34 = v33;
    if (isKindOfClass) {
      uint64_t v35 = 11;
    }
    else {
      uint64_t v35 = 0;
    }
    [v33 setSelectedAnnotationType:v35];

    objc_super v36 = [(AKAttributesPickerButton *)self->_attributesPickerButton superview];

    if (v36) {
      [(AKAttributesPickerButton *)self->_attributesPickerButton removeFromSuperview];
    }
    BOOL v32 = v42;
    BOOL v28 = [v42 inkPageOverlayController];
    id v37 = [v28 inkOverlayView];
    id v38 = [v37 canvasView];
    v39 = [v38 _selectionInteraction];
    [v39 setEnabled:1];
  }
  [(AKToolbarView *)self setNeedsLayout];
  [(AKToolbarView *)self setNeedsUpdateConstraints];
}

- (void)_installAttributesPickerButtonInPaletteContextEditingViewIfNeeded
{
  v18[2] = *MEMORY[0x263EF8340];
  CGFloat v3 = [(AKToolbarView *)self _paletteView];
  id v4 = [v3 contextualEditingView];

  if (v4)
  {
    [(AKAttributesPickerButton *)self->_attributesPickerButton removeFromSuperview];
    [v4 addSubview:self->_attributesPickerButton];
    [(AKAttributesPickerButton *)self->_attributesPickerButton setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v5 = [(AKToolbarView *)self toolPicker];
    uint64_t v6 = [v5 _palettePosition];

    switch(v6)
    {
      case 1:
      case 3:
        uint64_t v7 = (void *)MEMORY[0x263F08938];
        uint64_t v8 = [(AKAttributesPickerButton *)self->_attributesPickerButton leadingAnchor];
        uint64_t v9 = [v4 leadingAnchor];
        objc_super v10 = [v8 constraintEqualToAnchor:v9];
        v17[0] = v10;
        id v11 = [(AKAttributesPickerButton *)self->_attributesPickerButton centerYAnchor];
        char v12 = [v4 centerYAnchor];
        int v13 = [v11 constraintEqualToAnchor:v12];
        v17[1] = v13;
        uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
        int v15 = v17;
        goto LABEL_5;
      case 2:
      case 4:
        uint64_t v7 = (void *)MEMORY[0x263F08938];
        uint64_t v8 = [(AKAttributesPickerButton *)self->_attributesPickerButton topAnchor];
        uint64_t v9 = [v4 topAnchor];
        objc_super v10 = [v8 constraintEqualToAnchor:v9];
        v18[0] = v10;
        id v11 = [(AKAttributesPickerButton *)self->_attributesPickerButton centerXAnchor];
        char v12 = [v4 centerXAnchor];
        int v13 = [v11 constraintEqualToAnchor:v12];
        v18[1] = v13;
        uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
        int v15 = v18;
LABEL_5:
        uint64_t v16 = [v14 arrayWithObjects:v15 count:2];
        [v7 activateConstraints:v16];

        break;
      default:
        break;
    }
    [(AKToolbarView *)self setNeedsUpdateConstraints];
    [(AKToolbarView *)self layoutIfNeeded];
  }
}

- (void)revalidateItems
{
  id v4 = [(AKToolbarView *)self annotationController];
  if (([v4 isTornDown] & 1) == 0)
  {
    -[UIBarButtonItem setEnabled:](self->_undoButton, "setEnabled:", [v4 validateUndo:0]);
    -[UIBarButtonItem setEnabled:](self->_redoButton, "setEnabled:", [v4 validateRedo:0]);
    CGFloat v3 = [(AKToolbarView *)self _paletteView];
    [v3 setNeedsLayout];

    [(AKToolbarView *)self _updatePaletteUI];
    [(AKToolbarView *)self setNeedsLayout];
  }
}

- (void)_undoManagerNotification:(id)a3
{
  id v13 = a3;
  id v4 = [(AKToolbarView *)self annotationController];
  BOOL v5 = [v4 delegate];
  uint64_t v6 = [v5 undoManagerForAnnotationController:v4];
  uint64_t v7 = [v13 object];

  if (v7 == v6)
  {
    uint64_t v8 = [v13 name];
    if ([v8 isEqualToString:*MEMORY[0x263F08638]])
    {
    }
    else
    {
      uint64_t v9 = [v13 name];
      int v10 = [v9 isEqualToString:*MEMORY[0x263F08630]];

      if (!v10)
      {
LABEL_6:
        [(AKToolbarView *)self revalidateItems];
        goto LABEL_7;
      }
    }
    id v11 = [(AKToolbarView *)self window];
    [v11 makeKeyWindow];

    char v12 = [(AKToolbarView *)self toolPicker];
    [v12 _updateToolPickerVisibility];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_annotationSelectionNotification:(id)a3
{
  id v4 = a3;
  id v15 = [(AKToolbarView *)self annotationController];
  BOOL v5 = [v15 modelController];
  uint64_t v6 = [v5 pageModelControllers];
  uint64_t v7 = [v4 object];

  LODWORD(v4) = [v6 containsObject:v7];
  if (v4)
  {
    [(AKToolbarView *)self revalidateItems];
    uint64_t v8 = [v15 currentPageController];
    uint64_t v9 = [v8 pageModelController];

    int v10 = [v9 selectedAnnotations];
    id v11 = [v15 currentPageController];
    char v12 = [v11 inkPageOverlayController];
    id v13 = [v12 inkOverlayView];
    uint64_t v14 = [v13 canvasView];

    if ([v10 count] && objc_msgSend(v14, "_hasSelection")) {
      [v14 commitSelectionIfNecessaryWithCompletion:0];
    }
    [(AKToolbarView *)self _updatePaletteUI];
  }
}

- (void)_undo:(id)a3
{
  id v3 = [(AKToolbarView *)self annotationController];
  [v3 undo:0];
}

- (void)_undoAll:(id)a3
{
  id v3 = [(AKToolbarView *)self annotationController];
  if ([v3 validateUndo:0])
  {
    do
      [v3 undo:0];
    while (([v3 validateUndo:0] & 1) != 0);
  }
}

- (void)_cleanupAfterUndoAlert
{
  if (self->_undoAlertController)
  {
    self->_undoAlertController = 0;
    MEMORY[0x270F9A758]();
  }
}

- (void)_undoLongPress:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    id v4 = [v5 view];
    [(AKToolbarView *)self _showUndoAlertPopover:v4];
  }
}

- (void)_redo:(id)a3
{
  id v3 = [(AKToolbarView *)self annotationController];
  [v3 redo:0];
}

- (void)_showShapesPicker:(id)a3
{
}

- (void)_showTextAttributes:(id)a3
{
  id v4 = a3;
  if (sub_237633178(self->_textAttributesViewController))
  {
    [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:1 withCompletion:0];
  }
  else if ((sub_2376331B8(self->_textAttributesViewController) & 1) == 0)
  {
    [(AKToolbarView *)self _showTextStylePopover:v4];
  }
}

- (void)_showShapeAttributes:(id)a3
{
  id v4 = a3;
  if (sub_237633178(self->_attributePickerViewController))
  {
    [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:1 withCompletion:0];
  }
  else if ((sub_2376331B8(self->_attributePickerViewController) & 1) == 0)
  {
    [(AKToolbarView *)self _showShapeAttributesPopover:v4];
  }
}

- (void)setUndoRedoButtonsHidden:(BOOL)a3
{
  if (self->_undoRedoButtonsHidden != a3)
  {
    self->_undoRedoButtonsHidden = a3;
    [(AKToolbarView *)self setNeedsLayout];
  }
}

- (void)setShareButtonHidden:(BOOL)a3
{
  if (self->_shareButtonHidden != a3)
  {
    self->_shareButtonHidden = a3;
    [(AKToolbarView *)self setNeedsLayout];
  }
}

- (void)setShareButtonAction:(SEL)a3
{
}

- (SEL)shareButtonAction
{
  return [(UIBarButtonItem *)self->_shareButton action];
}

- (void)setShareButtonTarget:(id)a3
{
}

- (id)shareButtonTarget
{
  return [(UIBarButtonItem *)self->_shareButton target];
}

- (BOOL)isPresentingPopovers
{
  BOOL v2 = [(AKToolbarView *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPresentingPopover
{
  return self->_signaturesAlertController
      || self->_signaturesSheetViewController
      || self->_textAttributesViewController
      || self->_attributePickerViewController
      || self->_undoAlertController
      || self->_signaturesCreationController
      || self->_imageDescriptionViewController != 0;
}

- (void)_clearPresentedPopoverPointers
{
  textAttributesViewController = self->_textAttributesViewController;
  self->_textAttributesViewController = 0;

  signaturesSheetViewController = self->_signaturesSheetViewController;
  self->_signaturesSheetViewController = 0;

  signaturesAlertController = self->_signaturesAlertController;
  self->_signaturesAlertController = 0;

  signaturesCreationController = self->_signaturesCreationController;
  self->_signaturesCreationController = 0;

  toolsListViewController = self->_toolsListViewController;
  self->_toolsListViewController = 0;

  undoAlertController = self->_undoAlertController;
  self->_undoAlertController = 0;

  imageDescriptionViewController = self->_imageDescriptionViewController;
  self->_imageDescriptionViewController = 0;
}

- (id)popoverPresentingController
{
  BOOL v3 = [(AKToolbarView *)self annotationController];
  id v4 = [v3 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 popoverPresentingViewControllerForAnnotationController:v3],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(AKToolbarView *)self window];
    id v5 = [v6 rootViewController];
  }

  return v5;
}

- (id)presentedViewController
{
  BOOL v3 = [(AKToolbarView *)self popoverPresentingController];
  id v4 = [v3 presentedViewController];

  if (!v4)
  {
    p_signaturesAlertController = (id *)&self->_signaturesAlertController;
    signaturesAlertController = self->_signaturesAlertController;
    if (signaturesAlertController)
    {
      uint64_t v7 = [(AKAlertController *)signaturesAlertController presentationController];
      uint64_t v8 = [v7 presentingViewController];

      if (v8) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_undoAlertController;
    undoAlertController = self->_undoAlertController;
    if (undoAlertController)
    {
      int v10 = [(UIAlertController *)undoAlertController presentationController];
      id v11 = [v10 presentingViewController];

      if (v11) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_textAttributesViewController;
    textAttributesViewController = self->_textAttributesViewController;
    if (textAttributesViewController)
    {
      id v13 = [(AKTextAttributesViewController *)textAttributesViewController presentationController];
      uint64_t v14 = [v13 presentingViewController];

      if (v14) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_toolsListViewController;
    toolsListViewController = self->_toolsListViewController;
    if (toolsListViewController)
    {
      uint64_t v16 = [(AKToolsListViewController *)toolsListViewController presentationController];
      double v17 = [v16 presentingViewController];

      if (v17) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_attributePickerViewController;
    attributePickerViewController = self->_attributePickerViewController;
    if (attributePickerViewController)
    {
      v19 = [(AKAttributePickerViewController *)attributePickerViewController presentationController];
      objc_super v20 = [v19 presentingViewController];

      if (v20) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_signaturesCreationController;
    signaturesCreationController = self->_signaturesCreationController;
    if (signaturesCreationController)
    {
      v22 = [(AKSignatureCreationViewController_iOS *)signaturesCreationController presentationController];
      uint64_t v23 = [v22 presentingViewController];

      if (v23) {
        goto LABEL_18;
      }
    }
    p_signaturesAlertController = (id *)&self->_signaturesSheetViewController;
    signaturesSheetViewController = self->_signaturesSheetViewController;
    if (signaturesSheetViewController)
    {
      double v25 = [(AKSignaturesViewController_iOS *)signaturesSheetViewController presentationController];
      uint64_t v26 = [v25 presentingViewController];

      if (v26)
      {
LABEL_18:
        id v4 = *p_signaturesAlertController;
        goto LABEL_19;
      }
    }
    p_signaturesAlertController = (id *)&self->_imageDescriptionViewController;
    imageDescriptionViewController = self->_imageDescriptionViewController;
    if (imageDescriptionViewController)
    {
      BOOL v28 = [(AXSSImageDescriptionViewController *)imageDescriptionViewController presentationController];
      id v4 = [v28 presentingViewController];

      if (!v4) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    id v4 = 0;
  }
LABEL_19:

  return v4;
}

- (void)dismissPresentedPopovers
{
}

- (void)dismissPresentedPopoversAnimated:(BOOL)a3
{
}

- (void)didDismissPopoverAndRestorePalette
{
  [(AKToolbarView *)self didDismissPopover];
  [(AKToolbarView *)self becomeFirstResponder];

  [(AKToolbarView *)self _setToolPickerVisible:1 forResponder:self];
}

- (void)didDismissPopover
{
  id v3 = [(AKToolbarView *)self annotationController];
  BOOL v2 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 controllerDidDismissPopover:v3];
  }
}

- (void)_showSignaturesPopover:(id)a3 fromSourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = [(AKToolbarView *)self annotationController];
  char v12 = [v11 signatureModelController];
  id v13 = [v12 signatures];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    if (!self->_signaturesSheetViewController)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = sub_2376339B8;
      v15[3] = &unk_264CDB0E8;
      id v16 = v11;
      double v17 = self;
      id v18 = v10;
      CGFloat v19 = x;
      CGFloat v20 = y;
      CGFloat v21 = width;
      CGFloat v22 = height;
      [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v15];
    }
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2376339AC;
    v23[3] = &unk_264CDAE40;
    v23[4] = self;
    [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v23];
  }
}

- (void)_showTextStylePopover:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_237633D6C;
  v6[3] = &unk_264CDB110;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v6];
}

- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2376340C0;
  v20[3] = &unk_264CDB138;
  id v7 = v6;
  v20[4] = self;
  id v21 = v7;
  uint64_t v8 = (void (**)(void))MEMORY[0x237E1E250](v20);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = sub_237634118;
  id v18 = sub_237634128;
  id v19 = [(AKToolbarView *)self presentedViewController];
  uint64_t v9 = (void *)v15[5];
  if (v9 && ([v9 isBeingDismissed] & 1) == 0)
  {
    id v10 = (void *)v15[5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_237634130;
    v11[3] = &unk_264CDB160;
    id v13 = &v14;
    void v11[4] = self;
    char v12 = v8;
    [v10 dismissViewControllerAnimated:v4 completion:v11];
  }
  else
  {
    v8[2](v8);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v7 = [v12 popoverPresentationController];
  [v7 setBackgroundColor:v6];

  uint64_t v8 = [v12 popoverPresentationController];
  [v8 _setIgnoreBarButtonItemSiblings:1];
  uint64_t v9 = [(AKToolbarView *)self _paletteView];

  if (v9)
  {
    id v10 = [(AKToolbarView *)self _toolPickerPopoverConfiguration];
    [v10 layoutSceneMargins];
    objc_msgSend(v8, "setPopoverLayoutMargins:");
  }
  id v11 = [(AKToolbarView *)self popoverPresentingController];
  [v11 presentViewController:v12 animated:v4 completion:0];

  [(AKToolbarView *)self _updateTraitCollectionForViewControllerIfNecessary:v12];
}

- (void)_updateTraitCollectionForViewControllerIfNecessary:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 _responderWindow];
  int v5 = [v4 _isTextEffectsWindow];

  if (v5)
  {
    id v6 = [(AKToolbarView *)self traitCollection];
    objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

    id v7 = [v9 parentViewController];
    uint64_t v8 = [(AKToolbarView *)self traitCollection];
    [v7 setOverrideTraitCollection:v8 forChildViewController:v9];
  }
}

- (void)_showMarkupToolsPopover:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_237634410;
  v6[3] = &unk_264CDB110;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v6];
}

- (void)endOpacityEditing
{
  id v2 = [(AKToolbarView *)self _paletteView];
  [v2 endOpacityEditing];
}

- (void)_showShapeAttributesPopover:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2376346DC;
  v6[3] = &unk_264CDB110;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v6];
}

- (void)_showUndoAlertPopover:(id)a3
{
  id v4 = a3;
  id v5 = [(AKToolbarView *)self createUndoViewController];
  undoAlertController = self->_undoAlertController;
  self->_undoAlertController = v5;

  [(AKToolbarView *)self _setPopoverPresentationSource:self->_undoAlertController fromSender:v4];
  id v7 = self->_undoAlertController;

  [(AKToolbarView *)self _presentViewController:v7 animated:1];
}

- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 bounds];
    -[AKToolbarView _setPopoverPresentationSource:fromSender:sourceRect:](self, "_setPopoverPresentationSource:fromSender:sourceRect:", v8, v7);
  }
  else
  {
    -[AKToolbarView _setPopoverPresentationSource:fromSender:sourceRect:](self, "_setPopoverPresentationSource:fromSender:sourceRect:", v8, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
}

- (void)_setPopoverPresentationSource:(id)a3 fromSender:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a4;
  id v10 = [a3 popoverPresentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setSourceView:v11];
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    CGRect v14 = CGRectInset(v13, -5.0, -5.0);
    objc_msgSend(v10, "setSourceRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setBarButtonItem:v11];
    }
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  AKLog(@"%s %@");
  -[AKSignatureCreationViewController_iOS popoverPresentationController](self->_signaturesCreationController, "popoverPresentationController", "-[AKToolbarView presentationControllerShouldDismiss:]", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    id v6 = [(AKToolbarView *)self annotationController];
    id v7 = [v6 delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 controllerWillDismissSignatureCaptureView:v6];
    }
  }
  return 1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)signaturesViewControllerDidCancel:(id)a3
{
  AKLog(@"%s %@");
  if (self->_signaturesSheetViewController)
  {
    id v4 = -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerDidCancel:]", a3);
    id v5 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 controllerWillDismissSignatureManagerView:v4];
    }
    id v6 = [(AKToolbarView *)self popoverPresentingController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_237634DA8;
    v13[3] = &unk_264CDAE40;
    v13[4] = self;
    [v6 dismissViewControllerAnimated:1 completion:v13];

    id v7 = [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController popoverPresentationController];
    [v7 setDelegate:0];

    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = 0;
  }
  else
  {
    signaturesAlertController = self->_signaturesAlertController;
    if (signaturesAlertController)
    {
      id v10 = -[AKAlertController popoverPresentationController](signaturesAlertController, "popoverPresentationController", "-[AKToolbarView signaturesViewControllerDidCancel:]", a3);
      [v10 setDelegate:0];

      id v11 = self->_signaturesAlertController;
      self->_signaturesAlertController = 0;

      [(AKToolbarView *)self didDismissPopoverAndRestorePalette];
    }
  }
}

- (void)signaturesViewControllerDidSelectSignature:(id)a3
{
  id v4 = a3;
  AKLog(@"%s %@");
  id v5 = -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerDidSelectSignature:]", v4);
  id v6 = v5;
  if (self->_signaturesSheetViewController)
  {
    id v7 = [v5 delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 controllerWillDismissSignatureManagerView:v6];
    }
    id v8 = [(AKToolbarView *)self popoverPresentingController];
    [v8 dismissViewControllerAnimated:1 completion:0];

    id v9 = [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController popoverPresentationController];
    [v9 setDelegate:0];

    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setDelegate:0];
    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = 0;

    [(AKToolbarView *)self didDismissPopoverAndRestorePalette];
  }
  else if (self->_signaturesAlertController)
  {
    objc_initWeak(&location, self);
    signaturesAlertController = self->_signaturesAlertController;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_237634FA0;
    v13[3] = &unk_264CDB188;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    [(AKAlertController *)signaturesAlertController dismissViewControllerAnimated:1 completion:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  id v12 = [[AKMinimalUserInterfaceItem alloc] initWithTag:764019];
  [v6 performActionForSender:v12];
}

- (void)signaturesViewControllerContinueToManageSignatures:(id)a3
{
  id v4 = a3;
  signaturesAlertController = self->_signaturesAlertController;
  id v16 = v4;
  if (signaturesAlertController)
  {
    id v6 = [(AKAlertController *)signaturesAlertController popoverPresentationController];
    [v6 setDelegate:0];

    id v7 = self->_signaturesAlertController;
    self->_signaturesAlertController = 0;

    id v4 = v16;
  }
  id v15 = v4;
  AKLog(@"%s %@");
  id v8 = v16;
  if (!self->_signaturesSheetViewController)
  {
    id v9 = [AKSignaturesViewController_iOS alloc];
    id v10 = -[AKToolbarView annotationController](self, "annotationController", "-[AKToolbarView signaturesViewControllerContinueToManageSignatures:]", v15);
    id v11 = [(AKSignaturesViewController_iOS *)v9 initWithController:v10];
    signaturesSheetViewController = self->_signaturesSheetViewController;
    self->_signaturesSheetViewController = v11;

    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setDelegate:self];
    [(AKToolbarView *)self _configureCustomDetentPresentationIfNeeded:self->_signaturesSheetViewController];
    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setModalPresentationStyle:2];
    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setModalInPresentation:1];
    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setShowsNavigationBar:1];
    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setPresentedInAlert:0];
    [(AKSignaturesViewController_iOS *)self->_signaturesSheetViewController setAllowsEdits:1];
    CGRect v13 = [(AKToolbarView *)self annotationController];
    id v14 = [v13 delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 controllerWillShowSignatureManagerView:v13];
    }
    [(AKToolbarView *)self _presentViewController:self->_signaturesSheetViewController animated:1];

    id v8 = v16;
  }
}

- (void)signaturesViewControllerContinueToCreateSignature:(id)a3
{
  AKLog(@"%s %@");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2376352AC;
  v8[3] = &unk_264CDAE40;
  v8[4] = self;
  uint64_t v4 = MEMORY[0x237E1E250](v8);
  id v5 = (void *)v4;
  if (self->_signaturesSheetViewController || self->_signaturesAlertController)
  {
    id v6 = -[AKToolbarView popoverPresentingController](self, "popoverPresentingController", "-[AKToolbarView signaturesViewControllerContinueToCreateSignature:]", a3);
    [v6 dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (void)_configureCustomDetentPresentationIfNeeded:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 sheetPresentationController];
  if (v4)
  {
    id v5 = [(AKToolbarView *)self traitCollection];
    if ([v5 userInterfaceIdiom])
    {
    }
    else
    {
      int v6 = sub_23763682C();

      if (v6)
      {
        id v7 = [MEMORY[0x263F1C988] customDetentWithIdentifier:@"markupDetentIdentifier" resolver:&unk_26EA57538];
        v9[0] = v7;
        id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
        [v4 setDetents:v8];

        [v4 setSelectedDetentIdentifier:@"markupDetentIdentifier"];
      }
    }
  }
}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  id v4 = [(AKToolbarView *)self annotationController];
  id v3 = [[AKMinimalUserInterfaceItem alloc] initWithTag:764019];
  [v4 performActionForSender:v3];
}

- (void)toolsList:(id)a3 didSelectToolWithTag:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 764066)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_237635730;
    v14[3] = &unk_264CDAE40;
    v14[4] = self;
    id v12 = v14;
LABEL_6:
    [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:1 withCompletion:v12];
    goto LABEL_7;
  }
  if (a4 != 764019)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_237635738;
    v13[3] = &unk_264CDB1D0;
    v13[4] = self;
    void v13[5] = a4;
    id v12 = v13;
    goto LABEL_6;
  }
  shapesPickerButton = self->_shapesPickerButton;
  id v9 = [v6 popoverPresentationController];
  id v10 = [v9 sourceView];
  id v11 = [v7 popoverPresentationController];
  [v11 sourceRect];
  -[AKToolbarView _showSignaturesPopover:fromSourceView:sourceRect:](self, "_showSignaturesPopover:fromSourceView:sourceRect:", shapesPickerButton, v10);

LABEL_7:
}

- (void)toolsListDidSelectOpacityItem:(id)a3
{
  [(AKToolbarView *)self _dismissCurrentlyPresentedPopoverAnimated:1 withCompletion:0];
  id v7 = [(AKToolbarView *)self opacityEditingDelegate];
  if (v7)
  {
    id v4 = [(AKToolbarView *)self _paletteView];
    [v4 startOpacityEditing];

    id v5 = [(AKToolbarView *)self _paletteView];
    id v6 = [v5 opacityEditingView];
    [v7 toolbarDidSelectOpacityOptionWithAccessoryView:v6];
  }
}

- (void)attributePicker:(id)a3 didSelectToolWithTag:(int64_t)a4 attributeTag:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v8 = [(AKToolbarView *)self annotationController];
  id v9 = [v8 currentPageController];
  uint64_t v26 = [v9 pageModelController];

  double v25 = [v26 selectedAnnotations];
  id v10 = [(AKMinimalUserInterfaceItem *)[AKMinimalColorChooserUserInterfaceItem alloc] initWithTag:765102];
  id v11 = v10;
  if (a4 == 765102)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v25;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v31;
      id v15 = &selRef_setLastSafeAreaInsets_;
LABEL_4:
      uint64_t v16 = 0;
      double v17 = v15;
      while (1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          break;
        }
        if (v13 == ++v16)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
          id v15 = v17;
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v21 = [v18 strokeColor];

      if (v21) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_10:
    }
    CGFloat v22 = [v8 attributeController];
    id v21 = [v22 strokeColor];

LABEL_16:
    [(AKMinimalColorChooserUserInterfaceItem *)v11 setColor:v21];
    [v8 performActionForSender:v11];
  }
  else
  {
    [(AKMinimalColorChooserUserInterfaceItem *)v10 setColor:0];
    [v8 performActionForSender:v11];
    id v19 = [[AKMinimalUserInterfaceItem alloc] initWithTag:a4];
    [v8 performActionForSender:v19];
    if (a5 != 763000)
    {
      CGFloat v20 = [[AKMinimalUserInterfaceItem alloc] initWithTag:a5];

      [v8 performActionForSender:v20];
      id v19 = v20;
    }
  }
  if (self->_attributePickerViewController)
  {
    objc_initWeak(&location, self);
    attributePickerViewController = self->_attributePickerViewController;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_237635B8C;
    v27[3] = &unk_264CDB1F8;
    objc_copyWeak(&v28, &location);
    [(AKAttributePickerViewController *)attributePickerViewController dismissViewControllerAnimated:1 completion:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)setSupportsOpacityEditing:(BOOL)a3
{
  self->_supportsOpacityEditing = a3;
  [(AKToolbarView *)self _updatePalette];
}

- (BOOL)supportsOpacityEditing
{
  return self->_supportsOpacityEditing;
}

- (BOOL)_hasSelectedAnnotations
{
  id v2 = [(AKToolbarView *)self selectedAnnotations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setInk:(id)a3
{
  id v4 = a3;
  id v8 = [(AKToolbarView *)self annotationController];
  [(AKToolbarView *)self _updateAttributeControllerInk:v4];

  id v5 = [v8 toolController];
  uint64_t v6 = [v5 toolMode];

  if (v6 != 4 && [v8 annotationEditingEnabled])
  {
    id v7 = [[AKMinimalUserInterfaceItem alloc] initWithTag:764017];
    [v8 performActionForSender:v7];
  }
}

- (id)paletteViewSelectedAnnotationColor:(id)a3
{
  id v4 = [(AKToolbarView *)self annotationController];
  id v5 = [v4 attributeController];
  uint64_t v6 = [(AKToolbarView *)self selectedAnnotations];
  id v7 = [v6 anyObject];

  if (v7) {
    [v7 valueForKey:@"strokeColor"];
  }
  else {
  id v8 = [v5 strokeColor];
  }

  return v8;
}

- (void)paletteViewDidSelectPlusButton:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1C8A0];
  id v5 = a3;
  [v4 _setAlwaysAllowPopoverPresentations:1];
  uint64_t v6 = objc_alloc_init(AKToolsListViewController);
  [(AKToolsListViewController *)v6 setSupportsOpacityEditing:[(AKToolbarView *)self supportsOpacityEditing]];
  id v7 = [(AKToolbarView *)self annotationController];
  -[AKToolsListViewController setSupportsImageDescriptionEditing:](v6, "setSupportsImageDescriptionEditing:", [v7 supportsImageDescriptionEditing]);

  [(AKToolsListViewController *)v6 setDelegate:self];
  [(AKToolsListViewController *)v6 setModalPresentationStyle:7];
  id v8 = [(AKToolsListViewController *)v6 popoverPresentationController];
  [v8 setDelegate:self];

  id v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v10 = [(AKToolsListViewController *)v6 popoverPresentationController];
  [v10 setBackgroundColor:v9];

  toolsListViewController = self->_toolsListViewController;
  self->_toolsListViewController = v6;
  id v12 = v6;

  id v24 = [(AKToolsListViewController *)v12 popoverPresentationController];
  [v24 _setShouldDisableInteractionDuringTransitions:0];
  uint64_t v13 = [(AKToolbarView *)self _toolPickerPopoverConfiguration];
  uint64_t v14 = [v13 passthroughViews];
  [v24 setPassthroughViews:v14];

  id v15 = [(AKToolbarView *)self _toolPickerPopoverConfiguration];
  objc_msgSend(v24, "setPermittedArrowDirections:", objc_msgSend(v15, "permittedArrowDirections"));

  [v24 setSourceView:v5];
  [v5 plusButtonFrame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v26.origin.CGFloat x = v17;
  v26.origin.CGFloat y = v19;
  v26.size.CGFloat width = v21;
  v26.size.CGFloat height = v23;
  CGRect v27 = CGRectInset(v26, -5.0, -5.0);
  objc_msgSend(v24, "setSourceRect:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  [v24 _setIgnoresKeyboardNotifications:1];
  [(AKToolbarView *)self _presentViewController:v12 animated:1];
}

- (id)_toolPickerUndoManager:(id)a3
{
  BOOL v3 = [(AKToolbarView *)self annotationController];
  id v4 = [v3 undoController];
  id v5 = [v4 undoManager];

  return v5;
}

- (BOOL)_toolPicker:(id)a3 shouldChangeSelectedToolColor:(id)a4
{
  return ![(AKToolbarView *)self _hasSelectedAnnotations];
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  [(AKToolbarView *)self _updatePaletteUI];
  id v5 = [(AKToolbarView *)self annotationController];
  [v5 _updateGestureDependencyPriority];
  [v5 toolPickerVisibilityDidChange:v4];
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v5 = [a3 selectedTool];
  id v4 = [v5 ink];
  [(AKToolbarView *)self setInk:v4];
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4 = a3;
  id v8 = [(AKToolbarView *)self annotationController];
  int v5 = [v4 isRulerActive];

  uint64_t v6 = [v8 attributeController];
  id v7 = v6;
  if (v5) {
    [v6 forceShowRuler];
  }
  else {
    [v6 forceHideRuler];
  }
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (![(AKToolbarView *)self _hasSelectedAnnotations])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);
    id v7 = [WeakRetained currentPageController];

    id v12 = [v7 inkPageOverlayController];
    uint64_t v13 = [v12 inkOverlayView];
    uint64_t v14 = [v13 canvasView];

    [v14 _toolPicker:v16 didChangeColor:v6];
    goto LABEL_9;
  }
  id v7 = [(AKToolbarView *)self annotationController];
  int64_t v8 = +[AKToolbarUtilities attributeTagForCurrentSelectionState:v7];
  if (v8 == 765106)
  {
    id v9 = [AKMinimalTextColorUserInterfaceItem alloc];
    uint64_t v10 = 765106;
    goto LABEL_7;
  }
  if (v8 == 765101)
  {
    id v9 = [AKMinimalColorChooserUserInterfaceItem alloc];
    uint64_t v10 = 765101;
LABEL_7:
    id v15 = [(AKMinimalUserInterfaceItem *)v9 initWithTag:v10];
    [(AKMinimalColorChooserUserInterfaceItem *)v15 setColor:v6];
    [v7 performActionForSender:v15];

    goto LABEL_9;
  }
  NSLog(&cfstr_SCalledWithInc.isa, "-[AKToolbarView _toolPicker:didChangeColor:]", v8);
LABEL_9:
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
}

- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
}

- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4
{
}

+ (id)undoButtonImageWithStyle:(unint64_t)a3
{
  if (a3 == 1) {
    BOOL v3 = @"AKModern_Undo_Bold";
  }
  else {
    BOOL v3 = @"AKModern_Undo";
  }
  return (id)[MEMORY[0x263F1C6B0] akImageNamed:v3];
}

+ (id)redoButtonImageWithStyle:(unint64_t)a3
{
  if (a3 == 1) {
    BOOL v3 = @"AKModern_Redo_Bold";
  }
  else {
    BOOL v3 = @"AKModern_Redo";
  }
  return (id)[MEMORY[0x263F1C6B0] akImageNamed:v3];
}

+ (id)undoButtonImage
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_undoButtonImageWithStyle_);
}

+ (id)redoButtonImage
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_redoButtonImageWithStyle_);
}

- (CGRect)frameObscuredInView:(id)a3
{
  id v4 = a3;
  int v5 = [(AKToolbarView *)self toolPicker];
  [v5 frameObscuredInView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (NSString)description
{
  BOOL v3 = NSString;
  if ([(AKToolbarView *)self isHidden]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [(AKToolbarView *)self alpha];
  uint64_t v6 = v5;
  if ([(AKToolbarView *)self contentsHidden]) {
    double v7 = @"YES";
  }
  else {
    double v7 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"<AKToolbarView: %p, hidden: %@, alpha:%f, contentsHidden:%@>", self, v4, v6, v7];
}

- (AKController)annotationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationController);

  return (AKController *)WeakRetained;
}

- (void)setToolPicker:(id)a3
{
}

- (BOOL)undoRedoButtonsHidden
{
  return self->_undoRedoButtonsHidden;
}

- (BOOL)alwaysShowUndoButton
{
  return self->_alwaysShowUndoButton;
}

- (void)setAlwaysShowUndoButton:(BOOL)a3
{
  self->_alwaysShowUndoButton = a3;
}

- (BOOL)isShareButtonHidden
{
  return self->_shareButtonHidden;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (AKToolbarViewOpacityEditingDelegate)opacityEditingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityEditingDelegate);

  return (AKToolbarViewOpacityEditingDelegate *)WeakRetained;
}

- (void)setOpacityEditingDelegate:(id)a3
{
}

- (BOOL)wantsClearBackgroundColorInCompactSize
{
  return self->_wantsClearBackgroundColorInCompactSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityEditingDelegate);
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_destroyWeak((id *)&self->_annotationController);
  objc_storeStrong((id *)&self->_imageDescriptionViewController, 0);
  objc_storeStrong((id *)&self->_attributesPickerButtonHeigthConstraint, 0);
  objc_storeStrong((id *)&self->_attributesPickerButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_attributesPickerButton, 0);
  objc_storeStrong((id *)&self->_attributePickerViewController, 0);
  objc_storeStrong((id *)&self->_toolsListViewController, 0);
  objc_storeStrong((id *)&self->_signaturesCreationController, 0);
  objc_storeStrong((id *)&self->_signaturesSheetViewController, 0);
  objc_storeStrong((id *)&self->_textAttributesViewController, 0);
  objc_storeStrong((id *)&self->_undoAlertController, 0);
  objc_storeStrong((id *)&self->_signaturesAlertController, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_attributesAddShapeFixedSpace, 0);
  objc_storeStrong((id *)&self->_undoRedoFixedSpace, 0);
  objc_storeStrong((id *)&self->_attributesPickerBarButton, 0);
  objc_storeStrong((id *)&self->_shapesPickerButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

- (void)_askAnnotationControllerDelegateToEnterFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AKToolbarView *)self annotationController];
  id v4 = [v5 delegate];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [v4 controllerWillShowSignatureCaptureView:v5];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v4 controllerWillDismissSignatureCaptureView:v5];
  }
}

- (void)_presentImageDescriptionViewController
{
  if (!self->_imageDescriptionViewController)
  {
    [(AKToolbarView *)self _askAnnotationControllerDelegateToEnterFullScreen:1];
    BOOL v3 = [(AKToolbarView *)self annotationController];
    id v4 = [v3 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 performSelector:sel_contentSnapshot];
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v6 = (void *)qword_268925120;
    uint64_t v17 = qword_268925120;
    if (!qword_268925120)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = sub_237642E28;
      v13[3] = &unk_264CDB2A8;
      v13[4] = &v14;
      sub_237642E28((uint64_t)v13);
      uint64_t v6 = (void *)v15[3];
    }
    double v7 = v6;
    _Block_object_dispose(&v14, 8);
    double v8 = (AXSSImageDescriptionViewController *)[[v7 alloc] initWithContentSnapshot:v5];
    imageDescriptionViewController = self->_imageDescriptionViewController;
    self->_imageDescriptionViewController = v8;

    double v10 = +[AKController akBundle];
    double v11 = [v10 localizedStringForKey:@"Image Description" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
    [(AXSSImageDescriptionViewController *)self->_imageDescriptionViewController setTitle:v11];

    [(AXSSImageDescriptionViewController *)self->_imageDescriptionViewController setModalPresentationStyle:2];
    [(AXSSImageDescriptionViewController *)self->_imageDescriptionViewController setModalInPresentation:0];
    [(AXSSImageDescriptionViewController *)self->_imageDescriptionViewController setDelegate:self];
    double v12 = [v3 originalOrModifiedImageDescription];
    [(AXSSImageDescriptionViewController *)self->_imageDescriptionViewController setImageDescription:v12];

    [(AKToolbarView *)self _configureCustomDetentPresentationIfNeeded:self->_imageDescriptionViewController];
    [(AKToolbarView *)self _presentViewController:self->_imageDescriptionViewController animated:1];
  }
}

- (void)_dismissImageDescriptionViewController
{
  BOOL v3 = [(AKToolbarView *)self popoverPresentingController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_237642CD4;
  v5[3] = &unk_264CDAE40;
  v5[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v5];

  imageDescriptionViewController = self->_imageDescriptionViewController;
  self->_imageDescriptionViewController = 0;
}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  if (self->_imageDescriptionViewController) {
    MEMORY[0x270F9A6D0](self, sel__dismissImageDescriptionViewController);
  }
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  if (self->_imageDescriptionViewController)
  {
    id v4 = [a3 imageDescription];
    id v5 = [(AKToolbarView *)self annotationController];
    [v5 setModifiedImageDescription:v4];

    MEMORY[0x270F9A6D0](self, sel__dismissImageDescriptionViewController);
  }
}

- (void)imageDescriptionViewControllerDidDismiss:(id)a3
{
  if (self->_imageDescriptionViewController)
  {
    [(AKToolbarView *)self _askAnnotationControllerDelegateToEnterFullScreen:0];
    [(AKToolbarView *)self becomeFirstResponder];
    imageDescriptionViewController = self->_imageDescriptionViewController;
    self->_imageDescriptionViewController = 0;
  }
}

@end