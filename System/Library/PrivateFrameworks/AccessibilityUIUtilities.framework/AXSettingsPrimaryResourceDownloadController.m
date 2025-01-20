@interface AXSettingsPrimaryResourceDownloadController
- (AXLangMap)languageMap;
- (AXSettingsPrimaryResourceDownloadController)init;
- (BOOL)hideLanguageInDialect;
- (BOOL)showDialectInTitle;
- (BOOL)showDialectPicker;
- (BOOL)showNeural;
- (BOOL)showNeuralAX;
- (BOOL)showPersonalVoices;
- (BOOL)showSpeakingRate;
- (Class)speakingRateSliderCell;
- (NSMutableArray)voiceFootprints;
- (NSString)language;
- (UIActivityIndicatorView)progressIndicator;
- (UIView)loadingView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (float)speakingRate;
- (id)_getSelectedVariation:(id)a3;
- (id)_internalSpecifiers;
- (id)_speakingRate:(id)a3;
- (id)getSpeakingRateCallback;
- (id)setSpeakingRateCallback;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_prepareVoiceFootprints;
- (void)_setSpeakingRate:(id)a3 specifier:(id)a4;
- (void)_updateSpeakingRate;
- (void)addVoiceFootprintsToArray:(id)a3 forDialect:(id)a4;
- (void)createVoiceFootprints;
- (void)dealloc;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGetSpeakingRateCallback:(id)a3;
- (void)setHideLanguageInDialect:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLanguageMap:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSetSpeakingRateCallback:(id)a3;
- (void)setShowDialectInTitle:(BOOL)a3;
- (void)setShowDialectPicker:(BOOL)a3;
- (void)setShowNeural:(BOOL)a3;
- (void)setShowNeuralAX:(BOOL)a3;
- (void)setShowPersonalVoices:(BOOL)a3;
- (void)setShowSpeakingRate:(BOOL)a3;
- (void)setSpeakingRate:(float)a3;
- (void)setSpeakingRateCallbackBlock:(id)a3;
- (void)setSpeakingRateSliderCell:(Class)a3;
- (void)setVoiceFootprints:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXSettingsPrimaryResourceDownloadController

- (AXSettingsPrimaryResourceDownloadController)init
{
  v16.receiver = self;
  v16.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  v2 = [(AXSettingsResourceDownloadController *)&v16 init];
  objc_initWeak(&location, v2);
  v3 = [MEMORY[0x1E4F49458] sharedInstance];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __51__AXSettingsPrimaryResourceDownloadController_init__block_invoke;
  v13 = &unk_1E649BDA8;
  objc_copyWeak(&v14, &location);
  [v3 registerUpdateBlock:&v10 forRetrieveSelector:sel_voiceOverSpeakingRateForLanguage_ withListener:v2];

  objc_destroyWeak(&v14);
  dispatch_queue_t v4 = dispatch_queue_create("load_voice_footprints_queue", 0);
  loadVoiceFootprintsQueue = v2->_loadVoiceFootprintsQueue;
  v2->_loadVoiceFootprintsQueue = (OS_dispatch_queue *)v4;

  v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  voiceFootprintLock = v2->_voiceFootprintLock;
  v2->_voiceFootprintLock = v6;

  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v10, v11, v12, v13);
  [(AXSettingsPrimaryResourceDownloadController *)v2 setVoiceFootprints:v8];

  objc_destroyWeak(&location);
  return v2;
}

void __51__AXSettingsPrimaryResourceDownloadController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpeakingRate];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  [(AXUISettingsSetupCapableListController *)&v10 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E649BDA8;
  objc_copyWeak(&v8, &location);
  [v3 setResourceCacheDidReceiveUpdateCallback:v7];

  dispatch_queue_t v4 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_3;
  v5[3] = &unk_1E649BDA8;
  objc_copyWeak(&v6, &location);
  [v4 setSelectedVoiceDidUpdateCallback:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)WeakRetained[192];
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E649BDA8;
    dispatch_queue_t v4 = v3;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }
}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createVoiceFootprints];
}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  [(AXSettingsPrimaryResourceDownloadController *)&v9 viewWillAppear:a3];
  if ([(AXSettingsPrimaryResourceDownloadController *)self showDialectInTitle])
  {
    dispatch_queue_t v4 = [MEMORY[0x1E4F49440] sharedInstance];
    v5 = [(AXSettingsPrimaryResourceDownloadController *)self language];
    id v6 = [v4 dialectForLanguageID:v5];
    v7 = [v6 languageNameAndLocaleInCurrentLocale];
    [(AXSettingsPrimaryResourceDownloadController *)self setTitle:v7];
  }
  else
  {
    dispatch_queue_t v4 = [(AXSettingsPrimaryResourceDownloadController *)self languageMap];
    v5 = [v4 defaultDialect];
    id v6 = [v5 languageNameInCurrentLocale];
    [(AXSettingsPrimaryResourceDownloadController *)self setTitle:v6];
  }

  [(AXSettingsPrimaryResourceDownloadController *)self reloadSpecifiers];
  id v8 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v8 refreshAssetCatalog:1 downloadSamplesIfNeeded:1 restartMigrationIfNeeded:1];
}

- (void)dealloc
{
  v3 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v3 setResourceCacheDidReceiveUpdateCallback:0];

  v4.receiver = self;
  v4.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  [(AXUISettingsListController *)&v4 dealloc];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_updateSpeakingRate
{
  id v3 = [(AXUISettingsListController *)self specifierForKey:@"SpeakingRate"];
  [(AXSettingsPrimaryResourceDownloadController *)self reloadSpecifier:v3 animated:1];
}

- (NSString)language
{
  language = self->_language;
  if (language)
  {
    id v3 = language;
  }
  else
  {
    objc_super v4 = [(AXSettingsPrimaryResourceDownloadController *)self specifier];
    v5 = [v4 propertyForKey:&stru_1F1F0EB90];
    AXCLanguageConvertToCanonicalForm();
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setLanguage:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_language, a3);
  if (self->_language)
  {
    v5 = AXCLanguageConvertToCanonicalForm();
    id v6 = [MEMORY[0x1E4F49440] sharedInstance];
    v7 = [v6 dialectForLanguageID:v5];
    id v8 = [v7 langMap];

    [(AXSettingsPrimaryResourceDownloadController *)self setLanguageMap:v8];
  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  v7 = (void *)MEMORY[0x1E4F28D58];
  id v8 = a4;
  id v9 = [v7 indexPathForRow:0 inSection:a5];
  objc_super v10 = [(AXSettingsPrimaryResourceDownloadController *)self specifierAtIndexPath:v9];
  id v12 = [(AXSettingsPrimaryResourceDownloadController *)self getGroupSpecifierForSpecifier:v10];

  uint64_t v11 = [v12 name];
  [v8 setAccessibilityLabel:v11];

  [v8 _accessibilitySetBoolValue:1 forKey:@"SkipConvertToLowercase"];
}

- (id)_getSelectedVariation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AXSettingsResourceDownloadController *)self getDialectPreferencesCallback];

  if (v5)
  {
    id v6 = [(AXSettingsResourceDownloadController *)self getDialectPreferencesCallback];
    v7 = v6[2]();
  }
  else
  {
    v7 = 0;
  }
  id v8 = [v4 propertyForKey:@"Resources"];
  if ((unint64_t)[v8 count] < 2)
  {
    v18 = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      id v22 = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = [v14 voiceId];
          int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            if ([MEMORY[0x1E4FAF288] isSiriVoiceIdentifier:v7])
            {
              v17 = [v14 voiceId];
              v18 = AXSiriDisplayNameForIdentifier();

              if (v18) {
                goto LABEL_26;
              }
            }
            if ([v14 type] == 9)
            {
              uint64_t v19 = [v14 localizedName];
LABEL_25:
              v18 = (void *)v19;
LABEL_26:
              id v4 = v22;
              goto LABEL_27;
            }
            if ([v14 footprint] == 4)
            {
              v20 = @"VOICE_QUICK_SUMMARY_ENHANCED";
LABEL_24:
              uint64_t v19 = AXUILocalizedStringForKey(v20);
              goto LABEL_25;
            }
            if ([v14 footprint] == 5)
            {
              v20 = @"VOICE_QUICK_SUMMARY_PREMIUM";
              goto LABEL_24;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        v18 = 0;
        id v4 = v22;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_27:
  }
  return v18;
}

- (void)createVoiceFootprints
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_voiceFootprintLock lock];
  self->_loadingVoiceFootprints = 1;
  [(NSLock *)self->_voiceFootprintLock unlock];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(AXSettingsPrimaryResourceDownloadController *)self showDialectPicker];
  v5 = [MEMORY[0x1E4F49440] sharedInstance];
  id v6 = v5;
  if (v4)
  {
    v7 = [v5 systemLanguageID];
    id v8 = [v7 lowercaseString];
    int v9 = [v8 hasPrefix:@"yue"];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F49440] sharedInstance];
      uint64_t v11 = [v10 systemLanguageID];
      uint64_t v12 = AXCRemapLanguageCodeToFallbackIfNeccessary();

      v13 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v13];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    v17 = [v14 localeIdentifier];

    v18 = [(AXSettingsPrimaryResourceDownloadController *)self languageMap];
    uint64_t v19 = AXSortedDialectsForDisplay(v18, v17);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [(AXSettingsPrimaryResourceDownloadController *)self addVoiceFootprintsToArray:v3 forDialect:*(void *)(*((void *)&v26 + 1) + 8 * v24++)];
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v22);
    }
  }
  else
  {
    v15 = [(AXSettingsPrimaryResourceDownloadController *)self language];
    int v16 = [v6 dialectForLanguageID:v15];

    [(AXSettingsPrimaryResourceDownloadController *)self addVoiceFootprintsToArray:v3 forDialect:v16];
  }
  [(NSLock *)self->_voiceFootprintLock lock];
  [(AXSettingsPrimaryResourceDownloadController *)self setVoiceFootprints:v3];
  [(NSLock *)self->_voiceFootprintLock unlock];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AXSettingsPrimaryResourceDownloadController_createVoiceFootprints__block_invoke;
  block[3] = &unk_1E649BED8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __68__AXSettingsPrimaryResourceDownloadController_createVoiceFootprints__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = *(void **)(a1 + 32);
  return [v2 restoreDownloadProgress];
}

- (void)addVoiceFootprintsToArray:(id)a3 forDialect:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXSettingsResourceDownloadController *)self getDialectPreferencesCallback];

  if (v8)
  {
    int v9 = [(AXSettingsResourceDownloadController *)self getDialectPreferencesCallback];
    v9[2]();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v10 = [(AXSettingsResourceDownloadController *)self speechModelController];
  objc_msgSend(v10, "addVoiceFootprintsToArray:dialect:selectedVoiceId:showSiriNeuralVoices:showNeuralAXVoices:", v7, v6, v11, -[AXSettingsPrimaryResourceDownloadController showNeural](self, "showNeural"), -[AXSettingsPrimaryResourceDownloadController showNeuralAX](self, "showNeuralAX"));
}

- (void)_setSpeakingRate:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  p_speakingRate = &self->_speakingRate;
  self->_speakingRate = v6;
  id v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[AXSettingsPrimaryResourceDownloadController _setSpeakingRate:specifier:](&self->_speakingRate, v7);
  }

  if (fabsf(*p_speakingRate + -0.5) < 0.03 && ([(UISlider *)self->_speechRateSlider isTracking] & 1) == 0)
  {
    LODWORD(v8) = 0.5;
    [(UISlider *)self->_speechRateSlider setValue:1 animated:v8];
    float *p_speakingRate = 0.5;
  }
  setSpeakingRateCallback = (void (**)(float))self->_setSpeakingRateCallback;
  if (setSpeakingRateCallback) {
    setSpeakingRateCallback[2](*p_speakingRate);
  }
}

- (id)_speakingRate:(id)a3
{
  BOOL v4 = NSNumber;
  if (self->_getSpeakingRateCallback)
  {
    v5 = [(AXSettingsPrimaryResourceDownloadController *)self getSpeakingRateCallback];
    v5[2]();
    float v6 = objc_msgSend(v4, "numberWithFloat:");
  }
  else
  {
    *(float *)&double v3 = self->_speakingRate;
    float v6 = objc_msgSend(NSNumber, "numberWithFloat:", a3, v3);
  }
  return v6;
}

- (BOOL)showSpeakingRate
{
  return self->_showSpeakingRate;
}

- (void)setShowSpeakingRate:(BOOL)a3
{
  self->_showSpeakingRate = a3;
}

- (void)setSpeakingRate:(float)a3
{
  self->_speakingRate = a3;
}

- (void)setSpeakingRateCallbackBlock:(id)a3
{
  self->_setSpeakingRateCallback = (id)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)_prepareVoiceFootprints
{
  double v3 = [(AXSettingsPrimaryResourceDownloadController *)self language];
  BOOL v4 = AXCLanguageConvertToCanonicalForm();

  v5 = [MEMORY[0x1E4F49440] sharedInstance];
  float v6 = [v5 dialectForLanguageID:v4];

  id v7 = [v6 langMap];
  [(AXSettingsPrimaryResourceDownloadController *)self setLanguageMap:v7];
  double v8 = [(AXSettingsPrimaryResourceDownloadController *)self language];
  char v9 = [v4 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    [(AXSettingsPrimaryResourceDownloadController *)self setLanguage:v4];
  }
  [(NSLock *)self->_voiceFootprintLock lock];
  uint64_t v10 = [(AXSettingsPrimaryResourceDownloadController *)self voiceFootprints];
  if ([v10 count])
  {
  }
  else
  {
    BOOL loadingVoiceFootprints = self->_loadingVoiceFootprints;

    if (!loadingVoiceFootprints)
    {
      [(NSLock *)self->_voiceFootprintLock unlock];
      loadVoiceFootprintsQueue = self->_loadVoiceFootprintsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__AXSettingsPrimaryResourceDownloadController__prepareVoiceFootprints__block_invoke;
      block[3] = &unk_1E649BED8;
      void block[4] = self;
      dispatch_async(loadVoiceFootprintsQueue, block);
    }
  }
  [(NSLock *)self->_voiceFootprintLock unlock];
}

uint64_t __70__AXSettingsPrimaryResourceDownloadController__prepareVoiceFootprints__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createVoiceFootprints];
}

- (id)specifiers
{
  v62[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    [(AXSettingsPrimaryResourceDownloadController *)self _prepareVoiceFootprints];
    [(NSLock *)self->_voiceFootprintLock lock];
    v5 = [(AXSettingsPrimaryResourceDownloadController *)self voiceFootprints];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"AXSettingsVoicesAvailableForSelection" object:0];

      double v8 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
      [v8 stopAnimating];

      char v9 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
      [v9 removeFromSuperview];

      [(AXSettingsPrimaryResourceDownloadController *)self setLoadingView:0];
    }
    else
    {
      uint64_t v10 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];

      if (!v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        [(AXSettingsPrimaryResourceDownloadController *)self setLoadingView:v11];

        uint64_t v12 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v14 = AXUILocalizedStringForKey(@"voices.loading");
        [v13 setText:v14];

        v15 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
        [v13 setFont:v15];

        int v16 = [MEMORY[0x1E4FB1618] clearColor];
        [v13 setBackgroundColor:v16];

        v17 = [MEMORY[0x1E4FB1618] grayColor];
        [v13 setTextColor:v17];

        [v13 setNumberOfLines:0];
        [v13 setAdjustsFontForContentSizeCategory:1];
        [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
        v18 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        uint64_t v19 = v13;
        [v18 addSubview:v13];

        id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [(AXSettingsPrimaryResourceDownloadController *)self setProgressIndicator:v20];

        uint64_t v21 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

        uint64_t v22 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        uint64_t v23 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        [v22 addSubview:v23];

        uint64_t v24 = [(AXSettingsPrimaryResourceDownloadController *)self view];
        long long v25 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        [v24 addSubview:v25];

        long long v26 = [(AXSettingsPrimaryResourceDownloadController *)self view];
        long long v27 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        [v26 bringSubviewToFront:v27];

        v50 = (void *)MEMORY[0x1E4F28DC8];
        v61 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        v59 = [v61 centerXAnchor];
        v60 = [(AXSettingsPrimaryResourceDownloadController *)self view];
        v58 = [v60 centerXAnchor];
        v57 = [v59 constraintEqualToAnchor:v58];
        v62[0] = v57;
        v56 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        v54 = [v56 centerYAnchor];
        v55 = [(AXSettingsPrimaryResourceDownloadController *)self view];
        v53 = [v55 centerYAnchor];
        v52 = [v54 constraintEqualToAnchor:v53];
        v62[1] = v52;
        v49 = [v19 leadingAnchor];
        v51 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        v48 = [v51 leadingAnchor];
        v46 = [v49 constraintEqualToSystemSpacingAfterAnchor:v48 multiplier:1.0];
        v62[2] = v46;
        v45 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        v44 = [v45 leadingAnchor];
        v47 = v19;
        v43 = [v19 trailingAnchor];
        v42 = [v44 constraintEqualToSystemSpacingAfterAnchor:v43 multiplier:1.0];
        v62[3] = v42;
        v41 = [(AXSettingsPrimaryResourceDownloadController *)self loadingView];
        v40 = [v41 trailingAnchor];
        long long v28 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        long long v29 = [v28 trailingAnchor];
        v30 = [v40 constraintEqualToSystemSpacingAfterAnchor:v29 multiplier:1.0];
        v62[4] = v30;
        uint64_t v31 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        v32 = [v31 centerYAnchor];
        v33 = [v19 centerYAnchor];
        v34 = [v32 constraintEqualToAnchor:v33];
        v62[5] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:6];
        [v50 activateConstraints:v35];

        v36 = [(AXSettingsPrimaryResourceDownloadController *)self progressIndicator];
        [v36 startAnimating];
      }
    }
    v37 = [(AXSettingsPrimaryResourceDownloadController *)self _internalSpecifiers];
    v38 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3) = v37;

    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_internalSpecifiers
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke;
  aBlock[3] = &unk_1E649C1A0;
  aBlock[4] = self;
  uint64_t v3 = (char *)_Block_copy(aBlock);
  v62 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(AXSettingsPrimaryResourceDownloadController *)self voiceFootprints];
  v58 = (void *)v5;
  +[AXSpeechSettingsModelController partitionVoiceFootprints:v7 intoStandardVoices:v4 noveltyVoices:v5 personalVoices:v6];

  v56 = v6;
  if ([(AXSettingsPrimaryResourceDownloadController *)self showPersonalVoices]
    && [v6 count])
  {
    double v8 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"PersonalVoicesGroup"];
    [v62 addObject:v8];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v72 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (*((void (**)(char *, void))v3 + 2))(v3, *(void *)(*((void *)&v71 + 1) + 8 * i));
          [v62 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v11);
    }
  }
  v57 = self;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v4;
  uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v17 = 0;
    uint64_t v18 = *(void *)v68;
    uint64_t v19 = v3 + 16;
    id v20 = v62;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v68 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        uint64_t v23 = [v22 dialect];
        char v24 = [v23 isEqual:v17];

        if ((v24 & 1) == 0)
        {
          long long v25 = [v22 dialect];
          v60 = [v25 languageNameAndLocaleInCurrentLocale];

          long long v26 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v60 target:0 set:0 get:0 detail:0 cell:0 edit:0];
          [v22 dialect];
          uint64_t v27 = v16;
          long long v28 = v3;
          long long v29 = v19;
          uint64_t v30 = v18;
          v32 = uint64_t v31 = v17;
          v33 = [v32 specificLanguageID];
          [v26 setProperty:v33 forKey:@"languageId"];

          id v20 = v62;
          [v62 addObject:v26];
          v17 = [v22 dialect];

          uint64_t v18 = v30;
          uint64_t v19 = v29;
          uint64_t v3 = v28;
          uint64_t v16 = v27;
        }
        v34 = (*((void (**)(char *, void *))v3 + 2))(v3, v22);
        [v20 addObject:v34];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    id v20 = v62;
  }

  if ([v58 count])
  {
    v61 = v17;
    v35 = (void *)MEMORY[0x1E4F92E70];
    v36 = AXUILocalizedStringForKey(@"NOVELTY_VOICES");
    v37 = [v35 preferenceSpecifierNamed:v36 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    v38 = [v58 firstObject];
    v39 = [v38 dialect];
    v40 = [v39 specificLanguageID];
    [v37 setProperty:v40 forKey:@"languageId"];

    [v20 addObject:v37];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v41 = v58;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v64 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = (*((void (**)(char *, void))v3 + 2))(v3, *(void *)(*((void *)&v63 + 1) + 8 * k));
          [v62 addObject:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v43);
    }

    v17 = v61;
    id v20 = v62;
  }
  [(NSLock *)v57->_voiceFootprintLock unlock];
  if (v57->_showSpeakingRate)
  {
    v47 = (void *)MEMORY[0x1E4F92E70];
    AXUILocalizedStringForKey(@"SPEAKING_RATE");
    v49 = v48 = v17;
    v50 = [v47 preferenceSpecifierNamed:v49 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    v17 = v48;
    [v20 addObject:v50];
    v51 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:v57 set:sel__setSpeakingRate_specifier_ get:sel__speakingRate_ detail:0 cell:5 edit:0];
    v52 = AXUISettingsSpeakingRateSlowImage();
    [v51 setProperty:v52 forKey:*MEMORY[0x1E4F931E8]];

    v53 = AXUISettingsSpeakingRateFastImage();
    [v51 setProperty:v53 forKey:*MEMORY[0x1E4F931F0]];

    [v51 setProperty:&unk_1F1F202A0 forKey:*MEMORY[0x1E4F93100]];
    [v51 setProperty:&unk_1F1F202B0 forKey:*MEMORY[0x1E4F930F8]];
    uint64_t v54 = [(AXSettingsPrimaryResourceDownloadController *)v57 speakingRateSliderCell];
    [v51 setProperty:v54 forKey:*MEMORY[0x1E4F930A8]];
    [v51 setProperty:&unk_1F1F202C0 forKey:*MEMORY[0x1E4F93110]];
    [v51 setProperty:@"SpeakingRate" forKey:*MEMORY[0x1E4F931B0]];
    [v20 addObject:v51];
  }
  return v20;
}

id __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v42 = v3;
  uint64_t v6 = [v3 name];
  id v7 = [v5 preferenceSpecifierNamed:v6 target:*(void *)(a1 + 32) set:0 get:sel__getSelectedVariation_ detail:v4 cell:2 edit:0];

  double v8 = [v3 resources];
  [v7 setProperty:v8 forKey:@"Resources"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "showPerVoiceSettings"));
  [v7 setProperty:v9 forKey:@"PVSettings"];

  uint64_t v10 = [MEMORY[0x1E4F48388] sharedInstance];
  LOBYTE(v5) = [v10 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F48388] identifier];
    uint64_t v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = AXColorizeFormatLog();
      uint64_t v15 = [v3 resources];
      v39 = [v3 name];
      v40 = v7;
      v38 = v15;
      uint64_t v16 = _AXStringForArgs();

      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v16;
        _os_log_impl(&dword_1C39D1000, v12, v13, "%{public}@", buf, 0xCu);
      }
    }
  }
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  v17 = [v3 dialect];
  [v7 setProperty:v17 forKey:@"kAXPSDialectMapKey"];

  [v7 setProperty:MEMORY[0x1E4F1CC38] forKey:@"IsDialect"];
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke_331;
  aBlock[3] = &unk_1E649C178;
  objc_copyWeak(&v48, (id *)buf);
  id v41 = _Block_copy(aBlock);
  uint64_t v18 = _Block_copy(v41);
  [v7 setProperty:v18 forKey:@"setDialectPreferencesCallback"];

  uint64_t v19 = [*(id *)(a1 + 32) getDialectPreferencesCallback];
  id v20 = _Block_copy(v19);
  [v7 setProperty:v20 forKey:@"getDialectPreferencesCallback"];

  uint64_t v21 = [*(id *)(a1 + 32) speechModelController];
  [v7 setProperty:v21 forKey:@"speechModelController"];

  uint64_t v22 = [*(id *)(a1 + 32) getDialectPreferencesCallback];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    long long v29 = 0;
  }
  else
  {
    char v24 = [*(id *)(a1 + 32) getDialectPreferencesCallback];
    long long v29 = v24[2](v24, v25, v26, v27, v28);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v30 = objc_msgSend(v42, "resources", v38, v39, v40);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v44;
    uint64_t v33 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v30);
        }
        v35 = [*(id *)(*((void *)&v43 + 1) + 8 * i) voiceId];
        int v36 = [v29 isEqualToString:v35];

        if (v36)
        {
          [v42 setIsSelected:1];
          [v7 setProperty:v33 forKey:@"IsSelected"];
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v31);
  }

  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);

  return v7;
}

void __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke_331(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained setDialectPreferencesCallback];
    ((void (**)(void, id))v5)[2](v5, v6);

    [v4 reloadSpecifiers];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  uint64_t v5 = [(AXSettingsPrimaryResourceDownloadController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  [(AXSettingsPrimaryResourceDownloadController *)self speakingRateSliderCell];
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 control];
    speechRateSlider = self->_speechRateSlider;
    self->_speechRateSlider = v6;
  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setInfoDelegate:self];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [a3 rowHeight];
  return result;
}

- (float)speakingRate
{
  return self->_speakingRate;
}

- (id)setSpeakingRateCallback
{
  return self->_setSpeakingRateCallback;
}

- (void)setSetSpeakingRateCallback:(id)a3
{
}

- (id)getSpeakingRateCallback
{
  return self->_getSpeakingRateCallback;
}

- (void)setGetSpeakingRateCallback:(id)a3
{
}

- (Class)speakingRateSliderCell
{
  return self->_speakingRateSliderCell;
}

- (void)setSpeakingRateSliderCell:(Class)a3
{
}

- (BOOL)showDialectPicker
{
  return self->_showDialectPicker;
}

- (void)setShowDialectPicker:(BOOL)a3
{
  self->_showDialectPicker = a3;
}

- (BOOL)showDialectInTitle
{
  return self->_showDialectInTitle;
}

- (void)setShowDialectInTitle:(BOOL)a3
{
  self->_showDialectInTitle = a3;
}

- (BOOL)showNeural
{
  return self->_showNeural;
}

- (void)setShowNeural:(BOOL)a3
{
  self->_showNeural = a3;
}

- (BOOL)showNeuralAX
{
  return self->_showNeuralAX;
}

- (void)setShowNeuralAX:(BOOL)a3
{
  self->_showNeuralAX = a3;
}

- (BOOL)showPersonalVoices
{
  return self->_showPersonalVoices;
}

- (void)setShowPersonalVoices:(BOOL)a3
{
  self->_showPersonalVoices = a3;
}

- (BOOL)hideLanguageInDialect
{
  return self->_hideLanguageInDialect;
}

- (void)setHideLanguageInDialect:(BOOL)a3
{
  self->_hideLanguageInDialect = a3;
}

- (AXLangMap)languageMap
{
  return self->_languageMap;
}

- (void)setLanguageMap:(id)a3
{
}

- (NSMutableArray)voiceFootprints
{
  return self->_voiceFootprints;
}

- (void)setVoiceFootprints:(id)a3
{
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_voiceFootprints, 0);
  objc_storeStrong((id *)&self->_languageMap, 0);
  objc_storeStrong((id *)&self->_speakingRateSliderCell, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_speechRateSlider, 0);
  objc_storeStrong((id *)&self->_voiceFootprintLock, 0);
  objc_storeStrong((id *)&self->_loadVoiceFootprintsQueue, 0);
  objc_storeStrong((id *)&self->_languageBeingDownloaded, 0);
  objc_storeStrong(&self->_getSpeakingRateCallback, 0);
  objc_storeStrong(&self->_setSpeakingRateCallback, 0);
}

- (double)_setSpeakingRate:(float *)a1 specifier:(NSObject *)a2 .cold.1(float *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = *a1;
  double v3 = fabsf(*a1 + -0.5);
  int v5 = 134218240;
  double v6 = v2;
  __int16 v7 = 2048;
  double v8 = v3;
  _os_log_error_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_ERROR, " new rate: %f -- diff %f", (uint8_t *)&v5, 0x16u);
  return result;
}

@end