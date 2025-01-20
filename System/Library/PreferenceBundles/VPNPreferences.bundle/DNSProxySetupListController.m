@interface DNSProxySetupListController
- (DNSProxySetupListController)init;
- (NSDictionary)includedBundleIDs;
- (NSString)appName;
- (NSString)displayName;
- (NSString)organization;
- (NSUUID)serviceID;
- (id)bundle;
- (id)connection;
- (id)getDescriptionForApp:(id)a3;
- (id)specifiers;
- (id)statusForConnection:(id)a3;
- (unint64_t)vpnGrade;
- (void)appWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAppName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIncludedBundleIDs:(id)a3;
- (void)setOrganization:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setStateForServiceID:(id)a3;
- (void)setVpnGrade:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DNSProxySetupListController

- (void)appWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
  v8 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[DNSProxySetupListController vpnGrade](self, "vpnGrade"));
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];

  v6.receiver = self;
  v6.super_class = (Class)DNSProxySetupListController;
  [(DNSProxySetupListController *)&v6 dealloc];
}

- (DNSProxySetupListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DNSProxySetupListController;
  v2 = [(DNSProxySetupListController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_vpnStatusChanged_ name:kNotificationVPNConnectionStatusChanged object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_vpnConfigurationChanged_ name:@"VPNNEConfigurationChangedNotification" object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_appWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  objc_super v6 = +[VPNConnectionStore sharedInstance];
  objc_super v7 = [v5 objectForKeyedSubscript:@"vpn-service-id"];
  v8 = objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[DNSProxySetupListController vpnGrade](self, "vpnGrade"));
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  v10.receiver = self;
  v10.super_class = (Class)DNSProxySetupListController;
  [(DNSProxySetupListController *)&v10 viewWillAppear:v3];
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DNSProxySetupListController;
  [(DNSProxySetupListController *)&v3 viewDidAppear:a3];
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)setStateForServiceID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  [(DNSProxySetupListController *)self setServiceID:v5];

  uint64_t v6 = (int)*MEMORY[0x263F5FE98];
  objc_super v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + v6) userInfo];
  v8 = [v7 objectForKey:@"service-grade"];
  -[DNSProxySetupListController setVpnGrade:](self, "setVpnGrade:", [v8 unsignedIntegerValue]);

  id v9 = +[VPNConnectionStore sharedInstance];
  objc_msgSend(v9, "optionsForServiceID:withGrade:", v4, -[DNSProxySetupListController vpnGrade](self, "vpnGrade"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_super v10 = [v15 objectForKey:@"dispName"];
    [(DNSProxySetupListController *)self setDisplayName:v10];

    v11 = [v15 objectForKey:@"VPNApplicationName"];
    [(DNSProxySetupListController *)self setAppName:v11];

    v12 = [v15 objectForKey:@"VPNIncludedBundleIDs"];
    [(DNSProxySetupListController *)self setIncludedBundleIDs:v12];

    v13 = [*(id *)((char *)&self->super.super.super.super.super.isa + v6) userInfo];
    v14 = [v13 objectForKey:@"vpn-organization"];
    [(DNSProxySetupListController *)self setOrganization:v14];
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)DNSProxySetupListController;
  [(DNSProxySetupListController *)&v5 loadView];
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  id v4 = [v3 objectForKey:@"vpn-service-id"];

  [(DNSProxySetupListController *)self setStateForServiceID:v4];
}

- (id)connection
{
  uint64_t v3 = +[VPNConnectionStore sharedInstance];
  id v4 = [(DNSProxySetupListController *)self serviceID];
  objc_super v5 = objc_msgSend(v3, "connectionWithServiceID:withGrade:", v4, -[DNSProxySetupListController vpnGrade](self, "vpnGrade"));

  return v5;
}

- (id)statusForConnection:(id)a3
{
  uint64_t v3 = [(DNSProxySetupListController *)self connection];
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 statusText];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v5 = [v6 localizedStringForKey:@"INVALID" value:&stru_26E7C6230 table:@"MobileVPN"];
  }

  return v5;
}

- (id)getDescriptionForApp:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"AppDescription"];
  id v4 = v3;
  if (v3) {
    objc_super v5 = v3;
  }
  else {
    objc_super v5 = &stru_26E7C6230;
  }

  return v5;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v67 = *MEMORY[0x263EF8340];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]))
  {
    uint64_t v3 = [(DNSProxySetupListController *)self displayName];
    [(DNSProxySetupListController *)v2 setTitle:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v4 addObject:v5];
    uint64_t v6 = (void *)MEMORY[0x263F5FC40];
    objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"VPN_GRADE" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v9 = [v6 preferenceSpecifierNamed:v8 target:v2 set:0 get:sel_vpnGradeNameForSpecifier_ detail:0 cell:4 edit:0];

    v53 = (void *)v9;
    [v4 addObject:v9];
    objc_super v10 = (void *)MEMORY[0x263F5FC40];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"STATUS" value:&stru_26E7C6230 table:@"MobileVPN"];
    uint64_t v13 = [v10 preferenceSpecifierNamed:v12 target:v2 set:0 get:sel_statusForConnection_ detail:0 cell:4 edit:0];

    v14 = (void *)v13;
    v59 = v4;
    [v4 addObject:v13];
    uint64_t v15 = [(DNSProxySetupListController *)v2 includedBundleIDs];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(DNSProxySetupListController *)v2 includedBundleIDs];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        v51 = (void *)v13;
        v52 = v5;
        v19 = (void *)MEMORY[0x263F5FC40];
        v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v21 = [v20 localizedStringForKey:@"INCLUDED_APPS_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
        v22 = [v19 groupSpecifierWithName:v21];
        [v4 addObject:v22];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id obj = [(DNSProxySetupListController *)v2 includedBundleIDs];
        uint64_t v23 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
        v24 = v2;
        if (v23)
        {
          uint64_t v25 = v23;
          uint64_t v26 = *(void *)v63;
          uint64_t v58 = *MEMORY[0x263F60138];
          uint64_t v55 = *MEMORY[0x263F601A8];
          uint64_t v56 = *MEMORY[0x263F60188];
          uint64_t v54 = *MEMORY[0x263F60140];
          unint64_t v27 = 0x263F01000uLL;
          uint64_t v57 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v63 != v26) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void *)(*((void *)&v62 + 1) + 8 * i);
              id v30 = objc_alloc(*(Class *)(v27 + 2168));
              id v61 = 0;
              v31 = (void *)[v30 initWithBundleIdentifier:v29 allowPlaceholder:0 error:&v61];
              id v32 = v61;
              v33 = [v31 localizedName];

              if (v33) {
                BOOL v34 = v32 == 0;
              }
              else {
                BOOL v34 = 0;
              }
              if (v34)
              {
                uint64_t v35 = v25;
                v36 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v33 target:v24 set:0 get:sel_getDescriptionForApp_ detail:0 cell:4 edit:0];
                v37 = [(DNSProxySetupListController *)v24 includedBundleIDs];
                v38 = [v37 objectForKeyedSubscript:v29];
                [v36 setProperty:v38 forKey:@"AppDescription"];

                [v36 setProperty:v29 forKey:v58];
                if ([MEMORY[0x263F1CBA0] bundleIdentifierContainsWebClipIdentifier:v29])
                {
                  v39 = v24;
                  v40 = [MEMORY[0x263F1CBA0] webClipIdentifierFromBundleIdentifier:v29];
                  v41 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:v40];
                  v42 = [MEMORY[0x263F1C920] mainScreen];
                  [v42 scale];
                  v43 = objc_msgSend(v41, "generateIconImageForFormat:scale:", 0);

                  if (v43) {
                    [v36 setProperty:v43 forKey:v54];
                  }

                  v24 = v39;
                  uint64_t v26 = v57;
                }
                else
                {
                  [v36 setProperty:v29 forKey:v56];
                  v40 = [NSNumber numberWithBool:1];
                  [v36 setProperty:v40 forKey:v55];
                }
                uint64_t v25 = v35;

                [v59 addObject:v36];
                unint64_t v27 = 0x263F01000;
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
          }
          while (v25);
        }

        v2 = v24;
        v14 = v51;
        objc_super v5 = v52;
      }
    }
    uint64_t v44 = (int)*MEMORY[0x263F5FDB8];
    v45 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v44);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v44) = (Class)v59;
    id v46 = v59;

    id v47 = *(id *)((char *)&v2->super.super.super.super.super.isa + v44);
  }
  else
  {
    v48 = [(DNSProxySetupListController *)self navigationController];
    id v49 = (id)[v48 popViewControllerAnimated:1];

    id v47 = 0;
  }

  return v47;
}

- (unint64_t)vpnGrade
{
  return self->_vpnGrade;
}

- (void)setVpnGrade:(unint64_t)a3
{
  self->_vpnGrade = a3;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setServiceID:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setAppName:(id)a3
{
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setOrganization:(id)a3
{
}

- (NSDictionary)includedBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setIncludedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedBundleIDs, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end