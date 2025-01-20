@interface VoiceOverPredictiveTypingFeedbackController
- (id)inlineTextCompletionAppearanceFeedbackString:(id)a3;
- (id)inlineTextCompletionInsertionFeedback:(id)a3;
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation VoiceOverPredictiveTypingFeedbackController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverPredictiveTypingFeedbackController;
  [(VoiceOverPredictiveTypingFeedbackController *)&v12 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __58__VoiceOverPredictiveTypingFeedbackController_viewDidLoad__block_invoke;
  v9[3] = &unk_208798;
  objc_copyWeak(&v10, &location);
  id v4 = objc_loadWeakRetained(&location);
  [v3 registerUpdateBlock:v9 forRetrieveSelector:"voiceOverInlineTextCompletionAppearanceFeedback" withListener:v4];

  objc_destroyWeak(&v10);
  v5 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __58__VoiceOverPredictiveTypingFeedbackController_viewDidLoad__block_invoke_2;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  id v6 = objc_loadWeakRetained(&location);
  [v5 registerUpdateBlock:v7 forRetrieveSelector:"voiceOverInlineTextCompletionInsertionFeedback" withListener:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__VoiceOverPredictiveTypingFeedbackController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"InlineTextCompletionAppearanceFeedback"];
}

void __58__VoiceOverPredictiveTypingFeedbackController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"InlineTextCompletionInsertionFeedback"];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = +[PSSpecifier groupSpecifierWithName:0];
    v7 = settingsLocString(@"PREDICTIVE_TEXT_APPEARANCE_FEEDBACK_FOOTER", @"VoiceOverSettings");
    uint64_t v21 = PSFooterTextGroupKey;
    objc_msgSend(v6, "setProperty:forKey:", v7);

    [v5 addObject:v6];
    id v8 = settingsLocString(@"PREDICTIVE_TEXT_APPEARANCE_FEEDBACK_TITLE", @"VoiceOverSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"inlineTextCompletionAppearanceFeedbackString:" detail:objc_opt_class() cell:2 edit:0];

    [v9 setProperty:&__block_literal_global_70 forKey:@"setValueSelectedBlock"];
    [v9 setProperty:&__block_literal_global_299 forKey:@"getValueSelectedBlock"];
    uint64_t v20 = PSIDKey;
    objc_msgSend(v9, "setProperty:forKey:", @"InlineTextCompletionAppearanceFeedback");
    uint64_t v19 = PSSpecifierIsSearchableKey;
    objc_msgSend(v9, "setProperty:forKey:", &__kCFBooleanFalse);
    uint64_t v10 = AXInBuddySetupKey;
    [v9 setProperty:&__kCFBooleanTrue forKey:AXInBuddySetupKey];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = PSCellClassKey;
    [v9 setProperty:v11 forKey:PSCellClassKey];
    [v5 addObject:v9];
    v13 = +[PSSpecifier groupSpecifierWithName:0];

    v14 = settingsLocString(@"PREDICTIVE_TEXT_INSERTION_FEEDBACK_FOOTER", @"VoiceOverSettings");
    [v13 setProperty:v14 forKey:v21];

    [v5 addObject:v13];
    v15 = settingsLocString(@"PREDICTIVE_TEXT_INSERTION_FEEDBACK_TITLE", @"VoiceOverSettings");
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"inlineTextCompletionInsertionFeedback:" detail:objc_opt_class() cell:2 edit:0];

    [v16 setProperty:&__block_literal_global_313 forKey:@"setValueSelectedBlock"];
    [v16 setProperty:&__block_literal_global_315_0 forKey:@"getValueSelectedBlock"];
    [v16 setProperty:@"InlineTextCompletionInsertionFeedback" forKey:v20];
    [v16 setProperty:&__kCFBooleanFalse forKey:v19];
    [v16 setProperty:&__kCFBooleanTrue forKey:v10];
    [v16 setProperty:objc_opt_class() forKey:v12];
    [v5 addObject:v16];
    v17 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __57__VoiceOverPredictiveTypingFeedbackController_specifiers__block_invoke(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverInlineTextCompletionAppearanceFeedback:a2];
}

int64_t __57__VoiceOverPredictiveTypingFeedbackController_specifiers__block_invoke_2(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverInlineTextCompletionAppearanceFeedback];

  return (int64_t)v2;
}

void __57__VoiceOverPredictiveTypingFeedbackController_specifiers__block_invoke_3(id a1, int64_t a2)
{
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverInlineTextCompletionInsertionFeedback:a2];
}

int64_t __57__VoiceOverPredictiveTypingFeedbackController_specifiers__block_invoke_4(id a1)
{
  v1 = +[AXSettings sharedInstance];
  id v2 = [v1 voiceOverInlineTextCompletionInsertionFeedback];

  return (int64_t)v2;
}

- (id)inlineTextCompletionAppearanceFeedbackString:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverInlineTextCompletionAppearanceFeedback]);
  id v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

- (id)inlineTextCompletionInsertionFeedback:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceOverInlineTextCompletionInsertionFeedback]);
  id v5 = +[AXVoiceOverFeedbackController descriptionForOption:v4];

  return v5;
}

@end