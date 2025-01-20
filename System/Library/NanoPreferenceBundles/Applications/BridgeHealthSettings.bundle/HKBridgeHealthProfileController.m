@interface HKBridgeHealthProfileController
+ (id)_backgroundColor;
+ (id)_textColor;
+ (id)orderedRowIdentifiersBySectionIdentifierWithCardioFitnessMedicationsSectionHidden:(BOOL)a3 deviceSupportsWheelchair:(BOOL)a4;
+ (id)orderedSectionIdentifiersWithCardioFitnessMedicationsSectionHidden:(BOOL)a3 deviceSupportsWheelchair:(BOOL)a4;
- (BOOL)_isTinkerDevice;
- (BOOL)loadingDisplayNameForTinker;
- (BOOL)showMedicalID;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)wheelchairUseChanged;
- (BridgeHealthProfileDiffableDataSource)dataSource;
- (HKBirthdateChangeManager)birthdateChangeManager;
- (HKBridgeHealthProfileController)initWithHealthStore:(id)a3 activeTinkerDevice:(id)a4;
- (HKCloudSyncObserver)cloudSyncObserver;
- (HKHealthStore)healthStore;
- (NRDevice)activeTinkerDevice;
- (NSDateComponents)dateOfBirth;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSLengthFormatter)lengthFormatter;
- (NSMassFormatter)massFormatter;
- (NSString)firstName;
- (UIActivityIndicatorView)tinkerSyncActivityIndicator;
- (id)_birthdayDescription;
- (id)_checkmarkedCircleImageView;
- (id)_circleImageView;
- (id)_createBetaBlockerCheckMarkCell;
- (id)_createCalciumChannelBlockerCheckMarkCell;
- (id)_dateFromGregorianComponents:(id)a3;
- (id)_displayStringForBiologicalSex:(int64_t)a3;
- (id)_displayStringForWeight:(int64_t)a3;
- (id)_displayStringForWheelchairUse:(int64_t)a3;
- (id)_minDate;
- (id)_pickerDisplayStringForHeightForRow:(int64_t)a3 forComponent:(int64_t)a4;
- (id)_textDisplayStringForHeight:(id)a3;
- (id)displayNumberOfActiveCardioFitnessMedications:(int)a3;
- (id)getCellForIndexPath:(id)a3;
- (id)localizedPaneTitle;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)_numFeetInInches:(int64_t)a3;
- (int64_t)_profileRowIdentifierForSection:(int64_t)a3 forRow:(int64_t)a4;
- (int64_t)biologicalSex;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)wheelchairUse;
- (void)_birthdateChanged:(id)a3;
- (void)_cancel;
- (void)_createCells;
- (void)_createPickers;
- (void)_heightPickerUpdated;
- (void)_loadDisplayNameForTinker;
- (void)_mainQueue_startActivityIndicator;
- (void)_mainQueue_stopActivityIndicator;
- (void)_makeCardioFitnessMedicationsAppear:(BOOL)a3;
- (void)_requestWheelchairDiagnosticsSubmissionIfNecessary;
- (void)_resetSelectedCell;
- (void)_setBiologicalSex:(int64_t)a3;
- (void)_setDefaultValuesOnBirthdayPickerIfRequired;
- (void)_setDefaultValuesOnHeightPickerIfRequired;
- (void)_setDefaultValuesOnWeightPickerIfRequired;
- (void)_setHeight:(id)a3;
- (void)_setHeightAndWeightProperties;
- (void)_setNavigationButtonsOnEditCompletion;
- (void)_setNavigationButtonsToEnableEditing;
- (void)_setWeight:(id)a3;
- (void)_setWheelchairUse:(int64_t)a3;
- (void)_setupCloudSyncObserverForTinkerProfile;
- (void)_toggleEdit;
- (void)_updateDisplayWithHeightValue:(id)a3;
- (void)_updateDisplayWithWeightValue:(id)a3;
- (void)_updateHeight;
- (void)_updatePickersForHeight:(id)a3;
- (void)_updateUserCharacteristics;
- (void)_updateWeight;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setActiveTinkerDevice:(id)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setBirthdateChangeManager:(id)a3;
- (void)setCardioFitnessMedicationCheckmarks;
- (void)setCloudSyncObserver:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setLengthFormatter:(id)a3;
- (void)setLoadingDisplayNameForTinker:(BOOL)a3;
- (void)setMassFormatter:(id)a3;
- (void)setShowMedicalID:(BOOL)a3;
- (void)setTinkerSyncActivityIndicator:(id)a3;
- (void)setWheelchairUse:(int64_t)a3;
- (void)setWheelchairUseChanged:(BOOL)a3;
- (void)setupDataSource;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCheckMarksForCell:(id)a3 option:(unint64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKBridgeHealthProfileController

+ (id)_backgroundColor
{
  return +[UIColor colorWithRed:0.109803922 green:0.109803922 blue:0.109803922 alpha:1.0];
}

+ (id)_textColor
{
  return +[UIColor grayColor];
}

- (HKBridgeHealthProfileController)initWithHealthStore:(id)a3 activeTinkerDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HKBridgeHealthProfileController;
  v9 = [(HKBridgeHealthProfileController *)&v22 initWithStyle:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_activeTinkerDevice, a4);
    if (v8)
    {
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E5E86144-6C47-4545-8F52-A5D468C1DA85"];
      v10->_deviceSupportsWheelchair = [v8 supportsCapability:v11];

      v10->_cardioFitnessMedicationsSectionHidden = 1;
    }
    else
    {
      v12 = +[NRPairedDeviceRegistry sharedInstance];
      v13 = [v12 getActivePairedDevice];
      id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E5E86144-6C47-4545-8F52-A5D468C1DA85"];
      v10->_deviceSupportsWheelchair = [v13 supportsCapability:v14];

      v10->_cardioFitnessMedicationsSectionHidden = 0;
    }
    uint64_t v15 = +[HKBridgeHealthProfileController orderedSectionIdentifiersWithCardioFitnessMedicationsSectionHidden:deviceSupportsWheelchair:](HKBridgeHealthProfileController, "orderedSectionIdentifiersWithCardioFitnessMedicationsSectionHidden:deviceSupportsWheelchair:");
    orderedSectionIdentifiers = v10->_orderedSectionIdentifiers;
    v10->_orderedSectionIdentifiers = (NSArray *)v15;

    uint64_t v17 = +[HKBridgeHealthProfileController orderedRowIdentifiersBySectionIdentifierWithCardioFitnessMedicationsSectionHidden:v10->_cardioFitnessMedicationsSectionHidden deviceSupportsWheelchair:v10->_deviceSupportsWheelchair];
    orderedRowIdentifiersBySectionIdentifier = v10->_orderedRowIdentifiersBySectionIdentifier;
    v10->_orderedRowIdentifiersBySectionIdentifier = (NSDictionary *)v17;

    v19 = (HKBirthdateChangeManager *)[objc_alloc((Class)HKBirthdateChangeManager) initWithHealthStore:v7];
    birthdateChangeManager = v10->_birthdateChangeManager;
    v10->_birthdateChangeManager = v19;
  }
  return v10;
}

- (void)_setupCloudSyncObserverForTinkerProfile
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  v4 = (HKCloudSyncObserver *)[objc_alloc((Class)HKCloudSyncObserver) initWithHealthStore:self->_healthStore delegate:self];
  cloudSyncObserver = self->_cloudSyncObserver;
  self->_cloudSyncObserver = v4;

  v6 = self->_cloudSyncObserver;

  [(HKCloudSyncObserver *)v6 startObservingSyncStatus];
}

- (void)_mainQueue_startActivityIndicator
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  tinkerSyncActivityIndicator = self->_tinkerSyncActivityIndicator;
  if (!tinkerSyncActivityIndicator)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    v5 = self->_tinkerSyncActivityIndicator;
    self->_tinkerSyncActivityIndicator = v4;

    [(UIActivityIndicatorView *)self->_tinkerSyncActivityIndicator setHidesWhenStopped:1];
    v6 = self->_tinkerSyncActivityIndicator;
    id v7 = [(HKBridgeHealthProfileController *)self tableView];
    [v7 setBackgroundView:v6];

    tinkerSyncActivityIndicator = self->_tinkerSyncActivityIndicator;
  }
  [(UIActivityIndicatorView *)tinkerSyncActivityIndicator startAnimating];
  id v8 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v8 setRightBarButtonItem:0];
}

- (void)_mainQueue_stopActivityIndicator
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(HKBridgeHealthProfileController *)self setupDataSource];
  [(HKBridgeHealthProfileController *)self _updateUserCharacteristics];
  [(UIActivityIndicatorView *)self->_tinkerSyncActivityIndicator stopAnimating];
  editButton = self->_editButton;
  id v4 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v4 setRightBarButtonItem:editButton];
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4600;
  v6[3] = &unk_184A0;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

+ (id)orderedSectionIdentifiersWithCardioFitnessMedicationsSectionHidden:(BOOL)a3 deviceSupportsWheelchair:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [v6 addObject:&off_193D8];
  if (v4) {
    [v6 addObject:&off_193F0];
  }
  if (!a3) {
    [v6 addObject:&off_19408];
  }
  id v7 = [v6 copy];

  return v7;
}

+ (id)orderedRowIdentifiersBySectionIdentifierWithCardioFitnessMedicationsSectionHidden:(BOOL)a3 deviceSupportsWheelchair:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObject:&off_19508 forKey:&off_193D8];
  if (v4) {
    [v6 setObject:&off_19520 forKey:&off_193F0];
  }
  if (!a3) {
    [v6 setObject:&off_19538 forKey:&off_19408];
  }
  id v7 = [v6 copy];

  return v7;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HEALTH_DETAILS" value:&stru_18860 table:@"Localizable"];

  return v3;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)HKBridgeHealthProfileController;
  [(HKBridgeHealthProfileController *)&v27 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"HEALTH_DETAILS" value:&stru_18860 table:@"Localizable"];
  [(HKBridgeHealthProfileController *)self setTitle:v4];

  id v5 = [(HKBridgeHealthProfileController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];

  id v6 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
  [v6 lineHeight];
  double v8 = v7 * 3.0;
  v9 = [(HKBridgeHealthProfileController *)self tableView];
  [v9 setEstimatedRowHeight:v8];

  v10 = [(HKBridgeHealthProfileController *)self tableView];
  [v10 setAllowsSelectionDuringEditing:1];

  [(HKBridgeHealthProfileController *)self setEditing:0];
  id v11 = [(HKBridgeHealthProfileController *)self tableView];
  [v11 setAllowsSelection:0];

  id v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"EDIT_BUTTON" value:&stru_18860 table:@"Localizable"];
  uint64_t v15 = (UIBarButtonItem *)[v12 initWithTitle:v14 style:0 target:self action:"_toggleEdit"];
  editButton = self->_editButton;
  self->_editButton = v15;

  uint64_t v17 = self->_editButton;
  v18 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v18 setRightBarButtonItem:v17];

  [(HKBridgeHealthProfileController *)self _createPickers];
  [(HKBridgeHealthProfileController *)self _createCells];
  [(HKBridgeHealthProfileController *)self _setHeightAndWeightProperties];
  [(HKBridgeHealthProfileController *)self setCardioFitnessMedicationCheckmarks];
  if ([(HKBridgeHealthProfileController *)self _isTinkerDevice])
  {
    self->_loadingDisplayNameForTinker = 1;
    [(HKBridgeHealthProfileController *)self _loadDisplayNameForTinker];
    [(HKBridgeHealthProfileController *)self _setupCloudSyncObserverForTinkerProfile];
  }
  objc_initWeak(&location, self);
  v19 = [BridgeHealthProfileDiffableDataSource alloc];
  v20 = [(HKBridgeHealthProfileController *)self tableView];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_4BC8;
  v24[3] = &unk_184C8;
  objc_copyWeak(&v25, &location);
  v24[4] = self;
  v21 = [(BridgeHealthProfileDiffableDataSource *)v19 initWithTableView:v20 cellProvider:v24];
  [(HKBridgeHealthProfileController *)self setDataSource:v21];

  if ([(HKBridgeHealthProfileController *)self _isTinkerDevice])
  {
    objc_super v22 = [(HKBridgeHealthProfileController *)self dataSource];
    v23 = objc_opt_new();
    [v22 applySnapshot:v23 animatingDifferences:0];
  }
  else
  {
    [(HKBridgeHealthProfileController *)self setupDataSource];
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)setupDataSource
{
  v3 = [(HKBridgeHealthProfileController *)self dataSource];
  [v3 setDefaultRowAnimation:0];

  id v4 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [(HKBridgeHealthProfileController *)self setCurrentSnapshot:v4];

  id v5 = [(HKBridgeHealthProfileController *)self currentSnapshot];
  [v5 appendSectionsWithIdentifiers:self->_orderedSectionIdentifiers];

  id v6 = [(HKBridgeHealthProfileController *)self currentSnapshot];
  double v7 = [(NSDictionary *)self->_orderedRowIdentifiersBySectionIdentifier objectForKey:&off_193D8];
  [v6 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&off_193D8];

  if (self->_deviceSupportsWheelchair)
  {
    double v8 = [(HKBridgeHealthProfileController *)self currentSnapshot];
    v9 = [(NSDictionary *)self->_orderedRowIdentifiersBySectionIdentifier objectForKey:&off_193F0];
    [v8 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:&off_193F0];
  }
  if (!self->_cardioFitnessMedicationsSectionHidden)
  {
    v10 = [(HKBridgeHealthProfileController *)self currentSnapshot];
    [v10 appendItemsWithIdentifiers:&off_19550 intoSectionWithIdentifier:&off_19408];
  }
  id v11 = [(HKBridgeHealthProfileController *)self dataSource];
  id v12 = [(HKBridgeHealthProfileController *)self currentSnapshot];
  [v11 applySnapshot:v12 animatingDifferences:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKBridgeHealthProfileController;
  [(HKBridgeHealthProfileController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKBridgeHealthProfileController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    unsigned __int8 v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4FB0;
      block[3] = &unk_184F0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (int64_t)_profileRowIdentifierForSection:(int64_t)a3 forRow:(int64_t)a4
{
  orderedRowIdentifiersBySectionIdentifier = self->_orderedRowIdentifiersBySectionIdentifier;
  id v6 = +[NSNumber numberWithInteger:a3];
  double v7 = [(NSDictionary *)orderedRowIdentifiersBySectionIdentifier objectForKey:v6];
  unsigned __int8 v8 = [v7 objectAtIndex:a4];

  id v9 = [v8 integerValue];
  return (int64_t)v9;
}

- (id)getCellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [v4 row];

  unint64_t v7 = [(HKBridgeHealthProfileController *)self _profileRowIdentifierForSection:v5 forRow:v6];
  if (v7 > 7 || (id v8 = *(id *)((char *)&self->super.super.super.super.isa + *off_18670[v7])) == 0)
  {
    HKErrorTableViewCell();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_createPickers
{
  v3 = objc_alloc_init(_BHSHealthProfileDatePicker);
  birthdatePicker = self->_birthdatePicker;
  self->_birthdatePicker = v3;

  [(_BHSHealthProfileDatePicker *)self->_birthdatePicker setDatePickerMode:1];
  id v5 = self->_birthdatePicker;
  id v6 = +[NSTimeZone localTimeZone];
  [(_BHSHealthProfileDatePicker *)v5 setTimeZone:v6];

  unint64_t v7 = self->_birthdatePicker;
  id v8 = +[NSDate date];
  [(_BHSHealthProfileDatePicker *)v7 setMaximumDate:v8];

  id v9 = self->_birthdatePicker;
  objc_super v10 = [(HKBridgeHealthProfileController *)self _minDate];
  [(_BHSHealthProfileDatePicker *)v9 setMinimumDate:v10];

  id v11 = self->_birthdatePicker;
  id v12 = [(id)objc_opt_class() _textColor];
  [(_BHSHealthProfileDatePicker *)v11 _setTextColor:v12];

  [(_BHSHealthProfileDatePicker *)self->_birthdatePicker _setHighlightsToday:0];
  [(_BHSHealthProfileDatePicker *)self->_birthdatePicker addTarget:self action:"_birthdateChanged:" forControlEvents:4096];
  [(_BHSHealthProfileDatePicker *)self->_birthdatePicker _setUsesBlackChrome:1];
  id v13 = self->_birthdatePicker;
  id v14 = [(id)objc_opt_class() _backgroundColor];
  [(_BHSHealthProfileDatePicker *)v13 setBackgroundColor:v14];

  uint64_t v15 = objc_alloc_init(_BHSHealthProfilePickerView);
  biologicalSexPicker = self->_biologicalSexPicker;
  self->_biologicalSexPicker = v15;

  [(_BHSHealthProfilePickerView *)self->_biologicalSexPicker setDataSource:self];
  [(_BHSHealthProfilePickerView *)self->_biologicalSexPicker setDelegate:self];
  uint64_t v17 = [(id)objc_opt_class() _backgroundColor];
  [(_BHSHealthProfilePickerView *)self->_biologicalSexPicker setBackgroundColor:v17];

  v18 = objc_alloc_init(_BHSHealthProfilePickerView);
  heightPicker = self->_heightPicker;
  self->_heightPicker = v18;

  [(_BHSHealthProfilePickerView *)self->_heightPicker setDataSource:self];
  [(_BHSHealthProfilePickerView *)self->_heightPicker setDelegate:self];
  v20 = [(id)objc_opt_class() _backgroundColor];
  [(_BHSHealthProfilePickerView *)self->_heightPicker setBackgroundColor:v20];

  v21 = objc_alloc_init(_BHSHealthProfilePickerView);
  weightPicker = self->_weightPicker;
  self->_weightPicker = v21;

  [(_BHSHealthProfilePickerView *)self->_weightPicker setDataSource:self];
  [(_BHSHealthProfilePickerView *)self->_weightPicker setDelegate:self];
  v23 = [(id)objc_opt_class() _backgroundColor];
  [(_BHSHealthProfilePickerView *)self->_weightPicker setBackgroundColor:v23];

  v24 = objc_alloc_init(_BHSHealthProfilePickerView);
  wheelchairUsePicker = self->_wheelchairUsePicker;
  self->_wheelchairUsePicker = v24;

  [(_BHSHealthProfilePickerView *)self->_wheelchairUsePicker setDataSource:self];
  [(_BHSHealthProfilePickerView *)self->_wheelchairUsePicker setDelegate:self];
  id v26 = [(id)objc_opt_class() _backgroundColor];
  [(_BHSHealthProfilePickerView *)self->_wheelchairUsePicker setBackgroundColor:v26];
}

- (void)_createCells
{
  v3 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  birthdateCell = self->_birthdateCell;
  self->_birthdateCell = v3;

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BIRTHDATE" value:&stru_18860 table:@"Localizable"];
  unint64_t v7 = [(HKBridgeHealthProfileTableViewCell *)self->_birthdateCell textLabel];
  [v7 setText:v6];

  [(HKBridgeHealthProfileTableViewCell *)self->_birthdateCell setInputView:self->_birthdatePicker];
  id v8 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  biologicalSexCell = self->_biologicalSexCell;
  self->_biologicalSexCell = v8;

  objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"BIOLOGICAL_SEX" value:&stru_18860 table:@"Localizable"];
  id v12 = [(HKBridgeHealthProfileTableViewCell *)self->_biologicalSexCell textLabel];
  [v12 setText:v11];

  [(HKBridgeHealthProfileTableViewCell *)self->_biologicalSexCell setInputView:self->_biologicalSexPicker];
  id v13 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  heightCell = self->_heightCell;
  self->_heightCell = v13;

  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"HEIGHT" value:&stru_18860 table:@"Localizable"];
  uint64_t v17 = [(HKBridgeHealthProfileTableViewCell *)self->_heightCell textLabel];
  [v17 setText:v16];

  [(HKBridgeHealthProfileTableViewCell *)self->_heightCell setInputView:self->_heightPicker];
  v18 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  weightCell = self->_weightCell;
  self->_weightCell = v18;

  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"WEIGHT" value:&stru_18860 table:@"Localizable"];
  objc_super v22 = [(HKBridgeHealthProfileTableViewCell *)self->_weightCell textLabel];
  [v22 setText:v21];

  [(HKBridgeHealthProfileTableViewCell *)self->_weightCell setInputView:self->_weightPicker];
  v23 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  wheelchairUseCell = self->_wheelchairUseCell;
  self->_wheelchairUseCell = v23;

  id v25 = +[NSBundle bundleForClass:objc_opt_class()];
  id v26 = [v25 localizedStringForKey:@"WHEELCHAIR_USE" value:&stru_18860 table:@"Localizable"];
  objc_super v27 = [(HKBridgeHealthProfileTableViewCell *)self->_wheelchairUseCell textLabel];
  [v27 setText:v26];

  [(HKBridgeHealthProfileTableViewCell *)self->_wheelchairUseCell setInputView:self->_wheelchairUsePicker];
  v28 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
  cardioFitnessMedicationsCell = self->_cardioFitnessMedicationsCell;
  self->_cardioFitnessMedicationsCell = v28;

  [(HKBridgeHealthProfileTableViewCell *)self->_cardioFitnessMedicationsCell setSelectionStyle:0];
  v30 = +[NSBundle bundleForClass:objc_opt_class()];
  v31 = [v30 localizedStringForKey:@"CARDIO_FITNESS_RELATED_MEDICATIONS" value:&stru_18860 table:@"Localizable"];
  v32 = [(HKBridgeHealthProfileTableViewCell *)self->_cardioFitnessMedicationsCell textLabel];
  [v32 setText:v31];

  v33 = [(HKBridgeHealthProfileController *)self displayNumberOfActiveCardioFitnessMedications:self->_activeCardioFitnessMedications];
  [(HKBridgeHealthProfileTableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v33];

  v34 = [(HKBridgeHealthProfileController *)self _createCalciumChannelBlockerCheckMarkCell];
  calciumChannelBlockerUseCell = self->_calciumChannelBlockerUseCell;
  self->_calciumChannelBlockerUseCell = v34;

  self->_betaBlockerUseCell = [(HKBridgeHealthProfileController *)self _createBetaBlockerCheckMarkCell];

  _objc_release_x1();
}

- (id)_createCalciumChannelBlockerCheckMarkCell
{
  v3 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:3 reuseIdentifier:0];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CALCIUM_CHANNEL_BLOCKER_USE" value:&stru_18860 table:@"Localizable"];
  id v6 = [(HKBridgeHealthProfileTableViewCell *)v3 textLabel];
  [v6 setText:v5];

  [(HKBridgeHealthProfileTableViewCell *)v3 setSelectionStyle:0];
  unint64_t v7 = [(HKBridgeHealthProfileController *)self _circleImageView];
  [(HKBridgeHealthProfileTableViewCell *)v3 setEditingAccessoryView:v7];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CALCIUM_CHANNEL_BLOCKER_EXAMPLES" value:&stru_18860 table:@"Localizable"];
  objc_super v10 = [(HKBridgeHealthProfileTableViewCell *)v3 detailTextLabel];
  [v10 setText:v9];

  return v3;
}

- (id)_createBetaBlockerCheckMarkCell
{
  v3 = [[HKBridgeHealthProfileTableViewCell alloc] initWithStyle:3 reuseIdentifier:0];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"BETA_BLOCKER_USE" value:&stru_18860 table:@"Localizable"];
  id v6 = [(HKBridgeHealthProfileTableViewCell *)v3 textLabel];
  [v6 setText:v5];

  [(HKBridgeHealthProfileTableViewCell *)v3 setSelectionStyle:0];
  unint64_t v7 = [(HKBridgeHealthProfileController *)self _circleImageView];
  [(HKBridgeHealthProfileTableViewCell *)v3 setEditingAccessoryView:v7];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BETA_BLOCKER_EXAMPLES" value:&stru_18860 table:@"Localizable"];
  objc_super v10 = [(HKBridgeHealthProfileTableViewCell *)v3 detailTextLabel];
  [v10 setText:v9];

  return v3;
}

- (void)setCardioFitnessMedicationCheckmarks
{
  healthStore = self->_healthStore;
  id v14 = 0;
  id v4 = [(HKHealthStore *)healthStore _cardioFitnessMedicationsUseWithError:&v14];
  id v5 = v14;
  id v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      sub_E268();
    }
  }
  self->_currentCardioFitnessMedicationsUse = 0;
  self->_uint64_t activeCardioFitnessMedications = 0;
  if ([v4 takingCalciumChannelBlockers])
  {
    self->_currentCardioFitnessMedicationsUse |= 1uLL;
    id v8 = [(HKBridgeHealthProfileController *)self _checkmarkedCircleImageView];
    [(HKBridgeHealthProfileTableViewCell *)self->_calciumChannelBlockerUseCell setEditingAccessoryView:v8];

    ++self->_activeCardioFitnessMedications;
  }
  else
  {
    id v9 = [(HKBridgeHealthProfileController *)self _circleImageView];
    [(HKBridgeHealthProfileTableViewCell *)self->_calciumChannelBlockerUseCell setEditingAccessoryView:v9];
  }
  if ([v4 takingBetaBlockers])
  {
    self->_currentCardioFitnessMedicationsUse |= 2uLL;
    objc_super v10 = [(HKBridgeHealthProfileController *)self _checkmarkedCircleImageView];
    [(HKBridgeHealthProfileTableViewCell *)self->_betaBlockerUseCell setEditingAccessoryView:v10];

    uint64_t activeCardioFitnessMedications = (self->_activeCardioFitnessMedications + 1);
    self->_uint64_t activeCardioFitnessMedications = activeCardioFitnessMedications;
  }
  else
  {
    id v12 = [(HKBridgeHealthProfileController *)self _circleImageView];
    [(HKBridgeHealthProfileTableViewCell *)self->_betaBlockerUseCell setEditingAccessoryView:v12];

    uint64_t activeCardioFitnessMedications = self->_activeCardioFitnessMedications;
  }
  id v13 = [(HKBridgeHealthProfileController *)self displayNumberOfActiveCardioFitnessMedications:activeCardioFitnessMedications];
  [(HKBridgeHealthProfileTableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v13];
}

- (void)_makeCardioFitnessMedicationsAppear:(BOOL)a3
{
  if (!self->_cardioFitnessMedicationsSectionHidden)
  {
    BOOL v3 = a3;
    id v5 = [(HKBridgeHealthProfileController *)self currentSnapshot];
    id v6 = v5;
    if (v3) {
      [v5 appendItemsWithIdentifiers:&off_19568 intoSectionWithIdentifier:&off_19408];
    }
    else {
      [v5 deleteItemsWithIdentifiers:&off_19568];
    }

    id v8 = [(HKBridgeHealthProfileController *)self dataSource];
    BOOL v7 = [(HKBridgeHealthProfileController *)self currentSnapshot];
    [v8 applySnapshot:v7 animatingDifferences:1];
  }
}

- (void)_setHeightAndWeightProperties
{
  BOOL v3 = [(HKBridgeHealthProfileController *)self lengthFormatter];
  id v4 = [v3 numberFormatter];
  id v5 = [v4 locale];

  id v6 = [v5 objectForKey:NSLocaleUsesMetricSystem];
  self->_isMetricLocale = [v6 BOOLValue];
  BOOL v7 = +[HKUnit poundUnit];
  id v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:1000.0];
  maxWeightQuantity = self->_maxWeightQuantity;
  self->_maxWeightQuantity = v8;

  objc_super v10 = +[HKUnit poundUnit];
  id v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:1.0];
  minWeightQuantity = self->_minWeightQuantity;
  self->_minWeightQuantity = v11;

  uint64_t v19 = 0;
  id v13 = [(HKBridgeHealthProfileController *)self massFormatter];
  id v14 = [v13 unitStringFromKilograms:&v19 usedUnit:2.0];

  uint64_t v15 = +[HKUnit unitFromMassFormatterUnit:v19];
  localeWeightUnit = self->_localeWeightUnit;
  self->_localeWeightUnit = v15;

  [(HKQuantity *)self->_maxWeightQuantity doubleValueForUnit:self->_localeWeightUnit];
  self->_maxWeightInLocaleUnit = llround(v17);
  [(HKQuantity *)self->_minWeightQuantity doubleValueForUnit:self->_localeWeightUnit];
  self->_minWeightInLocaleUnit = llround(v18);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKBridgeHealthProfileController;
  [(HKBridgeHealthProfileController *)&v4 viewWillDisappear:a3];
  [(HKBridgeHealthProfileController *)self _resetSelectedCell];
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HKBridgeHealthProfileController;
  [(HKBridgeHealthProfileController *)&v17 viewWillAppear:a3];
  +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", self->_heightCell, self->_weightCell, self->_birthdateCell, self->_biologicalSexCell, self->_wheelchairUseCell, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        objc_super v10 = [v9 localizedStringForKey:@"LOADING" value:&stru_18860 table:@"Localizable"];
        id v11 = [v8 detailTextLabel];
        [v11 setText:v10];

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
  [(HKBridgeHealthProfileController *)self _updateUserCharacteristics];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  [(_BHSHealthProfileDatePicker *)self->_birthdatePicker removeTarget:self action:0 forControlEvents:4096];
  v4.receiver = self;
  v4.super_class = (Class)HKBridgeHealthProfileController;
  [(HKBridgeHealthProfileController *)&v4 dealloc];
}

- (BOOL)_isTinkerDevice
{
  return self->_activeTinkerDevice != 0;
}

- (void)_loadDisplayNameForTinker
{
  id v3 = [objc_alloc((Class)HKProfileStore) initWithHealthStore:self->_healthStore];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_63B8;
  v4[3] = &unk_18540;
  v4[4] = self;
  [v3 fetchDisplayName:v4];
}

- (void)_cancel
{
  id v3 = [(HKBridgeHealthProfileController *)self view];
  [v3 endEditing:1];

  [(HKBridgeHealthProfileController *)self _updateUserCharacteristics];
  [(HKBridgeHealthProfileController *)self setCardioFitnessMedicationCheckmarks];
  [(HKBridgeHealthProfileController *)self _makeCardioFitnessMedicationsAppear:0];
  [(HKBridgeHealthProfileController *)self setEditing:0];
  objc_super v4 = [(HKBridgeHealthProfileController *)self tableView];
  [v4 setAllowsSelection:0];

  [(HKBridgeHealthProfileController *)self _setNavigationButtonsToEnableEditing];
}

- (void)_toggleEdit
{
  id v3 = [(HKBridgeHealthProfileController *)self tableView];
  objc_super v4 = [(HKBridgeHealthProfileController *)self tableView];
  objc_msgSend(v3, "setAllowsSelection:", objc_msgSend(v4, "allowsSelection") ^ 1);

  id v5 = [(HKBridgeHealthProfileController *)self tableView];
  LODWORD(v4) = [v5 allowsSelection];

  if (v4)
  {
    [(HKBridgeHealthProfileController *)self setEditing:1];
    [(HKBridgeHealthProfileController *)self _makeCardioFitnessMedicationsAppear:1];
    [(HKBridgeHealthProfileController *)self _setNavigationButtonsOnEditCompletion];
    [(HKBridgeHealthProfileController *)self setCardioFitnessMedicationCheckmarks];
  }
  else
  {
    [(HKBridgeHealthProfileController *)self setEditing:0];
    uint64_t v6 = [(HKBridgeHealthProfileController *)self view];
    [v6 endEditing:1];

    birthdateChangeManager = self->_birthdateChangeManager;
    dateOfBirth = self->_dateOfBirth;
    id v20 = 0;
    id v9 = [(HKBirthdateChangeManager *)birthdateChangeManager setBirthdate:dateOfBirth withError:&v20];
    id v10 = v20;
    if (([v9 success] & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_E358();
      }
    }
    [(HKBridgeHealthProfileController *)self _setBiologicalSex:self->_biologicalSex];
    [(HKBridgeHealthProfileController *)self _setHeight:self->_height];
    [(HKBridgeHealthProfileController *)self _setWeight:self->_weight];
    [(HKBridgeHealthProfileController *)self _setWheelchairUse:self->_wheelchairUse];
    healthStore = self->_healthStore;
    unint64_t currentCardioFitnessMedicationsUse = self->_currentCardioFitnessMedicationsUse;
    id v19 = v10;
    [(HKHealthStore *)healthStore _setCardioFitnessMedicationsUse:currentCardioFitnessMedicationsUse error:&v19];
    id v13 = v19;

    [(HKBridgeHealthProfileController *)self _makeCardioFitnessMedicationsAppear:0];
    [(HKBridgeHealthProfileController *)self _setNavigationButtonsToEnableEditing];
    if ([(HKBridgeHealthProfileController *)self _isTinkerDevice])
    {
      long long v14 = self->_healthStore;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_6868;
      v18[3] = &unk_18568;
      v18[4] = self;
      [(HKHealthStore *)v14 forceCloudSyncDataUploadForProfileWithCompletion:v18];
    }
    if ([v9 shouldShowWarning]
      && ![(HKBridgeHealthProfileController *)self _isTinkerDevice])
    {
      long long v15 = +[HKHealthChecklistUtilities shared];
      unsigned int v16 = [v15 isHealthChecklistAvailable];

      id v17 = [v9 newAge];
      if (v16) {
        +[HKBirthdateChangeManager showDisabledWarningWithHealthChecklistWithAge:v17 presentingViewController:self openHealthChecklistInContext:0];
      }
      else {
        +[HKBirthdateChangeManager showDisabledWarningWithAge:v17 presentingViewController:self];
      }
    }
  }
}

- (void)_setNavigationButtonsOnEditCompletion
{
  id v3 = [(HKBridgeHealthProfileController *)self navigationItem];
  objc_super v4 = [v3 rightBarButtonItem];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"DONE_BUTTON" value:&stru_18860 table:@"Localizable"];
  [v4 setTitle:v6];

  BOOL v7 = [(HKBridgeHealthProfileController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setStyle:2];

  id v9 = objc_alloc((Class)UIBarButtonItem);
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_18860 table:@"Localizable"];
  id v13 = [v9 initWithTitle:v11 style:0 target:self action:"_cancel"];

  id v12 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v12 setLeftBarButtonItem:v13];
}

- (void)_setNavigationButtonsToEnableEditing
{
  id v3 = [(HKBridgeHealthProfileController *)self navigationItem];
  objc_super v4 = [v3 rightBarButtonItem];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"EDIT_BUTTON" value:&stru_18860 table:@"Localizable"];
  [v4 setTitle:v6];

  BOOL v7 = [(HKBridgeHealthProfileController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setStyle:0];

  id v9 = [(HKBridgeHealthProfileController *)self navigationItem];
  [v9 setLeftBarButtonItem:0];
}

- (void)_updateUserCharacteristics
{
  [(HKBridgeHealthProfileController *)self _updateWeight];
  [(HKBridgeHealthProfileController *)self _updateHeight];
  id v3 = [(HKBridgeHealthProfileController *)self healthStore];
  id v28 = 0;
  objc_super v4 = [v3 biologicalSexWithError:&v28];
  id v5 = v28;

  if (v4)
  {
    id v6 = [v4 biologicalSex];
  }
  else
  {
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_E570();
      }
    }
    id v6 = 0;
  }
  self->_biologicalSex = (int64_t)v6;
  BOOL v7 = -[HKBridgeHealthProfileController _displayStringForBiologicalSex:](self, "_displayStringForBiologicalSex:");
  id v8 = [(HKBridgeHealthProfileTableViewCell *)self->_biologicalSexCell detailTextLabel];
  [v8 setText:v7];

  [(_BHSHealthProfilePickerView *)self->_biologicalSexPicker selectRow:self->_biologicalSex inComponent:0 animated:0];
  id v9 = [(HKBridgeHealthProfileController *)self healthStore];
  id v27 = 0;
  id v10 = [v9 dateOfBirthComponentsWithError:&v27];
  id v11 = v27;
  dateOfBirth = self->_dateOfBirth;
  self->_dateOfBirth = v10;

  if (self->_dateOfBirth)
  {
    id v13 = [(HKBridgeHealthProfileController *)self _birthdayDescription];
    long long v14 = [(HKBridgeHealthProfileTableViewCell *)self->_birthdateCell detailTextLabel];
    [v14 setText:v13];

    birthdatePicker = self->_birthdatePicker;
    unsigned int v16 = [(HKBridgeHealthProfileController *)self _dateFromGregorianComponents:self->_dateOfBirth];
    [(_BHSHealthProfileDatePicker *)birthdatePicker setDate:v16];
  }
  else
  {
    if (v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_E508();
      }
    }
    unsigned int v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"BIRTHDATE_NOT_SET" value:&stru_18860 table:@"Localizable"];
    double v18 = [(HKBridgeHealthProfileTableViewCell *)self->_birthdateCell detailTextLabel];
    [v18 setText:v17];
  }
  id v19 = [(HKBridgeHealthProfileController *)self healthStore];
  id v26 = 0;
  id v20 = [v19 wheelchairUseWithError:&v26];
  id v21 = v26;

  if (v20)
  {
    id v22 = [v20 wheelchairUse];
  }
  else
  {
    if (v21)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_E4A0();
      }
    }
    id v22 = 0;
  }
  self->_wheelchairUse = (int64_t)v22;
  v23 = -[HKBridgeHealthProfileController _displayStringForWheelchairUse:](self, "_displayStringForWheelchairUse:");
  v24 = [(HKBridgeHealthProfileTableViewCell *)self->_wheelchairUseCell detailTextLabel];
  [v24 setText:v23];

  [(_BHSHealthProfilePickerView *)self->_wheelchairUsePicker selectRow:self->_wheelchairUse inComponent:0 animated:0];
  [(HKBridgeHealthProfileController *)self setCardioFitnessMedicationCheckmarks];
  id v25 = [(HKBridgeHealthProfileController *)self tableView];
  [v25 reloadData];
}

- (NSLengthFormatter)lengthFormatter
{
  lengthFormatter = self->_lengthFormatter;
  if (!lengthFormatter)
  {
    objc_super v4 = (NSLengthFormatter *)objc_alloc_init((Class)NSLengthFormatter);
    id v5 = self->_lengthFormatter;
    self->_lengthFormatter = v4;

    [(NSLengthFormatter *)self->_lengthFormatter setForPersonHeightUse:1];
    lengthFormatter = self->_lengthFormatter;
  }

  return lengthFormatter;
}

- (NSMassFormatter)massFormatter
{
  massFormatter = self->_massFormatter;
  if (!massFormatter)
  {
    objc_super v4 = (NSMassFormatter *)objc_alloc_init((Class)NSMassFormatter);
    id v5 = self->_massFormatter;
    self->_massFormatter = v4;

    [(NSMassFormatter *)self->_massFormatter setForPersonMassUse:1];
    massFormatter = self->_massFormatter;
  }

  return massFormatter;
}

- (void)_setBiologicalSex:(int64_t)a3
{
  id v5 = [(HKBridgeHealthProfileController *)self healthStore];
  id v9 = 0;
  unsigned __int8 v6 = [v5 _setBiologicalSex:a3 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_E5D8(v8, a2);
    }
  }
}

- (id)_displayStringForBiologicalSex:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v4 = v3;
      CFStringRef v5 = @"OTHER";
      break;
    case 2:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v4 = v3;
      CFStringRef v5 = @"MALE";
      break;
    case 1:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v4 = v3;
      CFStringRef v5 = @"FEMALE";
      break;
    default:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v4 = v3;
      CFStringRef v5 = @"BIOLOGICAL_SEX_NOT_SET";
      break;
  }
  unsigned __int8 v6 = [v3 localizedStringForKey:v5 value:&stru_18860 table:@"Localizable"];

  return v6;
}

- (void)_birthdateChanged:(id)a3
{
  objc_super v4 = +[NSCalendar hk_gregorianCalendar];
  CFStringRef v5 = [(_BHSHealthProfileDatePicker *)self->_birthdatePicker date];
  objc_msgSend(v4, "hk_dateOfBirthDateComponentsWithDate:", v5);
  unsigned __int8 v6 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  dateOfBirth = self->_dateOfBirth;
  self->_dateOfBirth = v6;

  id v9 = [(HKBridgeHealthProfileController *)self _birthdayDescription];
  id v8 = [(HKBridgeHealthProfileTableViewCell *)self->_birthdateCell detailTextLabel];
  [v8 setText:v9];
}

- (id)_birthdayDescription
{
  if (qword_1F070 != -1) {
    dispatch_once(&qword_1F070, &stru_185A8);
  }
  id v3 = (void *)qword_1F068;
  objc_super v4 = [(HKBridgeHealthProfileController *)self _dateFromGregorianComponents:self->_dateOfBirth];
  CFStringRef v5 = [v3 stringFromDate:v4];

  return v5;
}

- (id)_dateFromGregorianComponents:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  CFStringRef v5 = [v4 dateFromComponents:v3];

  return v5;
}

- (void)_updateHeight
{
  id v3 = [(HKBridgeHealthProfileController *)self healthStore];
  id v9 = 0;
  objc_super v4 = [v3 _heightCharacteristicQuantityWithError:&v9];
  id v5 = v9;

  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      sub_E678();
      if (v4) {
        goto LABEL_4;
      }
LABEL_6:
      unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"HEIGHT_NOT_SET" value:&stru_18860 table:@"Localizable"];
      id v8 = [(HKBridgeHealthProfileTableViewCell *)self->_heightCell detailTextLabel];
      [v8 setText:v7];

      goto LABEL_7;
    }
  }
  if (!v4) {
    goto LABEL_6;
  }
LABEL_4:
  objc_storeStrong((id *)&self->_height, v4);
  [(HKBridgeHealthProfileController *)self _updateDisplayWithHeightValue:v4];
LABEL_7:
}

- (void)_updateDisplayWithHeightValue:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(HKBridgeHealthProfileController *)self _textDisplayStringForHeight:v6];
  id v5 = [(HKBridgeHealthProfileTableViewCell *)self->_heightCell detailTextLabel];
  [v5 setText:v4];

  [(HKBridgeHealthProfileController *)self _updatePickersForHeight:v6];
}

- (void)_updatePickersForHeight:(id)a3
{
  BOOL isMetricLocale = self->_isMetricLocale;
  id v5 = a3;
  if (isMetricLocale)
  {
    id v6 = +[HKUnit meterUnitWithMetricPrefix:5];
    [v5 doubleValueForUnit:v6];
    double v8 = v7;

    unint64_t v9 = llround(v8) - 30;
    if (v9 <= 0x1E) {
      unint64_t v9 = 30;
    }
    if (v9 >= 0x113) {
      uint64_t v10 = 275;
    }
    else {
      uint64_t v10 = v9;
    }
    heightPicker = self->_heightPicker;
    uint64_t v12 = 0;
  }
  else
  {
    id v13 = +[HKUnit inchUnit];
    [v5 doubleValueForUnit:v13];
    double v15 = v14;

    unint64_t v16 = llround(v15);
    int64_t v17 = [(HKBridgeHealthProfileController *)self _numFeetInInches:v16];
    unint64_t v18 = v17 - 1;
    if ((unint64_t)(v17 - 1) <= 1) {
      unint64_t v18 = 1;
    }
    if (v18 >= 9) {
      uint64_t v19 = 9;
    }
    else {
      uint64_t v19 = v18;
    }
    if (v16 - 12 * v17 >= 0xB) {
      uint64_t v20 = 11;
    }
    else {
      uint64_t v20 = v16 - 12 * v17;
    }
    [(_BHSHealthProfilePickerView *)self->_heightPicker selectRow:v19 inComponent:0 animated:0];
    heightPicker = self->_heightPicker;
    uint64_t v10 = v20;
    uint64_t v12 = 1;
  }

  [(_BHSHealthProfilePickerView *)heightPicker selectRow:v10 inComponent:v12 animated:0];
}

- (int64_t)_numFeetInInches:(int64_t)a3
{
  return (uint64_t)(double)(a3 / 12);
}

- (id)_pickerDisplayStringForHeightForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  double v7 = [(HKBridgeHealthProfileController *)self lengthFormatter];
  [v7 setUnitStyle:2];

  if (self->_isMetricLocale)
  {
    double v8 = [(HKBridgeHealthProfileController *)self lengthFormatter];
    unint64_t v9 = v8;
    double v10 = (double)(unint64_t)(a3 + 30);
    uint64_t v11 = 9;
  }
  else
  {
    double v8 = [(HKBridgeHealthProfileController *)self lengthFormatter];
    unint64_t v9 = v8;
    if (a4)
    {
      double v10 = (double)(unint64_t)a3;
      uint64_t v11 = 1281;
    }
    else
    {
      double v10 = (double)(unint64_t)(a3 + 1);
      uint64_t v11 = 1282;
    }
  }
  uint64_t v12 = [v8 stringFromValue:v11 unit:v10];

  return v12;
}

- (id)_textDisplayStringForHeight:(id)a3
{
  if (self->_isMetricLocale)
  {
    id v4 = a3;
    id v5 = [(HKBridgeHealthProfileController *)self lengthFormatter];
    id v6 = +[HKUnit meterUnitWithMetricPrefix:5];
    [v4 doubleValueForUnit:v6];
    double v8 = v7;

    unint64_t v9 = [v5 stringFromValue:9 unit:v8];
  }
  else
  {
    id v10 = a3;
    id v5 = +[HKPersonHeightFormatter sharedFormatter];
    id v6 = +[HKUnit meterUnitWithMetricPrefix:5];
    [v10 doubleValueForUnit:v6];
    double v12 = v11;

    id v13 = +[NSNumber numberWithDouble:v12];
    unint64_t v9 = [v5 localizedStringFromHeightInCentimeters:v13];
  }

  return v9;
}

- (void)_setHeight:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HKBridgeHealthProfileController *)self healthStore];
    [v5 _setHeightCharacteristicQuantity:v4 error:0];
  }
}

- (void)_updateWeight
{
  id v3 = [(HKBridgeHealthProfileController *)self healthStore];
  id v9 = 0;
  id v4 = [v3 _bodyMassCharacteristicQuantityWithError:&v9];
  id v5 = v9;

  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      sub_E678();
      if (v4) {
        goto LABEL_4;
      }
LABEL_6:
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      double v7 = [v6 localizedStringForKey:@"WEIGHT_NOT_SET" value:&stru_18860 table:@"Localizable"];
      double v8 = [(HKBridgeHealthProfileTableViewCell *)self->_weightCell detailTextLabel];
      [v8 setText:v7];

      goto LABEL_7;
    }
  }
  if (!v4) {
    goto LABEL_6;
  }
LABEL_4:
  objc_storeStrong((id *)&self->_weight, v4);
  [(HKBridgeHealthProfileController *)self _updateDisplayWithWeightValue:v4];
LABEL_7:
}

- (void)_setWeight:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HKBridgeHealthProfileController *)self healthStore];
    [v5 _setBodyMassCharacteristicQuantity:v4 error:0];
  }
}

- (void)_updateDisplayWithWeightValue:(id)a3
{
  [a3 doubleValueForUnit:self->_localeWeightUnit];
  unint64_t v5 = llround(v4);
  if (v5)
  {
    id v6 = [(HKBridgeHealthProfileController *)self _displayStringForWeight:v5];
    double v7 = [(HKBridgeHealthProfileTableViewCell *)self->_weightCell detailTextLabel];
    [v7 setText:v6];

    int64_t minWeightInLocaleUnit = self->_minWeightInLocaleUnit;
    if ((uint64_t)(v5 - minWeightInLocaleUnit) > minWeightInLocaleUnit) {
      int64_t minWeightInLocaleUnit = v5 - minWeightInLocaleUnit;
    }
    if (minWeightInLocaleUnit >= self->_maxWeightInLocaleUnit) {
      int64_t maxWeightInLocaleUnit = self->_maxWeightInLocaleUnit;
    }
    else {
      int64_t maxWeightInLocaleUnit = minWeightInLocaleUnit;
    }
    weightPicker = self->_weightPicker;
    [(_BHSHealthProfilePickerView *)weightPicker selectRow:maxWeightInLocaleUnit inComponent:0 animated:0];
  }
}

- (id)_displayStringForWeight:(int64_t)a3
{
  unint64_t v5 = [(HKBridgeHealthProfileController *)self massFormatter];
  id v6 = objc_msgSend(v5, "stringFromValue:unit:", +[HKUnit massFormatterUnitFromUnit:](HKUnit, "massFormatterUnitFromUnit:", self->_localeWeightUnit), (double)a3);

  return v6;
}

- (void)_resetSelectedCell
{
  id v3 = [(HKBridgeHealthProfileController *)self view];
  [v3 endEditing:1];

  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;
}

- (id)_minDate
{
  v2 = +[NSCalendar currentCalendar];
  id v3 = +[NSDate date];
  double v4 = [v2 components:4 fromDate:v3];

  objc_msgSend(v4, "setYear:", (char *)objc_msgSend(v4, "year") - 150);
  [v4 setDay:1];
  [v4 setMonth:1];
  unint64_t v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 dateFromComponents:v4];

  return v6;
}

- (id)_displayStringForWheelchairUse:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      double v4 = v3;
      CFStringRef v5 = @"WHEELCHAIR_NOT_SET";
      goto LABEL_7;
    case 2:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      double v4 = v3;
      CFStringRef v5 = @"WHEELCHAIR_YES";
      goto LABEL_7;
    case 1:
      id v3 = +[NSBundle bundleForClass:objc_opt_class()];
      double v4 = v3;
      CFStringRef v5 = @"WHEELCHAIR_NO";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_18860 table:@"Localizable"];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (void)_setWheelchairUse:(int64_t)a3
{
  if ([(HKBridgeHealthProfileController *)self wheelchairUseChanged])
  {
    [(HKBridgeHealthProfileController *)self _requestWheelchairDiagnosticsSubmissionIfNecessary];
    id v6 = [(HKBridgeHealthProfileController *)self healthStore];
    id v10 = 0;
    unsigned __int8 v7 = [v6 _setWheelchairUse:a3 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      id v9 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_E5D8(v9, a2);
      }
    }
    [(HKBridgeHealthProfileController *)self setWheelchairUseChanged:0];
  }
}

- (void)_requestWheelchairDiagnosticsSubmissionIfNecessary
{
  if ((char *)[(HKBridgeHealthProfileController *)self wheelchairUse] == (char *)&dword_0 + 2)
  {
    id v3 = +[MCProfileConnection sharedConnection];
    unsigned int v4 = [v3 isDiagnosticSubmissionAllowed];

    if (v4)
    {
      CFStringRef v5 = +[MCProfileConnection sharedConnection];
      unsigned __int8 v6 = [v5 hasWheelchairDataSubmissionAllowedBeenSet];

      if ((v6 & 1) == 0)
      {
        unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
        id v8 = [v7 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_TITLE" value:&stru_18860 table:@"Localizable"];
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v10 = [v9 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_DESCRIPTION" value:&stru_18860 table:@"Localizable"];
        double v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

        double v12 = +[NSBundle bundleForClass:objc_opt_class()];
        id v13 = [v12 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_ALLOW" value:&stru_18860 table:@"Localizable"];
        double v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&stru_185E8];
        [v11 addAction:v14];

        double v15 = +[NSBundle bundleForClass:objc_opt_class()];
        unint64_t v16 = [v15 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO" value:&stru_18860 table:@"Localizable"];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_82F8;
        v21[3] = &unk_18610;
        v21[4] = self;
        int64_t v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v21];
        [v11 addAction:v17];

        unint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_DENY" value:&stru_18860 table:@"Localizable"];
        uint64_t v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:&stru_18630];
        [v11 addAction:v20];

        [(HKBridgeHealthProfileController *)self presentViewController:v11 animated:1 completion:0];
      }
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  if (self->_heightPicker != a3) {
    return 1;
  }
  if (self->_isMetricLocale) {
    return 1;
  }
  return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  unsigned __int8 v6 = (_BHSHealthProfilePickerView *)a3;
  if (self->_biologicalSexPicker == v6)
  {
    int64_t v7 = 4;
  }
  else if (self->_heightPicker == v6)
  {
    if (self->_isMetricLocale)
    {
      int64_t v7 = 246;
    }
    else if (a4)
    {
      int64_t v7 = 12;
    }
    else
    {
      int64_t v7 = 9;
    }
  }
  else if (self->_weightPicker == v6)
  {
    int64_t v7 = self->_maxWeightInLocaleUnit - self->_minWeightInLocaleUnit + 1;
  }
  else if (self->_wheelchairUsePicker == v6)
  {
    int64_t v7 = 3;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)_setDefaultValuesOnHeightPickerIfRequired
{
  if (!self->_height)
  {
    id v3 = +[HKUnit meterUnitWithMetricPrefix:5];
    id v4 = +[HKQuantity quantityWithUnit:v3 doubleValue:162.0];

    [(HKBridgeHealthProfileController *)self _updatePickersForHeight:v4];
  }
}

- (void)_setDefaultValuesOnWeightPickerIfRequired
{
  if (!self->_weight)
  {
    id v3 = +[HKUnit poundUnit];
    id v5 = +[HKQuantity quantityWithUnit:v3 doubleValue:159.0];

    [v5 doubleValueForUnit:self->_localeWeightUnit];
    [(_BHSHealthProfilePickerView *)self->_weightPicker selectRow:llround(v4) - self->_minWeightInLocaleUnit inComponent:0 animated:0];
  }
}

- (void)_setDefaultValuesOnBirthdayPickerIfRequired
{
  if (!self->_dateOfBirth)
  {
    id v3 = +[NSCalendar currentCalendar];
    double v4 = +[NSDate date];
    id v5 = [v3 dateByAddingUnit:4 value:-30 toDate:v4 options:0];

    [(_BHSHealthProfileDatePicker *)self->_birthdatePicker setDate:v5];
  }
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = (_BHSHealthProfilePickerView *)a3;
  id v9 = v8;
  if (self->_biologicalSexPicker == v8)
  {
    uint64_t v11 = [(HKBridgeHealthProfileController *)self _displayStringForBiologicalSex:a4];
  }
  else if (self->_heightPicker == v8)
  {
    uint64_t v11 = [(HKBridgeHealthProfileController *)self _pickerDisplayStringForHeightForRow:a4 forComponent:a5];
  }
  else if (self->_weightPicker == v8)
  {
    uint64_t v11 = [(HKBridgeHealthProfileController *)self _displayStringForWeight:self->_minWeightInLocaleUnit + a4];
  }
  else
  {
    if (self->_wheelchairUsePicker != v8)
    {
      id v10 = &stru_18860;
      goto LABEL_11;
    }
    uint64_t v11 = [(HKBridgeHealthProfileController *)self _displayStringForWheelchairUse:a4];
  }
  id v10 = (__CFString *)v11;
LABEL_11:
  id v12 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v17 = NSForegroundColorAttributeName;
  id v13 = [(id)objc_opt_class() _textColor];
  unint64_t v18 = v13;
  double v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v15 = [v12 initWithString:v10 attributes:v14];

  return v15;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  int64_t v7 = (_BHSHealthProfilePickerView *)a3;
  if (self->_biologicalSexPicker == v7)
  {
    self->_biologicalSex = a4;
    double v14 = v7;
    id v8 = [(HKBridgeHealthProfileController *)self _displayStringForBiologicalSex:a4];
    uint64_t v9 = 48;
    goto LABEL_10;
  }
  if (self->_heightPicker == v7)
  {
    double v14 = v7;
    [(HKBridgeHealthProfileController *)self _heightPickerUpdated];
LABEL_11:
    int64_t v7 = v14;
    goto LABEL_12;
  }
  if (self->_weightPicker == v7)
  {
    int64_t v10 = self->_minWeightInLocaleUnit + a4;
    double v14 = v7;
    uint64_t v11 = +[HKQuantity quantityWithUnit:self->_localeWeightUnit doubleValue:(double)v10];
    weight = self->_weight;
    self->_weight = v11;

    id v8 = [(HKBridgeHealthProfileController *)self _displayStringForWeight:v10];
    uint64_t v9 = 112;
    goto LABEL_10;
  }
  if (self->_wheelchairUsePicker == v7 && self->_wheelchairUse != a4)
  {
    double v14 = v7;
    [(HKBridgeHealthProfileController *)self setWheelchairUseChanged:1];
    [(HKBridgeHealthProfileController *)self setWheelchairUse:a4];
    id v8 = [(HKBridgeHealthProfileController *)self _displayStringForWheelchairUse:a4];
    uint64_t v9 = 96;
LABEL_10:
    id v13 = [*(id *)((char *)&self->super.super.super.super.isa + v9) detailTextLabel];
    [v13 setText:v8];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_heightPickerUpdated
{
  BOOL isMetricLocale = self->_isMetricLocale;
  id v4 = [(_BHSHealthProfilePickerView *)self->_heightPicker selectedRowInComponent:0];
  if (isMetricLocale)
  {
    id v5 = (char *)v4 + 30;
    +[HKUnit meterUnitWithMetricPrefix:5];
  }
  else
  {
    id v5 = (char *)[(_BHSHealthProfilePickerView *)self->_heightPicker selectedRowInComponent:1]+ 12 * (void)v4+ 12;
    +[HKUnit inchUnit];
  unsigned __int8 v6 = };
  int64_t v7 = +[HKQuantity quantityWithUnit:v6 doubleValue:(double)(uint64_t)v5];

  height = self->_height;
  self->_height = v7;
  uint64_t v9 = v7;

  id v11 = [(HKBridgeHealthProfileController *)self _textDisplayStringForHeight:v9];
  int64_t v10 = [(HKBridgeHealthProfileTableViewCell *)self->_heightCell detailTextLabel];

  [v10 setText:v11];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  id obj = v5;
  if (v5 == self->_betaBlockerUseCell)
  {
    id v11 = self;
    id v12 = obj;
    uint64_t v13 = 2;
LABEL_10:
    id v8 = [(HKBridgeHealthProfileController *)v11 updateCheckMarksForCell:v12 option:v13];
    goto LABEL_14;
  }
  if (v5 == self->_calciumChannelBlockerUseCell)
  {
    id v11 = self;
    id v12 = obj;
    uint64_t v13 = 1;
    goto LABEL_10;
  }
  p_selectedCell = &self->_selectedCell;
  selectedCell = self->_selectedCell;
  id v8 = [(HKBridgeHealthProfileController *)self _resetSelectedCell];
  uint64_t v9 = obj;
  if (obj == selectedCell) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_selectedCell, obj);
  int64_t v10 = *p_selectedCell;
  if (*p_selectedCell == self->_heightCell)
  {
    [(HKBridgeHealthProfileController *)self _setDefaultValuesOnHeightPickerIfRequired];
  }
  else if (v10 == self->_weightCell)
  {
    [(HKBridgeHealthProfileController *)self _setDefaultValuesOnWeightPickerIfRequired];
  }
  else if (v10 == self->_birthdateCell)
  {
    [(HKBridgeHealthProfileController *)self _setDefaultValuesOnBirthdayPickerIfRequired];
  }
  id v8 = (id)[(HKBridgeHealthProfileTableViewCell *)obj becomeFirstResponder];
LABEL_14:
  uint64_t v9 = obj;
LABEL_15:

  _objc_release_x1(v8, v9);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)updateCheckMarksForCell:(id)a3 option:(unint64_t)a4
{
  unint64_t v6 = self->_currentCardioFitnessMedicationsUse & a4;
  id v7 = a3;
  if (v6)
  {
    id v8 = [(HKBridgeHealthProfileController *)self _circleImageView];
    [v7 setEditingAccessoryView:v8];

    self->_currentCardioFitnessMedicationsUse &= ~a4;
    int v9 = self->_activeCardioFitnessMedications - 1;
  }
  else
  {
    int64_t v10 = [(HKBridgeHealthProfileController *)self _checkmarkedCircleImageView];
    [v7 setEditingAccessoryView:v10];

    self->_currentCardioFitnessMedicationsUse |= a4;
    int v9 = self->_activeCardioFitnessMedications + 1;
  }
  self->_uint64_t activeCardioFitnessMedications = v9;
  -[HKBridgeHealthProfileController displayNumberOfActiveCardioFitnessMedications:](self, "displayNumberOfActiveCardioFitnessMedications:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(HKBridgeHealthProfileTableViewCell *)self->_cardioFitnessMedicationsCell _setBadgeText:v11];
}

- (id)_circleImageView
{
  id v2 = objc_alloc_init((Class)UIImageView);
  id v3 = +[UIImage systemImageNamed:@"circle"];
  [v2 setImage:v3];

  id v4 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
  id v5 = +[UIImageSymbolConfiguration configurationWithFont:v4];
  [v2 setPreferredSymbolConfiguration:v5];

  [v2 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  return v2;
}

- (id)_checkmarkedCircleImageView
{
  id v2 = objc_alloc_init((Class)UIImageView);
  id v3 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
  [v2 setImage:v3];

  id v4 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
  id v5 = +[UIImageSymbolConfiguration configurationWithFont:v4];
  [v2 setPreferredSymbolConfiguration:v5];

  [v2 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  return v2;
}

- (id)displayNumberOfActiveCardioFitnessMedications:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1F080 != -1) {
    dispatch_once(&qword_1F080, &stru_18650);
  }
  id v4 = (void *)qword_1F078;
  id v5 = +[NSNumber numberWithInt:v3];
  unint64_t v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (NSDateComponents)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void)setMassFormatter:(id)a3
{
}

- (void)setLengthFormatter:(id)a3
{
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (BOOL)wheelchairUseChanged
{
  return self->_wheelchairUseChanged;
}

- (void)setWheelchairUseChanged:(BOOL)a3
{
  self->_wheelchairUseChanged = a3;
}

- (BOOL)showMedicalID
{
  return self->_showMedicalID;
}

- (void)setShowMedicalID:(BOOL)a3
{
  self->_showMedicalID = a3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (BridgeHealthProfileDiffableDataSource)dataSource
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

- (NRDevice)activeTinkerDevice
{
  return self->_activeTinkerDevice;
}

- (void)setActiveTinkerDevice:(id)a3
{
}

- (BOOL)loadingDisplayNameForTinker
{
  return self->_loadingDisplayNameForTinker;
}

- (void)setLoadingDisplayNameForTinker:(BOOL)a3
{
  self->_loadingDisplayNameForTinker = a3;
}

- (HKCloudSyncObserver)cloudSyncObserver
{
  return self->_cloudSyncObserver;
}

- (void)setCloudSyncObserver:(id)a3
{
}

- (UIActivityIndicatorView)tinkerSyncActivityIndicator
{
  return self->_tinkerSyncActivityIndicator;
}

- (void)setTinkerSyncActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerSyncActivityIndicator, 0);
  objc_storeStrong((id *)&self->_cloudSyncObserver, 0);
  objc_storeStrong((id *)&self->_activeTinkerDevice, 0);
  objc_storeStrong((id *)&self->_birthdateChangeManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_lengthFormatter, 0);
  objc_storeStrong((id *)&self->_massFormatter, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_orderedRowIdentifiersBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_betaBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_calciumChannelBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_cardioFitnessMedicationsCell, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_localeWeightUnit, 0);
  objc_storeStrong((id *)&self->_minWeightQuantity, 0);
  objc_storeStrong((id *)&self->_maxWeightQuantity, 0);
  objc_storeStrong((id *)&self->_weightCell, 0);
  objc_storeStrong((id *)&self->_weightPicker, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCell, 0);
  objc_storeStrong((id *)&self->_wheelchairUsePicker, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_heightCell, 0);
  objc_storeStrong((id *)&self->_heightPicker, 0);
  objc_storeStrong((id *)&self->_biologicalSexCell, 0);
  objc_storeStrong((id *)&self->_biologicalSexPicker, 0);
  objc_storeStrong((id *)&self->_birthdateCell, 0);
  objc_storeStrong((id *)&self->_birthdatePicker, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);

  objc_storeStrong((id *)&self->_editButton, 0);
}

@end