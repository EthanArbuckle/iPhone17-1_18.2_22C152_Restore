@interface FAChecklistViewController
- (FAChecklistStore)checklistStore;
- (FAChecklistViewController)initWithAccountManager:(id)a3 familyCircle:(id)a4 profilePictureStore:(id)a5 checklistStore:(id)a6;
- (FAChecklistViewControllerDelegate)delegate;
- (FAFamilyCircle)familyCircle;
- (FAProfilePictureStore)profilePictureStore;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_childCommunicationLimitsForContactManagement:(id)a3;
- (id)_childContactsRecord:(id)a3;
- (id)_childPresetSpecifiers:(id)a3;
- (id)_childrenRecord;
- (id)_custodianContactSpecifiers;
- (id)_getOrganizer;
- (id)_icloudPlusSpecifiers:(id)a3;
- (id)_locationSpecifiersWithSharedCount:(unint64_t)a3;
- (id)_medicalSpecifiersWithMedicalIDData;
- (id)specifiers;
- (int)_contactsStatusForChild:(id)a3;
- (int64_t)deviceType;
- (void)_checkAndReloadAllSpecifiers;
- (void)_checklistHeaderView;
- (void)_fetchCommunicationLimitsModifiedDate:(id)a3 completionHandler:(id)a4;
- (void)_fetchPresetsForChild:(id)a3 andCompletionHandler:(id)a4;
- (void)_fetchScreenTimeModifiedDate:(id)a3 completionHandler:(id)a4;
- (void)_manageChildContactsWasTapped:(id)a3;
- (void)_reviewPresetsWasTapped:(id)a3;
- (void)_setupCustodianTapped:(id)a3;
- (void)_setupIcloudPlusWasTapped:(id)a3;
- (void)_setupNavigationBarTitleView;
- (void)_shareMyLocationButtonWasTapped:(id)a3;
- (void)_updateCommunicationLimitsSpecifierThen:(id)a3;
- (void)_updateCustodianSpecifierThen:(id)a3;
- (void)_updateICloudPlusSpecifierThen:(id)a3;
- (void)_updateLocationSpecifierThen:(id)a3;
- (void)_updateMedicalIDButtonWasTapped:(id)a3;
- (void)_updateMedicalSpecifierThen:(id)a3;
- (void)_updateScreenTimeSpecifierThen:(id)a3;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4;
- (void)loadView;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidFinish:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)reloadSpecifiers;
- (void)setChecklistStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FAChecklistViewController

- (FAChecklistViewController)initWithAccountManager:(id)a3 familyCircle:(id)a4 profilePictureStore:(id)a5 checklistStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v71 = a6;
  v72.receiver = self;
  v72.super_class = (Class)FAChecklistViewController;
  v14 = [(FAChecklistViewController *)&v72 init];
  if (v14)
  {
    id v70 = v13;
    uint64_t v15 = [MEMORY[0x263F3BA80] sharedInstance];
    session = v14->_session;
    v14->_session = (FMFSession *)v15;

    v17 = [MEMORY[0x263F08A48] mainQueue];
    [(FMFSession *)v14->_session setDelegateQueue:v17];

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v18 = (void *)getHKHealthStoreClass_softClass_2;
    uint64_t v81 = getHKHealthStoreClass_softClass_2;
    if (!getHKHealthStoreClass_softClass_2)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getHKHealthStoreClass_block_invoke_2;
      v76 = &unk_264348998;
      v77 = &v78;
      __getHKHealthStoreClass_block_invoke_2((uint64_t)&v73);
      v18 = (void *)v79[3];
    }
    v19 = v18;
    _Block_object_dispose(&v78, 8);
    v20 = (HKHealthStore *)objc_alloc_init(v19);
    healthStore = v14->_healthStore;
    v14->_healthStore = v20;

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v22 = (void *)getHKMedicalIDStoreClass_softClass_2;
    uint64_t v81 = getHKMedicalIDStoreClass_softClass_2;
    if (!getHKMedicalIDStoreClass_softClass_2)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getHKMedicalIDStoreClass_block_invoke_2;
      v76 = &unk_264348998;
      v77 = &v78;
      __getHKMedicalIDStoreClass_block_invoke_2((uint64_t)&v73);
      v22 = (void *)v79[3];
    }
    v23 = v22;
    _Block_object_dispose(&v78, 8);
    uint64_t v24 = [[v23 alloc] initWithHealthStore:v14->_healthStore];
    medicalIDStore = v14->_medicalIDStore;
    v14->_medicalIDStore = (HKMedicalIDStore *)v24;

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v26 = (void *)get_HKMedicalIDDataClass_softClass_1;
    uint64_t v81 = get_HKMedicalIDDataClass_softClass_1;
    if (!get_HKMedicalIDDataClass_softClass_1)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __get_HKMedicalIDDataClass_block_invoke_1;
      v76 = &unk_264348998;
      v77 = &v78;
      __get_HKMedicalIDDataClass_block_invoke_1((uint64_t)&v73);
      v26 = (void *)v79[3];
    }
    v27 = v26;
    _Block_object_dispose(&v78, 8);
    v28 = (_HKMedicalIDData *)objc_alloc_init(v27);
    medicalIDData = v14->_medicalIDData;
    v14->_medicalIDData = v28;

    v30 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    currEmergencyContacts = v14->_currEmergencyContacts;
    v14->_currEmergencyContacts = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    childPresetRecord = v14->_childPresetRecord;
    v14->_childPresetRecord = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    existingChildPresetRecord = v14->_existingChildPresetRecord;
    v14->_existingChildPresetRecord = v34;

    objc_storeStrong((id *)&v14->_accountManager, a3);
    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkActivityQueue = v14->_networkActivityQueue;
    v14->_networkActivityQueue = v36;

    [(NSOperationQueue *)v14->_networkActivityQueue setQualityOfService:33];
    v38 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    remoteUIViewController = v14->_remoteUIViewController;
    v14->_remoteUIViewController = v38;

    v40 = [(AIDAAccountManager *)v14->_accountManager accounts];
    uint64_t v41 = [v40 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    appleAccount = v14->_appleAccount;
    v14->_appleAccount = (ACAccount *)v41;

    v43 = (AACustodianController *)objc_alloc_init(MEMORY[0x263F257E8]);
    custodianController = v14->_custodianController;
    v14->_custodianController = v43;

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v45 = (void *)getSTSetupClientClass_softClass_0;
    uint64_t v81 = getSTSetupClientClass_softClass_0;
    id v13 = v70;
    if (!getSTSetupClientClass_softClass_0)
    {
      uint64_t v73 = MEMORY[0x263EF8330];
      uint64_t v74 = 3221225472;
      v75 = __getSTSetupClientClass_block_invoke_0;
      v76 = &unk_264348998;
      v77 = &v78;
      __getSTSetupClientClass_block_invoke_0((uint64_t)&v73);
      v45 = (void *)v79[3];
    }
    id v46 = v45;
    _Block_object_dispose(&v78, 8);
    uint64_t v47 = objc_opt_new();
    setupClient = v14->_setupClient;
    v14->_setupClient = (STSetupClient *)v47;

    v49 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    custodians = v14->_custodians;
    v14->_custodians = v49;

    objc_storeStrong((id *)&v14->_familyCircle, a4);
    objc_storeStrong((id *)&v14->_profilePictureStore, a5);
    objc_storeStrong((id *)&v14->_checklistStore, a6);
    v14->_isMissingParentContact = 0;
    v51 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    membersWithLocation = v14->_membersWithLocation;
    v14->_membersWithLocation = v51;

    v53 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    screenTimeModifiedDate = v14->_screenTimeModifiedDate;
    v14->_screenTimeModifiedDate = v53;

    v55 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    screenTimeModifiedRecord = v14->_screenTimeModifiedRecord;
    v14->_screenTimeModifiedRecord = v55;

    v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    commLimitsModifiedRecord = v14->_commLimitsModifiedRecord;
    v14->_commLimitsModifiedRecord = v57;

    uint64_t v59 = +[LocationViewModel shared];
    locationViewModel = v14->_locationViewModel;
    v14->_locationViewModel = (_TtC14FamilyCircleUI17LocationViewModel *)v59;

    v61 = [MEMORY[0x263F82670] currentDevice];
    v14->_deviceType = [v61 userInterfaceIdiom];

    v62 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parentalControlsForChildren = v14->_parentalControlsForChildren;
    v14->_parentalControlsForChildren = v62;

    v64 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    commLimitsForChildren = v14->_commLimitsForChildren;
    v14->_commLimitsForChildren = v64;

    v66 = [(FAChecklistViewController *)v14 familyCircle];

    if (v66)
    {
      objc_storeStrong((id *)&v14->_familyCircle, a4);
      uint64_t v67 = +[LocationViewModel createModel];
      v68 = v14->_locationViewModel;
      v14->_locationViewModel = (_TtC14FamilyCircleUI17LocationViewModel *)v67;
    }
  }

  return v14;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v7 loadView];
  v3 = [(FAChecklistViewController *)self _childrenRecord];
  listOfChildren = self->_listOfChildren;
  self->_listOfChildren = v3;

  v5 = [(FAChecklistViewController *)self _getOrganizer];
  organizerName = self->_organizerName;
  self->_organizerName = v5;
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v37 viewDidLoad];
  v3 = +[FamilyChecklistAnalytics shared];
  [v3 sendTotalChecklistViewsAnalyticsEvent];

  self->_isFirstSpecifierLoad = 1;
  +[FATipKitSignaler sendSignalForFamilyChecklistTapped];
  v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 addObserver:self selector:sel__gotLocationChangedNotification name:*MEMORY[0x263F3BE10] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"FAChecklistTipUpdateNotification" object:0];

  v6 = [(FAChecklistViewController *)self navigationItem];
  navItem = self->_navItem;
  self->_navItem = v6;

  id v8 = objc_alloc(MEMORY[0x263F824A8]);
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"DONE" value:&stru_26CA2C800 table:@"Localizable"];
  id v11 = (void *)[v8 initWithTitle:v10 style:2 target:self action:sel_doneButtonTapped_];

  [(UINavigationItem *)self->_navItem setRightBarButtonItem:v11];
  [(UINavigationItem *)self->_navItem setLeftBarButtonItem:0];
  [(UINavigationItem *)self->_navItem setLargeTitleDisplayMode:2];
  self->_isNavigationTitleViewDisplayed = 0;
  [(FAChecklistViewController *)self _setupNavigationBarTitleView];
  id v12 = +[FASwiftUIHostingControllerProvider getCheckListControllerWithSpecifiers:self->_specifiers];
  checklistHostController = self->_checklistHostController;
  self->_checklistHostController = v12;

  [(FAChecklistViewController *)self addChildViewController:self->_checklistHostController];
  v14 = [(FAChecklistViewController *)self view];
  uint64_t v15 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  [v14 addSubview:v15];

  v16 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  v18 = [v17 topAnchor];
  v19 = [(FAChecklistViewController *)self view];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  v23 = [v22 leadingAnchor];
  uint64_t v24 = [(FAChecklistViewController *)self view];
  v25 = [v24 leadingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  v28 = [v27 trailingAnchor];
  v29 = [(FAChecklistViewController *)self view];
  v30 = [v29 trailingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(FACheckListHostControllerProtocol *)self->_checklistHostController view];
  v33 = [v32 bottomAnchor];
  v34 = [(FAChecklistViewController *)self view];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  [(FACheckListHostControllerProtocol *)self->_checklistHostController didMoveToParentViewController:self];
}

- (void)_setupNavigationBarTitleView
{
  v3 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, 100.0, 20.0);
  navigationBarTitleLabel = self->_navigationBarTitleLabel;
  self->_navigationBarTitleLabel = v3;

  v5 = [MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81840]];
  [(UILabel *)self->_navigationBarTitleLabel setFont:v5];

  [(UILabel *)self->_navigationBarTitleLabel setTextAlignment:1];
  v6 = self->_navigationBarTitleLabel;
  objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"FAMILY_CHECKLIST" value:&stru_26CA2C800 table:@"Localizable"];
  [(UILabel *)v6 setText:v8];

  v9 = self->_navigationBarTitleLabel;
  [(UILabel *)v9 setAlpha:0.0];
}

- (void)doneButtonTapped:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FAChecklistViewController_doneButtonTapped___block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__FAChecklistViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2
    && (v3 = (void *)v2,
        [*(id *)(a1 + 32) delegate],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    v6 = [*(id *)(a1 + 32) navigationController];
    [v7 checklistViewControllerDone:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) navigationController];
    [v7 dismissViewControllerAnimated:1 completion:&__block_literal_global_19];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v4 viewWillAppear:1];
  [(FAChecklistViewController *)self _checkAndReloadAllSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v3 viewDidAppear:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v3 viewWillDisappear:1];
}

- (void)_checkAndReloadAllSpecifiers
{
  if (!self->_isFirstSpecifierLoad)
  {
    objc_super v3 = [(FAChecklistViewController *)self checklistStore];
    [v3 clearChecklistCounts];
  }
  self->_isFirstSpecifierLoad = 0;
  objc_super v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke;
  v15[3] = &unk_264348AE0;
  v15[4] = self;
  char v5 = v4;
  v16 = v5;
  [(FAChecklistViewController *)self _updateLocationSpecifierThen:v15];
  if (!self->_deviceType)
  {
    dispatch_group_enter(v5);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_3;
    v13[3] = &unk_2643489F8;
    v14 = v5;
    [(FAChecklistViewController *)self _updateMedicalSpecifierThen:v13];
  }
  dispatch_group_enter(v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_4;
  v11[3] = &unk_2643489F8;
  v6 = v5;
  id v12 = v6;
  [(FAChecklistViewController *)self _updateCustodianSpecifierThen:v11];
  dispatch_group_enter(v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_5;
  v9[3] = &unk_2643489F8;
  v10 = v6;
  id v7 = v6;
  [(FAChecklistViewController *)self _updateCommunicationLimitsSpecifierThen:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_6;
  v8[3] = &unk_2643489F8;
  v8[4] = self;
  dispatch_group_notify(v7, MEMORY[0x263EF83A0], v8);
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_2;
  v2[3] = &unk_2643489F8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _updateScreenTimeSpecifierThen:v2];
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_2(uint64_t a1)
{
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_3(uint64_t a1)
{
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_4(uint64_t a1)
{
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_5(uint64_t a1)
{
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_6(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];

  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [*(id *)(a1 + 32) checklistStore];
    char v5 = [v4 incompleteItems];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "FAChecklistViewController _checkAndReloadAllSpecifiers end count %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_updateLocationSpecifierThen:(id)a3
{
  id v4 = a3;
  char v5 = [(FAChecklistViewController *)self checklistStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke;
  v7[3] = &unk_26434A168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 familyLocationSharingStatus:v7];
}

void __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke_2;
  v8[3] = &unk_26434A140;
  uint64_t v11 = a2;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1000) = *(void *)(a1 + 56);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1152), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 setIncompleteCountFor:2 count:*(void *)(a1 + 56) == 0];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)_updateMedicalSpecifierThen:(id)a3
{
  id v4 = a3;
  id v5 = [(FAChecklistViewController *)self checklistStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__FAChecklistViewController__updateMedicalSpecifierThen___block_invoke;
  v7[3] = &unk_26434A190;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchMedicalIDData:v7];
}

void __57__FAChecklistViewController__updateMedicalSpecifierThen___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), a2);
  id v10 = a2;
  uint64_t v6 = [v10 emergencyContacts];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1024);
  *(void *)(v7 + 1024) = v6;

  *(void *)(*(void *)(a1 + 32) + 1008) = a3;
  id v9 = [*(id *)(a1 + 32) checklistStore];
  [v9 setIncompleteCountFor:1 count:a3 == 0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCustodianSpecifierThen:(id)a3
{
  id v4 = a3;
  id v5 = [(FAChecklistViewController *)self checklistStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FAChecklistViewController__updateCustodianSpecifierThen___block_invoke;
  v7[3] = &unk_26434A1B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchMyCustodians:v7];
}

void __59__FAChecklistViewController__updateCustodianSpecifierThen___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1136), a2);
  id v5 = a2;
  id v4 = [*(id *)(a1 + 32) checklistStore];
  objc_msgSend(v4, "setIncompleteCountFor:count:", 3, objc_msgSend(v5, "count") == 0);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateICloudPlusSpecifierThen:(id)a3
{
  id v4 = a3;
  id v5 = [(FAChecklistViewController *)self checklistStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke;
  v7[3] = &unk_264349D20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchIcloudPlusMembership:v7];
}

void __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke_2;
  block[3] = &unk_26434A1E0;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) checklistStore];
  [v3 setCountMembersIcloudPlus:v2];

  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "aa_isCloudSubscriber")) {
    BOOL v4 = *(void *)(a1 + 48) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) checklistStore];
  [v5 setIncompleteCountFor:6 count:v4];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (void)_updateScreenTimeSpecifierThen:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v20 = a3;
  BOOL v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_listOfChildren;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    LODWORD(v7) = 0;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        id v10 = [(FAChecklistViewController *)self checklistStore];
        if (([v10 screenTimeEnabledForChild:v9] & 1) != 0
          || ([v9 hasAskToBuyEnabled] & 1) != 0)
        {
          uint64_t v11 = 1;
        }
        else if ([(NSSet *)self->_membersWithLocation count])
        {
          membersWithLocation = self->_membersWithLocation;
          v16 = [v9 appleID];
          uint64_t v11 = [(NSSet *)membersWithLocation containsObject:v16];
        }
        else
        {
          uint64_t v11 = 0;
        }

        parentalControlsForChildren = self->_parentalControlsForChildren;
        id v13 = [NSNumber numberWithBool:v11];
        v14 = [v9 appleID];
        [(NSMutableDictionary *)parentalControlsForChildren setObject:v13 forKey:v14];

        uint64_t v7 = v7 + (v11 ^ 1);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke;
        v25[3] = &unk_26434A208;
        v25[4] = self;
        v25[5] = v9;
        v26 = v4;
        [(FAChecklistViewController *)self _fetchScreenTimeModifiedDate:v9 completionHandler:v25];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }
  else
  {
    uint64_t v7 = 0;
  }

  v18 = [(FAChecklistViewController *)self checklistStore];
  [v18 setIncompleteCountFor:4 count:v7];

  dispatch_group_leave(v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke_2;
  block[3] = &unk_264349070;
  block[4] = self;
  id v24 = v20;
  id v19 = v20;
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], block);
}

void __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    BOOL v4 = (void *)a1[5];
    uint64_t v5 = *(void **)(a1[4] + 1200);
    id v6 = a2;
    uint64_t v7 = [v4 dsid];
    [v5 setObject:v6 forKey:v7];
  }
  uint64_t v8 = a1[6];
  dispatch_group_leave(v8);
}

uint64_t __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 1200) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 1200);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1200), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
          uint64_t v8 = v7;
          if (v7 && ([v7 isEqualToDate:*(void *)(*(void *)(a1 + 32) + 1184)] & 1) == 0) {
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 1184), v8);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCommunicationLimitsSpecifierThen:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_listOfChildren;
  uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  uint64_t v5 = 0;
  if (v27)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        dispatch_group_enter(v4);
        id v9 = [(FAChecklistViewController *)self checklistStore];
        uint64_t v10 = [v9 contactManagementEnabledForChild:v8];

        long long v11 = [(FAChecklistViewController *)self checklistStore];
        int v12 = [v11 screenTimeEnabledForChild:v8];

        long long v13 = [(FAChecklistViewController *)self checklistStore];
        int v14 = [v13 screenTimeEnabledForChild:v8];

        if (v14)
        {
          commLimitsForChildren = self->_commLimitsForChildren;
          uint64_t v15 = [NSNumber numberWithBool:v10 == 0];
          [v8 appleID];
          int v16 = v12;
          uint64_t v17 = self;
          v18 = v4;
          v20 = uint64_t v19 = v6;
          [(NSMutableDictionary *)commLimitsForChildren setObject:v15 forKey:v20];

          uint64_t v6 = v19;
          uint64_t v4 = v18;
          self = v17;
          int v12 = v16;
        }
        if (v10) {
          int v21 = 0;
        }
        else {
          int v21 = v12;
        }
        uint64_t v5 = (v5 + v21);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke;
        v30[3] = &unk_26434A208;
        v30[4] = self;
        v30[5] = v8;
        v31 = v4;
        [(FAChecklistViewController *)self _fetchCommunicationLimitsModifiedDate:v8 completionHandler:v30];
      }
      uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v27);
  }

  uint64_t v22 = [(FAChecklistViewController *)self checklistStore];
  [v22 setIncompleteCountFor:5 count:v5];

  dispatch_group_leave(v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke_2;
  block[3] = &unk_264349070;
  block[4] = self;
  id v29 = v24;
  id v23 = v24;
  dispatch_group_notify(v4, MEMORY[0x263EF83A0], block);
}

void __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = *(void **)(a1[4] + 1208);
    id v6 = a2;
    uint64_t v7 = [v4 dsid];
    [v5 setObject:v6 forKey:v7];
  }
  uint64_t v8 = a1[6];
  dispatch_group_leave(v8);
}

uint64_t __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 1208) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 1208);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1208), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
          uint64_t v8 = v7;
          if (v7 && ([v7 isEqualToDate:*(void *)(*(void *)(a1 + 32) + 1192)] & 1) == 0) {
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 1192), v8);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_childrenRecord
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(FAChecklistViewController *)self familyCircle];
  uint64_t v5 = [v4 members];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 memberType] == 1 || objc_msgSend(v10, "memberType") == 2) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v11;
}

- (id)_getOrganizer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [(FAChecklistViewController *)self familyCircle];
  id v3 = [v2 members];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 isOrganizer])
        {
          uint64_t v11 = [v10 firstName];

          long long v12 = [v10 contact];
          uint64_t v13 = [v12 givenName];

          uint64_t v6 = (void *)v11;
          uint64_t v7 = (void *)v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  if ([v6 length]) {
    long long v14 = v6;
  }
  else {
    long long v14 = v7;
  }
  id v15 = v14;

  return v15;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.0;
}

- (void)_checklistHeaderView
{
  id v4 = +[FASwiftUIHostingControllerProvider getFamilyChecklistHeaderView];
  id v2 = [MEMORY[0x263F825C8] clearColor];
  id v3 = [v4 view];
  [v3 setBackgroundColor:v2];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)FAChecklistViewController;
  [(FAChecklistViewController *)&v2 viewWillLayoutSubviews];
}

- (id)_childCommunicationLimitsForContactManagement:(id)a3
{
  v80[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSString;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_LIMITS_CARD" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v8 = [v4 firstName];
  uint64_t v78 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);

  id v9 = NSString;
  long long v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_LIMITS_CARD_SET" value:&stru_26CA2C800 table:@"Localizable"];
  long long v12 = [v4 firstName];
  uint64_t v13 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v12);

  long long v14 = (void *)MEMORY[0x263F827E8];
  id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v14 imageNamed:@"communicationLimitsIcon" inBundle:v15];

  v76 = objc_msgSend(MEMORY[0x263F08790], "fa_checklistDateFormatter");
  int v67 = [(FAChecklistViewController *)self _contactsStatusForChild:v4];
  long long v17 = [(FAChecklistViewController *)self checklistStore];
  uint64_t v73 = [v17 contactManagementEnabledForChild:v4];

  uint64_t v71 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"commLimits"];
  long long v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v78 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v69 = (void *)v13;
  long long v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:4 edit:0];
  double v20 = *MEMORY[0x263F839B8];
  int v21 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
  uint64_t v22 = *MEMORY[0x263F602A8];
  [v18 setProperty:v21 forKey:*MEMORY[0x263F602A8]];

  uint64_t v23 = *MEMORY[0x263F602D0];
  [v18 setProperty:v78 forKey:*MEMORY[0x263F602D0]];
  uint64_t v24 = *MEMORY[0x263F602C8];
  [v18 setProperty:0 forKey:*MEMORY[0x263F602C8]];
  uint64_t v25 = *MEMORY[0x263F60140];
  id v70 = v18;
  [v18 setProperty:v16 forKey:*MEMORY[0x263F60140]];
  v26 = [NSNumber numberWithDouble:v20];
  [v19 setProperty:v26 forKey:v22];

  uint64_t v68 = v23;
  uint64_t v27 = v23;
  long long v28 = v19;
  [v19 setProperty:v78 forKey:v27];
  [v19 setProperty:0 forKey:v24];
  objc_super v72 = (void *)v16;
  [v19 setProperty:v16 forKey:v25];
  commLimitsModifiedRecord = self->_commLimitsModifiedRecord;
  long long v30 = [v4 dsid];
  v31 = [(NSMutableDictionary *)commLimitsModifiedRecord objectForKeyedSubscript:v30];

  v75 = v31;
  if (v73 == 2)
  {
    if (!v31)
    {
      v77 = 0;
      goto LABEL_12;
    }
    v42 = v31;
    v43 = NSString;
    v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v45 = [v44 localizedStringForKey:@"FAMILY_CHECKLIST_SECTION_UPDATED_DATE" value:&stru_26CA2C800 table:@"Localizable"];
    id v46 = [v76 stringFromDate:v42];
    v31 = objc_msgSend(v43, "localizedStringWithFormat:", v45, v46);
    v77 = 0;
    goto LABEL_11;
  }
  if (v73 == 1)
  {
    uint64_t v47 = NSString;
    v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v49 = [v48 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_SUBTITLE_PENDING" value:&stru_26CA2C800 table:@"Localizable"];
    v50 = [v4 firstName];
    v31 = objc_msgSend(v47, "localizedStringWithFormat:", v49, v50);

    v51 = NSString;
    v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v45 = [v44 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP_APPROVAL" value:&stru_26CA2C800 table:@"Localizable"];
    id v46 = [v4 firstName];
    v77 = objc_msgSend(v51, "localizedStringWithFormat:", v45, v46);
LABEL_11:

    goto LABEL_12;
  }
  v31 = 0;
  v77 = 0;
  if (!v73)
  {
    uint64_t v74 = v24;
    long long v32 = NSString;
    long long v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v34 = [v33 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_LIMIT_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];
    long long v35 = [v4 firstName];
    v36 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v35);

    uint64_t v37 = v69;
    v38 = (void *)v71;
    if (v67 != 2)
    {
      if (v67 == 5)
      {
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = v39;
        uint64_t v41 = @"FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP_APPROVAL";
        goto LABEL_17;
      }
      if (v67 != 4)
      {
        v77 = 0;
        goto LABEL_19;
      }
    }
    v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v40 = v39;
    uint64_t v41 = @"FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP";
LABEL_17:
    v77 = [v39 localizedStringForKey:v41 value:&stru_26CA2C800 table:@"Localizable"];

LABEL_19:
    v62 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v77 target:self set:0 get:0 detail:0 cell:13 edit:0];
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = *MEMORY[0x263F5FFE0];
    v61 = v70;
    [v70 setProperty:v63 forKey:*MEMORY[0x263F5FFE0]];
    [v70 setProperty:v36 forKey:v74];
    [v62 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    v65 = [v4 dsid];
    [v62 setProperty:v65 forKey:@"childDsidKey"];

    [v62 setProperty:v77 forKey:v68];
    [v62 setProperty:objc_opt_class() forKey:v64];
    [v62 setButtonAction:sel__manageChildContactsWasTapped_];
    v80[0] = v71;
    v80[1] = v70;
    v80[2] = v62;
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];

    v31 = 0;
    uint64_t v59 = v4;
    v60 = (void *)v78;
    goto LABEL_20;
  }
LABEL_12:
  v52 = NSString;
  v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v54 = [v53 localizedStringForKey:@"FAMILY_CHECKLIST_COMMUNICATION_LIMIT_DESCRIPTION_SETUP" value:&stru_26CA2C800 table:@"Localizable"];
  v55 = [v4 firstName];
  v36 = objc_msgSend(v52, "localizedStringWithFormat:", v54, v55);

  [v28 setCellType:1];
  v56 = [NSNumber numberWithDouble:v20];
  [v28 setProperty:v56 forKey:v22];

  [v28 setProperty:v36 forKey:v24];
  if (v31) {
    [v28 setProperty:v31 forKey:*MEMORY[0x263F60120]];
  }
  [v28 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v57 = [v4 dsid];
  [v28 setProperty:v57 forKey:@"childDsidKey"];

  [v28 setButtonAction:sel__manageChildContactsWasTapped_];
  v38 = (void *)v71;
  v79[0] = v71;
  v79[1] = v28;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
  uint64_t v59 = v4;
  v60 = (void *)v78;
  uint64_t v37 = v69;
  v61 = v70;
LABEL_20:

  return v58;
}

- (id)_locationSpecifiersWithSharedCount:(unint64_t)a3
{
  v45[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v43 = [v5 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_CARD" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_SET" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_SETUP" value:&stru_26CA2C800 table:@"Localizable"];

  long long v10 = NSString;
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v12 = [v11 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_SHARING_INFO" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v13 = [(FAChecklistViewController *)self familyCircle];
  long long v14 = [v13 members];
  uint64_t v40 = objc_msgSend(v10, "localizedStringWithFormat:", v12, a3, objc_msgSend(v14, "count") - 1);

  id v15 = (void *)MEMORY[0x263F827E8];
  uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v15 imageNamed:@"fmfNewIcon" inBundle:v16];

  uint64_t v39 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"location"];
  uint64_t v41 = (void *)v9;
  uint64_t v37 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];
  long long v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v43 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v42 = (void *)v7;
  long long v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v20 = *MEMORY[0x263F602D0];
  [v18 setProperty:v43 forKey:*MEMORY[0x263F602D0]];
  uint64_t v21 = *MEMORY[0x263F60140];
  v38 = (void *)v17;
  [v18 setProperty:v17 forKey:*MEMORY[0x263F60140]];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = *MEMORY[0x263F5FFE0];
  [v18 setProperty:v22 forKey:*MEMORY[0x263F5FFE0]];
  unint64_t countMembersWithLocation = self->_countMembersWithLocation;
  uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = v25;
  if (countMembersWithLocation)
  {
    uint64_t v27 = [v25 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_CARD_DESCRIPTION_SET" value:&stru_26CA2C800 table:@"Localizable"];

    long long v28 = (void *)v43;
    [v19 setProperty:v43 forKey:v20];
    id v29 = v38;
    [v19 setProperty:v38 forKey:v21];
    [v19 setProperty:objc_opt_class() forKey:v23];
    [v19 setCellType:1];
    long long v30 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [v19 setProperty:v30 forKey:*MEMORY[0x263F602A8]];

    [v19 setButtonAction:sel__shareMyLocationButtonWasTapped_];
    v31 = (void *)v40;
    [v19 setProperty:v40 forKey:*MEMORY[0x263F60120]];
    [v19 setProperty:v27 forKey:*MEMORY[0x263F602C8]];
    long long v32 = (void *)v39;
    v45[0] = v39;
    v45[1] = v19;
    long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
    long long v34 = v41;
    long long v35 = v37;
  }
  else
  {
    uint64_t v27 = [v25 localizedStringForKey:@"FAMILY_CHECKLIST_LOCATION_CARD_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];

    [v18 setProperty:v27 forKey:*MEMORY[0x263F602C8]];
    long long v34 = v41;
    [v18 setProperty:v41 forKey:*MEMORY[0x263F5FF70]];
    long long v35 = v37;
    [v37 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    [v37 setProperty:v41 forKey:v20];
    [v37 setProperty:objc_opt_class() forKey:v23];
    [v37 setButtonAction:sel__shareMyLocationButtonWasTapped_];
    long long v32 = (void *)v39;
    v44[0] = v39;
    v44[1] = v18;
    v44[2] = v37;
    long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
    long long v28 = (void *)v43;
    v31 = (void *)v40;
    id v29 = v38;
  }

  return v33;
}

- (id)_medicalSpecifiersWithMedicalIDData
{
  v47[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v36 = [v3 localizedStringForKey:@"FAMILY_CHECKLIST_MEDICAL_CARD" value:&stru_26CA2C800 table:@"Localizable"];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"FAMILY_CHECKLIST_MEDICAL_SET" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v6 = objc_msgSend(MEMORY[0x263F08790], "fa_checklistDateFormatter");
  uint64_t v7 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContactsModifiedDate];
  medicalIDData = self->_medicalIDData;
  if (v7) {
    [(_HKMedicalIDData *)medicalIDData emergencyContactsModifiedDate];
  }
  else {
  uint64_t v9 = [(_HKMedicalIDData *)medicalIDData dateSaved];
  }

  long long v10 = NSString;
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v12 = [v11 localizedStringForKey:@"FAMILY_CHECKLIST_SECTION_UPDATED_DATE" value:&stru_26CA2C800 table:@"Localizable"];
  v42 = (void *)v9;
  uint64_t v43 = v6;
  uint64_t v13 = [v6 stringFromDate:v9];
  uint64_t v41 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v13);

  long long v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"FAMILY_CHECKLIST_MEDICAL_SETUP" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v40 = [MEMORY[0x263F82818] configurationWithPointSize:7 weight:35.0];
  uint64_t v16 = objc_msgSend(MEMORY[0x263F827E8], "systemImageNamed:withConfiguration:", @"staroflife.fill");
  uint64_t v17 = [MEMORY[0x263F825C8] systemRedColor];
  uint64_t v18 = [v16 imageWithTintColor:v17 renderingMode:1];

  uint64_t v37 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"medical"];
  long long v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v36 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v44 = (void *)v5;
  uint64_t v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v39 = (void *)v15;
  v45 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];
  uint64_t v21 = *MEMORY[0x263F602D0];
  [v19 setProperty:v36 forKey:*MEMORY[0x263F602D0]];
  uint64_t v22 = *MEMORY[0x263F60140];
  v38 = (void *)v18;
  [v19 setProperty:v18 forKey:*MEMORY[0x263F60140]];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = *MEMORY[0x263F5FFE0];
  [v19 setProperty:v23 forKey:*MEMORY[0x263F5FFE0]];
  unint64_t countEmergencyContacts = self->_countEmergencyContacts;
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v27 = v26;
  if (countEmergencyContacts)
  {
    long long v28 = [v26 localizedStringForKey:@"FAMILY_CHECKLIST_MEDICAL_CARD_DESCRIPTION_SET" value:&stru_26CA2C800 table:@"Localizable"];

    [v20 setProperty:v36 forKey:v21];
    id v29 = v38;
    [v20 setProperty:v38 forKey:v22];
    [v20 setProperty:objc_opt_class() forKey:v24];
    [v20 setCellType:1];
    long long v30 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [v20 setProperty:v30 forKey:*MEMORY[0x263F602A8]];

    [v20 setButtonAction:sel__updateMedicalIDButtonWasTapped_];
    v31 = (void *)v41;
    [v20 setProperty:v41 forKey:*MEMORY[0x263F60120]];
    [v20 setProperty:v28 forKey:*MEMORY[0x263F602C8]];
    long long v32 = (void *)v37;
    v47[0] = v37;
    v47[1] = v20;
    long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    long long v34 = v39;
  }
  else
  {
    long long v28 = [v26 localizedStringForKey:@"FAMILY_CHECKLIST_MEDICAL_CARD_DESCRIPTION_NOT_SET" value:&stru_26CA2C800 table:@"Localizable"];

    [v19 setProperty:v28 forKey:*MEMORY[0x263F602C8]];
    [v45 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    [v45 setProperty:v39 forKey:v21];
    [v45 setProperty:objc_opt_class() forKey:v24];
    [v45 setButtonAction:sel__updateMedicalIDButtonWasTapped_];
    long long v32 = (void *)v37;
    v46[0] = v37;
    v46[1] = v19;
    v46[2] = v45;
    long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
    v31 = (void *)v41;
    long long v34 = v39;
    id v29 = v38;
  }

  return v33;
}

- (id)_childPresetSpecifiers:(id)a3
{
  v93[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSString;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_CARD" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v8 = [v4 firstName];
  uint64_t v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);

  long long v10 = NSString;
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v12 = [v11 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_CARD_REVIEW" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v13 = [v10 localizedStringWithFormat:v12];

  uint64_t v85 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"children"];
  long long v14 = [v4 dsid];
  uint64_t v84 = [v14 stringValue];

  uint64_t v15 = [(FAChecklistViewController *)self profilePictureStore];
  uint64_t v16 = [v15 profilePictureForFamilyMember:v4 pictureDiameter:40.0];

  uint64_t v17 = (void *)MEMORY[0x263F827E8];
  uint64_t v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 scale];
  v83 = (void *)v16;
  v90 = objc_msgSend(v17, "imageWithData:scale:", v16);

  v89 = (void *)v9;
  long long v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v86 = (void *)v13;
  v82 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v20 = objc_msgSend(MEMORY[0x263F08790], "fa_checklistDateFormatter");
  id v21 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v21 setMonth:-6];
  id v22 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v23 = (void *)[v22 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v24 = [MEMORY[0x263EFF910] date];
  v79 = v23;
  uint64_t v80 = v21;
  v88 = [v23 dateByAddingComponents:v21 toDate:v24 options:0];

  screenTimeModifiedRecord = self->_screenTimeModifiedRecord;
  v26 = [v4 dsid];
  uint64_t v27 = [(NSMutableDictionary *)screenTimeModifiedRecord objectForKeyedSubscript:v26];

  uint64_t v81 = v20;
  if (v27)
  {
    long long v28 = NSString;
    id v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v30 = [v29 localizedStringForKey:@"FAMILY_CHECKLIST_SECTION_UPDATED_DATE" value:&stru_26CA2C800 table:@"Localizable"];
    [v20 stringFromDate:v27];
    long long v32 = v31 = v27;
    uint64_t v87 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v32);

    uint64_t v27 = v31;
  }
  else
  {
    uint64_t v87 = 0;
  }
  uint64_t v33 = *MEMORY[0x263F602D0];
  [v19 setProperty:v89 forKey:*MEMORY[0x263F602D0]];
  uint64_t v34 = *MEMORY[0x263F60140];
  [v19 setProperty:v90 forKey:*MEMORY[0x263F60140]];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = *MEMORY[0x263F5FFE0];
  [v19 setProperty:v35 forKey:*MEMORY[0x263F5FFE0]];
  if (!v27 || [v27 compare:v88] != -1)
  {
    uint64_t v37 = [(FAChecklistViewController *)self checklistStore];
    if (([v37 screenTimeEnabledForChild:v4] & 1) != 0
      || ([v4 hasAskToBuyEnabled] & 1) != 0)
    {

LABEL_9:
      v38 = NSString;
      uint64_t v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v40 = [v39 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_SETUP_DONE" value:&stru_26CA2C800 table:@"Localizable"];
      uint64_t v41 = [v4 firstName];
      v42 = objc_msgSend(v38, "stringWithFormat:", v40, v41);

      [v19 setCellType:1];
      uint64_t v43 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
      [v19 setProperty:v43 forKey:*MEMORY[0x263F602A8]];

      v44 = (void *)v84;
      [v19 setProperty:v84 forKey:@"childDsidKey"];
      v45 = [v4 altDSID];
      [v19 setProperty:v45 forKey:@"childAltDsidKey"];

      id v46 = (void *)v87;
      if (v87) {
        [v19 setProperty:v87 forKey:*MEMORY[0x263F60120]];
      }
      [v19 setProperty:v42 forKey:*MEMORY[0x263F602C8]];
      [v19 setButtonAction:sel__reviewPresetsWasTapped_];
      uint64_t v47 = (void *)v85;
      v93[0] = v85;
      v93[1] = v19;
      v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
      v49 = v82;
      goto LABEL_22;
    }
    uint64_t v77 = v36;
    uint64_t v78 = v33;
    if ([(NSSet *)self->_membersWithLocation count])
    {
      membersWithLocation = self->_membersWithLocation;
      v62 = [v4 appleID];
      LODWORD(membersWithLocation) = [(NSSet *)membersWithLocation containsObject:v62];

      if (membersWithLocation) {
        goto LABEL_9;
      }
    }
    else
    {
    }
LABEL_21:
    uint64_t v63 = NSString;
    uint64_t v64 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v64 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_CARD_DESCRIPTION_UNSET" value:&stru_26CA2C800 table:@"Localizable"];
    v66 = v65 = v27;
    int v67 = [v4 firstName];
    uint64_t v68 = objc_msgSend(v63, "localizedStringWithFormat:", v66, v67);

    uint64_t v27 = v65;
    v42 = (void *)v68;

    v69 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v70 = [v69 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_SETUP" value:&stru_26CA2C800 table:@"Localizable"];

    uint64_t v71 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v70 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v19 setProperty:v42 forKey:*MEMORY[0x263F602C8]];
    [v71 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    v44 = (void *)v84;
    [v71 setProperty:v84 forKey:@"childDsidKey"];
    objc_super v72 = [v4 altDSID];
    [v71 setProperty:v72 forKey:@"childAltDsidKey"];

    [v71 setProperty:v70 forKey:v78];
    [v71 setProperty:objc_opt_class() forKey:v77];
    [v71 setButtonAction:sel__reviewPresetsWasTapped_];
    uint64_t v47 = (void *)v85;
    v91[0] = v85;
    v91[1] = v19;
    v91[2] = v71;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:3];

    v49 = v82;
    id v46 = (void *)v87;
    goto LABEL_22;
  }
  uint64_t v77 = v36;
  uint64_t v78 = v33;
  if ([v27 compare:v88] != -1) {
    goto LABEL_21;
  }
  v50 = [(FAChecklistViewController *)self checklistStore];
  int v51 = [v50 screenTimeEnabledForChild:v4];

  if (!v51) {
    goto LABEL_21;
  }
  v52 = NSString;
  v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v53 = [v75 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_CARD_DESCRIPTION_OLD" value:&stru_26CA2C800 table:@"Localizable"];
  v54 = [v4 firstName];
  uint64_t v74 = [v4 age];
  v55 = v52;
  v56 = (void *)v53;
  v42 = objc_msgSend(v55, "stringWithFormat:", v53, v54, v74);

  v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v58 = [v57 localizedStringForKey:@"FAMILY_CHECKLIST_CHILD_SETUP_UPDATE" value:&stru_26CA2C800 table:@"Localizable"];

  v76 = (void *)v58;
  uint64_t v59 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v58 target:self set:0 get:0 detail:0 cell:13 edit:0];
  v49 = v82;
  [v82 setProperty:v89 forKey:v78];
  [v82 setProperty:v90 forKey:v34];
  [v82 setProperty:objc_opt_class() forKey:v77];
  [v82 setProperty:v42 forKey:*MEMORY[0x263F602C8]];
  [v82 setIdentifier:@"checkScreenTimeSettings"];
  if (v87) {
    [v82 setProperty:v87 forKey:*MEMORY[0x263F60120]];
  }
  [v59 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
  v44 = (void *)v84;
  [v59 setProperty:v84 forKey:@"childDsidKey"];
  v60 = [v4 altDSID];
  [v59 setProperty:v60 forKey:@"childAltDsidKey"];

  id v46 = (void *)v87;
  [v59 setProperty:v58 forKey:v78];
  [v59 setProperty:objc_opt_class() forKey:v77];
  [v59 setButtonAction:sel__reviewPresetsWasTapped_];
  uint64_t v47 = (void *)v85;
  v92[0] = v85;
  v92[1] = v82;
  v92[2] = v59;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:3];

LABEL_22:
  return v48;
}

- (id)_custodianContactSpecifiers
{
  v65[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_CONTACT_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_CONTACTS_SETUP" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v9 = (void *)MEMORY[0x263F827E8];
  long long v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v62 = [v9 imageNamed:@"RecoveryContactsIcon" inBundle:v10];

  uint64_t v63 = objc_msgSend(MEMORY[0x263F08790], "fa_checklistDateFormatter");
  uint64_t v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"custodian"];
  long long v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];
  id v61 = objc_alloc_init(MEMORY[0x263F08A30]);
  long long v14 = objc_msgSend(NSNumber, "numberWithInt:", -[NSArray count](self->_custodians, "count"));
  v60 = [v14 stringValue];

  custodians = self->_custodians;
  if (custodians && [(NSArray *)custodians count])
  {
    uint64_t v16 = [MEMORY[0x263F290F0] sharedInstance];
    uint64_t v53 = [v16 primaryAuthKitAccount];
    v54 = v16;
    uint64_t v17 = objc_msgSend(v16, "custodianLastModifiedForAccount:");
    v55 = (void *)v11;
    v52 = v17;
    if (v17)
    {
      uint64_t v18 = (void *)MEMORY[0x263EFF910];
      [v17 doubleValue];
      uint64_t v59 = [v18 dateWithTimeIntervalSince1970:v19 / 1000.0];
    }
    else
    {
      uint64_t v59 = 0;
    }
    v56 = v8;
    uint64_t v58 = v4;
    NSUInteger v28 = [(NSArray *)self->_custodians count];
    id v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v30 = v29;
    v57 = v6;
    if (v28 == 1)
    {
      int v51 = [v29 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_SINGLE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

      v31 = [(NSArray *)self->_custodians lastObject];
      long long v32 = [v31 firstName];

      uint64_t v33 = NSString;
      uint64_t v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v35 = v34;
      if (v32)
      {
        uint64_t v36 = [v34 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_UPDATED" value:&stru_26CA2C800 table:@"Localizable"];
        uint64_t v37 = [v63 stringFromDate:v59];
        objc_msgSend(v33, "localizedStringWithFormat:", v36, v32, v37);
      }
      else
      {
        uint64_t v36 = [v34 localizedStringForKey:@"FAMILY_CHECKLIST_SECTION_UPDATED_DATE" value:&stru_26CA2C800 table:@"Localizable"];
        uint64_t v37 = [v63 stringFromDate:v59];
        objc_msgSend(v33, "localizedStringWithFormat:", v36, v37, v49);
      uint64_t v41 = };

      uint64_t v39 = v59;
      uint64_t v40 = (__CFString *)v41;
    }
    else
    {
      int v51 = [v29 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_ALTERNATE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];

      v38 = NSString;
      long long v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v35 = [v32 localizedStringForKey:@"FAMILY_CHECKLIST_SECTION_UPDATED_DATE" value:&stru_26CA2C800 table:@"Localizable"];
      uint64_t v39 = v59;
      uint64_t v36 = [v63 stringFromDate:v59];
      objc_msgSend(v38, "localizedStringWithFormat:", v35, v36);
      uint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    if (v39)
    {
      v50 = v40;
    }
    else
    {

      v50 = &stru_26CA2C800;
    }
    v42 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:0 cell:4 edit:0];
    uint64_t v43 = NSString;
    v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v45 = [v44 localizedStringForKey:@"FAMILY_CHECKLIST_CUSTODIAN_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];
    id v46 = objc_msgSend(v43, "localizedStringWithFormat:", v45, -[NSArray count](self->_custodians, "count"));

    uint64_t v20 = (void *)v62;
    [v42 setProperty:v62 forKey:*MEMORY[0x263F60140]];
    [v42 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v42 setProperty:v51 forKey:*MEMORY[0x263F602D0]];
    [v42 setCellType:1];
    uint64_t v47 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [v42 setProperty:v47 forKey:*MEMORY[0x263F602A8]];

    [v42 setProperty:v50 forKey:*MEMORY[0x263F60120]];
    [v42 setProperty:v46 forKey:*MEMORY[0x263F602C8]];
    [v42 setButtonAction:sel__setupCustodianTapped_];
    v26 = v55;
    v65[0] = v55;
    v65[1] = v42;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];

    uint64_t v6 = v57;
    id v4 = v58;
    uint64_t v8 = v56;
  }
  else
  {
    uint64_t v20 = (void *)v62;
    [v12 setProperty:v62 forKey:*MEMORY[0x263F60140]];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = *MEMORY[0x263F5FFE0];
    [v12 setProperty:v21 forKey:*MEMORY[0x263F5FFE0]];
    uint64_t v23 = (void *)v11;
    uint64_t v24 = *MEMORY[0x263F602D0];
    [v12 setProperty:v4 forKey:*MEMORY[0x263F602D0]];
    [v12 setProperty:v6 forKey:*MEMORY[0x263F602C8]];
    [v13 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    uint64_t v25 = v24;
    v26 = v23;
    [v13 setProperty:v8 forKey:v25];
    [v13 setProperty:objc_opt_class() forKey:v22];
    [v13 setButtonAction:sel__setupCustodianTapped_];
    v64[0] = v23;
    v64[1] = v12;
    v64[2] = v13;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:3];
  }

  return v27;
}

- (id)_icloudPlusSpecifiers:(id)a3
{
  v62[2] = *MEMORY[0x263EF8340];
  id v58 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_CARD" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_SHARED" value:&stru_26CA2C800 table:@"Localizable"];

  uint64_t v8 = NSString;
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v10 = [v9 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_NON_SUBSCRIBER" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, self->_organizerName);

  long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_SETUP" value:&stru_26CA2C800 table:@"Localizable"];

  long long v14 = (void *)MEMORY[0x263F827E8];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v14 imageNamed:@"iCloudStorageIcon" inBundle:v15];

  uint64_t v55 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"icloudPlus"];
  uint64_t v59 = (void *)v5;
  uint64_t v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v57 = (void *)v7;
  uint64_t v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v56 = (void *)v11;
  double v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];
  uint64_t v21 = [(FAChecklistViewController *)self checklistStore];
  uint64_t v22 = [v21 countMembersIcloudPlus];

  if (v22)
  {
    v52 = v20;
    uint64_t v53 = (void *)v16;
    v54 = v13;
    int v23 = [v58 isOrganizer];
    uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v25 = v24;
    if (v23)
    {
      uint64_t v26 = [v24 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION_SHARED" value:&stru_26CA2C800 table:@"Localizable"];

      int v51 = v19;
      uint64_t v27 = NSString;
      NSUInteger v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v29 = [v28 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_SHARING_INFO" value:&stru_26CA2C800 table:@"Localizable"];
      long long v30 = [(FAChecklistViewController *)self checklistStore];
      uint64_t v31 = [v30 countMembersIcloudPlus] - 1;
      long long v32 = [(FAChecklistViewController *)self familyCircle];
      uint64_t v33 = [v32 members];
      uint64_t v34 = objc_msgSend(v27, "localizedStringWithFormat:", v29, v31, objc_msgSend(v33, "count") - 1);

      uint64_t v35 = (void *)v26;
      uint64_t v36 = v53;
      [v18 setProperty:v53 forKey:*MEMORY[0x263F60140]];
      [v18 setProperty:v59 forKey:*MEMORY[0x263F602D0]];
      [v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v18 setCellType:1];
      uint64_t v37 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
      [v18 setProperty:v37 forKey:*MEMORY[0x263F602A8]];

      v38 = v58;
      [v18 setProperty:v34 forKey:*MEMORY[0x263F60120]];
      [v18 setProperty:v26 forKey:*MEMORY[0x263F602C8]];
      [v18 setButtonAction:sel__setupIcloudPlusWasTapped_];
      uint64_t v39 = (void *)v55;
      v62[0] = v55;
      v62[1] = v18;
      uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];

      uint64_t v41 = v51;
      uint64_t v20 = v52;
      uint64_t v13 = v54;
      goto LABEL_7;
    }
    uint64_t v35 = [v24 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION_NON_SUBSCRIBER" value:&stru_26CA2C800 table:@"Localizable"];

    uint64_t v36 = (void *)v16;
    [v19 setProperty:v16 forKey:*MEMORY[0x263F60140]];
    [v19 setProperty:v59 forKey:*MEMORY[0x263F602D0]];
    [v19 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v19 setCellType:1];
    [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    uint64_t v49 = v48 = v19;
    [v48 setProperty:v49 forKey:*MEMORY[0x263F602A8]];

    uint64_t v41 = v48;
    [v48 setProperty:v35 forKey:*MEMORY[0x263F602C8]];
    [v48 setButtonAction:sel__setupIcloudPlusWasTapped_];
    uint64_t v39 = (void *)v55;
    v61[0] = v55;
    v61[1] = v48;
    uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  }
  else
  {
    v42 = v19;
    uint64_t v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v35 = [v43 localizedStringForKey:@"FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];

    uint64_t v36 = (void *)v16;
    [v17 setProperty:v16 forKey:*MEMORY[0x263F60140]];
    uint64_t v44 = *MEMORY[0x263F602D0];
    [v17 setProperty:v59 forKey:*MEMORY[0x263F602D0]];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = *MEMORY[0x263F5FFE0];
    [v17 setProperty:v45 forKey:*MEMORY[0x263F5FFE0]];
    [v17 setProperty:v35 forKey:*MEMORY[0x263F602C8]];
    [v20 setProperty:&unk_26CA52620 forKey:*MEMORY[0x263F5FEF0]];
    uint64_t v47 = v44;
    uint64_t v41 = v42;
    [v20 setProperty:v13 forKey:v47];
    [v20 setProperty:objc_opt_class() forKey:v46];
    [v20 setButtonAction:sel__setupIcloudPlusWasTapped_];
    uint64_t v39 = (void *)v55;
    v60[0] = v55;
    v60[1] = v17;
    v60[2] = v20;
    uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  }
  v38 = v58;
LABEL_7:

  return v40;
}

- (id)specifiers
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = [(FAChecklistViewController *)self familyCircle];
  uint64_t v5 = [v4 members];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    uint64_t v40 = *(void *)v56;
    uint64_t v41 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v42 = v7;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        if ([v10 isMe] && objc_msgSend(v10, "isParent"))
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v11 = self->_listOfChildren;
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v52;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v52 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
                uint64_t v17 = [(FAChecklistViewController *)self checklistStore];
                int v18 = [v17 screenTimeEnabledForChild:v16];

                if (v18)
                {
                  double v19 = [(FAChecklistViewController *)self _childCommunicationLimitsForContactManagement:v16];
                  [v3 addObjectsFromArray:v19];
                }
                uint64_t v20 = [(FAChecklistViewController *)self _childPresetSpecifiers:v16];
                [v3 addObjectsFromArray:v20];
              }
              uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v51 objects:v61 count:16];
            }
            while (v13);
          }

          uint64_t v8 = v40;
          uint64_t v5 = v41;
          uint64_t v7 = v42;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v7);
  }

  if (!self->_deviceType)
  {
    uint64_t v21 = [(FAChecklistViewController *)self _medicalSpecifiersWithMedicalIDData];
    [v3 addObjectsFromArray:v21];
  }
  uint64_t v22 = [(FAChecklistViewController *)self _locationSpecifiersWithSharedCount:self->_countMembersWithLocation];
  [v3 addObjectsFromArray:v22];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  int v23 = [(FAChecklistViewController *)self familyCircle];
  uint64_t v24 = [v23 members];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v48;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        if ([(ACAccount *)self->_appleAccount aa_isCloudSubscriber]
          && [v29 isMe])
        {
          long long v30 = [(FAChecklistViewController *)self _icloudPlusSpecifiers:v29];
          [v3 addObjectsFromArray:v30];

          goto LABEL_33;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v31 = [(FAChecklistViewController *)self familyCircle];
  long long v32 = [v31 members];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v44;
    while (2)
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        if ([v37 isMe]
          && (![v37 memberType] || objc_msgSend(v37, "memberType") == 1))
        {
          v38 = [(FAChecklistViewController *)self _custodianContactSpecifiers];
          [v3 addObjectsFromArray:v38];

          goto LABEL_45;
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v59 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
LABEL_45:

  objc_storeStrong((id *)&self->_specifiers, v3);
  return v3;
}

- (void)_fetchScreenTimeModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)getSTManagementStateClass());
  uint64_t v8 = [v6 dsid];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke;
  v10[3] = &unk_26434A258;
  id v11 = v5;
  id v9 = v5;
  [v7 lastModifcationDateForDSID:v8 completionHandler:v10];
}

void __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2;
  block[3] = &unk_26434A230;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchCommunicationLimitsModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)getSTManagementStateClass());
  uint64_t v8 = [v6 dsid];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke;
  v10[3] = &unk_26434A258;
  id v11 = v5;
  id v9 = v5;
  [v7 lastCommunicationLimitsModifcationDateForDSID:v8 completionHandler:v10];
}

void __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2;
  block[3] = &unk_26434A230;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_childContactsRecord:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFEA58] storeForFamilyMember:a3];
  uint64_t v4 = *MEMORY[0x263EFDFB8];
  v14[0] = *MEMORY[0x263EFDFC8];
  v14[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFDF80];
  v14[2] = *MEMORY[0x263EFE070];
  v14[3] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  uint64_t v7 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  uint64_t v8 = [v6 arrayByAddingObject:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFEA18]) initWithKeysToFetch:v8];
  uint64_t v13 = 0;
  long long v10 = [v3 executeFetchRequest:v9 error:&v13];
  id v11 = [v10 value];

  return v11;
}

- (int)_contactsStatusForChild:(id)a3
{
  id v3 = [MEMORY[0x263EFEA58] storeForFamilyMember:a3];
  id v4 = objc_alloc(MEMORY[0x263EFEA18]);
  uint64_t v5 = (void *)[v4 initWithKeysToFetch:MEMORY[0x263EFFA68]];
  id v21 = 0;
  uint64_t v6 = [v3 contactCountForFetchRequest:v5 error:&v21];
  id v7 = v21;
  int v8 = [v6 unsignedIntValue];
  BOOL v9 = v8 != 0;
  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    [v5 setShouldFailIfAccountNotYetSynced:1];
    id v20 = 0;
    id v11 = [v3 contactCountForFetchRequest:v5 error:&v20];
    id v7 = v20;

    int v12 = [v11 unsignedIntValue];
    BOOL v9 = v12 != 0;
    uint64_t v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(FAChecklistViewController *)v12 != 0 _contactsStatusForChild:v13];
    }

    uint64_t v6 = v11;
  }
  if (v7 || !v9)
  {
    if (v7) {
      int v15 = 1;
    }
    else {
      int v15 = v9;
    }
    if (v15 != 1)
    {
      int v14 = 4;
      goto LABEL_26;
    }
    uint64_t v16 = [v7 domain];
    if ([v16 isEqual:*MEMORY[0x263EFE180]])
    {
      uint64_t v17 = [v7 code];

      if (v17 == 1007)
      {
        int v18 = _FALogSystem();
        int v14 = 2;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[FAChecklistViewController _contactsStatusForChild:](v18);
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    int v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FAChecklistViewController _contactsStatusForChild:]();
    }
    int v14 = 3;
    goto LABEL_25;
  }
  int v14 = 5;
LABEL_26:

  return v14;
}

- (void)_fetchPresetsForChild:(id)a3 andCompletionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x263F3BFE0];
  id v7 = a3;
  int v8 = (void *)[[v6 alloc] initWithFamilyMemberAltDSID:v7];

  BOOL v9 = [v8 fetchPresets];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke;
  v11[3] = &unk_26434A280;
  id v12 = v5;
  id v10 = v5;
  [v9 onComplete:v11];
}

void __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2;
  block[3] = &unk_26434A230;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_manageChildContactsWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FamilyChecklistAnalytics shared];
  [v5 sendCommLimitsAnalyticsEvent];

  uint64_t v6 = [v4 propertyForKey:@"childDsidKey"];

  id v8 = +[FAScreenTimeCommunicationLimitsViewControllerProvider communicationLimitsViewControllerForDSID:v6];

  uint64_t v7 = [(FAChecklistViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)_shareMyLocationButtonWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FamilyChecklistAnalytics shared];
  [v5 sendLocationSharingAnalyticsEvent];

  locationViewModel = self->_locationViewModel;
  uint64_t v7 = [(FAChecklistViewController *)self profilePictureStore];
  id v8 = +[FASwiftUIHostingControllerProvider getLocationViewControllerWithViewModel:locationViewModel pictureStore:v7 hackfromObjC:1];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"LOCATION" value:&stru_26CA2C800 table:@"Localizable"];
  id v11 = [v8 navigationItem];
  [v11 setTitle:v10];

  id v12 = [v8 navigationItem];
  [v12 setStyle:0];

  id v13 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeSharedService"];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__6;
  uint64_t v27 = __Block_byref_object_dispose__6;
  NSUInteger v28 = objc_alloc_init(FACircleStateController);
  int v14 = NSURL;
  int v15 = [(FAChecklistViewController *)self checklistStore];
  uint64_t v16 = [v15 locationSharedService];
  uint64_t v17 = [v16 actionURLString];
  int v18 = [v14 URLWithString:v17];

  [(id)v24[5] setPresenter:self];
  [(id)v24[5] setModalPresentationStyle:-2];
  double v19 = [(FAChecklistStore *)self->_checklistStore familyCircle];
  LODWORD(v16) = [v19 showLocationSplashScreen];

  if (v16)
  {
    [(FACircleContext *)v13 setUrlForContext:v18];
    id v20 = (void *)v24[5];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke;
    v22[3] = &unk_26434A2A8;
    v22[4] = &v23;
    [v20 performWithContext:v13 completion:v22];
  }
  else
  {
    id v21 = [(FAChecklistViewController *)self navigationController];
    [v21 pushViewController:v8 animated:1];
  }
  _Block_object_dispose(&v23, 8);
}

void __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  if (([v3 loadSuccess] & 1) == 0)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke_cold_1(v3);
    }
  }
}

- (void)_updateMedicalIDButtonWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FamilyChecklistAnalytics shared];
  [v5 sendEmergencyContactsAnalyticsEvent];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v6 = (void *)getHKMedicalIDViewControllerClass_softClass_0;
  uint64_t v14 = getHKMedicalIDViewControllerClass_softClass_0;
  if (!getHKMedicalIDViewControllerClass_softClass_0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getHKMedicalIDViewControllerClass_block_invoke_0;
    v10[3] = &unk_264348998;
    void v10[4] = &v11;
    __getHKMedicalIDViewControllerClass_block_invoke_0((uint64_t)v10);
    uint64_t v6 = (void *)v12[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v11, 8);
  id v8 = (void *)[[v7 alloc] initInEditMode:1];
  [v8 setHealthStore:self->_healthStore];
  [v8 setMedicalIDStore:self->_medicalIDStore];
  [v8 setMedicalID:self->_medicalIDData];
  [v8 setAllowsEditing:1];
  [v8 setShouldShowHints:1];
  [v8 setShowsDeleteButton:0];
  [v8 setShowsEditMedicalIDRowInViewMode:1];
  [v8 setDelegate:self];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [v9 setModalInPresentation:1];
  [(FAChecklistViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_reviewPresetsWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FamilyChecklistAnalytics shared];
  [v5 sendChildSettingsAnalyticsEvent];

  uint64_t v6 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeFamilyRepair"];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  uint64_t v17 = objc_alloc_init(FACircleStateController);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(id)v13[5] setPresenter:self];
  [(id)v13[5] setModalPresentationStyle:-2];
  id v8 = [v4 propertyForKey:@"childDsidKey"];
  [v7 setObject:v8 forKeyedSubscript:@"memberId"];

  uint64_t v9 = [v4 propertyForKey:@"childAltDsidKey"];
  [v7 setObject:v9 forKeyedSubscript:@"altDSID"];

  [v7 setObject:@"FamilyChecklist" forKeyedSubscript:@"requester"];
  if ([v7 count]) {
    [(FACircleContext *)v6 setAdditionalParameters:v7];
  }
  id v10 = (void *)v13[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke;
  v11[3] = &unk_26434A118;
  void v11[4] = self;
  v11[5] = &v12;
  [v10 performWithContext:v6 completion:v11];

  _Block_object_dispose(&v12, 8);
}

void __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  if ([v3 loadSuccess])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_670;
    v9[3] = &unk_2643489F8;
    void v9[4] = v6;
    [v6 _updateScreenTimeSpecifierThen:v9];
  }
  else
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 error];
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch family repair flow %@", buf, 0xCu);
    }
  }
}

uint64_t __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_670(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_2;
  v4[3] = &unk_2643489F8;
  v4[4] = v2;
  return [v2 _updateCommunicationLimitsSpecifierThen:v4];
}

void __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) checklistStore];
  [v1 notifyObservable];
}

- (void)_setupCustodianTapped:(id)a3
{
  uint64_t v4 = +[FamilyChecklistAnalytics shared];
  [v4 sendRecoveryContactsAnalyticsEvent];

  uint64_t v5 = (AAUICustodianSetupFlowController *)[objc_alloc(MEMORY[0x263F25C90]) initWithAccountManager:self->_accountManager];
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v5;

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setDelegate:self];
  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController start];
  id v7 = [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController navigationController];
  [(FAChecklistViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_setupIcloudPlusWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FamilyChecklistAnalytics shared];
  [v5 sendIcloudPlusSharingAnalyticsEvent];

  uint64_t v6 = [(FAChecklistViewController *)self checklistStore];
  id v7 = [v6 icloudPlusUrl];

  if (v7)
  {
    id v8 = [v4 identifier];
    [(FACheckListHostControllerProtocol *)self->_checklistHostController setActiveSpecifierID:v8];

    uint64_t v9 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeSharedService"];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    double v19 = __Block_byref_object_copy__6;
    id v20 = __Block_byref_object_dispose__6;
    id v21 = objc_alloc_init(FACircleStateController);
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v10 setObject:@"FamilyChecklist" forKeyedSubscript:@"requester"];
    if ([v10 count]) {
      [(FACircleContext *)v9 setAdditionalParameters:v10];
    }
    uint64_t v11 = [(FAChecklistViewController *)self checklistStore];
    uint64_t v12 = [v11 icloudPlusUrl];
    [(FACircleContext *)v9 setUrlForContext:v12];

    uint64_t v13 = [(FAChecklistViewController *)self navigationController];
    [(id)v17[5] setPresenter:v13];

    [(id)v17[5] setModalPresentationStyle:-2];
    uint64_t v14 = (void *)v17[5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke;
    v15[3] = &unk_26434A118;
    v15[4] = self;
    void v15[5] = &v16;
    [v14 performWithContext:v9 completion:v15];

    _Block_object_dispose(&v16, 8);
  }
}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 1224) setActiveSpecifierID:0];
  if ([v3 loadSuccess])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_672;
    v8[3] = &unk_2643489F8;
    v8[4] = v6;
    [v6 _updateICloudPlusSpecifierThen:v8];
  }
  else
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_cold_1(v3);
    }
  }
}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_672(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke;
  v3[3] = &unk_2643489F8;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_2643489F8;
  v3[4] = v1;
  return [v1 _updateMedicalSpecifierThen:v3];
}

void __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke;
  v6[3] = &unk_264348AE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) medicalID];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1016);
  *(void *)(v3 + 1016) = v2;

  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke_2;
  v7[3] = &unk_2643489F8;
  v7[4] = v5;
  return [v5 _updateMedicalSpecifierThen:v7];
}

void __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__FAChecklistViewController_medicalIDViewControllerDidFinish___block_invoke;
  v5[3] = &unk_2643489F8;
  v5[4] = self;
  id v4 = a3;
  [(FAChecklistViewController *)self _updateMedicalSpecifierThen:v5];
  [v4 dismissViewControllerAnimated:1 completion:&__block_literal_global_674];
}

void __62__FAChecklistViewController_medicalIDViewControllerDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (([getSOSUtilitiesClass_0() isAllowedToMessageSOSContacts] & 1) == 0) {
    [getSOSUtilitiesClass_0() setAllowedToMessageSOSContacts:1];
  }
  uint64_t v6 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
  if (v6)
  {
    id v7 = [(_HKMedicalIDData *)self->_medicalIDData emergencyContacts];
    id v8 = [v7 arrayByAddingObject:v5];
  }
  else
  {
    v12[0] = v5;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }

  [(_HKMedicalIDData *)self->_medicalIDData setEmergencyContacts:v8];
  medicalIDStore = self->_medicalIDStore;
  medicalIDData = self->_medicalIDData;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke;
  v11[3] = &unk_264349538;
  void v11[4] = self;
  [(HKMedicalIDStore *)medicalIDStore updateMedicalIDData:medicalIDData completion:v11];
}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_cold_1();
    }
  }
  if (a2)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_675;
    v8[3] = &unk_2643489F8;
    v8[4] = v7;
    [v7 _updateMedicalSpecifierThen:v8];
  }
}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_675(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke;
  v5[3] = &unk_2643489F8;
  v5[4] = self;
  id v4 = a3;
  [(FAChecklistViewController *)self _updateCustodianSpecifierThen:v5];
  [v4 dismissViewControllerAnimated:1 completion:&__block_literal_global_678];
}

void __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke_2;
  block[3] = &unk_2643489F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 32) checklistStore];
  [v2 notifyObservable];
}

- (void)reloadSpecifiers
{
  id v3 = [(FAChecklistViewController *)self specifiers];
  [(FACheckListHostControllerProtocol *)self->_checklistHostController setSpecifiers:v3];
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (FAChecklistViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAChecklistViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
}

- (FAProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
}

- (FAChecklistStore)checklistStore
{
  return self->_checklistStore;
}

- (void)setChecklistStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checklistStore, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commLimitsForChildren, 0);
  objc_storeStrong((id *)&self->_parentalControlsForChildren, 0);
  objc_storeStrong((id *)&self->_organizerName, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleLabel, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_checklistHostController, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_commLimitsModifiedRecord, 0);
  objc_storeStrong((id *)&self->_screenTimeModifiedRecord, 0);
  objc_storeStrong((id *)&self->_commLimitsModifiedDate, 0);
  objc_storeStrong((id *)&self->_screenTimeModifiedDate, 0);
  objc_storeStrong((id *)&self->_locationViewModel, 0);
  objc_storeStrong((id *)&self->_icloudPlusUrl, 0);
  objc_storeStrong((id *)&self->_membersWithLocation, 0);
  objc_storeStrong((id *)&self->_custodians, 0);
  objc_storeStrong((id *)&self->_setupClient, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_remoteUIViewController, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_listOfChildren, 0);
  objc_storeStrong((id *)&self->_existingChildPresetResponse, 0);
  objc_storeStrong((id *)&self->_existingChildPresetRecord, 0);
  objc_storeStrong((id *)&self->_childPresetRecord, 0);
  objc_storeStrong((id *)&self->_childrenInFamily, 0);
  objc_storeStrong((id *)&self->_currEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_contactsStatusForChild:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Checklist: Child Contacts not Synced", v1, 2u);
}

- (void)_contactsStatusForChild:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2189F0000, v1, OS_LOG_TYPE_ERROR, "contactCountForFetchRequest: %@ Error: %@", v2, 0x16u);
}

- (void)_contactsStatusForChild:(os_log_t)log .cold.3(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "RETRIED with shouldFailIfAccountNotYetSynced childHasContacts %i,error %@", (uint8_t *)v3, 0x12u);
}

void __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke_cold_1(void *a1)
{
  os_log_t v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2189F0000, v2, v3, "Failed to fetch location flow %@", v4, v5, v6, v7, v8);
}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_cold_1(void *a1)
{
  os_log_t v1 = [a1 error];
  uint64_t v2 = [v1 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2189F0000, v3, v4, "Failed to fetch iCloud+ view %@", v5, v6, v7, v8, v9);
}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2189F0000, v0, v1, "Error updating medicalIDData error: %@", v2, v3, v4, v5, v6);
}

@end