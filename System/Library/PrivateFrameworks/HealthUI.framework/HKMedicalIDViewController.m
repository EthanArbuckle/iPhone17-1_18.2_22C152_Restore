@interface HKMedicalIDViewController
+ (BOOL)isSupportedOnThisDevice;
- (BOOL)_canShowWhileLocked;
- (BOOL)_editable;
- (BOOL)_refreshEmergencyContacts:(BOOL)a3;
- (BOOL)_shouldShowOrganDonation;
- (BOOL)allowsEditing;
- (BOOL)inBridge;
- (BOOL)inEditMode;
- (BOOL)isSecondaryProfileMedicalID;
- (BOOL)modernAppearance;
- (BOOL)shouldShowHints;
- (BOOL)showsDeleteButton;
- (BOOL)showsDismissButton;
- (BOOL)showsEditMedicalIDRowInViewMode;
- (BOOL)showsEmergencyAccessState;
- (BOOL)showsShowWhenLockedState;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKHealthStore)healthStore;
- (HKMedicalIDStore)medicalIDStore;
- (HKMedicalIDViewController)initWithCoder:(id)a3;
- (HKMedicalIDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKMedicalIDViewController)initWithStyle:(int64_t)a3;
- (HKMedicalIDViewControllerDelegate)delegate;
- (NSArray)tableItems;
- (_HKMedicalIDData)medicalID;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_fetchProfileFirstName;
- (id)_formatMedicalIDAccessPoint:(int64_t)a3;
- (id)_newViewForFooterInSection:(int64_t)a3;
- (id)_newViewForHeaderInSection:(int64_t)a3;
- (id)_tableItemForIndexPath:(id)a3;
- (id)initInEditMode:(BOOL)a3;
- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_preferredOrganDonationOrganization;
- (int64_t)_rowIndexForTableItem:(id)a3 atIndexPath:(id)a4;
- (int64_t)internalAccessType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustTableViewContentOffsetForVisibleView:(id)a3 visibleRect:(CGRect)a4 animated:(BOOL)a5;
- (void)_buildEditModeTableItems;
- (void)_buildPresentableTableItems;
- (void)_buildTableItems;
- (void)_buildViewModeTableItems;
- (void)_cancelEditingTapped:(id)a3;
- (void)_contactStoreDidChange:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_dismissMedicalIDEditor;
- (void)_doneEditingTapped:(id)a3;
- (void)_doneTapped:(id)a3;
- (void)_fetchDemographicInformation;
- (void)_forceDisableBiometricIfDeviceLocked;
- (void)_nextButtonTapped:(id)a3;
- (void)_refreshMedicalIDInViewMode;
- (void)_reloadTableWithMedicalIDData:(id)a3;
- (void)_showMedicalIDPreviewAsNext;
- (void)_submitAccessAnalytic;
- (void)_updateMedicalID;
- (void)_updateMedicalIDNameWithDemographicsInformation:(id)a3;
- (void)dealloc;
- (void)deletionTableItemDidTapDelete:(id)a3;
- (void)editButtonTapped:(id)a3;
- (void)editMedicalID:(id)a3;
- (void)editOrganDonation:(id)a3;
- (void)localeDidChange:(id)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
- (void)selectionTableItemDidTap:(id)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInBridge:(BOOL)a3;
- (void)setInEditMode:(BOOL)a3;
- (void)setInternalAccessType:(int64_t)a3;
- (void)setIsSecondaryProfileMedicalID:(BOOL)a3;
- (void)setMedicalID:(id)a3;
- (void)setMedicalIDStore:(id)a3;
- (void)setModernAppearance:(BOOL)a3;
- (void)setShouldShowHints:(BOOL)a3;
- (void)setShowsDeleteButton:(BOOL)a3;
- (void)setShowsDismissButton:(BOOL)a3;
- (void)setShowsEditMedicalIDRowInViewMode:(BOOL)a3;
- (void)setShowsEmergencyAccessState:(BOOL)a3;
- (void)setShowsShowWhenLockedState:(BOOL)a3;
- (void)setTableItems:(id)a3;
- (void)tableItem:(id)a3 heightDidChangeForRowIndex:(int64_t)a4 keepRectVisible:(CGRect)a5 inView:(id)a6;
- (void)tableItemDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5;
- (void)tableItemDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timeZoneDidChange:(id)a3;
- (void)updateEmergencyContactTableItem;
- (void)updateNavigationBar;
- (void)updatePrimaryLanguageTableItem;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKMedicalIDViewController

+ (BOOL)isSupportedOnThisDevice
{
  v2 = [MEMORY[0x1E4F2B098] shared];
  char v3 = [v2 isMedicalIDAvailable];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDViewController;
  v8 = [(HKMedicalIDViewController *)&v11 initWithStyle:1];
  v9 = v8;
  if (v8)
  {
    v8->_inEditMode = a3;
    v8->_inBuddy = a4;
    v8->_organDonationSignupAvailable = a5;
    v8->_showsShowWhenLockedState = 1;
    v8->_showsEmergencyAccessState = 1;
    v8->_showsEditMedicalIDRowInViewMode = 0;
    v8->_inBridge = 0;
    [(HKMedicalIDViewController *)v8 setModernAppearance:[(HKMedicalIDViewController *)v8 inEditMode] ^ 1];
    [(HKMedicalIDViewController *)v9 setModalInPresentation:[(HKMedicalIDViewController *)v9 inEditMode]];
  }
  return v9;
}

- (id)initInEditMode:(BOOL)a3
{
  return [(HKMedicalIDViewController *)self initInEditMode:a3 inBuddy:0 organDonationSignupAvailable:0];
}

- (HKMedicalIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (HKMedicalIDViewController *)[(HKMedicalIDViewController *)self initInEditMode:0 inBuddy:0 organDonationSignupAvailable:0];
}

- (HKMedicalIDViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  return [(HKMedicalIDViewController *)&v4 initWithCoder:a3];
}

- (HKMedicalIDViewController)initWithStyle:(int64_t)a3
{
  return (HKMedicalIDViewController *)[(HKMedicalIDViewController *)self initInEditMode:0];
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
  id v7 = a3;
  v5 = (HKProfileStore *)[objc_alloc(MEMORY[0x1E4F2B360]) initWithHealthStore:v7];
  profileStore = self->_profileStore;
  self->_profileStore = v5;
}

- (void)viewDidLoad
{
  v61.receiver = self;
  v61.super_class = (Class)HKMedicalIDViewController;
  [(HKMedicalIDViewController *)&v61 viewDidLoad];
  [(HKMedicalIDViewController *)self _submitAccessAnalytic];
  self->_tableViewStyle = 1;
  [(HKMedicalIDViewController *)self updateNavigationBar];
  char v3 = [(HKMedicalIDViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BACD20];

  objc_super v4 = [(HKMedicalIDViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BAE580];

  v5 = [(HKMedicalIDViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BB6F60];

  v6 = [(HKMedicalIDViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BAC680];

  id v7 = [(HKMedicalIDViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BADE40];

  v8 = [(HKMedicalIDViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BAE9C0];

  v9 = [(HKMedicalIDViewController *)self tableView];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = +[HKOrganDonationCallToActionTableViewCell defaultReuseIdentifier];
  [v9 registerClass:v10 forCellReuseIdentifier:v11];

  v12 = [(HKMedicalIDViewController *)self tableView];
  uint64_t v13 = objc_opt_class();
  v14 = +[HKIDRegisteredReviewCell defaultReuseIdentifier];
  [v12 registerClass:v13 forCellReuseIdentifier:v14];

  v15 = [(HKMedicalIDViewController *)self tableView];
  uint64_t v16 = objc_opt_class();
  v17 = +[HKOrganDonationRegisteredTableViewCell defaultReuseIdentifier];
  [v15 registerClass:v16 forCellReuseIdentifier:v17];

  v18 = [(HKMedicalIDViewController *)self tableView];
  uint64_t v19 = objc_opt_class();
  v20 = +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier];
  [v18 registerClass:v19 forCellReuseIdentifier:v20];

  v21 = [(HKMedicalIDViewController *)self tableView];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:0x1F3BA4FC0];

  double v22 = *MEMORY[0x1E4FB2F28];
  v23 = [(HKMedicalIDViewController *)self tableView];
  [v23 setRowHeight:v22];

  [(HKMedicalIDViewController *)self _buildTableItems];
  id v24 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v25 = [(HKMedicalIDViewController *)self tableView];
  [v25 setTableFooterView:v24];

  v26 = [(HKMedicalIDViewController *)self tableView];
  objc_msgSend(v26, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);

  v27 = [(HKMedicalIDViewController *)self tableView];
  v28 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1F420);
  [v27 setAccessibilityIdentifier:v28];

  if ([(HKMedicalIDViewController *)self inEditMode])
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelEditingTapped_];
    v30 = [(HKMedicalIDViewController *)self navigationItem];
    [v30 setLeftBarButtonItem:v29];

    LODWORD(v29) = self->_inBuddy;
    id v31 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v32 = v31;
    if (v29)
    {
      v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v34 = [v33 localizedStringForKey:@"OD_NEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v35 = (void *)[v32 initWithTitle:v34 style:2 target:self action:sel__nextButtonTapped_];
      v36 = [(HKMedicalIDViewController *)self navigationItem];
      [v36 setRightBarButtonItem:v35];
    }
    else
    {
      v33 = (void *)[v31 initWithBarButtonSystemItem:0 target:self action:sel__doneEditingTapped_];
      v34 = [(HKMedicalIDViewController *)self navigationItem];
      [v34 setRightBarButtonItem:v33];
    }

    v46 = [(HKMedicalIDViewController *)self tableView];
    [v46 setEstimatedRowHeight:44.0 + 24.0];

    v47 = [(HKMedicalIDViewController *)self tableView];
    [v47 setKeyboardDismissMode:1];

    v48 = [(HKMedicalIDViewController *)self tableView];
    [v48 setEditing:1];

    v49 = [(HKMedicalIDViewController *)self tableView];
    [v49 setAllowsSelectionDuringEditing:1];
    goto LABEL_11;
  }
  v37 = [(HKMedicalIDViewController *)self tableView];
  [v37 setEstimatedRowHeight:44.0];

  v38 = [(HKMedicalIDViewController *)self tableView];
  [v38 _setDrawsSeparatorAtTopOfSections:0];

  v39 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v40 = [(HKMedicalIDViewController *)self tableView];
  [v40 setBackgroundColor:v39];

  v41 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v42 = [(HKMedicalIDViewController *)self tableView];
  [v42 setTableHeaderBackgroundColor:v41];

  v43 = [(HKMedicalIDViewController *)self tableView];
  [v43 _setTopPadding:0.0];

  if (self->_inBuddy)
  {
    id v44 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v45 = sel__doneEditingTapped_;
LABEL_10:
    v49 = (void *)[v44 initWithBarButtonSystemItem:0 target:self action:v45];
    v50 = [(HKMedicalIDViewController *)self navigationItem];
    [v50 setRightBarButtonItem:v49];

LABEL_11:
    goto LABEL_12;
  }
  if (self->_showsDismissButton)
  {
    id v44 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v45 = sel__doneTapped_;
    goto LABEL_10;
  }
LABEL_12:
  v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v51 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v52 addObserver:self selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

  v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v53 addObserver:self selector:sel_timeZoneDidChange_ name:*MEMORY[0x1E4F1C4F8] object:0];

  v54 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v54 addObserver:self selector:sel__contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];

  objc_initWeak(&location, self);
  v55 = (const char *)*MEMORY[0x1E4F2BED0];
  v56 = MEMORY[0x1E4F14428];
  id v57 = MEMORY[0x1E4F14428];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __40__HKMedicalIDViewController_viewDidLoad__block_invoke;
  v58[3] = &unk_1E6D54168;
  objc_copyWeak(&v59, &location);
  notify_register_dispatch(v55, &self->_medicalIDChangedToken, v56, v58);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
}

void __40__HKMedicalIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshMedicalIDInViewMode];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_medicalIDChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  [(HKMedicalIDViewController *)&v4 dealloc];
}

- (void)updateNavigationBar
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if ([(HKMedicalIDViewController *)self allowsEditing])
  {
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
    {
      objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editButtonTapped_];
      v5 = [(HKMedicalIDViewController *)self navigationItem];
      [v5 setRightBarButtonItem:v4];

      if ([MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
      {
        v6 = [(HKMedicalIDViewController *)self navigationItem];
        id v7 = [v6 rightBarButtonItem];
        [v7 setEnabled:0];
      }
    }
  }
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"medical_id_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  if ([(HKMedicalIDViewController *)self isSecondaryProfileMedicalID])
  {
    uint64_t v10 = [(_HKMedicalIDData *)self->_medicalID name];

    if (v10)
    {
      objc_super v11 = NSString;
      v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v13 = [v12 localizedStringForKey:@"%@_medical_id_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v14 = [(_HKMedicalIDData *)self->_medicalID name];
      uint64_t v15 = objc_msgSend(v11, "stringWithFormat:", v13, v14);

      v9 = (void *)v15;
    }
  }
  uint64_t v16 = [(HKMedicalIDViewController *)self title];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v9;
  }
  uint64_t v19 = [@" " stringByAppendingString:v18];

  v20 = (void *)MEMORY[0x1E4FB1818];
  v21 = HKHealthUIFrameworkBundle();
  double v22 = [v20 imageNamed:@"medicalid_header_glyph" inBundle:v21];

  v23 = [MEMORY[0x1E4FB1618] systemRedColor];
  id v24 = [v22 _flatImageWithColor:v23];

  v25 = [(HKMedicalIDViewController *)self navigationController];
  v26 = [v25 navigationBar];
  v27 = [v26 _defaultTitleFont];

  if (!v27)
  {
    v27 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB2908]);
  }
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  v37[0] = v27;
  uint64_t v29 = *MEMORY[0x1E4FB0700];
  v36[0] = v28;
  v36[1] = v29;
  v30 = [MEMORY[0x1E4FB1618] labelColor];
  v37[1] = v30;
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

  v32 = [(HKMedicalIDViewController *)self tableView];
  UIRoundToViewScale();
  v33 = objc_msgSend(v19, "hk_attributedStringPrefixedWithImage:baselineAdjusted:withAttributes:", v24, v31);

  id v34 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v34 setAttributedText:v33];
  [v34 sizeToFit];
  v35 = [(HKMedicalIDViewController *)self navigationItem];
  [v35 setTitleView:v34];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = self->_footers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "updateFont", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9 = [(HKMedicalIDViewController *)self tableView];
  [v9 reloadData];
}

- (void)localeDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_localeItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "localeDidChange:", v4, (void)v12);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  long long v11 = [(HKMedicalIDViewController *)self tableView];
  [v11 reloadData];
}

- (void)timeZoneDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_localeItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "timeZoneDidChange:", v4, (void)v12);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  long long v11 = [(HKMedicalIDViewController *)self tableView];
  [v11 reloadData];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  [(HKMedicalIDViewController *)&v4 viewWillAppear:a3];
  [(HKMedicalIDViewController *)self _reloadTableWithMedicalIDData:self->_medicalID];
  [(HKMedicalIDViewController *)self _forceDisableBiometricIfDeviceLocked];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 medicalIDViewControllerDidAppear:self];
  }
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalIDViewController;
  [(HKMedicalIDViewController *)&v9 viewDidAppear:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)_fetchDemographicInformation
{
  uint64_t v3 = [(_HKMedicalIDData *)self->_medicalID name];
  if (!v3
    || (objc_super v4 = (void *)v3,
        [(_HKMedicalIDData *)self->_medicalID name],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    objc_initWeak(&location, self);
    BOOL isSecondaryProfileMedicalID = self->_isSecondaryProfileMedicalID;
    id v8 = [(HKMedicalIDViewController *)self healthStore];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke;
    v9[3] = &unk_1E6D54190;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "hk_fetchExistingDemographicInformationWithOptions:completion:", isSecondaryProfileMedicalID, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 145))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke_2;
    v6[3] = &unk_1E6D513B0;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMedicalIDNameWithDemographicsInformation:*(void *)(a1 + 40)];
}

- (void)_updateMedicalIDNameWithDemographicsInformation:(id)a3
{
  id v16 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v5 = [v16 firstName];
  [v4 setGivenName:v5];

  uint64_t v6 = [v16 lastName];
  [v4 setFamilyName:v6];

  id v7 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:2 options:0];
  uint64_t v8 = [v7 length];
  BOOL v9 = v8 != 0;
  if (v8)
  {
    [(_HKMedicalIDData *)self->_medicalID setName:v7];
    [(HKEmergencyCardNameAndPictureTableItem *)self->_nameAndPictureItem setData:self->_medicalID];
  }
  id v10 = [v16 dateOfBirthComponents];
  if (v10)
  {
    [(_HKMedicalIDData *)self->_medicalID setGregorianBirthday:v10];
    BOOL v9 = 1;
  }
  long long v11 = [v16 bloodTypeObject];
  uint64_t v12 = [v11 bloodType];

  if (v12)
  {
    [(_HKMedicalIDData *)self->_medicalID setBloodType:v12];
    BOOL v9 = 1;
  }
  long long v13 = [v16 heightQuantity];
  if (v13)
  {
    [(_HKMedicalIDData *)self->_medicalID setHeight:v13];
    BOOL v9 = 1;
  }
  long long v14 = [v16 weightQuantity];
  if (v14)
  {
    [(_HKMedicalIDData *)self->_medicalID setWeight:v14];
  }
  else if (!v9)
  {
    goto LABEL_13;
  }
  long long v15 = [(HKMedicalIDViewController *)self tableView];
  [v15 reloadData];

LABEL_13:
}

- (void)_reloadTableWithMedicalIDData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (_HKMedicalIDData *)a3;
  medicalID = self->_medicalID;
  if (v4)
  {
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = (_HKMedicalIDData *)objc_alloc_init(MEMORY[0x1E4F2B920]);
    [(HKMedicalIDViewController *)self _fetchDemographicInformation];
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
    {
      id v7 = [(_HKMedicalIDData *)v6 isOrganDonor];

      if (!v7) {
        [(_HKMedicalIDData *)v6 setIsOrganDonor:&unk_1F3C21D18];
      }
    }
  }
  if (self->_medicalID != v6) {
    objc_storeStrong((id *)&self->_medicalID, v6);
  }
  uint64_t v8 = [(HKMedicalIDViewController *)self _fetchProfileFirstName];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v9 = [(HKMedicalIDViewController *)self tableItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v15 = [(HKMedicalIDViewController *)self medicalID];
        [v14 setData:v15];

        [v14 setProfileFirstName:v8];
        [v14 setOwningViewController:self];
        objc_msgSend(v14, "setShouldShowHints:", -[HKMedicalIDViewController shouldShowHints](self, "shouldShowHints"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [(HKMedicalIDViewController *)self _refreshEmergencyContacts:medicalID == 0];
  [(HKMedicalIDViewController *)self _buildPresentableTableItems];
  id v16 = [(HKMedicalIDViewController *)self tableView];
  [v16 reloadData];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 medicalIDViewControllerDidUpdate:self];
  }
}

- (void)_contactStoreDidChange:(id)a3
{
  if ([(HKMedicalIDViewController *)self _refreshEmergencyContacts:self->_medicalID == 0]&& ![(HKMedicalIDViewController *)self shouldShowHints])
  {
    [(HKMedicalIDViewController *)self _buildPresentableTableItems];
  }
  id v4 = [(HKMedicalIDViewController *)self tableView];
  [v4 reloadData];
}

- (BOOL)_refreshEmergencyContacts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v6 = [v5 type];

  BOOL v7 = v6 == 1
    && [(_HKMedicalIDData *)self->_medicalID consolidateSOSAndEmergencyContacts];
  int v8 = [(HKEmergencyCardContactsTableItem *)self->_contactsItem refreshFromData:v3] || v7;
  if (v8 == 1 && !self->_inEditMode) {
    [(HKMedicalIDViewController *)self _updateMedicalID];
  }
  return v8;
}

- (void)editButtonTapped:(id)a3
{
  id v4 = a3;
  if ([(HKMedicalIDViewController *)self _shouldShowOrganDonation]
    && (+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable")|| +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))&& +[HKOrganDonationConnectionManager hasStoredRegistrant])
  {
    uint64_t v5 = [(HKMedicalIDViewController *)self medicalID];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
      BOOL v7 = (void *)MEMORY[0x1E4FB1410];
      int v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v9 = [v8 localizedStringForKey:@"EDIT_MEDICAL_ID" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__HKMedicalIDViewController_editButtonTapped___block_invoke;
      v26[3] = &unk_1E6D52790;
      v26[4] = self;
      id v10 = v4;
      id v27 = v10;
      uint64_t v11 = [v7 actionWithTitle:v9 style:0 handler:v26];
      [v6 addAction:v11];

      uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
      long long v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      long long v14 = [v13 localizedStringForKey:@"EDIT_OD" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      long long v22 = __46__HKMedicalIDViewController_editButtonTapped___block_invoke_2;
      long long v23 = &unk_1E6D52790;
      id v24 = self;
      id v25 = v10;
      long long v15 = [v12 actionWithTitle:v14 style:0 handler:&v20];
      objc_msgSend(v6, "addAction:", v15, v20, v21, v22, v23, v24);

      id v16 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      char v18 = [v17 localizedStringForKey:@"EDIT_MEDICAL_ID_OD_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      id v19 = [v16 actionWithTitle:v18 style:1 handler:0];
      [v6 addAction:v19];

      [(HKMedicalIDViewController *)self presentViewController:v6 animated:1 completion:0];
    }
    else
    {
      [(HKMedicalIDViewController *)self editOrganDonation:v4];
    }
  }
  else
  {
    [(HKMedicalIDViewController *)self editMedicalID:v4];
  }
}

uint64_t __46__HKMedicalIDViewController_editButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) editMedicalID:*(void *)(a1 + 40)];
}

uint64_t __46__HKMedicalIDViewController_editButtonTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) editOrganDonation:*(void *)(a1 + 40)];
}

- (void)_cancelEditingTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 medicalIDViewControllerDidCancel:self];
  }
}

- (void)_doneEditingTapped:(id)a3
{
  [(NSArray *)self->_presentableTableItems makeObjectsPerformSelector:sel_commitEditing];
  [(HKMedicalIDViewController *)self _updateMedicalID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 medicalIDViewControllerDidSave:self];
  }
}

- (void)_nextButtonTapped:(id)a3
{
  if (self->_inEditMode)
  {
    [(NSArray *)self->_presentableTableItems makeObjectsPerformSelector:sel_commitEditing];
    [(HKMedicalIDViewController *)self _showMedicalIDPreviewAsNext];
  }
}

- (void)editMedicalID:(id)a3
{
  id v10 = [[HKMedicalIDViewController alloc] initInEditMode:1 inBuddy:self->_inBuddy organDonationSignupAvailable:self->_organDonationSignupAvailable];
  id v4 = [(HKMedicalIDViewController *)self healthStore];
  [v10 setHealthStore:v4];

  char v5 = [(HKMedicalIDViewController *)self medicalIDStore];
  [v10 setMedicalIDStore:v5];

  id v6 = [(HKMedicalIDViewController *)self medicalID];
  id v7 = (void *)[v6 copy];
  [v10 setMedicalID:v7];

  objc_msgSend(v10, "setShowsDeleteButton:", -[HKMedicalIDViewController showsDeleteButton](self, "showsDeleteButton"));
  [v10 setDelegate:self];
  [v10 setInternalAccessType:6];
  objc_msgSend(v10, "setIsSecondaryProfileMedicalID:", -[HKMedicalIDViewController isSecondaryProfileMedicalID](self, "isSecondaryProfileMedicalID"));
  int v8 = [[HKMedicalIDNavigationController alloc] initWithRootViewController:v10];
  [(HKMedicalIDViewController *)self presentViewController:v8 animated:1 completion:0];
  medicalIDEditor = self->_medicalIDEditor;
  self->_medicalIDEditor = v8;
}

- (void)editOrganDonation:(id)a3
{
  id v6 = objc_alloc_init(HKOrganDonationRegisterViewController);
  id v4 = [(HKMedicalIDViewController *)self medicalID];
  [(HKOrganDonationRegisterViewController *)v6 setMedicalIDData:v4];

  char v5 = [[HKMedicalIDNavigationController alloc] initWithRootViewController:v6];
  [(HKMedicalIDViewController *)self presentViewController:v5 animated:1 completion:0];
  [(HKOrganDonationRegisterViewController *)v6 submitOrganDonationFlowImpressionEvent:1];
}

- (void)_doneTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 medicalIDViewControllerDidFinish:self];
  }
}

- (void)_buildTableItems
{
  if ([(HKMedicalIDViewController *)self inEditMode])
  {
    [(HKMedicalIDViewController *)self _buildEditModeTableItems];
  }
  else
  {
    [(HKMedicalIDViewController *)self _buildViewModeTableItems];
  }
}

- (void)_buildEditModeTableItems
{
  v38[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKEmergencyCardTableItem *)[HKEmergencyCardGroupTableItem alloc] initInEditMode:1];
  informationDataGroupItem = self->_informationDataGroupItem;
  self->_informationDataGroupItem = v3;

  char v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  char v6 = [v5 localizedStringForKey:@"information_header" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKEmergencyCardGroupTableItem *)self->_informationDataGroupItem setTitleForHeader:v6];

  id v7 = [[HKEmergencyCardNameAndPictureTableItem alloc] initInEditMode:1];
  nameAndPictureItem = self->_nameAndPictureItem;
  self->_nameAndPictureItem = v7;

  id v9 = [[HKEmergencyCardBirthdateTableItem alloc] initInEditMode:1];
  id v34 = [(HKEmergencyCardTableItem *)[HKEmergencyCardWeightTableItem alloc] initInEditMode:1];
  id v33 = [(HKEmergencyCardTableItem *)[HKEmergencyCardHeightTableItem alloc] initInEditMode:1];
  id v10 = [(HKEmergencyCardTableItem *)[HKEmergencyCardBloodTypeTableItem alloc] initInEditMode:1];
  id v11 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicalConditionsTableItem alloc] initInEditMode:1];
  id v12 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicalNotesTableItem alloc] initInEditMode:1];
  id v13 = [(HKEmergencyCardTableItem *)[HKEmergencyCardAllergyInfoTableItem alloc] initInEditMode:1];
  id v14 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicationInfoTableItem alloc] initInEditMode:1];
  [(HKEmergencyCardNameAndPictureTableItem *)self->_nameAndPictureItem setRowHeightChangeDelegate:self];
  [v11 setRowHeightChangeDelegate:self];
  [v12 setRowHeightChangeDelegate:self];
  [v13 setRowHeightChangeDelegate:self];
  [v14 setRowHeightChangeDelegate:self];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38[0] = self->_nameAndPictureItem;
  v38[1] = v9;
  v32 = v9;
  v38[2] = v11;
  v38[3] = v12;
  v38[4] = v13;
  v38[5] = v14;
  v38[6] = v10;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:7];
  [v15 addObjectsFromArray:v16];

  if ((!self->_inBuddy
     || !+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable])&& !self->_isSecondaryProfileMedicalID)
  {
    id v17 = [(HKEmergencyCardTableItem *)[HKEmergencyCardOrganDonorTableItem alloc] initInEditMode:1];
    [v15 addObject:v17];
  }
  v37[0] = v34;
  v37[1] = v33;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v15 addObjectsFromArray:v18];

  id v19 = [[HKEmergencyCardPrimaryLanguageTableItem alloc] initInEditMode:1];
  primaryLanguageItem = self->_primaryLanguageItem;
  self->_primaryLanguageItem = v19;

  [(HKEmergencyCardPrimaryLanguageTableItem *)self->_primaryLanguageItem setDelegate:self];
  [v15 addObject:self->_primaryLanguageItem];
  [(HKEmergencyCardGroupTableItem *)self->_informationDataGroupItem setSubitems:v15];
  uint64_t v21 = [[HKEmergencyCardContactsTableItem alloc] initInEditMode:1];
  contactsItem = self->_contactsItem;
  self->_contactsItem = v21;

  [(HKEmergencyCardTableItem *)self->_contactsItem setIsSecondaryProfile:self->_isSecondaryProfileMedicalID];
  [(HKEmergencyCardContactsTableItem *)self->_contactsItem setDelegate:self];
  long long v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v24 = self->_contactsItem;
  v36[0] = self->_informationDataGroupItem;
  v36[1] = v24;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [(NSArray *)v23 addObjectsFromArray:v25];

  if (self->_showsEmergencyAccessState || self->_showsShowWhenLockedState)
  {
    id v26 = [[HKEmergencyCardEmergencyAccessTableItem alloc] initInEditMode:1 shouldShowLocked:self->_showsShowWhenLockedState shouldShareInfo:self->_showsEmergencyAccessState];
    [v26 setIsSecondaryProfile:self->_isSecondaryProfileMedicalID];
    [(NSArray *)v23 addObject:v26];
  }
  id v27 = [[HKEmergencyCardDeletionTableItem alloc] initInEditMode:1];
  [v27 setDeletionDelegate:self];
  if (self->_showsDeleteButton) {
    [(NSArray *)v23 addObject:v27];
  }
  tableItems = self->_tableItems;
  self->_tableItems = v23;
  uint64_t v29 = v23;

  v35[0] = v34;
  v35[1] = v33;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  localeItems = self->_localeItems;
  self->_localeItems = v30;
}

- (void)_buildViewModeTableItems
{
  v38[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKEmergencyCardTableItem *)[HKEmergencyCardGroupTableItem alloc] initInEditMode:0];
  informationDataGroupItem = self->_informationDataGroupItem;
  self->_informationDataGroupItem = v3;

  char v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  char v6 = [v5 localizedStringForKey:@"information_header" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKEmergencyCardGroupTableItem *)self->_informationDataGroupItem setTitleForHeader:v6];

  id v7 = [[HKEmergencyCardSummaryTableItem alloc] initInEditMode:0];
  id v8 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicalConditionsTableItem alloc] initInEditMode:0];
  id v9 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicalNotesTableItem alloc] initInEditMode:0];
  id v10 = [(HKEmergencyCardTableItem *)[HKEmergencyCardAllergyInfoTableItem alloc] initInEditMode:0];
  id v11 = [(HKEmergencyCardTableItem *)[HKEmergencyCardMedicationInfoTableItem alloc] initInEditMode:0];
  id v12 = [(HKEmergencyCardTableItem *)[HKEmergencyCardBloodTypeTableItem alloc] initInEditMode:0];
  id v13 = [(HKEmergencyCardTableItem *)[HKEmergencyCardWeightTableItem alloc] initInEditMode:0];
  id v14 = [(HKEmergencyCardTableItem *)[HKEmergencyCardHeightTableItem alloc] initInEditMode:0];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = v7;
  v38[0] = v7;
  v38[1] = v8;
  id v34 = v8;
  v38[2] = v9;
  v38[3] = v10;
  v38[4] = v11;
  v38[5] = v12;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
  [v15 addObjectsFromArray:v16];

  if (!self->_isSecondaryProfileMedicalID)
  {
    id v17 = [(HKEmergencyCardTableItem *)[HKEmergencyCardOrganDonorTableItem alloc] initInEditMode:0];
    [v15 addObject:v17];
  }
  v37[0] = v13;
  v37[1] = v14;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v15 addObjectsFromArray:v18];

  id v19 = [[HKEmergencyCardPrimaryLanguageTableItem alloc] initInEditMode:0];
  primaryLanguageItem = self->_primaryLanguageItem;
  self->_primaryLanguageItem = v19;

  [(HKEmergencyCardPrimaryLanguageTableItem *)self->_primaryLanguageItem setDelegate:self];
  [v15 addObject:self->_primaryLanguageItem];
  if (self->_isSecondaryProfileMedicalID && !self->_inBridge)
  {
    id v21 = [(HKEmergencyCardFooterTableItem *)[HKEmergencyCardEditMedicalIDFooterTableItem alloc] initInEditMode:0];
    [v15 addObject:v21];
  }
  [(HKEmergencyCardGroupTableItem *)self->_informationDataGroupItem setSubitems:v15];
  long long v22 = [[HKEmergencyCardContactsTableItem alloc] initInEditMode:0];
  contactsItem = self->_contactsItem;
  self->_contactsItem = v22;

  [(HKEmergencyCardTableItem *)self->_contactsItem setIsSecondaryProfile:[(HKMedicalIDViewController *)self isSecondaryProfileMedicalID]];
  id v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v25 = self->_contactsItem;
  v36[0] = self->_informationDataGroupItem;
  v36[1] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [(NSArray *)v24 addObjectsFromArray:v26];

  if (self->_showsEmergencyAccessState || self->_showsShowWhenLockedState)
  {
    id v27 = [[HKEmergencyCardEmergencyAccessTableItem alloc] initInEditMode:0 shouldShowLocked:self->_showsShowWhenLockedState shouldShareInfo:self->_showsEmergencyAccessState];
    [v27 setIsSecondaryProfile:self->_isSecondaryProfileMedicalID];
    [(NSArray *)v24 addObject:v27];
  }
  if (self->_showsEditMedicalIDRowInViewMode)
  {
    id v28 = [(HKEmergencyCardTableItem *)[HKEmergencyCardSelectionTableItem alloc] initInEditMode:0];
    [v28 setSelectionDelegate:self];
    [(NSArray *)v24 addObject:v28];
  }
  tableItems = self->_tableItems;
  self->_tableItems = v24;
  v30 = v24;

  v35 = v33;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  localeItems = self->_localeItems;
  self->_localeItems = v31;
}

- (id)_fetchProfileFirstName
{
  return (id)[(HKProfileStore *)self->_profileStore synchronouslyFetchFirstName];
}

- (int64_t)_preferredOrganDonationOrganization
{
  return +[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable];
}

- (void)_buildPresentableTableItems
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_inEditMode)
  {
    BOOL v3 = (NSArray *)[(NSArray *)self->_tableItems mutableCopy];
    presentableTableItems = self->_presentableTableItems;
    self->_presentableTableItems = v3;
  }
  else
  {
    char v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = self->_tableItems;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPresentableData", (void)v23))
          {
            [(NSArray *)v5 addObject:v13];
            v10 += [v13 numberOfRows];
            id v14 = [NSNumber numberWithInteger:v10];
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    id v15 = self->_presentableTableItems;
    self->_presentableTableItems = v5;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_presentableTableItems count])
  {
    unint64_t v17 = 0;
    do
    {
      id v18 = -[HKMedicalIDViewController _newViewForFooterInSection:](self, "_newViewForFooterInSection:", v17, (void)v23);
      [v16 addObject:v18];

      ++v17;
    }
    while (v17 < [(NSArray *)self->_presentableTableItems count]);
  }
  objc_storeStrong((id *)&self->_footers, v16);
  id v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_presentableTableItems count])
  {
    unint64_t v20 = 0;
    do
    {
      id v21 = -[HKMedicalIDViewController _newViewForHeaderInSection:](self, "_newViewForHeaderInSection:", v20, (void)v23);
      [(NSArray *)v19 addObject:v21];

      ++v20;
    }
    while (v20 < [(NSArray *)self->_presentableTableItems count]);
  }
  headers = self->_headers;
  self->_headers = v19;
}

- (id)_newViewForFooterInSection:(int64_t)a3
{
  char v5 = objc_alloc_init(HKTableViewFooterView);
  id v6 = [(NSArray *)self->_presentableTableItems objectAtIndexedSubscript:a3];
  id v7 = [v6 titleForFooter];
  uint64_t v8 = [(HKTableViewFooterView *)v5 label];
  [v8 setText:v7];

  uint64_t v9 = [(HKMedicalIDViewController *)self tableView];
  [v9 _contentMargin];
  double v11 = v10;
  id v12 = [(HKMedicalIDViewController *)self tableView];
  [v12 _contentMargin];
  -[HKTableViewFooterView setContentInsets:](v5, "setContentInsets:", 10.0, v11, 5.0, v13);

  return v5;
}

- (id)_newViewForHeaderInSection:(int64_t)a3
{
  char v5 = objc_alloc_init(HKTableViewHeaderView);
  id v6 = [(NSArray *)self->_presentableTableItems objectAtIndexedSubscript:a3];
  id v7 = [v6 titleForHeader];
  uint64_t v8 = [(HKTableViewHeaderView *)v5 label];
  [v8 setText:v7];

  if (self->_inEditMode)
  {
    uint64_t v9 = [(HKMedicalIDViewController *)self tableView];
    [v9 _contentMargin];
    double v11 = v10;
    id v12 = [(HKMedicalIDViewController *)self tableView];
    [v12 _contentMargin];
    -[HKTableViewHeaderView setContentInsets:](v5, "setContentInsets:", 20.0, v11, 10.0, v13);
  }
  else
  {
    -[HKTableViewHeaderView setContentInsets:](v5, "setContentInsets:", 20.0, 16.0, 10.0, 16.0);
  }
  return v5;
}

- (void)_dismissMedicalIDEditor
{
  uint64_t v3 = [(HKMedicalIDViewController *)self presentedViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(HKMedicalIDViewController *)self presentedViewController];
    medicalIDEditor = self->_medicalIDEditor;

    if (v5 == medicalIDEditor)
    {
      [(HKMedicalIDViewController *)self dismissViewControllerAnimated:1 completion:0];
      id v7 = self->_medicalIDEditor;
      self->_medicalIDEditor = 0;
    }
  }
}

- (BOOL)_shouldShowOrganDonation
{
  if (self->_inBuddy || !self->_organDonationSignupAvailable)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    int64_t v2 = [(HKMedicalIDViewController *)self _preferredOrganDonationOrganization];
    if (v2) {
      LOBYTE(v2) = !self->_showsDismissButton;
    }
  }
  return v2;
}

- (BOOL)_editable
{
  return !self->_inBuddy && !self->_showsDismissButton;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_presentableTableItems count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_presentableTableItems objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 numberOfRows];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v7];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "tableView:cellForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v8, v7));
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v9 bounds];
      objc_msgSend(v9, "setSeparatorInset:", 0.0, v10 + v10, 0.0, 0.0);
    }
    else
    {
      [v8 separatorInset];
      objc_msgSend(v9, "setSeparatorInset:");
      double v11 = [v9 contentView];
      id v12 = [v11 backgroundColor];
      if (v12)
      {
        double v13 = [v9 contentView];
        id v14 = [v13 backgroundColor];
        [v9 setBackgroundColor:v14];
      }
      else
      {
        double v13 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
        [v9 setBackgroundColor:v13];
      }
    }
  }
  else
  {
    uint64_t v9 = HKErrorTableViewCell(@"HKMedicalIDViewController");
  }

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 estimatedRowHeight];
  double v9 = v8;
  double v10 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v7];
  if (v10)
  {
    objc_msgSend(v10, "tableView:estimatedHeightForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v7));
    double v9 = v11;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 rowHeight];
  double v9 = v8;
  double v10 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v7];
  if (v10)
  {
    objc_msgSend(v10, "tableView:heightForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v7));
    double v9 = v11;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if ([(NSArray *)self->_headers count] > a4)
  {
    double v8 = [(NSArray *)self->_headers objectAtIndexedSubscript:a4];
    [v6 bounds];
    [v8 setPreferredMaxLayoutWidth:CGRectGetWidth(v11)];
    [v8 intrinsicContentSize];
    double v7 = v9;
  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(NSArray *)self->_headers count] <= a4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_headers objectAtIndexedSubscript:a4];
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(NSArray *)self->_footers count] <= a4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_footers objectAtIndexedSubscript:a4];
  }
  return v6;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if ([(NSArray *)self->_footers count] > a4)
  {
    double v8 = [(NSArray *)self->_footers objectAtIndexedSubscript:a4];
    [v6 bounds];
    [v8 setPreferredMaxLayoutWidth:CGRectGetWidth(v11)];
    [v8 intrinsicContentSize];
    double v7 = v9;
  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDecelerating] & 1) != 0 || (objc_msgSend(v6, "isDragging"))
  {
    char v8 = 0;
  }
  else
  {
    double v9 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v7];
    char v8 = objc_msgSend(v9, "shouldHighlightRowAtIndex:", -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v9, v7));
    if ((v8 & 1) == 0
      && [(HKMedicalIDViewController *)self tableView:v6 editingStyleForRowAtIndexPath:v7] == 2)
    {
      [(HKMedicalIDViewController *)self tableView:v6 commitEditingStyle:2 forRowAtIndexPath:v7];
    }
  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v6];
  int64_t v8 = [(HKMedicalIDViewController *)self _rowIndexForTableItem:v9 atIndexPath:v6];

  [v9 tableView:v7 didSelectRowAtIndex:v8];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  if (!self->_inEditMode) {
    return 0;
  }
  id v5 = a4;
  id v6 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v5];
  int64_t v7 = [(HKMedicalIDViewController *)self _rowIndexForTableItem:v6 atIndexPath:v5];

  LOBYTE(v7) = [v6 canEditRowAtIndex:v7];
  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (!self->_inEditMode) {
    return 0;
  }
  id v5 = a4;
  id v6 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v5];
  int64_t v7 = [(HKMedicalIDViewController *)self _rowIndexForTableItem:v6 atIndexPath:v5];

  int64_t v8 = [v6 editingStyleForRowAtIndex:v7];
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_inEditMode)
  {
    double v10 = [(HKMedicalIDViewController *)self _tableItemForIndexPath:v9];
    uint64_t v11 = objc_msgSend(v10, "commitEditingStyle:forRowAtIndex:", a4, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v9));
    if (v11 == 2)
    {
      [v8 beginUpdates];
      id v13 = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [v8 reloadRowsAtIndexPaths:v12 withRowAnimation:0];
    }
    else
    {
      if (v11 != 1)
      {
LABEL_7:
        objc_msgSend(v10, "didCommitEditingStyle:forRowAtIndex:", a4, objc_msgSend(v9, "row"));

        goto LABEL_8;
      }
      [v8 beginUpdates];
      v14[0] = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v8 deleteRowsAtIndexPaths:v12 withRowAnimation:100];
    }

    [v8 endUpdates];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateEmergencyContactTableItem
{
  uint64_t v3 = [(HKMedicalIDViewController *)self tableView];
  [v3 beginUpdates];

  id v4 = [(HKMedicalIDViewController *)self tableItems];
  uint64_t v5 = [v4 indexOfObject:self->_contactsItem];

  id v6 = [(HKMedicalIDViewController *)self tableView];
  int64_t v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5];
  [v6 reloadSections:v7 withRowAnimation:0];

  id v8 = [(HKMedicalIDViewController *)self tableView];
  [v8 endUpdates];
}

- (void)updatePrimaryLanguageTableItem
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKMedicalIDViewController *)self tableView];
  [v3 beginUpdates];

  id v4 = [(HKMedicalIDViewController *)self tableItems];
  uint64_t v5 = [v4 indexOfObject:self->_informationDataGroupItem];

  id v6 = [(HKEmergencyCardGroupTableItem *)self->_informationDataGroupItem subitems];
  uint64_t v7 = [v6 indexOfObject:self->_primaryLanguageItem];

  id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:v5];
  id v9 = [(HKMedicalIDViewController *)self tableView];
  v12[0] = v8;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v9 reloadRowsAtIndexPaths:v10 withRowAnimation:0];

  uint64_t v11 = [(HKMedicalIDViewController *)self tableView];
  [v11 endUpdates];
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)_tableItemForIndexPath:(id)a3
{
  presentableTableItems = self->_presentableTableItems;
  uint64_t v4 = [a3 section];
  return [(NSArray *)presentableTableItems objectAtIndexedSubscript:v4];
}

- (int64_t)_rowIndexForTableItem:(id)a3 atIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3);
}

- (void)deletionTableItemDidTapDelete:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 medicalIDViewControllerDidDelete:self];
  }
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  [(HKMedicalIDViewController *)self _dismissMedicalIDEditor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 medicalIDViewControllerDidDelete:self];
  }
}

- (void)selectionTableItemDidTap:(id)a3
{
}

- (void)tableItem:(id)a3 heightDidChangeForRowIndex:(int64_t)a4 keepRectVisible:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HKMedicalIDViewController_tableItem_heightDidChangeForRowIndex_keepRectVisible_inView___block_invoke;
  v13[3] = &unk_1E6D50ED8;
  v13[4] = self;
  id v12 = a6;
  [v11 performWithoutAnimation:v13];
  -[HKMedicalIDViewController _adjustTableViewContentOffsetForVisibleView:visibleRect:animated:](self, "_adjustTableViewContentOffsetForVisibleView:visibleRect:animated:", v12, 1, x, y, width, height);
}

void __89__HKMedicalIDViewController_tableItem_heightDidChangeForRowIndex_keepRectVisible_inView___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 endUpdates];
}

- (void)tableItemDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
}

- (void)tableItemDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
}

- (void)_adjustTableViewContentOffsetForVisibleView:(id)a3 visibleRect:(CGRect)a4 animated:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v11 = a3;
    id v12 = [(HKMedicalIDViewController *)self tableView];
    objc_msgSend(v12, "convertRect:fromView:", v11, x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    id v21 = [(HKMedicalIDViewController *)self tableView];
    objc_msgSend(v21, "scrollRectToVisible:animated:", v5, v14, v16, v18, v20);
  }
}

- (void)_showMedicalIDPreviewAsNext
{
  id v9 = [[HKMedicalIDViewController alloc] initInEditMode:0 inBuddy:self->_inBuddy organDonationSignupAvailable:self->_organDonationSignupAvailable];
  id v3 = [(HKMedicalIDViewController *)self healthStore];
  [v9 setHealthStore:v3];

  uint64_t v4 = [(HKMedicalIDViewController *)self medicalIDStore];
  [v9 setMedicalIDStore:v4];

  BOOL v5 = [(HKMedicalIDViewController *)self medicalID];
  id v6 = (void *)[v5 copy];
  [v9 setMedicalID:v6];

  objc_msgSend(v9, "setShowsDeleteButton:", -[HKMedicalIDViewController showsDeleteButton](self, "showsDeleteButton"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v9 setDelegate:WeakRetained];

  id v8 = [(HKMedicalIDViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (void)_forceDisableBiometricIfDeviceLocked
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to force passcode lock with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_refreshMedicalIDInViewMode
{
  if (![(HKMedicalIDViewController *)self inEditMode])
  {
    uint64_t v3 = [(HKMedicalIDViewController *)self medicalIDStore];

    if (!v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F2B190]);
      BOOL v5 = [(HKMedicalIDViewController *)self healthStore];
      id v6 = (void *)[v4 initWithHealthStore:v5];
      [(HKMedicalIDViewController *)self setMedicalIDStore:v6];
    }
    id v7 = [(HKMedicalIDViewController *)self medicalIDStore];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke;
    v8[3] = &unk_1E6D541B8;
    v8[4] = self;
    [v7 fetchMedicalIDDataWithCompletion:v8];
  }
}

void __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_427;
    v9[3] = &unk_1E6D513B0;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR)) {
      __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_cold_1(a1, (uint64_t)v7, v8);
    }
  }
}

uint64_t __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_427(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableWithMedicalIDData:*(void *)(a1 + 40)];
}

- (void)_updateMedicalID
{
  uint64_t v3 = [(HKMedicalIDViewController *)self medicalIDStore];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2B190]) initWithHealthStore:self->_healthStore];
    [(HKMedicalIDViewController *)self setMedicalIDStore:v4];
  }
  id v5 = [(HKMedicalIDViewController *)self medicalIDStore];
  id v6 = [(HKMedicalIDViewController *)self medicalID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HKMedicalIDViewController__updateMedicalID__block_invoke;
  v7[3] = &unk_1E6D512C8;
  v7[4] = self;
  [v5 updateMedicalIDData:v6 completion:v7];
}

void __45__HKMedicalIDViewController__updateMedicalID__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR)) {
      __45__HKMedicalIDViewController__updateMedicalID__block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (id)_formatMedicalIDAccessPoint:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return &stru_1F3B9CF20;
  }
  else {
    return off_1E6D54208[a3 - 1];
  }
}

- (void)_submitAccessAnalytic
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    uint64_t v3 = [(HKMedicalIDViewController *)self _formatMedicalIDAccessPoint:[(HKMedicalIDViewController *)self internalAccessType]];
    v14[0] = @"applicationIdentifier";
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];
    v15[0] = v5;
    v15[1] = v3;
    v14[1] = @"healthAccessType";
    void v14[2] = @"profileType";
    id v6 = NSNumber;
    id v7 = [(HKHealthStore *)self->_healthStore profileIdentifier];
    id v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "type"));
    v15[2] = v8;
    v14[3] = @"typeOfAccess";
    int64_t v9 = [(HKMedicalIDViewController *)self internalAccessType];
    id v10 = @"Health";
    if (!v9) {
      id v10 = @"Other";
    }
    v15[3] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

    AnalyticsSendEvent();
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_INFO, "Submitted Medical ID Access Event", v13, 2u);
    }
  }
}

- (_HKMedicalIDData)medicalID
{
  return self->_medicalID;
}

- (void)setMedicalID:(id)a3
{
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)showsDismissButton
{
  return self->_showsDismissButton;
}

- (void)setShowsDismissButton:(BOOL)a3
{
  self->_showsDismissButton = a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  self->_showsDeleteButton = a3;
}

- (BOOL)modernAppearance
{
  return self->_modernAppearance;
}

- (void)setModernAppearance:(BOOL)a3
{
  self->_modernAppearance = a3;
}

- (BOOL)shouldShowHints
{
  return self->_shouldShowHints;
}

- (void)setShouldShowHints:(BOOL)a3
{
  self->_shouldShowHints = a3;
}

- (BOOL)showsShowWhenLockedState
{
  return self->_showsShowWhenLockedState;
}

- (void)setShowsShowWhenLockedState:(BOOL)a3
{
  self->_showsShowWhenLockedState = a3;
}

- (BOOL)showsEmergencyAccessState
{
  return self->_showsEmergencyAccessState;
}

- (void)setShowsEmergencyAccessState:(BOOL)a3
{
  self->_showsEmergencyAccessState = a3;
}

- (BOOL)showsEditMedicalIDRowInViewMode
{
  return self->_showsEditMedicalIDRowInViewMode;
}

- (void)setShowsEditMedicalIDRowInViewMode:(BOOL)a3
{
  self->_showsEditMedicalIDRowInViewMode = a3;
}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_inBridge = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
}

- (HKMedicalIDViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMedicalIDViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)internalAccessType
{
  return self->_internalAccessType;
}

- (void)setInternalAccessType:(int64_t)a3
{
  self->_internalAccessType = a3;
}

- (BOOL)isSecondaryProfileMedicalID
{
  return self->_isSecondaryProfileMedicalID;
}

- (void)setIsSecondaryProfileMedicalID:(BOOL)a3
{
  self->_BOOL isSecondaryProfileMedicalID = a3;
}

- (NSArray)tableItems
{
  return self->_tableItems;
}

- (void)setTableItems:(id)a3
{
}

- (BOOL)inEditMode
{
  return self->_inEditMode;
}

- (void)setInEditMode:(BOOL)a3
{
  self->_inEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_medicalID, 0);
  objc_storeStrong((id *)&self->_organDonationItems, 0);
  objc_storeStrong((id *)&self->_medicalIDEditor, 0);
  objc_storeStrong((id *)&self->_accumulatedNumberOfRowsForItems, 0);
  objc_storeStrong((id *)&self->_localeItems, 0);
  objc_storeStrong((id *)&self->_primaryLanguageItem, 0);
  objc_storeStrong((id *)&self->_contactsItem, 0);
  objc_storeStrong((id *)&self->_nameAndPictureItem, 0);
  objc_storeStrong((id *)&self->_informationDataGroupItem, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_footers, 0);
  objc_storeStrong((id *)&self->_presentableTableItems, 0);
  objc_storeStrong((id *)&self->_profileStore, 0);
}

void __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F2BED0];
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2080;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch MedicalID on notification %s, error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void __45__HKMedicalIDViewController__updateMedicalID__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update MedicalID, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end