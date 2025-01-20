@interface VPNBundleController
+ (BOOL)networkingIsDisabled;
+ (void)disableAirplaneMode;
- (BOOL)isDeviceManagement;
- (BOOL)isRegistered;
- (BOOL)isRootMenuItem;
- (BOOL)isToggleSwitchInRootMenu;
- (NSNumber)lastServiceCount;
- (PSConfirmationSpecifier)toggleVPNSpecifier;
- (PSSpecifier)contentFilterSpecifier;
- (PSSpecifier)dnsSpecifier;
- (PSSpecifier)linkVPNSpecifier;
- (PSSpecifier)passwordSetupSpecifier;
- (PSSpecifier)vpnSpecifier;
- (VPNBundleController)initWithParentListController:(id)a3 properties:(id)a4;
- (VPNConnectionStore)connectionStore;
- (id)contentFilterStatusForSpecifier:(id)a3;
- (id)getContentFilterSummary:(id)a3;
- (id)getDNSSummary:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (id)statusForSpecifier:(id)a3;
- (id)vpnActiveForSpecifier:(id)a3;
- (void)cancelAirplaneModeDisable:(id)a3;
- (void)confirmAirplaneModeDisable:(id)a3;
- (void)dealloc;
- (void)setConnectionStore:(id)a3;
- (void)setContentFilterSpecifier:(id)a3;
- (void)setDeviceManagement:(BOOL)a3;
- (void)setDnsSpecifier:(id)a3;
- (void)setLastServiceCount:(id)a3;
- (void)setLinkVPNSpecifier:(id)a3;
- (void)setPasswordSetupSpecifier:(id)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setRootMenuItem:(BOOL)a3;
- (void)setToggleSwitchInRootMenu:(BOOL)a3;
- (void)setToggleVPNSpecifier:(id)a3;
- (void)setVPNActive:(BOOL)a3;
- (void)setVPNActive:(id)a3 forSpecifier:(id)a4;
- (void)setVpnSpecifier:(id)a3;
- (void)updateVPNSwitchStatus;
- (void)vpnConfigurationChanged:(id)a3;
- (void)vpnStatusChanged:(id)a3;
@end

@implementation VPNBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v111[1] = *MEMORY[0x263EF8340];
  v109 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [(VPNBundleController *)self toggleVPNSpecifier];

  if (!v5)
  {
    v6 = (void *)MEMORY[0x263F5FB40];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"VPN" value:&stru_26E7C6230 table:@"MobileVPN"];
    v9 = [v6 preferenceSpecifierNamed:v8 target:self set:sel_setVPNActive_forSpecifier_ get:sel_vpnActiveForSpecifier_ detail:0 cell:6 edit:0];
    [(VPNBundleController *)self setToggleVPNSpecifier:v9];

    v10 = [(VPNBundleController *)self toggleVPNSpecifier];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"AIRPLANE_SHEET_CANCEL" value:&stru_26E7C6230 table:@"MobileVPN"];
    [v10 setCancelButton:v12];

    v13 = [(VPNBundleController *)self toggleVPNSpecifier];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"AIRPLANE_SHEET_OK_ABBREVIATED" value:&stru_26E7C6230 table:@"MobileVPN"];
    [v13 setOkButton:v15];

    v16 = [(VPNBundleController *)self toggleVPNSpecifier];
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"AIRPLANE_SHEET_OK" value:&stru_26E7C6230 table:@"MobileVPN"];
    [v16 setTitle:v18];

    v19 = [(VPNBundleController *)self toggleVPNSpecifier];
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"AIRPLANE_SHEET_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    [v19 setPrompt:v21];

    v22 = [(VPNBundleController *)self toggleVPNSpecifier];
    v23 = [NSNumber numberWithBool:1];
    [v22 setProperty:v23 forKey:*MEMORY[0x263F60000]];

    v24 = [(VPNBundleController *)self toggleVPNSpecifier];
    [v24 setConfirmationAction:sel_confirmAirplaneModeDisable_];

    v25 = [(VPNBundleController *)self toggleVPNSpecifier];
    [v25 setConfirmationCancelAction:sel_cancelAirplaneModeDisable_];

    v26 = [(VPNBundleController *)self toggleVPNSpecifier];
    [v26 setProperty:*MEMORY[0x263EFFB40] forKey:@"restoreState"];

    v27 = [(VPNBundleController *)self toggleVPNSpecifier];
    [v27 setProperty:@"VPN" forKey:*MEMORY[0x263F60138]];

    v28 = [(VPNBundleController *)self toggleVPNSpecifier];
    v29 = [MEMORY[0x263F5FAB0] settingsIconCache];
    v30 = [v29 imageForKey:*MEMORY[0x263F5FEA8]];
    [v28 setProperty:v30 forKey:*MEMORY[0x263F60140]];
  }
  v31 = [(VPNBundleController *)self linkVPNSpecifier];

  if (!v31)
  {
    v52 = (void *)MEMORY[0x263F5FC40];
    v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v54 = [v53 localizedStringForKey:@"VPN" value:&stru_26E7C6230 table:@"MobileVPN"];
    v55 = [v52 preferenceSpecifierNamed:v54 target:self set:0 get:sel_statusForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
    [(VPNBundleController *)self setLinkVPNSpecifier:v55];

    v56 = [(VPNBundleController *)self linkVPNSpecifier];
    [v56 setProperty:@"VPN" forKey:*MEMORY[0x263F60138]];

    if (![(VPNBundleController *)self isRootMenuItem]
      && ![(VPNBundleController *)self isDeviceManagement])
    {
      v57 = [(VPNBundleController *)self linkVPNSpecifier];
      v110 = @"vpn-show-dns";
      v111[0] = &unk_26E7CB940;
      v58 = [NSDictionary dictionaryWithObjects:v111 forKeys:&v110 count:1];
      [v57 setUserInfo:v58];
    }
    if ([(VPNBundleController *)self isRootMenuItem]
      || [(VPNBundleController *)self isDeviceManagement])
    {
      v59 = [(VPNBundleController *)self linkVPNSpecifier];
      v60 = [MEMORY[0x263F5FAB0] settingsIconCache];
      v61 = [v60 imageForKey:*MEMORY[0x263F5FEA8]];
      [v59 setProperty:v61 forKey:*MEMORY[0x263F60140]];

      v62 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v63 = [v62 userInterfaceIdiom];

      if ((v63 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v64 = [(VPNBundleController *)self toggleVPNSpecifier];
        v65 = [NSNumber numberWithBool:1];
        uint64_t v66 = *MEMORY[0x263F60130];
        [v64 setProperty:v65 forKey:*MEMORY[0x263F60130]];

        v67 = [(VPNBundleController *)self linkVPNSpecifier];
        v68 = [NSNumber numberWithBool:1];
        [v67 setProperty:v68 forKey:v66];
      }
    }
  }
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    v32 = [(VPNBundleController *)self dnsSpecifier];

    if (!v32)
    {
      v33 = (void *)MEMORY[0x263F5FC40];
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v35 = [v34 localizedStringForKey:@"DNS_SETTINGS" value:&stru_26E7C6230 table:@"MobileVPN"];
      v36 = [v33 preferenceSpecifierNamed:v35 target:self set:0 get:sel_getDNSSummary_ detail:objc_opt_class() cell:2 edit:0];
      [(VPNBundleController *)self setDnsSpecifier:v36];

      v37 = [(VPNBundleController *)self dnsSpecifier];
      [v37 setProperty:@"Ethernet" forKey:*MEMORY[0x263F5FF28]];

      v38 = [(VPNBundleController *)self dnsSpecifier];
      [v38 setupIconImageWithBundle:v109];
    }
  }
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    v39 = [(VPNBundleController *)self contentFilterSpecifier];

    if (!v39)
    {
      v40 = (void *)MEMORY[0x263F5FC40];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"CONTENT_FILTER" value:&stru_26E7C6230 table:@"MobileVPN"];
      v43 = [v40 preferenceSpecifierNamed:v42 target:self set:0 get:sel_contentFilterStatusForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [(VPNBundleController *)self setContentFilterSpecifier:v43];

      v44 = [(VPNBundleController *)self contentFilterSpecifier];
      [v44 setProperty:@"Ethernet" forKey:*MEMORY[0x263F5FF28]];

      v45 = [(VPNBundleController *)self contentFilterSpecifier];
      [v45 setupIconImageWithBundle:v109];
    }
  }
  v46 = +[VPNConnectionStore sharedInstance];
  if ([v46 gradePresent:8])
  {

LABEL_13:
    v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v50 = v49;
    v51 = @"VPN_AND_RELAYS";
    goto LABEL_22;
  }
  v47 = +[VPNConnectionStore sharedInstance];
  int v48 = [v47 gradePresent:7];

  if (v48) {
    goto LABEL_13;
  }
  v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v50 = v49;
  v51 = @"VPN";
LABEL_22:
  v69 = [v49 localizedStringForKey:v51 value:&stru_26E7C6230 table:@"MobileVPN"];
  v70 = [(VPNBundleController *)self linkVPNSpecifier];
  [v70 setName:v69];

  if ([(VPNBundleController *)self isRootMenuItem])
  {
    v71 = +[VPNConnectionStore sharedInstance];
    v72 = [v71 vpnServiceTotalCount];
    [(VPNBundleController *)self setLastServiceCount:v72];

    v73 = +[VPNConnectionStore sharedInstance];
    if (([v73 gradePresent:3] & 1) == 0)
    {
      v74 = +[VPNConnectionStore sharedInstance];
      if (([v74 gradePresent:2] & 1) == 0)
      {
        v75 = +[VPNConnectionStore sharedInstance];
        if (([v75 gradePresent:8] & 1) == 0)
        {
          v76 = +[VPNConnectionStore sharedInstance];
          if (([v76 gradePresent:7] & 1) == 0)
          {
            v77 = +[VPNConnectionStore sharedInstance];
            if (([v77 disableToggle] & 1) == 0)
            {
              v107 = [(VPNBundleController *)self lastServiceCount];
              int v108 = [v107 intValue];

              if (v108 == 1)
              {
                v103 = [(VPNBundleController *)self statusForSpecifier:0];
                v104 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v105 = [v104 localizedStringForKey:@"CONNECTION_FAILURE" value:&stru_26E7C6230 table:@"MobileVPN"];
                char v106 = [v103 isEqualToString:v105];

                if (v106) {
                  goto LABEL_35;
                }
                uint64_t v78 = 1;
                goto LABEL_34;
              }
LABEL_33:
              uint64_t v78 = 0;
LABEL_34:
              [(VPNBundleController *)self setToggleSwitchInRootMenu:v78];
              goto LABEL_35;
            }
          }
        }
      }
    }

    goto LABEL_33;
  }
LABEL_35:
  if ([(VPNBundleController *)self isRootMenuItem]
    && [(VPNBundleController *)self isToggleSwitchInRootMenu])
  {
    uint64_t v79 = [(VPNBundleController *)self toggleVPNSpecifier];
  }
  else
  {
    uint64_t v79 = [(VPNBundleController *)self linkVPNSpecifier];
  }
  v80 = (void *)v79;
  [(VPNBundleController *)self setVpnSpecifier:v79];

  v81 = [(VPNBundleController *)self lastServiceCount];
  if ([v81 intValue])
  {
  }
  else
  {
    BOOL v82 = [(VPNBundleController *)self isRootMenuItem];

    if (v82) {
      goto LABEL_43;
    }
  }
  v83 = [(VPNBundleController *)self vpnSpecifier];
  [v4 addObject:v83];

LABEL_43:
  if (![(VPNBundleController *)self isDeviceManagement]) {
    goto LABEL_58;
  }
  v84 = [(VPNBundleController *)self dnsSpecifier];
  if (v84)
  {
  }
  else
  {
    v85 = [(VPNBundleController *)self contentFilterSpecifier];

    if (!v85) {
      goto LABEL_58;
    }
  }
  v86 = +[VPNConnectionStore sharedInstance];
  int v87 = [v86 gradePresent:4];

  v88 = +[VPNConnectionStore sharedInstance];
  int v89 = [v88 gradePresent:5];

  v90 = +[VPNConnectionStore sharedInstance];
  int v91 = [v90 gradePresent:6];

  int v92 = v87 | v89;
  if (((v87 | v89) & 1) != 0 || v91)
  {
    v93 = (void *)MEMORY[0x263F5FC40];
    v94 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v95 = [v94 localizedStringForKey:@"PROXY_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v96 = [v93 groupSpecifierWithName:v95];
    [v4 addObject:v96];
  }
  v97 = [(VPNBundleController *)self dnsSpecifier];
  if (v97)
  {

    if (v92)
    {
      v98 = [(VPNBundleController *)self dnsSpecifier];
      [v4 addObject:v98];
    }
  }
  v99 = [(VPNBundleController *)self contentFilterSpecifier];
  if (v99) {
    int v100 = v91;
  }
  else {
    int v100 = 0;
  }

  if (v100 == 1)
  {
    v101 = [(VPNBundleController *)self contentFilterSpecifier];
    [v4 addObject:v101];
  }
LABEL_58:

  return v4;
}

- (BOOL)isRootMenuItem
{
  return self->_rootMenuItem;
}

- (NSNumber)lastServiceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDeviceManagement
{
  return self->_deviceManagement;
}

- (void)setVpnSpecifier:(id)a3
{
}

- (void)setToggleSwitchInRootMenu:(BOOL)a3
{
  self->_toggleSwitchInRootMenu = a3;
}

- (BOOL)isToggleSwitchInRootMenu
{
  return self->_toggleSwitchInRootMenu;
}

- (PSConfirmationSpecifier)toggleVPNSpecifier
{
  return (PSConfirmationSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkVPNSpecifier:(id)a3
{
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (VPNBundleController)initWithParentListController:(id)a3 properties:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VPNBundleController;
  id v5 = a4;
  v6 = [(VPNBundleController *)&v15 initWithParentListController:a3];
  if (v6)
  {
    v7 = +[VPNConnectionStore sharedInstance];

    if (!v7)
    {
      v8 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[VPNBundleController initWithParentListController:properties:](v8);
      }
    }
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel_vpnStatusChanged_ name:kNotificationVPNConnectionStatusChanged object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v6 selector:sel_vpnConfigurationChanged_ name:@"VPNNEConfigurationChangedNotification" object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v6 selector:sel_vpnStatusChanged_ name:@"VPNConnectionsChangedNotification" object:0];

    [(VPNBundleController *)v6 setRegistered:1];
  }
  v12 = objc_msgSend(v5, "objectForKeyedSubscript:", @"isTopLevel", v15.receiver, v15.super_class);
  -[VPNBundleController setRootMenuItem:](v6, "setRootMenuItem:", [v12 BOOLValue]);

  v13 = [v5 objectForKeyedSubscript:@"isDeviceManagement"];

  -[VPNBundleController setDeviceManagement:](v6, "setDeviceManagement:", [v13 BOOLValue]);
  return v6;
}

- (void)dealloc
{
  if ([(VPNBundleController *)self isRegistered])
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:@"VPNConnectionsChangedNotification" object:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)VPNBundleController;
  [(VPNBundleController *)&v6 dealloc];
}

- (void)setRootMenuItem:(BOOL)a3
{
  self->_rootMenuItem = a3;
}

- (void)setLastServiceCount:(id)a3
{
}

- (void)setToggleVPNSpecifier:(id)a3
{
}

+ (BOOL)networkingIsDisabled
{
  os_unfair_lock_lock((os_unfair_lock_t)&gRadioPrefsLock);
  v2 = (void *)gRadiosPrefs;
  if (!gRadiosPrefs)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F255D8]);
    v4 = (void *)gRadiosPrefs;
    gRadiosPrefs = (uint64_t)v3;

    v2 = (void *)gRadiosPrefs;
  }
  [v2 refresh];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&gRadioPrefsLock);
  id v5 = (const __SCPreferences *)gWifiPreferences;
  if (!gWifiPreferences)
  {
    id v5 = SCPreferencesCreate(0, @"com.apple.mobilevpn", @"com.apple.wifi.plist");
    gWifiPreferences = (uint64_t)v5;
  }
  SCPreferencesSynchronize(v5);
  unsigned int v6 = objc_msgSend((id)SCPreferencesGetValue((SCPreferencesRef)gWifiPreferences, @"AllowEnable"), "BOOLValue");
  NSLog(&cfstr_SAirplaneModeD.isa, "+[VPNBundleController networkingIsDisabled]", [(id)gRadiosPrefs airplaneMode], v6);
  LOBYTE(v6) = [(id)gRadiosPrefs airplaneMode] & (v6 ^ 1);
  os_unfair_lock_unlock((os_unfair_lock_t)&gRadioPrefsLock);
  return v6;
}

+ (void)disableAirplaneMode
{
  os_unfair_lock_lock((os_unfair_lock_t)&gRadioPrefsLock);
  id v2 = (id)gRadiosPrefs;
  os_unfair_lock_unlock((os_unfair_lock_t)&gRadioPrefsLock);
  [v2 setAirplaneMode:0];
}

- (id)vpnActiveForSpecifier:(id)a3
{
  id v3 = a3;
  v4 = +[VPNConnectionStore sharedInstance];
  uint64_t v5 = [v4 aggregateStatus];

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    unsigned int v6 = [NSNumber numberWithInt:1];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    if (v5 == 2) {
      v9 = @"VPN_CONNECTING";
    }
    else {
      v9 = @"VPN";
    }
  }
  else
  {
    unsigned int v6 = [NSNumber numberWithInt:0];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    v9 = @"VPN";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_26E7C6230 table:@"MobileVPN"];

  [v3 setName:v10];
  [v3 setProperty:v6 forKey:*MEMORY[0x263F60308]];

  return v6;
}

- (id)statusForSpecifier:(id)a3
{
  id v3 = +[VPNConnectionStore sharedInstance];
  v4 = [v3 aggregateStatusText];

  return v4;
}

- (void)setVPNActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[VPNConnectionStore sharedInstance];
  unsigned int v6 = +[VPNConnectionStore sharedInstance];
  v7 = objc_msgSend(v5, "currentConnectionWithGrade:", objc_msgSend(v6, "currentOnlyConnectionGrade"));

  v8 = [v7 serviceID];
  v9 = [v7 displayName];
  uint64_t v10 = [v7 vpnConnectionType];
  if (!v7) {
    goto LABEL_7;
  }
  if (!v3)
  {
    [v7 disconnect];
    goto LABEL_9;
  }
  if (v10 != 3) {
    goto LABEL_6;
  }
  unsigned __int8 v37 = 0;
  v11 = +[VPNConnectionStore sharedInstance];
  v12 = +[VPNConnectionStore sharedInstance];
  int v13 = objc_msgSend(v11, "isTypeEnabledWithServiceID:withGrade:outProviderAvailable:", v8, objc_msgSend(v12, "currentOnlyConnectionGrade"), &v37);

  if (v13)
  {
    if (v37)
    {
LABEL_6:
      [v7 connect];
LABEL_7:
      [(VPNBundleController *)self vpnStatusChanged:0];
      goto LABEL_9;
    }
  }
  NSLog(&cfstr_STryingToStart.isa, "-[VPNBundleController setVPNActive:]");
  v14 = +[VPNConnectionStore sharedInstance];
  objc_super v15 = +[VPNConnectionStore sharedInstance];
  uint64_t v16 = objc_msgSend(v14, "appNameForServiceID:withGrade:", v8, objc_msgSend(v15, "currentOnlyConnectionGrade"));

  int v17 = v37;
  v18 = NSString;
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = v19;
  v35 = (void *)v16;
  if (v17)
  {
    v21 = [v19 localizedStringForKey:@"SSL_MESSAGE" value:&stru_26E7C6230 table:@"MobileVPN"];
    objc_msgSend(v18, "stringWithFormat:", v21, v9, v16);
  }
  else
  {
    v21 = [v19 localizedStringForKey:@"MISSING_PROVIDER_MESSAGE" value:&stru_26E7C6230 table:@"MobileVPN"];
    objc_msgSend(v18, "stringWithFormat:", v21, v16, v9);
  v36 = };

  v22 = (void *)MEMORY[0x263F1C3F8];
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v23 localizedStringForKey:@"VPN_CONNECTION" value:&stru_26E7C6230 table:@"MobileVPN"];
  v25 = [v22 alertControllerWithTitle:v24 message:v36 preferredStyle:1];

  v26 = (void *)MEMORY[0x263F1C3F0];
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"OK" value:&stru_26E7C6230 table:@"MobileVPN"];
  v29 = [v26 actionWithTitle:v28 style:1 handler:0];
  [v25 addAction:v29];

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]));
  v31 = [WeakRetained rootController];
  v32 = [v31 topViewController];
  [v32 presentViewController:v25 animated:1 completion:0];

  v33 = [(VPNBundleController *)self vpnSpecifier];
  v34 = [(VPNBundleController *)self toggleVPNSpecifier];

  if (v33 == v34) {
    [(VPNBundleController *)self vpnStatusChanged:0];
  }

LABEL_9:
}

- (void)setVPNActive:(id)a3 forSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]));
  v8 = [WeakRetained rootController];

  v9 = [v6 propertyForKey:*MEMORY[0x263F60308]];
  int v10 = [v9 intValue];
  int v11 = [v13 intValue];

  if (v10 != v11)
  {
    if ([v13 BOOLValue]
      && +[VPNBundleController networkingIsDisabled])
    {
      v12 = [v8 topViewController];
      [v12 showConfirmationViewForSpecifier:v6];
    }
    else
    {
      -[VPNBundleController setVPNActive:](self, "setVPNActive:", [v13 BOOLValue]);
    }
  }
}

- (id)contentFilterStatusForSpecifier:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v4 = +[VPNConnectionStore sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__VPNBundleController_contentFilterStatusForSpecifier___block_invoke;
  v8[3] = &unk_264C06538;
  v8[4] = &v9;
  [v4 iterateContentFilterServicesWithBlock:v8];

  if (*((unsigned char *)v10 + 24))
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"RUNNING" value:&stru_26E7C6230 table:@"MobileVPN"];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"INVALID" value:&stru_26E7C6230 table:@"MobileVPN"];
  id v6 = };

  _Block_object_dispose(&v9, 8);

  return v6;
}

BOOL __55__VPNBundleController_contentFilterStatusForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v6 connectionWithServiceID:v5 withGrade:a3];

  int v8 = objc_msgSend(v7, "session_status");
  if (v8 == 3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  BOOL v9 = v8 != 3;

  return v9;
}

- (void)updateVPNSwitchStatus
{
  if ([(VPNBundleController *)self isRootMenuItem])
  {
    id v3 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]);
    id WeakRetained = objc_loadWeakRetained(v3);
    id v9 = [WeakRetained specifierForID:@"VPN"];

    id v5 = objc_loadWeakRetained(v3);
    uint64_t v6 = [v5 indexOfSpecifier:v9];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(VPNBundleController *)self vpnActiveForSpecifier:v9];
      id v8 = objc_loadWeakRetained(v3);
      [v8 reloadSpecifierAtIndex:v6];
    }
  }
}

- (void)vpnStatusChanged:(id)a3
{
  BOOL v5 = [(VPNBundleController *)self isRootMenuItem];
  uint64_t v6 = (int *)MEMORY[0x263F5FD50];
  if (v5 && [(VPNBundleController *)self isToggleSwitchInRootMenu])
  {
    if (a3) {
      [(VPNBundleController *)self updateVPNSwitchStatus];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *v6));
    [WeakRetained reloadSpecifierID:@"VPN"];
  }
  id v8 = +[VPNConnectionStore sharedInstance];
  id v9 = +[VPNConnectionStore sharedInstance];
  objc_msgSend(v8, "currentConnectionWithGrade:", objc_msgSend(v9, "currentOnlyConnectionGrade"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    int v10 = [v17 password];
    if ([v10 length])
    {
      int v11 = [v17 disconnected];

      if (v11) {
        [v17 setPassword:0];
      }
    }
    else
    {
    }
  }
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    char v12 = (id *)((char *)&self->super.super.isa + *v6);
    id v13 = objc_loadWeakRetained(v12);
    v14 = [(VPNBundleController *)self contentFilterSpecifier];
    uint64_t v15 = [v13 indexOfSpecifier:v14];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = objc_loadWeakRetained(v12);
      [v16 reloadSpecifierAtIndex:v15];
    }
  }
}

- (void)vpnConfigurationChanged:(id)a3
{
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    v4 = +[VPNConnectionStore sharedInstance];
    if ([v4 gradePresent:8])
    {
    }
    else
    {
      BOOL v5 = +[VPNConnectionStore sharedInstance];
      int v6 = [v5 gradePresent:7];

      if (!v6)
      {
        id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v8 = v7;
        id v9 = @"VPN";
        goto LABEL_7;
      }
    }
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = v7;
    id v9 = @"VPN_AND_RELAYS";
LABEL_7:
    int v10 = [v7 localizedStringForKey:v9 value:&stru_26E7C6230 table:@"MobileVPN"];
    int v11 = [(VPNBundleController *)self linkVPNSpecifier];
    [v11 setName:v10];
  }
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    char v12 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]);
    id WeakRetained = objc_loadWeakRetained(v12);
    uint64_t v14 = [(VPNBundleController *)self dnsSpecifier];
LABEL_12:
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [WeakRetained indexOfSpecifier:v14];

    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    id v52 = objc_loadWeakRetained(v12);
    [v52 reloadSpecifierAtIndex:v16];
    goto LABEL_57;
  }
  if ([(VPNBundleController *)self isDeviceManagement])
  {
    char v12 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]);
    id WeakRetained = objc_loadWeakRetained(v12);
    uint64_t v14 = [(VPNBundleController *)self contentFilterSpecifier];
    goto LABEL_12;
  }
  if (![(VPNBundleController *)self isRootMenuItem]) {
    return;
  }
  id v17 = +[VPNConnectionStore sharedInstance];
  id v52 = [v17 vpnServiceTotalCount];

  location = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]);
  id v18 = objc_loadWeakRetained(location);
  v19 = [v18 specifierForID:@"VPN"];

  v20 = [(VPNBundleController *)self lastServiceCount];
  int v21 = [v20 intValue];

  int v22 = [v52 intValue];
  if (v19) {
    int v23 = v21;
  }
  else {
    int v23 = 0;
  }
  BOOL v24 = [(VPNBundleController *)self isToggleSwitchInRootMenu];
  v25 = +[VPNConnectionStore sharedInstance];
  BOOL v26 = 0;
  if (([v25 gradePresent:3] & 1) == 0)
  {
    v27 = +[VPNConnectionStore sharedInstance];
    if ([v27 gradePresent:2])
    {
      BOOL v26 = 0;
    }
    else
    {
      v28 = +[VPNConnectionStore sharedInstance];
      if ([v28 gradePresent:7])
      {
        BOOL v26 = 0;
      }
      else
      {
        v50 = +[VPNConnectionStore sharedInstance];
        if ([v50 gradePresent:8])
        {
          BOOL v26 = 0;
          v29 = v50;
        }
        else
        {
          v49 = +[VPNConnectionStore sharedInstance];
          BOOL v26 = ([v49 disableToggle] & 1) == 0 && objc_msgSend(v52, "intValue") == 1;
          v29 = v50;
        }
      }
    }
  }

  v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v31 = [v30 localizedStringForKey:@"VPN" value:&stru_26E7C6230 table:@"MobileVPN"];
  v32 = [(VPNBundleController *)self linkVPNSpecifier];
  [v32 setName:v31];

  if (v23 != v22 || v24 != v26)
  {
    [(VPNBundleController *)self setLastServiceCount:v52];
    [(VPNBundleController *)self setToggleSwitchInRootMenu:v26];
    if ([(VPNBundleController *)self isToggleSwitchInRootMenu]) {
      [(VPNBundleController *)self toggleVPNSpecifier];
    }
    else {
    v33 = [(VPNBundleController *)self linkVPNSpecifier];
    }
    [(VPNBundleController *)self setVpnSpecifier:v33];

    if (v19 || v22 < 1)
    {
      if (v19)
      {
        if (v22
          && ([(VPNBundleController *)self vpnSpecifier],
              v43 = objc_claimAutoreleasedReturnValue(),
              v43,
              v43))
        {
          v44 = [(VPNBundleController *)self vpnSpecifier];

          if (v19 == v44) {
            goto LABEL_56;
          }
          id v41 = objc_loadWeakRetained(location);
          v45 = [MEMORY[0x263EFF8C0] arrayWithObject:v19];
          v46 = (void *)MEMORY[0x263EFF8C0];
          v47 = [(VPNBundleController *)self vpnSpecifier];
          int v48 = [v46 arrayWithObject:v47];
          [v41 replaceContiguousSpecifiers:v45 withSpecifiers:v48 animated:1];
        }
        else
        {
          id v41 = objc_loadWeakRetained(location);
          [v41 removeSpecifier:v19 animated:1];
        }
LABEL_55:
      }
    }
    else
    {
      v34 = [(VPNBundleController *)self vpnSpecifier];

      if (v34)
      {
        id v35 = objc_loadWeakRetained(location);
        uint64_t v36 = [v35 indexOfSpecifierID:@"INTERNET_TETHERING"];

        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v37 = objc_loadWeakRetained(location);
          uint64_t v36 = [v37 indexOfSpecifierID:@"MOBILE_DATA_SETTINGS_ID"];

          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v38 = objc_loadWeakRetained(location);
            uint64_t v36 = [v38 indexOfSpecifierID:@"Bluetooth"];

            if (v36 == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v39 = objc_loadWeakRetained(location);
              uint64_t v36 = [v39 indexOfSpecifierID:@"WIFI"];
            }
          }
        }
        if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v40 = 1;
        }
        else {
          uint64_t v40 = v36 + 1;
        }
        id v41 = objc_loadWeakRetained(location);
        v42 = [(VPNBundleController *)self vpnSpecifier];
        [v41 insertSpecifier:v42 atIndex:v40 animated:1];

        goto LABEL_55;
      }
    }
  }
LABEL_56:

LABEL_57:
}

- (id)getDNSSummary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"AUTOMATIC_DNS" value:&stru_26E7C6230 table:@"MobileVPN"];

  BOOL v5 = +[VPNConnectionStore sharedInstance];
  int v6 = [v5 vpnServicesForCurrentSetWithGrade:4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = +[VPNConnectionStore sharedInstance];
        int v15 = [v14 isEnabledWithServiceID:v13 withGrade:4];

        if (v15)
        {
          if (v10)
          {
            v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v20 = [v19 localizedStringForKey:@"MULTIPLE_DNS" value:&stru_26E7C6230 table:@"MobileVPN"];

            v4 = (void *)v20;
            goto LABEL_15;
          }
          uint64_t v16 = +[VPNConnectionStore sharedInstance];
          id v17 = [v16 optionsForServiceID:v13 withGrade:4];

          if (v17)
          {
            uint64_t v18 = [v17 objectForKeyedSubscript:@"dispName"];

            v4 = (void *)v18;
          }

          int v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v4;
}

- (id)getContentFilterSummary:(id)a3
{
  id v3 = +[VPNConnectionStore sharedInstance];
  v4 = [v3 aggregateStatusText:6];

  return v4;
}

- (void)confirmAirplaneModeDisable:(id)a3
{
  +[VPNBundleController disableAirplaneMode];

  [(VPNBundleController *)self setVPNActive:1];
}

- (void)cancelAirplaneModeDisable:(id)a3
{
  id v3 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained reloadSpecifier:v4];
}

- (VPNConnectionStore)connectionStore
{
  return (VPNConnectionStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionStore:(id)a3
{
}

- (PSSpecifier)passwordSetupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPasswordSetupSpecifier:(id)a3
{
}

- (PSSpecifier)vpnSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (PSSpecifier)linkVPNSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 56, 1);
}

- (PSSpecifier)dnsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDnsSpecifier:(id)a3
{
}

- (PSSpecifier)contentFilterSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContentFilterSpecifier:(id)a3
{
}

- (void)setDeviceManagement:(BOOL)a3
{
  self->_deviceManagement = a3;
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_contentFilterSpecifier, 0);
  objc_storeStrong((id *)&self->_dnsSpecifier, 0);
  objc_storeStrong((id *)&self->_linkVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_vpnSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSetupSpecifier, 0);
  objc_storeStrong((id *)&self->_lastServiceCount, 0);

  objc_storeStrong((id *)&self->_connectionStore, 0);
}

- (void)initWithParentListController:(os_log_t)log properties:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234C0A000, log, OS_LOG_TYPE_ERROR, "Shared VPNConnectionStore is nil", v1, 2u);
}

@end