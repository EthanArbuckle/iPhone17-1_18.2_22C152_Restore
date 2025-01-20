@interface ACSettingsSwitchUIController
+ (id)snippetViewController;
- (ACSettingsSwitchUIController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)_waitingOnSettingState;
- (BOOL)removedAfterDialogProgresses;
- (Class)headerViewClass;
- (double)desiredHeightForWidth:(double)a3;
- (id)sashItem;
- (void)_bluetoothAvailabilityChanged:(id)a3;
- (void)_setSettingFromExternalChangeIfNeeded;
- (void)_setSettingFromSwitchTapIfNeeded;
- (void)_setSettingIfNeeded:(BOOL)a3;
- (void)_settingChangedExternally:(id)a3;
- (void)_switchTapped:(id)a3;
- (void)_wiFiStateChangedWithOldState:(int64_t)a3 newState:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)setSnippet:(id)a3;
- (void)settingChangedExternally:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ACSettingsSwitchUIController

+ (id)snippetViewController
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (ACSettingsSwitchUIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACSettingsSwitchUIController;
  id v2 = [(ACSettingsSwitchUIController *)&v5 init];
  if (v2)
  {
    v3 = ACSettingsLocalizedString(@"SETTINGS_TITLE");
    [(ACSettingsSwitchUIController *)v2 setTitle:v3];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACSettingsSwitchUIController;
  [(ACSettingsSwitchUIController *)&v4 dealloc];
}

- (void)setSnippet:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_snippet, a3);
  v6 = [(SASettingBoolSnippet *)self->_snippet settingKeys];
  [(ACSettingsBasicSetting *)self->_setting setDelegate:0];
  v7 = [v6 objectAtIndex:0];
  v8 = +[ACSettingsBasicSetting settingWithAceString:v7];
  setting = self->_setting;
  self->_setting = v8;

  [(ACSettingsBasicSetting *)self->_setting setDelegate:self];
  self->_shouldSetSettingDueToFirstAppearance = [(ACSettingsSwitchUIController *)self isVirgin];
  if ([(ACSettingsSwitchSetting *)self->_setting isBluetooth])
  {
    v10 = +[BluetoothManager sharedInstance];
    [v10 available];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_bluetoothAvailabilityChanged:" name:BluetoothAvailabilityChangedNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"_settingChangedExternally:" name:BluetoothPowerChangedNotification object:0];
  }
  if ([(ACSettingsSwitchSetting *)self->_setting isLowPowerMode])
  {
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"_settingChangedExternally:" name:NSProcessInfoPowerStateDidChangeNotification object:0];
  }
  if ([(ACSettingsSwitchSetting *)self->_setting isWiFi] && !self->_wiFiStateMonitor)
  {
    objc_initWeak(&location, self);
    id v14 = objc_alloc((Class)WFWiFiStateMonitor);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1AA8;
    v17[3] = &unk_8400;
    objc_copyWeak(&v18, &location);
    v15 = (WFWiFiStateMonitor *)[v14 initWithClient:0 handler:v17];
    wiFiStateMonitor = self->_wiFiStateMonitor;
    self->_wiFiStateMonitor = v15;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  objc_super v4 = [(ACSettingsSwitchUIController *)self view];
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (void)loadView
{
  v3 = -[ACSettingsSwitchView initWithFrame:]([ACSettingsSwitchView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  settingView = self->_settingView;
  self->_settingView = v3;

  [(ACSettingsSwitchUIController *)self setView:self->_settingView];
  -[ACSettingsSwitchUIController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  double v5 = [(ACSettingsSwitchView *)self->_settingView title];
  double v6 = [(ACSettingsBasicSetting *)self->_setting name];
  [v5 setText:v6];

  v7 = self->_settingView;
  v8 = [(ACSettingsBasicSetting *)self->_setting icon];
  [(ACSettingsSwitchView *)v7 setIcon:v8];

  v9 = [(ACSettingsSwitchView *)self->_settingView switchControl];
  objc_msgSend(v9, "setOn:", -[ACSettingsSwitchSetting enabled](self->_setting, "enabled"));

  id v10 = [(ACSettingsSwitchView *)self->_settingView switchControl];
  [v10 addTarget:self action:"_switchTapped:" forControlEvents:4096];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsSwitchUIController;
  -[ACSettingsSwitchUIController viewWillAppear:](&v6, "viewWillAppear:");
  double v5 = [(ACSettingsSwitchView *)self->_settingView switchControl];
  objc_msgSend(v5, "setOn:animated:", -[ACSettingsSwitchSetting enabled](self->_setting, "enabled"), v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ACSettingsSwitchUIController;
  -[ACSettingsSwitchUIController viewDidAppear:](&v5, "viewDidAppear:");
  [(ACSettingsSwitchUIController *)self _setSettingIfNeeded:v3];
  [(WFWiFiStateMonitor *)self->_wiFiStateMonitor startMonitoring];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACSettingsSwitchUIController;
  [(ACSettingsSwitchUIController *)&v4 viewWillDisappear:a3];
  [(WFWiFiStateMonitor *)self->_wiFiStateMonitor stopMonitoring];
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (Class)headerViewClass
{
  return 0;
}

- (id)sashItem
{
  return [(ACSettingsBasicSetting *)self->_setting sashItem];
}

- (void)_setSettingIfNeeded:(BOOL)a3
{
  if (!self->_shouldSetSettingDueToFirstAppearance) {
    return;
  }
  BOOL v3 = a3;
  if ([(ACSettingsSwitchUIController *)self _waitingOnSettingState]) {
    return;
  }
  id v10 = [(SASettingBoolSnippet *)self->_snippet value];
  unsigned int v5 = [(SASettingBoolSnippet *)self->_snippet toggle];
  if (v10)
  {
    p_setting = &self->_setting;
    setting = self->_setting;
    id v8 = [v10 BOOLValue];
LABEL_8:
    [(ACSettingsSwitchSetting *)setting setEnabled:v8];
    v9 = [(ACSettingsSwitchView *)self->_settingView switchControl];
    objc_msgSend(v9, "setOn:animated:", -[ACSettingsSwitchSetting enabled](*p_setting, "enabled"), v3);

    goto LABEL_9;
  }
  if (v5)
  {
    p_setting = &self->_setting;
    setting = self->_setting;
    id v8 = (id)([(ACSettingsSwitchSetting *)setting enabled] ^ 1);
    goto LABEL_8;
  }
LABEL_9:
  self->_shouldSetSettingDueToFirstAppearance = 0;

  _objc_release_x1();
}

- (void)_setSettingFromSwitchTapIfNeeded
{
  if (self->_shouldSetSettingDueToTap
    && ![(ACSettingsSwitchUIController *)self _waitingOnSettingState])
  {
    BOOL v3 = [(ACSettingsSwitchView *)self->_settingView switchControl];
    id v4 = [v3 isOn];

    [(ACSettingsSwitchSetting *)self->_setting setEnabled:v4];
    unsigned int v5 = [(ACSettingsSwitchView *)self->_settingView switchControl];
    [v5 setUserInteractionEnabled:1];

    self->_shouldSetSettingDueToTap = 0;
  }
}

- (void)_setSettingFromExternalChangeIfNeeded
{
  if (self->_shouldSetSettingDueToExternalChange
    && ![(ACSettingsSwitchUIController *)self _waitingOnSettingState])
  {
    BOOL v3 = [(ACSettingsSwitchView *)self->_settingView switchControl];
    objc_msgSend(v3, "setOn:animated:", -[ACSettingsSwitchSetting enabled](self->_setting, "enabled"), 1);

    self->_shouldSetSettingDueToExternalChange = 0;
  }
}

- (void)_settingChangedExternally:(id)a3
{
}

- (BOOL)_waitingOnSettingState
{
  if ([(ACSettingsSwitchSetting *)self->_setting isBluetooth])
  {
    id v2 = +[BluetoothManager sharedInstance];
    unsigned int v3 = [v2 available] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_bluetoothAvailabilityChanged:(id)a3
{
  id v4 = [a3 object];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    [(ACSettingsSwitchUIController *)self _setSettingIfNeeded:1];
    [(ACSettingsSwitchUIController *)self _setSettingFromSwitchTapIfNeeded];
    [(ACSettingsSwitchUIController *)self _setSettingFromExternalChangeIfNeeded];
  }
}

- (void)_wiFiStateChangedWithOldState:(int64_t)a3 newState:(int64_t)a4
{
  unsigned int v6 = [(ACSettingsSwitchSetting *)self->_setting isWiFi];
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (v6)
    {
      unsigned int v7 = [(ACSettingsSwitchSetting *)self->_setting enabled];
      id v8 = [(ACSettingsSwitchView *)self->_settingView switchControl];
      unsigned int v9 = [v8 isOn];

      if (v7 != v9)
      {
        [(ACSettingsSwitchUIController *)self _settingChangedExternally:0];
      }
    }
  }
}

- (void)_switchTapped:(id)a3
{
  self->_shouldSetSettingDueToTap = 1;
  id v4 = [(ACSettingsSwitchView *)self->_settingView switchControl];
  [v4 setUserInteractionEnabled:0];

  [(ACSettingsSwitchUIController *)self _setSettingFromSwitchTapIfNeeded];
}

- (void)settingChangedExternally:(id)a3
{
  if (self->_setting == a3) {
    [(ACSettingsSwitchUIController *)self _settingChangedExternally:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wiFiStateMonitor, 0);
  objc_storeStrong((id *)&self->_settingView, 0);
  objc_storeStrong((id *)&self->_setting, 0);

  objc_storeStrong((id *)&self->_snippet, 0);
}

@end