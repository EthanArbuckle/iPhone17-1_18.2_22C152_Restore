@interface WirelessModemBundleController
- (WirelessModemBundleController)initWithParentListController:(id)a3;
- (id)_specifiersWithSpecifierMain:(id)a3;
- (id)getTetheringStatus:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)MISStateChangedNotification:(id)a3;
- (void)dealloc;
- (void)showSetupAlert:(id)a3;
- (void)updateSpecifiersForState:(int)a3 andReason:(int)a4 andButton:(id)a5;
@end

@implementation WirelessModemBundleController

- (WirelessModemBundleController)initWithParentListController:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)WirelessModemBundleController;
  v3 = [(WirelessModemBundleController *)&v33 initWithParentListController:a3];
  if (!v3)
  {
LABEL_28:
    v27 = v3;
    goto LABEL_29;
  }
  if (MGGetBoolAnswer())
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_MISStateChangedNotification_ name:@"MISManagerStateChangedNotification" object:0];

    uint64_t v5 = WiFiManagerClientCreate();
    if (v5)
    {
      v6 = (const void *)v5;
      v3->_wifiTetheringSupported = WiFiManagerClientIsTetheringSupported() != 0;
      CFRelease(v6);
    }
    id v7 = objc_alloc_init(MEMORY[0x263F02D30]);
    v8 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
    id v32 = 0;
    v9 = [v7 getCurrentDataSubscriptionContextSync:&v32];
    id v10 = v32;
    if (v10)
    {
      v11 = v10;
      v12 = WMSLogComponent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemBundleController initWithParentListController:].cold.4();
      }
    }
    id v31 = 0;
    uint64_t v13 = [v7 copyCarrierBundleValue:v9 key:@"CarrierName" bundleType:v8 error:&v31];
    id v14 = v31;
    carrierName = v3->_carrierName;
    v3->_carrierName = (NSString *)v13;

    if (v14)
    {
      v16 = WMSLogComponent();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemBundleController initWithParentListController:]();
      }
    }
    id v30 = 0;
    uint64_t v17 = [v7 copyCarrierBundleValue:v9 key:@"TetheringURL" bundleType:v8 error:&v30];
    id v18 = v30;
    tetheringURL = v3->_tetheringURL;
    v3->_tetheringURL = (NSString *)v17;

    if (v18)
    {
      v20 = WMSLogComponent();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemBundleController initWithParentListController:]();
      }
    }
    id v29 = 0;
    uint64_t v21 = [v7 copyCarrierBundleValue:v9 key:@"TetheringPhoneNumber" bundleType:v8 error:&v29];
    id v22 = v29;
    tetheringPhoneNumber = v3->_tetheringPhoneNumber;
    v3->_tetheringPhoneNumber = (NSString *)v21;

    if (v22)
    {
      v24 = WMSLogComponent();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[WirelessModemBundleController initWithParentListController:]();
      }
    }
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v25 = +[MISManager sharedManager];
      [v25 authenticate];
    }
    else
    {
      dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_0);
    }

    goto LABEL_28;
  }
  v26 = WMSLogComponent();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[WirelessModemBundleController initWithParentListController:].cold.5(v26);
  }

  v27 = 0;
LABEL_29:

  return v27;
}

- (id)specifiersWithSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v5 = [(WirelessModemBundleController *)self _specifiersWithSpecifierMain:v4];
    v6 = (void *)v13[5];
    v13[5] = v5;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__WirelessModemBundleController_specifiersWithSpecifier___block_invoke;
    block[3] = &unk_26506A9D8;
    v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_specifiersWithSpecifierMain:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  specifiers = self->_specifiers;
  self->_specifiers = v4;

  uint64_t v14 = 0;
  v6 = +[MISManager sharedManager];
  [v6 getState:(char *)&v14 + 4 andReason:&v14];

  id v7 = WMSLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(WirelessModemBundleController *)(int *)&v14 + 1 _specifiersWithSpecifierMain:v7];
  }

  v16[0] = @"ph-mis-state";
  v15[0] = @"type";
  v15[1] = @"value";
  if ((HIDWORD(v14) - 1020) > 3) {
    v8 = @"unknown";
  }
  else {
    v8 = off_26506A9F8[HIDWORD(v14) - 1020];
  }
  v16[1] = v8;
  v15[2] = @"context";
  if (v14 > 6) {
    v9 = @"unknown";
  }
  else {
    v9 = off_26506AA18[(int)v14];
  }
  v16[2] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  WMSubmitUIEventMetric(v10);

  if (HIDWORD(v14) != 1020)
  {
    v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F3105F0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v11 setProperty:@"INTERNET_TETHERING" forKey:*MEMORY[0x263F60138]];
    [(WirelessModemBundleController *)self updateSpecifiersForState:HIDWORD(v14) andReason:v14 andButton:v11];
    [(NSMutableArray *)self->_specifiers addObject:v11];
  }
  uint64_t v12 = self->_specifiers;

  return v12;
}

void __62__WirelessModemBundleController_initWithParentListController___block_invoke()
{
  id v0 = +[MISManager sharedManager];
  [v0 authenticate];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(UIAlertController *)self->_tetheringAlert dismissViewControllerAnimated:1 completion:0];
  v4.receiver = self;
  v4.super_class = (Class)WirelessModemBundleController;
  [(WirelessModemBundleController *)&v4 dealloc];
}

- (void)MISStateChangedNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke;
  v6[3] = &unk_26506A988;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"State"];
  uint64_t v4 = [v3 unsignedIntValue];

  id v5 = [*(id *)(a1 + 32) userInfo];
  v6 = [v5 objectForKeyedSubscript:@"Reason"];
  uint64_t v7 = [v6 unsignedIntValue];

  v8 = [*(id *)(a1 + 32) userInfo];
  v9 = [v8 objectForKeyedSubscript:@"PreviousState"];
  int v10 = [v9 unsignedIntValue];

  if (v10 == 1020)
  {
    if (v4 < 0x3FD) {
      return;
    }
    v11 = WMSLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F5FD50]));
    [WeakRetained reloadSpecifiers];
    goto LABEL_14;
  }
  if (v4 != 1020)
  {
    if (![*(id *)(*(void *)(a1 + 40) + 48) count]) {
      goto LABEL_15;
    }
    id v29 = *(id **)(a1 + 40);
    id v30 = [v29[6] objectAtIndexedSubscript:0];
    [v29 updateSpecifiersForState:v4 andReason:v7 andButton:v30];

    id v31 = WMSLogComponent();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_3(v31, v32, v33, v34, v35, v36, v37, v38);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F5FD50]));
    v39 = [*(id *)(*(void *)(a1 + 40) + 48) objectAtIndexedSubscript:0];
    [WeakRetained reloadSpecifier:v39 animated:1];

LABEL_14:
LABEL_15:
    if (v4 >= 0x3FE) {
      [*(id *)(*(void *)(a1 + 40) + 16) dismissViewControllerAnimated:1 completion:0];
    }
    return;
  }
  v20 = WMSLogComponent();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  id v28 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F5FD50]));
  [v28 removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 40) + 48) animated:1];
}

- (void)showSetupAlert:(id)a3
{
  id v4 = a3;
  p_tetheringAlert = (id *)&self->_tetheringAlert;
  if (self->_tetheringAlert) {
    goto LABEL_17;
  }
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"SETUP_ALERT_TITLE" value:&stru_26F3105F0 table:@"WirelessModemSettings"];

  v8 = self->_carrierName;
  tetheringPhoneNumber = self->_tetheringPhoneNumber;
  tetheringURL = self->_tetheringURL;
  v11 = NSString;
  uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = v12;
  id v41 = v4;
  if (tetheringPhoneNumber)
  {
    if (tetheringURL)
    {
      uint64_t v14 = [v12 localizedStringForKey:@"SETUP_ALERT_MESSAGE_ALL_INFO" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
      uint64_t v15 = self->_tetheringPhoneNumber;
      uint64_t v37 = self->_tetheringURL;
    }
    else
    {
      uint64_t v14 = [v12 localizedStringForKey:@"SETUP_ALERT_MESSAGE_NO_URL" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
      uint64_t v15 = self->_tetheringPhoneNumber;
    }
    uint64_t v36 = v15;
    goto LABEL_9;
  }
  if (!tetheringURL)
  {
    uint64_t v14 = [v12 localizedStringForKey:@"SETUP_ALERT_MESSAGE_NO_INFO" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
LABEL_9:
    objc_msgSend(v11, "stringWithFormat:", v14, v8, v36, v37);
    goto LABEL_10;
  }
  uint64_t v14 = [v12 localizedStringForKey:@"SETUP_ALERT_MESSAGE_NO_NUMBER" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  objc_msgSend(v11, "stringWithFormat:", v14, self->_tetheringURL, v36, v37);
  uint64_t v16 = LABEL_10:;
  v39 = v8;

  uint64_t v17 = WMSLogComponent();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    [(WirelessModemBundleController *)v7 showSetupAlert:v17];
  }

  v40 = (void *)v7;
  uint64_t v38 = (void *)v16;
  uint64_t v18 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v16 preferredStyle:1];
  id v19 = *p_tetheringAlert;
  id *p_tetheringAlert = (id)v18;

  v20 = (void *)MEMORY[0x263F82400];
  uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"SETUP_ALERT_WEB_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __48__WirelessModemBundleController_showSetupAlert___block_invoke;
  v43[3] = &unk_26506A9B0;
  v43[4] = self;
  uint64_t v23 = [v20 actionWithTitle:v22 style:0 handler:v43];

  uint64_t v24 = (void *)MEMORY[0x263F82400];
  uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v26 = [v25 localizedStringForKey:@"SETUP_ALERT_CALL_BUTTON" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __48__WirelessModemBundleController_showSetupAlert___block_invoke_62;
  v42[3] = &unk_26506A9B0;
  v42[4] = self;
  uint64_t v27 = [v24 actionWithTitle:v26 style:0 handler:v42];

  id v28 = self->_tetheringURL;
  if (self->_tetheringPhoneNumber) {
    [*p_tetheringAlert addAction:v27];
  }
  if (v28) {
    [*p_tetheringAlert addAction:v23];
  }
  id v29 = *p_tetheringAlert;
  id v30 = (void *)MEMORY[0x263F82400];
  id v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v32 = [v31 localizedStringForKey:@"CANCEL" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  uint64_t v33 = [v30 actionWithTitle:v32 style:1 handler:0];
  [v29 addAction:v33];

  id v4 = v41;
LABEL_17:
  uint64_t v34 = WMSLogComponent();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[WirelessModemBundleController showSetupAlert:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]));
  [WeakRetained presentViewController:*p_tetheringAlert animated:1 completion:0];
}

uint64_t __48__WirelessModemBundleController_showSetupAlert___block_invoke(uint64_t a1)
{
  v2 = WMSLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__WirelessModemBundleController_showSetupAlert___block_invoke_cold_1();
  }

  v3 = [MEMORY[0x263F82438] sharedApplication];
  id v4 = [NSURL URLWithString:*(void *)(*(void *)(a1 + 32) + 32)];
  [v3 openURL:v4 withCompletionHandler:0];

  return [*(id *)(*(void *)(a1 + 32) + 16) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __48__WirelessModemBundleController_showSetupAlert___block_invoke_62(uint64_t a1)
{
  v2 = WMSLogComponent();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__WirelessModemBundleController_showSetupAlert___block_invoke_62_cold_1();
  }

  v3 = [MEMORY[0x263F82438] sharedApplication];
  id v4 = NSURL;
  id v5 = [NSString stringWithFormat:@"tel:%@", *(void *)(*(void *)(a1 + 32) + 24)];
  v6 = [v4 URLWithString:v5];
  [v3 openURL:v6 withCompletionHandler:0];

  return [*(id *)(*(void *)(a1 + 32) + 16) dismissViewControllerAnimated:1 completion:0];
}

- (id)getTetheringStatus:(id)a3
{
  int v10 = 0;
  v3 = +[MISManager sharedManager];
  [v3 getState:&v10 andReason:0];

  int v4 = v10;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4 == 1023) {
    uint64_t v7 = @"ON";
  }
  else {
    uint64_t v7 = @"OFF";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26F3105F0 table:@"WirelessModemSettings"];

  return v8;
}

- (void)updateSpecifiersForState:(int)a3 andReason:(int)a4 andButton:(id)a5
{
  v20 = (char *)a5;
  uint64_t v7 = *MEMORY[0x263F60020];
  [v20 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60020]];
  uint64_t v8 = *MEMORY[0x263F600A8];
  [v20 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  v9 = v20;
  if (a3 != 1020)
  {
    if (a3 != 1021 || a4 == 2)
    {
      uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"MAIN_SPEC_PROVISIONED" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
      [v20 setName:v13];

      uint64_t v14 = (int *)MEMORY[0x263F5FE10];
      *(void *)&v20[*MEMORY[0x263F5FE10]] = 2;
      *(void *)&v20[*MEMORY[0x263F5FE28]] = sel_getTetheringStatus_;
      *(void *)&v20[*MEMORY[0x263F5FE18]] = objc_opt_class();
      v9 = v20;
      if (a4 == 4
        && (+[MISManager sharedManager],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v15 didUserPreventData],
            v15,
            v9 = v20,
            v16))
      {
        uint64_t v17 = MEMORY[0x263EFFA80];
        uint64_t v18 = v20;
        uint64_t v19 = v8;
      }
      else
      {
        if (a3 != 1021) {
          goto LABEL_13;
        }
        *(void *)&v9[*v14] = 6;
        uint64_t v17 = MEMORY[0x263EFFA88];
        uint64_t v18 = v20;
        uint64_t v19 = v7;
      }
      [v18 setProperty:v17 forKey:v19];
      v9 = v20;
    }
    else
    {
      if (a4 == 4) {
        [v20 setProperty:MEMORY[0x263EFFA80] forKey:v8];
      }
      int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"MAIN_SPEC_UNPROVISIONED" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
      [v20 setName:v11];

      *(void *)&v20[*MEMORY[0x263F5FE10]] = 13;
      [v20 setButtonAction:sel_showSetupAlert_];
      v9 = v20;
      *(void *)&v20[*MEMORY[0x263F5FE28]] = 0;
      *(void *)&v20[*MEMORY[0x263F5FE18]] = 0;
    }
  }
LABEL_13:
}

uint64_t __57__WirelessModemBundleController_specifiersWithSpecifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _specifiersWithSpecifierMain:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_tetheringURL, 0);
  objc_storeStrong((id *)&self->_tetheringPhoneNumber, 0);

  objc_storeStrong((id *)&self->_tetheringAlert, 0);
}

- (void)initWithParentListController:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F3F1000, v0, v1, "Error returned when trying to get tethering phone number: %@", v2, v3, v4, v5, v6);
}

- (void)initWithParentListController:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F3F1000, v0, v1, "Error returned when trying to get tethering URL: %@", v2, v3, v4, v5, v6);
}

- (void)initWithParentListController:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F3F1000, v0, v1, "Error returned when trying to get carrier name: %@", v2, v3, v4, v5, v6);
}

- (void)initWithParentListController:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F3F1000, v0, v1, "Error returned when trying to get current Data Subscription Context: %@", v2, v3, v4, v5, v6);
}

- (void)initWithParentListController:(os_log_t)log .cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23F3F1000, log, OS_LOG_TYPE_ERROR, "Device doesn't have Personal Hotspot!", v1, 2u);
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showSetupAlert:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23F3F1000, v0, v1, "%s: showing tethering alert %@", v2, v3, v4, v5, 2u);
}

- (void)showSetupAlert:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[WirelessModemBundleController showSetupAlert:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_23F3F1000, log, OS_LOG_TYPE_ERROR, "%s: title %@ message %@", (uint8_t *)&v3, 0x20u);
}

void __48__WirelessModemBundleController_showSetupAlert___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23F3F1000, v0, v1, "%s: tapped setup web button, url %@", v2, v3, v4, v5, 2u);
}

void __48__WirelessModemBundleController_showSetupAlert___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23F3F1000, v0, v1, "%s: tapped call button, phone %@", v2, v3, v4, v5, 2u);
}

- (void)_specifiersWithSpecifierMain:(os_log_t)log .cold.1(int *a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_23F3F1000, log, OS_LOG_TYPE_ERROR, "Initial MIS state: %u, reason: %u", (uint8_t *)v5, 0xEu);
}

@end