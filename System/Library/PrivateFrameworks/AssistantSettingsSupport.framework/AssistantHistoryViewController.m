@interface AssistantHistoryViewController
- (AssistantHistoryDelegate)delegate;
- (AssistantHistoryViewController)init;
- (id)_deletionResponseAlertForFailure;
- (id)specifiers;
- (int64_t)_getDataSharingOptInStatus;
- (void)_animateSpinnerIn;
- (void)_deleteSiriHistory;
- (void)_endIndicatorViewSpinning;
- (void)_handleDeleteSiriHistoryButtonPress;
- (void)_presentAboutAssistantSheet;
- (void)_presentErrorAlert;
- (void)_presentPrivacySheet;
- (void)_startIndicatorViewSpinning;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AssistantHistoryViewController

- (AssistantHistoryViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AssistantHistoryViewController;
  v2 = [(AssistantHistoryViewController *)&v8 init];
  if (v2)
  {
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;

    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"ASSISTANT_HISTORY_LABEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(AssistantHistoryViewController *)v2 setTitle:v6];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)AssistantHistoryViewController;
  [(AssistantHistoryViewController *)&v23 viewDidAppear:a3];
  v22 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/HISTORY"];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  objc_super v8 = (void *)[v4 initWithKey:@"Siri & Dictation History" table:0 locale:v5 bundleURL:v7];

  v9 = +[GMEligibilityProvider shared];
  LODWORD(v6) = [v9 deviceSupported];

  if (v6) {
    v10 = @"Apple Intelligence & Siri";
  }
  else {
    v10 = @"Siri";
  }
  id v11 = objc_alloc(MEMORY[0x263F08DB0]);
  v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  v15 = (void *)[v11 initWithKey:v10 table:0 locale:v12 bundleURL:v14];

  id v16 = objc_alloc(MEMORY[0x263F08DB0]);
  v17 = [MEMORY[0x263EFF960] currentLocale];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 bundleURL];
  v20 = (void *)[v16 initWithKey:@"Siri & Dictation History" table:0 locale:v17 bundleURL:v19];

  v24[0] = v15;
  v24[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [(AssistantHistoryViewController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v8 localizedNavigationComponents:v21 deepLink:v22];
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
    goto LABEL_30;
  }
  int64_t v6 = [(AssistantHistoryViewController *)self _getDataSharingOptInStatus];
  uint64_t v61 = v2;
  v65 = self;
  id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
  int64_t v59 = v6;
  if (+[AssistantUtilities deviceIsiPhone])
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v8 = v7;
    v9 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_RPI_ON";
  }
  else if (+[AssistantUtilities deviceIsiPad])
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v8 = v7;
    v9 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_RPI_ON";
  }
  else
  {
    BOOL v10 = +[AssistantUtilities deviceIsVision];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v8 = v7;
    if (v10) {
      v9 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_RPI_ON";
    }
    else {
      v9 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_RPI_ON";
    }
  }
  id v11 = [v7 localizedStringForKey:v9 value:&stru_26D2AB140 table:@"AssistantSettings"];

  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = objc_msgSend(v12, "localizedStringForKey:value:table:", @"SIRI_REQUESTS_ABOUT_LINK_TEXT", &stru_26D2AB140);

  uint64_t v14 = NSStringFromSelector(sel__presentAboutAssistantSheet);
  v68 = v11;
  v15 = [v11 stringByAppendingString:v13];
  id v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DELETE_SIRI_HISTORY"];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"DELETE_SIRI_HISTORY" value:&stru_26D2AB140 table:@"AssistantSettings"];
  [v16 setProperty:v18 forKey:*MEMORY[0x263F600F8]];

  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  uint64_t v60 = *MEMORY[0x263F600C0];
  objc_msgSend(v16, "setProperty:forKey:", v20);

  uint64_t v21 = *MEMORY[0x263F600E8];
  [v16 setProperty:v15 forKey:*MEMORY[0x263F600E8]];
  v64 = v15;
  v62 = (void *)v13;
  v70.location = [v15 rangeOfString:v13];
  v22 = NSStringFromRange(v70);
  uint64_t v23 = *MEMORY[0x263F600D0];
  [v16 setProperty:v22 forKey:*MEMORY[0x263F600D0]];

  v24 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v65];
  uint64_t v25 = *MEMORY[0x263F600E0];
  [v16 setProperty:v24 forKey:*MEMORY[0x263F600E0]];

  v63 = (void *)v14;
  uint64_t v26 = v14;
  uint64_t v27 = *MEMORY[0x263F600C8];
  [v16 setProperty:v26 forKey:*MEMORY[0x263F600C8]];
  [v66 addObject:v16];
  v28 = (void *)MEMORY[0x263F5FC40];
  v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"DELETE_SIRI_HISTORY" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v31 = [v28 deleteButtonSpecifierWithName:v30 target:v65 action:sel__handleDeleteSiriHistoryButtonPress];

  [v66 addObject:v31];
  v67 = (void *)v31;
  if (!+[AssistantUtilities isRpiOnDeviceDeletionEnabled])
  {
    uint64_t v55 = v27;
    uint64_t v56 = v25;
    uint64_t v57 = v23;
    uint64_t v58 = v21;
    if ((unint64_t)(v59 - 2) >= 2 && v59)
    {
      if (v59 != 1)
      {
        v37 = v16;
        uint64_t v34 = v61;
LABEL_28:
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = [v42 localizedStringForKey:@"DELETE_SIRI_HISTORY_FOOTER_LINK" value:&stru_26D2AB140 table:@"AssistantSettings"];

        v33 = NSStringFromSelector(sel__presentPrivacySheet);

        v36 = v68;
        v43 = [v68 stringByAppendingString:v35];

        v44 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DELETE_SIRI_HISTORY_SUB_TEXT"];
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        [v44 setProperty:v46 forKey:v60];

        [v44 setProperty:v43 forKey:v58];
        v71.location = [v43 rangeOfString:v35];
        v47 = NSStringFromRange(v71);
        [v44 setProperty:v47 forKey:v57];

        v48 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v65];
        [v44 setProperty:v48 forKey:v56];

        [v44 setProperty:v33 forKey:v55];
        [v66 addObject:v44];

        v32 = v43;
        goto LABEL_29;
      }

      if (+[AssistantUtilities deviceIsiPhone])
      {
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = v38;
        v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_OPTEDIN";
      }
      else
      {
        if (!+[AssistantUtilities deviceIsiPod])
        {
          BOOL v52 = +[AssistantUtilities deviceIsVision];
          v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v39 = v53;
          v37 = v16;
          uint64_t v34 = v61;
          if (v52) {
            v54 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_OPTEDIN";
          }
          else {
            v54 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_OPTEDIN";
          }
          v68 = [v53 localizedStringForKey:v54 value:&stru_26D2AB140 table:@"AssistantSettings"];
          goto LABEL_27;
        }
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = v38;
        v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPOD_OPTEDIN";
      }
    }
    else
    {

      if (+[AssistantUtilities deviceIsiPhone])
      {
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = v38;
        v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPHONE_OPTEDOUT";
      }
      else if (+[AssistantUtilities deviceIsiPod])
      {
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = v38;
        v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPOD_OPTEDOUT";
      }
      else
      {
        BOOL v41 = +[AssistantUtilities deviceIsVision];
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v39 = v38;
        if (v41) {
          v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_VISION_OPTEDOUT";
        }
        else {
          v40 = @"DELETE_SIRI_HISTORY_FOOTER_EXPLANATION_IPAD_OPTEDOUT";
        }
      }
    }
    v68 = [v38 localizedStringForKey:v40 value:&stru_26D2AB140 table:@"AssistantSettings"];
    v37 = v16;
    uint64_t v34 = v61;
LABEL_27:

    goto LABEL_28;
  }
  v33 = v63;
  v32 = v64;
  uint64_t v34 = v61;
  v35 = v62;
  v36 = v68;
  v37 = v16;
LABEL_29:
  v49 = *(Class *)((char *)&v65->super.super.super.super.super.isa + v34);
  *(Class *)((char *)&v65->super.super.super.super.super.isa + v34) = (Class)v66;
  id v50 = v66;

  id v4 = *(id *)((char *)&v65->super.super.super.super.super.isa + v34);
LABEL_30:

  return v4;
}

- (int64_t)_getDataSharingOptInStatus
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  settingsConnection = self->_settingsConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke;
  v12[3] = &unk_26457CEE8;
  uint64_t v14 = &v15;
  v5 = v3;
  uint64_t v13 = v5;
  [(AFSettingsConnection *)settingsConnection getSiriDataSharingOptInStatusWithCompletion:v12];
  dispatch_time_t v6 = dispatch_time(0, 50000000);
  intptr_t v7 = dispatch_semaphore_wait(v5, v6);
  objc_super v8 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = AFSiriDataSharingOptInStatusGetName();
    *(_DWORD *)buf = 136315650;
    v20 = "-[AssistantHistoryViewController _getDataSharingOptInStatus]";
    __int16 v21 = 2048;
    intptr_t v22 = v7;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptInStatus dataSharingOptInFechCompletedIn:%lu optInStatus:%@", buf, 0x20u);
  }
  int64_t v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke_cold_1();
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleDeleteSiriHistoryButtonPress
{
  dispatch_semaphore_t v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = objc_msgSend(v3, "sf_isiPad");

  LODWORD(v3) = +[AssistantUtilities isRpiOnDeviceDeletionEnabled];
  BOOL v5 = +[AssistantUtilities deviceIsiPhone];
  if (!v3)
  {
    if (v5)
    {
      dispatch_time_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      intptr_t v7 = v6;
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPHONE";
      goto LABEL_17;
    }
    if (+[AssistantUtilities deviceIsiPod])
    {
      dispatch_time_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      intptr_t v7 = v6;
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPOD";
      goto LABEL_17;
    }
    BOOL v10 = +[AssistantUtilities deviceIsVision];
    intptr_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v10) {
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_VISION";
    }
    else {
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPAD";
    }
LABEL_16:
    dispatch_time_t v6 = v7;
    goto LABEL_17;
  }
  if (!v5)
  {
    if (+[AssistantUtilities deviceIsiPad])
    {
      dispatch_time_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      intptr_t v7 = v6;
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPAD_RPI_ON";
      goto LABEL_17;
    }
    BOOL v9 = +[AssistantUtilities deviceIsVision];
    intptr_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v9) {
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_VISION_RPI_ON";
    }
    else {
      objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_RPI_ON";
    }
    goto LABEL_16;
  }
  dispatch_time_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  intptr_t v7 = v6;
  objc_super v8 = @"DELETE_SIRI_HISTORY_ALERT_SHEET_MESSAGE_IPHONE_RPI_ON";
LABEL_17:
  id v11 = [v6 localizedStringForKey:v8 value:&stru_26D2AB140 table:@"AssistantSettings"];

  v12 = (void *)MEMORY[0x263F82418];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"DELETE_SIRI_HISTORY" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v15 = [v12 alertControllerWithTitle:v14 message:v11 preferredStyle:v4];

  objc_initWeak(&location, self);
  id v16 = (void *)MEMORY[0x263F82400];
  uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v18 = [v17 localizedStringForKey:@"DELETE_SIRI_HISTORY_ACTION" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __69__AssistantHistoryViewController__handleDeleteSiriHistoryButtonPress__block_invoke;
  uint64_t v27 = &unk_26457CF10;
  objc_copyWeak(&v28, &location);
  v19 = [v16 actionWithTitle:v18 style:2 handler:&v24];

  objc_msgSend(v15, "addAction:", v19, v24, v25, v26, v27);
  v20 = (void *)MEMORY[0x263F82400];
  __int16 v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  intptr_t v22 = [v21 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_SHEET_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  __int16 v23 = [v20 actionWithTitle:v22 style:1 handler:0];

  [v15 addAction:v23];
  [(AssistantHistoryViewController *)self presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __69__AssistantHistoryViewController__handleDeleteSiriHistoryButtonPress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deleteSiriHistory];
}

- (void)_deleteSiriHistory
{
  [(AssistantHistoryViewController *)self _startIndicatorViewSpinning];
  objc_initWeak(&location, self);
  settingsConnection = self->_settingsConnection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke;
  v4[3] = &unk_26457CF38;
  objc_copyWeak(&v5, &location);
  [(AFSettingsConnection *)settingsConnection deleteSiriHistoryWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _endIndicatorViewSpinning];
    if (v3)
    {
      BOOL v6 = +[AssistantUtilities isRpiOnDeviceDeletionEnabled];
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR);
      if (v6)
      {
        if (v7) {
          __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_2();
        }
      }
      else
      {
        if (v7) {
          __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_3();
        }
        [v5 _presentErrorAlert];
      }
    }
    else
    {
      BOOL v9 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        v12 = "-[AssistantHistoryViewController _deleteSiriHistory]_block_invoke";
        _os_log_impl(&dword_220C23000, v9, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptIn: Siri History Deletion Request successful", (uint8_t *)&v11, 0xCu);
      }
      BOOL v10 = [v5 delegate];
      [v10 deleteHistorySuccessfulFromViewController:v5];
    }
  }
  else
  {
    objc_super v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_1(v8);
    }
  }
}

- (void)_startIndicatorViewSpinning
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD98]) allValues];
  uint64_t v4 = v3;
  if (self->_deleteButtonCell)
  {
    [(AssistantHistoryViewController *)self _animateSpinnerIn];
  }
  else if ([v3 count] == 1)
  {
    id v5 = [v4 objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v7 = [v4 objectAtIndex:0];
      deleteButtonCell = self->_deleteButtonCell;
      self->_deleteButtonCell = v7;

      BOOL v9 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x263F823E8]);
      indicatorView = self->_indicatorView;
      self->_indicatorView = v9;

      [(UIActivityIndicatorView *)self->_indicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIActivityIndicatorView *)self->_indicatorView setHidesWhenStopped:0];
      [(UIActivityIndicatorView *)self->_indicatorView setAlpha:0.0];
      [(PSDeleteButtonCell *)self->_deleteButtonCell addSubview:self->_indicatorView];
      int v11 = [(UIActivityIndicatorView *)self->_indicatorView centerXAnchor];
      v12 = [(PSDeleteButtonCell *)self->_deleteButtonCell centerXAnchor];
      uint64_t v13 = [v11 constraintEqualToAnchor:v12];

      uint64_t v14 = [(UIActivityIndicatorView *)self->_indicatorView centerYAnchor];
      uint64_t v15 = [(PSDeleteButtonCell *)self->_deleteButtonCell centerYAnchor];
      id v16 = [v14 constraintEqualToAnchor:v15];

      uint64_t v17 = self->_deleteButtonCell;
      v19[0] = v13;
      v19[1] = v16;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
      [(PSDeleteButtonCell *)v17 addConstraints:v18];

      [(AssistantHistoryViewController *)self _animateSpinnerIn];
    }
  }
}

- (void)_animateSpinnerIn
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke;
  v2[3] = &unk_26457CF60;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke_2;
  v2[3] = &unk_26457CF60;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 animateWithDuration:v2 animations:0.3];
  objc_destroyWeak(&v3);
}

void __51__AssistantHistoryViewController__animateSpinnerIn__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained[174] titleLabel];
    [v2 setAlpha:0.0];

    [v3[175] setAlpha:1.0];
    [v3[175] startAnimating];
    id WeakRetained = v3;
  }
}

- (void)_endIndicatorViewSpinning
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke;
  v2[3] = &unk_26457CF60;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke_2;
  v2[3] = &unk_26457CF60;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 animateWithDuration:v2 animations:0.3];
  objc_destroyWeak(&v3);
}

void __59__AssistantHistoryViewController__endIndicatorViewSpinning__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[175] stopAnimating];
    [v3[175] setAlpha:0.0];
    uint64_t v2 = [v3[174] titleLabel];
    [v2 setAlpha:1.0];

    id WeakRetained = v3;
  }
}

- (void)_presentErrorAlert
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__AssistantHistoryViewController__presentErrorAlert__block_invoke;
  v2[3] = &unk_26457CF60;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__AssistantHistoryViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _deletionResponseAlertForFailure];

  id v3 = objc_loadWeakRetained(v1);
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (id)_deletionResponseAlertForFailure
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_FAILURE_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_FAILURE_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings"];

  BOOL v6 = [MEMORY[0x263F82418] alertControllerWithTitle:v3 message:v5 preferredStyle:1];
  BOOL v7 = (void *)MEMORY[0x263F82400];
  objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v9 = [v8 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_DISMISS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  BOOL v10 = [v7 actionWithTitle:v9 style:0 handler:0];

  [v6 addAction:v10];

  return v6;
}

- (void)_presentPrivacySheet
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improvesiridictation"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_presentAboutAssistantSheet
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (AssistantHistoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AssistantHistoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_deleteButtonCell, 0);

  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

void __60__AssistantHistoryViewController__getDataSharingOptInStatus__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s #siriDataSharingOptInStatus: Status fetch failed with error:%@", v2, v3, v4, v5, 2u);
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AssistantHistoryViewController _deleteSiriHistory]_block_invoke";
  _os_log_error_impl(&dword_220C23000, log, OS_LOG_TYPE_ERROR, "%s #siriDataSharingOptIn: weakSelf nil'd out while waiting for deletion completion", (uint8_t *)&v1, 0xCu);
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s #RPI on-device Siri History Deletion Request failed. Skipping showing alert. error: %@.", v2, v3, v4, v5, 2u);
}

void __52__AssistantHistoryViewController__deleteSiriHistory__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s #siriDataSharingOptIn: Siri History Deletion Request failed with error: %@", v2, v3, v4, v5, 2u);
}

@end