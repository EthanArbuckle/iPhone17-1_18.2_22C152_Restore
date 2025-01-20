@interface LiveTranscriptionSettingsController
- (LiveTranscriptionSettingsController)init;
- (PSSpecifier)liveTranscriptionSpecifier;
- (id)faceTimeCaptionsEnabled:(id)a3;
- (id)liveTranscriptionEnabled:(id)a3;
- (id)liveTranscriptionInCallEnabled:(id)a3;
- (id)rttLiveTranscriptionsEnabled:(id)a3;
- (id)specifiers;
- (id)telephonyContext;
- (void)dealloc;
- (void)presentAlertWithMessage:(id)a3 specifier:(id)a4 okBlock:(id)a5;
- (void)setFaceTimeCaptionsEnabled:(id)a3 specifier:(id)a4;
- (void)setLiveTranscriptionEnabled:(id)a3 specifier:(id)a4;
- (void)setLiveTranscriptionInCallEnabled:(id)a3 specifier:(id)a4;
- (void)setLiveTranscriptionSpecifier:(id)a3;
- (void)setRTTLiveTranscriptionsEnabled:(id)a3 specifier:(id)a4;
- (void)updateLiveTranscriptionEnabled;
@end

@implementation LiveTranscriptionSettingsController

- (LiveTranscriptionSettingsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)LiveTranscriptionSettingsController;
  v2 = [(AccessibilitySettingsBaseController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)liveTranscriptionEnabledUpdated, kAXSLiveTranscriptionEnabledDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSLiveTranscriptionEnabledDidChangeNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)LiveTranscriptionSettingsController;
  [(AccessibilitySettingsBaseController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_allocWithZone((Class)NSMutableArray) init];
    v6 = +[PSSpecifier groupSpecifierWithName:0];
    v7 = AXLocStringKeyForModel();
    v8 = AXUILocalizedStringForKey();
    uint64_t v35 = PSFooterTextGroupKey;
    objc_msgSend(v6, "setProperty:forKey:", v8);

    [v5 addObject:v6];
    v9 = settingsLocString(@"LIVE_TRANSCRIPTION_TITLE", @"Accessibility");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setLiveTranscriptionEnabled:specifier:" get:"liveTranscriptionEnabled:" detail:0 cell:6 edit:0];

    uint64_t v34 = AXInBuddySetupKey;
    objc_msgSend(v10, "setProperty:forKey:", &__kCFBooleanFalse);
    uint64_t v11 = PSIDKey;
    [v10 setProperty:@"LIVE_TRANSCRIPTION_TITLE" forKey:PSIDKey];
    [v5 addObject:v10];
    liveTranscriptionSpecifier = self->_liveTranscriptionSpecifier;
    self->_liveTranscriptionSpecifier = (PSSpecifier *)v10;
    id v13 = v10;

    v14 = settingsLocString(@"LIVE_TRANSCRIPTION_APPEARANCE", @"Accessibility");
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v15 setProperty:@"LIVE_TRANSCRIPTION_APPEARANCE" forKey:v11];
    [v5 addObject:v15];
    v16 = settingsLocString(@"LIVE_TRANSCRIPTION_INAPP_OPTIONS", @"Accessibility");
    v17 = +[PSSpecifier groupSpecifierWithName:v16];

    v18 = v5;
    v19 = settingsLocString(@"LIVE_TRANSCRIPTION_INAPP_FOOTER", @"Accessibility");
    [v17 setProperty:v19 forKey:v35];

    [v18 addObject:v17];
    if (AXHasCapability())
    {
      v20 = settingsLocString(@"FACE_TIME_CAPTIONS", @"Captioning");
      v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:"setFaceTimeCaptionsEnabled:specifier:" get:"faceTimeCaptionsEnabled:" detail:0 cell:6 edit:0];

      [v21 setProperty:@"FACE_TIME_CAPTIONS" forKey:v11];
      [v21 setProperty:&__kCFBooleanFalse forKey:v34];
      [v21 setProperty:&off_22BE10 forKey:PSRequiredCapabilitiesKey];
      v22 = AXImageIconForAppID(AX_FaceTimeBundleName);
      [v21 setProperty:v22 forKey:PSIconImageKey];

      [v18 addObject:v21];
      v17 = v21;
    }
    uint64_t v23 = v11;
    v24 = [(LiveTranscriptionSettingsController *)self telephonyContext];
    v25 = +[RTTSettings sharedInstance];
    if ([v25 TTYSoftwareEnabledForContext:v24]
      && (+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:v24] & 1) != 0)
    {
      unsigned int v26 = +[RTTTelephonyUtilities isRTTSupportedForContext:v24];

      if (!v26)
      {
LABEL_11:
        [(LiveTranscriptionSettingsController *)self setupLongTitleSpecifiers:v18];
        v32 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
        *(void *)&self->super.AXUISettingsListController_opaque[v3] = v18;

        objc_super v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
        goto LABEL_12;
      }
      v25 = +[RTTSettings sharedInstance];
      if ([v25 rttLiveTranscriptionsFeatureFlagEnabled])
      {
        v27 = +[NSLocale _deviceLanguage];
        unsigned int v28 = [v27 isEqualToString:@"en"];

        if (v28)
        {
          v29 = settingsLocString(@"LIVE_TRANSCRIPTION_RTT", @"Accessibility");
          v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:"setRTTLiveTranscriptionsEnabled:specifier:" get:"rttLiveTranscriptionsEnabled:" detail:0 cell:6 edit:0];

          [v30 setProperty:@"LIVE_TRANSCRIPTION_RTT" forKey:v23];
          v31 = AXImageIconForAppID(AX_MobilePhoneBundleName);
          [v30 setProperty:v31 forKey:PSIconImageKey];

          [v18 addObject:v30];
          v17 = v30;
        }
        goto LABEL_11;
      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

- (id)liveTranscriptionEnabled:(id)a3
{
  uint64_t v3 = _AXSLiveTranscriptionEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setLiveTranscriptionEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSLiveTranscriptionSetEnabled(v4);
}

- (id)liveTranscriptionInCallEnabled:(id)a3
{
  uint64_t v3 = _AXSLiveTranscriptionInCallEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setLiveTranscriptionInCallEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue]) {
    [(LiveTranscriptionSettingsController *)self presentAlertWithMessage:@"To avoid feature leaking please use Live Captions + phone calls only with disclosed individuals." specifier:v6 okBlock:&__block_literal_global_21];
  }
  else {
    _AXSLiveTranscriptionInCallSetEnabled();
  }
}

void __83__LiveTranscriptionSettingsController_setLiveTranscriptionInCallEnabled_specifier___block_invoke(id a1)
{
}

- (void)setFaceTimeCaptionsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetFaceTimeCaptionsEnabled(v4);
}

- (id)faceTimeCaptionsEnabled:(id)a3
{
  uint64_t v3 = _AXSFaceTimeCaptionsEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setRTTLiveTranscriptionsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue])
  {
    v7 = +[AXSpringBoardServer server];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __81__LiveTranscriptionSettingsController_setRTTLiveTranscriptionsEnabled_specifier___block_invoke;
    v10[3] = &unk_209980;
    char v12 = 1;
    v10[4] = self;
    id v11 = v6;
    [v7 showAlert:25 withHandler:v10];
  }
  else
  {
    v8 = +[RTTSettings sharedInstance];
    v9 = [(LiveTranscriptionSettingsController *)self telephonyContext];
    [v8 setRTTLiveTranscriptionsEnabled:0 forContext:v9];
  }
}

void __81__LiveTranscriptionSettingsController_setRTTLiveTranscriptionsEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v7 = +[RTTSettings sharedInstance];
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) telephonyContext];
    [v7 setRTTLiveTranscriptionsEnabled:v3 forContext:v4];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 reloadSpecifier:v6];
  }
}

- (id)rttLiveTranscriptionsEnabled:(id)a3
{
  id v4 = +[RTTSettings sharedInstance];
  id v5 = [(LiveTranscriptionSettingsController *)self telephonyContext];
  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 rttLiveTranscriptionsEnabledForContext:v5]);

  return v6;
}

- (void)presentAlertWithMessage:(id)a3 specifier:(id)a4 okBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = settingsLocString(@"WARNING", @"Accessibility");
  char v12 = +[UIAlertController alertControllerWithTitle:v11 message:v10 preferredStyle:1];

  id v13 = settingsLocString(@"OK", @"Accessibility");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __81__LiveTranscriptionSettingsController_presentAlertWithMessage_specifier_okBlock___block_invoke;
  v21[3] = &unk_2088D0;
  id v22 = v9;
  id v14 = v9;
  v15 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v21];

  v16 = settingsLocString(@"CANCEL", @"Accessibility");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __81__LiveTranscriptionSettingsController_presentAlertWithMessage_specifier_okBlock___block_invoke_2;
  v19[3] = &unk_209CD8;
  v19[4] = self;
  id v20 = v8;
  id v17 = v8;
  v18 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v19];

  [v12 addAction:v15];
  [v12 addAction:v18];
  [(LiveTranscriptionSettingsController *)self presentViewController:v12 animated:1 completion:0];
}

uint64_t __81__LiveTranscriptionSettingsController_presentAlertWithMessage_specifier_okBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id __81__LiveTranscriptionSettingsController_presentAlertWithMessage_specifier_okBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (id)telephonyContext
{
  objc_opt_class();
  uint64_t v3 = [(LiveTranscriptionSettingsController *)self specifier];
  id v4 = [v3 propertyForKey:PSSubscriptionContextKey];
  id v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 context];

  if (!v6)
  {
    id v7 = +[RTTTelephonyUtilities sharedUtilityProvider];
    uint64_t v6 = [v7 defaultVoiceContext];
  }

  return v6;
}

- (void)updateLiveTranscriptionEnabled
{
}

- (PSSpecifier)liveTranscriptionSpecifier
{
  return self->_liveTranscriptionSpecifier;
}

- (void)setLiveTranscriptionSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end