@interface AXUIVoiceOverDeviceConfigController
- (AXUIBluetoothDevice)device;
- (AXUIVoiceOverDeviceConfigController)init;
- (id)disconnectOnSleep:(id)a3;
- (id)specifiers;
- (int64_t)axDeviceControllerType;
- (void)_allowUSBRM;
- (void)_clearVOUSBRMDisabler;
- (void)_doReallyForgetDevice;
- (void)dealloc;
- (void)deviceConnectedHandler:(id)a3;
- (void)deviceRemoved:(id)a3;
- (void)deviceUpdated:(id)a3;
- (void)forgetDevice:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDisconnectOnSleep:(id)a3 specifier:(id)a4;
@end

@implementation AXUIVoiceOverDeviceConfigController

- (AXUIVoiceOverDeviceConfigController)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverDeviceConfigController;
  v2 = [(AXUISettingsSetupCapableListController *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_deviceRemoved_ name:*MEMORY[0x1E4F49498] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_deviceUpdated_ name:*MEMORY[0x1E4F494A0] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_deviceConnectedHandler_ name:*MEMORY[0x1E4F49490] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_deviceConnectedHandler_ name:*MEMORY[0x1E4F49488] object:0];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F99CB8]) initWithDelegate:v2];
    brailleClient = v2->_brailleClient;
    v2->_brailleClient = (SCROBrailleClient *)v7;

    [(SCROBrailleClient *)v2->_brailleClient setKeepConnectionAlive:1];
    [(SCROBrailleClient *)v2->_brailleClient setDisplayDescriptorCallbackEnabled:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverDeviceConfigController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (void)_doReallyForgetDevice
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_dismissed = 1;
  [(AXUIBluetoothDevice *)self->_device unpair];
  v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    device = self->_device;
    int v7 = 138412290;
    v8 = device;
    _os_log_impl(&dword_1C39D1000, v3, OS_LOG_TYPE_INFO, "Unpair device: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [(AXUIVoiceOverDeviceConfigController *)self navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];
}

- (void)_clearVOUSBRMDisabler
{
  uint64_t v2 = _AXSGetUSBRMDisablers() & 0xFFFFFFFELL;
  MEMORY[0x1F4178FF8](v2);
}

- (void)_allowUSBRM
{
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  [v2 setBoolValue:1 forSetting:*MEMORY[0x1E4F74198]];
}

- (void)forgetDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v4)
  {
    _AXSGetUSBRMDisablers();
LABEL_17:
    [(AXUIVoiceOverDeviceConfigController *)self _doReallyForgetDevice];
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  BOOL v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v33 != v8) {
        objc_enumerationMutation(obj);
      }
      objc_super v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v11 = [v10 objectForKey:*MEMORY[0x1E4F99CC8]];
      uint64_t v12 = [v11 unsignedIntegerValue];

      BOOL v13 = v12 == 4;
      if (v12 == 4) {
        ++v7;
      }
      v14 = [v10 objectForKey:*MEMORY[0x1E4F99CC0]];
      v15 = [(AXUIBluetoothDevice *)self->_device identifier];
      int v16 = [v14 isEqual:v15];

      if (v16) {
        BOOL v6 = v13;
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v5);
  char v17 = _AXSGetUSBRMDisablers();
  if (!v6 || (v17 & 1) == 0 || v7 != 1) {
    goto LABEL_17;
  }
  v18 = (void *)MEMORY[0x1E4FB1418];
  v19 = AXUILocalizedStringForKey(@"BRAILLE_USBRM_QUERY_TITLE");
  v20 = AXLocStringKeyForModel();
  v21 = AXUILocalizedStringForKey(v20);
  v22 = [v18 alertControllerWithTitle:v19 message:v21 preferredStyle:1];

  v23 = (void *)MEMORY[0x1E4FB1410];
  v24 = AXUILocalizedStringForKey(@"BRAILLE_USBRM_TURN_OFF");
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke;
  v31[3] = &unk_1E649C438;
  v31[4] = self;
  v25 = [v23 actionWithTitle:v24 style:0 handler:v31];
  [v22 addAction:v25];

  v26 = (void *)MEMORY[0x1E4FB1410];
  v27 = AXUILocalizedStringForKey(@"BRAILLE_USBRM_ALLOW_CONNECTIONS");
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke_2;
  v30[3] = &unk_1E649C438;
  v30[4] = self;
  v28 = [v26 actionWithTitle:v27 style:0 handler:v30];
  [v22 addAction:v28];

  [(AXUIVoiceOverDeviceConfigController *)self presentViewController:v22 animated:1 completion:0];
LABEL_18:
}

uint64_t __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _allowUSBRM];
  [*(id *)(a1 + 32) _clearVOUSBRMDisabler];
  id v2 = *(void **)(a1 + 32);
  return [v2 _doReallyForgetDevice];
}

uint64_t __52__AXUIVoiceOverDeviceConfigController_forgetDevice___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearVOUSBRMDisabler];
  id v2 = *(void **)(a1 + 32);
  return [v2 _doReallyForgetDevice];
}

- (void)deviceConnectedHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 object];
  uint64_t v7 = [MEMORY[0x1E4F48350] sharedInstance];
  char v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F48350] identifier];
    objc_super v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = AXColorizeFormatLog();
      BOOL v13 = NSStringFromSelector(a2);
      v14 = [v5 name];
      [v6 name];
      v22 = v21 = v14;
      v20 = v13;
      v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_1C39D1000, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  int v16 = objc_msgSend(v6, "identifier", v20, v21, v22);
  char v17 = [(AXUIBluetoothDevice *)self->_device identifier];
  if (![v16 isEqualToString:v17])
  {

LABEL_12:
    goto LABEL_13;
  }
  BOOL dismissed = self->_dismissed;

  if (!dismissed)
  {
    v19 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:3];
    int v16 = v19;
    if (v19)
    {
      [v19 setProperty:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F93130]];
      [(AXUIVoiceOverDeviceConfigController *)self reloadSpecifier:v16];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)deviceUpdated:(id)a3
{
  id v7 = [a3 object];
  uint64_t v4 = [v7 identifier];
  id v5 = [(AXUIBluetoothDevice *)self->_device identifier];
  if ([v4 isEqualToString:v5])
  {
    BOOL dismissed = self->_dismissed;

    if (dismissed) {
      goto LABEL_6;
    }
    uint64_t v4 = [(AXUIBluetoothDevice *)self->_device name];
    [(AXUIVoiceOverDeviceConfigController *)self setTitle:v4];
  }
  else
  {
  }
LABEL_6:
}

- (void)deviceRemoved:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 object];
  id v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    int v10 = 138412546;
    os_log_type_t v11 = v4;
    __int16 v12 = 2112;
    BOOL v13 = device;
    _os_log_impl(&dword_1C39D1000, v5, OS_LOG_TYPE_DEFAULT, "Device removed: %@, current device: %@", (uint8_t *)&v10, 0x16u);
  }

  id v7 = [v4 identifier];
  char v8 = [(AXUIBluetoothDevice *)self->_device identifier];
  if ([v7 isEqualToString:v8])
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed)
    {
      self->_BOOL dismissed = 1;
      [(AXUIVoiceOverDeviceConfigController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
  }
}

- (int64_t)axDeviceControllerType
{
  id v2 = [(AXUIVoiceOverDeviceConfigController *)self specifier];
  v3 = [v2 properties];
  uint64_t v4 = [v3 objectForKey:@"axDeviceControllerType"];
  int64_t v5 = (int)[v4 intValue];

  return v5;
}

- (id)specifiers
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!self->_device)
  {
    buf[0] = 0;
    objc_opt_class();
    v3 = [(AXUIVoiceOverDeviceConfigController *)self specifier];
    uint64_t v4 = [v3 userInfo];
    int64_t v5 = __UIAccessibilityCastAsClass();

    BOOL v6 = [v5 objectForKey:@"bt-device"];
    device = self->_device;
    self->_device = v6;
  }
  char v8 = AXLogBrailleHW();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(AXUIVoiceOverDeviceConfigController *)self specifier];
    int v10 = [(AXUIVoiceOverDeviceConfigController *)self specifier];
    os_log_type_t v11 = [v10 userInfo];
    *(_DWORD *)buf = 138412546;
    v68 = v9;
    __int16 v69 = 2112;
    v70 = v11;
    _os_log_impl(&dword_1C39D1000, v8, OS_LOG_TYPE_DEFAULT, "SPEC: %@ / %@", buf, 0x16u);
  }
  uint64_t v12 = (int)*MEMORY[0x1E4F92F08];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v12))
  {
    uint64_t v65 = (int)*MEMORY[0x1E4F92F08];
    BOOL v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [(AXUIVoiceOverDeviceConfigController *)self loadSpecifiersFromPlistName:@"BluetoothDeviceConfig" target:self bundle:v14];
    int v16 = [v13 arrayWithArray:v15];
    deviceSpecifiers = self->_deviceSpecifiers;
    self->_deviceSpecifiers = v16;

    v18 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:0];
    v19 = AXLocStringKeyForModel();
    v20 = AXUILocalizedStringForKey(v19);
    v64 = v18;
    [v18 setProperty:v20 forKey:*MEMORY[0x1E4F93170]];

    v21 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:1];
    v22 = AXUILocalizedStringForKey(@"DISCONNECT_ON_SLEEP_BRAILLE");
    uint64_t v23 = *MEMORY[0x1E4F93240];
    [v21 setProperty:v22 forKey:*MEMORY[0x1E4F93240]];

    v24 = AXUILocalizedStringForKey(@"DISCONNECT_ON_SLEEP_BRAILLE");
    v63 = v21;
    [v21 setName:v24];

    v61 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
    uint64_t v25 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:3];
    uint64_t v26 = *MEMORY[0x1E4F930C0];
    v66 = [v25 propertyForKey:*MEMORY[0x1E4F930C0]];
    v27 = AXUILocalizedStringForKey(@"FORGET_BUTTON");
    [v25 setProperty:v27 forKey:v23];

    v28 = AXUILocalizedStringForKey(@"FORGET_BUTTON");
    v62 = v25;
    [v25 setName:v28];

    v29 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v30 = [v29 userInterfaceIdiom];

    if (v30 == 1)
    {
      v31 = NSString;
      long long v32 = AXUILocalizedStringForKey(@"FORGET_ALERT_TITLE");
      long long v33 = [(AXUIBluetoothDevice *)self->_device name];
      long long v34 = objc_msgSend(v31, "stringWithFormat:", v32, v33);

      long long v35 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v36 = *MEMORY[0x1E4F930D8];
      uint64_t v37 = AXUILocalizedStringForKey(@"FORGET_ALERT_BODY");
      uint64_t v38 = *MEMORY[0x1E4F930D0];
      v39 = AXUILocalizedStringForKey(@"CANCEL");
      objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v34, v36, v37, v38, v39, *MEMORY[0x1E4F930B0], 0);
    }
    else
    {
      v40 = (void *)MEMORY[0x1E4F1C9E8];
      long long v34 = AXUILocalizedStringForKey(@"FORGET_SHEET_TITLE");
      uint64_t v41 = *MEMORY[0x1E4F930D8];
      uint64_t v37 = AXUILocalizedStringForKey(@"CANCEL");
      uint64_t v42 = *MEMORY[0x1E4F930B0];
      v39 = AXUILocalizedStringForKey(@"OK");
      objc_msgSend(v40, "dictionaryWithObjectsAndKeys:", v34, v41, v37, v42, v39, *MEMORY[0x1E4F930C8], 0);
    v43 = };
    [v66 addEntriesFromDictionary:v43];

    v44 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:3];
    [v44 setProperty:v66 forKey:v26];

    v45 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:3];
    [v45 setupWithDictionary:v66];

    v46 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
    char v47 = objc_opt_respondsToSelector();

    uint64_t v12 = v65;
    if (v47)
    {
      v48 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
      v49 = [v48 detailSpecifiersForDevice:self->_device withTarget:self];

      if ([v49 count]) {
        [v61 addObjectsFromArray:v49];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v50 = (void *)[(NSArray *)self->_deviceSpecifiers mutableCopy];
      if ([(AXUIVoiceOverDeviceConfigController *)self axDeviceControllerType] != 1) {
        objc_msgSend(v50, "removeObjectsInRange:", 0, 2);
      }
      [v61 addObjectsFromArray:v50];
    }
    v51 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_23;
    }
    v52 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
    char v53 = objc_opt_respondsToSelector();

    if (v53)
    {
      v51 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
      if (![v51 bluetoothIsBusy]
        || ([(AXUIBluetoothDevice *)self->_device isBTLEDevice] & 1) != 0)
      {
        goto LABEL_23;
      }
      v54 = [(AXUIVoiceOverDeviceConfigController *)self parentController];
      v55 = [v54 currentSpecifier];
      v56 = [(AXUIVoiceOverDeviceConfigController *)self specifier];

      if (v55 == v56)
      {
        v51 = [(NSArray *)self->_deviceSpecifiers objectAtIndex:3];
        [v51 setProperty:*MEMORY[0x1E4F1CFC8] forKey:*MEMORY[0x1E4F93130]];
LABEL_23:
      }
    }
    v57 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v65);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v65) = (Class)v61;
  }
  v58 = [(AXUIBluetoothDevice *)self->_device name];
  [(AXUIVoiceOverDeviceConfigController *)self setTitle:v58];

  v59 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v12);
  return v59;
}

- (id)disconnectOnSleep:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F49458], "sharedInstance", a3);
  int64_t v5 = [v4 voiceOverBrailleDisconnectOnSleep];
  BOOL v6 = [(AXUIBluetoothDevice *)self->_device address];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    [(SCROBrailleClient *)self->_brailleClient driverConfiguration];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v21 = 0;
      uint64_t v11 = *(void *)v24;
      uint64_t v12 = (void *)MEMORY[0x1E4F99CC0];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "objectForKey:", *v12, v21);
          int v16 = [(AXUIBluetoothDevice *)self->_device identifier];
          int v17 = [v15 isEqual:v16];

          if (v17)
          {
            v18 = [v14 objectForKey:*MEMORY[0x1E4F99CC8]];
            uint64_t v19 = [v18 unsignedIntegerValue];

            if (v19 == 8)
            {
              id v7 = v21;
              id v8 = (id)MEMORY[0x1E4F1CC28];
              goto LABEL_15;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v8 = (id)MEMORY[0x1E4F1CC38];
      id v7 = v21;
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CC38];
    }
LABEL_15:
  }
  return v8;
}

- (void)setDisconnectOnSleep:(id)a3 specifier:(id)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F49458];
  id v6 = a3;
  id v7 = [v5 sharedInstance];
  id v8 = [v7 voiceOverBrailleDisconnectOnSleep];
  id v11 = (id)[v8 mutableCopy];

  if (!v11) {
    id v11 = (id)objc_opt_new();
  }
  uint64_t v9 = [(AXUIBluetoothDevice *)self->_device address];
  [v11 setObject:v6 forKeyedSubscript:v9];

  uint64_t v10 = [MEMORY[0x1E4F49458] sharedInstance];
  [v10 setVoiceOverBrailleDisconnectOnSleep:v11];
}

- (AXUIBluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_brailleClient, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiers, 0);
}

@end