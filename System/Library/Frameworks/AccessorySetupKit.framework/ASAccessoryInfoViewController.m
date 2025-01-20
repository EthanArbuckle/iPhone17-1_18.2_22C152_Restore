@interface ASAccessoryInfoViewController
- (ASAccessoryInfoViewController)init;
- (ASAccessoryInfoViewController)initWithDevice:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CGSize)preferredContentSize;
- (id)deviceName:(id)a3;
- (id)isAppAllowed:(id)a3;
- (id)specifiers;
- (id)specifiersForApps:(id)a3;
- (id)specifiersForHeader;
- (void)forgetDevice:(id)a3;
- (void)handleDAEvent:(id)a3;
- (void)linkToBluetooth:(id)a3;
- (void)linkToWiFi:(id)a3;
- (void)openApp:(id)a3;
- (void)setAppAllowed:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASAccessoryInfoViewController

- (ASAccessoryInfoViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASAccessoryInfoViewController;
  v2 = [(ASAccessoryInfoViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_useAsHeader = 0;
    v2->_supportsWAPI = MGGetBoolAnswer();
    v3->_didDismiss = 0;
  }
  return v3;
}

- (ASAccessoryInfoViewController)initWithDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)ASAccessoryInfoViewController;
    v6 = [(ASAccessoryInfoViewController *)&v17 init];
    v7 = (DASession *)objc_alloc_init(MEMORY[0x263F397F8]);
    session = v6->_session;
    v6->_session = v7;

    v9 = [v5 appAccessInfoMap];
    v10 = [v9 allKeys];
    v11 = [v10 firstObject];
    [(DASession *)v6->_session setBundleID:v11];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__ASAccessoryInfoViewController_initWithDevice___block_invoke;
    v15[3] = &unk_2651754A0;
    v12 = v6;
    v16 = v12;
    [(DASession *)v6->_session setEventHandler:v15];
    [(DASession *)v6->_session activate];
    objc_storeStrong((id *)&v12->_device, a3);
    v12->_useAsHeader = 1;
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __48__ASAccessoryInfoViewController_initWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDAEvent:a2];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ASAccessoryInfoViewController;
  [(ASAccessoryInfoViewController *)&v3 viewWillAppear:a3];
}

- (CGSize)preferredContentSize
{
  +[ASAccessoryInfoHeaderCell headerHeight];
  double v4 = v3 + 0.0 + 44.0 + 24.0 + 44.0 + 24.0;
  if (!self->_useAsHeader)
  {
    double v5 = v4 + 24.0;
    v6 = [(DADevice *)self->_device appAccessInfoMap];
    double v7 = v5 + (double)(unint64_t)(44 * [v6 count]);

    double v4 = v7 + 100.0 + 24.0 + 44.0;
  }
  double v8 = v4 + 24.0 + 44.0 + 24.0;
  v9 = [(ASAccessoryInfoViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  double v12 = v11;
  double v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  v71[2] = *MEMORY[0x263EF8340];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDC0]);
  if (v2)
  {
    id v3 = v2;
    goto LABEL_24;
  }
  uint64_t v69 = (int)*MEMORY[0x263F5FDC0];
  if (!self->_device)
  {
    double v5 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE90]) propertyForKey:@"device"];
    device = self->_device;
    self->_device = v5;

    double v7 = (DASession *)objc_alloc_init(MEMORY[0x263F397F8]);
    session = self->_session;
    self->_session = v7;

    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __43__ASAccessoryInfoViewController_specifiers__block_invoke;
    v70[3] = &unk_2651754A0;
    v70[4] = self;
    [(DASession *)self->_session setEventHandler:v70];
    [(DASession *)self->_session activate];
  }
  [(ASAccessoryInfoViewController *)self setTitle:0];
  v9 = [MEMORY[0x263EFF980] array];
  double v10 = [(ASAccessoryInfoViewController *)self specifiersForHeader];
  [v9 addObjectsFromArray:v10];

  double v11 = [(objc_class *)getPSSpecifierClass() preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v11 setIdentifier:@"rename"];
  v68 = v11;
  [v9 addObject:v11];
  Class PSSpecifierClass = getPSSpecifierClass();
  double v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"Name" value:&stru_26F86DD88 table:0];
  v15 = [(objc_class *)PSSpecifierClass preferenceSpecifierNamed:v14 target:self set:0 get:sel_deviceName_ detail:objc_opt_class() cell:2 edit:0];

  [v15 setProperty:self->_device forKey:@"device"];
  v16 = [(DADevice *)self->_device appAccessInfoMap];
  objc_super v17 = [v16 allKeys];
  v18 = [v17 firstObject];
  [v15 setProperty:v18 forKey:@"bundleID"];

  v67 = v15;
  [v9 addObject:v15];
  v19 = [(DADevice *)self->_device appAccessInfoMap];
  v20 = [(ASAccessoryInfoViewController *)self specifiersForApps:v19];

  LODWORD(v15) = self->_useAsHeader;
  Class v21 = getPSSpecifierClass();
  Class v22 = v21;
  v66 = v20;
  if (!v15)
  {
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"App Access Header" value:&stru_26F86DD88 table:0];
    v34 = [(objc_class *)v22 preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v34 setIdentifier:@"appAccess"];
    v35 = [(DADevice *)self->_device bluetoothIdentifier];

    if (v35)
    {
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v36 localizedStringForKey:@"App Access Footer Bluetooth" value:&stru_26F86DD88 table:0];

      v37 = [(DADevice *)self->_device SSID];

      if (v37)
      {
        BOOL supportsWAPI = self->_supportsWAPI;
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = v39;
        if (supportsWAPI) {
          v41 = @"App Access Footer Bluetooth And WLAN";
        }
        else {
          v41 = @"App Access Footer Bluetooth And WiFi";
        }
        uint64_t v46 = [v39 localizedStringForKey:v41 value:&stru_26F86DD88 table:0];

        v24 = (void *)v46;
LABEL_21:
        unint64_t v47 = 0x26B9C3000uLL;

        goto LABEL_22;
      }
    }
    else
    {
      v42 = [(DADevice *)self->_device SSID];

      if (v42)
      {
        BOOL v43 = self->_supportsWAPI;
        v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = v44;
        if (v43) {
          v45 = @"App Access Footer WLAN";
        }
        else {
          v45 = @"App Access Footer WiFi";
        }
        v24 = [v44 localizedStringForKey:v45 value:&stru_26F86DD88 table:0];
        goto LABEL_21;
      }
      v24 = 0;
    }
    unint64_t v47 = 0x26B9C3000;
LABEL_22:
    [v34 setObject:v24 forKeyedSubscript:*MEMORY[0x263F60100]];
    [v9 addObject:v34];
    [v9 addObjectsFromArray:v20];
    v29 = [(objc_class *)(*(Class (__cdecl **)())(v47 + 4048))() preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v29 setIdentifier:@"appLink"];
    [v9 addObject:v29];
    v30 = [v20 firstObject];
    v48 = NSString;
    v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v50 = [v49 localizedStringForKey:@"Open App" value:&stru_26F86DD88 table:0];
    [v30 name];
    v65 = v34;
    v52 = unint64_t v51 = v47;
    v64 = objc_msgSend(v48, "stringWithFormat:", v50, v52);

    v53 = [(objc_class *)(*(Class (__cdecl **)())(v51 + 4048))() preferenceSpecifierNamed:v64 target:self set:0 get:0 detail:0 cell:13 edit:0];
    v54 = [v30 propertyForKey:@"bundleID"];
    [v53 setProperty:v54 forKey:@"bundleID"];

    [v53 setButtonAction:sel_openApp_];
    [v9 addObject:v53];
    v55 = [(objc_class *)(*(Class (__cdecl **)())(v51 + 4048))() preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v55 setIdentifier:@"manage"];
    v56 = *(Class (__cdecl **)())(v51 + 4048);
    v23 = v65;
    Class v57 = v56();
    v58 = +[ASAccessoryInfoViewFactory forgetDeviceButtonTitle];
    v59 = [(objc_class *)v57 preferenceSpecifierNamed:v58 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v59 setButtonAction:sel_forgetDevice_];
    v71[0] = v55;
    v71[1] = v59;
    v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    [v9 addObjectsFromArray:v60];

    goto LABEL_23;
  }
  v23 = [(objc_class *)v21 preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v23 setIdentifier:@"appLink"];
  [v9 addObject:v23];
  v24 = [v20 firstObject];
  v25 = NSString;
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"Open App" value:&stru_26F86DD88 table:0];
  v28 = [v24 name];
  v29 = objc_msgSend(v25, "stringWithFormat:", v27, v28);

  v30 = [(objc_class *)getPSSpecifierClass() preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:13 edit:0];
  v31 = [v24 propertyForKey:@"bundleID"];
  [v30 setProperty:v31 forKey:@"bundleID"];

  [v30 setButtonAction:sel_openApp_];
  [v9 addObject:v30];
LABEL_23:

  v61 = (objc_class *)[v9 copy];
  v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v69);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v69) = v61;

  id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v69);
LABEL_24:

  return v3;
}

uint64_t __43__ASAccessoryInfoViewController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDAEvent:a2];
}

- (id)specifiersForHeader
{
  v7[2] = *MEMORY[0x263EF8340];
  id v3 = [(objc_class *)getPSSpecifierClass() preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  double v4 = [(objc_class *)getPSSpecifierClass() preferenceSpecifierNamed:&stru_26F86DD88 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setUserInfo:self->_device];
  [v4 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFD8]];
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600B0]];
  v7[0] = v3;
  v7[1] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)specifiersForApps:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = v3;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *MEMORY[0x263F601A0];
    uint64_t v18 = *(void *)v21;
    uint64_t v16 = *MEMORY[0x263F60190];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v9 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
        double v10 = [v9 localizedName];
        double v11 = [(objc_class *)getPSSpecifierClass() preferenceSpecifierNamed:v10 target:self set:sel_setAppAllowed_specifier_ get:sel_isAppAllowed_ detail:0 cell:6 edit:0];
        double v12 = [NSNumber numberWithBool:1];
        [v11 setProperty:v12 forKey:v17];

        [v11 setProperty:v8 forKey:v16];
        [v11 setProperty:v8 forKey:@"bundleID"];
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  [v4 sortUsingComparator:&__block_literal_global_196];

  return v4;
}

uint64_t __51__ASAccessoryInfoViewController_specifiersForApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)setAppAllowed:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v10 = [a4 propertyForKey:@"bundleID"];
  uint64_t v7 = [(DADevice *)self->_device appAccessInfoMap];
  uint64_t v8 = [v7 objectForKeyedSubscript:v10];

  LODWORD(v7) = [v6 BOOLValue];
  if (v7) {
    uint64_t v9 = 25;
  }
  else {
    uint64_t v9 = 28;
  }
  [v8 setState:v9];
  [(DASession *)self->_session setDeviceAppAccessInfo:v8 device:self->_device completionHandler:&__block_literal_global_198];
}

- (id)deviceName:(id)a3
{
  return (id)[(DADevice *)self->_device name];
}

- (id)isAppAllowed:(id)a3
{
  id v4 = [a3 propertyForKey:@"bundleID"];
  uint64_t v5 = [(DADevice *)self->_device appAccessInfoMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = NSNumber;
  BOOL v8 = [v6 state] == 20 || objc_msgSend(v6, "state") == 25;
  uint64_t v9 = [v7 numberWithInt:v8];

  return v9;
}

- (void)linkToBluetooth:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSURL URLWithString:@"prefs:root=Bluetooth"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)linkToWiFi:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)openApp:(id)a3
{
  id v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  id v6 = [v3 defaultWorkspace];
  uint64_t v5 = [v4 propertyForKey:@"bundleID"];

  [v6 openApplicationWithBundleID:v5];
}

- (void)forgetDevice:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82418];
  uint64_t v5 = +[ASAccessoryInfoViewFactory forgetDeviceAlertTitle];
  id v6 = +[ASAccessoryInfoViewFactory forgetDeviceAlertBody];
  uint64_t v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:0];

  BOOL v8 = (void *)MEMORY[0x263F82400];
  uint64_t v9 = +[ASAccessoryInfoViewFactory forgetDeviceAlertConfirm];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__ASAccessoryInfoViewController_forgetDevice___block_invoke;
  v14[3] = &unk_2651754E8;
  v14[4] = self;
  id v10 = [v8 actionWithTitle:v9 style:2 handler:v14];

  double v11 = (void *)MEMORY[0x263F82400];
  double v12 = +[ASAccessoryInfoViewFactory forgetDeviceAlertCancel];
  double v13 = [v11 actionWithTitle:v12 style:0 handler:0];

  [v7 addAction:v10];
  [v7 addAction:v13];
  [(ASAccessoryInfoViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __46__ASAccessoryInfoViewController_forgetDevice___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F397F8]);
  [v2 setBundleID:@"com.apple.Preferences"];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1392) appAccessInfoMap];
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 firstObject];

  [v5 setState:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1392);
  id v11 = 0;
  [MEMORY[0x263F397F8] setDeviceAppAccessInfo:v5 device:v6 session:v2 error:&v11];
  id v7 = v11;
  if (v7
    && gLogCategory_ASAccessoryInfoView <= 90
    && (gLogCategory_ASAccessoryInfoView != -1 || _LogCategory_Initialize()))
  {
    id v10 = v7;
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1417) = 1;
  BOOL v8 = objc_msgSend(*(id *)(a1 + 32), "navigationController", v10);
  id v9 = (id)[v8 popViewControllerAnimated:1];
}

- (void)handleDAEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 eventType];
  if (v5 == 41)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_didDismiss)
    {
      id v15 = v4;
      id v7 = [(DADevice *)self->_device identifier];
      uint64_t v16 = [v15 device];
      uint64_t v17 = [v16 identifier];
      int v18 = [v17 isEqualToString:v7];

      if (v18)
      {
        self->_didDismiss = 1;
        double v13 = v19;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v14 = __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke_2;
        goto LABEL_10;
      }
LABEL_11:
    }
  }
  else if (v5 == 42)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      id v7 = [(DADevice *)self->_device identifier];
      BOOL v8 = [v6 device];
      id v9 = [v8 identifier];
      int v10 = [v9 isEqualToString:v7];

      if (v10)
      {
        id v11 = [v6 device];
        device = self->_device;
        self->_device = v11;

        double v13 = v20;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v14 = __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke;
LABEL_10:
        v13[2] = v14;
        v13[3] = &unk_2651751B8;
        v13[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v13);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
}

uint64_t __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end