@interface HUFaceRecognitionLibraryListViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUFaceRecognitionLibraryListItemManager)listItemManager;
- (HUFaceRecognitionLibraryListViewController)initWithHome:(id)a3;
- (HUFaceRecognitionLibraryListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4;
- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5;
- (id)trailingSwipeActionsForItem:(id)a3;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)dealloc;
- (void)dismissTextViewController;
- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4;
- (void)setListItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUFaceRecognitionLibraryListViewController

- (HUFaceRecognitionLibraryListViewController)initWithHome:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUFaceRecognitionLibraryListItemManager alloc] initWithHome:v4 delegate:0];
  v21.receiver = self;
  v21.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  v6 = [(HUItemTableViewController *)&v21 initWithItemManager:v5 tableViewStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listItemManager, v5);
    v8 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionViewControllerTitle", @"HUFaceRecognitionViewControllerTitle", 1);
    [(HUFaceRecognitionLibraryListViewController *)v7 setTitle:v8];

    v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = objc_msgSend(v4, "hf_allCameraProfiles", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) clipManager];
          [v9 addObservationForCameraClipManager:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (HUFaceRecognitionLibraryListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionLibraryListViewController.m", 58, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionLibraryListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  [(HUItemTableViewController *)&v8 viewDidAppear:a3];
  id v4 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  v5 = [v4 firstFastUpdateFuture];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HUFaceRecognitionLibraryListViewController_viewDidAppear___block_invoke;
  v7[3] = &unk_1E6389828;
  v7[4] = self;
  id v6 = (id)[v5 addCompletionBlock:v7];
}

void __60__HUFaceRecognitionLibraryListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listItemManager];
  [v1 setRecentsLimit:-1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  [(HUItemTableViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  [v4 sendAnalyticsEvent];
}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HUItemTableViewController *)self hu_preloadContent];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v15[3] = &unk_1E6386C98;
  BOOL v18 = a5;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = [v10 flatMap:v15];

  return v13;
}

id __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  v2 = [HUFaceRecognitionKnownToHomeViewController alloc];
  v3 = [*(id *)(a1 + 32) itemManager];
  id v4 = [v3 home];
  objc_super v5 = [(HUFaceRecognitionKnownToHomeViewController *)v2 initWithHome:v4];

  id v6 = [*(id *)(a1 + 32) navigationController];
  v7 = objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, *(unsigned __int8 *)(a1 + 56));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2;
  v11[3] = &unk_1E638BB20;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = [v7 flatMap:v11];

  return v9;
}

uint64_t __115__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFaceRecognitionPersonSettingsForPerson:*(void *)(a1 + 40) personManager:*(void *)(a1 + 48) animated:1];
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 faceClassification];
    if (v7)
    {
      objc_opt_class();
      id v8 = v6;
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      id v11 = objc_alloc(MEMORY[0x1E4F69140]);
      id v12 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
      id v13 = [v12 home];
      id v14 = (void *)[v11 initWithSignificantEvent:v10 home:v13];

      v15 = [[HUFaceRecognitionPersonEditorViewController alloc] initWithPersonLikeItem:v14];
      [(HUFaceRecognitionPersonEditorViewController *)v15 setDelegate:self];
      id v16 = [(HUItemTableViewController *)self itemManager];
      id v17 = [v16 home];
      [v17 personManager];
      BOOL v18 = v30 = v7;
      long long v19 = [v18 UUID];

      long long v20 = [(HUFaceRecognitionLibraryListViewController *)self navigationController];
      objc_super v21 = objc_msgSend(v20, "hu_pushPreloadableViewController:animated:", v15, 1);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __116__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
      v31[3] = &unk_1E6391E30;
      id v32 = v19;
      id v33 = v10;
      v34 = v15;
      id v35 = v8;
      v22 = v15;
      id v23 = v10;
      id v24 = v19;
      v25 = [v21 flatMap:v31];

      v7 = v30;
    }
    else
    {
      v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v6;
        _os_log_error_impl(&dword_1BE345000, v27, OS_LOG_TYPE_ERROR, "No face classification for event %@; add person settings not supported",
          buf,
          0xCu);
      }

      v28 = (void *)MEMORY[0x1E4F7A0D8];
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 33);
      v25 = [v28 futureWithError:v14];
    }
  }
  else
  {
    v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "No event provided; add person settings not supported",
        buf,
        2u);
    }

    v25 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v25;
}

id __116__HUFaceRecognitionLibraryListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) faceClassification];
  id v4 = [v3 personManagerUUID];
  LODWORD(v2) = [v2 isEqual:v4];

  if (v2) {
    [*(id *)(a1 + 48) presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:*(void *)(a1 + 56) animated:1];
  }
  else {
  id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v5;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 section];
  id v8 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  id v9 = [v8 knownToHomeItem];
  char v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    uint64_t v12 = [v11 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionLibrariesSection"];

    if (v7 != v12)
    {
      id v13 = [(HUItemTableViewController *)self itemManager];
      uint64_t v14 = [v13 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionSettingSwitchSection"];

      if (v7 != v14)
      {
        v15 = [(HUItemTableViewController *)self itemManager];
        [v15 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionRecentVisitorsSectionIdentifier"];
      }
    }
  }
  id v16 = objc_opt_class();

  return (Class)v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v9;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    [v8 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v57.receiver = self;
  v57.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  [(HUItemTableViewController *)&v57 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
  id v13 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  uint64_t v14 = [v13 knownToHomeItem];
  int v15 = [v11 isEqual:v14];

  if (v15)
  {
    objc_opt_class();
    id v16 = v10;
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    [v18 setHideIcon:1];
    long long v19 = [v11 latestResults];
    long long v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68A20]];
    int v21 = [v20 BOOLValue];

    [v16 setAccessoryType:v21 ^ 1u];
    if (v21) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = 3;
    }
    [v16 setSelectionStyle:v22];
LABEL_29:

    goto LABEL_30;
  }
  id v23 = [(HUItemTableViewController *)self itemManager];
  uint64_t v24 = [v23 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionLibrariesSection"];
  uint64_t v25 = [v12 section];

  if (v24 == v25)
  {
    objc_opt_class();
    id v26 = v11;
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v18 = v27;

    v28 = [(HUItemTableViewController *)self itemManager];
    v29 = [v28 home];
    v30 = [v29 currentUser];
    v31 = [v18 user];
    uint64_t v32 = [v30 isEqual:v31];

    [v10 setAccessoryType:v32];
    [v10 setUserInteractionEnabled:v32];
    objc_opt_class();
    id v33 = v10;
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    id v35 = v34;

    if (v35) {
      [v35 setHideIcon:1];
    }

    goto LABEL_29;
  }
  v36 = [(HUItemTableViewController *)self itemManager];
  uint64_t v37 = [v36 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionRecentVisitorsSectionIdentifier"];
  uint64_t v38 = [v12 section];

  if (v37 == v38)
  {
    objc_opt_class();
    id v39 = v10;
    if (objc_opt_isKindOfClass()) {
      v40 = v39;
    }
    else {
      v40 = 0;
    }
    id v18 = v40;

    [v18 setAvatarSize:44.0];
    v41 = [MEMORY[0x1E4F42B58] cellConfiguration];
    v42 = [v11 latestResults];
    v43 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    if (v43)
    {
      [v41 setText:v43];
    }
    else
    {
      v44 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionPersonNameCellUnknownPerson", @"HUFaceRecognitionPersonNameCellUnknownPerson", 1);
      [v41 setText:v44];
    }
    v45 = [v11 latestResults];
    v46 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v41 setSecondaryText:v46];

    v47 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v48 = [v41 secondaryTextProperties];
    [v48 setColor:v47];

    v49 = [v11 latestResults];
    uint64_t v50 = *MEMORY[0x1E4F68860];
    v51 = [v49 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];

    if (v51)
    {
      v52 = [v11 latestResults];
      v53 = [v52 objectForKeyedSubscript:v50];
      [v41 setImage:v53];

      v54 = [v41 imageProperties];
      [v54 setCornerRadius:22.0];

      v55 = [v41 imageProperties];
      objc_msgSend(v55, "setMaximumSize:", 44.0, 44.0);

      v56 = [v41 imageProperties];
      objc_msgSend(v56, "setReservedLayoutSize:", 44.0, 44.0);
    }
    [v39 setContentConfiguration:v41];
    [v39 setAccessoryType:1];

    goto LABEL_29;
  }
LABEL_30:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  [(HUItemTableViewController *)&v40 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  id v9 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  id v10 = [v9 knownToHomeItem];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v12 = [v8 latestResults];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A20]];
    char v14 = [v13 BOOLValue];

    if ((v14 & 1) == 0)
    {
      int v15 = [HUFaceRecognitionKnownToHomeViewController alloc];
      id v16 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
      id v17 = [v16 home];
      id v18 = [(HUFaceRecognitionKnownToHomeViewController *)v15 initWithHome:v17];

LABEL_15:
      v30 = [(HUFaceRecognitionLibraryListViewController *)self navigationController];
      id v39 = (id)[(HUFaceRecognitionUserPhotosLibrarySettingsViewController *)v30 hu_pushPreloadableViewController:v18 animated:1];
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v19 = [v6 section];
    long long v20 = [(HUItemTableViewController *)self itemManager];
    uint64_t v21 = [v20 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionLibrariesSection"];

    if (v19 == v21)
    {
      objc_opt_class();
      uint64_t v22 = [(HUItemTableViewController *)self itemManager];
      id v23 = [v22 displayedItemAtIndexPath:v6];
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      id v18 = v24;

      uint64_t v25 = [(HUFaceRecognitionPersonEditorViewController *)v18 user];
      id v26 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
      v27 = [v26 home];
      v28 = [v27 currentUser];
      int v29 = [v25 isEqual:v28];

      if (!v29) {
        goto LABEL_17;
      }
      v30 = [[HUFaceRecognitionUserPhotosLibrarySettingsViewController alloc] initWithUserPhotosLibraryItem:v18];
      v31 = [(HUFaceRecognitionLibraryListViewController *)self navigationController];
      id v32 = (id)objc_msgSend(v31, "hu_pushPreloadableViewController:animated:", v30, 1);

LABEL_16:
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v33 = [v6 section];
    v34 = [(HUItemTableViewController *)self itemManager];
    uint64_t v35 = [v34 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionRecentVisitorsSectionIdentifier"];

    if (v33 == v35)
    {
      id v36 = v8;
      if ([v36 conformsToProtocol:&unk_1F1AD8FD0]) {
        uint64_t v37 = v36;
      }
      else {
        uint64_t v37 = 0;
      }
      id v38 = v37;

      id v18 = [[HUFaceRecognitionPersonEditorViewController alloc] initWithPersonLikeItem:v38];
      [(HUFaceRecognitionPersonEditorViewController *)v18 setDelegate:self];
      goto LABEL_15;
    }
  }
LABEL_18:
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    __int16 v49 = 2112;
    id v50 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  id v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v6 indexPathForItem:v4];

  uint64_t v8 = [v7 section];
  id v9 = [(HUItemTableViewController *)self itemManager];
  uint64_t v10 = [v9 sectionIndexForDisplayedSectionIdentifier:@"HUFaceRecognitionRecentVisitorsSectionIdentifier"];

  if (v8 == v10)
  {
    objc_opt_class();
    id v11 = v4;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    char v14 = [v11 latestResults];
    int v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    id v16 = [v13 cameraProfile];
    id v17 = [v16 clipManager];

    if ([v15 length])
    {
      uint64_t v24 = HULocalizedStringWithFormat(@"HUFaceRecognitionModuleDisassociatePersonSwipeActionFormat", @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      uint64_t v25 = (void *)MEMORY[0x1E4F42900];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke;
      v41[3] = &unk_1E6391EA8;
      id v42 = v13;
      id v43 = v17;
      v44 = self;
      id v26 = [v25 contextualActionWithStyle:1 title:v24 handler:v41];
      v46 = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];

      v28 = v42;
    }
    else
    {
      v30 = [v11 latestResults];
      uint64_t v24 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F68BB8]];

      v31 = [v11 latestResults];
      v28 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68858]];

      if (v24 || [v28 count])
      {
        uint64_t v35 = (void *)MEMORY[0x1E4F42900];
        id v32 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionModuleHideEventSwipeActionFormat", @"HUFaceRecognitionModuleHideEventSwipeActionFormat", 1);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_114;
        v36[3] = &unk_1E6391EF8;
        id v37 = v13;
        id v38 = self;
        id v39 = v11;
        id v40 = v17;
        uint64_t v33 = [v35 contextualActionWithStyle:1 title:v32 handler:v36];

        v45 = v33;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      }
      else
      {
        uint64_t v24 = 0;
        v27 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }

    int v29 = [MEMORY[0x1E4F42E68] configurationWithActions:v27];
  }
  else
  {
    int v29 = 0;
  }

  return v29;
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) event];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Marking event %@ as a misclassification", buf, 0xCu);
  }
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) event];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_101;
  v13[3] = &unk_1E6391E80;
  id v14 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = v5;
  id v12 = v5;
  [v8 handleFaceMisclassificationForSignificantEvent:v9 completion:v13];
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 32) event];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to handle misclassification for significant event %@ (error: %@)", buf, 0x16u);
    }
    id v5 = [MEMORY[0x1E4F69110] sharedHandler];
    [v5 handleError:v3];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_103;
    id v14 = &unk_1E6391E58;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 32);
    [v6 dispatchCameraObserverMessage:&v11 sender:0];

    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "event", v11, v12, v13, v14);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Successfully marked event %@ misclassified", buf, 0xCu);
    }
    id v5 = v15;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v9 = [*(id *)(a1 + 48) listItemManager];
  [v9 sendAnalyticsEvent];
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_103(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) event];
    id v6 = [v3 setWithObject:v5];
    [v7 clipManager:v4 didUpdateSignificantEvents:v6];
  }
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_114(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a1[4] event];
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Hiding event %@", buf, 0xCu);
  }
  uint64_t v8 = [a1[5] listItemManager];
  id v9 = [v8 home];
  id v10 = [v9 personManager];

  uint64_t v11 = [a1[4] person];

  uint64_t v12 = [a1[6] latestResults];
  id v13 = v12;
  if (v11)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68BB8]];
    objc_msgSend(v10, "hf_removePersonWithUUID:", v14);
  }
  else
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68858]];
    objc_msgSend(v10, "hf_removeFaceCropsWithUUIDs:", v14);
  id v15 = };

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_115;
  v20[3] = &unk_1E6391ED0;
  id v21 = a1[4];
  id v16 = a1[7];
  id v17 = a1[5];
  id v22 = v16;
  id v23 = v17;
  id v24 = v5;
  id v18 = v5;
  id v19 = (id)[v15 addCompletionBlock:v20];
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_115(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 32) event];
      *(_DWORD *)buf = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to handle removal/hiding for event %@ (error: %@)", buf, 0x16u);
    }
    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v4];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_116;
    v12[3] = &unk_1E6391E58;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    [v7 dispatchCameraObserverMessage:v12 sender:0];

    id v6 = v13;
  }

  (*(void (**)(void, BOOL, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v4 != 0, v8, v9);
  id v10 = [*(id *)(a1 + 48) listItemManager];
  [v10 sendAnalyticsEvent];
}

void __74__HUFaceRecognitionLibraryListViewController_trailingSwipeActionsForItem___block_invoke_116(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) event];
    id v6 = [v3 setWithObject:v5];
    [v7 clipManager:v4 didUpdateSignificantEvents:v6];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke;
  aBlock[3] = &unk_1E6391F20;
  objc_copyWeak(v50, location);
  v50[1] = (id)a2;
  id v8 = v7;
  id v49 = v8;
  uint64_t v9 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v4)
  {
    id v10 = [(HUItemTableViewController *)self itemManager];
    uint64_t v11 = [v10 home];
    uint64_t v12 = objc_msgSend(v11, "hf_allCameraProfilesWithSmartMotionRecordingEnabled");
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v9[2](v9, 1);
      goto LABEL_9;
    }
    uint64_t v25 = HFLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "No camera profiles meet requirements to enable face recognition.", buf, 2u);
    }

    id v26 = (void *)MEMORY[0x1E4F42728];
    uint64_t v27 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerEnableRequirementAlertTitle", @"HUFaceRecognitionItemModuleControllerEnableRequirementAlertTitle", 1);
    v28 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerEnableRequirementAlertDescription", @"HUFaceRecognitionItemModuleControllerEnableRequirementAlertDescription", 1);
    __int16 v17 = [v26 alertControllerWithTitle:v27 message:v28 preferredStyle:1];

    int v29 = (void *)MEMORY[0x1E4F42720];
    v30 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerEnableRequirementAlertActionDismiss", @"HUFaceRecognitionItemModuleControllerEnableRequirementAlertActionDismiss", 1);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_132;
    v45[3] = &unk_1E638B2B8;
    v46 = v9;
    v31 = [v29 actionWithTitle:v30 style:0 handler:v45];
    [v17 addAction:v31];

    [(HUFaceRecognitionLibraryListViewController *)self presentViewController:v17 animated:1 completion:0];
    id v24 = (id *)&v46;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F42728];
    id v15 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerConfirmationAlertTitle", @"HUFaceRecognitionItemModuleControllerConfirmationAlertTitle", 1);
    id v16 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerConfirmationAlertDescription", @"HUFaceRecognitionItemModuleControllerConfirmationAlertDescription", 1);
    __int16 v17 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

    id v18 = (void *)MEMORY[0x1E4F42720];
    uint64_t v19 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerConfirmationAlertActionDisable", @"HUFaceRecognitionItemModuleControllerConfirmationAlertActionDisable", 1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2_143;
    v43[3] = &unk_1E638B2B8;
    v44 = v9;
    id v20 = [v18 actionWithTitle:v19 style:2 handler:v43];
    [v17 addAction:v20];

    id v21 = (void *)MEMORY[0x1E4F42720];
    id v22 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionItemModuleControllerConfirmationAlertActionCancel", @"HUFaceRecognitionItemModuleControllerConfirmationAlertActionCancel", 1);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3_147;
    v41[3] = &unk_1E6385188;
    id v42 = v8;
    id v23 = [v21 actionWithTitle:v22 style:1 handler:v41];
    [v17 addAction:v23];

    [(HUFaceRecognitionLibraryListViewController *)self presentViewController:v17 animated:1 completion:0];
    id v24 = (id *)&v44;
  }
LABEL_9:
  id v32 = [(HUFaceRecognitionLibraryListViewController *)self tableView];
  uint64_t v33 = [v32 indexPathForCell:v8];

  v34 = [(HUItemTableViewController *)self itemManager];
  uint64_t v35 = [v34 displayedItemAtIndexPath:v33];

  id v36 = [v35 latestResults];
  uint64_t v37 = *MEMORY[0x1E4F68AC0];
  id v38 = [v36 objectForKey:*MEMORY[0x1E4F68AC0]];

  if (v38)
  {
    id v39 = [v35 latestResults];
    id v40 = [v39 objectForKeyedSubscript:v37];
  }
  else
  {
    id v40 = 0;
  }
  [MEMORY[0x1E4F68EE0] sendSwitchCellToggleEventForItem:v35 isOn:v4 title:v40 fromSourceViewController:self];

  objc_destroyWeak(v50);
  objc_destroyWeak(location);
}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained itemManager];
  id v6 = [v5 home];
  id v7 = objc_msgSend(v6, "hf_setFaceRecognitionEnabled:", a2);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2;
  v14[3] = &unk_1E6384D58;
  uint64_t v8 = *(void *)(a1 + 48);
  v14[4] = WeakRetained;
  v14[5] = v8;
  uint64_t v9 = [v7 addSuccessBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3;
  v11[3] = &unk_1E63899B8;
  char v13 = a2;
  id v12 = *(id *)(a1 + 32);
  id v10 = (id)[v9 addFailureBlock:v11];
}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) listItemManager];
  id v2 = (id)[v3 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];
}

void __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error setting face recognition to %d: %@", (uint8_t *)v6, 0x12u);
  }

  [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_2_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__HUFaceRecognitionLibraryListViewController_switchCell_didTurnOn___block_invoke_3_147(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:1 animated:1];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    uint64_t v27 = self;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v26, 0x16u);
  }

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_faceRecognitionPrivacyURL");
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F83AE8]);
    id v12 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreTitle", @"HUFaceRecognitionLearnMoreTitle", 1);
    char v13 = (void *)[v11 initWithTitle:v12 detailText:0 symbolName:0 contentLayout:2];

    id v14 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreUseSectionTitle", @"HUFaceRecognitionLearnMoreUseSectionTitle", 1);
    id v15 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreUseSectionBody", @"HUFaceRecognitionLearnMoreUseSectionBody", 1);
    [v13 addSectionWithHeader:v14 content:v15];

    id v16 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMorePhotoSectionTitle", @"HUFaceRecognitionLearnMorePhotoSectionTitle", 1);
    __int16 v17 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMorePhotoSectionBody", @"HUFaceRecognitionLearnMorePhotoSectionBody", 1);
    [v13 addSectionWithHeader:v16 content:v17];

    id v18 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreVisibilitySectionBody", @"HUFaceRecognitionLearnMoreVisibilitySectionBody", 1);
    [v13 addSectionWithHeader:0 content:v18];

    uint64_t v19 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreAnalysisSectionTitle", @"HUFaceRecognitionLearnMoreAnalysisSectionTitle", 1);
    id v20 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLearnMoreAnalysisSectionBody", @"HUFaceRecognitionLearnMoreAnalysisSectionBody", 1);
    [v13 addSectionWithHeader:v19 content:v20];

    id v21 = [MEMORY[0x1E4F83A80] boldButton];
    id v22 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    [v21 setTitle:v22 forState:0];

    [v21 addTarget:self action:sel_dismissTextViewController forControlEvents:64];
    id v23 = [v13 buttonTray];
    [v23 addButton:v21];

    id v24 = [(HUFaceRecognitionLibraryListViewController *)self navigationController];
    [v24 presentViewController:v13 animated:1 completion:0];
  }
  return 0;
}

- (void)dismissTextViewController
{
  id v2 = [(HUFaceRecognitionLibraryListViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4
{
  id v14 = a4;
  if ([v14 conformsToProtocol:&unk_1F19E4798]) {
    id v6 = v14;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 homeKitObject];

  uint64_t v9 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  int v10 = [v9 matchingItemForHomeKitObject:v8];

  if (v10)
  {
    id v11 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    id v13 = (id)[v11 updateResultsForItems:v12 senderSelector:a2];
  }
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUFaceRecognitionLibraryListViewController *)self listItemManager];
  BOOL v4 = [v3 home];

  int v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "hf_allCameraProfiles");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) clipManager];
        [v5 removeObservationForCameraClipManager:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)HUFaceRecognitionLibraryListViewController;
  [(HUFaceRecognitionLibraryListViewController *)&v12 dealloc];
}

- (HUFaceRecognitionLibraryListItemManager)listItemManager
{
  return self->_listItemManager;
}

- (void)setListItemManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end