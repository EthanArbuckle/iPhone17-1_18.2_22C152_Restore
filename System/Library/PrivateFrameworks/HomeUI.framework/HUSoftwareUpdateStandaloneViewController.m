@interface HUSoftwareUpdateStandaloneViewController
- (BOOL)_homePodSoftwareUpdateInProgress;
- (BOOL)allowRefresh;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)showDoneButtonInNavBar;
- (BOOL)viewVisible;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUBannerView)softwareUpdateBannerView;
- (HUFirmwareUpdateItemModuleController)firmwareUpdateItemModuleController;
- (HUGridLayoutOptions)layoutOptions;
- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController;
- (HUSoftwareUpdateStandaloneViewController)initWithHome:(id)a3;
- (HUSoftwareUpdateStandaloneViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (NAFuture)softwareUpdateFetchFuture;
- (UIBarButtonItem)updateAllBarButton;
- (id)_createUpdateAllBarButton;
- (id)itemModuleControllers;
- (id)keyCommands;
- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4;
- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4;
- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4;
- (void)_didTapUpdateAllButton:(id)a3;
- (void)_fetchAccessoryDiagnosticInfo;
- (void)_kickoffSoftwareUpdate;
- (void)_presentHomePodSoftwareUpdateAlreadyInProgressAlert;
- (void)_refreshUpdateAllBarButton;
- (void)_triggerRefresh:(id)a3;
- (void)bannerView:(id)a3 footerViewTapped:(id)a4;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)doneButtonPressed:(id)a3;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)refreshDataModelForHome:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAllowRefresh:(BOOL)a3;
- (void)setFirmwareUpdateItemModuleController:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setShowDoneButtonInNavBar:(BOOL)a3;
- (void)setSoftwareUpdateBannerView:(id)a3;
- (void)setSoftwareUpdateFetchFuture:(id)a3;
- (void)setSoftwareUpdateItemModuleController:(id)a3;
- (void)setUpdateAllBarButton:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HUSoftwareUpdateStandaloneViewController

- (void)refreshDataModelForHome:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1BE9C4DA8();
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_1BE9C4D98();
  v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x1E4FBCFD8];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  sub_1BE3CD900((uint64_t)v7, (uint64_t)&unk_1EA116E90, (uint64_t)v12);

  swift_release();
}

- (HUSoftwareUpdateStandaloneViewController)initWithHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HUSoftwareUpdateStandaloneItemManager alloc] initWithDelegate:self home:v4];

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  uint64_t v6 = [(HUItemTableViewController *)&v8 initWithItemManager:v5 tableViewStyle:1];

  return v6;
}

- (HUSoftwareUpdateStandaloneViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateStandaloneViewController.m", 76, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateStandaloneViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v10 viewDidLoad];
  v3 = [(HUSoftwareUpdateStandaloneViewController *)self view];
  [v3 frame];
  uint64_t v6 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v4, v5);

  [(HUSoftwareUpdateStandaloneViewController *)self setLayoutOptions:v6];
  v7 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdatePageTitle", @"HUSoftwareUpdatePageTitle", 1);
  [(HUSoftwareUpdateStandaloneViewController *)self setTitle:v7];

  if ([(HUSoftwareUpdateStandaloneViewController *)self showDoneButtonInNavBar])
  {
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
    id v9 = [(HUSoftwareUpdateStandaloneViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v4 viewDidAppear:a3];
  [(HUSoftwareUpdateStandaloneViewController *)self _refreshUpdateAllBarButton];
}

- (id)_createUpdateAllBarButton
{
  v3 = objc_alloc_init(HUDownloadControl);
  [(HUDownloadControl *)v3 setAllowsAddImage:0];
  [(HUDownloadControl *)v3 setDisplayStyle:1];
  objc_super v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [(HUDownloadControl *)v3 setFilledTintColor:v4];

  double v5 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  [(HUDownloadControl *)v3 setTintColor:v5];

  [(HUDownloadControl *)v3 addTarget:self action:sel__didTapUpdateAllButton_ forControlEvents:64];
  -[HUDownloadControl setControlStatus:animated:](v3, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);
  uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateControlTitle_UpdateAll", @"HUSoftwareUpdateControlTitle_UpdateAll", 1);
  [(HUDownloadControl *)v3 setTitle:v6 forControlStatusType:1];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v3];

  return v7;
}

- (void)_refreshUpdateAllBarButton
{
  if ([(HUSoftwareUpdateStandaloneViewController *)self showDoneButtonInNavBar]) {
    return;
  }
  v3 = [(HUItemTableViewController *)self itemManager];
  objc_super v4 = [v3 updateAllItem];
  id v32 = [v4 latestResults];

  double v5 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68958]];
    BOOL v6 = v7 == 0;
  }
  objc_super v8 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
  BOOL v9 = v8 == 0;

  if ((v6 ^ v9))
  {
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_10;
  }
  if (v6)
  {
    objc_super v10 = [(HUSoftwareUpdateStandaloneViewController *)self _createUpdateAllBarButton];
    [(HUSoftwareUpdateStandaloneViewController *)self setUpdateAllBarButton:v10];

    uint64_t v11 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
    v12 = [(HUSoftwareUpdateStandaloneViewController *)self navigationItem];
    [v12 setRightBarButtonItem:v11];

    uint64_t v13 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
    uint64_t v14 = [v13 customView];
    [v14 setHidden:1];

LABEL_10:
    objc_opt_class();
    v15 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
    v16 = [v15 customView];
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v18 titleForControlStatusType:1];
    v20 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
    if (([v19 isEqualToString:v20] & 1) == 0)
    {
      [v18 setTitle:v20 forControlStatusType:1];
      [v18 sizeToFit];
    }
    v21 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
    int v22 = [v21 BOOLValue];

    if (v22)
    {
      v23 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68C60]];
      v24 = v23;
      if (v23)
      {
        [v23 floatValue];
        double v26 = v25;
        v27 = [MEMORY[0x1E4F428B8] systemFillColor];
        [v18 setFilledTintColor:v27];

        v28 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        uint64_t v29 = 4;
      }
      else
      {
        v31 = [MEMORY[0x1E4F428B8] systemFillColor];
        [v18 setFilledTintColor:v31];

        v28 = [MEMORY[0x1E4F428B8] systemFillColor];
        double v26 = 1.0;
        uint64_t v29 = 3;
      }
      [v18 setTintColor:v28];
    }
    else
    {
      v30 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v18 setFilledTintColor:v30];

      v24 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [v18 setTintColor:v24];
      double v26 = 1.0;
      uint64_t v29 = 1;
    }

    objc_msgSend(v18, "setControlStatus:animated:", v29, *(void *)&v26, 1);
    [v18 setEnabled:v29 == 1];

    goto LABEL_23;
  }
  [(HUSoftwareUpdateStandaloneViewController *)self setUpdateAllBarButton:0];
  id v18 = [(HUSoftwareUpdateStandaloneViewController *)self navigationItem];
  [v18 setRightBarButtonItem:0];
LABEL_23:

LABEL_24:
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];

  if (v4)
  {
    double v5 = [(HUSoftwareUpdateStandaloneViewController *)self tableView];
    id v9 = [v5 visibleCells];

    uint64_t v6 = objc_msgSend(v9, "na_any:", &__block_literal_global_159);
    v7 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
    objc_super v8 = [v7 customView];
    [v8 setHidden:v6];
  }
}

uint64_t __64__HUSoftwareUpdateStandaloneViewController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v11 viewWillAppear:a3];
  if (![(HUSoftwareUpdateStandaloneViewController *)self viewVisible])
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(HUItemTableViewController *)self itemManager];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __59__HUSoftwareUpdateStandaloneViewController_viewWillAppear___block_invoke;
    objc_super v8 = &unk_1E638D6A0;
    objc_copyWeak(&v9, &location);
    [v4 addHomeSetupSuccessBlock:&v5];

    -[HUSoftwareUpdateStandaloneViewController setViewVisible:](self, "setViewVisible:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __59__HUSoftwareUpdateStandaloneViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _kickoffSoftwareUpdate];
  [WeakRetained _fetchAccessoryDiagnosticInfo];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v4 viewDidDisappear:a3];
  [(HUSoftwareUpdateStandaloneViewController *)self setViewVisible:0];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v19 viewWillLayoutSubviews];
  objc_opt_class();
  v3 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
  objc_super v4 = [v3 customView];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  v7 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
  objc_super v8 = [v7 customView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v6 intrinsicContentSize];
  double v16 = v15;

  v17 = [(HUSoftwareUpdateStandaloneViewController *)self updateAllBarButton];
  id v18 = [v17 customView];
  objc_msgSend(v18, "setFrame:", v10, v12, v16, v14);
}

- (id)itemModuleControllers
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  objc_super v4 = [(HUSoftwareUpdateStandaloneViewController *)self softwareUpdateItemModuleController];

  if (!v4)
  {
    uint64_t v5 = [HUSoftwareUpdateItemModuleController alloc];
    id v6 = [(HUItemTableViewController *)self itemManager];
    v7 = [v6 softwareUpdateModule];
    objc_super v8 = [(HUSoftwareUpdateItemModuleController *)v5 initWithModule:v7 delegate:self expandableTextViewCellDelegate:self];
    [(HUSoftwareUpdateStandaloneViewController *)self setSoftwareUpdateItemModuleController:v8];
  }
  double v9 = [(HUSoftwareUpdateStandaloneViewController *)self softwareUpdateItemModuleController];
  [v3 addObject:v9];

  double v10 = [(HUSoftwareUpdateStandaloneViewController *)self firmwareUpdateItemModuleController];

  if (!v10)
  {
    double v11 = [HUFirmwareUpdateItemModuleController alloc];
    double v12 = [(HUItemTableViewController *)self itemManager];
    double v13 = [v12 firmwareUpdateModule];
    double v14 = [(HUFirmwareUpdateItemModuleController *)v11 initWithModule:v13 expandableTextViewCellDelegate:self];
    [(HUSoftwareUpdateStandaloneViewController *)self setFirmwareUpdateItemModuleController:v14];
  }
  double v15 = [(HUSoftwareUpdateStandaloneViewController *)self firmwareUpdateItemModuleController];
  [v3 addObject:v15];

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self itemManager];
  objc_super v8 = [v7 updateAllItem];
  int v9 = [v6 isEqual:v8];

  if (v9) {
    goto LABEL_5;
  }
  double v10 = [(HUItemTableViewController *)self itemManager];
  double v11 = [v10 autoUpdateItem];
  if ([v6 isEqual:v11])
  {

LABEL_5:
    double v15 = objc_opt_class();
    goto LABEL_6;
  }
  double v12 = [(HUItemTableViewController *)self itemManager];
  double v13 = [v12 autoUpdateThirdPartyItem];
  int v14 = [v6 isEqual:v13];

  if (v14) {
    goto LABEL_5;
  }
  v17 = [(HUItemTableViewController *)self itemManager];
  id v18 = [v17 homeUpdateBannerItem];
  int v19 = [v6 isEqual:v18];

  if (v19) {
    goto LABEL_5;
  }
  v20 = [(HUItemTableViewController *)self itemManager];
  v21 = [v20 fetchItem];
  int v22 = [v6 isEqual:v21];

  if (v22) {
    goto LABEL_5;
  }
  v23 = [(HUItemTableViewController *)self itemManager];
  v24 = [v23 updatedRecentlyItem];
  if ([v6 isEqual:v24])
  {
LABEL_14:

    goto LABEL_5;
  }
  float v25 = [(HUItemTableViewController *)self itemManager];
  double v26 = [v25 betaUpdatesItem];
  if ([v6 isEqual:v26])
  {

    goto LABEL_14;
  }
  v27 = [(HUItemTableViewController *)self itemManager];
  v28 = [v27 carrySettingsItem];
  char v29 = [v6 isEqual:v28];

  if (v29) {
    goto LABEL_5;
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"HUSoftwareUpdateStandaloneViewController.m", 277, @"Unhandled item: %@", v6 object file lineNumber description];

  double v15 = 0;
LABEL_6:

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v54 setupCell:v8 forItem:v9 indexPath:a5];
  double v10 = [(HUItemTableViewController *)self itemManager];
  double v11 = [v10 autoUpdateItem];
  if ([v9 isEqual:v11])
  {

    goto LABEL_4;
  }
  double v12 = [(HUItemTableViewController *)self itemManager];
  double v13 = [v12 autoUpdateThirdPartyItem];
  int v14 = [v9 isEqual:v13];

  if (!v14)
  {
    v21 = [(HUItemTableViewController *)self itemManager];
    int v22 = [v21 homeUpdateBannerItem];
    int v23 = [v9 isEqual:v22];

    if (v23)
    {
      uint64_t v24 = objc_opt_class();
      id v25 = v8;
      if (v25)
      {
        if (objc_opt_isKindOfClass()) {
          double v26 = v25;
        }
        else {
          double v26 = 0;
        }
        id v18 = v25;
        if (v26) {
          goto LABEL_22;
        }
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        v28 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        [v27 handleFailureInFunction:v28, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v24, objc_opt_class() file lineNumber description];
      }
      id v18 = 0;
LABEL_22:

      char v29 = [(HUSoftwareUpdateStandaloneViewController *)self layoutOptions];
      v30 = [v29 bannerCellOptions];
      v31 = [v25 layer];
      [v31 cornerRadius];
      objc_msgSend(v30, "setCellCornerRadius:");

      id v32 = [(HUSoftwareUpdateStandaloneViewController *)self layoutOptions];
      v33 = [v32 bannerCellOptions];
      [v18 setLayoutOptions:v33];

      [v18 setDelegate:self];
      v34 = [v18 bannerView];
      softwareUpdateBannerView = self->_softwareUpdateBannerView;
      self->_softwareUpdateBannerView = v34;

      goto LABEL_12;
    }
    v36 = [(HUItemTableViewController *)self itemManager];
    v37 = [v36 updateAllItem];
    int v38 = [v9 isEqual:v37];

    if (v38)
    {
      objc_opt_class();
      id v39 = v8;
      if (objc_opt_isKindOfClass()) {
        v40 = v39;
      }
      else {
        v40 = 0;
      }
      id v18 = v40;

      v41 = [v18 downloadControl];
      [v41 setAllowsAddImage:0];
      [v41 setDisplayStyle:1];
      [v41 addTarget:self action:sel__didTapUpdateAllButton_ forControlEvents:64];

      goto LABEL_12;
    }
    v42 = [(HUItemTableViewController *)self itemManager];
    v43 = [v42 updatedRecentlyItem];
    if (([v9 isEqual:v43] & 1) == 0)
    {
      v44 = [(HUItemTableViewController *)self itemManager];
      v45 = [v44 betaUpdatesItem];
      if (([v9 isEqual:v45] & 1) == 0)
      {
        v51 = [(HUItemTableViewController *)self itemManager];
        v52 = [v51 carrySettingsItem];
        char v53 = [v9 isEqual:v52];

        if ((v53 & 1) == 0) {
          goto LABEL_13;
        }
LABEL_32:
        uint64_t v46 = objc_opt_class();
        id v47 = v8;
        if (v47)
        {
          if (objc_opt_isKindOfClass()) {
            v48 = v47;
          }
          else {
            v48 = 0;
          }
          id v18 = v47;
          if (v48) {
            goto LABEL_39;
          }
          v49 = [MEMORY[0x1E4F28B00] currentHandler];
          v50 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          [v49 handleFailureInFunction:v50, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v46, objc_opt_class() file lineNumber description];
        }
        id v18 = 0;
LABEL_39:

        [v18 setHideIcon:1];
        [v18 setAccessoryType:1];
        goto LABEL_12;
      }
    }
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v15 = objc_opt_class();
  id v16 = v8;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v16;
    if (v17) {
      goto LABEL_11;
    }
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];
  }
  id v18 = 0;
LABEL_11:

  [v18 setDelegate:self];
LABEL_12:

LABEL_13:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v41 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  double v12 = [(HUItemTableViewController *)self itemManager];
  double v13 = [v12 autoUpdateItem];
  if ([v11 isEqual:v13])
  {

    goto LABEL_4;
  }
  int v14 = [(HUItemTableViewController *)self itemManager];
  uint64_t v15 = [v14 autoUpdateThirdPartyItem];
  int v16 = [v11 isEqual:v15];

  if (!v16)
  {
    id v25 = [(HUItemTableViewController *)self itemManager];
    double v26 = [v25 updateAllItem];
    int v27 = [v11 isEqual:v26];

    if (!v27) {
      goto LABEL_13;
    }
    objc_opt_class();
    id v28 = v10;
    if (objc_opt_isKindOfClass()) {
      char v29 = v28;
    }
    else {
      char v29 = 0;
    }
    id v20 = v29;

    v30 = [v20 downloadControl];
    v31 = [v11 latestResults];
    id v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
    int v33 = [v32 BOOLValue];

    if (v33)
    {
      v34 = [v11 latestResults];
      v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F68C60]];

      v36 = [MEMORY[0x1E4F428B8] systemFillColor];
      [v30 setFilledTintColor:v36];

      v37 = (void *)MEMORY[0x1E4F428B8];
      if (!v35)
      {
        uint64_t v38 = [MEMORY[0x1E4F428B8] systemFillColor];
LABEL_23:
        v40 = (void *)v38;
        [v30 setTintColor:v38];

        goto LABEL_12;
      }
    }
    else
    {
      id v39 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v30 setFilledTintColor:v39];

      v37 = (void *)MEMORY[0x1E4F428B8];
    }
    uint64_t v38 = objc_msgSend(v37, "hf_keyColor");
    goto LABEL_23;
  }
LABEL_4:
  uint64_t v17 = objc_opt_class();
  id v18 = v10;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    id v20 = v18;
    if (v19) {
      goto LABEL_11;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    int v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v21 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
  }
  id v20 = 0;
LABEL_11:

  int v23 = [v11 latestResults];
  uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
  objc_msgSend(v20, "setDisabled:", objc_msgSend(v24, "BOOLValue"));

  [v20 setDelegate:self];
LABEL_12:

LABEL_13:
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  id v5 = a3;
  LOBYTE(a4) = [(HUItemTableViewController *)&v8 shouldHideSeparatorsForCell:v5 indexPath:a4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass | a4) & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v52 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  objc_super v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 home];
  id v10 = objc_msgSend(v9, "hf_homePods");

  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v49;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v16), "uniqueIdentifier", (void)v48);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v14);
  }

  id v18 = [(HUItemTableViewController *)self itemManager];
  int v19 = [v18 displayedItemAtIndexPath:v7];

  id v20 = [(HUItemTableViewController *)self itemManager];
  v21 = [v20 updatedRecentlyItem];
  int v22 = [v19 isEqual:v21];

  if (v22)
  {
    int v23 = [HUSoftwareUpdateRecentUpdatesViewController alloc];
    uint64_t v24 = [(HUItemTableViewController *)self itemManager];
    id v25 = [v24 home];
    double v26 = [(HUSoftwareUpdateRecentUpdatesViewController *)v23 initWithHome:v25];

    int v27 = [(HUSoftwareUpdateStandaloneViewController *)self navigationController];
    id v28 = (id)objc_msgSend(v27, "hu_pushPreloadableViewController:animated:", v26, 1);
LABEL_20:

    goto LABEL_21;
  }
  char v29 = [(HUItemTableViewController *)self itemManager];
  v30 = [v29 betaUpdatesItem];
  int v31 = [v19 isEqual:v30];

  if (v31)
  {
    if ([MEMORY[0x1E4F5AF00] isNoDaemonMessageChannelEnabled])
    {
      id v32 = objc_alloc(MEMORY[0x1E4F6A2C0]);
      int v33 = [(HUItemTableViewController *)self itemManager];
      v34 = [v33 home];
      v35 = [v34 uniqueIdentifier];
      double v26 = (HUSoftwareUpdateRecentUpdatesViewController *)[v32 initWithHomeID:v35 homeKitIdentifiers:v11];

      if (v26) {
        goto LABEL_19;
      }
    }
    v36 = (objc_class *)MEMORY[0x1E4F6A2C0];
LABEL_18:
    id v44 = [v36 alloc];
    v45 = [(HUItemTableViewController *)self itemManager];
    uint64_t v46 = [v45 home];
    id v47 = [v46 uniqueIdentifier];
    double v26 = (HUSoftwareUpdateRecentUpdatesViewController *)[v44 initWithHomeID:v47];

LABEL_19:
    int v27 = [(HUSoftwareUpdateStandaloneViewController *)self navigationController];
    [v27 pushViewController:v26 animated:1];
    goto LABEL_20;
  }
  v37 = [(HUItemTableViewController *)self itemManager];
  uint64_t v38 = [v37 carrySettingsItem];
  int v39 = [v19 isEqual:v38];

  if (v39)
  {
    if ([MEMORY[0x1E4F5AF00] isNoDaemonMessageChannelEnabled])
    {
      id v40 = objc_alloc(MEMORY[0x1E4F6A2C8]);
      objc_super v41 = [(HUItemTableViewController *)self itemManager];
      v42 = [v41 home];
      v43 = [v42 uniqueIdentifier];
      double v26 = (HUSoftwareUpdateRecentUpdatesViewController *)[v40 initWithHomeID:v43 homeKitIdentifiers:v11];

      if (v26) {
        goto LABEL_19;
      }
    }
    v36 = (objc_class *)MEMORY[0x1E4F6A2C8];
    goto LABEL_18;
  }
LABEL_21:
}

- (void)bannerView:(id)a3 footerViewTapped:(id)a4
{
  id v5 = a3;
  id v6 = [(HUSoftwareUpdateStandaloneViewController *)self softwareUpdateBannerView];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    if ([(HUSoftwareUpdateStandaloneViewController *)self _homePodSoftwareUpdateInProgress])
    {
      [(HUSoftwareUpdateStandaloneViewController *)self _presentHomePodSoftwareUpdateAlreadyInProgressAlert];
    }
    else
    {
      objc_super v8 = [(HUItemTableViewController *)self itemManager];
      id v9 = [v8 home];
      id v10 = [(HUItemTableViewController *)self itemManager];
      id v11 = [v10 devices];
      id v13 = +[HUHomeFeatureOnboardingUtilities home:v9 onboardHomeHub2FromPresentingViewController:self devices:v11 usageOptions:0];

      id v12 = (id)[v13 flatMap:&__block_literal_global_134_0];
    }
  }
}

uint64_t __72__HUSoftwareUpdateStandaloneViewController_bannerView_footerViewTapped___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)_didTapUpdateAllButton:(id)a3
{
  id v3 = [(HUSoftwareUpdateStandaloneViewController *)self softwareUpdateItemModuleController];
  [v3 updateAllAccessories];
}

- (void)doneButtonPressed:(id)a3
{
  id v3 = [(HUSoftwareUpdateStandaloneViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_super v8 = [v7 item];
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 autoUpdateItem];
  int v11 = [v8 isEqual:v10];

  id v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = [v12 home];
    uint64_t v15 = objc_msgSend(v14, "hf_updateAutomaticSoftwareUpdateEnabled:", v4);
  }
  else
  {
    uint64_t v16 = [v12 autoUpdateThirdPartyItem];
    int v17 = [v8 isEqual:v16];

    if (!v17) {
      goto LABEL_7;
    }
    id v13 = [(HUItemTableViewController *)self itemManager];
    uint64_t v14 = [v13 home];
    uint64_t v15 = objc_msgSend(v14, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", v4);
  }
  id v18 = (void *)v15;

  if (v18)
  {
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__HUSoftwareUpdateStandaloneViewController_switchCell_didTurnOn___block_invoke;
    v24[3] = &unk_1E638D6C8;
    objc_copyWeak(v26, &location);
    id v25 = v8;
    v26[1] = (id)a2;
    id v19 = (id)[v18 addCompletionBlock:v24];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
LABEL_7:
  objc_opt_class();
  id v20 = [v8 latestResults];
  v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  if (objc_opt_isKindOfClass()) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
  id v23 = v22;

  [MEMORY[0x1E4F68EE0] sendSwitchCellToggleEventForItem:v8 isOn:v4 title:v23 fromSourceViewController:self];
}

void __65__HUSoftwareUpdateStandaloneViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    [v6 handleError:v4];
  }
  if (*(void *)(a1 + 32))
  {
    id v7 = (void *)MEMORY[0x1E4F69230];
    objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v9 = [v7 requestToUpdateItems:v8 senderSelector:*(void *)(a1 + 48)];

    id v10 = [WeakRetained itemManager];
    id v11 = (id)[v10 performItemUpdateRequest:v9];

LABEL_8:
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "Failure to update software update preference due to missing autoupdateItem", v14, 2u);
    }
    goto LABEL_8;
  }
LABEL_9:
  id v12 = [WeakRetained itemManager];
  id v13 = [v12 home];
  [WeakRetained refreshDataModelForHome:v13];
}

- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4
{
  return [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__HUSoftwareUpdateStandaloneViewController_softwareUpdateModuleController_dismissViewController___block_invoke;
  v8[3] = &unk_1E6386018;
  id v6 = v5;
  id v9 = v6;
  [(HUSoftwareUpdateStandaloneViewController *)self dismissViewControllerAnimated:1 completion:v8];

  return v6;
}

uint64_t __97__HUSoftwareUpdateStandaloneViewController_softwareUpdateModuleController_dismissViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(HUSoftwareUpdateStandaloneViewController *)self navigationController];
  id v7 = objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);

  return v7;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  id v12 = a4;
  [(HUItemTableViewController *)&v15 diffableDataItemManager:a3 didUpdateItems:v12 addItems:v10 removeItems:v11];
  uint64_t v13 = [(HUItemTableViewController *)self itemManager];
  uint64_t v14 = [(id)v13 updateAllItem];

  LOBYTE(v13) = [v12 containsObject:v14];
  if ((v13 & 1) != 0
    || ([v10 containsObject:v14] & 1) != 0
    || [v11 containsObject:v14])
  {
    [(HUSoftwareUpdateStandaloneViewController *)self _refreshUpdateAllBarButton];
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HUItemTableViewController *)self itemManager];
  id v12 = [v11 fetchItem];

  if (v12 == v9)
  {
    uint64_t v13 = [v9 latestResults];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
    int v15 = [v14 BOOLValue];

    [(HUSoftwareUpdateStandaloneViewController *)self setAllowRefresh:v15 ^ 1u];
  }
  uint64_t v16 = [(HUItemTableViewController *)self itemManager];
  int v17 = [v16 updateAllItem];
  int v18 = [v9 isEqual:v17];

  if (v18) {
    [(HUSoftwareUpdateStandaloneViewController *)self _refreshUpdateAllBarButton];
  }
  v19.receiver = self;
  v19.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  [(HUItemTableViewController *)&v19 itemManager:v8 didUpdateResultsForItem:v9 atIndexPath:v10];
}

- (void)_triggerRefresh:(id)a3
{
  id v4 = [(HUSoftwareUpdateStandaloneViewController *)self softwareUpdateFetchFuture];
  int v5 = [v4 isFinished];

  if (v5)
  {
    [(HUSoftwareUpdateStandaloneViewController *)self _kickoffSoftwareUpdate];
  }
}

- (void)_kickoffSoftwareUpdate
{
  [(HUSoftwareUpdateStandaloneViewController *)self setAllowRefresh:0];
  id v4 = [(HUItemTableViewController *)self itemManager];
  int v5 = [v4 triggerSoftwareUpdateFetch];
  [(HUSoftwareUpdateStandaloneViewController *)self setSoftwareUpdateFetchFuture:v5];

  objc_initWeak(&location, self);
  id v6 = +[HUSoftwareUpdateUIManager sharedManager];
  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 home];
  id v9 = [v6 fetchAvailableUpdatesForHome:v8 options:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HUSoftwareUpdateStandaloneViewController__kickoffSoftwareUpdate__block_invoke;
  v11[3] = &unk_1E6388DF8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  id v10 = (id)[v9 addCompletionBlock:v11];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __66__HUSoftwareUpdateStandaloneViewController__kickoffSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained softwareUpdateFetchFuture];
    [v8 finishWithResult:v15 error:v5];

    id v9 = [v7 itemManager];
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    id v11 = [v7 itemManager];
    id v12 = [v11 fetchItem];
    uint64_t v13 = [v10 setWithObject:v12];
    id v14 = (id)[v9 updateResultsForItems:v13 senderSelector:*(void *)(a1 + 40)];
  }
}

- (void)_fetchAccessoryDiagnosticInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUItemTableViewController *)self itemManager];
  id v4 = [v3 home];
  id v5 = objc_msgSend(v4, "hf_homePods");

  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 home];
  if (objc_msgSend(v7, "hf_currentUserIsOwner"))
  {
    uint64_t v8 = [v5 count];

    if (v8)
    {
      objc_msgSend(v5, "na_each:", &__block_literal_global_151_1);
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSNumber;
    id v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 home];
    uint64_t v13 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
    int v14 = 138412546;
    id v15 = v13;
    __int16 v16 = 2112;
    int v17 = v5;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Not fetching diagnostic info: [isOwner:%@], [homePods:%@]", (uint8_t *)&v14, 0x16u);
  }
LABEL_8:
}

void __73__HUSoftwareUpdateStandaloneViewController__fetchAccessoryDiagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v3 = [v2 diagnosticInfoManager];
  id v4 = (id)[v3 fetchDiagnosticInfoForAccessory:v5];
}

- (void)_presentHomePodSoftwareUpdateAlreadyInProgressAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateAlreadyInProgressAlertTitle", @"HUHomePodSoftwareUpdateAlreadyInProgressAlertTitle", 1);
  id v5 = _HULocalizedStringWithDefaultValue(@"HUHomePodSoftwareUpdateAlreadyInProgressAlertDescription", @"HUHomePodSoftwareUpdateAlreadyInProgressAlertDescription", 1);
  id v9 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4F42720];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(HUSoftwareUpdateStandaloneViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (BOOL)_homePodSoftwareUpdateInProgress
{
  id v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 home];
  id v4 = objc_msgSend(v3, "hf_homePods");

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F695B0]) initWithAccessories:v4];
  LOBYTE(v3) = [v5 softwareUpdatesInProgress] != 0;

  return (char)v3;
}

- (id)keyCommands
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F69758] useMacIdiom]
    && [(HUSoftwareUpdateStandaloneViewController *)self allowRefresh])
  {
    id v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"R" modifierFlags:0x100000 action:sel__triggerRefresh_];
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)showDoneButtonInNavBar
{
  return self->_showDoneButtonInNavBar;
}

- (void)setShowDoneButtonInNavBar:(BOOL)a3
{
  self->_showDoneButtonInNavBar = a3;
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
}

- (HUFirmwareUpdateItemModuleController)firmwareUpdateItemModuleController
{
  return self->_firmwareUpdateItemModuleController;
}

- (void)setFirmwareUpdateItemModuleController:(id)a3
{
}

- (UIBarButtonItem)updateAllBarButton
{
  return self->_updateAllBarButton;
}

- (void)setUpdateAllBarButton:(id)a3
{
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
}

- (HUBannerView)softwareUpdateBannerView
{
  return self->_softwareUpdateBannerView;
}

- (void)setSoftwareUpdateBannerView:(id)a3
{
}

- (BOOL)allowRefresh
{
  return self->_allowRefresh;
}

- (void)setAllowRefresh:(BOOL)a3
{
  self->_allowRefresh = a3;
}

- (BOOL)viewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_updateAllBarButton, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemModuleController, 0);

  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);
}

@end