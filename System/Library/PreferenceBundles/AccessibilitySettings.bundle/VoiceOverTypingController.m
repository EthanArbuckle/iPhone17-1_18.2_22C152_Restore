@interface VoiceOverTypingController
- (id)_keyboardTimeoutStart:(id)a3;
- (id)phoneticsEnabled:(id)a3;
- (id)specifiers;
- (id)typingMode:(id)a3;
- (id)voModifierKey:(id)a3;
- (void)viewDidLoad;
@end

@implementation VoiceOverTypingController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VoiceOverTypingController;
  [(VoiceOverTypingController *)&v10 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __40__VoiceOverTypingController_viewDidLoad__block_invoke;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  [v3 registerUpdateBlock:v7 forRetrieveSelector:"voiceOverContinuousPathKeyboardStartTimeout" withListener:self];

  objc_destroyWeak(&v8);
  v4 = +[AXSettings sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__VoiceOverTypingController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_208798;
  objc_copyWeak(&v6, &location);
  [v4 registerUpdateBlock:v5 forRetrieveSelector:"voiceOverKeyboardModifierChoice" withListener:self];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__VoiceOverTypingController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __40__VoiceOverTypingController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v24 = +[NSMutableArray array];
    id v6 = settingsLocString(@"TYPING_MODE_TITLE", @"VoiceOverSettings");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"typingMode:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v8 = PSValidTitlesKey;
    [v7 setProperty:&off_22BF30 forKey:PSValidTitlesKey];
    uint64_t v9 = PSValidValuesKey;
    [v7 setProperty:&off_22BF48 forKey:PSValidValuesKey];
    [v7 setProperty:&__block_literal_global_60 forKey:@"blockGetter"];
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __39__VoiceOverTypingController_specifiers__block_invoke_2;
    v25[3] = &unk_20BAC0;
    objc_copyWeak(&v26, &location);
    objc_super v10 = objc_retainBlock(v25);
    [v7 setProperty:v10 forKey:@"blockSetter"];

    uint64_t v11 = PSStringsKey;
    [v7 setProperty:@"VoiceOverSettings" forKey:PSStringsKey];
    [v7 setProperty:&__kCFBooleanTrue forKey:@"inBuddySetup"];
    uint64_t v12 = PSIDKey;
    [v7 setProperty:@"TYPING_MODE_TITLE" forKey:PSIDKey];
    [v24 addObject:v7];
    v13 = settingsLocString(@"PHONETICS_TITLE", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"phoneticsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    [v14 setProperty:&off_22BF60 forKey:v8];
    [v14 setProperty:&off_22BF78 forKey:v9];
    [v14 setProperty:&__block_literal_global_367 forKey:@"blockGetter"];
    [v14 setProperty:&__block_literal_global_369_0 forKey:@"blockSetter"];
    [v14 setProperty:@"VoiceOverSettings" forKey:v11];
    [v14 setProperty:&__kCFBooleanTrue forKey:@"inBuddySetup"];
    [v14 setProperty:@"PHONETICS_TITLE" forKey:v12];
    [v24 addObject:v14];
    v15 = settingsLocString(@"TYPING_FEEDBACK", @"VoiceOverSettings");
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v16 setProperty:@"VoiceOverTypingFeedbackSettings" forKey:@"searchPlist"];
    [v16 setProperty:&__kCFBooleanTrue forKey:@"inBuddySetup"];
    [v16 setProperty:@"TYPING_FEEDBACK" forKey:v12];
    [v24 addObject:v16];
    v17 = settingsLocString(@"MODIFIER_KEYS", @"VoiceOverSettings");
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"voModifierKey:" detail:objc_opt_class() cell:2 edit:0];

    [v18 setProperty:&__kCFBooleanTrue forKey:@"inBuddySetup"];
    [v18 setProperty:@"MODIFIER_KEYS" forKey:v12];
    [v24 addObject:v18];
    v19 = settingsLocString(@"KEYBOARD_TIMING_TIMEOUT", @"VoiceOverSettings");
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:"_keyboardTimeoutStart:" detail:objc_opt_class() cell:2 edit:0];

    [v20 setProperty:@"KEYBOARD_TIMING_TIMEOUT" forKey:v12];
    [v24 addObject:v20];
    id v21 = [v24 copy];
    v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v2];
    *(void *)&self->AXUISettingsBaseListController_opaque[v2] = v21;

    id v4 = *(id *)&self->AXUISettingsBaseListController_opaque[v2];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v4;
}

NSNumber *__cdecl __39__VoiceOverTypingController_specifiers__block_invoke(id a1)
{
  uint64_t v1 = _AXSVoiceOverTouchTypingMode();

  return +[NSNumber numberWithLong:v1];
}

void __39__VoiceOverTypingController_specifiers__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 integerValue];
  _AXSVoiceOverTouchSetTypingMode();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

NSNumber *__cdecl __39__VoiceOverTypingController_specifiers__block_invoke_3(id a1)
{
  uint64_t v1 = +[AXSettings sharedInstance];
  uint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 voiceOverPhoneticsFeedback]);

  return (NSNumber *)v2;
}

void __39__VoiceOverTypingController_specifiers__block_invoke_4(id a1, id a2)
{
  id v2 = [a2 integerValue];
  id v3 = +[AXSettings sharedInstance];
  [v3 setVoiceOverPhoneticsFeedback:v2];
}

- (id)_keyboardTimeoutStart:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  [v3 voiceOverContinuousPathKeyboardStartTimeout];
  id v4 = AXLocalizedTimeSummary();

  return v4;
}

- (id)voModifierKey:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[VoiceOverModifierKeyController modifierShortStringDescription:](VoiceOverModifierKeyController, "modifierShortStringDescription:", [v3 voiceOverKeyboardModifierChoice]);

  return v4;
}

- (id)typingMode:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 propertyForKey:PSValidValuesKey];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = +[NSNumber numberWithLong:_AXSVoiceOverTouchTypingMode()];
  id v7 = [v5 indexOfObject:v6];

  objc_opt_class();
  uint64_t v8 = [v3 propertyForKey:PSValidTitlesKey];
  uint64_t v9 = __UIAccessibilityCastAsClass();

  objc_super v10 = [v9 objectAtIndexedSubscript:v7];
  uint64_t v11 = [v3 propertyForKey:PSStringsKey];
  uint64_t v12 = settingsLocString(v10, v11);

  return v12;
}

- (id)phoneticsEnabled:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 propertyForKey:PSValidValuesKey];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = +[AXSettings sharedInstance];
  id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 voiceOverPhoneticsFeedback]);
  id v8 = [v5 indexOfObject:v7];

  objc_opt_class();
  uint64_t v9 = [v3 propertyForKey:PSValidTitlesKey];
  objc_super v10 = __UIAccessibilityCastAsClass();

  uint64_t v11 = [v10 objectAtIndexedSubscript:v8];
  uint64_t v12 = [v3 propertyForKey:PSStringsKey];
  v13 = settingsLocString(v11, v12);

  return v13;
}

@end