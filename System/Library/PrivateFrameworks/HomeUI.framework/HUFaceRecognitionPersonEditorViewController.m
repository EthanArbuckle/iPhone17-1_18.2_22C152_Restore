@interface HUFaceRecognitionPersonEditorViewController
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)shouldUpdateDelegate;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUFaceRecognitionPersonEditorItemManager)personItemManager;
- (HUFaceRecognitionPersonEditorViewController)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5;
- (HUFaceRecognitionPersonEditorViewController)initWithPersonLikeItem:(id)a3;
- (HUFaceRecognitionPersonEditorViewControllerDelegate)delegate;
- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_deletePerson;
- (void)_presentAddPersonViewController;
- (void)addPersonViewControllerDidFinish:(id)a3;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPersonItemManager:(id)a3;
- (void)setShouldUpdateDelegate:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUFaceRecognitionPersonEditorViewController

- (HUFaceRecognitionPersonEditorViewController)initWithPersonLikeItem:(id)a3
{
  id v4 = a3;
  v5 = [HUFaceRecognitionPersonEditorItemManager alloc];
  v6 = (void *)[v4 copy];
  v7 = [(HUFaceRecognitionPersonEditorItemManager *)v5 initWithDelegate:self sourceItem:v6];

  v15.receiver = self;
  v15.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  v8 = [(HUItemTableViewController *)&v15 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_personItemManager, v7);
    v10 = [v4 latestResults];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    if (v11)
    {
      v12 = (void *)v11;
    }
    else
    {
      v13 = [v4 person];
      v12 = [v13 name];

      if (!v12)
      {
        v12 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonEditorViewControllerTitleUnknownPerson", @"HUFaceRecognitionPersonEditorViewControllerTitleUnknownPerson", 1);
      }
    }
    [(HUFaceRecognitionPersonEditorViewController *)v9 setTitle:v12];

    v9->_shouldUpdateDelegate = 0;
  }

  return v9;
}

- (HUFaceRecognitionPersonEditorViewController)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F69398];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithPerson:v11 fromPersonManager:v10 home:v9];

  v13 = [(HUFaceRecognitionPersonEditorViewController *)self initWithPersonLikeItem:v12];
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  [(HUItemTableViewController *)&v13 viewWillDisappear:a3];
  uint64_t v4 = [(HUFaceRecognitionPersonEditorViewController *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    BOOL v6 = [(HUFaceRecognitionPersonEditorViewController *)self shouldUpdateDelegate];

    if (v6)
    {
      v7 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
      v8 = [v7 personItem];
      uint64_t v14 = *MEMORY[0x1E4F68728];
      v15[0] = MEMORY[0x1E4F1CC38];
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = [v8 updateWithOptions:v9];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__HUFaceRecognitionPersonEditorViewController_viewWillDisappear___block_invoke;
      v12[3] = &unk_1E6390BB8;
      v12[4] = self;
      id v11 = (id)[v10 addSuccessBlock:v12];
    }
  }
}

void __65__HUFaceRecognitionPersonEditorViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 personItemManager];
  uint64_t v4 = [v3 personItem];
  [v5 personEditorViewController:v2 didUpdateItem:v4];
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  v2 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  v3 = [v2 personItem];
  uint64_t v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  LOBYTE(v2) = [v5 length] != 0;
  return (char)v2;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v7 = [v6 faceCropItem];

  if (v7 != v5)
  {
    v8 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
    id v9 = [v8 nameItem];

    if (v9 != v5)
    {
      id v10 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
      id v11 = [v10 hideNotificationsItem];

      if (v11 != v5)
      {
        v12 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
        objc_super v13 = [v12 deleteItem];
        if (![v5 isEqual:v13])
        {
          uint64_t v14 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
          objc_super v15 = [v14 addNameItem];
          [v5 isEqual:v15];
        }
      }
    }
  }
  v16 = objc_opt_class();

  return (Class)v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v24 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = v24;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    [v10 setDelegate:self];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v24 setSelectionStyle:0];
  }
  id v11 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  v12 = [v11 deleteItem];
  int v13 = [v7 isEqual:v12];

  if (v13)
  {
    objc_opt_class();
    id v14 = v24;
    if (objc_opt_isKindOfClass()) {
      objc_super v15 = v14;
    }
    else {
      objc_super v15 = 0;
    }
    id v16 = v15;

    v17 = v16;
    uint64_t v18 = 1;
  }
  else
  {
    v19 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
    v20 = [v19 addNameItem];
    int v21 = [v7 isEqual:v20];

    if (!v21) {
      goto LABEL_19;
    }
    objc_opt_class();
    id v22 = v24;
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v16 = v23;

    v17 = v16;
    uint64_t v18 = 0;
  }
  [v17 setDestructive:v18];

LABEL_19:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  [(HUItemTableViewController *)&v23 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  v12 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v13 = [v12 nameItem];

  if (v13 == v11)
  {
    objc_opt_class();
    id v14 = v10;
    if (objc_opt_isKindOfClass()) {
      objc_super v15 = v14;
    }
    else {
      objc_super v15 = 0;
    }
    id v16 = v15;

    v17 = [v11 latestResults];
    uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68AC8]];
    v19 = [v16 textField];
    [v19 setPlaceholder:v18];

    v20 = [v11 latestResults];
    int v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    id v22 = [v16 textField];
    [v22 setText:v21];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  uint64_t v9 = [v8 nameItem];
  if (v7 == (void *)v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v10 = (void *)v9;
  id v11 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  uint64_t v12 = [v11 hideNotificationsItem];
  if (v7 == (void *)v12)
  {

    goto LABEL_7;
  }
  id v13 = (void *)v12;
  id v14 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  objc_super v15 = [v14 faceCropItem];

  if (v7 != v15)
  {
    id v16 = v5;
    goto LABEL_9;
  }
LABEL_8:
  id v16 = 0;
LABEL_9:

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  [(HUItemTableViewController *)&v24 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  uint64_t v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v11 = [v10 deleteItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    [(HUFaceRecognitionPersonEditorViewController *)self _deletePerson];
  }
  else
  {
    id v13 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
    id v14 = [v13 addNameItem];
    int v15 = [v9 isEqual:v14];

    if (v15)
    {
      id v16 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
      v17 = [v16 sourceItem];
      uint64_t v18 = [v17 latestResults];
      v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68868]];
      int v20 = [v19 BOOLValue];

      if (v20)
      {
        [(HUFaceRecognitionPersonEditorViewController *)self _presentAddPersonViewController];
      }
      else
      {
        int v21 = [MEMORY[0x1E4F69378] sharedInstance];
        id v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_photosLibraryPeopleAlbumURL");
        id v23 = (id)[v21 openURL:v22];
      }
    }
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionPersonEditorViewController;
  [(HUItemTableViewController *)&v13 itemManager:a3 didUpdateResultsForSourceItem:v6];
  id v7 = [v6 latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Source item has determined it needs to hide: %@. Dismissing.", buf, 0xCu);
    }

    id v11 = [(HUFaceRecognitionPersonEditorViewController *)self navigationController];
    id v12 = (id)[v11 popViewControllerAnimated:1];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUFaceRecognitionPersonEditorViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  int v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 displayedItemAtIndexPath:v8];

  id v11 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v12 = [v11 hideNotificationsItem];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {
    id v14 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
    id v15 = [v14 personItem];

    BOOL v16 = !v4;
    v17 = [(HUItemTableViewController *)self itemManager];
    uint64_t v18 = [v17 home];
    v19 = [v18 personSettingsManager];

    int v20 = [v15 latestResults];
    int v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68BB8]];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__HUFaceRecognitionPersonEditorViewController_switchCell_didTurnOn___block_invoke;
    v23[3] = &unk_1E6390BE0;
    id v24 = v15;
    BOOL v26 = v4;
    id v25 = v6;
    BOOL v27 = !v4;
    id v22 = v15;
    [v19 updateClassificationNotificationsEnabled:v16 forPersonWithUUID:v21 completion:v23];
  }
}

void __68__HUFaceRecognitionPersonEditorViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) person];
      int v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)id v8 = 138412802;
      *(void *)&v8[4] = v5;
      if (v6) {
        id v7 = @"ON";
      }
      else {
        id v7 = @"OFF";
      }
      *(_WORD *)&v8[12] = 2112;
      *(void *)&v8[14] = v7;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Update for person %@ disable notification setting %@ failed with error %@", v8, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setOn:", *(unsigned char *)(a1 + 49) == 0, *(_OWORD *)v8);
  }
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v6 = [v5 nameItem];

  return v6 == v4;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v6 = [v5 sourceItem];
  id v7 = [v6 latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  __int16 v9 = (void *)MEMORY[0x1E4F69758];
  id v10 = [v4 text];
  uint64_t v11 = [v9 sanitizeUserEnteredHomeKitName:v10];

  if ([v11 length] || !v8)
  {
    if ([v11 length])
    {
      id v12 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
      int v13 = [v12 personItem];

      id v14 = [v13 personManager];
      id v15 = [v13 person];
      BOOL v16 = objc_msgSend(v14, "hf_namePerson:name:", v15, v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke;
      v20[3] = &unk_1E6385A20;
      id v21 = v4;
      id v22 = v8;
      v17 = [v16 addFailureBlock:v20];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke_2;
      v19[3] = &unk_1E6390C08;
      v19[4] = self;
      id v18 = (id)[v17 addSuccessBlock:v19];
    }
  }
  else
  {
    [v4 setText:v8];
  }
}

void __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  [v3 setText:v2];
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  [v5 handleError:v4];
}

uint64_t __70__HUFaceRecognitionPersonEditorViewController_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldUpdateDelegate:1];
}

- (void)_deletePerson
{
  id v3 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v4 = [v3 personItem];

  id v5 = [v4 personManager];
  id v6 = [v4 person];

  if (v6)
  {
    id v7 = [v4 person];
    id v8 = [v7 UUID];
    objc_msgSend(v5, "hf_removePersonWithUUID:", v8);
  }
  else
  {
    id v7 = [v4 latestResults];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68858]];
    objc_msgSend(v5, "hf_removeFaceCropsWithUUIDs:", v8);
  __int16 v9 = };

  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke;
  id v15 = &unk_1E63874A0;
  objc_copyWeak(&v16, &location);
  id v10 = [v9 addSuccessBlock:&v12];
  id v11 = (id)objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_248, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

void __60__HUFaceRecognitionPersonEditorViewController__deletePerson__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (void)_presentAddPersonViewController
{
  objc_opt_class();
  id v3 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v4 = [v3 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v14 = v5;

  id v6 = v14;
  if (v14)
  {
    id v7 = [v14 event];
    id v8 = [HUFaceRecognitionAddPersonViewController alloc];
    __int16 v9 = [(HUItemTableViewController *)self itemManager];
    id v10 = [v9 home];
    id v11 = [(HUFaceRecognitionAddPersonViewController *)v8 initWithSignificantEvent:v7 home:v10];

    [(HUFaceRecognitionAddPersonViewController *)v11 setDelegate:self];
    uint64_t v12 = [(HUFaceRecognitionPersonEditorViewController *)self navigationController];
    id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);

    id v6 = v14;
  }
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self hu_preloadContent];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__HUFaceRecognitionPersonEditorViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
  v10[3] = &unk_1E638BAD0;
  id v11 = v5;
  uint64_t v12 = self;
  id v7 = v5;
  id v8 = [v6 flatMap:v10];

  return v8;
}

id __117__HUFaceRecognitionPersonEditorViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 faceClassification];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 person];
      id v6 = [v5 name];
      uint64_t v7 = [v6 length];

      if (!v7)
      {
        id v15 = [*(id *)(a1 + 40) itemManager];
        uint64_t v16 = [v15 home];
        v17 = [(id)v16 personManager];
        id v14 = [v17 UUID];

        id v18 = [v4 personManagerUUID];
        LOBYTE(v16) = [v14 isEqual:v18];

        if (v16)
        {
          v19 = [HUFaceRecognitionAddPersonViewController alloc];
          uint64_t v20 = *(void *)(a1 + 32);
          id v21 = [*(id *)(a1 + 40) itemManager];
          id v22 = [v21 home];
          id v23 = [(HUFaceRecognitionAddPersonViewController *)v19 initWithSignificantEvent:v20 home:v22];

          id v24 = [*(id *)(a1 + 40) navigationController];
          uint64_t v12 = objc_msgSend(v24, "hu_pushPreloadableViewController:animated:", v23, 1);
        }
        else
        {
          id v25 = HFLogForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            int v30 = 138412546;
            v31 = v4;
            __int16 v32 = 2112;
            uint64_t v33 = v29;
            _os_log_error_impl(&dword_1BE345000, v25, OS_LOG_TYPE_ERROR, "Face classification %@ for event %@ contains an unnamed person from the photo library; name must be added inside Photos",
              (uint8_t *)&v30,
              0x16u);
          }

          BOOL v26 = (void *)MEMORY[0x1E4F7A0D8];
          objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
          id v23 = (HUFaceRecognitionAddPersonViewController *)objc_claimAutoreleasedReturnValue();
          uint64_t v12 = [v26 futureWithError:v23];
        }

        goto LABEL_18;
      }
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = [v4 person];
        int v30 = 138412802;
        v31 = v4;
        __int16 v32 = 2112;
        uint64_t v33 = v9;
        __int16 v34 = 2112;
        v35 = v10;
        _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Face classification %@ for event %@ already contains tagged person %@; add person settings not supported",
          (uint8_t *)&v30,
          0x20u);
      }
    }
    else
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v28 = *(void **)(a1 + 32);
        int v30 = 138412290;
        v31 = v28;
        _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "No face classification for event %@; add person settings not supported",
          (uint8_t *)&v30,
          0xCu);
      }
    }

    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
    uint64_t v12 = [v13 futureWithError:v14];
LABEL_18:

    goto LABEL_19;
  }
  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v30) = 0;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "No event provided; add person settings not supported",
      (uint8_t *)&v30,
      2u);
  }

  uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_19:

  return v12;
}

- (void)addPersonViewControllerDidFinish:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(HUFaceRecognitionPersonEditorViewController *)self setShouldUpdateDelegate:1];
  id v5 = [(HUFaceRecognitionPersonEditorViewController *)self personItemManager];
  id v6 = [v5 personItem];

  uint64_t v11 = *MEMORY[0x1E4F68728];
  v12[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = [v6 updateWithOptions:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HUFaceRecognitionPersonEditorViewController_addPersonViewControllerDidFinish___block_invoke;
  v10[3] = &unk_1E6390C30;
  void v10[4] = self;
  v10[5] = a2;
  id v9 = (id)[v8 addSuccessBlock:v10];
}

void __80__HUFaceRecognitionPersonEditorViewController_addPersonViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) personItemManager];
  id v2 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];
}

- (HUFaceRecognitionPersonEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUFaceRecognitionPersonEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUFaceRecognitionPersonEditorItemManager)personItemManager
{
  return self->_personItemManager;
}

- (void)setPersonItemManager:(id)a3
{
}

- (BOOL)shouldUpdateDelegate
{
  return self->_shouldUpdateDelegate;
}

- (void)setShouldUpdateDelegate:(BOOL)a3
{
  self->_shouldUpdateDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItemManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end