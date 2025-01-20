@interface NCSpokenNotificationsDetailListController
- (NCSpokenNotificationsDetailListController)init;
- (NCSpokenNotificationsDetailListControllerDelegate)delegate;
- (id)_specifiersForAnnounceDestinations;
- (id)_updatesForSpecifiers:(id)a3 withGlobalAnnouncesState:(int64_t)a4 animated:(BOOL)a5;
- (id)globalAnnounceHeadphonesSetting:(id)a3;
- (id)globalAnnounceHearingAidsSetting:(id)a3;
- (id)globalAnnounceSetting:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)spokenRepliesWithoutConfirmation:(id)a3;
- (void)_presentEnableSiriPromptForState:(BOOL)a3;
- (void)_presentEnableSiriWhenLockedPrompt;
- (void)_presentPasscodeView;
- (void)_setGlobalAnnounceSetting:(int64_t)a3;
- (void)didAcceptEnteredPIN;
- (void)didCancelEnteringPIN;
- (void)didChangeSettingForSpokenCarPlayNotificationsDetailController:(id)a3;
- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGlobalAnnounceHeadphonesSetting:(id)a3 specifier:(id)a4;
- (void)setGlobalAnnounceHearingAidsSetting:(id)a3 specifier:(id)a4;
- (void)setGlobalAnnounceSetting:(id)a3 specifier:(id)a4;
- (void)setSpokenRepliesWithoutConfirmation:(id)a3 specifier:(id)a4;
- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3;
@end

@implementation NCSpokenNotificationsDetailListController

- (NCSpokenNotificationsDetailListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)NCSpokenNotificationsDetailListController;
  v2 = [(NCSpokenNotificationsDetailListController *)&v7 init];
  if (v2)
  {
    v3 = +[NCSettingsGatewayController sharedInstance];
    [v3 addObserver:v2];

    v4 = (LAPasscodeVerificationService *)objc_alloc_init((Class)LAPasscodeVerificationService);
    passcodeService = v2->_passcodeService;
    v2->_passcodeService = v4;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v6 = [v5 localizedStringForKey:@"SPOKEN_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    [(NCSpokenNotificationsDetailListController *)self setTitle:v6];

    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_SWITCH_GROUP_ID"];
    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v10 = [v9 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
    [v8 setProperty:v10 forKey:PSFooterTextGroupKey];

    [v7 addObject:v8];
    v11 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v12 = [v11 localizedStringForKey:@"SPOKEN_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setGlobalAnnounceSetting:specifier:" get:"globalAnnounceSetting:" detail:0 cell:6 edit:0];
    spokenNotificationsSwitchSpecifier = self->_spokenNotificationsSwitchSpecifier;
    self->_spokenNotificationsSwitchSpecifier = v13;

    [(PSSpecifier *)self->_spokenNotificationsSwitchSpecifier setIdentifier:@"SPOKEN_NOTIFICATIONS_ID"];
    [v7 addObject:self->_spokenNotificationsSwitchSpecifier];
    v15 = +[NCSettingsGatewayController sharedInstance];
    id v16 = [v15 effectiveGlobalAnnounceSetting];

    v17 = [(NCSpokenNotificationsDetailListController *)self _updatesForSpecifiers:v7 withGlobalAnnouncesState:v16 animated:0];
    v18 = [v17 currentSpecifiers];
    [v7 setArray:v18];

    v19 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setGlobalAnnounceSetting:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  [(NCSpokenNotificationsDetailListController *)self _setGlobalAnnounceSetting:v5];
}

- (void)_setGlobalAnnounceSetting:(int64_t)a3
{
  unsigned __int8 v5 = +[AssistantUtilities assistantEnabled];
  if (a3 == 2 && (v5 & 1) == 0)
  {
    [(NCSpokenNotificationsDetailListController *)self _presentEnableSiriPromptForState:0];
    return;
  }
  if (a3 != 2)
  {
    v6 = +[NCSettingsGatewayController sharedInstance];
    [v6 setEffectiveGlobalAnnounceSetting:a3];

    if (a3 != 1 || !_os_feature_enabled_impl()) {
      goto LABEL_16;
    }
    id v7 = +[AFPreferences sharedPreferences];
    [v7 setAnnounceNotificationsOnBuiltInSpeakerEnabled:0];
LABEL_15:

LABEL_16:
    id v14 = [(NCSpokenNotificationsDetailListController *)self _updatesForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] withGlobalAnnouncesState:a3 animated:1];
    [(NCSpokenNotificationsDetailListController *)self performSpecifierUpdates:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained spokenNotificationsDetailListController:self didChangeGlobalSpokenNotificationSetting:a3];

    return;
  }
  v8 = +[AFPreferences sharedPreferences];
  unsigned int v9 = [v8 disableAssistantWhilePasscodeLocked];

  if (!v9)
  {
    v11 = +[NCSettingsGatewayController sharedInstance];
    [v11 setEffectiveGlobalAnnounceSetting:2];

    v12 = +[AFPreferences sharedPreferences];
    [v12 clearSpokenNotificationTemporarilyDisabledStatus];

    id v7 = +[AFPreferences sharedPreferences];
    [v7 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
    goto LABEL_15;
  }

  [(NCSpokenNotificationsDetailListController *)self _presentEnableSiriWhenLockedPrompt];
}

- (id)globalAnnounceSetting:(id)a3
{
  uint64_t v3 = +[NCSettingsGatewayController sharedInstance];
  v4 = (char *)[v3 effectiveGlobalAnnounceSetting];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    unsigned __int8 v5 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)_presentEnableSiriPromptForState:(BOOL)a3
{
}

- (void)_presentEnableSiriWhenLockedPrompt
{
  uint64_t v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v4 = [v3 localizedStringForKey:@"ALLOW_SIRI_WHEN_LOCKED" value:&stru_419A0 table:@"NotificationsSettings"];
  unsigned __int8 v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v6 = [v5 localizedStringForKey:@"ALLOW_SIRI_WHEN_LOCKED_EXPLANATION" value:&stru_419A0 table:@"NotificationsSettings"];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  unsigned int v9 = [v8 localizedStringForKey:@"ALLOW" value:&stru_419A0 table:@"NotificationsSettings"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1F2D0;
  v15[3] = &unk_413A8;
  v15[4] = self;
  uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v15];

  [v7 addAction:v10];
  v11 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v12 = [v11 localizedStringForKey:@"NOT_NOW" value:&stru_419A0 table:@"NotificationsSettings"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1F2D8;
  v14[3] = &unk_413A8;
  v14[4] = self;
  v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v14];

  [v7 addAction:v13];
  [(NCSpokenNotificationsDetailListController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_presentPasscodeView
{
  id v3 = objc_alloc_init((Class)LAPasscodeVerificationServiceOptions);
  v4 = [(PSSpecifier *)self->_spokenNotificationsSwitchSpecifier name];
  [v3 setTitle:v4];

  objc_initWeak(&location, self);
  passcodeService = self->_passcodeService;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1F408;
  v6[3] = &unk_413D0;
  objc_copyWeak(&v7, &location);
  [(LAPasscodeVerificationService *)passcodeService startInParentVC:self options:v3 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)globalAnnounceHeadphonesSetting:(id)a3
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  v4 = (char *)[v3 effectiveGlobalAnnounceHeadphonesSetting];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    unsigned __int8 v5 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)setGlobalAnnounceHeadphonesSetting:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = +[NCSettingsGatewayController sharedInstance];
  [v5 setEffectiveGlobalAnnounceHeadphonesSetting:v4];
}

- (id)globalAnnounceHearingAidsSetting:(id)a3
{
  id v3 = +[AFPreferences sharedPreferences];
  unsigned int v4 = [v3 announceNotificationsOnHearingAidsEnabled];

  id v5 = +[AFPreferences sharedPreferences];
  unsigned int v6 = [v5 announceNotificationsOnHearingAidsSupported];

  if ((v4 & v6) != 0) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }

  return v7;
}

- (void)setGlobalAnnounceHearingAidsSetting:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setAnnounceNotificationsOnHearingAidsEnabled:v5];
}

- (void)didAcceptEnteredPIN
{
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setDisableAssistantWhilePasscodeLocked:0];

  id v4 = +[AFPreferences sharedPreferences];
  [v4 synchronize];

  [(NCSpokenNotificationsDetailListController *)self _setGlobalAnnounceSetting:2];
}

- (void)didCancelEnteringPIN
{
  id v2 = [(PSSpecifier *)self->_spokenNotificationsSwitchSpecifier propertyForKey:PSControlKey];
  [v2 setOn:0 animated:1];
}

- (void)setSpokenRepliesWithoutConfirmation:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setSpokenNotificationSkipTriggerlessReplyConfirmation:v5];
}

- (id)spokenRepliesWithoutConfirmation:(id)a3
{
  id v3 = +[AFPreferences sharedPreferences];
  if ([v3 spokenNotificationSkipTriggerlessReplyConfirmation]) {
    id v4 = &__kCFBooleanTrue;
  }
  else {
    id v4 = &__kCFBooleanFalse;
  }
  id v5 = v4;

  return v5;
}

- (id)_updatesForSpecifiers:(id)a3 withGlobalAnnouncesState:(int64_t)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[PSSpecifierUpdates updatesWithSpecifiers:v8];
  uint64_t v10 = (void *)v9;
  if (a4 == 2)
  {
    v48 = (void *)v9;
    v49 = v8;
    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = [(NCSpokenNotificationsDetailListController *)self _specifiersForAnnounceDestinations];
    if ([v12 count]) {
      [v11 addObjectsFromArray:v12];
    }
    v47 = v12;
    v13 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_REPLIES_WITHOUT_CONFIRMATION_GROUP_ID"];
    id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v15 = [v14 localizedStringForKey:@"SPOKEN_REPLIES_WITHOUT_CONFIRMATION_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
    id obj = (id)PSFooterTextGroupKey;
    objc_msgSend(v13, "setProperty:forKey:", v15);

    id v16 = v13;
    objc_msgSend(v11, "bs_safeAddObject:", v13);
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v18 = [v17 localizedStringForKey:@"SPOKEN_REPLIES_WITHOUT_CONFIRMATION" value:&stru_419A0 table:@"NotificationsSettings"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setSpokenRepliesWithoutConfirmation:specifier:" get:"spokenRepliesWithoutConfirmation:" detail:0 cell:6 edit:0];

    [v19 setIdentifier:@"SPOKEN_REPLIES_WITHOUT_CONFIRMATION_ID"];
    [v11 addObject:v19];
    id v8 = v49;
    v20 = [v49 specifierForID:@"SPOKEN_NOTIFICATIONS_APP_LIST_GROUP_ID"];
    uint64_t v5 = v5;
    if (!v20)
    {
      v45 = v19;
      v46 = v13;
      v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v22 = [v21 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_LIST_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
      v23 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_APP_LIST_GROUP_ID" name:v22];

      v24 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v25 = [v24 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_APP_LIST_SUBTEXT" value:&stru_419A0 table:@"NotificationsSettings"];
      [v23 setProperty:v25 forKey:obj];

      v26 = v11;
      v44 = v23;
      [v11 addObject:v23];
      v27 = +[NCSettingsGatewayController sharedInstance];
      v28 = [v27 activeSectionInfo];

      v43 = v28;
      v42 = objc_msgSend(v28, "bs_filter:", &stru_413F0);
      [v42 sortedArrayUsingComparator:&stru_41410];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obja = (id)objc_claimAutoreleasedReturnValue();
      id v29 = [obja countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v53;
        uint64_t v32 = PSLazyIconLoading;
        uint64_t v33 = PSLazyIconAppID;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v53 != v31) {
              objc_enumerationMutation(obja);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            v36 = BBSettingsDisplayNameForBBSection(v35);
            v37 = +[NCSpokenNotificationsAppDetailController spokenNotificationsSpecifierNamed:v36 sectionInfo:v35 showIcon:1 class:objc_opt_class()];

            [v37 setProperty:&__kCFBooleanTrue forKey:v32];
            v38 = [v35 sectionID];
            [v37 setProperty:v38 forKey:v33];

            objc_msgSend(v26, "bs_safeAddObject:", v37);
          }
          id v30 = [obja countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v30);
      }

      uint64_t v5 = v5;
      id v8 = v49;
      id v11 = v26;
      v19 = v45;
      id v16 = v46;
      v20 = v44;
    }
    uint64_t v10 = v48;
    objc_msgSend(v48, "insertContiguousSpecifiers:atIndex:", v11, objc_msgSend(v8, "count"));
  }
  else
  {
    v39 = [v8 indexOfSpecifierWithID:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATIONS_GROUP_ID"];
    if (v39 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL
      || (v39 = [v8 indexOfSpecifierWithID:@"SPOKEN_REPLIES_WITHOUT_CONFIRMATION_GROUP_ID"],
          v39 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v10, "removeSpecifiersInRange:", v39, (unsigned char *)objc_msgSend(v8, "count") - v39);
    }
  }
  v40 = [v10 context];
  [v40 setAnimated:v5];

  return v10;
}

- (id)_specifiersForAnnounceDestinations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NCSettingsGatewayController sharedInstance];
  id v5 = [v4 effectiveGlobalAnnounceHeadphonesSetting];

  id v6 = +[NCSettingsGatewayController sharedInstance];
  id v7 = (char *)[v6 effectiveGlobalAnnounceCarPlaySetting];

  id v8 = +[AFPreferences sharedPreferences];
  if ([v8 announceNotificationsOnHearingAidsSupported]) {
    int v9 = _os_feature_enabled_impl();
  }
  else {
    int v9 = 0;
  }

  if (v5 != (id)-1 || v7 + 1 != 0 || v9 != 0)
  {
    v27 = self;
    v12 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v13 = [v12 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATIONS_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
    id v14 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATIONS_GROUP_ID" name:v13];

    [v3 addObject:v14];
    if (v5 != (id)-1)
    {
      v15 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v16 = [v15 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_HEADPHONES" value:&stru_419A0 table:@"NotificationsSettings"];
      v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v27 set:"setGlobalAnnounceHeadphonesSetting:specifier:" get:"globalAnnounceHeadphonesSetting:" detail:0 cell:6 edit:0];

      [v17 setIdentifier:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_HEADPHONES"];
      [v3 addObject:v17];
      v18 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v19 = [v18 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
      [v14 setProperty:v19 forKey:PSFooterTextGroupKey];
    }
    if (v7 != (char *)-1)
    {
      v20 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v21 = [v20 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY" value:&stru_419A0 table:@"NotificationsSettings"];
      v22 = +[NCSpokenCarPlayNotificationsDetailController spokenCarPlayNotificationSpecifierNamed:v21];

      [v22 setIdentifier:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY"];
      [v3 addObject:v22];
    }
    if (v9)
    {
      v23 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v24 = [v23 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_HEARING_AIDS" value:&stru_419A0 table:@"NotificationsSettings"];
      v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:v27 set:"setGlobalAnnounceHearingAidsSetting:specifier:" get:"globalAnnounceHearingAidsSetting:" detail:0 cell:6 edit:0];

      [v25 setIdentifier:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_HEARING_AIDS"];
      [v3 addObject:v25];
    }
  }

  return v3;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCSpokenNotificationsDetailListController;
  id v4 = [(NCSpokenNotificationsDetailListController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4
{
}

- (void)settingsGatewayDidUpdateGlobalSettings:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_202C0;
  block[3] = &unk_40F58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didChangeSettingForSpokenCarPlayNotificationsDetailController:(id)a3
{
}

- (NCSpokenNotificationsDetailListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSpokenNotificationsDetailListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeService, 0);

  objc_storeStrong((id *)&self->_spokenNotificationsSwitchSpecifier, 0);
}

@end