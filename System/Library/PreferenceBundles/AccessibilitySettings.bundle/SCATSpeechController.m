@interface SCATSpeechController
- (AXSpeechSettingsModelController)speechModelController;
- (SCATSpeechController)init;
- (id)_defaultDialect:(id)a3;
- (id)shouldSpeakTraits:(id)a3;
- (id)specifiers;
- (id)speechEnabled:(id)a3;
- (id)speechPausesScanning:(id)a3;
- (id)speechRate:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_showUnifiedSpeechPicker;
- (void)setShouldSpeakTraits:(id)a3 specifier:(id)a4;
- (void)setSpeechEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeechModelController:(id)a3;
- (void)setSpeechPausesScanning:(id)a3 specifier:(id)a4;
- (void)setSpeechRate:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATSpeechController

- (SCATSpeechController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SCATSpeechController;
  v2 = [(SCATSpeechController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXSpeechSettingsModelController);
    [(SCATSpeechController *)v2 setSpeechModelController:v3];

    objc_initWeak(&location, v2);
    v4 = +[AXSettings sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __28__SCATSpeechController_init__block_invoke;
    v6[3] = &unk_208798;
    objc_copyWeak(&v7, &location);
    [v4 registerUpdateBlock:v6 forRetrieveSelector:"assistiveTouchScannerSpeechEnabled" withListener:v2];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__SCATSpeechController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"SpeechIdentifier" animated:0];
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v25 = OBJC_IVAR___PSListController__specifiers;
    v4 = objc_opt_new();
    v5 = AXParameterizedLocalizedString();
    v24 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setSpeechEnabled:specifier:" get:"speechEnabled:" detail:0 cell:6 edit:0];

    [v24 setIdentifier:@"SpeechIdentifier"];
    [v4 addObject:v24];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v4 addObject:v6];

    id v7 = AXParameterizedLocalizedString();
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_defaultDialect:" detail:objc_opt_class() cell:2 edit:0];

    [v8 setIdentifier:@"VoicesIdentifier"];
    [v4 addObject:v8];
    objc_super v9 = AXParameterizedLocalizedString();
    v10 = +[PSSpecifier groupSpecifierWithName:v9];

    [v4 addObject:v10];
    v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setSpeechRate:specifier:" get:"speechRate:" detail:0 cell:5 edit:0];
    v12 = AXTortoiseImage();
    [v11 setProperty:v12 forKey:PSSliderLeftImageKey];

    v13 = AXHareImage();
    [v11 setProperty:v13 forKey:PSSliderRightImageKey];

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = PSCellClassKey;
    [v11 setProperty:v14 forKey:PSCellClassKey];
    [v11 setProperty:&off_22C430 forKey:PSControlMaximumKey];
    [v11 setProperty:&off_22C440 forKey:PSControlMinimumKey];
    v16 = AXParameterizedLocalizedString();
    [v11 setAccessibilityLabel:v16];

    [v11 setProperty:@"SpeechRateIdentifier" forKey:PSIDKey];
    [v4 addObject:v11];
    v17 = +[PSSpecifier emptyGroupSpecifier];
    [v4 addObject:v17];
    v18 = AXParameterizedLocalizedString();
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setShouldSpeakTraits:specifier:" get:"shouldSpeakTraits:" detail:0 cell:6 edit:0];

    [v19 setProperty:objc_opt_class() forKey:v15];
    [v4 addObject:v19];
    v20 = AXParameterizedLocalizedString();
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:"setSpeechPausesScanning:specifier:" get:"speechPausesScanning:" detail:0 cell:6 edit:0];

    [v4 addObject:v21];
    [(SCATSpeechController *)self setupLongTitleSpecifiers:v4];
    v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v25];
    *(void *)&self->AXUISettingsBaseListController_opaque[v25] = v4;

    id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v25];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCATSpeechController;
  v5 = [(SCATSpeechController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 control];
    speechRateSlider = self->_speechRateSlider;
    self->_speechRateSlider = v6;
  }

  return v5;
}

- (void)_showUnifiedSpeechPicker
{
  id v3 = objc_alloc_init((Class)AXSettingsPrimaryResourceDownloadController);
  v4 = [(SCATSpeechController *)self rootController];
  [v3 setRootController:v4];

  [v3 setSpecifier:0];
  [v3 setParentController:self];
  v5 = +[AXLanguageManager sharedInstance];
  v6 = [v5 systemLanguageID];

  [v3 setLanguage:v6];
  [v3 setShowSpeakingRate:0];
  [v3 setShowNeural:0];
  [v3 setShowDialectPicker:1];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke;
  v10[3] = &unk_20B7B0;
  objc_copyWeak(&v13, &location);
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v3 setSetDialectPreferencesCallback:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke_2;
  v8[3] = &unk_209258;
  objc_copyWeak(&v9, &location);
  [v3 setGetDialectPreferencesCallback:v8];
  [v3 setSpeechSourceKey:AXSpeechSourceKeySwitchControl];
  [v3 setGetPerVoiceSettingsCallack:&__block_literal_global_54];
  [v3 setSetPerVoiceSettingsCallack:&__block_literal_global_329];
  [(SCATSpeechController *)self showController:v3 animate:1];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [WeakRetained speechModelController];
  [v6 updateSelectedVoiceIdentifier:v4 forSpeechSourceKey:AXSpeechSourceKeySwitchControl languageCode:*(void *)(a1 + 32)];

  id v7 = *(void **)(a1 + 40);
  id v8 = [v7 specifierForID:@"VoicesIdentifier"];
  [v7 reloadSpecifier:v8];
}

id __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained speechModelController];
  id v3 = [v2 selectedVoiceIdentifierForSpeechSourceKey:AXSpeechSourceKeySwitchControl];

  return v3;
}

NSDictionary *__cdecl __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke_3(id a1, NSString *a2)
{
  v2 = a2;
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 customSettingsForVoice:v2 sourceKey:AXSpeechSourceKeySwitchControl];

  return (NSDictionary *)v4;
}

void __48__SCATSpeechController__showUnifiedSpeechPicker__block_invoke_4(id a1, NSString *a2, NSDictionary *a3)
{
  id v4 = a3;
  v5 = a2;
  id v6 = +[AXSettings sharedInstance];
  [v6 setCustomSettingsForVoice:v5 sourceKey:AXSpeechSourceKeySwitchControl settings:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCATSpeechController;
  id v8 = [(SCATSpeechController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 specifier];
  v10 = [v9 identifier];

  if ([v10 isEqualToString:@"VoicesIdentifier"])
  {
    [(SCATSpeechController *)self _showUnifiedSpeechPicker];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SCATSpeechController;
    [(SCATSpeechController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (id)_defaultDialect:(id)a3
{
  id v3 = [(SCATSpeechController *)self speechModelController];
  uint64_t v4 = AXSpeechSourceKeySwitchControl;
  v5 = +[AXLanguageManager sharedInstance];
  id v6 = [v5 systemLanguageID];
  id v7 = [v3 selectedVoiceIdentifierForSpeechSourceKey:v4 languageCode:v6];

  id v8 = AXVoiceNameForVoiceId();

  return v8;
}

- (void)setSpeechEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerSpeechEnabled:v4];
}

- (id)speechEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerSpeechEnabled]);

  return v4;
}

- (void)setSpeechPausesScanning:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerSpeechIsInterruptedByScanning:v4];
}

- (id)speechPausesScanning:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  uint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 assistiveTouchScannerSpeechIsInterruptedByScanning] ^ 1);

  return v4;
}

- (void)setShouldSpeakTraits:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchScannerSpeechShouldSpeakTraits:v4];
}

- (id)shouldSpeakTraits:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 assistiveTouchScannerSpeechShouldSpeakTraits]);

  return v4;
}

- (id)speechRate:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchScannerSpeechRate];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (void)setSpeechRate:(id)a3 specifier:(id)a4
{
  [a3 floatValue];
  float v6 = v5;
  if (fabsf(v5 + -0.5) < 0.03 && ([(UISlider *)self->_speechRateSlider isTracking] & 1) == 0)
  {
    float v6 = 0.5;
    LODWORD(v7) = 0.5;
    [(UISlider *)self->_speechRateSlider setValue:1 animated:v7];
  }
  id v8 = +[AXSettings sharedInstance];
  [v8 setAssistiveTouchScannerSpeechRate:v6];
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechModelController, 0);

  objc_storeStrong((id *)&self->_speechRateSlider, 0);
}

@end