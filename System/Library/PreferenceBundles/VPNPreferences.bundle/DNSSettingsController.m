@interface DNSSettingsController
- (BOOL)hasDNSProxyProhibitDisablement;
- (BOOL)hasDNSSettingsProhibitDisablement;
- (DNSSettingsController)init;
- (NSMutableArray)currentDNSSettingsSpecifiers;
- (NSMutableArray)perAppSpecifiers;
- (NSString)applicationName;
- (NSString)serverName;
- (NSString)typeIdentifier;
- (NSUUID)serviceID;
- (PSSpecifier)automaticDNSSettingsSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)disableAllDNSSettings;
- (void)setApplicationName:(id)a3;
- (void)setAutomaticDNSSettingsSpecifier:(id)a3;
- (void)setCurrentDNSSettingsSpecifiers:(id)a3;
- (void)setHasDNSProxyProhibitDisablement:(BOOL)a3;
- (void)setHasDNSSettingsProhibitDisablement:(BOOL)a3;
- (void)setPerAppSpecifiers:(id)a3;
- (void)setServerName:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)showDNSSettingsPrivacyPage;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleDNSSettingsForSpecifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DNSSettingsController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)DNSSettingsController;
  [(DNSSettingsController *)&v5 dealloc];
}

- (DNSSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DNSSettingsController;
  v2 = [(DNSSettingsController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_someStatusChanged_ name:kNotificationVPNConnectionStatusChanged object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_someConfigurationChanged_ name:@"VPNNEConfigurationChangedNotification" object:0];
  }
  return v2;
}

- (id)specifiers
{
  v49[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(DNSSettingsController *)self setCurrentDNSSettingsSpecifiers:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(DNSSettingsController *)self setPerAppSpecifiers:v5];

  [(DNSSettingsController *)self setHasDNSProxyProhibitDisablement:0];
  [(DNSSettingsController *)self setHasDNSSettingsProhibitDisablement:0];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  v7 = +[VPNConnectionStore sharedInstance];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __35__DNSSettingsController_specifiers__block_invoke;
  v36[3] = &unk_264C06510;
  v36[4] = self;
  v38 = &v44;
  id v8 = v6;
  id v37 = v8;
  v39 = &v40;
  [v7 iterateDNSServicesWithBlock:v36];

  v9 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  uint64_t v48 = *MEMORY[0x263F600F8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"DNS_SETTINGS_FOOTER" value:&stru_26E7C6230 table:@"MobileVPN"];
  v49[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  [v9 setProperties:v12];

  [v3 addObject:v9];
  v13 = [(DNSSettingsController *)self perAppSpecifiers];
  LOBYTE(v11) = [v13 count] == 0;

  if ((v11 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"APP_DNS_PROXY_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v17 = [v14 groupSpecifierWithName:v16];
    [v3 addObject:v17];

    v18 = [(DNSSettingsController *)self perAppSpecifiers];
    [v3 addObjectsFromArray:v18];
  }
  v19 = (void *)MEMORY[0x263F5FC40];
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"DNS_PROXY_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
  v22 = [v19 groupSpecifierWithName:v21];
  [v3 addObject:v22];

  if (*((unsigned char *)v41 + 24))
  {
    v23 = (void *)MEMORY[0x263F5FC40];
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"AUTOMATIC_DNS" value:&stru_26E7C6230 table:@"MobileVPN"];
    v26 = [v23 preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:3 edit:0];

    if (*((unsigned char *)v45 + 24)) {
      v27 = &unk_26E7CB850;
    }
    else {
      v27 = &unk_26E7CB838;
    }
    [v26 setProperty:v27 forKey:*MEMORY[0x263F5FEE8]];
    [v26 setProperty:&unk_26E7CB820 forKey:*MEMORY[0x263F600A8]];
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v26 setProperty:@"Ethernet" forKey:*MEMORY[0x263F5FF28]];
    [v26 setupIconImageWithBundle:v28];
    [(DNSSettingsController *)self setAutomaticDNSSettingsSpecifier:v26];
    v29 = [(DNSSettingsController *)self automaticDNSSettingsSpecifier];
    [v3 addObject:v29];
  }
  v30 = [(DNSSettingsController *)self currentDNSSettingsSpecifiers];
  [v3 addObjectsFromArray:v30];

  v31 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v32 = *v31;
  id *v31 = v3;
  id v33 = v3;

  id v34 = *v31;
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v34;
}

uint64_t __35__DNSSettingsController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v61[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v6 connectionWithServiceID:v5 withGrade:a3];

  if (v7)
  {
    v52 = [v7 displayName];
    id v8 = +[VPNConnectionStore sharedInstance];
    v53 = [v8 organizationForServiceID:v5];

    if ([v7 isPerApp])
    {
      v9 = +[VPNConnectionStore sharedInstance];
      unsigned int v51 = [v9 isProfileBacked:v5];

      v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      uint64_t v11 = *MEMORY[0x263F60228];
      v61[0] = @"DNSProxySetupListController";
      uint64_t v12 = *MEMORY[0x263F5FFE0];
      v60[0] = v11;
      v60[1] = v12;
      uint64_t v13 = objc_opt_class();
      v60[2] = *MEMORY[0x263F60080];
      v61[1] = v13;
      v61[2] = @"DNSProxySetupListController";
      v14 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];
      [v10 setProperties:v14];

      v58[0] = @"vpn-service-id";
      v50 = [v7 serviceID];
      v59[0] = v50;
      v58[1] = @"vpn-user-created";
      v49 = [NSNumber numberWithInteger:0];
      v59[1] = v49;
      v59[2] = v53;
      v58[2] = @"vpn-organization";
      v58[3] = @"vpn-status";
      v15 = [v7 statusText];
      v59[3] = v15;
      v58[4] = @"vpn-status-value";
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v59[4] = v16;
      v58[5] = @"service-grade";
      v17 = [NSNumber numberWithUnsignedInteger:a3];
      v59[5] = v17;
      v58[6] = @"overview-mode";
      [NSNumber numberWithBool:1];
      v19 = id v18 = v5;
      v59[6] = v19;
      v58[7] = @"vpn-profile-backed";
      v20 = [NSNumber numberWithBool:v51];
      v59[7] = v20;
      v21 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:8];
      [v10 setUserInfo:v21];

      id v5 = v18;
      v22 = v10;

      [v10 setProperty:&unk_26E7CB820 forKey:*MEMORY[0x263F600A8]];
      v23 = [*(id *)(a1 + 32) perAppSpecifiers];
      [v23 addObject:v10];
    }
    else
    {
      v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v52 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
      v25 = [v7 serviceID];
      [v24 setProperty:v25 forKey:@"vpn-service-id"];

      v26 = [NSNumber numberWithUnsignedInteger:a3];
      [v24 setProperty:v26 forKey:@"service-grade"];

      [v24 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      if (a3 == 5)
      {
        v56[0] = @"vpn-service-id";
        v27 = [v7 serviceID];
        v57[0] = v27;
        v57[1] = v53;
        v56[1] = @"vpn-organization";
        v56[2] = @"vpn-status";
        v28 = [v7 statusText];
        v57[2] = v28;
        v56[3] = @"vpn-status-value";
        v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
        v57[3] = v29;
        v56[4] = @"service-grade";
        v30 = [NSNumber numberWithUnsignedInteger:5];
        v57[4] = v30;
        [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:5];
        id v32 = v31 = v5;
        [v24 setUserInfo:v32];

        id v5 = v31;
        a3 = 5;
      }
      else
      {
        v54 = @"vpn-organization";
        v55 = v53;
        v27 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        [v24 setUserInfo:v27];
      }

      id v33 = +[VPNConnectionStore sharedInstance];
      uint64_t v34 = a3;
      int v35 = [v33 isEnabledWithServiceID:v5 withGrade:a3];

      if (v35) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      v22 = v24;
      [v24 setProperty:&unk_26E7CB820 forKey:*MEMORY[0x263F600A8]];
      v36 = +[VPNConnectionStore sharedInstance];
      v23 = [v36 optionsForServiceID:v5 withGrade:v34];

      if (!v23) {
        goto LABEL_18;
      }
      char v37 = v35 ^ 1;
      if (v34 != 4) {
        char v37 = 1;
      }
      if ((v37 & 1) == 0)
      {
        v38 = *(void **)(a1 + 40);
        v39 = [v23 objectForKeyedSubscript:@"server"];
        [v38 addObject:v39];
      }
      uint64_t v40 = [v23 objectForKeyedSubscript:@"dnsProhibitDisablement"];
      int v41 = [v40 BOOLValue];

      if (v41)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        if ([v7 status] == 3)
        {
          if (v34 == 5)
          {
            [*(id *)(a1 + 32) setHasDNSProxyProhibitDisablement:1];
          }
          else if (v34 == 4)
          {
            [*(id *)(a1 + 32) setHasDNSSettingsProhibitDisablement:1];
          }
        }
      }
      else
      {
LABEL_18:
        if (v35) {
          uint64_t v42 = &unk_26E7CB838;
        }
        else {
          uint64_t v42 = &unk_26E7CB850;
        }
        [v24 setProperty:v42 forKey:*MEMORY[0x263F5FEE8]];
      }
      char v43 = [v7 bundleID];
      if ([v43 length])
      {
        uint64_t v44 = [NSNumber numberWithBool:1];
        [v22 setProperty:v44 forKey:*MEMORY[0x263F601A8]];

        [v22 setProperty:v43 forKey:*MEMORY[0x263F60188]];
      }
      else
      {
        v45 = [MEMORY[0x263F5FAB0] settingsIconCache];
        uint64_t v46 = [v45 imageForKey:*MEMORY[0x263F5FEA0]];

        if (v46) {
          [v22 setProperty:v46 forKey:*MEMORY[0x263F60140]];
        }
      }
      char v47 = [*(id *)(a1 + 32) currentDNSSettingsSpecifiers];
      [v47 addObject:v22];
    }
  }

  return 1;
}

- (void)showDNSSettingsPrivacyPage
{
  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  v2 = [NSURL URLWithString:@"https://www.apple.com/privacy"];
  [v3 openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)disableAllDNSSettings
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v3 = +[VPNConnectionStore sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DNSSettingsController_disableAllDNSSettings__block_invoke;
  v4[3] = &unk_264C06538;
  v4[4] = &v5;
  [v3 iterateDNSServicesWithBlock:1 iterBlock:v4];

  if (*((unsigned char *)v6 + 24)) {
    [(DNSSettingsController *)self reloadSpecifiers];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __46__DNSSettingsController_disableAllDNSSettings__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[VPNConnectionStore sharedInstance];
  int v7 = [v6 isEnabledWithServiceID:v5 withGrade:a3];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    char v8 = +[VPNConnectionStore sharedInstance];
    [v8 enable:0 serviceID:v5 withGrade:a3];
  }
  return 1;
}

- (void)toggleDNSSettingsForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"vpn-service-id"];
  id v6 = [v4 propertyForKey:@"service-grade"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  char v8 = +[VPNConnectionStore sharedInstance];
  v9 = [v8 optionsForServiceID:v5 withGrade:v7];

  v10 = [v9 objectForKeyedSubscript:@"dnsProhibitDisablement"];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = +[VPNConnectionStore sharedInstance];
    char v13 = [v12 isEnabledWithServiceID:v5 withGrade:v7];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v14 = +[VPNConnectionStore sharedInstance];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __55__DNSSettingsController_toggleDNSSettingsForSpecifier___block_invoke;
    v21 = &unk_264C06560;
    id v15 = v5;
    id v22 = v15;
    v23 = &v24;
    [v14 iterateDNSServicesWithBlock:1 iterBlock:&v18];

    if (v13)
    {
      if (*((unsigned char *)v25 + 24))
      {
        v16 = +[VPNConnectionStore sharedInstance];
        [v16 enable:0 serviceID:v15 withGrade:v7];
LABEL_11:

        [(DNSSettingsController *)self reloadSpecifiers];
      }
LABEL_12:

      _Block_object_dispose(&v24, 8);
      goto LABEL_13;
    }
    if (v7 == 5)
    {
      BOOL v17 = [(DNSSettingsController *)self hasDNSSettingsProhibitDisablement];
    }
    else
    {
      if (v7 != 4) {
        goto LABEL_10;
      }
      BOOL v17 = [(DNSSettingsController *)self hasDNSProxyProhibitDisablement];
    }
    if (v17) {
      goto LABEL_12;
    }
LABEL_10:
    v16 = +[VPNConnectionStore sharedInstance];
    [v16 enable:1 serviceID:v15 withGrade:v7];
    goto LABEL_11;
  }
LABEL_13:
}

uint64_t __55__DNSSettingsController_toggleDNSSettingsForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (([v5 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v6 = +[VPNConnectionStore sharedInstance];
    int v7 = [v6 isEnabledWithServiceID:v5 withGrade:a3];

    if (v7) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }

  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DNSSettingsController *)self indexForIndexPath:v7];
  v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  v10 = [(DNSSettingsController *)self automaticDNSSettingsSpecifier];

  if (v9 == v10)
  {
    [(DNSSettingsController *)self disableAllDNSSettings];
    v16 = self;
    char v13 = &v16;
  }
  else
  {
    char v11 = [(DNSSettingsController *)self currentDNSSettingsSpecifiers];
    int v12 = [v11 containsObject:v9];

    if (v12)
    {
      [(DNSSettingsController *)self toggleDNSSettingsForSpecifier:v9];
      id v15 = self;
      char v13 = &v15;
    }
    else
    {
      v14 = self;
      char v13 = &v14;
    }
  }
  v13[1] = (DNSSettingsController *)DNSSettingsController;
  objc_msgSendSuper2((objc_super *)v13, sel_tableView_didSelectRowAtIndexPath_, v6, v7, v14);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)DNSSettingsController;
  id v6 = a4;
  id v7 = [(DNSSettingsController *)&v22 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[DNSSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v22.receiver, v22.super_class);

  v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  v10 = [(DNSSettingsController *)self automaticDNSSettingsSpecifier];

  if (v9 != v10)
  {
    char v11 = [v9 userInfo];
    int v12 = [v11 objectForKeyedSubscript:@"vpn-organization"];

    if ([v12 length])
    {
      char v13 = [v7 detailTextLabel];
      [v13 setText:v12];
      v14 = [MEMORY[0x263F1C550] _secondaryLabelColor];
      [v13 setColor:v14];
    }
  }
  id v15 = [v9 userInfo];
  v16 = v15;
  if (v15)
  {
    BOOL v17 = [v15 objectForKey:@"service-grade"];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (v18 == 5)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = [v16 objectForKey:@"vpn-organization"];
        [v7 setSubtitle:v19];
      }
      if (objc_opt_respondsToSelector())
      {
        v20 = [v16 objectForKey:@"vpn-status"];
        [v7 setVpnPrimaryTableCellStatus:v20];
      }
    }
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)DNSSettingsController;
  [(DNSSettingsController *)&v17 viewDidAppear:a3];
  id v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/ManagedConfigurationList/DNS"];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];

  id v7 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = (void *)[v7 initWithKey:@"DNS" table:0 locale:v8 bundleURL:v6];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  char v11 = [MEMORY[0x263EFF960] currentLocale];
  int v12 = (void *)[v10 initWithKey:@"General" table:0 locale:v11 bundleURL:v6];

  id v13 = objc_alloc(MEMORY[0x263F08DB0]);
  v14 = [MEMORY[0x263EFF960] currentLocale];
  id v15 = (void *)[v13 initWithKey:@"VPN & Device Management" table:0 locale:v14 bundleURL:v6];

  v18[0] = v12;
  v18[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [(DNSSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.vpn" title:v9 localizedNavigationComponents:v16 deepLink:v4];
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setServiceID:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setServerName:(id)a3
{
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setTypeIdentifier:(id)a3
{
}

- (PSSpecifier)automaticDNSSettingsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setAutomaticDNSSettingsSpecifier:(id)a3
{
}

- (NSMutableArray)currentDNSSettingsSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setCurrentDNSSettingsSpecifiers:(id)a3
{
}

- (NSMutableArray)perAppSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setPerAppSpecifiers:(id)a3
{
}

- (BOOL)hasDNSProxyProhibitDisablement
{
  return self->_hasDNSProxyProhibitDisablement;
}

- (void)setHasDNSProxyProhibitDisablement:(BOOL)a3
{
  self->_hasDNSProxyProhibitDisablement = a3;
}

- (BOOL)hasDNSSettingsProhibitDisablement
{
  return self->_hasDNSSettingsProhibitDisablement;
}

- (void)setHasDNSSettingsProhibitDisablement:(BOOL)a3
{
  self->_hasDNSSettingsProhibitDisablement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentDNSSettingsSpecifiers, 0);
  objc_storeStrong((id *)&self->_automaticDNSSettingsSpecifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end