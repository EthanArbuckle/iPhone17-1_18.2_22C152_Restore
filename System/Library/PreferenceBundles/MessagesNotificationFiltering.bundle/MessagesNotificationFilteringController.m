@interface MessagesNotificationFilteringController
- (BOOL)isMessageSpamFilteringEnabled:(id)a3;
- (BOOL)showSafetyMonitorUseCriticalAlertsSwitch;
- (MessagesNotificationFilteringController)init;
- (id)alertCount:(id)a3;
- (id)promotionsNotificationsValue:(id)a3;
- (id)safetyMonitorUseCriticalAlertsValue:(id)a3;
- (id)sosAlertingUseCriticalAlertsValue:(id)a3;
- (id)specifiers;
- (id)transactionsNotificationsValue:(id)a3;
- (id)unknownSendersNotificationsValue:(id)a3;
- (int64_t)_validateAlertCount:(int64_t)a3;
- (void)setAlertCount:(id)a3 specifier:(id)a4;
- (void)setPromotionsNotificationsValue:(id)a3 specifier:(id)a4;
- (void)setSOSAlertingUseCriticalAlertsValue:(id)a3 specifier:(id)a4;
- (void)setSafetyMonitorUseCriticalAlertsValue:(id)a3 specifier:(id)a4;
- (void)setTransactionsNotificationsValue:(id)a3 specifier:(id)a4;
- (void)setUnknownSendersNotificationsValue:(id)a3 specifier:(id)a4;
@end

@implementation MessagesNotificationFilteringController

- (MessagesNotificationFilteringController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesNotificationFilteringController;
  return [(MessagesNotificationFilteringController *)&v3 init];
}

- (int64_t)_validateAlertCount:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB) {
    return 2;
  }
  else {
    return qword_7128[a3];
  }
}

- (id)alertCount:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  v4 = +[NSNumber numberWithInt:2];
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"IncomingMessageAlertCount", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v6 = +[NSNumber numberWithLong:[(MessagesNotificationFilteringController *)self _validateAlertCount:AppIntegerValue]];

    v4 = (void *)v6;
  }

  return v4;
}

- (void)setAlertCount:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertCount", a3, @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertCount.changed", 0, 0, 1u);
  sub_4CE0();
  id v6 = (id)objc_opt_new();
  if (PSIsNanoMirroringDomain())
  {
    v5 = +[NSSet setWithObject:@"IncomingMessageAlertCount"];
    [v6 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v5];
  }
}

- (id)unknownSendersNotificationsValue:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  objc_super v3 = +[NSNumber numberWithBool:1];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltrationUnknownSenders", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v5 = +[NSNumber numberWithBool:AppBooleanValue == 0];

    objc_super v3 = (void *)v5;
  }

  return v3;
}

- (void)setUnknownSendersNotificationsValue:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationUnknownSenders", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue] ^ 1), @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltrationUnknownSenders.changed", 0, 0, 1u);
  sub_4CE0();
  id v7 = (id)objc_opt_new();
  if (PSIsNanoMirroringDomain())
  {
    uint64_t v5 = +[NSSet setWithObject:@"IncomingMessageAlertFiltrationUnknownSenders"];
    [v7 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v5];
  }
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, @"__kIMDBadgeUtilitiesRebuildUnreadMessageCountNotification", 0, 0, 1u);
}

- (id)transactionsNotificationsValue:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  objc_super v3 = +[NSNumber numberWithBool:1];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltrationTransactions", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v5 = +[NSNumber numberWithBool:AppBooleanValue == 0];

    objc_super v3 = (void *)v5;
  }

  return v3;
}

- (void)setTransactionsNotificationsValue:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationTransactions", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue] ^ 1), @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltrationTransactions.changed", 0, 0, 1u);
  sub_4CE0();
  id v6 = (id)objc_opt_new();
  if (PSIsNanoMirroringDomain())
  {
    uint64_t v5 = +[NSSet setWithObject:@"IncomingMessageAlertFiltrationTransactions"];
    [v6 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v5];
  }
}

- (id)promotionsNotificationsValue:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  objc_super v3 = +[NSNumber numberWithBool:1];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltrationPromotions", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v5 = +[NSNumber numberWithBool:AppBooleanValue == 0];

    objc_super v3 = (void *)v5;
  }

  return v3;
}

- (void)setPromotionsNotificationsValue:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationPromotions", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 BOOLValue] ^ 1), @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltrationPromotions.changed", 0, 0, 1u);
  sub_4CE0();
  id v6 = (id)objc_opt_new();
  if (PSIsNanoMirroringDomain())
  {
    uint64_t v5 = +[NSSet setWithObject:@"IncomingMessageAlertFiltrationPromotions"];
    [v6 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v5];
  }
}

- (BOOL)isMessageSpamFilteringEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertSpamFiltration", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (id)sosAlertingUseCriticalAlertsValue:(id)a3
{
  id v3 = [sub_533C() isSOSMessagesUrgentAlertingEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setSOSAlertingUseCriticalAlertsValue:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = sub_533C();
  id v6 = [v4 BOOLValue];

  [v5 setSOSMessagesUrgentAlertingEnabled:v6];
}

- (BOOL)showSafetyMonitorUseCriticalAlertsSwitch
{
  return +[SMMobileSMSPreferencesUtilities criticalAlertPreference] != 0;
}

- (id)safetyMonitorUseCriticalAlertsValue:(id)a3
{
  BOOL v3 = +[SMMobileSMSPreferencesUtilities criticalAlertPreference] == (char *)&dword_0 + 1;

  return +[NSNumber numberWithInt:v3];
}

- (void)setSafetyMonitorUseCriticalAlertsValue:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }

  +[SMMobileSMSPreferencesUtilities setCriticalAlertPreference:v4];
}

- (id)specifiers
{
  BOOL v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v57 = OBJC_IVAR___PSListController__specifiers;
    v59 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"BBSECTION_INFO_KEY"];
    id v66 = objc_alloc_init((Class)NSMutableArray);
    v64 = +[NSBundle bundleForClass:objc_opt_class()];
    v62 = [v64 localizedStringForKey:@"ALERT_0_TIMES" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[0] = v62;
    v60 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = [v60 localizedStringForKey:@"ALERT_1_TIME" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[1] = v4;
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"ALERT_2_TIMES" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[2] = v6;
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"ALERT_3_TIMES" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[3] = v8;
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"ALERT_5_TIMES" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[4] = v10;
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"ALERT_10_TIMES" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v72[5] = v12;
    v58 = +[NSArray arrayWithObjects:v72 count:6];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"REPEAT_ALERT" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setAlertCount:specifier:" get:"alertCount:" detail:objc_opt_class() cell:2 edit:0];

    [v15 setIdentifier:@"REPEAT_ALERT_ID"];
    [v15 setValues:&off_88B8 titles:v58];
    [v15 setProperty:v59 forKey:@"BBSECTION_INFO_KEY"];
    [v15 setProperty:&__kCFBooleanFalse forKey:PSDeferItemSelectionKey];
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"REPEAT_ALERT_FOOTER_TEXT" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    [v15 setProperty:v17 forKey:PSStaticTextMessageKey];

    [v66 addObject:v15];
    v65 = +[PSSpecifier groupSpecifierWithID:@"ALLOW_NOTIFICATIONS_GROUP_ID"];
    uint64_t v61 = PSIsRadioGroupKey;
    objc_msgSend(v65, "setProperty:forKey:", &__kCFBooleanTrue);
    [v66 addObject:v65];
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"ALLOW_NOTIFICATIONS_GROUP_NAME" value:&stru_8420 table:@"MessagesNotificationFiltering"];

    [v65 setName:v19];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"UNKNOWN_SENDERS" value:&stru_8420 table:@"MessagesNotificationFiltering"];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"setUnknownSendersNotificationsValue:specifier:" get:"unknownSendersNotificationsValue:" detail:0 cell:6 edit:0];

    [v22 setIdentifier:@"UNKNOWN_SENDER_CELL_ID"];
    [v66 addObject:v22];
    if ([(MessagesNotificationFilteringController *)self isMessageSpamFilteringEnabled:0])
    {
      v23 = +[NSBundle bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"TRANSACTIONAL_SENDER_CELL_TITLE" value:&stru_8420 table:@"MessagesNotificationFiltering"];
      v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"setTransactionsNotificationsValue:specifier:" get:"transactionsNotificationsValue:" detail:0 cell:6 edit:0];

      [v25 setIdentifier:@"TRANSACTIONAL_SENDER_CELL_ID"];
      [v66 addObject:v25];
      v26 = +[NSBundle bundleForClass:objc_opt_class()];
      v27 = [v26 localizedStringForKey:@"PROMOTIONAL_SENDER_CELL_TITLE" value:&stru_8420 table:@"MessagesNotificationFiltering"];
      v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setPromotionsNotificationsValue:specifier:" get:"promotionsNotificationsValue:" detail:0 cell:6 edit:0];

      [v28 setIdentifier:@"PROMOTIONAL_SENDER_CELL_ID"];
      [v66 addObject:v28];
    }
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2050000000;
    v29 = (void *)qword_C288;
    uint64_t v71 = qword_C288;
    if (!qword_C288)
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_650C;
      v67[3] = &unk_81F8;
      v67[4] = &v68;
      sub_650C((uint64_t)v67);
      v29 = (void *)v69[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v68, 8);
    v31 = [v30 currentNotificationSettingsCenter];
    v63 = [v31 notificationSourceWithIdentifier:@"com.apple.MobileSMS"];

    v32 = [v63 sourceSettings];
    uint64_t v33 = [v32 notificationSettings];
    v34 = (char *)[(id)v33 criticalAlertSetting];

    v35 = +[IMFeatureFlags sharedFeatureFlags];
    LODWORD(v33) = [v35 isSOSAlertingEnabled];

    int v56 = v33 ^ 1 | (v34 != (unsigned char *)&dword_0 + 2);
    if ((v33 ^ 1) & 1 | (v34 != (unsigned char *)&dword_0 + 2))
    {
      v36 = v22;
      v37 = v19;
    }
    else
    {
      v38 = +[PSSpecifier groupSpecifierWithID:@"SOS_ALERTING_GROUP_ID"];
      [v38 setProperty:&__kCFBooleanTrue forKey:v61];
      [v66 addObject:v38];
      v39 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = [v39 localizedStringForKey:@"RECEIVE_AS_CRITICAL_ALERTS_GROUP_NAME" value:&stru_8420 table:@"MessagesNotificationFiltering"];

      [v38 setName:v37];
      v40 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v40 localizedStringForKey:@"SOS_ALERTING_RECEIVE_AS_CRITICAL_CELL_TITLE" value:&stru_8420 table:@"MessagesNotificationFiltering"];
      v36 = +[PSSpecifier preferenceSpecifierNamed:v41 target:self set:"setSOSAlertingUseCriticalAlertsValue:specifier:" get:"sosAlertingUseCriticalAlertsValue:" detail:0 cell:6 edit:0];

      [v36 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v36 setIdentifier:@"SOS_ALERTING_RECEIVE_AS_CRITICAL_CELL_ID"];
      [v66 addObject:v36];
      v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v43 = [v42 localizedStringForKey:@"SOS_ALERTING_GROUP_FOOTER" value:&stru_8420 table:@"MessagesNotificationFiltering"];

      [v38 setProperty:v43 forKey:PSFooterTextGroupKey];
    }
    v44 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v45 = [v44 isZelkovaEnabled];

    if ((v45 ^ 1) & 1 | (v34 != (unsigned char *)&dword_0 + 2)
      || ![(MessagesNotificationFilteringController *)self showSafetyMonitorUseCriticalAlertsSwitch])
    {
      v49 = v36;
      v48 = v37;
    }
    else
    {
      v46 = +[PSSpecifier groupSpecifierWithID:@"SAFETY_MONITOR_GROUP_ID"];
      [v46 setProperty:&__kCFBooleanTrue forKey:v61];
      [v66 addObject:v46];
      if (v56)
      {
        v47 = +[NSBundle bundleForClass:objc_opt_class()];
        v48 = [v47 localizedStringForKey:@"RECEIVE_AS_CRITICAL_ALERTS_GROUP_NAME" value:&stru_8420 table:@"MessagesNotificationFiltering"];

        [v46 setName:v48];
      }
      else
      {
        v48 = v37;
      }
      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"SAFETY_MONITOR_RECEIVE_AS_CRITICAL_CELL_TITLE" value:&stru_8420 table:@"MessagesNotificationFiltering"];
      v49 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:"setSafetyMonitorUseCriticalAlertsValue:specifier:" get:"safetyMonitorUseCriticalAlertsValue:" detail:0 cell:6 edit:0];

      [v49 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      [v49 setIdentifier:@"SAFETY_MONITOR_RECEIVE_AS_CRITICAL_CELL_ID"];
      [v66 addObject:v49];
      v52 = +[NSBundle bundleForClass:objc_opt_class()];
      v53 = [v52 localizedStringForKey:@"SAFETY_MONITOR_GROUP_FOOTER" value:&stru_8420 table:@"MessagesNotificationFiltering"];

      [v46 setProperty:v53 forKey:PSFooterTextGroupKey];
    }
    v54 = *(void **)&self->PSListController_opaque[v57];
    *(void *)&self->PSListController_opaque[v57] = v66;

    BOOL v3 = *(void **)&self->PSListController_opaque[v57];
  }

  return v3;
}

@end