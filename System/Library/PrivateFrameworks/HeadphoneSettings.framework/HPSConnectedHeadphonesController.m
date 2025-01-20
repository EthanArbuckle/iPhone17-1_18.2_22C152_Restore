@interface HPSConnectedHeadphonesController
+ (id)getDeviceIconSymbolString:(unsigned int)a3;
- (BOOL)BOOLFromBluetoothPreferences:(id)a3;
- (BOOL)_BTMAvailable;
- (BOOL)nicknameEnabled;
- (HPSConnectedHeadphonesController)init;
- (id)_BTMPairedDevices;
- (id)connectedHeadphoneInfo;
- (id)getDeviceIcon:(unsigned int)a3;
- (id)topLevelSpecifiers;
- (id)topLevelSpecifiersLegacey;
- (id)topLevelSpecifiersRedesign;
- (void)_BTMAvailable;
- (void)_BTMPairedDevices;
- (void)addTopLevelEntryWithHpDevice:(id)a3;
- (void)dealloc;
- (void)deviceConnectionHandler:(id)a3;
- (void)removeTopLevelEntryWithHpDevice:(id)a3;
- (void)setDeviceChangeHandler:(id)a3;
- (void)topLevelSpecifiersLegacey;
- (void)topLevelSpecifiersRedesign;
- (void)updateTitleBar;
- (void)updateTopLevelEntryWithHpDevice:(id)a3;
@end

@implementation HPSConnectedHeadphonesController

- (HPSConnectedHeadphonesController)init
{
  v13.receiver = self;
  v13.super_class = (Class)HPSConnectedHeadphonesController;
  v2 = [(HPSConnectedHeadphonesController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    id deviceChangeHandler = v2->_deviceChangeHandler;
    v2->_id deviceChangeHandler = 0;

    if (_os_feature_enabled_impl())
    {
      v5 = [MEMORY[0x263F428E8] sharedInstance];
      [v5 addDelegate:v3];
    }
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B900] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B8F8] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B910] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B908] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B940] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v3 selector:sel_deviceConnectionHandler_ name:*MEMORY[0x263F2B8E8] object:0];
  }
  return v3;
}

void __49__HPSConnectedHeadphonesController__BTMAvailable__block_invoke(void *a1)
{
  v2 = [MEMORY[0x263F2B998] sharedInstance];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v2 available];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  v3 = a1[4];
  dispatch_group_leave(v3);
}

void __53__HPSConnectedHeadphonesController__BTMPairedDevices__block_invoke(void *a1)
{
  v2 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v3 = [v2 pairedDevices];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  v6 = a1[4];
  dispatch_group_leave(v6);
}

- (void)setDeviceChangeHandler:(id)a3
{
  id v4 = a3;
  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23D3D5000, v5, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Setting Device Change Handler", v8, 2u);
  }

  v6 = (void *)MEMORY[0x23ED001E0](v4);
  id deviceChangeHandler = self->_deviceChangeHandler;
  self->_id deviceChangeHandler = v6;
}

- (void)deviceConnectionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_23D3D5000, v5, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Notification received: %@", (uint8_t *)&v10, 0xCu);
  }
  id deviceChangeHandler = self->_deviceChangeHandler;
  v8 = sharedBluetoothSettingsLogComponent();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (deviceChangeHandler)
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_23D3D5000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Calling Device Change Handler", (uint8_t *)&v10, 2u);
    }

    (*((void (**)(void))self->_deviceChangeHandler + 2))();
  }
  else
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_23D3D5000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: No Valid Device Change Handler", (uint8_t *)&v10, 2u);
    }
  }
}

- (id)connectedHeadphoneInfo
{
  v2 = [(HPSConnectedHeadphonesController *)self topLevelSpecifiers];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HPSConnectedHeadphonesController_connectedHeadphoneInfo__block_invoke;
  v6[3] = &unk_264E98E48;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

- (id)topLevelSpecifiers
{
  if (_os_feature_enabled_impl()) {
    [(HPSConnectedHeadphonesController *)self topLevelSpecifiersRedesign];
  }
  else {
  uint64_t v3 = [(HPSConnectedHeadphonesController *)self topLevelSpecifiersLegacey];
  }
  return v3;
}

- (id)topLevelSpecifiersRedesign
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v54 = [MEMORY[0x263EFF980] array];
  if (![(HPSConnectedHeadphonesController *)self _BTMAvailable])
  {
    v2 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[HPSConnectedHeadphonesController topLevelSpecifiersLegacey]();
    }
  }
  uint64_t v3 = [(HPSConnectedHeadphonesController *)self _BTMPairedDevices];
  id v4 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  v5 = objc_msgSend(v3, "bs_reduce:block:", v4, &__block_literal_global);

  id obj = [MEMORY[0x263F42950] shared];
  objc_sync_enter(obj);
  v6 = [MEMORY[0x263F42950] shared];
  id v7 = [v6 connectedHeadphones];
  v8 = [v7 allValues];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke_2;
  v77[3] = &unk_264E98E20;
  id v52 = v5;
  id v78 = v52;
  BOOL v9 = objc_msgSend(v8, "bs_map:", v77);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v69 = v9;
  uint64_t v10 = [v69 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v10)
  {
    uint64_t v72 = *(void *)v74;
    uint64_t v60 = *MEMORY[0x263F5FFE0];
    uint64_t v62 = *MEMORY[0x263F60080];
    uint64_t v58 = *MEMORY[0x263F602A0];
    uint64_t v59 = *MEMORY[0x263F60228];
    uint64_t v56 = *MEMORY[0x263F60138];
    uint64_t v57 = *MEMORY[0x263F602D0];
    uint64_t v55 = *MEMORY[0x263F60140];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v74 != v72) {
          objc_enumerationMutation(v69);
        }
        uint64_t v12 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if ([v12 connected]
          && +[HPSProductUtils isAppleHeadphone:v12]
          && ([v12 isTemporaryPaired] & 1) == 0
          && ([v12 isGenuineAirPods] & 1) != 0)
        {
          v71 = [v12 classicDevice];
          v70 = [v71 productName];
          if ([(HPSConnectedHeadphonesController *)self nicknameEnabled])
          {
            uint64_t v13 = [v71 name];

            v70 = (__CFString *)v13;
          }
          v14 = [v71 classicDevice];
          if (v14)
          {
            v15 = [v71 classicDevice];
            int v16 = [v15 magicPaired];

            if (v16)
            {
              uint64_t v17 = [v71 name];

              v70 = (__CFString *)v17;
            }
          }
          v18 = v70;
          if (!v70 || (int v19 = [(__CFString *)v70 isEqualToString:&stru_26F119DA8], v18 = v70, v19))
          {

            v70 = @" ";
          }
          v20 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v70;
            _os_log_impl(&dword_23D3D5000, v20, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device to specifiers: %@", buf, 0xCu);
          }

          id v21 = objc_alloc(MEMORY[0x263EFF9A0]);
          v85[0] = v60;
          v86[0] = objc_opt_class();
          v86[1] = @"BTSPairSetup";
          v85[1] = v62;
          v85[2] = v59;
          v85[3] = v58;
          v86[2] = @"BTSPairController";
          v86[3] = @"PSLinkCell";
          v22 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:4];
          v68 = (void *)[v21 initWithDictionary:v22];

          [v68 setObject:v70 forKey:v57];
          v23 = [v71 btsDevice];
          v24 = [v23 classicDevice];
          if (v24)
          {
            v25 = NSString;
            v26 = [v71 btsDevice];
            v27 = [v26 classicDevice];
            objc_msgSend(v25, "stringWithFormat:", @"%p", v27);
            v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v65 = @"none";
          }

          v28 = NSString;
          v29 = [v71 identifier];
          v67 = [v28 stringWithFormat:@"%@-%@", v29, v65];

          [v68 setObject:v67 forKey:v56];
          [v68 setObject:@"BTSDeviceConfigController" forKey:v62];
          v30 = -[HPSConnectedHeadphonesController getDeviceIcon:](self, "getDeviceIcon:", [v12 productId]);
          [v68 setObject:v30 forKey:v55];

          id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v32 = [v71 btsDevice];

          if (v32)
          {
            v33 = [v71 btsDevice];
            [v31 setObject:v33 forKey:@"bt-device"];
          }
          v34 = [MEMORY[0x263F428D8] deviceKey];
          [v31 setObject:v71 forKey:v34];

          v35 = [v31 objectForKeyedSubscript:@"bt-device"];
          if (v35)
          {
            v64 = [v31 objectForKeyedSubscript:@"bt-device"];
          }
          else
          {
            v64 = @"NIL";
          }

          v36 = [MEMORY[0x263F428D8] deviceKey];
          v37 = [v31 objectForKeyedSubscript:v36];
          if (v37)
          {
            v38 = [MEMORY[0x263F428D8] deviceKey];
            v63 = [v31 objectForKeyedSubscript:v38];
          }
          else
          {
            v63 = @"NIL";
          }

          v39 = [NSString stringWithFormat:@"DEVICE_KEY %@, HPS_DEVICE_KEY: %@, PS_IDENTIFIER %@", v64, v63, v67];
          [v31 setObject:v39 forKey:@"HPS_DeviceInfo"];
          v40 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v70 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
          [v40 setName:v70];
          [v40 setProperties:v68];
          [v40 setUserInfo:v31];
          v41 = [v71 headphoneDevice];
          if (v41)
          {
            v42 = [v71 btsDevice];
            v61 = v42;
            if (v42)
            {

LABEL_41:
              [v54 addObject:v40];
              v47 = sharedBluetoothSettingsLogComponent();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = [v40 debugDescription];
                *(_DWORD *)buf = 138412546;
                v82 = v48;
                __int16 v83 = 2112;
                v84 = v39;
                _os_log_impl(&dword_23D3D5000, v47, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding specifier %@ with connected devices %@", buf, 0x16u);
              }
              goto LABEL_46;
            }
            v61 = 0;
          }
          v43 = [v71 headphoneDevice];
          v44 = (objc_class *)objc_opt_class();
          v45 = NSStringFromClass(v44);
          int v46 = [v45 isEqualToString:@"HeadphoneManager.HeadphoneReplayDevice"];

          if (v41)
          {

            if (v46) {
              goto LABEL_41;
            }
          }
          else if (v46)
          {
            goto LABEL_41;
          }
          v47 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v49 = [v71 debugDescription];
            [(HPSConnectedHeadphonesController *)v49 topLevelSpecifiersRedesign];
          }
LABEL_46:

          continue;
        }
      }
      uint64_t v10 = [v69 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v10);
  }

  objc_sync_exit(obj);
  if ([v54 count])
  {
    v50 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DEVICE_TYPE_GROUP_ID"];
    [v54 insertObject:v50 atIndex:0];
  }
  return v54;
}

- (BOOL)_BTMAvailable
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HPSConnectedHeadphonesController__BTMAvailable__block_invoke;
  block[3] = &unk_264E98E70;
  uint64_t v10 = &v16;
  v11 = &v12;
  uint64_t v3 = v2;
  BOOL v9 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v3, v4);
  if (*((unsigned char *)v13 + 24))
  {
    v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HPSConnectedHeadphonesController _BTMAvailable]();
    }
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

- (id)_BTMPairedDevices
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HPSConnectedHeadphonesController__BTMPairedDevices__block_invoke;
  block[3] = &unk_264E98E70;
  uint64_t v10 = &v16;
  v11 = &v12;
  uint64_t v3 = v2;
  BOOL v9 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v3, v4);
  if (*((unsigned char *)v13 + 24))
  {
    v5 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HPSConnectedHeadphonesController _BTMPairedDevices]();
    }
  }
  id v6 = (id)v17[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

- (void)topLevelSpecifiersLegacey
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D3D5000, v0, v1, "Connected Headphones: Bluetooth Manager not Available", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  id deviceChangeHandler = self->_deviceChangeHandler;
  self->_id deviceChangeHandler = 0;

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HPSConnectedHeadphonesController;
  [(HPSConnectedHeadphonesController *)&v5 dealloc];
}

- (id)topLevelSpecifiersLegacey
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v36 = [MEMORY[0x263EFF980] array];
  v37 = self;
  if (![(HPSConnectedHeadphonesController *)self _BTMAvailable])
  {
    v26 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[HPSConnectedHeadphonesController topLevelSpecifiersLegacey]();
    }
    goto LABEL_29;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [(HPSConnectedHeadphonesController *)self _BTMPairedDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    uint64_t v35 = *MEMORY[0x263F5FFE0];
    uint64_t v34 = *MEMORY[0x263F60080];
    uint64_t v33 = *MEMORY[0x263F60228];
    uint64_t v32 = *MEMORY[0x263F602A0];
    uint64_t v31 = *MEMORY[0x263F602D0];
    unint64_t v7 = 0x264E98000uLL;
    uint64_t v30 = *MEMORY[0x263F60138];
    uint64_t v29 = *MEMORY[0x263F60140];
    v28 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v9 connected]
          && [*(id *)(v7 + 3408) isAppleHeadphone:v9]
          && ([v9 isTemporaryPaired] & 1) == 0
          && [v9 isGenuineAirPods])
        {
          uint64_t v10 = +[BTSDeviceClassic deviceWithDevice:v9];
          v11 = [v10 productName];
          if ([(HPSConnectedHeadphonesController *)v37 nicknameEnabled])
          {
            uint64_t v12 = [v10 name];

            v11 = (__CFString *)v12;
          }
          uint64_t v13 = [v10 classicDevice];
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            char v15 = [v10 classicDevice];
            int v16 = [v15 magicPaired];

            if (v16)
            {
              uint64_t v17 = [v10 name];

              v11 = (__CFString *)v17;
            }
            uint64_t v3 = v28;
          }
          if (!v11 || [(__CFString *)v11 isEqualToString:&stru_26F119DA8])
          {

            v11 = @" ";
          }
          uint64_t v18 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v11;
            _os_log_impl(&dword_23D3D5000, v18, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device to specifiers: %@", buf, 0xCu);
          }

          id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
          v42[0] = v35;
          v43[0] = objc_opt_class();
          v43[1] = @"BTSPairSetup";
          v42[1] = v34;
          v42[2] = v33;
          v42[3] = v32;
          v43[2] = @"BTSPairController";
          v43[3] = @"PSLinkCell";
          v20 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
          id v21 = (void *)[v19 initWithDictionary:v20];

          [v21 setObject:v11 forKey:v31];
          v22 = [v10 identifier];
          [v21 setObject:v22 forKey:v30];

          [v21 setObject:@"BTSDeviceConfigController" forKey:v34];
          v23 = -[HPSConnectedHeadphonesController getDeviceIcon:](v37, "getDeviceIcon:", [v9 productId]);
          [v21 setObject:v23 forKey:v29];

          id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v24 setObject:v10 forKey:@"bt-device"];
          v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:v37 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
          [v25 setName:v11];
          [v25 setProperties:v21];
          [v25 setUserInfo:v24];
          [v36 addObject:v25];

          unint64_t v7 = 0x264E98000;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v5);
  }

  if ([v36 count])
  {
    v26 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DEVICE_TYPE_GROUP_ID"];
    [v36 insertObject:v26 atIndex:0];
LABEL_29:
  }
  return v36;
}

id __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = +[BTSDeviceClassic deviceWithDevice:v5];
  unint64_t v7 = [v5 address];

  [v4 setObject:v6 forKey:v7];
  return v4;
}

id __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 btAddress];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

  id v6 = objc_alloc(MEMORY[0x263F428D8]);
  unint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v8 = (void *)[v6 initWithHeadphoneDevice:v3 btsDevice:v7];

  return v8;
}

void __58__HPSConnectedHeadphonesController_connectedHeadphoneInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a2;
    id v5 = [v4 properties];
    id v6 = [v5 objectForKey:*MEMORY[0x263F602D0]];

    unint64_t v7 = [v4 properties];
    v8 = [v7 objectForKey:*MEMORY[0x263F60138]];

    BOOL v9 = [v4 properties];
    uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F60140]];

    v11 = [[HPSConnectedHeadphoneInfo alloc] initWithID:v8 name:v6 image:v10 specifier:v4];
    uint64_t v12 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(HPSConnectedHeadphoneInfo *)v11 deviceID];
      uint64_t v14 = [(HPSConnectedHeadphoneInfo *)v11 deviceName];
      int v15 = 138412546;
      int v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_23D3D5000, v12, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device, ID: %@, Name: %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) addObject:v11];
  }
}

- (id)getDeviceIcon:(unsigned int)a3
{
  id v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = +[HPSConnectedHeadphonesController getDeviceIconSymbolString:*(void *)&a3];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v3 imageNamed:v4 inBundle:v5];

  return v6;
}

+ (id)getDeviceIconSymbolString:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 - 8194 > 0x24) {
    id v3 = @"beats.headphones";
  }
  else {
    id v3 = off_264E98EB8[a3 - 8194];
  }
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unint64_t v7 = v3;
    _os_log_impl(&dword_23D3D5000, v4, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Icon Name: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)BOOLFromBluetoothPreferences:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  id v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.BTServer", &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (BOOL)nicknameEnabled
{
  return ![(HPSConnectedHeadphonesController *)self BOOLFromBluetoothPreferences:@"nicknamingDisabled"];
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HPSConnectedHeadphonesController_addTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_264E98E98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__HPSConnectedHeadphonesController_addTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceConnectionHandler:0];
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HPSConnectedHeadphonesController_removeTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_264E98E98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__HPSConnectedHeadphonesController_removeTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceConnectionHandler:0];
}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HPSConnectedHeadphonesController_updateTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_264E98E98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__HPSConnectedHeadphonesController_updateTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceConnectionHandler:0];
}

- (void)updateTitleBar
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HPSConnectedHeadphonesController_updateTitleBar__block_invoke;
  block[3] = &unk_264E98E98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__HPSConnectedHeadphonesController_updateTitleBar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceConnectionHandler:0];
}

- (void).cxx_destruct
{
}

- (void)topLevelSpecifiersRedesign
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_23D3D5000, log, OS_LOG_TYPE_ERROR, "Connected Headphones: Refusing to add device without both headphone and btsdevice %@", buf, 0xCu);
}

- (void)_BTMAvailable
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D3D5000, v0, v1, "Connected Headphones: _BTMAvailable call timed out seems like available never returned", v2, v3, v4, v5, v6);
}

- (void)_BTMPairedDevices
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23D3D5000, v0, v1, "Connected Headphones: _pairedDevices call timed out seems like pairedDevices never returned", v2, v3, v4, v5, v6);
}

@end