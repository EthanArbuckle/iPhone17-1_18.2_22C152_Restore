@interface SoundDetectionController
- (AXDispatchTimer)assetQueueTimer;
- (BOOL)_isFeatureEnabled;
- (BOOL)assetsReady;
- (NSDictionary)cachedDetectors;
- (NSString)percentDownloadedFormatted;
- (PSSpecifier)downloadSpecifier;
- (PSSpecifier)enrollSpecifier;
- (PSSpecifier)historySpecifier;
- (PSSpecifier)soundDetectorsGroupSpecifier;
- (PSSpecifier)soundDetectorsSpecifier;
- (SoundDetectionController)init;
- (id)_internalSettingsButton;
- (id)numberOfEnabledDetectors;
- (id)soundDetectionEnabled;
- (id)specifiers;
- (int64_t)percentDownloaded;
- (void)_enableSoundDetection:(BOOL)a3;
- (void)_internalSettingsPressed:(id)a3;
- (void)_navigateToDataCollectionView:(id)a3;
- (void)_reloadSettings;
- (void)_showHeySiriConfirmationAlert;
- (void)_showInternalDataCollectionAlert;
- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6;
- (void)dealloc;
- (void)detectorStore:(id)a3 didFinishRefreshingDetectors:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)detectorStore:(id)a3 totalSizeExpected:(int64_t)a4 downloadProgressTotalWritten:(int64_t)a5 remainingTimeExpected:(double)a6 isStalled:(BOOL)a7;
- (void)detectorsReadyForDetectorStore:(id)a3;
- (void)optOutCustomSoundRecognition:(id)a3;
- (void)setAssetQueueTimer:(id)a3;
- (void)setAssetsReady:(BOOL)a3;
- (void)setCachedDetectors:(id)a3;
- (void)setDownloadSpecifier:(id)a3;
- (void)setEnrollSpecifier:(id)a3;
- (void)setHistorySpecifier:(id)a3;
- (void)setPercentDownloaded:(int64_t)a3;
- (void)setPercentDownloadedFormatted:(id)a3;
- (void)setSoundDetectionEnabled:(id)a3;
- (void)setSoundDetectorsGroupSpecifier:(id)a3;
- (void)setSoundDetectorsSpecifier:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateDetectorSpecifiersAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SoundDetectionController

- (SoundDetectionController)init
{
  v13.receiver = self;
  v13.super_class = (Class)SoundDetectionController;
  v2 = [(AccessibilitySettingsBaseController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_assetsReady = 0;
    v2->_wantsAssetDownloadIfNeeded = 0;
    objc_initWeak(&location, v2);
    v4 = +[AXSDSettings sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __32__SoundDetectionController_init__block_invoke;
    v10[3] = &unk_208798;
    objc_copyWeak(&v11, &location);
    [v4 registerUpdateBlock:v10 forRetrieveSelector:"soundDetectionState" withListener:v3];

    v5 = +[AXSDSettings sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __32__SoundDetectionController_init__block_invoke_2;
    v8[3] = &unk_208798;
    objc_copyWeak(&v9, &location);
    [v5 registerUpdateBlock:v8 forRetrieveSelector:"enabledSoundDetectionTypes" withListener:v3];

    v6 = v3;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __32__SoundDetectionController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSettings];
}

void __32__SoundDetectionController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSettings];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SoundDetectionController;
  [(SoundDetectionController *)&v7 viewDidLoad];
  v3 = +[AXSDDetectorStore sharedInstance];
  [v3 addObserver:self];

  v4 = +[AXSDDetectorStore sharedInstance];
  [v4 loadDetectors];

  if (AXIsInternalInstall())
  {
    v5 = [(SoundDetectionController *)self navigationItem];
    v6 = [(SoundDetectionController *)self _internalSettingsButton];
    [v5 setRightBarButtonItem:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SoundDetectionController;
  [(AccessibilitySettingsBaseController *)&v6 viewWillAppear:a3];
  v4 = +[AXSDDetectorStore sharedInstance];
  [v4 addObserver:self];

  [(SoundDetectionController *)self setAssetsReady:0];
  if ([(SoundDetectionController *)self _isFeatureEnabled])
  {
    v5 = +[AXSDDetectorStore sharedInstance];
    -[SoundDetectionController setAssetsReady:](self, "setAssetsReady:", [v5 areDetectorsReady]);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SoundDetectionController;
  [(SoundDetectionController *)&v3 viewWillDisappear:a3];
}

- (BOOL)_isFeatureEnabled
{
  v2 = +[AXSDSettings sharedInstance];
  unsigned __int8 v3 = [v2 soundDetectionEnabled];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    objc_super v7 = AXLocStringKeyForModel();
    uint64_t v8 = PSIDKey;
    [v6 setProperty:@"SoundDetectionGroup" forKey:PSIDKey];
    v35 = v7;
    id v9 = settingsLocString(v7, @"SoundDetection");
    uint64_t v10 = PSFooterTextGroupKey;
    [v6 setProperty:v9 forKey:PSFooterTextGroupKey];

    v34 = v6;
    [v5 addObject:v6];
    id v11 = settingsLocString(@"SOUND_RECOGNITION", @"SoundDetection");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setSoundDetectionEnabled:" get:"soundDetectionEnabled" detail:0 cell:6 edit:0];

    [v12 setProperty:@"SoundDetection" forKey:v8];
    [v5 addObject:v12];
    objc_super v13 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:-1 edit:0];

    [v13 setProperty:@"Downloading" forKey:v8];
    [v13 setProperty:objc_opt_class() forKey:PSCellClassKey];
    objc_msgSend(v13, "setAx_assetState:", 0);
    [v5 addObject:v13];
    assetStatusSpecifier = self->_assetStatusSpecifier;
    self->_assetStatusSpecifier = (PSSpecifier *)v13;
    id v15 = v13;

    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDeleteButtonHidden:1];
    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadButtonHidden:1];
    v16 = +[PSSpecifier groupSpecifierWithName:0];

    [v16 setProperty:@"DetectorsGroup" forKey:v8];
    v17 = settingsLocString(@"SOUND_DETECTORS_FOOTER", @"SoundDetection");
    [v16 setProperty:v17 forKey:v10];

    [(SoundDetectionController *)self setSoundDetectorsGroupSpecifier:v16];
    v18 = settingsLocString(@"SOUND_DETECTORS", @"SoundDetection");
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"numberOfEnabledDetectors" detail:objc_opt_class() cell:2 edit:0];

    [v19 setProperty:@"Sounds" forKey:v8];
    [(SoundDetectionController *)self setSoundDetectorsSpecifier:v19];
    if (AXIsInternalInstall())
    {
      v20 = +[PSSpecifier preferenceSpecifierNamed:@"Enroll in False Positive Collection" target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v20 setButtonAction:"_navigateToDataCollectionView:"];
      [v20 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v20 setProperty:@"DataCollection" forKey:v8];
      [(SoundDetectionController *)self setEnrollSpecifier:v20];
      v19 = +[PSSpecifier preferenceSpecifierNamed:@"History" target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v19 setProperty:@"History" forKey:v8];
      [(SoundDetectionController *)self setHistorySpecifier:v19];
    }
    v21 = +[AXSDSettings sharedInstance];
    if (![v21 soundDetectionEnabled]) {
      goto LABEL_13;
    }
    unsigned int v22 = [(SoundDetectionController *)self assetsReady];

    if (v22)
    {
      v23 = [(SoundDetectionController *)self soundDetectorsGroupSpecifier];
      [v5 addObject:v23];

      v24 = [(SoundDetectionController *)self soundDetectorsSpecifier];
      [v5 addObject:v24];

      if (AXIsInternalInstall())
      {
        if ((+[AXSDSoundDetectionController isEnrolledInDataCollection] & 1) == 0)
        {
          v25 = [(SoundDetectionController *)self enrollSpecifier];

          if (v25)
          {
            uint64_t v26 = [(SoundDetectionController *)self enrollSpecifier];
LABEL_12:
            v21 = (void *)v26;
            [v5 addObject:v26];
LABEL_13:

            goto LABEL_14;
          }
        }
        v27 = [(SoundDetectionController *)self historySpecifier];

        if (v27)
        {
          uint64_t v26 = [(SoundDetectionController *)self historySpecifier];
          goto LABEL_12;
        }
      }
    }
LABEL_14:
    if (AXDeviceIsKShotMedinaEnabled())
    {
      v28 = +[PSSpecifier groupSpecifierWithID:@"MedinaGroup"];

      [v5 addObject:v28];
      v29 = settingsLocString(@"CUSTOM_SOUNDS_OPT_OUT", @"Accessibility-MedinaPreBoard");
      v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v30 setButtonAction:"optOutCustomSoundRecognition:"];
      [v30 setProperty:@"Medina" forKey:v8];
      [v5 addObject:v30];
      v19 = v30;
    }
    else
    {
      v28 = v34;
    }
    v31 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v31];
    v32 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (id)soundDetectionEnabled
{
  v2 = +[AXSDSettings sharedInstance];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 soundDetectionEnabled]);

  return v3;
}

- (void)setSoundDetectionEnabled:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  v5 = +[AXSDSettings sharedInstance];
  objc_super v6 = v5;
  if (v4)
  {
    objc_super v7 = (char *)[v5 soundDetectionState];

    uint64_t v8 = +[AXSDSettings sharedInstance];
    id v9 = [v8 enabledSoundDetectionTypes];
    id v10 = [v9 count];
    id v11 = +[AXSDSettings sharedInstance];
    v12 = [v11 enabledKShotDetectorIdentifiers];
    uint64_t v13 = (uint64_t)[v12 count];

    v14 = +[VTPreferences sharedPreferences];
    unsigned int v15 = [v14 voiceTriggerEnabled];

    char v16 = AXDeviceSupportsConcurrentHPLPMics();
    if (!((char *)v10 + v13) || v7 == (unsigned char *)&dword_0 + 2 || !v15 || (v16 & 1) != 0) {
      [(SoundDetectionController *)self _enableSoundDetection:v10 != (id)-v13];
    }
    else {
      [(SoundDetectionController *)self _showHeySiriConfirmationAlert];
    }
  }
  else
  {
    [v5 setSoundDetectionState:0];
  }

  [(SoundDetectionController *)self updateDetectorSpecifiersAnimated:1];
}

- (void)_enableSoundDetection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[AXSDSettings sharedInstance];
  objc_super v6 = v5;
  if (v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v5 setSoundDetectionState:v7];

  if (AXIsInternalInstall()
    && (+[AXSDSoundDetectionController wasPromptedForDataCollection] & 1) == 0)
  {
    [(SoundDetectionController *)self _showInternalDataCollectionAlert];
  }
}

- (void)updateDetectorSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SoundDetectionController *)self specifiers];
  objc_super v6 = +[AXSDSettings sharedInstance];
  if ([v6 soundDetectionEnabled]) {
    unsigned int v7 = [(SoundDetectionController *)self assetsReady];
  }
  else {
    unsigned int v7 = 0;
  }

  id v8 = objc_alloc((Class)NSMutableArray);
  id v9 = [(SoundDetectionController *)self soundDetectorsGroupSpecifier];
  v22[0] = v9;
  id v10 = [(SoundDetectionController *)self soundDetectorsSpecifier];
  v22[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v22 count:2];
  id v12 = [v8 initWithArray:v11];

  if (AXIsInternalInstall())
  {
    if (+[AXSDSoundDetectionController isEnrolledInDataCollection])[(SoundDetectionController *)self historySpecifier]; {
    else
    }
    uint64_t v13 = [(SoundDetectionController *)self enrollSpecifier];
    [v12 addObject:v13];
  }
  uint64_t v14 = [(SoundDetectionController *)self soundDetectorsGroupSpecifier];
  if (v14)
  {
    unsigned int v15 = (void *)v14;
    char v16 = [(SoundDetectionController *)self soundDetectorsSpecifier];

    if (v16)
    {
      [(SoundDetectionController *)self beginUpdates];
      if (v7)
      {
        v17 = [(SoundDetectionController *)self soundDetectorsGroupSpecifier];
        unsigned __int8 v18 = [v5 containsObject:v17];

        if ((v18 & 1) == 0) {
          [(SoundDetectionController *)self insertContiguousSpecifiers:v12 afterSpecifierID:@"Downloading" animated:v3];
        }
      }
      else
      {
        [(SoundDetectionController *)self removeContiguousSpecifiers:v12 animated:v3];
      }
      [(SoundDetectionController *)self endUpdates];
    }
  }
  if (v7)
  {
    id v19 = [objc_alloc((Class)AXUIClient) initWithIdentifier:@"AXAssetClient-sounddetectionmodule" serviceBundleName:@"AXAssetAndDataServer"];
    v20 = +[AXAccessQueue mainAccessQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __61__SoundDetectionController_updateDetectorSpecifiersAnimated___block_invoke;
    v21[3] = &unk_20B120;
    v21[4] = self;
    [v19 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:9 targetAccessQueue:v20 completion:v21];
  }
}

void __61__SoundDetectionController_updateDetectorSpecifiersAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unsigned int v7 = [v5 objectForKey:@"installed"];
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      id v9 = AXLogUltron();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v15 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Sound Recognition Control Center Module was installed.", v15, 2u);
      }

      id v10 = settingsLocString(@"SOUND_RECOGNITION_CONTROL_CENTER_TITLE", @"Accessibility");
      id v11 = settingsLocString(@"SOUND_RECOGNITION_CONTROL_CENTER_DESCRIPTION", @"Accessibility");
      id v12 = +[UIAlertController alertControllerWithTitle:v10 message:v11 preferredStyle:1];

      uint64_t v13 = settingsLocString(@"OK", @"Accessibility");
      uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&__block_literal_global_44];

      [v12 addAction:v14];
      [*(id *)(a1 + 32) presentViewController:v12 animated:1 completion:0];
    }
  }
}

void __61__SoundDetectionController_updateDetectorSpecifiersAnimated___block_invoke_375(id a1, UIAlertAction *a2)
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Sound Recognition Control Center Module was installed and acknowledged.", v3, 2u);
  }
}

- (id)numberOfEnabledDetectors
{
  v2 = +[AXSDSettings sharedInstance];
  BOOL v3 = [v2 enabledSoundDetectionTypes];
  unsigned int v4 = (char *)[v3 count];

  id v5 = +[AXSDSettings sharedInstance];
  id v6 = [v5 enabledKShotDetectorIdentifiers];
  unsigned int v7 = &v4[(void)[v6 count]];

  if (v7) {
    +[NSString localizedStringWithFormat:@"%li", v7];
  }
  else {
  unsigned int v8 = settingsLocString(@"NONE", @"SoundDetection");
  }

  return v8;
}

- (void)optOutCustomSoundRecognition:(id)a3
{
  unsigned int v4 = settingsLocString(@"OPT_OUT_SECURE_INTENT_CUSTOM_SOUND_TITLE", @"Accessibility-MedinaPreBoard");
  id v5 = AXLocStringKeyForModel();
  id v6 = settingsLocString(v5, @"Accessibility-MedinaPreBoard");
  id v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  unsigned int v7 = settingsLocString(@"OPT_OUT_SECURE_INTENT_CUSTOM_SOUND_CANCEL", @"Accessibility-MedinaPreBoard");
  unsigned int v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:&__block_literal_global_395];

  [v11 addAction:v8];
  id v9 = settingsLocString(@"OPT_OUT_SECURE_INTENT_CUSTOM_SOUND_OK", @"Accessibility-MedinaPreBoard");
  id v10 = +[UIAlertAction actionWithTitle:v9 style:2 handler:&__block_literal_global_400];

  [v11 addAction:v10];
  [(SoundDetectionController *)self presentViewController:v11 animated:1 completion:0];
}

void __57__SoundDetectionController_optOutCustomSoundRecognition___block_invoke_2(id a1, UIAlertAction *a2)
{
  id v2 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  [v2 setBool:0 forKey:20 completionHandler:&__block_literal_global_404];
}

void __57__SoundDetectionController_optOutCustomSoundRecognition___block_invoke_3(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "KShot Preboard Unenrolled completed with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_navigateToDataCollectionView:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Accessibility/DataCollectionStudies/SoundDetection"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[AXSDDetectorStore sharedInstance];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)SoundDetectionController;
  [(AccessibilitySettingsBaseController *)&v6 dealloc];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  unsigned int v7 = [(SoundDetectionController *)self specifierForIndexPath:a5];
  unsigned int v8 = [v7 propertyForKey:PSIDKey];
  unsigned int v9 = [v8 isEqualToString:@"Downloading"];

  if (v9) {
    [v10 setAccessibilityTraits:UIAccessibilityTraitStaticText];
  }
}

- (void)_reloadSettings
{
  BOOL v3 = +[AXSDDetectorStore sharedInstance];
  unsigned int v4 = [v3 hasInProgressDownloads];

  if ([(SoundDetectionController *)self _isFeatureEnabled]
    && ![(SoundDetectionController *)self assetsReady])
  {
    if (v4) {
      goto LABEL_9;
    }
    id v5 = +[AXSDDetectorStore sharedInstance];
    [v5 downloadDetectors];
    goto LABEL_8;
  }
  if (![(SoundDetectionController *)self _isFeatureEnabled] && ((v4 ^ 1) & 1) == 0)
  {
    id v5 = +[AXSDDetectorStore sharedInstance];
    [v5 stopDownloadOfDetectors];
LABEL_8:
  }
LABEL_9:
  [(SoundDetectionController *)self updateDetectorSpecifiersAnimated:1];
  [(SoundDetectionController *)self reloadSpecifierID:@"SoundDetection"];

  [(SoundDetectionController *)self reloadSpecifierID:@"Sounds"];
}

- (id)_internalSettingsButton
{
  BOOL v3 = +[UIImage systemImageNamed:@"gear"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v3 style:0 target:self action:"_internalSettingsPressed:"];

  return v4;
}

- (void)_internalSettingsPressed:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=Accessibility/Assets"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void)_showHeySiriConfirmationAlert
{
  BOOL v3 = settingsLocString(@"CONFIRMATION_ALERT_TITLE", @"SoundDetection");
  id v4 = settingsLocString(@"CONFIRMATION_ALERT_BODY", @"SoundDetection");
  id v5 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  objc_super v6 = settingsLocString(@"CONFIRMATION_ALERT_CANCEL", @"SoundDetection");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __57__SoundDetectionController__showHeySiriConfirmationAlert__block_invoke;
  v11[3] = &unk_208B68;
  v11[4] = self;
  unsigned int v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v11];

  unsigned int v8 = settingsLocString(@"CONFIRMATION_ALERT_OK", @"SoundDetection");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __57__SoundDetectionController__showHeySiriConfirmationAlert__block_invoke_2;
  v10[3] = &unk_208B68;
  void v10[4] = self;
  unsigned int v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v10];

  [v5 addAction:v7];
  [v5 addAction:v9];
  [(SoundDetectionController *)self presentViewController:v5 animated:1 completion:0];
}

id __57__SoundDetectionController__showHeySiriConfirmationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSettings];
}

id __57__SoundDetectionController__showHeySiriConfirmationAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableSoundDetection:1];
}

- (void)_showInternalDataCollectionAlert
{
  if (AXIsInternalInstall())
  {
    BOOL v3 = +[UIAlertController alertControllerWithTitle:@"Sound Detection False Positives" message:@"Enabling Data Collection allows us to record the audio that triggered any detectors you have enabled while the Sound Recognition feature is running. These recording can be used report False Positives via the Notification or here in Settings." preferredStyle:1];
    id v4 = +[UIAlertAction actionWithTitle:@"No" style:1 handler:&__block_literal_global_445];
    objc_initWeak(&location, self);
    objc_super v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    unsigned int v8 = __60__SoundDetectionController__showInternalDataCollectionAlert__block_invoke_2;
    unsigned int v9 = &unk_208F50;
    objc_copyWeak(&v10, &location);
    id v5 = +[UIAlertAction actionWithTitle:@"Learn More" style:0 handler:&v6];
    objc_msgSend(v3, "addAction:", v4, v6, v7, v8, v9);
    [v3 addAction:v5];
    [(SoundDetectionController *)self presentViewController:v3 animated:1 completion:&__block_literal_global_450_0];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __60__SoundDetectionController__showInternalDataCollectionAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _navigateToDataCollectionView:0];
}

void __60__SoundDetectionController__showInternalDataCollectionAlert__block_invoke_3(id a1)
{
}

- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6
{
  assetStatusSpecifier = self->_assetStatusSpecifier;
  id v11 = a4;
  [(PSSpecifier *)assetStatusSpecifier setAx_assetState:a3];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_asset:0];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetError:v11];

  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesReceived:a5];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesExpected:a6];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetUnarchivedFileSize:a6];
  id v12 = self->_assetStatusSpecifier;

  [(SoundDetectionController *)self reloadSpecifier:v12];
}

- (void)detectorsReadyForDetectorStore:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __59__SoundDetectionController_detectorsReadyForDetectorStore___block_invoke;
  v4[3] = &unk_208948;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __59__SoundDetectionController_detectorsReadyForDetectorStore___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateAssetStatusCell:error:downloaded:expected:", 4, 0, objc_msgSend(*(id *)(a1 + 40), "totalUnarchivedFileSize"), objc_msgSend(*(id *)(a1 + 40), "totalUnarchivedFileSize"));
  id v2 = +[AXSDSettings sharedInstance];
  id v3 = [v2 supportedSoundDetectionTypes];
  id v9 = +[NSSet setWithArray:v3];

  id v4 = +[AXSDSettings sharedInstance];
  id v5 = [v4 enabledSoundDetectionTypes];
  objc_super v6 = +[NSMutableSet setWithArray:v5];

  [v6 intersectSet:v9];
  uint64_t v7 = +[AXSDSettings sharedInstance];
  unsigned int v8 = [v6 allObjects];
  [v7 setEnabledSoundDetectionTypes:v8];

  [*(id *)(a1 + 32) setAssetsReady:1];
  [*(id *)(a1 + 32) _reloadSettings];
}

- (void)detectorStore:(id)a3 didFinishRefreshingDetectors:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = AXLogUltron();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    char v16 = objc_opt_class();
    id v17 = v16;
    *(_DWORD *)buf = 138413058;
    v24 = v16;
    __int16 v25 = 2048;
    id v26 = [v11 count];
    __int16 v27 = 1024;
    BOOL v28 = v7;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "[%@]: did finish refreshing detectors: %lu - was successful: %d - error: %@", buf, 0x26u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke;
  v18[3] = &unk_20ACA8;
  BOOL v22 = v7;
  id v19 = v10;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
}

id __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) totalUnarchivedFileSize];
  if (!*(unsigned char *)(a1 + 56))
  {
    id v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke_cold_1(a1, v11);
    }

    [*(id *)(a1 + 40) _updateAssetStatusCell:5 error:*(void *)(a1 + 48) downloaded:0 expected:v2];
    id v10 = *(id *)(a1 + 40);
    return objc_msgSend(v10, "_reloadSettings", *(_OWORD *)v14);
  }
  id v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "setAssetsReady:", objc_msgSend(*(id *)(a1 + 32), "areDetectorsReady"));
  if ([*(id *)(a1 + 40) _isFeatureEnabled]
    && [*v3 assetsReady])
  {
    [*v3 _updateAssetStatusCell:4 error:0 downloaded:0 expected:v2];
    id v4 = AXLogUltron();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v14 = 138412290;
      *(void *)&v14[4] = objc_opt_class();
      id v5 = *(id *)&v14[4];
      objc_super v6 = "[%@]: Feature enabled. Sound Detection assets are ready";
LABEL_15:
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, v6, v14, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  unsigned int v7 = [*v3 _isFeatureEnabled];
  unsigned int v8 = *v3;
  if (v7)
  {
    unsigned __int8 v9 = [v8 assetsReady];
    unsigned int v8 = *v3;
    if ((v9 & 1) == 0)
    {
      if (v8[208])
      {
        v8[208] = 0;
        [*(id *)(a1 + 32) downloadDetectors];
        [*(id *)(a1 + 40) _updateAssetStatusCell:2 error:0 downloaded:0 expected:v2];
        id v4 = AXLogUltron();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v14 = 138412290;
          *(void *)&v14[4] = objc_opt_class();
          id v5 = *(id *)&v14[4];
          objc_super v6 = "[%@]: Feature enabled. Sound Detection assets are not ready";
          goto LABEL_15;
        }
LABEL_16:

        id v10 = *v3;
        return objc_msgSend(v10, "_reloadSettings", *(_OWORD *)v14);
      }
    }
  }
  if (([v8 _isFeatureEnabled] & 1) == 0 && objc_msgSend(*v3, "assetsReady"))
  {
    [*v3 _updateAssetStatusCell:4 error:0 downloaded:0 expected:v2];
    id v4 = AXLogUltron();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v14 = 138412290;
      *(void *)&v14[4] = objc_opt_class();
      id v5 = *(id *)&v14[4];
      objc_super v6 = "[%@]: Sound Detection is not enabled but assets are still present on device";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v13 = AXLogUltron();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke_cold_2((uint64_t)v3, v13);
  }

  return [*v3 _updateAssetStatusCell:1 error:0 downloaded:0 expected:v2];
}

- (void)detectorStore:(id)a3 totalSizeExpected:(int64_t)a4 downloadProgressTotalWritten:(int64_t)a5 remainingTimeExpected:(double)a6 isStalled:(BOOL)a7
{
  id v11 = AXLogUltron();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SoundDetectionController detectorStore:totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:](a4, a5, v11);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __121__SoundDetectionController_detectorStore_totalSizeExpected_downloadProgressTotalWritten_remainingTimeExpected_isStalled___block_invoke;
  v12[3] = &unk_20ACD0;
  v12[5] = a5;
  v12[6] = a4;
  v12[4] = self;
  BOOL v13 = a7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

id __121__SoundDetectionController_detectorStore_totalSizeExpected_downloadProgressTotalWritten_remainingTimeExpected_isStalled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    uint64_t v5 = 4;
    uint64_t v3 = v2;
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 2;
  }
  return [v4 _updateAssetStatusCell:v5 error:0 downloaded:v2 expected:v3];
}

- (PSSpecifier)downloadSpecifier
{
  return self->_downloadSpecifier;
}

- (void)setDownloadSpecifier:(id)a3
{
}

- (PSSpecifier)soundDetectorsGroupSpecifier
{
  return self->_soundDetectorsGroupSpecifier;
}

- (void)setSoundDetectorsGroupSpecifier:(id)a3
{
}

- (PSSpecifier)soundDetectorsSpecifier
{
  return self->_soundDetectorsSpecifier;
}

- (void)setSoundDetectorsSpecifier:(id)a3
{
}

- (int64_t)percentDownloaded
{
  return self->_percentDownloaded;
}

- (void)setPercentDownloaded:(int64_t)a3
{
  self->_percentDownloaded = a3;
}

- (NSString)percentDownloadedFormatted
{
  return self->_percentDownloadedFormatted;
}

- (void)setPercentDownloadedFormatted:(id)a3
{
}

- (AXDispatchTimer)assetQueueTimer
{
  return self->_assetQueueTimer;
}

- (void)setAssetQueueTimer:(id)a3
{
}

- (NSDictionary)cachedDetectors
{
  return self->_cachedDetectors;
}

- (void)setCachedDetectors:(id)a3
{
}

- (BOOL)assetsReady
{
  return self->_assetsReady;
}

- (void)setAssetsReady:(BOOL)a3
{
  self->_assetsReady = a3;
}

- (PSSpecifier)enrollSpecifier
{
  return self->_enrollSpecifier;
}

- (void)setEnrollSpecifier:(id)a3
{
}

- (PSSpecifier)historySpecifier
{
  return self->_historySpecifier;
}

- (void)setHistorySpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historySpecifier, 0);
  objc_storeStrong((id *)&self->_enrollSpecifier, 0);
  objc_storeStrong((id *)&self->_cachedDetectors, 0);
  objc_storeStrong((id *)&self->_assetQueueTimer, 0);
  objc_storeStrong((id *)&self->_percentDownloadedFormatted, 0);
  objc_storeStrong((id *)&self->_soundDetectorsSpecifier, 0);
  objc_storeStrong((id *)&self->_soundDetectorsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_downloadSpecifier, 0);

  objc_storeStrong((id *)&self->_assetStatusSpecifier, 0);
}

void __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 48);
  int v7 = 138412546;
  unsigned int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  id v6 = v4;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%@]: refresh wasn't successful. error: %@", (uint8_t *)&v7, 0x16u);
}

void __91__SoundDetectionController_detectorStore_didFinishRefreshingDetectors_wasSuccessful_error___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[%@]: Sound Detection is not enabled. Nothing was matched in refresh assets function.", (uint8_t *)&v4, 0xCu);
}

- (void)detectorStore:(os_log_t)log totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "totalExpected: %lld, totalWritten: %lld", (uint8_t *)&v3, 0x16u);
}

@end