@interface LiveTranscriptionAppearanceController
- (NSString)appID;
- (NSString)selectedIdentifier;
- (PSSpecifier)backgroundColorSpecifier;
- (PSSpecifier)textColorSpecifier;
- (__CFString)_cfAppID;
- (id)_colorFromData:(id)a3;
- (id)backgroundColorForSpecifier:(id)a3;
- (id)boldTextEnabled:(id)a3;
- (id)largerTextEnabled:(id)a3;
- (id)specifiers;
- (id)textColorForSpecifier:(id)a3;
- (int)largerTextPerAppValue;
- (void)_updateSpecifierState:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)resetColors:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBackgroundColorSpecifier:(id)a3;
- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4;
- (void)setSelectedIdentifier:(id)a3;
- (void)setTextColorSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation LiveTranscriptionAppearanceController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_allocWithZone((Class)NSMutableArray) init];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    objc_storeStrong((id *)&self->_appID, AX_LiveTranscriptionBundleName);
    objc_initWeak(location, self);
    v7 = settingsLocString(@"ENHANCE_TEXT_LEGIBILITY", @"Accessibility");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"boldTextEnabled:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v32 = PSIDKey;
    objc_msgSend(v8, "setProperty:forKey:", @"ENHANCE_TEXT_LEGIBILITY");
    objc_initWeak(&from, v8);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = __51__LiveTranscriptionAppearanceController_specifiers__block_invoke;
    v40[3] = &unk_20AD48;
    objc_copyWeak(&v41, location);
    objc_copyWeak(&v42, &from);
    v9 = objc_retainBlock(v40);
    [v8 setProperty:v9 forKey:@"setValueSelectedBlock"];

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_2;
    v38[3] = &unk_2091B8;
    objc_copyWeak(&v39, location);
    v10 = objc_retainBlock(v38);
    [v8 setProperty:v10 forKey:@"getValueSelectedBlock"];

    [v5 addObject:v8];
    v11 = settingsLocString(@"TEXT_SIZE", @"Accessibility");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"largerTextEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v12 setProperty:@"LARGER_TEXT" forKey:v32];
    [v12 setProperty:self->_appID forKey:@"BundleIdentifier"];
    objc_storeWeak(&from, v12);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_3;
    v35[3] = &unk_20AD48;
    objc_copyWeak(&v36, location);
    objc_copyWeak(&v37, &from);
    v13 = objc_retainBlock(v35);
    [v12 setProperty:v13 forKey:@"setValueSelectedBlock"];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_4;
    v33[3] = &unk_2091B8;
    objc_copyWeak(&v34, location);
    v14 = objc_retainBlock(v33);
    [v12 setProperty:v14 forKey:@"getValueSelectedBlock"];

    [v5 addObject:v12];
    v15 = settingsLocString(@"LIVE_TRANSCRIPTION_COLOR_OPTIONS", @"Accessibility");
    v16 = +[PSSpecifier groupSpecifierWithName:v15];

    [v5 addObject:v16];
    v17 = settingsLocString(@"LIVE_TRANSCRIPTION_TEXT_COLOR", @"Accessibility");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"textColorForSpecifier:" detail:0 cell:-1 edit:0];

    uint64_t v19 = objc_opt_class();
    uint64_t v20 = PSCellClassKey;
    [v18 setProperty:v19 forKey:PSCellClassKey];
    [v18 setIdentifier:@"LIVE_TRANSCRIPTION_TEXT_COLOR"];
    uint64_t v21 = PSEnabledKey;
    [v18 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v5 addObject:v18];
    objc_storeStrong((id *)&self->_textColorSpecifier, v18);
    v22 = settingsLocString(@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR", @"Accessibility");
    v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:"backgroundColorForSpecifier:" detail:0 cell:-1 edit:0];

    [v23 setProperty:objc_opt_class() forKey:v20];
    [v23 setIdentifier:@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR"];
    [v23 setProperty:&__kCFBooleanTrue forKey:v21];
    [v5 addObject:v23];
    objc_storeStrong((id *)&self->_backgroundColorSpecifier, v23);
    v24 = settingsLocString(@"LIVE_TRANSCRIPTION_RESET_COLORS", @"Accessibility");
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v25 setButtonAction:"resetColors:"];
    [v25 setIdentifier:@"LIVE_TRANSCRIPTION_RESET_COLORS"];
    [v25 setProperty:&__kCFBooleanTrue forKey:v21];
    [v5 addObject:v25];
    v26 = settingsLocString(@"LIVE_CAPTIONS_IDLE_OPACITY_TITLE", @"Accessibility");
    v27 = +[PSSpecifier groupSpecifierWithName:v26];

    v28 = settingsLocString(@"LIVE_CAPTIONS_IDLE_OPACITY_FOOTER_TEXT", @"Accessibility");
    [v27 setProperty:v28 forKey:PSFooterTextGroupKey];

    [v5 addObject:v27];
    v29 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v29 setProperty:@"IDLE_OPACITY" forKey:v32];
    [v29 setProperty:objc_opt_class() forKey:v20];
    [v5 addObject:v29];
    [(LiveTranscriptionAppearanceController *)self setupLongTitleSpecifiers:v5];
    v30 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

void __51__LiveTranscriptionAppearanceController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setBoldTextEnabled:v4 specifier:v5];
}

id __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained boldTextEnabled:0];

  return v2;
}

void __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateSpecifierState:v2];
}

id __51__LiveTranscriptionAppearanceController_specifiers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [WeakRetained largerTextPerAppValue]);

  return v2;
}

- (id)boldTextEnabled:(id)a3
{
  id v4 = +[NSNumber numberWithInt:_AXSLiveCaptionsBoldTextEnabled()];
  id v5 = v4;
  if (a3)
  {
    id v6 = +[AXDefaultOnOffViewController stringValueForNumber:v4];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  [a3 integerValue];
  _AXSLiveCaptionsSetBoldTextEnabled();
  [(LiveTranscriptionAppearanceController *)self _updateSpecifierState:v6];

  id v7 = +[AXSettings sharedInstance];
  [v7 aggregatePerAppSettingsStatistics];
}

- (id)largerTextEnabled:(id)a3
{
  if (self->_appID) {
    uint64_t v3 = [(LiveTranscriptionAppearanceController *)self largerTextPerAppValue];
  }
  else {
    uint64_t v3 = _AXSLargeTextUsesExtendedRange() != 0;
  }
  id v4 = +[NSNumber numberWithInt:v3];
  id v5 = +[AXDefaultOnOffViewController stringValueForNumber:v4];

  return v5;
}

- (int)largerTextPerAppValue
{
  id v2 = (void *)_AXSLiveCaptionsCopyContentSizeCategoryName();
  if (v2) {
    int v3 = 1;
  }
  else {
    int v3 = -1;
  }

  return v3;
}

- (id)textColorForSpecifier:(id)a3
{
  id v4 = (void *)_AXSLiveTranscriptionCopyTextColorData();
  id v5 = [(LiveTranscriptionAppearanceController *)self _colorFromData:v4];

  return v5;
}

- (id)backgroundColorForSpecifier:(id)a3
{
  id v4 = (void *)_AXSLiveTranscriptionCopyBackgroundColorData();
  id v5 = [(LiveTranscriptionAppearanceController *)self _colorFromData:v4];

  return v5;
}

- (void)resetColors:(id)a3
{
  id v4 = a3;
  _AXSLiveTranscriptionSetTextColorData();
  _AXSLiveTranscriptionSetBackgroundColorData();
  objc_opt_class();
  id v5 = [(LiveTranscriptionAppearanceController *)self cellForSpecifier:self->_textColorSpecifier];
  id v6 = __UIAccessibilityCastAsClass();

  [v6 setValue:0];
  objc_opt_class();
  id v7 = [(LiveTranscriptionAppearanceController *)self cellForSpecifier:self->_backgroundColorSpecifier];
  v8 = __UIAccessibilityCastAsClass();

  [v8 setValue:0];
}

- (__CFString)_cfAppID
{
  return (__CFString *)self->_appID;
}

- (void)_updateSpecifierState:(id)a3
{
  id v4 = a3;
  id v7 = (id)_AXSLiveCaptionsCopyContentSizeCategoryName();
  id v5 = +[AXSettings sharedInstance];
  appID = self->_appID;
  if (v7) {
    [v5 addCustomizedAppID:appID];
  }
  else {
    [v5 removeCustomizedAppID:appID];
  }

  [(LiveTranscriptionAppearanceController *)self reloadSpecifier:v4];
}

- (id)_colorFromData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v8 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];

    id v5 = v8;
    if (v5)
    {
      id v6 = AXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[LiveTranscriptionAppearanceController _colorFromData:]((uint64_t)v5, v6);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LiveTranscriptionAppearanceController;
  [(LiveTranscriptionAppearanceController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
  v18.receiver = self;
  v18.super_class = (Class)LiveTranscriptionAppearanceController;
  id v8 = [(LiveTranscriptionAppearanceController *)&v18 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [v8 specifier];
  v10 = [v9 identifier];
  selectedIdentifier = self->_selectedIdentifier;
  self->_selectedIdentifier = v10;

  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_TEXT_COLOR"]|| [(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR"])
  {
    id v12 = objc_alloc_init((Class)UIColorPickerViewController);
    if ([(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_TEXT_COLOR"])
    {
      v13 = settingsLocString(@"LIVE_TRANSCRIPTION_TEXT_COLOR", @"Accessibility");
      [v12 setTitle:v13];

      v14 = [(LiveTranscriptionAppearanceController *)self textColorForSpecifier:0];
      if (!v14)
      {
        uint64_t v15 = +[UIColor whiteColor];
LABEL_9:
        v14 = (void *)v15;
      }
    }
    else
    {
      if (![(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR"])
      {
LABEL_11:
        [v12 setModalPresentationStyle:7];
        v17 = [v12 popoverPresentationController];
        [v17 setSourceView:v8];

        [(LiveTranscriptionAppearanceController *)self presentViewController:v12 animated:1 completion:0];
        [v12 setDelegate:self];
        [v6 deselectRowAtIndexPath:v7 animated:1];

        goto LABEL_12;
      }
      v16 = settingsLocString(@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR", @"Accessibility");
      [v12 setTitle:v16];

      v14 = [(LiveTranscriptionAppearanceController *)self backgroundColorForSpecifier:0];
      if (!v14)
      {
        uint64_t v15 = +[UIColor blackColor];
        goto LABEL_9;
      }
    }
    [v12 setSelectedColor:v14];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v14 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
  id v10 = v14;
  if (v10)
  {
    v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LiveTranscriptionAppearanceController colorPickerViewController:didSelectColor:continuously:]((uint64_t)self, (uint64_t)v10, v11);
    }
  }
  if ([(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_TEXT_COLOR"])
  {
    _AXSLiveTranscriptionSetTextColorData();
  }
  else if ([(NSString *)self->_selectedIdentifier isEqualToString:@"LIVE_TRANSCRIPTION_BACKGROUND_COLOR"])
  {
    _AXSLiveTranscriptionSetBackgroundColorData();
  }
  objc_opt_class();
  id v12 = [(LiveTranscriptionAppearanceController *)self cellForSpecifierID:self->_selectedIdentifier];
  v13 = __UIAccessibilityCastAsClass();

  [v13 setValue:v8];
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)selectedIdentifier
{
  return self->_selectedIdentifier;
}

- (void)setSelectedIdentifier:(id)a3
{
}

- (PSSpecifier)textColorSpecifier
{
  return self->_textColorSpecifier;
}

- (void)setTextColorSpecifier:(id)a3
{
}

- (PSSpecifier)backgroundColorSpecifier
{
  return self->_backgroundColorSpecifier;
}

- (void)setBackgroundColorSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorSpecifier, 0);
  objc_storeStrong((id *)&self->_textColorSpecifier, 0);
  objc_storeStrong((id *)&self->_selectedIdentifier, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

- (void)_colorFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to decode Transcriptions color: %@", (uint8_t *)&v2, 0xCu);
}

- (void)colorPickerViewController:(uint64_t)a1 didSelectColor:(uint64_t)a2 continuously:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 208);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to encode Transcriptions color for %@. %@", (uint8_t *)&v4, 0x16u);
}

@end