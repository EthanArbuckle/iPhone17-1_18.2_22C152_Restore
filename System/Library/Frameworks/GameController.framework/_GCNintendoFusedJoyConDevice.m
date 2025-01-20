@interface _GCNintendoFusedJoyConDevice
+ (id)identifierForFusedJoyConDeviceWithLeftDevice:(id)a3 rightDevice:(id)a4;
- (GCDeviceBattery)battery;
- (NSObject)identifier;
- (NSSet)components;
- (NSSet)underlyingDevices;
- (_GCDeviceConfiguration)configuration;
- (_GCDeviceManager)manager;
- (_GCDriverClientHapticInterface)hapticDriver;
- (_GCGamepadEventSourceDescription)gamepadEventSource;
- (_GCNintendoFusedJoyConDevice)init;
- (_GCNintendoFusedJoyConDevice)initWithLeft:(id)a3 right:(id)a4 manager:(id)a5;
- (_GCNintendoJoyConDevice)leftDevice;
- (_GCNintendoJoyConDevice)rightDevice;
- (id)deviceBatteryComponentBatteryUpdatedHandler;
- (id)deviceBatteryServiceConnectedHandler;
- (id)makeControllerForClient:(id)a3;
- (id)persistentIdentifierForSettings;
- (id)propertyForKey:(id)a3;
- (int64_t)indicatedPlayerIndex;
- (void)_addClient:(id)a3;
- (void)_propagateBattery;
- (void)_refreshBattery;
- (void)_removeClient:(id)a3;
- (void)activateLogical;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4;
- (void)setConfiguration:(id)a3;
- (void)setIndicatedPlayerIndex:(int64_t)a3;
- (void)settingsDidChange;
@end

@implementation _GCNintendoFusedJoyConDevice

- (_GCNintendoFusedJoyConDevice)initWithLeft:(id)a3 right:(id)a4 manager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)_GCNintendoFusedJoyConDevice;
  v12 = [(_GCNintendoFusedJoyConDevice *)&v42 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_manager, v11);
    uint64_t v14 = [(id)objc_opt_class() identifierForFusedJoyConDeviceWithLeftDevice:v9 rightDevice:v10];
    identifier = v13->_identifier;
    v13->_identifier = v14;

    objc_storeStrong((id *)&v13->_leftDevice, a3);
    objc_storeStrong((id *)&v13->_rightDevice, a4);
    uint64_t v16 = +[NSMapTable strongToStrongObjectsMapTable];
    clients = v13->_clients;
    v13->_clients = (NSMapTable *)v16;

    v13->_indicatedPlayerIndex = -1;
    uint64_t v18 = +[NSMapTable strongToStrongObjectsMapTable];
    clientPlayerIndicatorEndpoints = v13->_clientPlayerIndicatorEndpoints;
    v13->_clientPlayerIndicatorEndpoints = (NSMapTable *)v18;

    v20 = [[GCDeviceBattery alloc] initWithLevel:-1 batteryState:0.0];
    battery = v13->_battery;
    v13->_battery = v20;

    uint64_t v22 = +[NSMapTable strongToStrongObjectsMapTable];
    clientBatteryEndpoints = v13->_clientBatteryEndpoints;
    v13->_clientBatteryEndpoints = (NSMapTable *)v22;

    objc_initWeak(&location, v13);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke;
    v39[3] = &unk_26D22BF50;
    objc_copyWeak(&v40, &location);
    [(_GCNintendoJoyConDevice *)v13->_leftDevice setDeviceBatteryComponentBatteryUpdatedHandler:v39];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke_2;
    v37[3] = &unk_26D22BF50;
    objc_copyWeak(&v38, &location);
    [(_GCNintendoJoyConDevice *)v13->_rightDevice setDeviceBatteryComponentBatteryUpdatedHandler:v37];
    uint64_t v24 = objc_opt_class();
    v25 = loadNSDictionaryFromJSON(v24, @"JoyConFusedHapticCapabilityGraph");
    v26 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v25];
    hapticCapabilityGraph = v13->_hapticCapabilityGraph;
    v13->_hapticCapabilityGraph = v26;

    v28 = [[_GCNintendoFusedJoyConHapticDriver alloc] initWithDevice:v13];
    hapticDriver = v13->_hapticDriver;
    v13->_hapticDriver = (_GCDriverClientHapticInterface *)v28;

    uint64_t v30 = +[NSMapTable strongToStrongObjectsMapTable];
    clientSettingsEndpoints = v13->_clientSettingsEndpoints;
    v13->_clientSettingsEndpoints = (NSMapTable *)v30;

    uint64_t v32 = GCLookupService();
    settingsStore = v13->_settingsStore;
    v13->_settingsStore = (GCSSettingsStoreService *)v32;

    v34 = [(GCSSettingsStoreService *)v13->_settingsStore profiles];
    [v34 addObserver:v13 forKeyPath:@"values" options:5 context:0];

    v35 = [(GCSSettingsStoreService *)v13->_settingsStore games];
    [v35 addObserver:v13 forKeyPath:@"values" options:5 context:0];

    if (([(GCSSettingsStoreService *)v13->_settingsStore showGCPreferencesPane] & 1) == 0) {
      [(GCSSettingsStoreService *)v13->_settingsStore setShowGCPreferencesPane:1];
    }

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (_GCNintendoFusedJoyConDevice)init
{
  return 0;
}

- (void)dealloc
{
  settingsStore = self->_settingsStore;
  if (settingsStore)
  {
    v4 = [(GCSSettingsStoreService *)settingsStore profiles];
    [v4 removeObserver:self forKeyPath:@"values" context:0];

    v5 = [(GCSSettingsStoreService *)self->_settingsStore games];
    [v5 removeObserver:self forKeyPath:@"values" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)_GCNintendoFusedJoyConDevice;
  [(_GCNintendoFusedJoyConDevice *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"values"])
  {
    [(_GCNintendoFusedJoyConDevice *)self settingsDidChange];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCNintendoFusedJoyConDevice;
    [(_GCNintendoFusedJoyConDevice *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4
{
  [(_GCNintendoFusedJoyConDevice *)self setIndicatedPlayerIndex:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v6 = [(NSMapTable *)self->_clientPlayerIndicatorEndpoints objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setPlayerIndex:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSSet)components
{
  return +[NSSet setWithObject:self];
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (NSSet)underlyingDevices
{
  rightDevice = self->_rightDevice;
  v6[0] = self->_leftDevice;
  v6[1] = rightDevice;
  v3 = +[NSArray arrayWithObjects:v6 count:2];
  v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (void)activateLogical
{
  [(_GCNintendoJoyConDevice *)self->_leftDevice setInputMode:48];
  rightDevice = self->_rightDevice;

  [(_GCNintendoJoyConDevice *)rightDevice setInputMode:48];
}

+ (id)identifierForFusedJoyConDeviceWithLeftDevice:(id)a3 rightDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)&off_26D2B6E68);
  uint64_t v8 = [v6 identifier];

  uint64_t v9 = [v5 identifier];

  uint64_t v10 = (void *)[v7 initWithFormat:@"FUSED_JOYCONS(L: %@, R: %@)", v8, v9];

  return v10;
}

- (_GCDeviceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (_GCDeviceManager *)WeakRetained;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 80, 1);
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (_GCNintendoJoyConDevice)leftDevice
{
  return self->_leftDevice;
}

- (_GCNintendoJoyConDevice)rightDevice
{
  return self->_rightDevice;
}

- (_GCDriverClientHapticInterface)hapticDriver
{
  return self->_hapticDriver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticDriver, 0);
  objc_storeStrong((id *)&self->_rightDevice, 0);
  objc_storeStrong((id *)&self->_leftDevice, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_hapticCapabilityGraph, 0);
  objc_storeStrong((id *)&self->_clientSettingsEndpoints, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)_addClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (!v6)
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __51___GCNintendoFusedJoyConDevice_Client___addClient___block_invoke;
      v9[3] = &unk_26D22B730;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &from);
      id v7 = [v4 addInvalidationHandler:v9];
      [(NSMapTable *)v5->_clients setObject:v7 forKey:v4];
      if (gc_isInternalBuild())
      {
        uint64_t v8 = getGCLogger();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[_GCNintendoFusedJoyConDevice(Client) _addClient:]();
        }
      }
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v5);
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (v6)
    {
      [(NSMapTable *)v5->_clientPlayerIndicatorEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientBatteryEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientSettingsEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clients removeObjectForKey:v4];
      if (gc_isInternalBuild())
      {
        id v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[_GCNintendoFusedJoyConDevice(Client) _removeClient:]();
        }
      }
    }
  }
  objc_sync_exit(v5);
}

- (id)makeControllerForClient:(id)a3
{
  id v165 = a3;
  v166 = +[NSMutableArray array];
  v3 = [[GCProductInformation alloc] initWithIdentifier:@"ProductInfo"];
  [(GCProductInformation *)v3 setProductCategory:@"Nintendo Switch Joy-Con (L/R)"];
  [(GCProductInformation *)v3 setVendorName:@"Joy-Con (L/R)"];
  id v4 = [[_GCControllerComponentDescription alloc] initWithComponent:v3 bindings:0];
  [v166 addObject:v4];

  id v5 = [(_GCNintendoFusedJoyConDevice *)self gamepadEventSource];
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v168 = 0u;
  memset(v167, 0, sizeof(v167));
  GCExtendedGamepadInitInfoMake(v167);
  for (uint64_t i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v167 + i + 8) = 257;
  BYTE1(v168) = 0;
  BYTE9(v172) = 0;
  id v7 = [(GCExtendedGamepad *)[_GCNintendoSwitchGamepad alloc] initWithIdentifier:@"PhysicalInput" info:v167];
  uint64_t v8 = [_GCControllerComponentDescription alloc];
  v193 = v5;
  uint64_t v9 = +[NSArray arrayWithObjects:&v193 count:1];
  id v10 = [(_GCControllerComponentDescription *)v8 initWithComponent:v7 bindings:v9];

  [v166 addObject:v10];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v167 + j);

  v151 = [(_GCNintendoFusedJoyConDevice *)self gamepadEventSource];
  v164 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
  long long v12 = +[NSSet setWithObject:@"Button Home"];
  [v164 setAliases:v12];

  [v164 setLocalizedName:GCFLOC_SWITCH_BUTTON_HOME];
  long long v13 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
  [v164 setSymbol:v13];

  [v164 setEventPressedValueField:22];
  v163 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.capture"];
  long long v14 = +[NSSet setWithObject:@"Button Share"];
  [v163 setAliases:v14];

  [v163 setLocalizedName:GCFLOC_BUTTON_SHARE];
  v15 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"circle.square");
  [v163 setSymbol:v15];

  [v163 setEventPressedValueField:40];
  v162 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.plus"];
  uint64_t v16 = +[NSSet setWithObject:@"Button Menu"];
  [v162 setAliases:v16];

  [v162 setLocalizedName:GCFLOC_SWITCH_BUTTON_MENU];
  v17 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"plus.circle");
  [v162 setSymbol:v17];

  [v162 setEventPressedValueField:23];
  v161 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.minus"];
  uint64_t v18 = +[NSSet setWithObject:@"Button Options"];
  [v161 setAliases:v18];

  [v161 setLocalizedName:GCFLOC_SWITCH_BUTTON_OPTIONS];
  v19 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"minus.circle");
  [v161 setSymbol:v19];

  [v161 setEventPressedValueField:24];
  v160 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  v20 = +[NSSet setWithObject:@"Button A"];
  [v160 setAliases:v20];

  [v160 setLocalizedName:GCFLOC_SWITCH_BUTTON_A];
  v21 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v160 setSymbol:v21];

  [v160 setEventPressedValueField:4];
  v159 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  uint64_t v22 = +[NSSet setWithObject:@"Button B"];
  [v159 setAliases:v22];

  [v159 setLocalizedName:GCFLOC_SWITCH_BUTTON_B];
  v23 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v159 setSymbol:v23];

  [v159 setEventPressedValueField:5];
  v158 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  uint64_t v24 = +[NSSet setWithObject:@"Button X"];
  [v158 setAliases:v24];

  [v158 setLocalizedName:GCFLOC_SWITCH_BUTTON_X];
  v25 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v158 setSymbol:v25];

  [v158 setEventPressedValueField:6];
  v157 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  v26 = +[NSSet setWithObject:@"Button Y"];
  [v157 setAliases:v26];

  [v157 setLocalizedName:GCFLOC_SWITCH_BUTTON_Y];
  v27 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v157 setSymbol:v27];

  [v157 setEventPressedValueField:7];
  v156 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  v28 = +[NSSet setWithObject:@"Left Shoulder"];
  [v156 setAliases:v28];

  [v156 setLocalizedName:GCFLOC_SWITCH_LEFT_SHOULDER];
  v29 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v156 setSymbol:v29];

  [v156 setEventPressedValueField:8];
  v155 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  uint64_t v30 = +[NSSet setWithObject:@"Right Shoulder"];
  [v155 setAliases:v30];

  [v155 setLocalizedName:GCFLOC_SWITCH_RIGHT_SHOULDER];
  v31 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v155 setSymbol:v31];

  [v155 setEventPressedValueField:9];
  v154 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.zl"];
  uint64_t v32 = +[NSSet setWithObject:@"Left Trigger"];
  [v154 setAliases:v32];

  [v154 setLocalizedName:GCFLOC_SWITCH_LEFT_TRIGGER];
  v33 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zl.rectangle.roundedtop");
  [v154 setSymbol:v33];

  [v154 setEventPressedValueField:18];
  v153 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.zr"];
  v34 = +[NSSet setWithObject:@"Right Trigger"];
  [v153 setAliases:v34];

  [v153 setLocalizedName:GCFLOC_SWITCH_RIGHT_TRIGGER];
  v35 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"zr.rectangle.roundedtop");
  [v153 setSymbol:v35];

  [v153 setEventPressedValueField:19];
  v36 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v37 = +[NSSet setWithObject:@"Direction Pad"];
  [v36 setAliases:v37];

  [v36 setLocalizedName:GCFLOC_SWITCH_DIRECTION_PAD];
  id v38 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v36 setSymbol:v38];

  [v36 setAnalog:0];
  [v36 setEventUpValueField:0];
  [v36 setEventDownValueField:1];
  [v36 setEventLeftValueField:2];
  [v36 setEventRightValueField:3];
  v39 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.left"];
  id v40 = +[NSSet setWithObjects:@"Left Thumbstick", @"Left Thumbstick Button", 0];
  [v39 setAliases:v40];

  [v39 setLocalizedName:GCFLOC_SWITCH_LEFT_THUMBSTICK];
  v41 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick");
  [v39 setSymbol:v41];

  [v39 setAnalog:1];
  [v39 setEventUpValueField:10];
  [v39 setEventDownValueField:11];
  [v39 setEventLeftValueField:12];
  [v39 setEventRightValueField:13];
  [v39 setEventPressedValueField:20];
  objc_super v42 = +[NSSet setWithObject:@"Left Thumbstick"];
  v43 = [v39 localizedName];
  v44 = [v39 symbol];
  v45 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v42, v43, v44, 10);
  v192 = v45;
  v46 = +[NSArray arrayWithObjects:&v192 count:1];
  [v39 setXSources:v46];

  v47 = +[NSSet setWithObject:@"Left Thumbstick"];
  v48 = [v39 localizedName];
  v49 = [v39 symbol];
  v50 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v47, v48, v49, 5);
  v191 = v50;
  v51 = +[NSArray arrayWithObjects:&v191 count:1];
  [v39 setYSources:v51];

  v52 = +[NSSet setWithObject:@"Left Thumbstick"];
  v53 = [v39 localizedName];
  v54 = [v39 symbol];
  v55 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v52, v53, v54, 1);
  v190 = v55;
  v56 = +[NSArray arrayWithObjects:&v190 count:1];
  [v39 setUpSources:v56];

  v57 = +[NSSet setWithObject:@"Left Thumbstick"];
  v58 = [v39 localizedName];
  v59 = [v39 symbol];
  v60 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v57, v58, v59, 2);
  v189 = v60;
  v61 = +[NSArray arrayWithObjects:&v189 count:1];
  [v39 setRightSources:v61];

  v62 = +[NSSet setWithObject:@"Left Thumbstick"];
  v63 = [v39 localizedName];
  v64 = [v39 symbol];
  v65 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v62, v63, v64, 4);
  v188 = v65;
  v66 = +[NSArray arrayWithObjects:&v188 count:1];
  [v39 setDownSources:v66];

  v67 = +[NSSet setWithObject:@"Left Thumbstick"];
  v68 = [v39 localizedName];
  v69 = [v39 symbol];
  v70 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v67, v68, v69, 8);
  v187 = v70;
  v71 = +[NSArray arrayWithObjects:&v187 count:1];
  [v39 setLeftSources:v71];

  v72 = +[NSSet setWithObject:@"Left Thumbstick Button"];
  v73 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l.joystick.press.down");
  v74 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v72, GCFLOC_SWITCH_BUTTON_LEFT_THUMBSTICK, v73);
  v186 = v74;
  v75 = +[NSArray arrayWithObjects:&v186 count:1];
  [v39 setPressedSources:v75];

  v76 = +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:@"stick.right"];
  v77 = +[NSSet setWithObjects:@"Right Thumbstick", @"Right Thumbstick Button", 0];
  [v76 setAliases:v77];

  [v76 setLocalizedName:GCFLOC_SWITCH_RIGHT_THUMBSTICK];
  v78 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick");
  [v76 setSymbol:v78];

  [v76 setAnalog:1];
  [v76 setEventUpValueField:14];
  [v76 setEventDownValueField:15];
  [v76 setEventLeftValueField:16];
  [v76 setEventRightValueField:17];
  [v76 setEventPressedValueField:21];
  v79 = +[NSSet setWithObject:@"Right Thumbstick"];
  v80 = [v76 localizedName];
  v81 = [v76 symbol];
  v82 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v79, v80, v81, 10);
  v185 = v82;
  v83 = +[NSArray arrayWithObjects:&v185 count:1];
  [v76 setXSources:v83];

  v84 = +[NSSet setWithObject:@"Right Thumbstick"];
  v85 = [v76 localizedName];
  v86 = [v76 symbol];
  v87 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v84, v85, v86, 5);
  v184 = v87;
  v88 = +[NSArray arrayWithObjects:&v184 count:1];
  [v76 setYSources:v88];

  v89 = +[NSSet setWithObject:@"Right Thumbstick"];
  v90 = [v76 localizedName];
  v91 = [v76 symbol];
  v92 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v89, v90, v91, 1);
  v183 = v92;
  v93 = +[NSArray arrayWithObjects:&v183 count:1];
  [v76 setUpSources:v93];

  v94 = +[NSSet setWithObject:@"Right Thumbstick"];
  v95 = [v76 localizedName];
  v96 = [v76 symbol];
  v97 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v94, v95, v96, 2);
  v182 = v97;
  v98 = +[NSArray arrayWithObjects:&v182 count:1];
  [v76 setRightSources:v98];

  v99 = +[NSSet setWithObject:@"Right Thumbstick"];
  v100 = [v76 localizedName];
  v101 = [v76 symbol];
  v102 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v99, v100, v101, 4);
  v181 = v102;
  v103 = +[NSArray arrayWithObjects:&v181 count:1];
  [v76 setDownSources:v103];

  v104 = +[NSSet setWithObject:@"Right Thumbstick"];
  v105 = [v76 localizedName];
  v106 = [v76 symbol];
  v107 = unk_26D2ABF3C(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:direction:", v104, v105, v106, 8);
  v180 = v107;
  v108 = +[NSArray arrayWithObjects:&v180 count:1];
  [v76 setLeftSources:v108];

  v109 = +[NSSet setWithObject:@"Right Thumbstick Button"];
  v110 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r.joystick.press.down");
  v111 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v109, GCFLOC_SWITCH_BUTTON_RIGHT_THUMBSTICK, v110);
  v179 = v111;
  v112 = +[NSArray arrayWithObjects:&v179 count:1];
  [v76 setPressedSources:v112];

  v113 = objc_opt_new();
  v178[0] = v164;
  v178[1] = v163;
  v178[2] = v162;
  v178[3] = v161;
  v178[4] = v160;
  v178[5] = v159;
  v178[6] = v158;
  v178[7] = v157;
  v178[8] = v156;
  v178[9] = v155;
  v178[10] = v154;
  v178[11] = v153;
  v178[12] = v36;
  v178[13] = v39;
  v178[14] = v76;
  v114 = +[NSArray arrayWithObjects:v178 count:15];
  [v113 setElements:v114];

  v115 = [_GCControllerInputComponentDescription alloc];
  v177 = v151;
  v116 = +[NSArray arrayWithObjects:&v177 count:1];
  v117 = [(_GCControllerInputComponentDescription *)v115 initWithIdentifier:@"Input" controllerInputs:v113 bindings:v116];

  [v166 addObject:v117];
  v118 = self;
  objc_sync_enter(v118);
  v119 = [(NSMapTable *)v118->_clientPlayerIndicatorEndpoints objectForKey:v165];
  if (!v119)
  {
    v120 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
    v121 = +[NSUUID UUID];
    v119 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v120 initWithIdentifier:v121 initialValue:v118->_indicatedPlayerIndex];

    [(GCPlayerIndicatorXPCProxyServerEndpoint *)v119 setDelegate:v118];
    [(NSMapTable *)v118->_clientPlayerIndicatorEndpoints setObject:v119 forKey:v165];
    v122 = [v165 IPCObjectRegistry];
    [v122 registerIPCObject:v119];
  }
  v123 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v119 receiverDescription];
  [v166 addObject:v123];

  objc_sync_exit(v118);
  v124 = v118;
  objc_sync_enter(v124);
  v125 = [(NSMapTable *)v124->_clientBatteryEndpoints objectForKey:v165];
  if (!v125)
  {
    v126 = [GCBatteryXPCProxyServerEndpoint alloc];
    v127 = +[NSUUID UUID];
    v125 = [(GCBatteryXPCProxyServerEndpoint *)v126 initWithIdentifier:v127 initialValue:v124->_battery];

    [(GCBatteryXPCProxyServerEndpoint *)v125 setDelegate:v124];
    [(NSMapTable *)v124->_clientBatteryEndpoints setObject:v125 forKey:v165];
    v128 = [v165 IPCObjectRegistry];
    [v128 registerIPCObject:v125];
  }
  v129 = [(GCBatteryXPCProxyServerEndpoint *)v125 receiverDescription];
  [v166 addObject:v129];

  objc_sync_exit(v124);
  v130 = [GCHapticCapabilities alloc];
  v131 = [(_GCNintendoJoyConDevice *)v124->_leftDevice hapticEngines];
  v132 = [(_GCNintendoJoyConDevice *)v124->_rightDevice hapticEngines];
  v133 = [v131 arrayByAddingObjectsFromArray:v132];
  v134 = [(GCHapticCapabilities *)v130 initWithIdentifier:@"HapticCapabilities" hapticEnginesInfo:v133 hapticCapabilityGraph:v124->_hapticCapabilityGraph];

  v135 = [[_GCControllerComponentDescription alloc] initWithComponent:v134 bindings:0];
  [v166 addObject:v135];

  v136 = v124;
  objc_sync_enter(v136);
  v137 = [v136[7] objectForKey:v165];
  if (!v137)
  {
    id v138 = v136[6];
    v139 = [v136 persistentIdentifierForSettings];
    v140 = [v165 bundleIdentifier];
    v141 = [v138 profileForPersistentControllerIdentifier:v139 appBundleIdentifier:v140];
    v142 = [v141 anonymizedCopy];

    v143 = [GCSettingsXPCProxyServerEndpoint alloc];
    v144 = +[NSUUID UUID];
    v137 = [(GCSettingsXPCProxyServerEndpoint *)v143 initWithIdentifier:v144 initialValueForProfile:v142];

    [(GCSettingsXPCProxyServerEndpoint *)v137 setDelegate:v136];
    [v136[7] setObject:v137 forKey:v165];
    v145 = [v165 IPCObjectRegistry];
    [v145 registerIPCObject:v137];
  }
  v146 = [(GCSettingsXPCProxyServerEndpoint *)v137 receiverDescription];
  [v166 addObject:v146];

  objc_sync_exit(v136);
  v147 = [_GCControllerDescription alloc];
  v148 = [v136 identifier];
  v149 = [(_GCControllerDescription *)v147 initWithIdentifier:v148 components:v166];

  return v149;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  v3 = [(_GCNintendoJoyConDevice *)self->_leftDevice gamepadEventSource];
  id v4 = [(_GCNintendoJoyConDevice *)self->_rightDevice gamepadEventSource];
  id v5 = [[_GCGamepadEventFusionConfig alloc] initWithSourceCount:2];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:0 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:1 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:2 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:3 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:10 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:11 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:12 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:13 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:8 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:18 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:20 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:24 forSourceAtIndex:0];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:4 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:5 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:6 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:7 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:14 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:15 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:16 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:17 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:9 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:19 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:21 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:22 forSourceAtIndex:1];
  [(_GCGamepadEventFusionConfig *)v5 setPassRule:1 forElement:23 forSourceAtIndex:1];
  id v6 = [_GCGamepadEventFusionDescription alloc];
  v10[0] = v3;
  v10[1] = v4;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  uint64_t v8 = [(_GCGamepadEventFusionDescription *)v6 initWithConfiguration:v5 sources:v7];

  return (_GCGamepadEventSourceDescription *)v8;
}

- (int64_t)indicatedPlayerIndex
{
  return [(_GCNintendoJoyConDevice *)self->_leftDevice indicatedPlayerIndex];
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  -[_GCNintendoJoyConDevice setIndicatedPlayerIndex:](self->_leftDevice, "setIndicatedPlayerIndex:");
  rightDevice = self->_rightDevice;

  [(_GCNintendoJoyConDevice *)rightDevice setIndicatedPlayerIndex:a3];
}

- (id)deviceBatteryComponentBatteryUpdatedHandler
{
  return 0;
}

- (id)deviceBatteryServiceConnectedHandler
{
  return 0;
}

- (void)_refreshBattery
{
  id v10 = [(_GCNintendoJoyConDevice *)self->_leftDevice battery];
  v3 = [(_GCNintendoJoyConDevice *)self->_rightDevice battery];
  battery = self->_battery;
  [v10 batteryLevel];
  float v6 = v5;
  [v3 batteryLevel];
  if (v6 < *(float *)&v7) {
    *(float *)&double v7 = v6;
  }
  [(GCDeviceBattery *)battery _setBatteryLevel:v7];
  uint64_t v8 = [v10 batteryState];
  if (v8 == [v3 batteryState]) {
    uint64_t v9 = [v10 batteryState];
  }
  else {
    uint64_t v9 = -1;
  }
  [(GCDeviceBattery *)self->_battery _setBatteryState:v9];
}

- (void)_propagateBattery
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(NSMapTable *)self->_clientBatteryEndpoints objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setBattery:self->_battery];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (GCDeviceBattery)battery
{
  [(_GCNintendoFusedJoyConDevice *)self _refreshBattery];
  battery = self->_battery;

  return battery;
}

- (void)settingsDidChange
{
  v3 = getGCSettingsLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_INFO, "settingsDidChange", buf, 2u);
  }

  uint64_t v4 = self;
  objc_sync_enter(v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSMapTable *)v4->_clientSettingsEndpoints keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [(NSMapTable *)v4->_clientSettingsEndpoints objectForKey:v9];
        settingsStore = v4->_settingsStore;
        long long v12 = [(_GCNintendoFusedJoyConDevice *)v4 persistentIdentifierForSettings];
        long long v13 = [v9 bundleIdentifier];
        long long v14 = [(GCSSettingsStoreService *)settingsStore profileForPersistentControllerIdentifier:v12 appBundleIdentifier:v13];
        v15 = [v14 anonymizedCopy];

        [v10 setSettingsProfile:v15];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (id)persistentIdentifierForSettings
{
  v3 = [(_GCNintendoFusedJoyConDevice *)self identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(_GCNintendoFusedJoyConDevice *)self identifier];
  }
  else
  {
    uint64_t v5 = &stru_26D27BBB8;
  }

  return v5;
}

@end