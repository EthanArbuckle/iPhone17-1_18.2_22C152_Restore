@interface VoiceOverAwarenessController
- (id)_imageDescriptionsEnabled:(id)a3;
- (id)_neuralEnabled:(id)a3;
- (id)_neuralFeedback:(id)a3;
- (id)_ocrEnabled:(id)a3;
- (id)specifiers;
- (void)loadView;
- (void)setDiscoveredTextEnabled:(id)a3 specifier:(id)a4;
@end

@implementation VoiceOverAwarenessController

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v40 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = AXLocStringKeyForModel();
    v7 = settingsLocString(v6, @"VoiceOverSettings");
    uint64_t v8 = PSFooterTextGroupKey;
    [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v9 = +[PSSpecifier emptyGroupSpecifier];

    v10 = AXLocStringKeyForModel();
    v11 = settingsLocString(v10, @"VoiceOverSettings");
    uint64_t v12 = v8;
    uint64_t v41 = v8;
    [v9 setProperty:v11 forKey:v8];

    [v4 addObject:v9];
    v13 = settingsLocString(@"VO_REAL_WORLD_DETECTION", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = PSCellClassKey;
    [v14 setProperty:v15 forKey:PSCellClassKey];
    [v14 setIdentifier:@"VO_REAL_WORLD_DETECTION"];
    [v4 addObject:v14];
    v17 = +[PSSpecifier emptyGroupSpecifier];

    v18 = AXLocStringKeyForModel();
    v19 = settingsLocString(v18, @"VoiceOverSettings");
    [v17 setProperty:v19 forKey:v12];

    [v4 addObject:v17];
    v20 = settingsLocString(@"VO_IMAGE_DESCRIPTIONS", @"VoiceOverSettings");
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:"_imageDescriptionsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v39 = v16;
    [v21 setProperty:objc_opt_class() forKey:v16];
    [v21 setIdentifier:@"VO_IMAGE_DESCRIPTIONS"];
    [v4 addObject:v21];
    v22 = +[PSSpecifier emptyGroupSpecifier];

    v23 = AXLocStringKeyForModel();
    v24 = settingsLocString(v23, @"VoiceOverSettings");
    [v22 setProperty:v24 forKey:v41];

    [v4 addObject:v22];
    v25 = settingsLocString(@"VO_SCREEN_RECOGNITION", @"VoiceOverSettings");
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:"_neuralEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:objc_opt_class() forKey:v16];
    [v26 setIdentifier:@"VO_SCREEN_RECOGNITION"];
    [v4 addObject:v26];
    v27 = +[PSSpecifier emptyGroupSpecifier];

    v28 = AXLocStringKeyForModel();
    v29 = settingsLocString(v28, @"VoiceOverSettings");
    [v27 setProperty:v29 forKey:v41];

    [v4 addObject:v27];
    v30 = settingsLocString(@"VO_OCR", @"VoiceOverSettings");
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:"setDiscoveredTextEnabled:specifier:" get:"_ocrEnabled:" detail:0 cell:6 edit:0];

    [v31 setIdentifier:@"VO_OCR"];
    [v4 addObject:v31];
    v32 = +[PSSpecifier emptyGroupSpecifier];

    v33 = settingsLocString(@"VO_FEEDBACK_FOOTER", @"VoiceOverSettings");
    [v32 setProperty:v33 forKey:v41];

    [v4 addObject:v32];
    v34 = settingsLocString(@"VO_FEEDBACK", @"VoiceOverSettings");
    v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:"_neuralFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v35 setProperty:objc_opt_class() forKey:v39];
    [v35 setIdentifier:@"VO_FEEDBACK"];
    [v4 addObject:v35];
    id v36 = [v4 copy];
    v37 = *(void **)&self->super.AXUISettingsListController_opaque[v40];
    *(void *)&self->super.AXUISettingsListController_opaque[v40] = v36;

    v3 = *(void **)&self->super.AXUISettingsListController_opaque[v40];
  }

  return v3;
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverAwarenessController;
  [(VoiceOverAwarenessController *)&v16 loadView];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __40__VoiceOverAwarenessController_loadView__block_invoke;
  v13[3] = &unk_208798;
  objc_copyWeak(&v14, &location);
  [v3 registerUpdateBlock:v13 forRetrieveSelector:"voiceOverImageCaptionsEnabled" withListener:self];

  objc_destroyWeak(&v14);
  v4 = +[AXSettings sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __40__VoiceOverAwarenessController_loadView__block_invoke_2;
  v11[3] = &unk_208798;
  objc_copyWeak(&v12, &location);
  [v4 registerUpdateBlock:v11 forRetrieveSelector:"automaticAccessibilityEnabled" withListener:self];

  objc_destroyWeak(&v12);
  v5 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __40__VoiceOverAwarenessController_loadView__block_invoke_3;
  v9[3] = &unk_208798;
  objc_copyWeak(&v10, &location);
  [v5 registerUpdateBlock:v9 forRetrieveSelector:"voiceOverShouldSpeakDiscoveredText" withListener:self];

  objc_destroyWeak(&v10);
  v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __40__VoiceOverAwarenessController_loadView__block_invoke_4;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"voiceOverNeuralElementFeedback" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__VoiceOverAwarenessController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __40__VoiceOverAwarenessController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __40__VoiceOverAwarenessController_loadView__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __40__VoiceOverAwarenessController_loadView__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)_imageDescriptionsEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  if ([v3 voiceOverImageCaptionsEnabled]) {
    v4 = @"ON";
  }
  else {
    v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)_neuralEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  if ([v3 automaticAccessibilityEnabled]) {
    v4 = @"ON";
  }
  else {
    v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (void)setDiscoveredTextEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverShouldSpeakDiscoveredText:v4];
}

- (id)_ocrEnabled:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverShouldSpeakDiscoveredText]);

  return v4;
}

- (id)_neuralFeedback:(id)a3
{
  v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverNeuralElementFeedback];

  CFStringRef v5 = @"FEEDBACK_PLAY_TONE";
  if (!v4) {
    CFStringRef v5 = @"FEEDBACK_SPEAK";
  }
  if (v4 == (unsigned char *)&dword_0 + 2) {
    v6 = @"FEEDBACK_DO_NOTHING";
  }
  else {
    v6 = (__CFString *)v5;
  }
  v7 = settingsLocString(v6, @"VoiceOverSettings");

  return v7;
}

@end