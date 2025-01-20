@interface MFNanoBridgeSettingsListController
- (BOOL)_needsSetUp;
- (BOOL)caresAboutSubsections;
- (BOOL)pairedDeviceSupportsStandaloneService;
- (BOOL)suppressSendToNotificationCenterOption;
- (MFNanoAccountsSettingsDataSource)mailAccountsDatasource;
- (MFNanoBridgeSettingsListController)init;
- (NMCUICloudNotificationAccountDataSource)cloudNotificationDatasource;
- (NMCUISpecifierController)specifierController;
- (id)_accountNamesKeyedByAccountId;
- (id)_alwaysLoadContentDirectly:(id)a3;
- (id)_askBeforeDeleting:(id)a3;
- (id)_includeMail:(id)a3;
- (id)_linesOfPreview:(id)a3;
- (id)_linesOfPreviewTitlesDictionary;
- (id)_linesOfPreviewValues;
- (id)_loadRemoteImages:(id)a3;
- (id)_mirroringDetailPrivacyProtection;
- (id)_mirroringDetailStringForAlerts;
- (id)_mirroringDetailStringForAskBeforeDeleting;
- (id)_mirroringDetailStringForLoadRemoteImages;
- (id)_mirroringDetailStringForNotificationSources;
- (id)_mirroringDetailStringForOrganizeByThread;
- (id)_organizeByThread:(id)a3;
- (id)_pairedNanoRegistryDevice;
- (id)_showAlertsFrom:(id)a3;
- (id)_signature:(id)a3;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)mirroredApplicationGroupSpecifiers;
- (id)notificationApplicationSpecifiers;
- (unint64_t)accountCellBadgeCount;
- (void)_setAlwaysLoadContentDirectly:(id)a3 withSpecifier:(id)a4;
- (void)_setAskBeforeDeleting:(id)a3 withSpecifier:(id)a4;
- (void)_setLinesOfPreview:(id)a3 withSpecifier:(id)a4;
- (void)_setLoadRemoteImages:(id)a3 withSpecifier:(id)a4;
- (void)_setOrganizeByThread:(id)a3 withSpecifier:(id)a4;
- (void)_setSignature:(id)a3 withSpecifier:(id)a4;
- (void)_setUpMail;
- (void)applicationWillEnterForegroundNotification;
- (void)mirrorSettingsChanged:(BOOL)a3;
- (void)saveShowAlertsForSpecifier:(id)a3;
- (void)setCloudNotificationDatasource:(id)a3;
- (void)setMailAccountsDatasource:(id)a3;
- (void)setSpecifierController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation MFNanoBridgeSettingsListController

- (MFNanoBridgeSettingsListController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MFNanoBridgeSettingsListController;
  v2 = [(MFNanoBridgeSettingsListController *)&v13 init];
  v3 = v2;
  if (v2
    && [(MFNanoBridgeSettingsListController *)v2 pairedDeviceSupportsStandaloneService])
  {
    v4 = objc_alloc_init(MFNanoAccountsSettingsDataSource);
    mailAccountsDatasource = v3->_mailAccountsDatasource;
    v3->_mailAccountsDatasource = v4;

    [(MFNanoAccountsSettingsDataSource *)v3->_mailAccountsDatasource addObserver:v3];
    [(MFNanoAccountsSettingsDataSource *)v3->_mailAccountsDatasource refreshAccounts];
    id v6 = objc_alloc((Class)NMCUICloudNotificationAccountDataSource);
    v7 = [[MFNanoCloudNotificationAccountDataSource alloc] initWithAccountDataSource:v3->_mailAccountsDatasource];
    v8 = (NMCUICloudNotificationAccountDataSource *)[v6 initWithAccountDataSource:v7];
    cloudNotificationDatasource = v3->_cloudNotificationDatasource;
    v3->_cloudNotificationDatasource = v8;

    v10 = (NMCUISpecifierController *)[objc_alloc((Class)NMCUISpecifierController) initWithListController:v3 dataSource:v3->_cloudNotificationDatasource isTinker:0];
    specifierController = v3->_specifierController;
    v3->_specifierController = v10;
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsListController;
  [(MFNanoBridgeSettingsListController *)&v5 viewDidAppear:a3];
  [(MFNanoAccountsSettingsDataSource *)self->_mailAccountsDatasource refreshAccounts];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"applicationWillEnterForegroundNotification" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsListController;
  [(MFNanoBridgeSettingsListController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)applicationWillEnterForegroundNotification
{
  [(MFNanoAccountsSettingsDataSource *)self->_mailAccountsDatasource refreshAccounts];

  [(MFNanoBridgeSettingsListController *)self reloadSpecifiers];
}

- (void)saveShowAlertsForSpecifier:(id)a3
{
  [(MFNanoBridgeSettingsListController *)self writeSectionState];

  [(MFNanoBridgeSettingsListController *)self reloadSpecifiers];
}

- (id)_pairedNanoRegistryDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 getDevices];
  v4 = [v3 firstObject];

  return v4;
}

- (BOOL)pairedDeviceSupportsStandaloneService
{
  v2 = [(MFNanoBridgeSettingsListController *)self _pairedNanoRegistryDevice];
  unsigned int v3 = NRWatchOSVersionForRemoteDevice();

  return HIWORD(v3) > 4u;
}

- (id)applicationBundleIdentifier
{
  return kMFMobileMailBundleIdentifier;
}

- (id)notificationApplicationSpecifiers
{
  id v27 = +[NSMutableArray array];
  unsigned int v3 = [(MFNanoBridgeSettingsListController *)self sectionInfo];
  v20 = [v3 objectForKeyedSubscript:BPSNanoBulletinSubsections];

  v21 = [(MFNanoBridgeSettingsListController *)self _accountNamesKeyedByAccountId];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v20;
  id v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    uint64_t v6 = BPSNanoBulletinSubsectionId;
    uint64_t v7 = MSUserNotificationCenterTopicVIP;
    uint64_t v26 = MSUserNotificationCenterTopicHighlights;
    uint64_t v25 = MSUserNotificationCenterTopicPrimary;
    uint64_t v24 = MSUserNotificationCenterTopicFavoriteMailboxes;
    uint64_t v22 = MSUserNotificationCenterTopicRemindMe;
    uint64_t v23 = MSUserNotificationCenterTopicNotifiedThreads;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v8);
        v10 = [v9 objectForKeyedSubscript:v6];
        v11 = v10;
        if (v10)
        {
          if ([v10 isEqualToString:v7])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_VIPS" value:&stru_2CC10 table:@"Main"];
            goto LABEL_19;
          }
          if ([v11 isEqualToString:v26])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_HIGHLIGHTS" value:&stru_2CC10 table:@"Main"];
            goto LABEL_19;
          }
          if ([v11 isEqualToString:v25])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_PRIMARY" value:&stru_2CC10 table:@"Main"];
            goto LABEL_19;
          }
          if ([v11 isEqualToString:v24])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_FAVORITE_MAILBOXES" value:&stru_2CC10 table:@"Main"];
            goto LABEL_19;
          }
          if ([v11 isEqualToString:v23])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_NOTIFY_THREADS" value:&stru_2CC10 table:@"Main"];
            goto LABEL_19;
          }
          if ([v11 isEqualToString:v22])
          {
            v12 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@"ALERTS_FROM_REMIND_ME" value:&stru_2CC10 table:@"Main"];
LABEL_19:
            v14 = (void *)v13;

            if (v14)
            {
LABEL_20:
              uint64_t v15 = objc_opt_class();
              id v16 = _ConfigurePSSpecifier(v27, (uint64_t)v14, (uint64_t)self, (uint64_t)"_setShowAlertsFrom:withSpecifier:", (uint64_t)"_showAlertsFrom:", 0, 0, v15, 2, 0, v9, 0, 0);
            }
          }
          else
          {
            v14 = [v21 objectForKeyedSubscript:v11];
            if (v14) {
              goto LABEL_20;
            }
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v4 != v8);
      id v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v4 = v17;
    }
    while (v17);
  }

  objc_storeStrong((id *)&self->_subsectionSpecifiers, v27);
  v18 = +[PSSpecifier groupSpecifierWithID:@"Mail-Notification-Group-Specidier"];
  [v27 insertObject:v18 atIndex:0];

  return v27;
}

- (unint64_t)accountCellBadgeCount
{
  return [(MFNanoAccountsSettingsDataSource *)self->_mailAccountsDatasource numberOfAccountsRequiringAttention];
}

- (id)applicationGroupSpecifiers
{
  unsigned int v3 = +[NSMutableArray array];
  if ([(MFNanoBridgeSettingsListController *)self _needsSetUp])
  {
    id v4 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"SET_UP_NOTE" value:&stru_2CC10 table:@"Main"];
    [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

    [v3 addObject:v4];
    uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"SET_UP_MAIL" value:&stru_2CC10 table:@"Main"];
    v9 = _ConfigurePSSpecifier(v3, (uint64_t)v8, (uint64_t)self, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0);

    [v9 setButtonAction:"_setUpMail"];
  }
  else if (![(MFNanoBridgeSettingsListController *)self settingsMode])
  {
    if ([(MFNanoBridgeSettingsListController *)self pairedDeviceSupportsStandaloneService])
    {
      v10 = [(MFNanoBridgeSettingsListController *)self sectionInfo];
      v11 = [v10 objectForKeyedSubscript:BPSNanoBulletinShowsAlerts];
      -[NMCUICloudNotificationAccountDataSource setShowsAlerts:](self->_cloudNotificationDatasource, "setShowsAlerts:", [v11 BOOLValue]);

      v12 = [(MFNanoBridgeSettingsListController *)self sectionInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:BPSNanoBulletinSubsections];
      [(NMCUICloudNotificationAccountDataSource *)self->_cloudNotificationDatasource setNotificationSubsections:v13];

      v14 = [(MFNanoBridgeSettingsListController *)self specifierController];
      uint64_t v15 = [v14 specifiers];
      [v3 addObjectsFromArray:v15];

      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      id v17 = [v16 localizedStringForKey:@"APP_SETTINGS_SECTION" value:&stru_2CC10 table:@"Main"];
      v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v3 addObject:v18];

      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"ACCOUNTS_SCREEN_TITLE" value:&stru_2CC10 table:@"Main"];
      v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v21 setCellType:2];
      [v21 setProperty:objc_opt_class() forKey:PSCellClassKey];
      uint64_t v22 = +[NSNumber numberWithUnsignedInteger:[(MFNanoBridgeSettingsListController *)self accountCellBadgeCount]];
      [v21 setProperty:v22 forKey:PSBadgeNumberKey];

      mailAccountsDatasource = self->_mailAccountsDatasource;
      v55[0] = @"MFNanoSettingsAccountDataSourceKey";
      v55[1] = @"MFNanoSettingsCloudNotificationDataSourceKey";
      cloudNotificationDatasource = self->_cloudNotificationDatasource;
      v56[0] = mailAccountsDatasource;
      v56[1] = cloudNotificationDatasource;
      uint64_t v25 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
      [v21 setUserInfo:v25];

      [v3 addObject:v21];
    }
    else
    {
      uint64_t v26 = +[NSBundle bundleForClass:objc_opt_class()];
      id v27 = [v26 localizedStringForKey:@"APP_SETTINGS_SECTION" value:&stru_2CC10 table:@"Main"];
      v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:0 set:0 get:0 detail:0 cell:0 edit:0];
      [v3 addObject:v28];
    }
    long long v29 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v30 = [v29 localizedStringForKey:@"INCLUDE_MAIL" value:&stru_2CC10 table:@"Main"];
    uint64_t v31 = objc_opt_class();
    id v32 = _ConfigurePSSpecifier(v3, (uint64_t)v30, (uint64_t)self, (uint64_t)"_setIncludeMail:withSpecifier:", (uint64_t)"_includeMail:", 0, 0, v31, 2, 0, 0, 0, 0);

    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"MESSAGE_PREVIEW" value:&stru_2CC10 table:@"Main"];
    uint64_t v35 = objc_opt_class();
    v36 = [(MFNanoBridgeSettingsListController *)self _linesOfPreviewTitlesDictionary];
    v37 = [(MFNanoBridgeSettingsListController *)self _linesOfPreviewValues];
    id v38 = _ConfigurePSSpecifier(v3, (uint64_t)v34, (uint64_t)self, (uint64_t)"_setLinesOfPreview:withSpecifier:", (uint64_t)"_linesOfPreview:", 0, 0, v35, 2, 0, v36, 0, v37);

    v39 = +[MFNanoBridgeSettingsManager sharedInstance];
    LODWORD(v34) = [v39 privacyProtectionEnabled];

    if (v34)
    {
      v40 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v40 localizedStringForKey:@"ALWAYS_LOAD_CONTENT_DIRECTLY" value:&stru_2CC10 table:@"Main"];
      id v42 = _ConfigurePSSpecifier(v3, (uint64_t)v41, (uint64_t)self, (uint64_t)"_setAlwaysLoadContentDirectly:withSpecifier:", (uint64_t)"_alwaysLoadContentDirectly:", 0, 0, 0, 6, 0, 0, 0, 0);
    }
    v43 = +[NRPairedDeviceRegistry sharedInstance];
    v44 = [v43 getActivePairedDevice];
    int HasCapabilityForString = BPSDeviceHasCapabilityForString();

    if (HasCapabilityForString)
    {
      v46 = +[NSBundle bundleForClass:objc_opt_class()];
      v47 = [v46 localizedStringForKey:@"DEFAULT_REPLIES" value:&stru_2CC10 table:@"Main"];
      uint64_t v48 = objc_opt_class();
      id v49 = _ConfigurePSSpecifier(v3, (uint64_t)v47, (uint64_t)self, 0, 0, 0, 0, v48, 2, 0, 0, 0, 0);

      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"SIGNATURE" value:&stru_2CC10 table:@"Main"];
      uint64_t v52 = objc_opt_class();
      id v53 = _ConfigurePSSpecifier(v3, (uint64_t)v51, (uint64_t)self, (uint64_t)"_setSignature:withSpecifier:", (uint64_t)"_signature:", 0, 0, v52, 2, 0, 0, 0, 0);
    }
  }

  return v3;
}

- (id)mirroredApplicationGroupSpecifiers
{
  if ([(MFNanoBridgeSettingsListController *)self settingsMode])
  {
    unsigned int v3 = &__NSArray0__struct;
  }
  else
  {
    unsigned int v3 = +[NSMutableArray array];
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"ASK_BEFORE_DELETING" value:&stru_2CC10 table:@"Main"];
    id v6 = _ConfigurePSSpecifier(v3, (uint64_t)v5, (uint64_t)self, (uint64_t)"_setAskBeforeDeleting:withSpecifier:", (uint64_t)"_askBeforeDeleting:", 0, 0, 0, 6, 0, 0, 0, 0);

    if ([(MFNanoBridgeSettingsListController *)self pairedDeviceSupportsStandaloneService])
    {
      uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"LOAD_REMOTE_IMAGES" value:&stru_2CC10 table:@"Main"];
      id v9 = _ConfigurePSSpecifier(v3, (uint64_t)v8, (uint64_t)self, (uint64_t)"_setLoadRemoteImages:withSpecifier:", (uint64_t)"_loadRemoteImages:", 0, 0, 0, 6, 0, 0, 0, 0);
    }
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"ORGANIZE_BY_THREAD" value:&stru_2CC10 table:@"Main"];
    id v12 = _ConfigurePSSpecifier(v3, (uint64_t)v11, (uint64_t)self, (uint64_t)"_setOrganizeByThread:withSpecifier:", (uint64_t)"_organizeByThread:", 0, 0, 0, 6, 0, 0, 0, 0);
  }

  return v3;
}

- (void)mirrorSettingsChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 notifyMirrorSettingsFromCompanionChanged];

  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 3;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_subsectionSpecifiers;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = BPSNanoBulletinSubsectionId;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v11), "userInfo", (void)v16);
        uint64_t v13 = [v12 objectForKeyedSubscript:v10];

        v14 = +[TLToneManager sharedToneManager];
        [v14 _setCurrentToneWatchAlertPolicy:v6 forAlertType:5 topic:v13];

        uint64_t v15 = +[TLVibrationManager sharedVibrationManager];
        [v15 _setCurrentVibrationWatchAlertPolicy:v6 forAlertType:5 topic:v13];

        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)localizedMirroringDetailFooter
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"MIRRORING_DETAIL_BULLET_FORMAT" value:&stru_2CC10 table:@"Main"];

  if ([(MFNanoBridgeSettingsListController *)self showAlerts])
  {
    uint64_t v5 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForNotificationSources];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = &stru_2CC10;
  }
  if ([(MFNanoBridgeSettingsListController *)self settingsMode])
  {
    uint64_t v7 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForAlerts];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v7);
    uint64_t v9 = +[NSString stringWithFormat:@"%@%@", v8, v6];
  }
  else
  {
    uint64_t v7 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForAlerts];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v7);
    long long v18 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForAskBeforeDeleting];
    long long v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v18);
    long long v16 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForLoadRemoteImages];
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v16);
    v14 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailStringForOrganizeByThread];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v14);
    v11 = [(MFNanoBridgeSettingsListController *)self _mirroringDetailPrivacyProtection];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v11);
    uint64_t v9 = +[NSString stringWithFormat:@"%@%@%@%@%@%@", v8, v6, v17, v15, v10, v12];
  }

  return v9;
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"APP_NAME" value:&stru_2CC10 table:@"Main"];

  return v3;
}

- (BOOL)caresAboutSubsections
{
  return 1;
}

- (void)willBecomeActive
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsListController;
  [(MFNanoBridgeSettingsListController *)&v5 willBecomeActive];
  BOOL v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v3 reloadCachedAccounts];

  v4.receiver = self;
  v4.super_class = (Class)MFNanoBridgeSettingsListController;
  [(MFNanoBridgeSettingsListController *)&v4 reloadSpecifiers];
}

- (id)_linesOfPreviewValues
{
  return &off_2E110;
}

- (id)_linesOfPreviewTitlesDictionary
{
  id v18 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = +[NSLocale autoupdatingCurrentLocale];
  [v18 setLocale:v2];

  [v18 setNumberStyle:1];
  uint64_t v15 = [(MFNanoBridgeSettingsListController *)self _linesOfPreviewValues];
  long long v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v15;
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v7 = +[NSString stringWithFormat:@"%@_LINES", v6];
        id v8 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v9 = [v8 localizedStringForKey:v7 value:&stru_2CC10 table:@"Main"];
        uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 intValue]);
        v11 = [v18 stringFromNumber:v10];
        id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);

        [v17 addObject:v12];
      }
      id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }

  uint64_t v13 = +[NSMutableDictionary dictionaryWithObject:v17 forKey:@"titles"];

  return v13;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (id)_mirroringDetailStringForAlerts
{
  unsigned int v2 = [(MFNanoBridgeSettingsListController *)self showAlerts];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_FLAG_STYLE_SHOW_ALERTS" value:&stru_2CC10 table:@"Main"];
  }
  else {
  objc_super v5 = [v3 localizedStringForKey:@"MIRRORING_DETAIL_FLAG_STYLE_DONT_SHOW_ALERTS" value:&stru_2CC10 table:@"Main"];
  }

  return v5;
}

- (id)_mirroringDetailStringForNotificationSources
{
  unsigned int v2 = [(MFNanoBridgeSettingsListController *)self sectionInfo];
  id v3 = [v2 objectForKeyedSubscript:BPSNanoBulletinSubsections];

  v59 = [(MFNanoBridgeSettingsListController *)self _accountNamesKeyedByAccountId];
  v60 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (!v4)
  {
    char v66 = 0;
    char v55 = 0;
    char v53 = 0;
    char v64 = 0;
    char v62 = 0;
    char v58 = 0;
    char v9 = 1;
    goto LABEL_28;
  }
  char v66 = 0;
  char v55 = 0;
  char v53 = 0;
  char v64 = 0;
  char v62 = 0;
  char v58 = 0;
  uint64_t v5 = *(void *)v78;
  uint64_t v6 = BPSNanoBulletinShowsAlerts;
  uint64_t v7 = BPSNanoBulletinSubsectionId;
  uint64_t v8 = MSUserNotificationCenterTopicVIP;
  uint64_t v65 = MSUserNotificationCenterTopicFavoriteMailboxes;
  uint64_t v63 = MSUserNotificationCenterTopicNotifiedThreads;
  uint64_t v61 = MSUserNotificationCenterTopicRemindMe;
  uint64_t v57 = MSUserNotificationCenterTopicHighlights;
  char v9 = 1;
  uint64_t v54 = MSUserNotificationCenterTopicPrimary;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v78 != v5) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v10);
      id v12 = [v11 objectForKeyedSubscript:v6];
      unsigned int v13 = [v12 BOOLValue];

      v14 = [v11 objectForKeyedSubscript:v7];
      uint64_t v15 = v14;
      if (!v13)
      {
        char v9 = 0;
        goto LABEL_21;
      }
      if ([v14 isEqualToString:v8])
      {
        char v66 = 1;
LABEL_20:
        ++v82[3];
        goto LABEL_21;
      }
      if ([v15 isEqualToString:v65])
      {
        char v64 = 1;
        goto LABEL_20;
      }
      if ([v15 isEqualToString:v63])
      {
        char v62 = 1;
        goto LABEL_20;
      }
      if ([v15 isEqualToString:v61])
      {
        char v58 = 1;
        goto LABEL_20;
      }
      if ([v15 isEqualToString:v57])
      {
        char v55 = 1;
        goto LABEL_20;
      }
      if ([v15 isEqualToString:v54])
      {
        char v53 = 1;
        goto LABEL_20;
      }
      long long v16 = [v59 objectForKeyedSubscript:v15];

      if (v16) {
        [v60 addObject:v15];
      }
LABEL_21:

      uint64_t v10 = (char *)v10 + 1;
    }
    while (v4 != v10);
    id v17 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    id v4 = v17;
  }
  while (v17);
LABEL_28:

  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  char v76 = 1;
  id v18 = +[NSMutableString string];
  if (v9)
  {
    *((unsigned char *)v74 + 24) = 0;
    long long v19 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v20 = [v19 localizedStringForKey:@"ALERTS_FROM_EVERYONE" value:&stru_2CC10 table:@"Main"];

    long long v21 = [v20 lowercaseString];
    [v18 appendString:v21];
  }
  else
  {
    unint64_t v22 = 0;
    long long v23 = (char *)[v60 count] + (v64 & 1) + (v66 & 1) + (unint64_t)(v58 & 1) + (v62 & 1);
    uint64_t v24 = v23 - 2;
    uint64_t v25 = v23 - 1;
    while (v22 < (unint64_t)[v60 count])
    {
      uint64_t v26 = [v60 objectAtIndexedSubscript:v22];
      uint64_t v27 = [v59 objectForKeyedSubscript:v26];
      v28 = (void *)v27;
      if (v27) {
        CFStringRef v29 = (const __CFString *)v27;
      }
      else {
        CFStringRef v29 = &stru_2CC10;
      }
      [v18 appendString:v29];

      if (v25 != (char *)v22)
      {
        *((unsigned char *)v74 + 24) = 0;
        long long v30 = +[NSBundle bundleForClass:objc_opt_class()];
        if (v24 == (char *)v22) {
          [v30 localizedStringForKey:@"ALERTS_LAST_SEPARATOR" value:&stru_2CC10 table:@"Main"];
        }
        else {
        uint64_t v31 = [v30 localizedStringForKey:@"ALERTS_SEPARATOR" value:&stru_2CC10 table:@"Main"];
        }
        [v18 appendString:v31];
      }
      ++v22;
    }
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_F5B4;
    v68[3] = &unk_2C950;
    v71 = &v81;
    v72 = &v73;
    id v32 = v18;
    id v69 = v32;
    v70 = self;
    v33 = objc_retainBlock(v68);
    if (v66)
    {
      v34 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v35 = [v34 localizedStringForKey:@"ALERTS_FROM_VIPS" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v35];

      ((void (*)(void *))v33[2])(v33);
    }
    if (v55)
    {
      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"ALERTS_FROM_HIGHLIGHTS" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v37];

      ((void (*)(void *))v33[2])(v33);
    }
    if (v53)
    {
      id v38 = +[NSBundle bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"ALERTS_FROM_PRIMARY" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v39];

      ((void (*)(void *))v33[2])(v33);
    }
    if (v64)
    {
      v40 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v40 localizedStringForKey:@"ALERTS_FROM_FAVORITE_MAILBOXES" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v41];

      ((void (*)(void *))v33[2])(v33);
    }
    if (v62)
    {
      id v42 = +[NSBundle bundleForClass:objc_opt_class()];
      v43 = [v42 localizedStringForKey:@"ALERTS_FROM_NOTIFY_THREADS" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v43];

      ((void (*)(void *))v33[2])(v33);
    }
    if (v58)
    {
      v44 = +[NSBundle bundleForClass:objc_opt_class()];
      v45 = [v44 localizedStringForKey:@"ALERTS_FROM_REMIND_ME" value:&stru_2CC10 table:@"Main"];
      [v32 appendString:v45];

      ((void (*)(void *))v33[2])(v33);
    }
    if (![v32 length])
    {
      *((unsigned char *)v74 + 24) = 0;
      v46 = +[NSBundle bundleForClass:objc_opt_class()];
      v47 = [v46 localizedStringForKey:@"ALERTS_FROM_NO_ONE" value:&stru_2CC10 table:@"Main"];

      uint64_t v48 = [v47 lowercaseString];
      [v32 appendString:v48];
    }
    long long v20 = v69;
  }

  if (*((unsigned char *)v74 + 24))
  {
    id v49 = +[NSBundle bundleForClass:objc_opt_class()];
    [v49 localizedStringForKey:@"MIRRORING_DETAIL_FLAG_STYLE_SHOW_ALERTS_FROM_SINGLE" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    id v49 = +[NSBundle bundleForClass:objc_opt_class()];
    [v49 localizedStringForKey:@"MIRRORING_DETAIL_FLAG_STYLE_SHOW_ALERTS_FROM" value:&stru_2CC10 table:@"Main"];
  v50 = };

  v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v18);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v81, 8);

  return v51;
}

- (id)_mirroringDetailStringForAskBeforeDeleting
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  if ([v2 askBeforeDeleting])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_ASK_BEFORE_DELETING" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_DONT_ASK_BEFORE_DELETING" value:&stru_2CC10 table:@"Main"];
  id v4 = };

  return v4;
}

- (id)_mirroringDetailStringForLoadRemoteImages
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  if ([v2 loadRemoteImages])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_LOAD_REMOTE_IMAGES" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_DONT_LOAD_REMOTE_IMAGES" value:&stru_2CC10 table:@"Main"];
  id v4 = };

  return v4;
}

- (id)_mirroringDetailStringForOrganizeByThread
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  if ([v2 organizeByThread])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_ORGANIZE_BY_THREADS" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_DONT_ORGANIZE_BY_THREADS" value:&stru_2CC10 table:@"Main"];
  id v4 = };

  return v4;
}

- (id)_mirroringDetailPrivacyProtection
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  if ([v2 privacyProtectionEnabled])
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_PRIVACY_PROTECTION" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [v3 localizedStringForKey:@"MIRRORING_DETAIL_NO_PRIVACY_PROTECTION" value:&stru_2CC10 table:@"Main"];
  id v4 = };

  return v4;
}

- (id)_showAlertsFrom:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:BPSNanoBulletinShowsAlerts];
  if ([v4 BOOLValue])
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"ALERTS_FROM_ON" value:&stru_2CC10 table:@"Main"];
  }
  else
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"ALERTS_FROM_OFF" value:&stru_2CC10 table:@"Main"];
  uint64_t v6 = };

  return v6;
}

- (id)_includeMail:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = [v3 includeMailMailboxes];

  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"NUMBER_OF_MAILBOXES_SELECTED %lu" value:&stru_2CC10 table:@"Main"];
    uint64_t v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v4 count]);
LABEL_3:

    goto LABEL_13;
  }
  if ([v4 count] == (char *)&dword_0 + 1)
  {
    uint64_t v5 = [v4 firstObject];
    uint64_t v8 = +[MFNanoBridgeSettingsManager sharedInstance];
    char v9 = [v8 activeAccounts];
    if ((unint64_t)[v9 count] < 2)
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v6 = v5;
        [v6 invalidateCachedData];
        if ([v6 type] == (char *)&dword_4 + 3)
        {
          v11 = [v6 accountUniqueIdentifier];
          id v12 = +[MailAccount accountWithUniqueId:v11];
          uint64_t v7 = [v12 displayName];
        }
        else
        {
          uint64_t v7 = [v6 displayName];
        }
        uint64_t v5 = v6;
        goto LABEL_3;
      }
    }
    uint64_t v13 = [v5 displayName];
  }
  else
  {
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v5 localizedStringForKey:@"NO_MAILBOX_SELECTED" value:&stru_2CC10 table:@"Main"];
  }
  uint64_t v7 = (void *)v13;
LABEL_13:

  return v7;
}

- (void)_setLinesOfPreview:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  signed int v4 = [v6 intValue];
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setLinesOfPreview:v4];
}

- (id)_linesOfPreview:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  signed int v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 linesOfPreview]);
  uint64_t v5 = [v4 stringValue];

  return v5;
}

- (void)_setAskBeforeDeleting:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v4 = [v6 BOOLValue];
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setAskBeforeDeleting:v4];
}

- (id)_askBeforeDeleting:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 askBeforeDeleting]);

  return v4;
}

- (void)_setAlwaysLoadContentDirectly:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v4 = [v6 BOOLValue];
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setAlwaysLoadContentDirectly:v4];
}

- (id)_alwaysLoadContentDirectly:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 alwaysLoadContentDirectly]);

  return v4;
}

- (void)_setLoadRemoteImages:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v4 = [v6 BOOLValue];
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setLoadRemoteImages:v4];
}

- (id)_loadRemoteImages:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 loadRemoteImages]);

  return v4;
}

- (void)_setOrganizeByThread:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v4 = [v6 BOOLValue];
  uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v5 setOrganizeByThread:v4];
}

- (id)_organizeByThread:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 organizeByThread]);

  return v4;
}

- (void)_setSignature:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 setHtmlSignature:v5];
}

- (id)_signature:(id)a3
{
  id v3 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v4 = [v3 signature];

  return v4;
}

- (id)_accountNamesKeyedByAccountId
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v3 = [v2 activeAccounts];

  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "displayName", (void)v13);
        v11 = [v9 uniqueID];
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_needsSetUp
{
  unsigned int v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v3 = [v2 activeAccounts];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (void)_setUpMail
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v2 = +[MFPreferencesURL addAccountURL];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (MFNanoAccountsSettingsDataSource)mailAccountsDatasource
{
  return self->_mailAccountsDatasource;
}

- (void)setMailAccountsDatasource:(id)a3
{
}

- (NMCUICloudNotificationAccountDataSource)cloudNotificationDatasource
{
  return self->_cloudNotificationDatasource;
}

- (void)setCloudNotificationDatasource:(id)a3
{
}

- (NMCUISpecifierController)specifierController
{
  return self->_specifierController;
}

- (void)setSpecifierController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierController, 0);
  objc_storeStrong((id *)&self->_cloudNotificationDatasource, 0);
  objc_storeStrong((id *)&self->_mailAccountsDatasource, 0);

  objc_storeStrong((id *)&self->_subsectionSpecifiers, 0);
}

@end