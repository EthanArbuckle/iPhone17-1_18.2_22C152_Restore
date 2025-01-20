@interface ProfileCharacteristicsViewController
+ (BOOL)cardioFitnessMedicationsSectionHiddenForProfileIdentifier:(id)a3;
+ (BOOL)nameRowsHiddenForProfileIdentifier:(id)a3;
+ (double)avatarImageSize;
+ (id)orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:(BOOL)a3 pregnancySectionHidden:(BOOL)a4 cardioFitnessMedicationsSectionHidden:(BOOL)a5;
+ (id)orderedSectionIdentifiersWithPregnancySectionHidden:(BOOL)a3 cardioFitnessMedicationsSectionHidden:(BOOL)a4;
- (BOOL)shouldShowNameInHeaderView;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (HKBirthdateChangeManager)birthdateChangeManager;
- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (ProfileCharacteristicDiffableDataSource)dataSource;
- (ProfileCharacteristicsViewController)initWithCoder:(id)a3;
- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3;
- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3 inEditMode:(BOOL)a4;
- (ProfileCharacteristicsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ProfileCharacteristicsViewController)initWithStyle:(int64_t)a3;
- (UIImage)avatarImage;
- (UIImageView)avatarImageView;
- (id)_birthdayCalendar;
- (id)_checkmarkedCircleImageView;
- (id)_circleImageView;
- (id)_createBetaBlockerCheckMarkCell;
- (id)_createCalciumChannelBlockerCheckMarkCell;
- (id)_dateAsAge:(id)a3;
- (id)_displayStringForBiologicalSex:(int64_t)a3;
- (id)_displayStringForBirthDate:(id)a3;
- (id)_displayStringForBloodType:(int64_t)a3;
- (id)_displayStringForFitzpatrickSkinType:(int64_t)a3;
- (id)_displayStringForWheelchairUse:(int64_t)a3;
- (id)_generalInfoFooterView;
- (id)_initialBirthdayValue;
- (id)_meContact;
- (id)_titleForFooterInTableViewSection:(int64_t)a3 sectionIdentifier:(id)a4;
- (id)_wheelchairFooterTitle;
- (id)displayNumberOfActiveCardioFitnessMedications:(int)a3;
- (id)getCellForIndexPath:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_profileRowIdentifierForSection:(id)a3;
- (int64_t)accessType;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_adjustHeaderFrame;
- (void)_createBarButtonItems;
- (void)_createCells;
- (void)_createHeader;
- (void)_createPickers;
- (void)_enableEditing;
- (void)_fetchDataFromHealthStore;
- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4;
- (void)_localeDidChange:(id)a3;
- (void)_meContact;
- (void)_resetFirstAndLastNameValues;
- (void)_resetSelectedCell;
- (void)_setPregnancyCellDisplayValueForState:(BOOL)a3;
- (void)_startPregnancyModelQuery;
- (void)_timeZoneDidChange:(id)a3;
- (void)_updateCellsWithDisplayValues;
- (void)_updateFirstAndLastNameCellsWithDisplayValues;
- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5;
- (void)_updateFooters;
- (void)_updatePickersWithDisplayValues;
- (void)birthdateChanged:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)didClearBirthdate;
- (void)didTapPregnancy;
- (void)didUpdateName;
- (void)dismissButtonTapped:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setAccessType:(int64_t)a3;
- (void)setAvatarImage:(id)a3;
- (void)setAvatarImageView:(id)a3;
- (void)setBirthdateChangeManager:(id)a3;
- (void)setCardioFitnessMedicationCheckmarks;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSettingsNavigationDonatingDelegate:(id)a3;
- (void)setUpNavigationBar;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCheckMarksForCell:(id)a3 option:(unint64_t)a4;
- (void)updateTableViewIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProfileCharacteristicsViewController

+ (double)avatarImageSize
{
  [MEMORY[0x1E4F678A8] avatarViewSize];
  return result;
}

- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ProfileCharacteristicsViewController;
  v6 = [(ProfileCharacteristicsViewController *)&v25 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_beginInEditMode = 0;
    v7->_accessType = 0;
    uint64_t v8 = [MEMORY[0x1E4F67AC0] sharedInstanceForHealthStore:v7->_healthStore];
    displayTypeController = v7->_displayTypeController;
    v7->_displayTypeController = (HKDisplayTypeController *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F678C0]) initWithHealthStore:v5];
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (WDUserDefaults *)v10;

    v12 = [v5 profileIdentifier];
    v7->_nameRowsHidden = +[ProfileCharacteristicsViewController nameRowsHiddenForProfileIdentifier:v12];

    v13 = [v5 profileIdentifier];
    v7->_cardioFitnessMedicationsSectionHidden = +[ProfileCharacteristicsViewController cardioFitnessMedicationsSectionHiddenForProfileIdentifier:v13];

    v14 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v7->_pregnancySectionHidden = [v14 healthAppSupportedOnDevice] ^ 1;

    uint64_t v15 = +[ProfileCharacteristicsViewController orderedSectionIdentifiersWithPregnancySectionHidden:v7->_pregnancySectionHidden cardioFitnessMedicationsSectionHidden:v7->_cardioFitnessMedicationsSectionHidden];
    orderedSectionIdentifiers = v7->_orderedSectionIdentifiers;
    v7->_orderedSectionIdentifiers = (NSArray *)v15;

    uint64_t v17 = +[ProfileCharacteristicsViewController orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:v7->_nameRowsHidden pregnancySectionHidden:v7->_pregnancySectionHidden cardioFitnessMedicationsSectionHidden:v7->_cardioFitnessMedicationsSectionHidden];
    orderedRowIdentifiersBySectionIdentifier = v7->_orderedRowIdentifiersBySectionIdentifier;
    v7->_orderedRowIdentifiersBySectionIdentifier = (NSDictionary *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F67998]) initWithHealthStore:v5];
    birthdateChangeManager = v7->_birthdateChangeManager;
    v7->_birthdateChangeManager = (HKBirthdateChangeManager *)v19;

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v7 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    v7->_isPregnant = 0;
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E4F29F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1AD1A4000, v22, OS_LOG_TYPE_DEFAULT, "Starting pregnancy model query", v24, 2u);
    }
    [(ProfileCharacteristicsViewController *)v7 _startPregnancyModelQuery];
  }

  return v7;
}

- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3 inEditMode:(BOOL)a4
{
  double result = [(ProfileCharacteristicsViewController *)self initWithHealthStore:a3];
  result->_beginInEditMode = a4;
  return result;
}

+ (BOOL)nameRowsHiddenForProfileIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"TinkerProfileCharacteristicsHideNameRows"];

  if (v5) {
    BOOL v6 = [v3 type] == 3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)cardioFitnessMedicationsSectionHiddenForProfileIdentifier:(id)a3
{
  return [a3 type] != 1;
}

+ (id)orderedSectionIdentifiersWithPregnancySectionHidden:(BOOL)a3 cardioFitnessMedicationsSectionHidden:(BOOL)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObjectsFromArray:&unk_1F0465710];
  if (!a3) {
    [v6 addObject:&unk_1F0465440];
  }
  if (!a4) {
    [v6 addObject:&unk_1F0465458];
  }
  return v6;
}

+ (id)orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:(BOOL)a3 pregnancySectionHidden:(BOOL)a4 cardioFitnessMedicationsSectionHidden:(BOOL)a5
{
  uint64_t v8 = objc_opt_new();
  if (a3)
  {
    v9 = &unk_1F0465728;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    if ([v10 isGivenNameFirst]) {
      v11 = &unk_1F0465740;
    }
    else {
      v11 = &unk_1F0465758;
    }
    v9 = [v11 arrayByAddingObjectsFromArray:&unk_1F0465728];
  }
  [v8 setObject:v9 forKey:&unk_1F0465410];
  [v8 setObject:&unk_1F0465770 forKey:&unk_1F0465428];
  if (!a4) {
    [v8 setObject:&unk_1F0465788 forKey:&unk_1F0465440];
  }
  if (!a5) {
    [v8 setObject:&unk_1F04657A0 forKey:&unk_1F0465458];
  }

  return v8;
}

- (ProfileCharacteristicsViewController)initWithStyle:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  id v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (ProfileCharacteristicsViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  return [(ProfileCharacteristicsViewController *)&v4 initWithCoder:a3];
}

- (ProfileCharacteristicsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (void)setAvatarImage:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_avatarImage, a3);
  if ([(ProfileCharacteristicsViewController *)self isViewLoaded])
  {
    uint64_t v5 = [(ProfileCharacteristicsViewController *)self avatarImageView];
    [v5 setImage:v6];

    [(ProfileCharacteristicsViewController *)self _adjustHeaderFrame];
  }
}

- (UIImageView)avatarImageView
{
  avatarImageView = self->_avatarImageView;
  if (!avatarImageView)
  {
    objc_super v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    uint64_t v5 = self->_avatarImageView;
    self->_avatarImageView = v4;

    [(UIImageView *)self->_avatarImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WDProfileHeaderView *)self->_headerView setAvatarView:self->_avatarImageView];
    avatarImageView = self->_avatarImageView;
  }
  return avatarImageView;
}

- (void)setUpNavigationBar
{
  id v3 = WDBundle();
  objc_super v4 = [v3 localizedStringForKey:@"HEALTH_PROFILE_TITLE" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(ProfileCharacteristicsViewController *)self setTitle:v4];

  id v7 = [(ProfileCharacteristicsViewController *)self navigationItem];
  uint64_t v5 = [v7 leftBarButtonItem];
  customLeftBarButtonItem = self->_customLeftBarButtonItem;
  self->_customLeftBarButtonItem = v5;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)ProfileCharacteristicsViewController;
  [(ProfileCharacteristicsViewController *)&v31 viewDidLoad];
  [(ProfileCharacteristicsViewController *)self setUpNavigationBar];
  double v3 = *MEMORY[0x1E4FB2F28];
  objc_super v4 = [(ProfileCharacteristicsViewController *)self tableView];
  [v4 setRowHeight:v3];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [v5 lineHeight];
  double v7 = v6 * 3.0;
  uint64_t v8 = [(ProfileCharacteristicsViewController *)self tableView];
  [v8 setEstimatedRowHeight:v7];

  v9 = [(ProfileCharacteristicsViewController *)self tableView];
  [v9 setAllowsSelectionDuringEditing:1];

  id v10 = [(ProfileCharacteristicsViewController *)self tableView];
  [v10 setBackgroundView:0];

  v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v12 = [(ProfileCharacteristicsViewController *)self tableView];
  [v12 setBackgroundColor:v11];

  v13 = [(ProfileCharacteristicsViewController *)self tableView];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [MEMORY[0x1E4F67AD0] defaultReuseIdentifier];
  [v13 registerClass:v14 forHeaderFooterViewReuseIdentifier:v15];

  v16 = [(ProfileCharacteristicsViewController *)self tableView];
  uint64_t v17 = HKUIJoinStringsForAutomationIdentifier();
  [v16 setAccessibilityIdentifier:v17];

  if (self->_beginInEditMode) {
    [(ProfileCharacteristicsViewController *)self setEditing:1];
  }
  [(ProfileCharacteristicsViewController *)self _createHeader];
  [(ProfileCharacteristicsViewController *)self _createBarButtonItems];
  [(ProfileCharacteristicsViewController *)self _createPickers];
  [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
  [(ProfileCharacteristicsViewController *)self _createCells];
  [(ProfileCharacteristicsViewController *)self setCardioFitnessMedicationCheckmarks];
  objc_initWeak(&location, self);
  v18 = [ProfileCharacteristicDiffableDataSource alloc];
  uint64_t v19 = [(ProfileCharacteristicsViewController *)self tableView];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke;
  v28[3] = &unk_1E5E7CF90;
  objc_copyWeak(&v29, &location);
  v20 = [(UITableViewDiffableDataSource *)v18 initWithTableView:v19 cellProvider:v28];
  [(ProfileCharacteristicsViewController *)self setDataSource:v20];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke_2;
  v26[3] = &unk_1E5E7CFB8;
  objc_copyWeak(&v27, &location);
  v21 = [(ProfileCharacteristicsViewController *)self dataSource];
  [v21 setFooterTitleProvider:v26];

  [(ProfileCharacteristicsViewController *)self updateTableViewIfNeeded];
  v22 = [(ProfileCharacteristicsViewController *)self dataSource];
  [v22 setDefaultRowAnimation:0];

  v23 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v24 = [(ProfileCharacteristicsViewController *)self view];
  [v24 setBackgroundColor:v23];

  objc_super v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:self selector:sel__timeZoneDidChange_ name:*MEMORY[0x1E4F1C4F8] object:0];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

id __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v6 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v7 = [v4 item];
  uint64_t v8 = [v4 section];

  v9 = [v6 indexPathForItem:v7 inSection:v8];
  id v10 = [WeakRetained getCellForIndexPath:v9];

  return v10;
}

id __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [WeakRetained _titleForFooterInTableViewSection:a3 sectionIdentifier:v6];

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ProfileCharacteristicsViewController;
  [(ProfileCharacteristicsViewController *)&v6 viewDidAppear:a3];
  id v4 = [(ProfileCharacteristicsViewController *)self settingsNavigationDonatingDelegate];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs://root=HEALTH&path=HEALTH_DETAILS_ITEM"];
  [v4 donateWithDeepLink:v5 andTitle:@"Health Details"];
}

- (void)updateTableViewIfNeeded
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [(ProfileCharacteristicsViewController *)self setCurrentSnapshot:v3];

  id v4 = +[ProfileCharacteristicsViewController orderedSectionIdentifiersWithPregnancySectionHidden:self->_pregnancySectionHidden cardioFitnessMedicationsSectionHidden:self->_cardioFitnessMedicationsSectionHidden];
  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  self->_orderedSectionIdentifiers = v4;

  objc_super v6 = +[ProfileCharacteristicsViewController orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:self->_nameRowsHidden pregnancySectionHidden:self->_pregnancySectionHidden cardioFitnessMedicationsSectionHidden:self->_cardioFitnessMedicationsSectionHidden];
  orderedRowIdentifiersBySectionIdentifier = self->_orderedRowIdentifiersBySectionIdentifier;
  self->_orderedRowIdentifiersBySectionIdentifier = v6;

  uint64_t v8 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
  [v8 appendSectionsWithIdentifiers:self->_orderedSectionIdentifiers];

  v9 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
  id v10 = [(NSDictionary *)self->_orderedRowIdentifiersBySectionIdentifier objectForKey:&unk_1F0465410];
  [v9 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:&unk_1F0465410];

  v11 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
  v12 = [(NSDictionary *)self->_orderedRowIdentifiersBySectionIdentifier objectForKey:&unk_1F0465428];
  [v11 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:&unk_1F0465428];

  if (!self->_pregnancySectionHidden)
  {
    v13 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
    [v13 appendItemsWithIdentifiers:&unk_1F04657D0 intoSectionWithIdentifier:&unk_1F0465440];
  }
  if (!self->_cardioFitnessMedicationsSectionHidden)
  {
    id v14 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
    [v14 appendItemsWithIdentifiers:&unk_1F04657E8 intoSectionWithIdentifier:&unk_1F0465458];
  }
}

- (id)_titleForFooterInTableViewSection:(int64_t)a3 sectionIdentifier:(id)a4
{
  id v5 = a4;
  if ([v5 isEqual:&unk_1F0465410])
  {
    objc_super v6 = &stru_1F04402E8;
  }
  else if ([v5 isEqual:&unk_1F0465428])
  {
    objc_super v6 = [(ProfileCharacteristicsViewController *)self _wheelchairFooterTitle];
  }
  else if ([v5 isEqual:&unk_1F0465458])
  {
    uint64_t v7 = WDBundle();
    objc_super v6 = [v7 localizedStringForKey:@"CARDIO_FITNESS_RELATED_MEDICATIONS_FOOTER_TEXT" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [(ProfileCharacteristicsViewController *)self _generalInfoFooterView];
  }
  return v6;
}

- (id)_wheelchairFooterTitle
{
  id v3 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v4 = [v3 type];

  uint64_t v5 = WDBundle();
  objc_super v6 = v5;
  if (v4 == 3)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"WHEELCHAIR_USE_COREMOTION_TEXT_TINKER_%@" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable-Tinker"];

    uint64_t v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, self->_firstName);
    objc_super v6 = (void *)v7;
  }
  else
  {
    v9 = [MEMORY[0x1E4FB16C8] modelSpecificLocalizedStringKeyForKey:@"WHEELCHAIR_USE_COREMOTION_TEXT"];
    uint64_t v8 = [v6 localizedStringForKey:v9 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  }
  return v8;
}

- (id)_generalInfoFooterView
{
  id v3 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v4 = [v3 type];

  if (v4 == 3)
  {
    uint64_t v5 = WDBundle();
    objc_super v6 = [v5 localizedStringForKey:@"EDIT_HEALTH_DETAILS_FOOTER_TEXT_%@" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable-Tinker"];

    uint64_t v7 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, self->_firstName);
    id v8 = objc_alloc(MEMORY[0x1E4F67AD0]);
    v9 = [MEMORY[0x1E4F67AD0] defaultReuseIdentifier];
    id v10 = (void *)[v8 initWithReuseIdentifier:v9 markdown:v7];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  [(ProfileCharacteristicsViewController *)&v4 viewWillAppear:a3];
  [(ProfileCharacteristicsViewController *)self _fetchDataFromHealthStore];
  [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
}

- (void)_localeDidChange:(id)a3
{
  [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
  id v5 = [(ProfileCharacteristicsViewController *)self dataSource];
  objc_super v4 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
  [v5 applySnapshot:v4 animatingDifferences:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(WDProfileTableViewCell *)self->_birthdateCell removeClearButtonTarget:self action:sel_didClearBirthdate];
  [(HKHealthStore *)self->_healthStore stopQuery:self->_pregnancyModelQuery];
  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  [(ProfileCharacteristicsViewController *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileCharacteristicsViewController;
  [(ProfileCharacteristicsViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(ProfileCharacteristicsViewController *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5E7CB60;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke_2;
  v2[3] = &unk_1E5E7CB60;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1312) setNeedsLayout];
  [*(id *)(a1 + 32) _adjustHeaderFrame];
  id v3 = [*(id *)(a1 + 32) dataSource];
  v2 = [*(id *)(a1 + 32) currentSnapshot];
  [v3 applySnapshot:v2 animatingDifferences:0];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController setEditing:animated:](&v83, sel_setEditing_animated_);
  if (v5)
  {
    self->_isCancelling = 0;
    [(ProfileCharacteristicsViewController *)self setModalInPresentation:1];
    uint64_t v7 = [(ProfileCharacteristicsViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:self->_cancelButtonItem animated:v4];

    if (!self->_cardioFitnessMedicationsSectionHidden)
    {
      char v8 = [(ProfileCharacteristicsViewController *)self dataSource];
      v9 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v8 applySnapshot:v9 animatingDifferences:0];

      objc_super v10 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v10 appendItemsWithIdentifiers:&unk_1F0465800 intoSectionWithIdentifier:&unk_1F0465458];

      id v11 = [(ProfileCharacteristicsViewController *)self dataSource];
      v12 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v11 applySnapshot:v12 animatingDifferences:1];
LABEL_43:
    }
  }
  else
  {
    if (!self->_cardioFitnessMedicationsSectionHidden)
    {
      v13 = [(ProfileCharacteristicsViewController *)self dataSource];
      id v14 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v13 applySnapshot:v14 animatingDifferences:0];

      uint64_t v15 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v15 deleteItemsWithIdentifiers:&unk_1F0465818];

      v16 = [(ProfileCharacteristicsViewController *)self dataSource];
      uint64_t v17 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
      [v16 applySnapshot:v17 animatingDifferences:1];
    }
    [(ProfileCharacteristicsViewController *)self setModalInPresentation:0];
    v18 = [MEMORY[0x1E4FB1900] activeInstance];
    [v18 removeAutocorrection];

    uint64_t v19 = [(ProfileCharacteristicsViewController *)self view];
    [v19 endEditing:1];

    [(ProfileCharacteristicsViewController *)self _resetSelectedCell];
    v20 = [(ProfileCharacteristicsViewController *)self navigationItem];
    [v20 setLeftBarButtonItem:self->_customLeftBarButtonItem animated:v4];

    if (!self->_isCancelling)
    {
      uint64_t v21 = [(WDProfileEditableTableViewCell *)self->_firstNameCell displayValue];
      v22 = (void *)v21;
      if (v21) {
        v23 = (__CFString *)v21;
      }
      else {
        v23 = &stru_1F04402E8;
      }
      v24 = v23;

      uint64_t v25 = [(WDProfileEditableTableViewCell *)self->_lastNameCell displayValue];
      v26 = (void *)v25;
      if (v25) {
        id v27 = (__CFString *)v25;
      }
      else {
        id v27 = &stru_1F04402E8;
      }
      v28 = v27;

      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke;
      v80[3] = &unk_1E5E7CD40;
      v80[4] = self;
      v12 = v24;
      v81 = v12;
      id v29 = v28;
      v82 = v29;
      [(ProfileCharacteristicsViewController *)self _updateFirstName:v12 lastName:v29 completion:v80];
      healthStore = self->_healthStore;
      int64_t biologicalSexDisplayValue = self->_biologicalSexDisplayValue;
      id v79 = 0;
      int v32 = [(HKHealthStore *)healthStore _setBiologicalSex:biologicalSexDisplayValue error:&v79];
      id v33 = v79;
      v34 = (os_log_t *)MEMORY[0x1E4F29FB0];
      if (v32)
      {
        v35 = self->_healthStore;
        id v78 = v33;
        v36 = [(HKHealthStore *)v35 biologicalSexWithError:&v78];
        id v37 = v78;

        biologicalSexObject = self->_biologicalSexObject;
        self->_biologicalSexObject = v36;

        id v33 = v37;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.6();
        }
        self->_int64_t biologicalSexDisplayValue = [(HKBiologicalSexObject *)self->_biologicalSexObject biologicalSex];
      }
      v39 = self->_healthStore;
      int64_t bloodTypeDisplayValue = self->_bloodTypeDisplayValue;
      id v77 = v33;
      int v41 = [(HKHealthStore *)v39 _setBloodType:bloodTypeDisplayValue error:&v77];
      id v42 = v77;

      if (v41)
      {
        v43 = self->_healthStore;
        id v76 = v42;
        v44 = [(HKHealthStore *)v43 bloodTypeWithError:&v76];
        id v45 = v76;

        bloodTypeObject = self->_bloodTypeObject;
        self->_bloodTypeObject = v44;

        id v42 = v45;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.5();
        }
        self->_int64_t bloodTypeDisplayValue = [(HKBloodTypeObject *)self->_bloodTypeObject bloodType];
      }
      birthdateChangeManager = self->_birthdateChangeManager;
      birthdateDisplayValue = self->_birthdateDisplayValue;
      id v75 = v42;
      v49 = [(HKBirthdateChangeManager *)birthdateChangeManager setBirthdate:birthdateDisplayValue withError:&v75];
      id v50 = v75;

      if (([v49 success] & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.4();
        }
        objc_storeStrong((id *)&self->_birthdateDisplayValue, self->_birthdate);
      }
      int64_t v51 = [(UIPickerView *)self->_fitzpatrickSkinTypePicker selectedRowInComponent:0];
      self->_fitzpatrickSkinTypeDisplayValue = v51;
      v52 = self->_healthStore;
      id v74 = v50;
      char v53 = [(HKHealthStore *)v52 _setFitzpatrickSkinType:v51 error:&v74];
      id v54 = v74;

      if ((v53 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:]();
        }
      }
      int64_t v55 = [(UIPickerView *)self->_wheelchairUsePicker selectedRowInComponent:0];
      self->_wheelchairUseDisplayValue = v55;
      v56 = self->_healthStore;
      id v73 = v54;
      char v57 = [(HKHealthStore *)v56 _setWheelchairUse:v55 error:&v73];
      id v58 = v73;

      if ((v57 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:]();
        }
      }
      v59 = self->_healthStore;
      unint64_t currentCardioFitnessMedicationsUse = self->_currentCardioFitnessMedicationsUse;
      id v72 = v58;
      char v61 = [(HKHealthStore *)v59 _setCardioFitnessMedicationsUse:currentCardioFitnessMedicationsUse error:&v72];
      id v11 = v72;

      if ((v61 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v34, OS_LOG_TYPE_ERROR)) {
          -[ProfileCharacteristicsViewController setEditing:animated:]();
        }
      }
      if ([v49 shouldShowWarning])
      {
        v62 = [(HKHealthStore *)self->_healthStore profileIdentifier];
        uint64_t v63 = [v62 type];

        if (v63 != 3)
        {
          v64 = [MEMORY[0x1E4F2B098] shared];
          int v65 = [v64 isHealthChecklistAvailable];

          if (v65 && [(ProfileCharacteristicsViewController *)self accessType] != 3)
          {
            BOOL v66 = [(ProfileCharacteristicsViewController *)self accessType] != 5;
            objc_msgSend(MEMORY[0x1E4F67998], "showDisabledWarningWithHealthChecklistWithAge:presentingViewController:openHealthChecklistInContext:", objc_msgSend(v49, "newAge"), self, v66);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F67998], "showDisabledWarningWithAge:presentingViewController:", objc_msgSend(v49, "newAge"), self);
          }
        }
      }
      v67 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
      v68 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v67];
      v69 = (void *)[objc_alloc(MEMORY[0x1E4F2AD28]) initWithHealthStore:self->_healthStore];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_444;
      v71[3] = &unk_1E5E7CEC8;
      v71[4] = self;
      [v69 syncWithRequest:v68 reason:@"Health Details Updated" completion:v71];

      goto LABEL_43;
    }
  }
  v70 = [(ProfileCharacteristicsViewController *)self tableView];
  [v70 reloadData];
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2;
  block[3] = &unk_1E5E7CD18;
  char v12 = a2;
  objc_super v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v7 = v5;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (a2) {
    [*(id *)(a1 + 32) didUpdateName];
  }
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), *(id *)(a1 + 40));
    v2 = *(void **)(a1 + 48);
    id v3 = (id *)(*(void *)(a1 + 32) + 1112);
    objc_storeStrong(v3, v2);
  }
  else
  {
    [*(id *)(a1 + 32) _resetFirstAndLastNameValues];
    _HKInitializeLogging();
    BOOL v4 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2_cold_1((void *)a1, v4);
    }
  }
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_444(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  objc_super v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = @"Did not";
    int v9 = 138543874;
    if (a2) {
      char v8 = @"Did";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    char v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1AD1A4000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ request fast push sync successfully. Error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  healthStore = self->_healthStore;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  char v12 = [(HKHealthStore *)healthStore profileIdentifier];
  uint64_t v13 = [v12 type];

  if (v13 == 1)
  {
    uint64_t v14 = *MEMORY[0x1E4F2BFA0];
    v17[0] = *MEMORY[0x1E4F2BF98];
    v17[1] = v14;
    v18[0] = v11;
    v18[1] = v10;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    [(WDUserDefaults *)self->_userDefaults setValue:v15 forKey:*MEMORY[0x1E4F2BFB0] completion:v9];
  }
  else
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F2B360]) initWithHealthStore:self->_healthStore];
    [v16 setDisplayFirstName:v11 lastName:v10 completion:v9];
  }
}

- (void)_resetFirstAndLastNameValues
{
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setDisplayValue:self->_firstName];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setDisplayValue:self->_lastName];
  headerView = self->_headerView;
  firstName = self->_firstName;
  lastName = self->_lastName;
  [(WDProfileHeaderView *)headerView setFirstName:firstName lastName:lastName];
}

- (id)getCellForIndexPath:(id)a3
{
  switch([(ProfileCharacteristicsViewController *)self _profileRowIdentifierForSection:a3])
  {
    case 0:
      uint64_t v4 = 1208;
      goto LABEL_15;
    case 1:
      uint64_t v4 = 1216;
      goto LABEL_15;
    case 2:
      uint64_t v5 = 1224;
      birthdateCell = self->_birthdateCell;
      uint64_t v7 = [(ProfileCharacteristicsViewController *)self _displayStringForBirthDate:self->_birthdateDisplayValue];
      goto LABEL_9;
    case 3:
      uint64_t v5 = 1232;
      birthdateCell = self->_biologicalSexCell;
      uint64_t v7 = [(ProfileCharacteristicsViewController *)self _displayStringForBiologicalSex:self->_biologicalSexDisplayValue];
      goto LABEL_9;
    case 4:
      uint64_t v5 = 1240;
      birthdateCell = self->_bloodTypeCell;
      uint64_t v7 = [(ProfileCharacteristicsViewController *)self _displayStringForBloodType:self->_bloodTypeDisplayValue];
      goto LABEL_9;
    case 5:
      uint64_t v5 = 1248;
      birthdateCell = self->_fitzpatrickSkinTypeCell;
      uint64_t v7 = [(ProfileCharacteristicsViewController *)self _displayStringForFitzpatrickSkinType:self->_fitzpatrickSkinTypeDisplayValue];
      goto LABEL_9;
    case 6:
      uint64_t v5 = 1264;
      birthdateCell = self->_wheelchairUseCell;
      uint64_t v7 = [(ProfileCharacteristicsViewController *)self _displayStringForWheelchairUse:self->_wheelchairUseDisplayValue];
LABEL_9:
      char v8 = (void *)v7;
      [(WDProfileTableViewCell *)birthdateCell setDisplayValue:v7];

      id v9 = *(Class *)((char *)&self->super.super.super.super.isa + v5);
      goto LABEL_16;
    case 7:
      [(ProfileCharacteristicsViewController *)self _setPregnancyCellDisplayValueForState:self->_isPregnant];
      uint64_t v4 = 1296;
      goto LABEL_15;
    case 8:
      id v10 = [(ProfileCharacteristicsViewController *)self displayNumberOfActiveCardioFitnessMedications:self->_activeCardioFitnessMedications];
      [(UITableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v10];

      id v11 = self->_cardioFitnessMedicationsCell;
      char v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [(UITableViewCell *)v11 _setBadgeFont:v12];

      if ([(ProfileCharacteristicsViewController *)self isEditing]) {
        HKHealthKeyColor();
      }
      else {
      uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
      }
      [(UITableViewCell *)v11 _setBadgeColor:v13];

      if (!v11) {
        goto LABEL_21;
      }
      goto LABEL_17;
    case 9:
      uint64_t v4 = 1288;
      goto LABEL_15;
    case 10:
      uint64_t v4 = 1280;
LABEL_15:
      id v9 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
LABEL_16:
      id v11 = v9;
      if (!v11) {
        goto LABEL_21;
      }
LABEL_17:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v11;
        [(UITableViewCell *)v11 setShouldUseSelectedColorForDisplayValue:[(ProfileCharacteristicsViewController *)self isEditing]];
      }
      break;
    default:
LABEL_21:
      HKErrorTableViewCell();
      id v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v11;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  [v24 deselectRowAtIndexPath:v6 animated:1];
  char v7 = [(ProfileCharacteristicsViewController *)self isEditing];
  int64_t v8 = [(ProfileCharacteristicsViewController *)self _profileRowIdentifierForSection:v6];
  if ((v7 & 1) == 0)
  {
    switch(v8)
    {
      case 2:
        id v9 = [(WDProfileTableViewCell *)self->_birthdateCell displayName];
        id v10 = (void *)MEMORY[0x1E4F298B8];
        goto LABEL_23;
      case 3:
        id v9 = [(WDProfileTableViewCell *)self->_biologicalSexCell displayName];
        id v10 = (void *)MEMORY[0x1E4F298A8];
        goto LABEL_23;
      case 4:
        id v9 = [(WDProfileTableViewCell *)self->_bloodTypeCell displayName];
        id v10 = (void *)MEMORY[0x1E4F298B0];
        goto LABEL_23;
      case 5:
        id v9 = [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell displayName];
        id v10 = (void *)MEMORY[0x1E4F298C0];
        goto LABEL_23;
      case 6:
        id v9 = [(WDProfileTableViewCell *)self->_wheelchairUseCell displayName];
        id v10 = (void *)MEMORY[0x1E4F298C8];
        goto LABEL_23;
      case 7:
        goto LABEL_3;
      case 8:
        v18 = [(UITableViewCell *)self->_cardioFitnessMedicationsCell textLabel];
        id v9 = [v18 text];

        id v10 = (void *)MEMORY[0x1E4F2BA00];
LABEL_23:
        uint64_t v19 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*v10];
        if (!v19) {
          goto LABEL_29;
        }
        v20 = (void *)v19;
        uint64_t v21 = [[ProfileCharacteristicTypePermissionsViewController alloc] initWithHealthStore:self->_healthStore characteristicType:v19 firstName:self->_firstName];
        [(ProfileCharacteristicTypePermissionsViewController *)v21 setTitle:v9];
        v22 = [(ProfileCharacteristicsViewController *)self navigationController];
        [v22 pushViewController:v21 animated:1];

        break;
      case 9:
        uint64_t v23 = 1288;
        goto LABEL_27;
      case 10:
        uint64_t v23 = 1280;
LABEL_27:
        v20 = [*(id *)((char *)&self->super.super.super.super.isa + v23) textLabel];
        id v9 = [v20 text];
        break;
      default:
        id v9 = 0;
        goto LABEL_29;
    }

    goto LABEL_29;
  }
  if (v8 == 7)
  {
LABEL_3:
    [(ProfileCharacteristicsViewController *)self didTapPregnancy];
    goto LABEL_30;
  }
  id v11 = [v24 cellForRowAtIndexPath:v6];
  id v9 = (WDProfileTableViewCell *)v11;
  if (v11 == self->_betaBlockerUseCell)
  {
    uint64_t v15 = self;
    id v16 = v9;
    uint64_t v17 = 2;
  }
  else
  {
    if (v11 != self->_calciumChannelBlockerUseCell)
    {
      selectedCell = self->_selectedCell;
      [(ProfileCharacteristicsViewController *)self _resetSelectedCell];
      if (v9 != selectedCell)
      {
        objc_storeStrong((id *)&self->_selectedCell, v9);
        if (v9 == self->_birthdateCell)
        {
          if (!self->_birthdateDisplayValue)
          {
            uint64_t v13 = [(ProfileCharacteristicsViewController *)self _initialBirthdayValue];
            birthdateDisplayValue = self->_birthdateDisplayValue;
            self->_birthdateDisplayValue = v13;

            [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
            [(ProfileCharacteristicsViewController *)self _updateCellsWithDisplayValues];
          }
          [(WDProfileTableViewCell *)v9 setShouldDisplayClearButtonDuringEditing:1];
        }
        [(WDProfileTableViewCell *)v9 becomeFirstResponder];
      }
      goto LABEL_29;
    }
    uint64_t v15 = self;
    id v16 = v9;
    uint64_t v17 = 1;
  }
  [(ProfileCharacteristicsViewController *)v15 updateCheckMarksForCell:v16 option:v17];
LABEL_29:

LABEL_30:
}

- (void)updateCheckMarksForCell:(id)a3 option:(unint64_t)a4
{
  unint64_t v6 = self->_currentCardioFitnessMedicationsUse & a4;
  id v7 = a3;
  if (v6)
  {
    int64_t v8 = [(ProfileCharacteristicsViewController *)self _circleImageView];
    [v7 setEditingAccessoryView:v8];

    self->_currentCardioFitnessMedicationsUse &= ~a4;
    int v9 = self->_activeCardioFitnessMedications - 1;
  }
  else
  {
    id v10 = [(ProfileCharacteristicsViewController *)self _checkmarkedCircleImageView];
    [v7 setEditingAccessoryView:v10];

    self->_currentCardioFitnessMedicationsUse |= a4;
    int v9 = self->_activeCardioFitnessMedications + 1;
  }
  self->_activeCardioFitnessMedications = v9;
  -[ProfileCharacteristicsViewController displayNumberOfActiveCardioFitnessMedications:](self, "displayNumberOfActiveCardioFitnessMedications:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(UITableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v11];
}

- (id)displayNumberOfActiveCardioFitnessMedications:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (displayNumberOfActiveCardioFitnessMedications__onceToken != -1) {
    dispatch_once(&displayNumberOfActiveCardioFitnessMedications__onceToken, &__block_literal_global_3);
  }
  uint64_t v4 = (void *)displayNumberOfActiveCardioFitnessMedications__numberFormatter;
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  unint64_t v6 = [v4 stringFromNumber:v5];

  return v6;
}

uint64_t __86__ProfileCharacteristicsViewController_displayNumberOfActiveCardioFitnessMedications___block_invoke()
{
  displayNumberOfActiveCardioFitnessMedications__numberFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ProfileCharacteristicsViewController *)self navigationController];
  unint64_t v6 = [v5 navigationControllerSupportedInterfaceOrientations:v4];

  return v6;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4 == self)
  {
    objc_msgSend(a4, "navigationController", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v6 = [v7 navigationBar];
    [v6 _setHidesShadow:1];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4 != self)
  {
    id v7 = [(ProfileCharacteristicsViewController *)self navigationController];
    unint64_t v6 = [v7 navigationBar];
    [v6 _setHidesShadow:0];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v5 = (UIPickerView *)a3;
  if (self->_biologicalSexPicker == v5)
  {
    int64_t v6 = 4;
  }
  else if (self->_bloodTypePicker == v5)
  {
    int64_t v6 = 9;
  }
  else if (self->_fitzpatrickSkinTypePicker == v5)
  {
    int64_t v6 = 7;
  }
  else if (self->_wheelchairUsePicker == v5)
  {
    int64_t v6 = 3;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = (UIPickerView *)a3;
  int64_t v8 = v7;
  if (self->_biologicalSexPicker == v7)
  {
    uint64_t v10 = [(ProfileCharacteristicsViewController *)self _displayStringForBiologicalSex:a4];
  }
  else if (self->_bloodTypePicker == v7)
  {
    uint64_t v10 = [(ProfileCharacteristicsViewController *)self _displayStringForBloodType:a4];
  }
  else if (self->_fitzpatrickSkinTypePicker == v7)
  {
    uint64_t v10 = [(ProfileCharacteristicsViewController *)self _displayStringForFitzpatrickSkinType:a4];
  }
  else
  {
    if (self->_wheelchairUsePicker != v7)
    {
      int v9 = &stru_1F04402E8;
      goto LABEL_11;
    }
    uint64_t v10 = HKWheelchairUseDisplayName();
  }
  int v9 = (__CFString *)v10;
LABEL_11:

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = (UIPickerView *)a3;
  if (!self->_isCancelling)
  {
    if (self->_biologicalSexPicker == v7)
    {
      int64_t v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__biologicalSexDisplayValue;
    }
    else if (self->_bloodTypePicker == v7)
    {
      int64_t v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__bloodTypeDisplayValue;
    }
    else if (self->_fitzpatrickSkinTypePicker == v7)
    {
      int64_t v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__fitzpatrickSkinTypeDisplayValue;
    }
    else
    {
      if (self->_wheelchairUsePicker != v7)
      {
LABEL_11:
        int v9 = v7;
        [(ProfileCharacteristicsViewController *)self _updateCellsWithDisplayValues];
        id v7 = v9;
        goto LABEL_12;
      }
      int64_t v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__wheelchairUseDisplayValue;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v8) = (Class)a4;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)birthdateChanged:(id)a3
{
  if (!self->_isCancelling)
  {
    id v4 = a3;
    uint64_t v5 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
    int64_t v6 = [v4 date];

    objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v6);
    id v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    birthdateDisplayValue = self->_birthdateDisplayValue;
    self->_birthdateDisplayValue = v7;

    [(ProfileCharacteristicsViewController *)self _updateCellsWithDisplayValues];
  }
}

- (void)didClearBirthdate
{
  birthdateDisplayValue = self->_birthdateDisplayValue;
  self->_birthdateDisplayValue = 0;

  [(ProfileCharacteristicsViewController *)self _updateCellsWithDisplayValues];
  [(ProfileCharacteristicsViewController *)self _resetSelectedCell];
}

- (void)cancelButtonTapped:(id)a3
{
  self->_isCancelling = 1;
  objc_storeStrong((id *)&self->_birthdateDisplayValue, self->_birthdate);
  self->_int64_t biologicalSexDisplayValue = [(HKBiologicalSexObject *)self->_biologicalSexObject biologicalSex];
  self->_int64_t bloodTypeDisplayValue = [(HKBloodTypeObject *)self->_bloodTypeObject bloodType];
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setDisplayValue:self->_firstName];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setDisplayValue:self->_lastName];
  [(ProfileCharacteristicsViewController *)self setCardioFitnessMedicationCheckmarks];
  [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
  [(ProfileCharacteristicsViewController *)self _updateCellsWithDisplayValues];
  [(ProfileCharacteristicsViewController *)self setEditing:0 animated:1];
}

- (void)dismissButtonTapped:(id)a3
{
}

- (void)didUpdateName
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4F2BFA8] object:0];
}

- (void)didTapPregnancy
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://MenstrualCyclesAppPlugin.healthplugin/openPregnancyOnboarding"];
  [v3 openSensitiveURL:v2 withOptions:MEMORY[0x1E4F1CC08]];
}

- (void)_fetchDataFromHealthStore
{
  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ProfileCharacteristicsViewController__fetchDataFromHealthStore__block_invoke;
  v3[3] = &unk_1E5E7D000;
  v3[4] = self;
  [(HKHealthStore *)healthStore hk_fetchExistingDemographicInformationWithOptions:1 completion:v3];
}

void __65__ProfileCharacteristicsViewController__fetchDataFromHealthStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v30 = v3;
    uint64_t v4 = [v3 firstName];
    uint64_t v5 = *(void *)(a1 + 32);
    int64_t v6 = *(void **)(v5 + 1104);
    *(void *)(v5 + 1104) = v4;

    uint64_t v7 = [v30 lastName];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 1112);
    *(void *)(v8 + 1112) = v7;

    uint64_t v10 = [v30 dateOfBirthComponents];
    uint64_t v11 = *(void *)(a1 + 32);
    char v12 = *(void **)(v11 + 1120);
    *(void *)(v11 + 1120) = v10;

    uint64_t v13 = [v30 dateOfBirthComponents];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 1128);
    *(void *)(v14 + 1128) = v13;

    uint64_t v16 = [v30 biologicalSexObject];
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 1064);
    *(void *)(v17 + 1064) = v16;

    uint64_t v19 = [v30 biologicalSexObject];
    if (v19)
    {
      v20 = [v30 biologicalSexObject];
      *(void *)(*(void *)(a1 + 32) + 1072) = [v20 biologicalSex];
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 1072) = 0;
    }

    uint64_t v21 = [v30 bloodTypeObject];
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void **)(v22 + 1048);
    *(void *)(v22 + 1048) = v21;

    id v24 = [v30 bloodTypeObject];
    if (v24)
    {
      uint64_t v25 = [v30 bloodTypeObject];
      *(void *)(*(void *)(a1 + 32) + 1056) = [v25 bloodType];
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 1056) = 0;
    }

    v26 = [v30 fitzpatrickSkinTypeObject];
    if (v26)
    {
      id v27 = [v30 fitzpatrickSkinTypeObject];
      *(void *)(*(void *)(a1 + 32) + 1080) = [v27 skinType];
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 1080) = 0;
    }

    v28 = [v30 wheelchairUseObject];
    if (v28)
    {
      id v29 = [v30 wheelchairUseObject];
      *(void *)(*(void *)(a1 + 32) + 1088) = [v29 wheelchairUse];
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 1088) = 0;
    }

    [*(id *)(a1 + 32) setCardioFitnessMedicationCheckmarks];
    [*(id *)(a1 + 32) _updateFirstAndLastNameCellsWithDisplayValues];
    [*(id *)(a1 + 32) _updatePickersWithDisplayValues];
    [*(id *)(a1 + 32) _updateCellsWithDisplayValues];
    [*(id *)(a1 + 32) _enableEditing];
    [*(id *)(a1 + 32) _updateFooters];
    id v3 = v30;
  }
}

- (void)_startPregnancyModelQuery
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F2B168]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __65__ProfileCharacteristicsViewController__startPregnancyModelQuery__block_invoke;
  uint64_t v13 = &unk_1E5E7D028;
  objc_copyWeak(&v14, &location);
  uint64_t v4 = (HKMCPregnancyStateQuery *)[v3 initWithUpdateHandler:&v10];
  pregnancyModelQuery = self->_pregnancyModelQuery;
  self->_pregnancyModelQuery = v4;

  int64_t v6 = [(ProfileCharacteristicsViewController *)self description];
  [(HKMCPregnancyStateQuery *)self->_pregnancyModelQuery setDebugIdentifier:v6];

  _HKInitializeLogging();
  uint64_t v7 = (id)*MEMORY[0x1E4F29F60];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (id)objc_opt_class();
    int v9 = [(HKMCPregnancyStateQuery *)self->_pregnancyModelQuery debugDescription];
    *(_DWORD *)buf = 138543618;
    id v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1AD1A4000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting pregnancy model query %{public}@", buf, 0x16u);
  }
  [(HKHealthStore *)self->_healthStore executeQuery:self->_pregnancyModelQuery];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__ProfileCharacteristicsViewController__startPregnancyModelQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePregnancyModelQueryResult:v7 error:v6];
}

- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    unint64_t v7 = [a3 state];
    if (v7 <= 2) {
      self->_isPregnant = 0x100u >> (8 * v7);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ProfileCharacteristicsViewController__handlePregnancyModelQueryResult_error___block_invoke;
    block[3] = &unk_1E5E7CB60;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F60], OS_LOG_TYPE_ERROR)) {
      -[ProfileCharacteristicsViewController _handlePregnancyModelQueryResult:error:](v8, self, (uint64_t)v6);
    }
  }
}

uint64_t __79__ProfileCharacteristicsViewController__handlePregnancyModelQueryResult_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCellsWithDisplayValues];
}

- (void)_updateFooters
{
  id v3 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  uint64_t v4 = [v3 type];

  if (v4 == 3)
  {
    uint64_t v5 = [(ProfileCharacteristicsViewController *)self tableView];
    id v15 = [v5 footerViewForSection:0];

    id v6 = WDBundle();
    unint64_t v7 = [v6 localizedStringForKey:@"EDIT_HEALTH_DETAILS_FOOTER_TEXT_%@" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable-Tinker"];

    id v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, self->_firstName);
    [v15 updateWithMarkdown:v8];
    int v9 = [(ProfileCharacteristicsViewController *)self _wheelchairFooterTitle];
    uint64_t v10 = [(ProfileCharacteristicsViewController *)self tableView];
    uint64_t v11 = [v10 footerViewForSection:1];
    char v12 = [v11 textLabel];
    [v12 setText:v9];

    uint64_t v13 = [(ProfileCharacteristicsViewController *)self dataSource];
    id v14 = [(ProfileCharacteristicsViewController *)self currentSnapshot];
    [v13 applySnapshot:v14 animatingDifferences:0];
  }
}

- (void)_updateFirstAndLastNameCellsWithDisplayValues
{
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setDisplayValue:self->_firstName];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setDisplayValue:self->_lastName];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__ProfileCharacteristicsViewController__updateFirstAndLastNameCellsWithDisplayValues__block_invoke;
  v3[3] = &unk_1E5E7CB60;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __85__ProfileCharacteristicsViewController__updateFirstAndLastNameCellsWithDisplayValues__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1200) setFirstName:*(void *)(*(void *)(a1 + 32) + 1104) lastName:*(void *)(*(void *)(a1 + 32) + 1112)];
  [*(id *)(a1 + 32) _adjustHeaderFrame];
  id v3 = [*(id *)(a1 + 32) dataSource];
  id v2 = [*(id *)(a1 + 32) currentSnapshot];
  [v3 applySnapshot:v2 animatingDifferences:0];
}

- (void)_enableEditing
{
  id v3 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  if ([v3 type] != 3)
  {

    goto LABEL_5;
  }
  char v4 = [(ProfileCharacteristicsViewController *)self isEditing];

  if (v4)
  {
LABEL_5:
    uint64_t v5 = [(ProfileCharacteristicsViewController *)self editButtonItem];
    id v6 = [(ProfileCharacteristicsViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  uint64_t v7 = [MEMORY[0x1E4F2B860] isRunningStoreDemoMode] ^ 1;
  id v9 = [(ProfileCharacteristicsViewController *)self navigationItem];
  id v8 = [v9 rightBarButtonItem];
  [v8 setEnabled:v7];
}

- (void)_createHeader
{
  id v3 = objc_alloc(MEMORY[0x1E4F678A8]);
  char v4 = (WDProfileHeaderView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v4;

  [(WDProfileHeaderView *)self->_headerView setNameHidden:1];
  [(ProfileCharacteristicsViewController *)self setAvatarImage:self->_avatarImage];
  [(ProfileCharacteristicsViewController *)self _adjustHeaderFrame];
  id v6 = self->_headerView;
  id v7 = [(ProfileCharacteristicsViewController *)self tableView];
  [v7 setTableHeaderView:v6];
}

- (BOOL)shouldShowNameInHeaderView
{
  return !self->_nameRowsHidden;
}

- (void)_adjustHeaderFrame
{
  headerView = self->_headerView;
  char v4 = [(ProfileCharacteristicsViewController *)self tableView];
  [v4 frame];
  -[WDProfileHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v11), 1.79769313e308);
  double v6 = v5;
  double v8 = v7;

  id v9 = self->_headerView;
  -[WDProfileHeaderView setFrame:](v9, "setFrame:", 0.0, 0.0, v6, v8);
}

- (void)_createBarButtonItems
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  WDBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v4 = [v7 localizedStringForKey:@"CANCEL" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  double v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:self action:sel_cancelButtonTapped_];
  cancelButtonItem = self->_cancelButtonItem;
  self->_cancelButtonItem = v5;
}

- (void)_createPickers
{
  id v3 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  bloodTypePicker = self->_bloodTypePicker;
  self->_bloodTypePicker = v3;

  [(UIPickerView *)self->_bloodTypePicker setDataSource:self];
  [(UIPickerView *)self->_bloodTypePicker setDelegate:self];
  double v5 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  biologicalSexPicker = self->_biologicalSexPicker;
  self->_biologicalSexPicker = v5;

  [(UIPickerView *)self->_biologicalSexPicker setDataSource:self];
  [(UIPickerView *)self->_biologicalSexPicker setDelegate:self];
  id v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
  birthdatePicker = self->_birthdatePicker;
  self->_birthdatePicker = v7;

  [(UIDatePicker *)self->_birthdatePicker setPreferredDatePickerStyle:1];
  [(UIDatePicker *)self->_birthdatePicker setDatePickerMode:1];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [(UIDatePicker *)self->_birthdatePicker setMaximumDate:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  CGRect v11 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
  char v12 = objc_msgSend(v10, "hk_minimumDateForBirthDateWithCalendar:", v11);
  [(UIDatePicker *)self->_birthdatePicker setMinimumDate:v12];

  [(UIDatePicker *)self->_birthdatePicker addTarget:self action:sel_birthdateChanged_ forControlEvents:4096];
  uint64_t v13 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  fitzpatrickSkinTypePicker = self->_fitzpatrickSkinTypePicker;
  self->_fitzpatrickSkinTypePicker = v13;

  [(UIPickerView *)self->_fitzpatrickSkinTypePicker setDataSource:self];
  [(UIPickerView *)self->_fitzpatrickSkinTypePicker setDelegate:self];
  id v15 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
  wheelchairUsePicker = self->_wheelchairUsePicker;
  self->_wheelchairUsePicker = v15;

  [(UIPickerView *)self->_wheelchairUsePicker setDataSource:self];
  id v17 = self->_wheelchairUsePicker;
  [(UIPickerView *)v17 setDelegate:self];
}

- (void)_createCells
{
  v96[3] = *MEMORY[0x1E4F143B8];
  id v3 = (WDProfileEditableTableViewCell *)[objc_alloc(MEMORY[0x1E4F678A0]) initWithStyle:0 reuseIdentifier:@"WDProfileEditableTableViewCell"];
  firstNameCell = self->_firstNameCell;
  self->_firstNameCell = v3;

  [(WDProfileEditableTableViewCell *)self->_firstNameCell setAccessoryType:0];
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setEditingAccessoryType:0];
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setSelectionStyle:0];
  double v5 = WDBundle();
  double v6 = [v5 localizedStringForKey:@"FIRST_NAME_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileEditableTableViewCell *)self->_firstNameCell setPlaceholderValue:v6];

  id v7 = self->_firstNameCell;
  double v8 = WDBundle();
  id v9 = [v8 localizedStringForKey:@"FIRST_NAME" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileEditableTableViewCell *)v7 setDisplayName:v9];

  [(WDProfileEditableTableViewCell *)self->_firstNameCell updateAutomationIdentifiersForProfileDetail:@"FirstName"];
  uint64_t v10 = (WDProfileEditableTableViewCell *)[objc_alloc(MEMORY[0x1E4F678A0]) initWithStyle:0 reuseIdentifier:@"WDProfileEditableTableViewCell"];
  lastNameCell = self->_lastNameCell;
  self->_lastNameCell = v10;

  [(WDProfileEditableTableViewCell *)self->_lastNameCell setAccessoryType:0];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setEditingAccessoryType:0];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setSelectionStyle:0];
  char v12 = WDBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"LAST_NAME_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileEditableTableViewCell *)self->_lastNameCell setPlaceholderValue:v13];

  id v14 = self->_lastNameCell;
  id v15 = WDBundle();
  uint64_t v16 = [v15 localizedStringForKey:@"LAST_NAME" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileEditableTableViewCell *)v14 setDisplayName:v16];

  [(WDProfileEditableTableViewCell *)self->_lastNameCell updateAutomationIdentifiersForProfileDetail:@"LastName"];
  id v17 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E4F678B0]), "initWithStyle:reuseIdentifier:", 0);
  birthdateCell = self->_birthdateCell;
  self->_birthdateCell = v17;

  [(WDProfileTableViewCell *)self->_birthdateCell setEditingAccessoryType:0];
  [(WDProfileTableViewCell *)self->_birthdateCell setSelectionStyle:0];
  [(WDProfileTableViewCell *)self->_birthdateCell setAccessoryType:1];
  uint64_t v19 = [MEMORY[0x1E4F67B20] viewHostingView:self->_birthdatePicker];
  [(WDProfileTableViewCell *)self->_birthdateCell setInputView:v19];

  uint64_t v20 = WDBundle();
  uint64_t v21 = [v20 localizedStringForKey:@"BIRTHDATE_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileTableViewCell *)self->_birthdateCell setPlaceholderValue:v21];

  [(WDProfileTableViewCell *)self->_birthdateCell addClearButtonTarget:self action:sel_didClearBirthdate];
  uint64_t v22 = self->_birthdateCell;
  uint64_t v23 = WDBundle();
  id v24 = [v23 localizedStringForKey:@"BIRTHDATE" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileTableViewCell *)v22 setDisplayName:v24];

  [(WDProfileTableViewCell *)self->_birthdateCell updateAutomationIdentifiersForProfileDetail:@"Birthdate"];
  uint64_t v25 = (WDProfileTableViewCell *)[objc_alloc(MEMORY[0x1E4F678B0]) initWithStyle:0 reuseIdentifier:@"WDProfileTableViewCell"];
  biologicalSexCell = self->_biologicalSexCell;
  self->_biologicalSexCell = v25;

  [(WDProfileTableViewCell *)self->_biologicalSexCell setAccessoryType:1];
  [(WDProfileTableViewCell *)self->_biologicalSexCell setEditingAccessoryType:0];
  [(WDProfileTableViewCell *)self->_biologicalSexCell setSelectionStyle:0];
  id v27 = [MEMORY[0x1E4F67B20] viewHostingView:self->_biologicalSexPicker];
  [(WDProfileTableViewCell *)self->_biologicalSexCell setInputView:v27];

  v28 = WDBundle();
  id v29 = [v28 localizedStringForKey:@"BIOLOGICAL_SEX_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileTableViewCell *)self->_biologicalSexCell setPlaceholderValue:v29];

  id v30 = self->_biologicalSexCell;
  objc_super v31 = HKHealthKitFrameworkBundle();
  uint64_t v32 = *MEMORY[0x1E4F29E40];
  id v33 = [v31 localizedStringForKey:@"BIOLOGICAL_SEX" value:&stru_1F04402E8 table:*MEMORY[0x1E4F29E40]];
  [(WDProfileTableViewCell *)v30 setDisplayName:v33];

  [(WDProfileTableViewCell *)self->_biologicalSexCell updateAutomationIdentifiersForProfileDetail:@"BiologicalSex"];
  v34 = (WDProfileTableViewCell *)[objc_alloc(MEMORY[0x1E4F678B0]) initWithStyle:0 reuseIdentifier:@"WDProfileTableViewCell"];
  bloodTypeCell = self->_bloodTypeCell;
  self->_bloodTypeCell = v34;

  [(WDProfileTableViewCell *)self->_bloodTypeCell setAccessoryType:1];
  [(WDProfileTableViewCell *)self->_bloodTypeCell setEditingAccessoryType:0];
  [(WDProfileTableViewCell *)self->_bloodTypeCell setSelectionStyle:0];
  v36 = [MEMORY[0x1E4F67B20] viewHostingView:self->_bloodTypePicker];
  [(WDProfileTableViewCell *)self->_bloodTypeCell setInputView:v36];

  id v37 = WDBundle();
  v38 = [v37 localizedStringForKey:@"BLOOD_TYPE_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileTableViewCell *)self->_bloodTypeCell setPlaceholderValue:v38];

  v39 = self->_bloodTypeCell;
  v40 = HKHealthKitFrameworkBundle();
  int v41 = [v40 localizedStringForKey:@"BLOOD_TYPE" value:&stru_1F04402E8 table:v32];
  [(WDProfileTableViewCell *)v39 setDisplayName:v41];

  [(WDProfileTableViewCell *)self->_bloodTypeCell updateAutomationIdentifiersForProfileDetail:@"BloodType"];
  id v42 = (WDProfileTableViewCell *)[objc_alloc(MEMORY[0x1E4F678B0]) initWithStyle:0 reuseIdentifier:@"WDProfileTableViewCell"];
  fitzpatrickSkinTypeCell = self->_fitzpatrickSkinTypeCell;
  self->_fitzpatrickSkinTypeCell = v42;

  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell setAccessoryType:1];
  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell setEditingAccessoryType:0];
  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell setSelectionStyle:0];
  v44 = [MEMORY[0x1E4F67B20] viewHostingView:self->_fitzpatrickSkinTypePicker];
  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell setInputView:v44];

  id v45 = WDBundle();
  v46 = [v45 localizedStringForKey:@"FITZPATRICK_SKIN_TYPE_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell setPlaceholderValue:v46];

  v47 = self->_fitzpatrickSkinTypeCell;
  v48 = HKHealthKitFrameworkBundle();
  v49 = [v48 localizedStringForKey:@"FITZPATRICK_SKIN_TYPE" value:&stru_1F04402E8 table:v32];
  [(WDProfileTableViewCell *)v47 setDisplayName:v49];

  [(WDProfileTableViewCell *)self->_fitzpatrickSkinTypeCell updateAutomationIdentifiersForProfileDetail:@"FitzpatrickSkinType"];
  v90 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeWithIdentifier:&unk_1F0465518];
  id v50 = (WDProfileTableViewCell *)[objc_alloc(MEMORY[0x1E4F678B0]) initWithStyle:0 reuseIdentifier:@"WDProfileTableViewCell"];
  wheelchairUseCell = self->_wheelchairUseCell;
  self->_wheelchairUseCell = v50;

  [(WDProfileTableViewCell *)self->_wheelchairUseCell setAccessoryType:1];
  [(WDProfileTableViewCell *)self->_wheelchairUseCell setEditingAccessoryType:0];
  [(WDProfileTableViewCell *)self->_wheelchairUseCell setSelectionStyle:0];
  v52 = [MEMORY[0x1E4F67B20] viewHostingView:self->_wheelchairUsePicker];
  [(WDProfileTableViewCell *)self->_wheelchairUseCell setInputView:v52];

  char v53 = HKWheelchairUseDisplayName();
  [(WDProfileTableViewCell *)self->_wheelchairUseCell setPlaceholderValue:v53];

  id v54 = self->_wheelchairUseCell;
  int64_t v55 = [v90 localization];
  v56 = [v55 displayName];
  [(WDProfileTableViewCell *)v54 setDisplayName:v56];

  [(WDProfileTableViewCell *)self->_wheelchairUseCell updateAutomationIdentifiersForProfileDetail:@"WheelchairUse"];
  char v57 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"WDProfileTableViewCell"];
  pregnancyCell = self->_pregnancyCell;
  self->_pregnancyCell = v57;

  [(UITableViewCell *)self->_pregnancyCell setAccessoryType:0];
  [(UITableViewCell *)self->_pregnancyCell setEditingAccessoryType:0];
  v59 = HKHealthKeyColor();
  v60 = [(UITableViewCell *)self->_pregnancyCell textLabel];
  [v60 setTextColor:v59];

  char v61 = [(UITableViewCell *)self->_pregnancyCell textLabel];
  [v61 setNumberOfLines:0];

  v96[0] = *MEMORY[0x1E4F67960];
  uint64_t v62 = v96[0];
  v96[1] = @"HealthDetail";
  v96[2] = @"Pregnancy";
  uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:3];
  v64 = HKUIJoinStringsForAutomationIdentifier();

  [(UITableViewCell *)self->_pregnancyCell setAccessibilityIdentifier:v64];
  v95[0] = v64;
  v95[1] = @"Title";
  int v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  BOOL v66 = HKUIJoinStringsForAutomationIdentifier();
  v67 = [(UITableViewCell *)self->_pregnancyCell textLabel];
  [v67 setAccessibilityIdentifier:v66];

  v94[0] = v64;
  v94[1] = @"Value";
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v69 = HKUIJoinStringsForAutomationIdentifier();
  v70 = [(UITableViewCell *)self->_pregnancyCell detailTextLabel];
  [v70 setAccessibilityIdentifier:v69];

  [(ProfileCharacteristicsViewController *)self _setPregnancyCellDisplayValueForState:self->_isPregnant];
  v71 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"WDProfileTableViewCell"];
  cardioFitnessMedicationsCell = self->_cardioFitnessMedicationsCell;
  self->_cardioFitnessMedicationsCell = v71;

  [(UITableViewCell *)self->_cardioFitnessMedicationsCell setAccessoryType:1];
  [(UITableViewCell *)self->_cardioFitnessMedicationsCell setEditingAccessoryType:0];
  [(UITableViewCell *)self->_cardioFitnessMedicationsCell setSelectionStyle:0];
  id v73 = WDBundle();
  id v74 = [v73 localizedStringForKey:@"CARDIO_FITNESS_RELATED_MEDICATIONS" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  id v75 = [(UITableViewCell *)self->_cardioFitnessMedicationsCell textLabel];
  [v75 setText:v74];

  id v76 = [(UITableViewCell *)self->_cardioFitnessMedicationsCell textLabel];
  [v76 setNumberOfLines:0];

  id v77 = [(ProfileCharacteristicsViewController *)self displayNumberOfActiveCardioFitnessMedications:self->_activeCardioFitnessMedications];
  [(UITableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v77];

  v93[0] = v62;
  v93[1] = @"HealthDetail";
  v93[2] = @"CardioFitnessMedications";
  id v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
  id v79 = HKUIJoinStringsForAutomationIdentifier();

  [(UITableViewCell *)self->_cardioFitnessMedicationsCell setAccessibilityIdentifier:v79];
  v92[0] = v79;
  v92[1] = @"Title";
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  v81 = HKUIJoinStringsForAutomationIdentifier();
  v82 = [(UITableViewCell *)self->_cardioFitnessMedicationsCell textLabel];
  [v82 setAccessibilityIdentifier:v81];

  v91[0] = v79;
  v91[1] = @"Value";
  objc_super v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
  v84 = HKUIJoinStringsForAutomationIdentifier();
  v85 = [(UITableViewCell *)self->_cardioFitnessMedicationsCell detailTextLabel];
  [v85 setAccessibilityIdentifier:v84];

  v86 = [(ProfileCharacteristicsViewController *)self _createCalciumChannelBlockerCheckMarkCell];
  calciumChannelBlockerUseCell = self->_calciumChannelBlockerUseCell;
  self->_calciumChannelBlockerUseCell = v86;

  v88 = [(ProfileCharacteristicsViewController *)self _createBetaBlockerCheckMarkCell];
  betaBlockerUseCell = self->_betaBlockerUseCell;
  self->_betaBlockerUseCell = v88;
}

- (id)_createCalciumChannelBlockerCheckMarkCell
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:0];
  [v3 setSelectionStyle:0];
  char v4 = [(ProfileCharacteristicsViewController *)self _circleImageView];
  [(UITableViewCell *)self->_calciumChannelBlockerUseCell setEditingAccessoryView:v4];

  double v5 = WDBundle();
  double v6 = [v5 localizedStringForKey:@"CALCIUM_CHANNEL_BLOCKER_USE" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  id v7 = [v3 textLabel];
  [v7 setText:v6];

  double v8 = [v3 textLabel];
  [v8 setNumberOfLines:0];

  id v9 = WDBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"CALCIUM_CHANNEL_BLOCKER_EXAMPLES" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  CGRect v11 = [v3 detailTextLabel];
  [v11 setText:v10];

  char v12 = [v3 detailTextLabel];
  [v12 setNumberOfLines:0];

  uint64_t v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v14 = [v3 detailTextLabel];
  [v14 setTextColor:v13];

  v26[0] = *MEMORY[0x1E4F67960];
  v26[1] = @"HealthDetail";
  v26[2] = @"CalciumChannelBlocker";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  uint64_t v16 = HKUIJoinStringsForAutomationIdentifier();

  [v3 setAccessibilityIdentifier:v16];
  v25[0] = v16;
  v25[1] = @"Title";
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  __int16 v18 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v19 = [v3 textLabel];
  [v19 setAccessibilityIdentifier:v18];

  v24[0] = v16;
  v24[1] = @"Value";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v21 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v22 = [v3 detailTextLabel];
  [v22 setAccessibilityIdentifier:v21];

  return v3;
}

- (id)_createBetaBlockerCheckMarkCell
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:0];
  [v3 setSelectionStyle:0];
  char v4 = [(ProfileCharacteristicsViewController *)self _circleImageView];
  [v3 setEditingAccessoryView:v4];

  double v5 = WDBundle();
  double v6 = [v5 localizedStringForKey:@"BETA_BLOCKER_USE" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  id v7 = [v3 textLabel];
  [v7 setText:v6];

  double v8 = [v3 textLabel];
  [v8 setNumberOfLines:0];

  id v9 = WDBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"BETA_BLOCKER_EXAMPLES" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  CGRect v11 = [v3 detailTextLabel];
  [v11 setText:v10];

  char v12 = [v3 detailTextLabel];
  [v12 setNumberOfLines:0];

  uint64_t v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v14 = [v3 detailTextLabel];
  [v14 setTextColor:v13];

  v26[0] = *MEMORY[0x1E4F67960];
  v26[1] = @"HealthDetail";
  v26[2] = @"BetaBlocker";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  uint64_t v16 = HKUIJoinStringsForAutomationIdentifier();

  [v3 setAccessibilityIdentifier:v16];
  v25[0] = v16;
  v25[1] = @"Title";
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  __int16 v18 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v19 = [v3 textLabel];
  [v19 setAccessibilityIdentifier:v18];

  v24[0] = v16;
  v24[1] = @"Value";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v21 = HKUIJoinStringsForAutomationIdentifier();
  uint64_t v22 = [v3 detailTextLabel];
  [v22 setAccessibilityIdentifier:v21];

  return v3;
}

- (void)setCardioFitnessMedicationCheckmarks
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Failed to get Cardio Fitness Medications Use status: %@", v2, v3, v4, v5, v6);
}

- (id)_circleImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  uint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
  [v2 setImage:v3];

  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  uint8_t v6 = [v4 configurationWithFont:v5];
  [v2 setPreferredSymbolConfiguration:v6];

  [v2 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  return v2;
}

- (id)_checkmarkedCircleImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  uint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
  [v2 setImage:v3];

  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  uint8_t v6 = [v4 configurationWithFont:v5];
  [v2 setPreferredSymbolConfiguration:v6];

  [v2 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  return v2;
}

- (int64_t)_profileRowIdentifierForSection:(id)a3
{
  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  id v5 = a3;
  uint8_t v6 = -[NSArray objectAtIndex:](orderedSectionIdentifiers, "objectAtIndex:", [v5 section]);
  id v7 = [(NSDictionary *)self->_orderedRowIdentifiersBySectionIdentifier objectForKey:v6];
  uint64_t v8 = [v5 row];

  id v9 = [v7 objectAtIndex:v8];

  int64_t v10 = [v9 integerValue];
  return v10;
}

- (void)_updatePickersWithDisplayValues
{
  birthdateDisplayValue = self->_birthdateDisplayValue;
  uint64_t v4 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
  id v5 = v4;
  if (birthdateDisplayValue)
  {
    uint8_t v6 = [v4 dateFromComponents:self->_birthdateDisplayValue];
  }
  else
  {
    id v7 = [(ProfileCharacteristicsViewController *)self _initialBirthdayValue];
    uint8_t v6 = [v5 dateFromComponents:v7];
  }
  [(UIDatePicker *)self->_birthdatePicker setDate:v6];

  [(UIPickerView *)self->_biologicalSexPicker selectRow:self->_biologicalSexDisplayValue inComponent:0 animated:0];
  [(UIPickerView *)self->_bloodTypePicker selectRow:self->_bloodTypeDisplayValue inComponent:0 animated:0];
  [(UIPickerView *)self->_fitzpatrickSkinTypePicker selectRow:self->_fitzpatrickSkinTypeDisplayValue inComponent:0 animated:0];
  wheelchairUsePicker = self->_wheelchairUsePicker;
  int64_t wheelchairUseDisplayValue = self->_wheelchairUseDisplayValue;
  [(UIPickerView *)wheelchairUsePicker selectRow:wheelchairUseDisplayValue inComponent:0 animated:0];
}

- (void)_updateCellsWithDisplayValues
{
  birthdateCell = self->_birthdateCell;
  uint64_t v4 = [(ProfileCharacteristicsViewController *)self _displayStringForBirthDate:self->_birthdateDisplayValue];
  [(WDProfileTableViewCell *)birthdateCell setDisplayValue:v4];

  biologicalSexCell = self->_biologicalSexCell;
  uint8_t v6 = [(ProfileCharacteristicsViewController *)self _displayStringForBiologicalSex:self->_biologicalSexDisplayValue];
  [(WDProfileTableViewCell *)biologicalSexCell setDisplayValue:v6];

  bloodTypeCell = self->_bloodTypeCell;
  uint64_t v8 = [(ProfileCharacteristicsViewController *)self _displayStringForBloodType:self->_bloodTypeDisplayValue];
  [(WDProfileTableViewCell *)bloodTypeCell setDisplayValue:v8];

  fitzpatrickSkinTypeCell = self->_fitzpatrickSkinTypeCell;
  int64_t v10 = [(ProfileCharacteristicsViewController *)self _displayStringForFitzpatrickSkinType:self->_fitzpatrickSkinTypeDisplayValue];
  [(WDProfileTableViewCell *)fitzpatrickSkinTypeCell setDisplayValue:v10];

  wheelchairUseCell = self->_wheelchairUseCell;
  char v12 = [(ProfileCharacteristicsViewController *)self _displayStringForWheelchairUse:self->_wheelchairUseDisplayValue];
  [(WDProfileTableViewCell *)wheelchairUseCell setDisplayValue:v12];

  BOOL isPregnant = self->_isPregnant;
  [(ProfileCharacteristicsViewController *)self _setPregnancyCellDisplayValueForState:isPregnant];
}

- (void)_resetSelectedCell
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(WDProfileTableViewCell *)self->_selectedCell setShouldDisplayClearButtonDuringEditing:0];
  }
  [(WDProfileTableViewCell *)self->_selectedCell resignFirstResponder];
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;
}

- (id)_displayStringForBirthDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (_displayStringForBirthDate__onceToken != -1) {
      dispatch_once(&_displayStringForBirthDate__onceToken, &__block_literal_global_584);
    }
    id v5 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
    uint8_t v6 = [v5 dateFromComponents:v4];

    id v7 = NSString;
    uint64_t v8 = [(id)_displayStringForBirthDate__birthdateFormatter stringFromDate:v6];
    id v9 = [(ProfileCharacteristicsViewController *)self _dateAsAge:v6];
    int64_t v10 = [v7 stringWithFormat:@"%@ (%@)", v8, v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

uint64_t __67__ProfileCharacteristicsViewController__displayStringForBirthDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_displayStringForBirthDate__birthdateFormatter;
  _displayStringForBirthDate__birthdateFormatter = (uint64_t)v0;

  id v2 = (void *)_displayStringForBirthDate__birthdateFormatter;
  return [v2 setDateStyle:2];
}

- (id)_dateAsAge:(id)a3
{
  uint64_t v3 = _dateAsAge__onceToken[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(_dateAsAge__onceToken, &__block_literal_global_590);
  }
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint8_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 components:4 fromDate:v4 toDate:v6 options:0];

  uint64_t v8 = (void *)_dateAsAge__ageFormatter;
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v7, "year"));
  int64_t v10 = [v8 stringFromNumber:v9];

  return v10;
}

uint64_t __51__ProfileCharacteristicsViewController__dateAsAge___block_invoke()
{
  _dateAsAge__ageFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  return MEMORY[0x1F41817F8]();
}

- (id)_initialBirthdayValue
{
  uint64_t v3 = [(ProfileCharacteristicsViewController *)self _meContact];
  uint64_t v4 = [v3 birthday];
  if (!v4) {
    goto LABEL_6;
  }
  id v5 = (void *)v4;
  uint8_t v6 = [v3 birthday];
  if ([v6 year] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  id v7 = [v3 birthday];
  if ([v7 month] == 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_5:
LABEL_6:
    uint64_t v8 = HKUIDefaultGregorianBirthday();
    goto LABEL_7;
  }
  int64_t v10 = [v3 birthday];
  uint64_t v11 = [v10 day];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v13 = [v3 birthday];
  objc_msgSend(v12, "setYear:", objc_msgSend(v13, "year"));

  id v14 = [v3 birthday];
  objc_msgSend(v12, "setMonth:", objc_msgSend(v14, "month"));

  id v15 = [v3 birthday];
  objc_msgSend(v12, "setDay:", objc_msgSend(v15, "day"));

  uint64_t v16 = [v3 birthday];
  id v17 = [v16 calendar];
  [v12 setCalendar:v17];

  __int16 v18 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v19 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
  uint64_t v20 = objc_msgSend(v18, "hk_minimumDateForBirthDateWithCalendar:", v19);

  uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v22 = [(ProfileCharacteristicsViewController *)self _birthdayCalendar];
  uint64_t v23 = [v22 dateFromComponents:v12];

  if ([v23 compare:v21] == 1 || objc_msgSend(v23, "compare:", v20) == -1)
  {
    HKUIDefaultGregorianBirthday();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = v12;
  }
  uint64_t v8 = v24;

LABEL_7:
  return v8;
}

- (id)_meContact
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = 0;
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    v9[0] = *MEMORY[0x1E4F1AD90];
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v4 = objc_opt_new();
    id v8 = 0;
    id v2 = objc_msgSend(v4, "_ios_meContactWithKeysToFetch:error:", v3, &v8);
    id v5 = v8;

    if (v2) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[ProfileCharacteristicsViewController _meContact]();
      }
    }
  }
  return v2;
}

- (id)_displayStringForBiologicalSex:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"OTHER";
      goto LABEL_7;
    case 2:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"MALE";
      goto LABEL_7;
    case 1:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"FEMALE";
LABEL_7:
      BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

      goto LABEL_9;
  }
  BOOL v6 = 0;
LABEL_9:
  return v6;
}

- (id)_displayStringForBloodType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_a+";
      goto LABEL_11;
    case 2:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_a-";
      goto LABEL_11;
    case 3:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_b+";
      goto LABEL_11;
    case 4:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_b-";
      goto LABEL_11;
    case 5:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_ab+";
      goto LABEL_11;
    case 6:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_ab-";
      goto LABEL_11;
    case 7:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_o+";
      goto LABEL_11;
    case 8:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"blood_type_o-";
LABEL_11:
      BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

      break;
    default:
      BOOL v6 = 0;
      break;
  }
  return v6;
}

- (id)_displayStringForFitzpatrickSkinType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_I";
      goto LABEL_9;
    case 2:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_II";
      goto LABEL_9;
    case 3:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_III";
      goto LABEL_9;
    case 4:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_IV";
      goto LABEL_9;
    case 5:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_V";
      goto LABEL_9;
    case 6:
      uint64_t v3 = WDBundle();
      uint64_t v4 = v3;
      id v5 = @"fitzpatrick_skin_type_VI";
LABEL_9:
      BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

      break;
    default:
      BOOL v6 = 0;
      break;
  }
  return v6;
}

- (id)_displayStringForWheelchairUse:(int64_t)a3
{
  if (a3)
  {
    uint64_t v4 = HKWheelchairUseDisplayName();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_setPregnancyCellDisplayValueForState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v6 = v5;
  if (v3) {
    id v7 = @"HEALTH_DETAILS_EDIT_PREGNANCY";
  }
  else {
    id v7 = @"HEALTH_DETAILS_ADD_PREGNANCY";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1F04402E8 table:@"HealthUI-Localizable-Pregnancy"];
  [(UITableViewCell *)self->_pregnancyCell setText:v8];

  pregnancyCell = self->_pregnancyCell;
  [(UITableViewCell *)pregnancyCell setNeedsUpdateConstraints];
}

- (void)_timeZoneDidChange:(id)a3
{
  gregorianCalendar = self->_gregorianCalendar;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAF0], "systemTimeZone", a3);
  [(NSCalendar *)gregorianCalendar setTimeZone:v5];

  birthdatePicker = self->_birthdatePicker;
  id v7 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [(UIDatePicker *)birthdatePicker setTimeZone:v7];

  [(ProfileCharacteristicsViewController *)self _updatePickersWithDisplayValues];
}

- (id)_birthdayCalendar
{
  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    id v5 = self->_gregorianCalendar;
    self->_gregorianCalendar = v4;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsNavigationDonatingDelegate);
  return (HKHealthSettingsNavigationDonating *)WeakRetained;
}

- (void)setSettingsNavigationDonatingDelegate:(id)a3
{
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (void)setAvatarImageView:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (ProfileCharacteristicDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (HKBirthdateChangeManager)birthdateChangeManager
{
  return self->_birthdateChangeManager;
}

- (void)setBirthdateChangeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_birthdateChangeManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_orderedRowIdentifiersBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_pregnancyModelQuery, 0);
  objc_storeStrong((id *)&self->_pregnancyCell, 0);
  objc_storeStrong((id *)&self->_calciumChannelBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_betaBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_cardioFitnessMedicationsCell, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCell, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeCell, 0);
  objc_storeStrong((id *)&self->_bloodTypeCell, 0);
  objc_storeStrong((id *)&self->_biologicalSexCell, 0);
  objc_storeStrong((id *)&self->_birthdateCell, 0);
  objc_storeStrong((id *)&self->_lastNameCell, 0);
  objc_storeStrong((id *)&self->_firstNameCell, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_customLeftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_wheelchairUsePicker, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypePicker, 0);
  objc_storeStrong((id *)&self->_biologicalSexPicker, 0);
  objc_storeStrong((id *)&self->_bloodTypePicker, 0);
  objc_storeStrong((id *)&self->_birthdatePicker, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_birthdateDisplayValue, 0);
  objc_storeStrong((id *)&self->_birthdate, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)setEditing:animated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting cardio fitness medications use: %@", v2, v3, v4, v5, v6);
}

- (void)setEditing:animated:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting wheelchair use: %@", v2, v3, v4, v5, v6);
}

- (void)setEditing:animated:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting Fitzpatrick skin type: %@", v2, v3, v4, v5, v6);
}

- (void)setEditing:animated:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting birthdate: %@", v2, v3, v4, v5, v6);
}

- (void)setEditing:animated:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting blood type: %@", v2, v3, v4, v5, v6);
}

- (void)setEditing:animated:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error setting biological sex: %@", v2, v3, v4, v5, v6);
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_1AD1A4000, a2, OS_LOG_TYPE_ERROR, "Error setting name to %@ %@: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_handlePregnancyModelQueryResult:(uint64_t)a3 error:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  uint64_t v6 = [a2 description];
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_1AD1A4000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error in pregnancy state query: %{public}@", v7, 0x16u);
}

- (void)_meContact
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AD1A4000, v0, v1, "Error getting Me card: %{public}@", v2, v3, v4, v5, v6);
}

@end