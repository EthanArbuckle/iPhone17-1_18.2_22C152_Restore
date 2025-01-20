@interface VoiceOverBrailleInputOutputController
- (BOOL)_isActivityMode;
- (BOOL)_isDisplayInput;
- (BOOL)_isGesturesInput;
- (BOOL)_shouldShowAutoTranslate;
- (BOOL)_shouldShowEightDotBraille;
- (BRLTTableEnumerator)tableEnumerator;
- (id)autoActivateOnTextFields:(id)a3;
- (id)brailleGestureControl:(id)a3;
- (id)brailleGesturesSoundOption:(id)a3;
- (id)displaysEnteredText:(id)a3;
- (id)gradeTwoAutoTranslatedEnabled:(id)a3;
- (id)shouldReverseDotsEnabled:(id)a3;
- (id)specifiers;
- (id)useActivationGestureEnabled:(id)a3;
- (id)usesHapticFeedback:(id)a3;
- (id)usesTypingSoundFeedback:(id)a3;
- (void)setAutoActivateOnTextFields:(id)a3 specifier:(id)a4;
- (void)setBrailleGestureControl:(id)a3 specifier:(id)a4;
- (void)setDisplaysEnteredText:(id)a3 specifier:(id)a4;
- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4;
- (void)setShouldReverseDotsEnabled:(id)a3 specifier:(id)a4;
- (void)setTableEnumerator:(id)a3;
- (void)setUseActivationGestureEnabled:(id)a3 specifier:(id)a4;
- (void)setUsesHapticsFeedback:(id)a3 specifier:(id)a4;
- (void)setUsesTypingSoundFeedback:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation VoiceOverBrailleInputOutputController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverBrailleInputOutputController;
  [(VoiceOverBrailleInputOutputController *)&v12 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __52__VoiceOverBrailleInputOutputController_viewDidLoad__block_invoke;
  v9[3] = &unk_208798;
  objc_copyWeak(&v10, &location);
  id v4 = objc_loadWeakRetained(&location);
  [v3 registerUpdateBlock:v9 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputMode" withListener:v4];

  objc_destroyWeak(&v10);
  v5 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__VoiceOverBrailleInputOutputController_viewDidLoad__block_invoke_2;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  id v6 = objc_loadWeakRetained(&location);
  [v5 registerUpdateBlock:v7 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputMode" withListener:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__VoiceOverBrailleInputOutputController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __52__VoiceOverBrailleInputOutputController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (BOOL)_isDisplayInput
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:PSIDKey];
  unsigned __int8 v4 = [v3 isEqualToString:@"BrailleDisplayInput"];

  return v4;
}

- (BOOL)_isActivityMode
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:PSIDKey];
  unsigned __int8 v4 = [v3 isEqualToString:@"VoiceOverBrailleActivityModeID"];

  return v4;
}

- (BOOL)_isGesturesInput
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:PSIDKey];
  unsigned __int8 v4 = [v3 isEqualToString:@"BrailleGesturesInput"];

  return v4;
}

- (BOOL)_shouldShowEightDotBraille
{
  if (![(VoiceOverBrailleInputOutputController *)self _isGesturesInput]) {
    return 1;
  }

  return AXDeviceSupportsManyTouches();
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  unsigned __int8 v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    uint64_t v108 = v3;
    v109 = v5;
    if (VOSCustomBrailleEnabled()
      && [(VoiceOverBrailleInputOutputController *)v2 _isGesturesInput])
    {
      id v6 = [(VoiceOverBrailleInputOutputController *)v2 loadSpecifiersFromPlistName:@"BrailleScreenInput" target:v2];
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v120 objects:v125 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v121;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v121 != v9) {
              objc_enumerationMutation(v6);
            }
            [v5 addObject:*(void *)(*((void *)&v120 + 1) + 8 * i)];
          }
          id v8 = [v6 countByEnumeratingWithState:&v120 objects:v125 count:16];
        }
        while (v8);
      }
      v11 = +[PSSpecifier emptyGroupSpecifier];
      objc_super v12 = AXLocStringForDeviceVariant();
      uint64_t v13 = PSFooterTextGroupKey;
      [v11 setProperty:v12 forKey:PSFooterTextGroupKey];

      [v5 addObject:v11];
      v14 = settingsLocString(@"USE_ACTIVATION_GESTURES", @"BrailleScreenInput");
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:v2 set:"setUseActivationGestureEnabled:specifier:" get:"useActivationGestureEnabled:" detail:0 cell:6 edit:0];

      uint64_t v16 = PSIDKey;
      [v15 setProperty:@"USE_ACTIVATION_GESTURES" forKey:PSIDKey];
      [v5 addObject:v15];
      v17 = +[PSSpecifier emptyGroupSpecifier];

      v18 = AXLocStringForDeviceVariant();
      [v17 setProperty:v18 forKey:v13];

      [v5 addObject:v17];
      v19 = settingsLocString(@"AUTO_ACTIVATE_ON_TEXT_FIELDS", @"BrailleScreenInput");
      +[PSSpecifier preferenceSpecifierNamed:v19 target:v2 set:"setAutoActivateOnTextFields:specifier:" get:"autoActivateOnTextFields:" detail:0 cell:6 edit:0];
      v21 = v20 = v2;

      [v21 setProperty:@"AUTO_ACTIVATE_ON_TEXT_FIELDS" forKey:v16];
      [v109 addObject:v21];
      v22 = +[PSSpecifier emptyGroupSpecifier];

      v23 = settingsLocString(@"CONTROL_DEVICE_USING_BRAILLE_GESTURE_DESCRIPTION", @"VoiceOverBrailleOptions");
      [v22 setProperty:v23 forKey:v13];

      [v109 addObject:v22];
      v24 = settingsLocString(@"CONTROL_DEVICE_USING_BRAILLE_GESTURE", @"VoiceOverBrailleOptions");
      v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:v20 set:"setBrailleGestureControl:specifier:" get:"brailleGestureControl:" detail:0 cell:6 edit:0];

      v2 = v20;
      [v25 setProperty:@"CONTROL_DEVICE_USING_BRAILLE_GESTURE" forKey:v16];
      [v109 addObject:v25];
      v26 = +[PSSpecifier emptyGroupSpecifier];

      v27 = AXLocStringForDeviceVariant();
      [v26 setProperty:v27 forKey:v13];

      [v109 addObject:v26];
      v28 = settingsLocString(@"SHOULD_REVERSE_DOTS", @"VoiceOverBrailleOptions");
      v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:v20 set:"setShouldReverseDotsEnabled:specifier:" get:"shouldReverseDotsEnabled:" detail:0 cell:6 edit:0];

      [v29 setProperty:@"SHOULD_REVERSE_DOTS" forKey:v16];
      [v109 addObject:v29];
      v30 = +[PSSpecifier emptyGroupSpecifier];

      v31 = AXLocStringForDeviceVariant();
      [v30 setProperty:v31 forKey:v13];

      [v109 addObject:v30];
      v32 = settingsLocString(@"DISPLAY_ENTERED_TEXT", @"BrailleScreenInput");
      v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:v20 set:"setDisplaysEnteredText:specifier:" get:"displaysEnteredText:" detail:0 cell:6 edit:0];

      [v33 setProperty:@"DISPLAY_ENTERED_TEXT" forKey:v16];
      [v109 addObject:v33];
      v34 = settingsLocString(@"TYPING_FEEDBACK", @"BrailleScreenInput");
      v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:v20 set:0 get:0 detail:0 cell:0 edit:0];

      [v35 setProperty:@"TYPING_FEEDBACK" forKey:v16];
      [v109 addObject:v35];
      v36 = settingsLocString(@"USE_TYPING_SOUND_FEEDBACK", @"BrailleScreenInput");
      v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:v2 set:"setUsesTypingSoundFeedback:specifier:" get:"usesTypingSoundFeedback:" detail:0 cell:6 edit:0];

      [v37 setProperty:@"USE_TYPING_SOUND_FEEDBACK" forKey:v16];
      [v109 addObject:v37];
      if ((AXDeviceIsPad() & 1) == 0)
      {
        v38 = settingsLocString(@"USE_HAPTIC_FEEDBACK", @"BrailleScreenInput");
        v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:v2 set:"setUsesHapticsFeedback:specifier:" get:"usesHapticFeedback:" detail:0 cell:6 edit:0];

        [v39 setProperty:@"USE_HAPTIC_FEEDBACK" forKey:v16];
        [v109 addObject:v39];
        v37 = v39;
      }
      v40 = settingsLocString(@"SOUND_OPTION", @"BrailleScreenInput");
      v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

      [v109 addObject:v41];
      v42 = settingsLocString(@"SOUND_OPTION_SPEAK_AND_SOUND", @"BrailleScreenInput");
      v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      [v43 setProperty:&off_229660 forKey:@"AXSVoiceOverTouchBrailleGesturesSoundOption"];
      [v109 addObject:v43];
      v44 = settingsLocString(@"SOUND_OPTION_SPEAK", @"BrailleScreenInput");
      v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      [v45 setProperty:&off_229678 forKey:@"AXSVoiceOverTouchBrailleGesturesSoundOption"];
      [v109 addObject:v45];
      v46 = settingsLocString(@"SOUND_OPTION_SOUND", @"BrailleScreenInput");
      v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      [v47 setProperty:&off_229690 forKey:@"AXSVoiceOverTouchBrailleGesturesSoundOption"];
      [v109 addObject:v47];
    }
    else if ([(VoiceOverBrailleInputOutputController *)v2 _isGesturesInput])
    {
      v48 = +[AXSettings sharedInstance];
      unsigned __int8 v49 = [v48 voiceOverBrailleGesturesEnabled];

      if ((v49 & 1) == 0)
      {
        v50 = +[PSSpecifier emptyGroupSpecifier];
        v51 = settingsLocString(@"BRAILLE_GESTURES_PROMPT", @"VoiceOverBrailleOptions");
        [v50 setProperty:v51 forKey:PSFooterTextGroupKey];

        [v5 addObject:v50];
      }
    }
    if (VOSCustomBrailleEnabled())
    {
      v52 = objc_opt_new();
      if ([(VoiceOverBrailleInputOutputController *)v2 _isGesturesInput])
      {
        v53 = settingsLocString(@"BSI_TABLES", @"VoiceOverBrailleOptions");
        v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

        [v54 setProperty:@"BSI_TABLES" forKey:PSIDKey];
        [v52 addObject:v54];
      }
      v110 = v52;
      v55 = +[AXSettings sharedInstance];
      v56 = [v55 voiceOverBrailleLanguageRotorItems];

      v57 = +[AXLanguageManager sharedInstance];
      v112 = [v57 userLocale];

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v58 = v56;
      id v59 = [v58 countByEnumeratingWithState:&v116 objects:v124 count:16];
      if (v59)
      {
        id v60 = v59;
        uint64_t v61 = *(void *)v117;
        id obj = v58;
        do
        {
          for (j = 0; j != v60; j = (char *)j + 1)
          {
            if (*(void *)v117 != v61) {
              objc_enumerationMutation(obj);
            }
            v63 = *(void **)(*((void *)&v116 + 1) + 8 * (void)j);
            v64 = [v63 objectForKeyedSubscript:@"Default"];
            unsigned int v65 = [v64 BOOLValue];

            if (v65)
            {
              v66 = [v63 objectForKeyedSubscript:@"LanguageDefaults"];
              v67 = [v112 localeIdentifier];
              v68 = [v66 objectForKeyedSubscript:v67];

              if (v68)
              {
                id v69 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v68];
              }
              else
              {
                v71 = [(VoiceOverBrailleInputOutputController *)v2 tableEnumerator];
                id v69 = [(id)objc_opt_class() defaultTableForLocale:v112];
              }
            }
            else
            {
              id v70 = objc_alloc((Class)BRLTTable);
              v66 = [v63 objectForKeyedSubscript:@"RotorItem"];
              id v69 = [v70 initWithIdentifier:v66];
            }

            v72 = [v69 replacements];
            id v73 = [v72 count];

            if (!v73
              && ([(VoiceOverBrailleInputOutputController *)v2 _shouldShowEightDotBraille]
               || ([v69 supportsTranslationMode8Dot] & 1) == 0))
            {
              v74 = [v69 localizedNameWithService];
              v75 = +[PSSpecifier preferenceSpecifierNamed:v74 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

              [v75 setProperty:&__kCFBooleanTrue forKey:@"IsLanguage"];
              [v75 setProperty:v69 forKey:@"Table"];
              v76 = [v69 identifier];
              [v75 setProperty:v76 forKey:@"TableIdentifier"];

              [v110 addObject:v75];
            }
          }
          id v58 = obj;
          id v60 = [obj countByEnumeratingWithState:&v116 objects:v124 count:16];
        }
        while (v60);
      }

      v77 = v109;
      v78 = v110;
      [v109 addObjectsFromArray:v110];
      [(VoiceOverBrailleInputOutputController *)v2 setDetailItems:v110];
      uint64_t v79 = v108;
      v80 = v112;
    }
    else
    {
      v81 = [(VoiceOverBrailleInputOutputController *)v2 specifier];
      uint64_t v82 = [v81 propertyForKey:@"AXVOBrailleTableGetterBlockKey"];

      if (v82
        && ((*(void (**)(uint64_t))(v82 + 16))(v82),
            v83 = objc_claimAutoreleasedReturnValue(),
            v83,
            v83))
      {
        uint64_t v84 = (*(void (**)(uint64_t))(v82 + 16))(v82);
      }
      else
      {
        uint64_t v84 = _AXSVoiceOverTouchCopyBrailleTableIdentifier();
      }
      uint64_t v85 = v84;
      id v86 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v84];
      v111 = (void *)v85;
      id v113 = v86;
      id obja = (id)v82;
      if (v85)
      {
        v87 = v86;
        id v88 = [v86 supportsTranslationModeContracted];
        id v89 = [v87 supportsTranslationMode8Dot];
      }
      else
      {
        id v88 = &dword_0 + 1;
        id v89 = &dword_0 + 1;
      }
      v90 = settingsLocString(@"SIXDOT_MODE", @"VoiceOverBrailleOptions");
      v91 = +[PSSpecifier preferenceSpecifierNamed:v90 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      uint64_t v92 = PSIDKey;
      [v91 setProperty:@"SixDotBraille" forKey:PSIDKey];
      v77 = v109;
      [v109 addObject:v91];
      if ([(VoiceOverBrailleInputOutputController *)v2 _shouldShowEightDotBraille])
      {
        v93 = settingsLocString(@"EIGHTDOT_MODE", @"VoiceOverBrailleOptions");
        v94 = +[PSSpecifier preferenceSpecifierNamed:v93 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

        [v94 setProperty:@"EightDotBraille" forKey:v92];
        v95 = +[NSNumber numberWithBool:v89];
        uint64_t v96 = PSEnabledKey;
        [v94 setProperty:v95 forKey:PSEnabledKey];

        [v109 addObject:v94];
        v91 = v94;
      }
      else
      {
        uint64_t v96 = PSEnabledKey;
      }
      v97 = settingsLocString(@"CONTRACTION_MODE", @"VoiceOverBrailleOptions");
      v98 = +[PSSpecifier preferenceSpecifierNamed:v97 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      [v98 setProperty:@"ContractedBraille" forKey:v92];
      v99 = +[NSNumber numberWithBool:v88];
      [v98 setProperty:v99 forKey:v96];

      [v109 addObject:v98];
      if ([(VoiceOverBrailleInputOutputController *)v2 _isDisplayInput])
      {
        v100 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

        [v109 addObject:v100];
        v101 = settingsLocString(@"GRADE2_AUTO_TRANSLATE", @"VoiceOverBrailleOptions");
        v98 = +[PSSpecifier preferenceSpecifierNamed:v101 target:v2 set:"setGradeTwoAutoTransateEnabled:specifier:" get:"gradeTwoAutoTranslatedEnabled:" detail:0 cell:6 edit:0];

        v77 = v109;
        [v98 setProperty:@"GRADE2_AUTO_TRANSLATE" forKey:v92];
        [v109 addObject:v98];
        v102 = +[NSNumber numberWithBool:[(VoiceOverBrailleInputOutputController *)v2 _shouldShowAutoTranslate]];
        [v98 setProperty:v102 forKey:v96];
      }
      uint64_t v79 = v108;
      v78 = v111;
      v80 = v113;
      id v58 = obja;
    }
    if (VOSCustomBrailleEnabled())
    {
      if ([(VoiceOverBrailleInputOutputController *)v2 _isDisplayInput])
      {
        v103 = +[AXSettings sharedInstance];
        id v104 = [v103 voiceOverTouchBrailleDisplaySyncInputOutputTables];
      }
      else
      {
        id v104 = 0;
      }
      id v105 = [(VoiceOverBrailleInputOutputController *)v2 specifiersByRemovingDetailItemsFromOriginalSpecifiers:v77 ifHidden:v104];
    }
    else
    {
      id v105 = v77;
    }
    v106 = *(void **)&v2->AXUISettingsBaseListController_opaque[v79];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v79] = v105;

    unsigned __int8 v4 = *(void **)&v2->AXUISettingsBaseListController_opaque[v79];
  }

  return v4;
}

NSString *__cdecl __51__VoiceOverBrailleInputOutputController_specifiers__block_invoke(id a1, NSString *a2)
{
  return (NSString *)settingsLocString(a2, @"BrailleScreenInput");
}

NSString *__cdecl __51__VoiceOverBrailleInputOutputController_specifiers__block_invoke_2(id a1, NSString *a2)
{
  return (NSString *)settingsLocString(a2, @"BrailleScreenInput");
}

NSString *__cdecl __51__VoiceOverBrailleInputOutputController_specifiers__block_invoke_3(id a1, NSString *a2)
{
  return (NSString *)settingsLocString(a2, @"VoiceOverBrailleOptions");
}

NSString *__cdecl __51__VoiceOverBrailleInputOutputController_specifiers__block_invoke_4(id a1, NSString *a2)
{
  return (NSString *)settingsLocString(a2, @"BrailleScreenInput");
}

- (BOOL)_shouldShowAutoTranslate
{
  if ([(VoiceOverBrailleInputOutputController *)self _isActivityMode]) {
    return 0;
  }
  int v3 = VOSCustomBrailleEnabled();
  unsigned __int8 v4 = +[AXSettings sharedInstance];
  v5 = v4;
  if (v3)
  {
    id v6 = [v4 voiceOverTouchBrailleDisplayInputTableIdentifier];

    id v7 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
    id v8 = [v7 candidateSelectionLanguage];
    BOOL v2 = [v8 length] == 0;
  }
  else
  {
    unint64_t v9 = (unint64_t)[v4 voiceOverTouchBrailleDisplayInputMode];

    return (v9 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v2;
}

- (id)gradeTwoAutoTranslatedEnabled:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverBrailleGradeTwoAutoTranslateEnabled]);

  return v4;
}

- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverBrailleGradeTwoAutoTranslateEnabled:v4];
}

- (id)shouldReverseDotsEnabled:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleShouldReverseDots]);

  return v4;
}

- (void)setShouldReverseDotsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setVoiceOverTouchBrailleShouldReverseDots:v5];
}

- (id)useActivationGestureEnabled:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGesturesActivationGestureEnabled]);

  return v4;
}

- (void)setUseActivationGestureEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AXSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setVoiceOverTouchBrailleGesturesActivationGestureEnabled:v5];
}

- (id)brailleGestureControl:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGestureControl]);

  return v4;
}

- (void)setBrailleGestureControl:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleGestureControl:v4];
}

- (id)usesHapticFeedback:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGesturesUsesHapticFeedback]);

  return v4;
}

- (void)setUsesHapticsFeedback:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleGesturesUsesHapticFeedback:v4];
}

- (id)usesTypingSoundFeedback:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGesturesUsesTypingSoundFeedback]);

  return v4;
}

- (void)setUsesTypingSoundFeedback:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleGesturesUsesTypingSoundFeedback:v4];
}

- (id)displaysEnteredText:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGesturesDisplaysEnteredText]);

  return v4;
}

- (void)setDisplaysEnteredText:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleGesturesDisplaysEnteredText:v4];
}

- (id)autoActivateOnTextFields:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverTouchBrailleGesturesAutoActivateOnTextFields]);

  return v4;
}

- (void)setAutoActivateOnTextFields:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverTouchBrailleGesturesAutoActivateOnTextFields:v4];
}

- (id)brailleGesturesSoundOption:(id)a3
{
  int v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverTouchBrailleGesturesSoundOption];

  CFStringRef v5 = @"SOUND_OPTION_SPEAK_AND_SOUND";
  if (v4 == (unsigned char *)&dword_0 + 1) {
    CFStringRef v5 = @"SOUND_OPTION_SOUND";
  }
  if (v4) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"SOUND_OPTION_SPEAK";
  }
  id v7 = settingsLocString(v6, @"BrailleScreenInput");

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v29 = a4;
  id v7 = [(VoiceOverBrailleInputOutputController *)self specifierForIndexPath:a5];
  if (VOSCustomBrailleEnabled())
  {
    id v8 = [v29 specifier];
    unint64_t v9 = [v8 propertyForKey:@"AXSVoiceOverTouchBrailleGesturesSoundOption"];

    if (v9)
    {
      id v10 = +[AXSettings sharedInstance];
      id v11 = [v10 voiceOverTouchBrailleGesturesSoundOption];

      objc_msgSend(v29, "setChecked:", objc_msgSend(v9, "integerValue") == v11);
      goto LABEL_40;
    }
    v14 = [v7 propertyForKey:@"TableIdentifier"];
    v15 = [(VoiceOverBrailleInputOutputController *)self specifier];
    uint64_t v16 = [v15 propertyForKey:@"AXVOBrailleGetterBlockKey"];

    if (v16)
    {
      v17 = v16[2](v16);
      if (!v17) {
        goto LABEL_38;
      }
    }
    else
    {
      if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
      {
        v20 = +[AXSettings sharedInstance];
        uint64_t v21 = [v20 voiceOverTouchBrailleDisplayInputTableIdentifier];
      }
      else
      {
        unsigned int v26 = [(VoiceOverBrailleInputOutputController *)self _isGesturesInput];
        v27 = +[AXSettings sharedInstance];
        v20 = v27;
        if (v26) {
          [v27 voiceOverTouchBrailleGesturesInputTableIdentifier];
        }
        else {
        uint64_t v21 = [v27 voiceOverTouchBrailleDisplayOutputTableIdentifier];
        }
      }
      v17 = (void *)v21;

      if (!v17) {
        goto LABEL_38;
      }
    }
    if ([v14 isEqualToString:v17])
    {
      uint64_t v28 = 3;
LABEL_39:
      [v29 setAccessoryType:v28];

      goto LABEL_40;
    }
LABEL_38:
    uint64_t v28 = 0;
    goto LABEL_39;
  }
  unint64_t v9 = [v7 propertyForKey:PSIDKey];
  if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
  {
    objc_super v12 = +[AXSettings sharedInstance];
    uint64_t v13 = (uint64_t)[v12 voiceOverTouchBrailleDisplayInputMode];
  }
  else
  {
    if ([(VoiceOverBrailleInputOutputController *)self _isGesturesInput])
    {
      if ([v9 isEqualToString:@"SHOULD_REVERSE_DOTS"])
      {
        uint64_t v13 = 0;
      }
      else
      {
        v22 = +[AXSettings sharedInstance];
        uint64_t v13 = (uint64_t)[v22 voiceOverTouchBrailleGesturesInputMode];

        if (v13 == 2)
        {
          if (AXDeviceSupportsManyTouches()) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = 1;
          }
        }
      }
      goto LABEL_23;
    }
    v18 = [(VoiceOverBrailleInputOutputController *)self specifier];
    objc_super v12 = [v18 propertyForKey:@"AXVOBrailleGetterBlockKey"];

    if (v12)
    {
      v19 = v12[2](v12);
      uint64_t v13 = (int)[v19 intValue];
    }
    else
    {
      v19 = +[AXSettings sharedInstance];
      uint64_t v13 = (uint64_t)[v19 voiceOverTouchBrailleDisplayOutputMode];
    }
  }
LABEL_23:
  if ([v9 isEqualToString:@"SixDotBraille"])
  {
    uint64_t v23 = 1;
  }
  else
  {
    unsigned int v24 = [v9 isEqualToString:@"EightDotBraille"];
    uint64_t v23 = 2;
    if (!v24) {
      uint64_t v23 = 3;
    }
  }
  if (v23 == v13) {
    uint64_t v25 = 3;
  }
  else {
    uint64_t v25 = 0;
  }
  [v29 setAccessoryType:v25];
LABEL_40:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)VoiceOverBrailleInputOutputController;
  [(VoiceOverBrailleInputOutputController *)&v44 tableView:v6 didSelectRowAtIndexPath:v7];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = [v6 visibleCells];
  unint64_t v9 = (char *)[v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = __UIAccessibilitySafeClass();
        [v13 setChecked:0];
      }
      id v10 = (char *)[v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }

  v14 = [v6 cellForRowAtIndexPath:v7];
  v15 = __UIAccessibilitySafeClass();

  [v15 setChecked:1];
  uint64_t v16 = [(VoiceOverBrailleInputOutputController *)self specifierForIndexPath:v7];
  if (!VOSCustomBrailleEnabled())
  {
    uint64_t v21 = PSIDKey;
    v22 = [v16 propertyForKey:PSIDKey];
    if ([v22 isEqualToString:@"SixDotBraille"])
    {
      uint64_t v23 = 1;
    }
    else
    {
      unsigned int v24 = [v16 propertyForKey:v21];
      if ([v24 isEqualToString:@"EightDotBraille"]) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 3;
      }
    }
    uint64_t v25 = [(VoiceOverBrailleInputOutputController *)self specifier];
    unsigned int v26 = [v25 propertyForKey:@"AXVOBrailleSelectionBlock"];

    if (v26)
    {
      v27 = +[NSNumber numberWithInteger:v23];
      v26[2](v26, v27);
    }
    else if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
    {
      id v29 = +[AXSettings sharedInstance];
      [v29 setVoiceOverTouchBrailleDisplayInputMode:v23];

      v27 = [(VoiceOverBrailleInputOutputController *)self specifierForID:@"GRADE2_AUTO_TRANSLATE"];
      v30 = +[NSNumber numberWithBool:[(VoiceOverBrailleInputOutputController *)self _shouldShowAutoTranslate]];
      [v27 setProperty:v30 forKey:PSEnabledKey];

      [(VoiceOverBrailleInputOutputController *)self reloadSpecifier:v27];
    }
    else
    {
      unsigned int v31 = [(VoiceOverBrailleInputOutputController *)self _isGesturesInput];
      v32 = +[AXSettings sharedInstance];
      v27 = v32;
      if (v31) {
        [v32 setVoiceOverTouchBrailleGesturesInputMode:v23];
      }
      else {
        [v32 setVoiceOverTouchBrailleDisplayOutputMode:v23];
      }
    }
    goto LABEL_21;
  }
  v17 = [v16 propertyForKey:@"AXSVoiceOverTouchBrailleGesturesSoundOption"];
  if (!v17)
  {
    unsigned int v26 = [v16 propertyForKey:@"TableIdentifier"];
    uint64_t v28 = [(VoiceOverBrailleInputOutputController *)self specifier];
    v27 = [v28 propertyForKey:@"AXVOBrailleSelectionBlock"];

    if (v27)
    {
      v27[2](v27, v26);
LABEL_21:

      [(VoiceOverBrailleInputOutputController *)self reload];
      goto LABEL_22;
    }
    if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
    {
      v33 = +[AXSettings sharedInstance];
      [v33 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v26];

      v34 = [(VoiceOverBrailleInputOutputController *)self specifierForID:@"GRADE2_AUTO_TRANSLATE"];
      v35 = +[NSNumber numberWithBool:[(VoiceOverBrailleInputOutputController *)self _shouldShowAutoTranslate]];
      [v34 setProperty:v35 forKey:PSEnabledKey];

      [(VoiceOverBrailleInputOutputController *)self reloadSpecifier:v34];
    }
    else
    {
      unsigned int v36 = [(VoiceOverBrailleInputOutputController *)self _isGesturesInput];
      v37 = +[AXSettings sharedInstance];
      v34 = v37;
      if (v36)
      {
        [v37 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v26];
      }
      else
      {
        [v37 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v26];

        v38 = +[AXSettings sharedInstance];
        unsigned int v39 = [v38 voiceOverTouchBrailleDisplaySyncInputOutputTables];

        if (!v39) {
          goto LABEL_21;
        }
        v34 = +[AXSettings sharedInstance];
        [v34 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v26];
      }
    }

    goto LABEL_21;
  }
  v18 = v17;
  id v19 = [v17 integerValue];
  v20 = +[AXSettings sharedInstance];
  [v20 setVoiceOverTouchBrailleGesturesSoundOption:v19];

LABEL_22:
}

- (BRLTTableEnumerator)tableEnumerator
{
  tableEnumerator = self->_tableEnumerator;
  if (!tableEnumerator)
  {
    id v4 = +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath];
    CFStringRef v5 = self->_tableEnumerator;
    self->_tableEnumerator = v4;

    tableEnumerator = self->_tableEnumerator;
  }

  return tableEnumerator;
}

- (void)setTableEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end