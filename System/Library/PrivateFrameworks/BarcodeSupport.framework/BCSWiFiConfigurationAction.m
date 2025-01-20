@interface BCSWiFiConfigurationAction
- (BCSWiFiConfigurationAction)initWithData:(id)a3 codePayload:(id)a4;
- (BOOL)_startAirplaySetupIfNeeded;
- (BOOL)isWiFiAction;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)debugDescriptionExtraInfoDictionary;
- (id)localizedDefaultActionDescription;
- (void)performDefaultAction;
- (void)performDefaultActionWithCompletionHandler:(id)a3;
@end

@implementation BCSWiFiConfigurationAction

- (BCSWiFiConfigurationAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSWiFiConfigurationAction;
  v8 = [(BCSAction *)&v11 initWithData:v6 codePayload:v7];
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)localizedDefaultActionDescription
{
  v2 = [(BCSWiFiConfigurationAction *)self _wiFiConfigurationData];
  v3 = [v2 ssid];

  if ([v3 length])
  {
    v4 = NSString;
    v5 = _BCSLocalizedString(@"Join “%@” Network", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_26D608FC8;
  }

  return v6;
}

- (id)debugDescriptionExtraInfoDictionary
{
  v16[5] = *MEMORY[0x263EF8340];
  v2 = [(BCSWiFiConfigurationAction *)self _wiFiConfigurationData];
  v3 = [v2 ssid];
  v4 = [v2 password];
  int v5 = [v2 isWEP];
  int v6 = [v2 isHidden];
  id v7 = &stru_26D608FC8;
  if (v3) {
    v8 = v3;
  }
  else {
    v8 = &stru_26D608FC8;
  }
  v15[0] = @"ssid";
  v15[1] = @"password";
  if (v4) {
    v9 = v4;
  }
  else {
    v9 = &stru_26D608FC8;
  }
  v16[0] = v8;
  v16[1] = v9;
  v10 = @"false";
  v15[2] = @"isWEP";
  v15[3] = @"isHidden";
  if (v5) {
    objc_super v11 = @"true";
  }
  else {
    objc_super v11 = @"false";
  }
  if (v6) {
    v10 = @"true";
  }
  v16[2] = v11;
  v16[3] = v10;
  v15[4] = @"airplayPlayload";
  int v12 = [v2 hasAirplayPayload];
  if (v12)
  {
    id v7 = [v2 airplayBrokerID];
  }
  v16[4] = v7;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  if (v12) {

  }
  return v13;
}

- (void)performDefaultAction
{
}

- (void)performDefaultActionWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  int v5 = [(BCSWiFiConfigurationAction *)self _wiFiConfigurationData];
  int v6 = [v5 ssid];
  if (![v6 length])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSWiFiConfigurationAction performDefaultActionWithCompletionHandler:]();
    }
    v8 = BCSActionError(0);
    v4[2](v4, v8);
    goto LABEL_20;
  }
  if (![(BCSWiFiConfigurationAction *)self _startAirplaySetupIfNeeded])
  {
    v8 = [v5 password];
    uint64_t v9 = [v5 isWEP];
    uint64_t v10 = [v8 length];
    id v11 = objc_alloc((Class)getNEHotspotConfigurationClass());
    if (v10) {
      uint64_t v12 = [v11 initWithSSID:v6 passphrase:v8 isWEP:v9];
    }
    else {
      uint64_t v12 = [v11 initWithSSID:v6];
    }
    v13 = (void *)v12;
    if ([v5 isHidden]) {
      [v13 setHidden:1];
    }
    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSWiFiConfigurationAction: applying wifi configuration", buf, 2u);
      }
      v14 = [getNEHotspotConfigurationManagerClass() sharedManager];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke;
      v17[3] = &unk_26468B388;
      v18 = v4;
      [v14 applyConfiguration:v13 completionHandler:v17];

      v15 = +[BCSAWDLogger sharedLogger];
      [v15 logBarcodeActivatedEventForAction:self];

      v16 = v18;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSWiFiConfigurationAction performDefaultActionWithCompletionHandler:]();
      }
      v16 = BCSActionError(0);
      v4[2](v4, v16);
    }

LABEL_20:
    goto LABEL_21;
  }
  id v7 = +[BCSAWDLogger sharedLogger];
  [v7 logBarcodeActivatedEventForAction:self];

  v4[2](v4, 0);
LABEL_21:
}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!v3 || [v3 code] == 13 || objc_msgSend(v4, "code") == 7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_2(v4);
    }
    if ([v4 code] == 3 || objc_msgSend(v4, "code") == 2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = 2;
    }
    id v7 = BCSActionError(v6);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
}

- (BOOL)_startAirplaySetupIfNeeded
{
  v2 = [(BCSWiFiConfigurationAction *)self _wiFiConfigurationData];
  if ([v2 hasAirplayPayload] && _bcs_airplayInWifiEnabled())
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    id v3 = (void *)getAPUIAirPlaySetupConfigurationWiFiClass_softClass;
    uint64_t v32 = getAPUIAirPlaySetupConfigurationWiFiClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationWiFiClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke;
      v27 = &unk_26468ACC8;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke((uint64_t)&v24);
      id v3 = (void *)v30[3];
    }
    v4 = v3;
    _Block_object_dispose(&v29, 8);
    id v5 = objc_alloc_init(v4);
    uint64_t v6 = [v2 ssid];
    [v5 setSSID:v6];

    id v7 = [v2 password];
    [v5 setPassphrase:v7];

    v8 = [v2 captivePortalToken];
    [v5 setCaptivePortalBypassToken:v8];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    uint64_t v9 = (void *)getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass;
    uint64_t v32 = getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke;
      v27 = &unk_26468ACC8;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke((uint64_t)&v24);
      uint64_t v9 = (void *)v30[3];
    }
    uint64_t v10 = v9;
    _Block_object_dispose(&v29, 8);
    id v11 = objc_alloc_init(v10);
    uint64_t v12 = [v2 airplayBrokerID];
    [v11 setAuthToken:v12];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v13 = (void *)getAPUIAirPlaySetupConfigurationReceiverClass_softClass;
    uint64_t v32 = getAPUIAirPlaySetupConfigurationReceiverClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationReceiverClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke;
      v27 = &unk_26468ACC8;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke((uint64_t)&v24);
      v13 = (void *)v30[3];
    }
    v14 = v13;
    _Block_object_dispose(&v29, 8);
    id v15 = objc_alloc_init(v14);
    v16 = [v2 airplayBrokerPin];
    [v15 setAuthString:v16];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v17 = (void *)getAPUIAirPlaySetupConfigurationClass_softClass;
    uint64_t v32 = getAPUIAirPlaySetupConfigurationClass_softClass;
    if (!getAPUIAirPlaySetupConfigurationClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupConfigurationClass_block_invoke;
      v27 = &unk_26468ACC8;
      v28 = &v29;
      __getAPUIAirPlaySetupConfigurationClass_block_invoke((uint64_t)&v24);
      v17 = (void *)v30[3];
    }
    v18 = v17;
    _Block_object_dispose(&v29, 8);
    id v19 = objc_alloc_init(v18);
    [v19 setWifi:v5];
    [v19 setBroker:v11];
    [v19 setReceiver:v15];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v20 = (void *)getAPUIAirPlaySetupFlowLauncherClass_softClass;
    uint64_t v32 = getAPUIAirPlaySetupFlowLauncherClass_softClass;
    if (!getAPUIAirPlaySetupFlowLauncherClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getAPUIAirPlaySetupFlowLauncherClass_block_invoke;
      v27 = &unk_26468ACC8;
      v28 = &v29;
      __getAPUIAirPlaySetupFlowLauncherClass_block_invoke((uint64_t)&v24);
      v20 = (void *)v30[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v29, 8);
    char v22 = [v21 launchAirPlayAutomaticSetupFlowWithConfiguration:v19];
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (id)actionPickerItems
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = _BCSLocalizedString(@"Join Network", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v4 = [(BCSWiFiConfigurationAction *)self _wiFiConfigurationData];
  int v5 = [v4 hasAirplayPayload];

  if (v5)
  {
    uint64_t v6 = _BCSLocalizedString(@"Connect TV", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);

    id v3 = (void *)v6;
  }
  id v7 = [(BCSActionPickerItem *)[BCSWiFiConfigurationActionPickerItem alloc] initWithLabel:v3 action:self];
  v8 = [(BCSAction *)self actionIcon];
  [(BCSWiFiConfigurationActionPickerItem *)v7 setIcon:v8];

  v11[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  return v9;
}

- (BOOL)isWiFiAction
{
  return 1;
}

- (id)actionIconSystemImageName
{
  return @"wifi";
}

- (void)performDefaultActionWithCompletionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationAction: Action is either not actionable or -determineActionabilityWithCompletionHandler has not been called", v0, 2u);
}

- (void)performDefaultActionWithCompletionHandler:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationAction: Error creating NEHotspotConfiguration", v0, 2u);
}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSWiFiConfigurationAction: Successfully applied WiFi configuration", v0, 2u);
}

void __72__BCSWiFiConfigurationAction_performDefaultActionWithCompletionHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  id v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSWiFiConfigurationAction: Error applying WiFi configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end