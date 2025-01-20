@interface APNetworksController
- (APNetworksController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSURL)deferredURL;
- (WFAirportViewController)settingsViewController;
- (WFHealthIssueOverrides)healthOverrides;
- (WFNetworkListController)airportController;
- (void)_loadHealthOverrides;
- (void)_notifyAirPortSettingsVisible:(BOOL)a3;
- (void)didWake;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)setAirportController:(id)a3;
- (void)setDeferredURL:(id)a3;
- (void)setHealthOverrides:(id)a3;
- (void)setSettingsViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation APNetworksController

- (APNetworksController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)APNetworksController;
  v4 = [(APNetworksController *)&v8 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    [(APNetworksController *)v4 setTitle:&stru_4148];
    v6 = [(APNetworksController *)v5 navigationItem];
    [v6 setLargeTitleDisplayMode:2];
  }
  return v5;
}

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v27 loadView];
  self->_viewLoaded = 1;
  v3 = (WFAirportViewController *)objc_alloc_init((Class)WFAirportViewController);
  settingsViewController = self->_settingsViewController;
  self->_settingsViewController = v3;
  v5 = v3;

  [(APNetworksController *)self setTitle:&stru_4148];
  v6 = (WFNetworkListController *)[objc_alloc((Class)WFNetworkListController) initWithViewController:v5];
  airportController = self->_airportController;
  self->_airportController = v6;

  [(APNetworksController *)self addChildViewController:v5];
  objc_super v8 = [(APNetworksController *)self view];
  v9 = [(WFAirportViewController *)v5 view];
  [v8 addSubview:v9];

  v10 = [(APNetworksController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(WFAirportViewController *)v5 view];

  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
  [(APNetworksController *)self _loadHealthOverrides];
  v20 = [(APNetworksController *)self healthOverrides];

  if (v20)
  {
    v21 = [(APNetworksController *)self healthOverrides];
    v22 = [(APNetworksController *)self airportController];
    [v22 setHealthRecommendationOverrides:v21];
  }
  else
  {
    v21 = [(APNetworksController *)self airportController];
    [v21 setHealthRecommendationOverrides:0];
  }

  if (self->_pushDataUsage)
  {
    v23 = [(APNetworksController *)self airportController];
    [v23 pushDataUsageViewController];

    self->_pushDataUsage = 0;
  }
  v24 = [(APNetworksController *)self deferredURL];

  if (v24)
  {
    v25 = [(APNetworksController *)self airportController];
    v26 = [(APNetworksController *)self deferredURL];
    [v25 handleURL:v26];

    [(APNetworksController *)self setDeferredURL:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v14 viewDidAppear:a3];
  v4 = WFLogForCategory();
  os_log_type_t v5 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315138;
    double v16 = "-[APNetworksController viewDidAppear:]";
    _os_log_impl(&dword_0, v4, v5, "%s: APNetworksController view did appear, start scanning", buf, 0xCu);
  }

  v6 = [(APNetworksController *)self airportController];
  [v6 startScanning];

  [(APNetworksController *)self _notifyAirPortSettingsVisible:1];
  v7 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.WiFi"];
  id v8 = objc_alloc((Class)_NSLocalizedStringResource);
  v9 = WFWiFiTitleString();
  v10 = +[NSLocale currentLocale];
  double v11 = +[NSBundle bundleForClass:objc_opt_class()];
  double v12 = [v11 bundleURL];
  id v13 = [v8 initWithKey:v9 table:0 locale:v10 bundleURL:v12];

  if (objc_opt_respondsToSelector()) {
    [(APNetworksController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.wifi" title:v13 localizedNavigationComponents:&__NSArray0__struct deepLink:v7];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APNetworksController;
  -[APNetworksController viewDidDisappear:](&v7, "viewDidDisappear:");
  os_log_type_t v5 = [(APNetworksController *)self airportController];
  v6 = [v5 viewController];
  [v6 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v7 viewWillDisappear:a3];
  v4 = WFLogForCategory();
  os_log_type_t v5 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[APNetworksController viewWillDisappear:]";
    _os_log_impl(&dword_0, v4, v5, "%s: APNetworksController view will disappear, stop scanning", buf, 0xCu);
  }

  v6 = [(APNetworksController *)self airportController];
  [v6 stopScanning];

  [(APNetworksController *)self _notifyAirPortSettingsVisible:0];
}

- (void)willResignActive
{
  [(APNetworksController *)self _notifyAirPortSettingsVisible:0];
  v3.receiver = self;
  v3.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v3 willResignActive];
}

- (void)willBecomeActive
{
  objc_super v3 = WFLogForCategory();
  os_log_type_t v4 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v7 = "-[APNetworksController willBecomeActive]";
    _os_log_impl(&dword_0, v3, v4, "%s: APNetworksController view will become active", buf, 0xCu);
  }

  [(APNetworksController *)self _notifyAirPortSettingsVisible:1];
  v5.receiver = self;
  v5.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v5 willBecomeActive];
}

- (void)handleURL:(id)a3
{
  os_log_type_t v4 = [a3 objectForKey:@"path"];
  objc_super v5 = WFLogForCategory();
  os_log_type_t v6 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v18 = 136315394;
    v19 = "-[APNetworksController handleURL:]";
    __int16 v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_0, v5, v6, "%s: path param %@", (uint8_t *)&v18, 0x16u);
  }

  if ([v4 length])
  {
    if ([v4 isEqualToString:@"WIRELESS_APP_DATA_USAGE_ID"])
    {
      self->_pushDataUsage = 1;
      if (self->_viewLoaded)
      {
        objc_super v7 = [(APNetworksController *)self airportController];
        [v7 pushDataUsageViewController];

        self->_pushDataUsage = 0;
      }
    }
    else
    {
      id v8 = [@"prefs:root=WIFI&path=" stringByAppendingString:v4];
      v9 = +[NSURL URLWithString:v8];
      BOOL viewLoaded = self->_viewLoaded;
      double v11 = WFLogForCategory();
      os_log_type_t v12 = OSLogForWFLogLevel();
      if (WFCurrentLogLevel()) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      int v14 = !v13;
      if (viewLoaded)
      {
        if (v14 && os_log_type_enabled(v11, v12))
        {
          int v18 = 136315394;
          v19 = "-[APNetworksController handleURL:]";
          __int16 v20 = 2112;
          v21 = v4;
          _os_log_impl(&dword_0, v11, v12, "%s: sending the URL to ap controller %@", (uint8_t *)&v18, 0x16u);
        }

        deferredURL = [(APNetworksController *)self airportController];
        double v16 = +[NSURL URLWithString:v8];
        [deferredURL handleURL:v16];
      }
      else
      {
        if (v14 && os_log_type_enabled(v11, v12))
        {
          int v18 = 136315394;
          v19 = "-[APNetworksController handleURL:]";
          __int16 v20 = 2112;
          v21 = v4;
          _os_log_impl(&dword_0, v11, v12, "%s: deferring URl %@", (uint8_t *)&v18, 0x16u);
        }

        double v17 = v9;
        deferredURL = self->_deferredURL;
        self->_deferredURL = v17;
      }
    }
  }
}

- (void)didWake
{
}

- (void)_notifyAirPortSettingsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_type_t v4 = WFLogForCategory();
  os_log_type_t v5 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    id v8 = "-[APNetworksController _notifyAirPortSettingsVisible:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_0, v4, v5, "%s: air port settings visible: %d", (uint8_t *)&v7, 0x12u);
  }

  int v6 = dword_83D8;
  if (dword_83D8 != -1
    || (notify_register_check("com.apple.airportsettingsvisible", &dword_83D8), int v6 = dword_83D8, dword_83D8 != -1))
  {
    notify_set_state(v6, v3);
    notify_post("com.apple.airportsettingsvisible");
  }
}

- (void)_loadHealthOverrides
{
  id v3 = objc_alloc_init((Class)WFHealthIssueOverrides);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideNoInternet", @"com.apple.settings.airport", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (!v5) {
    [v3 setNoInternetConnection:1];
  }
  Boolean v22 = 0;
  int v7 = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideHiddenNetwork", @"com.apple.settings.airport", &v22);
  if (v22 && v7) {
    [v3 setHiddenNetwork:1];
  }
  Boolean v21 = 0;
  int v8 = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideLegacyPHY", @"com.apple.settings.airport", &v21);
  if (v21 && v8)
  {
    int v6 = 1;
    [v3 setLegacyPHY:1];
  }
  Boolean v20 = 0;
  int v9 = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideCommonSSID", @"com.apple.settings.airport", &v20);
  if (v20 && v9)
  {
    int v6 = 1;
    [v3 setCommonSSID:1];
  }
  Boolean v19 = 0;
  int v10 = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideDNSFiltered", @"com.apple.settings.airport", &v19);
  if (v19 && v10)
  {
    int v6 = 1;
    [v3 setDnsFiltered:1];
  }
  Boolean v18 = 0;
  int v11 = CFPreferencesGetAppBooleanValue(@"kWiFiHealthOverrideCarrierNetwork", @"com.apple.settings.airport", &v18);
  if (v18 && v11)
  {
    int v6 = 1;
    [v3 setCarrierNetwork:1];
  }
  CFStringRef v12 = (const __CFString *)CFPreferencesCopyAppValue(@"kWiFiHealthOverrideSecurityType", @"com.apple.settings.airport");
  if (v12)
  {
    CFStringRef v13 = v12;
    uint64_t v14 = 1;
    if (CFStringCompare(v12, @"kWiFiHealthOverrideOpenSecurity", 1uLL))
    {
      if (CFStringCompare(v13, @"kWiFiHealthOverrideWEPSecurity", 1uLL))
      {
        if (CFStringCompare(v13, @"kWiFiHealthOverrideWPASecurity", 1uLL))
        {
LABEL_31:
          CFRelease(v13);
          goto LABEL_32;
        }
        uint64_t v14 = 3;
      }
      else
      {
        uint64_t v14 = 2;
      }
    }
    [v3 setSecurityOverride:v14];
    int v6 = 1;
    goto LABEL_31;
  }
LABEL_32:
  CFStringRef v15 = (const __CFString *)CFPreferencesCopyAppValue(@"kWiFiHealthOverridePrivateMACDisabled", @"com.apple.settings.airport");
  if (v15)
  {
    CFStringRef v16 = v15;
    uint64_t v17 = 1;
    if (CFStringCompare(v15, @"kWiFiHealthOverridePrivateMACDisabledBySystem", 1uLL))
    {
      if (CFStringCompare(v16, @"kWiFiHealthOverridePrivateMACDisabledByCarrier", 1uLL))
      {
        if (CFStringCompare(v16, @"kWiFiHealthOverridePrivateMACDisabledByProfile", 1uLL))
        {
          CFRelease(v16);
          if ((v6 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }
        uint64_t v17 = 3;
      }
      else
      {
        uint64_t v17 = 2;
      }
    }
    [v3 setPrivateAddressOverride:v17];
    CFRelease(v16);
  }
  else if (!v6)
  {
    goto LABEL_44;
  }
LABEL_43:
  objc_storeStrong((id *)&self->_healthOverrides, v3);
LABEL_44:
}

- (WFHealthIssueOverrides)healthOverrides
{
  return self->_healthOverrides;
}

- (void)setHealthOverrides:(id)a3
{
}

- (WFNetworkListController)airportController
{
  return self->_airportController;
}

- (void)setAirportController:(id)a3
{
}

- (WFAirportViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (NSURL)deferredURL
{
  return self->_deferredURL;
}

- (void)setDeferredURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredURL, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_airportController, 0);

  objc_storeStrong((id *)&self->_healthOverrides, 0);
}

@end