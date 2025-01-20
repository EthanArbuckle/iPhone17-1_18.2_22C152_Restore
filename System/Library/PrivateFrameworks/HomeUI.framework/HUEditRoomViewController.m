@interface HUEditRoomViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFRoomBuilder)roomBuilder;
- (HUEditRoomItemManager)roomItemManager;
- (HUEditRoomViewController)initWithRoomBuilder:(id)a3 presentationDelegate:(id)a4 addRoomDelegate:(id)a5;
- (HUEditRoomViewControllerAddRoomDelegate)addRoomDelegate;
- (HUEditRoomViewControllerPresentationDelegate)presentationDelegate;
- (HUWallpaperPickerInlineViewController)wallpaperPickerController;
- (HUZoneModuleController)zoneModuleController;
- (UIBarButtonItem)savedButtonBarItem;
- (UITextField)editingTextField;
- (id)itemModuleControllers;
- (id)trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a3;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)addButtonPressed:(id)a3;
- (void)cancelButtonPressed:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)doneButtonPressed:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)nameFieldTextChanged:(id)a3;
- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4;
- (void)setEditingTextField:(id)a3;
- (void)setRoomItemManager:(id)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)setWallpaperPickerController:(id)a3;
- (void)setZoneModuleController:(id)a3;
- (void)updateTitle;
- (void)updateWallpaper:(id)a3 image:(id)a4;
- (void)viewDidLoad;
- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5;
- (void)wallpaperEditingDidCancel:(id)a3;
- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4;
- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5;
- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5;
- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3;
- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4;
@end

@implementation HUEditRoomViewController

- (HUEditRoomViewController)initWithRoomBuilder:(id)a3 presentationDelegate:(id)a4 addRoomDelegate:(id)a5
{
  id v9 = a3;
  id obj = a4;
  id v24 = a5;
  v10 = [[HUEditRoomItemManager alloc] initWithRoomBuilder:v9 delegate:self];
  objc_initWeak(&location, self);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:2];
  [v11 setHeaderMode:1];
  [v11 setFooterMode:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__HUEditRoomViewController_initWithRoomBuilder_presentationDelegate_addRoomDelegate___block_invoke;
  v27[3] = &unk_1E638E9A8;
  objc_copyWeak(&v28, &location);
  [v11 setTrailingSwipeActionsConfigurationProvider:v27];
  v12 = [MEMORY[0x1E4F42870] layoutWithListConfiguration:v11];
  v26.receiver = self;
  v26.super_class = (Class)HUEditRoomViewController;
  v13 = [(HUItemCollectionViewController *)&v26 initWithItemManager:v10 collectionViewLayout:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_presentationDelegate, obj);
    objc_storeWeak((id *)&v14->_addRoomDelegate, v24);
    objc_storeWeak((id *)&v14->_roomItemManager, v10);
    objc_storeStrong((id *)&v14->_roomBuilder, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_roomItemManager);
    v16 = [WeakRetained zoneModule];

    if (v16)
    {
      v17 = [HUZoneModuleController alloc];
      id v18 = objc_loadWeakRetained((id *)&v14->_roomItemManager);
      v19 = [v18 zoneModule];
      v20 = [(HFRoomBuilder *)v14->_roomBuilder room];
      uint64_t v21 = [(HUZoneModuleController *)v17 initWithModule:v19 room:v20];
      zoneModuleController = v14->_zoneModuleController;
      v14->_zoneModuleController = (HUZoneModuleController *)v21;
    }
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v14;
}

id __85__HUEditRoomViewController_initWithRoomBuilder_presentationDelegate_addRoomDelegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained trailingSwipeActionsConfigurationForRowAtIndexPath:v3];

  return v5;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)HUEditRoomViewController;
  [(HUItemCollectionViewController *)&v31 viewDidLoad];
  id v3 = [(HUEditRoomViewController *)self collectionView];
  [v3 setKeyboardDismissMode:1];

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell])
  {
    v4 = objc_alloc_init(HUWallpaperPickerInlineViewController);
    wallpaperPickerController = self->_wallpaperPickerController;
    self->_wallpaperPickerController = v4;
  }
  v6 = [(HUEditRoomViewController *)self roomBuilder];
  v7 = [v6 room];

  id v8 = objc_alloc(MEMORY[0x1E4F427C0]);
  if (!v7)
  {
    uint64_t v21 = (void *)[v8 initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonPressed_];
    v22 = [(HUEditRoomViewController *)self navigationItem];
    [v22 setLeftBarButtonItem:v21];

    v23 = [(HUEditRoomViewController *)self navigationItem];
    id v24 = [v23 leftBarButtonItem];
    [v24 setAccessibilityIdentifier:@"Home.Room.Cancel"];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:3 target:self action:sel_doneButtonPressed_];
    objc_super v26 = [(HUEditRoomViewController *)self navigationItem];
    [v26 setRightBarButtonItem:v25];

    v27 = [(HUEditRoomViewController *)self navigationItem];
    id v28 = [v27 rightBarButtonItem];
    [v28 setStyle:2];

    v29 = [(HUEditRoomViewController *)self navigationItem];
    v30 = [v29 rightBarButtonItem];
    [v30 setEnabled:0];

    id v18 = [(HUEditRoomViewController *)self navigationItem];
    v19 = [v18 rightBarButtonItem];
    [v19 setAccessibilityIdentifier:@"Home.Room.Save"];
    goto LABEL_8;
  }
  id v9 = (void *)[v8 initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v10 = [(HUEditRoomViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  v11 = [(HUEditRoomViewController *)self navigationItem];
  v12 = [v11 rightBarButtonItem];
  [v12 setAccessibilityIdentifier:@"Home.Room.Done"];

  v13 = [(HUEditRoomViewController *)self addRoomDelegate];

  if (v13)
  {
    v14 = [(HUEditRoomViewController *)self roomBuilder];
    v15 = [v14 home];
    int v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

    if (!v16)
    {
      id v18 = [(HUEditRoomViewController *)self navigationItem];
      [v18 setHidesBackButton:1];
      goto LABEL_10;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v18 = _HULocalizedStringWithDefaultValue(@"HUEditRoomAddButtonTitle", @"HUEditRoomAddButtonTitle", 1);
    v19 = (void *)[v17 initWithTitle:v18 style:0 target:self action:sel_addButtonPressed_];
    v20 = [(HUEditRoomViewController *)self navigationItem];
    [v20 setLeftBarButtonItem:v19];

LABEL_8:
LABEL_10:
  }
  [(HUEditRoomViewController *)self updateTitle];
}

- (void)updateTitle
{
  id v6 = [(HUEditRoomViewController *)self roomBuilder];
  id v3 = [v6 room];
  if (v3)
  {
    v4 = [(HUEditRoomViewController *)self roomBuilder];
    v5 = [v4 name];
    [(HUEditRoomViewController *)self setTitle:v5];
  }
  else
  {
    v4 = _HULocalizedStringWithDefaultValue(@"HUAddRoomNameTitle", @"HUAddRoomNameTitle", 1);
    [(HUEditRoomViewController *)self setTitle:v4];
  }
}

- (void)cancelButtonPressed:(id)a3
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: cancel button pressed", v6, 2u);
  }

  v5 = [(HUEditRoomViewController *)self presentationDelegate];
  [v5 editRoomViewControllerDidFinish:self withNewRoom:0];
}

- (void)addButtonPressed:(id)a3
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: add button pressed", v6, 2u);
  }

  v5 = [(HUEditRoomViewController *)self addRoomDelegate];
  [v5 presentAddRoomViewControllerForEditRoomViewController:self];
}

- (void)doneButtonPressed:(id)a3
{
  id v39 = a3;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: done button pressed", (uint8_t *)buf, 2u);
  }

  v5 = [(HUEditRoomViewController *)self collectionView];
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  v7 = [(HUEditRoomViewController *)self roomItemManager];
  id v8 = [v7 nameItem];
  id v9 = [v6 indexPathForItem:v8];
  v10 = [v5 cellForItemAtIndexPath:v9];

  if (objc_opt_respondsToSelector())
  {
    id v11 = v10;
    v12 = objc_msgSend(v11, "textField", v39);
    v13 = [v12 text];
  }
  else
  {
    id v11 = 0;
    v13 = 0;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F69758], "sanitizeUserEnteredHomeKitName:", v13, v39);
  v15 = [(HUEditRoomViewController *)self roomBuilder];
  v41 = [v15 room];

  if (![v14 length])
  {
    int v16 = [(HUEditRoomViewController *)self roomBuilder];
    uint64_t v17 = [v16 name];

    v14 = (void *)v17;
  }
  id v18 = [v11 textField];
  [v18 setText:v14];

  v19 = [(HUEditRoomViewController *)self roomBuilder];
  [v19 setName:v14];

  v20 = [(HUEditRoomViewController *)self navigationItem];
  uint64_t v21 = [v20 rightBarButtonItem];
  [(HUEditRoomViewController *)self setSavedButtonBarItem:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v22];
  id v24 = [(HUEditRoomViewController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];

  [v22 startAnimating];
  v25 = [(HUEditRoomViewController *)self navigationItem];
  objc_super v26 = [v25 rightBarButtonItem];
  [v26 setEnabled:0];

  v27 = [v11 textField];
  LODWORD(v26) = [v27 canResignFirstResponder];

  if (v26)
  {
    id v28 = [v11 textField];
    [v28 resignFirstResponder];
  }
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v22];
  v30 = [(HUEditRoomViewController *)self navigationItem];
  [v30 setRightBarButtonItem:v29];

  objc_initWeak(buf, self);
  objc_super v31 = [(HUEditRoomViewController *)self roomBuilder];
  v32 = [v31 commitItem];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke;
  v49[3] = &unk_1E638E9D0;
  objc_copyWeak(&v50, buf);
  v33 = [v32 flatMap:v49];

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_3;
  v47[3] = &unk_1E63874A0;
  objc_copyWeak(&v48, buf);
  id v34 = (id)[v33 addSuccessBlock:v47];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_4;
  v45[3] = &unk_1E6386FB8;
  objc_copyWeak(&v46, buf);
  id v35 = (id)[v33 addFailureBlock:v45];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_6;
  v44[3] = &unk_1E63850B8;
  v44[4] = self;
  id v36 = (id)[v33 addCompletionBlock:v44];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_7;
  v42[3] = &unk_1E638E9F8;
  v42[4] = self;
  id v37 = v41;
  id v43 = v37;
  id v38 = (id)[v33 addSuccessBlock:v42];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);

  objc_destroyWeak(&v50);
  objc_destroyWeak(buf);
}

id __46__HUEditRoomViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained zoneModuleController];

  if (v5)
  {
    id v6 = [WeakRetained zoneModuleController];
    v7 = [v6 finishZoneNameEditing];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_2;
    v10[3] = &unk_1E6388A88;
    id v11 = v3;
    id v8 = [v7 flatMap:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }

  return v8;
}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateTitle];
}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_5;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) doneButtonPressed:0];
}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) savedButtonBarItem];
  id v3 = [*(id *)(a1 + 32) navigationItem];
  [v3 setRightBarButtonItem:v2];

  v4 = *(void **)(a1 + 32);

  return [v4 setSavedButtonBarItem:0];
}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_7(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) presentationDelegate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  if (v4 == v7)
  {
    id v6 = 0;
  }
  else if (objc_msgSend(v4, "isEqual:"))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v7;
  }
  [v3 editRoomViewControllerDidFinish:v5 withNewRoom:v6];
}

- (void)nameFieldTextChanged:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F69758];
  uint64_t v5 = [a3 text];
  id v6 = [v4 sanitizeUserEnteredHomeKitName:v5];
  BOOL v7 = [v6 length] != 0;

  id v8 = [(HUEditRoomViewController *)self navigationItem];
  id v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];

  [(HUEditRoomViewController *)self setModalInPresentation:v7];
}

- (id)itemModuleControllers
{
  id v3 = objc_opt_new();
  id v4 = [(HUEditRoomViewController *)self zoneModuleController];
  [v4 setHost:self];

  uint64_t v5 = [(HUEditRoomViewController *)self zoneModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUEditRoomViewController *)self roomItemManager];
  BOOL v7 = [v6 nameItem];
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [(HUEditRoomViewController *)self roomItemManager];
    v10 = [v9 wallpaperThumbnailItem];
    char v11 = [v5 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      v12 = [(HUEditRoomViewController *)self roomItemManager];
      v13 = [v12 wallpaperPickerItem];
      [v5 isEqual:v13];
    }
  }
  v14 = objc_opt_class();

  return (Class)v14;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)HUEditRoomViewController;
  [(HUItemCollectionViewController *)&v70 configureCell:v6 forItem:v7];
  char v8 = [(HUEditRoomViewController *)self roomItemManager];
  id v9 = [v8 nameItem];
  int v10 = [v7 isEqual:v9];

  if (!v10)
  {
    v15 = [(HUEditRoomViewController *)self roomItemManager];
    int v16 = [v15 chooseWallpaperItem];
    int v17 = [v7 isEqual:v16];

    if (v17)
    {
      id v11 = v6;
      id v18 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
      [v11 setContentConfiguration:v18];

      id v19 = objc_alloc_init(MEMORY[0x1E4F42830]);
      v71[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      [v11 setAccessories:v20];

      v14 = @"Home.Room.ChooseFromExisting";
      goto LABEL_5;
    }
    uint64_t v21 = [(HUEditRoomViewController *)self roomItemManager];
    v22 = [v21 cameraItem];
    if ([v7 isEqual:v22])
    {
    }
    else
    {
      v23 = [(HUEditRoomViewController *)self roomItemManager];
      id v24 = [v23 removeItem];
      int v25 = [v7 isEqual:v24];

      if (!v25)
      {
        id v36 = [(HUEditRoomViewController *)self roomItemManager];
        id v37 = [v36 wallpaperThumbnailItem];
        int v38 = [v7 isEqual:v37];

        if (v38)
        {
          id v39 = v6;
          [v39 setDelegate:self];
          v40 = [MEMORY[0x1E4F42D90] mainScreen];
          [v40 bounds];
          double v42 = v41;
          id v43 = [MEMORY[0x1E4F42D90] mainScreen];
          [v43 bounds];
          double v45 = v42 / v44;

          [v39 setImageSize:round(v45 * 244.0)];
          [v39 setAccessibilityIdentifier:@"Home.Room.WallpaperThumbnail"];
          id v46 = [(HUEditRoomViewController *)self roomBuilder];
          v47 = [v46 wallpaperBuilder];
          id v48 = [v47 wallpaperEditCollectionFuture];
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __50__HUEditRoomViewController_configureCell_forItem___block_invoke;
          v68[3] = &unk_1E638BB48;
          id v69 = v39;
          id v11 = v39;
          id v49 = (id)[v48 addSuccessBlock:v68];

          goto LABEL_14;
        }
        id v50 = [(HUEditRoomViewController *)self roomItemManager];
        v51 = [v50 wallpaperPickerItem];
        int v52 = [v7 isEqual:v51];

        if (!v52) {
          goto LABEL_15;
        }
        v53 = [(HUEditRoomViewController *)self wallpaperPickerController];
        [v53 setDelegate:self];

        v54 = [MEMORY[0x1E4F69780] sharedInstance];
        v55 = [v54 allNamedWallpapersForWallpaperCollectionType:1];
        v56 = [(HUEditRoomViewController *)self wallpaperPickerController];
        [v56 setNamedWallpapers:v55];

        v57 = [MEMORY[0x1E4F69780] sharedInstance];
        v58 = [v57 allNamedWallpaperThumbnailsForWallpaperCollectionType:1];
        v59 = [(HUEditRoomViewController *)self wallpaperPickerController];
        [v59 setNamedWallpaperThumbnails:v58];

        id v11 = v6;
        [v11 setUseDefaultCellBackgroundColor:1];
        v60 = [(HUEditRoomViewController *)self wallpaperPickerController];
        [v11 setViewController:v60];

        [v11 setAllowSelfSizing:1];
        v61 = [(HUEditRoomViewController *)self wallpaperPickerController];
        v62 = [(HUEditRoomViewController *)self collectionView];
        [v62 frame];
        [v61 setImageSizeToFitWidth:3 forNumberOfWallpapers:v63];

        v29 = [(HUEditRoomViewController *)self roomBuilder];
        v64 = [v29 wallpaperBuilder];
        v65 = [v64 wallpaperEditCollectionFuture];
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __50__HUEditRoomViewController_configureCell_forItem___block_invoke_2;
        v67[3] = &unk_1E638BB48;
        v67[4] = self;
        id v66 = (id)[v65 addSuccessBlock:v67];

        goto LABEL_13;
      }
    }
    id v11 = v6;
    objc_super v26 = [(HUEditRoomViewController *)self roomItemManager];
    v27 = [v26 removeItem];
    uint64_t v28 = [v7 isEqual:v27];

    v29 = +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:v7 isDestructive:v28];
    [v11 setContentConfiguration:v29];
    [v11 setAccessories:MEMORY[0x1E4F1CBF0]];
    v30 = [(HUEditRoomViewController *)self roomItemManager];
    objc_super v31 = [v30 cameraItem];
    int v32 = [v7 isEqual:v31];

    if (v32) {
      [v11 setAccessibilityIdentifier:@"Home.Room.TakePhoto"];
    }
    v33 = [(HUEditRoomViewController *)self roomItemManager];
    id v34 = [v33 removeItem];
    int v35 = [v7 isEqual:v34];

    if (v35) {
      [v11 setAccessibilityIdentifier:@"Home.Room.RemoveRoom"];
    }
LABEL_13:

    goto LABEL_14;
  }
  id v11 = [v6 textField];
  v12 = [(HUEditRoomViewController *)self roomBuilder];
  v13 = [v12 name];
  [v11 setText:v13];

  [v11 setAutocapitalizationType:1];
  [v11 setDelegate:self];
  [v11 setClearButtonMode:1];
  [v11 addTarget:self action:sel_nameFieldTextChanged_ forControlEvents:917504];
  v14 = @"Home.Room.RoomName";
LABEL_5:
  [v11 setAccessibilityIdentifier:v14];
LABEL_14:

LABEL_15:
}

void __50__HUEditRoomViewController_configureCell_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 processedImage];
  [*(id *)(a1 + 32) setImage:v5];
  id v4 = [v3 wallpaper];

  LODWORD(v3) = [v4 type] != 2;
  [*(id *)(a1 + 32) setContentMode:2 * v3];
}

void __50__HUEditRoomViewController_configureCell_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 processedImage];
  id v4 = [v10 wallpaper];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    id v6 = [*(id *)(a1 + 32) wallpaperPickerController];
    id v7 = [v10 wallpaper];
    [v6 setCustomWallpaper:v7 image:v3];
  }
  char v8 = [*(id *)(a1 + 32) wallpaperPickerController];
  id v9 = [v10 wallpaper];
  [v8 setSelectedWallpaper:v9 animated:0];
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUEditRoomViewController *)self roomItemManager];
  id v6 = [v5 cameraItem];
  if ([v4 isEqual:v6]) {
    goto LABEL_4;
  }
  id v7 = [(HUEditRoomViewController *)self roomItemManager];
  char v8 = [v7 chooseWallpaperItem];
  if ([v4 isEqual:v8])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v11 = [(HUEditRoomViewController *)self roomItemManager];
  v12 = [v11 wallpaperThumbnailItem];
  char v13 = [v4 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    unint64_t v9 = -1;
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUEditRoomViewController *)self roomItemManager];
  unint64_t v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUEditRoomViewController *)self roomItemManager];
  id v11 = [v10 cameraItem];
  if ([v9 isEqual:v11])
  {
    v12 = [v9 latestResults];
    char v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    int v14 = [v13 BOOLValue];

    if (!v14) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v15 = [(HUEditRoomViewController *)self roomItemManager];
  int v16 = [v15 chooseWallpaperItem];
  if ([v9 isEqual:v16])
  {
LABEL_8:

LABEL_9:
    BOOL v19 = 1;
    goto LABEL_10;
  }
  int v17 = [(HUEditRoomViewController *)self roomItemManager];
  id v18 = [v17 wallpaperThumbnailItem];
  if ([v9 isEqual:v18])
  {

    goto LABEL_8;
  }
  id v30 = v6;
  uint64_t v21 = [(HUEditRoomViewController *)self roomItemManager];
  v22 = [v21 removeItem];
  char v23 = [v9 isEqual:v22];

  if (v23)
  {
    BOOL v19 = 1;
  }
  else
  {
    id v24 = [(HUEditRoomViewController *)self roomItemManager];
    int v25 = [v24 wallpaperPickerItem];
    char v26 = [v9 isEqual:v25];

    if ((v26 & 1) == 0)
    {
      v27 = [(HUEditRoomViewController *)self roomItemManager];
      uint64_t v28 = [v27 nameItem];
      char v29 = [v9 isEqual:v28];

      if ((v29 & 1) == 0)
      {
        v31.receiver = self;
        v31.super_class = (Class)HUEditRoomViewController;
        id v6 = v30;
        BOOL v19 = [(HUItemCollectionViewController *)&v31 collectionView:v30 shouldHighlightItemAtIndexPath:v7];
        goto LABEL_10;
      }
    }
    BOOL v19 = 0;
  }
  id v6 = v30;
LABEL_10:

  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)HUEditRoomViewController;
  [(HUItemCollectionViewController *)&v51 collectionView:v6 didSelectItemAtIndexPath:v7];
  char v8 = [(HUEditRoomViewController *)self roomItemManager];
  unint64_t v9 = [v8 displayedItemAtIndexPath:v7];

  [v6 deselectItemAtIndexPath:v7 animated:1];
  id v10 = [(HUEditRoomViewController *)self roomItemManager];
  id v11 = [v10 cameraItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F42A90]);
    [v13 setDelegate:self];
    [v13 setSourceType:1];
    [v13 setModalPresentationStyle:0];
    [(HUEditRoomViewController *)self presentViewController:v13 animated:1 completion:0];
LABEL_13:

    goto LABEL_14;
  }
  int v14 = [(HUEditRoomViewController *)self roomItemManager];
  v15 = [v14 chooseWallpaperItem];
  int v16 = [v9 isEqual:v15];

  if (!v16)
  {
    BOOL v19 = [(HUEditRoomViewController *)self roomItemManager];
    v20 = [v19 wallpaperThumbnailItem];
    int v21 = [v9 isEqual:v20];

    if (v21)
    {
      id v13 = [(HUEditRoomViewController *)self roomBuilder];
      v22 = [v13 wallpaperBuilder];
      char v23 = [v22 wallpaperEditCollectionFuture];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_162;
      v47[3] = &unk_1E638BB48;
      void v47[4] = self;
      id v24 = (id)[v23 addSuccessBlock:v47];
    }
    else
    {
      int v25 = [(HUEditRoomViewController *)self roomItemManager];
      char v26 = [v25 removeItem];
      int v27 = [v9 isEqual:v26];

      if (!v27) {
        goto LABEL_14;
      }
      uint64_t v28 = [(HUEditRoomViewController *)self roomBuilder];
      uint64_t v29 = [v28 name];
      id v30 = (void *)v29;
      objc_super v31 = &stru_1F18F92B8;
      if (v29) {
        objc_super v31 = (__CFString *)v29;
      }
      int v32 = v31;

      HULocalizedStringWithFormat(@"HUEditRoomRemoveAlertTitle", @"%@", v33, v34, v35, v36, v37, v38, (uint64_t)v32);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v22 = [(UICollectionViewController *)self hu_actionSheetWithTitle:0 message:v13 indexPath:v7];
      id v39 = (void *)MEMORY[0x1E4F42720];
      v40 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
      char v23 = [v39 actionWithTitle:v40 style:1 handler:0];

      [v23 setAccessibilityIdentifier:@"Home.Room.RemoveRoom.Cancel"];
      double v41 = (void *)MEMORY[0x1E4F42720];
      double v42 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_183;
      v45[3] = &unk_1E6389708;
      void v45[4] = self;
      id v46 = v32;
      id v43 = v32;
      double v44 = [v41 actionWithTitle:v42 style:2 handler:v45];

      [v44 setAccessibilityIdentifier:@"Home.Rome.RemoveRoom.Remove"];
      [v22 addAction:v23];
      [v22 addAction:v44];
      [(HUEditRoomViewController *)self presentViewController:v22 animated:1 completion:0];
    }
    goto LABEL_13;
  }
  if (_os_feature_enabled_impl())
  {
    objc_initWeak(&location, self);
    int v17 = [MEMORY[0x1E4F4B7D8] applicationWithBundleIdentifier:@"com.apple.mobileslideshow"];
    id v18 = [MEMORY[0x1E4F4B7F0] sharedGuard];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v48[3] = &unk_1E638BB98;
    objc_copyWeak(&v49, &location);
    [v18 initiateAuthenticationWithShieldingForSubject:v17 completion:v48];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
LABEL_14:
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    block[3] = &unk_1E63862A0;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v9);
  }
  else if (v5)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Error presenting Auth UI in Home app for photo picker usage: %@", buf, 0xCu);
    }
  }
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUWallpaperPickerViewController alloc];
  v2 = _HULocalizedStringWithDefaultValue(@"HUEditRoomNamedWallpaperSectionTitle", @"HUEditRoomNamedWallpaperSectionTitle", 1);
  id v3 = [(HUWallpaperPickerViewController *)v1 initWithCollectionType:1 namedSectionTitle:v2 delegate:WeakRetained];

  id v4 = [WeakRetained navigationController];
  [v4 pushViewController:v3 animated:1];
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_162(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 originalImage];
  id v4 = [HUWallpaperEditingViewController alloc];
  id v5 = [v3 wallpaper];

  id v6 = [(HUWallpaperEditingViewController *)v4 initWithWallpaper:v5 image:v7 delegate:*(void *)(a1 + 32)];
  [(HUWallpaperEditingViewController *)v6 setModalPresentationStyle:0];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2_183(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v5 = [*(id *)(a1 + 32) roomItemManager];
  id v6 = [v5 home];
  id v7 = [*(id *)(a1 + 32) roomBuilder];
  char v8 = [v7 room];
  id v9 = [v4 errorOnlyCompletionHandlerAdapter];
  [v6 removeRoom:v8 completionHandler:v9];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v14[3] = &unk_1E63874A0;
  objc_copyWeak(&v15, &location);
  id v10 = (id)[v4 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5;
  v12[3] = &unk_1E6386708;
  id v13 = *(id *)(a1 + 40);
  id v11 = (id)[v4 addFailureBlock:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained presentationDelegate];
  [v2 editRoomViewControllerDidFinish:WeakRetained withNewRoom:0];

  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E638EA20;
  v4[4] = WeakRetained;
  [v3 dispatchHomeObserverMessage:v4 sender:0];
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) roomItemManager];
    id v4 = [v3 home];
    id v5 = [*(id *)(a1 + 32) roomBuilder];
    id v6 = [v5 room];
    [v7 home:v4 didRemoveRoom:v6];
  }
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  id v5 = [v3 sharedHandler];
  uint64_t v6 = *MEMORY[0x1E4F68800];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v9 = *MEMORY[0x1E4F68420];
  v10[0] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 handleError:v4 operationType:v6 options:v8 retryBlock:0 cancelBlock:0];
}

- (id)trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v6 = [v5 displayedItemAtIndexPath:v4];
  uint64_t v7 = &unk_1F1AD9570;
  if ([v6 conformsToProtocol:v7]) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  id v9 = v8;

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    char v23 = self;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  if (objc_msgSend(v9, "hf_canDeleteItem"))
  {
    objc_initWeak((id *)buf, self);
    id v11 = (void *)MEMORY[0x1E4F42900];
    uint64_t v12 = _HULocalizedStringWithDefaultValue(@"HUDeleteTitle", @"HUDeleteTitle", 1);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E638EA70;
    id v19 = v9;
    objc_copyWeak(&v20, (id *)buf);
    id v13 = [v11 contextualActionWithStyle:1 title:v12 handler:v18];

    int v14 = (void *)MEMORY[0x1E4F42E68];
    int v21 = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    int v16 = [v14 configurationWithActions:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(*(id *)(a1 + 32), "hf_deleteItem");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
  v13[3] = &unk_1E638EA48;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = [v10 addSuccessBlock:v13];
  id v12 = (id)[v11 addFailureBlock:&__block_literal_global_199];

  objc_destroyWeak(&v14);
}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained zoneModuleController];
  v2 = [v1 module];
  id v3 = [v2 itemProviders];

  id v4 = [WeakRetained itemManager];
  id v5 = [MEMORY[0x1E4F69230] requestToReloadItemProviders:v3 senderSelector:sel_tableView_editActionsForRowAtIndexPath_];
  id v6 = (id)[v4 performItemUpdateRequest:v5];
}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 logError:v3 operationDescription:*MEMORY[0x1E4F68808]];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUEditRoomViewController;
  id v9 = a5;
  [(HUItemCollectionViewController *)&v16 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:v9];
  id v10 = [(HUItemCollectionViewController *)self itemManager];
  id v11 = [v10 displayedItemAtIndexPath:v9];

  id v12 = [(HUEditRoomViewController *)self roomItemManager];
  id v13 = [v12 nameItem];
  if (([v11 isEqual:v13] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v14 = [(HUEditRoomViewController *)self roomBuilder];
  id v15 = [v14 room];

  if (!v15)
  {
    id v12 = [v8 textField];
    [v12 becomeFirstResponder];
LABEL_5:
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  [(HUEditRoomViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F439A0]];

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  id v7 = objc_alloc(MEMORY[0x1E4F69778]);
  id v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  id v10 = (void *)[v7 initWithType:1 assetIdentifier:v9 cropInfo:0];

  id v11 = [MEMORY[0x1E4F69780] sharedInstance];
  id v12 = [v11 processOriginalImageFromWallpaper:v10 originalImage:v6];

  [(HUEditRoomViewController *)self presentWallpaperEditingViewControllerWithImage:v12 wallpaper:v10];
}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  [(HUEditRoomViewController *)self updateWallpaper:a4 image:a5];
  id v7 = [(HUEditRoomViewController *)self navigationController];
  id v6 = (id)[v7 popToViewController:self animated:1];
}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F69778];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v10 = [v6 UUID];
  id v8 = [v10 UUIDString];
  id v9 = [v5 customWallpaperWithAssetIdentifier:v8];
  [(HUEditRoomViewController *)self updateWallpaper:v9 image:v7];
}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F69778];
  id v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 UUID];
  id v11 = [v10 UUIDString];
  id v26 = [v6 customWallpaperWithAssetIdentifier:v11];

  [v9 setOriginalCustomImage:v8];
  id v12 = [(HUEditRoomViewController *)self roomBuilder];
  id v13 = [v12 wallpaperBuilder];
  [v13 setWallpaper:v26 image:v8];

  id v14 = [(HUEditRoomViewController *)self roomItemManager];
  id v15 = [(HUEditRoomViewController *)self roomItemManager];
  objc_super v16 = [v15 wallpaperPickerItem];
  int v17 = [v14 indexPathForItem:v16];

  id v18 = [(HUItemCollectionViewController *)self itemManager];
  id v19 = [v18 displayedItemAtIndexPath:v17];

  id v20 = [(HUItemCollectionViewController *)self itemManager];
  [(HUItemCollectionViewController *)self itemManager:v20 didUpdateResultsForItem:v19 atIndexPath:v17];

  int v21 = [(HUEditRoomViewController *)self roomBuilder];
  v22 = [v21 room];

  if (v22)
  {
    char v23 = [(HUEditRoomViewController *)self roomBuilder];
    __int16 v24 = [v23 wallpaperBuilder];
    id v25 = (id)[v24 commitWallpaper];
  }
}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HUEditRoomViewController *)self roomBuilder];
  id v10 = [v9 wallpaperBuilder];
  [v10 setWallpaper:v8 image:v7];

  id v11 = [(HUEditRoomViewController *)self roomBuilder];
  id v12 = [v11 room];

  if (v12)
  {
    id v15 = [(HUEditRoomViewController *)self roomBuilder];
    id v13 = [v15 wallpaperBuilder];
    id v14 = (id)[v13 commitWallpaper];
  }
}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  id v4 = [(HUEditRoomViewController *)self roomBuilder];
  id v5 = [v4 wallpaperBuilder];
  id v6 = [v5 wallpaperEditCollectionFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HUEditRoomViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke;
  v8[3] = &unk_1E638BB48;
  v8[4] = self;
  id v7 = (id)[v6 addSuccessBlock:v8];
}

void __70__HUEditRoomViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 originalImage];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 wallpaper];

  [v4 presentWallpaperEditingViewControllerWithImage:v6 wallpaper:v5];
}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  [(HUEditRoomViewController *)self updateWallpaper:a4 image:a5];

  [(HUEditRoomViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)wallpaperEditingDidCancel:(id)a3
{
}

- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HUWallpaperEditingViewController alloc] initWithWallpaper:v6 image:v7 delegate:self];

  [(HUEditRoomViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUEditRoomViewController *)self roomBuilder];
  id v9 = [v8 wallpaperBuilder];
  [v9 setWallpaper:v7 image:v6];

  id v10 = [(HUEditRoomViewController *)self roomBuilder];
  id v11 = [v10 room];

  if (v11)
  {
    id v12 = [(HUEditRoomViewController *)self roomBuilder];
    id v13 = [v12 wallpaperBuilder];
    id v14 = (id)[v13 commitWallpaper];
  }
  BOOL v15 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell];
  objc_super v16 = [(HUEditRoomViewController *)self roomItemManager];
  int v17 = v16;
  if (v15) {
    [v16 wallpaperPickerItem];
  }
  else {
  id v21 = [v16 wallpaperThumbnailItem];
  }

  id v18 = [(HUEditRoomViewController *)self roomItemManager];
  id v19 = [v18 indexPathForItem:v21];

  id v20 = [(HUItemCollectionViewController *)self itemManager];
  [(HUItemCollectionViewController *)self itemManager:v20 didUpdateResultsForItem:v21 atIndexPath:v19];
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (HUEditRoomViewControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUEditRoomViewControllerPresentationDelegate *)WeakRetained;
}

- (HUEditRoomViewControllerAddRoomDelegate)addRoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addRoomDelegate);

  return (HUEditRoomViewControllerAddRoomDelegate *)WeakRetained;
}

- (HUZoneModuleController)zoneModuleController
{
  return self->_zoneModuleController;
}

- (void)setZoneModuleController:(id)a3
{
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerController
{
  return self->_wallpaperPickerController;
}

- (void)setWallpaperPickerController:(id)a3
{
}

- (HUEditRoomItemManager)roomItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_roomItemManager);

  return (HUEditRoomItemManager *)WeakRetained;
}

- (void)setRoomItemManager:(id)a3
{
}

- (UITextField)editingTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingTextField);

  return (UITextField *)WeakRetained;
}

- (void)setEditingTextField:(id)a3
{
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_destroyWeak((id *)&self->_editingTextField);
  objc_destroyWeak((id *)&self->_roomItemManager);
  objc_storeStrong((id *)&self->_wallpaperPickerController, 0);
  objc_storeStrong((id *)&self->_zoneModuleController, 0);
  objc_destroyWeak((id *)&self->_addRoomDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);

  objc_storeStrong((id *)&self->_roomBuilder, 0);
}

@end