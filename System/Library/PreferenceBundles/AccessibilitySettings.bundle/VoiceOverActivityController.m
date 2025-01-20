@interface VoiceOverActivityController
- (BOOL)observingKeyValueChanges;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (id)_activityName:(id)a3;
- (id)_appContexts:(id)a3;
- (id)_contexts:(id)a3;
- (id)_navigationStyle:(id)a3;
- (id)_newActivityName;
- (id)_punctuationName:(id)a3;
- (id)_speechVoice:(id)a3;
- (id)_stringOutputForFeedback:(id)a3 value:(id)a4;
- (id)_stringOutputForOnOffSwitch:(id)a3 value:(id)a4;
- (id)_stringValueForNumber:(id)a3;
- (id)_typingStyle:(id)a3;
- (id)activity;
- (id)audioDucking:(id)a3;
- (id)brailleAlerts:(id)a3;
- (id)brailleAutoAdvanceDuration:(id)a3;
- (id)brailleFormatting:(id)a3;
- (id)brailleInputStatus:(id)a3;
- (id)brailleOutputStatus:(id)a3;
- (id)containerFeedback:(id)a3;
- (id)hintsEnabled:(id)a3;
- (id)imageDescriptions:(id)a3;
- (id)modifierKeys:(id)a3;
- (id)muteSound:(id)a3;
- (id)muteSpeech:(id)a3;
- (id)numberFeedbackString:(id)a3;
- (id)rowColumnNumbers:(id)a3;
- (id)speakEmojis:(id)a3;
- (id)specifiers;
- (id)speechRate:(id)a3;
- (id)statusCellGeneral:(id)a3;
- (id)statusCellText:(id)a3;
- (id)tableHeaders:(id)a3;
- (id)volume:(id)a3;
- (void)_save;
- (void)_setActivityName:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)editingChanged:(id)a3;
- (void)observeChanges;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActivity:(id)a3;
- (void)setAudioDucking:(id)a3 specifier:(id)a4;
- (void)setBrailleAlerts:(id)a3 specifier:(id)a4;
- (void)setBrailleFormatting:(id)a3 specifier:(id)a4;
- (void)setHintsEnabled:(id)a3 specifier:(id)a4;
- (void)setImageDescriptions:(id)a3 specifier:(id)a4;
- (void)setMuteSound:(id)a3 specifier:(id)a4;
- (void)setMuteSpeech:(id)a3 specifier:(id)a4;
- (void)setNumberFeedback:(id)a3 specifier:(id)a4;
- (void)setObservingKeyValueChanges:(BOOL)a3;
- (void)setRowColumNumbers:(id)a3 specifier:(id)a4;
- (void)setSpeakEmojis:(id)a3 specifier:(id)a4;
- (void)setSpeechRate:(id)a3 specifier:(id)a4;
- (void)setStatusCellGeneral:(id)a3 specifier:(id)a4;
- (void)setStatusCellText:(id)a3 specifier:(id)a4;
- (void)setTableHeaders:(id)a3 specifier:(id)a4;
- (void)setVolume:(id)a3 specifier:(id)a4;
- (void)stopObserving;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VoiceOverActivityController

- (id)activity
{
  activity = self->_activity;
  if (!activity)
  {
    v4 = [(VoiceOverActivityController *)self specifier];
    v5 = [v4 propertyForKey:@"activity"];
    v6 = self->_activity;
    self->_activity = v5;

    activity = self->_activity;
    if (!activity)
    {
      v7 = (AXVoiceOverActivity *)objc_opt_new();
      v8 = self->_activity;
      self->_activity = v7;

      id v9 = [(VoiceOverActivityController *)self _newActivityName];
      [(AXVoiceOverActivity *)self->_activity setName:v9];

      [(VoiceOverActivityController *)self _save];
      activity = self->_activity;
    }
  }
  v10 = activity;

  return v10;
}

- (id)_newActivityName
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 voiceOverActivities];

  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
        v10 = +[NSScanner localizedScannerWithString:v9];

        v11 = +[NSCharacterSet decimalDigitCharacterSet];
        v12 = [v11 invertedSet];
        [v10 setCharactersToBeSkipped:v12];

        int v17 = 0;
        [v10 scanInt:&v17];
        if (v6 <= v17) {
          uint64_t v6 = v17;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
    uint64_t v13 = v6 + 1;
  }
  else
  {
    uint64_t v13 = 1;
  }

  v14 = settingsLocString(@"VO_ACTIVITY_NEW_NAME_TEMPLATE", @"VoiceOverSettings");
  v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v13);

  return v15;
}

- (void)_save
{
  v2 = [(VoiceOverActivityController *)self activity];
  v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverActivities];
  id v5 = [v4 mutableCopy];

  id v6 = [v5 indexOfObject:v2];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v5 addObject:v2];
  }
  else {
    [v5 replaceObjectAtIndex:v6 withObject:v2];
  }
  uint64_t v7 = VOTLogActivities();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v2;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Saving activity: %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = +[AXSettings sharedInstance];
  [v8 setVoiceOverActivities:v5];

  id v9 = AXAssetAndDataClient();
  v10 = +[AXAccessQueue mainAccessQueue];
  [v9 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:2 targetAccessQueue:v10 completion:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    id v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    uint64_t v162 = v3;
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    uint64_t v7 = +[NSMutableArray array];
    v8 = settingsLocString(@"PUNCTUATION_GROUP_NAME_LABEL", @"VoiceOverSettings");
    id v9 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v8 target:self set:"_setActivityName:specifier:" get:"_activityName:" detail:0 cell:8 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setObject:@"GroupName" forKeyedSubscript:PSIDKey];
    [v9 setKeyboardType:0 autoCaps:2 autoCorrection:1];
    v161 = v9;
    [v7 addObject:v9];
    int v11 = +[PSSpecifier emptyGroupSpecifier];
    v12 = settingsLocString(@"ACTIVITY_SPEECH_GROUP_LABEL", @"VoiceOverSettings");
    [v11 setName:v12];

    v165 = v11;
    [v7 addObject:v11];
    uint64_t v13 = settingsLocString(@"ACTIVITIES_SPEECH_VOICE", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_speechVoice:" detail:objc_opt_class() cell:2 edit:0];

    v15 = [(VoiceOverActivityController *)self activity];
    [v14 setProperty:v15 forKey:@"activity"];

    uint64_t v163 = v10;
    [v14 setProperty:@"ACTIVITIES_SPEECH_VOICE" forKey:v10];
    v160 = v14;
    [v7 addObject:v14];
    v16 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setSpeechRate:specifier:" get:"speechRate:" detail:0 cell:5 edit:0];
    int v17 = AXTortoiseImage();
    uint64_t v18 = PSSliderLeftImageKey;
    [v16 setProperty:v17 forKey:PSSliderLeftImageKey];

    long long v19 = AXHareImage();
    uint64_t v20 = PSSliderRightImageKey;
    [v16 setProperty:v19 forKey:PSSliderRightImageKey];

    uint64_t v21 = PSControlMaximumKey;
    [v16 setProperty:&off_22C350 forKey:PSControlMaximumKey];
    uint64_t v22 = PSControlMinimumKey;
    [v16 setProperty:&off_22C360 forKey:PSControlMinimumKey];
    v23 = AXParameterizedLocalizedString();
    [v16 setAccessibilityLabel:v23];

    v159 = v16;
    v24 = v16;
    v25 = v7;
    [v7 addObject:v24];
    v26 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setVolume:specifier:" get:"volume:" detail:0 cell:5 edit:0];
    v27 = AXSpeakerMuteImage();
    [v26 setProperty:v27 forKey:v18];

    v28 = AXSpeakerMaxImage();
    [v26 setProperty:v28 forKey:v20];

    [v26 setProperty:&off_22C350 forKey:v21];
    [v26 setProperty:&off_22C360 forKey:v22];
    [v26 setProperty:&__kCFBooleanTrue forKey:PSIconImageShouldFlipForRightToLeftKey];
    v29 = settingsLocString(@"VO_VOLUME_SLIDER", @"VoiceOverSettings");
    [v26 setAccessibilityLabel:v29];

    v158 = v26;
    [v25 addObject:v26];
    objc_initWeak(location, self);
    v30 = settingsLocString(@"MUTE_SPEECH", @"VoiceOverSettings");
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:"setMuteSpeech:specifier:" get:"muteSpeech:" detail:objc_opt_class() cell:2 edit:0];

    v249[0] = _NSConcreteStackBlock;
    v249[1] = 3221225472;
    v249[2] = __41__VoiceOverActivityController_specifiers__block_invoke;
    v249[3] = &unk_209168;
    objc_copyWeak(&v250, location);
    v32 = objc_retainBlock(v249);
    [v31 setProperty:v32 forKey:@"setValueSelectedBlock"];

    v247[0] = _NSConcreteStackBlock;
    v247[1] = 3221225472;
    v247[2] = __41__VoiceOverActivityController_specifiers__block_invoke_2;
    v247[3] = &unk_209190;
    objc_copyWeak(&v248, location);
    v33 = objc_retainBlock(v247);
    [v31 setProperty:v33 forKey:@"getValueSelectedBlock"];

    [v25 addObject:v31];
    v34 = settingsLocString(@"MUTE_SOUND", @"VoiceOverSettings");
    v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:"setMuteSound:specifier:" get:"muteSound:" detail:objc_opt_class() cell:2 edit:0];

    v245[0] = _NSConcreteStackBlock;
    v245[1] = 3221225472;
    v245[2] = __41__VoiceOverActivityController_specifiers__block_invoke_3;
    v245[3] = &unk_209168;
    objc_copyWeak(&v246, location);
    v36 = objc_retainBlock(v245);
    [v35 setProperty:v36 forKey:@"setValueSelectedBlock"];

    v243[0] = _NSConcreteStackBlock;
    v243[1] = 3221225472;
    v243[2] = __41__VoiceOverActivityController_specifiers__block_invoke_4;
    v243[3] = &unk_2091B8;
    objc_copyWeak(&v244, location);
    v37 = objc_retainBlock(v243);
    [v35 setProperty:v37 forKey:@"getValueSelectedBlock"];

    v157 = v35;
    [v25 addObject:v35];
    v156 = v31;
    v38 = settingsLocString(@"AUDIO_DUCKING", @"VoiceOverSettings");
    v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:"setAudioDucking:specifier:" get:"audioDucking:" detail:objc_opt_class() cell:2 edit:0];

    v241[0] = _NSConcreteStackBlock;
    v241[1] = 3221225472;
    v241[2] = __41__VoiceOverActivityController_specifiers__block_invoke_5;
    v241[3] = &unk_209168;
    objc_copyWeak(&v242, location);
    v40 = objc_retainBlock(v241);
    [v39 setProperty:v40 forKey:@"setValueSelectedBlock"];

    v239[0] = _NSConcreteStackBlock;
    v239[1] = 3221225472;
    v239[2] = __41__VoiceOverActivityController_specifiers__block_invoke_6;
    v239[3] = &unk_2091B8;
    objc_copyWeak(&v240, location);
    v41 = objc_retainBlock(v239);
    [v39 setProperty:v41 forKey:@"getValueSelectedBlock"];

    v155 = v39;
    [v25 addObject:v39];
    v42 = +[PSSpecifier emptyGroupSpecifier];

    v43 = settingsLocString(@"ACTIVITY_VERBOSITY_GROUP_LABEL", @"VoiceOverSettings");
    [v42 setName:v43];

    [v25 addObject:v42];
    v44 = settingsLocString(@"ACTIVITIES_PUNCTUATION_GROUP", @"VoiceOverSettings");
    v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:self set:0 get:"_punctuationName:" detail:objc_opt_class() cell:2 edit:0];

    v46 = [(VoiceOverActivityController *)self activity];
    [v45 setProperty:v46 forKey:@"activity"];

    [v25 addObject:v45];
    v154 = v45;
    v47 = settingsLocString(@"EMOJIS", @"VoiceOverSettings");
    v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:"setSpeakEmojis:specifier:" get:"speakEmojis:" detail:objc_opt_class() cell:2 edit:0];

    v237[0] = _NSConcreteStackBlock;
    v237[1] = 3221225472;
    v237[2] = __41__VoiceOverActivityController_specifiers__block_invoke_7;
    v237[3] = &unk_209168;
    objc_copyWeak(&v238, location);
    v49 = objc_retainBlock(v237);
    [v48 setProperty:v49 forKey:@"setValueSelectedBlock"];

    v235[0] = _NSConcreteStackBlock;
    v235[1] = 3221225472;
    v235[2] = __41__VoiceOverActivityController_specifiers__block_invoke_8;
    v235[3] = &unk_209190;
    objc_copyWeak(&v236, location);
    v50 = objc_retainBlock(v235);
    [v48 setProperty:v50 forKey:@"getValueSelectedBlock"];

    [v25 addObject:v48];
    v51 = settingsLocString(@"CONTAINER_FEEDBACK", @"VoiceOverSettings");
    v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:0 get:"containerFeedback:" detail:objc_opt_class() cell:2 edit:0];

    v233[0] = _NSConcreteStackBlock;
    v233[1] = 3221225472;
    v233[2] = __41__VoiceOverActivityController_specifiers__block_invoke_9;
    v233[3] = &unk_2091E0;
    objc_copyWeak(&v234, location);
    v53 = objc_retainBlock(v233);
    [v52 setProperty:v53 forKey:@"setValueSelectedBlock"];

    [v52 setProperty:&__kCFBooleanTrue forKey:@"showDefaultOption"];
    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472;
    v231[2] = __41__VoiceOverActivityController_specifiers__block_invoke_10;
    v231[3] = &unk_209208;
    objc_copyWeak(&v232, location);
    v54 = objc_retainBlock(v231);
    [v52 setProperty:v54 forKey:@"getValueSelectedBlock"];

    v153 = v52;
    [v25 addObject:v52];
    v55 = settingsLocString(@"SPEAK_TABLE_HEADERS", @"VoiceOverSettings");
    v56 = +[PSSpecifier preferenceSpecifierNamed:v55 target:self set:"setTableHeaders:specifier:" get:"tableHeaders:" detail:objc_opt_class() cell:2 edit:0];

    v229[0] = _NSConcreteStackBlock;
    v229[1] = 3221225472;
    v229[2] = __41__VoiceOverActivityController_specifiers__block_invoke_11;
    v229[3] = &unk_209168;
    objc_copyWeak(&v230, location);
    v57 = objc_retainBlock(v229);
    [v56 setProperty:v57 forKey:@"setValueSelectedBlock"];

    v227[0] = _NSConcreteStackBlock;
    v227[1] = 3221225472;
    v227[2] = __41__VoiceOverActivityController_specifiers__block_invoke_12;
    v227[3] = &unk_209190;
    objc_copyWeak(&v228, location);
    v58 = objc_retainBlock(v227);
    [v56 setProperty:v58 forKey:@"getValueSelectedBlock"];

    v152 = v56;
    [v25 addObject:v56];
    v59 = settingsLocString(@"SPEAK_TABLE_ROW_COLUMN", @"VoiceOverSettings");
    v60 = +[PSSpecifier preferenceSpecifierNamed:v59 target:self set:"setRowColumNumbers:specifier:" get:"rowColumnNumbers:" detail:objc_opt_class() cell:2 edit:0];

    v225[0] = _NSConcreteStackBlock;
    v225[1] = 3221225472;
    v225[2] = __41__VoiceOverActivityController_specifiers__block_invoke_13;
    v225[3] = &unk_209168;
    objc_copyWeak(&v226, location);
    v61 = objc_retainBlock(v225);
    [v60 setProperty:v61 forKey:@"setValueSelectedBlock"];

    v223[0] = _NSConcreteStackBlock;
    v223[1] = 3221225472;
    v223[2] = __41__VoiceOverActivityController_specifiers__block_invoke_14;
    v223[3] = &unk_209190;
    objc_copyWeak(&v224, location);
    v62 = objc_retainBlock(v223);
    [v60 setProperty:v62 forKey:@"getValueSelectedBlock"];

    v151 = v60;
    [v25 addObject:v60];
    v63 = +[NSProcessInfo processInfo];
    if ((unint64_t)[v63 physicalMemory] >= 0x77359400)
    {
      int v64 = AXRuntimeCheck_HasANE();

      if (!v64)
      {
LABEL_6:
        v68 = settingsLocString(@"HINTS_TITLE", @"VoiceOverSettings");
        v69 = +[PSSpecifier preferenceSpecifierNamed:v68 target:self set:"setHintsEnabled:specifier:" get:"hintsEnabled:" detail:objc_opt_class() cell:2 edit:0];

        v217[0] = _NSConcreteStackBlock;
        v217[1] = 3221225472;
        v217[2] = __41__VoiceOverActivityController_specifiers__block_invoke_17;
        v217[3] = &unk_209168;
        objc_copyWeak(&v218, location);
        v70 = objc_retainBlock(v217);
        [v69 setProperty:v70 forKey:@"setValueSelectedBlock"];

        v215[0] = _NSConcreteStackBlock;
        v215[1] = 3221225472;
        v215[2] = __41__VoiceOverActivityController_specifiers__block_invoke_18;
        v215[3] = &unk_209190;
        objc_copyWeak(&v216, location);
        v71 = objc_retainBlock(v215);
        [v69 setProperty:v71 forKey:@"getValueSelectedBlock"];

        v150 = v69;
        [v25 addObject:v69];
        v72 = settingsLocString(@"NUMBER_FEEDBACK", @"VoiceOverSettings");
        v73 = +[PSSpecifier preferenceSpecifierNamed:v72 target:self set:0 get:"numberFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

        v213[0] = _NSConcreteStackBlock;
        v213[1] = 3221225472;
        v213[2] = __41__VoiceOverActivityController_specifiers__block_invoke_19;
        v213[3] = &unk_209168;
        objc_copyWeak(&v214, location);
        v74 = objc_retainBlock(v213);
        [v73 setProperty:v74 forKey:@"setValueSelectedBlock"];

        v211[0] = _NSConcreteStackBlock;
        v211[1] = 3221225472;
        v211[2] = __41__VoiceOverActivityController_specifiers__block_invoke_20;
        v211[3] = &unk_2091B8;
        objc_copyWeak(&v212, location);
        v75 = objc_retainBlock(v211);
        [v73 setProperty:v75 forKey:@"getValueSelectedBlock"];

        [v73 setProperty:&__kCFBooleanTrue forKey:@"showDefault"];
        [v25 addObject:v73];
        v76 = +[PSSpecifier emptyGroupSpecifier];

        v77 = settingsLocString(@"ACTIVITY_TYPING_GROUP_LABEL", @"VoiceOverSettings");
        [v76 setName:v77];

        [v25 addObject:v76];
        v148 = v73;
        v149 = v48;
        v78 = settingsLocString(@"TYPING_MODE_TITLE", @"VoiceOverSettings");
        v79 = +[PSSpecifier preferenceSpecifierNamed:v78 target:self set:0 get:"_typingStyle:" detail:objc_opt_class() cell:2 edit:0];

        uint64_t v80 = PSValidTitlesKey;
        [v79 setProperty:&off_22BCD8 forKey:PSValidTitlesKey];
        uint64_t v81 = PSStringsKey;
        [v79 setProperty:@"VoiceOverSettings" forKey:PSStringsKey];
        uint64_t v82 = PSValidValuesKey;
        [v79 setProperty:&off_22BCF0 forKey:PSValidValuesKey];
        v209[0] = _NSConcreteStackBlock;
        v209[1] = 3221225472;
        v209[2] = __41__VoiceOverActivityController_specifiers__block_invoke_446;
        v209[3] = &unk_2091B8;
        objc_copyWeak(&v210, location);
        v83 = objc_retainBlock(v209);
        [v79 setProperty:v83 forKey:@"blockGetter"];

        objc_initWeak(&from, v79);
        v205[0] = _NSConcreteStackBlock;
        v205[1] = 3221225472;
        v205[2] = __41__VoiceOverActivityController_specifiers__block_invoke_2_450;
        v205[3] = &unk_209230;
        objc_copyWeak(&v206, location);
        objc_copyWeak(&v207, &from);
        v84 = objc_retainBlock(v205);
        [v79 setProperty:v84 forKey:@"blockSetter"];

        v166 = v79;
        [v79 setProperty:@"VoiceOverSettings" forKey:v81];
        [v79 setProperty:@"TYPING_MODE_TITLE" forKey:v163];
        v85 = [(VoiceOverActivityController *)self activity];
        [v79 setProperty:v85 forKey:@"activity"];

        [v25 addObject:v79];
        v86 = +[PSSpecifier emptyGroupSpecifier];

        v87 = settingsLocString(@"ACTIVITY_NAVIGATION_GROUP_LABEL", @"VoiceOverSettings");
        [v86 setName:v87];

        [v25 addObject:v86];
        v88 = settingsLocString(@"NavigationStyle", @"VoiceOverSettings");
        v89 = +[PSSpecifier preferenceSpecifierNamed:v88 target:self set:0 get:"_navigationStyle:" detail:objc_opt_class() cell:2 edit:0];

        [v89 setProperty:&off_22BD08 forKey:v80];
        [v89 setProperty:@"VoiceOverSettings" forKey:v81];
        [v89 setProperty:&off_22BD20 forKey:v82];
        v203[0] = _NSConcreteStackBlock;
        v203[1] = 3221225472;
        v203[2] = __41__VoiceOverActivityController_specifiers__block_invoke_481;
        v203[3] = &unk_2091B8;
        objc_copyWeak(&v204, location);
        v90 = objc_retainBlock(v203);
        [v89 setProperty:v90 forKey:@"blockGetter"];

        objc_initWeak(&v202, v89);
        v199[0] = _NSConcreteStackBlock;
        v199[1] = 3221225472;
        v199[2] = __41__VoiceOverActivityController_specifiers__block_invoke_2_482;
        v199[3] = &unk_209230;
        objc_copyWeak(&v200, location);
        objc_copyWeak(&v201, &v202);
        v91 = objc_retainBlock(v199);
        [v89 setProperty:v91 forKey:@"blockSetter"];

        v164 = v89;
        [v89 setProperty:@"VoiceOverSettings" forKey:v81];
        [v89 setProperty:@"NAVIGATION_STYLE_TITLE" forKey:v163];
        v92 = [(VoiceOverActivityController *)self activity];
        [v89 setProperty:v92 forKey:@"activity"];

        [v25 addObject:v89];
        v93 = +[PSSpecifier emptyGroupSpecifier];

        v94 = settingsLocString(@"ACTIVITY_BRAILLE_LABEL", @"VoiceOverSettings");
        [v93 setName:v94];

        [v25 addObject:v93];
        v95 = settingsLocString(@"ACTIVITY_STATUS_CELL_GENERAL", @"VoiceOverSettings");
        v96 = +[PSSpecifier preferenceSpecifierNamed:v95 target:self set:"setStatusCellGeneral:specifier:" get:"statusCellGeneral:" detail:objc_opt_class() cell:2 edit:0];

        v197[0] = _NSConcreteStackBlock;
        v197[1] = 3221225472;
        v197[2] = __41__VoiceOverActivityController_specifiers__block_invoke_3_496;
        v197[3] = &unk_209168;
        objc_copyWeak(&v198, location);
        v97 = objc_retainBlock(v197);
        [v96 setProperty:v97 forKey:@"setValueSelectedBlock"];

        v195[0] = _NSConcreteStackBlock;
        v195[1] = 3221225472;
        v195[2] = __41__VoiceOverActivityController_specifiers__block_invoke_4_497;
        v195[3] = &unk_209190;
        objc_copyWeak(&v196, location);
        v98 = objc_retainBlock(v195);
        [v96 setProperty:v98 forKey:@"getValueSelectedBlock"];

        v147 = v96;
        [v25 addObject:v96];
        v99 = settingsLocString(@"ACTIVITY_STATUS_CELL_TEXT", @"VoiceOverSettings");
        v100 = +[PSSpecifier preferenceSpecifierNamed:v99 target:self set:"setStatusCellText:specifier:" get:"statusCellText:" detail:objc_opt_class() cell:2 edit:0];

        v193[0] = _NSConcreteStackBlock;
        v193[1] = 3221225472;
        v193[2] = __41__VoiceOverActivityController_specifiers__block_invoke_5_505;
        v193[3] = &unk_209168;
        objc_copyWeak(&v194, location);
        v101 = objc_retainBlock(v193);
        [v100 setProperty:v101 forKey:@"setValueSelectedBlock"];

        v191[0] = _NSConcreteStackBlock;
        v191[1] = 3221225472;
        v191[2] = __41__VoiceOverActivityController_specifiers__block_invoke_6_506;
        v191[3] = &unk_209190;
        objc_copyWeak(&v192, location);
        v102 = objc_retainBlock(v191);
        [v100 setProperty:v102 forKey:@"getValueSelectedBlock"];

        v146 = v100;
        [v25 addObject:v100];
        v103 = settingsLocString(@"ACTIVITY_BRAILLE_OUTPUT", @"VoiceOverSettings");
        v104 = +[PSSpecifier preferenceSpecifierNamed:v103 target:self set:0 get:"brailleOutputStatus:" detail:objc_opt_class() cell:2 edit:0];

        [v104 setProperty:@"brailleOutputStatus" forKey:v163];
        v189[0] = _NSConcreteStackBlock;
        v189[1] = 3221225472;
        v189[2] = __41__VoiceOverActivityController_specifiers__block_invoke_7_516;
        v189[3] = &unk_209258;
        objc_copyWeak(&v190, location);
        v105 = objc_retainBlock(v189);
        [v104 setProperty:v105 forKey:@"AXVOBrailleGetterBlockKey"];

        v187[0] = _NSConcreteStackBlock;
        v187[1] = 3221225472;
        v187[2] = __41__VoiceOverActivityController_specifiers__block_invoke_8_521;
        v187[3] = &unk_209280;
        objc_copyWeak(&v188, location);
        v106 = objc_retainBlock(v187);
        [v104 setProperty:v106 forKey:@"AXVOBrailleSelectionBlock"];

        v185[0] = _NSConcreteStackBlock;
        v185[1] = 3221225472;
        v185[2] = __41__VoiceOverActivityController_specifiers__block_invoke_9_526;
        v185[3] = &unk_209258;
        objc_copyWeak(&v186, location);
        v107 = objc_retainBlock(v185);
        [v104 setProperty:v107 forKey:@"AXVOBrailleTableGetterBlockKey"];

        [v104 setProperty:@"VoiceOverBrailleActivityModeID" forKey:v163];
        [v25 addObject:v104];
        v145 = v104;
        v108 = settingsLocString(@"ACTIVITY_BRAILLE_INPUT", @"VoiceOverSettings");
        v109 = +[PSSpecifier preferenceSpecifierNamed:v108 target:self set:0 get:"brailleInputStatus:" detail:objc_opt_class() cell:2 edit:0];

        [v109 setProperty:@"brailleInputStatus" forKey:v163];
        v183[0] = _NSConcreteStackBlock;
        v183[1] = 3221225472;
        v183[2] = __41__VoiceOverActivityController_specifiers__block_invoke_10_538;
        v183[3] = &unk_209258;
        objc_copyWeak(&v184, location);
        v110 = objc_retainBlock(v183);
        [v109 setProperty:v110 forKey:@"AXVOBrailleGetterBlockKey"];

        v181[0] = _NSConcreteStackBlock;
        v181[1] = 3221225472;
        v181[2] = __41__VoiceOverActivityController_specifiers__block_invoke_11_539;
        v181[3] = &unk_209258;
        objc_copyWeak(&v182, location);
        v111 = objc_retainBlock(v181);
        [v109 setProperty:v111 forKey:@"AXVOBrailleTableGetterBlockKey"];

        [v109 setProperty:@"VoiceOverBrailleActivityModeID" forKey:v163];
        v179[0] = _NSConcreteStackBlock;
        v179[1] = 3221225472;
        v179[2] = __41__VoiceOverActivityController_specifiers__block_invoke_12_540;
        v179[3] = &unk_209280;
        objc_copyWeak(&v180, location);
        v112 = objc_retainBlock(v179);
        [v109 setProperty:v112 forKey:@"AXVOBrailleSelectionBlock"];

        v144 = v109;
        [v25 addObject:v109];
        v113 = settingsLocString(@"ACTIVITY_BRAILLE_AUTO_ADVANCE", @"VoiceOverSettings");
        v114 = +[PSSpecifier preferenceSpecifierNamed:v113 target:self set:0 get:"brailleAutoAdvanceDuration:" detail:objc_opt_class() cell:2 edit:0];

        v115 = [(VoiceOverActivityController *)self activity];
        [v114 setProperty:v115 forKey:@"activity"];

        [v25 addObject:v114];
        v143 = v114;
        v116 = settingsLocString(@"ACTIVITY_BRAILLE_ALERTS", @"VoiceOverSettings");
        v117 = +[PSSpecifier preferenceSpecifierNamed:v116 target:self set:"setBrailleAlerts:specifier:" get:"brailleAlerts:" detail:objc_opt_class() cell:2 edit:0];

        v177[0] = _NSConcreteStackBlock;
        v177[1] = 3221225472;
        v177[2] = __41__VoiceOverActivityController_specifiers__block_invoke_13_554;
        v177[3] = &unk_209168;
        objc_copyWeak(&v178, location);
        v118 = objc_retainBlock(v177);
        [v117 setProperty:v118 forKey:@"setValueSelectedBlock"];

        v175[0] = _NSConcreteStackBlock;
        v175[1] = 3221225472;
        v175[2] = __41__VoiceOverActivityController_specifiers__block_invoke_14_555;
        v175[3] = &unk_209190;
        objc_copyWeak(&v176, location);
        v119 = objc_retainBlock(v175);
        [v117 setProperty:v119 forKey:@"getValueSelectedBlock"];

        v142 = v117;
        [v25 addObject:v117];
        v120 = settingsLocString(@"ACTIVITY_BRAILLE_FORMATTING", @"VoiceOverSettings");
        v121 = +[PSSpecifier preferenceSpecifierNamed:v120 target:self set:"setBrailleFormatting:specifier:" get:"brailleFormatting:" detail:objc_opt_class() cell:2 edit:0];

        v173[0] = _NSConcreteStackBlock;
        v173[1] = 3221225472;
        v173[2] = __41__VoiceOverActivityController_specifiers__block_invoke_15_563;
        v173[3] = &unk_209168;
        objc_copyWeak(&v174, location);
        v122 = objc_retainBlock(v173);
        [v121 setProperty:v122 forKey:@"setValueSelectedBlock"];

        v171[0] = _NSConcreteStackBlock;
        v171[1] = 3221225472;
        v171[2] = __41__VoiceOverActivityController_specifiers__block_invoke_16_564;
        v171[3] = &unk_209190;
        objc_copyWeak(&v172, location);
        v123 = objc_retainBlock(v171);
        [v121 setProperty:v123 forKey:@"getValueSelectedBlock"];

        [v25 addObject:v121];
        v124 = +[PSSpecifier emptyGroupSpecifier];

        v125 = settingsLocString(@"ACTIVITY_CONTEXT_SWITCH", @"VoiceOverSettings");
        [v124 setName:v125];

        v126 = settingsLocString(@"ACTIVITY_CONTEXT_SWITCH_FOOTER", @"VoiceOverSettings");
        [v124 setProperty:v126 forKey:PSFooterTextGroupKey];

        [v25 addObject:v124];
        v127 = settingsLocString(@"ACTIVITIES_CONTEXT_APP", @"VoiceOverSettings");
        v128 = +[PSSpecifier preferenceSpecifierNamed:v127 target:self set:0 get:"_appContexts:" detail:objc_opt_class() cell:2 edit:0];

        v129 = [(VoiceOverActivityController *)self activity];
        [v128 setProperty:v129 forKey:@"activity"];

        [v128 setProperty:@"apps" forKey:v163];
        [v25 addObject:v128];
        v130 = settingsLocString(@"ACTIVITIES_CONTEXTS", @"VoiceOverSettings");
        v131 = +[PSSpecifier preferenceSpecifierNamed:v130 target:self set:0 get:"_contexts:" detail:objc_opt_class() cell:2 edit:0];

        v132 = [(VoiceOverActivityController *)self activity];
        [v131 setProperty:v132 forKey:@"activity"];

        [v131 setProperty:@"contexts" forKey:v163];
        [v25 addObject:v131];
        v133 = +[PSSpecifier emptyGroupSpecifier];

        v134 = settingsLocString(@"ACTIVITIES_INTERACTION", @"VoiceOverSettings");
        [v133 setName:v134];

        [v25 addObject:v133];
        v135 = settingsLocString(@"MODIFIER_KEYS", @"VoiceOverSettings");
        v136 = +[PSSpecifier preferenceSpecifierNamed:v135 target:self set:0 get:"modifierKeys:" detail:objc_opt_class() cell:2 edit:0];

        [v136 setProperty:@"modifierKeys" forKey:v163];
        v169[0] = _NSConcreteStackBlock;
        v169[1] = 3221225472;
        v169[2] = __41__VoiceOverActivityController_specifiers__block_invoke_17_601;
        v169[3] = &unk_209168;
        objc_copyWeak(&v170, location);
        v137 = objc_retainBlock(v169);
        [v136 setProperty:v137 forKey:@"AXVOModifierKeySelectionBlock"];

        v167[0] = _NSConcreteStackBlock;
        v167[1] = 3221225472;
        v167[2] = __41__VoiceOverActivityController_specifiers__block_invoke_18_605;
        v167[3] = &unk_2091B8;
        objc_copyWeak(&v168, location);
        v138 = objc_retainBlock(v167);
        [v136 setProperty:v138 forKey:@"AXVOModifierKeyGetterBlock"];

        [v25 addObject:v136];
        id v139 = [v25 copy];
        v140 = *(void **)&self->AXUISettingsBaseListController_opaque[v162];
        *(void *)&self->AXUISettingsBaseListController_opaque[v162] = v139;

        objc_destroyWeak(&v168);
        objc_destroyWeak(&v170);

        objc_destroyWeak(&v172);
        objc_destroyWeak(&v174);

        objc_destroyWeak(&v176);
        objc_destroyWeak(&v178);

        objc_destroyWeak(&v180);
        objc_destroyWeak(&v182);
        objc_destroyWeak(&v184);

        objc_destroyWeak(&v186);
        objc_destroyWeak(&v188);
        objc_destroyWeak(&v190);

        objc_destroyWeak(&v192);
        objc_destroyWeak(&v194);

        objc_destroyWeak(&v196);
        objc_destroyWeak(&v198);

        objc_destroyWeak(&v201);
        objc_destroyWeak(&v200);
        objc_destroyWeak(&v202);
        objc_destroyWeak(&v204);

        objc_destroyWeak(&v207);
        objc_destroyWeak(&v206);
        objc_destroyWeak(&from);
        objc_destroyWeak(&v210);

        objc_destroyWeak(&v212);
        objc_destroyWeak(&v214);

        objc_destroyWeak(&v216);
        objc_destroyWeak(&v218);

        objc_destroyWeak(&v224);
        objc_destroyWeak(&v226);

        objc_destroyWeak(&v228);
        objc_destroyWeak(&v230);

        objc_destroyWeak(&v232);
        objc_destroyWeak(&v234);

        objc_destroyWeak(&v236);
        objc_destroyWeak(&v238);

        objc_destroyWeak(&v240);
        objc_destroyWeak(&v242);

        objc_destroyWeak(&v244);
        objc_destroyWeak(&v246);

        objc_destroyWeak(&v248);
        objc_destroyWeak(&v250);

        objc_destroyWeak(location);
        id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v162];
        goto LABEL_7;
      }
      v65 = settingsLocString(@"IMAGE_DESCRIPTIONS_TITLE", @"VoiceOverSettings");
      v63 = +[PSSpecifier preferenceSpecifierNamed:v65 target:self set:"setImageDescriptions:specifier:" get:"imageDescriptions:" detail:objc_opt_class() cell:2 edit:0];

      v221[0] = _NSConcreteStackBlock;
      v221[1] = 3221225472;
      v221[2] = __41__VoiceOverActivityController_specifiers__block_invoke_15;
      v221[3] = &unk_209168;
      objc_copyWeak(&v222, location);
      v66 = objc_retainBlock(v221);
      [v63 setProperty:v66 forKey:@"setValueSelectedBlock"];

      v219[0] = _NSConcreteStackBlock;
      v219[1] = 3221225472;
      v219[2] = __41__VoiceOverActivityController_specifiers__block_invoke_16;
      v219[3] = &unk_209190;
      objc_copyWeak(&v220, location);
      v67 = objc_retainBlock(v219);
      [v63 setProperty:v67 forKey:@"getValueSelectedBlock"];

      [v25 addObject:v63];
      objc_destroyWeak(&v220);
      objc_destroyWeak(&v222);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

void __41__VoiceOverActivityController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setMuteSpeech:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained muteSpeech:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setMuteSound:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained muteSound:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setAudioDucking:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained audioDucking:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSpeakEmojis:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained speakEmojis:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = +[NSNumber numberWithInteger:a2];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v5 = [WeakRetained activity];
    [v5 setContainerFeedback:v3];
  }
  else
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 32));
    id WeakRetained = [v3 activity];
    [WeakRetained setContainerFeedback:0];
  }

  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 reloadSpecifiers];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 containerFeedback];
  id v4 = [v3 integerValue];

  return v4;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_11(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setTableHeaders:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained tableHeaders:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setRowColumNumbers:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained rowColumnNumbers:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_15(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setImageDescriptions:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained imageDescriptions:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_17(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setHintsEnabled:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained hintsEnabled:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_19(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setNumberFeedback:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 numberFeedback];

  return v3;
}

_UNKNOWN **__41__VoiceOverActivityController_specifiers__block_invoke_446(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained activity];
  id v4 = [v3 typingStyle];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 activity];
    uint64_t v7 = [v6 typingStyle];
  }
  else
  {
    uint64_t v7 = &off_2290D8;
  }

  return v7;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_2_450(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 integerValue] == (id)-1)
  {

    id v7 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained activity];
  [v4 setTypingStyle:v7];

  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 reloadSpecifier:v6];
}

_UNKNOWN **__41__VoiceOverActivityController_specifiers__block_invoke_481(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained activity];
  id v4 = [v3 navigationStyle];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 activity];
    id v7 = [v6 navigationStyle];
  }
  else
  {
    id v7 = &off_229138;
  }

  return v7;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_2_482(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 integerValue] == (id)-1)
  {

    id v7 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained activity];
  [v4 setNavigationStyle:v7];

  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 reloadSpecifier:v6];
}

void __41__VoiceOverActivityController_specifiers__block_invoke_3_496(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setStatusCellGeneral:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_4_497(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained statusCellGeneral:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_5_505(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setStatusCellText:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_6_506(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained statusCellText:0];

  return v2;
}

id __41__VoiceOverActivityController_specifiers__block_invoke_7_516(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 brailleTable];

  return v3;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_8_521(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained activity];
  [v5 setBrailleTable:v3];

  id v6 = objc_loadWeakRetained(v2);
  [v6 reloadSpecifiers];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_9_526(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 brailleTable];

  return v3;
}

id __41__VoiceOverActivityController_specifiers__block_invoke_10_538(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 brailleInputTable];

  return v3;
}

id __41__VoiceOverActivityController_specifiers__block_invoke_11_539(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 brailleInputTable];

  return v3;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_12_540(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained activity];
  [v5 setBrailleInputTable:v3];

  id v6 = objc_loadWeakRetained(v2);
  [v6 reloadSpecifiers];
}

void __41__VoiceOverActivityController_specifiers__block_invoke_13_554(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setBrailleAlerts:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_14_555(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained brailleAlerts:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_15_563(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setBrailleFormatting:v3 specifier:0];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_16_564(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained brailleFormatting:0];

  return v2;
}

void __41__VoiceOverActivityController_specifiers__block_invoke_17_601(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained activity];
  [v5 setModifierKeys:v3];

  id v6 = objc_loadWeakRetained(v2);
  [v6 reloadSpecifiers];
}

id __41__VoiceOverActivityController_specifiers__block_invoke_18_605(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activity];
  id v3 = [v2 modifierKeys];

  return v3;
}

- (id)_stringOutputForFeedback:(id)a3 value:(id)a4
{
  id v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 containerFeedback];
  id v6 = +[AXVoiceOverFeedbackController descriptionForOption:v5];

  return v6;
}

- (id)_stringValueForNumber:(id)a3
{
  if (a3)
  {
    if ([a3 BOOLValue]) {
      id v4 = @"ON";
    }
    else {
      id v4 = @"OFF";
    }
    uint64_t v3 = vars8;
  }
  else
  {
    id v4 = @"DEFAULT";
  }
  return settingsLocString(v4, @"Accessibility");
}

- (id)_stringOutputForOnOffSwitch:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    id v8 = [(VoiceOverActivityController *)self _stringValueForNumber:v6];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (void)setAudioDucking:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setAudioDucking:v5];
}

- (id)audioDucking:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 audioDucking];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setMuteSpeech:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setSpeechMuted:v5];
}

- (id)muteSpeech:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 speechMuted];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setMuteSound:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setSoundMuted:v5];
}

- (id)muteSound:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 soundMuted];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (id)modifierKeys:(id)a3
{
  uint64_t v3 = [(VoiceOverActivityController *)self activity];
  id v4 = [v3 modifierKeys];

  if (v4) {
    +[VoiceOverModifierKeyController modifierShortStringDescription:](VoiceOverModifierKeyController, "modifierShortStringDescription:", (int)[v4 intValue]);
  }
  else {
  id v5 = settingsLocString(@"VOICEOVER_ACTIVITIES_DEFAULT", @"VoiceOverSettings");
  }

  return v5;
}

- (id)brailleInputStatus:(id)a3
{
  uint64_t v3 = [(VoiceOverActivityController *)self activity];
  id v4 = [v3 brailleInputTable];

  if (v4)
  {
    id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
    id v6 = [v5 localizedNameWithService];
  }
  else
  {
    id v6 = settingsLocString(@"VOICEOVER_ACTIVITIES_DEFAULT", @"VoiceOverSettings");
  }

  return v6;
}

- (id)brailleOutputStatus:(id)a3
{
  uint64_t v3 = [(VoiceOverActivityController *)self activity];
  id v4 = [v3 brailleTable];

  if (v4)
  {
    id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
    id v6 = [v5 localizedNameWithService];
  }
  else
  {
    id v6 = settingsLocString(@"VOICEOVER_ACTIVITIES_DEFAULT", @"VoiceOverSettings");
  }

  return v6;
}

- (id)brailleAutoAdvanceDuration:(id)a3
{
  uint64_t v3 = [(VoiceOverActivityController *)self activity];
  id v4 = [v3 brailleAutoAdvanceDuration];

  if (v4)
  {
    [v4 doubleValue];
  }
  else
  {
    id v5 = +[AXSettings sharedInstance];
    [v5 voiceOverBrailleAutoAdvanceDuration];
  }
  id v6 = AXLocalizedTimeSummary();

  return v6;
}

- (void)setImageDescriptions:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setImageDescriptions:v5];
}

- (id)imageDescriptions:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 imageDescriptions];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setSpeakEmojis:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setSpeakEmojis:v5];
}

- (id)containerFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 containerFeedback];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForFeedback:v4 value:v6];

  return v7;
}

- (id)speakEmojis:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 speakEmojis];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (id)_navigationStyle:(id)a3
{
  id v4 = [(VoiceOverActivityController *)self activity];
  uint64_t v5 = [v4 navigationStyle];
  if (!v5)
  {

    goto LABEL_7;
  }
  id v6 = (void *)v5;
  id v7 = [(VoiceOverActivityController *)self activity];
  id v8 = [v7 navigationStyle];
  unsigned int v9 = [v8 intValue];

  if (v9 == -1) {
    goto LABEL_7;
  }
  uint64_t v10 = [(VoiceOverActivityController *)self activity];
  int v11 = [v10 navigationStyle];
  uint64_t v12 = (int)[v11 intValue];

  if (v12 == 1)
  {
    uint64_t v13 = @"NAVIGATION_STYLE_GROUPS";
    goto LABEL_9;
  }
  if (v12)
  {
LABEL_7:
    uint64_t v13 = @"DEFAULT";
    v14 = @"Accessibility";
    goto LABEL_10;
  }
  uint64_t v13 = @"NAVIGATION_STYLE_FLAT";
LABEL_9:
  v14 = @"VoiceOverSettings";
LABEL_10:
  v15 = settingsLocString(v13, v14);

  return v15;
}

- (id)_typingStyle:(id)a3
{
  id v4 = [(VoiceOverActivityController *)self activity];
  uint64_t v5 = [v4 typingStyle];
  if (!v5)
  {

    goto LABEL_8;
  }
  id v6 = (void *)v5;
  id v7 = [(VoiceOverActivityController *)self activity];
  id v8 = [v7 typingStyle];
  unsigned int v9 = [v8 intValue];

  if (v9 == -1) {
    goto LABEL_8;
  }
  uint64_t v10 = [(VoiceOverActivityController *)self activity];
  int v11 = [v10 typingStyle];
  uint64_t v12 = (int)[v11 intValue];

  if (v12 == 2)
  {
    uint64_t v13 = @"TYPING_MODE_DIRECT_TOUCH";
    goto LABEL_11;
  }
  if (v12 == 1)
  {
    uint64_t v13 = @"TYPING_MODE_TOUCH_TYPING";
    goto LABEL_11;
  }
  if (v12)
  {
LABEL_8:
    uint64_t v13 = @"DEFAULT";
    v14 = @"Accessibility";
    goto LABEL_12;
  }
  uint64_t v13 = @"TYPING_MODE_STANDARD";
LABEL_11:
  v14 = @"VoiceOverSettings";
LABEL_12:
  v15 = settingsLocString(v13, v14);

  return v15;
}

- (void)setNumberFeedback:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setNumberFeedback:v5];
}

- (id)numberFeedbackString:(id)a3
{
  id v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 numberFeedback];

  if (!v5)
  {
    unsigned int v9 = @"DEFAULT";
    uint64_t v10 = @"Accessibility";
LABEL_8:
    int v11 = settingsLocString(v9, v10);
    goto LABEL_10;
  }
  id v6 = [(VoiceOverActivityController *)self activity];
  id v7 = [v6 numberFeedback];
  id v8 = (char *)[v7 integerValue];

  if (v8 == (unsigned char *)&dword_0 + 2)
  {
    unsigned int v9 = @"NUMBER_FEEDBACK_DIGITS";
    goto LABEL_7;
  }
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v9 = @"NUMBER_FEEDBACK_WORDS";
LABEL_7:
    uint64_t v10 = @"VoiceOverSettings";
    goto LABEL_8;
  }
  int v11 = 0;
LABEL_10:

  return v11;
}

- (void)setHintsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setHints:v5];
}

- (id)hintsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 hints];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setRowColumNumbers:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setTableRowAndColumn:v5];
}

- (id)rowColumnNumbers:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 tableRowAndColumn];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setTableHeaders:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setTableHeaders:v5];
}

- (id)tableHeaders:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 tableHeaders];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (id)brailleFormatting:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 brailleFormatting];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setBrailleFormatting:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setBrailleFormatting:v5];
}

- (id)brailleAlerts:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 brailleAlerts];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setBrailleAlerts:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setBrailleAlerts:v5];
}

- (id)statusCellText:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 brailleStatusCellText];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setStatusCellText:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setBrailleStatusCellText:v5];
}

- (id)statusCellGeneral:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverActivityController *)self activity];
  id v6 = [v5 brailleStatusCellGeneral];
  id v7 = [(VoiceOverActivityController *)self _stringOutputForOnOffSwitch:v4 value:v6];

  return v7;
}

- (void)setStatusCellGeneral:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(VoiceOverActivityController *)self activity];
  [v6 setBrailleStatusCellGeneral:v5];
}

- (id)_appContexts:(id)a3
{
  id v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 appIdentifiers];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(VoiceOverActivityController *)self activity];
    id v8 = [v7 appIdentifiers];
    unsigned int v9 = objc_msgSend(v8, "ax_filteredSetUsingBlock:", &__block_literal_global_6);
    uint64_t v10 = objc_msgSend(v9, "ax_mappedSetUsingBlock:", &__block_literal_global_631);
    int v11 = [v10 allObjects];
    uint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_634];
    uint64_t v13 = [v12 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL __44__VoiceOverActivityController__appContexts___block_invoke(id a1, NSString *a2, BOOL *a3)
{
  uint64_t v3 = AXAppNameForBundleId();
  BOOL v4 = v3 != 0;

  return v4;
}

NSString *__cdecl __44__VoiceOverActivityController__appContexts___block_invoke_2(id a1, NSString *a2)
{
  return (NSString *)AXAppNameForBundleId();
}

int64_t __44__VoiceOverActivityController__appContexts___block_invoke_3(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 localizedCompare:a3];
}

- (id)_contexts:(id)a3
{
  BOOL v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 textualContexts];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(VoiceOverActivityController *)self activity];
    id v8 = [v7 textualContexts];
    unsigned int v9 = objc_msgSend(v8, "ax_mappedSetUsingBlock:", &__block_literal_global_639);
    uint64_t v10 = [v9 allObjects];
    int v11 = [v10 componentsJoinedByString:@", "];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

NSString *__cdecl __41__VoiceOverActivityController__contexts___block_invoke(id a1, NSString *a2)
{
  return (NSString *)AXSSVoiceOverLocalizedNameForTextualContextIdentifier();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceOverActivityController;
  [(VoiceOverActivityController *)&v3 viewDidLoad];
  [(VoiceOverActivityController *)self observeChanges];
}

- (void)observeChanges
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = +[AXVoiceOverActivity observerKeys];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        unsigned int v9 = [(VoiceOverActivityController *)self activity];
        [v9 addObserver:self forKeyPath:v8 options:1 context:0];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(VoiceOverActivityController *)self setObservingKeyValueChanges:1];
}

- (void)stopObserving
{
  if ([(VoiceOverActivityController *)self observingKeyValueChanges])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v3 = +[AXVoiceOverActivity observerKeys];
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
          unsigned int v9 = [(VoiceOverActivityController *)self activity];
          [v9 removeObserver:self forKeyPath:v8 context:0];

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(VoiceOverActivityController *)self setObservingKeyValueChanges:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  uint64_t v8 = VOTLogActivities();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Activity changed: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(VoiceOverActivityController *)self _save];
    [(VoiceOverActivityController *)self reloadSpecifiers];
  }
}

- (void)setActivity:(id)a3
{
  id v4 = (AXVoiceOverActivity *)a3;
  [(VoiceOverActivityController *)self stopObserving];
  activity = self->_activity;
  self->_activity = v4;

  [(VoiceOverActivityController *)self observeChanges];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(VoiceOverActivityController *)self stopObserving];
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverActivityController;
  [(VoiceOverActivityController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VoiceOverActivityController;
  [(VoiceOverActivityController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(VoiceOverActivityController *)self specifierForID:@"GroupName"];
  id v5 = [(VoiceOverActivityController *)self cellForSpecifier:v4];

  uint64_t v6 = [v5 textField];
  [v6 setDelegate:self];

  id v7 = [v5 textField];
  [v7 addTarget:self action:"editingChanged:" forControlEvents:0x20000];
}

- (id)volume:(id)a3
{
  objc_super v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 volume];

  if (v5)
  {
    uint64_t v6 = [(VoiceOverActivityController *)self activity];
    id v7 = [v6 volume];
  }
  else
  {
    id v7 = &off_22C510;
  }

  return v7;
}

- (void)setVolume:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(VoiceOverActivityController *)self activity];
  [v6 setVolume:v5];

  [(VoiceOverActivityController *)self _save];
}

- (id)speechRate:(id)a3
{
  objc_super v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 speechRate];

  if (v5)
  {
    id v7 = [(VoiceOverActivityController *)self activity];
    objc_super v8 = [v7 speechRate];
  }
  else
  {
    *(float *)&double v6 = AVSpeechUtteranceDefaultSpeechRate;
    objc_super v8 = +[NSNumber numberWithFloat:v6];
  }

  return v8;
}

- (void)setSpeechRate:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  double v6 = [(VoiceOverActivityController *)self activity];
  [v6 setSpeechRate:v5];

  [(VoiceOverActivityController *)self _save];
}

- (id)_punctuationName:(id)a3
{
  objc_super v4 = [(VoiceOverActivityController *)self activity];
  id v5 = [v4 punctuationGroup];

  if (v5)
  {
    double v6 = +[AXSSPunctuationManager sharedDatabase];
    id v7 = [(VoiceOverActivityController *)self activity];
    objc_super v8 = [v7 punctuationGroup];
    int v9 = [v6 punctuationGroupForUUID:v8];
    id v10 = [v9 name];
  }
  else
  {
    id v10 = settingsLocString(@"VOICEOVER_ACTIVITIES_DEFAULT", @"VoiceOverSettings");
  }

  return v10;
}

- (id)_speechVoice:(id)a3
{
  objc_super v3 = [(VoiceOverActivityController *)self activity];
  objc_super v4 = [v3 voiceIdentifier];

  if (v4)
  {
    id v5 = +[TTSSpeechSynthesizer voiceForIdentifier:v4];
    double v6 = [v5 name];
  }
  else
  {
    double v6 = settingsLocString(@"VOICEOVER_ACTIVITIES_DEFAULT", @"VoiceOverSettings");
  }

  return v6;
}

- (void)editingChanged:(id)a3
{
  id v5 = [a3 text];
  objc_super v4 = +[PSSpecifier emptyGroupSpecifier];
  [(VoiceOverActivityController *)self _setActivityName:v5 specifier:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 1;
}

- (void)_setActivityName:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v5 = [(VoiceOverActivityController *)self activity];
    [v5 setName:v6];

    [(VoiceOverActivityController *)self _save];
  }
}

- (id)_activityName:(id)a3
{
  objc_super v3 = [(VoiceOverActivityController *)self activity];
  objc_super v4 = [v3 name];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 cellForRowAtIndexPath:v7];
  int v9 = [v8 specifier];
  uint64_t v10 = PSIDKey;
  long long v11 = [v9 propertyForKey:PSIDKey];
  unsigned int v12 = [v11 isEqualToString:@"ACTIVITIES_SPEECH_VOICE"];

  if (v12)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke;
    v29[3] = &unk_209388;
    v29[4] = self;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v28[3] = &unk_2093B0;
    v28[4] = self;
    long long v13 = +[VoiceOverActivityViewBridge makeViewControllerWithGet:v29 set:v28];
    v14 = settingsLocString(@"ACTIVITIES_SPEECH_VOICE", @"VoiceOverSettings");
    [(VoiceOverBrailleAllLanguagesController *)v13 setTitle:v14];

    [(VoiceOverActivityController *)self showController:v13];
  }
  else
  {
    v15 = [v9 propertyForKey:v10];
    unsigned int v16 = [v15 isEqualToString:@"brailleTable"];

    if (v16)
    {
      long long v13 = objc_alloc_init(VoiceOverBrailleAllLanguagesController);
      [(VoiceOverBrailleAllLanguagesController *)v13 setModalPresentationStyle:2];
      [(VoiceOverBrailleAllLanguagesController *)v13 setSpecifier:v9];
      id v17 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
      [(VoiceOverActivityController *)self presentViewController:v17 withTransition:8 completion:0];
      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
    else
    {
      uint64_t v18 = [v9 propertyForKey:v10];
      unsigned int v19 = [v18 isEqualToString:@"apps"];

      if (!v19)
      {
        v22.receiver = self;
        v22.super_class = (Class)VoiceOverActivityController;
        [(VoiceOverActivityController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
        goto LABEL_9;
      }
      long long v13 = objc_alloc_init(AXAppSelectionController);
      uint64_t v20 = [(VoiceOverActivityController *)self rootController];
      [(VoiceOverBrailleAllLanguagesController *)v13 setRootController:v20];

      [(VoiceOverBrailleAllLanguagesController *)v13 setSpecifier:v9];
      [(VoiceOverBrailleAllLanguagesController *)v13 setParentController:self];
      [(VoiceOverBrailleAllLanguagesController *)v13 setIncludesHomeScreen:1];
      [(VoiceOverActivityController *)self activity];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v26[3] = &unk_2093D8;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = v21;
      [(VoiceOverBrailleAllLanguagesController *)v13 setGetSelectedApps:v26];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v23[3] = &unk_209400;
      id v24 = v21;
      v25 = self;
      id v17 = v21;
      [(VoiceOverBrailleAllLanguagesController *)v13 setSetSelectedApps:v23];
      [(VoiceOverActivityController *)self showController:v13 animate:1];
    }
  }

LABEL_9:
}

id __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activity];
}

id __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setActivity:a2];
  [*(id *)(a1 + 32) _save];
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifiers];
}

id __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appIdentifiers];
  if (v2) {
    [*(id *)(a1 + 32) appIdentifiers];
  }
  else {
  objc_super v3 = +[NSSet set];
  }

  return v3;
}

id __65__VoiceOverActivityController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAppIdentifiers:a2];
  objc_super v3 = VOTLogActivities();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [*(id *)(a1 + 32) appIdentifiers];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Set apps: %@", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 40) _save];
}

- (BOOL)observingKeyValueChanges
{
  return self->_observingKeyValueChanges;
}

- (void)setObservingKeyValueChanges:(BOOL)a3
{
  self->_observingKeyValueChanges = a3;
}

- (void).cxx_destruct
{
}

@end