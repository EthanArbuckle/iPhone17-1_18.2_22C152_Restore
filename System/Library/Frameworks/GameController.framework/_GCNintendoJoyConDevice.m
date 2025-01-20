@interface _GCNintendoJoyConDevice
- ($536A88BB5CAE6CA76785073378A79450)bodyColor;
- ($536A88BB5CAE6CA76785073378A79450)buttonsColor;
- (GCDeviceBattery)battery;
- (GCHapticCapabilityGraph)hapticCapabilityGraph;
- (NSArray)hapticEngines;
- (NSObject)identifier;
- (NSSet)components;
- (NSSet)underlyingDevices;
- (_GCDeviceConfiguration)configuration;
- (_GCDeviceDriverConnection)driverConnection;
- (_GCDeviceManager)manager;
- (_GCGamepadEventSourceDescription)gamepadEventSource;
- (_GCNintendoFusedJoyConDevice)fusionDevice;
- (_GCNintendoJoyConDevice)init;
- (_GCNintendoJoyConDevice)initWithHIDDevice:(id)a3 manager:(id)a4 type:(unsigned __int8)a5;
- (id)deviceBatteryComponentBatteryUpdatedHandler;
- (id)deviceBatteryServiceConnectedHandler;
- (id)hapticDriver;
- (id)makeControllerForClient:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)readBattery;
- (int64_t)indicatedPlayerIndex;
- (unsigned)inputMode;
- (unsigned)type;
- (void)_addClient:(id)a3;
- (void)_removeClient:(id)a3;
- (void)activateLogical;
- (void)homeButtonLongPressGesture:(BOOL)a3;
- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4;
- (void)propagateBattery:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeviceBatteryComponentBatteryUpdatedHandler:(id)a3;
- (void)setDriverConnection:(id)a3;
- (void)setFusionDevice:(id)a3;
- (void)setIndicatedPlayerIndex:(int64_t)a3;
- (void)setInputMode:(unsigned __int8)a3;
- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4;
@end

@implementation _GCNintendoJoyConDevice

- (_GCNintendoJoyConDevice)initWithHIDDevice:(id)a3 manager:(id)a4 type:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_GCNintendoJoyConDevice;
  v11 = [(_GCNintendoJoyConDevice *)&v28 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceInfo, a3);
    objc_storeWeak((id *)&v12->_manager, v10);
    v12->_type = a5;
    uint64_t v13 = [v9 stringPropertyForKey:@"SerialNumber"];
    identifier = v12->_identifier;
    v12->_identifier = v13;

    if (!v12->_identifier)
    {
      uint64_t v15 = +[NSUUID UUID];
      v16 = v12->_identifier;
      v12->_identifier = v15;

      if (gc_isInternalBuild())
      {
        v26 = getGCLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v12->_identifier;
          *(_DWORD *)buf = 138412546;
          id v30 = v9;
          __int16 v31 = 2112;
          v32 = v27;
          _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_DEFAULT, "Could not fetch identifier for service: %@.  Using temporary identifier: %@", buf, 0x16u);
        }
      }
    }
    uint64_t v17 = +[NSMapTable strongToStrongObjectsMapTable];
    clients = v12->_clients;
    v12->_clients = (NSMapTable *)v17;

    v12->_indicatedPlayerIndex = -1;
    uint64_t v19 = +[NSMapTable strongToStrongObjectsMapTable];
    clientPlayerIndicatorEndpoints = v12->_clientPlayerIndicatorEndpoints;
    v12->_clientPlayerIndicatorEndpoints = (NSMapTable *)v19;

    v21 = [[GCDeviceBattery alloc] initWithLevel:-1 batteryState:0.0];
    battery = v12->_battery;
    v12->_battery = v21;

    uint64_t v23 = +[NSMapTable strongToStrongObjectsMapTable];
    clientBatteryEndpoints = v12->_clientBatteryEndpoints;
    v12->_clientBatteryEndpoints = (NSMapTable *)v23;
  }
  return v12;
}

- (_GCNintendoJoyConDevice)init
{
  return 0;
}

- (void)setDriverConnection:(id)a3
{
  id v5 = a3;
  id driverConnectionInvalidationRegistration = self->_driverConnectionInvalidationRegistration;
  self->_id driverConnectionInvalidationRegistration = 0;

  driverConnection = self->_driverConnection;
  self->_driverConnection = 0;

  objc_storeStrong((id *)&self->_driverConnection, a3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke;
  v20[3] = &unk_26D22A8C0;
  v20[4] = self;
  v8 = [v5 addInvalidationHandler:v20];
  id v9 = self->_driverConnectionInvalidationRegistration;
  self->_id driverConnectionInvalidationRegistration = v8;

  objc_initWeak(&location, self);
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2;
  activity_block[3] = &unk_26D22A8E8;
  id v10 = v5;
  id v17 = v10;
  v18 = self;
  _os_activity_initiate(&dword_220998000, "Connect JoyCon Fusion Gesture Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_101;
  v12[3] = &unk_26D22B708;
  id v13 = v10;
  v14 = self;
  id v11 = v10;
  objc_copyWeak(&v15, &location);
  _os_activity_initiate(&dword_220998000, "Connect Battery Service", OS_ACTIVITY_FLAG_DEFAULT, v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (unsigned)inputMode
{
  id v2 = [(GCHIDServiceInfo *)self->_serviceInfo stringPropertyForKey:@"JoyConInputMode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  if (([v2 isEqualToString:@"HID"] & 1) == 0)
  {
    if ([v2 isEqualToString:@"STANDARD-FULL"])
    {
      unsigned __int8 v3 = 48;
      goto LABEL_7;
    }
LABEL_6:
    unsigned __int8 v3 = 0;
    goto LABEL_7;
  }
  unsigned __int8 v3 = 63;
LABEL_7:

  return v3;
}

- (void)setInputMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = (__IOHIDServiceClient *)[(GCHIDServiceInfo *)self->_serviceInfo service];
  if (v3 == 63)
  {
    id v5 = @"HID";
  }
  else if (v3 == 48)
  {
    id v5 = @"STANDARD-FULL";
  }
  else
  {
    v6 = +[NSNumber numberWithUnsignedChar:v3];
    id v5 = [v6 description];
  }
  v7 = v5;

  IOHIDServiceClientSetProperty(v4, @"JoyConInputMode", v7);
}

- ($536A88BB5CAE6CA76785073378A79450)bodyColor
{
  id v2 = [(GCHIDServiceInfo *)self->_serviceInfo dictionaryPropertyForKey:@"JoyConBodyColorInfo"];
  unsigned __int16 v4 = 0;
  unsigned __int8 v5 = 0;
  DecodeJoyConRGBColor(v2, &v4);

  return ($536A88BB5CAE6CA76785073378A79450)(v4 | (v5 << 16));
}

- ($536A88BB5CAE6CA76785073378A79450)buttonsColor
{
  id v2 = [(GCHIDServiceInfo *)self->_serviceInfo dictionaryPropertyForKey:@"JoyConButtonsColorInfo"];
  unsigned __int16 v4 = 0;
  unsigned __int8 v5 = 0;
  DecodeJoyConRGBColor(v2, &v4);

  return ($536A88BB5CAE6CA76785073378A79450)(v4 | (v5 << 16));
}

- (NSSet)components
{
  return +[NSSet setWithObject:self];
}

- (id)propertyForKey:(id)a3
{
  serviceInfo = self->_serviceInfo;
  unsigned __int16 v4 = (__CFString *)a3;
  unsigned __int8 v5 = (void *)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[(GCHIDServiceInfo *)serviceInfo service], v4);

  return v5;
}

- (NSSet)underlyingDevices
{
  return +[NSSet setWithObject:self];
}

- (void)activateLogical
{
}

- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4
{
  [(_GCNintendoJoyConDevice *)self setIndicatedPlayerIndex:a4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(NSMapTable *)self->_clientPlayerIndicatorEndpoints objectEnumerator];
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

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 104, 1);
}

- (_GCDeviceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (_GCDeviceManager *)WeakRetained;
}

- (unsigned)type
{
  return self->_type;
}

- (_GCDeviceDriverConnection)driverConnection
{
  return self->_driverConnection;
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (_GCNintendoFusedJoyConDevice)fusionDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fusionDevice);

  return (_GCNintendoFusedJoyConDevice *)WeakRetained;
}

- (void)setFusionDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fusionDevice);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_batteryServiceServer, 0);
  objc_storeStrong(&self->_batteryComponentBatteryUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);

  objc_destroyWeak((id *)&self->_manager);
}

- (void)_addClient:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (!v6)
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __46___GCNintendoJoyConDevice_Client___addClient___block_invoke;
      v9[3] = &unk_26D22B730;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &from);
      uint64_t v7 = [v4 addInvalidationHandler:v9];
      if (v7)
      {
        [(NSMapTable *)v5->_clients setObject:v7 forKey:v4];
        if (gc_isInternalBuild())
        {
          uint64_t v8 = getGCLogger();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            -[_GCNintendoJoyConDevice(Client) _addClient:]();
          }
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
  unsigned __int8 v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    v6 = [(NSMapTable *)v5->_clients objectForKey:v4];

    if (v6)
    {
      [(NSMapTable *)v5->_clientPlayerIndicatorEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clientBatteryEndpoints removeObjectForKey:v4];
      [(NSMapTable *)v5->_clients removeObjectForKey:v4];
      if (gc_isInternalBuild())
      {
        uint64_t v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[_GCNintendoJoyConDevice(Client) _removeClient:]();
        }
      }
    }
  }
  objc_sync_exit(v5);
}

- (id)makeControllerForClient:(id)a3
{
  id v79 = a3;
  v80 = self;
  -[_GCNintendoJoyConDevice _addClient:](self, "_addClient:");
  v84 = +[NSMutableArray array];
  unsigned __int8 v5 = [[GCProductInformation alloc] initWithIdentifier:@"ProductInfo"];
  v6 = [(GCHIDServiceInfo *)v80->_serviceInfo stringPropertyForKey:@"Product"];
  [(GCProductInformation *)v5 setVendorName:v6];

  int v7 = [(_GCNintendoJoyConDevice *)v80 type];
  if (v7 == 1)
  {
    uint64_t v8 = @"Nintendo Switch Joy-Con (L)";
  }
  else if (v7 == 2)
  {
    uint64_t v8 = @"Nintendo Switch Joy-Con (R)";
  }
  else
  {
    uint64_t v9 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v9 handleFailureInMethod:a2 object:v80 file:@"_GCNintendoJoyConDevice.m" lineNumber:231 description:@"Unexpected type!"];

    uint64_t v8 = @"Nintendo Switch Joy-Con";
  }
  [(GCProductInformation *)v5 setProductCategory:v8];
  id v10 = [(GCProductInformation *)v5 productCategory];
  [(GCProductInformation *)v5 setDetailedProductCategory:v10];

  id v11 = [[_GCControllerComponentDescription alloc] initWithComponent:v5 bindings:0];
  [v84 addObject:v11];

  v82 = [(_GCNintendoJoyConDevice *)v80 gamepadEventSource];
  long long v12 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 4);
  long long v13 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 5);
  long long v14 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 6);
  id v15 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 7);
  v16 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 8);
  id v17 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 9);
  v18 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 23);
  uint64_t v19 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 22);
  v20 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", 0, 1, 2, 3);
  v21 = [_GCDeviceGamepadComponentDescription alloc];
  v76 = v12;
  v77 = v13;
  v88[0] = v12;
  v88[1] = v13;
  v88[2] = v14;
  v88[3] = v15;
  v88[4] = v16;
  v88[5] = v17;
  v88[6] = v18;
  v88[7] = v19;
  v88[8] = v20;
  v22 = +[NSArray arrayWithObjects:v88 count:9];
  v87 = v82;
  uint64_t v23 = +[NSArray arrayWithObjects:&v87 count:1];
  v24 = [(_GCDevicePhysicalInputComponentDescription *)v21 initWithIdentifier:@"PhysicalInput" elements:v22 bindings:v23];

  [v84 addObject:v24];
  v78 = [(_GCNintendoJoyConDevice *)v80 gamepadEventSource];
  v83 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.a"];
  v25 = +[NSSet setWithObject:@"Button A"];
  [v83 setAliases:v25];

  [v83 setLocalizedName:GCFLOC_BUTTON_A];
  v26 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
  [v83 setSymbol:v26];

  [v83 setEventPressedValueField:4];
  v81 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.b"];
  v27 = +[NSSet setWithObject:@"Button B"];
  [v81 setAliases:v27];

  [v81 setLocalizedName:GCFLOC_BUTTON_B];
  objc_super v28 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
  [v81 setSymbol:v28];

  [v81 setEventPressedValueField:5];
  v29 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.x"];
  id v30 = +[NSSet setWithObject:@"Button X"];
  [v29 setAliases:v30];

  [v29 setLocalizedName:GCFLOC_BUTTON_X];
  __int16 v31 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
  [v29 setSymbol:v31];

  [v29 setEventPressedValueField:6];
  v32 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.y"];
  v33 = +[NSSet setWithObject:@"Button Y"];
  [v32 setAliases:v33];

  [v32 setLocalizedName:GCFLOC_BUTTON_Y];
  v34 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
  [v32 setSymbol:v34];

  [v32 setEventPressedValueField:7];
  v35 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.l"];
  v36 = +[NSSet setWithObject:@"Left Shoulder"];
  [v35 setAliases:v36];

  [v35 setLocalizedName:GCFLOC_LEFT_SHOULDER];
  v37 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"l1.rectangle.roundedbottom");
  [v35 setSymbol:v37];

  [v35 setEventPressedValueField:8];
  v38 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.r"];
  v39 = +[NSSet setWithObject:@"Right Shoulder"];
  [v38 setAliases:v39];

  [v38 setLocalizedName:GCFLOC_RIGHT_SHOULDER];
  v40 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"r1.rectangle.roundedbottom");
  [v38 setSymbol:v40];

  [v38 setEventPressedValueField:9];
  v41 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.start"];
  v42 = +[NSSet setWithObject:@"Button Menu"];
  [v41 setAliases:v42];

  [v41 setLocalizedName:GCFLOC_BUTTON_MENU];
  v43 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
  [v41 setSymbol:v43];

  [v41 setEventPressedValueField:23];
  v44 = +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:@"button.home"];
  v45 = +[NSSet setWithObject:@"Button Home"];
  [v44 setAliases:v45];

  [v44 setLocalizedName:GCFLOC_BUTTON_HOME];
  v46 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
  [v44 setSymbol:v46];

  [v44 setEventPressedValueField:22];
  v47 = +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:@"dpad"];
  v48 = +[NSSet setWithObject:@"Direction Pad"];
  [v47 setAliases:v48];

  [v47 setLocalizedName:GCFLOC_DIRECTION_PAD];
  v49 = unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
  [v47 setSymbol:v49];

  [v47 setAnalog:0];
  [v47 setEventUpValueField:0];
  [v47 setEventDownValueField:1];
  [v47 setEventLeftValueField:2];
  [v47 setEventRightValueField:3];
  v50 = objc_opt_new();
  v86[0] = v83;
  v86[1] = v81;
  v86[2] = v29;
  v86[3] = v32;
  v86[4] = v35;
  v86[5] = v38;
  v86[6] = v41;
  v86[7] = v44;
  v86[8] = v47;
  v51 = +[NSArray arrayWithObjects:v86 count:9];
  [v50 setElements:v51];

  v52 = [_GCControllerInputComponentDescription alloc];
  v85 = v78;
  v53 = +[NSArray arrayWithObjects:&v85 count:1];
  v54 = [(_GCControllerInputComponentDescription *)v52 initWithIdentifier:@"Input" controllerInputs:v50 bindings:v53];

  [v84 addObject:v54];
  v55 = v80;
  objc_sync_enter(v55);
  v56 = [(NSMapTable *)v55->_clientPlayerIndicatorEndpoints objectForKey:v79];
  if (!v56)
  {
    v57 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
    v58 = +[NSUUID UUID];
    v56 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v57 initWithIdentifier:v58 initialValue:v55->_indicatedPlayerIndex];

    [(GCPlayerIndicatorXPCProxyServerEndpoint *)v56 setDelegate:v55];
    [(NSMapTable *)v55->_clientPlayerIndicatorEndpoints setObject:v56 forKey:v79];
    v59 = [v79 IPCObjectRegistry];
    [v59 registerIPCObject:v56];
  }
  v60 = [(GCPlayerIndicatorXPCProxyServerEndpoint *)v56 receiverDescription];
  [v84 addObject:v60];

  objc_sync_exit(v55);
  v61 = v55;
  objc_sync_enter(v61);
  v62 = [v61[11] objectForKey:v79];
  if (!v62)
  {
    v63 = [GCBatteryXPCProxyServerEndpoint alloc];
    v64 = +[NSUUID UUID];
    v62 = [(GCBatteryXPCProxyServerEndpoint *)v63 initWithIdentifier:v64 initialValue:v61[10]];

    [(GCBatteryXPCProxyServerEndpoint *)v62 setDelegate:v61];
    [v61[11] setObject:v62 forKey:v79];
    v65 = [v79 IPCObjectRegistry];
    [v65 registerIPCObject:v62];
  }
  v66 = [(GCBatteryXPCProxyServerEndpoint *)v62 receiverDescription];
  [v84 addObject:v66];

  objc_sync_exit(v61);
  v67 = [GCHapticCapabilities alloc];
  v68 = [v61 hapticEngines];
  v69 = [v61 hapticCapabilityGraph];
  v70 = [(GCHapticCapabilities *)v67 initWithIdentifier:@"HapticCapabilities" hapticEnginesInfo:v68 hapticCapabilityGraph:v69];

  v71 = [[_GCControllerComponentDescription alloc] initWithComponent:v70 bindings:0];
  [v84 addObject:v71];

  v72 = [_GCControllerDescription alloc];
  v73 = [v61 identifier];
  v74 = [(_GCControllerDescription *)v72 initWithIdentifier:v73 components:v84];

  return v74;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  uint64_t v3 = objc_alloc_init(_GCCControllerManagerDescription);
  id v4 = [[_GCCControllerHIDServiceInfoDescription alloc] initWithServiceInfo:self->_serviceInfo];
  unsigned __int8 v5 = [[_GCKeyboardEventHIDAdapterDescription alloc] initWithSource:v3 service:v4];
  v6 = [[_GCGamepadEventGamepadHIDAdapterDescription alloc] initWithSource:v3 service:v4];
  int v7 = objc_opt_new();
  [v7 mapUsagePage:12 usage:547 toGamepadElement:22];
  [v7 mapUsagePage:12 usage:516 toGamepadElement:23];
  [v7 mapUsagePage:12 usage:521 toGamepadElement:24];
  [v7 mapUsagePage:12 usage:178 toGamepadElement:40];
  uint64_t v8 = [[_GCGamepadEventKeyboardEventAdapterDescription alloc] initWithConfiguration:v7 source:v5];
  uint64_t v9 = [[_GCGamepadEventFusionConfig alloc] initWithSourceCount:2];
  for (uint64_t i = 0; i != 47; ++i)
  {
    BOOL v12 = ((i - 24) & 0xFFFFFFFFFFFFFFEFLL) != 0 && (i & 0x7FFFFFFFFFFFFFFELL) != 22;
    [(_GCGamepadEventFusionConfig *)v9 setPassRule:1 forElement:i forSourceAtIndex:v12];
  }
  long long v13 = [_GCGamepadEventFusionDescription alloc];
  v17[0] = v8;
  v17[1] = v6;
  long long v14 = +[NSArray arrayWithObjects:v17 count:2];
  id v15 = [(_GCGamepadEventFusionDescription *)v13 initWithConfiguration:v9 sources:v14];

  return (_GCGamepadEventSourceDescription *)v15;
}

- (int64_t)indicatedPlayerIndex
{
  return self->_indicatedPlayerIndex;
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  self->_indicatedPlayerIndex = a3;
  int64_t v3 = a3 + 1;
  if ((unint64_t)(a3 + 1) <= 8)
  {
    id v4 = (__IOHIDServiceClient *)[(GCHIDServiceInfo *)self->_serviceInfo service];
    unsigned int v5 = dword_220A91E08[v3];
    id v17 = @"LED";
    if (v5 >= 3u)
    {
      int v7 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      v6 = [v7 description];
    }
    else
    {
      v6 = off_26D22B778[(char)v5];
    }
    v16[0] = v6;
    if (BYTE1(v5) >= 3u)
    {
      uint64_t v9 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      uint64_t v8 = [v9 description];
    }
    else
    {
      uint64_t v8 = off_26D22B778[SBYTE1(v5)];
    }
    v16[1] = v8;
    if (BYTE2(v5) >= 3u)
    {
      id v11 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      id v10 = [v11 description];
    }
    else
    {
      id v10 = off_26D22B778[SBYTE2(v5)];
    }
    v16[2] = v10;
    if (HIBYTE(v5) >= 3u)
    {
      long long v13 = +[NSNumber numberWithUnsignedChar:](&off_26D2B68C8, "numberWithUnsignedChar:");
      BOOL v12 = [v13 description];
    }
    else
    {
      BOOL v12 = off_26D22B778[SHIBYTE(v5)];
    }
    v16[3] = v12;
    long long v14 = +[NSArray arrayWithObjects:v16 count:4];
    v18 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    IOHIDServiceClientSetProperty(v4, @"JoyConPlayerLights", v15);
  }
}

- (id)deviceBatteryComponentBatteryUpdatedHandler
{
  id v2 = (void *)MEMORY[0x223C6E420](self->_batteryComponentBatteryUpdatedHandler, a2);

  return v2;
}

- (void)setDeviceBatteryComponentBatteryUpdatedHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id batteryComponentBatteryUpdatedHandler = self->_batteryComponentBatteryUpdatedHandler;
  self->_id batteryComponentBatteryUpdatedHandler = v4;
}

- (id)deviceBatteryServiceConnectedHandler
{
  return 0;
}

- (id)readBattery
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  batteryServiceServer = self->_batteryServiceServer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __50___GCNintendoJoyConDevice_Components__readBattery__block_invoke;
  v9[3] = &unk_26D22B758;
  id v11 = &v12;
  unsigned int v5 = v3;
  id v10 = v5;
  [(GCBatteryServiceServerInterface *)batteryServiceServer readBatteryWithReply:v9];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)propagateBattery:(id)a3
{
  id v5 = a3;
  if (![(GCDeviceBattery *)self->_battery isEqual:v5])
  {
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_GCNintendoJoyConDevice(Components) propagateBattery:]((uint64_t)v5, v11);
      }
    }
    objc_storeStrong((id *)&self->_battery, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    dispatch_time_t v6 = [(NSMapTable *)self->_clientBatteryEndpoints objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) setBattery:self->_battery];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if (self->_batteryComponentBatteryUpdatedHandler)
    {
      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = __56___GCNintendoJoyConDevice_Components__propagateBattery___block_invoke;
      v12[3] = &unk_26D22A9D0;
      objc_copyWeak(&v13, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (GCDeviceBattery)battery
{
  return self->_battery;
}

- (NSArray)hapticEngines
{
  int type = self->_type;
  if (type == 2)
  {
    dispatch_semaphore_t v3 = [[GCHapticActuator alloc] initWithLabel:@"JoyCon Right" type:1 index:1];
    uint64_t v7 = v3;
    id v4 = &v7;
    goto LABEL_5;
  }
  if (type == 1)
  {
    dispatch_semaphore_t v3 = [[GCHapticActuator alloc] initWithLabel:@"JoyCon Left" type:1 index:0];
    uint64_t v8 = v3;
    id v4 = &v8;
LABEL_5:
    id v5 = +[NSArray arrayWithObjects:v4 count:1];

    goto LABEL_7;
  }
  id v5 = &__NSArray0__struct;
LABEL_7:

  return (NSArray *)v5;
}

- (GCHapticCapabilityGraph)hapticCapabilityGraph
{
  int type = self->_type;
  uint64_t v3 = objc_opt_class();
  if (type == 1) {
    id v4 = @"JoyConLeftHapticCapabilityGraph";
  }
  else {
    id v4 = @"JoyConRightHapticCapabilityGraph";
  }
  id v5 = loadNSDictionaryFromJSON(v3, v4);
  dispatch_time_t v6 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v5];

  return v6;
}

- (void)homeButtonLongPressGesture:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __62___GCNintendoJoyConDevice_Fusion__homeButtonLongPressGesture___block_invoke;
  v3[3] = &unk_26D22B0A8;
  v3[4] = self;
  BOOL v4 = a3;
  _os_activity_initiate(&dword_220998000, "(JoyCon Fusion Gesture Service) Home Button Long Press Gesture", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  id v5 = [[GCDeviceBattery alloc] initWithLevel:a3 isCharging:a4];
  [(_GCNintendoJoyConDevice *)self propagateBattery:v5];
}

- (id)hapticDriver
{
  return (id)[(_GCDeviceDriverConnection *)self->_driverConnection remoteProxy];
}

@end