@interface HUEditLocationViewController
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFHomeBuilder)homeBuilder;
- (HUEditLocationItemManager)homeItemManager;
- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5;
- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5 context:(unint64_t)a6;
- (HUEditLocationViewControllerAddLocationDelegate)addLocationDelegate;
- (HUEditableTextCell)nameCell;
- (HUEditableTextViewCell)detailNotesCell;
- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController;
- (HUPresentationDelegate)presentationDelegate;
- (HUUserNotificationTopicListModuleController)notificationTopicModuleController;
- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController;
- (NSString)editedName;
- (NSString)editedNotes;
- (UIBarButtonItem)savedButtonBarItem;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)presentBridgeSettings:(BOOL)a3;
- (id)presentDefaultMediaServiceSettings:(id)a3;
- (id)presentNetworkSettings:(BOOL)a3;
- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4;
- (id)presentPersonalRequestsSettings:(id)a3;
- (id)presentRestrictedGuestLockSettings;
- (id)presentSoftwareUpdate:(BOOL)a3;
- (id)presentUserLockSettings:(id)a3;
- (id)presentUserViewController:(id)a3;
- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (unint64_t)context;
- (void)_updateSoftwareUpdateDynamicFooterView;
- (void)activityLogCoordinator:(id)a3 didDetermineEventsExist:(BOOL)a4;
- (void)addButtonPressed:(id)a3;
- (void)didUpdateSiriTriggerPhraseSetting;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)doneButtonPressed:(id)a3;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)prefetchActivityLogEventsIfNecessary;
- (void)scrollToNotificationTopicsAnimated:(BOOL)a3;
- (void)setAddLocationDelegate:(id)a3;
- (void)setConnectedServicesItemModuleController:(id)a3;
- (void)setDetailNotesCell:(id)a3;
- (void)setEditedName:(id)a3;
- (void)setEditedNotes:(id)a3;
- (void)setHomeItemManager:(id)a3;
- (void)setNameCell:(id)a3;
- (void)setNotificationTopicModuleController:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textViewDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
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

@implementation HUEditLocationViewController

- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5 context:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [[HUEditLocationItemManager alloc] initWithHomeBuilder:v11 delegate:self context:a6];
  v22.receiver = self;
  v22.super_class = (Class)HUEditLocationViewController;
  v15 = [(HUItemTableViewController *)&v22 initWithItemManager:v14 tableViewStyle:1];
  if (v15)
  {
    uint64_t v16 = [v11 name];
    editedName = v15->_editedName;
    v15->_editedName = (NSString *)v16;

    uint64_t v18 = [v11 userNotes];
    editedNotes = v15->_editedNotes;
    v15->_editedNotes = (NSString *)v18;

    objc_storeWeak((id *)&v15->_homeItemManager, v14);
    objc_storeStrong((id *)&v15->_homeBuilder, a3);
    objc_storeWeak((id *)&v15->_presentationDelegate, v12);
    objc_storeWeak((id *)&v15->_addLocationDelegate, v13);
    v15->_context = a6;
    v20 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v20 addHomeManagerObserver:v15];
  }
  return v15;
}

- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5
{
  return [(HUEditLocationViewController *)self initWithHomeBuilder:a3 presentationDelegate:a4 addLocationDelegate:a5 context:0];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)HUEditLocationViewController;
  [(HUItemTableViewController *)&v30 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v4 = [(HUEditLocationViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(HUEditLocationViewController *)self navigationItem];
  v6 = [v5 rightBarButtonItem];
  [v6 setAccessibilityIdentifier:@"Home.HomeSettings.Done"];

  v7 = [(HUEditLocationViewController *)self homeItemManager];
  v8 = [v7 home];
  v9 = objc_msgSend(v8, "hf_displayName");
  [(HUEditLocationViewController *)self setTitle:v9];

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell])
  {
    v10 = objc_alloc_init(HUWallpaperPickerInlineViewController);
    wallpaperPickerViewController = self->_wallpaperPickerViewController;
    self->_wallpaperPickerViewController = v10;
  }
  uint64_t v12 = [(HUEditLocationViewController *)self addLocationDelegate];
  if (v12)
  {
    id v13 = (void *)v12;
    unint64_t v14 = [(HUEditLocationViewController *)self context];

    if (v14 != 1)
    {
      if ([MEMORY[0x1E4F69758] isRunningInStoreDemoMode])
      {
        v15 = [(HUEditLocationViewController *)self navigationItem];
        [v15 setHidesBackButton:1];
      }
      else
      {
        if ([MEMORY[0x1E4F69758] isAMac]) {
          goto LABEL_10;
        }
        id v16 = objc_alloc(MEMORY[0x1E4F427C0]);
        v17 = _HULocalizedStringWithDefaultValue(@"HUEditLocationAddButtonTitle", @"HUEditLocationAddButtonTitle", 1);
        uint64_t v18 = (void *)[v16 initWithTitle:v17 style:0 target:self action:sel_addButtonPressed_];
        v19 = [(HUEditLocationViewController *)self navigationItem];
        [v19 setLeftBarButtonItem:v18];

        v15 = [(HUEditLocationViewController *)self navigationItem];
        v20 = [v15 leftBarButtonItem];
        [v20 setAccessibilityIdentifier:@"Home.HomeSettings.AddHome"];
      }
    }
  }
LABEL_10:
  v21 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  objc_super v22 = [v21 homeManager];
  int v23 = [v22 hasOptedToHH2];

  if (v23)
  {
    v24 = [(HUEditLocationViewController *)self homeBuilder];
    v25 = [v24 home];
    [v25 startHomeDataSyncWithCompletionHandler:&__block_literal_global_128];
  }
  v26 = [MEMORY[0x1E4F692B8] sharedManager];
  v27 = [(HUEditLocationViewController *)self homeBuilder];
  v28 = [v27 home];
  id v29 = (id)[v26 fetchMediaServicesForHome:v28];

  [(HUEditLocationViewController *)self prefetchActivityLogEventsIfNecessary];
}

void __43__HUEditLocationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Failed to initiate home data sync with error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)scrollToNotificationTopicsAnimated:(BOOL)a3
{
  id v5 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v6 = [v5 firstFastUpdateFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HUEditLocationViewController_scrollToNotificationTopicsAnimated___block_invoke;
  v8[3] = &unk_1E638BA58;
  v8[4] = self;
  BOOL v9 = a3;
  id v7 = (id)[v6 addSuccessBlock:v8];
}

void __67__HUEditLocationViewController_scrollToNotificationTopicsAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeItemManager];
  v3 = +[HUUserNotificationTopicListModule sectionID];
  uint64_t v4 = [v2 sectionIndexForDisplayedSectionIdentifier:v3];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [*(id *)(a1 + 32) homeItemManager];
    uint64_t v6 = [v5 displayedItemsInSection:v4];
    id v8 = [v6 firstObject];

    id v7 = v8;
    if (v8)
    {
      [*(id *)(a1 + 32) scrollToItem:v8 animated:*(unsigned __int8 *)(a1 + 40)];
      id v7 = v8;
    }
  }
}

- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HUEditLocationViewController_presentNotificationSettingsForTopic_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  BOOL v9 = [v7 flatMap:v11];

  return v9;
}

id __77__HUEditLocationViewController_presentNotificationSettingsForTopic_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationTopicModuleController];
  v3 = [v2 presentNotificationSettingsForTopic:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];

  return v3;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self hu_preloadContent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HUEditLocationViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v11[3] = &unk_1E63853B8;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  BOOL v9 = [v7 flatMap:v11];

  return v9;
}

id __82__HUEditLocationViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationTopicModuleController];
  v3 = [v2 showNotificationSettingsForHomeKitObject:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];

  return v3;
}

- (id)presentNetworkSettings:(BOOL)a3
{
  id v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HUEditLocationViewController_presentNetworkSettings___block_invoke;
  v8[3] = &unk_1E638BA80;
  v8[4] = self;
  BOOL v9 = a3;
  id v6 = [v5 flatMap:v8];

  return v6;
}

id __55__HUEditLocationViewController_presentNetworkSettings___block_invoke(uint64_t a1)
{
  id v2 = [HUNetworkRouterSettingsViewController alloc];
  v3 = [*(id *)(a1 + 32) homeBuilder];
  uint64_t v4 = [v3 home];
  id v5 = [(HUNetworkRouterSettingsViewController *)v2 initWithHome:v4];

  id v6 = [*(id *)(a1 + 32) navigationController];
  id v7 = objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, *(unsigned __int8 *)(a1 + 40));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HUEditLocationViewController_presentNetworkSettings___block_invoke_2;
  v11[3] = &unk_1E6388A88;
  id v12 = v5;
  id v8 = v5;
  BOOL v9 = [v7 flatMap:v11];

  return v9;
}

uint64_t __55__HUEditLocationViewController_presentNetworkSettings___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)presentBridgeSettings:(BOOL)a3
{
  id v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HUEditLocationViewController_presentBridgeSettings___block_invoke;
  v8[3] = &unk_1E638BA80;
  v8[4] = self;
  BOOL v9 = a3;
  id v6 = [v5 flatMap:v8];

  return v6;
}

id __54__HUEditLocationViewController_presentBridgeSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeBuilder];
  v3 = [v2 home];
  uint64_t v4 = +[HomeHubsAndBridgesHelper createHomeHubsAndBridgesListViewHostingControllerWithHome:v3];

  id v5 = [*(id *)(a1 + 32) navigationController];
  id v6 = objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v4, *(unsigned __int8 *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HUEditLocationViewController_presentBridgeSettings___block_invoke_2;
  v10[3] = &unk_1E6388A88;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 flatMap:v10];

  return v8;
}

uint64_t __54__HUEditLocationViewController_presentBridgeSettings___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)presentSoftwareUpdate:(BOOL)a3
{
  id v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke;
  v8[3] = &unk_1E638BA80;
  v8[4] = self;
  BOOL v9 = a3;
  id v6 = [v5 flatMap:v8];

  return v6;
}

id __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeBuilder];
  v3 = [v2 home];
  char v4 = objc_msgSend(v3, "hf_shouldShowSoftwareUpdateSettings");

  if (v4)
  {
    id v5 = [HUSoftwareUpdateStandaloneViewController alloc];
    id v6 = [*(id *)(a1 + 32) homeBuilder];
    id v7 = [v6 home];
    id v8 = [(HUSoftwareUpdateStandaloneViewController *)v5 initWithHome:v7];

    BOOL v9 = [*(id *)(a1 + 32) navigationController];
    v10 = objc_msgSend(v9, "hu_pushPreloadableViewController:animated:", v8, *(unsigned __int8 *)(a1 + 40));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke_2;
    v16[3] = &unk_1E6388A88;
    v17 = v8;
    id v11 = v8;
    id v12 = [v10 flatMap:v16];
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x1E4F7A0D8];
    unint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v12 = [v13 futureWithError:v14];
  }

  return v12;
}

uint64_t __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)presentPersonalRequestsSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke;
  v9[3] = &unk_1E638BAD0;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F69710]);
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 currentUser];
  id v5 = (void *)[v2 initWithHome:v3 user:v4 nameStyle:0];

  id v6 = [HUEditUserViewController alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) homeItemManager];
  BOOL v9 = [v8 pinCodeManager];
  id v10 = [(HUEditUserViewController *)v6 initWithItem:v5 home:v7 pinCodeManager:v9];

  id v11 = [*(id *)(a1 + 40) navigationController];
  id v12 = objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_2;
  v17[3] = &unk_1E638BAA8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v18 = v5;
  uint64_t v19 = v13;
  id v14 = v5;
  v15 = [v12 flatMap:v17];

  return v15;
}

id __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_2(uint64_t a1)
{
  id v2 = [[HUPersonalRequestsEditorTableViewController alloc] initWithUserItem:*(void *)(a1 + 32) onlyShowDeviceSwitches:0];
  v3 = [*(id *)(a1 + 40) navigationController];
  id v4 = objc_msgSend(v3, "hu_pushPreloadableViewController:animated:", v2, 1);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_3;
  v8[3] = &unk_1E6388A88;
  BOOL v9 = v2;
  id v5 = v2;
  id v6 = [v4 flatMap:v8];

  return v6;
}

uint64_t __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)presentUserViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HUEditLocationViewController_presentUserViewController___block_invoke;
  v9[3] = &unk_1E638BAD0;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

id __58__HUEditLocationViewController_presentUserViewController___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3 = [v2 allHomesFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HUEditLocationViewController_presentUserViewController___block_invoke_2;
  v8[3] = &unk_1E6388C28;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = [v3 flatMap:v8];

  return v6;
}

id __58__HUEditLocationViewController_presentUserViewController___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = a2;
  uint64_t v27 = [v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v27)
  {
    uint64_t v4 = *(void *)v35;
    id v29 = v3;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v4) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v28 = v6;
        uint64_t v7 = objc_msgSend(v6, "hf_allUsersIncludingCurrentUser", v26);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v31 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              uint64_t v13 = [v12 uniqueIdentifier];
              id v14 = [*(id *)(a1 + 32) uniqueIdentifier];
              char v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

              if (v15)
              {
                uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F69710]) initWithHome:v28 user:v12 nameStyle:0];
                v20 = [HUEditUserViewController alloc];
                v21 = [*(id *)(a1 + 40) homeItemManager];
                objc_super v22 = [v21 pinCodeManager];
                int v23 = [(HUEditUserViewController *)v20 initWithItem:v19 home:v28 pinCodeManager:v22];

                v24 = [*(id *)(a1 + 40) navigationController];
                id v18 = objc_msgSend(v24, "hu_pushPreloadableViewController:animated:", v23, 0);

                id v3 = v29;
                v17 = v29;
                goto LABEL_18;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        uint64_t v4 = v26;
        id v3 = v29;
      }
      uint64_t v27 = [v29 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v27);
  }

  id v16 = (void *)MEMORY[0x1E4F7A0D8];
  v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
  id v18 = [v16 futureWithError:v17];
LABEL_18:

  return v18;
}

- (id)presentRestrictedGuestLockSettings
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v28 = self;
    __int16 v29 = 2112;
    long long v30 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Presenting lock category settings for restricted guest.", buf, 0x16u);
  }
  id v6 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v7 = [v6 home];

  uint64_t v8 = [v7 currentUser];
  id v9 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v10 = [v7 currentUser];
  id v11 = (void *)[v9 initWithHome:v7 user:v10 nameStyle:0];

  id v12 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v13 = [v12 pinCodeManager];

  objc_initWeak((id *)buf, self);
  id v14 = [v13 userPinCodes];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke;
  v21[3] = &unk_1E638BAF8;
  objc_copyWeak(v26, (id *)buf);
  id v15 = v8;
  id v22 = v15;
  v26[1] = (id)a2;
  id v16 = v7;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  id v18 = v11;
  id v25 = v18;
  id v19 = (id)[v14 addSuccessBlock:v21];

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke_2;
  v14[3] = &unk_1E6389E28;
  id v15 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v14);

  if (v6)
  {
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138412546;
      id v17 = WeakRetained;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v6 inHome:*(void *)(a1 + 40) onAccessory:0];
    uint64_t v10 = [[HUPinCodeDetailsViewController alloc] initWithItem:v9 pinCodeManager:*(void *)(a1 + 48) home:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v10 = [[HUPinCodeDetailsViewController alloc] initWithItem:*(void *)(a1 + 56) pinCodeManager:*(void *)(a1 + 48) home:*(void *)(a1 + 40)];
  }
  id v11 = _HULocalizedStringWithDefaultValue(@"HUUsersLocksTitle", @"HUUsersLocksTitle", 1);
  [(HUPinCodeDetailsViewController *)v10 setTitle:v11];

  id v12 = [WeakRetained navigationController];
  id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v10, 1);
}

uint64_t __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  id v4 = [v3 user];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)presentUserLockSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke;
  v9[3] = &unk_1E638BAD0;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeItemManager];
  id v3 = [v2 pinCodeManager];

  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v5 currentUser];
  uint64_t v7 = (void *)[v4 initWithHome:v5 user:v6 nameStyle:0];

  uint64_t v8 = [[HUEditUserViewController alloc] initWithItem:v7 home:*(void *)(a1 + 40) pinCodeManager:v3];
  id v9 = [v3 refreshDataStore];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_2;
  v15[3] = &unk_1E638BB20;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  __int16 v18 = v8;
  id v12 = v8;
  id v13 = [v9 flatMap:v15];

  return v13;
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentUser];
  LODWORD(v2) = objc_msgSend(v2, "hf_userIsRestrictedGuest:", v3);

  id v4 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v5 = [v4 presentRestrictedGuestLockSettings];
  }
  else
  {
    id v6 = [v4 navigationController];
    uint64_t v7 = objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", *(void *)(a1 + 48), 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_3;
    v9[3] = &unk_1E6387DC8;
    id v10 = *(id *)(a1 + 48);
    uint64_t v5 = [v7 addSuccessBlock:v9];
  }

  return v5;
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) presentPinDetailsViewController];
}

- (id)presentDefaultMediaServiceSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemTableViewController *)self hu_preloadContent];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke;
  v9[3] = &unk_1E638BAD0;
  id v10 = v4;
  uint64_t v11 = self;
  id v6 = v4;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

id __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F69710]);
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 currentUser];
  uint64_t v5 = (void *)[v2 initWithHome:v3 user:v4 nameStyle:0];

  id v6 = [HUEditUserViewController alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) homeItemManager];
  id v9 = [v8 pinCodeManager];
  id v10 = [(HUEditUserViewController *)v6 initWithItem:v5 home:v7 pinCodeManager:v9];

  uint64_t v11 = [*(id *)(a1 + 40) navigationController];
  id v12 = objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke_2;
  v16[3] = &unk_1E6387DC8;
  uint64_t v17 = v10;
  id v13 = v10;
  id v14 = [v12 addSuccessBlock:v16];

  return v14;
}

id __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) presentDefaultAccountViewController];
}

- (void)addButtonPressed:(id)a3
{
  id v4 = [(HUEditLocationViewController *)self addLocationDelegate];
  [v4 editLocationViewControllerWouldPresentAddController:self];
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F69758];
  id v6 = [(HUEditLocationViewController *)self editedName];
  uint64_t v7 = [v5 sanitizeUserEnteredHomeKitName:v6];

  if (![v7 length])
  {
    uint64_t v8 = [(HUEditLocationViewController *)self homeBuilder];
    uint64_t v9 = [v8 name];

    uint64_t v7 = (void *)v9;
  }
  id v10 = [(HUEditLocationViewController *)self nameCell];
  uint64_t v11 = [v10 textField];
  [v11 setText:v7];

  [(HUEditLocationViewController *)self setTitle:v7];
  id v12 = [(HUEditLocationViewController *)self homeBuilder];
  [v12 setName:v7];

  id v13 = [(HUEditLocationViewController *)self editedNotes];
  id v14 = [(HUEditLocationViewController *)self homeBuilder];
  [v14 setUserNotes:v13];

  id v15 = [(HUEditLocationViewController *)self navigationItem];
  id v16 = [v15 rightBarButtonItem];
  [(HUEditLocationViewController *)self setSavedButtonBarItem:v16];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v17];
  id v19 = [(HUEditLocationViewController *)self navigationItem];
  [v19 setRightBarButtonItem:v18];

  [v17 startAnimating];
  uint64_t v20 = [(HUEditLocationViewController *)self homeBuilder];
  v21 = [v20 commitItem];

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke;
  v27[3] = &unk_1E6386FB8;
  objc_copyWeak(&v28, &location);
  id v22 = (id)[v21 addFailureBlock:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  id v26[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_3;
  v26[3] = &unk_1E63850B8;
  v26[4] = self;
  id v23 = (id)[v21 addCompletionBlock:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_4;
  v25[3] = &unk_1E6387DC8;
  v25[4] = self;
  id v24 = (id)[v21 addSuccessBlock:v25];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __50__HUEditLocationViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_2;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __50__HUEditLocationViewController_doneButtonPressed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) doneButtonPressed:0];
}

uint64_t __50__HUEditLocationViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) savedButtonBarItem];
  id v3 = [*(id *)(a1 + 32) navigationItem];
  [v3 setRightBarButtonItem:v2];

  id v4 = *(void **)(a1 + 32);

  return [v4 setSavedButtonBarItem:0];
}

void __50__HUEditLocationViewController_doneButtonPressed___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) presentationDelegate];
  id v2 = (id)[v3 finishPresentation:*(void *)(a1 + 32) animated:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUEditLocationViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [(HUEditLocationViewController *)self tableView];
    [v8 reloadData];
  }
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUEditLocationViewController *)self homeItemManager];
  id v7 = [v6 notificationSettingsModule];

  if (v7 == v5)
  {
    id v12 = [(HUItemModuleController *)[HUUserNotificationTopicListModuleController alloc] initWithModule:v5];
    [(HUEditLocationViewController *)self setNotificationTopicModuleController:v12];

    id v13 = [(HUEditLocationViewController *)self homeItemManager];
    id v14 = [v13 pinCodeManager];
    id v15 = [(HUEditLocationViewController *)self notificationTopicModuleController];
    [v15 setPinCodeManager:v14];

    uint64_t v16 = [(HUEditLocationViewController *)self notificationTopicModuleController];
  }
  else
  {
    id v8 = [(HUEditLocationViewController *)self homeItemManager];
    id v9 = [v8 connectedServicesItemModule];

    if (v9 != v5)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"HUEditLocationViewController.m", 452, @"Unknown module %@", v5 object file lineNumber description];

      uint64_t v11 = 0;
      goto LABEL_7;
    }
    uint64_t v17 = [(HUItemModuleController *)[HUMatterConnectedServicesItemModuleController alloc] initWithModule:v5];
    [(HUEditLocationViewController *)self setConnectedServicesItemModuleController:v17];

    uint64_t v16 = [(HUEditLocationViewController *)self connectedServicesItemModuleController];
  }
  uint64_t v11 = (void *)v16;
LABEL_7:

  return v11;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(HUEditLocationViewController *)self homeItemManager];
  id v8 = [v7 nameItem];
  int v9 = [v6 isEqual:v8];

  if (v9) {
    goto LABEL_7;
  }
  id v10 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v11 = [v10 inviteUsersItem];
  int v12 = [v6 isEqual:v11];

  if (v12) {
    goto LABEL_7;
  }
  id v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 chooseWallpaperItem];
  if ([v6 isEqual:v14]) {
    goto LABEL_5;
  }
  id v15 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v16 = [v15 allowedAccessoryCategoryItemProvider];
  uint64_t v17 = [v16 items];
  int v18 = [v17 containsObject:v6];

  if (v18) {
    goto LABEL_7;
  }
  v21 = [(HUEditLocationViewController *)self homeItemManager];
  id v22 = [v21 homeScheduleItem];
  int v23 = [v6 isEqual:v22];

  if (v23) {
    goto LABEL_7;
  }
  id v24 = [(HUEditLocationViewController *)self homeItemManager];
  id v25 = [v24 wallpaperThumbnailItem];
  int v26 = [v6 isEqual:v25];

  if (v26) {
    goto LABEL_7;
  }
  uint64_t v27 = [(HUEditLocationViewController *)self homeItemManager];
  id v28 = [v27 wallpaperPickerItem];
  int v29 = [v6 isEqual:v28];

  if (v29) {
    goto LABEL_7;
  }
  long long v30 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v31 = [v30 detailNotesItem];
  int v32 = [v6 isEqual:v31];

  if (v32) {
    goto LABEL_7;
  }
  long long v33 = [(HUEditLocationViewController *)self homeItemManager];
  long long v34 = [v33 softwareUpdateItem];
  int v35 = [v6 isEqual:v34];

  if (v35) {
    goto LABEL_7;
  }
  long long v36 = [(HUEditLocationViewController *)self homeItemManager];
  long long v37 = [v36 showPredictedScenes];
  int v38 = [v6 isEqual:v37];

  if (v38) {
    goto LABEL_7;
  }
  id v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 cameraItem];
  if ([v6 isEqual:v14])
  {
LABEL_5:

LABEL_7:
    id v19 = objc_opt_class();
    goto LABEL_8;
  }
  v39 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v40 = [v39 removeItem];
  int v41 = [v6 isEqual:v40];

  if (v41) {
    goto LABEL_7;
  }
  v42 = [(HUEditLocationViewController *)self homeItemManager];
  v43 = [v42 soundCheckItem];
  int v44 = [v6 isEqual:v43];

  if (v44) {
    goto LABEL_7;
  }
  v45 = [(HUEditLocationViewController *)self homeItemManager];
  v46 = [v45 userItemProvider];
  v47 = [v46 items];
  if ([v47 containsObject:v6])
  {

    goto LABEL_7;
  }
  v48 = [(HUEditLocationViewController *)self homeItemManager];
  v49 = [v48 inviteItemProvider];
  v50 = [v49 items];
  int v51 = [v50 containsObject:v6];

  if (v51) {
    goto LABEL_7;
  }
  v52 = [(HUEditLocationViewController *)self homeItemManager];
  v53 = [v52 guestsItem];
  int v54 = [v6 isEqual:v53];

  if (v54) {
    goto LABEL_7;
  }
  v55 = [(HUEditLocationViewController *)self homeItemManager];
  v56 = [v55 locationServicesSettingItem];
  int v57 = [v6 isEqual:v56];

  if (v57) {
    goto LABEL_7;
  }
  v58 = [(HUEditLocationViewController *)self homeItemManager];
  v59 = [v58 siriTriggerPhraseSettingItem];
  int v60 = [v6 isEqual:v59];

  if (v60) {
    goto LABEL_7;
  }
  v61 = [MEMORY[0x1E4F28B00] currentHandler];
  [v61 handleFailureInMethod:a2, self, @"HUEditLocationViewController.m", 530, @"Couldn't find a cell class for item: %@", v6 object file lineNumber description];

  id v19 = 0;
LABEL_8:

  return (Class)v19;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v147 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v147;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 chooseWallpaperItem];
  if ([v9 isEqual:v14])
  {

LABEL_7:
    id v19 = v147;
    [v19 setAccessoryView:0];
    [v19 setAccessoryType:1];
    [v19 setHideIcon:1];
    uint64_t v20 = [(HUEditLocationViewController *)self homeItemManager];
    v21 = [v20 allowedAccessoryCategoryItemProvider];
    id v22 = [v21 items];
    int v23 = [v22 containsObject:v9];

    id v24 = v12;
    if (!v23)
    {
LABEL_10:

      goto LABEL_11;
    }
    [v19 setHideIcon:0];
    id v25 = +[HUIconCellContentMetrics compactMetrics];
    [v19 setContentMetrics:v25];
LABEL_9:

    goto LABEL_10;
  }
  id v15 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v16 = [v15 allowedAccessoryCategoryItemProvider];
  [v16 items];
  uint64_t v17 = v146 = v10;
  int v18 = [v17 containsObject:v9];

  id v10 = v146;
  if (v18) {
    goto LABEL_7;
  }
  int v26 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v27 = [v26 homeScheduleItem];
  int v28 = [v9 isEqual:v27];

  if (v28)
  {
    id v29 = v147;
    [v29 setIconDisplayStyle:1];
    [v29 setDisableContinuousIconAnimation:1];
    HUDefaultSizeForIconSize();
    double v31 = v30;
    double v33 = v32;
    long long v34 = [v29 contentMetrics];
    objc_msgSend(v34, "setIconSize:", v31, v33);

    [v29 setAccessoryView:0];
    [v29 setAccessoryType:1];
    int v35 = [v9 latestResults];
    long long v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v29 setAccessibilityIdentifier:v36];
LABEL_16:

LABEL_17:
    id v24 = v12;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v37 = [(HUEditLocationViewController *)self homeItemManager];
    int v38 = [v37 nameItem];
    int v39 = [v9 isEqual:v38];

    id v24 = v12;
    if (!v39) {
      goto LABEL_11;
    }
    [(HUEditLocationViewController *)self setNameCell:v147];
    uint64_t v40 = [(HUEditLocationViewController *)self nameCell];
    [v40 setAccessibilityIdentifier:@"Home.HomeSettings.HomeName"];
    goto LABEL_21;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v42 = [(HUEditLocationViewController *)self homeItemManager];
  v43 = v42;
  if (isKindOfClass)
  {
    int v44 = [v42 detailNotesItem];
    int v45 = [v9 isEqual:v44];

    id v24 = v12;
    if (v45)
    {
      [(HUEditLocationViewController *)self setDetailNotesCell:v147];
      v46 = [(HUEditLocationViewController *)self detailNotesCell];
      [v46 setTextViewDelegate:self];

      v47 = [v9 latestResults];
      v48 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      v49 = [(HUEditLocationViewController *)self detailNotesCell];
      [v49 setAccessibilityIdentifier:v48];

      id v19 = [(HUEditLocationViewController *)self detailNotesCell];
      id v25 = [(HUEditLocationViewController *)self homeBuilder];
      v50 = [v25 home];
      objc_msgSend(v19, "setEditEnabled:", objc_msgSend(v50, "hf_currentUserIsAdministrator"));

      goto LABEL_9;
    }
  }
  else
  {
    int v51 = [v42 siriTriggerPhraseSettingItem];
    int v52 = [v9 isEqual:v51];

    if (v52)
    {
      id v53 = v147;
      int v54 = [(HUItemTableViewController *)self itemManager];
      v55 = objc_msgSend(v54, "titleForSection:", objc_msgSend(v146, "section"));

      [v53 setAccessoryType:1];
      [v53 setHideIcon:1];
      v56 = +[HUIconCellContentMetrics compactMetrics];
      [v53 setContentMetrics:v56];

      goto LABEL_17;
    }
    int v57 = [(HUEditLocationViewController *)self homeItemManager];
    v58 = [v57 softwareUpdateItem];
    int v59 = [v9 isEqual:v58];

    if (v59)
    {
      id v29 = v147;
      [v29 setAccessoryType:1];
      int v60 = +[HUIconCellContentMetrics compactMetrics];
      [v29 setContentMetrics:v60];

      int v35 = [v9 latestResults];
      long long v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
      [v29 setHideIcon:v36 == 0];
      goto LABEL_16;
    }
    v61 = [(HUEditLocationViewController *)self homeItemManager];
    v62 = [v61 wallpaperThumbnailItem];
    int v63 = [v9 isEqual:v62];

    if (v63)
    {
      uint64_t v64 = objc_opt_class();
      id v65 = v147;
      if (v65)
      {
        if (objc_opt_isKindOfClass()) {
          v66 = v65;
        }
        else {
          v66 = 0;
        }
        v67 = v65;
        id v24 = v12;
        if (!v66)
        {
          v68 = [MEMORY[0x1E4F28B00] currentHandler];
          v69 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          [v68 handleFailureInFunction:v69, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v64, objc_opt_class() file lineNumber description];

          v67 = 0;
        }
      }
      else
      {
        v67 = 0;
        id v24 = v12;
      }

      v98 = [v9 latestResults];
      v99 = [v98 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v67 setAccessibilityIdentifier:v99];

      [v67 setDelegate:self];
      goto LABEL_11;
    }
    v70 = [(HUEditLocationViewController *)self homeItemManager];
    v71 = [v70 wallpaperPickerItem];
    int v72 = [v9 isEqual:v71];

    if (v72)
    {
      id v73 = v147;
      v74 = [(HUEditLocationViewController *)self wallpaperPickerViewController];
      [v73 setViewController:v74];

      v75 = [(HUEditLocationViewController *)self wallpaperPickerViewController];
      [v75 setDelegate:self];

      v76 = [MEMORY[0x1E4F69780] sharedInstance];
      v77 = [v76 allNamedWallpapersForWallpaperCollectionType:0];
      v78 = [(HUEditLocationViewController *)self wallpaperPickerViewController];
      [v78 setNamedWallpapers:v77];

      int v35 = [MEMORY[0x1E4F69780] sharedInstance];
      long long v36 = [v35 allNamedWallpaperThumbnailsForWallpaperCollectionType:0];
      id v29 = [(HUEditLocationViewController *)self wallpaperPickerViewController];
      [v29 setNamedWallpaperThumbnails:v36];
      goto LABEL_16;
    }
    v79 = [(HUEditLocationViewController *)self homeItemManager];
    v80 = [v79 inviteUsersItem];
    int v81 = [v9 isEqual:v80];

    if (v81)
    {
      id v19 = [v147 defaultContentConfiguration];
      v82 = [v9 latestResults];
      v83 = [v82 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v19 setText:v83];

      v84 = (void *)MEMORY[0x1E4F42A80];
      v85 = [(HUEditLocationViewController *)self homeItemManager];
      v86 = [v85 inviteUsersItem];
      v87 = [v86 latestResults];
      v88 = [v87 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];
      v89 = [v84 systemImageNamed:v88];
      [v19 setImage:v89];

      v90 = [v9 latestResults];
      v91 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v147 setAccessibilityIdentifier:v91];

      v92 = [v9 latestResults];
      v93 = [v92 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
      LODWORD(v86) = [v93 BOOLValue];

      if (v86)
      {
        v94 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v95 = [v19 textProperties];
        [v95 setColor:v94];

        v96 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v97 = [v19 imageProperties];
        [v97 setTintColor:v96];
      }
      else
      {
        v102 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        v103 = [v19 textProperties];
        [v103 setColor:v102];

        v96 = [v19 imageProperties];
        [v96 setTintColor:0];
      }
      id v10 = v146;
      id v24 = v12;

      double v104 = *MEMORY[0x1E4F43BA0];
      v105 = [v19 imageProperties];
      objc_msgSend(v105, "setReservedLayoutSize:", 37.0, v104);

      [v147 setContentConfiguration:v19];
      goto LABEL_10;
    }
    v100 = [(HUEditLocationViewController *)self homeItemManager];
    v101 = [v100 cameraItem];
    if ([v9 isEqual:v101])
    {
    }
    else
    {
      v106 = [(HUEditLocationViewController *)self homeItemManager];
      v107 = [v106 removeItem];
      int v108 = [v9 isEqual:v107];

      if (!v108)
      {
        v120 = [(HUEditLocationViewController *)self homeItemManager];
        v121 = [v120 soundCheckItem];
        int v122 = [v9 isEqual:v121];

        if (v122)
        {
          id v10 = v146;
          if (!v12)
          {
            v143 = [MEMORY[0x1E4F28B00] currentHandler];
            v144 = [NSString stringWithUTF8String:"-[HUEditLocationViewController setupCell:forItem:indexPath:]"];
            uint64_t v145 = objc_opt_class();
            [v143 handleFailureInFunction:v144, @"HUEditLocationViewController.m", 650, @"Expected class of %@ but was %@", v145, objc_opt_class() file lineNumber description];
          }
          [v12 setDelegate:self];
          goto LABEL_17;
        }
        v123 = [(HUEditLocationViewController *)self homeItemManager];
        v124 = [v123 userItemProvider];
        v125 = [v124 items];
        if ([v125 containsObject:v9])
        {
        }
        else
        {
          v126 = [(HUEditLocationViewController *)self homeItemManager];
          v127 = [v126 inviteItemProvider];
          v128 = [v127 items];
          int v129 = [v128 containsObject:v9];

          if (!v129)
          {
            id v10 = v146;
            id v24 = v12;
            if (v12)
            {
              v137 = [v12 item];
              v138 = [(HUEditLocationViewController *)self homeItemManager];
              v139 = [v138 showPredictedScenes];
              int v140 = [v137 isEqual:v139];

              if (v140)
              {
                v141 = [v9 latestResults];
                v142 = [v141 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
                [v12 setAccessibilityIdentifier:v142];
              }
              id v24 = v12;
              [v12 setDelegate:self];
              id v10 = v146;
            }
            goto LABEL_11;
          }
        }
        [v147 setAccessoryType:1];
        objc_opt_class();
        id v130 = v147;
        if (objc_opt_isKindOfClass()) {
          v131 = v130;
        }
        else {
          v131 = 0;
        }
        id v132 = v131;

        [v132 setShowAccessLevelDescription:1];
        v133 = [v9 latestResults];
        v134 = [v133 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

        if (v134)
        {
          [v132 setUserHandle:v134];
          v135 = [v9 latestResults];
          v136 = [v135 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
          [v132 setAccessibilityIdentifier:v136];
        }
        id v10 = v146;
        goto LABEL_17;
      }
    }
    v109 = [v147 imageView];
    [v109 setImage:0];

    [v147 setIndentationLevel:0];
    v110 = [(HUEditLocationViewController *)self homeItemManager];
    v111 = [v110 cameraItem];
    int v112 = [v9 isEqual:v111];

    if (v112)
    {
      v113 = [v9 latestResults];
      v114 = [v113 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v147 setAccessibilityIdentifier:v114];
    }
    id v19 = [(HUEditLocationViewController *)self homeItemManager];
    v115 = [v19 removeItem];
    id v10 = v146;
    id v24 = v12;
    if (([v9 isEqual:v115] & 1) == 0)
    {

      goto LABEL_10;
    }
    v116 = [(HUEditLocationViewController *)self homeItemManager];
    v117 = [v116 home];
    int v118 = objc_msgSend(v117, "hf_currentUserIsOwner");

    if (v118)
    {
      uint64_t v40 = [v9 latestResults];
      v119 = [v40 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v147 setAccessibilityIdentifier:v119];

LABEL_21:
    }
  }
LABEL_11:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 wallpaperThumbnailItem];
  int v15 = [v11 isEqual:v14];

  if (v15)
  {
    id v16 = v10;
    uint64_t v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 bounds];
    double v19 = v18;
    uint64_t v20 = [MEMORY[0x1E4F42D90] mainScreen];
    [v20 bounds];
    double v22 = v19 / v21;

    [v16 setImageSize:round(v22 * 244.0)];
    int v23 = [(HUEditLocationViewController *)self homeBuilder];
    id v24 = [v23 wallpaperBuilder];
    id v25 = [v24 wallpaperEditCollectionFuture];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke;
    v82[3] = &unk_1E638BB48;
    id v83 = v16;
    id v26 = v16;
    id v27 = (id)[v25 addSuccessBlock:v82];
  }
  else
  {
    int v28 = [(HUEditLocationViewController *)self homeItemManager];
    id v29 = [v28 wallpaperPickerItem];
    int v30 = [v11 isEqual:v29];

    if (v30)
    {
      double v31 = [(HUEditLocationViewController *)self wallpaperPickerViewController];
      double v32 = [(HUEditLocationViewController *)self tableView];
      [v32 frame];
      [v31 setImageSizeToFitWidth:3 forNumberOfWallpapers:v33];

      id v26 = [(HUEditLocationViewController *)self homeBuilder];
      long long v34 = [v26 wallpaperBuilder];
      int v35 = [v34 wallpaperEditCollectionFuture];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke_2;
      v80[3] = &unk_1E638BB70;
      v80[4] = self;
      BOOL v81 = v6;
      id v36 = (id)[v35 addSuccessBlock:v80];
    }
    else
    {
      long long v37 = [(HUEditLocationViewController *)self homeItemManager];
      int v38 = [v37 detailNotesItem];
      int v39 = [v11 isEqual:v38];

      if (v39)
      {
        id v40 = v10;
        int v41 = [(HUEditLocationViewController *)self editedNotes];
        [v40 setText:v41];

        v42 = [(HUEditLocationViewController *)self homeBuilder];
        v43 = [v42 home];
        objc_msgSend(v40, "setEditEnabled:", objc_msgSend(v43, "hf_currentUserIsAdministrator"));

        int v44 = [v11 latestResults];
        int v45 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F68AC8]];
        [v40 setPlaceholderText:v45];

        goto LABEL_7;
      }
      v46 = [(HUEditLocationViewController *)self homeItemManager];
      v47 = [v46 removeItem];
      int v48 = [v11 isEqual:v47];

      if (v48)
      {
        [v10 setDestructive:1];
        goto LABEL_7;
      }
      v49 = [(HUEditLocationViewController *)self homeItemManager];
      v50 = [v49 soundCheckItem];
      int v51 = [v11 isEqual:v50];

      if (v51)
      {
        id v26 = v10;
        int v52 = [v11 latestResults];
        id v53 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
        BOOL v54 = [v53 integerValue] == 2;

        [v26 setOn:v54 animated:1];
        goto LABEL_6;
      }
      v55 = [(HUEditLocationViewController *)self homeItemManager];
      v56 = [v55 guestsItem];
      int v57 = [v11 isEqual:v56];

      if (v57)
      {
        id v26 = [MEMORY[0x1E4F42B58] cellConfiguration];
        v58 = [v11 latestResults];
        int v59 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
        [v26 setText:v59];

        int v60 = [v11 latestResults];
        v61 = [v60 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
        [v26 setSecondaryText:v61];

        v62 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
        int v63 = [v26 secondaryTextProperties];
        [v63 setColor:v62];

        uint64_t v64 = [v11 latestResults];
        id v65 = [v64 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
        [v26 setImage:v65];

        v66 = [MEMORY[0x1E4F428B8] systemGrayColor];
        v67 = [v26 imageProperties];
        [v67 setTintColor:v66];

        double v68 = *MEMORY[0x1E4F43BA0];
        v69 = [v26 imageProperties];
        objc_msgSend(v69, "setReservedLayoutSize:", 37.0, v68);

        [v10 setContentConfiguration:v26];
        v70 = [v11 latestResults];
        v71 = [v70 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
        [v10 setAccessibilityIdentifier:v71];

        [v10 setAccessoryType:1];
        goto LABEL_6;
      }
      int v72 = [(HUEditLocationViewController *)self homeItemManager];
      id v73 = [v72 locationServicesSettingItem];
      int v74 = [v11 isEqual:v73];

      if (!v74) {
        goto LABEL_7;
      }
      objc_opt_class();
      id v75 = v10;
      if (objc_opt_isKindOfClass()) {
        v76 = v75;
      }
      else {
        v76 = 0;
      }
      id v26 = v76;

      v77 = [(HUEditLocationViewController *)self homeItemManager];
      v78 = [v77 home];
      objc_msgSend(v26, "setOn:", objc_msgSend(v78, "isLocationServicesEnabled"));

      long long v34 = [(HUEditLocationViewController *)self homeItemManager];
      int v35 = [v34 home];
      objc_msgSend(v26, "setDisabled:", objc_msgSend(v35, "hf_currentUserIsAdministrator") ^ 1);
    }
  }
LABEL_6:

LABEL_7:
  v79.receiver = self;
  v79.super_class = (Class)HUEditLocationViewController;
  [(HUItemTableViewController *)&v79 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

void __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 processedImage];
  [*(id *)(a1 + 32) setImage:v5];
  id v4 = [v3 wallpaper];

  LODWORD(v3) = [v4 type] != 2;
  [*(id *)(a1 + 32) setContentMode:2 * v3];
}

void __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 wallpaper];
  if ([v3 type] == 1)
  {
  }
  else
  {
    id v4 = [v11 wallpaper];
    uint64_t v5 = [v4 type];

    if (v5 != 6) {
      goto LABEL_5;
    }
  }
  BOOL v6 = [v11 processedImage];
  id v7 = [*(id *)(a1 + 32) wallpaperPickerViewController];
  id v8 = [v11 wallpaper];
  [v7 setCustomWallpaper:v8 image:v6];

LABEL_5:
  id v9 = [*(id *)(a1 + 32) wallpaperPickerViewController];
  id v10 = [v11 wallpaper];
  [v9 setSelectedWallpaper:v10 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  v29[6] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = [(HUEditLocationViewController *)self homeItemManager];
  id v26 = [v27 cameraItem];
  v29[0] = v26;
  id v25 = [(HUEditLocationViewController *)self homeItemManager];
  id v24 = [v25 chooseWallpaperItem];
  v29[1] = v24;
  id v4 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v5 = [v4 wallpaperThumbnailItem];
  v29[2] = v5;
  BOOL v6 = [(HUEditLocationViewController *)self homeItemManager];
  id v7 = [v6 homeScheduleItem];
  v29[3] = v7;
  id v8 = [(HUEditLocationViewController *)self homeItemManager];
  id v9 = [v8 softwareUpdateItem];
  v29[4] = v9;
  id v10 = [(HUEditLocationViewController *)self homeItemManager];
  id v11 = [v10 removeItem];
  v29[5] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

  id v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 allowedAccessoryCategoryItemProvider];
  int v15 = [v14 items];
  id v16 = [v15 allObjects];
  uint64_t v17 = [v12 arrayByAddingObjectsFromArray:v16];

  if ([v17 containsObject:v28])
  {
    unint64_t v18 = 1;
  }
  else
  {
    double v19 = [(HUEditLocationViewController *)self notificationTopicModuleController];
    uint64_t v20 = [v19 module];
    double v21 = [v20 allItems];
    int v22 = [v21 containsObject:v28];

    if (v22) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = -1;
    }
  }

  return v18;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUEditLocationViewController *)self nameCell];
  id v9 = [v8 textField];

  if (v9 == v6)
  {
    uint64_t v10 = [(HUEditLocationViewController *)self editedName];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUEditLocationViewController;
    uint64_t v10 = [(HUItemTableViewController *)&v13 currentTextForTextField:v6 item:v7];
  }
  id v11 = (void *)v10;

  return v11;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUEditLocationViewController;
  id v9 = a4;
  [(HUItemTableViewController *)&v12 textDidChange:v8 forTextField:v9 item:a5];
  uint64_t v10 = [(HUEditLocationViewController *)self nameCell];
  id v11 = [v10 textField];

  if (v11 == v9) {
    [(HUEditLocationViewController *)self setEditedName:v8];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUEditLocationViewController *)self homeItemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  uint64_t v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (v10)
  {
    v47.receiver = self;
    v47.super_class = (Class)HUEditLocationViewController;
    unsigned __int8 v11 = [(HUItemTableViewController *)&v47 tableView:v6 shouldHighlightRowAtIndexPath:v7];
    goto LABEL_12;
  }
  objc_super v12 = [(HUEditLocationViewController *)self homeItemManager];
  objc_super v13 = [v12 inviteUsersItem];
  if ([v9 isEqual:v13])
  {

LABEL_6:
    uint64_t v17 = [v9 latestResults];
    unint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    char v19 = [v18 BOOLValue];

    unsigned __int8 v11 = v19 ^ 1;
    goto LABEL_12;
  }
  id v14 = [(HUEditLocationViewController *)self homeItemManager];
  int v15 = [v14 cameraItem];
  int v16 = [v9 isEqual:v15];

  if (v16) {
    goto LABEL_6;
  }
  uint64_t v20 = [(HUEditLocationViewController *)self homeItemManager];
  double v21 = [v20 userItemProvider];
  int v22 = [v21 items];
  if ([v22 containsObject:v9]) {
    goto LABEL_10;
  }
  int v23 = [(HUEditLocationViewController *)self homeItemManager];
  id v24 = [v23 inviteItemProvider];
  id v25 = [v24 items];
  if ([v25 containsObject:v9])
  {

LABEL_10:
LABEL_11:
    unsigned __int8 v11 = 1;
    goto LABEL_12;
  }
  int v39 = [(HUEditLocationViewController *)self homeItemManager];
  [v39 allowedAccessoryCategoryItemProvider];
  id v27 = v43 = v23;
  [v27 items];
  id v28 = v41 = v24;
  char v45 = [v28 containsObject:v9];

  if (v45) {
    goto LABEL_11;
  }
  id v29 = [(HUEditLocationViewController *)self homeItemManager];
  int v30 = [v29 chooseWallpaperItem];
  if ([v9 isEqual:v30])
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    double v31 = [(HUEditLocationViewController *)self homeItemManager];
    double v32 = [v31 wallpaperThumbnailItem];
    if ([v9 isEqual:v32])
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      double v33 = [(HUEditLocationViewController *)self homeItemManager];
      long long v34 = [v33 removeItem];
      if ([v9 isEqual:v34])
      {
        unsigned __int8 v11 = 1;
      }
      else
      {
        v46 = [(HUEditLocationViewController *)self homeItemManager];
        int v44 = [v46 homeScheduleItem];
        if (objc_msgSend(v9, "isEqual:"))
        {
          unsigned __int8 v11 = 1;
        }
        else
        {
          v42 = [(HUEditLocationViewController *)self homeItemManager];
          id v40 = [v42 softwareUpdateItem];
          if (objc_msgSend(v9, "isEqual:"))
          {
            unsigned __int8 v11 = 1;
          }
          else
          {
            int v38 = [(HUEditLocationViewController *)self homeItemManager];
            long long v37 = [v38 siriTriggerPhraseSettingItem];
            if (objc_msgSend(v9, "isEqual:"))
            {
              unsigned __int8 v11 = 1;
            }
            else
            {
              id v36 = [(HUEditLocationViewController *)self homeItemManager];
              int v35 = [v36 guestsItem];
              unsigned __int8 v11 = [v9 isEqual:v35];
            }
          }
        }
      }
    }
  }

LABEL_12:
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v169.receiver = self;
  v169.super_class = (Class)HUEditLocationViewController;
  [(HUItemTableViewController *)&v169 tableView:v7 didSelectRowAtIndexPath:v8];
  id v9 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v10 = [v9 displayedItemAtIndexPath:v8];

  unsigned __int8 v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v171 = self;
    __int16 v172 = 2112;
    v173 = v12;
    __int16 v174 = 2112;
    id v175 = v8;
    __int16 v176 = 2112;
    v177 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Did select row for indexPath=%@  | item=%@.", buf, 0x2Au);
  }
  objc_super v13 = [(HUItemTableViewController *)self moduleControllerForItem:v10];

  if (!v13)
  {
    [v7 deselectRowAtIndexPath:v8 animated:1];
    id v14 = [(HUEditLocationViewController *)self homeItemManager];
    int v15 = [v14 cameraItem];
    int v16 = [v10 isEqual:v15];

    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F42A90]);
      [v17 setDelegate:self];
      [v17 setSourceType:1];
      [v17 setModalPresentationStyle:0];
      [(HUEditLocationViewController *)self presentViewController:v17 animated:1 completion:0];
    }
    else
    {
      unint64_t v18 = [(HUEditLocationViewController *)self homeItemManager];
      char v19 = [v18 homeScheduleItem];
      int v20 = [v10 isEqual:v19];

      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F6A430]);
        int v22 = [(HUEditLocationViewController *)self homeItemManager];
        int v23 = [v22 home];
        id v24 = [v23 uniqueIdentifier];
        id v25 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        id v26 = [MEMORY[0x1E4F428B8] tertiarySystemBackgroundColor];
        id v27 = (void *)[v21 initWithHomeID:v24 tintColor:v25 listRowBackgroundColor:v26];

        id v28 = [(HUEditLocationViewController *)self navigationController];
        id v29 = (id)objc_msgSend(v28, "hu_pushPreloadableViewController:animated:", v27, 1);
      }
      else
      {
        int v30 = [(HUEditLocationViewController *)self homeItemManager];
        double v31 = [v30 allowedAccessoryCategoryItemProvider];
        double v32 = [v31 items];
        int v33 = [v32 containsObject:v10];

        if (v33)
        {
          objc_opt_class();
          id v34 = v10;
          if (objc_opt_isKindOfClass()) {
            int v35 = v34;
          }
          else {
            int v35 = 0;
          }
          id v160 = v35;

          id v36 = [v160 categoryType];
          int v37 = [v36 isEqualToString:*MEMORY[0x1E4F2C1B0]];

          int v38 = [(HUEditLocationViewController *)self homeItemManager];
          int v39 = [v38 home];
          int v40 = objc_msgSend(v39, "hf_canAddAccessCode");

          if ((v37 & v40) == 1)
          {
            id v41 = [(HUEditLocationViewController *)self presentRestrictedGuestLockSettings];
          }
          else
          {
            v155 = [HUUserAccessoryAccessViewController alloc];
            v158 = [(HUEditLocationViewController *)self homeItemManager];
            v157 = [v158 home];
            BOOL v54 = [(HUEditLocationViewController *)self homeItemManager];
            v55 = [v54 home];
            v56 = [v55 currentUser];
            int v57 = [v160 categoryType];
            v156 = [(HUUserAccessoryAccessViewController *)v155 initWithHome:v157 user:v56 accessoryCategoryType:v57];

            v58 = [(HUEditLocationViewController *)self navigationController];
            id v59 = (id)objc_msgSend(v58, "hu_pushPreloadableViewController:animated:", v156, 1);

            int v60 = HFLogForCategory();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              v61 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v171 = self;
              __int16 v172 = 2112;
              v173 = v61;
              __int16 v174 = 2112;
              id v175 = v160;
              _os_log_impl(&dword_1BE345000, v60, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking for allowed accessory category item: categoryItem=%@.", buf, 0x20u);
            }
          }
        }
        else
        {
          v42 = [(HUEditLocationViewController *)self homeItemManager];
          v43 = [v42 chooseWallpaperItem];
          int v44 = [v10 isEqual:v43];

          if (v44)
          {
            if (_os_feature_enabled_impl())
            {
              objc_initWeak((id *)buf, self);
              char v45 = [MEMORY[0x1E4F4B7D8] applicationWithBundleIdentifier:@"com.apple.mobileslideshow"];
              v46 = [MEMORY[0x1E4F4B7F0] sharedGuard];
              v167[0] = MEMORY[0x1E4F143A8];
              v167[1] = 3221225472;
              v167[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
              v167[3] = &unk_1E638BB98;
              objc_copyWeak(&v168, (id *)buf);
              [v46 initiateAuthenticationWithShieldingForSubject:v45 completion:v167];

              objc_destroyWeak(&v168);
              objc_destroyWeak((id *)buf);
            }
          }
          else
          {
            objc_super v47 = [(HUEditLocationViewController *)self homeItemManager];
            int v48 = [v47 wallpaperThumbnailItem];
            int v49 = [v10 isEqual:v48];

            if (v49)
            {
              v50 = [(HUEditLocationViewController *)self homeBuilder];
              int v51 = [v50 wallpaperBuilder];
              int v52 = [v51 wallpaperEditCollectionFuture];
              v166[0] = MEMORY[0x1E4F143A8];
              v166[1] = 3221225472;
              v166[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_182;
              v166[3] = &unk_1E638BB48;
              v166[4] = self;
              id v53 = (id)[v52 addSuccessBlock:v166];
            }
            else
            {
              v62 = [(HUEditLocationViewController *)self homeItemManager];
              int v63 = [v62 removeItem];
              int v64 = [v10 isEqual:v63];

              id v65 = [(HUEditLocationViewController *)self homeItemManager];
              v66 = v65;
              if (v64)
              {
                v67 = [v65 home];
                int v68 = objc_msgSend(v67, "hf_currentUserIsOwner");

                if (v68) {
                  v69 = @"HUEditLocationRemoveHomeAlertTitle";
                }
                else {
                  v69 = @"HUEditLocationLeaveHomeAlertTitle";
                }
                v70 = [(HUEditLocationViewController *)self homeBuilder];
                v71 = [v70 name];
                v161 = HULocalizedStringWithFormat(v69, @"%@", v72, v73, v74, v75, v76, v77, (uint64_t)v71);

                if (v68) {
                  v78 = @"HUEditLocationRemoveHomeConfirmationMessage";
                }
                else {
                  v78 = @"HUEditLocationLeaveHomeConfirmationMessage";
                }
                v159 = _HULocalizedStringWithDefaultValue(v78, v78, 1);
                objc_super v79 = [(UITableViewController *)self hu_actionSheetWithTitle:v161 message:v159 indexPath:v8];
                v80 = (void *)MEMORY[0x1E4F42720];
                BOOL v81 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
                v82 = [v80 actionWithTitle:v81 style:1 handler:0];
                [v79 addAction:v82];

                id v83 = @"HUEditLocationLeaveHomeDeleteButtonTitle";
                if (v68) {
                  id v83 = @"HURemoveTitle";
                }
                v84 = v83;
                v85 = (void *)MEMORY[0x1E4F42720];
                v86 = _HULocalizedStringWithDefaultValue(v84, v84, 1);
                v162[0] = MEMORY[0x1E4F143A8];
                v162[1] = 3221225472;
                v162[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_209;
                v162[3] = &unk_1E638BBE8;
                char v165 = v68 ^ 1;
                v163 = v84;
                v164 = self;
                v87 = v84;
                v88 = [v85 actionWithTitle:v86 style:2 handler:v162];
                [v79 addAction:v88];

                [(HUEditLocationViewController *)self presentViewController:v79 animated:1 completion:0];
              }
              else
              {
                v89 = [v65 inviteUsersItem];
                int v90 = [v10 isEqual:v89];

                v91 = [(HUEditLocationViewController *)self homeItemManager];
                v92 = v91;
                if (v90)
                {
                  v93 = [v91 home];
                  if ([v93 hasOnboardedForAccessCode])
                  {
                    v94 = [(HUEditLocationViewController *)self homeItemManager];
                    v95 = [v94 home];
                    v96 = [v95 accessories];
                    int v97 = objc_msgSend(v96, "na_any:", &__block_literal_global_218);
                  }
                  else
                  {
                    int v97 = 0;
                  }

                  v106 = [HUAddPersonRoleViewController alloc];
                  v107 = [(HUEditLocationViewController *)self homeItemManager];
                  int v108 = [v107 home];
                  v109 = [(HUAddPersonRoleViewController *)v106 initWithHome:v108];

                  if (v97)
                  {
                    v110 = [(HUEditLocationViewController *)self homeItemManager];
                    v111 = [v110 pinCodeManager];
                    [(HUAddPersonRoleViewController *)v109 setPinCodeManager:v111];
                  }
                  [(HUAddPersonRoleViewController *)v109 setPresentationDelegate:self];
                  int v112 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v109];
                  [v112 setModalPresentationStyle:2];
                  [(HUEditLocationViewController *)self presentViewController:v112 animated:1 completion:0];
                }
                else
                {
                  v98 = [v91 siriTriggerPhraseSettingItem];
                  int v99 = [v10 isEqual:v98];

                  if (v99)
                  {
                    v100 = [HUSiriTriggerPhraseSettingDetailsViewController alloc];
                    v101 = [(HUEditLocationViewController *)self homeItemManager];
                    v102 = [v101 home];
                    v103 = [(HUSiriTriggerPhraseSettingDetailsViewController *)v100 initWithHome:v102 delegate:self];

                    double v104 = [(HUEditLocationViewController *)self navigationController];
                    id v105 = (id)objc_msgSend(v104, "hu_pushPreloadableViewController:animated:", v103, 1);
                  }
                  else
                  {
                    v113 = [(HUEditLocationViewController *)self homeItemManager];
                    v114 = [v113 softwareUpdateItem];
                    int v115 = [v10 isEqual:v114];

                    if (v115)
                    {
                      v116 = [HUSoftwareUpdateStandaloneViewController alloc];
                      v117 = [(HUEditLocationViewController *)self homeItemManager];
                      int v118 = [v117 home];
                      v119 = [(HUSoftwareUpdateStandaloneViewController *)v116 initWithHome:v118];

                      v120 = [(HUEditLocationViewController *)self navigationController];
                      id v121 = (id)objc_msgSend(v120, "hu_pushPreloadableViewController:animated:", v119, 1);
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        objc_opt_class();
                        id v122 = v10;
                        if (objc_opt_isKindOfClass()) {
                          v123 = v122;
                        }
                        else {
                          v123 = 0;
                        }
                        id v124 = v123;

                        v125 = [HUEditOutgoingInvitationViewController alloc];
                        v126 = [(HUEditLocationViewController *)self homeBuilder];
                        v127 = [v126 home];
                        v128 = [(HUEditOutgoingInvitationViewController *)v125 initWithItem:v124 home:v127];

                        int v129 = [(HUEditLocationViewController *)self navigationController];
                        id v130 = (id)objc_msgSend(v129, "hu_pushPreloadableViewController:animated:", v128, 1);
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          objc_opt_class();
                          id v131 = v10;
                          if (objc_opt_isKindOfClass()) {
                            id v132 = v131;
                          }
                          else {
                            id v132 = 0;
                          }
                          v133 = v132;

                          v134 = [(HUEditLocationViewController *)v133 user];
                          v135 = [v134 userID];
                          BOOL v136 = v135 == 0;

                          if (v136)
                          {
                            v137 = HFLogForCategory();
                            if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              v171 = v133;
                              _os_log_error_impl(&dword_1BE345000, v137, OS_LOG_TYPE_ERROR, "User ID on item %@ is nil", buf, 0xCu);
                            }
                          }
                          v138 = [HUEditUserViewController alloc];
                          v139 = [(HUEditLocationViewController *)self homeBuilder];
                          int v140 = [v139 home];
                          v141 = [(HUEditLocationViewController *)self homeItemManager];
                          v142 = [v141 pinCodeManager];
                          v143 = [(HUEditUserViewController *)v138 initWithItem:v133 home:v140 pinCodeManager:v142];

                          v144 = [(HUEditLocationViewController *)self navigationController];
                          id v145 = (id)objc_msgSend(v144, "hu_pushPreloadableViewController:animated:", v143, 1);
                        }
                        else
                        {
                          v146 = [(HUEditLocationViewController *)self homeItemManager];
                          id v147 = [v146 guestsItem];
                          int v148 = [v10 isEqual:v147];

                          if (v148)
                          {
                            v149 = [HUGuestsPinCodesViewController alloc];
                            v150 = [(HUEditLocationViewController *)self homeItemManager];
                            v151 = [v150 pinCodeManager];
                            v152 = [(HUGuestsPinCodesViewController *)v149 initWithPinCodeManager:v151 settingsContext:0];

                            v153 = [(HUEditLocationViewController *)self navigationController];
                            id v154 = (id)objc_msgSend(v153, "hu_pushPreloadableViewController:animated:", v152, 1);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
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
      unsigned __int8 v11 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Error presenting Auth UI in Home app for photo picker usage: %@", buf, 0xCu);
    }
  }
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUWallpaperPickerViewController alloc];
  id v2 = _HULocalizedStringWithDefaultValue(@"HUEditLocationNamedWallpaperSectionTitle", @"HUEditLocationNamedWallpaperSectionTitle", 1);
  id v3 = [(HUWallpaperPickerViewController *)v1 initWithCollectionType:0 namedSectionTitle:v2 delegate:WeakRetained];

  id v4 = [WeakRetained navigationController];
  [v4 pushViewController:v3 animated:1];
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_182(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 originalImage];
  id v4 = [HUWallpaperEditingViewController alloc];
  id v5 = [v3 wallpaper];

  id v6 = [(HUWallpaperEditingViewController *)v4 initWithWallpaper:v5 image:v7 delegate:*(void *)(a1 + 32)];
  [(HUWallpaperEditingViewController *)v6 setModalPresentationStyle:0];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_209(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v34 = "-[HUEditLocationViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
    __int16 v35 = 2112;
    uint64_t v36 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);
  }

  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 40) homeItemManager];
    id v8 = [v7 pinCodeManager];

    id v9 = [*(id *)(a1 + 40) homeItemManager];
    uint64_t v10 = [v9 home];
    unsigned __int8 v11 = [v10 currentUser];

    uint64_t v12 = [v8 deleteUserPinCodeWithUser:v11];
    objc_super v13 = [v12 recoverIgnoringError];

    [v6 addObject:v13];
  }
  id v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  int v15 = [v14 homeManager];

  int v16 = [*(id *)(a1 + 40) homeBuilder];
  id v17 = [v16 home];

  unint64_t v18 = (void *)MEMORY[0x1E4F7A0D8];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_211;
  v30[3] = &unk_1E6385D90;
  id v19 = v15;
  id v31 = v19;
  id v20 = v17;
  id v32 = v20;
  id v21 = [v18 lazyFutureWithBlock:v30];
  [v6 addObject:v21];
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  int v22 = [MEMORY[0x1E4F7A0D8] chainFutures:v6];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  id v26[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_213;
  v26[3] = &unk_1E638BBC0;
  objc_copyWeak(&v29, (id *)buf);
  id v23 = v19;
  id v27 = v23;
  id v24 = v20;
  id v28 = v24;
  id v25 = (id)[v22 addSuccessBlock:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_211(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 errorOnlyCompletionHandlerAdapter];
  [v2 removeHome:v3 completionHandler:v4];
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_213(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  id v9 = &unk_1E638B5B0;
  id v10 = a1[4];
  id v11 = a1[5];
  [v3 dispatchHomeManagerObserverMessage:&v6 sender:0];

  id v4 = objc_msgSend(WeakRetained, "presentationDelegate", v6, v7, v8, v9);
  id v5 = (id)[v4 finishPresentation:WeakRetained animated:1];
}

uint64_t __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 homeManager:*(void *)(a1 + 32) didRemoveHome:*(void *)(a1 + 40)];
}

uint64_t __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 supportsAccessCodes];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HUEditLocationViewController *)self detailNotesCell];
  int v6 = [v4 isDescendantOfView:v5];

  if (v6)
  {
    id v8 = [(HUEditLocationViewController *)self detailNotesCell];
    uint64_t v7 = [v8 text];
    [(HUEditLocationViewController *)self setEditedNotes:v7];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = self;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v19, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F696F8] locationPrivacyURL];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(HUEditLocationViewController *)self navigationController];
    uint64_t v12 = (void *)v11;
    if (v11) {
      objc_super v13 = (HUEditLocationViewController *)v11;
    }
    else {
      objc_super v13 = self;
    }
    id v14 = v13;

    int v15 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B38]];
    int v16 = [v15 splashController];
    [v16 setDisplayDeviceType:6];

    [v15 setPresentingViewController:v14];
    [v15 present];
  }
  else
  {
    int v15 = [MEMORY[0x1E4F69378] sharedInstance];
    id v17 = (id)[v15 openURL:v7];
  }

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"OFF";
    if (v4) {
      id v8 = @"ON";
    }
    *(_DWORD *)buf = 138412290;
    int v51 = (HUEditLocationViewController *)v8;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "User Tapped switch to turn %@.", buf, 0xCu);
  }

  id v9 = [(HUEditLocationViewController *)self tableView];
  int v10 = [v9 indexPathForCell:v6];

  uint64_t v11 = [(HUItemTableViewController *)self itemManager];
  uint64_t v12 = [v11 displayedItemAtIndexPath:v10];

  objc_super v13 = [(HUEditLocationViewController *)self homeItemManager];
  id v14 = [v13 locationServicesSettingItem];
  int v15 = [v12 isEqual:v14];

  if (v15)
  {
    int v16 = [(HUEditLocationViewController *)self homeItemManager];
    id v17 = [v16 updateLocationServicesEnabled:v4];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke;
    v46[3] = &unk_1E6387E38;
    BOOL v49 = v4;
    id v47 = v6;
    int v48 = self;
    id v18 = (id)[v17 addCompletionBlock:v46];
  }
  int v19 = [(HUEditLocationViewController *)self homeItemManager];
  id v20 = [v19 soundCheckItem];
  int v21 = [v12 isEqual:v20];

  if (v21)
  {
    id v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        uint64_t v23 = @"ON";
      }
      else {
        uint64_t v23 = @"OFF";
      }
      id v24 = [(HUItemTableViewController *)self itemManager];
      id v25 = [v24 home];
      *(_DWORD *)buf = 138412802;
      int v51 = self;
      __int16 v52 = 2112;
      id v53 = v23;
      __int16 v54 = 2112;
      v55 = v25;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@: Updating sound check setting to %@ for home: %@", buf, 0x20u);
    }
    id v26 = [(HUItemTableViewController *)self itemManager];
    id v27 = [v26 home];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_234;
    v42[3] = &unk_1E6389DD8;
    BOOL v45 = v4;
    id v43 = v6;
    int v44 = self;
    [v27 updateSoundCheckEnabled:v4 completion:v42];
  }
  id v28 = [(HUEditLocationViewController *)self homeItemManager];
  id v29 = [v28 showPredictedScenes];
  int v30 = [v12 isEqual:v29];

  if (v30)
  {
    id v31 = [(HUItemTableViewController *)self itemManager];
    id v32 = [v31 home];
    int v33 = objc_msgSend(v32, "hf_setShowPredictedScenesOnDashboard:", v4);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_235;
    v40[3] = &__block_descriptor_33_e20_v24__0_8__NSError_16l;
    BOOL v41 = v4;
    id v34 = (id)[v33 addCompletionBlock:v40];
  }
  __int16 v35 = [v12 latestResults];
  uint64_t v36 = *MEMORY[0x1E4F68AC0];
  uint64_t v37 = [v35 objectForKey:*MEMORY[0x1E4F68AC0]];

  if (v37)
  {
    int v38 = [v12 latestResults];
    int v39 = [v38 objectForKeyedSubscript:v36];
  }
  else
  {
    int v39 = 0;
  }
  [MEMORY[0x1E4F68EE0] sendSwitchCellToggleEventForItem:v12 isOn:v4 title:v39 fromSourceViewController:self];
}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 48) == 0];
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v5 = @"ON";
      }
      else {
        id v5 = @"OFF";
      }
      id v6 = [*(id *)(a1 + 40) homeItemManager];
      id v7 = [v6 home];
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      objc_super v13 = v7;
      id v8 = "Location Services Failed to turn %@ for Home %@.";
LABEL_12:
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v9 = @"ON";
      }
      else {
        id v9 = @"OFF";
      }
      id v6 = [*(id *)(a1 + 40) homeItemManager];
      id v7 = [v6 home];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      objc_super v13 = v7;
      id v8 = "Location Services Successfully turned %@ for Home %@.";
      goto LABEL_12;
    }
  }
}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  BOOL v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to update sound check setting with error: %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 48) == 0 animated:1];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) itemManager];
      id v7 = [v6 home];
      int v8 = [v7 soundCheckEnabled];
      id v9 = @"OFF";
      if (v8) {
        id v9 = @"ON";
      }
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated sound check setting to %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_235(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 32);
    v7[0] = 67109634;
    v7[1] = v6;
    __int16 v8 = 1024;
    BOOL v9 = v4 == 0;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Updating showPredictedScenesOnDashboard to (%{BOOL}d) succeeded: %{BOOL}d  %@", (uint8_t *)v7, 0x18u);
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  [(HUEditLocationViewController *)self dismissViewControllerAnimated:1 completion:0];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F439A0]];

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  id v7 = objc_alloc(MEMORY[0x1E4F69778]);
  __int16 v8 = [MEMORY[0x1E4F29128] UUID];
  BOOL v9 = [v8 UUIDString];
  __int16 v10 = (void *)[v7 initWithType:1 assetIdentifier:v9 cropInfo:0];

  id v11 = [MEMORY[0x1E4F69780] sharedInstance];
  id v13 = [v11 processOriginalImageFromWallpaper:v10 originalImage:v6];

  uint64_t v12 = [[HUWallpaperEditingViewController alloc] initWithWallpaper:v10 image:v13 delegate:self];
  [(HUWallpaperEditingViewController *)v12 setModalPresentationStyle:0];
  [(HUEditLocationViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  [(HUEditLocationViewController *)self updateWallpaper:a4 image:a5];
  id v7 = [(HUEditLocationViewController *)self navigationController];
  id v6 = (id)[v7 popToViewController:self animated:1];
}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F69778];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v10 = [v6 UUID];
  __int16 v8 = [v10 UUIDString];
  BOOL v9 = [v5 customWallpaperWithAssetIdentifier:v8];
  [(HUEditLocationViewController *)self updateWallpaper:v9 image:v7];
}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F69778];
  id v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 UUID];
  id v11 = [v10 UUIDString];
  id v27 = [v6 customWallpaperWithAssetIdentifier:v11];

  [v9 setOriginalCustomImage:v8];
  uint64_t v12 = [(HUEditLocationViewController *)self homeBuilder];
  id v13 = [v12 wallpaperBuilder];
  [v13 setWallpaper:v27 image:v8];

  uint64_t v14 = [(HUEditLocationViewController *)self homeItemManager];
  int v15 = [(HUEditLocationViewController *)self homeItemManager];
  int v16 = [v15 wallpaperPickerItem];
  id v17 = [v14 indexPathForItem:v16];

  id v18 = [(HUEditLocationViewController *)self tableView];
  int v19 = [v18 cellForRowAtIndexPath:v17];
  id v20 = [(HUEditLocationViewController *)self homeItemManager];
  int v21 = [v20 wallpaperPickerItem];
  [(HUEditLocationViewController *)self updateCell:v19 forItem:v21 indexPath:v17 animated:1];

  id v22 = [(HUEditLocationViewController *)self homeBuilder];
  uint64_t v23 = [v22 home];

  if (v23)
  {
    id v24 = [(HUEditLocationViewController *)self homeBuilder];
    id v25 = [v24 wallpaperBuilder];
    id v26 = (id)[v25 commitWallpaper];
  }
}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HUEditLocationViewController *)self homeBuilder];
  id v10 = [v9 wallpaperBuilder];
  [v10 setWallpaper:v8 image:v7];

  id v11 = [(HUEditLocationViewController *)self homeBuilder];
  uint64_t v12 = [v11 home];

  if (v12)
  {
    id v15 = [(HUEditLocationViewController *)self homeBuilder];
    id v13 = [v15 wallpaperBuilder];
    id v14 = (id)[v13 commitWallpaper];
  }
}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  id v4 = [(HUEditLocationViewController *)self homeBuilder];
  id v5 = [v4 wallpaperBuilder];
  id v6 = [v5 wallpaperEditCollectionFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__HUEditLocationViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke;
  v8[3] = &unk_1E638BB48;
  void v8[4] = self;
  id v7 = (id)[v6 addSuccessBlock:v8];
}

void __74__HUEditLocationViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 originalImage];
  id v4 = [HUWallpaperEditingViewController alloc];
  id v5 = [v3 wallpaper];

  id v6 = [(HUWallpaperEditingViewController *)v4 initWithWallpaper:v5 image:v7 delegate:*(void *)(a1 + 32)];
  [(HUWallpaperEditingViewController *)v6 setModalPresentationStyle:0];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  [(HUEditLocationViewController *)self updateWallpaper:a4 image:a5];

  [(HUEditLocationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)wallpaperEditingDidCancel:(id)a3
{
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = objc_msgSend(a4, "uniqueIdentifier", a3);
  id v6 = [(HUEditLocationViewController *)self homeBuilder];
  id v7 = [v6 home];
  id v8 = [v7 uniqueIdentifier];
  int v9 = [v5 isEqual:v8];

  if (v9)
  {
    id v11 = [(HUEditLocationViewController *)self presentationDelegate];
    id v10 = (id)[v11 finishPresentation:self animated:1];
  }
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUEditLocationViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v17 diffableDataItemManager:a3 didUpdateItems:v11 addItems:v10 removeItems:a6];
  uint64_t v12 = [(HUEditLocationViewController *)self homeItemManager];
  id v13 = [v12 softwareUpdateItem];
  LODWORD(a3) = [v11 containsObject:v13];

  if (a3)
  {

LABEL_4:
    [(HUEditLocationViewController *)self _updateSoftwareUpdateDynamicFooterView];
    goto LABEL_5;
  }
  id v14 = [(HUEditLocationViewController *)self homeItemManager];
  id v15 = [v14 softwareUpdateItem];
  int v16 = [v10 containsObject:v15];

  if (v16) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)HUEditLocationViewController;
  id v8 = a4;
  [(HUItemTableViewController *)&v12 itemManager:a3 didUpdateResultsForItem:v8 atIndexPath:a5];
  int v9 = [(HUEditLocationViewController *)self homeItemManager];
  id v10 = [v9 softwareUpdateItem];
  int v11 = [v8 isEqual:v10];

  if (v11) {
    [(HUEditLocationViewController *)self _updateSoftwareUpdateDynamicFooterView];
  }
}

- (void)_updateSoftwareUpdateDynamicFooterView
{
  id v3 = [(HUEditLocationViewController *)self homeItemManager];
  uint64_t v4 = [v3 sectionIndexForDisplayedSectionIdentifier:@"HUEditLocationSoftwareUpdateSectionIdentifier"];

  id v5 = [(HUEditLocationViewController *)self tableView];
  id v6 = [v5 footerViewForSection:v4];

  id v7 = [(HUEditLocationViewController *)self homeItemManager];
  id v8 = [v7 footerTitleForSection:v4];

  int v9 = [v6 textLabel];

  if (v9)
  {
    id v10 = [(HUEditLocationViewController *)self tableView];
    [v10 beginUpdates];

    int v11 = [v6 textLabel];
    [v11 setText:v8];

    [v6 setNeedsLayout];
    objc_super v12 = [(HUEditLocationViewController *)self tableView];
    [v12 endUpdates];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__HUEditLocationViewController__updateSoftwareUpdateDynamicFooterView__block_invoke;
    v13[3] = &unk_1E638BC30;
    id v14 = v8;
    [v6 _setContentViewConfigurationProvider:v13];
  }
}

id __70__HUEditLocationViewController__updateSoftwareUpdateDynamicFooterView__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F430C0] defaultGroupedFooterConfiguration];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [v2 textLabel];
  [v4 setText:v3];

  return v2;
}

- (void)didUpdateSiriTriggerPhraseSetting
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUItemTableViewController *)self itemManager];
  uint64_t v4 = [(HUEditLocationViewController *)self homeItemManager];
  id v5 = [v4 siriTriggerPhraseSettingItem];
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 reloadUIRepresentationForItems:v6 withAnimation:1];
}

void __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeItemManager];
  uint64_t v3 = [v2 notificationSettingsModule];
  uint64_t v4 = [v3 itemProviders];
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_249_0);
  id v6 = (id)[v5 reloadItems];

  id v8 = [*(id *)(a1 + 32) homeItemManager];
  id v7 = (id)[v8 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];
}

uint64_t __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)activityLogCoordinator:(id)a3 didDetermineEventsExist:(BOOL)a4
{
  if (a4)
  {
    if (self)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke;
      v4[3] = &unk_1E6385738;
      v4[4] = self;
      v4[5] = sel_reloadActivityLogItemProviders;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1, a4);
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUEditLocationViewController *)self homeBuilder];
  int v9 = [v8 wallpaperBuilder];
  [v9 setWallpaper:v7 image:v6];

  id v10 = [(HUEditLocationViewController *)self homeBuilder];
  int v11 = [v10 home];

  if (v11)
  {
    objc_super v12 = [(HUEditLocationViewController *)self homeBuilder];
    id v13 = [v12 wallpaperBuilder];
    id v14 = (id)[v13 commitWallpaper];
  }
  BOOL v15 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell];
  int v16 = [(HUEditLocationViewController *)self homeItemManager];
  objc_super v17 = v16;
  if (v15) {
    [v16 wallpaperPickerItem];
  }
  else {
  id v18 = [v16 wallpaperThumbnailItem];
  }

  int v19 = [(HUItemTableViewController *)self itemManager];
  int v20 = [v19 diffableDataSourceDisabled];

  if (v20)
  {
    int v21 = [(HUEditLocationViewController *)self tableView];
    id v22 = [(HUEditLocationViewController *)self homeItemManager];
    uint64_t v23 = [v22 indexPathForItem:v18];
    v26[0] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v21 reloadRowsAtIndexPaths:v24 withRowAnimation:5];
  }
  else
  {
    int v21 = [(HUItemTableViewController *)self itemManager];
    id v25 = v18;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    [v21 reloadUIRepresentationForItems:v22 withAnimation:0];
  }
}

- (void)prefetchActivityLogEventsIfNecessary
{
  uint64_t v3 = [(HUEditLocationViewController *)self homeBuilder];
  id v9 = [v3 home];

  uint64_t v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v5 = [v4 activityLogCoordinatorForHome:v9];

  id v6 = [v9 residentDevices];
  int v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_253);

  if ([v9 isEventLogEnabled] && (objc_msgSend(v5, "eventsExist") & 1) == 0)
  {
    int v8 = objc_msgSend(v9, "hf_hasActivityLogPrerequisites");
    if ((v8 & v7) == 1)
    {
      if (objc_msgSend(v9, "hf_hasEnabledResident")
        && (objc_msgSend(v9, "hf_hasCompatibleActivityLogAccessories") & 1) != 0)
      {
        goto LABEL_9;
      }
    }
    else if (!v8)
    {
      goto LABEL_9;
    }
    [v5 setDelegate:self];
    [v5 checkIfEventsExist];
  }
LABEL_9:
}

unint64_t __68__HUEditLocationViewController_prefetchActivityLogEventsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 27) & 1;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (HUEditLocationViewControllerAddLocationDelegate)addLocationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addLocationDelegate);

  return (HUEditLocationViewControllerAddLocationDelegate *)WeakRetained;
}

- (void)setAddLocationDelegate:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (HUUserNotificationTopicListModuleController)notificationTopicModuleController
{
  return self->_notificationTopicModuleController;
}

- (void)setNotificationTopicModuleController:(id)a3
{
}

- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController
{
  return self->_connectedServicesItemModuleController;
}

- (void)setConnectedServicesItemModuleController:(id)a3
{
}

- (HUEditLocationItemManager)homeItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeItemManager);

  return (HUEditLocationItemManager *)WeakRetained;
}

- (void)setHomeItemManager:(id)a3
{
}

- (HUEditableTextCell)nameCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameCell);

  return (HUEditableTextCell *)WeakRetained;
}

- (void)setNameCell:(id)a3
{
}

- (NSString)editedName
{
  return self->_editedName;
}

- (void)setEditedName:(id)a3
{
}

- (HUEditableTextViewCell)detailNotesCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailNotesCell);

  return (HUEditableTextViewCell *)WeakRetained;
}

- (void)setDetailNotesCell:(id)a3
{
}

- (NSString)editedNotes
{
  return self->_editedNotes;
}

- (void)setEditedNotes:(id)a3
{
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController
{
  return self->_wallpaperPickerViewController;
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
  objc_storeStrong((id *)&self->_wallpaperPickerViewController, 0);
  objc_storeStrong((id *)&self->_editedNotes, 0);
  objc_destroyWeak((id *)&self->_detailNotesCell);
  objc_storeStrong((id *)&self->_editedName, 0);
  objc_destroyWeak((id *)&self->_nameCell);
  objc_destroyWeak((id *)&self->_homeItemManager);
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, 0);
  objc_storeStrong((id *)&self->_notificationTopicModuleController, 0);
  objc_destroyWeak((id *)&self->_addLocationDelegate);
  objc_storeStrong((id *)&self->_homeBuilder, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end