@interface AKToolbarViewController_iOS
- (AKColorPickerViewController)colorPickerPopoverViewController;
- (AKFloatingAttributePickerViewController)attributeToolbarViewController;
- (AKLineStylesViewController)lineStylesViewController;
- (AKSignaturesViewController_iOS)signaturesSheetViewController;
- (AKTextAttributesViewController)textAttributesViewController;
- (AKToolbarViewController_iOS)initWithController:(id)a3;
- (BOOL)_legacyDoodlesEnabled;
- (BOOL)_validateUndoButton;
- (BOOL)isPresentingPopover;
- (BOOL)isPresentingPopovers;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (NSArray)staticToolbarItems;
- (NSLayoutConstraint)attributeToolbarViewControllerConstraint;
- (UIAlertController)signaturesAlertController;
- (UIAlertController)undoAlertController;
- (UIBarButtonItem)inkButton;
- (UIBarButtonItem)lineStyleButton;
- (UIBarButtonItem)loupeButton;
- (UIBarButtonItem)redoButton;
- (UIBarButtonItem)richSketchButton;
- (UIBarButtonItem)signatureButton;
- (UIBarButtonItem)sketchButton;
- (UIBarButtonItem)strokeColorButton;
- (UIBarButtonItem)textButton;
- (UIBarButtonItem)textStyleButton;
- (UIBarButtonItem)undoButton;
- (UIColor)barTintColor;
- (UIColor)tintColor;
- (UIView)floatingAttributeToolbarContainer;
- (double)heightIncludingAdditionalVisibleBars;
- (double)visibleHeightOfAttributeBar;
- (id)_barButtonForToolbarType:(unint64_t)a3;
- (id)_buildUndoAlertController;
- (id)_createNewColorPickerToolbarButtonWithTarget:(id)a3 selector:(SEL)a4;
- (id)_createNewCustomViewToolbarButtonWithImage:(id)a3 target:(id)a4 selector:(SEL)a5;
- (id)_createNewToggleToolbarButtonWithImage:(id)a3 tag:(int64_t)a4 target:(id)a5 selector:(SEL)a6 autoUpdatesColor:(BOOL)a7;
- (id)_doodleModeToolbarImage;
- (id)_toolbarButtonItemOfType:(unint64_t)a3;
- (int64_t)_attributeTagForCurrentSelectionState;
- (unint64_t)_workaroundToolbarPopoverPositioningBug26744300;
- (void)_buildBasicItems;
- (void)_deleteSelectedItems:(id)a3;
- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_layoutAttributeContainer;
- (void)_layoutToolbarForTraitCollection:(id)a3;
- (void)_peripheralAvailabilityDidUpdate:(id)a3;
- (void)_redoButtonAction:(id)a3;
- (void)_setupPassthroughViewsForViewController:(id)a3;
- (void)_showColorPickerPopover:(id)a3;
- (void)_showLineStylePopover:(id)a3;
- (void)_showSignaturesPopover:(id)a3;
- (void)_showTextStylePopover:(id)a3;
- (void)_showUndoAlert:(id)a3;
- (void)_undoAllButtonAction:(id)a3;
- (void)_undoButtonAction:(id)a3;
- (void)_undoLongPressAction:(id)a3;
- (void)_undoManagerNotification:(id)a3;
- (void)_updateToggleButton:(id)a3 withTraitCollection:(id)a4;
- (void)dealloc;
- (void)dismissAttributeToolbarForSelectedAnnotations;
- (void)dismissAttributeToolbarImmediately;
- (void)dismissPresentedPopovers;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)revalidateItems;
- (void)setAttributeToolbarViewController:(id)a3;
- (void)setAttributeToolbarViewControllerConstraint:(id)a3;
- (void)setBarTintColor:(id)a3;
- (void)setColorPickerPopoverViewController:(id)a3;
- (void)setFloatingAttributeToolbarContainer:(id)a3;
- (void)setInkButton:(id)a3;
- (void)setLineStyleButton:(id)a3;
- (void)setLineStylesViewController:(id)a3;
- (void)setLoupeButton:(id)a3;
- (void)setRedoButton:(id)a3;
- (void)setRichSketchButton:(id)a3;
- (void)setSignatureButton:(id)a3;
- (void)setSignaturesAlertController:(id)a3;
- (void)setSignaturesSheetViewController:(id)a3;
- (void)setSketchButton:(id)a3;
- (void)setStaticToolbarItems:(id)a3;
- (void)setStrokeColorButton:(id)a3;
- (void)setTextAttributesViewController:(id)a3;
- (void)setTextButton:(id)a3;
- (void)setTextStyleButton:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUndoAlertController:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)showAttributeToolbarForSelectedAnnotations:(id)a3 andToolMode:(unint64_t)a4;
- (void)signatureCreationControllerDidCreateSignature:(id)a3;
- (void)signaturesViewControllerContinueToCreateSignature:(id)a3;
- (void)signaturesViewControllerContinueToManageSignatures:(id)a3;
- (void)signaturesViewControllerDidCancel:(id)a3;
- (void)signaturesViewControllerDidSelectSignature:(id)a3;
- (void)signaturesViewControllerEnterSignatureMode:(id)a3;
- (void)syncUIToSelectedColor;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AKToolbarViewController_iOS

- (BOOL)_legacyDoodlesEnabled
{
  if (qword_268925198 != -1) {
    dispatch_once(&qword_268925198, &unk_26EA57598);
  }
  return byte_268925190;
}

- (unint64_t)_workaroundToolbarPopoverPositioningBug26744300
{
  v2 = [(AKToolbarViewController_iOS *)self undoButton];
  v3 = [v2 customView];

  if (!v3) {
    NSLog(&cfstr_UndoButtonMust.isa);
  }
  v4 = [v3 window];
  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v3);
  double v6 = v5;

  v7 = [v3 window];
  [v7 bounds];
  double v9 = v8;

  if (v6 < v9 * 0.5) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = 2;
  }

  return v10;
}

- (AKToolbarViewController_iOS)initWithController:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKToolbarViewController_iOS;
  double v5 = [(AKToolbarViewController *)&v19 initWithController:v4];
  double v6 = v5;
  if (v5)
  {
    [(AKToolbarViewController_iOS *)v5 _buildBasicItems];
    v7 = [v4 undoController];
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v9 = *MEMORY[0x263F08638];
    unint64_t v10 = [v7 undoManager];
    [v8 addObserver:v6 selector:sel__undoManagerNotification_ name:v9 object:v10];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = *MEMORY[0x263F08630];
    v13 = [v7 undoManager];
    [v11 addObserver:v6 selector:sel__undoManagerNotification_ name:v12 object:v13];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = *MEMORY[0x263F08620];
    v16 = [v7 undoManager];
    [v14 addObserver:v6 selector:sel__undoManagerNotification_ name:v15 object:v16];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v6 selector:sel__peripheralAvailabilityDidUpdate_ name:@"AKPeripheralAvailabilityManagerAvailabilityNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_dismissAttributeToolbarForSelectedAnnotations object:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:0];
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarViewController_iOS;
  [(AKToolbarViewController_iOS *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CAE0]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [(AKToolbarViewController_iOS *)self setView:v8];

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v5, v6, v7);
  [(AKToolbarViewController_iOS *)self setFloatingAttributeToolbarContainer:v9];

  id v10 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
  [v10 setHidden:1];
}

- (void)_buildBasicItems
{
  if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 13;
  }
  double v4 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:v3];
  [(AKToolbarViewController_iOS *)self setSketchButton:v4];

  double v5 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:13];
  [(AKToolbarViewController_iOS *)self setInkButton:v5];

  double v6 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:3];
  [(AKToolbarViewController_iOS *)self setSignatureButton:v6];

  double v7 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:9];
  [(AKToolbarViewController_iOS *)self setLoupeButton:v7];

  double v8 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:4];
  [(AKToolbarViewController_iOS *)self setTextButton:v8];

  uint64_t v9 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:10];
  [(AKToolbarViewController_iOS *)self setUndoButton:v9];

  id v10 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:11];
  [(AKToolbarViewController_iOS *)self setRedoButton:v10];

  v11 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:5];
  [(AKToolbarViewController_iOS *)self setTextStyleButton:v11];

  uint64_t v12 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:6];
  [(AKToolbarViewController_iOS *)self setLineStyleButton:v12];

  v13 = [(AKToolbarViewController_iOS *)self _barButtonForToolbarType:7];
  [(AKToolbarViewController_iOS *)self setStrokeColorButton:v13];

  [(AKToolbarViewController_iOS *)self _layoutToolbarForTraitCollection:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKToolbarViewController_iOS;
  id v4 = a3;
  [(AKToolbarViewController_iOS *)&v8 traitCollectionDidChange:v4];
  double v5 = [(AKToolbarViewController_iOS *)self traitCollection];
  BOOL v6 = sub_2376718B0(v5, v4);

  if (!v6)
  {
    double v7 = [(AKToolbarViewController_iOS *)self traitCollection];
    [(AKToolbarViewController_iOS *)self _layoutToolbarForTraitCollection:v7];

    [(AKToolbarViewController_iOS *)self revalidateItems];
  }
}

- (void)_layoutToolbarForTraitCollection:(id)a3
{
  v42[15] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38 = [(AKToolbarViewController_iOS *)self view];
  v37 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v37 setWidth:8.0];
  double v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  objc_setAssociatedObject(v5, sel_akToolbarButtonItemType, &unk_26EA765B0, (void *)0x303);
  BOOL v6 = sub_237671860(v4);
  double v7 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
  [v7 setHidden:v6];

  objc_super v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v9 = [(AKToolbarViewController_iOS *)self inkButton];
  id v10 = (void *)v9;
  if (!v6)
  {
    v40[0] = v9;
    v40[1] = v5;
    v21 = [(AKToolbarViewController_iOS *)self loupeButton];
    v40[2] = v21;
    v40[3] = v5;
    v22 = [(AKToolbarViewController_iOS *)self textButton];
    v40[4] = v22;
    v40[5] = v5;
    v23 = [(AKToolbarViewController_iOS *)self signatureButton];
    v40[6] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:7];
    v17 = [v8 arrayWithArray:v24];

    if (![(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled]) {
      goto LABEL_8;
    }
    v18 = [(AKToolbarViewController_iOS *)self sketchButton];
    v39[0] = v18;
    v39[1] = v5;
    objc_super v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v20 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 2);
    [v17 insertObjects:v19 atIndexes:v20];
    goto LABEL_6;
  }
  id v36 = v4;
  v42[0] = v9;
  v42[1] = v5;
  v35 = [(AKToolbarViewController_iOS *)self loupeButton];
  v42[2] = v35;
  v42[3] = v5;
  v11 = [(AKToolbarViewController_iOS *)self textButton];
  v42[4] = v11;
  v42[5] = v5;
  uint64_t v12 = [(AKToolbarViewController_iOS *)self signatureButton];
  v42[6] = v12;
  v42[7] = v5;
  v42[8] = v5;
  v42[9] = v5;
  v13 = [(AKToolbarViewController_iOS *)self strokeColorButton];
  v42[10] = v13;
  v42[11] = v5;
  v14 = [(AKToolbarViewController_iOS *)self lineStyleButton];
  v42[12] = v14;
  v42[13] = v5;
  uint64_t v15 = [(AKToolbarViewController_iOS *)self textStyleButton];
  v42[14] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:15];
  v17 = [v8 arrayWithArray:v16];

  if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled])
  {
    v18 = [(AKToolbarViewController_iOS *)self sketchButton];
    v41[0] = v18;
    v41[1] = v5;
    objc_super v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    v20 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 2);
    [v17 insertObjects:v19 atIndexes:v20];
    id v4 = v36;
LABEL_6:

    goto LABEL_8;
  }
  id v4 = v36;
LABEL_8:
  [(AKToolbarViewController_iOS *)self setStaticToolbarItems:v17];

  v25 = [(AKToolbarViewController_iOS *)self barTintColor];
  v26 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  v27 = [v26 toolbar];
  [v27 setBarTintColor:v25];

  if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled])
  {
    v28 = [(AKToolbarViewController_iOS *)self sketchButton];
    [(AKToolbarViewController_iOS *)self _updateToggleButton:v28 withTraitCollection:v4];
  }
  v29 = [(AKToolbarViewController_iOS *)self inkButton];
  [(AKToolbarViewController_iOS *)self _updateToggleButton:v29 withTraitCollection:v4];

  v30 = [(AKToolbarViewController_iOS *)self signatureButton];
  [(AKToolbarViewController_iOS *)self _updateToggleButton:v30 withTraitCollection:v4];

  v31 = [(AKToolbarViewController_iOS *)self staticToolbarItems];
  v32 = [(AKToolbarViewController *)self controller];
  v33 = [v32 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v34 = [v33 controller:v32 willSetToolbarItems:v31];

    v31 = (void *)v34;
  }
  [v38 setItems:v31 animated:0];
}

- (void)_updateToggleButton:(id)a3 withTraitCollection:(id)a4
{
  id v17 = [a3 customView];
  double v5 = [(AKToolbarViewController_iOS *)self barTintColor];
  if (v5
    && ([MEMORY[0x263F1C550] whiteColor],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 akIsEqualToColor:v6],
        v6,
        !v7))
  {
    [v17 setShouldTintNormalImage:1];
    [v17 setShowsBackgroundColor:0];
    v11 = [MEMORY[0x263F1C550] whiteColor];
    [v17 setTintColor:v11];

    uint64_t v10 = [MEMORY[0x263F1C550] systemBlueColor];
  }
  else
  {
    [v17 setShouldTintNormalImage:1];
    [v17 setShowsBackgroundColor:1];
    objc_super v8 = [(AKToolbarViewController_iOS *)self view];
    uint64_t v9 = [v8 tintColor];
    [v17 setTintColor:v9];

    uint64_t v10 = [MEMORY[0x263F1C550] whiteColor];
  }
  uint64_t v12 = (void *)v10;
  [v17 setSelectedColor:v10];

  if ([v17 tag] == 764015)
  {
    uint64_t v13 = [(AKToolbarViewController_iOS *)self _doodleModeToolbarImage];
LABEL_14:
    v16 = (void *)v13;
    [v17 setTemplateImage:v13];
    [v17 setImage:v16 forState:0];

    goto LABEL_15;
  }
  if ([v17 tag] == 764016)
  {
    v14 = objc_opt_class();
    uint64_t v15 = 1;
LABEL_13:
    uint64_t v13 = [v14 imageForToolbarButtonItemOfType:v15];
    goto LABEL_14;
  }
  if ([v17 tag] == 764017)
  {
    v14 = objc_opt_class();
    uint64_t v15 = 13;
    goto LABEL_13;
  }
  if ([v17 tag] == 764022)
  {
    v14 = objc_opt_class();
    uint64_t v15 = 3;
    goto LABEL_13;
  }
  [v17 tag];
LABEL_15:
}

- (void)revalidateItems
{
  id v31 = [(AKToolbarViewController *)self controller];
  if (([v31 isTornDown] & 1) == 0)
  {
    if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled])
    {
      uint64_t v3 = [(AKToolbarViewController_iOS *)self sketchButton];
      id v4 = [v3 customView];
      [v31 validateSender:v4];
    }
    double v5 = [(AKToolbarViewController_iOS *)self inkButton];
    BOOL v6 = [v5 customView];
    [v31 validateSender:v6];

    int v7 = [(AKToolbarViewController_iOS *)self signatureButton];
    objc_super v8 = [v7 customView];
    [v31 validateSender:v8];

    if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled])
    {
      uint64_t v9 = [(AKToolbarViewController_iOS *)self richSketchButton];

      if (v9)
      {
        uint64_t v10 = [(AKToolbarViewController_iOS *)self richSketchButton];
        v11 = [v10 customView];
        [v31 validateSender:v11];
      }
    }
    uint64_t v12 = [v31 validateUndo:0];
    uint64_t v13 = [v31 validateRedo:0];
    v14 = [(AKToolbarViewController_iOS *)self undoButton];
    [v14 setEnabled:v12];

    uint64_t v15 = [(AKToolbarViewController_iOS *)self redoButton];
    [v15 setEnabled:v13];

    v16 = [v31 toolController];
    id v17 = [v31 currentPageController];
    v18 = [v17 pageModelController];

    objc_super v19 = [v18 selectedAnnotations];
    v20 = [(AKToolbarViewController_iOS *)self traitCollection];
    BOOL v21 = sub_237671860(v20);

    if (v21)
    {
      if ([v19 count] == 1)
      {
        v22 = [v19 anyObject];
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        char v23 = 1;
      }
      v25 = [(AKToolbarViewController_iOS *)self lineStyleButton];
      uint64_t v26 = v23 & 1;
      [v25 setEnabled:v26];

      v27 = [(AKToolbarViewController_iOS *)self textStyleButton];
      [v27 setEnabled:v26];

      v28 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
      v29 = [v28 viewIfLoaded];
      v30 = [v29 superview];

      if (v30) {
        [(AKToolbarViewController_iOS *)self dismissAttributeToolbarImmediately];
      }
    }
    else
    {
      unint64_t v24 = [v16 toolMode];
      if ([v19 count] || v24 <= 5 && ((1 << v24) & 0x36) != 0) {
        [(AKToolbarViewController_iOS *)self showAttributeToolbarForSelectedAnnotations:v19 andToolMode:v24];
      }
      else {
        [(AKToolbarViewController_iOS *)self performSelector:sel_dismissAttributeToolbarForSelectedAnnotations withObject:0 afterDelay:0.0];
      }
    }
    [(AKToolbarViewController_iOS *)self syncUIToSelectedColor];
  }
}

- (void)syncUIToSelectedColor
{
  uint64_t v3 = [(AKToolbarViewController *)self controller];
  id v4 = [v3 attributeController];
  double v5 = [v3 currentPageController];
  BOOL v6 = [v5 pageModelController];

  int v7 = [v6 selectedAnnotations];
  if ([v7 count] == 1)
  {
    objc_super v8 = [v7 anyObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v7 anyObject];
      v11 = [v10 typingAttributes];
      id v18 = [v11 objectForKey:*MEMORY[0x263F1C240]];

      goto LABEL_7;
    }
  }
  if ([v7 count] == 1)
  {
    uint64_t v12 = [v7 anyObject];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v10 = [v7 anyObject];
      id v18 = [v10 performSelector:sel_strokeColor];
LABEL_7:

      if (v18) {
        goto LABEL_9;
      }
    }
  }
  id v18 = [v4 strokeColor];
LABEL_9:
  v14 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
  [v14 setColor:v18];

  uint64_t v15 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  [v15 setColor:v18];

  v16 = [(AKToolbarViewController_iOS *)self strokeColorButton];
  id v17 = [v16 customView];

  [v17 setColor:v18];
}

- (id)_barButtonForToolbarType:(unint64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  double v5 = [(AKToolbarViewController *)self controller];
  BOOL v6 = 0;
  int v7 = 0;
  switch(a3)
  {
    case 0uLL:
      BOOL v6 = [(AKToolbarViewController_iOS *)self _doodleModeToolbarImage];
      uint64_t v8 = 764015;
      goto LABEL_15;
    case 1uLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:1];
      uint64_t v8 = 764016;
      goto LABEL_15;
    case 3uLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:3];
      uint64_t v9 = [(AKToolbarViewController_iOS *)self _createNewToggleToolbarButtonWithImage:v6 tag:764022 target:self selector:sel__showSignaturesPopover_ autoUpdatesColor:0];
      int v7 = v9;
      uint64_t v10 = 764019;
      goto LABEL_11;
    case 4uLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:4];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v6 style:0 target:v5 action:sel_performActionForSender_];
      int v7 = v9;
      uint64_t v10 = 764014;
      goto LABEL_11;
    case 5uLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:5];
      v11 = sel__showTextStylePopover_;
      goto LABEL_8;
    case 6uLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:6];
      v11 = sel__showLineStylePopover_;
LABEL_8:
      uint64_t v12 = [(AKToolbarViewController_iOS *)self _createNewCustomViewToolbarButtonWithImage:v6 target:self selector:v11];
      goto LABEL_16;
    case 7uLL:
      int v7 = [(AKToolbarViewController_iOS *)self _createNewColorPickerToolbarButtonWithTarget:self selector:sel__showColorPickerPopover_];
      BOOL v6 = 0;
      goto LABEL_17;
    case 9uLL:
      BOOL v6 = +[AKAnnotationImageHelper imageForShapeTag:764020];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v6 style:0 target:v5 action:sel_performActionForSender_];
      int v7 = v9;
      uint64_t v10 = 764020;
LABEL_11:
      [v9 setTag:v10];
      goto LABEL_17;
    case 0xAuLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:10];
      int v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v6 style:0 target:v5 action:sel_undo_];
      char v13 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__undoLongPressAction_];
      v17[0] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      [v7 _setGestureRecognizers:v14];

      goto LABEL_17;
    case 0xBuLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:11];
      uint64_t v12 = [objc_alloc(MEMORY[0x263F1C468]) initWithImage:v6 style:0 target:v5 action:sel_redo_];
      goto LABEL_16;
    case 0xDuLL:
      BOOL v6 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:13];
      uint64_t v8 = 764017;
LABEL_15:
      uint64_t v12 = [(AKToolbarViewController_iOS *)self _createNewToggleToolbarButtonWithImage:v6 tag:v8 target:v5 selector:sel_performActionForSender_ autoUpdatesColor:1];
LABEL_16:
      int v7 = (void *)v12;
LABEL_17:
      if (v7)
      {
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
        objc_setAssociatedObject(v7, sel_akToolbarButtonItemType, v15, (void *)0x303);
      }
      break;
    default:
      break;
  }

  return v7;
}

- (void)_deleteSelectedItems:(id)a3
{
  id v9 = [(AKToolbarViewController *)self controller];
  uint64_t v3 = [v9 currentPageController];
  id v4 = [v3 pageModelController];
  double v5 = [v4 selectedAnnotations];
  BOOL v6 = [v5 allObjects];

  if ([v6 count])
  {
    int v7 = [v3 pageModelController];
    uint64_t v8 = [v7 mutableArrayValueForKey:@"annotations"];

    [v8 removeObjectsInArray:v6];
  }
}

- (id)_toolbarButtonItemOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self sketchButton];
      break;
    case 1uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self richSketchButton];
      break;
    case 3uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self signatureButton];
      break;
    case 4uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self textButton];
      break;
    case 5uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self textStyleButton];
      break;
    case 6uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self lineStyleButton];
      break;
    case 7uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self strokeColorButton];
      break;
    case 9uLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self loupeButton];
      break;
    case 0xAuLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self undoButton];
      break;
    case 0xBuLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self redoButton];
      break;
    case 0xDuLL:
      uint64_t v3 = [(AKToolbarViewController_iOS *)self inkButton];
      break;
    default:
      NSLog(&cfstr_Toolbarbuttoni.isa, a2, a3);
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

- (id)_createNewToggleToolbarButtonWithImage:(id)a3 tag:(int64_t)a4 target:(id)a5 selector:(SEL)a6 autoUpdatesColor:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  v14 = [AKToggleButton alloc];
  uint64_t v15 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:](v14, "initWithFrame:templateImage:autoUpdatesColor:", v12, v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v16 = [(AKToolbarViewController_iOS *)self traitCollection];
  BOOL v17 = sub_237671860(v16);

  [(AKToggleButton *)v15 setShouldTintNormalImage:1];
  if (v17)
  {
    [(AKToggleButton *)v15 setShowsBackgroundColor:1];
    id v18 = [(AKToolbarViewController_iOS *)self view];
    objc_super v19 = [v18 tintColor];
    [(AKToggleButton *)v15 setTintColor:v19];

    [MEMORY[0x263F1C550] whiteColor];
  }
  else
  {
    [(AKToggleButton *)v15 setShowsBackgroundColor:0];
    v20 = [MEMORY[0x263F1C550] whiteColor];
    [(AKToggleButton *)v15 setTintColor:v20];

    [MEMORY[0x263F1C550] systemBlueColor];
  BOOL v21 = };
  [(AKToggleButton *)v15 setSelectedColor:v21];

  -[AKToggleButton setFrame:](v15, "setFrame:", 0.0, 0.0, 29.0, 29.0);
  v22 = [(AKToggleButton *)v15 layer];
  [v22 setCornerRadius:3.0];

  [(AKToggleButton *)v15 setTag:a4];
  [(AKToggleButton *)v15 setImage:v12 forState:0];
  [(AKToggleButton *)v15 addTarget:v13 action:a6 forControlEvents:64];

  char v23 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v15];

  return v23;
}

- (id)_createNewColorPickerToolbarButtonWithTarget:(id)a3 selector:(SEL)a4
{
  id v5 = a3;
  BOOL v6 = +[AKColorPaletteButton buttonWithType:0];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 19.0, 19.0);
  [v6 addTarget:v5 action:a4 forControlEvents:64];

  BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v6];

  return v7;
}

- (id)_createNewCustomViewToolbarButtonWithImage:(id)a3 target:(id)a4 selector:(SEL)a5
{
  BOOL v7 = (void *)MEMORY[0x263F1C488];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 buttonWithType:1];
  objc_msgSend(v10, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v10 addTarget:v8 action:a5 forControlEvents:64];

  [v10 setImage:v9 forState:0];
  [v10 sizeToFit];
  v11 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v10];

  return v11;
}

- (id)_doodleModeToolbarImage
{
  v2 = [(AKToolbarViewController *)self controller];
  unsigned int v3 = [v2 shouldDrawVariableStrokeDoodles];

  id v4 = [(id)objc_opt_class() imageForToolbarButtonItemOfType:v3];

  return v4;
}

- (double)heightIncludingAdditionalVisibleBars
{
  unsigned int v3 = [(AKToolbarViewController_iOS *)self view];
  [v3 frame];
  double Height = CGRectGetHeight(v8);
  [(AKToolbarViewController_iOS *)self visibleHeightOfAttributeBar];
  double v6 = Height + v5;

  return v6;
}

- (double)visibleHeightOfAttributeBar
{
  uint64_t v3 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = (void *)v3;
    double v6 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];

    if (v6)
    {
      BOOL v7 = [(AKToolbarViewController_iOS *)self view];
      CGRect v8 = [(AKToolbarViewController_iOS *)self view];
      id v9 = [v8 superview];

      uint64_t v10 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
      [v7 frame];
      objc_msgSend(v9, "convertRect:toView:", 0);
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [v10 frame];
      objc_msgSend(v9, "convertRect:toView:", 0);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      v29.origin.x = v12;
      v29.origin.y = v14;
      v29.size.width = v16;
      v29.size.double height = v18;
      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.double height = v26;
      CGRect v30 = CGRectIntersection(v29, v32);
      double height = v30.size.height;
      double v4 = 0.0;
      if (!CGRectIsNull(v30))
      {
        v31.origin.x = v20;
        v31.origin.y = v22;
        v31.size.width = v24;
        v31.size.double height = v26;
        double v4 = CGRectGetHeight(v31) - height;
      }
    }
  }
  return v4;
}

- (int64_t)_attributeTagForCurrentSelectionState
{
  int64_t v2 = 765101;
  uint64_t v3 = [(AKToolbarViewController *)self controller];
  double v4 = [v3 currentPageController];
  double v5 = [v4 pageModelController];

  double v6 = [v5 selectedAnnotations];
  if ([v6 count] == 1)
  {
    BOOL v7 = [v6 anyObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      int64_t v2 = 765106;
    }
  }

  return v2;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_barTintColor, a3);
  id v5 = a3;
  id v6 = [(AKToolbarViewController_iOS *)self view];
  [v6 setBarTintColor:v5];
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  id v5 = a3;
  id v6 = [(AKToolbarViewController_iOS *)self view];
  [v6 setTintColor:v5];
}

- (BOOL)isPresentingPopover
{
  uint64_t v3 = [(AKToolbarViewController_iOS *)self signaturesAlertController];

  if (v3) {
    return 1;
  }
  double v4 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];

  if (v4) {
    return 1;
  }
  id v5 = [(AKToolbarViewController_iOS *)self lineStylesViewController];

  if (v5) {
    return 1;
  }
  id v6 = [(AKToolbarViewController_iOS *)self textAttributesViewController];

  if (v6) {
    return 1;
  }
  BOOL v7 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];

  if (v7) {
    return 1;
  }
  id v9 = [(AKToolbarViewController_iOS *)self undoAlertController];

  return v9 != 0;
}

- (void)_undoManagerNotification:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3))
  {
    [(AKToolbarViewController_iOS *)self revalidateItems];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_237658704;
    block[3] = &unk_264CDAE40;
    block[4] = self;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (void)_undoLongPressAction:(id)a3
{
  id v6 = a3;
  double v4 = [(AKToolbarViewController_iOS *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [(AKToolbarViewController_iOS *)self _showUndoAlert:v6];
  }
}

- (void)_undoButtonAction:(id)a3
{
  id v3 = [(AKToolbarViewController *)self controller];
  [v3 undo:0];
}

- (void)_redoButtonAction:(id)a3
{
  id v3 = [(AKToolbarViewController *)self controller];
  [v3 redo:0];
}

- (void)_undoAllButtonAction:(id)a3
{
  id v3 = [(AKToolbarViewController *)self controller];
  if ([v3 validateUndo:0])
  {
    do
      [v3 undo:0];
    while (([v3 validateUndo:0] & 1) != 0);
  }
}

- (void)_showUndoAlert:(id)a3
{
  id v6 = [(AKToolbarViewController_iOS *)self _buildUndoAlertController];
  double v4 = [(AKToolbarViewController_iOS *)self undoButton];
  id v5 = [v6 popoverPresentationController];
  [v5 setBarButtonItem:v4];

  [v6 setModalPresentationStyle:7];
  [(AKToolbarViewController_iOS *)self presentViewController:v6 animated:1 completion:0];
}

- (id)_buildUndoAlertController
{
  id v3 = [(AKToolbarViewController *)self controller];
  objc_initWeak(&location, self);
  int v4 = [v3 validateUndo:0];
  id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  if (v4)
  {
    id v6 = +[AKController akBundle];
    BOOL v7 = [v6 localizedStringForKey:@"Undo" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

    CGRect v8 = [v3 undoController];
    id v9 = [v8 undoManager];
    uint64_t v10 = [v9 undoActionName];

    if ([v10 length])
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@ %@", v7, v10];

      BOOL v7 = (void *)v11;
    }
    CGFloat v12 = (void *)MEMORY[0x263F1C3F0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_237658C90;
    v25[3] = &unk_264CDB478;
    objc_copyWeak(&v26, &location);
    double v13 = [v12 actionWithTitle:v7 style:0 handler:v25];
    [v5 addAction:v13];
    CGFloat v14 = (void *)MEMORY[0x263F1C3F0];
    double v15 = +[AKController akBundle];
    CGFloat v16 = [v15 localizedStringForKey:@"Undo All" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_237658CD4;
    v23[3] = &unk_264CDB478;
    objc_copyWeak(&v24, &location);
    double v17 = [v14 actionWithTitle:v16 style:0 handler:v23];

    [v5 addAction:v17];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
  }
  CGFloat v18 = (void *)MEMORY[0x263F1C3F0];
  double v19 = +[AKController akBundle];
  CGFloat v20 = [v19 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];
  double v21 = [v18 actionWithTitle:v20 style:1 handler:0];
  [v5 addAction:v21];

  objc_destroyWeak(&location);

  return v5;
}

- (BOOL)_validateUndoButton
{
  int64_t v2 = [(AKToolbarViewController *)self controller];
  char v3 = [v2 validateUndo:0];

  return v3;
}

- (BOOL)isPresentingPopovers
{
  int64_t v2 = [(AKToolbarViewController_iOS *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dismissPresentedPopovers
{
}

- (void)_showSignaturesPopover:(id)a3
{
  int v4 = [(AKToolbarViewController *)self controller];
  id v5 = [v4 signatureModelController];
  id v6 = [v4 toolController];
  uint64_t v7 = [v6 toolMode];

  if (v7 == 5)
  {
    CGRect v8 = objc_opt_new();
    [v8 setTag:764022];
    [v4 performActionForSender:v8];
  }
  id v9 = [v5 signatures];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];

    if (!v11)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = sub_237658F40;
      v12[3] = &unk_264CDB110;
      id v13 = v4;
      CGFloat v14 = self;
      [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v12];
    }
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_237658F34;
    v15[3] = &unk_264CDAE40;
    v15[4] = self;
    [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v15];
  }
}

- (void)_showLineStylePopover:(id)a3
{
  int v4 = [(AKToolbarViewController_iOS *)self lineStylesViewController];

  if (!v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_237659568;
    v5[3] = &unk_264CDAE40;
    v5[4] = self;
    [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v5];
  }
}

- (void)_showTextStylePopover:(id)a3
{
  int v4 = [(AKToolbarViewController_iOS *)self textAttributesViewController];

  if (!v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_23765987C;
    v5[3] = &unk_264CDAE40;
    v5[4] = self;
    [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v5];
  }
}

- (void)_showColorPickerPopover:(id)a3
{
  int v4 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];

  if (!v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_237659B90;
    v5[3] = &unk_264CDAE40;
    v5[4] = self;
    [(AKToolbarViewController_iOS *)self _dismissCurrentlyPresentedPopoverAnimated:0 withCompletion:v5];
  }
}

- (void)_dismissCurrentlyPresentedPopoverAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v30 = a4;
  id v6 = [(AKToolbarViewController_iOS *)self presentedViewController];

  if (v6)
  {
    uint64_t v7 = [(AKToolbarViewController_iOS *)self presentedViewController];
    CGRect v8 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];

    if (v7 == v8)
    {
      double v21 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
      CGFloat v22 = [v21 popoverPresentationController];
      [v22 setDelegate:0];

      [(AKToolbarViewController_iOS *)self setSignaturesSheetViewController:0];
    }
    else
    {
      id v9 = [(AKToolbarViewController_iOS *)self presentedViewController];
      uint64_t v10 = [(AKToolbarViewController_iOS *)self lineStylesViewController];

      if (v9 == v10)
      {
        double v23 = [(AKToolbarViewController_iOS *)self lineStylesViewController];
        id v24 = [v23 popoverPresentationController];
        [v24 setDelegate:0];

        [(AKToolbarViewController_iOS *)self setLineStylesViewController:0];
      }
      else
      {
        uint64_t v11 = [(AKToolbarViewController_iOS *)self presentedViewController];
        CGFloat v12 = [(AKToolbarViewController_iOS *)self undoAlertController];

        if (v11 == v12)
        {
          double v25 = [(AKToolbarViewController_iOS *)self undoAlertController];
          id v26 = [v25 popoverPresentationController];
          [v26 setDelegate:0];

          [(AKToolbarViewController_iOS *)self setUndoAlertController:0];
        }
        else
        {
          id v13 = [(AKToolbarViewController_iOS *)self presentedViewController];
          CGFloat v14 = [(AKToolbarViewController_iOS *)self textAttributesViewController];

          if (v13 == v14)
          {
            v27 = [(AKToolbarViewController_iOS *)self textAttributesViewController];
            v28 = [v27 popoverPresentationController];
            [v28 setDelegate:0];

            [(AKToolbarViewController_iOS *)self setTextAttributesViewController:0];
          }
          else
          {
            double v15 = [(AKToolbarViewController_iOS *)self presentedViewController];
            CGFloat v16 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];

            if (v15 == v16)
            {
              double v17 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
              [v17 removeObserver:self forKeyPath:@"color"];

              CGFloat v18 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
              double v19 = [v18 popoverPresentationController];
              [v19 setDelegate:0];

              [(AKToolbarViewController_iOS *)self setColorPickerPopoverViewController:0];
            }
          }
        }
      }
    }
    CGRect v29 = [(AKToolbarViewController_iOS *)self presentedViewController];
    [v29 dismissViewControllerAnimated:v4 completion:v30];

    [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:0];
  }
  else
  {
    CGFloat v20 = v30;
    if (!v30) {
      goto LABEL_16;
    }
    (*((void (**)(id))v30 + 2))(v30);
  }
  CGFloat v20 = v30;
LABEL_16:
}

- (void)_setupPassthroughViewsForViewController:(id)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  BOOL v4 = (AKLineStylesViewController *)a3;
  id v5 = [(AKLineStylesViewController *)v4 popoverPresentationController];
  id v6 = [v5 passthroughViews];
  uint64_t v7 = (void *)[v6 mutableCopy];

  CGFloat v22 = v5;
  [v5 _setIgnoreBarButtonItemSiblings:1];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
  }
  CGRect v8 = [(AKToolbarViewController_iOS *)self lineStyleButton];
  id v9 = [v8 customView];
  v23[0] = v9;
  uint64_t v10 = [(AKToolbarViewController_iOS *)self strokeColorButton];
  uint64_t v11 = [v10 customView];
  v23[1] = v11;
  CGFloat v12 = [(AKToolbarViewController_iOS *)self textStyleButton];
  id v13 = [v12 customView];
  v23[2] = v13;
  CGFloat v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  [v7 addObjectsFromArray:v14];

  if ((AKLineStylesViewController *)self->_colorPickerPopoverViewController == v4)
  {
    double v15 = [(AKToolbarViewController_iOS *)self strokeColorButton];
  }
  else if ((AKLineStylesViewController *)self->_textAttributesViewController == v4)
  {
    double v15 = [(AKToolbarViewController_iOS *)self textStyleButton];
  }
  else
  {
    if (self->_lineStylesViewController != v4) {
      goto LABEL_10;
    }
    double v15 = [(AKToolbarViewController_iOS *)self lineStyleButton];
  }
  CGFloat v16 = v15;
  double v17 = [v15 customView];
  [v7 removeObject:v17];

LABEL_10:
  CGFloat v18 = [(AKToolbarViewController *)self controller];
  double v19 = [v18 currentPageController];
  CGFloat v20 = [v19 overlayView];

  double v21 = [v20 superview];

  if (v21) {
    [v7 addObject:v20];
  }
  [v22 setPassthroughViews:v7];
}

- (void)_layoutAttributeContainer
{
  BOOL v3 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
  BOOL v4 = [v3 superview];

  if (!v4)
  {
    id v5 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id firstValue = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
    id v6 = [(AKToolbarViewController_iOS *)self view];
    uint64_t v7 = [v6 superview];

    CGRect v8 = [(AKToolbarViewController_iOS *)self view];
    if (v7)
    {
      [v7 insertSubview:firstValue belowSubview:v8];
      id v9 = _NSDictionaryOfVariableBindings(&cfstr_Attributetoolb.isa, firstValue, v8, 0);
      uint64_t v10 = (void *)MEMORY[0x263F08938];
      uint64_t v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[attributeToolbarContainer]|" options:0 metrics:0 views:v9];
      [v10 activateConstraints:v11];

      CGFloat v12 = (void *)MEMORY[0x263F08938];
      id v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[attributeToolbarContainer(44@999)]" options:0 metrics:0 views:v9];
      [v12 activateConstraints:v13];

      CGFloat v14 = [MEMORY[0x263F08938] constraintWithItem:firstValue attribute:4 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:0.0];
      [(AKToolbarViewController_iOS *)self setAttributeToolbarViewControllerConstraint:v14];

      [v8 frame];
      double Height = CGRectGetHeight(v20);
      CGFloat v16 = [(AKToolbarViewController_iOS *)self attributeToolbarViewControllerConstraint];
      [v16 setConstant:Height];

      double v17 = [(AKToolbarViewController_iOS *)self attributeToolbarViewControllerConstraint];
      [v17 setActive:1];

      [v7 layoutIfNeeded];
    }
  }
}

- (void)showAttributeToolbarForSelectedAnnotations:(id)a3 andToolMode:(unint64_t)a4
{
  v46[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(AKToolbarViewController_iOS *)self _layoutAttributeContainer];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_dismissAttributeToolbarForSelectedAnnotations object:0];
  id v6 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];

  if (!v6)
  {
    uint64_t v7 = [(AKToolbarViewController *)self controller];
    CGRect v8 = [[AKFloatingAttributePickerViewController alloc] initWithController:v7];
    [(AKToolbarViewController_iOS *)self setAttributeToolbarViewController:v8];

    id v9 = [(AKToolbarViewController_iOS *)self floatingAttributeToolbarContainer];
    uint64_t v10 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    uint64_t v11 = [v10 view];
    [v9 addSubview:v11];

    CGFloat v12 = [(AKToolbarViewController_iOS *)self barTintColor];
    id v13 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    CGFloat v14 = [v13 toolbar];
    [v14 setBarTintColor:v12];

    double v15 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    CGFloat v16 = [v15 view];

    double v17 = _NSDictionaryOfVariableBindings(&cfstr_Attributetoolb_0.isa, v16, 0);
    CGFloat v18 = (void *)MEMORY[0x263F08938];
    double v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[attributeToolbar]|" options:0 metrics:0 views:v17];
    [v18 activateConstraints:v19];

    CGRect v20 = (void *)MEMORY[0x263F08938];
    double v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[attributeToolbar]|" options:0 metrics:0 views:v17];
    [v20 activateConstraints:v21];

    CGFloat v22 = [(AKToolbarViewController_iOS *)self view];
    double v23 = [v22 superview];

    id v24 = [(AKToolbarViewController_iOS *)self view];
    [v24 frame];
    double Height = CGRectGetHeight(v47);
    id v26 = [(AKToolbarViewController_iOS *)self attributeToolbarViewControllerConstraint];
    [v26 setConstant:Height];

    v27 = [(AKToolbarViewController_iOS *)self attributeToolbarViewControllerConstraint];
    [v27 setActive:1];

    [v23 layoutIfNeeded];
    v28 = (void *)MEMORY[0x263F1CB60];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_23765AB68;
    v42[3] = &unk_264CDB4D0;
    v42[4] = self;
    id v43 = v23;
    id v44 = v7;
    id v29 = v7;
    id v30 = v23;
    [v28 animateWithDuration:v42 animations:0 completion:0.1];
  }
  if ([v5 count] != 1)
  {
    CGRect v31 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    CGRect v32 = [(AKToolbarViewController_iOS *)self lineStyleButton];
    v45 = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    v35 = v31;
    id v36 = v33;
LABEL_16:
    [v35 setRightButtonItems:v36 animated:1];
    goto LABEL_17;
  }
  CGRect v31 = [v5 anyObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGRect v32 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    v33 = [(AKToolbarViewController_iOS *)self textStyleButton];
    v46[0] = v33;
    uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    [v32 setRightButtonItems:v34 animated:1];

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CGRect v32 = [MEMORY[0x263EFF980] array];
    if (objc_opt_respondsToSelector())
    {
      v37 = [(AKToolbarViewController_iOS *)self textStyleButton];
      [v32 addObject:v37];
    }
    if (objc_opt_respondsToSelector())
    {
      v38 = [(AKToolbarViewController_iOS *)self lineStyleButton];
      [v32 addObject:v38];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v31 pathIsPrestroked])
        {
          v39 = [(AKToolbarViewController_iOS *)self lineStyleButton];
          [v32 removeObject:v39];
        }
      }
    }
    v35 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
    v33 = v35;
    id v36 = v32;
    goto LABEL_16;
  }
  CGRect v32 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  [v32 setRightButtonItems:0 animated:1];
LABEL_18:

  int64_t v40 = [(AKToolbarViewController_iOS *)self _attributeTagForCurrentSelectionState];
  v41 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  [v41 setColorAttributeTag:v40];

  [(AKToolbarViewController_iOS *)self syncUIToSelectedColor];
}

- (void)dismissAttributeToolbarForSelectedAnnotations
{
  BOOL v3 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];

  if (v3)
  {
    BOOL v4 = [(AKToolbarViewController_iOS *)self view];
    id v5 = [v4 superview];

    id v6 = [(AKToolbarViewController_iOS *)self view];
    uint64_t v7 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23765AD34;
    v11[3] = &unk_264CDB4D0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_23765AD9C;
    v10[3] = &unk_264CDB020;
    v10[4] = self;
    id v8 = v5;
    id v9 = v6;
    [v7 animateWithDuration:v11 animations:v10 completion:0.1];
  }
}

- (void)dismissAttributeToolbarImmediately
{
  id v7 = [(AKToolbarViewController_iOS *)self view];
  [v7 frame];
  double Height = CGRectGetHeight(v9);
  BOOL v4 = [(AKToolbarViewController_iOS *)self attributeToolbarViewControllerConstraint];
  [v4 setConstant:Height];

  id v5 = [(AKToolbarViewController_iOS *)self attributeToolbarViewController];
  id v6 = [v5 view];
  [v6 removeFromSuperview];

  [(AKToolbarViewController_iOS *)self setAttributeToolbarViewController:0];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  AKLog(@"%s %@");
  id v5 = -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS presentationControllerShouldDismiss:]", v4);
  id v6 = [v5 popoverPresentationController];

  if (v6 == v4)
  {
    double v19 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    CGRect v20 = [v19 popoverPresentationController];
    [v20 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesSheetViewController:0];
    goto LABEL_14;
  }
  id v7 = [(AKToolbarViewController_iOS *)self lineStylesViewController];
  id v8 = [v7 popoverPresentationController];

  if (v8 == v4)
  {
    double v21 = [(AKToolbarViewController_iOS *)self lineStylesViewController];
    CGFloat v22 = [v21 popoverPresentationController];
    [v22 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setLineStylesViewController:0];
LABEL_13:
    [MEMORY[0x263F1C8A0] _setAlwaysAllowPopoverPresentations:0];
    goto LABEL_14;
  }
  CGRect v9 = [(AKToolbarViewController_iOS *)self undoAlertController];
  id v10 = [v9 popoverPresentationController];

  if (v10 == v4)
  {
    double v23 = [(AKToolbarViewController_iOS *)self undoAlertController];
    id v24 = [v23 popoverPresentationController];
    [v24 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setUndoAlertController:0];
    goto LABEL_13;
  }
  uint64_t v11 = [(AKToolbarViewController_iOS *)self textAttributesViewController];
  id v12 = [v11 popoverPresentationController];

  if (v12 == v4)
  {
    double v25 = [(AKToolbarViewController_iOS *)self textAttributesViewController];
    id v26 = [v25 popoverPresentationController];
    [v26 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setTextAttributesViewController:0];
    goto LABEL_13;
  }
  id v13 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
  id v14 = [v13 popoverPresentationController];

  if (v14 == v4)
  {
    v27 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
    [v27 removeObserver:self forKeyPath:@"color"];

    v28 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
    id v29 = [v28 popoverPresentationController];
    [v29 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setColorPickerPopoverViewController:0];
    goto LABEL_13;
  }
  double v15 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
  id v16 = [v15 popoverPresentationController];

  if (v16 == v4)
  {
    double v17 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
    CGFloat v18 = [v17 popoverPresentationController];
    [v18 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesAlertController:0];
  }
LABEL_14:

  return 1;
}

- (void)signaturesViewControllerDidCancel:(id)a3
{
  AKLog(@"%s %@");
  id v4 = -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerDidCancel:]", a3);

  if (v4)
  {
    id v12 = [(AKToolbarViewController *)self controller];
    id v5 = [v12 delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 controllerWillDismissSignatureManagerView:v12];
    }
    [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:0];
    id v6 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    id v7 = [v6 popoverPresentationController];
    [v7 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesSheetViewController:0];
  }
  else
  {
    id v8 = [(AKToolbarViewController_iOS *)self signaturesAlertController];

    if (v8)
    {
      CGRect v9 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
      id v10 = [v9 popoverPresentationController];
      [v10 setDelegate:0];

      [(AKToolbarViewController_iOS *)self setSignaturesAlertController:0];
    }
  }
}

- (void)signaturesViewControllerDidSelectSignature:(id)a3
{
  AKLog(@"%s %@");
  id v4 = -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerDidSelectSignature:]", a3);

  if (v4)
  {
    id v5 = [(AKToolbarViewController *)self controller];
    id v6 = [v5 delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 controllerWillDismissSignatureManagerView:v5];
    }
    [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:0];
    id v7 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    id v8 = [v7 popoverPresentationController];
    [v8 setDelegate:0];

    CGRect v9 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v9 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesSheetViewController:0];
  }
  else
  {
    id v10 = [(AKToolbarViewController_iOS *)self signaturesAlertController];

    if (v10)
    {
      [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:0];
      uint64_t v11 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
      id v12 = [v11 popoverPresentationController];
      [v12 setDelegate:0];

      [(AKToolbarViewController_iOS *)self setSignaturesAlertController:0];
    }
  }
  id v16 = [(AKToolbarViewController *)self controller];
  id v13 = objc_alloc(MEMORY[0x263F1C488]);
  id v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v14 setTag:764019];
  [v16 performActionForSender:v14];
}

- (void)signaturesViewControllerContinueToManageSignatures:(id)a3
{
  id v23 = a3;
  id v4 = [(AKToolbarViewController_iOS *)self signaturesAlertController];

  if (v4)
  {
    id v5 = [(AKToolbarViewController_iOS *)self presentedViewController];

    if (v5) {
      [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:0];
    }
    id v6 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
    id v7 = [v6 popoverPresentationController];
    [v7 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesAlertController:0];
  }
  AKLog(@"%s %@");
  id v8 = -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerContinueToManageSignatures:]", v23);

  CGRect v9 = v23;
  if (!v8)
  {
    id v10 = [AKSignaturesViewController_iOS alloc];
    uint64_t v11 = [(AKToolbarViewController *)self controller];
    id v12 = [(AKSignaturesViewController_iOS *)v10 initWithController:v11];
    [(AKToolbarViewController_iOS *)self setSignaturesSheetViewController:v12];

    id v13 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v13 setDelegate:self];

    id v14 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v14 userInterfaceIdiom] == 1) {
      uint64_t v15 = 5;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v16 setModalPresentationStyle:v15];

    double v17 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v17 setShowsNavigationBar:1];

    CGFloat v18 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v18 setPresentedInAlert:0];

    double v19 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [v19 setAllowsEdits:1];

    CGRect v20 = [(AKToolbarViewController *)self controller];
    double v21 = [v20 delegate];
    if (objc_opt_respondsToSelector()) {
      [v21 controllerWillShowSignatureManagerView:v20];
    }
    CGFloat v22 = [(AKToolbarViewController_iOS *)self signaturesSheetViewController];
    [(AKToolbarViewController_iOS *)self presentViewController:v22 animated:1 completion:0];

    CGRect v9 = v23;
  }
}

- (void)signaturesViewControllerEnterSignatureMode:(id)a3
{
  id v4 = [(AKToolbarViewController_iOS *)self signaturesAlertController];

  if (v4)
  {
    id v5 = [(AKToolbarViewController_iOS *)self presentedViewController];

    if (v5) {
      [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:0];
    }
    id v6 = [(AKToolbarViewController_iOS *)self signaturesAlertController];
    id v7 = [v6 popoverPresentationController];
    [v7 setDelegate:0];

    [(AKToolbarViewController_iOS *)self setSignaturesAlertController:0];
  }
  id v9 = [(AKToolbarViewController *)self controller];
  id v8 = objc_opt_new();
  [v8 setTag:764022];
  [v9 performActionForSender:v8];
}

- (void)signaturesViewControllerContinueToCreateSignature:(id)a3
{
  AKLog(@"%s %@");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23765B928;
  v8[3] = &unk_264CDAE40;
  v8[4] = self;
  id v4 = (void (**)(void))MEMORY[0x237E1E250](v8);
  id v5 = -[AKToolbarViewController_iOS signaturesSheetViewController](self, "signaturesSheetViewController", "-[AKToolbarViewController_iOS signaturesViewControllerContinueToCreateSignature:]", a3);

  if (v5
    || ([(AKToolbarViewController_iOS *)self signaturesAlertController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [(AKToolbarViewController_iOS *)self dismissViewControllerAnimated:1 completion:v4];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  id v5 = [(AKToolbarViewController *)self controller];
  id v3 = objc_alloc(MEMORY[0x263F1C488]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setTag:764019];
  [v5 performActionForSender:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v13 = a4;
  if ([a3 isEqualToString:@"color"])
  {
    id v8 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];

    if (v8 == v13)
    {
      id v9 = [(AKToolbarViewController_iOS *)self strokeColorButton];
      id v10 = [v9 customView];

      uint64_t v11 = [(AKToolbarViewController_iOS *)self colorPickerPopoverViewController];
      id v12 = [v11 color];
      [v10 setColor:v12];
    }
  }
}

- (void)_peripheralAvailabilityDidUpdate:(id)a3
{
  if ([(AKToolbarViewController_iOS *)self _legacyDoodlesEnabled])
  {
    id v4 = [(AKToolbarViewController_iOS *)self sketchButton];
    id v5 = [(AKToolbarViewController_iOS *)self traitCollection];
    [(AKToolbarViewController_iOS *)self _updateToggleButton:v4 withTraitCollection:v5];
  }

  [(AKToolbarViewController_iOS *)self revalidateItems];
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIView)floatingAttributeToolbarContainer
{
  return self->_floatingAttributeToolbarContainer;
}

- (void)setFloatingAttributeToolbarContainer:(id)a3
{
}

- (UIBarButtonItem)richSketchButton
{
  return self->_richSketchButton;
}

- (void)setRichSketchButton:(id)a3
{
}

- (UIBarButtonItem)sketchButton
{
  return self->_sketchButton;
}

- (void)setSketchButton:(id)a3
{
}

- (UIBarButtonItem)inkButton
{
  return self->_inkButton;
}

- (void)setInkButton:(id)a3
{
}

- (UIBarButtonItem)textButton
{
  return self->_textButton;
}

- (void)setTextButton:(id)a3
{
}

- (UIBarButtonItem)loupeButton
{
  return self->_loupeButton;
}

- (void)setLoupeButton:(id)a3
{
}

- (UIBarButtonItem)signatureButton
{
  return self->_signatureButton;
}

- (void)setSignatureButton:(id)a3
{
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (UIBarButtonItem)redoButton
{
  return self->_redoButton;
}

- (void)setRedoButton:(id)a3
{
}

- (UIBarButtonItem)textStyleButton
{
  return self->_textStyleButton;
}

- (void)setTextStyleButton:(id)a3
{
}

- (UIBarButtonItem)lineStyleButton
{
  return self->_lineStyleButton;
}

- (void)setLineStyleButton:(id)a3
{
}

- (UIBarButtonItem)strokeColorButton
{
  return self->_strokeColorButton;
}

- (void)setStrokeColorButton:(id)a3
{
}

- (NSArray)staticToolbarItems
{
  return self->_staticToolbarItems;
}

- (void)setStaticToolbarItems:(id)a3
{
}

- (UIAlertController)signaturesAlertController
{
  return self->_signaturesAlertController;
}

- (void)setSignaturesAlertController:(id)a3
{
}

- (UIAlertController)undoAlertController
{
  return self->_undoAlertController;
}

- (void)setUndoAlertController:(id)a3
{
}

- (AKSignaturesViewController_iOS)signaturesSheetViewController
{
  return self->_signaturesSheetViewController;
}

- (void)setSignaturesSheetViewController:(id)a3
{
}

- (AKLineStylesViewController)lineStylesViewController
{
  return self->_lineStylesViewController;
}

- (void)setLineStylesViewController:(id)a3
{
}

- (AKTextAttributesViewController)textAttributesViewController
{
  return self->_textAttributesViewController;
}

- (void)setTextAttributesViewController:(id)a3
{
}

- (AKColorPickerViewController)colorPickerPopoverViewController
{
  return self->_colorPickerPopoverViewController;
}

- (void)setColorPickerPopoverViewController:(id)a3
{
}

- (AKFloatingAttributePickerViewController)attributeToolbarViewController
{
  return self->_attributeToolbarViewController;
}

- (void)setAttributeToolbarViewController:(id)a3
{
}

- (NSLayoutConstraint)attributeToolbarViewControllerConstraint
{
  return self->_attributeToolbarViewControllerConstraint;
}

- (void)setAttributeToolbarViewControllerConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeToolbarViewControllerConstraint, 0);
  objc_storeStrong((id *)&self->_attributeToolbarViewController, 0);
  objc_storeStrong((id *)&self->_colorPickerPopoverViewController, 0);
  objc_storeStrong((id *)&self->_textAttributesViewController, 0);
  objc_storeStrong((id *)&self->_lineStylesViewController, 0);
  objc_storeStrong((id *)&self->_signaturesSheetViewController, 0);
  objc_storeStrong((id *)&self->_undoAlertController, 0);
  objc_storeStrong((id *)&self->_signaturesAlertController, 0);
  objc_storeStrong((id *)&self->_staticToolbarItems, 0);
  objc_storeStrong((id *)&self->_strokeColorButton, 0);
  objc_storeStrong((id *)&self->_lineStyleButton, 0);
  objc_storeStrong((id *)&self->_textStyleButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_signatureButton, 0);
  objc_storeStrong((id *)&self->_loupeButton, 0);
  objc_storeStrong((id *)&self->_textButton, 0);
  objc_storeStrong((id *)&self->_inkButton, 0);
  objc_storeStrong((id *)&self->_sketchButton, 0);
  objc_storeStrong((id *)&self->_richSketchButton, 0);
  objc_storeStrong((id *)&self->_floatingAttributeToolbarContainer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_barTintColor, 0);
}

@end