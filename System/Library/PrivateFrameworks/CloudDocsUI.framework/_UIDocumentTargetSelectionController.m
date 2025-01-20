@interface _UIDocumentTargetSelectionController
+ (id)_loadDocumentIconForURL:(id)a3 size:(CGSize)a4;
+ (id)_loadThumbnailForURL:(id)a3 size:(CGSize)a4 scale:(double)a5 wantsBorder:(BOOL *)a6 generatedThumbnail:(BOOL *)a7;
- (NSArray)itemsToMove;
- (_UIDocumentTargetSelectionController)initWithCoder:(id)a3;
- (_UIDocumentTargetSelectionController)initWithItemsToMove:(id)a3;
- (_UIDocumentTargetSelectionController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIDocumentTargetSelectionControllerDelegate)delegate;
- (id)initForCopyWithItems:(id)a3;
- (id)initForCrossContainerMoveWithItemsToMove:(id)a3;
- (id)navControllerForPalette;
- (id)pickableTypes;
- (int)sortOrder;
- (int64_t)displayMode;
- (unint64_t)pickerMode;
- (void)_commonInitItems:(id)a3 crossContainer:(BOOL)a4 sourceContainer:(id)a5;
- (void)_setContainerViewController:(id)a3;
- (void)_setIconViewImage:(id)a3 border:(BOOL)a4;
- (void)_setupNavigationItem;
- (void)_setupPalette;
- (void)_updatePalette;
- (void)didSelectItem:(id)a3;
- (void)dismiss:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setItemsToMove:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIDocumentTargetSelectionController

- (_UIDocumentTargetSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_UIDocumentTargetSelectionController initWithItemsToMove:](self, "initWithItemsToMove:", MEMORY[0x263EFFA68], a4);
}

- (_UIDocumentTargetSelectionController)initWithCoder:(id)a3
{
  return [(_UIDocumentTargetSelectionController *)self initWithItemsToMove:MEMORY[0x263EFFA68]];
}

- (void)_commonInitItems:(id)a3 crossContainer:(BOOL)a4 sourceContainer:(id)a5
{
  BOOL v6 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [(_UIDocumentTargetSelectionController *)self setEdgesForExtendedLayout:0];
  if (v6)
  {
    id v42 = v9;
    id v43 = v8;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v54;
      uint64_t v15 = *MEMORY[0x263EFF780];
      v16 = (void *)*MEMORY[0x263F01A78];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v10);
          }
          v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v52 = 0;
          objc_msgSend(v18, "getPromisedItemResourceValue:forKey:error:", &v52, v15, 0, v42, v43);
          id v19 = v52;
          v20 = v19;
          if (v13) {
            v21 = v13;
          }
          else {
            v21 = v19;
          }
          id v22 = v21;

          if ([v20 isEqual:v22])
          {
            id v13 = v22;
          }
          else
          {
            id v13 = v16;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v12);
    }
    else
    {
      id v13 = 0;
    }

    id v9 = v42;
    id v8 = v43;
    if (v42)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v28 = v10;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v49 != v31) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "br_cloudDocsContainer", v42, v43);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
        }
        while (v30);
      }
    }
    v33 = [_UIDocumentPickerAllContainersModel alloc];
    id v59 = v13;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    v35 = [(_UIDocumentPickerAllContainersModel *)v33 initWithFoldersForPickableTypes:v34 mode:3 sourceContainer:v9];
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v23 = v8;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      id v13 = 0;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          if (!v13)
          {
            objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * k), "br_containerID");
            id v13 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v25);
    }
    else
    {
      id v13 = 0;
    }

    v36 = [MEMORY[0x263F32588] allContainersByContainerID];
    v34 = [v36 objectForKey:v13];

    v37 = [v34 localizedName];
    containerName = self->_containerName;
    self->_containerName = v37;

    v39 = [_UIDocumentPickerSubfoldersContainerModel alloc];
    uint64_t v57 = *MEMORY[0x263F01A30];
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    v35 = [(_UIDocumentPickerSubfoldersContainerModel *)v39 initWithPickableTypes:v40 container:v13];
  }
  [(_UIDocumentPickerAllContainersModel *)v35 startMonitoringChanges];
  v41 = [[_UIDocumentPickerContainerViewController alloc] initWithModel:v35];
  [(_UIDocumentPickerContainerViewController *)v41 setExplicitDisplayMode:3];
  [(_UIDocumentTargetSelectionController *)self _setContainerViewController:v41];
  [(_UIDocumentTargetSelectionController *)self setItemsToMove:v8];
}

- (_UIDocumentTargetSelectionController)initWithItemsToMove:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = [(_UIDocumentTargetSelectionController *)&v8 initWithNibName:0 bundle:0];
  BOOL v6 = v5;
  if (v5)
  {
    [(_UIDocumentTargetSelectionController *)v5 _commonInitItems:v4 crossContainer:0 sourceContainer:0];
    v6->_targetSelectionType = 1;
  }

  return v6;
}

- (id)initForCrossContainerMoveWithItemsToMove:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = [(_UIDocumentTargetSelectionController *)&v25 initWithNibName:0 bundle:0];
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x263EFF7B0];
      uint64_t v11 = *MEMORY[0x263EFF7A0];
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
          id v20 = 0;
          int v14 = [v13 getPromisedItemResourceValue:&v20 forKey:v10 error:0];
          id v15 = v20;
          v16 = v15;
          if (v14 && ([v15 isEqualToString:v11] & 1) == 0)
          {

            v18 = [v6 firstObject];
            v17 = objc_msgSend(v18, "br_cloudDocsContainer");
            goto LABEL_13;
          }

          ++v12;
        }
        while (v8 != v12);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    v17 = 0;
    v18 = v6;
LABEL_13:

    [(_UIDocumentTargetSelectionController *)v5 _commonInitItems:v6 crossContainer:1 sourceContainer:v17];
    v5->_targetSelectionType = 1;
  }
  return v5;
}

- (id)initForCopyWithItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = [(_UIDocumentTargetSelectionController *)&v8 initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5)
  {
    [(_UIDocumentTargetSelectionController *)v5 _commonInitItems:v4 crossContainer:1 sourceContainer:0];
    v6->_targetSelectionType = 2;
  }

  return v6;
}

- (void)invalidate
{
}

- (id)navControllerForPalette
{
  containedNavigationController = self->_containedNavigationController;
  if (containedNavigationController)
  {
    v3 = containedNavigationController;
  }
  else
  {
    v3 = [(_UIDocumentTargetSelectionController *)self navigationController];
  }

  return v3;
}

- (void)_setupNavigationItem
{
  v2 = self;
  v19[1] = *MEMORY[0x263EF8340];
  if (self->_containedNavigationController) {
    self = (_UIDocumentTargetSelectionController *)self->_containerViewController;
  }
  v3 = [(_UIDocumentTargetSelectionController *)self navigationItem];
  id v4 = [v3 rightBarButtonItems];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v2 action:sel_dismiss_];
    v19[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    [v3 setRightBarButtonItems:v7];
  }
  if (v2->_containerName)
  {
    objc_msgSend(v3, "setTitle:");
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v9 = [v8 localizedStringForKey:@"iCloud Drive" value:@"iCloud Drive" table:@"Localizable"];
    [v3 setTitle:v9];
  }
  unint64_t targetSelectionType = v2->_targetSelectionType;
  switch(targetSelectionType)
  {
    case 2uLL:
      goto LABEL_13;
    case 1uLL:
LABEL_12:
      uint64_t v11 = NSString;
      uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v13 = [v12 localizedStringForKey:@"Choose a new location to move these items." value:@"Choose a new location to move these items." table:@"Localizable"];
      int v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, -[NSArray count](v2->_itemsToMove, "count"));
      [v3 setPrompt:v14];

LABEL_13:
      id v15 = NSString;
      v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v17 = [v16 localizedStringForKey:@"Choose a location to add these items." value:@"Choose a location to add these items." table:@"Localizable"];
      v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, -[NSArray count](v2->_itemsToMove, "count"));
      [v3 setPrompt:v18];

      break;
    case 0uLL:
      [v3 setPrompt:0];
      goto LABEL_12;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_completedInitialDisplay = 1;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentTargetSelectionController;
  [(_UIDocumentTargetSelectionController *)&v20 viewWillAppear:a3];
  id v4 = [(_UIDocumentTargetSelectionController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    p_containedNavigationController = &self->_containedNavigationController;
    containedNavigationController = self->_containedNavigationController;
    self->_containedNavigationController = 0;

    objc_super v8 = [(_UIDocumentPickerContainerViewController *)self->_containerViewController view];
    uint64_t v9 = [(_UIDocumentTargetSelectionController *)self view];
    [v9 bounds];
    objc_msgSend(v8, "setFrame:");

    [(_UIDocumentTargetSelectionController *)self addChildViewController:self->_containerViewController];
    uint64_t v10 = [(_UIDocumentPickerContainerViewController *)self->_containerViewController view];
    [v10 setAutoresizingMask:18];

    [(_UIDocumentPickerContainerViewController *)self->_containerViewController setServiceViewController:self];
    uint64_t v11 = [(_UIDocumentTargetSelectionController *)self view];
    containerViewController = self->_containerViewController;
  }
  else
  {
    id v13 = (UINavigationController *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self->_containerViewController];
    p_containedNavigationController = &self->_containedNavigationController;
    int v14 = self->_containedNavigationController;
    self->_containedNavigationController = v13;

    id v15 = [(UINavigationController *)self->_containedNavigationController view];
    v16 = [(_UIDocumentTargetSelectionController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "setFrame:");

    [(_UIDocumentTargetSelectionController *)self addChildViewController:self->_containedNavigationController];
    v17 = [(UINavigationController *)self->_containedNavigationController view];
    [v17 setAutoresizingMask:18];

    [(_UIDocumentPickerContainerViewController *)self->_containerViewController setServiceViewController:self];
    uint64_t v11 = [(_UIDocumentTargetSelectionController *)self view];
    containerViewController = self->_containedNavigationController;
  }
  v18 = [containerViewController view];
  [v11 addSubview:v18];

  [(UINavigationController *)*p_containedNavigationController didMoveToParentViewController:self];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __55___UIDocumentTargetSelectionController_viewWillAppear___block_invoke;
  v19[3] = &unk_26492CC78;
  v19[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentTargetSelectionController;
  [(_UIDocumentTargetSelectionController *)&v6 viewDidDisappear:a3];
  id v4 = [(_UINavigationControllerPalette *)self->_palette navController];
  [v4 detachPalette:self->_palette];

  palette = self->_palette;
  self->_palette = 0;
}

- (void)_setupPalette
{
  v43[7] = *MEMORY[0x263EF8340];
  palette = self->_palette;
  if (palette)
  {
    id v4 = [(_UINavigationControllerPalette *)palette navController];
    [v4 detachPalette:self->_palette];

    uint64_t v5 = self->_palette;
    self->_palette = 0;
  }
  objc_super v6 = [(_UIDocumentTargetSelectionController *)self navControllerForPalette];
  uint64_t v7 = [v6 view];
  [v7 bounds];
  id v42 = v6;
  objc_msgSend(v6, "paletteForEdge:size:", 2, v8, 72.0);
  uint64_t v9 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = self->_palette;
  self->_palette = v9;

  [(_UINavigationControllerPalette *)self->_palette setPinningBarShadowIsHidden:1];
  [v6 attachPalette:self->_palette isPinned:1];
  uint64_t v11 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
  iconView = self->_iconView;
  self->_iconView = v11;

  id v13 = [(NSArray *)self->_itemsToMove firstObject];
  v41 = objc_msgSend(v13, "ui_resolveOnDiskBookmarkAndPromise");

  int v14 = objc_msgSend((id)objc_opt_class(), "_loadDocumentIconForURL:size:", v41, 44.0, 44.0);
  [(_UIDocumentTargetSelectionController *)self _setIconViewImage:v14 border:0];

  id v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  filesLabel = self->_filesLabel;
  self->_filesLabel = v15;

  [(UIImageView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_filesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UINavigationControllerPalette *)self->_palette addSubview:self->_iconView];
  [(_UINavigationControllerPalette *)self->_palette addSubview:self->_filesLabel];
  v17 = [(UIImageView *)self->_iconView widthAnchor];
  v18 = [v17 constraintEqualToConstant:0.0];

  LODWORD(v19) = 1111752704;
  v40 = v18;
  [v18 setPriority:v19];
  objc_super v20 = [(UIImageView *)self->_iconView widthAnchor];
  v32 = [v20 constraintEqualToConstant:0.0];

  LODWORD(v21) = 1113325568;
  [v32 setPriority:v21];
  v33 = (void *)MEMORY[0x263F08938];
  v43[0] = v18;
  v39 = [(UIImageView *)self->_iconView leadingAnchor];
  v38 = [(_UINavigationControllerPalette *)self->_palette leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:17.0];
  v43[1] = v37;
  v36 = [(UILabel *)self->_filesLabel leadingAnchor];
  v35 = [(UIImageView *)self->_iconView trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:12.0];
  v43[2] = v34;
  uint64_t v31 = [(_UINavigationControllerPalette *)self->_palette trailingAnchor];
  long long v22 = [(UILabel *)self->_filesLabel trailingAnchor];
  long long v23 = [v31 constraintGreaterThanOrEqualToAnchor:v22 constant:17.0];
  v43[3] = v23;
  long long v24 = [(UIImageView *)self->_iconView centerYAnchor];
  objc_super v25 = [(_UINavigationControllerPalette *)self->_palette centerYAnchor];
  uint64_t v26 = [v24 constraintEqualToAnchor:v25];
  v43[4] = v26;
  uint64_t v27 = [(UILabel *)self->_filesLabel centerYAnchor];
  id v28 = [(_UINavigationControllerPalette *)self->_palette centerYAnchor];
  uint64_t v29 = [v27 constraintEqualToAnchor:v28];
  v43[5] = v29;
  v43[6] = v32;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:7];
  [v33 activateConstraints:v30];
}

- (void)_setContainerViewController:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  objc_storeStrong((id *)&self->_containerViewController, a3);
  id v6 = a3;
  id v10 = [(_UIDocumentTargetSelectionController *)self navigationController];
  uint64_t v7 = [v10 view];
  uint64_t v8 = [v7 semanticContentAttribute];
  uint64_t v9 = [(_UIDocumentPickerContainerViewController *)*p_containerViewController view];

  [v9 setSemanticContentAttribute:v8];
}

- (int)sortOrder
{
  return 1;
}

- (int64_t)displayMode
{
  return 3;
}

- (id)pickableTypes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F01A78];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (unint64_t)pickerMode
{
  return 3;
}

- (void)didSelectItem:(id)a3
{
  id v6 = a3;
  if ([v6 type] == 1 || objc_msgSend(v6, "type") == 2)
  {
    id v4 = [(_UIDocumentTargetSelectionController *)self delegate];
    uint64_t v5 = [v6 url];
    [v4 documentTargetSelectionController:self didSelectItemAtURL:v5];
  }
}

- (void)dismiss:(id)a3
{
  id v4 = [(_UIDocumentTargetSelectionController *)self presentingViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48___UIDocumentTargetSelectionController_dismiss___block_invoke;
  v5[3] = &unk_26492CC78;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

- (void)_updatePalette
{
  v3 = [(_UIDocumentTargetSelectionController *)self view];
  [v3 bounds];
  double v5 = v4 + -44.0 + -34.0 + -12.0;

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_2;
  v47[3] = &unk_26492D210;
  v47[4] = self;
  *(double *)&v47[5] = v5;
  id v6 = (void (**)(void, void *))MEMORY[0x230F72310](v47);
  [(UILabel *)self->_filesLabel setLineBreakMode:4];
  if ([(NSArray *)self->_itemsToMove count] < 2)
  {
    [(UILabel *)self->_filesLabel setLineBreakMode:5];
    double v19 = [(NSArray *)self->_itemsToMove firstObject];
    objc_super v20 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v19, v19);
    [(UILabel *)self->_filesLabel setText:v20];
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v9 = v6;
    id v10 = [v8 localizedStringForKey:@"%lu items" value:@"%lu items" table:@"Localizable"];
    uint64_t v11 = objc_msgSend(v7, "localizedStringWithFormat:", v10, -[NSArray count](self->_itemsToMove, "count"));
    [(UILabel *)self->_filesLabel setText:v11];

    uint64_t v12 = NSString;
    id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    int v14 = [v13 localizedStringForKey:@"%@ & %lu more…" value:@"%@ & %lu more…" table:@"Localizable"];
    id v15 = [(NSArray *)self->_itemsToMove objectAtIndex:0];
    v16 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v15, v15);
    v17 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v16, -[NSArray count](self->_itemsToMove, "count") - 1);
    v40 = v9;
    v9[2](v9, v17);

    if ([(NSArray *)self->_itemsToMove count] == 2)
    {
      v18 = NSString;
      double v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      objc_super v20 = [v19 localizedStringForKey:@"%@, %@", @"%@, %@", @"Localizable" value table];
      v38 = [(NSArray *)self->_itemsToMove objectAtIndex:0];
      double v21 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v38, v38);
      long long v22 = [(NSArray *)self->_itemsToMove objectAtIndex:1];
      long long v23 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v22, v22);
      long long v24 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v21, v23);
      v40[2](v40, v24);

      id v6 = v40;
    }
    else
    {
      id v6 = v9;
      if ([(NSArray *)self->_itemsToMove count] < 3) {
        goto LABEL_8;
      }
      objc_super v25 = NSString;
      double v19 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      objc_super v20 = [v19 localizedStringForKey:@"%@, %@ & %lu more…", @"%@, %@ & %lu more…", @"Localizable" value table];
      v39 = [(NSArray *)self->_itemsToMove objectAtIndex:0];
      uint64_t v26 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v39, v39);
      uint64_t v27 = [(NSArray *)self->_itemsToMove objectAtIndex:1];
      id v28 = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v27, v27);
      uint64_t v29 = objc_msgSend(v25, "localizedStringWithFormat:", v20, v26, v28, -[NSArray count](self->_itemsToMove, "count") - 2);
      v40[2](v40, v29);

      id v6 = v40;
    }
  }

LABEL_8:
  objc_initWeak(&location, self);
  uint64_t v30 = [(NSArray *)self->_itemsToMove firstObject];
  uint64_t v31 = objc_msgSend(v30, "ui_resolveOnDiskBookmarkAndPromise");

  v32 = [(_UIDocumentTargetSelectionController *)self traitCollection];
  [v32 displayScale];
  uint64_t v34 = v33;

  if (!self->_firstFileThumbnailObservation)
  {
    v35 = +[BRObservableFile observerForKey:0 onFileURL:v31];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_3;
    v41[3] = &unk_26492D288;
    id v42 = v31;
    int64x2_t v44 = vdupq_n_s64(0x4046000000000000uLL);
    uint64_t v45 = v34;
    objc_copyWeak(&v43, &location);
    v36 = [v35 addObserverBlock:v41];
    id firstFileThumbnailObservation = self->_firstFileThumbnailObservation;
    self->_id firstFileThumbnailObservation = v36;

    objc_destroyWeak(&v43);
  }

  objc_destroyWeak(&location);
}

+ (id)_loadDocumentIconForURL:(id)a3 size:(CGSize)a4
{
  return +[_UIDocumentPickerContainerItem _blockingIconForURL:withSize:](_UIDocumentPickerContainerItem, "_blockingIconForURL:withSize:", a3, a4.width, a4.height);
}

+ (id)_loadThumbnailForURL:(id)a3 size:(CGSize)a4 scale:(double)a5 wantsBorder:(BOOL *)a6 generatedThumbnail:(BOOL *)a7
{
  double height = a4.height;
  double width = a4.width;
  id v18 = 0;
  uint64_t v12 = *MEMORY[0x263EFF780];
  id v13 = a3;
  [v13 getPromisedItemResourceValue:&v18 forKey:v12 error:0];
  id v14 = v18;
  id v15 = [MEMORY[0x263F018A8] documentProxyForName:0 type:v14 MIMEType:0];
  v16 = +[_UIDocumentPickerContainerItem _blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:](_UIDocumentPickerContainerItem, "_blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:", v13, v15, a6, a7, width, height, a5);

  return v16;
}

- (void)_setIconViewImage:(id)a3 border:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIImageView *)self->_iconView setImage:a3];
  if (v4)
  {
    id v6 = [MEMORY[0x263F1C550] separatorColor];
    uint64_t v7 = [v6 CGColor];
    uint64_t v8 = [(UIImageView *)self->_iconView layer];
    [v8 setBorderColor:v7];

    id v12 = [(_UIDocumentTargetSelectionController *)self traitCollection];
    [v12 displayScale];
    double v10 = 1.0 / v9;
    uint64_t v11 = [(UIImageView *)self->_iconView layer];
    [v11 setBorderWidth:v10];
  }
  else
  {
    id v12 = [(UIImageView *)self->_iconView layer];
    [v12 setBorderWidth:0.0];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentTargetSelectionController;
  [(_UIDocumentTargetSelectionController *)&v3 viewDidLayoutSubviews];
  if ([(NSArray *)self->_itemsToMove count])
  {
    if (self->_completedInitialDisplay) {
      [(_UIDocumentTargetSelectionController *)self _updatePalette];
    }
  }
}

- (void)setItemsToMove:(id)a3
{
  BOOL v4 = (NSArray *)a3;
  if (self->_itemsToMove != v4)
  {
    uint64_t v7 = v4;
    double v5 = (NSArray *)[(NSArray *)v4 copy];
    itemsToMove = self->_itemsToMove;
    self->_itemsToMove = v5;

    BOOL v4 = v7;
    if (self->_completedInitialDisplay)
    {
      [(_UIDocumentTargetSelectionController *)self _setupNavigationItem];
      BOOL v4 = v7;
    }
  }
}

- (_UIDocumentTargetSelectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIDocumentTargetSelectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)itemsToMove
{
  return self->_itemsToMove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToMove, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_firstFileThumbnailObservation, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_filesLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_containedNavigationController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);

  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end