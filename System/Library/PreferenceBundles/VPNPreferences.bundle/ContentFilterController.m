@interface ContentFilterController
- (ContentFilterController)init;
- (NSMutableArray)perAppSpecifiers;
- (NSMutableArray)systemSpecifiers;
- (NSUUID)serviceID;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setPerAppSpecifiers:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setSystemSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ContentFilterController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:kNotificationVPNConnectionStatusChanged object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"VPNNEConfigurationChangedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)ContentFilterController;
  [(ContentFilterController *)&v5 dealloc];
}

- (ContentFilterController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ContentFilterController;
  v2 = [(ContentFilterController *)&v6 init];
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
  v32[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ContentFilterController *)self setPerAppSpecifiers:v3];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ContentFilterController *)self setSystemSpecifiers:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v6 = +[VPNConnectionStore sharedInstance];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __37__ContentFilterController_specifiers__block_invoke;
  v30[3] = &unk_264C069C0;
  v30[4] = self;
  [v6 iterateContentFilterServicesWithBlock:v30];

  v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  uint64_t v31 = *MEMORY[0x263F600F8];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"CONTENT_FILTER_FOOTER" value:&stru_26E7C6230 table:@"MobileVPN"];
  v32[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [v7 setProperties:v10];

  [v5 addObject:v7];
  v11 = [(ContentFilterController *)self perAppSpecifiers];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263F5FC40];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"APP_CONTENT_FILTER_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v16 = [v13 groupSpecifierWithName:v15];
    [v5 addObject:v16];

    v17 = [(ContentFilterController *)self perAppSpecifiers];
    [v5 addObjectsFromArray:v17];
  }
  v18 = [(ContentFilterController *)self systemSpecifiers];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    v20 = (void *)MEMORY[0x263F5FC40];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"CONTENT_FILTER_GROUP_TITLE" value:&stru_26E7C6230 table:@"MobileVPN"];
    v23 = [v20 groupSpecifierWithName:v22];
    [v5 addObject:v23];

    v24 = [(ContentFilterController *)self systemSpecifiers];
    [v5 addObjectsFromArray:v24];
  }
  uint64_t v25 = (int)*MEMORY[0x263F5FDB8];
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v25) = (Class)v5;
  id v27 = v5;

  id v28 = *(id *)((char *)&self->super.super.super.super.super.isa + v25);
  return v28;
}

uint64_t __37__ContentFilterController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v47[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_super v6 = +[VPNConnectionStore sharedInstance];
  v7 = [v6 connectionWithServiceID:v5 withGrade:a3];

  if (v7)
  {
    v8 = [v7 displayName];
    v9 = +[VPNConnectionStore sharedInstance];
    uint64_t v10 = [v9 organizationForServiceID:v5];

    v11 = +[VPNConnectionStore sharedInstance];
    uint64_t v12 = [v11 isProfileBacked:v5];

    int v13 = [v7 isPerApp];
    v14 = (void *)MEMORY[0x263F5FC40];
    v41 = (void *)v10;
    if (v13)
    {
      v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
      uint64_t v16 = *MEMORY[0x263F60228];
      v47[0] = @"ContentFilterSetupListController";
      uint64_t v17 = *MEMORY[0x263F5FFE0];
      v46[0] = v16;
      v46[1] = v17;
      uint64_t v18 = objc_opt_class();
      v46[2] = *MEMORY[0x263F60080];
      v47[1] = v18;
      v47[2] = @"ContentFilterSetupListController";
      uint64_t v19 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      [v15 setProperties:v19];

      v44[0] = @"vpn-service-id";
      v38 = [v7 serviceID];
      v45[0] = v38;
      v44[1] = @"vpn-user-created";
      v40 = v8;
      [NSNumber numberWithInteger:0];
      v20 = uint64_t v39 = a1;
      v45[1] = v20;
      v45[2] = v10;
      v44[2] = @"vpn-organization";
      v44[3] = @"vpn-status";
      v21 = [v7 statusText];
      v45[3] = v21;
      v44[4] = @"vpn-status-value";
      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v45[4] = v22;
      v44[5] = @"service-grade";
      v23 = [NSNumber numberWithUnsignedInteger:a3];
      v45[5] = v23;
      v44[6] = @"overview-mode";
      v24 = [NSNumber numberWithBool:1];
      v45[6] = v24;
      v44[7] = @"vpn-profile-backed";
      uint64_t v25 = [NSNumber numberWithBool:v12];
      v45[7] = v25;
      v26 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:8];
      [v15 setUserInfo:v26];

      v8 = v40;
      id v27 = v41;

      [v15 setProperty:&unk_26E7CB9D0 forKey:*MEMORY[0x263F600A8]];
      id v28 = [*(id *)(v39 + 32) perAppSpecifiers];
      [v28 addObject:v15];
    }
    else
    {
      v29 = [v7 displayName];
      v15 = [v14 preferenceSpecifierNamed:v29 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

      [v15 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      v42[0] = @"vpn-service-id";
      v30 = [v7 serviceID];
      v43[0] = v30;
      v43[1] = v10;
      v42[1] = @"vpn-organization";
      v42[2] = @"vpn-status";
      uint64_t v31 = [v7 statusText];
      v43[2] = v31;
      v42[3] = @"vpn-status-value";
      v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v43[3] = v32;
      v42[4] = @"service-grade";
      v33 = [NSNumber numberWithUnsignedInteger:a3];
      v43[4] = v33;
      v34 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
      [v15 setUserInfo:v34];

      v35 = [MEMORY[0x263F5FAB0] settingsIconCache];
      id v28 = [v35 imageForKey:*MEMORY[0x263F5FEA0]];

      if (v28) {
        [v15 setProperty:v28 forKey:*MEMORY[0x263F60140]];
      }
      v36 = [*(id *)(a1 + 32) systemSpecifiers];
      [v36 addObject:v15];

      id v27 = v41;
    }
  }
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ContentFilterController;
  [(ContentFilterController *)&v4 tableView:a3 didSelectRowAtIndexPath:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ContentFilterController;
  id v6 = a4;
  v7 = [(ContentFilterController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[ContentFilterController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  uint64_t v10 = [v9 userInfo];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v10 objectForKey:@"vpn-organization"];
    [v7 setSubtitle:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 objectForKey:@"vpn-status"];
    [v7 setVpnPrimaryTableCellStatus:v12];
  }

  return v7;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setServiceID:(id)a3
{
}

- (NSMutableArray)perAppSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setPerAppSpecifiers:(id)a3
{
}

- (NSMutableArray)systemSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setSystemSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSpecifiers, 0);
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);

  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end