@interface AUDeveloperSettingsController
- (AUDeveloperSettingsController)init;
- (BOOL)needLegalConsent;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)createCustomerSpecifiers;
- (id)getOverrideLocation:(id)a3;
- (id)isSeedParticipationEnabled:(id)a3;
- (id)islogCollectionEnabled:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_agreePrivacyConsent;
- (void)_agreeToLegalConsent;
- (void)_notNowToLegalConsent;
- (void)_notNowToPrivacyConsent;
- (void)handleBTUserSettingsChangedNotification:(int)a3;
- (void)handleLogCollectionToggle:(id)a3 specifier:(id)a4;
- (void)registerForNotifications;
- (void)removedSpecifier:(id)a3;
- (void)setSeedParticipation:(id)a3 specifier:(id)a4;
- (void)setlogCollection:(id)a3 specifier:(id)a4;
- (void)showLegalConsent:(id)a3;
- (void)showLegalConsentLearnMoreLink:(id)a3;
- (void)showParticipateInSeedOffAlert:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AUDeveloperSettingsController

- (AUDeveloperSettingsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AUDeveloperSettingsController;
  v2 = [(AUDeveloperSettingsController *)&v9 init];
  if (v2)
  {
    v3 = (CBUserController *)objc_alloc_init(MEMORY[0x263EFEF90]);
    loggingController = v2->_loggingController;
    v2->_loggingController = v3;

    customerOverrideCollectionSpecifier = v2->_customerOverrideCollectionSpecifier;
    v2->_customerOverrideCollectionSpecifier = 0;

    os_log_t v6 = os_log_create((const char *)[@"com.apple.AUDeveloperSettings" UTF8String], "developerSettings");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    [(AUDeveloperSettingsController *)v2 registerForNotifications];
  }
  return v2;
}

- (void)registerForNotifications
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "com.apple.bluetoothuser.settingsChanged";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_2283E9000, a2, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed for %s (%u)", (uint8_t *)&v2, 0x12u);
}

void __57__AUDeveloperSettingsController_registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleBTUserSettingsChangedNotification:a2];
}

- (void)handleBTUserSettingsChangedNotification:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    logCollectionSpecifier = self->_logCollectionSpecifier;
    int v6 = 136315394;
    v7 = "-[AUDeveloperSettingsController handleBTUserSettingsChangedNotification:]";
    __int16 v8 = 2112;
    objc_super v9 = logCollectionSpecifier;
    _os_log_impl(&dword_2283E9000, log, OS_LOG_TYPE_DEFAULT, "%s: Reloading %@", (uint8_t *)&v6, 0x16u);
  }
  self->_btQueried = 0;
  [(AUDeveloperSettingsController *)self reloadSpecifier:self->_logCollectionSpecifier];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AUDeveloperSettingsController;
  [(AUDeveloperSettingsController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v4 = [v3 localizedStringForKey:@"AIRPODS_TESTING" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  [(AUDeveloperSettingsController *)self setTitle:v4];

  [(AUDeveloperSettingsController *)self setEditing:0];
}

- (id)specifiers
{
  int v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v39 = (int)*MEMORY[0x263F5FDB8];
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v38 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"INSTALL_PRE_RELEASE_BETA_FIRMWARE_ON" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    [v38 setName:v7];

    [v5 addObject:v38];
    v37 = [(AUDeveloperSettingsController *)self createCustomerSpecifiers];
    v35 = v5;
    [v5 addObjectsFromArray:v37];
    v36 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    __int16 v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v9 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"HOW_TO_INSTALL"];
    uint64_t v10 = [v8 localizedStringForKey:v9 value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    uint64_t v34 = *MEMORY[0x263F600F8];
    objc_msgSend(v36, "setProperty:forKey:", v10);

    [v5 addObject:v36];
    v11 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"LEGAL_CONSENT_BRIEF" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"LEARN_MORE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v17 = [v12 stringWithFormat:@"%@ %@", v14, v16];

    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v11 setProperty:v19 forKey:*MEMORY[0x263F600C0]];

    [v11 setProperty:v17 forKey:v34];
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"LEARN_MORE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v41.location = [v17 rangeOfString:v21];
    v22 = NSStringFromRange(v41);
    [v11 setProperty:v22 forKey:*MEMORY[0x263F600D0]];

    v23 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v11 setProperty:v23 forKey:*MEMORY[0x263F600E0]];

    [v11 setProperty:@"showLegalConsentLearnMoreLink:" forKey:*MEMORY[0x263F600C8]];
    [v35 addObject:v11];
    v24 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"ENABLE_LOG_COLLECTION_FOR_AIRPODS" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    [v24 setName:v26];

    [v35 addObject:v24];
    v27 = (void *)MEMORY[0x263F5FC40];
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"LOG_COLLECTION" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v30 = [v27 preferenceSpecifierNamed:v29 target:self set:sel_handleLogCollectionToggle_specifier_ get:sel_islogCollectionEnabled_ detail:0 cell:6 edit:0];
    logCollectionSpecifier = self->_logCollectionSpecifier;
    self->_logCollectionSpecifier = v30;

    [v35 addObject:self->_logCollectionSpecifier];
    v32 = [MEMORY[0x263EFF8C0] arrayWithArray:v35];
    [(AUDeveloperSettingsController *)self setSpecifiers:v32];

    id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v39);
  }
  return v3;
}

- (id)createCustomerSpecifiers
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  v30 = +[AUDeveloperSettingsDatabase sharedDatabase];
  int v2 = [v30 accessoriesDictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v38 = [v2 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v41;
    uint64_t v31 = *MEMORY[0x263F600A8];
    uint64_t v33 = *MEMORY[0x263F5FEF8];
    uint64_t v32 = *MEMORY[0x263F60078];
    uint64_t v34 = v2;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(v2);
        }
        __int16 v4 = *(void **)(*((void *)&v40 + 1) + 8 * v3);
        id v5 = [v2 objectForKeyedSubscript:v4];
        int v6 = [v5 objectForKeyedSubscript:@"SupportsDeveloperSettings"];
        v7 = v6;
        if (!v6 || [v6 BOOLValue])
        {
          __int16 v8 = [v5 objectForKeyedSubscript:@"name"];
          if ([v8 isEqualToString:&stru_26DCD2B00])
          {
            id v9 = v4;

            __int16 v8 = v9;
          }
          uint64_t v10 = [v5 objectForKeyedSubscript:@"fusing"];
          uint64_t v11 = AUDeveloperSettingsAccessoryFusingStringToType(v10);
          uint64_t v39 = v10;
          if (v11 == 2)
          {
            v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v13 = v12;
            v14 = @"UNFUSED_NOT_ELIGIBLE";
LABEL_14:
            v15 = [v12 localizedStringForKey:v14 value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
            uint64_t v16 = [v8 stringByAppendingString:v15];
          }
          else
          {
            if (!v11)
            {
              v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v13 = v12;
              v14 = @"DEV_FUSED_NOT_ELIGIBLE";
              goto LABEL_14;
            }
            v13 = [v5 objectForKeyedSubscript:@"assetLocation"];
            unint64_t v18 = AUDeveloperSettingsURLStringToType(v13);
            if (v18 <= 6 && ((1 << v18) & 0x4C) != 0)
            {
              int v17 = 1;
LABEL_21:

              v20 = [MEMORY[0x263F1C408] sharedApplication];
              v21 = [NSURL URLWithString:@"appleconnect://settings"];
              int v22 = [v20 canOpenURL:v21];

              if (v17 && v22)
              {
                v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:sel_getOverrideLocation_ detail:objc_opt_class() cell:1 edit:0];
              }
              else
              {
                v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:sel_setSeedParticipation_specifier_ get:sel_isSeedParticipationEnabled_ detail:0 cell:6 edit:0];
                v23 = v24;
                if ((v17 & 1) == 0) {
                  [v24 setProperty:MEMORY[0x263EFFA80] forKey:v31];
                }
              }
              [v23 setProperty:MEMORY[0x263EFFA88] forKey:v33];
              [v23 setIdentifier:v4];
              v25 = NSStringFromSelector(sel_removedSpecifier_);
              [v23 setProperty:v25 forKey:v32];

              [v36 addObject:v23];
              int v2 = v34;
              goto LABEL_27;
            }
            v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v26 = [v15 localizedStringForKey:@"LOCATION_NOT_ELIGIBLE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
            uint64_t v16 = [v8 stringByAppendingString:v26];

            __int16 v8 = (void *)v26;
          }

          int v17 = 0;
          __int16 v8 = (void *)v16;
          goto LABEL_21;
        }
LABEL_27:

        ++v3;
      }
      while (v38 != v3);
      uint64_t v27 = [v2 countByEnumeratingWithState:&v40 objects:v44 count:16];
      uint64_t v38 = v27;
    }
    while (v27);
  }
  v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];

  return v28;
}

- (void)showLegalConsentLearnMoreLink:(id)a3
{
  id v4 = (id)objc_opt_new();
  [(AUDeveloperSettingsController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)setSeedParticipation:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  if ([a3 BOOLValue])
  {
    if ([(AUDeveloperSettingsController *)self needLegalConsent])
    {
      [(AUDeveloperSettingsController *)self showLegalConsent:v8];
    }
    else
    {
      int v6 = +[AUDeveloperSettingsDatabase sharedDatabase];
      v7 = [v8 identifier];
      [v6 updateAccessory:v7 locationType:3];

      [(AUDeveloperSettingsController *)self reloadSpecifier:self->_customerOverrideCollectionSpecifier];
    }
  }
  else
  {
    [(AUDeveloperSettingsController *)self showParticipateInSeedOffAlert:v8];
  }
}

- (id)isSeedParticipationEnabled:(id)a3
{
  id v3 = a3;
  id v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 isSeedParticipationEnabled:v5];
  v7 = NSNumber;
  return (id)[v7 numberWithBool:v6];
}

- (BOOL)needLegalConsent
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(v2, "accessoriesDictionary", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([v2 isSeedParticipationEnabled:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)_agreeToLegalConsent
{
  id v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v4 = [(PSSpecifier *)self->_currentAccessorySpecifier identifier];
  [v3 updateAccessory:v4 locationType:3];

  [(AUDeveloperSettingsController *)self reloadSpecifier:self->_customerOverrideCollectionSpecifier];
  [(AUDeveloperSettingsController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_notNowToLegalConsent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__AUDeveloperSettingsController__notNowToLegalConsent__block_invoke;
  v2[3] = &unk_264838EC0;
  v2[4] = self;
  [(AUDeveloperSettingsController *)self dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __54__AUDeveloperSettingsController__notNowToLegalConsent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)showLegalConsent:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, a3);
  if (!self->_legalConsentController)
  {
    id v6 = objc_alloc((Class)getOBTextWelcomeControllerClass());
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"LEGAL_CONSENT_TITLE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    id v9 = (OBTextWelcomeController *)[v6 initWithTitle:v8 detailText:0 symbolName:0];
    legalConsentController = self->_legalConsentController;
    self->_legalConsentController = v9;

    long long v11 = self->_legalConsentController;
    long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v13 = [v12 localizedStringForKey:@"LEGAL_CONSENT_TEXT" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    [(OBTextWelcomeController *)v11 addSectionWithHeader:0 content:v13];

    id v14 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"AGREE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    int v17 = (void *)[v14 initWithTitle:v16 style:2 target:self action:sel__agreeToLegalConsent];

    id v18 = objc_alloc(MEMORY[0x263F1C468]);
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"NOT_NOW" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
    v21 = (void *)[v18 initWithTitle:v20 style:2 target:self action:sel__notNowToLegalConsent];

    int v22 = [(OBTextWelcomeController *)self->_legalConsentController navigationItem];
    [v22 setRightBarButtonItem:v17];

    v23 = [(OBTextWelcomeController *)self->_legalConsentController navigationItem];
    [v23 setLeftBarButtonItem:v21];
  }
  v24 = objc_opt_new();
  v26[0] = self->_legalConsentController;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [v24 setViewControllers:v25];

  [v24 setModalPresentationStyle:2];
  [(AUDeveloperSettingsController *)self presentViewController:v24 animated:1 completion:0];
}

- (void)showParticipateInSeedOffAlert:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v27 = [v4 accessoriesDictionary];

  id v5 = [v3 identifier];
  uint64_t v26 = [v27 objectForKeyedSubscript:v5];

  v24 = [v26 objectForKeyedSubscript:@"name"];
  id v6 = NSString;
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 localizedStringForKey:@"TURN_OFF_AIRPODS_TESTING_TEXT" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  v23 = objc_msgSend(v6, "stringWithFormat:", v8, v24);

  id v9 = (void *)MEMORY[0x263F1C3F8];
  long long v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v11 = [v10 localizedStringForKey:@"TURN_OFF_AIRPODS_TESTING_TITLE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  long long v12 = [v9 alertControllerWithTitle:v11 message:v23 preferredStyle:1];

  long long v13 = (void *)MEMORY[0x263F1C3F0];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"TURN_OFF" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke;
  v30[3] = &unk_264839B18;
  id v16 = v3;
  id v31 = v16;
  int v17 = [v13 actionWithTitle:v15 style:1 handler:v30];
  [v12 addAction:v17];

  id v18 = (void *)MEMORY[0x263F1C3F0];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"NOT_NOW" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke_2;
  v28[3] = &unk_264839B40;
  v28[4] = self;
  id v29 = v16;
  id v21 = v16;
  int v22 = [v18 actionWithTitle:v20 style:0 handler:v28];
  [v12 addAction:v22];

  [(AUDeveloperSettingsController *)self presentViewController:v12 animated:1 completion:0];
}

void __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke(uint64_t a1)
{
  id v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  int v2 = [*(id *)(a1 + 32) identifier];
  [v3 updateAccessory:v2 locationType:2];
}

uint64_t __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)_agreePrivacyConsent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__AUDeveloperSettingsController__agreePrivacyConsent__block_invoke;
  v2[3] = &unk_264838EC0;
  v2[4] = self;
  [(AUDeveloperSettingsController *)self dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __53__AUDeveloperSettingsController__agreePrivacyConsent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setlogCollection:MEMORY[0x263EFFA88] specifier:*(void *)(*(void *)(a1 + 32) + 1432)];
}

- (void)_notNowToPrivacyConsent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__AUDeveloperSettingsController__notNowToPrivacyConsent__block_invoke;
  v2[3] = &unk_264838EC0;
  v2[4] = self;
  [(AUDeveloperSettingsController *)self dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __56__AUDeveloperSettingsController__notNowToPrivacyConsent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)setlogCollection:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  loggingController = self->_loggingController;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke;
  v11[3] = &unk_264839B90;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [(CBUserController *)loggingController setAppleAudioAccessoryLimitedLogging:v8 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke_2;
  block[3] = &unk_264839B68;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[AUDeveloperSettingsController setlogCollection:specifier:]_block_invoke_2";
    __int16 v6 = 2112;
    uint64_t v7 = v2;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: inError=%@", (uint8_t *)&v4, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 40)];
  }
}

- (void)handleLogCollectionToggle:(id)a3 specifier:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 BOOLValue];
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, a4);
  if (v8)
  {
    if (!self->_privacyConsentController)
    {
      id v9 = objc_alloc((Class)getOBTextWelcomeControllerClass());
      id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v11 = [v10 localizedStringForKey:@"PRIVACY_CONSENT_TITLE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
      id v12 = (OBTextWelcomeController *)[v9 initWithTitle:v11 detailText:0 symbolName:0];
      privacyConsentController = self->_privacyConsentController;
      self->_privacyConsentController = v12;

      id v14 = self->_privacyConsentController;
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"PRIVACY_CONSENT_TEXT" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
      [(OBTextWelcomeController *)v14 addSectionWithHeader:0 content:v16];

      id v17 = objc_alloc(MEMORY[0x263F1C468]);
      id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"AGREE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
      v20 = (void *)[v17 initWithTitle:v19 style:2 target:self action:sel__agreePrivacyConsent];

      id v21 = objc_alloc(MEMORY[0x263F1C468]);
      int v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"NOT_NOW" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
      v24 = (void *)[v21 initWithTitle:v23 style:2 target:self action:sel__notNowToPrivacyConsent];

      v25 = [(OBTextWelcomeController *)self->_privacyConsentController navigationItem];
      [v25 setRightBarButtonItem:v20];

      uint64_t v26 = [(OBTextWelcomeController *)self->_privacyConsentController navigationItem];
      [v26 setLeftBarButtonItem:v24];
    }
    uint64_t v27 = objc_opt_new();
    v29[0] = self->_privacyConsentController;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    [v27 setViewControllers:v28];

    [v27 setModalPresentationStyle:2];
    [(AUDeveloperSettingsController *)self presentViewController:v27 animated:1 completion:0];
  }
  else
  {
    [(AUDeveloperSettingsController *)self setlogCollection:v6 specifier:v7];
  }
}

- (id)islogCollectionEnabled:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_btQueried)
  {
    id v6 = [NSNumber numberWithBool:self->_isLoggingEnabled];
  }
  else
  {
    loggingController = self->_loggingController;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    long long v11 = __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke;
    id v12 = &unk_264839BE0;
    id v13 = self;
    id v14 = v4;
    [(CBUserController *)loggingController appleAudioAccessoryLimitedLoggingWithCompletion:&v9];
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", self->_isLoggingEnabled, v9, v10, v11, v12, v13);
  }
  return v6;
}

void __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke_2;
  v8[3] = &unk_264839BB8;
  char v11 = a2;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 1384);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315650;
    id v7 = "-[AUDeveloperSettingsController islogCollectionEnabled:]_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_2283E9000, v2, OS_LOG_TYPE_DEFAULT, "%s: inEnabled=%d, error=%@", (uint8_t *)&v6, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1441) = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(*(void *)(a1 + 32) + 1440) = 1;
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 48)];
}

- (id)getOverrideLocation:(id)a3
{
  int v3 = [a3 identifier];
  uint64_t v4 = getInfoForAccessory(v3);

  id v5 = [v4 objectForKeyedSubscript:@"assetLocation"];
  int v6 = v5;
  if (v5 && AUDeveloperSettingsURLStringToType(v5) == 6)
  {
    id v7 = @"Customer Staging";

    int v6 = v7;
  }

  return v6;
}

- (void)removedSpecifier:(id)a3
{
  id v3 = a3;
  id v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v4 = [v3 identifier];

  [v5 removeAccessoryWithSerialNumber:v4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(AUDeveloperSettingsController *)self indexForIndexPath:a4];
  int v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  int64_t v7 = [v6 isEqualToSpecifier:self->_logCollectionSpecifier] ^ 1;

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4 = self;
  uint64_t v5 = [(AUDeveloperSettingsController *)self indexForIndexPath:a4];
  int v6 = [*(id *)((char *)&v4->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  LOBYTE(v4) = [v6 isEqualToSpecifier:v4->_logCollectionSpecifier] ^ 1;

  return (char)v4;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = -[AUDeveloperSettingsController indexForIndexPath:](self, "indexForIndexPath:", a5, a4);
  id v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v6];
  if (([v7 isEqualToSpecifier:self->_logCollectionSpecifier] & 1) == 0)
  {
    [(AUDeveloperSettingsController *)self removedSpecifier:v7];
    [(AUDeveloperSettingsController *)self removeSpecifier:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, 0);
  objc_storeStrong((id *)&self->_privacyConsentController, 0);
  objc_storeStrong((id *)&self->_legalConsentController, 0);
  objc_storeStrong((id *)&self->_loggingController, 0);
  objc_storeStrong((id *)&self->_customerOverrideCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->_logCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end