@interface LiveSpeechController
- (AXSpeechSettingsModelController)speechModelController;
- (LiveSpeechController)init;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_liveSpeechEnabled:(id)a3;
- (id)_selectedVoiceNameForVoiceSpecifier:(id)a3;
- (id)specifiers;
- (void)_liveSpeechSetEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeechModelController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LiveSpeechController

- (LiveSpeechController)init
{
  v6.receiver = self;
  v6.super_class = (Class)LiveSpeechController;
  v2 = [(LiveSpeechController *)&v6 init];
  if (v2)
  {
    v3 = (AXSpeechSettingsModelController *)objc_alloc_init((Class)AXSpeechSettingsModelController);
    speechModelController = v2->_speechModelController;
    v2->_speechModelController = v3;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LiveSpeechController;
  [(LiveSpeechController *)&v4 viewWillAppear:a3];
  [(LiveSpeechController *)self reloadSpecifiers];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v64 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithID:@"TopLevelGroup"];
    objc_super v6 = AXLocStringKeyForHomeButtonAndExclusiveModel();
    uint64_t v7 = settingsLocString(v6, @"Accessibility");

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v5 setProperty:v9 forKey:PSFooterCellClassGroupKey];

    v67 = self;
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 bundlePath];
    [v5 setProperty:v11 forKey:@"bundlePath"];

    [v5 setProperty:@"Accessibility" forKey:@"table"];
    v98[0] = @"contentLabel";
    v98[1] = @"alreadyLocalized";
    v12 = &__kCFBooleanTrue;
    v63 = (void *)v7;
    v99[0] = v7;
    v99[1] = &__kCFBooleanTrue;
    v13 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
    v100 = v13;
    v14 = +[NSArray arrayWithObjects:&v100 count:1];
    id v15 = [v14 mutableCopy];

    uint64_t v16 = AXTeachableFeatureLiveSpeech;
    v65 = +[AXTeachableMomentsManager teachableItemsForFeature:AXTeachableFeatureLiveSpeech];
    v72 = v4;
    v66 = v15;
    if ([v65 count])
    {
      v70 = v5;
      v96[0] = @"moreLabel";
      v17 = settingsLocString(@"LiveSpeechWhatsNewLink", @"Accessibility");
      v97[0] = v17;
      v96[1] = @"additionalTitleLabel";
      v18 = settingsLocString(@"LIVE_SPEECH_TITLE", @"Accessibility");
      v97[1] = v18;
      v97[2] = &__kCFBooleanTrue;
      v96[2] = @"alreadyLocalized";
      v96[3] = @"symbolName";
      v97[3] = @"keyboard.and.waveform";
      v19 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:4];
      id v68 = [v19 mutableCopy];

      v20 = objc_opt_new();
      v94[0] = @"sectionLabel";
      v21 = +[AXTeachableMomentsManager notificationTitleForFeature:v16];
      v94[1] = @"alreadyLocalized";
      v95[0] = v21;
      v95[1] = &__kCFBooleanTrue;
      v22 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
      [v20 addObject:v22];

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = v65;
      id v23 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
      if (v23)
      {
        id v24 = v23;
        CFStringRef v25 = @"alreadyLocalized";
        uint64_t v26 = *(void *)v79;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v79 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            v91[0] = @"headerLabel";
            v29 = [v28 itemTitle];
            v92[0] = v29;
            v91[1] = @"contentLabel";
            v30 = [v28 itemDescription];
            v91[2] = v25;
            v92[1] = v30;
            v92[2] = v12;
            +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
            v31 = v12;
            v33 = CFStringRef v32 = v25;
            [v20 addObject:v33];

            CFStringRef v25 = v32;
            v12 = v31;
          }
          id v24 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
        }
        while (v24);
      }

      [v68 setObject:v20 forKey:@"additionalContent"];
      id v15 = v66;
      [v66 addObject:v68];

      v5 = v70;
      objc_super v4 = v72;
    }
    [v5 setProperty:v15 forKey:@"content"];
    [v4 addObject:v5];
    v34 = settingsLocString(@"LIVE_SPEECH_TITLE", @"Accessibility");
    v35 = v67;
    v36 = +[PSSpecifier preferenceSpecifierNamed:v34 target:v67 set:"_liveSpeechSetEnabled:specifier:" get:"_liveSpeechEnabled:" detail:0 cell:6 edit:0];

    uint64_t v37 = PSIDKey;
    [v36 setProperty:@"LIVE_SPEECH_SWITCH" forKey:PSIDKey];
    [v4 addObject:v36];
    if (AXDeviceSupportsLiveSpeechCategory())
    {
      v38 = +[PSSpecifier groupSpecifierWithID:@"CategoryPhrasesGroup"];

      v39 = settingsLocString(@"LIVE_SPEECH_PHRASES_FOOTER", @"Accessibility");
      uint64_t v40 = PSFooterTextGroupKey;
      [v38 setProperty:v39 forKey:PSFooterTextGroupKey];

      [v4 addObject:v38];
      v41 = settingsLocString(@"LIVE_SPEECH_PHRASES", @"Accessibility");
      v36 = +[PSSpecifier preferenceSpecifierNamed:v41 target:v67 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v36 setProperty:@"LiveSpeechCategoryManagement" forKey:v37];
      [v4 addObject:v36];
    }
    else
    {
      uint64_t v40 = PSFooterTextGroupKey;
    }
    v42 = settingsLocString(@"LIVE_SPEECH_VOICES", @"Accessibility");
    v43 = +[PSSpecifier groupSpecifierWithID:@"PreferredVoiceGroup" name:v42];

    v44 = settingsLocString(@"LIVE_SPEECH_VOICES_FOOTER", @"Accessibility");
    [v43 setProperty:v44 forKey:v40];

    [v4 addObject:v43];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v45 = +[UIKeyboardInputModeController sharedInputModeController];
    v46 = [v45 enabledInputModeLanguages];

    id v69 = v46;
    id v47 = [v46 countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v75;
      uint64_t v71 = PSEnabledKey;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v75 != v49) {
            objc_enumerationMutation(v69);
          }
          uint64_t v51 = *(void *)(*((void *)&v74 + 1) + 8 * (void)j);
          v52 = +[AXLanguageManager sharedInstance];
          v53 = [v52 dialectForLanguageID:v51];

          v54 = TUIKeyboardDisplayNameFromIdentifier();
          v55 = [v53 langMap];
          v56 = [v55 generalLanguageID];

          v57 = LiveSpeechLogCommon();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = [v53 specificLanguageID];
            *(_DWORD *)buf = 138413058;
            uint64_t v83 = v51;
            __int16 v84 = 2112;
            v85 = v54;
            __int16 v86 = 2112;
            v87 = v56;
            __int16 v88 = 2112;
            v89 = v58;
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_DEFAULT, "voice-for-kb row: keyboardID=%@ keyboardLocalizedName=%@ langID=%@ dialectID=%@", buf, 0x2Au);

            v35 = v67;
          }

          if (v54)
          {
            v59 = +[PSSpecifier preferenceSpecifierNamed:v54 target:v35 set:0 get:"_selectedVoiceNameForVoiceSpecifier:" detail:objc_opt_class() cell:2 edit:0];

            [v59 setProperty:v51 forKey:@"LiveSpeechKeyboardVoiceInfo"];
            [v59 setProperty:&__kCFBooleanTrue forKey:v71];
            [v72 addObject:v59];
            v43 = v59;
          }
        }
        id v48 = [v69 countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v48);
    }

    v60 = *(void **)&v35->AXUISettingsBaseListController_opaque[v64];
    *(void *)&v35->AXUISettingsBaseListController_opaque[v64] = v72;
    id v61 = v72;

    v3 = *(void **)&v35->AXUISettingsBaseListController_opaque[v64];
  }

  return v3;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    objc_super v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v4 _scaledValueForValue:40.0];
    float v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LiveSpeechController;
    -[LiveSpeechController tableView:heightForHeaderInSection:](&v8, "tableView:heightForHeaderInSection:", a3);
  }
  return result;
}

- (id)_liveSpeechEnabled:(id)a3
{
  v3 = (const void *)_AXSTripleClickCopyOptions();
  int v4 = _AXSTripleClickContainsOption();
  if (v3) {
    CFRelease(v3);
  }

  return +[NSNumber numberWithBool:v4 != 0];
}

- (void)_liveSpeechSetEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  double v5 = (const void *)_AXSTripleClickCopyOptions();
  unsigned int v6 = [v4 BOOLValue];

  int v7 = _AXSTripleClickContainsOption();
  if (!v6 || v7)
  {
    if (v7) {
      char v8 = v6;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0)
    {
      _AXSTripleClickRemoveOption();
      _AXSLiveSpeechSetEnabled();
    }
  }
  else
  {
    _AXSTripleClickAddOption();
  }
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id)_selectedVoiceNameForVoiceSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"LiveSpeechKeyboardVoiceInfo"];
  double v5 = [(AXSpeechSettingsModelController *)self->_speechModelController voiceIdentifierForLiveSpeechKeyboardID:v4];
  unsigned int v6 = AXVoiceNameForVoiceId();

  return v6;
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
}

@end