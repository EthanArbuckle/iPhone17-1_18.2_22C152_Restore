@interface HKDocumentPickerViewController
- (BOOL)_isPrompting;
- (BOOL)_needsSampleRequestDescription;
- (HKDocumentPickerViewController)initWithCoder:(id)a3;
- (HKDocumentPickerViewController)initWithDocumentAuthorizations:(id)a3;
- (HKDocumentPickerViewController)initWithDocuments:(id)a3 presentationStyle:(int64_t)a4;
- (HKHealthPrivacyServicePickerControllerDelegate)delegate;
- (HKHealthStore)healthStore;
- (HKSource)source;
- (NSMutableSet)enabledSamples;
- (NSSet)allSamples;
- (NSUUID)sessionIdentifier;
- (id)_tableHeaderView;
- (id)dataMetadataViewControllerForSample:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addCancelAndDoneButtons;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_enableDocumentSample:(id)a3 enabled:(BOOL)a4;
- (void)_finishWithError:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)adjustHeaderViewFrame;
- (void)cdaDocumentTableViewCellDidChangeValue:(id)a3;
- (void)configureHeaderView:(id)a3;
- (void)pushDetailForDocumentSample:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledSamples:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HKDocumentPickerViewController

- (HKDocumentPickerViewController)initWithDocuments:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDocumentPickerViewController;
  v7 = [(HKTableViewController *)&v18 initWithUsingInsetStyling:1];
  if (v7)
  {
    uint64_t v8 = [v6 mutableCopy];
    samplesList = v7->_samplesList;
    v7->_samplesList = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    allSamples = v7->_allSamples;
    v7->_allSamples = (NSSet *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    enabledSamples = v7->_enabledSamples;
    v7->_enabledSamples = v12;

    v7->_presentationStyle = a4;
    v14 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    healthStore = v7->_healthStore;
    v7->_healthStore = v14;

    if (a4) {
      BOOL v16 = (unint64_t)[(NSMutableArray *)v7->_samplesList count] > 1;
    }
    else {
      BOOL v16 = 1;
    }
    v7->_showCheckboxes = v16;
  }

  return v7;
}

- (HKDocumentPickerViewController)initWithDocumentAuthorizations:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 allKeys];
  id v6 = [(HKDocumentPickerViewController *)self initWithDocuments:v5 presentationStyle:0];
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v16 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v13 = [v4 objectForKeyedSubscript:v12];
          int v14 = [v13 BOOLValue];

          if (v14) {
            [(NSMutableSet *)v6->_enabledSamples addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    v5 = v16;
  }

  return v6;
}

- (HKDocumentPickerViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKDocumentPickerViewController;
  return [(HKDocumentPickerViewController *)&v4 initWithCoder:a3];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HKDocumentPickerViewController;
  [(HKTableViewController *)&v6 viewDidLoad];
  if ([(HKDocumentPickerViewController *)self _isPrompting]) {
    [(HKDocumentPickerViewController *)self _addCancelAndDoneButtons];
  }
  if ([(NSMutableArray *)self->_samplesList count] == 1)
  {
    v3 = [(NSMutableArray *)self->_samplesList objectAtIndexedSubscript:0];
    [(HKDocumentPickerViewController *)self _enableDocumentSample:v3 enabled:1];
  }
  objc_super v4 = [(HKDocumentPickerViewController *)self tableView];
  [v4 setEstimatedRowHeight:114.0];

  v5 = [(HKDocumentPickerViewController *)self tableView];
  [v5 _setSectionCornerRadius:10.0];

  [(HKDocumentPickerViewController *)self _updateForCurrentSizeCategory];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKDocumentPickerViewController;
  [(HKDocumentPickerViewController *)&v3 viewWillLayoutSubviews];
  [(HKDocumentPickerViewController *)self adjustHeaderViewFrame];
}

- (void)_updateForCurrentSizeCategory
{
  objc_super v3 = [(HKDocumentPickerViewController *)self tableView];
  BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB27D0]);
  double v5 = *MEMORY[0x1E4FB2F28];
  if (!IsLargerThanSizeCategory) {
    double v5 = 114.0;
  }
  [v3 setRowHeight:v5];

  if (self->_tableHeaderView)
  {
    [(HKDocumentPickerViewController *)self adjustHeaderViewFrame];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKDocumentPickerViewController;
  [(HKDocumentPickerViewController *)&v7 viewWillDisappear:a3];
  if (![(HKDocumentPickerViewController *)self _isPrompting])
  {
    objc_super v4 = [(HKDocumentPickerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [(HKDocumentPickerViewController *)self delegate];
      [v6 pickerControllerDidFinish:self error:0];
    }
  }
}

- (void)_addCancelAndDoneButtons
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  char v5 = [v4 localizedStringForKey:@"AUTHORIZATION_PROMPT_DONT_ALLOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v13 = (id)[v3 initWithTitle:v5 style:0 target:self action:sel__cancel_];

  id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
  objc_super v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"AUTHORIZATION_PROMPT_ALLOW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v9 = (void *)[v6 initWithTitle:v8 style:2 target:self action:sel__done_];

  [v9 setEnabled:0];
  uint64_t v10 = [(HKDocumentPickerViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v13];
  [v10 setRightBarButtonItem:v9];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v12 = [v11 localizedStringForKey:@"HEALTH_ACCESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v10 setTitle:v12];
}

- (BOOL)_isPrompting
{
  return self->_presentationStyle == 1;
}

- (BOOL)_needsSampleRequestDescription
{
  return self->_presentationStyle != 2;
}

- (void)_cancel:(id)a3
{
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKDocumentPickerViewController _cancel:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ([(HKDocumentPickerViewController *)self _isPrompting])
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 7, @"The user canceled authorization.");
    [(HKDocumentPickerViewController *)self _finishWithError:v12];
  }
  else
  {
    [(HKDocumentPickerViewController *)self _finishWithError:0];
  }
}

- (void)_done:(id)a3
{
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKDocumentPickerViewController _done:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [(HKDocumentPickerViewController *)self _finishWithError:0];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEBUG)) {
    -[HKDocumentPickerViewController _finishWithError:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [(HKDocumentPickerViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(HKDocumentPickerViewController *)self delegate];
    [v15 pickerControllerDidFinish:self error:v4];
  }
}

- (void)setSource:(id)a3
{
  uint64_t v5 = (HKSource *)a3;
  p_source = &self->_source;
  if (self->_source != v5)
  {
    uint64_t v11 = v5;
    objc_storeStrong((id *)p_source, a3);
    uint64_t v7 = [(HKDocumentPickerViewController *)self tableView];
    [v7 reloadData];

    p_source = (HKSource **)[(HKDocumentPickerViewController *)self _isPrompting];
    uint64_t v5 = v11;
    if (p_source)
    {
      uint64_t v8 = [(HKDocumentPickerViewController *)self _tableHeaderView];
      [(HKDocumentPickerViewController *)self configureHeaderView:v8];
      if (v11) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = [(HKDocumentPickerViewController *)self tableView];
      [v10 setTableHeaderView:v9];

      uint64_t v5 = v11;
    }
  }
  MEMORY[0x1F41817F8](p_source, v5);
}

- (id)_tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    id v4 = objc_alloc_init(HKTitledIconHeaderView);
    uint64_t v5 = self->_tableHeaderView;
    self->_tableHeaderView = v4;

    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (void)configureHeaderView:(id)a3
{
  id v15 = a3;
  if ([(HKDocumentPickerViewController *)self _needsSampleRequestDescription])
  {
    uint64_t v4 = [(NSMutableArray *)self->_samplesList count];
    if (v4 == 2)
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v7 = v6;
      uint64_t v8 = @"CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_DUAL";
    }
    else
    {
      uint64_t v5 = NSString;
      if (v4 == 1)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v7 = v6;
        uint64_t v8 = @"CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_SINGULAR";
      }
      else
      {
        uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v7 = v6;
        uint64_t v8 = @"CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_PLURAL";
      }
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v10 = [(HKSource *)self->_source name];
    uint64_t v11 = objc_msgSend(v5, "stringWithFormat:", v9, v10);

    [v15 setSubtitle:v11];
  }
  else
  {
    [v15 setSubtitle:0];
  }
  uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:@"HEALTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v15 setTitle:v13];

  char v14 = [(HKDocumentPickerViewController *)self tableView];
  [v15 setLayoutMarginsWithTableView:v14];
}

- (void)adjustHeaderViewFrame
{
  [(HKTitledIconHeaderView *)self->_tableHeaderView frame];
  double v4 = v3;
  double v6 = v5;
  tableHeaderView = self->_tableHeaderView;
  uint64_t v8 = [(HKDocumentPickerViewController *)self tableView];
  [v8 bounds];
  -[HKTitledIconHeaderView sizeThatFits:](tableHeaderView, "sizeThatFits:", v9, v10);
  double v12 = v11;
  double v14 = v13;

  id v15 = self->_tableHeaderView;
  -[HKTitledIconHeaderView setFrame:](v15, "setFrame:", v4, v6, v12, v14 + 16.0);
}

- (void)_enableDocumentSample:(id)a3 enabled:(BOOL)a4
{
  enabledSamples = self->_enabledSamples;
  if (a4) {
    [(NSMutableSet *)enabledSamples addObject:a3];
  }
  else {
    [(NSMutableSet *)enabledSamples removeObject:a3];
  }
  BOOL v6 = [(NSMutableSet *)self->_enabledSamples count] != 0;
  id v8 = [(HKDocumentPickerViewController *)self navigationItem];
  uint64_t v7 = [v8 rightBarButtonItem];
  [v7 setEnabled:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDocumentPickerViewController;
  [(HKDocumentPickerViewController *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKDocumentPickerViewController *)self traitCollection];
    BOOL v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKDocumentPickerViewController *)self _updateForCurrentSizeCategory];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  samplesList = self->_samplesList;
  id v7 = a3;
  char v8 = -[NSMutableArray objectAtIndex:](samplesList, "objectAtIndex:", [a4 row]);
  if (self->_showCheckboxes) {
    objc_super v9 = @"DocumentMultipleSelectionTableViewCellIdentifier";
  }
  else {
    objc_super v9 = @"DocumentSingleSelectionTableViewCellIdentifier";
  }
  double v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  if (!v10)
  {
    BOOL showCheckboxes = self->_showCheckboxes;
    double v12 = [HKCDADocumentTableViewCell alloc];
    if (showCheckboxes)
    {
      double v10 = [(HKCDADocumentTableViewCell *)v12 initWithStyle:0 reuseIdentifier:@"DocumentMultipleSelectionTableViewCellIdentifier"];
      [(HKCDADocumentTableViewCell *)v10 setDelegate:self];
      double v13 = v10;
      uint64_t v14 = 1;
    }
    else
    {
      double v13 = [(HKCDADocumentTableViewCell *)v12 initWithStyle:0 reuseIdentifier:@"DocumentSingleSelectionTableViewCellIdentifier"];
      double v10 = v13;
      uint64_t v14 = 0;
    }
    [(HKCDADocumentTableViewCell *)v13 setShowsCheckbox:v14];
  }
  [(HKCDADocumentTableViewCell *)v10 setCellValuesForDocumentSample:v8];
  [(HKCDADocumentTableViewCell *)v10 setChecked:[(NSMutableSet *)self->_enabledSamples containsObject:v8]];
  [(HKCDADocumentTableViewCell *)v10 setAccessoryType:1];

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_samplesList count];
}

- (void)pushDetailForDocumentSample:(id)a3
{
  id v4 = a3;
  double v5 = [HKCDADocumentDetailViewController alloc];
  BOOL v6 = [v4 document];

  id v7 = [v6 documentData];
  objc_super v9 = [(HKCDADocumentDetailViewController *)v5 initWithReportData:v7];

  char v8 = [(HKDocumentPickerViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (id)dataMetadataViewControllerForSample:(id)a3
{
  id v4 = a3;
  double v5 = [[HKDataMetadataViewController alloc] initWithSample:v4 usingInsetStyling:1 profileName:0 delegate:self];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = -[NSMutableArray objectAtIndex:](self->_samplesList, "objectAtIndex:", [v6 row]);
  char v8 = [v7 document];
  objc_super v9 = [v8 documentData];

  if (v9)
  {
    double v10 = [(HKDocumentPickerViewController *)self dataMetadataViewControllerForSample:v7];
    double v11 = [(HKDocumentPickerViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
  else if (!self->_hasPendingDocumentFetch)
  {
    self->_hasPendingDocumentFetch = 1;
    id v12 = objc_alloc(MEMORY[0x1E4F2AF70]);
    double v13 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
    uint64_t v14 = (void *)MEMORY[0x1E4F2B3C0];
    id v15 = [v7 UUID];
    BOOL v16 = [v14 predicateForObjectWithUUID:v15];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E6D55CE0;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    long long v17 = (void *)[v12 initWithDocumentType:v13 predicate:v16 limit:1 sortDescriptors:0 includeDocumentData:1 resultsHandler:v18];

    [(HKHealthStore *)self->_healthStore executeQuery:v17];
  }
}

void __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v7[3] = &unk_1E6D55518;
  double v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1056) = 0;
  if ([*(id *)(a1 + 40) count])
  {
    v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1032), "setObject:atIndexedSubscript:", v2, objc_msgSend(*(id *)(a1 + 48), "row"));

    id v4 = [*(id *)(a1 + 32) dataMetadataViewControllerForSample:*(void *)(a1 + 56)];
    double v3 = [*(id *)(a1 + 32) navigationController];
    [v3 pushViewController:v4 animated:1];
  }
}

- (void)cdaDocumentTableViewCellDidChangeValue:(id)a3
{
  id v4 = a3;
  double v5 = [(HKDocumentPickerViewController *)self tableView];
  id v8 = [v5 indexPathForCell:v4];

  id v6 = -[NSMutableArray objectAtIndex:](self->_samplesList, "objectAtIndex:", [v8 row]);
  uint64_t v7 = [v4 isChecked];

  [(HKDocumentPickerViewController *)self _enableDocumentSample:v6 enabled:v7];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
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
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_samplesList, 0);
}

- (void)_cancel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_done:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_finishWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end