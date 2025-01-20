@interface AssistantVoiceController
+ (BOOL)asset:(id)a3 matchesVoice:(id)a4;
+ (id)bundle;
- (AFVoiceInfo)currentVoice;
- (AFVoiceInfo)inProgressVoice;
- (AssistantVoiceController)init;
- (AssistantVoiceMetrics)metrics;
- (AssistantVoiceViewModel)currentViewModel;
- (BOOL)ignoreNextVoiceChangeNotification;
- (BOOL)isCellularDataPermissionAllowedForVoice:(id)a3;
- (BOOL)isVoiceInstalled:(id)a3;
- (NSArray)cellularUpdatesSpecifiers;
- (NSArray)languageSpecifiers;
- (NSArray)voiceVariationSpecifiers;
- (NSDate)startDate;
- (PSSpecifier)languageGroupSpecifier;
- (PSSpecifier)languageProto;
- (PSSpecifier)voiceVariationGroupSpecifier;
- (PSSpecifier)voiceVariationProto;
- (SUICAssistantVoiceSettingsConnection)settingsConnection;
- (SiriTTSDaemonSession)session;
- (SiriTTSPreviewRequest)lastPreviewRequest;
- (TTSAsset)downloadingAsset;
- (id)_languageSpecifiersForLanguage:(id)a3;
- (id)_voiceVariationSpecifiersForLanguage:(id)a3;
- (id)deriveVoicesWithTargetVoice:(id)a3 currentVoice:(id)a4;
- (id)dialectsForLanguageIdentifiers:(id)a3;
- (id)inProgressOutputVoice;
- (id)outputVoice;
- (id)specifiers;
- (id)uniqueLocaleForLanguageWithDialect:(id)a3;
- (id)viewModelWithInProgressVoice:(id)a3 currentVoice:(id)a4;
- (id)voiceSettingsForLanguageCode:(id)a3 name:(id)a4 gender:(int64_t)a5;
- (void)_signalDidSelectVoice;
- (void)applyViewModel:(id)a3;
- (void)downloadVoice:(id)a3;
- (void)grantCellularDataPermissionForVoice:(id)a3;
- (void)languageCodeDidChange:(id)a3;
- (void)outputVoiceDidChange:(id)a3;
- (void)playVoicePreview:(id)a3;
- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(id)a3 inProgressVoice:(id)a4;
- (void)presentVoiceDownloadDisabledNoInternetAlert;
- (void)presentVoiceDownloadDisabledNoWifiAlert;
- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5;
- (void)resetMetrics;
- (void)selectVoice:(id)a3 inProgressVoice:(id)a4;
- (void)setAssistantInProgressVoice:(id)a3;
- (void)setAssistantOutputVoice:(id)a3;
- (void)setCellularUpdatesSpecifiers:(id)a3;
- (void)setCurrentViewModel:(id)a3;
- (void)setCurrentVoice:(id)a3;
- (void)setDownloadingAsset:(id)a3;
- (void)setIgnoreNextVoiceChangeNotification:(BOOL)a3;
- (void)setInProgressVoice:(id)a3;
- (void)setInProgressVoicePreference:(id)a3;
- (void)setLanguageGroupSpecifier:(id)a3;
- (void)setLanguageProto:(id)a3;
- (void)setLanguageSpecifiers:(id)a3;
- (void)setLastPreviewRequest:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOutputVoicePreference:(id)a3;
- (void)setParentController:(id)a3;
- (void)setSession:(id)a3;
- (void)setSettingsConnection:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setVoiceVariationGroupSpecifier:(id)a3;
- (void)setVoiceVariationProto:(id)a3;
- (void)setVoiceVariationSpecifiers:(id)a3;
- (void)stopAllDownload;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDownloadProgress:(float)a3;
- (void)updateFooterText:(id)a3 forSpecifier:(id)a4;
- (void)updateVoiceVariationGroupUI:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantVoiceController

+ (id)bundle
{
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)bundle_sAssistantVoiceBundle;

  return v2;
}

uint64_t __34__AssistantVoiceController_bundle__block_invoke()
{
  bundle_sAssistantVoiceBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

- (AssistantVoiceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantVoiceController;
  v2 = [(AssistantVoiceController *)&v6 init];
  v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x263F74E28]);
  session = v2->_session;
  v2->_session = v3;

  [(AssistantVoiceController *)v2 resetMetrics];
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantVoiceController;
  [(AssistantVoiceController *)&v3 viewWillAppear:a3];
}

- (void)resetMetrics
{
  if (self->_metrics)
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F833C8];
    [v3 removeObserver:self->_metrics name:*MEMORY[0x263F833C8] object:0];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F833C8];
  }
  v5 = (AssistantVoiceMetrics *)objc_opt_new();
  metrics = self->_metrics;
  self->_metrics = v5;

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self->_metrics selector:sel_sendAnalyticsEvent name:v4 object:0];
}

- (void)setParentController:(id)a3
{
  id v4 = a3;
  v5 = [(AssistantVoiceController *)self parentController];

  v8.receiver = self;
  v8.super_class = (Class)AssistantVoiceController;
  [(AssistantVoiceController *)&v8 setParentController:v4];
  if (v4 && !v5)
  {
    objc_super v6 = [v4 settingsConnection];
    settingsConnection = self->_settingsConnection;
    self->_settingsConnection = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v29[2] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF910] date];
  startDate = self->_startDate;
  self->_startDate = v5;

  v28.receiver = self;
  v28.super_class = (Class)AssistantVoiceController;
  [(AssistantVoiceController *)&v28 viewDidAppear:v3];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_languageCodeDidChange_ name:*MEMORY[0x263F282E8] object:0];

  objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_outputVoiceDidChange_ name:*MEMORY[0x263F28310] object:0];

  v27 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/VOICE_ID"];
  id v9 = objc_alloc(MEMORY[0x263F08DB0]);
  v10 = [MEMORY[0x263EFF960] currentLocale];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  v13 = (void *)[v9 initWithKey:@"Siri Voice" table:0 locale:v10 bundleURL:v12];

  v14 = +[GMEligibilityProvider shared];
  LODWORD(v11) = [v14 deviceSupported];

  if (v11) {
    v15 = @"Apple Intelligence & Siri";
  }
  else {
    v15 = @"Siri";
  }
  id v16 = objc_alloc(MEMORY[0x263F08DB0]);
  v17 = [MEMORY[0x263EFF960] currentLocale];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 bundleURL];
  v20 = (void *)[v16 initWithKey:v15 table:0 locale:v17 bundleURL:v19];

  id v21 = objc_alloc(MEMORY[0x263F08DB0]);
  v22 = [MEMORY[0x263EFF960] currentLocale];
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v23 bundleURL];
  v25 = (void *)[v21 initWithKey:@"Siri Voice" table:0 locale:v22 bundleURL:v24];

  v29[0] = v20;
  v29[1] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [(AssistantVoiceController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v13 localizedNavigationComponents:v26 deepLink:v27];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_lastPreviewRequest;
  if (v5) {
    [(SiriTTSDaemonSession *)self->_session cancelWithRequest:v5];
  }
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  id v7 = (void *)v6;
  startDate = self->_startDate;
  if (!startDate) {
    startDate = (NSDate *)v6;
  }
  id v9 = startDate;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v10 = (void *)getCKKnowledgeStoreClass_softClass_0;
  uint64_t v31 = getCKKnowledgeStoreClass_softClass_0;
  if (!getCKKnowledgeStoreClass_softClass_0)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getCKKnowledgeStoreClass_block_invoke_0;
    v26 = &unk_26457D098;
    v27 = &v28;
    __getCKKnowledgeStoreClass_block_invoke_0((uint64_t)&v23);
    v10 = (void *)v29[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v28, 8);
  v12 = [v11 defaultSynchedKnowledgeStore];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v13 = (void *)getCKPermanentEventStoreClass_softClass_0;
  uint64_t v31 = getCKPermanentEventStoreClass_softClass_0;
  if (!getCKPermanentEventStoreClass_softClass_0)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getCKPermanentEventStoreClass_block_invoke_0;
    v26 = &unk_26457D098;
    v27 = &v28;
    __getCKPermanentEventStoreClass_block_invoke_0((uint64_t)&v23);
    v13 = (void *)v29[3];
  }
  v14 = v13;
  _Block_object_dispose(&v28, 8);
  v15 = (void *)[[v14 alloc] initWithKnowledgeStore:v12];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  id v16 = (void *)getCKEventClass_softClass_0;
  uint64_t v31 = getCKEventClass_softClass_0;
  if (!getCKEventClass_softClass_0)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getCKEventClass_block_invoke_0;
    v26 = &unk_26457D098;
    v27 = &v28;
    __getCKEventClass_block_invoke_0((uint64_t)&v23);
    id v16 = (void *)v29[3];
  }
  v17 = v16;
  _Block_object_dispose(&v28, 8);
  v18 = (void *)[[v17 alloc] initWithIdentifier:@"SiriVoiceSettingsShown" startDate:v9 endDate:v7 metadata:0];
  [v15 recordEvent:v18 completionHandler:&__block_literal_global_181];
  v19 = [(AssistantVoiceController *)self metrics];
  [v19 sendAnalyticsEvent];

  v22.receiver = self;
  v22.super_class = (Class)AssistantVoiceController;
  [(AssistantVoiceController *)&v22 viewDidDisappear:v3];
  v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 removeObserver:self name:*MEMORY[0x263F282E8] object:0];

  id v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 removeObserver:self name:*MEMORY[0x263F28310] object:0];
}

void __45__AssistantVoiceController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_UnableToRecord_0.isa, a2);
  }
}

- (void)languageCodeDidChange:(id)a3
{
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
    -[AssistantVoiceController languageCodeDidChange:](v5);
  }
  [(AssistantVoiceController *)self reloadSpecifiers];
  if ([(NSArray *)self->_voiceVariationSpecifiers count] <= 1
    && [(NSArray *)self->_languageSpecifiers count] <= 1)
  {
    uint64_t v6 = [(AssistantVoiceController *)self navigationController];
    id v7 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (void)outputVoiceDidChange:(id)a3
{
  id v4 = a3;
  if (!self->_ignoreNextVoiceChangeNotification)
  {
    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      -[AssistantVoiceController outputVoiceDidChange:](v5);
    }
    [(AssistantVoiceController *)self reloadSpecifiers];
  }
  self->_ignoreNextVoiceChangeNotification = 0;
}

- (id)outputVoice
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  BOOL v3 = [v2 outputVoice];

  id v4 = [v3 name];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F28530] sharedInstance];
    id v7 = [v3 languageCode];
    objc_super v8 = objc_msgSend(v6, "voiceNamesForOutputLanguageCode:gender:", v7, objc_msgSend(v3, "gender"));
    id v9 = [v8 firstObject];

    id v10 = objc_alloc(MEMORY[0x263F286E0]);
    id v11 = [v3 languageCode];
    uint64_t v12 = [v3 gender];
    uint64_t v13 = [v3 isCustom];
    uint64_t v14 = [v3 footprint];
    v15 = [v3 contentVersion];
    id v16 = [v3 masteredVersion];
    uint64_t v17 = [v10 initWithLanguageCode:v11 gender:v12 isCustom:v13 name:v9 footprint:v14 contentVersion:v15 masteredVersion:v16];

    BOOL v3 = (void *)v17;
  }

  return v3;
}

- (id)inProgressOutputVoice
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  BOOL v3 = [v2 inProgressOutputVoice];

  id v4 = [v3 name];
  if ([v4 length])
  {
    uint64_t v5 = [v3 languageCode];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (id)specifiers
{
  BOOL v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    location = v3;
    if (self->_languageSpecifiers) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = self->_voiceVariationGroupSpecifier != 0;
    }
    BOOL v46 = v5;
    uint64_t v6 = [(AssistantVoiceController *)self loadSpecifiersFromPlistName:@"AssistantVoice" target:self];
    id v7 = [v6 specifierForID:@"VOICE_LANGUAGE_GROUP"];
    languageGroupSpecifier = self->_languageGroupSpecifier;
    self->_languageGroupSpecifier = v7;

    id v9 = +[AssistantVoiceController bundle];
    id v10 = SFLocalizableWAPIStringKeyForKey();
    id v11 = [v9 localizedStringForKey:v10 value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(PSSpecifier *)self->_languageGroupSpecifier setName:v11];

    uint64_t v12 = [v6 specifierForID:@"VOICE_PROTO"];
    languageProto = self->_languageProto;
    self->_languageProto = v12;

    [v6 removeObject:self->_languageProto];
    uint64_t v14 = [v6 specifierForID:@"VOICE_VARIATION_PROTO"];
    voiceVariationProto = self->_voiceVariationProto;
    self->_voiceVariationProto = v14;

    [v6 removeObject:self->_voiceVariationProto];
    if (+[AssistantUtilities deviceIsVision])
    {
      id v16 = [v6 specifierForID:@"VOICE_FOOTER_GROUP"];
      [v6 removeObject:v16];
    }
    uint64_t v17 = [(AssistantVoiceController *)self inProgressOutputVoice];
    v18 = [(AssistantVoiceController *)self outputVoice];
    v19 = [(AssistantVoiceController *)self deriveVoicesWithTargetVoice:v17 currentVoice:v18];

    v20 = [v19 inProgressVoice];
    id v21 = [v19 currentVoice];
    objc_storeStrong((id *)&self->_currentVoice, v21);
    objc_super v22 = [(AssistantVoiceController *)self viewModelWithInProgressVoice:v20 currentVoice:v21];
    uint64_t v23 = [v22 languageOptions];
    unint64_t v24 = [v23 count];

    languageSpecifiers = self->_languageSpecifiers;
    if (v24 < 2)
    {
      self->_languageSpecifiers = 0;

      [v6 removeObject:self->_languageGroupSpecifier];
      v29 = self->_languageGroupSpecifier;
      self->_languageGroupSpecifier = 0;
    }
    else
    {
      if (!languageSpecifiers)
      {
        v26 = [v22 selectedLanguage];
        v27 = [(AssistantVoiceController *)self _languageSpecifiersForLanguage:v26];
        uint64_t v28 = self->_languageSpecifiers;
        self->_languageSpecifiers = v27;

        languageSpecifiers = self->_languageSpecifiers;
      }
      objc_msgSend(v6, "ps_insertObjectsFromArray:afterObject:", languageSpecifiers, self->_languageGroupSpecifier);
    }
    uint64_t v30 = [v6 specifierForID:@"VOICE_VARIATION_GROUP"];
    voiceVariationGroupSpecifier = self->_voiceVariationGroupSpecifier;
    self->_voiceVariationGroupSpecifier = v30;

    [(PSSpecifier *)self->_voiceVariationGroupSpecifier setProperty:@"\n" forKey:*MEMORY[0x263F600F8]];
    v32 = +[AssistantVoiceController bundle];
    v33 = SFLocalizableWAPIStringKeyForKey();
    v34 = [v32 localizedStringForKey:v33 value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(PSSpecifier *)self->_voiceVariationGroupSpecifier setName:v34];

    v35 = [v22 selectedLanguage];
    v36 = [(AssistantVoiceController *)self _voiceVariationSpecifiersForLanguage:v35];
    voiceVariationSpecifiers = self->_voiceVariationSpecifiers;
    self->_voiceVariationSpecifiers = v36;

    objc_msgSend(v6, "ps_insertObjectsFromArray:afterObject:", self->_voiceVariationSpecifiers, self->_voiceVariationGroupSpecifier);
    objc_storeStrong(location, v6);
    v38 = [(AssistantVoiceController *)self inProgressOutputVoice];
    objc_initWeak(from, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__AssistantVoiceController_specifiers__block_invoke;
    aBlock[3] = &unk_26457D2C8;
    objc_copyWeak(&v55, from);
    id v39 = v22;
    id v51 = v39;
    id v40 = v20;
    id v52 = v40;
    id v41 = v19;
    id v53 = v41;
    id v42 = v38;
    id v54 = v42;
    v43 = (void (**)(void))_Block_copy(aBlock);
    v44 = v43;
    if (v46)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__AssistantVoiceController_specifiers__block_invoke_2;
      block[3] = &unk_26457D2F0;
      v49 = v43;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v43[2](v43);
    }

    objc_destroyWeak(&v55);
    objc_destroyWeak(from);

    id v4 = *location;
  }

  return v4;
}

void __38__AssistantVoiceController_specifiers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained applyViewModel:*(void *)(a1 + 32)];
    BOOL v3 = [*(id *)(a1 + 40) name];
    if (v3 && ([v5 isCellularDataPermissionAllowedForVoice:*(void *)(a1 + 40)] & 1) == 0)
    {
      BOOL v4 = +[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection];

      if (v4)
      {
        [v5 presentVoiceDownloadConfirmationNoWifiAlertForVoice:*(void *)(a1 + 48) inProgressVoice:*(void *)(a1 + 40)];
LABEL_9:
        id WeakRetained = v5;
        goto LABEL_10;
      }
    }
    else
    {
    }
    id WeakRetained = v5;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_10;
    }
    objc_msgSend(v5, "setAssistantInProgressVoice:");
    [v5 downloadVoice:*(void *)(a1 + 56)];
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __38__AssistantVoiceController_specifiers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deriveVoicesWithTargetVoice:(id)a3 currentVoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if ([(AssistantVoiceController *)self isVoiceInstalled:v7]) {
      id v8 = 0;
    }
    else {
      id v8 = v7;
    }
    goto LABEL_10;
  }
  if (![(AssistantVoiceController *)self isVoiceInstalled:v6])
  {
    if (![(AssistantVoiceController *)self isVoiceInstalled:v7]) {
      goto LABEL_11;
    }
    id v9 = [MEMORY[0x263F28530] sharedInstance];
    id v10 = [v6 languageCode];
    id v11 = [v9 getBaseLocale:v10];
    uint64_t v12 = [MEMORY[0x263F28530] sharedInstance];
    uint64_t v13 = [v7 languageCode];
    uint64_t v14 = [v12 getBaseLocale:v13];
    int v15 = [v11 isEqualToString:v14];

    if (!v15)
    {
LABEL_11:
      id v8 = v6;
      goto LABEL_12;
    }
    id v8 = v6;
LABEL_10:
    id v16 = v7;
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_12:
  id v16 = v6;
LABEL_13:
  uint64_t v17 = +[AssistantVoiceControllerVoiceSettings settingsWithInProgressVoice:v8 currentVoice:v16];

  return v17;
}

- (id)viewModelWithInProgressVoice:(id)a3 currentVoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AssistantVoiceViewModel);
  id v9 = [MEMORY[0x263F285A0] sharedPreferences];
  id v10 = [MEMORY[0x263F285A0] sharedPreferences];
  id v11 = [v10 languageCode];
  char v12 = [v9 multilingualResponseEnabledForLanguage:v11];

  [(AssistantVoiceViewModel *)v8 setInProgressVoice:v6];
  [(AssistantVoiceViewModel *)v8 setCurrentVoice:v7];
  if (!v6)
  {
    uint64_t v14 = [v7 languageCode];
    [(AssistantVoiceViewModel *)v8 setSelectedLanguage:v14];

    int v15 = (void *)MEMORY[0x263EFFA08];
    if (v12)
    {
      id v16 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
      uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, 0);
      [(AssistantVoiceViewModel *)v8 setLanguageOptions:v17];
    }
    else
    {
      id v16 = [MEMORY[0x263F28530] sharedInstance];
      uint64_t v17 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
      v29 = [v16 allOutputVoiceIdentifiersForSiriLanguage:v17];
      uint64_t v30 = [v15 setWithArray:v29];
      [(AssistantVoiceViewModel *)v8 setLanguageOptions:v30];
    }
    settingsConnection = self->_settingsConnection;
    v32 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
    [(AssistantVoiceViewModel *)v8 setShouldShowVoiceVariationGroup:[(SUICAssistantVoiceSettingsConnection *)settingsConnection languageHasVoiceVariations:v32]];

    [(AssistantVoiceViewModel *)v8 setVoiceVariationToSpin:0];
    v33 = v7;
    goto LABEL_29;
  }
  if ([(AssistantVoiceController *)self isCellularDataPermissionAllowedForVoice:v6])
  {
    int v13 = 1;
  }
  else
  {
    int v13 = !+[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection];
  }
  v18 = [v6 languageCode];
  [(AssistantVoiceViewModel *)v8 setSelectedLanguage:v18];

  v19 = (void *)MEMORY[0x263EFFA08];
  if (v12)
  {
    v20 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
    id v21 = objc_msgSend(v19, "setWithObjects:", v20, 0);
    [(AssistantVoiceViewModel *)v8 setLanguageOptions:v21];
  }
  else
  {
    v20 = [MEMORY[0x263F28530] sharedInstance];
    id v21 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
    objc_super v22 = [v20 allOutputVoiceIdentifiersForSiriLanguage:v21];
    uint64_t v23 = [v19 setWithArray:v22];
    [(AssistantVoiceViewModel *)v8 setLanguageOptions:v23];
  }
  if (v13)
  {
    unint64_t v24 = [(AssistantVoiceViewModel *)v8 languageOptions];
    if ((unint64_t)[v24 count] <= 1)
    {
      [(AssistantVoiceViewModel *)v8 setSpinningOnLanguage:0];
    }
    else
    {
      v25 = [v6 languageCode];
      v26 = [v7 languageCode];
      if ([v25 isEqualToString:v26])
      {
        uint64_t v27 = [v6 gender];
        BOOL v28 = v27 == [v7 gender];
      }
      else
      {
        BOOL v28 = 1;
      }
      [(AssistantVoiceViewModel *)v8 setSpinningOnLanguage:v28];
    }
  }
  else
  {
    [(AssistantVoiceViewModel *)v8 setSpinningOnLanguage:0];
  }
  v34 = self->_settingsConnection;
  v35 = [(AssistantVoiceViewModel *)v8 selectedLanguage];
  [(AssistantVoiceViewModel *)v8 setShouldShowVoiceVariationGroup:[(SUICAssistantVoiceSettingsConnection *)v34 languageHasVoiceVariations:v35]];

  if ([(AssistantVoiceViewModel *)v8 shouldShowVoiceVariationGroup])
  {
    [(AssistantVoiceViewModel *)v8 setLanguageGroupFooterText:0];
    v36 = +[AssistantVoiceController bundle];
    v37 = SFLocalizableWAPIStringKeyForKey();
    v38 = [v36 localizedStringForKey:v37 value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(AssistantVoiceViewModel *)v8 setVoiceVariationGroupFooterText:v38];
  }
  else
  {
    [(AssistantVoiceViewModel *)v8 setVoiceVariationGroupFooterText:0];
    v36 = +[AssistantVoiceController bundle];
    v37 = SFLocalizableWAPIStringKeyForKey();
    v38 = [v36 localizedStringForKey:v37 value:&stru_26D2AB140 table:@"AssistantSettings"];
    [(AssistantVoiceViewModel *)v8 setLanguageGroupFooterText:v38];
  }

  if (!v13)
  {
    [(AssistantVoiceViewModel *)v8 setVoiceVariationToSpin:0];
    v33 = v6;
LABEL_29:
    id v40 = [v33 name];
    v43 = v8;
    v44 = v40;
    goto LABEL_30;
  }
  id v39 = [v6 name];
  [(AssistantVoiceViewModel *)v8 setVoiceVariationToSpin:v39];

  id v40 = [v7 name];
  if (v40)
  {
    id v41 = [v6 name];
    id v42 = [v7 name];
    if ([v41 isEqualToString:v42])
    {
      [(AssistantVoiceViewModel *)v8 setVoiceVariationToCheckMark:0];
    }
    else
    {
      BOOL v46 = [v7 name];
      [(AssistantVoiceViewModel *)v8 setVoiceVariationToCheckMark:v46];
    }
    goto LABEL_31;
  }
  v43 = v8;
  v44 = 0;
LABEL_30:
  [(AssistantVoiceViewModel *)v43 setVoiceVariationToCheckMark:v44];
LABEL_31:

  return v8;
}

- (void)applyViewModel:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v4 = (AssistantVoiceViewModel *)a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(AssistantVoiceController *)self specifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = MEMORY[0x263EFFA80];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) setProperty:v9 forKey:@"IS_VOICE_DOWNLOADING"];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  languageSpecifiers = self->_languageSpecifiers;
  char v12 = [(AssistantVoiceViewModel *)v4 selectedLanguage];
  int v13 = [(NSArray *)languageSpecifiers specifierForID:v12];

  if ([(AssistantVoiceViewModel *)v4 spinningOnLanguage])
  {
    [v13 setProperty:MEMORY[0x263EFFA88] forKey:@"IS_VOICE_DOWNLOADING"];
    [(PSSpecifier *)self->_languageGroupSpecifier removePropertyForKey:*MEMORY[0x263F60200]];
  }
  else
  {
    [(PSSpecifier *)self->_languageGroupSpecifier setProperty:v13 forKey:*MEMORY[0x263F60200]];
  }
  uint64_t v14 = [(AssistantVoiceViewModel *)v4 languageGroupFooterText];

  languageGroupSpecifier = self->_languageGroupSpecifier;
  if (v14)
  {
    id v16 = [(AssistantVoiceViewModel *)v4 languageGroupFooterText];
    [(PSSpecifier *)languageGroupSpecifier setProperty:v16 forKey:*MEMORY[0x263F600F8]];
  }
  else
  {
    [(PSSpecifier *)languageGroupSpecifier removePropertyForKey:*MEMORY[0x263F600F8]];
  }
  if (self->_languageGroupSpecifier) {
    -[AssistantVoiceController reloadSpecifier:](self, "reloadSpecifier:");
  }
  [(AssistantVoiceController *)self updateVoiceVariationGroupUI:v4];
  currentViewModel = self->_currentViewModel;
  self->_currentViewModel = v4;
}

- (void)updateVoiceVariationGroupUI:(id)a3
{
  id v28 = a3;
  BOOL v4 = [MEMORY[0x263F28530] sharedInstance];
  id v5 = [(AssistantVoiceViewModel *)self->_currentViewModel selectedLanguage];
  uint64_t v6 = [v4 getBaseLocale:v5];
  uint64_t v7 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v8 = [v28 selectedLanguage];
  uint64_t v9 = [v7 getBaseLocale:v8];
  char v10 = [v6 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    [(AssistantVoiceController *)self removeContiguousSpecifiers:self->_voiceVariationSpecifiers animated:1];
    id v11 = [v28 selectedLanguage];
    char v12 = [(AssistantVoiceController *)self _voiceVariationSpecifiersForLanguage:v11];
    voiceVariationSpecifiers = self->_voiceVariationSpecifiers;
    self->_voiceVariationSpecifiers = v12;

    uint64_t v14 = self->_voiceVariationSpecifiers;
    int v15 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) lastObject];
    [(AssistantVoiceController *)self insertContiguousSpecifiers:v14 afterSpecifier:v15 animated:1];
  }
  id v16 = [v28 voiceVariationToSpin];

  if (v16)
  {
    uint64_t v17 = self->_voiceVariationSpecifiers;
    long long v18 = [v28 voiceVariationToSpin];
    long long v19 = [(NSArray *)v17 specifierForID:v18];

    [v19 setProperty:MEMORY[0x263EFFA88] forKey:@"IS_VOICE_DOWNLOADING"];
  }
  long long v20 = [v28 voiceVariationToCheckMark];

  voiceVariationGroupSpecifier = self->_voiceVariationGroupSpecifier;
  if (v20)
  {
    objc_super v22 = self->_voiceVariationSpecifiers;
    uint64_t v23 = [v28 voiceVariationToCheckMark];
    unint64_t v24 = [(NSArray *)v22 specifierForID:v23];
    [(PSSpecifier *)voiceVariationGroupSpecifier setProperty:v24 forKey:*MEMORY[0x263F60200]];
  }
  else
  {
    [(PSSpecifier *)self->_voiceVariationGroupSpecifier removePropertyForKey:*MEMORY[0x263F60200]];
  }
  v25 = [v28 voiceVariationGroupFooterText];

  v26 = self->_voiceVariationGroupSpecifier;
  if (v25)
  {
    uint64_t v27 = [v28 voiceVariationGroupFooterText];
    [(PSSpecifier *)v26 setProperty:v27 forKey:*MEMORY[0x263F600F8]];
  }
  else
  {
    [(PSSpecifier *)self->_voiceVariationGroupSpecifier setProperty:@"\n" forKey:*MEMORY[0x263F600F8]];
  }
  if (self->_voiceVariationGroupSpecifier) {
    -[AssistantVoiceController reloadSpecifier:](self, "reloadSpecifier:");
  }
}

- (void)updateDownloadProgress:(float)a3
{
  if (a3 >= 0.0)
  {
    uint64_t v7 = NSString;
    BOOL v4 = +[AssistantVoiceController bundle];
    id v5 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v8 = [v4 localizedStringForKey:v5 value:&stru_26D2AB140 table:@"AssistantSettings"];
    uint64_t v9 = (void *)MEMORY[0x263F08A30];
    *(float *)&double v10 = a3;
    id v11 = [NSNumber numberWithFloat:v10];
    char v12 = [v9 localizedStringFromNumber:v11 numberStyle:3];
    objc_msgSend(v7, "stringWithFormat:", v8, v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v4 = +[AssistantVoiceController bundle];
    id v5 = SFLocalizableWAPIStringKeyForKey();
    id v17 = [v4 localizedStringForKey:v5 value:&stru_26D2AB140 table:@"AssistantSettings"];
  }

  int v13 = [(AssistantVoiceViewModel *)self->_currentViewModel languageGroupFooterText];

  if (v13)
  {
    uint64_t v14 = &OBJC_IVAR___AssistantVoiceController__languageGroupSpecifier;
  }
  else
  {
    int v15 = [(AssistantVoiceViewModel *)self->_currentViewModel voiceVariationGroupFooterText];

    id v16 = v17;
    if (!v15) {
      goto LABEL_9;
    }
    uint64_t v14 = &OBJC_IVAR___AssistantVoiceController__voiceVariationGroupSpecifier;
  }
  [(AssistantVoiceController *)self updateFooterText:v17 forSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + *v14)];
  id v16 = v17;
LABEL_9:
}

- (id)dialectsForLanguageIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v12 = -[SUICAssistantVoiceSettingsConnection dialectForLanguageIdentifier:](self->_settingsConnection, "dialectForLanguageIdentifier:", v11, (void)v14);
        [v5 setObject:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)uniqueLocaleForLanguageWithDialect:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F28530];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  id v6 = [v5 baseLocaleToDialectMapForLanguage:v4];

  return v6;
}

- (id)_languageSpecifiersForLanguage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F28530] sharedInstance];
  id v6 = [v5 allOutputVoiceIdentifiersForSiriLanguage:v4];

  if ((unint64_t)[v6 count] < 2)
  {
    char v12 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v8 = [(AssistantVoiceController *)self dialectsForLanguageIdentifiers:v7];

    uint64_t v9 = [v8 allKeys];
    double v10 = (void *)[v9 mutableCopy];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __59__AssistantVoiceController__languageSpecifiersForLanguage___block_invoke;
    v26[3] = &unk_26457D318;
    id v11 = v8;
    id v27 = v11;
    [v10 sortUsingComparator:v26];
    char v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v18 = [MEMORY[0x263F5FC40] specifierWithSpecifier:self->_languageProto];
          [v18 setIdentifier:v17];
          uint64_t v19 = [v11 objectForKey:v17];
          [v18 setName:v19];

          [v12 addObject:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v14);
    }
  }

  return v12;
}

uint64_t __59__AssistantVoiceController__languageSpecifiersForLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)_voiceVariationSpecifiersForLanguage:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v5 = [v4 getBaseLocale:v3];

  id v6 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v7 = [v6 baseLocaleToDialectMapForLanguage:v3];
  v34 = (void *)v5;
  uint64_t v8 = [v7 objectForKey:v5];

  v35 = v3;
  uint64_t v9 = [MEMORY[0x263F286E0] allVoicesForSiriSessionLanguage:v3];
  double v10 = (void *)MEMORY[0x263F08A98];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __65__AssistantVoiceController__voiceVariationSpecifiersForLanguage___block_invoke;
  v42[3] = &unk_26457D340;
  id v33 = v8;
  id v43 = v33;
  id v11 = [v10 predicateWithBlock:v42];
  char v12 = [v9 filteredArrayUsingPredicate:v11];

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v14 = [MEMORY[0x263F28530] sharedInstance];
  uint64_t v15 = [v14 outputVoiceComparator];
  v32 = v12;
  long long v16 = [v12 sortedArrayUsingComparator:v15];

  id obj = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v22 = [MEMORY[0x263F5FC40] specifierWithSpecifier:self->_voiceVariationProto];
        long long v23 = [MEMORY[0x263F28530] sharedInstance];
        long long v24 = [v21 languageCode];
        long long v25 = [v21 name];
        v26 = [v23 outputVoiceDescriptorForOutputLanguageCode:v24 voiceName:v25];

        id v27 = [v21 name];
        [v22 setIdentifier:v27];

        id v28 = [v26 localizedDisplay];
        [v22 setName:v28];

        v44 = @"VOICE_LOCALE";
        uint64_t v29 = [v21 languageCode];
        v45 = v29;
        uint64_t v30 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        [v22 setTitleDictionary:v30];

        [v13 addObject:v22];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v18);
  }

  return v13;
}

uint64_t __65__AssistantVoiceController__voiceVariationSpecifiersForLanguage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 languageCode];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)setAssistantOutputVoice:(id)a3
{
  uint64_t v5 = (AFVoiceInfo *)a3;
  if (self->_currentVoice != v5)
  {
    objc_storeStrong((id *)&self->_currentVoice, a3);
    [(AssistantVoiceController *)self setOutputVoicePreference:v5];
  }
}

- (void)setOutputVoicePreference:(id)a3
{
  id v3 = (void *)MEMORY[0x263F285A0];
  id v4 = a3;
  id v5 = [v3 sharedPreferences];
  [v5 setOutputVoice:v4];
}

- (void)setAssistantInProgressVoice:(id)a3
{
  id v5 = (AFVoiceInfo *)a3;
  if (self->_inProgressVoice != v5)
  {
    objc_storeStrong((id *)&self->_inProgressVoice, a3);
    [(AssistantVoiceController *)self setInProgressVoicePreference:v5];
  }
}

- (void)setInProgressVoicePreference:(id)a3
{
  id v3 = (void *)MEMORY[0x263F285A0];
  id v4 = a3;
  id v5 = [v3 sharedPreferences];
  [v5 setInProgressOutputVoice:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  ADClientAddValueForScalarKey();
  self->_ignoreNextVoiceChangeNotification = 1;
  uint64_t v8 = [(AssistantVoiceController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
    double v10 = [(AFVoiceInfo *)self->_currentVoice languageCode];
    id v11 = [(AFVoiceInfo *)self->_inProgressVoice name];
    char v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(AFVoiceInfo *)self->_currentVoice name];
    }
    v49 = v13;

    uint64_t v47 = v9;
    v48 = v10;
    if ([(NSArray *)self->_voiceVariationSpecifiers indexOfObject:v9] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = [v9 identifier];
      uint64_t v15 = [MEMORY[0x263F28530] sharedInstance];
      uint64_t v50 = v14;
      long long v16 = [v15 voiceSimilarToVoice:self->_currentVoice inSiriSessionLanguage:v14];

      long long v22 = [v16 name];
      uint64_t v17 = [v16 gender];
      uint64_t v18 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v18;
        long long v20 = AFVoiceGenderGetName();
        *(_DWORD *)buf = 136315906;
        v58 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
        __int16 v59 = 2112;
        uint64_t v60 = v50;
        __int16 v61 = 2112;
        uint64_t v62 = (uint64_t)v22;
        __int16 v63 = 2112;
        v64 = v20;
        _os_log_impl(&dword_220C23000, v19, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices selecting language variety: %@ %@ %@", buf, 0x2Au);
      }
    }
    else
    {
      long long v21 = [v9 titleDictionary];
      uint64_t v50 = [v21 objectForKey:@"VOICE_LOCALE"];

      long long v22 = [v9 identifier];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v23 = [MEMORY[0x263F286E0] allVoicesForSiriSessionLanguage:v10];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v46 = v6;
        uint64_t v26 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v54 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v29 = [v28 name];
            int v30 = [v29 isEqualToString:v22];

            if (v30)
            {
              uint64_t v17 = [v28 gender];
              goto LABEL_20;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v67 count:16];
          if (v25) {
            continue;
          }
          break;
        }
        uint64_t v17 = 0;
LABEL_20:
        id v6 = v46;
        uint64_t v9 = v47;
      }
      else
      {
        uint64_t v17 = 0;
      }

      uint64_t v31 = (void *)*MEMORY[0x263F28348];
      double v10 = v48;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        id v33 = AFVoiceGenderGetName();
        *(_DWORD *)buf = 136316162;
        v58 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
        __int16 v59 = 2112;
        uint64_t v60 = (uint64_t)v48;
        __int16 v61 = 2112;
        uint64_t v62 = v50;
        __int16 v63 = 2112;
        v64 = v22;
        __int16 v65 = 2112;
        v66 = v33;
        _os_log_impl(&dword_220C23000, v32, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices selecting voice variation: %@ --> %@ %@ %@", buf, 0x34u);
      }
    }
    v34 = (void *)v50;
    if (!v50) {
      goto LABEL_46;
    }
    v35 = [MEMORY[0x263F28530] sharedInstance];
    v36 = [v35 getBaseLocale:v10];
    v37 = [MEMORY[0x263F28530] sharedInstance];
    long long v38 = [v37 getBaseLocale:v50];
    if ([v36 isEqualToString:v38])
    {
      if (!v22)
      {

LABEL_39:
        v52.receiver = self;
        v52.super_class = (Class)AssistantVoiceController;
        [(AssistantVoiceController *)&v52 tableView:v6 didSelectRowAtIndexPath:v7];
        id v43 = *MEMORY[0x263F28348];
        v34 = (void *)v50;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v58 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
          _os_log_impl(&dword_220C23000, v43, OS_LOG_TYPE_DEFAULT, "%s #SiriTTSService same voice selection", buf, 0xCu);
        }
        double v10 = v48;
        long long v40 = (void *)[objc_alloc(MEMORY[0x263F286E0]) initWithLanguageCode:v48 gender:0 isCustom:1 name:v49 footprint:0 contentVersion:0 masteredVersion:0];
        [(AssistantVoiceController *)self playVoicePreview:v40];
        uint64_t v9 = v47;
        goto LABEL_45;
      }
      char v39 = [v49 isEqualToString:v22];

      if (v39) {
        goto LABEL_39;
      }
    }
    else
    {
    }
    v34 = (void *)v50;
    long long v40 = [(AssistantVoiceController *)self voiceSettingsForLanguageCode:v50 name:v22 gender:v17];
    long long v41 = [v40 inProgressVoice];
    if (v41
      && !+[ASTNetworkReachability hasNetworkConnection])
    {
      [v6 deselectRowAtIndexPath:v7 animated:1];
      [(AssistantVoiceController *)self presentVoiceDownloadDisabledNoInternetAlert];
      [(AssistantVoiceController *)self playVoicePreview:v41];
      uint64_t v9 = v47;
      double v10 = v48;
    }
    else
    {
      id v42 = [v41 name];
      if (!v42
        || [(AssistantVoiceController *)self isCellularDataPermissionAllowedForVoice:v41])
      {

        double v10 = v48;
LABEL_35:
        v51.receiver = self;
        v51.super_class = (Class)AssistantVoiceController;
        [(AssistantVoiceController *)&v51 tableView:v6 didSelectRowAtIndexPath:v7];
        [(AssistantVoiceController *)self selectVoice:v40 inProgressVoice:v41];
        v34 = (void *)v50;
        if (v41)
        {
          [(AssistantVoiceController *)self playVoicePreview:v41];
        }
        else
        {
          v44 = [v40 currentVoice];
          [(AssistantVoiceController *)self playVoicePreview:v44];

          v34 = (void *)v50;
        }
        uint64_t v9 = v47;
        goto LABEL_44;
      }
      BOOL v45 = +[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection];

      double v10 = v48;
      if (!v45) {
        goto LABEL_35;
      }
      [v6 deselectRowAtIndexPath:v7 animated:1];
      [(AssistantVoiceController *)self presentVoiceDownloadConfirmationNoWifiAlertForVoice:v40 inProgressVoice:v41];
      uint64_t v9 = v47;
      v34 = (void *)v50;
    }
LABEL_44:

LABEL_45:
LABEL_46:
  }
}

- (void)selectVoice:(id)a3 inProgressVoice:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v20 = "-[AssistantVoiceController selectVoice:inProgressVoice:]";
    _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices applying voice selection", buf, 0xCu);
  }
  uint64_t v9 = [v6 currentVoice];
  double v10 = [(AssistantVoiceController *)self viewModelWithInProgressVoice:v7 currentVoice:v9];
  [(AssistantVoiceController *)self applyViewModel:v10];
  if (v7)
  {
    id v11 = [v10 inProgressVoice];
    [(AssistantVoiceController *)self downloadVoice:v11];
  }
  else
  {
    [(AssistantVoiceController *)self stopAllDownload];
  }
  char v12 = self->_currentVoice;
  id v13 = self->_inProgressVoice;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__AssistantVoiceController_selectVoice_inProgressVoice___block_invoke;
  v16[3] = &unk_26457D368;
  v16[4] = self;
  uint64_t v17 = v13;
  uint64_t v18 = v12;
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  [(AssistantVoiceController *)self registerUndoActionWithKey:@"VOICE" urlString:@"prefs:root=SIRI&path=VOICE_LANGUAGE_GROUP" undoAction:v16];
  [(AssistantVoiceController *)self setAssistantInProgressVoice:v7];
  [(AssistantVoiceController *)self setAssistantOutputVoice:v9];
  [(AssistantVoiceController *)self _signalDidSelectVoice];
}

uint64_t __56__AssistantVoiceController_selectVoice_inProgressVoice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssistantInProgressVoice:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAssistantOutputVoice:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

- (void)playVoicePreview:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 languageCode];

  if (v5)
  {
    id v6 = [(AssistantVoiceController *)self metrics];
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v22 = "-[AssistantVoiceController playVoicePreview:]";
      _os_log_impl(&dword_220C23000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriTTSService playing preview", buf, 0xCu);
    }
    id v8 = objc_alloc(MEMORY[0x263F74E98]);
    uint64_t v9 = [v4 languageCode];
    double v10 = [v4 name];
    id v11 = (void *)[v8 initWithLanguage:v9 name:v10];

    char v12 = (SiriTTSPreviewRequest *)[objc_alloc(MEMORY[0x263F74E60]) initWithVoice:v11 previewType:0];
    lastPreviewRequest = self->_lastPreviewRequest;
    self->_lastPreviewRequest = v12;
    uint64_t v14 = v12;

    session = self->_session;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__AssistantVoiceController_playVoicePreview___block_invoke;
    v19[3] = &unk_26457D390;
    id v20 = v6;
    id v16 = v6;
    [(SiriTTSDaemonSession *)session speakWithPreviewRequest:v14 didFinish:v19];
    uint64_t v17 = [v4 languageCode];
    uint64_t v18 = [v4 name];
    [v16 setVoicePreviewedForLanguageCode:v17 name:v18];
  }
}

uint64_t __45__AssistantVoiceController_playVoicePreview___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setPreviewedSuccessfully:a2 == 0];
}

- (id)voiceSettingsForLanguageCode:(id)a3 name:(id)a4 gender:(int64_t)a5
{
  id v8 = (objc_class *)MEMORY[0x263F286E0];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithLanguageCode:v10 gender:a5 isCustom:1 name:v9 footprint:0 contentVersion:0 masteredVersion:0];

  char v12 = [(AssistantVoiceController *)self deriveVoicesWithTargetVoice:v11 currentVoice:self->_currentVoice];

  return v12;
}

- (void)presentVoiceDownloadDisabledNoInternetAlert
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[AssistantVoiceController presentVoiceDownloadDisabledNoInternetAlert]";
    _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices presenting no internet alert", (uint8_t *)&v16, 0xCu);
  }
  id v4 = +[AssistantVoiceController bundle];
  id v5 = SFLocalizableWAPIStringKeyForKey();
  id v6 = [v4 localizedStringForKey:v5 value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v7 = +[AssistantVoiceController bundle];
  id v8 = SFLocalizableWAPIStringKeyForKey();
  id v9 = [v7 localizedStringForKey:v8 value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  id v11 = (void *)MEMORY[0x263F82400];
  char v12 = +[AssistantVoiceController bundle];
  id v13 = SFLocalizableWAPIStringKeyForKey();
  uint64_t v14 = [v12 localizedStringForKey:v13 value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v15 = [v11 actionWithTitle:v14 style:0 handler:0];
  [v10 addAction:v15];

  [(AssistantVoiceController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)presentVoiceDownloadDisabledNoWifiAlert
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[AssistantVoiceController presentVoiceDownloadDisabledNoWifiAlert]";
    _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices presenting no Wi-Fi alert", (uint8_t *)&v16, 0xCu);
  }
  id v4 = +[AssistantVoiceController bundle];
  id v5 = SFLocalizableWAPIStringKeyForKey();
  id v6 = [v4 localizedStringForKey:v5 value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v7 = +[AssistantVoiceController bundle];
  id v8 = SFLocalizableWAPIStringKeyForKey();
  id v9 = [v7 localizedStringForKey:v8 value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v9 preferredStyle:1];
  id v11 = (void *)MEMORY[0x263F82400];
  char v12 = +[AssistantVoiceController bundle];
  id v13 = SFLocalizableWAPIStringKeyForKey();
  uint64_t v14 = [v12 localizedStringForKey:v13 value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v15 = [v11 actionWithTitle:v14 style:0 handler:0];
  [v10 addAction:v15];

  [(AssistantVoiceController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(id)a3 inProgressVoice:(id)a4
{
  v66[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 languageCode];
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  if (!v7
    || (id v9 = (void *)v7,
        [v6 name],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    id v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT)) {
      -[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:](v11);
    }
  }
  v65[0] = &unk_26D2B3AD8;
  uint64_t v12 = [v6 languageCode];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_26D2AB140;
  }
  v66[0] = v14;
  v65[1] = &unk_26D2B3AF0;
  uint64_t v15 = [v6 name];
  int v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  else {
    uint64_t v17 = &stru_26D2AB140;
  }
  v66[1] = v17;
  v65[2] = &unk_26D2B3B08;
  uint64_t v18 = [MEMORY[0x263F74EB8] turiTrial];
  v64 = v18;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  v66[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];

  uint64_t v21 = (void *)MEMORY[0x263F74EA8];
  long long v22 = [MEMORY[0x263F74EC0] gryphonVoice];
  v63[0] = v22;
  uint64_t v23 = [MEMORY[0x263F74EC0] vocalizerVoice];
  v63[1] = v23;
  uint64_t v24 = v8;
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
  long long v54 = (void *)v20;
  uint64_t v26 = [v21 bestAssetOfTypes:v25 matching:v20];

  if (!v26)
  {
    id v27 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v60 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
      __int16 v61 = 2112;
      id v62 = v6;
      _os_log_impl(&dword_220C23000, v27, OS_LOG_TYPE_DEFAULT, "%s Unable to find a voice with voice predicate: %@", buf, 0x16u);
    }
  }
  id v28 = [v26 downloadSize];
  [v28 floatValue];
  float v30 = v29;

  uint64_t v31 = *v24;
  if (v30 <= 0.0)
  {
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEBUG)) {
      -[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]((uint64_t)v6, v31);
    }
    [(AssistantVoiceController *)self presentVoiceDownloadDisabledNoWifiAlert];
    [(AssistantVoiceController *)self playVoicePreview:v6];
  }
  else
  {
    long long v53 = v5;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v60 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
      __int16 v61 = 2112;
      id v62 = v6;
      _os_log_impl(&dword_220C23000, v31, OS_LOG_TYPE_DEFAULT, "%s #VoiceDownload presenting no Wi-Fi -should confirm cellular- alert for voice: %@", buf, 0x16u);
    }
    v32 = +[AssistantVoiceController bundle];
    id v33 = SFLocalizableWAPIStringKeyForKey();
    objc_super v52 = [v32 localizedStringForKey:v33 value:&stru_26D2AB140 table:@"AssistantSettings"];

    v34 = NSString;
    v35 = +[AssistantVoiceController bundle];
    v36 = SFLocalizableWAPIStringKeyForKey();
    v37 = [v35 localizedStringForKey:v36 value:&stru_26D2AB140 table:@"AssistantSettings"];
    long long v38 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)v30 countStyle:0];
    objc_super v51 = objc_msgSend(v34, "stringWithFormat:", v37, v38);

    char v39 = [MEMORY[0x263F82418] alertControllerWithTitle:v52 message:v51 preferredStyle:1];
    long long v40 = (void *)MEMORY[0x263F82400];
    long long v41 = +[AssistantVoiceController bundle];
    id v42 = SFLocalizableWAPIStringKeyForKey();
    id v43 = [v41 localizedStringForKey:v42 value:&stru_26D2AB140 table:@"AssistantSettings"];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __96__AssistantVoiceController_presentVoiceDownloadConfirmationNoWifiAlertForVoice_inProgressVoice___block_invoke;
    v56[3] = &unk_26457D3B8;
    v56[4] = self;
    id v44 = v6;
    id v57 = v44;
    id v58 = v53;
    BOOL v45 = [v40 actionWithTitle:v43 style:0 handler:v56];
    [v39 addAction:v45];

    id v46 = (void *)MEMORY[0x263F82400];
    uint64_t v47 = +[AssistantVoiceController bundle];
    v48 = SFLocalizableWAPIStringKeyForKey();
    v49 = [v47 localizedStringForKey:v48 value:&stru_26D2AB140 table:@"AssistantSettings"];
    uint64_t v50 = [v46 actionWithTitle:v49 style:1 handler:0];
    [v39 addAction:v50];

    [(AssistantVoiceController *)self presentViewController:v39 animated:1 completion:0];
    [(AssistantVoiceController *)self playVoicePreview:v44];

    id v5 = v53;
  }
}

uint64_t __96__AssistantVoiceController_presentVoiceDownloadConfirmationNoWifiAlertForVoice_inProgressVoice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) grantCellularDataPermissionForVoice:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);

  return [v4 selectVoice:v2 inProgressVoice:v3];
}

+ (BOOL)asset:(id)a3 matchesVoice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 primaryLanguage];
  id v8 = [v6 languageCode];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [v5 name];
    id v10 = [v6 name];
    char v11 = [v9 isEqualToString:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)downloadVoice:(id)a3
{
  v34[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 languageCode];
  if (v5)
  {
    p_downloadingAsset = &self->_downloadingAsset;
    downloadingAsset = self->_downloadingAsset;
    if (!downloadingAsset
      || !+[AssistantVoiceController asset:downloadingAsset matchesVoice:v4])
    {
      v33[0] = &unk_26D2B3AD8;
      id v8 = [v4 languageCode];
      v34[0] = v8;
      v33[1] = &unk_26D2B3AF0;
      id v9 = [v4 name];
      v34[1] = v9;
      v33[2] = &unk_26D2B3B08;
      id v10 = [MEMORY[0x263F74EB8] turiTrial];
      v32 = v10;
      char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      v34[2] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

      id v13 = (void *)MEMORY[0x263F74EA8];
      uint64_t v14 = [MEMORY[0x263F74EC0] gryphonVoice];
      v31[0] = v14;
      uint64_t v15 = [MEMORY[0x263F74EC0] vocalizerVoice];
      v31[1] = v15;
      int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      uint64_t v17 = [v13 bestAssetOfTypes:v16 matching:v12];

      if (*p_downloadingAsset) {
        [(TTSAsset *)*p_downloadingAsset cancelDownloadingThen:&__block_literal_global_288];
      }
      objc_storeStrong((id *)&self->_downloadingAsset, v17);
      objc_initWeak(&location, self);
      BOOL v18 = [(AssistantVoiceController *)self isCellularDataPermissionAllowedForVoice:v4];
      metrics = self->_metrics;
      uint64_t v20 = [v17 primaryLanguage];
      uint64_t v21 = [v17 name];
      [(AssistantVoiceMetrics *)metrics setVoiceDownloadForLanguageCode:v20 name:v21];

      [(AssistantVoiceMetrics *)self->_metrics setIsCellularAllowed:v18];
      [(AssistantVoiceMetrics *)self->_metrics beginDownloadObservation];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_2;
      v27[3] = &unk_26457D428;
      objc_copyWeak(&v29, &location);
      id v22 = v17;
      id v28 = v22;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_4;
      v24[3] = &unk_26457D450;
      objc_copyWeak(&v26, &location);
      id v23 = v22;
      id v25 = v23;
      [v23 downloadWithReservation:0 useBattery:1 progress:v27 then:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_3;
  v6[3] = &unk_26457D400;
  objc_copyWeak(v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  v8[1] = a2;
  v8[2] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(v8);
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v11 = WeakRetained;
    id v4 = [WeakRetained downloadingAsset];

    id WeakRetained = v11;
    if (v3 == v4)
    {
      uint64_t v6 = *(void *)(a1 + 56);
      float v7 = (float)v6;
      if (!v6) {
        float v7 = 1.0;
      }
      *(float *)&double v5 = (float)*(uint64_t *)(a1 + 48) / v7;
      float v8 = *(float *)&v5;
      [v11 updateDownloadProgress:v5];
      id v9 = [v11 metrics];
      *(float *)&double v10 = v8;
      [v9 setDownloadObservationProgress:v10];

      id WeakRetained = v11;
    }
  }
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_5;
  block[3] = &unk_26457CFD8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v14 = WeakRetained;
    id v4 = [WeakRetained downloadingAsset];

    id WeakRetained = v14;
    if (v3 == v4)
    {
      [v14 setDownloadingAsset:0];
      if (*(void *)(a1 + 40))
      {
        id v6 = [v14 inProgressVoice];
        [v14 setAssistantOutputVoice:v6];

        [v14 setAssistantInProgressVoice:0];
        id v7 = [v14 metrics];
        LODWORD(v8) = 1.0;
        [v7 setDownloadObservationProgress:v8];

        id v9 = [v14 metrics];
        [v9 sendAnalyticsEvent];

        [v14 resetMetrics];
        double v10 = [v14 currentVoice];
        id v11 = [v14 viewModelWithInProgressVoice:0 currentVoice:v10];

        [v14 applyViewModel:v11];
      }
      else
      {
        LODWORD(v5) = -1.0;
        [v14 updateDownloadProgress:v5];
        uint64_t v12 = [v14 metrics];
        [v12 setDownloadError:1];

        id v13 = [v14 metrics];
        [v13 sendAnalyticsEvent];

        [v14 resetMetrics];
      }
      id WeakRetained = v14;
    }
  }
}

- (void)stopAllDownload
{
  downloadingAsset = self->_downloadingAsset;
  if (downloadingAsset)
  {
    [(TTSAsset *)downloadingAsset cancelDownloadingThen:&__block_literal_global_291];
    id v4 = self->_downloadingAsset;
    self->_downloadingAsset = 0;
  }
}

- (void)_signalDidSelectVoice
{
  signalEmitter = self->_signalEmitter;
  if (!signalEmitter)
  {
    id v4 = objc_alloc_init(AssistantSettingsSignalEmitter);
    double v5 = self->_signalEmitter;
    self->_signalEmitter = v4;

    signalEmitter = self->_signalEmitter;
  }

  [(AssistantSettingsSignalEmitter *)signalEmitter emitDidSelectVoiceSignal];
}

- (void)updateFooterText:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    uint64_t v9 = *MEMORY[0x263F600F8];
    double v10 = [v7 propertyForKey:*MEMORY[0x263F600F8]];
    if (([v10 isEqualToString:v6] & 1) == 0)
    {
      [v8 setProperty:v6 forKey:v9];
      id v11 = [(AssistantVoiceController *)self indexPathForSpecifier:v8];
      uint64_t v12 = [(AssistantVoiceController *)self table];
      id v13 = objc_msgSend(v12, "footerViewForSection:", objc_msgSend(v11, "section"));

      id v14 = [(AssistantVoiceController *)self table];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __58__AssistantVoiceController_updateFooterText_forSpecifier___block_invoke;
      v16[3] = &unk_26457D148;
      id v17 = v13;
      id v18 = v6;
      id v15 = v13;
      [v14 performBatchUpdates:v16 completion:0];
    }
  }
}

void __58__AssistantVoiceController_updateFooterText_forSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textLabel];
  [v2 setText:v1];
}

- (BOOL)isVoiceInstalled:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 languageCode];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [v3 languageCode];
    [v5 setObject:v6 forKeyedSubscript:&unk_26D2B3AD8];

    id v7 = [v3 name];
    [v5 setObject:v7 forKeyedSubscript:&unk_26D2B3AF0];

    double v8 = [MEMORY[0x263F74EB0] premium];
    [v5 setObject:v8 forKeyedSubscript:&unk_26D2B3B20];

    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:&unk_26D2B3B38];
    uint64_t v9 = (void *)MEMORY[0x263F74EA8];
    double v10 = [MEMORY[0x263F74EC0] gryphonVoice];
    v16[0] = v10;
    id v11 = [MEMORY[0x263F74EC0] vocalizerVoice];
    v16[1] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    id v13 = [v9 listAssetsOfTypes:v12 matching:v5];

    BOOL v14 = [v13 count] != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)grantCellularDataPermissionForVoice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v5 = v4;
    id v6 = [v3 languageCode];
    id v7 = [v3 name];
    int v12 = 136315650;
    id v13 = "-[AssistantVoiceController grantCellularDataPermissionForVoice:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices allowing cellular for: %@ %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v8 = [v3 languageCode];
  uint64_t v9 = (void *)allowedCellularLanguage;
  allowedCellularLanguage = v8;

  uint64_t v10 = [v3 name];
  id v11 = (void *)allowedCellularVoiceName;
  allowedCellularVoiceName = v10;
}

- (BOOL)isCellularDataPermissionAllowedForVoice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)allowedCellularLanguage;
  double v5 = [v3 languageCode];
  if ([v4 isEqualToString:v5])
  {
    if (v3)
    {
      id v6 = (void *)allowedCellularVoiceName;
      id v7 = [v3 name];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5
{
  char v8 = (objc_class *)MEMORY[0x263F08DB0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  id v13 = [MEMORY[0x263EFF960] currentLocale];
  __int16 v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 bundleURL];
  id v17 = (id)[v12 initWithKey:v11 table:@"AssistantSettings" locale:v13 bundleURL:v15];

  __int16 v16 = [NSURL URLWithString:v10];

  [(AssistantVoiceController *)self pe_registerUndoActionName:v17 associatedDeepLink:v16 undoAction:v9];
}

- (SUICAssistantVoiceSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (void)setSettingsConnection:(id)a3
{
}

- (PSSpecifier)languageGroupSpecifier
{
  return self->_languageGroupSpecifier;
}

- (void)setLanguageGroupSpecifier:(id)a3
{
}

- (PSSpecifier)languageProto
{
  return self->_languageProto;
}

- (void)setLanguageProto:(id)a3
{
}

- (NSArray)languageSpecifiers
{
  return self->_languageSpecifiers;
}

- (void)setLanguageSpecifiers:(id)a3
{
}

- (PSSpecifier)voiceVariationGroupSpecifier
{
  return self->_voiceVariationGroupSpecifier;
}

- (void)setVoiceVariationGroupSpecifier:(id)a3
{
}

- (PSSpecifier)voiceVariationProto
{
  return self->_voiceVariationProto;
}

- (void)setVoiceVariationProto:(id)a3
{
}

- (NSArray)cellularUpdatesSpecifiers
{
  return self->_cellularUpdatesSpecifiers;
}

- (void)setCellularUpdatesSpecifiers:(id)a3
{
}

- (TTSAsset)downloadingAsset
{
  return self->_downloadingAsset;
}

- (void)setDownloadingAsset:(id)a3
{
}

- (NSArray)voiceVariationSpecifiers
{
  return self->_voiceVariationSpecifiers;
}

- (void)setVoiceVariationSpecifiers:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (AFVoiceInfo)inProgressVoice
{
  return self->_inProgressVoice;
}

- (void)setInProgressVoice:(id)a3
{
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
}

- (BOOL)ignoreNextVoiceChangeNotification
{
  return self->_ignoreNextVoiceChangeNotification;
}

- (void)setIgnoreNextVoiceChangeNotification:(BOOL)a3
{
  self->_ignoreNextVoiceChangeNotification = a3;
}

- (AssistantVoiceViewModel)currentViewModel
{
  return self->_currentViewModel;
}

- (void)setCurrentViewModel:(id)a3
{
}

- (AssistantVoiceMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (SiriTTSDaemonSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (SiriTTSPreviewRequest)lastPreviewRequest
{
  return self->_lastPreviewRequest;
}

- (void)setLastPreviewRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPreviewRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_currentViewModel, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_inProgressVoice, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_voiceVariationSpecifiers, 0);
  objc_storeStrong((id *)&self->_downloadingAsset, 0);
  objc_storeStrong((id *)&self->_cellularUpdatesSpecifiers, 0);
  objc_storeStrong((id *)&self->_voiceVariationProto, 0);
  objc_storeStrong((id *)&self->_voiceVariationGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_languageSpecifiers, 0);
  objc_storeStrong((id *)&self->_languageProto, 0);
  objc_storeStrong((id *)&self->_languageGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);

  objc_storeStrong((id *)&self->_signalEmitter, 0);
}

- (void)languageCodeDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[AssistantVoiceController languageCodeDidChange:]";
  _os_log_debug_impl(&dword_220C23000, log, OS_LOG_TYPE_DEBUG, "%s #VoiceServices languageCodeDidChange, will reload specifiers", (uint8_t *)&v1, 0xCu);
}

- (void)outputVoiceDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[AssistantVoiceController outputVoiceDidChange:]";
  _os_log_debug_impl(&dword_220C23000, log, OS_LOG_TYPE_DEBUG, "%s #VoiceServices outputVoiceDidChange, will reload specifiers", (uint8_t *)&v1, 0xCu);
}

- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(uint64_t)a1 inProgressVoice:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_220C23000, a2, OS_LOG_TYPE_DEBUG, "%s #VoiceDownload unknown download size for voice: %@", (uint8_t *)&v2, 0x16u);
}

- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(os_log_t)log inProgressVoice:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
  _os_log_fault_impl(&dword_220C23000, log, OS_LOG_TYPE_FAULT, "%s missing language or name for in-progress voice", (uint8_t *)&v1, 0xCu);
}

@end