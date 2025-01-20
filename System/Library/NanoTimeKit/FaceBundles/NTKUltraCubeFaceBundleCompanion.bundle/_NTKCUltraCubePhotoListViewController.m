@interface _NTKCUltraCubePhotoListViewController
- (BOOL)_allPhotosSelected;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)inGallery;
- (NTKCUltraCubePhotoListViewControllerDelegate)delegate;
- (NTKCompanionUltraCubePhotosEditor)editor;
- (NTKFaceView)faceView;
- (NTKUltraCubeFace)face;
- (_NTKCUltraCubePhotoListViewController)initWithUltraCubePhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6;
- (id)_currentSelectAllButton;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_addPressed;
- (void)_deletePressed;
- (void)_donePressed;
- (void)_savePressed;
- (void)_selectAllPhotos;
- (void)_selectAllPressed;
- (void)_selectPressed;
- (void)_updateButtons;
- (void)_updateButtonsForSelectionChanged;
- (void)_updateTitle;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditor:(id)a3;
- (void)setFace:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setInGallery:(BOOL)a3;
- (void)ultracubePreviewViewControllerDidDismiss:(id)a3;
- (void)ultracubePreviewViewControllerWantsToCancel:(id)a3;
- (void)ultracubePreviewViewControllerWantsToDelete:(id)a3;
- (void)ultracubePreviewViewControllerWantsToSave:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _NTKCUltraCubePhotoListViewController

- (_NTKCUltraCubePhotoListViewController)initWithUltraCubePhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = objc_opt_new();
  v52.receiver = self;
  v52.super_class = (Class)_NTKCUltraCubePhotoListViewController;
  v14 = [(_NTKCUltraCubePhotoListViewController *)&v52 initWithCollectionViewLayout:v13];
  v15 = v14;
  if (v14)
  {
    [(_NTKCUltraCubePhotoListViewController *)v14 setEditor:v10];
    [(_NTKCUltraCubePhotoListViewController *)v15 setFace:v11];
    [(_NTKCUltraCubePhotoListViewController *)v15 setInGallery:v7];
    [(_NTKCUltraCubePhotoListViewController *)v15 setFaceView:v12];
    v16 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v15 action:"_savePressed"];
    saveButton = v15->_saveButton;
    v15->_saveButton = v16;

    id v18 = objc_alloc((Class)UIBarButtonItem);
    v19 = NTKCCustomizationLocalizedString();
    v20 = (UIBarButtonItem *)[v18 initWithTitle:v19 style:0 target:v15 action:"_selectPressed"];
    selectButton = v15->_selectButton;
    v15->_selectButton = v20;

    v22 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v15 action:"_donePressed"];
    doneButton = v15->_doneButton;
    v15->_doneButton = v22;

    id v24 = objc_alloc((Class)UIBarButtonItem);
    v25 = NTKCCustomizationLocalizedString();
    v26 = (UIBarButtonItem *)[v24 initWithTitle:v25 style:0 target:v15 action:"_selectAllPressed"];
    selectAllButton = v15->_selectAllButton;
    v15->_selectAllButton = v26;

    id v28 = objc_alloc((Class)UIBarButtonItem);
    v29 = NTKCCustomizationLocalizedString();
    v30 = (UIBarButtonItem *)[v28 initWithTitle:v29 style:0 target:v15 action:"_selectAllPressed"];
    deselectAllButton = v15->_deselectAllButton;
    v15->_deselectAllButton = v30;

    v32 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:v15 action:"_deletePressed"];
    deleteButton = v15->_deleteButton;
    v15->_deleteButton = v32;

    [(UIBarButtonItem *)v15->_deleteButton setEnabled:0];
    id v34 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    [v34 startAnimating];
    v35 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v34];
    spinnerButton = v15->_spinnerButton;
    v15->_spinnerButton = v35;

    id v37 = objc_alloc((Class)UIBarButtonItem);
    v38 = NTKCCustomizationLocalizedString();
    v39 = (UIBarButtonItem *)[v37 initWithTitle:v38 style:0 target:v15 action:"_addPressed"];
    addButton = v15->_addButton;
    v15->_addButton = v39;

    id v41 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v54[0] = v41;
    v54[1] = v15->_addButton;
    id v42 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v54[2] = v42;
    uint64_t v43 = +[NSArray arrayWithObjects:v54 count:3];
    defaultToolBarItems = v15->_defaultToolBarItems;
    v15->_defaultToolBarItems = (NSArray *)v43;

    id v45 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v53[0] = v45;
    v53[1] = v15->_deleteButton;
    id v46 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v53[2] = v46;
    uint64_t v47 = +[NSArray arrayWithObjects:v53 count:3];
    editingToolBarItems = v15->_editingToolBarItems;
    v15->_editingToolBarItems = (NSArray *)v47;

    uint64_t v49 = objc_opt_new();
    selectedIndexes = v15->_selectedIndexes;
    v15->_selectedIndexes = (NSMutableIndexSet *)v49;
  }
  return v15;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)_NTKCUltraCubePhotoListViewController;
  [(_NTKCUltraCubePhotoListViewController *)&v12 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(_NTKCUltraCubePhotoListViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor systemBackgroundColor];
  v6 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  [v6 setBackgroundColor:v5];

  BOOL v7 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  v9 = +[NTKCPhotoListCell reuseIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  id v10 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  [v10 setAlwaysBounceVertical:1];

  id v11 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  [v11 setAllowsSelectionDuringEditing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NTKCUltraCubePhotoListViewController;
  [(_NTKCUltraCubePhotoListViewController *)&v7 viewWillAppear:a3];
  v4 = [(_NTKCUltraCubePhotoListViewController *)self navigationController];
  [v4 setToolbarHidden:0];

  [(_NTKCUltraCubePhotoListViewController *)self _updateButtons];
  v5 = [(_NTKCUltraCubePhotoListViewController *)self presentedViewController];

  if (v5)
  {
    v6 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
    [v6 reloadData];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_NTKCUltraCubePhotoListViewController;
  [(_NTKCUltraCubePhotoListViewController *)&v7 setEditing:a3 animated:a4];
  [(_NTKCUltraCubePhotoListViewController *)self _updateButtons];
  [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
  v5 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  v6 = [v5 visibleCells];
  [v6 enumerateObjectsUsingBlock:&stru_48DF0];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  objc_super v7 = +[NTKCPhotoListCell reuseIdentifier];
  uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  id v9 = [v5 item];
  editor = self->_editor;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_97BC;
  v15[3] = &unk_48E18;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v17 = v9;
  [(NTKCompanionUltraCubePhotosEditor *)editor thumbnailImageForPhotoAtIndex:v9 completion:v15];
  [v11 setPhoto:0];
  objc_msgSend(v11, "setCrop:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v11, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", v9));
  objc_super v12 = v16;
  id v13 = v11;

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 item];
  if ([(_NTKCUltraCubePhotoListViewController *)self isEditing])
  {
    id v9 = [v6 cellForItemAtIndexPath:v7];
    objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "isSelected") ^ 1);
    unsigned int v10 = [v9 isSelected];
    selectedIndexes = self->_selectedIndexes;
    if (v10) {
      [(NSMutableIndexSet *)selectedIndexes addIndex:v8];
    }
    else {
      [(NSMutableIndexSet *)selectedIndexes removeIndex:v8];
    }
    [(_NTKCUltraCubePhotoListViewController *)self _updateButtonsForSelectionChanged];
LABEL_11:

    goto LABEL_12;
  }
  if ([(NTKCompanionUltraCubePhotosEditor *)self->_editor canChangeOriginalCropOfPhotoAtIndex:v8])
  {
    objc_super v12 = [(_NTKCUltraCubePhotoListViewController *)self face];
    id v9 = [v12 selectedOptionForCustomEditMode:13 slot:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = [v9 typeface];
    }
    else {
      id v13 = &dword_0 + 1;
    }
    v14 = [(_NTKCUltraCubePhotoListViewController *)self face];
    v15 = [v14 device];

    id v16 = [[NTKUltraCubePreviewFactory alloc] initWithIndex:v8 device:v15 typeface:v13 editor:self->_editor];
    id v17 = [[NTKCUltraCubePreviewViewController alloc] initWithPreviewProvider:v16];
    id v18 = BPSBridgeTintColor();
    v19 = [(NTKCUltraCubePreviewViewController *)v17 view];
    [v19 setTintColor:v18];

    [(NTKCUltraCubePreviewViewController *)v17 setDelegate:self];
    [(_NTKCUltraCubePhotoListViewController *)self presentViewController:v17 animated:1 completion:0];

    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  editor = self->_editor;
  id v7 = a5;
  id v8 = [a4 item];
  id v9 = [v7 item];

  [(NTKCompanionUltraCubePhotosEditor *)editor movePhotoAtIndex:v8 toIndex:v9];
}

- (void)ultracubePreviewViewControllerWantsToCancel:(id)a3
{
  id v6 = [a3 previewProvider];
  v4 = [v6 editor];
  objc_msgSend(v4, "purgeResourcesForPreviewAtIndex:", objc_msgSend(v6, "index"));
  id v5 = [(_NTKCUltraCubePhotoListViewController *)self parentViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)ultracubePreviewViewControllerWantsToDelete:(id)a3
{
  id v7 = [a3 previewProvider];
  v4 = [v7 editor];
  id v5 = [v7 index];
  [v4 purgeResourcesForPreviewAtIndex:v5];
  [v4 deletePhotoAtIndex:v5];
  id v6 = [(_NTKCUltraCubePhotoListViewController *)self parentViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)ultracubePreviewViewControllerWantsToSave:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentPreview];
  if (v5)
  {
    id v6 = [v4 previewProvider];
    id v7 = [v6 editor];
    id v8 = [v6 index];
    if (([v7 savePreview:v5 forPhotoAtIndex:v8] & 1) == 0)
    {
      id v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_2B7FC((uint64_t)v8, v9);
      }
    }
    [v7 purgeResourcesForPreviewAtIndex:v8];
  }
  unsigned int v10 = [(_NTKCUltraCubePhotoListViewController *)self parentViewController];
  [v10 dismissViewControllerAnimated:1 completion:0];
}

- (void)ultracubePreviewViewControllerDidDismiss:(id)a3
{
  [(_NTKCUltraCubePhotoListViewController *)self _updateButtons];
  id v4 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  [v4 reloadData];
}

- (void)_updateButtons
{
  if ([(_NTKCUltraCubePhotoListViewController *)self isEditing])
  {
    v3 = [(_NTKCUltraCubePhotoListViewController *)self _currentSelectAllButton];
    id v4 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];

    doneButton = self->_doneButton;
    id v6 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v6 setRightBarButtonItem:doneButton];
    id v7 = &OBJC_IVAR____NTKCUltraCubePhotoListViewController__editingToolBarItems;
  }
  else
  {
    saveButton = self->_saveButton;
    id v9 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:saveButton];

    selectButton = self->_selectButton;
    id v6 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v6 setRightBarButtonItem:selectButton];
    id v7 = &OBJC_IVAR____NTKCUltraCubePhotoListViewController__defaultToolBarItems;
  }

  [(_NTKCUltraCubePhotoListViewController *)self setToolbarItems:*(Class *)((char *)&self->super.super.super.super.isa + *v7)];
  [(UIBarButtonItem *)self->_addButton setEnabled:(unint64_t)[(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount] < 0x18];
  [(UIBarButtonItem *)self->_selectButton setEnabled:[(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount] > 0];
  [(_NTKCUltraCubePhotoListViewController *)self _updateTitle];

  [(_NTKCUltraCubePhotoListViewController *)self _updateButtonsForSelectionChanged];
}

- (void)_updateButtonsForSelectionChanged
{
  if ([(_NTKCUltraCubePhotoListViewController *)self isEditing])
  {
    v3 = [(_NTKCUltraCubePhotoListViewController *)self _currentSelectAllButton];
    id v4 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];

    id v5 = [(NSMutableIndexSet *)self->_selectedIndexes count];
    BOOL v6 = v5 != 0;
    if (!self->_inGallery)
    {
      id v7 = v5;
      id v8 = [(NSMutableIndexSet *)self->_selectedIndexes count];
      int64_t v9 = [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount];
      if (v7) {
        BOOL v10 = v8 == (id)v9;
      }
      else {
        BOOL v10 = 1;
      }
      BOOL v6 = !v10;
    }
    deleteButton = self->_deleteButton;
    [(UIBarButtonItem *)deleteButton setEnabled:v6];
  }
}

- (id)_currentSelectAllButton
{
  unsigned int v3 = [(_NTKCUltraCubePhotoListViewController *)self _allPhotosSelected];
  id v4 = &OBJC_IVAR____NTKCUltraCubePhotoListViewController__selectAllButton;
  if (v3) {
    id v4 = &OBJC_IVAR____NTKCUltraCubePhotoListViewController__deselectAllButton;
  }
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);

  return v5;
}

- (void)_updateTitle
{
  if (![(_NTKCUltraCubePhotoListViewController *)self isEditing])
  {
    unsigned int v3 = NTKCCustomizationLocalizedFormat();
    id v4 = [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount];
    goto LABEL_5;
  }
  if ([(NSMutableIndexSet *)self->_selectedIndexes count])
  {
    unsigned int v3 = NTKCCustomizationLocalizedFormat();
    id v4 = [(NSMutableIndexSet *)self->_selectedIndexes count];
LABEL_5:
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  NTKCCustomizationLocalizedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  [(_NTKCUltraCubePhotoListViewController *)self setTitle:v5];
}

- (void)_savePressed
{
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_A338;
  v16[3] = &unk_48E40;
  objc_copyWeak(&v17, &location);
  unsigned int v3 = objc_retainBlock(v16);
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_A3AC;
  id v13 = &unk_48E68;
  objc_copyWeak(&v15, &location);
  id v4 = v3;
  id v14 = v4;
  id v5 = objc_retainBlock(&v10);
  if (self->_inGallery)
  {
    spinnerButton = self->_spinnerButton;
    id v7 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:spinnerButton];

    [(NTKCompanionUltraCubePhotosEditor *)self->_editor generateGalleryPreviewResourceDirectoryWithCompletion:v5];
  }
  else if ([(NTKCompanionUltraCubePhotosEditor *)self->_editor state] == (char *)&dword_0 + 2)
  {
    id v8 = self->_spinnerButton;
    int64_t v9 = [(_NTKCUltraCubePhotoListViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];

    [(NTKCompanionUltraCubePhotosEditor *)self->_editor finalizeWithCompletion:v5];
  }
  else
  {
    v4[2](v4);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_selectPressed
{
}

- (void)_donePressed
{
}

- (void)_selectAllPressed
{
  unsigned int v3 = [(_NTKCUltraCubePhotoListViewController *)self _allPhotosSelected];
  if (v3) {
    [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
  }
  else {
    [(_NTKCUltraCubePhotoListViewController *)self _selectAllPhotos];
  }
  char v4 = v3 ^ 1;
  id v5 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
  BOOL v6 = [v5 visibleCells];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A550;
  v7[3] = &unk_48E88;
  char v8 = v4;
  [v6 enumerateObjectsUsingBlock:v7];

  [(_NTKCUltraCubePhotoListViewController *)self _updateButtonsForSelectionChanged];
}

- (void)_addPressed
{
  unsigned int v3 = +[NTKCPhotosAddController ultraCubeConfigurationWithLimit:24 - [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount]];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A620;
  v4[3] = &unk_48EB0;
  v4[4] = self;
  +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:self configuration:v3 withCompletion:v4];
}

- (void)_deletePressed
{
  if (self->_deleteConfirmed)
  {
    self->_deleteConfirmed = 0;
    unsigned int v3 = objc_opt_new();
    selectedIndexes = self->_selectedIndexes;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_A934;
    v17[3] = &unk_48ED8;
    id v18 = v3;
    v19 = self;
    id v5 = v3;
    [(NSMutableIndexSet *)selectedIndexes enumerateIndexesWithOptions:2 usingBlock:v17];
    [(NSMutableIndexSet *)self->_selectedIndexes removeAllIndexes];
    BOOL v6 = [(_NTKCUltraCubePhotoListViewController *)self collectionView];
    [v6 deleteItemsAtIndexPaths:v5];

    [(_NTKCUltraCubePhotoListViewController *)self setEditing:0 animated:1];
    id v7 = v18;
  }
  else
  {
    char v8 = (char *)[(NSMutableIndexSet *)self->_selectedIndexes count];
    int64_t v9 = @"_PLURAL";
    if (v8 == (unsigned char *)&dword_0 + 1) {
      int64_t v9 = @"_SINGULAR";
    }
    BOOL v10 = v9;
    uint64_t v11 = [@"PHOTOS_DELETE_CONFIRMATION" stringByAppendingString:v10];
    NTKCCustomizationLocalizedString();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v7 = +[UIAlertController alertControllerWithTitle:0 message:v5 preferredStyle:0];
    objc_super v12 = [@"PHOTOS_DELETE_BUTTON" stringByAppendingString:v10];

    id v13 = NTKCCustomizationLocalizedString();

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_A918;
    v20[3] = &unk_48CE0;
    v20[4] = self;
    id v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v20];
    [v7 addAction:v14];

    id v15 = NTKCCustomizationLocalizedString();
    id v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
    [v7 addAction:v16];

    [(_NTKCUltraCubePhotoListViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (BOOL)_allPhotosSelected
{
  int64_t v3 = [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount];
  selectedIndexes = self->_selectedIndexes;

  return -[NSMutableIndexSet containsIndexesInRange:](selectedIndexes, "containsIndexesInRange:", 0, v3);
}

- (void)_selectAllPhotos
{
  int64_t v3 = [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount];
  selectedIndexes = self->_selectedIndexes;

  -[NSMutableIndexSet addIndexesInRange:](selectedIndexes, "addIndexesInRange:", 0, v3);
}

- (NTKCompanionUltraCubePhotosEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (NTKUltraCubeFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NTKCUltraCubePhotoListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCUltraCubePhotoListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (NTKFaceView)faceView
{
  return self->_faceView;
}

- (void)setFaceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_editingToolBarItems, 0);
  objc_storeStrong((id *)&self->_defaultToolBarItems, 0);
  objc_storeStrong((id *)&self->_spinnerButton, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_selectAllButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);

  objc_storeStrong((id *)&self->_saveButton, 0);
}

@end