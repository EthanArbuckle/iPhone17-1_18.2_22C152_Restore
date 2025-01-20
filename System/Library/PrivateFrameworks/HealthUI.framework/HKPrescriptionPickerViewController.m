@interface HKPrescriptionPickerViewController
- (HKHealthPrivacyServicePickerControllerDelegate)delegate;
- (HKPrescriptionPickerViewController)initWithHealthStore:(id)a3 samples:(id)a4 enabledSamples:(id)a5 source:(id)a6;
- (HKSource)source;
- (NSMutableSet)enabledSamples;
- (NSSet)allSamples;
- (NSUUID)sessionIdentifier;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_explanationTextForSource:(id)a3;
- (id)_headerIcon;
- (id)_headerTitleForSource:(id)a3;
- (id)_loadPreviewControllerForPrescription:(id)a3;
- (id)_noDataTableViewCell;
- (id)_sortedPrescriptions:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_enableSample:(id)a3 enabled:(BOOL)a4;
- (void)_finishWithError:(id)a3;
- (void)_setUpCancelBarButtonItem;
- (void)_setUpFooterView;
- (void)_setUpTableView;
- (void)_updateShareButtonState;
- (void)cancelButtonTapped:(id)a3;
- (void)didTapShowDetailsButtonForCell:(id)a3;
- (void)didToggleSwitchForCell:(id)a3 isOn:(BOOL)a4;
- (void)learnMoreButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledSamples:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKPrescriptionPickerViewController

- (HKPrescriptionPickerViewController)initWithHealthStore:(id)a3 samples:(id)a4 enabledSamples:(id)a5 source:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(HKPrescriptionPickerViewController *)self _headerTitleForSource:v14];
  v16 = [(HKPrescriptionPickerViewController *)self _explanationTextForSource:v14];
  v17 = [(HKPrescriptionPickerViewController *)self _headerIcon];
  v27.receiver = self;
  v27.super_class = (Class)HKPrescriptionPickerViewController;
  v18 = [(OBTableWelcomeController *)&v27 initWithTitle:v15 detailText:v16 icon:v17 adoptTableViewScrollView:1];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    enabledSamples = v19->_enabledSamples;
    v19->_enabledSamples = (NSMutableSet *)v20;

    uint64_t v22 = [(HKPrescriptionPickerViewController *)v19 _sortedPrescriptions:v12];
    samples = v19->_samples;
    v19->_samples = (NSArray *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    samplesPendingAuthorizationUpdate = v19->_samplesPendingAuthorizationUpdate;
    v19->_samplesPendingAuthorizationUpdate = v24;

    objc_storeStrong((id *)&v19->_source, a6);
    v19->_hasData = [(NSArray *)v19->_samples count] != 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HKPrescriptionPickerViewController;
  [(OBTableWelcomeController *)&v10 viewDidLoad];
  v3 = [(HKPrescriptionPickerViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v6 = [(HKPrescriptionPickerViewController *)self view];
    [v6 setBackgroundColor:v5];
  }
  v7 = [(HKPrescriptionPickerViewController *)self navigationController];
  [v7 setModalInPresentation:1];

  v8 = [(HKPrescriptionPickerViewController *)self headerView];
  [v8 setAllowFullWidthIcon:1];

  [(HKPrescriptionPickerViewController *)self _setUpCancelBarButtonItem];
  [(HKPrescriptionPickerViewController *)self _setUpTableView];
  [(HKPrescriptionPickerViewController *)self _setUpFooterView];
  [(HKPrescriptionPickerViewController *)self _updateShareButtonState];
  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 reloadData];
}

- (void)_setUpCancelBarButtonItem
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
  [v4 setAccessibilityIdentifier:@"UIA.Health.Cancel.Button"];
  v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)_setUpTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(HKPrescriptionPickerViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 6)
  {
    v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    objc_super v10 = [(OBTableWelcomeController *)self tableView];
    [v10 setBackgroundColor:v9];
  }
  id v11 = [(OBTableWelcomeController *)self tableView];
  uint64_t v12 = objc_opt_class();
  id v13 = +[HKPrescriptionPickerCell defaultReuseIdentifier];
  [v11 registerClass:v12 forCellReuseIdentifier:v13];

  id v16 = [(OBTableWelcomeController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier];
  [v16 registerClass:v14 forCellReuseIdentifier:v15];
}

- (void)_setUpFooterView
{
  id v3 = [MEMORY[0x1E4F83A80] boldButton];
  shareButton = self->_shareButton;
  self->_shareButton = v3;

  v5 = self->_shareButton;
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"DONE_BUTTON_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];
  [(OBBoldTrayButton *)v5 setTitle:v7 forState:0];

  [(OBBoldTrayButton *)self->_shareButton addTarget:self action:sel_shareButtonTapped_ forControlEvents:64];
  [(OBBoldTrayButton *)self->_shareButton setAccessibilityIdentifier:@"UIA.Health.Done.Button"];
  id v8 = [(HKPrescriptionPickerViewController *)self buttonTray];
  [v8 addButton:self->_shareButton];
}

- (id)_explanationTextForSource:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"SHARE_DATA_WITH_APP_EXPLANATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];

  v7 = NSString;
  id v8 = [v4 name];

  v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

  return v9;
}

- (id)_headerIcon
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = HKHealthUIFrameworkBundle();
  id v4 = [v2 imageNamed:@"health_privacy_icon_other_data" inBundle:v3];

  return v4;
}

- (id)_headerTitleForSource:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"SHARE_PRESCRIPTION_WITH_APP_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];

  v7 = NSString;
  id v8 = [v4 name];

  v9 = objc_msgSend(v7, "stringWithFormat:", v6, v8);

  return v9;
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
    -[HKPrescriptionPickerViewController shareButtonTapped:](v4);
  }
  [(HKPrescriptionPickerViewController *)self _finishWithError:0];
}

- (void)cancelButtonTapped:(id)a3
{
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKPrescriptionPickerViewController cancelButtonTapped:](v4);
  }
  v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 7, @"The user canceled authorization.");
  [(HKPrescriptionPickerViewController *)self _finishWithError:v5];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKPrescriptionPickerViewController _finishWithError:](v5);
  }
  v6 = [(HKPrescriptionPickerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HKPrescriptionPickerViewController *)self delegate];
    [v8 pickerControllerDidFinish:self error:v4];
  }
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
  BOOL v3 = [(NSMutableSet *)self->_samplesPendingAuthorizationUpdate count] != 0;
  shareButton = self->_shareButton;
  [(OBBoldTrayButton *)shareButton setEnabled:v3];
}

- (NSSet)allSamples
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_samples];
  return (NSSet *)v2;
}

- (NSMutableSet)enabledSamples
{
  v2 = (void *)[(NSMutableSet *)self->_enabledSamples copy];
  return (NSMutableSet *)v2;
}

- (void)didTapShowDetailsButtonForCell:(id)a3
{
  id v4 = [a3 prescription];
  id v6 = [(HKPrescriptionPickerViewController *)self _loadPreviewControllerForPrescription:v4];

  v5 = v6;
  if (v6)
  {
    [(HKPrescriptionPickerViewController *)self presentViewController:v6 animated:1 completion:0];
    v5 = v6;
  }
}

- (void)didToggleSwitchForCell:(id)a3 isOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = [a3 prescription];
  int v6 = -[NSMutableSet containsObject:](self->_samplesPendingAuthorizationUpdate, "containsObject:");
  samplesPendingAuthorizationUpdate = self->_samplesPendingAuthorizationUpdate;
  if (v6) {
    [(NSMutableSet *)samplesPendingAuthorizationUpdate removeObject:v9];
  }
  else {
    [(NSMutableSet *)samplesPendingAuthorizationUpdate addObject:v9];
  }
  enabledSamples = self->_enabledSamples;
  if (v4) {
    [(NSMutableSet *)enabledSamples addObject:v9];
  }
  else {
    [(NSMutableSet *)enabledSamples removeObject:v9];
  }
  [(HKPrescriptionPickerViewController *)self _updateShareButtonState];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasData) {
    return [(NSArray *)self->_samples count];
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int v6 = [v5 localizedStringForKey:@"RECORDS_LIST_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];
    BOOL v4 = [v6 localizedUppercaseString];
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_hasData)
  {
    id v9 = [(HKPrescriptionPickerViewController *)self _noDataTableViewCell];
    goto LABEL_9;
  }
  id v8 = +[HKPrescriptionPickerCell defaultReuseIdentifier];
  id v9 = [v6 dequeueReusableCellWithIdentifier:v8];

  objc_super v10 = -[NSArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", [v7 section]);
  [v9 setPrescription:v10];
  id v11 = [v9 prescription];
  uint64_t v12 = [v11 prescriptionType];

  if (v12 == 2)
  {
    id v13 = @"UIA.Health.Contacts.Cell";
LABEL_7:
    [v9 setAccessibilityIdentifier:v13];
    goto LABEL_8;
  }
  uint64_t v14 = [v9 prescription];
  uint64_t v15 = [v14 prescriptionType];

  if (v15 == 1)
  {
    id v13 = @"UIA.Health.Glasses.Cell";
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v9, "setOn:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v10));
  [v9 setDelegate:self];

LABEL_9:
  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return HKUIOnePixel();
  }
  else {
    return 10.0;
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)_noDataTableViewCell
{
  BOOL v3 = +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier];
  BOOL v4 = [(OBTableWelcomeController *)self tableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:v3];

  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"NO_MATCHING_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];
  [v5 setExplanationText:v7];

  [v5 setShowLearnMoreButton:0];
  return v5;
}

- (id)_loadPreviewControllerForPrescription:(id)a3
{
  id v4 = a3;
  if (self->_visionBundle) {
    goto LABEL_2;
  }
  id v8 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Health/FeedItemPlugins/VisionHealthAppPlugin.healthplugin"];
  if (!v8)
  {
    _HKInitializeLogging();
    uint64_t v14 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:](v14);
    }
    goto LABEL_15;
  }
  id v9 = v8;
  id v17 = 0;
  [(NSBundle *)v8 loadAndReturnError:&v17];
  id v10 = v17;
  if (v10)
  {
    id v11 = v10;
    _HKInitializeLogging();
    uint64_t v12 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      [(HKPrescriptionPickerViewController *)v12 _loadPreviewControllerForPrescription:(uint64_t)v11];
    }

LABEL_15:
    id v7 = 0;
    goto LABEL_16;
  }
  visionBundle = self->_visionBundle;
  self->_visionBundle = v9;

LABEL_2:
  id v5 = objc_alloc(NSClassFromString(&cfstr_Visionhealthap.isa));
  if (objc_opt_respondsToSelector())
  {
    id v6 = (void *)[v5 initWithHealthStore:self->_healthStore visionPrescription:v4 canEdit:0];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  }
  else
  {
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:](v13);
    }
    id v7 = 0;
  }

LABEL_16:
  return v7;
}

- (id)_sortedPrescriptions:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_23];
}

uint64_t __59__HKPrescriptionPickerViewController__sortedPrescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 dateIssued];
  id v6 = [v4 dateIssued];

  uint64_t v7 = [v5 compare:v6];
  return v7;
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

- (void)setEnabledSamples:(id)a3
{
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visionBundle, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_samplesPendingAuthorizationUpdate, 0);
  objc_storeStrong((id *)&self->_enabledSamples, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)shareButtonTapped:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Finished prescription authorization", v7, v8, v9, v10, v11);
}

- (void)cancelButtonTapped:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Canceled prescription authorization", v7, v8, v9, v10, v11);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_0(&dword_1E0B26000, v5, v6, "%{public}@: Dismissing prescription picker", v7, v8, v9, v10, v11);
}

- (void)_loadPreviewControllerForPrescription:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_3_1(&dword_1E0B26000, v5, v6, "%{public}@: Unable to initialize vision bundle for previewing prescriptions", v7, v8, v9, v10, v11);
}

- (void)_loadPreviewControllerForPrescription:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  BOOL v3 = (void *)OUTLINED_FUNCTION_1();
  id v4 = OUTLINED_FUNCTION_2(v3);
  OUTLINED_FUNCTION_3_1(&dword_1E0B26000, v5, v6, "%{public}@: Unable to initialize vision prescription details view controller", v7, v8, v9, v10, v11);
}

- (void)_loadPreviewControllerForPrescription:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load vision bundle for previewing prescriptions with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end