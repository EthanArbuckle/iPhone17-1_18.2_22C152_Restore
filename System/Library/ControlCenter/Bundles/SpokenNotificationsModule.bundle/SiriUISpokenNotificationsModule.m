@interface SiriUISpokenNotificationsModule
- (BOOL)_canShowWhileLocked;
- (BOOL)_isEligibleForAnnounceNotificationsWithVendorID:(unsigned int)a3 productID:(unsigned int)a4;
- (BOOL)isDeviceInEligibleAnnounceNotificationsConfiguration;
- (SiriUISpokenNotificationsModule)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_createMenuItems;
- (void)_fetchAnnounceSettingsAndRefreshState;
- (void)_muteSpokenMessages;
- (void)_refreshState;
- (void)_refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4;
- (void)_turnOffSpokenMessagesForTheDay;
- (void)_turnOnSpokenMessages;
- (void)_updateMenuItems;
- (void)_updateMenuItemsWithDate:(id)a3;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation SiriUISpokenNotificationsModule

- (SiriUISpokenNotificationsModule)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SiriUISpokenNotificationsModule;
  v4 = [(CCUIMenuModuleViewController *)&v11 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(CCUIMenuModuleViewController *)v4 setIndentation:2];
    if ([(CCUIButtonModuleViewController *)v5 isExpanded]) {
      [(SiriUISpokenNotificationsModule *)v5 _updateMenuItems];
    }
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.siri.SpokenNotificationsModuleQueue", 0);
    spokenNotificationsModuleQueue = v5->_spokenNotificationsModuleQueue;
    v5->_spokenNotificationsModuleQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v5->_spokenNotificationsModuleQueue];
    settingsGateway = v5->_settingsGateway;
    v5->_settingsGateway = (BBSettingsGateway *)v8;
  }
  return v5;
}

- (void)_updateMenuItems
{
  if (!self->_menuItems) {
    [(SiriUISpokenNotificationsModule *)self _createMenuItems];
  }
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  dispatch_queue_t v6 = sub_2406A695C;
  v7 = &unk_2650CF138;
  objc_copyWeak(&v8, &location);
  [v3 getSpokenNotificationTemporarilyDisabledEndDateWithCompletion:&v4];

  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", self->_menuItems, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateMenuItemsWithDate:(id)a3
{
  id v19 = a3;
  [(SiriUISpokenNotificationsModule *)self _createMenuItems];
  if (v19)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    int v6 = [v4 isDate:v19 inSameDayAsDate:v5];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F08790]);
      [v7 setDateStyle:0];
      [v7 setTimeStyle:1];
      id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v9 = [v8 component:32 fromDate:v19];

      if (v9 % 12 == 1) {
        v10 = @"SPOKEN_NOTIFICATIONS_MUTED_UNTIL_TIME_SUBTEXT_SINGULAR";
      }
      else {
        v10 = @"SPOKEN_NOTIFICATIONS_MUTED_UNTIL_TIME_SUBTEXT_PLURAL";
      }
      objc_super v11 = NSString;
      v12 = (void *)MEMORY[0x263F086E0];
      v13 = v10;
      v14 = [v12 bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:v13 value:&stru_26F4D0AC0 table:0];

      v16 = [v7 stringFromDate:v19];
      v17 = objc_msgSend(v11, "stringWithFormat:", v15, v16);

      [(CCUIMenuModuleItem *)self->_menuItemMute setSelected:1];
      [(CCUIMenuModuleItem *)self->_menuItemMute setSubtitle:v17];

      goto LABEL_10;
    }
    uint64_t v18 = 1304;
  }
  else
  {
    uint64_t v18 = 1288;
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + v18) setSelected:1];
LABEL_10:
  [(CCUIMenuModuleViewController *)self setMenuItems:self->_menuItems];
}

- (void)_createMenuItems
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  menuItems = self->_menuItems;
  self->_menuItems = v3;

  objc_initWeak(location, self);
  id v5 = objc_alloc(MEMORY[0x263F33CC0]);
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ON" value:&stru_26F4D0AC0 table:0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2406A7008;
  v24[3] = &unk_2650CF160;
  objc_copyWeak(&v25, location);
  id v8 = (CCUIMenuModuleItem *)[v5 initWithTitle:v7 identifier:@"SPOKEN_NOTIFICATIONS_ON" handler:v24];
  menuItemOn = self->_menuItemOn;
  self->_menuItemOn = v8;

  id v10 = objc_alloc(MEMORY[0x263F33CC0]);
  objc_super v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_MUTE" value:&stru_26F4D0AC0 table:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2406A704C;
  v22[3] = &unk_2650CF160;
  objc_copyWeak(&v23, location);
  v13 = (CCUIMenuModuleItem *)[v10 initWithTitle:v12 identifier:@"SPOKEN_NOTIFICATIONS_MUTE" handler:v22];
  menuItemMute = self->_menuItemMute;
  self->_menuItemMute = v13;

  id v15 = objc_alloc(MEMORY[0x263F33CC0]);
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_OFF" value:&stru_26F4D0AC0 table:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2406A7090;
  v20[3] = &unk_2650CF160;
  objc_copyWeak(&v21, location);
  uint64_t v18 = (CCUIMenuModuleItem *)[v15 initWithTitle:v17 identifier:@"SPOKEN_NOTIFICATIONS_OFF" handler:v20];
  menuItemOffForTheDay = self->_menuItemOffForTheDay;
  self->_menuItemOffForTheDay = v18;

  [(NSMutableArray *)self->_menuItems addObject:self->_menuItemOn];
  [(NSMutableArray *)self->_menuItems addObject:self->_menuItemMute];
  [(NSMutableArray *)self->_menuItems addObject:self->_menuItemOffForTheDay];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
}

- (void)_turnOnSpokenMessages
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[SiriUISpokenNotificationsModule _turnOnSpokenMessages]";
    _os_log_impl(&dword_2406A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Turning on Spoken Messages", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x263F285A0] sharedPreferences];
  [v4 setSpokenNotificationTemporarilyDisabledUntil:0];

  contentModuleContext = self->_contentModuleContext;
  int v6 = (void *)MEMORY[0x263F33CD8];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ON_STATUS_UPDATE" value:&stru_26F4D0AC0 table:0];
  uint64_t v9 = [v6 statusUpdateWithMessage:v8 type:0];
  [(CCUIContentModuleContext *)contentModuleContext enqueueStatusUpdate:v9];
}

- (void)_muteSpokenMessages
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[SiriUISpokenNotificationsModule _muteSpokenMessages]";
    _os_log_impl(&dword_2406A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Muting Spoken Messages for an hour", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:3600.0];
  id v5 = [MEMORY[0x263F285A0] sharedPreferences];
  [v5 setSpokenNotificationTemporarilyDisabledUntil:v4];

  contentModuleContext = self->_contentModuleContext;
  id v7 = (void *)MEMORY[0x263F33CD8];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_MUTE_STATUS_UPDATE" value:&stru_26F4D0AC0 table:0];
  int v10 = [v7 statusUpdateWithMessage:v9 type:0];
  [(CCUIContentModuleContext *)contentModuleContext enqueueStatusUpdate:v10];
}

- (void)_turnOffSpokenMessagesForTheDay
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[SiriUISpokenNotificationsModule _turnOffSpokenMessagesForTheDay]";
    _os_log_impl(&dword_2406A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Muting SpokenMessages until tomorrow", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v6 = [v5 startOfDayForDate:v4];

  id v7 = [MEMORY[0x263F285A0] sharedPreferences];
  [v7 setSpokenNotificationTemporarilyDisabledUntil:v6];

  contentModuleContext = self->_contentModuleContext;
  uint64_t v9 = (void *)MEMORY[0x263F33CD8];
  int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_OFF_STATUS_UPDATE" value:&stru_26F4D0AC0 table:0];
  uint64_t v12 = [v9 statusUpdateWithMessage:v11 type:0];
  [(CCUIContentModuleContext *)contentModuleContext enqueueStatusUpdate:v12];
}

- (BOOL)_isEligibleForAnnounceNotificationsWithVendorID:(unsigned int)a3 productID:(unsigned int)a4
{
  if (a3 != 76) {
    return 0;
  }
  if (((0x409Bu >> (a4 - 2)) & 1) != 0 && a4 - 8194 <= 0xE || a4 == 8209 || a4 == 8230) {
    return 0;
  }
  else {
    return (a4 - 8194 < 0x25) & (0x1C7BB7FF9BuLL >> (a4 - 2));
  }
}

- (BOOL)isDeviceInEligibleAnnounceNotificationsConfiguration
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F2B998] sharedInstance];
  int v4 = [v3 available];

  if (!v4)
  {
    uint64_t v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[SiriUISpokenNotificationsModule isDeviceInEligibleAnnounceNotificationsConfiguration]";
      _os_log_impl(&dword_2406A5000, v12, OS_LOG_TYPE_DEFAULT, "%s BT is not available, falling back to assume an eligible device is connected", buf, 0xCu);
    }
LABEL_15:
    if (self->_headphonesAnnounceEnabled) {
      return 1;
    }
    goto LABEL_18;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(MEMORY[0x263F2B998], "sharedInstance", 0);
  int v6 = [v5 connectedDevices];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (!v7)
  {

    goto LABEL_18;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v6);
      }
      if (-[SiriUISpokenNotificationsModule _isEligibleForAnnounceNotificationsWithVendorID:productID:](self, "_isEligibleForAnnounceNotificationsWithVendorID:productID:", [*(id *)(*((void *)&v14 + 1) + 8 * i) vendorId], objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "productId")))
      {
        char v9 = 1;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  }
  while (v8);

  if (v9) {
    goto LABEL_15;
  }
LABEL_18:
  if (self->_hearingAidsAnnounceEnabled) {
    return 1;
  }
  return self->_builtInSpeakerAnnounceEnabled;
}

- (void)_refreshState
{
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2406A785C;
  v4[3] = &unk_2650CF1B0;
  v4[4] = self;
  [v3 getSpokenNotificationTemporarilyDisabledStatusWithCompletion:v4];
}

- (void)_fetchAnnounceSettingsAndRefreshState
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 announceNotificationsOnHearingAidsSupported];

  id v5 = [MEMORY[0x263F285A0] sharedPreferences];
  int v6 = [v5 announceNotificationsOnHearingAidsEnabled];

  self->_BOOL headphonesAnnounceEnabled = [(BBSettingsGateway *)self->_settingsGateway effectiveGlobalAnnounceHeadphonesSetting] != 0;
  self->_hearingAidsAnnounceEnabled = v4 & v6;
  uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_BOOL builtInSpeakerAnnounceEnabled = [v7 announceNotificationsOnBuiltInSpeakerEnabled];

  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL headphonesAnnounceEnabled = self->_headphonesAnnounceEnabled;
    BOOL builtInSpeakerAnnounceEnabled = self->_builtInSpeakerAnnounceEnabled;
    int v11 = 136316162;
    uint64_t v12 = "-[SiriUISpokenNotificationsModule _fetchAnnounceSettingsAndRefreshState]";
    __int16 v13 = 1024;
    BOOL v14 = headphonesAnnounceEnabled;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = builtInSpeakerAnnounceEnabled;
    _os_log_impl(&dword_2406A5000, v8, OS_LOG_TYPE_DEFAULT, "%s fetched announce settings: headphones:%d, hearing aids supported: %d, hearing aids enabled: %d, builtin speaker: %d", (uint8_t *)&v11, 0x24u);
  }
  [(SiriUISpokenNotificationsModule *)self _refreshState];
}

- (void)_refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2406A7BA4;
  v4[3] = &unk_2650CF1D8;
  BOOL v5 = a4;
  v4[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v4];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SiriUISpokenNotificationsModule *)self isDeviceInEligibleAnnounceNotificationsConfiguration])
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [MEMORY[0x263F285A0] sharedPreferences];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_2406A7DCC;
    v14[3] = &unk_2650CF200;
    objc_copyWeak(&v15, &location);
    [v8 getSpokenNotificationTemporarilyDisabledStatusWithCompletion:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    contentModuleContext = self->_contentModuleContext;
    uint64_t v10 = (void *)MEMORY[0x263F33CD8];
    int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_REQUIRES_H1_STATUS_UPDATE" value:&stru_26F4D0AC0 table:0];
    __int16 v13 = [v10 statusUpdateWithMessage:v12 type:0];
    [(CCUIContentModuleContext *)contentModuleContext enqueueStatusUpdate:v13];
  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    self->_selectedOnExpansion = [(CCUIButtonModuleViewController *)self isSelected];
    [(SiriUISpokenNotificationsModule *)self _refreshStateWithSelected:0 expanded:1];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2406A7F30;
    v6[3] = &unk_2650CF228;
    v6[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v6];
  }
  else
  {
    [(SiriUISpokenNotificationsModule *)self _refreshStateWithSelected:self->_selectedOnExpansion expanded:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SiriUISpokenNotificationsModule;
  [(CCUIMenuModuleViewController *)&v5 willTransitionToExpandedContentMode:v3];
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUISpokenNotificationsModule;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v5, sel_didTransitionToExpandedContentMode_);
  if (!a3) {
    [(SiriUISpokenNotificationsModule *)self _refreshState];
  }
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SiriUISpokenNotificationsModule;
  [(CCUIMenuModuleViewController *)&v6 setContentModuleContext:v5];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUISpokenNotificationsModule;
  [(CCUIMenuModuleViewController *)&v8 viewDidLoad];
  BOOL v3 = (void *)MEMORY[0x263F33C68];
  int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v3 descriptionForPackageNamed:@"AnnounceNotifications" inBundle:v4];

  [(CCUIMenuModuleViewController *)self setGlyphPackageDescription:v5];
  objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_TITLE" value:&stru_26F4D0AC0 table:0];
  [(CCUIMenuModuleViewController *)self setTitle:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUISpokenNotificationsModule;
  [(CCUIMenuModuleViewController *)&v8 viewWillAppear:a3];
  objc_initWeak(&location, self);
  spokenNotificationsModuleQueue = self->_spokenNotificationsModuleQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2406A81C4;
  v5[3] = &unk_2650CF250;
  objc_copyWeak(&v6, &location);
  dispatch_async(spokenNotificationsModuleQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenNotificationsModuleQueue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_menuItemOffForTheDay, 0);
  objc_storeStrong((id *)&self->_menuItemMute, 0);
  objc_storeStrong((id *)&self->_menuItemOn, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end