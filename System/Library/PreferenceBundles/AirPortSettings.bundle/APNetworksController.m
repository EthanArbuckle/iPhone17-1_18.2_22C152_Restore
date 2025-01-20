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

- (void)loadView
{
  v28.receiver = self;
  v28.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v28 loadView];
  self->_viewLoaded = 1;
  v3 = (WFAirportViewController *)objc_alloc_init(MEMORY[0x263F86360]);
  settingsViewController = self->_settingsViewController;
  self->_settingsViewController = v3;
  v5 = v3;

  v6 = WFWiFiTitleString();
  [(APNetworksController *)self setTitle:v6];

  v7 = (WFNetworkListController *)[objc_alloc(MEMORY[0x263F86350]) initWithViewController:v5];
  airportController = self->_airportController;
  self->_airportController = v7;

  [(APNetworksController *)self addChildViewController:v5];
  v9 = [(APNetworksController *)self view];
  v10 = [(WFAirportViewController *)v5 view];
  [v9 addSubview:v10];

  v11 = [(APNetworksController *)self view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(WFAirportViewController *)v5 view];

  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  [(APNetworksController *)self _loadHealthOverrides];
  v21 = [(APNetworksController *)self healthOverrides];

  if (v21)
  {
    v22 = [(APNetworksController *)self healthOverrides];
    v23 = [(APNetworksController *)self airportController];
    [v23 setHealthRecommendationOverrides:v22];
  }
  else
  {
    v22 = [(APNetworksController *)self airportController];
    [v22 setHealthRecommendationOverrides:0];
  }

  if (self->_pushDataUsage)
  {
    v24 = [(APNetworksController *)self airportController];
    [v24 pushDataUsageViewController];

    self->_pushDataUsage = 0;
  }
  v25 = [(APNetworksController *)self deferredURL];

  if (v25)
  {
    v26 = [(APNetworksController *)self airportController];
    v27 = [(APNetworksController *)self deferredURL];
    [v26 handleURL:v27];

    [(APNetworksController *)self setDeferredURL:0];
  }
}

- (WFNetworkListController)airportController
{
  return self->_airportController;
}

- (WFHealthIssueOverrides)healthOverrides
{
  return self->_healthOverrides;
}

- (NSURL)deferredURL
{
  return self->_deferredURL;
}

- (void)_loadHealthOverrides
{
  id v3 = objc_alloc_init(MEMORY[0x263F86348]);
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

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v5 viewWillDisappear:a3];
  v4 = [(APNetworksController *)self airportController];
  [v4 stopScanning];

  [(APNetworksController *)self _notifyAirPortSettingsVisible:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APNetworksController;
  -[APNetworksController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  objc_super v5 = [(APNetworksController *)self airportController];
  int v6 = [v5 viewController];
  [v6 viewDidDisappear:v3];
}

- (APNetworksController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)APNetworksController;
  v4 = [(APNetworksController *)&v8 initWithNibName:0 bundle:0];
  if (v4)
  {
    objc_super v5 = WFWiFiTitleString();
    [(APNetworksController *)v4 setTitle:v5];

    int v6 = [(APNetworksController *)v4 navigationItem];
    [v6 setLargeTitleDisplayMode:2];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v5 viewDidAppear:a3];
  v4 = [(APNetworksController *)self airportController];
  [v4 startScanning];

  [(APNetworksController *)self _notifyAirPortSettingsVisible:1];
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
  [(APNetworksController *)self _notifyAirPortSettingsVisible:1];
  v3.receiver = self;
  v3.super_class = (Class)APNetworksController;
  [(APNetworksController *)&v3 willBecomeActive];
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  id v15 = [v4 objectForKey:@"path"];
  objc_super v5 = [v4 objectForKey:@"root"];

  if ([v15 length])
  {
    if ([v15 isEqualToString:@"WIRELESS_APP_DATA_USAGE_ID"])
    {
      self->_pushDataUsage = 1;
      if (self->_viewLoaded)
      {
        int v6 = [(APNetworksController *)self airportController];
        [v6 pushDataUsageViewController];

        self->_pushDataUsage = 0;
      }
    }
    else if (v5)
    {
      objc_super v7 = [v5 lowercaseString];
      int v8 = [v7 isEqualToString:@"wifi"];

      if (v8)
      {
        int v9 = [@"prefs:root=WIFI&path=" stringByAppendingString:v15];
        int v10 = [NSURL URLWithString:v9];
        int v11 = v10;
        if (self->_viewLoaded)
        {
          deferredURL = [(APNetworksController *)self airportController];
          CFStringRef v13 = [NSURL URLWithString:v9];
          [deferredURL handleURL:v13];
        }
        else
        {
          uint64_t v14 = v10;
          deferredURL = self->_deferredURL;
          self->_deferredURL = v14;
        }
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
  int v4 = _notifyAirPortSettingsVisible__token;
  if (_notifyAirPortSettingsVisible__token != -1
    || (notify_register_check("com.apple.airportsettingsvisible", &_notifyAirPortSettingsVisible__token),
        int v4 = _notifyAirPortSettingsVisible__token,
        _notifyAirPortSettingsVisible__token != -1))
  {
    notify_set_state(v4, v3);
    notify_post("com.apple.airportsettingsvisible");
  }
}

- (void)setHealthOverrides:(id)a3
{
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