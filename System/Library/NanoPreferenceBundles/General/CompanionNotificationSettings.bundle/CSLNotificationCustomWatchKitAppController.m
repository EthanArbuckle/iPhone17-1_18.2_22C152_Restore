@interface CSLNotificationCustomWatchKitAppController
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (NSString)companionAppBundleID;
- (id)criticalAlertEnabled:(id)a3;
- (id)notificationApplicationSpecifiers;
- (id)soundValue:(id)a3;
- (void)setCompanionAppBundleID:(id)a3;
- (void)setCriticalAlertEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSoundValue:(id)a3 forSpecifier:(id)a4;
- (void)setSpecifier:(id)a3;
@end

@implementation CSLNotificationCustomWatchKitAppController

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"companionAppBundleID"];
  v6 = (NSString *)[v5 copy];
  companionAppBundleID = self->_companionAppBundleID;
  self->_companionAppBundleID = v6;

  v8.receiver = self;
  v8.super_class = (Class)CSLNotificationCustomWatchKitAppController;
  [(CSLNotificationsOnlyAppListController *)&v8 setSpecifier:v4];
}

- (BOOL)suppressMirrorOption
{
  v3 = [(CSLNotificationCustomWatchKitAppController *)self companionAppBundleID];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc((Class)LSApplicationRecord);
    v6 = [(CSLNotificationCustomWatchKitAppController *)self companionAppBundleID];
    id v12 = 0;
    id v7 = [v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v12];
    id v8 = v12;

    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_8380(self, (uint64_t)v8);
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      v10 = [v7 applicationState];
      unsigned int v9 = [v10 isInstalled] ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)notificationApplicationSpecifiers
{
  if (!self->_specifiers)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    specifiers = self->_specifiers;
    self->_specifiers = v3;

    id v5 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
    v6 = [v5 objectForKeyedSubscript:BPSNanoBulletinSoundEnabled];

    if (v6)
    {
      id v7 = self->_specifiers;
      id v8 = +[PSSpecifier emptyGroupSpecifier];
      [(NSMutableArray *)v7 addObject:v8];

      unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"SOUND" value:&stru_C650 table:@"AbstactApplication"];
      v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setSoundValue:forSpecifier:" get:"soundValue:" detail:0 cell:6 edit:0];

      [(NSMutableArray *)self->_specifiers addObject:v11];
      id v12 = self->_specifiers;
      v13 = +[PSSpecifier emptyGroupSpecifier];
      [(NSMutableArray *)v12 addObject:v13];
    }
    v14 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
    v15 = [v14 objectForKeyedSubscript:BPSNanoBulletinCriticalAlertEnabled];

    if (v15)
    {
      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"CRITICAL_AELRTS" value:&stru_C650 table:@"AbstactApplication"];
      v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"setCriticalAlertEnabled:forSpecifier:" get:"criticalAlertEnabled:" detail:0 cell:6 edit:0];

      [(NSMutableArray *)self->_specifiers addObject:v18];
    }
  }
  v19 = self->_specifiers;

  return v19;
}

- (void)setSoundValue:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  v6 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
  [v6 setObject:v5 forKeyedSubscript:BPSNanoBulletinSoundEnabled];

  [(CSLNotificationCustomWatchKitAppController *)self writeSectionState];
}

- (id)soundValue:(id)a3
{
  v3 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
  id v4 = [v3 objectForKeyedSubscript:BPSNanoBulletinSoundEnabled];

  return v4;
}

- (void)setCriticalAlertEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  v6 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
  [v6 setObject:v5 forKeyedSubscript:BPSNanoBulletinCriticalAlertEnabled];

  [(CSLNotificationCustomWatchKitAppController *)self writeSectionState];
}

- (id)criticalAlertEnabled:(id)a3
{
  v3 = [(CSLNotificationCustomWatchKitAppController *)self sectionInfo];
  id v4 = [v3 objectForKeyedSubscript:BPSNanoBulletinCriticalAlertEnabled];

  return v4;
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (void)setCompanionAppBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionAppBundleID, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end