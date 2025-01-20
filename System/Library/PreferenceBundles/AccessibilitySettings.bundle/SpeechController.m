@interface SpeechController
- (BOOL)areHighlightSettingsItemsHidden;
- (BOOL)areSpeakScreenSettingsItemsHidden;
- (NSArray)highlightSettingsItems;
- (NSArray)speakScreenSettingsItems;
- (id)highlightWord:(id)a3;
- (id)quickSpeakEnabled:(id)a3;
- (id)quickSpeakSpeakingRate:(id)a3;
- (id)speakThisEnabled:(id)a3;
- (id)specifiers;
- (id)speechControllerSummary:(id)a3;
- (id)spokenContentDefaultLanguageSummary:(id)a3;
- (id)spokenContentDetectLanguages:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_reloadQuickSpeakHighlightSpecifier;
- (void)loadView;
- (void)setHighlightSettingsItems:(id)a3;
- (void)setHighlightSettingsItemsHidden:(BOOL)a3;
- (void)setQuickSpeakEnabled:(id)a3 specifier:(id)a4;
- (void)setQuickSpeakSpeakingRate:(id)a3 specifier:(id)a4;
- (void)setSpeakScreenSettingsItems:(id)a3;
- (void)setSpeakScreenSettingsItemsHidden:(BOOL)a3;
- (void)setSpeakThisEnabled:(id)a3 specifier:(id)a4;
- (void)setSpokenContentDetectLanguages:(id)a3 specifier:(id)a4;
- (void)updateLayout;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation SpeechController

- (void)setHighlightSettingsItemsHidden:(BOOL)a3
{
  if (self->_highlightSettingsItemsHidden != a3)
  {
    self->_highlightSettingsItemsHidden = a3;
    if (a3)
    {
      id v7 = [(SpeechController *)self highlightSettingsItems];
      -[SpeechController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:");
    }
    else
    {
      BOOL speakScreenSettingsItemsHidden = self->_speakScreenSettingsItemsHidden;
      uint64_t v5 = [(SpeechController *)self highlightSettingsItems];
      id v7 = (id)v5;
      if (speakScreenSettingsItemsHidden) {
        CFStringRef v6 = @"SpeakThisEnabled";
      }
      else {
        CFStringRef v6 = @"SpeechControllerGroup";
      }
      [(SpeechController *)self insertContiguousSpecifiers:v5 afterSpecifierID:v6 animated:1];
    }
  }
}

- (void)setSpeakScreenSettingsItemsHidden:(BOOL)a3
{
  if (self->_speakScreenSettingsItemsHidden != a3)
  {
    BOOL v3 = a3;
    self->_BOOL speakScreenSettingsItemsHidden = a3;
    uint64_t v5 = [(SpeechController *)self speakScreenSettingsItems];
    id v6 = (id)v5;
    if (v3) {
      [(SpeechController *)self removeContiguousSpecifiers:v5 animated:1];
    }
    else {
      [(SpeechController *)self insertContiguousSpecifiers:v5 afterSpecifierID:@"SpeakThisEnabled" animated:1];
    }
  }
}

- (void)_reloadQuickSpeakHighlightSpecifier
{
  id v3 = [(SpeechController *)self specifierForID:@"QuickSpeakHighlight"];
  [(SpeechController *)self reloadSpecifier:v3];
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)SpeechController;
  [(SpeechController *)&v14 loadView];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_reloadQuickSpeakHighlightSpecifier" name:kAXSQuickSpeakHighlightTextEnabledNotification object:0];

  objc_initWeak(&location, self);
  v4 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __28__SpeechController_loadView__block_invoke;
  v11[3] = &unk_208BB8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v4 registerUpdateBlock:v11 forRetrieveSelector:"quickSpeakSpeakingRate" withListener:self];

  objc_destroyWeak(&v12);
  uint64_t v5 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __28__SpeechController_loadView__block_invoke_3;
  v9[3] = &unk_208BB8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  [v5 registerUpdateBlock:v9 forRetrieveSelector:"showSpeechController" withListener:self];

  objc_destroyWeak(&v10);
  id v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __28__SpeechController_loadView__block_invoke_4;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"spokenContentDefaultFallbackLanguage" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __28__SpeechController_loadView__block_invoke(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __28__SpeechController_loadView__block_invoke_2;
  v2[3] = &unk_208BB8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
}

void __28__SpeechController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForID:@"QuickSpeakRate"];
  [WeakRetained reloadSpecifier:v2];
}

void __28__SpeechController_loadView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) specifierForID:@"SpeechController"];
  [WeakRetained reloadSpecifier:v2];
}

void __28__SpeechController_loadView__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v31 = OBJC_IVAR___PSListController__specifiers;
    v32 = self;
    v4 = -[SpeechController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"SpeechSettings");
    v37 = +[NSMutableArray array];
    v36 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v40;
      uint64_t v9 = PSKeyNameKey;
      uint64_t v35 = PSSliderRightImageKey;
      uint64_t v34 = PSSliderLeftImageKey;
      uint64_t v33 = PSCellClassKey;
      uint64_t v10 = PSIDKey;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v13 = [v12 propertyForKey:@"hideWhenDisabled"];
          unsigned int v14 = [v13 BOOLValue];

          if (v14) {
            [v37 addObject:v12];
          }
          v15 = [v12 propertyForKey:@"requiresSpeakScreen"];
          unsigned int v16 = [v15 BOOLValue];

          if (v16) {
            [v36 addObject:v12];
          }
          v17 = [v12 propertyForKey:v9];
          unsigned int v18 = [v17 isEqualToString:@"QuickSpeakRate"];

          if (v18)
          {
            v19 = AXHareImage();
            [v12 setProperty:v19 forKey:v35];

            v20 = AXTortoiseImage();
            [v12 setProperty:v20 forKey:v34];

            [v12 setProperty:objc_opt_class() forKey:v33];
          }
          v21 = [v12 propertyForKey:v10];
          unsigned int v22 = [v21 isEqualToString:@"SpeakThisGeneralFooter"];

          if (v22)
          {
            id v23 = v12;

            id v7 = v23;
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    [(SpeechController *)v32 setHighlightSettingsItems:v37];
    [(SpeechController *)v32 setSpeakScreenSettingsItems:v36];
    if (_AXSQuickSpeakEnabled()) {
      BOOL v24 = 0;
    }
    else {
      BOOL v24 = _AXSSpeakThisEnabled() == 0;
    }
    v32->_highlightSettingsItemsHidden = v24;
    if (_AXSSpeakThisEnabled()) {
      int speakScreenSettingsItemsHidden = _AXSMossdeepEnabled() != 0;
    }
    else {
      int speakScreenSettingsItemsHidden = 1;
    }
    v32->_int speakScreenSettingsItemsHidden = speakScreenSettingsItemsHidden;
    if (v32->_highlightSettingsItemsHidden)
    {
      v26 = [(SpeechController *)v32 highlightSettingsItems];
      [obj removeObjectsInArray:v26];

      int speakScreenSettingsItemsHidden = v32->_speakScreenSettingsItemsHidden;
    }
    if (speakScreenSettingsItemsHidden)
    {
      v27 = [(SpeechController *)v32 speakScreenSettingsItems];
      [obj removeObjectsInArray:v27];
    }
    [(SpeechController *)v32 filterBuddy:obj];
    v28 = *(void **)&v32->AXUISettingsSetupCapableListController_opaque[v31];
    *(void *)&v32->AXUISettingsSetupCapableListController_opaque[v31] = obj;
    id v29 = obj;

    id v3 = *(void **)&v32->AXUISettingsSetupCapableListController_opaque[v31];
  }

  return v3;
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)SpeechController;
  [(SpeechController *)&v3 willBecomeActive];
  [(SpeechController *)self updateLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SpeechController;
  [(SpeechController *)&v4 viewWillAppear:a3];
  [(SpeechController *)self updateLayout];
}

- (void)updateLayout
{
  if (_AXSQuickSpeakEnabled()) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = _AXSSpeakThisEnabled() == 0;
  }
  [(SpeechController *)self setHighlightSettingsItemsHidden:v3];
  if (_AXSSpeakThisEnabled()) {
    BOOL v4 = _AXSMossdeepEnabled() != 0;
  }
  else {
    BOOL v4 = 1;
  }

  [(SpeechController *)self setSpeakScreenSettingsItemsHidden:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SpeechController;
  id v5 = [(SpeechController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 control];
    speechRateSlider = self->_speechRateSlider;
    self->_speechRateSlider = v6;
  }

  return v5;
}

- (id)quickSpeakEnabled:(id)a3
{
  BOOL v3 = _AXSQuickSpeakEnabled() != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setQuickSpeakEnabled:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  if ([v7 BOOLValue])
  {
    id v5 = AXAssetAndDataClient();
    id v6 = +[AXAccessQueue mainAccessQueue];
    [v5 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
  }
  [v7 BOOLValue];
  _AXSQuickSpeakSetEnabled();
  [(SpeechController *)self updateLayout];
}

- (id)highlightWord:(id)a3
{
  if (_AXSQuickSpeakHighlightTextEnabled()) {
    BOOL v3 = @"ON";
  }
  else {
    BOOL v3 = @"OFF";
  }

  return settingsLocString(v3, @"Accessibility");
}

- (id)quickSpeakSpeakingRate:(id)a3
{
  BOOL v3 = +[AXSettings sharedInstance];
  [v3 quickSpeakSpeakingRate];
  BOOL v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v4;
}

- (void)setQuickSpeakSpeakingRate:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  float v6 = v5;
  if (fabsf(v5 + -0.5) < 0.03 && ([(UISlider *)self->_speechRateSlider isTracking] & 1) == 0)
  {
    float v6 = 0.5;
    LODWORD(v7) = 0.5;
    [(UISlider *)self->_speechRateSlider setValue:1 animated:v7];
  }
  uint64_t v8 = +[AXSettings sharedInstance];
  *(float *)&double v9 = v6;
  [v8 setQuickSpeakSpeakingRate:v9];

  if (!setQuickSpeakSpeakingRate_specifier__qsInstance)
  {
    id v18 = 0;
    id v19 = 0;
    id v13 = +[AXResourceLoader loadResource:3 principalClass:&v19 error:&v18];
    id v14 = v18;
    if (v14)
    {
      v15 = v14;
      _AXLogWithFacility();

      return;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [v19 sharedInstance];
      v17 = (void *)setQuickSpeakSpeakingRate_specifier__qsInstance;
      setQuickSpeakSpeakingRate_specifier__qsInstance = v16;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    if (!UIAccessibilityIsVoiceOverRunning())
    {
      uint64_t v10 = (void *)setQuickSpeakSpeakingRate_specifier__qsInstance;
      v11 = +[AXLanguageManager sharedInstance];
      id v12 = [v11 systemLanguageID];
      [v10 speakStatusWithLanguage:v12 rate:0];
    }
  }
  else
  {
    AXIsInternalInstall();
  }
}

- (id)speakThisEnabled:(id)a3
{
  uint64_t v3 = _AXSSpeakThisEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setSpeakThisEnabled:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  [v10 BOOLValue];
  _AXSSetSpeakThisEnabled();
  if ([v10 BOOLValue])
  {
    float v5 = AXAssetAndDataClient();
    float v6 = +[AXAccessQueue mainAccessQueue];
    [v5 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:11 targetAccessQueue:v6 completion:0];
  }
  [(SpeechController *)self updateLayout];
  if ([v10 BOOLValue])
  {
    double v7 = +[AXSettings sharedInstance];
    unsigned int v8 = [v7 showSpeechController];

    if (v8)
    {
      double v9 = +[SpeakThisServices sharedInstance];
      [v9 showSpeechController:&__block_literal_global_25];
    }
  }
}

void __50__SpeechController_setSpeakThisEnabled_specifier___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    uint64_t v3 = AXLogSettings();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__SpeechController_setSpeakThisEnabled_specifier___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)speechControllerSummary:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 showSpeechController];

  if (v4) {
    float v5 = @"ON";
  }
  else {
    float v5 = @"OFF";
  }

  return settingsLocString(v5, @"Accessibility");
}

- (id)spokenContentDefaultLanguageSummary:(id)a3
{
  uint64_t v3 = +[AXLanguageManager sharedInstance];
  unsigned int v4 = +[AXSettings sharedInstance];
  float v5 = [v4 spokenContentDefaultFallbackLanguage];

  if (v5)
  {
    float v6 = [v3 dialectForLanguageID:v5];
    double v7 = [v6 languageNameInCurrentLocale];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)spokenContentDetectLanguages:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned int v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 spokenContentShouldUseLanguageDetection]);

  return v4;
}

- (void)setSpokenContentDetectLanguages:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setSpokenContentShouldUseLanguageDetection:v5];
}

- (NSArray)highlightSettingsItems
{
  return self->_highlightSettingsItems;
}

- (void)setHighlightSettingsItems:(id)a3
{
}

- (BOOL)areHighlightSettingsItemsHidden
{
  return self->_highlightSettingsItemsHidden;
}

- (NSArray)speakScreenSettingsItems
{
  return self->_speakScreenSettingsItems;
}

- (void)setSpeakScreenSettingsItems:(id)a3
{
}

- (BOOL)areSpeakScreenSettingsItemsHidden
{
  return self->_speakScreenSettingsItemsHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakScreenSettingsItems, 0);
  objc_storeStrong((id *)&self->_highlightSettingsItems, 0);

  objc_storeStrong((id *)&self->_speechRateSlider, 0);
}

void __50__SpeechController_setSpeakThisEnabled_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to display speech controller from settings: %@", (uint8_t *)&v2, 0xCu);
}

@end