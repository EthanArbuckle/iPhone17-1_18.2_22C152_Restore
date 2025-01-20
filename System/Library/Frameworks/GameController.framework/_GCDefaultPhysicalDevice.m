@interface _GCDefaultPhysicalDevice
+ (id)identifierForService:(id)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)sensorsActive;
- (BOOL)supportsAdaptiveTriggers;
- (BOOL)supportsBattery;
- (BOOL)supportsGamepad;
- (BOOL)supportsHapticCapabilities;
- (BOOL)supportsLight;
- (BOOL)supportsMotion;
- (BOOL)supportsPlayerIndicator;
- (GCAdaptiveTriggersServiceServerInterface)adaptiveTriggersServiceServer;
- (GCBatteryServiceServerInterface)batteryServiceServer;
- (GCDeviceBattery)battery;
- (GCDeviceLight)light;
- (GCGameIntentServiceServerInterface)gameIntentServiceServer;
- (GCHIDServiceInfo)serviceInfo;
- (GCHapticCapabilityGraph)hapticCapabilityGraph;
- (GCLightServiceServerInterface)lightServiceServer;
- (GCMotionServiceServerInterface)motionServiceServer;
- (NSArray)hapticEngines;
- (NSArray)triggerStatuses;
- (NSObject)identifier;
- (NSSet)components;
- (NSString)debugDescription;
- (NSString)description;
- (_GCDefaultPhysicalDevice)init;
- (_GCDefaultPhysicalDevice)initWithHIDDevice:(id)a3 manager:(id)a4;
- (_GCDefaultPhysicalDeviceDelegate)delegate;
- (_GCDeviceManager)manager;
- (_GCGamepadEventSourceDescription)gamepadEventSource;
- (_GCMotionEventSourceDescription)motionEventSource;
- (id)deviceAdaptiveTriggersComponentStatusUpdatedHandler;
- (id)deviceAdaptiveTriggersServiceConnectedHandler;
- (id)deviceBatteryComponentBatteryUpdatedHandler;
- (id)deviceBatteryServiceConnectedHandler;
- (id)deviceGameIntentComponentGameIntentTriggeredHandler;
- (id)deviceLightServiceConnectedHandler;
- (id)deviceMotionServiceConnectedHandler;
- (id)driverConnection;
- (id)propertyForKey:(id)a3;
- (id)redactedDescription;
- (int64_t)indicatedPlayerIndex;
- (unint64_t)getGlyphFlags;
- (void)_workaround_backbone_97462229:(id)a3;
- (void)createPowerSource;
- (void)dealloc;
- (void)eaAccessoriesDidChange;
- (void)setAdaptiveTriggersPayload:(id)a3 forIndex:(int)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:(id)a3;
- (void)setDeviceAdaptiveTriggersServiceConnectedHandler:(id)a3;
- (void)setDeviceBatteryComponentBatteryUpdatedHandler:(id)a3;
- (void)setDeviceBatteryServiceConnectedHandler:(id)a3;
- (void)setDeviceGameIntentComponentGameIntentTriggeredHandler:(id)a3;
- (void)setDeviceLightServiceConnectedHandler:(id)a3;
- (void)setDeviceMotionServiceConnectedHandler:(id)a3;
- (void)setDriverConnection:(id)a3;
- (void)setEnableGlobalGameControllerFunctionality:(BOOL)a3;
- (void)setFilterConnection:(id)a3;
- (void)setIndicatedPlayerIndex:(int64_t)a3;
- (void)setLight:(id)a3;
- (void)setSensorsActive:(BOOL)a3;
- (void)triggerGameIntentWithEvent:(int64_t)a3;
- (void)updateAdaptiveTriggerStatusWithLeftMode:(unsigned __int8)a3 leftStatus:(unsigned __int8)a4 leftArmPosition:(unsigned __int8)a5 rightMode:(unsigned __int8)a6 rightStatus:(unsigned __int8)a7 rightArmPosition:(unsigned __int8)a8;
- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4;
- (void)updateGlyphFlags;
@end

@implementation _GCDefaultPhysicalDevice

- (_GCDefaultPhysicalDevice)initWithHIDDevice:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCDefaultPhysicalDevice;
  v9 = [(_GCDefaultPhysicalDevice *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceInfo, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
    uint64_t v11 = [(id)objc_opt_class() identifierForService:v7];
    identifier = v10->_identifier;
    v10->_identifier = v11;

    v10->_cachedIntentEvent = -1;
    v10->_cachedGlyphFlags = 0;
    [(_GCDefaultPhysicalDevice *)v10 _workaround_backbone_97462229:v7];
  }

  return v10;
}

- (void)_workaround_backbone_97462229:(id)a3
{
  id v4 = a3;
  v5 = [v4 numberPropertyForKey:@"VendorID"];
  v6 = [v4 numberPropertyForKey:@"ProductID"];

  if ([v5 intValue] == 5901 && objc_msgSend(v6, "intValue") == 1359
    || [v5 intValue] == 13706)
  {
    if (gc_isInternalBuild())
    {
      id v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "Backbone detected, deploying external accessory glyph workaround...", v9, 2u);
      }
    }
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:sel_eaAccessoriesDidChange name:EAAccessoryDidConnectNotification object:0];

    +[GCEAAccessoryManagerWrapper registerForLocalNotificationsWithObserver:self];
  }
}

- (_GCDefaultPhysicalDevice)init
{
  return 0;
}

- (void)dealloc
{
  powerSourceProperties = self->_powerSourceProperties;
  if (powerSourceProperties)
  {
    CFRelease(powerSourceProperties);
    self->_powerSourceProperties = 0;
  }
  if (self->_powerSourceID)
  {
    IOPSReleasePowerSource();
    self->_powerSourceID = 0;
  }
  +[GCEAAccessoryManagerWrapper unregisterForLocalNotificationsWithObserver:self];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:EAAccessoryDidConnectNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)_GCDefaultPhysicalDevice;
  [(_GCDefaultPhysicalDevice *)&v5 dealloc];
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if (&unk_26D298C30 == v4 && gc_isInternalBuild())
  {
    id v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11.receiver = self;
      v11.super_class = (Class)_GCDefaultPhysicalDevice;
      unsigned int v9 = [(_GCDefaultPhysicalDevice *)&v11 conformsToProtocol:v4];
      *(_DWORD *)buf = 67109120;
      unsigned int v13 = v9;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "RECEIVED PROTOCOL. IS CONFORMED? %d", buf, 8u);
    }
  }
  if (&unk_26D292F88 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsGamepad];
  }
  else if (&unk_26D293020 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsPlayerIndicator];
  }
  else if (&unk_26D298890 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsLight];
  }
  else if (&unk_26D298A00 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsAdaptiveTriggers];
  }
  else if (&unk_26D2931B0 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsHapticCapabilities];
  }
  else if (&unk_26D2987E0 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsMotion];
  }
  else if (&unk_26D293138 == v4)
  {
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)self supportsBattery];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCDefaultPhysicalDevice;
    unsigned __int8 v5 = [(_GCDefaultPhysicalDevice *)&v10 conformsToProtocol:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  identifier = self->_identifier;
  unsigned __int8 v5 = [(GCHIDServiceInfo *)self->_serviceInfo registryID];
  BOOL v6 = +[NSString stringWithFormat:@"<%@ '%@' registryID = %@>", v3, identifier, v5];

  return (NSString *)v6;
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [self->_identifier hash];
  unsigned __int8 v5 = [(GCHIDServiceInfo *)self->_serviceInfo registryID];
  BOOL v6 = +[NSString stringWithFormat:@"<%@ '#%llx' registryID = %@>", v3, v4, v5];

  return v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  identifier = self->_identifier;
  BOOL v6 = [(GCHIDServiceInfo *)self->_serviceInfo registryID];
  id v7 = +[NSString stringWithFormat:@"<%@ %p '%@' registryID = %@>", v4, self, identifier, v6];

  return (NSString *)v7;
}

- (void)setFilterConnection:(id)a3
{
  id v5 = a3;
  id filterConnectionInvalidationRegistration = self->_filterConnectionInvalidationRegistration;
  self->_id filterConnectionInvalidationRegistration = 0;

  filterConnection = self->_filterConnection;
  self->_filterConnection = 0;

  objc_storeStrong((id *)&self->_filterConnection, a3);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke;
  v16[3] = &unk_26D22A8C0;
  v16[4] = self;
  id v8 = [v5 addInvalidationHandler:v16];
  id v9 = self->_filterConnectionInvalidationRegistration;
  self->_id filterConnectionInvalidationRegistration = v8;

  objc_initWeak(&location, self);
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_2;
  activity_block[3] = &unk_26D22B708;
  id v12 = v5;
  unsigned int v13 = self;
  id v10 = v5;
  objc_copyWeak(&v14, &location);
  _os_activity_initiate(&dword_220998000, "Connect Game Intent Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)setDriverConnection:(id)a3
{
  id v5 = a3;
  id driverConnectionInvalidationRegistration = self->_driverConnectionInvalidationRegistration;
  self->_id driverConnectionInvalidationRegistration = 0;

  driverConnection = self->_driverConnection;
  self->_driverConnection = 0;

  objc_storeStrong((id *)&self->_driverConnection, a3);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke;
  v31[3] = &unk_26D22A8C0;
  v31[4] = self;
  id v8 = [v5 addInvalidationHandler:v31];
  id v9 = self->_driverConnectionInvalidationRegistration;
  self->_id driverConnectionInvalidationRegistration = v8;

  objc_initWeak(&location, self);
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2;
  activity_block[3] = &unk_26D22B708;
  id v10 = v5;
  id v27 = v10;
  v28 = self;
  objc_copyWeak(&v29, &location);
  _os_activity_initiate(&dword_220998000, "Connect Light Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v29);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_249;
  v22[3] = &unk_26D22B708;
  id v11 = v10;
  id v23 = v11;
  v24 = self;
  objc_copyWeak(&v25, &location);
  _os_activity_initiate(&dword_220998000, "Connect Adaptive Triggers Service", OS_ACTIVITY_FLAG_DEFAULT, v22);
  objc_destroyWeak(&v25);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_253;
  v18[3] = &unk_26D22B708;
  id v12 = v11;
  id v19 = v12;
  v20 = self;
  objc_copyWeak(&v21, &location);
  _os_activity_initiate(&dword_220998000, "Connect Motion Service", OS_ACTIVITY_FLAG_DEFAULT, v18);
  objc_destroyWeak(&v21);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_256;
  v14[3] = &unk_26D22B708;
  id v15 = v12;
  v16 = self;
  id v13 = v12;
  objc_copyWeak(&v17, &location);
  _os_activity_initiate(&dword_220998000, "Connect Battery Service", OS_ACTIVITY_FLAG_DEFAULT, v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (id)driverConnection
{
  return self->_driverConnection;
}

- (NSSet)components
{
  return +[NSSet setWithObject:self];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  int v5 = [(__CFString *)v4 isEqualToString:@"RegistryID"];
  serviceInfo = self->_serviceInfo;
  if (v5)
  {
    uint64_t v7 = [(GCHIDServiceInfo *)serviceInfo registryID];
  }
  else
  {
    uint64_t v7 = (uint64_t)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[(GCHIDServiceInfo *)serviceInfo service], v4);
  }
  id v8 = (void *)v7;

  return v8;
}

+ (id)identifierForService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringPropertyForKey:@"Transport"];
  int v5 = [v3 stringPropertyForKey:@"PhysicalDeviceUniqueID"];
  if (v5 && ([v4 isEqualToString:@"iAP"] & 1) == 0)
  {
    id v9 = v5;
  }
  else
  {
    BOOL v6 = [v3 stringPropertyForKey:@"SerialNumber"];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSUUID UUID];
    }
    id v9 = v8;
  }

  return v9;
}

- (void)eaAccessoriesDidChange
{
  unint64_t cachedGlyphFlags = self->_cachedGlyphFlags;
  [(_GCDefaultPhysicalDevice *)self updateGlyphFlags];
  if (cachedGlyphFlags != self->_cachedGlyphFlags)
  {
    self->_unint64_t cachedGlyphFlags = cachedGlyphFlags;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"GCRefreshPhysicalDeviceConfigurationNotification" object:self];
  }
}

- (void)updateGlyphFlags
{
  id v3 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"SerialNumber"];
  id v4 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"Transport"];
  char v5 = [v4 isEqualToString:@"Bluetooth"];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v6 = unk_26D2C9D38(&off_26D2CBA00, "sharedAccessoryManager", 0);
  uint64_t v7 = [v6 connectedAccessories];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
      if (v5) {
        [v12 macAddress];
      }
      else {
      id v13 = [v12 serialNumber];
      }
      if (v3)
      {
        if ([v3 isEqual:v13]) {
          break;
        }
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v14 = v12;

    if (!v14) {
      goto LABEL_23;
    }
    if (gc_isInternalBuild())
    {
      id v25 = getGCLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v14;
        __int16 v32 = 2112;
        v33 = self;
        _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "Found matching accessory %@ for physical device %@", buf, 0x16u);
      }
    }
    id v15 = [v14 protocolStrings];
    unsigned int v16 = [v15 containsObject:@"com.playstation.olp.dualsense"];

    unint64_t v17 = v16;
    v18 = [v14 protocolStrings];
    int v19 = [v18 containsObject:@"com.xbox.licensing.controller"];

    if (v19) {
      v17 |= 4uLL;
    }
    v20 = [v14 protocolStrings];
    int v21 = [v20 containsObject:@"com.playstation.olp.logobutton"];

    if (v21) {
      v17 |= 2uLL;
    }
    v22 = [v14 protocolStrings];
    int v23 = [v22 containsObject:@"com.xbox.licensing.logobutton"];

    unint64_t v24 = v17 | 8;
    if (!v23) {
      unint64_t v24 = v17;
    }
  }
  else
  {
LABEL_13:

    id v14 = 0;
LABEL_23:
    unint64_t v24 = 0;
  }
  self->_unint64_t cachedGlyphFlags = v24;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 128, 1);
}

- (_GCDeviceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (_GCDeviceManager *)WeakRetained;
}

- (_GCDefaultPhysicalDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GCDefaultPhysicalDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GCAdaptiveTriggersServiceServerInterface)adaptiveTriggersServiceServer
{
  return self->_adaptiveTriggersServiceServer;
}

- (GCLightServiceServerInterface)lightServiceServer
{
  return self->_lightServiceServer;
}

- (GCMotionServiceServerInterface)motionServiceServer
{
  return self->_motionServiceServer;
}

- (GCBatteryServiceServerInterface)batteryServiceServer
{
  return self->_batteryServiceServer;
}

- (GCGameIntentServiceServerInterface)gameIntentServiceServer
{
  return self->_gameIntentServiceServer;
}

- (GCHIDServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_gameIntentServiceServer, 0);
  objc_storeStrong((id *)&self->_batteryServiceServer, 0);
  objc_storeStrong((id *)&self->_motionServiceServer, 0);
  objc_storeStrong((id *)&self->_lightServiceServer, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggersServiceServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_gameIntentComponentGameIntentTriggeredHandler, 0);
  objc_storeStrong(&self->_batteryComponentBatteryUpdatedHandler, 0);
  objc_storeStrong(&self->_batteryComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_motionComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_adaptiveTriggersComponentStatusUpdatedHandler, 0);
  objc_storeStrong(&self->_adaptiveTriggersComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_lightComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_filterConnectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_filterConnection, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationRegistration, 0);

  objc_storeStrong((id *)&self->_driverConnection, 0);
}

- (BOOL)supportsGamepad
{
  return 1;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  id v3 = objc_alloc_init(_GCCControllerManagerDescription);
  id v4 = [[_GCCControllerHIDServiceInfoDescription alloc] initWithServiceInfo:self->_serviceInfo];
  char v5 = [[_GCKeyboardEventHIDAdapterDescription alloc] initWithSource:v3 service:v4];
  BOOL v6 = [[_GCGamepadEventGamepadHIDAdapterDescription alloc] initWithSource:v3 service:v4];
  uint64_t v7 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  int v10 = [v9 physicalDeviceUsesACHomeForMenu:self];

  if (!v10)
  {
LABEL_5:
    [v7 mapUsagePage:12 usage:547 toGamepadElement:22];
    [v7 mapUsagePage:12 usage:516 toGamepadElement:23];
    [v7 mapUsagePage:12 usage:521 toGamepadElement:24];
    uint64_t v11 = v7;
    uint64_t v12 = 178;
    uint64_t v13 = 40;
    goto LABEL_6;
  }
  uint64_t v11 = v7;
  uint64_t v12 = 547;
  uint64_t v13 = 23;
LABEL_6:
  [v11 mapUsagePage:12 usage:v12 toGamepadElement:v13];
  id v14 = [[_GCGamepadEventKeyboardEventAdapterDescription alloc] initWithConfiguration:v7 source:v5];
  id v15 = [[_GCGamepadEventFusionConfig alloc] initWithSourceCount:2];
  for (uint64_t i = 0; i != 47; ++i)
  {
    BOOL v18 = ((i - 24) & 0xFFFFFFFFFFFFFFEFLL) != 0 && (i & 0x7FFFFFFFFFFFFFFELL) != 22;
    [(_GCGamepadEventFusionConfig *)v15 setPassRule:1 forElement:i forSourceAtIndex:v18];
  }
  int v19 = [_GCGamepadEventFusionDescription alloc];
  v23[0] = v14;
  v23[1] = v6;
  v20 = +[NSArray arrayWithObjects:v23 count:2];
  int v21 = [(_GCGamepadEventFusionDescription *)v19 initWithConfiguration:v15 sources:v20];

  return (_GCGamepadEventSourceDescription *)v21;
}

- (BOOL)supportsMotion
{
  id v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 physicalDeviceSupportsMotion:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)deviceMotionServiceConnectedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_motionComponentServiceConnectedHandler, a2);

  return v2;
}

- (void)setDeviceMotionServiceConnectedHandler:(id)a3
{
  char v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id motionComponentServiceConnectedHandler = self->_motionComponentServiceConnectedHandler;
  self->_id motionComponentServiceConnectedHandler = v4;

  if (self->_motionComponentServiceConnectedHandler)
  {
    if (self->_motionServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __75___GCDefaultPhysicalDevice_Motion__setDeviceMotionServiceConnectedHandler___block_invoke;
      v6[3] = &unk_26D22A9D0;
      objc_copyWeak(&v7, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (_GCMotionEventSourceDescription)motionEventSource
{
  id v3 = objc_alloc_init(_GCCControllerManagerDescription);
  char v4 = [[_GCCControllerHIDServiceInfoDescription alloc] initWithServiceInfo:self->_serviceInfo];
  char v5 = [[_GCMotionEventHIDAdapterDescription alloc] initWithSource:v3 service:v4];

  return (_GCMotionEventSourceDescription *)v5;
}

- (BOOL)sensorsActive
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v4 = [(_GCDefaultPhysicalDevice *)self delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49___GCDefaultPhysicalDevice_Motion__sensorsActive__block_invoke;
  v8[3] = &unk_26D22C230;
  int v10 = &v11;
  char v5 = v3;
  id v9 = v5;
  [v4 physicalDevice:self getSensorsActiveWithReply:v8];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)setSensorsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_GCDefaultPhysicalDevice *)self delegate];
  [v5 physicalDevice:self setSensorsActive:v3];
}

- (BOOL)supportsPlayerIndicator
{
  v2 = [(_GCDefaultPhysicalDevice *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = objc_opt_respondsToSelector();
  }
  else {
    char v3 = 0;
  }

  return v3 & 1;
}

- (int64_t)indicatedPlayerIndex
{
  char v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  int64_t v4 = [v3 physicalDeviceGetIndicatedPlayerIndex:self];

  return v4;
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  id v5 = [(_GCDefaultPhysicalDevice *)self delegate];
  [v5 physicalDevice:self setIndicatedPlayerIndex:a3];
}

- (BOOL)supportsLight
{
  v2 = [(_GCDefaultPhysicalDevice *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = objc_opt_respondsToSelector();
  }
  else {
    char v3 = 0;
  }

  return v3 & 1;
}

- (id)deviceLightServiceConnectedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_lightComponentServiceConnectedHandler, a2);

  return v2;
}

- (void)setDeviceLightServiceConnectedHandler:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id lightComponentServiceConnectedHandler = self->_lightComponentServiceConnectedHandler;
  self->_id lightComponentServiceConnectedHandler = v4;

  if (self->_lightComponentServiceConnectedHandler)
  {
    if (self->_lightServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __73___GCDefaultPhysicalDevice_Light__setDeviceLightServiceConnectedHandler___block_invoke;
      v6[3] = &unk_26D22A9D0;
      objc_copyWeak(&v7, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (GCDeviceLight)light
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  unsigned int v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  int64_t v4 = [(_GCDefaultPhysicalDevice *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __40___GCDefaultPhysicalDevice_Light__light__block_invoke;
  v9[3] = &unk_26D22C258;
  uint64_t v11 = &v12;
  id v5 = v3;
  int v10 = v5;
  [v4 physicalDevice:self getLightWithReply:v9];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return (GCDeviceLight *)v7;
}

- (void)setLight:(id)a3
{
  id v4 = a3;
  id v5 = [(_GCDefaultPhysicalDevice *)self delegate];
  [v5 physicalDevice:self setLight:v4];
}

- (BOOL)supportsAdaptiveTriggers
{
  v2 = [(_GCDefaultPhysicalDevice *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = objc_opt_respondsToSelector();
  }
  else {
    char v3 = 0;
  }

  return v3 & 1;
}

- (id)deviceAdaptiveTriggersServiceConnectedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_adaptiveTriggersComponentServiceConnectedHandler, a2);

  return v2;
}

- (void)setDeviceAdaptiveTriggersServiceConnectedHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id adaptiveTriggersComponentServiceConnectedHandler = self->_adaptiveTriggersComponentServiceConnectedHandler;
  self->_id adaptiveTriggersComponentServiceConnectedHandler = v4;

  if (self->_adaptiveTriggersComponentServiceConnectedHandler)
  {
    if (self->_adaptiveTriggersServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __95___GCDefaultPhysicalDevice_AdaptiveTriggers__setDeviceAdaptiveTriggersServiceConnectedHandler___block_invoke;
      v6[3] = &unk_26D22A9D0;
      objc_copyWeak(&v7, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setAdaptiveTriggersPayload:(id)a3 forIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(_GCDefaultPhysicalDevice *)self delegate];
  [v7 physicalDevice:self setAdaptiveTriggersPayload:v6 forIndex:v4];
}

- (id)deviceAdaptiveTriggersComponentStatusUpdatedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_adaptiveTriggersComponentStatusUpdatedHandler, a2);

  return v2;
}

- (void)setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id adaptiveTriggersComponentStatusUpdatedHandler = self->_adaptiveTriggersComponentStatusUpdatedHandler;
  self->_id adaptiveTriggersComponentStatusUpdatedHandler = v4;
}

- (NSArray)triggerStatuses
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  unsigned int v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  uint64_t v4 = [(_GCDefaultPhysicalDevice *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __61___GCDefaultPhysicalDevice_AdaptiveTriggers__triggerStatuses__block_invoke;
  v9[3] = &unk_26D22C280;
  uint64_t v11 = &v12;
  id v5 = v3;
  int v10 = v5;
  [v4 physicalDevice:self getAdaptiveTriggersStatusesWithReply:v9];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return (NSArray *)v7;
}

- (void)updateAdaptiveTriggerStatusWithLeftMode:(unsigned __int8)a3 leftStatus:(unsigned __int8)a4 leftArmPosition:(unsigned __int8)a5 rightMode:(unsigned __int8)a6 rightStatus:(unsigned __int8)a7 rightArmPosition:(unsigned __int8)a8
{
  if (self->_adaptiveTriggersComponentStatusUpdatedHandler)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __158___GCDefaultPhysicalDevice_AdaptiveTriggersClient__updateAdaptiveTriggerStatusWithLeftMode_leftStatus_leftArmPosition_rightMode_rightStatus_rightArmPosition___block_invoke;
    block[3] = &unk_26D22C2A8;
    objc_copyWeak(&v15, &location);
    unsigned __int8 v16 = a4;
    unsigned __int8 v17 = a5;
    unsigned __int8 v18 = a3;
    unsigned __int8 v19 = a7;
    unsigned __int8 v20 = a8;
    unsigned __int8 v21 = a6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)supportsBattery
{
  dispatch_semaphore_t v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v3 physicalDeviceSupportsBattery:self])
  {
    char v4 = 0;
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

- (id)deviceBatteryServiceConnectedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_batteryComponentServiceConnectedHandler, a2);

  return v2;
}

- (void)setDeviceBatteryServiceConnectedHandler:(id)a3
{
  char v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id batteryComponentServiceConnectedHandler = self->_batteryComponentServiceConnectedHandler;
  self->_id batteryComponentServiceConnectedHandler = v4;

  if (self->_batteryComponentServiceConnectedHandler)
  {
    if (self->_batteryServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __77___GCDefaultPhysicalDevice_Battery__setDeviceBatteryServiceConnectedHandler___block_invoke;
      v6[3] = &unk_26D22A9D0;
      objc_copyWeak(&v7, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (id)deviceBatteryComponentBatteryUpdatedHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_batteryComponentBatteryUpdatedHandler, a2);

  return v2;
}

- (void)setDeviceBatteryComponentBatteryUpdatedHandler:(id)a3
{
  char v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id batteryComponentBatteryUpdatedHandler = self->_batteryComponentBatteryUpdatedHandler;
  self->_id batteryComponentBatteryUpdatedHandler = v4;
}

- (GCDeviceBattery)battery
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  unsigned __int8 v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  char v4 = [(_GCDefaultPhysicalDevice *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __44___GCDefaultPhysicalDevice_Battery__battery__block_invoke;
  v9[3] = &unk_26D22C2D0;
  uint64_t v11 = &v12;
  id v5 = v3;
  int v10 = v5;
  [v4 physicalDevice:self getBatteryWithReply:v9];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return (GCDeviceBattery *)v7;
}

- (void)createPowerSource
{
  dispatch_semaphore_t v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 physicalDeviceShouldPublishPowerSource:self])
  {
    if (self->_powerSourceID || !IOPSCreatePowerSource() && self->_powerSourceID)
    {
      powerSourceProperties = self->_powerSourceProperties;
      if (powerSourceProperties) {
        CFDictionaryRemoveAllValues(powerSourceProperties);
      }
      else {
        self->_powerSourceProperties = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      dispatch_time_t v6 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"Transport"];
      if (v6) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Transport Type", v6);
      }
      id v7 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"Product"];
      if (v7) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Name", v7);
      }
      uint64_t v8 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"VendorID"];
      if (v8) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Vendor ID", v8);
      }
      id v9 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"ProductID"];
      if (v9) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Product ID", v9);
      }
      int v10 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"ModelNumber"];
      if (v10) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Model Number", v10);
      }
      uint64_t v11 = [(_GCDefaultPhysicalDevice *)self propertyForKey:@"SerialNumber"];
      if (v11) {
        CFDictionarySetValue(self->_powerSourceProperties, @"Accessory Identifier", v11);
      }
      CFDictionarySetValue(self->_powerSourceProperties, @"Accessory Category", @"Game Controller");
      CFDictionarySetValue(self->_powerSourceProperties, @"Is Present", kCFBooleanTrue);
      CFDictionarySetValue(self->_powerSourceProperties, @"Type", @"Accessory Source");

      CFDictionarySetValue(self->_powerSourceProperties, @"Is Charging", kCFBooleanFalse);
      CFDictionarySetValue(self->_powerSourceProperties, @"Power Source State", @"Battery Power");
      CFDictionarySetValue(self->_powerSourceProperties, @"Max Capacity", &unk_26D286828);
      CFDictionarySetValue(self->_powerSourceProperties, @"Current Capacity", &unk_26D286828);
      if (IOPSSetPowerSourceDetails() && gc_isInternalBuild())
      {
        uint64_t v14 = getGCLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_GCDefaultPhysicalDevice(Battery) createPowerSource]();
        }
      }
      objc_initWeak(&location, self);
      uint64_t v12 = [(_GCDefaultPhysicalDevice *)self batteryServiceServer];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke;
      v16[3] = &unk_26D22C2F8;
      objc_copyWeak(&v17, &location);
      [v12 readBatteryWithReply:v16];

      if (gc_isInternalBuild())
      {
        uint64_t v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Created I/O Power Source for game controller.", v15, 2u);
        }
      }
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else if (gc_isInternalBuild())
    {
      id v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_GCDefaultPhysicalDevice(Battery) createPowerSource]();
      }
    }
  }
}

- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  if (self->_batteryComponentBatteryUpdatedHandler)
  {
    BOOL v4 = a4;
    uint64_t v5 = a3;
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __68___GCDefaultPhysicalDevice_BatteryClient__updateBattery_isCharging___block_invoke;
    block[3] = &unk_26D22C320;
    objc_copyWeak(&v10, &location);
    char v11 = v5;
    BOOL v12 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (self->_powerSourceID)
    {
      powerSourceProperties = self->_powerSourceProperties;
      if (powerSourceProperties)
      {
        CFDictionarySetValue(powerSourceProperties, @"Is Charging", +[NSNumber numberWithBool:v4]);
        CFDictionarySetValue(self->_powerSourceProperties, @"Max Capacity", &unk_26D286840);
        CFDictionarySetValue(self->_powerSourceProperties, @"Current Capacity", +[NSNumber numberWithUnsignedChar:v5]);
        if (IOPSSetPowerSourceDetails())
        {
          if (gc_isInternalBuild())
          {
            uint64_t v8 = getGCLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              -[_GCDefaultPhysicalDevice(BatteryClient) updateBattery:isCharging:]();
            }
          }
        }
      }
    }
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)supportsHapticCapabilities
{
  dispatch_semaphore_t v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 physicalDeviceGetHapticCapabilities:self];
    uint64_t v5 = v4;
    if (v4) {
      BOOL v6 = [v4 count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSArray)hapticEngines
{
  dispatch_semaphore_t v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  BOOL v4 = [v3 physicalDeviceGetHapticCapabilities:self];

  return (NSArray *)v4;
}

- (GCHapticCapabilityGraph)hapticCapabilityGraph
{
  dispatch_semaphore_t v3 = [(_GCDefaultPhysicalDevice *)self delegate];
  BOOL v4 = [v3 physicalDeviceGetHapticCapabilityGraph:self];

  return (GCHapticCapabilityGraph *)v4;
}

- (void)setEnableGlobalGameControllerFunctionality:(BOOL)a3
{
}

- (id)deviceGameIntentComponentGameIntentTriggeredHandler
{
  v2 = (void *)MEMORY[0x223C6E420](self->_gameIntentComponentGameIntentTriggeredHandler, a2);

  return v2;
}

- (void)setDeviceGameIntentComponentGameIntentTriggeredHandler:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  id gameIntentComponentGameIntentTriggeredHandler = self->_gameIntentComponentGameIntentTriggeredHandler;
  self->_id gameIntentComponentGameIntentTriggeredHandler = v4;

  if (self->_cachedIntentEvent != -1)
  {
    -[_GCDefaultPhysicalDevice triggerGameIntentWithEvent:](self, "triggerGameIntentWithEvent:");
    self->_cachedIntentEvent = -1;
  }
}

- (void)triggerGameIntentWithEvent:(int64_t)a3
{
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a3;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "triggerGameIntentWithEvent: %ld", (uint8_t *)location, 0xCu);
    }
  }
  if (self->_gameIntentComponentGameIntentTriggeredHandler)
  {
    objc_initWeak(location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __73___GCDefaultPhysicalDevice_GameIntentClient__triggerGameIntentWithEvent___block_invoke;
    v6[3] = &unk_26D22C348;
    objc_copyWeak(v7, location);
    v7[1] = (id)a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    objc_destroyWeak(v7);
    objc_destroyWeak(location);
  }
  else
  {
    self->_cachedIntentEvent = a3;
  }
}

- (unint64_t)getGlyphFlags
{
  return self->_cachedGlyphFlags;
}

@end