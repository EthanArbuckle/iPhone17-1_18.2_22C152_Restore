@interface TTYSettingsController
- (TTYSettingsController)init;
- (id)answerRTTCallsAsMuted:(id)a3;
- (id)hardwareTTYEnabledSwitch:(id)a3;
- (id)incomingCallsTTY:(id)a3;
- (id)realtimeEnabled:(id)a3;
- (id)relayNumber:(id)a3;
- (id)rttLiveTranscriptionsEnabled:(id)a3;
- (id)showsRTTNotifications:(id)a3;
- (id)softwareTTYAndHardwareTTYSpecificSpecifiers;
- (id)softwareTTYEnabledSwitch:(id)a3;
- (id)softwareTTYSettingsSpecifiers;
- (id)specifiers;
- (id)telephonyContext;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)confirmationViewCancelledForSpecifier:(id)a3;
- (void)dealloc;
- (void)setAnswerRTTCallsAsMuted:(id)a3 specifier:(id)a4;
- (void)setHardwareTTYEnabledSwitch:(id)a3 specifier:(id)a4;
- (void)setIncomingCallsTTY:(id)a3 specifier:(id)a4;
- (void)setRTTLiveTranscriptionsEnabled:(id)a3 specifier:(id)a4;
- (void)setRealtimeEnabled:(id)a3 specifier:(id)a4;
- (void)setRelayNumber:(id)a3 specifier:(id)a4;
- (void)setShowsRTTNotifications:(id)a3 specifier:(id)a4;
- (void)setSoftwareTTYEnabledSwitch:(id)a3 specifier:(id)a4;
- (void)updateSpecifiersForCallState;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation TTYSettingsController

- (TTYSettingsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TTYSettingsController;
  v2 = [(TTYSettingsController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"updateSpecifiersForCallState" name:TUCallCenterCallStatusChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TTYSettingsController;
  [(TTYSettingsController *)&v4 dealloc];
}

- (id)telephonyContext
{
  objc_opt_class();
  v3 = [(TTYSettingsController *)self specifier];
  objc_super v4 = [v3 propertyForKey:PSSubscriptionContextKey];
  objc_super v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 context];

  if (!v6)
  {
    v7 = +[RTTTelephonyUtilities sharedUtilityProvider];
    v6 = [v7 defaultVoiceContext];
  }

  return v6;
}

- (void)updateSpecifiersForCallState
{
}

void __53__TTYSettingsController_updateSpecifiersForCallState__block_invoke(uint64_t a1)
{
  id v2 = [&off_22BD50 mutableCopy];
  [v2 addObject:@"RTT_LIVE_TRANSCRIPTIONS"];
  v3 = [*(id *)(a1 + 32) specifiersForIDs:v2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __53__TTYSettingsController_updateSpecifiersForCallState__block_invoke_2;
  v4[3] = &unk_209958;
  v4[4] = *(void *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __53__TTYSettingsController_updateSpecifiersForCallState__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[TUCallCenter sharedInstance];
  objc_super v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 hasCurrentCalls] ^ 1);
  [v5 setProperty:v4 forKey:PSEnabledKey];

  [*(id *)(a1 + 32) reloadSpecifier:v5];
}

- (id)softwareTTYSettingsSpecifiers
{
  v3 = +[NSMutableArray array];
  objc_super v4 = [(TTYSettingsController *)self telephonyContext];
  if (+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:v4])
  {
    id v5 = +[RTTSettings sharedInstance];
    v6 = [(TTYSettingsController *)self telephonyContext];
    unsigned int v7 = [v5 TTYSoftwareEnabledForContext:v6];

    if (!v7) {
      goto LABEL_16;
    }
    v8 = +[PSSpecifier emptyGroupSpecifier];
    v9 = settingsLocString(@"TTY_REALTIME_FOOTER", @"Accessibility");
    uint64_t v10 = PSFooterTextGroupKey;
    [v8 setProperty:v9 forKey:PSFooterTextGroupKey];

    uint64_t v11 = PSIDKey;
    [v8 setProperty:@"TTY_SW_SETTINGS_GROUP" forKey:PSIDKey];
    [v3 addObject:v8];
    v12 = settingsLocString(@"TTY_RELAY_LABEL", @"Accessibility");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"relayNumber:" detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:@"TTY_RELAY" forKey:v11];
    [v3 addObject:v13];
    v14 = settingsLocString(@"TTY_REALTIME_LABEL", @"Accessibility");
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setRealtimeEnabled:specifier:" get:"realtimeEnabled:" detail:0 cell:6 edit:0];

    [v15 setProperty:@"TTY_REALTIME" forKey:v11];
    [v3 addObject:v15];
    v16 = [(TTYSettingsController *)self telephonyContext];
    LODWORD(v14) = +[RTTTelephonyUtilities isRTTSupportedForContext:v16];

    if (v14)
    {
      objc_super v4 = +[PSSpecifier emptyGroupSpecifier];

      [v4 setProperty:@"RTT_ANSWER_MUTED_SETTINGS_GROUP" forKey:v11];
      v17 = settingsLocString(@"RTT_ANSWER_CALL_MUTED_FOOTER", @"Accessibility");
      [v4 setProperty:v17 forKey:v10];

      [v3 addObject:v4];
      v18 = settingsLocString(@"RTT_ANSWER_CALL_MUTED_LABEL", @"Accessibility");
      v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setAnswerRTTCallsAsMuted:specifier:" get:"answerRTTCallsAsMuted:" detail:0 cell:6 edit:0];

      [v19 setProperty:@"RTT_ANSWER_MUTED" forKey:v11];
      [v3 addObject:v19];
      v20 = +[RTTSettings sharedInstance];
      if ([v20 rttLiveTranscriptionsFeatureFlagEnabled])
      {
        v21 = +[NSLocale _deviceLanguage];
        unsigned int v22 = [v21 isEqualToString:@"en"];

        if (v22)
        {
          v23 = +[PSSpecifier emptyGroupSpecifier];

          [v23 setProperty:@"RTT_LIVE_TRANSCRIPTIONS_SETTINGS_GROUP" forKey:v11];
          v24 = AXLocStringKeyForModel();
          v25 = settingsLocString(v24, @"Accessibility");
          [v23 setProperty:v25 forKey:v10];

          [v3 addObject:v23];
          v26 = settingsLocString(@"RTT_LIVE_TRANSCRIPTIONS_LABEL", @"Accessibility");
          v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:"setRTTLiveTranscriptionsEnabled:specifier:" get:"rttLiveTranscriptionsEnabled:" detail:0 cell:6 edit:0];

          [v27 setProperty:@"RTT_LIVE_TRANSCRIPTIONS" forKey:v11];
          [v3 addObject:v27];
          objc_super v4 = v23;
          v19 = v27;
        }
      }
      else
      {
      }
    }
    else
    {
      objc_super v4 = v8;
      v19 = v15;
    }
    v28 = [(TTYSettingsController *)self telephonyContext];
    unsigned __int8 v29 = +[RTTTelephonyUtilities isOnlyRTTSupportedForContext:v28];

    if ((v29 & 1) == 0)
    {
      unsigned int v30 = +[RTTTelephonyUtilities isRTTSupported];
      v31 = +[PSSpecifier emptyGroupSpecifier];

      [v31 setProperty:@"TTY_SETTINGS_GROUP" forKey:v11];
      v32 = settingsLocString(@"TTY_CALL_ANSWER_FOOTER", @"Accessibility");
      [v31 setProperty:v32 forKey:v10];

      [v3 addObject:v31];
      if (v30) {
        v33 = @"TTY_RTT_CALL_ANSWER";
      }
      else {
        v33 = @"TTY_CALL_ANSWER";
      }
      v34 = settingsLocString(v33, @"Accessibility");
      v35 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:"setIncomingCallsTTY:specifier:" get:"incomingCallsTTY:" detail:0 cell:6 edit:0];

      [v35 setProperty:@"TTY_CALL_ANSWER" forKey:v11];
      [v3 addObject:v35];
      objc_super v4 = v31;
      v19 = v35;
    }
  }
LABEL_16:

  return v3;
}

- (id)softwareTTYAndHardwareTTYSpecificSpecifiers
{
  v3 = +[NSMutableArray array];
  objc_super v4 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v5 = PSIDKey;
  [v4 setProperty:@"RTT_SHOW_NOTIFICATIONS_SETTINGS_GROUP" forKey:PSIDKey];
  v6 = settingsLocString(@"RTT_SHOW_NOTIFICATIONS_FOOTER", @"Accessibility");
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  unsigned int v7 = settingsLocString(@"RTT_SHOW_NOTIFICATIONS_LABEL", @"Accessibility");
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setShowsRTTNotifications:specifier:" get:"showsRTTNotifications:" detail:0 cell:6 edit:0];

  [v8 setProperty:@"RTT_SHOW_NOTIFICATIONS" forKey:v5];
  [v3 addObject:v8];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_21;
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(TTYSettingsController *)self telephonyContext];
  if (+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:v6])unsigned int v7 = 1; {
  else
  }
    unsigned int v7 = +[RTTTelephonyUtilities isRelayRTTSupported];
  unsigned int v8 = +[RTTTelephonyUtilities hardwareTTYIsSupportedForContext:v6];
  v9 = +[RTTSettings sharedInstance];
  unsigned int v10 = [v9 TTYSoftwareEnabledForContext:v6];

  uint64_t v11 = +[RTTSettings sharedInstance];
  unsigned int v12 = [v11 TTYHardwareEnabledForContext:v6];

  if (v7)
  {
    v13 = +[PSSpecifier emptyGroupSpecifier];
    int IsPhone = AXDeviceIsPhone();
    v15 = @"TTY_SOFTWARE_FOOTER_FACETIME";
    if (IsPhone) {
      v15 = @"TTY_SOFTWARE_FOOTER_PHONE";
    }
    v16 = v15;
    unsigned int v34 = v10;
    v33 = v5;
    if ((+[RTTTelephonyUtilities isOnlyRTTSupportedForContext:](RTTTelephonyUtilities, "isOnlyRTTSupportedForContext:", v6) & 1) != 0|| +[RTTTelephonyUtilities isRelayRTTSupported])
    {
      int v17 = AXDeviceIsPhone();
      v18 = @"RTT_SOFTWARE_FOOTER_FACETIME";
      if (v17) {
        v18 = @"RTT_SOFTWARE_FOOTER_PHONE";
      }
      v19 = @"RTT_SOFTWARE";
    }
    else
    {
      if (!+[RTTTelephonyUtilities isRTTSupportedForContext:v6])
      {
        v19 = @"TTY_SOFTWARE";
LABEL_14:
        v21 = settingsLocString(v16, @"Accessibility");
        [v13 setProperty:v21 forKey:PSFooterTextGroupKey];

        id v5 = v33;
        [v33 addObject:v13];
        unsigned int v22 = settingsLocString(v19, @"Accessibility");
        v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"setSoftwareTTYEnabledSwitch:specifier:" get:"softwareTTYEnabledSwitch:" detail:0 cell:6 edit:0];

        [v23 setProperty:@"SW_TTY" forKey:PSIDKey];
        [v33 addObject:v23];
        v24 = [(TTYSettingsController *)self softwareTTYSettingsSpecifiers];
        [v33 addObjectsFromArray:v24];

        if (((v34 | v8 & v12) & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      int v32 = AXDeviceIsPhone();
      v18 = @"TTY_RTT_SOFTWARE_FOOTER_FACETIME";
      if (v32) {
        v18 = @"TTY_RTT_SOFTWARE_FOOTER_PHONE";
      }
      v19 = @"TTY_RTT_SOFTWARE";
    }
    v20 = v18;

    v16 = v20;
    goto LABEL_14;
  }
  if ((v8 & v12) == 1)
  {
LABEL_17:
    v25 = [(TTYSettingsController *)self softwareTTYAndHardwareTTYSpecificSpecifiers];
    [v5 addObjectsFromArray:v25];
  }
LABEL_18:
  if (v8)
  {
    v26 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v26];
    v27 = settingsLocString(@"TTY_HARDWARE_FOOTER", @"Accessibility");
    [v26 setProperty:v27 forKey:PSFooterTextGroupKey];

    v28 = settingsLocString(@"TTY_HARDWARE", @"Accessibility");
    unsigned __int8 v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:"setHardwareTTYEnabledSwitch:specifier:" get:"hardwareTTYEnabledSwitch:" detail:0 cell:6 edit:0];

    [v29 setProperty:@"HW_TTY" forKey:PSIDKey];
    [v5 addObject:v29];
  }
  unsigned int v30 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
LABEL_21:

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TTYSettingsController;
  [(TTYSettingsController *)&v4 viewWillAppear:a3];
  [(TTYSettingsController *)self reloadSpecifierID:@"TTY_RELAY"];
  [(TTYSettingsController *)self updateSpecifiersForCallState];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)TTYSettingsController;
  [(TTYSettingsController *)&v3 willBecomeActive];
  [(TTYSettingsController *)self updateSpecifiersForCallState];
}

- (void)setSoftwareTTYEnabledSwitch:(id)a3 specifier:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  unsigned int v7 = +[RTTSettings sharedInstance];
  id v8 = [v21 BOOLValue];
  v9 = [(TTYSettingsController *)self telephonyContext];
  [v7 setTTYSoftwareEnabled:v8 forContext:v9];

  unsigned int v10 = [(TTYSettingsController *)self telephonyContext];
  if (+[RTTTelephonyUtilities hardwareTTYIsSupportedForContext:v10])
  {
    uint64_t v11 = +[RTTSettings sharedInstance];
    unsigned int v12 = [(TTYSettingsController *)self telephonyContext];
    unsigned __int8 v13 = [v11 TTYHardwareEnabledForContext:v12];

    if ([v21 BOOLValue])
    {
      if (v13) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else
  {

    if ([v21 BOOLValue])
    {
LABEL_6:
      v14 = [(TTYSettingsController *)self softwareTTYAndHardwareTTYSpecificSpecifiers];
      [(TTYSettingsController *)self insertContiguousSpecifiers:v14 afterSpecifier:v6 animated:1];

LABEL_7:
      v15 = [(TTYSettingsController *)self softwareTTYSettingsSpecifiers];
      [(TTYSettingsController *)self insertContiguousSpecifiers:v15 afterSpecifier:v6 animated:1];
      goto LABEL_12;
    }
    unsigned __int8 v13 = 0;
  }
  v15 = +[NSMutableArray arrayWithObjects:@"TTY_SW_SETTINGS_GROUP", @"TTY_RELAY", @"TTY_REALTIME", 0];
  [v15 addObjectsFromArray:&off_22BD68];
  [v15 addObjectsFromArray:&off_22BD80];
  [v15 addObjectsFromArray:&off_22BD98];
  v16 = [(TTYSettingsController *)self specifiersForIDs:v15];
  [(TTYSettingsController *)self removeContiguousSpecifiers:v16 animated:1];

  if ((v13 & 1) == 0)
  {
    int v17 = [(TTYSettingsController *)self specifiersForIDs:&off_22BDB0];
    [(TTYSettingsController *)self removeContiguousSpecifiers:v17 animated:1];
  }
  v18 = +[RTTSettings sharedInstance];
  v19 = [(TTYSettingsController *)self telephonyContext];
  [v18 setIncomingCallsTTY:0 forContext:v19];

LABEL_12:
  v20 = +[HUUtilities sharedUtilities];
  [v20 updateHearingFeatureUsage];
}

- (void)setHardwareTTYEnabledSwitch:(id)a3 specifier:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  unsigned int v7 = +[RTTSettings sharedInstance];
  id v8 = [v16 BOOLValue];
  v9 = [(TTYSettingsController *)self telephonyContext];
  [v7 setTTYHardwareEnabled:v8 forContext:v9];

  unsigned int v10 = [(TTYSettingsController *)self telephonyContext];
  if ((+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:](RTTTelephonyUtilities, "softwareTTYIsSupportedForContext:", v10) & 1) == 0&& (+[RTTTelephonyUtilities isRelayRTTSupported] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v11 = +[RTTSettings sharedInstance];
  unsigned int v12 = [(TTYSettingsController *)self telephonyContext];
  unsigned __int8 v13 = [v11 TTYSoftwareEnabledForContext:v12];

  if ((v13 & 1) == 0)
  {
LABEL_6:
    if ([v16 BOOLValue])
    {
      v14 = [(TTYSettingsController *)self softwareTTYAndHardwareTTYSpecificSpecifiers];
      [(TTYSettingsController *)self insertContiguousSpecifiers:v14 afterSpecifier:v6 animated:1];
    }
    else
    {
      v14 = [(TTYSettingsController *)self specifiersForIDs:&off_22BDC8];
      [(TTYSettingsController *)self removeContiguousSpecifiers:v14 animated:1];
    }
  }
  v15 = +[HUUtilities sharedUtilities];
  [v15 updateHearingFeatureUsage];
}

- (id)softwareTTYEnabledSwitch:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 TTYSoftwareEnabledForContext:v5]);

  return v6;
}

- (id)hardwareTTYEnabledSwitch:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 TTYHardwareEnabledForContext:v5]);

  return v6;
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  id v5 = +[RTTSettings sharedInstance];
  objc_super v4 = [(TTYSettingsController *)self telephonyContext];
  [v5 setIncomingCallsTTY:1 forContext:v4];
}

- (void)confirmationViewCancelledForSpecifier:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  [v4 setIncomingCallsTTY:0 forContext:v5];

  [(TTYSettingsController *)self reloadSpecifierID:@"TTY_CALL_ANSWER" animated:1];
}

- (void)setIncomingCallsTTY:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    id v12 = objc_alloc_init((Class)PSConfirmationSpecifier);
    id v5 = [(TTYSettingsController *)self telephonyContext];
    if (+[RTTTelephonyUtilities isRTTSupportedForContext:v5])id v6 = @"TTY_RTT_CALL_ANSWER"; {
    else
    }
      id v6 = @"TTY_CALL_ANSWER";
    unsigned int v7 = settingsLocString(v6, @"Accessibility");
    [v12 setTitle:v7];

    id v8 = settingsLocString(@"TTY_CALL_CONFIRM", @"Accessibility");
    [v12 setPrompt:v8];

    v9 = settingsLocString(@"CANCEL", @"Accessibility");
    [v12 setCancelButton:v9];

    unsigned int v10 = +[NSNumber numberWithBool:1];
    [v12 setProperty:v10 forKey:PSConfirmationDestructiveKey];

    [(TTYSettingsController *)self showConfirmationViewForSpecifier:v12];
  }
  else
  {
    id v12 = +[RTTSettings sharedInstance];
    uint64_t v11 = [(TTYSettingsController *)self telephonyContext];
    [v12 setIncomingCallsTTY:0 forContext:v11];
  }
}

- (id)incomingCallsTTY:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 incomingCallsTTYForContext:v5]);

  return v6;
}

- (void)setRelayNumber:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[RTTSettings sharedInstance];
  id v6 = +[RTTUIUtilities phoneNumberStringFromString:v5];

  unsigned int v7 = [(TTYSettingsController *)self telephonyContext];
  [v8 setPreferredRelayNumber:v6 forContext:v7];
}

- (id)relayNumber:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = [v4 preferredRelayNumberForContext:v5];

  if (v6)
  {
    unsigned int v7 = +[CNPhoneNumber phoneNumberWithStringValue:v6];
    id v8 = [v7 formattedStringValue];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setRealtimeEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[RTTSettings sharedInstance];
  id v6 = [v5 BOOLValue];

  unsigned int v7 = [(TTYSettingsController *)self telephonyContext];
  [v8 setTTYShouldBeRealtime:v6 forContext:v7];
}

- (id)realtimeEnabled:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 ttyShouldBeRealtimeForContext:v5]);

  return v6;
}

- (void)setAnswerRTTCallsAsMuted:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[RTTSettings sharedInstance];
  id v6 = [v5 BOOLValue];

  unsigned int v7 = [(TTYSettingsController *)self telephonyContext];
  [v8 setAnswerRTTCallsAsMuted:v6 forContext:v7];
}

- (id)answerRTTCallsAsMuted:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 answerRTTCallsAsMutedForContext:v5]);

  return v6;
}

- (void)setShowsRTTNotifications:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[RTTSettings sharedInstance];
  id v6 = [v5 BOOLValue];

  unsigned int v7 = [(TTYSettingsController *)self telephonyContext];
  [v8 setShowsRTTNotifications:v6 forContext:v7];
}

- (id)showsRTTNotifications:(id)a3
{
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 showsRTTNotificationsForContext:v5]);

  return v6;
}

- (void)setRTTLiveTranscriptionsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue])
  {
    unsigned int v7 = +[AXSpringBoardServer server];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __67__TTYSettingsController_setRTTLiveTranscriptionsEnabled_specifier___block_invoke;
    v10[3] = &unk_209980;
    char v12 = 1;
    v10[4] = self;
    id v11 = v6;
    [v7 showAlert:25 withHandler:v10];
  }
  else
  {
    id v8 = +[RTTSettings sharedInstance];
    v9 = [(TTYSettingsController *)self telephonyContext];
    [v8 setRTTLiveTranscriptionsEnabled:0 forContext:v9];
  }
}

void __67__TTYSettingsController_setRTTLiveTranscriptionsEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v7 = +[RTTSettings sharedInstance];
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    objc_super v4 = [*(id *)(a1 + 32) telephonyContext];
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
  objc_super v4 = +[RTTSettings sharedInstance];
  id v5 = [(TTYSettingsController *)self telephonyContext];
  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 rttLiveTranscriptionsEnabledForContext:v5]);

  return v6;
}

@end