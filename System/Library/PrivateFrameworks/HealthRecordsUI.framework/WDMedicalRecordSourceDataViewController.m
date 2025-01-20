@interface WDMedicalRecordSourceDataViewController
- (BOOL)hasFetchedSourceString;
- (HKMedicalRecord)medicalRecord;
- (HRProfile)profile;
- (UIBarButtonItem)shareItem;
- (UITextView)sourceView;
- (WDMedicalRecordSourceDataViewController)initWithProfile:(id)a3 medicalRecord:(id)a4;
- (void)_fetchAndDisplaySourceStringIfNecessary;
- (void)_tapToRadar:(id)a3;
- (void)displaySourceString:(id)a3;
- (void)loadView;
- (void)selectAll:(id)a3;
- (void)setHasFetchedSourceString:(BOOL)a3;
- (void)setShareItem:(id)a3;
- (void)share:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDMedicalRecordSourceDataViewController

- (WDMedicalRecordSourceDataViewController)initWithProfile:(id)a3 medicalRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WDMedicalRecordSourceDataViewController;
  v9 = [(WDMedicalRecordSourceDataViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    uint64_t v11 = [v8 copy];
    medicalRecord = v10->_medicalRecord;
    v10->_medicalRecord = (HKMedicalRecord *)v11;

    v13 = HRLocalizedString(@"ORIGINAL_SOURCE_DATA_TITLE");
    [(WDMedicalRecordSourceDataViewController *)v10 setTitle:v13];
  }
  return v10;
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)WDMedicalRecordSourceDataViewController;
  [(WDMedicalRecordSourceDataViewController *)&v16 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  sourceView = self->_sourceView;
  self->_sourceView = v4;

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UITextView *)self->_sourceView setTextColor:v6];

  [(UITextView *)self->_sourceView setTextAlignment:0];
  [(UITextView *)self->_sourceView setEditable:0];
  id v7 = [(WDMedicalRecordSourceDataViewController *)self view];
  [v7 addSubview:self->_sourceView];

  id v8 = self->_sourceView;
  v9 = [(WDMedicalRecordSourceDataViewController *)self view];
  [(UITextView *)v8 hk_alignConstraintsWithView:v9];

  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_share_];
    [(WDMedicalRecordSourceDataViewController *)self setShareItem:v11];

    v12 = [(WDMedicalRecordSourceDataViewController *)self shareItem];
    [v10 addObject:v12];

    v13 = [(WDMedicalRecordSourceDataViewController *)self shareItem];
    [v13 setEnabled:0];

    v14 = [MEMORY[0x1E4FB14A8] makeTapToRadarItemWithTarget:self action:sel__tapToRadar_];
    if (v14) {
      [v10 addObject:v14];
    }
    objc_super v15 = [(WDMedicalRecordSourceDataViewController *)self navigationItem];
    [v15 setRightBarButtonItems:v10];
  }
}

- (void)share:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyyMMdd'T'HHmmss"];
  v6 = NSString;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v5 stringFromDate:v7];
  v9 = [(WDMedicalRecordSourceDataViewController *)self medicalRecord];
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  v12 = [v6 stringWithFormat:@"%@ %@.json", v8, v11];

  v13 = (void *)MEMORY[0x1E4F1CB10];
  v14 = NSTemporaryDirectory();
  objc_super v15 = [v14 stringByAppendingPathComponent:v12];
  objc_super v16 = [v13 fileURLWithPath:v15];

  v17 = [(WDMedicalRecordSourceDataViewController *)self sourceView];
  uint64_t v18 = [v17 text];
  v19 = [(id)v18 dataUsingEncoding:4];

  id v28 = 0;
  LOBYTE(v18) = [v19 writeToURL:v16 options:0 error:&v28];
  id v20 = v28;
  if (v18)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v29[0] = v16;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v23 = (void *)[v21 initWithActivityItems:v22 applicationActivities:0];

    v24 = [v23 popoverPresentationController];
    [v24 setSourceItem:v4];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__WDMedicalRecordSourceDataViewController_share___block_invoke;
    v26[3] = &unk_1E644B048;
    id v27 = v16;
    [v23 setCompletionWithItemsHandler:v26];
    [(WDMedicalRecordSourceDataViewController *)self presentViewController:v23 animated:1 completion:0];
  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[WDMedicalRecordSourceDataViewController share:]((uint64_t)v20, v25);
    }
  }
}

void __49__WDMedicalRecordSourceDataViewController_share___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __49__WDMedicalRecordSourceDataViewController_share___block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDMedicalRecordSourceDataViewController;
  [(WDMedicalRecordSourceDataViewController *)&v4 viewWillAppear:a3];
  [(WDMedicalRecordSourceDataViewController *)self _fetchAndDisplaySourceStringIfNecessary];
}

- (void)_tapToRadar:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)_fetchAndDisplaySourceStringIfNecessary
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (![(WDMedicalRecordSourceDataViewController *)self hasFetchedSourceString])
  {
    [(WDMedicalRecordSourceDataViewController *)self setHasFetchedSourceString:1];
    objc_initWeak(&location, self);
    uint64_t v3 = [(WDMedicalRecordSourceDataViewController *)self profile];
    objc_super v4 = [v3 healthRecordsStore];
    id v5 = [(WDMedicalRecordSourceDataViewController *)self medicalRecord];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke;
    v6[3] = &unk_1E644B070;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [v4 fetchRawSourceStringForHealthRecord:v5 completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_307;
    block[3] = &unk_1E644A670;
    block[4] = WeakRetained;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_cold_1(v11, v8, (uint64_t)v6);
    }
  }
}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_307(uint64_t a1)
{
  [*(id *)(a1 + 32) displaySourceString:*(void *)(a1 + 40)];
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    id v2 = [*(id *)(a1 + 48) shareItem];
    [v2 setEnabled:1];
  }
}

- (void)displaySourceString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = *MEMORY[0x1E4FB28D8];
  id v7 = [(WDMedicalRecordSourceDataViewController *)self traitCollection];
  id v8 = [v5 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v7];
  id v9 = [(WDMedicalRecordSourceDataViewController *)self sourceView];
  [v9 setFont:v8];

  id v10 = [(WDMedicalRecordSourceDataViewController *)self sourceView];
  [v10 setText:v4];
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (UITextView)sourceView
{
  return self->_sourceView;
}

- (BOOL)hasFetchedSourceString
{
  return self->_hasFetchedSourceString;
}

- (void)setHasFetchedSourceString:(BOOL)a3
{
  self->_hasFetchedSourceString = a3;
}

- (UIBarButtonItem)shareItem
{
  return self->_shareItem;
}

- (void)setShareItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

- (void)share:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Failed to write resource for sharing with error %{public}@", (uint8_t *)&v2, 0xCu);
}

void __49__WDMedicalRecordSourceDataViewController_share___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Failed to clean up resource with error %{public}@", (uint8_t *)&v2, 0xCu);
}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = [a2 medicalRecord];
  id v7 = HKSensitiveLogItem();
  int v8 = 138412546;
  id v9 = v7;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_error_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch source string for medical record %@: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end