@interface CARSiriPanel
- (BOOL)appleIntelligenceEnabled;
- (BOOL)autoSendMessagesSpecifierVisible;
- (CARSettingsSwitchCellSpecifier)autoSendMessagesSpecifier;
- (CARSettingsSwitchCellSpecifier)showAppsBehindSiriSpecifier;
- (CARSiriPanel)initWithPanelController:(id)a3;
- (CRSSiriPreferences)siriPreferences;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)invalidate;
- (void)preferences:(id)a3 autoSendInCarPlayEnabledChanged:(BOOL)a4;
- (void)preferences:(id)a3 autoSendInHeadphonesEnabledChanged:(BOOL)a4;
- (void)preferences:(id)a3 mainAutoSendEnabledChanged:(BOOL)a4;
- (void)preferences:(id)a3 showAppsBehindSiriInCarPlayEnabledChanged:(BOOL)a4;
- (void)setAppleIntelligenceEnabled:(BOOL)a3;
- (void)setAutoSendMessagesSpecifierVisible:(BOOL)a3;
@end

@implementation CARSiriPanel

- (CARSiriPanel)initWithPanelController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CARSiriPanel;
  v3 = [(CARSettingsPanel *)&v7 initWithPanelController:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CARSettingsPanel *)v3 panelController];
    [v5 addSiriPreferencesObserver:v4];
  }
  return v4;
}

- (id)specifierSections
{
  v3 = +[NSMutableArray arrayWithCapacity:3];
  v4 = [CARSettingsCellSpecifierSection alloc];
  v5 = objc_alloc_init(CARDashboardSuggestionsSpecifier);
  v29 = v5;
  v6 = +[NSArray arrayWithObjects:&v29 count:1];
  objc_super v7 = [(CARSettingsCellSpecifierSection *)v4 initWithSpecifiers:v6];

  [v3 addObject:v7];
  if (_os_feature_enabled_impl())
  {
    v8 = [CARSettingsCellSpecifierSection alloc];
    v9 = [(CARSiriPanel *)self siriPreferences];
    if ([v9 autoSendInCarPlayEnabled]) {
      v10 = @"AUTO_SEND_MESSAGES_ENABLED_FOOTER";
    }
    else {
      v10 = @"AUTO_SEND_MESSAGES_DISABLED_FOOTER";
    }
    v11 = sub_1000210C8(v10);
    v12 = [(CARSiriPanel *)self autoSendMessagesSpecifier];
    v28 = v12;
    v13 = +[NSArray arrayWithObjects:&v28 count:1];
    v14 = [(CARSettingsCellSpecifierSection *)v8 initWithFooter:v11 specifiers:v13];

    v15 = [(CARSiriPanel *)self autoSendMessagesSpecifier];
    v16 = [(CARSiriPanel *)self siriPreferences];
    v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 autoSendInCarPlayEnabled]);
    [v15 setCellValue:v17];

    [v3 addObject:v14];
  }
  if (_os_feature_enabled_impl())
  {
    v18 = [CARSettingsCellSpecifierSection alloc];
    v19 = sub_1000210C8(@"SHOW_APPS_BEHIND_SIRI_FOOTER");
    v20 = [(CARSiriPanel *)self showAppsBehindSiriSpecifier];
    v27 = v20;
    v21 = +[NSArray arrayWithObjects:&v27 count:1];
    v22 = [(CARSettingsCellSpecifierSection *)v18 initWithFooter:v19 specifiers:v21];

    v23 = [(CARSiriPanel *)self showAppsBehindSiriSpecifier];
    v24 = [(CARSiriPanel *)self siriPreferences];
    v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v24 showAppsBehindSiriInCarPlayEnabled]);
    [v23 setCellValue:v25];

    [v3 addObject:v22];
  }

  return v3;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    if (self->_appleIntelligenceEnabled) {
      v5 = @"AI_AND_SIRI_TITLE";
    }
    else {
      v5 = @"SIRI_AND_SUGGESTIONS_TITLE";
    }
    v6 = sub_1000210C8(v5);
    if (self->_appleIntelligenceEnabled) {
      +[CARSettingsImageCache appleIntelligenceImage];
    }
    else {
    objc_super v7 = +[CARSettingsImageCache siriImage];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001B410;
    v11[3] = &unk_100092008;
    objc_copyWeak(&v12, &location);
    v8 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v6 image:v7 accessoryType:1 actionBlock:v11];
    v9 = self->_cellSpecifier;
    self->_cellSpecifier = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (CRSSiriPreferences)siriPreferences
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 siriPreferences];

  return (CRSSiriPreferences *)v3;
}

- (CARSettingsSwitchCellSpecifier)autoSendMessagesSpecifier
{
  autoSendMessagesSpecifier = self->_autoSendMessagesSpecifier;
  if (!autoSendMessagesSpecifier)
  {
    v4 = [CARSettingsSwitchCellSpecifier alloc];
    v5 = sub_1000210C8(@"AUTO_SEND_MESSAGES_TITLE");
    v6 = [(CARSettingsSwitchCellSpecifier *)v4 initWithTitle:v5 image:0];
    objc_super v7 = self->_autoSendMessagesSpecifier;
    self->_autoSendMessagesSpecifier = v6;

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001B5E8;
    v9[3] = &unk_100092008;
    objc_copyWeak(&v10, &location);
    [(CARSettingsCellSpecifier *)self->_autoSendMessagesSpecifier setActionBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    autoSendMessagesSpecifier = self->_autoSendMessagesSpecifier;
  }

  return autoSendMessagesSpecifier;
}

- (void)setAutoSendMessagesSpecifierVisible:(BOOL)a3
{
  if (self->_autoSendMessagesSpecifierVisible != a3)
  {
    self->_autoSendMessagesSpecifierVisible = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B774;
    block[3] = &unk_100091F38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (CARSettingsSwitchCellSpecifier)showAppsBehindSiriSpecifier
{
  showAppsBehindSiriSpecifier = self->_showAppsBehindSiriSpecifier;
  if (!showAppsBehindSiriSpecifier)
  {
    v4 = [CARSettingsSwitchCellSpecifier alloc];
    v5 = sub_1000210C8(@"SHOW_APPS_BEHIND_SIRI_TITLE");
    v6 = [(CARSettingsSwitchCellSpecifier *)v4 initWithTitle:v5 image:0];
    objc_super v7 = self->_showAppsBehindSiriSpecifier;
    self->_showAppsBehindSiriSpecifier = v6;

    [(CARSettingsCellSpecifier *)self->_showAppsBehindSiriSpecifier setActionBlock:&stru_100092530];
    showAppsBehindSiriSpecifier = self->_showAppsBehindSiriSpecifier;
  }

  return showAppsBehindSiriSpecifier;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)CARSiriPanel;
  [(CARSettingsPanel *)&v4 invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)preferences:(id)a3 autoSendInCarPlayEnabledChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B948;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preferences:(id)a3 mainAutoSendEnabledChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B9C4;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preferences:(id)a3 autoSendInHeadphonesEnabledChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BA40;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)preferences:(id)a3 showAppsBehindSiriInCarPlayEnabledChanged:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BABC;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)appleIntelligenceEnabled
{
  return self->_appleIntelligenceEnabled;
}

- (void)setAppleIntelligenceEnabled:(BOOL)a3
{
  self->_appleIntelligenceEnabled = a3;
}

- (BOOL)autoSendMessagesSpecifierVisible
{
  return self->_autoSendMessagesSpecifierVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAppsBehindSiriSpecifier, 0);
  objc_storeStrong((id *)&self->_autoSendMessagesSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end