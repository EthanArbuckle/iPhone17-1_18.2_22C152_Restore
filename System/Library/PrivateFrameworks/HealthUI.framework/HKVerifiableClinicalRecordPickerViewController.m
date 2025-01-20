@interface HKVerifiableClinicalRecordPickerViewController
- (HKHealthPrivacyServicePickerControllerDelegate)delegate;
- (HKSource)source;
- (HKVerifiableClinicalRecordPickerViewController)initWithClinicalRecords:(id)a3 signedRecords:(id)a4 recordTypes:(id)a5;
- (NSMutableSet)enabledSamples;
- (NSSet)allSamples;
- (NSUUID)sessionIdentifier;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_explanationText:(id)a3;
- (id)_headerIconForRecordTypes:(id)a3;
- (id)_headerTitleForRecordTypes:(id)a3;
- (id)_noDataExplanationTextForRecordTypes:(id)a3;
- (id)_noDataTableViewCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_enableSample:(id)a3 enabled:(BOOL)a4;
- (void)_finishWithError:(id)a3;
- (void)_setUpAccessoryButton;
- (void)_setUpCancelBarButtonItem;
- (void)_setUpFooterView;
- (void)_setUpTableView;
- (void)_updateCancelButtonState;
- (void)_updateShareButtonState;
- (void)cancelButtonTapped:(id)a3;
- (void)learnMoreButtonTapped:(id)a3;
- (void)noDataLearnMoreButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledSamples:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)showDetailsButtonTappedAtIndexPath:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKVerifiableClinicalRecordPickerViewController

- (HKVerifiableClinicalRecordPickerViewController)initWithClinicalRecords:(id)a3 signedRecords:(id)a4 recordTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HKVerifiableClinicalRecordPickerViewController *)self _headerTitleForRecordTypes:v10];
  v12 = [(HKVerifiableClinicalRecordPickerViewController *)self _explanationText:self->_source];
  v13 = [(HKVerifiableClinicalRecordPickerViewController *)self _headerIconForRecordTypes:v10];
  v26.receiver = self;
  v26.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  v14 = [(OBTableWelcomeController *)&v26 initWithTitle:v11 detailText:v12 icon:v13 adoptTableViewScrollView:1];
  if (v14)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    enabledSamples = v14->_enabledSamples;
    v14->_enabledSamples = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
    allSamples = v14->_allSamples;
    v14->_allSamples = (NSSet *)v17;

    uint64_t v19 = [v8 copy];
    clinicalRecords = v14->_clinicalRecords;
    v14->_clinicalRecords = (NSArray *)v19;

    uint64_t v21 = [v9 copy];
    signedRecordsByIdentifier = v14->_signedRecordsByIdentifier;
    v14->_signedRecordsByIdentifier = (NSDictionary *)v21;

    uint64_t v23 = [v10 copy];
    recordTypes = v14->_recordTypes;
    v14->_recordTypes = (NSArray *)v23;

    v14->_hasData = [v8 count] != 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  [(OBTableWelcomeController *)&v12 viewDidLoad];
  v3 = [(HKVerifiableClinicalRecordPickerViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v6 = [(HKVerifiableClinicalRecordPickerViewController *)self view];
    [v6 setBackgroundColor:v5];
  }
  [(HKVerifiableClinicalRecordPickerViewController *)self setModalInPresentation:1];
  v7 = [(HKVerifiableClinicalRecordPickerViewController *)self headerView];
  [v7 setAllowFullWidthIcon:1];

  id v8 = [(HKVerifiableClinicalRecordPickerViewController *)self headerView];
  LODWORD(v9) = 1036831949;
  [v8 setTitleHyphenationFactor:v9];

  [(HKVerifiableClinicalRecordPickerViewController *)self _setUpTableView];
  [(HKVerifiableClinicalRecordPickerViewController *)self _setUpAccessoryButton];
  [(HKVerifiableClinicalRecordPickerViewController *)self _setUpFooterView];
  if (!self->_hasData) {
    [(HKVerifiableClinicalRecordPickerViewController *)self _setUpCancelBarButtonItem];
  }
  if ([(NSArray *)self->_clinicalRecords count] == 1)
  {
    id v10 = [(NSArray *)self->_clinicalRecords objectAtIndexedSubscript:0];
    [(HKVerifiableClinicalRecordPickerViewController *)self _enableSample:v10 enabled:1];
  }
  [(HKVerifiableClinicalRecordPickerViewController *)self _updateShareButtonState];
  [(HKVerifiableClinicalRecordPickerViewController *)self _updateCancelButtonState];
  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  -[OBTableWelcomeController viewWillAppear:](&v8, sel_viewWillAppear_);
  if (self->_hasData)
  {
    v5 = [(HKVerifiableClinicalRecordPickerViewController *)self navigationController];
    char v6 = [v5 isNavigationBarHidden];

    if ((v6 & 1) == 0)
    {
      v7 = [(HKVerifiableClinicalRecordPickerViewController *)self navigationController];
      [v7 setNavigationBarHidden:1 animated:v3];
    }
  }
}

- (void)_setUpTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  char v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(HKVerifiableClinicalRecordPickerViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6)
  {
    double v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v10 = [(OBTableWelcomeController *)self tableView];
    [v10 setBackgroundColor:v9];
  }
  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setAllowsMultipleSelection:1];

  objc_super v12 = [(OBTableWelcomeController *)self tableView];
  uint64_t v13 = objc_opt_class();
  v14 = +[HKObjectPickerTableViewCell defaultReuseIdentifier];
  [v12 registerClass:v13 forCellReuseIdentifier:v14];

  v15 = [(OBTableWelcomeController *)self tableView];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = +[HKObjectPickerShowDetailsTableViewCell defaultReuseIdentifier];
  [v15 registerClass:v16 forCellReuseIdentifier:v17];

  id v20 = [(OBTableWelcomeController *)self tableView];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier];
  [v20 registerClass:v18 forCellReuseIdentifier:v19];
}

- (void)_setUpAccessoryButton
{
  id v7 = [MEMORY[0x1E4F83A98] accessoryButton];
  id v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v7 setTintColor:v3];

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v5 = [v4 localizedStringForKey:@"LEARN_MORE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  [v7 setTitle:v5 forState:0];

  [v7 addTarget:self action:sel_learnMoreButtonTapped_ forControlEvents:64];
  char v6 = [(HKVerifiableClinicalRecordPickerViewController *)self headerView];
  [v6 addAccessoryButton:v7];
}

- (void)_setUpFooterView
{
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  shareButton = self->_shareButton;
  self->_shareButton = v3;

  v5 = self->_shareButton;
  char v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(OBBoldTrayButton *)v5 setTintColor:v6];

  id v7 = self->_shareButton;
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v9 = [v8 localizedStringForKey:@"SHARE_BUTTON_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  [(OBBoldTrayButton *)v7 setTitle:v9 forState:0];

  [(OBBoldTrayButton *)self->_shareButton addTarget:self action:sel_shareButtonTapped_ forControlEvents:64];
  id v10 = [(HKVerifiableClinicalRecordPickerViewController *)self buttonTray];
  [v10 addButton:self->_shareButton];

  v11 = [MEMORY[0x1E4F83AB8] linkButton];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  uint64_t v13 = self->_cancelButton;
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = [v14 localizedStringForKey:@"DONT_SHARE_BUTTON_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  [(OBLinkTrayButton *)v13 setTitle:v15 forState:0];

  [(OBLinkTrayButton *)self->_cancelButton addTarget:self action:sel_cancelButtonTapped_ forControlEvents:64];
  id v16 = [(HKVerifiableClinicalRecordPickerViewController *)self buttonTray];
  [v16 addButton:self->_cancelButton];
}

- (void)_setUpCancelBarButtonItem
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
  id v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (id)_explanationText:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  char v6 = [v5 localizedStringForKey:@"SHARE_DATA_WITH_APP_EXPLANATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

  id v7 = NSString;
  uint64_t v8 = [v4 name];

  if (v8) {
    double v9 = v8;
  }
  else {
    double v9 = &stru_1F3B9CF20;
  }
  id v10 = objc_msgSend(v7, "stringWithFormat:", v6, v9);

  return v10;
}

- (id)_headerIconForRecordTypes:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:*MEMORY[0x1E4F2AAC0]])
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = HKHealthUIFrameworkBundle();
    char v6 = @"scd_immunizations";
  }
  else
  {
    int v7 = [v3 containsObject:*MEMORY[0x1E4F2AAC8]];
    id v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = HKHealthUIFrameworkBundle();
    if (v7) {
      char v6 = @"scd_labs";
    }
    else {
      char v6 = @"health_records_all_records";
    }
  }
  uint64_t v8 = [v4 imageNamed:v6 inBundle:v5];

  return v8;
}

- (id)_headerTitleForRecordTypes:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"SHARE_RESULT_WITH_APP_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

  return v4;
}

- (void)learnMoreButtonTapped:(id)a3
{
  id v4 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.healthapp"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)shareButtonTapped:(id)a3
{
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKVerifiableClinicalRecordPickerViewController shareButtonTapped:](v4);
  }
  [(HKVerifiableClinicalRecordPickerViewController *)self _finishWithError:0];
}

- (void)cancelButtonTapped:(id)a3
{
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKVerifiableClinicalRecordPickerViewController cancelButtonTapped:](v4);
  }
  v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 7, @"The user canceled authorization.");
  [(HKVerifiableClinicalRecordPickerViewController *)self _finishWithError:v5];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKVerifiableClinicalRecordPickerViewController _finishWithError:](v5);
  }
  char v6 = [(HKVerifiableClinicalRecordPickerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(HKVerifiableClinicalRecordPickerViewController *)self delegate];
    [v8 pickerControllerDidFinish:self error:v4];
  }
}

- (void)setSource:(id)a3
{
  p_source = &self->_source;
  objc_storeStrong((id *)&self->_source, a3);
  id v6 = a3;
  id v8 = [(HKVerifiableClinicalRecordPickerViewController *)self headerView];
  char v7 = [(HKVerifiableClinicalRecordPickerViewController *)self _explanationText:*p_source];

  [v8 setDetailText:v7];
}

- (void)_enableSample:(id)a3 enabled:(BOOL)a4
{
  enabledSamples = self->_enabledSamples;
  if (a4) {
    [(NSMutableSet *)enabledSamples addObject:a3];
  }
  else {
    [(NSMutableSet *)enabledSamples removeObject:a3];
  }
}

- (void)_updateShareButtonState
{
  BOOL v3 = [(NSMutableSet *)self->_enabledSamples count] != 0;
  shareButton = self->_shareButton;
  [(OBBoldTrayButton *)shareButton setEnabled:v3];
}

- (void)_updateCancelButtonState
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasData) {
    return [(NSArray *)self->_clinicalRecords count];
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_hasData) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (!self->_hasData)
  {
    id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    double v9 = v8;
    id v10 = @"DATA_SECTION_TABLE_HEADER_NO_DATA";
    goto LABEL_5;
  }
  NSUInteger v7 = [(NSArray *)self->_clinicalRecords count];
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v9 = v8;
  if (v7 == 1)
  {
    id v10 = @"DATA_SECTION_TABLE_HEADER";
LABEL_5:
    v11 = [v8 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
    objc_super v12 = [v11 localizedUppercaseString];

    goto LABEL_7;
  }
  uint64_t v13 = [v8 localizedStringForKey:@"DATA_SECTION_TABLE_HEADER_STRING_FORMAT_%1$ld_%2$ld" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

  objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", v13, a4 + 1, -[NSArray count](self->_clinicalRecords, "count"));
  double v9 = (void *)v13;
LABEL_7:

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_hasData)
  {
    if ([v7 row] == 1)
    {
      double v9 = +[HKObjectPickerShowDetailsTableViewCell defaultReuseIdentifier];
      id v10 = [v6 dequeueReusableCellWithIdentifier:v9];
    }
    else
    {
      v39 = +[HKObjectPickerTableViewCell defaultReuseIdentifier];
      id v10 = objc_msgSend(v6, "dequeueReusableCellWithIdentifier:");
      v11 = -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", [v8 section]);
      signedRecordsByIdentifier = self->_signedRecordsByIdentifier;
      uint64_t v13 = [v11 originIdentifier];
      v14 = [(NSDictionary *)signedRecordsByIdentifier objectForKeyedSubscript:v13];

      v15 = [v11 recordTypeDisplayName];
      [v10 setPrimaryText:v15];

      v38 = v14;
      if (v14)
      {
        id v16 = [v14 issuerDisplayStringWithSignatureStatusGlyph];
        [v10 setSecondaryAttributedText:v16];

        uint64_t v17 = [v14 items];
        uint64_t v18 = [v17 sortedArrayUsingComparator:&__block_literal_global];

        uint64_t v19 = objc_msgSend(v18, "hk_map:", &__block_literal_global_362);
        [v10 setDetailItems:v19];
      }
      else
      {
        id v20 = [v11 recordIssuerDisplayName];
        [v10 setSecondaryText:v20];

        uint64_t v21 = [v11 relevantDate];
        v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v23 = objc_msgSend(v21, "hk_utcDateAdjustedToCalendar:", v22);

        v24 = HKLocalizedStringForDateAndTemplate(v23, 10);
        v25 = [HKObjectPickerDetailItem alloc];
        objc_super v26 = [v11 recordItemsDisplayName];
        v27 = [(HKObjectPickerDetailItem *)v25 initWithPrimaryText:v26 secondaryText:v24];

        v41[0] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
        [v10 setDetailItems:v28];
      }
      v29 = [v11 subject];
      v30 = [v29 fullName];
      [v10 setPatientName:v30];

      v31 = [v11 subject];
      v32 = [v31 dateOfBirthComponents];

      if (v32)
      {
        v33 = objc_msgSend(v32, "hk_populatedCalendarGregorianCalendarDefault");
        v34 = [v33 dateFromComponents:v32];
        v35 = HKLocalizedStringForDateAndTemplate(v34, 10);
        v40 = v35;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        [v10 setPatientDetails:v36];
      }
      objc_msgSend(v10, "setChecked:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v11));
    }
  }
  else
  {
    id v10 = [(HKVerifiableClinicalRecordPickerViewController *)self _noDataTableViewCell];
  }

  return v10;
}

uint64_t __82__HKVerifiableClinicalRecordPickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 relevantDate];
  id v6 = [v4 relevantDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

HKObjectPickerDetailItem *__82__HKVerifiableClinicalRecordPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 relevantDate];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = objc_msgSend(v3, "hk_utcDateAdjustedToCalendar:", v4);

  id v6 = [HKObjectPickerDetailItem alloc];
  uint64_t v7 = [v2 primaryConcept];

  id v8 = [v7 localizedPreferredName];
  double v9 = HKLocalizedStringForDateAndTemplate(v5, 10);
  id v10 = [(HKObjectPickerDetailItem *)v6 initWithPrimaryText:v8 secondaryText:v9];

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x1E4FB2F28];
  if (!a4) {
    return 10.0;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [v9 deselectRowAtIndexPath:v6 animated:1];
  if (self->_hasData)
  {
    if ([v6 row] == 1)
    {
      [(HKVerifiableClinicalRecordPickerViewController *)self showDetailsButtonTappedAtIndexPath:v6];
    }
    else
    {
      uint64_t v7 = [v9 cellForRowAtIndexPath:v6];
      id v8 = -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", [v6 section]);
      -[HKVerifiableClinicalRecordPickerViewController _enableSample:enabled:](self, "_enableSample:enabled:", v8, [v7 checked] ^ 1);
      objc_msgSend(v7, "setChecked:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v8));
      [(HKVerifiableClinicalRecordPickerViewController *)self _updateShareButtonState];
    }
  }
}

- (id)_noDataTableViewCell
{
  BOOL v3 = +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier];
  id v4 = [(OBTableWelcomeController *)self tableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:v3];

  id v6 = [(HKVerifiableClinicalRecordPickerViewController *)self _noDataExplanationTextForRecordTypes:self->_recordTypes];
  [v5 setExplanationText:v6];

  uint64_t v7 = [v5 learnMoreButton];
  [v7 addTarget:self action:sel_noDataLearnMoreButtonTapped_ forControlEvents:64];

  return v5;
}

- (id)_noDataExplanationTextForRecordTypes:(id)a3
{
  id v3 = a3;
  char v4 = [v3 containsObject:*MEMORY[0x1E4F2AAB8]];
  if ([v3 containsObject:*MEMORY[0x1E4F2AAC0]])
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    if (v4) {
      id v6 = @"NO_DATA_TEXT_COVID_IMMUNIZATION";
    }
    else {
      id v6 = @"NO_DATA_TEXT_IMMUNIZATION";
    }
  }
  else
  {
    int v7 = [v3 containsObject:*MEMORY[0x1E4F2AAC8]];
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    if (v7)
    {
      if (v4) {
        id v6 = @"NO_DATA_TEXT_COVID_LABORATORY";
      }
      else {
        id v6 = @"NO_DATA_TEXT_LABORATORY";
      }
    }
    else if (v4)
    {
      id v6 = @"NO_DATA_TEXT_COVID_RECORD";
    }
    else
    {
      id v6 = @"NO_DATA_TEXT_RECORD";
    }
  }
  id v8 = [v5 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];

  return v8;
}

- (void)noDataLearnMoreButtonTapped:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithString:@"https://support.apple.com/en-us/HT212752"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v8];
  [v6 setModalPresentationStyle:7];
  int v7 = [v6 popoverPresentationController];
  [v7 setSourceView:v5];

  [v6 setDismissButtonStyle:0];
  [(HKVerifiableClinicalRecordPickerViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)showDetailsButtonTappedAtIndexPath:(id)a3
{
  char v4 = -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", [a3 section]);
  signedRecordsByIdentifier = self->_signedRecordsByIdentifier;
  id v6 = [v4 originIdentifier];
  int v7 = [(NSDictionary *)signedRecordsByIdentifier objectForKeyedSubscript:v6];

  id v8 = [(HKVerifiableClinicalRecordPickerViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(HKVerifiableClinicalRecordPickerViewController *)self delegate];
    v11 = [v10 medicalRecordsForVerifiableClinicalRecord:v4];

    if (v7)
    {
LABEL_3:
      objc_super v12 = [[HKVerifiableClinicalRecordDetailViewController alloc] initWithSignedRecord:v7 medicalRecords:v11];
      uint64_t v13 = [(HKVerifiableClinicalRecordPickerViewController *)self navigationController];
      [v13 pushViewController:v12 animated:1];

      goto LABEL_9;
    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
      -[HKVerifiableClinicalRecordPickerViewController showDetailsButtonTappedAtIndexPath:](v14);
    }
    v11 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    [(HKVerifiableClinicalRecordPickerViewController *)v15 showDetailsButtonTappedAtIndexPath:v4];
  }
LABEL_9:
}

- (HKSource)source
{
  return self->_source;
}

- (NSSet)allSamples
{
  return self->_allSamples;
}

- (NSMutableSet)enabledSamples
{
  return self->_enabledSamples;
}

- (void)setEnabledSamples:(id)a3
{
}

- (HKHealthPrivacyServicePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHealthPrivacyServicePickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledSamples, 0);
  objc_storeStrong((id *)&self->_allSamples, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong((id *)&self->_signedRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
}

- (void)shareButtonTapped:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Finished signed clinical data authorizations", v7, v8, v9, v10, v11);
}

- (void)cancelButtonTapped:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Canceled signed clinical data authorization", v7, v8, v9, v10, v11);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Dismissing signed clinical data picker", v7, v8, v9, v10, v11);
}

- (void)showDetailsButtonTappedAtIndexPath:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = [a3 originIdentifier];
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint8_t v11 = v7;
  _os_log_debug_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: No HKSignedClinicalDataRecord found for HKVerifiableClinicalRecord with sync identifier %@", (uint8_t *)&v8, 0x16u);
}

- (void)showDetailsButtonTappedAtIndexPath:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Delegate does not respond to medicalRecordsForVerifiableClinicalRecord:", v7, v8, v9, v10, v11);
}

@end