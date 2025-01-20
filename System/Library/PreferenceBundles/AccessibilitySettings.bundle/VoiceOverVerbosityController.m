@interface VoiceOverVerbosityController
- (id)actionConfirmation:(id)a3;
- (id)actionsFeedbackString:(id)a3;
- (id)capitalLetterString:(id)a3;
- (id)containerFeedback:(id)a3;
- (id)deletionFeedbackString:(id)a3;
- (id)emojiSuffix:(id)a3;
- (id)emojisFeedback:(id)a3;
- (id)flashlightNotifications:(id)a3;
- (id)hintsEnabled:(id)a3;
- (id)linkFeedbackString:(id)a3;
- (id)mediaDescriptionsString:(id)a3;
- (id)moreContentFeedback:(id)a3;
- (id)numberFeedbackString:(id)a3;
- (id)punctuationLevel:(id)a3;
- (id)rotorSummaryFeedback:(id)a3;
- (id)rowColumnNumbers:(id)a3;
- (id)sceneDescriptionsString:(id)a3;
- (id)speakNotifications:(id)a3;
- (id)specifiers;
- (id)tableHeaders:(id)a3;
- (id)voiceOverQuickNavAnnouncementFeedbackString:(id)a3;
- (void)setActionConfirmation:(id)a3 specifier:(id)a4;
- (void)setEmojiSuffixEnabled:(id)a3 specifier:(id)a4;
- (void)setHintsEnabled:(id)a3 specifier:(id)a4;
- (void)setRowColummNumbers:(id)a3 specifier:(id)a4;
- (void)setSpeakNotifications:(id)a3 specifier:(id)a4;
- (void)setTableHeaders:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation VoiceOverVerbosityController

- (void)viewDidLoad
{
  v56.receiver = self;
  v56.super_class = (Class)VoiceOverVerbosityController;
  [(VoiceOverVerbosityController *)&v56 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke;
  v53[3] = &unk_208798;
  objc_copyWeak(&v54, &location);
  id v4 = objc_loadWeakRetained(&location);
  [v3 registerUpdateBlock:v53 forRetrieveSelector:"voiceOverCapitalLetterFeedback" withListener:v4];

  objc_destroyWeak(&v54);
  v5 = +[AXSettings sharedInstance];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_2;
  v51[3] = &unk_208798;
  objc_copyWeak(&v52, &location);
  id v6 = objc_loadWeakRetained(&location);
  [v5 registerUpdateBlock:v51 forRetrieveSelector:"voiceOverDeletionFeedback" withListener:v6];

  objc_destroyWeak(&v52);
  v7 = +[AXSettings sharedInstance];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_3;
  v49[3] = &unk_208798;
  objc_copyWeak(&v50, &location);
  id v8 = objc_loadWeakRetained(&location);
  [v7 registerUpdateBlock:v49 forRetrieveSelector:"voiceOverPunctuationGroup" withListener:v8];

  objc_destroyWeak(&v50);
  v9 = +[AXSettings sharedInstance];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_4;
  v47[3] = &unk_208798;
  objc_copyWeak(&v48, &location);
  id v10 = objc_loadWeakRetained(&location);
  [v9 registerUpdateBlock:v47 forRetrieveSelector:"voiceOverLinkFeedback" withListener:v10];

  objc_destroyWeak(&v48);
  v11 = +[AXSettings sharedInstance];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_5;
  v45[3] = &unk_208798;
  objc_copyWeak(&v46, &location);
  id v12 = objc_loadWeakRetained(&location);
  [v11 registerUpdateBlock:v45 forRetrieveSelector:"voiceOverDescribedMedia" withListener:v12];

  objc_destroyWeak(&v46);
  v13 = +[AXSettings sharedInstance];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_6;
  v43[3] = &unk_208798;
  objc_copyWeak(&v44, &location);
  id v14 = objc_loadWeakRetained(&location);
  [v13 registerUpdateBlock:v43 forRetrieveSelector:"voiceOverActionsFeedback" withListener:v14];

  objc_destroyWeak(&v44);
  v15 = +[AXSettings sharedInstance];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_7;
  v41[3] = &unk_208798;
  objc_copyWeak(&v42, &location);
  id v16 = objc_loadWeakRetained(&location);
  [v15 registerUpdateBlock:v41 forRetrieveSelector:"voiceOverContainerOutputFeedback" withListener:v16];

  objc_destroyWeak(&v42);
  v17 = +[AXSettings sharedInstance];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_8;
  v39[3] = &unk_208798;
  objc_copyWeak(&v40, &location);
  id v18 = objc_loadWeakRetained(&location);
  [v17 registerUpdateBlock:v39 forRetrieveSelector:"voiceOverQuickNavAnnouncementFeedback" withListener:v18];

  objc_destroyWeak(&v40);
  v19 = +[AXSettings sharedInstance];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_9;
  v37[3] = &unk_208798;
  objc_copyWeak(&v38, &location);
  id v20 = objc_loadWeakRetained(&location);
  [v19 registerUpdateBlock:v37 forRetrieveSelector:"voiceOverMoreContentOutputFeedback" withListener:v20];

  objc_destroyWeak(&v38);
  v21 = +[AXSettings sharedInstance];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_10;
  v35[3] = &unk_208798;
  objc_copyWeak(&v36, &location);
  id v22 = objc_loadWeakRetained(&location);
  [v21 registerUpdateBlock:v35 forRetrieveSelector:"voiceOverSceneDescriptionsEnabled" withListener:v22];

  objc_destroyWeak(&v36);
  v23 = +[AXSettings sharedInstance];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_11;
  v33[3] = &unk_208798;
  objc_copyWeak(&v34, &location);
  id v24 = objc_loadWeakRetained(&location);
  [v23 registerUpdateBlock:v33 forRetrieveSelector:"voiceOverNumberFeedback" withListener:v24];

  objc_destroyWeak(&v34);
  v25 = +[AXSettings sharedInstance];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_12;
  v31[3] = &unk_208798;
  objc_copyWeak(&v32, &location);
  id v26 = objc_loadWeakRetained(&location);
  [v25 registerUpdateBlock:v31 forRetrieveSelector:"voiceOverVerbosityEmojiFeedback" withListener:v26];

  objc_destroyWeak(&v32);
  v27 = +[AXSettings sharedInstance];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_13;
  v29[3] = &unk_208798;
  objc_copyWeak(&v30, &location);
  id v28 = objc_loadWeakRetained(&location);
  [v27 registerUpdateBlock:v29 forRetrieveSelector:"voiceOverFlashlightNotificationsEnabled" withListener:v28];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverCapitalLetterFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverDeletionFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverPunctuationGroup"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverLinkFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverMediaDescriptions"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverActionsFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverContainerOutputFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverQuickNavAnnouncementFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverMoreContentOutputFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"sceneDescriptions"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverNumberFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverEmojiFeedback"];
}

void __43__VoiceOverVerbosityController_viewDidLoad__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"voiceOverFlashlightNotificationsEnabled"];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v76 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier emptyGroupSpecifier];
    id v6 = settingsLocString(@"PUNCTUATION_GROUP_FOOTER", @"VoiceOverSettings");
    uint64_t v77 = PSFooterTextGroupKey;
    objc_msgSend(v5, "setProperty:forKey:", v6);

    uint64_t v7 = AXInBuddySetupKey;
    objc_msgSend(v5, "setProperty:forKey:");
    [v4 addObject:v5];
    id v8 = settingsLocString(@"PUNCTUATION", @"VoiceOverSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    uint64_t v80 = PSIDKey;
    objc_msgSend(v9, "setProperty:forKey:", @"voiceOverPunctuationGroup");
    [v9 setProperty:&__kCFBooleanFalse forKey:v7];
    [v4 addObject:v9];
    id v10 = +[PSSpecifier emptyGroupSpecifier];

    [v10 setProperty:&__kCFBooleanTrue forKey:v7];
    [v4 addObject:v10];
    v11 = settingsLocString(@"HINTS_TITLE", @"VoiceOverSettings");
    id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setHintsEnabled:specifier:" get:"hintsEnabled:" detail:0 cell:6 edit:0];

    uint64_t v13 = PSSpecifierIsSearchableKey;
    [v12 setProperty:&__kCFBooleanFalse forKey:PSSpecifierIsSearchableKey];
    [v12 setProperty:&__kCFBooleanTrue forKey:v7];
    [v4 addObject:v12];
    id v14 = settingsLocString(@"ALWAYS_SPEAK_NOTIFICATIONS", @"VoiceOverSettings");
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v15 setProperty:&__kCFBooleanTrue forKey:v13];
    [v15 setProperty:@"SystemNotifications" forKey:v80];
    [v15 setProperty:&__kCFBooleanTrue forKey:v7];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = PSCellClassKey;
    [v15 setProperty:v16 forKey:PSCellClassKey];
    [v4 addObject:v15];
    id v18 = settingsLocString(@"QUICKNAV_ANNOUNCEMENTS", @"VoiceOverSettings");
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"voiceOverQuickNavAnnouncementFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v19 setProperty:&__block_literal_global_29 forKey:@"setValueSelectedBlock"];
    [v19 setProperty:&__block_literal_global_373 forKey:@"getValueSelectedBlock"];
    [v19 setProperty:&__kCFBooleanFalse forKey:v13];
    uint64_t v79 = v7;
    [v19 setProperty:&__kCFBooleanTrue forKey:v7];
    [v19 setProperty:@"voiceOverQuickNavAnnouncementFeedback" forKey:v80];
    uint64_t v81 = v17;
    [v19 setProperty:objc_opt_class() forKey:v17];
    v78 = v4;
    [v4 addObject:v19];
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      id v20 = settingsLocString(@"FLASHLIGHT_NOTIFICATIONS", @"VoiceOverSettings");
      objc_opt_class();
      v21 = self;
      id v22 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, 0);

      uint64_t v23 = v13;
      [v22 setProperty:&__kCFBooleanFalse forKey:v13];
      [v22 setProperty:@"voiceOverFlashlightNotificationsEnabled" forKey:v80];
      [v22 setProperty:&__kCFBooleanTrue forKey:v79];
      [v22 setProperty:&__block_literal_global_390 forKey:@"getValueSelectedBlock"];
      [v22 setProperty:&__block_literal_global_394 forKey:@"setValueSelectedBlock"];
      [v22 setProperty:objc_opt_class() forKey:v17];
      [v4 addObject:v22];
      v19 = v22;
    }
    else
    {
      uint64_t v23 = v13;
      v21 = self;
    }
    id v24 = +[PSSpecifier emptyGroupSpecifier];

    [v24 setProperty:&__kCFBooleanTrue forKey:v79];
    [v4 addObject:v24];
    v25 = settingsLocString(@"CAPITAL_LETTER", @"VoiceOverSettings");
    id v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:v21 set:0 get:"capitalLetterString:" detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:@"voiceOverCapitalLetterFeedback" forKey:v80];
    [v26 setProperty:&__kCFBooleanFalse forKey:v23];
    [v26 setProperty:&__kCFBooleanTrue forKey:v79];
    [v26 setProperty:objc_opt_class() forKey:v17];
    [v78 addObject:v26];
    v27 = settingsLocString(@"DELETION_FEEDBACK", @"VoiceOverSettings");
    id v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:v21 set:0 get:"deletionFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v28 setProperty:@"voiceOverDeletionFeedback" forKey:v80];
    [v28 setProperty:&__kCFBooleanFalse forKey:v23];
    [v28 setProperty:&__kCFBooleanTrue forKey:v79];
    [v28 setProperty:objc_opt_class() forKey:v17];
    [v78 addObject:v28];
    v29 = settingsLocString(@"LINK_ATTACHMENT_FEEDBACK", @"VoiceOverSettings");
    id v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v21 set:0 get:"linkFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v30 setProperty:&__block_literal_global_413 forKey:@"setValueSelectedBlock"];
    [v30 setProperty:&__block_literal_global_415 forKey:@"getValueSelectedBlock"];
    [v30 setProperty:&__kCFBooleanTrue forKey:@"supportsPitchWithoutSpeak"];
    [v30 setProperty:@"voiceOverLinkFeedback" forKey:v80];
    [v30 setProperty:&__kCFBooleanFalse forKey:v23];
    [v30 setProperty:&__kCFBooleanTrue forKey:v79];
    [v30 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v30];
    v31 = settingsLocString(@"ACTIONS_FEEDBACK", @"VoiceOverSettings");
    id v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:v21 set:0 get:"actionsFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v32 setProperty:&__block_literal_global_425 forKey:@"setValueSelectedBlock"];
    [v32 setProperty:&__block_literal_global_427 forKey:@"getValueSelectedBlock"];
    v33 = [[VOFeedbackExtraOnOffSwitch alloc] initWithTitle:&__block_literal_global_431 setter:&__block_literal_global_437 getter:&__block_literal_global_440_0];
    [v32 setProperty:v33 forKey:@"extraOnOffSwitchBlock"];

    [v32 setProperty:@"voiceOverActionsFeedback" forKey:v80];
    [v32 setProperty:&__kCFBooleanFalse forKey:v23];
    [v32 setProperty:&__kCFBooleanTrue forKey:v79];
    [v32 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v32];
    id v34 = settingsLocString(@"MORE_CONTENT_FEEDBACK", @"VoiceOverSettings");
    v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:"moreContentFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v35 setProperty:&__block_literal_global_450 forKey:@"setValueSelectedBlock"];
    [v35 setProperty:&__block_literal_global_452 forKey:@"getValueSelectedBlock"];
    [v35 setProperty:&__kCFBooleanTrue forKey:@"ignoreBrailleOption"];
    [v35 setProperty:@"voiceOverMoreContentOutputFeedback" forKey:v80];
    [v35 setProperty:&__kCFBooleanFalse forKey:v23];
    [v35 setProperty:&__kCFBooleanTrue forKey:v79];
    [v35 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v35];
    id v36 = settingsLocString(@"CONTAINER_FEEDBACK", @"VoiceOverSettings");
    v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:0 get:"containerFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v37 setProperty:&__block_literal_global_462 forKey:@"setValueSelectedBlock"];
    [v37 setProperty:&__block_literal_global_464 forKey:@"getValueSelectedBlock"];
    [v37 setProperty:@"voiceOverContainerOutputFeedback" forKey:v80];
    [v37 setProperty:&__kCFBooleanFalse forKey:v23];
    [v37 setProperty:&__kCFBooleanTrue forKey:v79];
    [v37 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v37];
    id v38 = settingsLocString(@"NUMBER_FEEDBACK", @"VoiceOverSettings");
    v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:0 get:"numberFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v39 setProperty:@"voiceOverNumberFeedback" forKey:v80];
    [v39 setProperty:&__kCFBooleanFalse forKey:v23];
    [v39 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v39];
    id v40 = settingsLocString(@"PREDICTIVE_TEXT_FEEDBACK", @"VoiceOverSettings");
    v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v41 setProperty:@"PREDICTIVE_TEXT_FEEDBACK" forKey:v80];
    [v78 addObject:v41];
    id v42 = settingsLocString(@"SPEAK_TABLE_HEADER", @"VoiceOverSettings");
    v43 = +[PSSpecifier groupSpecifierWithName:v42];

    id v44 = settingsLocString(@"SPEAK_TABLE_ROW_COLUMN_FOOTER", @"VoiceOverSettings");
    [v43 setProperty:v44 forKey:v77];

    [v43 setProperty:&__kCFBooleanFalse forKey:v23];
    [v43 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v43];
    v45 = settingsLocString(@"SPEAK_TABLE_HEADERS", @"VoiceOverSettings");
    id v46 = +[PSSpecifier preferenceSpecifierNamed:v45 target:self set:"setTableHeaders:specifier:" get:"tableHeaders:" detail:0 cell:6 edit:0];

    [v46 setProperty:@"speakTableHeader" forKey:v80];
    [v46 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v46];
    v47 = settingsLocString(@"SPEAK_TABLE_ROW_COLUMN", @"VoiceOverSettings");
    id v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:"setRowColummNumbers:specifier:" get:"rowColumnNumbers:" detail:0 cell:6 edit:0];

    [v48 setProperty:&__kCFBooleanTrue forKey:v23];
    [v48 setProperty:&__kCFBooleanTrue forKey:v79];
    [v48 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v48];
    v49 = settingsLocString(@"ROTOR_ACTIONS_HEADER", @"VoiceOverSettings");
    id v50 = +[PSSpecifier groupSpecifierWithName:v49];

    [v50 setProperty:&__kCFBooleanFalse forKey:v23];
    [v50 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v50];
    v51 = settingsLocString(@"ACTION_CONFIRMATION", @"VoiceOverSettings");
    id v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:"setActionConfirmation:specifier:" get:"actionConfirmation:" detail:0 cell:6 edit:0];

    [v52 setProperty:&__kCFBooleanTrue forKey:v79];
    [v52 setProperty:&__kCFBooleanTrue forKey:v23];
    [v52 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v52];
    v53 = settingsLocString(@"ROTOR_SUMMARY", @"VoiceOverSettings");
    id v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:self set:0 get:"rotorSummaryFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v54 setProperty:&__block_literal_global_515 forKey:@"setValueSelectedBlock"];
    [v54 setProperty:&__block_literal_global_517 forKey:@"getValueSelectedBlock"];
    [v54 setProperty:@"voiceOverRotorSummaryFeedback" forKey:v80];
    [v54 setProperty:&__kCFBooleanFalse forKey:v23];
    [v54 setProperty:&__kCFBooleanTrue forKey:v79];
    [v54 setProperty:&__kCFBooleanTrue forKey:@"ignoreSoundOption"];
    [v54 setProperty:&__kCFBooleanTrue forKey:@"ignorePitchOption"];
    [v54 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v54];
    v55 = +[PSSpecifier emptyGroupSpecifier];

    objc_super v56 = settingsLocString(@"EMOJI_SUFFIX_FOOTER", @"VoiceOverSettings");
    [v55 setProperty:v56 forKey:v77];

    [v55 setProperty:&__kCFBooleanTrue forKey:v79];
    [v55 setProperty:&__kCFBooleanFalse forKey:v23];
    [v78 addObject:v55];
    v57 = settingsLocString(@"EMOJIS", @"VoiceOverSettings");
    v58 = +[PSSpecifier preferenceSpecifierNamed:v57 target:self set:0 get:"emojisFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v58 setProperty:&__block_literal_global_536 forKey:@"setValueSelectedBlock"];
    [v58 setProperty:&__block_literal_global_538 forKey:@"getValueSelectedBlock"];
    [v58 setProperty:&__kCFBooleanTrue forKey:@"ignoreSoundOption"];
    [v58 setProperty:&__kCFBooleanTrue forKey:@"ignorePitchOption"];
    [v58 setProperty:@"voiceOverEmojiFeedback" forKey:v80];
    [v58 setProperty:&__kCFBooleanFalse forKey:v23];
    [v58 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v58];
    v59 = settingsLocString(@"EMOJI_SUFFIX", @"VoiceOverSettings");
    v60 = +[PSSpecifier preferenceSpecifierNamed:v59 target:self set:"setEmojiSuffixEnabled:specifier:" get:"emojiSuffix:" detail:0 cell:6 edit:0];

    [v60 setProperty:&__kCFBooleanTrue forKey:v23];
    [v60 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v60];
    v61 = +[PSSpecifier emptyGroupSpecifier];

    v62 = settingsLocString(@"MEDIA_DESC_FOOTER", @"VoiceOverSettings");
    [v61 setProperty:v62 forKey:v77];

    [v61 setProperty:&__kCFBooleanTrue forKey:v79];
    [v78 addObject:v61];
    v63 = +[NSProcessInfo processInfo];
    if ((unint64_t)[v63 physicalMemory] > 0x773593FF && AXRuntimeCheck_HasANE())
    {

      uint64_t v64 = v76;
      v65 = self;
      uint64_t v66 = v80;
    }
    else
    {
      v67 = +[NSProcessInfo processInfo];
      if ((unint64_t)[v67 physicalMemory] <= 0x773593FF)
      {

        uint64_t v64 = v76;
        v65 = self;
        uint64_t v66 = v80;
      }
      else
      {
        char v68 = AXRuntimeCheck_HasANE();

        uint64_t v64 = v76;
        v65 = self;
        uint64_t v66 = v80;
        if (v68) {
          goto LABEL_14;
        }
      }
      v69 = settingsLocString(@"VO_SCENE_DESCRIPTIONS", @"VoiceOverSettings");
      v70 = +[PSSpecifier preferenceSpecifierNamed:v69 target:v65 set:0 get:"sceneDescriptionsString:" detail:objc_opt_class() cell:2 edit:0];

      [v70 setProperty:@"sceneDescriptions" forKey:v66];
      [v70 setProperty:&__kCFBooleanTrue forKey:v79];
      [v78 addObject:v70];
      v61 = v70;
    }
LABEL_14:
    v71 = settingsLocString(@"MEDIA_DESC_TITLE", @"VoiceOverSettings");
    v72 = +[PSSpecifier preferenceSpecifierNamed:v71 target:v65 set:0 get:"mediaDescriptionsString:" detail:objc_opt_class() cell:2 edit:0];

    [v72 setProperty:@"voiceOverMediaDescriptions" forKey:v66];
    [v72 setProperty:&__kCFBooleanTrue forKey:v79];
    [v72 setProperty:objc_opt_class() forKey:v81];
    [v78 addObject:v72];
    [(VoiceOverVerbosityController *)v65 filterBuddy:v78];
    id v73 = [v78 copy];
    v74 = *(void **)&v65->AXUISettingsBaseListController_opaque[v64];
    *(void *)&v65->AXUISettingsBaseListController_opaque[v64] = v73;

    v3 = *(void **)&v65->AXUISettingsBaseListController_opaque[v64];
  }

  return v3;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverQuickNavAnnouncementFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_2(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverQuickNavAnnouncementFeedback];

  return (int64_t)v2;
}

NSNumber *__cdecl __42__VoiceOverVerbosityController_specifiers__block_invoke_3(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 voiceOverFlashlightNotificationsEnabled]);

  return (NSNumber *)v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_4(id a1, NSNumber *a2)
{
  BOOL v2 = [(NSNumber *)a2 BOOLValue];
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverFlashlightNotificationsEnabled:v2];
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_5(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverLinkFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_6(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverLinkFeedback];

  return (int64_t)v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_7(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverActionsFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_8(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverActionsFeedback];

  return (int64_t)v2;
}

NSString *__cdecl __42__VoiceOverVerbosityController_specifiers__block_invoke_9(id a1)
{
  return (NSString *)settingsLocString(@"ACTION_OUTPUT_FIRST_ITEM_ONLY", @"VoiceOverSettings");
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_10(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverActionFeedbackFirstInListOnly:v2];
}

BOOL __42__VoiceOverVerbosityController_specifiers__block_invoke_11(id a1)
{
  v1 = +[AXSettings sharedInstance];
  unsigned __int8 v2 = [v1 voiceOverActionFeedbackFirstInListOnly];

  return v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_12(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverMoreContentOutputFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_13(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverMoreContentOutputFeedback];

  return (int64_t)v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_14(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverContainerOutputFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_15(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverContainerOutputFeedback];

  return (int64_t)v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_16(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverRotorSummaryFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_17(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverRotorSummaryFeedback];

  return (int64_t)v2;
}

void __42__VoiceOverVerbosityController_specifiers__block_invoke_18(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverVerbosityEmojiFeedback:a2];
}

int64_t __42__VoiceOverVerbosityController_specifiers__block_invoke_19(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverVerbosityEmojiFeedback];

  return (int64_t)v2;
}

- (id)flashlightNotifications:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  if ([v3 voiceOverFlashlightNotificationsEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)emojisFeedback:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverVerbosityEmojiFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)linkFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverLinkFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)containerFeedback:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverContainerOutputFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)rotorSummaryFeedback:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverRotorSummaryFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)moreContentFeedback:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverMoreContentOutputFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)numberFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = (char *)[v3 voiceOverNumberFeedback];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v5 = @"NUMBER_FEEDBACK_WORDS";
    goto LABEL_5;
  }
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    v5 = @"NUMBER_FEEDBACK_DIGITS";
LABEL_5:
    id v6 = settingsLocString(v5, @"VoiceOverSettings");
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)actionsFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverActionsFeedback]);
  v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)deletionFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unint64_t v4 = (unint64_t)[v3 voiceOverDeletionFeedback];

  if (v4 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = settingsLocString(off_20A690[v4], @"VoiceOverSettings");
  }

  return v5;
}

- (id)punctuationLevel:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unint64_t v4 = [v3 voiceOverPunctuationGroup];
  v5 = AXSettingsNameForPunctuationGroupUUID(v4);

  return v5;
}

- (id)capitalLetterString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  unint64_t v4 = (unint64_t)[v3 voiceOverCapitalLetterFeedback];

  if (v4 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = settingsLocString(off_20A6B0[v4], @"VoiceOverSettings");
  }

  return v5;
}

- (void)setActionConfirmation:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeakActionConfirmation:v4];
}

- (id)actionConfirmation:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeakActionConfirmation]);

  return v4;
}

- (id)sceneDescriptionsString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  if ([v3 voiceOverSceneDescriptionsEnabled]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  id v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (id)mediaDescriptionsString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverDescribedMedia];
  id v4 = AXVoiceOverMediaDescriptionLocString();

  return v4;
}

- (void)setSpeakNotifications:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeakNotificationsEnabled:v4];
}

- (id)speakNotifications:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeakNotificationsEnabled]);

  return v4;
}

- (id)voiceOverQuickNavAnnouncementFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverQuickNavAnnouncementFeedback]);
  id v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (void)setHintsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverHintsEnabled:v4];
}

- (id)hintsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverHintsEnabled]);

  return v4;
}

- (void)setEmojiSuffixEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverVerbosityEmojiSuffixEnabled:v4];
}

- (id)emojiSuffix:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverVerbosityEmojiSuffixEnabled]);

  return v4;
}

- (void)setTableHeaders:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeakTableHeaders:v4];
}

- (id)tableHeaders:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeakTableHeaders]);

  return v4;
}

- (void)setRowColummNumbers:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeakTableColumnRowInformation:v4];
}

- (id)rowColumnNumbers:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeakTableColumnRowInformation]);

  return v4;
}

@end