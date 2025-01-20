@interface AXCaptioningController
- (id)currentTheme:(id)a3;
- (id)preferSDHEnabled:(id)a3;
- (id)showAudioTranscriptions:(id)a3;
- (id)showOnSkipBack:(id)a3;
- (id)showSubtitlesWhenLanguageMismatch:(id)a3;
- (id)showSubtitlesWhenMuted:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (void)setPreferSDHEnabled:(id)a3 specifier:(id)a4;
- (void)setShowAudioTranscriptions:(id)a3 specifier:(id)a4;
- (void)setShowOnSkipBack:(id)a3 specifier:(id)a4;
- (void)setShowSubtitlesWhenLanguageMismatch:(id)a3 specifier:(id)a4;
- (void)setShowSubtitlesWhenMuted:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXCaptioningController

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = settingsLocString(@"SDH_FOOTER_TEXT", @"Captioning");
    uint64_t v28 = PSFooterTextGroupKey;
    objc_msgSend(v5, "setProperty:forKey:", v6);

    [v4 addObject:v5];
    v7 = settingsLocString(@"PREFER_SDH", @"Captioning");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setPreferSDHEnabled:specifier:" get:"preferSDHEnabled:" detail:0 cell:6 edit:0];

    uint64_t v9 = PSIDKey;
    [v8 setProperty:@"PREFER_SDH" forKey:PSIDKey];
    uint64_t v10 = AXInBuddySetupKey;
    [v8 setProperty:&__kCFBooleanFalse forKey:AXInBuddySetupKey];
    [v4 addObject:v8];
    v11 = +[PSSpecifier emptyGroupSpecifier];

    [v4 addObject:v11];
    v12 = settingsLocString(@"CAPTION_THEME", @"Captioning");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"currentTheme:" detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:@"CAPTION_THEME" forKey:v9];
    [v13 setProperty:&__kCFBooleanFalse forKey:v10];
    [v13 setIdentifier:@"currentTheme"];
    [v4 addObject:v13];
    v14 = +[PSSpecifier emptyGroupSpecifier];

    v15 = settingsLocString(@"SHOW_AUDIO_TRANSCRIPTIONS_FOOTER", @"Captioning-dinnerbell");
    objc_msgSend(v14, "setProperty:forKey:", v15);

    [v4 addObject:v14];
    v16 = settingsLocString(@"SHOW_AUDIO_TRANSCRIPTIONS", @"Captioning-dinnerbell");
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setShowAudioTranscriptions:specifier:" get:"showAudioTranscriptions:" detail:0 cell:6 edit:0];

    [v17 setProperty:@"SHOW_AUDIO_TRANSCRIPTIONS" forKey:v9];
    [v17 setProperty:&__kCFBooleanFalse forKey:v10];
    [v4 addObject:v17];
    if (AXHasCapability())
    {
      v18 = settingsLocString(@"AUTOMATIC_SUBTITLES", @"Captioning");
      v19 = +[PSSpecifier groupSpecifierWithName:v18];

      v20 = settingsLocString(@"SHOW_WHEN_MUTED_FOOTER", @"Captioning");
      [v19 setProperty:v20 forKey:v28];

      [v4 addObject:v19];
      v21 = settingsLocString(@"SHOW_WHEN_MUTED", @"Captioning");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"setShowSubtitlesWhenMuted:specifier:" get:"showSubtitlesWhenMuted:" detail:0 cell:6 edit:0];

      [v22 setProperty:@"SHOW_WHEN_MUTED" forKey:v9];
      [v22 setProperty:&__kCFBooleanFalse forKey:v10];
      [v4 addObject:v22];
      v23 = +[PSSpecifier emptyGroupSpecifier];

      v24 = settingsLocString(@"SHOW_ON_SKIP_BACK_FOOTER", @"Captioning");
      [v23 setProperty:v24 forKey:v28];

      [v4 addObject:v23];
      v25 = settingsLocString(@"SHOW_ON_SKIP_BACK", @"Captioning");
      v17 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setShowOnSkipBack:specifier:" get:"showOnSkipBack:" detail:0 cell:6 edit:0];

      [v17 setProperty:@"SHOW_ON_SKIP_BACK" forKey:v9];
      [v17 setProperty:&__kCFBooleanFalse forKey:v10];
      [v4 addObject:v17];
    }
    [(AXCaptioningController *)self setupLongTitleSpecifiers:v4];
    v26 = *(void **)&self->super.AXUISettingsListController_opaque[v29];
    *(void *)&self->super.AXUISettingsListController_opaque[v29] = v4;

    v3 = *(void **)&self->super.AXUISettingsListController_opaque[v29];
  }

  return v3;
}

- (id)showOnSkipBack:(id)a3
{
  uint64_t v3 = _AXSAutomaticSubtitlesShowOnSkipBack();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setShowOnSkipBack:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetAutomaticSubtitlesShowOnSkipBack(v4);
}

- (id)showSubtitlesWhenMuted:(id)a3
{
  uint64_t v3 = _AXSAutomaticSubtitlesShowWhenMuted();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setShowSubtitlesWhenMuted:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetAutomaticSubtitlesShowWhenMuted(v4);
}

- (id)showSubtitlesWhenLanguageMismatch:(id)a3
{
  uint64_t v3 = _AXSAutomaticSubtitlesShowWhenLanguageMismatch();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setShowSubtitlesWhenLanguageMismatch:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetAutomaticSubtitlesShowWhenLanguageMismatch(v4);
}

- (id)showAudioTranscriptions:(id)a3
{
  uint64_t v3 = _AXSShowAudioTranscriptions();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setShowAudioTranscriptions:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __63__AXCaptioningController_setShowAudioTranscriptions_specifier___block_invoke;
  v15[3] = &unk_208948;
  id v8 = v6;
  id v16 = v8;
  v17 = self;
  uint64_t v9 = objc_retainBlock(v15);
  if ([v8 BOOLValue]
    && (+[AFPreferences sharedPreferences],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 dictationIsEnabled],
        v10,
        (v11 & 1) == 0))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __63__AXCaptioningController_setShowAudioTranscriptions_specifier___block_invoke_2;
    v12[3] = &unk_20B5C0;
    v14 = v9;
    v12[4] = self;
    id v13 = v7;
    +[TIAssistantSettings presentDialogForType:0 withCompletionHandler:v12];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

id __63__AXCaptioningController_setShowAudioTranscriptions_specifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) BOOLValue];
  _AXSSetShowAudioTranscriptions();
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = kAXSAccessibilityPreferenceDomain;

  return [v2 setGizmoPref:v3 forKey:@"ShowAudioTranscriptionsEnabled" domain:v4];
}

void __63__AXCaptioningController_setShowAudioTranscriptions_specifier___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 48);
  id v2 = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __63__AXCaptioningController_setShowAudioTranscriptions_specifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 2)
  {
    [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
    id v6 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
    [v6 setPresentingViewController:*(void *)(a1 + 32)];
    [v6 present];
  }
  else if (v2 == 1)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 reloadSpecifier:v5];
  }
}

- (id)currentTheme:(id)a3
{
  active = (const void *)MACaptionAppearancePrefCopyActiveProfileID();
  uint64_t v4 = (void *)MACaptionAppearancePrefCopyProfileName();
  if (active) {
    CFRelease(active);
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXCaptioningController;
  [(AccessibilitySettingsBaseController *)&v4 viewWillAppear:a3];
  [(AXCaptioningController *)self reloadSpecifierID:@"currentTheme"];
}

- (void)setPreferSDHEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  _AXSClosedCaptionsSetEnabled();
  id v4 = +[HUUtilities sharedUtilities];
  [v4 updateHearingFeatureUsage];
}

- (id)preferSDHEnabled:(id)a3
{
  uint64_t v3 = _AXSClosedCaptionsEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXCaptioningController;
  uint64_t v5 = -[AXCaptioningController tableView:titleForFooterInSection:](&v13, "tableView:titleForFooterInSection:", a3);
  id v6 = +[NSLocale preferredLanguages];
  if ([v6 count])
  {
    id v7 = [v6 objectAtIndex:0];
    unsigned int v8 = [v7 hasPrefix:@"en"];

    if (!a4)
    {
      if (v8)
      {
        uint64_t v9 = +[UIDevice currentDevice];
        uint64_t v10 = (char *)[v9 userInterfaceIdiom];

        if (v10 == (unsigned char *)&dword_0 + 1)
        {
          uint64_t v11 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_20F6B8];

          uint64_t v5 = (void *)v11;
        }
      }
    }
  }

  return v5;
}

@end