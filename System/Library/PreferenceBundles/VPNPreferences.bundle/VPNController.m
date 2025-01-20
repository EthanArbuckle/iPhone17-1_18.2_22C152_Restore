@interface VPNController
- (BOOL)shouldHideAddVPNButton;
- (NSMutableArray)currentAppVPNSpecifiers;
- (NSMutableArray)currentEnterpriseVPNSpecifiers;
- (NSMutableArray)currentPersonalVPNSpecifiers;
- (PSSpecifier)addVPNButtonSpecifier;
- (PSSpecifier)alwaysOnGroupTitleSpecifier;
- (PSSpecifier)appGroupTitleSpecifier;
- (PSSpecifier)connectEnterpriseSpecifier;
- (PSSpecifier)connectPersonalSpecifier;
- (PSSpecifier)currentAOVPNSpecifier;
- (PSSpecifier)enterpriseGroupTitleSpecifier;
- (PSSpecifier)personalGroupTitleSpecifier;
- (PSSpecifier)privacyLinkSpecifier;
- (VPNController)init;
- (id)dnsStatusForSpecifier:(id)a3;
- (id)getAOVPNEnabledForSpecifier:(id)a3;
- (id)getDNSSummary:(id)a3;
- (id)getDeviceRelayStateForSpecifier:(id)a3;
- (id)getEnterpriseConnectionStateForSpecifier:(id)a3;
- (id)getPersonalConnectionStateForSpecifier:(id)a3;
- (id)messageForConnection:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)addListForGrade:(unint64_t)a3 toSpecifiers:(id)a4;
- (void)addVPNConfiguration:(id)a3;
- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4;
- (void)cancelEnterpriseConnection:(id)a3;
- (void)cancelPersonalConnection:(id)a3;
- (void)changeActiveVPN:(id)a3;
- (void)confirmAirplaneModeDisable:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)privacyLinkAction;
- (void)setAOVPNEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setAddVPNButtonSpecifier:(id)a3;
- (void)setAlwaysOnGroupTitleSpecifier:(id)a3;
- (void)setAppGroupTitleSpecifier:(id)a3;
- (void)setConnectEnterpriseSpecifier:(id)a3;
- (void)setConnectPersonalSpecifier:(id)a3;
- (void)setCurrentAOVPNSpecifier:(id)a3;
- (void)setCurrentAppVPNSpecifiers:(id)a3;
- (void)setCurrentEnterpriseVPNSpecifiers:(id)a3;
- (void)setCurrentPersonalVPNSpecifiers:(id)a3;
- (void)setEnterpriseConnectionState:(id)a3 forSpecifier:(id)a4;
- (void)setEnterpriseGroupTitleSpecifier:(id)a3;
- (void)setEnterpriseVPNActive:(BOOL)a3 specifier:(id)a4;
- (void)setPersonalConnectionState:(id)a3 forSpecifier:(id)a4;
- (void)setPersonalGroupTitleSpecifier:(id)a3;
- (void)setPersonalVPNActive:(BOOL)a3 specifier:(id)a4;
- (void)setPrivacyLinkSpecifier:(id)a3;
- (void)someVPNStatusChanged:(id)a3;
- (void)startEnterpriseConnection:(id)a3;
- (void)startPersonalConnection:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)vpnEnterpriseStatusChanged:(id)a3;
- (void)vpnPersonalStatusChanged:(id)a3;
- (void)willBecomeActive;
@end

@implementation VPNController

- (void)someVPNStatusChanged:(id)a3
{
  id v5 = a3;
  v4 = [v5 object];
  if ([v4 grade] == 1)
  {
    [(VPNController *)self vpnPersonalStatusChanged:v5];
  }
  else if ([v4 grade])
  {
    if ([v4 grade] == 2 || objc_msgSend(v4, "grade") == 3) {
      [(VPNController *)self reloadSpecifiers];
    }
  }
  else
  {
    [(VPNController *)self vpnEnterpriseStatusChanged:v5];
  }
}

- (id)messageForConnection:(id)a3
{
  id v3 = a3;
  v4 = +[VPNConnectionStore sharedInstance];
  id v5 = [v3 serviceID];
  v6 = [v4 optionsForServiceID:v5 withGrade:0];

  v7 = [v6 objectForKey:@"VPNOnDemandCapable"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = [v6 objectForKey:@"VPNOnDemandEnabled"];
    int v10 = [v9 BOOLValue];
  }
  else
  {
    int v10 = 0;
  }
  char v26 = 0;
  v11 = [v3 serviceID];
  int v12 = [v4 isTypeEnabledWithServiceID:v11 withGrade:0 outProviderAvailable:&v26];

  uint64_t v13 = [v3 vpnConnectionType];
  if (v13 == 3 && !v26)
  {
    v14 = NSString;
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"MISSING_PROVIDER_MESSAGE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v17 = [v3 serviceID];
    v18 = [v4 appNameForServiceID:v17 withGrade:0];
    v19 = [v3 displayName];
    objc_msgSend(v14, "stringWithFormat:", v16, v18, v19);
    v21 = LABEL_10:;

LABEL_11:
    goto LABEL_12;
  }
  if (v13 == 3 && (v12 & v8 & 1) == 0)
  {
    v20 = NSString;
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"SSL_MESSAGE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v17 = [v3 displayName];
    v18 = [v3 serviceID];
    v19 = [v4 appNameForServiceID:v18 withGrade:0];
    objc_msgSend(v20, "stringWithFormat:", v16, v17, v19);
    goto LABEL_10;
  }
  if ([v3 onDemandAction] == 2)
  {
    v23 = NSString;
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v24;
    v25 = @"ON_DEMAND_DISCONNECT";
LABEL_21:
    v16 = [v24 localizedStringForKey:v25 value:&stru_26E7C6230 table:@"MobileVPN"];
    v17 = [v3 displayName];
    v21 = objc_msgSend(v23, "stringWithFormat:", v16, v17);
    goto LABEL_11;
  }
  if (v10 && [v3 onDemandAction] != 4)
  {
    v23 = NSString;
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v24;
    v25 = @"ON_DEMAND_TEXT";
    goto LABEL_21;
  }
  v21 = 0;
LABEL_12:

  return v21;
}

- (void)vpnPersonalStatusChanged:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[VPNConnectionStore sharedInstance];
  v6 = [v5 currentConnectionWithGrade:1];

  v29 = v4;
  v7 = [v4 object];
  int v8 = [v6 isEqual:v7];
  v9 = (uint64_t *)MEMORY[0x263F602B0];
  int v27 = v8;
  if (v8)
  {
    [(VPNController *)self beginUpdates];
    int v10 = [(VPNController *)self connectPersonalSpecifier];
    v11 = [v10 propertyForKey:*v9];

    int v12 = [v6 statusText];
    uint64_t v13 = [v11 detailTextLabel];
    [v13 setText:v12];

    v14 = [(VPNController *)self connectPersonalSpecifier];
    [(VPNController *)self reloadSpecifier:v14 animated:0];
  }
  v28 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(VPNController *)self currentPersonalVPNSpecifiers];
  uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    uint64_t v30 = *v9;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v20 = [v19 userInfo];
        v21 = [v20 objectForKey:@"vpn-service-id"];
        v22 = [v7 serviceID];
        int v23 = [v21 isEqual:v22];

        if (v23)
        {
          v24 = [v19 propertyForKey:v30];
          v25 = [v7 alertText];
          [v24 setAlert:v25];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  if (v27) {
    [v26 endUpdates];
  }
}

- (void)vpnEnterpriseStatusChanged:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[VPNConnectionStore sharedInstance];
  v6 = [v5 currentConnectionWithGrade:0];

  v29 = v4;
  v7 = [v4 object];
  int v8 = [v6 isEqual:v7];
  v9 = (uint64_t *)MEMORY[0x263F602B0];
  int v27 = v8;
  if (v8)
  {
    [(VPNController *)self beginUpdates];
    int v10 = [(VPNController *)self connectEnterpriseSpecifier];
    v11 = [v10 propertyForKey:*v9];

    int v12 = [v6 statusText];
    uint64_t v13 = [v11 detailTextLabel];
    [v13 setText:v12];

    v14 = [(VPNController *)self connectEnterpriseSpecifier];
    [(VPNController *)self reloadSpecifier:v14 animated:0];
  }
  v28 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(VPNController *)self currentEnterpriseVPNSpecifiers];
  uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    uint64_t v30 = *v9;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v20 = [v19 userInfo];
        v21 = [v20 objectForKey:@"vpn-service-id"];
        v22 = [v7 serviceID];
        int v23 = [v21 isEqual:v22];

        if (v23)
        {
          v24 = [v19 propertyForKey:v30];
          v25 = [v7 alertText];
          [v24 setAlert:v25];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  if (v27) {
    [v26 endUpdates];
  }
}

- (BOOL)shouldHideAddVPNButton
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53AA0]];

  return v3 == 2;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)VPNController;
  [(VPNController *)&v5 dealloc];
}

- (VPNController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VPNController;
  v2 = [(VPNController *)&v6 init];
  if (v2)
  {
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_someVPNStatusChanged_ name:kNotificationVPNConnectionStatusChanged object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_vpnConfigurationChanged_ name:@"VPNNEConfigurationChangedNotification" object:0];
  }
  return v2;
}

- (void)setPersonalVPNActive:(BOOL)a3 specifier:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  objc_super v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v6 currentConnectionWithGrade:1];

  if (v7)
  {
    if (v4)
    {
      if (+[VPNBundleController networkingIsDisabled])
      {
        int v8 = [(VPNController *)self rootController];
        v9 = [v8 topViewController];

        [v9 showConfirmationViewForSpecifier:v10];
      }
      else
      {
        [v7 connect];
      }
    }
    else
    {
      [v7 disconnect];
    }
    [(VPNController *)self vpnPersonalStatusChanged:0];
  }
}

- (void)setEnterpriseVPNActive:(BOOL)a3 specifier:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  objc_super v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v6 currentConnectionWithGrade:0];

  if (v7)
  {
    if (v4)
    {
      if (+[VPNBundleController networkingIsDisabled])
      {
        int v8 = [(VPNController *)self rootController];
        v9 = [v8 topViewController];

        [v9 showConfirmationViewForSpecifier:v10];
      }
      else
      {
        [v7 connect];
      }
    }
    else
    {
      [v7 disconnect];
    }
    [(VPNController *)self vpnEnterpriseStatusChanged:0];
  }
}

- (void)startEnterpriseConnection:(id)a3
{
}

- (void)cancelEnterpriseConnection:(id)a3
{
}

- (void)setEnterpriseConnectionState:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  -[VPNController setEnterpriseVPNActive:specifier:](self, "setEnterpriseVPNActive:specifier:", [a3 BOOLValue], v6);
}

- (id)getEnterpriseConnectionStateForSpecifier:(id)a3
{
  int v3 = +[VPNConnectionStore sharedInstance];
  BOOL v4 = [v3 currentConnectionWithGrade:0];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));

  return v5;
}

- (id)getDeviceRelayStateForSpecifier:(id)a3
{
  int v3 = +[VPNConnectionStore sharedInstance];
  BOOL v4 = [v3 currentConnectionWithGrade:7];

  objc_super v5 = [v4 statusText];

  return v5;
}

- (void)startPersonalConnection:(id)a3
{
}

- (void)cancelPersonalConnection:(id)a3
{
}

- (void)setAOVPNEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4 = a3;
  id v10 = +[VPNConnectionStore sharedInstance];
  objc_super v5 = [v10 currentConnectionWithGrade:3];
  uint64_t v6 = [v4 BOOLValue];

  v7 = [v5 serviceID];
  int v8 = [v10 isEnabledWithServiceID:v7 withGrade:3];

  if (v6 != v8)
  {
    v9 = [v5 serviceID];
    [v10 enable:v6 serviceID:v9 withGrade:3];
  }
}

- (id)getAOVPNEnabledForSpecifier:(id)a3
{
  int v3 = +[VPNConnectionStore sharedInstance];
  id v4 = [v3 currentConnectionWithGrade:3];
  objc_super v5 = NSNumber;
  uint64_t v6 = [v4 serviceID];
  v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v3, "isEnabledWithServiceID:withGrade:", v6, 3));

  return v7;
}

- (void)setPersonalConnectionState:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  -[VPNController setPersonalVPNActive:specifier:](self, "setPersonalVPNActive:specifier:", [a3 BOOLValue], v6);
}

- (id)getPersonalConnectionStateForSpecifier:(id)a3
{
  int v3 = +[VPNConnectionStore sharedInstance];
  id v4 = [v3 currentConnectionWithGrade:1];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));

  return v5;
}

- (void)addVPNConfiguration:(id)a3
{
  id v4 = *(objc_class **)((char *)a3 + (int)*MEMORY[0x263F5FE18]);
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F5FB68]);
  }
  id v8 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE88]));
  [v8 setRootController:WeakRetained];

  [v8 setParentController:self];
  [v8 setSpecifier:v5];

  [(VPNController *)self showController:v8];
}

- (void)willBecomeActive
{
  v2.receiver = self;
  v2.super_class = (Class)VPNController;
  [(VPNController *)&v2 willBecomeActive];
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)VPNController;
  [(VPNController *)&v2 loadView];
}

- (void)addListForGrade:(unint64_t)a3 toSpecifiers:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v36 = a4;
  unint64_t v5 = 0x26AEE2000uLL;
  id v6 = +[VPNConnectionStore sharedInstance];
  unint64_t v42 = a3;
  v7 = [v6 vpnServicesForCurrentSetWithGrade:a3];

  if (v7)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v31 = v7;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v41 = *(void *)v44;
      uint64_t v35 = *MEMORY[0x263F60228];
      uint64_t v34 = *MEMORY[0x263F5FFE0];
      uint64_t v32 = *MEMORY[0x263F600A8];
      uint64_t v33 = *MEMORY[0x263F60080];
      do
      {
        uint64_t v10 = 0;
        uint64_t v37 = v9;
        do
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * v10);
          int v12 = [(id)(v5 + 3008) sharedInstance];
          uint64_t v13 = [v12 connectionWithServiceID:v11 withGrade:v42];

          if (v13)
          {
            v14 = [v13 displayName];
            uint64_t v15 = [(id)(v5 + 3008) sharedInstance];
            uint64_t v16 = [v15 isUserCreatedVPN:v11];

            uint64_t v17 = [(id)(v5 + 3008) sharedInstance];
            uint64_t v18 = [v17 isProfileBacked:v11];

            v19 = [(id)(v5 + 3008) sharedInstance];
            v20 = [v19 organizationForServiceID:v11];

            v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
            [v21 setIdentifier:v14];
            if (v21)
            {
              v50[0] = @"VPNSetupListController";
              v49[0] = v35;
              v49[1] = v34;
              v50[1] = objc_opt_class();
              v50[2] = @"VPNSetupListController";
              v49[2] = v33;
              v49[3] = v32;
              uint64_t v22 = [v13 vpnConnectionType];
              int v23 = &unk_26E7CB970;
              if (v22 == 1) {
                int v23 = &unk_26E7CB958;
              }
              v50[3] = v23;
              v40 = v14;
              v24 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
              [v21 setProperties:v24];

              v48[0] = v11;
              v47[0] = @"vpn-service-id";
              v47[1] = @"vpn-user-created";
              v25 = [NSNumber numberWithBool:v16];
              v48[1] = v25;
              v48[2] = v20;
              v47[2] = @"vpn-organization";
              v47[3] = @"service-grade";
              char v26 = [NSNumber numberWithUnsignedInteger:v42];
              v48[3] = v26;
              v47[4] = @"overview-mode";
              int v27 = [NSNumber numberWithBool:1];
              v48[4] = v27;
              v47[5] = @"vpn-alert";
              v28 = [v13 alertText];
              v48[5] = v28;
              v47[6] = @"vpn-profile-backed";
              v29 = [NSNumber numberWithBool:v18];
              v48[6] = v29;
              uint64_t v30 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:7];
              [v21 setUserInfo:v30];

              v14 = v40;
              uint64_t v9 = v37;

              unint64_t v5 = 0x26AEE2000;
              [v36 addObject:v21];
            }
          }
          ++v10;
        }
        while (v9 != v10);
        uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v9);
    }

    v7 = v31;
  }
}

- (id)specifiers
{
  v349[3] = *MEMORY[0x263EF8340];
  int v3 = +[VPNConnectionStore sharedInstance];
  id v4 = [v3 vpnServiceCountWithGrade:3];
  int v279 = [v4 intValue];

  unint64_t v5 = [v3 vpnServiceCountWithGrade:0];
  int v6 = [v5 intValue];

  v7 = [v3 vpnServiceCountWithGrade:7];
  int v8 = [v7 intValue];

  uint64_t v9 = [v3 vpnServiceCountWithGrade:8];
  int v10 = [v9 intValue];

  uint64_t v11 = [v3 vpnServiceCountWithGrade:2];
  int v12 = [v11 intValue];

  uint64_t v13 = [v3 vpnServiceCountWithGrade:1];
  int v14 = [v13 intValue];

  uint64_t v15 = [v3 vpnServiceCountWithGrade:4];
  unsigned int v16 = [v15 intValue];

  uint64_t v17 = [v3 vpnServiceCountWithGrade:5];
  unsigned int v18 = [v17 intValue];

  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v19) {
    goto LABEL_111;
  }
  int v276 = v10;
  int v258 = v12;
  int v259 = v14;
  unint64_t v260 = __PAIR64__(v16, v18);
  uint64_t v261 = (int)*MEMORY[0x263F5FDB8];
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v284 = v3;
  v285 = self;
  v269 = v20;
  if (v279)
  {
    v21 = [(VPNController *)self alwaysOnGroupTitleSpecifier];

    if (!v21)
    {
      uint64_t v22 = (void *)MEMORY[0x263F5FC40];
      int v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"ALWAYS_ON_VPN_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
      v25 = [v22 groupSpecifierWithName:v24];
      [(VPNController *)self setAlwaysOnGroupTitleSpecifier:v25];
    }
    char v26 = [(VPNController *)self alwaysOnGroupTitleSpecifier];
    [v20 addObject:v26];

    int v27 = [v3 currentConnectionWithGrade:3];
    if (v27)
    {
      v28 = (void *)MEMORY[0x263F5FC40];
      v29 = [v3 currentConnectionWithGrade:3];
      uint64_t v30 = [v29 displayName];
      v31 = [v28 preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      uint64_t v32 = *MEMORY[0x263F60228];
      v349[0] = @"VPNSetupListController";
      uint64_t v33 = *MEMORY[0x263F5FFE0];
      v348[0] = v32;
      v348[1] = v33;
      uint64_t v34 = objc_opt_class();
      v348[2] = *MEMORY[0x263F60080];
      v349[1] = v34;
      v349[2] = @"VPNSetupListController";
      uint64_t v35 = [NSDictionary dictionaryWithObjects:v349 forKeys:v348 count:3];
      [v31 setProperties:v35];

      v346[0] = @"vpn-service-id";
      v280 = [v27 serviceID];
      v347[0] = v280;
      v346[1] = @"vpn-user-created";
      id v36 = [NSNumber numberWithInteger:0];
      v347[1] = v36;
      v346[2] = @"vpn-organization";
      uint64_t v37 = [v27 serviceID];
      v38 = [v284 organizationForServiceID:v37];
      v347[2] = v38;
      v346[3] = @"vpn-status";
      v39 = [v27 statusText];
      v347[3] = v39;
      v346[4] = @"service-grade";
      v40 = [NSNumber numberWithInteger:3];
      v347[4] = v40;
      v346[5] = @"overview-mode";
      uint64_t v41 = [NSNumber numberWithBool:1];
      v347[5] = v41;
      v346[6] = @"vpn-profile-backed";
      [NSNumber numberWithBool:1];
      v43 = unint64_t v42 = v27;
      v347[6] = v43;
      long long v44 = [NSDictionary dictionaryWithObjects:v347 forKeys:v346 count:7];
      [v31 setUserInfo:v44];

      int v27 = v42;
      self = v285;

      int v3 = v284;
      [(VPNController *)v285 setCurrentAOVPNSpecifier:v31];
      long long v45 = [(VPNController *)v285 currentAOVPNSpecifier];
      [v269 addObject:v45];

      long long v46 = [v42 serviceID];
      LODWORD(v40) = [v284 alwaysOnToggleEnabledForServiceID:v46];

      if (v40)
      {
        v47 = (void *)MEMORY[0x263F5FB40];
        v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v49 = [v48 localizedStringForKey:@"CONNECT_AUTOMATICALLY" value:&stru_26E7C6230 table:@"MobileVPN"];
        v50 = [v47 preferenceSpecifierNamed:v49 target:v285 set:sel_setAOVPNEnabled_forSpecifier_ get:sel_getAOVPNEnabledForSpecifier_ detail:0 cell:6 edit:0];

        [v269 addObject:v50];
      }
      v51 = NSString;
      uint64_t v52 = [v42 serviceID];
      int v53 = [v284 isEnabledWithServiceID:v52 withGrade:3];
      v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v55 = v54;
      if (v53) {
        v56 = @"ALWAYS_ON_TEXT";
      }
      else {
        v56 = @"ALWAYS_ON_DISABLED_TEXT";
      }
      v57 = [v54 localizedStringForKey:v56 value:&stru_26E7C6230 table:@"MobileVPN"];
      v58 = [v42 displayName];
      v59 = objc_msgSend(v51, "stringWithFormat:", v57, v58);

      v60 = [(VPNController *)v285 alwaysOnGroupTitleSpecifier];
      uint64_t v344 = *MEMORY[0x263F600F8];
      v345 = v59;
      v61 = [NSDictionary dictionaryWithObjects:&v345 forKeys:&v344 count:1];
      [v60 setProperties:v61];
    }
    goto LABEL_106;
  }
  [(VPNController *)self setCurrentEnterpriseVPNSpecifiers:0];
  int v62 = v8;
  int v63 = v6;
  int v257 = v6;
  if (v6 | v62)
  {
    v64 = [(VPNController *)self enterpriseGroupTitleSpecifier];

    if (!v64)
    {
      v65 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [(VPNController *)self setEnterpriseGroupTitleSpecifier:v65];
    }
    v66 = [(VPNController *)self enterpriseGroupTitleSpecifier];
    [v20 addObject:v66];

    if (v6)
    {
      v67 = [v3 currentConnectionWithGrade:0];
      if (v67) {
        goto LABEL_21;
      }
    }
    else
    {
      v67 = 0;
    }
    if (v62)
    {
      v67 = [v3 currentConnectionWithGrade:7];
    }
LABEL_21:
    if (v67)
    {
LABEL_35:
      uint64_t v75 = [v67 grade];
      v76 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v77 = v76;
      if (v75 == 7)
      {
        v78 = [v76 localizedStringForKey:@"RELAY_STATUS" value:&stru_26E7C6230 table:@"MobileVPN"];

        v79 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v78 target:self set:0 get:sel_getDeviceRelayStateForSpecifier_ detail:0 cell:4 edit:0];
        [(VPNController *)self setConnectEnterpriseSpecifier:v79];
        v80 = [(VPNController *)self connectEnterpriseSpecifier];
        [v20 addObject:v80];

        v81 = [(VPNController *)self enterpriseGroupTitleSpecifier];
        [v81 removePropertyForKey:*MEMORY[0x263F600F8]];
      }
      else
      {
        uint64_t v82 = [v76 localizedStringForKey:@"VPN_STATUS" value:&stru_26E7C6230 table:@"MobileVPN"];

        v281 = (void *)v82;
        v79 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:v82 target:self set:sel_setEnterpriseConnectionState_forSpecifier_ get:sel_getEnterpriseConnectionStateForSpecifier_ detail:0 cell:6 edit:0];
        v83 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v84 = [v83 localizedStringForKey:@"AIRPLANE_SHEET_CANCEL" value:&stru_26E7C6230 table:@"MobileVPN"];
        [v79 setCancelButton:v84];

        v85 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v86 = [v85 localizedStringForKey:@"AIRPLANE_SHEET_OK_ABBREVIATED" value:&stru_26E7C6230 table:@"MobileVPN"];
        [v79 setOkButton:v86];

        v87 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v88 = [v87 localizedStringForKey:@"AIRPLANE_SHEET_OK" value:&stru_26E7C6230 table:@"MobileVPN"];
        [v79 setTitle:v88];

        v89 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v90 = [v89 localizedStringForKey:@"AIRPLANE_SHEET_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
        [v79 setPrompt:v90];

        v340[0] = *MEMORY[0x263F60000];
        v91 = [NSNumber numberWithBool:1];
        v341[0] = v91;
        v340[1] = *MEMORY[0x263F5FFE0];
        v341[1] = objc_opt_class();
        v340[2] = *MEMORY[0x263F600A8];
        v92 = NSNumber;
        if ([v67 onDemandAction] == 2) {
          uint64_t v93 = 0;
        }
        else {
          uint64_t v93 = [v67 isProviderAvailable];
        }
        v94 = [v92 numberWithInt:v93];
        v341[2] = v94;
        v95 = [NSDictionary dictionaryWithObjects:v341 forKeys:v340 count:3];
        [v79 setProperties:v95];

        v338 = @"vpn-status";
        v96 = [v67 statusText];
        v339 = v96;
        v97 = [NSDictionary dictionaryWithObjects:&v339 forKeys:&v338 count:1];
        [v79 setUserInfo:v97];

        [v79 setConfirmationAction:sel_confirmAirplaneModeDisable_];
        [v79 setConfirmationCancelAction:sel_cancelAirplaneModeDisable_];
        [(VPNController *)self setConnectEnterpriseSpecifier:v79];
        v98 = [(VPNController *)self connectEnterpriseSpecifier];
        [v20 addObject:v98];

        v81 = [(VPNController *)self messageForConnection:v67];
        v99 = [(VPNController *)self enterpriseGroupTitleSpecifier];
        v100 = v99;
        if (v81)
        {
          uint64_t v336 = *MEMORY[0x263F600F8];
          v337 = v81;
          v101 = [NSDictionary dictionaryWithObjects:&v337 forKeys:&v336 count:1];
          [v100 setProperties:v101];
        }
        else
        {
          [v99 removePropertyForKey:*MEMORY[0x263F600F8]];
        }

        v78 = v281;
      }

      int v63 = v257;
      goto LABEL_45;
    }
    if (v63)
    {
      long long v308 = 0u;
      long long v309 = 0u;
      long long v306 = 0u;
      long long v307 = 0u;
      v68 = [v3 vpnServicesForCurrentSetWithGrade:0];
      uint64_t v69 = [v68 countByEnumeratingWithState:&v306 objects:v343 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v307;
        while (2)
        {
          for (uint64_t i = 0; i != v70; ++i)
          {
            if (*(void *)v307 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v73 = *(void *)(*((void *)&v306 + 1) + 8 * i);
            if (v73)
            {
              [v3 setActiveVPNID:v73 withGrade:0];
              goto LABEL_33;
            }
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v306 objects:v343 count:16];
          if (v70) {
            continue;
          }
          break;
        }
      }
LABEL_33:
      uint64_t v74 = 0;
    }
    else
    {
      if (!v62) {
        goto LABEL_45;
      }
      long long v304 = 0u;
      long long v305 = 0u;
      long long v302 = 0u;
      long long v303 = 0u;
      uint64_t v74 = 7;
      v68 = [v3 vpnServicesForCurrentSetWithGrade:7];
      uint64_t v252 = [v68 countByEnumeratingWithState:&v302 objects:v342 count:16];
      if (v252)
      {
        uint64_t v253 = v252;
        uint64_t v254 = *(void *)v303;
        uint64_t v74 = 7;
        while (2)
        {
          for (uint64_t j = 0; j != v253; ++j)
          {
            if (*(void *)v303 != v254) {
              objc_enumerationMutation(v68);
            }
            uint64_t v256 = *(void *)(*((void *)&v302 + 1) + 8 * j);
            if (v256)
            {
              uint64_t v74 = 7;
              [v3 setActiveVPNID:v256 withGrade:7];
              goto LABEL_123;
            }
          }
          uint64_t v253 = [v68 countByEnumeratingWithState:&v302 objects:v342 count:16];
          if (v253) {
            continue;
          }
          break;
        }
LABEL_123:
        int v63 = v257;
      }
    }

    v67 = [v3 currentConnectionWithGrade:v74];
    if (v67) {
      goto LABEL_35;
    }
LABEL_45:
    id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(VPNController *)self setCurrentEnterpriseVPNSpecifiers:v102];

    v103 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v104 = [v103 localizedStringForKey:@"ENTERPRISE_VPN_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];

    if (v62)
    {
      v105 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v106 = v105;
      if (v63) {
        v107 = @"ENTERPRISE_VPN_AND_RELAYS_GROUP_TITLE";
      }
      else {
        v107 = @"ENTERPRISE_RELAYS_GROUP_TITLE";
      }
      uint64_t v108 = [v105 localizedStringForKey:v107 value:&stru_26E7C6230 table:@"MobileVPN"];

      v104 = (void *)v108;
    }
    v109 = [(VPNController *)self currentEnterpriseVPNSpecifiers];
    v110 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v104];
    [v109 addObject:v110];

    v111 = [(VPNController *)self currentEnterpriseVPNSpecifiers];
    [(VPNController *)self addListForGrade:0 toSpecifiers:v111];

    v112 = [(VPNController *)self currentEnterpriseVPNSpecifiers];
    [(VPNController *)self addListForGrade:7 toSpecifiers:v112];

    v113 = [(VPNController *)self currentEnterpriseVPNSpecifiers];
    [v20 addObjectsFromArray:v113];
  }
  [(VPNController *)self setCurrentPersonalVPNSpecifiers:0];
  int v114 = v276;
  if (v14)
  {
    v115 = [(VPNController *)self personalGroupTitleSpecifier];

    if (!v115)
    {
      v116 = (void *)MEMORY[0x263F5FC40];
      v117 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v118 = [v117 localizedStringForKey:@"PERSONAL_VPN_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
      v119 = [v116 groupSpecifierWithName:v118];
      [(VPNController *)self setPersonalGroupTitleSpecifier:v119];
    }
    v120 = [(VPNController *)self personalGroupTitleSpecifier];
    [v20 addObject:v120];

    v121 = [v3 currentConnectionWithGrade:1];
    if (v121) {
      goto LABEL_66;
    }
    long long v300 = 0u;
    long long v301 = 0u;
    long long v298 = 0u;
    long long v299 = 0u;
    v122 = [v3 vpnServicesForCurrentSetWithGrade:1];
    uint64_t v123 = [v122 countByEnumeratingWithState:&v298 objects:v335 count:16];
    if (v123)
    {
      uint64_t v124 = v123;
      uint64_t v125 = *(void *)v299;
      while (2)
      {
        for (uint64_t k = 0; k != v124; ++k)
        {
          if (*(void *)v299 != v125) {
            objc_enumerationMutation(v122);
          }
          uint64_t v127 = *(void *)(*((void *)&v298 + 1) + 8 * k);
          if (v127)
          {
            [v3 setActiveVPNID:v127 withGrade:1];
            goto LABEL_65;
          }
        }
        uint64_t v124 = [v122 countByEnumeratingWithState:&v298 objects:v335 count:16];
        if (v124) {
          continue;
        }
        break;
      }
    }
LABEL_65:

    v121 = [v3 currentConnectionWithGrade:1];
    if (v121)
    {
LABEL_66:
      v128 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v129 = [v128 localizedStringForKey:@"STATUS" value:&stru_26E7C6230 table:@"MobileVPN"];

      v130 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:v129 target:self set:sel_setPersonalConnectionState_forSpecifier_ get:sel_getPersonalConnectionStateForSpecifier_ detail:0 cell:6 edit:0];
      v131 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v132 = [v131 localizedStringForKey:@"AIRPLANE_SHEET_CANCEL" value:&stru_26E7C6230 table:@"MobileVPN"];
      [v130 setCancelButton:v132];

      v133 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v134 = [v133 localizedStringForKey:@"AIRPLANE_SHEET_OK_ABBREVIATED" value:&stru_26E7C6230 table:@"MobileVPN"];
      [v130 setOkButton:v134];

      v135 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v136 = [v135 localizedStringForKey:@"AIRPLANE_SHEET_OK" value:&stru_26E7C6230 table:@"MobileVPN"];
      [v130 setTitle:v136];

      v137 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v138 = [v137 localizedStringForKey:@"AIRPLANE_SHEET_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
      [v130 setPrompt:v138];

      v333[0] = *MEMORY[0x263F60000];
      v139 = [NSNumber numberWithBool:1];
      v334[0] = v139;
      v333[1] = *MEMORY[0x263F5FFE0];
      v334[1] = objc_opt_class();
      v333[2] = *MEMORY[0x263F600A8];
      uint64_t v140 = [v121 onDemandAction];
      v141 = &unk_26E7CB970;
      if (v140 == 2) {
        v141 = &unk_26E7CB958;
      }
      v334[2] = v141;
      v142 = [NSDictionary dictionaryWithObjects:v334 forKeys:v333 count:3];
      [v130 setProperties:v142];

      v331 = @"vpn-status";
      v143 = [v121 statusText];
      v332 = v143;
      v144 = [NSDictionary dictionaryWithObjects:&v332 forKeys:&v331 count:1];
      [v130 setUserInfo:v144];

      [v130 setConfirmationAction:sel_confirmAirplaneModeDisable_];
      [v130 setConfirmationCancelAction:sel_cancelAirplaneModeDisable_];
      [(VPNController *)self setConnectPersonalSpecifier:v130];
      v145 = [(VPNController *)self connectPersonalSpecifier];
      [v20 addObject:v145];

      v146 = [(VPNController *)self messageForConnection:v121];
      v147 = [(VPNController *)self personalGroupTitleSpecifier];
      v148 = v147;
      if (v146)
      {
        uint64_t v329 = *MEMORY[0x263F600F8];
        v330 = v146;
        v149 = [NSDictionary dictionaryWithObjects:&v330 forKeys:&v329 count:1];
        [v148 setProperties:v149];
      }
      else
      {
        [v147 removePropertyForKey:*MEMORY[0x263F600F8]];
      }

      int v63 = v257;
      int v114 = v276;
    }
    id v150 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(VPNController *)self setCurrentPersonalVPNSpecifiers:v150];

    v151 = [(VPNController *)self currentPersonalVPNSpecifiers];
    v152 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v151 addObject:v152];

    v153 = [(VPNController *)self currentPersonalVPNSpecifiers];
    [(VPNController *)self addListForGrade:1 toSpecifiers:v153];

    v154 = [(VPNController *)self currentPersonalVPNSpecifiers];
    [v20 addObjectsFromArray:v154];
  }
  if (v114)
  {
    v155 = (void *)MEMORY[0x263F5FC40];
    v156 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v157 = [v156 localizedStringForKey:@"APP_RELAY_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v158 = [v155 groupSpecifierWithName:v157];
    [v20 addObject:v158];

    [v3 vpnServicesForCurrentSetWithGrade:8];
    long long v294 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    long long v297 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v277 = [obj countByEnumeratingWithState:&v294 objects:v328 count:16];
    if (v277)
    {
      uint64_t v272 = *MEMORY[0x263F60228];
      uint64_t v274 = *(void *)v295;
      uint64_t v270 = *MEMORY[0x263F5FFE0];
      uint64_t v267 = *MEMORY[0x263F60080];
      do
      {
        for (uint64_t m = 0; m != v277; ++m)
        {
          if (*(void *)v295 != v274) {
            objc_enumerationMutation(obj);
          }
          uint64_t v160 = *(void *)(*((void *)&v294 + 1) + 8 * m);
          v161 = +[VPNConnectionStore sharedInstance];
          v162 = [v161 connectionWithServiceID:v160 withGrade:8];

          v163 = +[VPNConnectionStore sharedInstance];
          uint64_t v164 = [v163 isProfileBacked:v160];

          v165 = (void *)MEMORY[0x263F5FC40];
          v166 = [v162 displayName];
          v167 = [v165 preferenceSpecifierNamed:v166 target:v285 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          v327[0] = @"VPNSetupListController";
          v326[0] = v272;
          v326[1] = v270;
          uint64_t v168 = objc_opt_class();
          v326[2] = v267;
          v327[1] = v168;
          v327[2] = @"VPNSetupListController";
          v169 = [NSDictionary dictionaryWithObjects:v327 forKeys:v326 count:3];
          [v167 setProperties:v169];

          v324[0] = @"vpn-service-id";
          v282 = [v162 serviceID];
          v325[0] = v282;
          v325[1] = &unk_26E7CB958;
          v324[1] = @"vpn-user-created";
          v324[2] = @"vpn-organization";
          v170 = [v162 serviceID];
          v171 = [v284 organizationForServiceID:v170];
          v325[2] = v171;
          v324[3] = @"vpn-status";
          v172 = [v162 statusText];
          v325[3] = v172;
          v324[4] = @"vpn-status-value";
          v173 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v162, "status"));
          v325[4] = v173;
          v325[5] = &unk_26E7CB988;
          v324[5] = @"service-grade";
          v324[6] = @"overview-mode";
          v325[6] = &unk_26E7CB970;
          v324[7] = @"vpn-profile-backed";
          v174 = [NSNumber numberWithBool:v164];
          v325[7] = v174;
          v324[8] = @"vpn-alert";
          v175 = [v162 alertText];
          v325[8] = v175;
          v176 = [NSDictionary dictionaryWithObjects:v325 forKeys:v324 count:9];
          [v167 setUserInfo:v176];

          [v269 addObject:v167];
        }
        uint64_t v277 = [obj countByEnumeratingWithState:&v294 objects:v328 count:16];
      }
      while (v277);
    }

    int v3 = v284;
    self = v285;
    id v20 = v269;
    int v63 = v257;
  }
  int v177 = v259;
  if (v258)
  {
    v178 = [(VPNController *)self appGroupTitleSpecifier];

    if (!v178)
    {
      v179 = (void *)MEMORY[0x263F5FC40];
      v180 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v181 = [v180 localizedStringForKey:@"APP_VPN_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
      v182 = [v179 groupSpecifierWithName:v181];
      [(VPNController *)self setAppGroupTitleSpecifier:v182];
    }
    v183 = [(VPNController *)self appGroupTitleSpecifier];
    [v20 addObject:v183];

    [(VPNController *)self setCurrentAppVPNSpecifiers:0];
    [v3 vpnServicesForCurrentSetWithGrade:2];
    long long v290 = 0u;
    long long v291 = 0u;
    long long v292 = 0u;
    long long v293 = 0u;
    id v262 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v271 = [v262 countByEnumeratingWithState:&v290 objects:v323 count:16];
    if (v271)
    {
      id obja = (id)*MEMORY[0x263F60228];
      uint64_t v268 = *(void *)v291;
      uint64_t v263 = *MEMORY[0x263F60080];
      uint64_t v264 = *MEMORY[0x263F5FFE0];
      do
      {
        for (uint64_t n = 0; n != v271; ++n)
        {
          if (*(void *)v291 != v268) {
            objc_enumerationMutation(v262);
          }
          uint64_t v185 = *(void *)(*((void *)&v290 + 1) + 8 * n);
          v186 = +[VPNConnectionStore sharedInstance];
          v187 = [v186 connectionWithServiceID:v185 withGrade:2];

          v188 = +[VPNConnectionStore sharedInstance];
          unsigned int v283 = [v188 isProfileBacked:v185];

          v189 = (void *)MEMORY[0x263F5FC40];
          v190 = [v187 displayName];
          v191 = [v189 preferenceSpecifierNamed:v190 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          v322[0] = @"VPNSetupListController";
          v321[0] = obja;
          v321[1] = v264;
          uint64_t v192 = objc_opt_class();
          v321[2] = v263;
          v322[1] = v192;
          v322[2] = @"VPNSetupListController";
          v193 = [NSDictionary dictionaryWithObjects:v322 forKeys:v321 count:3];
          [v191 setProperties:v193];

          v319[0] = @"vpn-service-id";
          v278 = [v187 serviceID];
          v320[0] = v278;
          v319[1] = @"vpn-user-created";
          v275 = [NSNumber numberWithInteger:0];
          v320[1] = v275;
          v319[2] = @"vpn-organization";
          v273 = [v187 serviceID];
          v194 = [v3 organizationForServiceID:v273];
          v320[2] = v194;
          v319[3] = @"vpn-status";
          v195 = [v187 statusText];
          v320[3] = v195;
          v319[4] = @"vpn-status-value";
          v196 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v187, "status"));
          v320[4] = v196;
          v319[5] = @"service-grade";
          v197 = [NSNumber numberWithInteger:2];
          v320[5] = v197;
          v319[6] = @"overview-mode";
          v198 = [NSNumber numberWithBool:1];
          v320[6] = v198;
          v319[7] = @"vpn-profile-backed";
          v199 = [NSNumber numberWithBool:v283];
          v320[7] = v199;
          v200 = [NSDictionary dictionaryWithObjects:v320 forKeys:v319 count:8];
          [v191 setUserInfo:v200];

          self = v285;
          v201 = [(VPNController *)v285 currentAppVPNSpecifiers];

          if (!v201)
          {
            id v202 = objc_alloc_init(MEMORY[0x263EFF980]);
            [(VPNController *)v285 setCurrentAppVPNSpecifiers:v202];
          }
          v203 = [(VPNController *)v285 currentAppVPNSpecifiers];
          [v203 addObject:v191];

          int v3 = v284;
        }
        uint64_t v271 = [v262 countByEnumeratingWithState:&v290 objects:v323 count:16];
      }
      while (v271);
    }
    long long v288 = 0u;
    long long v289 = 0u;
    long long v286 = 0u;
    long long v287 = 0u;
    v204 = [(VPNController *)self currentAppVPNSpecifiers];
    uint64_t v205 = [v204 countByEnumeratingWithState:&v286 objects:v318 count:16];
    int v177 = v259;
    if (v205)
    {
      uint64_t v206 = v205;
      uint64_t v207 = *(void *)v287;
      do
      {
        for (iuint64_t i = 0; ii != v206; ++ii)
        {
          if (*(void *)v287 != v207) {
            objc_enumerationMutation(v204);
          }
          [v269 addObject:*(void *)(*((void *)&v286 + 1) + 8 * ii)];
        }
        uint64_t v206 = [v204 countByEnumeratingWithState:&v286 objects:v318 count:16];
      }
      while (v206);
    }

    int v63 = v257;
  }
  if ([(VPNController *)self shouldHideAddVPNButton])
  {
    if (v258 | v63 | v177) {
      goto LABEL_107;
    }
    int v27 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    uint64_t v316 = *MEMORY[0x263F600F8];
    v209 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v210 = [v209 localizedStringForKey:@"VPN_RESTRICTED" value:&stru_26E7C6230 table:@"MobileVPN"];
    v317 = v210;
    v211 = [NSDictionary dictionaryWithObjects:&v317 forKeys:&v316 count:1];
    [v27 setProperties:v211];

    [v269 addObject:v27];
  }
  else
  {
    v212 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v213 = [v212 localizedStringForKey:@"PRIVACY_BLURB" value:&stru_26E7C6230 table:@"MobileVPN"];
    v214 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v215 = [v214 localizedStringForKey:@"PRIVACY_LINK" value:&stru_26E7C6230 table:@"MobileVPN"];
    v216 = [v213 stringByAppendingString:v215];

    v217 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [(VPNController *)v285 setPrivacyLinkSpecifier:v217];

    v218 = [(VPNController *)v285 privacyLinkSpecifier];
    v314[0] = *MEMORY[0x263F600C0];
    v219 = (objc_class *)objc_opt_class();
    v220 = NSStringFromClass(v219);
    uint64_t v221 = *MEMORY[0x263F600E8];
    v315[0] = v220;
    v315[1] = v216;
    uint64_t v222 = *MEMORY[0x263F600D0];
    v314[1] = v221;
    v314[2] = v222;
    v223 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v224 = [v223 localizedStringForKey:@"PRIVACY_LINK" value:&stru_26E7C6230 table:@"MobileVPN"];
    v350.locatiouint64_t n = [v216 rangeOfString:v224];
    v225 = NSStringFromRange(v350);
    v315[2] = v225;
    v314[3] = *MEMORY[0x263F600E0];
    v226 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v285];
    v315[3] = v226;
    v314[4] = *MEMORY[0x263F600C8];
    v227 = NSStringFromSelector(sel_privacyLinkAction);
    v315[4] = v227;
    v228 = [NSDictionary dictionaryWithObjects:v315 forKeys:v314 count:5];
    [v218 setProperties:v228];

    int v27 = v216;
    self = v285;

    int v3 = v284;
    v229 = [(VPNController *)v285 privacyLinkSpecifier];
    [v269 addObject:v229];

    v230 = (void *)MEMORY[0x263F5FC40];
    v231 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v232 = [v231 localizedStringForKey:@"OTHER" value:&stru_26E7C6230 table:@"MobileVPN"];
    v233 = [v230 preferenceSpecifierNamed:v232 target:v285 set:0 get:0 detail:objc_opt_class() cell:13 edit:0];
    [(VPNController *)v285 setAddVPNButtonSpecifier:v233];

    v234 = [(VPNController *)v285 addVPNButtonSpecifier];
    v312[0] = @"service-grade";
    v235 = [NSNumber numberWithInteger:0];
    v313[0] = v235;
    v312[1] = @"overview-mode";
    v236 = [NSNumber numberWithBool:0];
    v313[1] = v236;
    v237 = [NSDictionary dictionaryWithObjects:v313 forKeys:v312 count:2];
    [v234 setUserInfo:v237];

    v238 = [(VPNController *)v285 addVPNButtonSpecifier];
    uint64_t v310 = *MEMORY[0x263F60228];
    v311 = @"VPNSetupListController";
    v239 = [NSDictionary dictionaryWithObjects:&v311 forKeys:&v310 count:1];
    [v238 setProperties:v239];

    v240 = [(VPNController *)v285 addVPNButtonSpecifier];
    [v240 setButtonAction:sel_addVPNConfiguration_];

    v241 = [(VPNController *)v285 addVPNButtonSpecifier];
    [v269 addObject:v241];
  }
LABEL_106:

LABEL_107:
  if (v260)
  {
    v242 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
    v243 = [v242 objectForKey:@"vpn-show-dns"];

    if (v243)
    {
      v244 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v269 addObject:v244];
      v245 = (void *)MEMORY[0x263F5FC40];
      v246 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v247 = [v246 localizedStringForKey:@"DNS_SETTINGS" value:&stru_26E7C6230 table:@"MobileVPN"];
      v248 = [v245 preferenceSpecifierNamed:v247 target:self set:0 get:sel_getDNSSummary_ detail:objc_opt_class() cell:2 edit:0];

      [v269 addObject:v248];
    }
  }
  v249 = *(Class *)((char *)&self->super.super.super.super.super.isa + v261);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v261) = (Class)v269;

  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v261);
LABEL_111:
  id v250 = v19;

  return v250;
}

- (id)getDNSSummary:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = [v4 localizedStringForKey:@"AUTOMATIC_DNS" value:&stru_26E7C6230 table:@"MobileVPN"];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 0;
  unint64_t v5 = +[VPNConnectionStore sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__VPNController_getDNSSummary___block_invoke;
  v8[3] = &unk_264C06970;
  v8[4] = v9;
  v8[5] = &v11;
  [v5 iterateDNSServicesWithBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);

  return v6;
}

BOOL __31__VPNController_getDNSSummary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[VPNConnectionStore sharedInstance];
  int v7 = [v6 isEnabledWithServiceID:v5 withGrade:a3];

  if (v7)
  {
    int v8 = ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    BOOL v9 = v8 == 1;
    if (v8 == 1)
    {
      int v10 = +[VPNConnectionStore sharedInstance];
      uint64_t v11 = [v10 optionsForServiceID:v5 withGrade:a3];

      if (!v11)
      {
        BOOL v9 = 1;
        goto LABEL_9;
      }
      uint64_t v12 = [v11 objectForKeyedSubscript:@"dispName"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"MULTIPLE_DNS" value:&stru_26E7C6230 table:@"MobileVPN"];
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

LABEL_9:
    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (id)dnsStatusForSpecifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v4 = +[VPNConnectionStore sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__VPNController_dnsStatusForSpecifier___block_invoke;
  v8[3] = &unk_264C06560;
  id v5 = v3;
  id v9 = v5;
  int v10 = &v11;
  [v4 iterateDNSServicesWithBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __39__VPNController_dnsStatusForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[VPNConnectionStore sharedInstance];
  int v7 = [v6 connectionWithServiceID:v5 withGrade:a3];

  int v8 = [*(id *)(a1 + 32) name];
  id v9 = [v7 displayName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = +[VPNConnectionStore sharedInstance];
    int v12 = [v11 isEnabledWithServiceID:v5 withGrade:a3];

    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = v13;
    if (v12) {
      uint64_t v15 = @"ON";
    }
    else {
      uint64_t v15 = @"OFF";
    }
    uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  return v10 ^ 1u;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(VPNController *)self indexForIndexPath:v6];
  v38.receiver = self;
  v38.super_class = (Class)VPNController;
  id v9 = [(VPNController *)&v38 tableView:v7 cellForRowAtIndexPath:v6];

  int v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  uint64_t v11 = [v10 userInfo];
  if (!v11) {
    goto LABEL_27;
  }
  int v12 = [(VPNController *)self connectEnterpriseSpecifier];

  if (v10 == v12)
  {
    int v14 = +[VPNConnectionStore sharedInstance];
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = [(VPNController *)self connectPersonalSpecifier];

  if (v10 == v13)
  {
    int v14 = +[VPNConnectionStore sharedInstance];
    uint64_t v15 = v14;
    uint64_t v16 = 1;
LABEL_6:
    uint64_t v17 = [v14 currentConnectionWithGrade:v16];

    unsigned int v18 = [v17 statusText];
    v19 = [v9 detailTextLabel];
    [v19 setText:v18];
  }
  uint64_t v20 = [(VPNController *)self addVPNButtonSpecifier];
  if (v10 == (void *)v20)
  {
  }
  else
  {
    v21 = (void *)v20;
    uint64_t v22 = [(VPNController *)self connectEnterpriseSpecifier];
    if (v10 == (void *)v22)
    {
    }
    else
    {
      int v23 = (void *)v22;
      v24 = [(VPNController *)self connectPersonalSpecifier];

      if (v10 != v24) {
        [v9 setAccessoryType:4];
      }
    }
  }
  v25 = [v10 propertyForKey:*MEMORY[0x263F5FFE0]];
  uint64_t v26 = objc_opt_class();

  if (v25 == (void *)v26 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v27 = [v11 objectForKey:@"vpn-service-id"];
    v28 = +[VPNConnectionStore sharedInstance];
    v29 = [v11 objectForKey:@"service-grade"];
    uint64_t v30 = objc_msgSend(v28, "isActiveVPNID:withGrade:", v27, objc_msgSend(v29, "unsignedIntegerValue"));

    [v9 setChecked:v30];
  }
  if (objc_opt_respondsToSelector())
  {
    v31 = [v11 objectForKey:@"vpn-organization"];
    [v9 setSubtitle:v31];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v32 = [v11 objectForKey:@"vpn-alert"];
    [v9 setAlert:v32];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v33 = [v11 objectForKey:@"vpn-status"];
    [v9 setVpnPrimaryTableCellStatus:v33];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v34 = [v11 objectForKey:@"vpn-status-value"];
    if (v34)
    {
      uint64_t v35 = [v11 objectForKey:@"vpn-status-value"];
      BOOL v36 = [v35 unsignedIntegerValue] == 5;
    }
    else
    {
      BOOL v36 = 0;
    }

    [v9 setDisabled:v36];
  }
LABEL_27:

  return v9;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  uint64_t v5 = [(VPNController *)self indexForIndexPath:a4];
  uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  id v6 = objc_alloc_init(*(Class *)&v8[*MEMORY[0x263F5FE18]]);
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x263F5FB68]);
  }
  [0 pushViewController:v6 animated:1];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE88]));
  [v6 setRootController:WeakRetained];

  [v6 setParentController:self];
  [v6 setSpecifier:v8];
  [(VPNController *)self showController:v6];
}

- (void)changeActiveVPN:(id)a3
{
  id v10 = [a3 userInfo];
  id v4 = [v10 objectForKey:@"vpn-service-id"];
  uint64_t v5 = [v10 objectForKey:@"service-grade"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = +[VPNConnectionStore sharedInstance];
  char v8 = [v7 isActiveVPNID:v4 withGrade:v6];

  if ((v8 & 1) == 0)
  {
    id v9 = +[VPNConnectionStore sharedInstance];
    [v9 setActiveVPNID:v4 withGrade:v6];
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) selectRowAtIndexPath:0 animated:0 scrollPosition:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VPNController *)self indexForIndexPath:v7];
  id v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  id v10 = [v9 propertyForKey:*MEMORY[0x263F5FFE0]];
  uint64_t v11 = objc_opt_class();

  if (v10 == (void *)v11)
  {
    uint64_t v15 = [v9 userInfo];
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 objectForKey:@"vpn-service-id"];

      if (v17) {
        [(VPNController *)self changeActiveVPN:v9];
      }
    }
  }
  else
  {
    uint64_t v12 = [(VPNController *)self connectEnterpriseSpecifier];
    if (v9 == (void *)v12)
    {
    }
    else
    {
      uint64_t v13 = (void *)v12;
      int v14 = [(VPNController *)self connectPersonalSpecifier];

      if (v9 != v14)
      {
        v18.receiver = self;
        v18.super_class = (Class)VPNController;
        [(VPNController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
      }
    }
  }
}

- (void)confirmAirplaneModeDisable:(id)a3
{
  id v7 = a3;
  +[VPNBundleController disableAirplaneMode];
  id v4 = [(VPNController *)self connectPersonalSpecifier];

  if (v4 == v7)
  {
    [(VPNController *)self setPersonalVPNActive:1 specifier:0];
  }
  else
  {
    id v5 = [(VPNController *)self connectEnterpriseSpecifier];

    id v6 = v7;
    if (v5 != v7) {
      goto LABEL_6;
    }
    [(VPNController *)self setEnterpriseVPNActive:1 specifier:0];
  }
  id v6 = v7;
LABEL_6:
}

- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
}

- (void)handleURL:(id)a3
{
  id v7 = a3;
  id v3 = [v7 objectForKeyedSubscript:@"path"];
  if ([v3 isEqualToString:@"LocalAuthenticationTrigger"])
  {
    id v4 = [v7 objectForKeyedSubscript:@"configID"];
    id v5 = [v7 objectForKeyedSubscript:@"sender"];
    id v6 = +[VPNConnectionStore sharedInstance];
    [v6 triggerLocalAuthenticationForConfigurationIdentifier:v4 requestedByApp:v5];
  }
}

- (void)privacyLinkAction
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.vpn"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)viewDidAppear:(BOOL)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)VPNController;
  [(VPNController *)&v17 viewDidAppear:a3];
  id v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/ManagedConfigurationList/VPN"];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];

  id v7 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  id v9 = (void *)[v7 initWithKey:@"VPN" table:0 locale:v8 bundleURL:v6];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v11 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v12 = (void *)[v10 initWithKey:@"General" table:0 locale:v11 bundleURL:v6];

  id v13 = objc_alloc(MEMORY[0x263F08DB0]);
  int v14 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v15 = (void *)[v13 initWithKey:@"VPN & Device Management" table:0 locale:v14 bundleURL:v6];

  v18[0] = v12;
  v18[1] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [(VPNController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.vpn" title:v9 localizedNavigationComponents:v16 deepLink:v4];
}

- (PSSpecifier)connectEnterpriseSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setConnectEnterpriseSpecifier:(id)a3
{
}

- (PSSpecifier)connectPersonalSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setConnectPersonalSpecifier:(id)a3
{
}

- (PSSpecifier)currentAOVPNSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setCurrentAOVPNSpecifier:(id)a3
{
}

- (NSMutableArray)currentAppVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setCurrentAppVPNSpecifiers:(id)a3
{
}

- (NSMutableArray)currentEnterpriseVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCurrentEnterpriseVPNSpecifiers:(id)a3
{
}

- (NSMutableArray)currentPersonalVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setCurrentPersonalVPNSpecifiers:(id)a3
{
}

- (PSSpecifier)alwaysOnGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setAlwaysOnGroupTitleSpecifier:(id)a3
{
}

- (PSSpecifier)enterpriseGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setEnterpriseGroupTitleSpecifier:(id)a3
{
}

- (PSSpecifier)personalGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setPersonalGroupTitleSpecifier:(id)a3
{
}

- (PSSpecifier)appGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setAppGroupTitleSpecifier:(id)a3
{
}

- (PSSpecifier)addVPNButtonSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setAddVPNButtonSpecifier:(id)a3
{
}

- (PSSpecifier)privacyLinkSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setPrivacyLinkSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkSpecifier, 0);
  objc_storeStrong((id *)&self->_addVPNButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_appGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_personalGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_enterpriseGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_alwaysOnGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPersonalVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentEnterpriseVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentAppVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentAOVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_connectPersonalSpecifier, 0);

  objc_storeStrong((id *)&self->_connectEnterpriseSpecifier, 0);
}

@end