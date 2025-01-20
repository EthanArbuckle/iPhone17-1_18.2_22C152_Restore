@interface AXVoiceOverImageDescriptionsController
- (AXAsset)cachedAsset;
- (AXAssetController)assetController;
- (AXImageCaptionModelAssetPolicy)imageCaptionModelAssetPolicy;
- (BOOL)_isFeatureEnabled;
- (id)_additionalTranslationLanguagesValueSummary:(id)a3;
- (id)_validateAssetFromResults:(id)a3;
- (id)languageTranslator;
- (id)speakDiscoveredImageDescriptions:(id)a3;
- (id)specifiers;
- (void)_addSensitiveContentFeedbackSpecifiers:(id)a3;
- (void)_installLanguageTranslationModelForLanguageIfNeeded:(id)a3;
- (void)_optInToImageCaptionFeature;
- (void)_optOutOfImageCaptionFeature;
- (void)_showAdditionalLanguagesViewController:(id)a3;
- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6;
- (void)_updatePrimaryGroupFooterTextAndReloadSpecifier:(BOOL)a3;
- (void)_updateTranslationAssetStatus;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)setAssetController:(id)a3;
- (void)setCachedAsset:(id)a3;
- (void)setImageCaptionModelAssetPolicy:(id)a3;
- (void)setSpeakDiscoveredImageDescriptions:(id)a3 specifier:(id)a4;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AXVoiceOverImageDescriptionsController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)AXVoiceOverImageDescriptionsController;
  [(AXVoiceOverImageDescriptionsController *)&v13 viewDidLoad];
  [(AXVoiceOverImageDescriptionsController *)self _updateTranslationAssetStatus];
  v3 = [(AXVoiceOverImageDescriptionsController *)self imageCaptionModelAssetPolicy];
  v4 = +[AXAssetController assetControllerWithPolicy:v3 qosClass:25];
  assetController = self->_assetController;
  self->_assetController = v4;

  [(AXAssetController *)self->_assetController setUserInitiated:1];
  [(AXAssetController *)self->_assetController addObserver:self];
  self->_cachedVoiceOverImageCaptionsEnabled = [(AXVoiceOverImageDescriptionsController *)self _isFeatureEnabled];
  objc_initWeak(&location, self);
  v6 = +[AXSettings sharedInstance];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = __53__AXVoiceOverImageDescriptionsController_viewDidLoad__block_invoke;
  v10 = &unk_208798;
  objc_copyWeak(&v11, &location);
  [v6 registerUpdateBlock:&v7 forRetrieveSelector:"voiceOverImageCaptionsEnabled" withListener:self];

  objc_destroyWeak(&v11);
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 1, 0, 0, v7, v8, v9, v10);
  objc_destroyWeak(&location);
}

void __53__AXVoiceOverImageDescriptionsController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    unsigned int v2 = [WeakRetained _isFeatureEnabled];
    WeakRetained = v3;
    if (v3[240] != v2)
    {
      if (v2) {
        [v3 _optInToImageCaptionFeature];
      }
      else {
        [v3 _optOutOfImageCaptionFeature];
      }
      WeakRetained = v3;
      v3[240] = v2;
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    primaryGroupSpecifier = self->_primaryGroupSpecifier;
    self->_primaryGroupSpecifier = v6;
    uint64_t v8 = v6;

    [(AXVoiceOverImageDescriptionsController *)self _updatePrimaryGroupFooterTextAndReloadSpecifier:0];
    v9 = settingsLocString(@"IMAGE_DESCRIPTIONS_TITLE", @"VoiceOverSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setSpeakDiscoveredImageDescriptions:specifier:" get:"speakDiscoveredImageDescriptions:" detail:0 cell:6 edit:0];

    [v5 addObject:v10];
    preferenceToggleSpecifier = self->_preferenceToggleSpecifier;
    self->_preferenceToggleSpecifier = v10;
    v12 = v10;

    objc_super v13 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:-1 edit:0];

    [v13 setProperty:objc_opt_class() forKey:PSCellClassKey];
    objc_msgSend(v13, "setAx_assetState:", 0);
    [v5 addObject:v13];
    objc_storeStrong((id *)&self->_assetStatusSpecifier, v13);
    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDeleteButtonHidden:1];
    [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadButtonHidden:1];
    [(AXVoiceOverImageDescriptionsController *)self _addSensitiveContentFeedbackSpecifiers:v5];
    if (NSClassFromString(@"LTUITranslateSettingsDownloadController"))
    {
      v14 = +[PSSpecifier emptyGroupSpecifier];

      v15 = settingsLocString(@"IMAGE_DESCRIPTION_TRANSLATIONS_FOOTER", @"VoiceOverSettings");
      [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

      [v5 addObject:v14];
      v16 = settingsLocString(@"IMAGE_DESCRIPTION_TRANSLATIONS_TITLE", @"VoiceOverSettings");
      objc_super v13 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"_additionalTranslationLanguagesValueSummary:" detail:objc_opt_class() cell:2 edit:0];

      [v13 setButtonAction:"_showAdditionalLanguagesViewController:"];
      uint64_t v17 = PSIDKey;
      [v13 setProperty:@"AdditionalLanguages" forKey:PSIDKey];
      [v5 addObject:v13];
      objc_storeStrong((id *)&self->_additionalTranslationLanguagesLinkSpecifier, v13);
    }
    else
    {
      v18 = AXMediaLogLanguageTranslation();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AXVoiceOverImageDescriptionsController specifiers](v18);
      }

      uint64_t v17 = PSIDKey;
    }
    v19 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v19];
    v20 = settingsLocString(@"VO_APPLY_TO_APPS", @"VoiceOverSettings");
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v21 setProperty:@"apps" forKey:v17];
    [v5 addObject:v21];
    v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_showAdditionalLanguagesViewController:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)LTUITranslateSettingsDownloadController) initWithNibName:0 bundle:0];
  if (objc_opt_respondsToSelector()) {
    [v6 setValue:&off_229A80 forKey:@"usageContext"];
  }
  [v6 setParentController:self];
  v5 = [(AXVoiceOverImageDescriptionsController *)self rootController];
  [v6 setRootController:v5];

  [v6 setSpecifier:v4];
  [(AXVoiceOverImageDescriptionsController *)self showController:v6 animate:1];
}

- (id)languageTranslator
{
  languageTranslator = self->_languageTranslator;
  if (!languageTranslator)
  {
    id v4 = (AXMLanguageTranslator *)objc_alloc_init((Class)AXMLanguageTranslator);
    v5 = self->_languageTranslator;
    self->_languageTranslator = v4;

    languageTranslator = self->_languageTranslator;
  }

  return languageTranslator;
}

- (void)_installLanguageTranslationModelForLanguageIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = AXMediaLogLanguageTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Checking if Preferences should install translation model for: %@", (uint8_t *)&v7, 0xCu);
  }

  if ([(AXVoiceOverImageDescriptionsController *)self _isFeatureEnabled])
  {
    id v6 = [(AXVoiceOverImageDescriptionsController *)self languageTranslator];
    [v6 installOfflineTranslationModelForLanguageCodeIfNeeded:v4 progress:&__block_literal_global_36 completion:&__block_literal_global_336];
  }
  else
  {
    id v6 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Image descriptions not enabled. Will not download translation assets", (uint8_t *)&v7, 2u);
    }
  }
}

void __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke(id a1, NSArray *a2, NSError *a3)
{
  id v4 = a2;
  v5 = a3;
  if (v5)
  {
    id v6 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_cold_2((uint64_t)v5, v6);
    }
  }
  int v7 = AXMediaLogLanguageTranslation();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    v9 = [(NSArray *)v4 ax_flatMappedArrayUsingBlock:&__block_literal_global_324];
    v10 = AXMediaLogLanguageTranslation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_cold_1(v9, v10);
    }
  }
}

id __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_321(id a1, AXMTranslationModelInstallStatus *a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = [(AXMTranslationModelInstallStatus *)v2 localeIdentifier];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(AXMTranslationModelInstallStatus *)v2 state]];
  id v5 = [(AXMTranslationModelInstallStatus *)v2 progress];

  id v6 = +[NSNumber numberWithLongLong:v5];
  int v7 = +[NSString stringWithFormat:@"[id: %@ state:%@ progress:%@]", v3, v4, v6];

  return v7;
}

void __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_333(id a1, NSError *a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = AXMediaLogLanguageTranslation();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_333_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Translation asset installation finished successfully", v5, 2u);
  }
}

- (void)_updateTranslationAssetStatus
{
  uint64_t v3 = [(AXVoiceOverImageDescriptionsController *)self languageTranslator];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __71__AXVoiceOverImageDescriptionsController__updateTranslationAssetStatus__block_invoke;
  v4[3] = &unk_20AC00;
  v4[4] = self;
  [v3 installedTranslationLocales:v4];
}

void __71__AXVoiceOverImageDescriptionsController__updateTranslationAssetStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __71__AXVoiceOverImageDescriptionsController__updateTranslationAssetStatus__block_invoke_2;
  v5[3] = &unk_208948;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void *__71__AXVoiceOverImageDescriptionsController__updateTranslationAssetStatus__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), *(id *)(a1 + 40));
  result = *(void **)(a1 + 32);
  if (result[29])
  {
    return objc_msgSend(result, "reloadSpecifier:");
  }
  return result;
}

- (id)_additionalTranslationLanguagesValueSummary:(id)a3
{
  id v3 = [(NSArray *)self->_installedTranslationLocales ax_filteredArrayUsingBlock:&__block_literal_global_340];
  id v4 = (char *)[v3 count];
  if (v4)
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      id v5 = [v3 firstObject];
      id v6 = [v5 localeIdentifier];
      if ([(__CFString *)v6 hasPrefix:@"ar"])
      {

        id v6 = @"ar";
      }
      int v7 = +[IPLanguage languageWithIdentifier:v6];
      BOOL v8 = [v7 localizedStringForName];
    }
    else
    {
      id v5 = settingsLocString(@"IMAGE_DESCRIPTION_TRANSLATIONS_INSTALLED_LANGUAGE_COUNT", @"VoiceOverSettings");
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, [v3 count]);
      BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v8 = &stru_20F6B8;
  }

  return v8;
}

BOOL __86__AXVoiceOverImageDescriptionsController__additionalTranslationLanguagesValueSummary___block_invoke(id a1, NSLocale *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(NSLocale *)a2 localeIdentifier];
  char v5 = [v4 hasPrefix:@"en"] ^ 1;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AXVoiceOverImageDescriptionsController specifierAtIndex:](self, "specifierAtIndex:", -[AXVoiceOverImageDescriptionsController indexOfGroup:](self, "indexOfGroup:", [v7 section]));
  v9 = [(AXVoiceOverImageDescriptionsController *)self specifierAtIndexPath:v7];
  uint64_t v10 = PSIDKey;
  id v11 = [v8 propertyForKey:PSIDKey];
  unsigned int v12 = [v11 isEqualToString:@"SensitiveContentGroup"];

  objc_super v13 = [v9 propertyForKey:v10];
  v14 = v13;
  if (v12)
  {
    v15 = +[AXSettings sharedInstance];
    id v16 = [v15 voiceOverDiscoveredSensitiveContentFeedback];

    if ([v14 isEqualToString:@"SensitiveContentSpeak"])
    {
      id v16 = 0;
    }
    else if ([v14 isEqualToString:@"SensitiveContentPlaySound"])
    {
      id v16 = &dword_0 + 1;
    }
    else if ([v14 isEqualToString:@"SensitiveContentDoNothing"])
    {
      id v16 = &dword_0 + 2;
    }
    v20 = +[AXSettings sharedInstance];
    [v20 setVoiceOverDiscoveredSensitiveContentFeedback:v16];

    goto LABEL_11;
  }
  unsigned int v17 = [v13 isEqualToString:@"apps"];

  if (!v17)
  {
LABEL_11:
    v21.receiver = self;
    v21.super_class = (Class)AXVoiceOverImageDescriptionsController;
    [(AXVoiceOverImageDescriptionsController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
    goto LABEL_12;
  }
  v18 = objc_alloc_init(AXAppSelectionController);
  v19 = [(AXVoiceOverImageDescriptionsController *)self rootController];
  [(AXAppSelectionController *)v18 setRootController:v19];

  [(AXAppSelectionController *)v18 setSpecifier:v9];
  [(AXAppSelectionController *)v18 setParentController:self];
  [(AXAppSelectionController *)v18 setIncludesHomeScreen:0];
  [(AXAppSelectionController *)v18 setGetUnselectedApps:&__block_literal_global_365];
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __76__AXVoiceOverImageDescriptionsController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v22[3] = &unk_209698;
  objc_copyWeak(&v23, &location);
  [(AXAppSelectionController *)v18 setSetUnselectedApps:v22];
  [(AXVoiceOverImageDescriptionsController *)self showController:v18 animate:1];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

LABEL_12:
}

NSSet *__cdecl __76__AXVoiceOverImageDescriptionsController_tableView_didSelectRowAtIndexPath___block_invoke(id a1)
{
  v1 = +[AXSettings sharedInstance];
  unsigned int v2 = [v1 imageCaptioningDisabledApps];

  if (v2)
  {
    id v3 = +[NSSet setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSSet *)v3;
}

void __76__AXVoiceOverImageDescriptionsController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 allObjects];

  char v5 = +[AXSettings sharedInstance];
  [v5 setImageCaptioningDisabledApps:v4];

  [WeakRetained reloadSpecifierID:@"apps"];
}

- (BOOL)_isFeatureEnabled
{
  unsigned int v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 voiceOverImageCaptionsEnabled];

  return v3;
}

- (AXImageCaptionModelAssetPolicy)imageCaptionModelAssetPolicy
{
  imageCaptionModelAssetPolicy = self->_imageCaptionModelAssetPolicy;
  if (!imageCaptionModelAssetPolicy)
  {
    id v4 = +[AXImageCaptionModelAssetPolicy policy];
    char v5 = self->_imageCaptionModelAssetPolicy;
    self->_imageCaptionModelAssetPolicy = v4;

    imageCaptionModelAssetPolicy = self->_imageCaptionModelAssetPolicy;
  }

  return imageCaptionModelAssetPolicy;
}

- (void)_updatePrimaryGroupFooterTextAndReloadSpecifier:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = AXLocStringKeyForModel();
  id v6 = settingsLocString(v5, @"VoiceOverSettings");
  id v7 = [v6 mutableCopy];

  [(PSSpecifier *)self->_primaryGroupSpecifier setProperty:v7 forKey:PSFooterTextGroupKey];
  if (v3) {
    [(AXVoiceOverImageDescriptionsController *)self reloadSpecifier:self->_primaryGroupSpecifier];
  }
}

- (void)_updateAssetStatusCell:(int64_t)a3 error:(id)a4 downloaded:(int64_t)a5 expected:(int64_t)a6
{
  assetStatusSpecifier = self->_assetStatusSpecifier;
  id v11 = a4;
  [(PSSpecifier *)assetStatusSpecifier setAx_assetState:a3];
  unsigned int v12 = [(AXVoiceOverImageDescriptionsController *)self cachedAsset];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_asset:v12];

  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetError:v11];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesReceived:a5];
  [(PSSpecifier *)self->_assetStatusSpecifier setAx_assetDownloadBytesExpected:a6];
  objc_super v13 = self->_assetStatusSpecifier;

  [(AXVoiceOverImageDescriptionsController *)self reloadSpecifier:v13];
}

- (void)_optInToImageCaptionFeature
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Image descriptions feature toggled on but cannot check for translation assets. VoiceOver language was nil", v1, 2u);
}

- (void)_optOutOfImageCaptionFeature
{
  id v4 = +[AXImageCaptionModelAssetPolicy assertionForNewsestCompatibleImageCaptionModelAssetWithStage:@"Stable" language:@"en" clientIdentifier:@"VoiceOver"];
  BOOL v3 = +[AXAssetMetadataStore store];
  [v3 discardAssertion:v4];

  [(AXVoiceOverImageDescriptionsController *)self _updatePrimaryGroupFooterTextAndReloadSpecifier:1];
}

- (id)_validateAssetFromResults:(id)a3
{
  id v3 = a3;
  id v4 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v3 withStage:@"Stable" language:@"en" isInstalled:1 isDownloadable:0];
  if (!v4)
  {
    id v4 = +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:v3 withStage:@"Stable" language:@"en" isInstalled:0 isDownloadable:1];
  }

  return v4;
}

- (void)setSpeakDiscoveredImageDescriptions:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverImageCaptionsEnabled:v4];
}

- (id)speakDiscoveredImageDescriptions:(id)a3
{
  BOOL v3 = [(AXVoiceOverImageDescriptionsController *)self _isFeatureEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_addSensitiveContentFeedbackSpecifiers:(id)a3
{
  id v15 = a3;
  BOOL v3 = settingsLocString(@"SENSITIVE_CONTENT_FEEDBACK_TITLE", @"VoiceOverSettings");
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  uint64_t v5 = PSIDKey;
  [v4 setProperty:@"SensitiveContentGroup" forKey:PSIDKey];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  id v6 = settingsLocString(@"SENSITIVE_CONTENT_FEEDBACK_FOOTER", @"VoiceOverSettings");
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v15 addObject:v4];
  id v7 = +[AXSettings sharedInstance];
  BOOL v8 = (char *)[v7 voiceOverDiscoveredSensitiveContentFeedback];

  v9 = settingsLocString(@"FEEDBACK_SPEAK", @"VoiceOverSettings");
  uint64_t v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v10 setProperty:@"SensitiveContentSpeak" forKey:v5];
  if (!v8) {
    [v4 setProperty:v10 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v15 addObject:v10];
  id v11 = settingsLocString(@"FEEDBACK_PLAY_TONE", @"VoiceOverSettings");
  unsigned int v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v12 setProperty:@"SensitiveContentPlaySound" forKey:v5];
  if (v8 == (unsigned char *)&dword_0 + 1) {
    [v4 setProperty:v12 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v15 addObject:v12];
  objc_super v13 = settingsLocString(@"FEEDBACK_DO_NOTHING", @"VoiceOverSettings");
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v14 setProperty:@"SensitiveContentDoNothing" forKey:v5];
  if (v8 == (unsigned char *)&dword_0 + 2) {
    [v4 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [v15 addObject:v14];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __104__AXVoiceOverImageDescriptionsController_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
  v12[3] = &unk_20ACA8;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = a6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

void __104__AXVoiceOverImageDescriptionsController_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  BOOL v3 = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 _validateAssetFromResults:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setCachedAsset:v4];

    uint64_t v5 = [*(id *)(a1 + 32) cachedAsset];

    BOOL v3 = *(unsigned char **)(a1 + 32);
    if (v5)
    {
      id v6 = [v3 cachedAsset];
      unsigned int v7 = [v6 isInstalled];

      BOOL v3 = *(unsigned char **)(a1 + 32);
      if (v7)
      {
        [v3 _updateAssetStatusCell:4 error:0 downloaded:0 expected:0];
        BOOL v8 = AXLogAssetLoader();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = [*(id *)(a1 + 32) cachedAsset];
          *(_DWORD *)buf = 138412290;
          v18 = v9;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Image caption model is installed: %@", buf, 0xCu);
        }
LABEL_12:

        return;
      }
      if (v3[184])
      {
        v3[184] = 0;
        [*(id *)(a1 + 32) _updateAssetStatusCell:2 error:0 downloaded:0 expected:0];
        unsigned int v12 = AXLogAssetLoader();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Image caption model requested. Beginning download", buf, 2u);
        }

        id v13 = *(void **)(a1 + 32);
        id v14 = (void *)v13[31];
        BOOL v8 = [v13 cachedAsset];
        id v16 = v8;
        BOOL v15 = +[NSArray arrayWithObjects:&v16 count:1];
        [v14 downloadAssets:v15 successStartBlock:&__block_literal_global_401];

        goto LABEL_12;
      }
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 5;
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = 5;
  }

  [v3 _updateAssetStatusCell:v11 error:v10 downloaded:0 expected:0];
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __139__AXVoiceOverImageDescriptionsController_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke;
  v8[3] = &unk_20ACD0;
  BOOL v9 = a7;
  v8[4] = self;
  v8[5] = a5;
  v8[6] = a6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

id __139__AXVoiceOverImageDescriptionsController_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 2;
  }
  return [*(id *)(a1 + 32) _updateAssetStatusCell:v1 error:0 downloaded:*(void *)(a1 + 40) expected:*(void *)(a1 + 48)];
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __126__AXVoiceOverImageDescriptionsController_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke;
  block[3] = &unk_2094C8;
  BOOL v10 = a5;
  block[4] = self;
  id v9 = a6;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __126__AXVoiceOverImageDescriptionsController_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = 4;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = 5;
  }
  return [v3 _updateAssetStatusCell:v4 error:v5 downloaded:0 expected:0];
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (void)setImageCaptionModelAssetPolicy:(id)a3
{
}

- (AXAsset)cachedAsset
{
  return self->_cachedAsset;
}

- (void)setCachedAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAsset, 0);
  objc_storeStrong((id *)&self->_imageCaptionModelAssetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_additionalTranslationLanguagesLinkSpecifier, 0);
  objc_storeStrong((id *)&self->_installedTranslationLocales, 0);
  objc_storeStrong((id *)&self->_languageTranslator, 0);
  objc_storeStrong((id *)&self->_assetStatusSpecifier, 0);
  objc_storeStrong((id *)&self->_preferenceToggleSpecifier, 0);

  objc_storeStrong((id *)&self->_primaryGroupSpecifier, 0);
}

- (void)specifiers
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Cannot show translation specifiers. LTUITranslateSettingsDownloadController not found at runtime", v1, 2u);
}

void __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_cold_1(void *a1, NSObject *a2)
{
  BOOL v3 = [a1 componentsJoinedByString:@" "];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Translation asset installation status: %@", (uint8_t *)&v4, 0xCu);
}

void __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Translation asset installation progress error: %@", (uint8_t *)&v2, 0xCu);
}

void __94__AXVoiceOverImageDescriptionsController__installLanguageTranslationModelForLanguageIfNeeded___block_invoke_333_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Translation asset installation finished with failure: %@", (uint8_t *)&v2, 0xCu);
}

@end