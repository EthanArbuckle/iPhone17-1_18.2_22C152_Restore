@interface NCALSettingsController
- (BOOL)caresAboutSubsections;
- (BOOL)showAlertsForSubsectionId:(id)a3;
- (BOOL)suppressSendToNotificationCenterOption;
- (BOOL)usingCustomCalendars;
- (BOOL)usingCustomOverlayCalendar;
- (id)_alertsEnabled:(id)a3;
- (id)_specifiersForOverlayCalendars;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)notificationApplicationSpecifiers;
- (void)mirrorSettingsChanged:(BOOL)a3;
- (void)setOverlayCalendarID:(id)a3;
- (void)setShowAlerts:(BOOL)a3 forSubsectionId:(id)a4;
- (void)setUsingCustomCalendars:(BOOL)a3;
- (void)setUsingCustomOverlayCalendar:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation NCALSettingsController

- (id)applicationBundleIdentifier
{
  return @"com.apple.mobilecal";
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];

  return v3;
}

- (BOOL)caresAboutSubsections
{
  return 1;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NCALSettingsController;
  v5 = [(NCALSettingsController *)&v10 loadSpecifiersFromPlistName:a3 target:a4 bundle:a5];
  v6 = [v5 specifierForID:BPSMirrorGroupID];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"NOTIFICATIONS_GROUP_HEADER" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  [v6 setName:v8];

  return v5;
}

- (id)notificationApplicationSpecifiers
{
  v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v32 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v33 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATIONS_SUBSECTIONS_GROUP_ID"];
    [v4 addObject:v33];
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"UPCOMING_EVENTS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_alertsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    v40[0] = @"SpecifierUserInfoSubsectionID";
    v40[1] = @"SpecifierUserInfoShowAlertString";
    v41[0] = @"com.apple.mobilecal.bulletin-subsection.upcomingEvents";
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"SHOW_UPCOMING_EVENT_ALERTS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v41[1] = v9;
    objc_super v10 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    [v7 setUserInfo:v10];

    [v7 setIdentifier:@"Upcoming Events"];
    [v4 addObject:v7];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"INVITATIONS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"_alertsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    v38[0] = @"SpecifierUserInfoSubsectionID";
    v38[1] = @"SpecifierUserInfoShowAlertString";
    v39[0] = @"com.apple.mobilecal.bulletin-subsection.invitations";
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SHOW_INVITATION_ALERTS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v39[1] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    [v13 setUserInfo:v16];

    [v13 setIdentifier:@"Invitations"];
    [v4 addObject:v13];
    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"INVITEE_RESPONSES" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:"_alertsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    v36[0] = @"SpecifierUserInfoSubsectionID";
    v36[1] = @"SpecifierUserInfoShowAlertString";
    v37[0] = @"com.apple.mobilecal.bulletin-subsection.Responses";
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"SHOW_INVITEE_RESPONSE_ALERTS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v37[1] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v19 setUserInfo:v22];

    [v19 setIdentifier:@"Invitee Responses"];
    [v4 addObject:v19];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"SHARED_CALENDAR_CHANGES" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:"_alertsEnabled:" detail:objc_opt_class() cell:2 edit:0];

    v34[0] = @"SpecifierUserInfoSubsectionID";
    v34[1] = @"SpecifierUserInfoShowAlertString";
    v35[0] = @"com.apple.mobilecal.bulletin-subsection.resourceChanges";
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"SHOW_SHARED_CALENDAR_CHANGES" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    v35[1] = v27;
    v28 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v25 setUserInfo:v28];

    [v25 setIdentifier:@"Shared Calendar Alerts"];
    [v4 addObject:v25];
    id v29 = [v4 copy];
    v30 = *(void **)&self->BPSNotificationAppController_opaque[v32];
    *(void *)&self->BPSNotificationAppController_opaque[v32] = v29;

    v3 = *(void **)&self->BPSNotificationAppController_opaque[v32];
  }

  return v3;
}

- (id)localizedMirroringDetailFooter
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(NCALSettingsController *)self bbSectionInfo];
  v5 = [v4 subsections];
  id v6 = [v5 copy];

  v7 = [(NCALSettingsController *)self sectionInfo];
  v8 = [v7 objectForKeyedSubscript:BPSNanoBulletinSubsections];
  v9 = [v8 valueForKey:BPSNanoBulletinSubsectionId];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  void v41[2] = sub_92B0;
  v41[3] = &unk_107E8;
  id v32 = v9;
  id v42 = v32;
  [v6 indexesOfObjectsPassingTest:v41];
  v31 = v33 = v6;
  objc_super v10 = objc_msgSend(v6, "objectsAtIndexes:");
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_NO_COLON" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  unsigned int v13 = [(NCALSettingsController *)self showAlerts];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v13) {
    CFStringRef v16 = @"SHOW_ALERTS";
  }
  else {
    CFStringRef v16 = @"DONT_SHOW_ALERTS";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  v36 = v3;
  objc_msgSend(v3, "appendFormat:", v12, v17);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v10;
  id v18 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v22 = +[NSBundle bundleForClass:objc_opt_class()];
        v23 = [v22 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_WITH_COLON" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
        v24 = [v21 displayName];
        LODWORD(v21) = [v21 showsInNotificationCenter];
        v25 = +[NSBundle bundleForClass:objc_opt_class()];
        v26 = v25;
        if (v21) {
          CFStringRef v27 = @"ON";
        }
        else {
          CFStringRef v27 = @"OFF";
        }
        v28 = [v25 localizedStringForKey:v27 value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
        objc_msgSend(v36, "appendFormat:", v23, v24, v28);
      }
      id v19 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v19);
  }

  id v29 = [v36 copy];

  return v29;
}

- (void)mirrorSettingsChanged:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 3;
  }
  unsigned int v13 = [(NCALSettingsController *)self sectionInfo];
  v4 = [v13 objectForKeyedSubscript:BPSNanoBulletinSubsections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = BPSNanoBulletinSubsectionId;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKeyedSubscript:v8];
        v11 = +[TLToneManager sharedToneManager];
        [v11 _setCurrentToneWatchAlertPolicy:v3 forAlertType:10 accountIdentifier:v10];

        v12 = +[TLVibrationManager sharedVibrationManager];
        [v12 _setCurrentVibrationWatchAlertPolicy:v3 forAlertType:10 accountIdentifier:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)applicationGroupSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  if (v5)
  {
    NRWatchOSVersionForRemoteDevice();
    if (NRVersionIsGreaterThanOrEqual())
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"CALENDARS_GROUP_HEADER" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
      uint64_t v8 = +[PSSpecifier groupSpecifierWithID:@"CALENDARS_MIRROR_RADIO_GROUP_ID" name:v7];

      [v3 addObject:v8];
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v10 = [v9 localizedStringForKey:@"CALENDARS_MIRROR_MY_COMPANION" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v11 setIdentifier:@"CALENDARS_MIRROR_MY_COMPANION_ID"];
      [v3 addObject:v11];
      v12 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v13 = [v12 localizedStringForKey:@"CALENDARS_CUSTOM" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
      long long v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v14 setIdentifier:@"CALENDARS_CUSTOM_ID"];
      [v14 setProperty:&__kCFBooleanTrue forKey:PSHidesDisclosureIndicatorKey];
      [v3 addObject:v14];
      if ([(NCALSettingsController *)self usingCustomCalendars]) {
        long long v15 = v14;
      }
      else {
        long long v15 = v11;
      }
      [v8 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];
    }
  }
  long long v16 = [(NCALSettingsController *)self _specifiersForOverlayCalendars];
  [v3 addObjectsFromArray:v16];

  return v3;
}

- (id)_specifiersForOverlayCalendars
{
  uint64_t v3 = objc_opt_new();
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"OVERLAY_CALENDARS" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  id v6 = +[PSSpecifier groupSpecifierWithID:@"OVERLAY_CALENDAR_GROUP_ID" name:v5];

  [v3 addObject:v6];
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"CALENDARS_MIRROR_MY_COMPANION" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setIdentifier:@"OVERLAY_CALENDAR_MIRROR_MY_COMPANION_ID"];
  [v3 addObject:v9];
  objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CALENDARS_CUSTOM" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v12 setIdentifier:@"OVERLAY_CALENDAR_CUSTOM_ID"];
  id v39 = v3;
  [v3 addObject:v12];
  uint64_t v13 = PSRadioGroupCheckedSpecifierKey;
  v34 = v9;
  [v6 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  if ([(NCALSettingsController *)self usingCustomOverlayCalendar])
  {
    id v32 = v12;
    v33 = v6;
    uint64_t v35 = v13;
    [v6 setProperty:v12 forKey:v13];
    long long v14 = +[PSSpecifier groupSpecifierWithID:@"OVERLAY_CALENDAR_CUSTOM_GROUP_ID" name:&stru_10A50];
    [v14 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    long long v40 = v14;
    [v3 addObject:v14];
    long long v15 = +[NanoCalendarPreferences overlayCalendarLocaleIDs];
    long long v16 = +[NanoCalendarPreferences overlayCalendarLocaleDisplayNames];
    [v15 insertObject:&stru_10A50 atIndex:0];
    long long v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"OFF" value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];
    long long v38 = v16;
    [v16 setObject:v18 forKeyedSubscript:&stru_10A50];

    id v19 = +[NanoCalendarPreferences sharedPreferences];
    long long v37 = [v19 overlayCalendarID];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v15;
    id v20 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v42;
      uint64_t v23 = PSValueKey;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v26 = [v38 objectForKeyedSubscript:v25];
          CFStringRef v27 = self;
          v28 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:0 cell:3 edit:0];
          id v29 = [v40 identifier];
          v30 = +[NSString stringWithFormat:@"%@.%@", v29, v25];

          [v28 setIdentifier:v30];
          [v28 setObject:v25 forKeyedSubscript:v23];
          [v39 addObject:v28];
          if ([v25 isEqualToString:v37]) {
            [v40 setObject:v28 forKeyedSubscript:v35];
          }

          self = v27;
        }
        id v21 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v21);
    }

    v12 = v32;
    id v6 = v33;
  }

  return v39;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NCALSettingsController *)self indexForIndexPath:v7];
  v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  objc_super v10 = [v9 identifier];
  unsigned int v11 = [v10 isEqualToString:@"CALENDARS_MIRROR_MY_COMPANION_ID"];

  if ((v11 & 1) != 0
    || ([v9 identifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:@"CALENDARS_CUSTOM_ID"],
        v12,
        v13))
  {
    [(NCALSettingsController *)self setUsingCustomCalendars:v11 ^ 1];
  }
  long long v14 = [v9 identifier];
  unsigned int v15 = [v14 isEqualToString:@"OVERLAY_CALENDAR_MIRROR_MY_COMPANION_ID"];

  if (v15)
  {
    long long v16 = self;
    uint64_t v17 = 0;
LABEL_8:
    [(NCALSettingsController *)v16 setUsingCustomOverlayCalendar:v17];
    goto LABEL_9;
  }
  id v18 = [v9 identifier];
  unsigned int v19 = [v18 isEqualToString:@"OVERLAY_CALENDAR_CUSTOM_ID"];

  if (v19)
  {
    long long v16 = self;
    uint64_t v17 = 1;
    goto LABEL_8;
  }
  id v20 = [v9 identifier];
  unsigned int v21 = [v20 containsString:@"OVERLAY_CALENDAR_CUSTOM_GROUP_ID"];

  if (v21)
  {
    uint64_t v22 = [v9 objectForKeyedSubscript:PSValueKey];
    [(NCALSettingsController *)self setOverlayCalendarID:v22];
  }
LABEL_9:
  v23.receiver = self;
  v23.super_class = (Class)NCALSettingsController;
  [(NCALSettingsController *)&v23 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (BOOL)usingCustomCalendars
{
  v2 = +[NanoCalendarPreferences sharedPreferences];
  uint64_t v3 = [v2 customDeselectedCalendarHashes];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setUsingCustomCalendars:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCALSettingsController *)self usingCustomCalendars] != a3)
  {
    id v5 = ncs_log_selected_calendars();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "NCALSettingsController: Set Using Custom Calendars: %d", (uint8_t *)v11, 8u);
    }

    id v6 = +[NanoCalendarPreferences sharedPreferences];
    if (v3)
    {
      id v7 = +[EKPreferences shared];
      id v8 = [v7 deselectedCalendarSyncHashes];

      if (v8)
      {
        v9 = +[EKPreferences shared];
        objc_super v10 = [v9 deselectedCalendarSyncIdentifiers];
      }
      else
      {
        id v8 = &__NSArray0__struct;
        objc_super v10 = &__NSArray0__struct;
      }
    }
    else
    {
      id v8 = 0;
      objc_super v10 = 0;
    }
    [v6 setCustomDeselectedCalendarHashes:v8];
    [v6 setCustomDeselectedCalendarIdentifiers:v10];
    [(NCALSettingsController *)self reloadSpecifiers];
  }
}

- (id)_alertsEnabled:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SpecifierUserInfoSubsectionID"];

  LODWORD(v4) = [(NCALSettingsController *)self showAlertsForSubsectionId:v5];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v4) {
    CFStringRef v8 = @"ON";
  }
  else {
    CFStringRef v8 = @"OFF";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_10A50 table:@"NanoCalendarBridgeSettings"];

  return v9;
}

- (void)setShowAlerts:(BOOL)a3 forSubsectionId:(id)a4
{
  BOOL v16 = a3;
  id v5 = a4;
  uint64_t v17 = [(NCALSettingsController *)self sectionInfo];
  [v17 objectForKeyedSubscript:BPSNanoBulletinSubsections];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    uint64_t v10 = BPSNanoBulletinSubsectionId;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v13 = [v12 objectForKeyedSubscript:v10];
        unsigned int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          unsigned int v15 = +[NSNumber numberWithBool:v16];
          [v12 setObject:v15 forKeyedSubscript:BPSNanoBulletinShowsAlerts];

          [(NCALSettingsController *)self writeSectionState];
          [(NCALSettingsController *)self reloadSpecifiers];
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)showAlertsForSubsectionId:(id)a3
{
  id v4 = a3;
  id v5 = [(NCALSettingsController *)self sectionInfo];
  [v5 objectForKeyedSubscript:BPSNanoBulletinSubsections];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    uint64_t v10 = BPSNanoBulletinSubsectionId;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v10, (void)v18);
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          BOOL v16 = [v12 objectForKeyedSubscript:BPSNanoBulletinShowsAlerts];
          unsigned __int8 v15 = [v16 BOOLValue];

          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)usingCustomOverlayCalendar
{
  v2 = +[NanoCalendarPreferences sharedPreferences];
  BOOL v3 = [v2 customOverlayCalendarID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setUsingCustomOverlayCalendar:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCALSettingsController *)self usingCustomOverlayCalendar] != a3)
  {
    if (v3) {
      id v5 = &stru_10A50;
    }
    else {
      id v5 = 0;
    }
    [(NCALSettingsController *)self setOverlayCalendarID:v5];
  }

  [(NCALSettingsController *)self reloadSpecifiers];
}

- (void)setOverlayCalendarID:(id)a3
{
  id v3 = a3;
  id v4 = +[NanoCalendarPreferences sharedPreferences];
  [v4 setOverlayCalendarID:v3 deviceHasCompanion:1];
}

@end