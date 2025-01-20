@interface DKCloudUploadViewController
- (BOOL)showUploadFailureAlert;
- (DKCloudUploadResults)uploadResults;
- (DKCloudUploadViewController)init;
- (NSDateComponentsFormatter)durationFormatter;
- (id)_timeRemainingString:(double)a3;
- (id)cancelBlock;
- (id)skipBlock;
- (void)_cancelTapped:(id)a3;
- (void)_showUploadFailureAlertForResults:(id)a3;
- (void)_skipTapped:(id)a3;
- (void)setCancelBlock:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShowUploadFailureAlert:(BOOL)a3;
- (void)setSkipBlock:(id)a3;
- (void)setUploadResults:(id)a3;
- (void)uploadDidComplete:(id)a3;
- (void)uploadProgress:(float)a3 withTimeRemaining:(double)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DKCloudUploadViewController

- (DKCloudUploadViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CLOUD_UPLOAD_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
  v9.receiver = self;
  v9.super_class = (Class)DKCloudUploadViewController;
  v5 = [(OBSetupAssistantProgressController *)&v9 initWithTitle:v4 detailText:0 symbolName:@"icloud.and.arrow.up"];

  if (v5)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    durationFormatter = v5->_durationFormatter;
    v5->_durationFormatter = v6;

    [(NSDateComponentsFormatter *)v5->_durationFormatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v5->_durationFormatter setMaximumUnitCount:1];
    [(NSDateComponentsFormatter *)v5->_durationFormatter setAllowedUnits:240];
    [(NSDateComponentsFormatter *)v5->_durationFormatter setIncludesApproximationPhrase:1];
  }
  return v5;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)DKCloudUploadViewController;
  [(OBSetupAssistantProgressController *)&v17 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__cancelTapped_];
  v7 = [(OBBaseWelcomeController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v9 = [v8 localizedStringForKey:@"TIME_REMAINING" value:&stru_26EAA9F58 table:@"Localizable"];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"ESTIMATING_TIME_REMAINING" value:&stru_26EAA9F58 table:@"Localizable"];
  v12 = [v9 stringByAppendingString:v11];
  [(OBSetupAssistantProgressController *)self setProgressText:v12];

  [(DKCloudUploadViewController *)self setProgress:0.0];
  v13 = [MEMORY[0x263F5B8D0] linkButton];
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"SKIP_BACKUP" value:&stru_26EAA9F58 table:@"Localizable"];
  [v13 setTitle:v15 forState:0];

  [v13 addTarget:self action:sel__skipTapped_ forControlEvents:64];
  v16 = [(DKCloudUploadViewController *)self buttonTray];
  [v16 addButton:v13];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DKCloudUploadViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  if ([(DKCloudUploadViewController *)self showUploadFailureAlert])
  {
    v4 = [(DKCloudUploadViewController *)self uploadResults];
    [(DKCloudUploadViewController *)self _showUploadFailureAlertForResults:v4];

    [(DKCloudUploadViewController *)self setShowUploadFailureAlert:0];
  }
}

- (void)setProgress:(double)a3
{
  if (a3 < 0.02) {
    a3 = 0.02;
  }
  v3.receiver = self;
  v3.super_class = (Class)DKCloudUploadViewController;
  [(OBSetupAssistantProgressController *)&v3 setProgress:a3];
}

- (void)uploadProgress:(float)a3 withTimeRemaining:(double)a4
{
  [(DKCloudUploadViewController *)self setProgress:a3];
  id v6 = [(DKCloudUploadViewController *)self _timeRemainingString:a4];
  [(OBSetupAssistantProgressController *)self setProgressText:v6];
}

- (void)uploadDidComplete:(id)a3
{
  id v6 = a3;
  if ([v6 success]) {
    -[DKCloudUploadViewController uploadDidComplete:]();
  }
  v4 = [(DKCloudUploadViewController *)self view];
  objc_super v5 = [v4 window];

  if (v5)
  {
    [(DKCloudUploadViewController *)self _showUploadFailureAlertForResults:v6];
  }
  else
  {
    [(DKCloudUploadViewController *)self setUploadResults:v6];
    [(DKCloudUploadViewController *)self setShowUploadFailureAlert:1];
  }
}

- (id)_timeRemainingString:(double)a3
{
  if (a3 <= 604800.0)
  {
    if (a3 > 0.0)
    {
      id v6 = -[NSDateComponentsFormatter stringFromTimeInterval:](self->_durationFormatter, "stringFromTimeInterval:");
      goto LABEL_7;
    }
    objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    objc_super v5 = @"LESS_THAN_ONE_MINUTE_REMAINING";
  }
  else
  {
    objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    objc_super v5 = @"ESTIMATING_TIME_REMAINING";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26EAA9F58 table:@"Localizable"];

LABEL_7:
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"TIME_REMAINING" value:&stru_26EAA9F58 table:@"Localizable"];
  objc_super v9 = [v8 stringByAppendingString:v6];

  return v9;
}

- (void)_showUploadFailureAlertForResults:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    -[DKCloudUploadViewController _showUploadFailureAlertForResults:]();
  }
  objc_super v5 = v4;
  id v6 = [v4 syncResult];
  char v7 = [v6 success];

  unint64_t v8 = 0x263F08000uLL;
  v72 = v5;
  if (v7)
  {
    v71 = self;
    objc_super v9 = [v5 backupResults];
    v10 = (void *)[v9 mutableCopy];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v11 = [v10 reverseObjectEnumerator];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v80 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([v16 success]) {
            [v10 removeObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v10 count];
    v18 = [v10 firstObject];
    v19 = v18;
    v70 = v10;
    if (v17 == 1)
    {
      v20 = [v18 isPrimaryAccount];
      int v21 = [v20 BOOLValue];

      v22 = [v19 error];
      int v23 = objc_msgSend(v22, "dkui_isBackupDisabled");

      self = v71;
      if (v21)
      {
        v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = v24;
        if (v23)
        {
          v26 = [v24 localizedStringForKey:@"BACKUP_DISABLED_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

          v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v28 = v27;
          v29 = @"BACKUP_DISABLED_ALERT_MESSAGE";
LABEL_30:
          v33 = [v27 localizedStringForKey:v29 value:&stru_26EAA9F58 table:@"Localizable"];
LABEL_38:

          goto LABEL_39;
        }
        v26 = [v24 localizedStringForKey:@"CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
      }
      else
      {
        v47 = NSString;
        v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = v48;
        if (v23)
        {
          v49 = [v48 localizedStringForKey:@"BACKUP_DISABLED_ALERT_SINGLE_ACCOUNT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
          v50 = [v19 username];
          v26 = objc_msgSend(v47, "localizedStringWithFormat:", v49, v50);

          v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v28 = v27;
          v29 = @"BACKUP_DISABLED_ALERT_SINGLE_ACCOUNT_MESSAGE";
          goto LABEL_30;
        }
        v58 = [v48 localizedStringForKey:@"CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_SINGLE_ACCOUNT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
        v59 = [v19 username];
        v26 = objc_msgSend(v47, "localizedStringWithFormat:", v58, v59);
      }
      v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v60 = SFLocalizableWAPIStringKeyForKey();
      v33 = [v28 localizedStringForKey:v60 value:&stru_26EAA9F58 table:@"Localizable"];

      goto LABEL_38;
    }
    v34 = [v18 username];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v35 = v10;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v76;
      int v39 = 1;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v76 != v38) {
            objc_enumerationMutation(v35);
          }
          v41 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          v42 = [v41 error];
          int v43 = objc_msgSend(v42, "dkui_isBackupDisabled");

          v44 = [v41 isPrimaryAccount];
          int v45 = [v44 BOOLValue];

          if (v45)
          {
            uint64_t v46 = [v41 username];

            v34 = (void *)v46;
          }
          v39 &= v43;
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v37);

      if (!v39)
      {
        v54 = NSString;
        self = v71;
        v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v56 = [v55 localizedStringForKey:@"CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_MULTIPLE_ACCOUNT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
        v26 = objc_msgSend(v54, "localizedStringWithFormat:", v56, v34, objc_msgSend(v35, "count") - 1);

        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v57 = SFLocalizableWAPIStringKeyForKey();
        v33 = [v28 localizedStringForKey:v57 value:&stru_26EAA9F58 table:@"Localizable"];

        goto LABEL_34;
      }
      self = v71;
      unint64_t v8 = 0x263F08000;
    }
    else
    {

      self = v71;
    }
    v51 = NSString;
    v52 = [*(id *)(v8 + 1760) bundleForClass:objc_opt_class()];
    v53 = [v52 localizedStringForKey:@"BACKUP_DISABLED_ALERT_MULTIPLE_ACCOUNTS_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];
    v26 = objc_msgSend(v51, "localizedStringWithFormat:", v53, v34, objc_msgSend(v35, "count") - 1);

    v28 = [*(id *)(v8 + 1760) bundleForClass:objc_opt_class()];
    v33 = [v28 localizedStringForKey:@"BACKUP_DISABLED_ALERT_MULTIPLE_ACCOUNTS_MESSAGE" value:&stru_26EAA9F58 table:@"Localizable"];
LABEL_34:
    v19 = v34;
    goto LABEL_38;
  }
  v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v30 localizedStringForKey:@"CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_TITLE" value:&stru_26EAA9F58 table:@"Localizable"];

  v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v32 = SFLocalizableWAPIStringKeyForKey();
  v33 = [v31 localizedStringForKey:v32 value:&stru_26EAA9F58 table:@"Localizable"];

LABEL_39:
  v61 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v26 message:v33 preferredStyle:1];
  v62 = (void *)MEMORY[0x263F1C3F0];
  v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v64 = [v63 localizedStringForKey:@"DONT_ERASE" value:&stru_26EAA9F58 table:@"Localizable"];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke;
  v74[3] = &unk_264CF0AE8;
  v74[4] = self;
  v65 = [v62 actionWithTitle:v64 style:1 handler:v74];
  [v61 addAction:v65];

  v66 = (void *)MEMORY[0x263F1C3F0];
  v67 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v68 = [v67 localizedStringForKey:@"ERASE_ANYWAY" value:&stru_26EAA9F58 table:@"Localizable"];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke_2;
  v73[3] = &unk_264CF0AE8;
  v73[4] = self;
  v69 = [v66 actionWithTitle:v68 style:2 handler:v73];
  [v61 addAction:v69];

  [(DKCloudUploadViewController *)self presentViewController:v61 animated:1 completion:0];
}

void __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cancelBlock];

  if (v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) cancelBlock];
    v3[2]();
  }
}

void __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) skipBlock];

  if (v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) skipBlock];
    v3[2]();
  }
}

- (void)_skipTapped:(id)a3
{
  id v4 = [(DKCloudUploadViewController *)self skipBlock];

  if (v4)
  {
    objc_super v5 = [(DKCloudUploadViewController *)self skipBlock];
    v5[2]();
  }
}

- (void)_cancelTapped:(id)a3
{
  id v4 = [(DKCloudUploadViewController *)self cancelBlock];

  if (v4)
  {
    objc_super v5 = [(DKCloudUploadViewController *)self cancelBlock];
    v5[2]();
  }
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)skipBlock
{
  return self->_skipBlock;
}

- (void)setSkipBlock:(id)a3
{
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (DKCloudUploadResults)uploadResults
{
  return self->_uploadResults;
}

- (void)setUploadResults:(id)a3
{
  self->_uploadResults = (DKCloudUploadResults *)a3;
}

- (BOOL)showUploadFailureAlert
{
  return self->_showUploadFailureAlert;
}

- (void)setShowUploadFailureAlert:(BOOL)a3
{
  self->_showUploadFailureAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong(&self->_skipBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

- (void)uploadDidComplete:.cold.1()
{
}

- (void)_showUploadFailureAlertForResults:.cold.1()
{
}

@end