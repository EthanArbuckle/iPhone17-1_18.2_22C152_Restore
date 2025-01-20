@interface GCController
+ (BOOL)_settingsSupportedForBLEDevice:(id)a3 settingsStore:(id)a4;
+ (BOOL)_settingsSupportedForBTClassicDevice:(id)a3 settingsStore:(id)a4;
+ (BOOL)settingsSupportedForCBDevice:(id)a3;
+ (BOOL)shouldMonitorBackgroundEvents;
+ (BOOL)supportsSecureCoding;
+ (BOOL)userHasPairedGameController;
+ (BOOL)userHasPairedGameControllerSupportingInteractionProfile:(id)a3;
+ (BOOL)userHasRecentlyInstalledGameSupportingInteractionProfile:(id)a3;
+ (GCController)controllerWithExtendedGamepad;
+ (GCController)controllerWithMicroGamepad;
+ (GCController)current;
+ (NSArray)controllers;
+ (id)snapshotWithProfile:(id)a3;
+ (void)__openXPC__;
+ (void)__openXPC_and_CBApplicationDidBecomeActive__;
+ (void)__open__;
+ (void)_startWirelessControllerDiscoveryWithBTClassic:(BOOL)a3 btle:(BOOL)a4 completionHandler:(id)a5;
+ (void)_startWirelessControllerDiscoveryWithCompanions:(BOOL)a3 btClassic:(BOOL)a4 btle:(BOOL)a5 completionHandler:(id)a6;
+ (void)startWirelessControllerDiscoveryWithCompletionHandler:(void *)completionHandler;
+ (void)stopWirelessControllerDiscovery;
- (BOOL)_legacy_isAttachedToDevice;
- (BOOL)_legacy_isEqualToController:(id)a3;
- (BOOL)areAllHIDDevicesConnected;
- (BOOL)displayTrueSiriRemoteName;
- (BOOL)hasServiceRef:(__IOHIDServiceClient *)a3;
- (BOOL)isATVRemote;
- (BOOL)isAttachedToDevice;
- (BOOL)isComponentBased;
- (BOOL)isEqualToController:(id)a3;
- (BOOL)isForwarded;
- (BOOL)isPublished;
- (BOOL)isSnapshot;
- (BOOL)physicalDeviceUsesCompass;
- (GCController)capture;
- (GCController)initWithCoder:(id)a3;
- (GCController)initWithComponents:(id)a3;
- (GCController)initWithIdentifier:(id)a3 components:(id)a4;
- (GCController)initWithProfile:(id)a3;
- (GCController)initWithProfileClass:(Class)a3 serviceRef:(__IOHIDServiceClient *)a4;
- (GCController)initWithServiceRef:(__IOHIDServiceClient *)a3;
- (GCControllerLiveInput)input;
- (GCControllerMotionConfigurableSensors)motionConfigurableSensors;
- (GCControllerPlayerIndex)playerIndex;
- (GCDeviceBattery)battery;
- (GCDeviceHaptics)haptics;
- (GCDeviceLight)light;
- (GCExtendedGamepad)extendedGamepad;
- (GCGamepad)gamepad;
- (GCMicroGamepad)microGamepad;
- (GCMotion)motion;
- (GCNamedProfile)profile;
- (GCPhysicalInputProfile)physicalInputProfile;
- (GCSProfile)settingsProfile;
- (GCSystemGestureComponent)systemGestureComponent;
- (NSArray)components;
- (NSArray)hidServices;
- (NSObject)identifier;
- (NSString)debugName;
- (NSString)description;
- (NSString)physicalDeviceUniqueID;
- (NSString)productCategory;
- (NSString)uniqueIdentifier;
- (NSString)vendorName;
- (OS_dispatch_queue)handlerQueue;
- (id)_componentOfClass:(Class)a3;
- (id)_componentWithProtocol:(id)a3;
- (id)_legacy_batteryStatus;
- (id)_legacy_description;
- (id)_legacy_extendedGamepad;
- (id)_legacy_gamepad;
- (id)_legacy_input;
- (id)_legacy_keyboard;
- (id)_legacy_microGamepad;
- (id)_legacy_motion;
- (id)_legacy_mouse;
- (id)_legacy_physicalInputProfile;
- (id)_legacy_physicalInputProfileName;
- (id)_legacy_productCategory;
- (id)_legacy_vendorName;
- (id)anonymizedIdentifier;
- (id)controllerSettings;
- (id)detailedProductCategory;
- (id)hapticEngines;
- (id)persistentIdentifier;
- (id)physicalInputProfileName;
- (int64_t)_legacy_playerIndex;
- (unint64_t)deviceHash;
- (unsigned)sampleRate;
- (void)_addComponent:(id)a3;
- (void)_becomeCurrent;
- (void)_legacy_handleEvent:(__IOHIDEvent *)a3;
- (void)_legacy_invalidateDescription;
- (void)_legacy_setPlayerIndex:(int64_t)a3;
- (void)_setSnapshot:(BOOL)a3;
- (void)_triggerGameIntentLongPress;
- (void)_triggerGameIntentShortPress;
- (void)addServiceRef:(id)a3;
- (void)addServiceRefs:(id)a3;
- (void)addServiceRefsWithDevice:(id)a3;
- (void)clearServiceRef;
- (void)controllerPausedHandler;
- (void)createInputBufferForDevice:(__IOHIDDevice *)a3 withSize:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initializeHapticEngines;
- (void)removeComponent:(id)a3;
- (void)removeHapticEngines;
- (void)removeServiceRef:(__IOHIDServiceClient *)a3;
- (void)setAllHIDDevicesConnected:(BOOL)a3;
- (void)setComponents:(id)a3;
- (void)setControllerPausedHandler:(void *)controllerPausedHandler;
- (void)setDebugName:(id)a3;
- (void)setDeviceHash:(unint64_t)a3;
- (void)setForwarded:(BOOL)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setHidServices:(id)a3;
- (void)setPhysicalDeviceUniqueID:(id)a3;
- (void)setPhysicalDeviceUsesCompass:(BOOL)a3;
- (void)setPlayerIndex:(GCControllerPlayerIndex)playerIndex;
- (void)setProfile:(id)a3;
- (void)setPublished:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation GCController

- (GCController)initWithIdentifier:(id)a3 components:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GCController;
  v8 = [(GCController *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handlerQueue, &_dispatch_main_q);
    uint64_t v10 = [v6 copyWithZone:0];
    identifier = v9->_identifier;
    v9->_identifier = (NSCopying *)v10;

    v9->_playerIndex = -1;
    [(GCController *)v9 setComponents:v7];
    uint64_t v12 = objc_opt_new();
    profile = v9->_profile;
    v9->_profile = (GCNamedProfile *)v12;

    uint64_t v14 = objc_opt_new();
    hidServices = v9->_hidServices;
    v9->_hidServices = (NSMutableArray *)v14;
  }
  return v9;
}

- (GCController)initWithComponents:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [(GCController *)self initWithIdentifier:v5 components:v4];

  return v6;
}

- (void)removeComponent:(id)a3
{
  components = self->_components;
  id v5 = a3;
  id v6 = (NSArray *)[(NSArray *)components mutableCopy];
  [(NSArray *)v6 removeObject:v5];

  id v7 = self->_components;
  self->_components = v6;
}

- (void)setComponents:(id)a3
{
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [(NSArray *)self->_components differenceFromArray:v4];
  id v6 = [v5 removals];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v37 + 1) + 8 * i) object];
        [v10 setController:0];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }

  v11 = (NSArray *)[v4 copy];
  components = self->_components;
  self->_components = v11;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v34;
    p_systemGesture = (id *)&self->_systemGesture;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        objc_msgSend(v16, "setController:", self, p_systemGesture);
        if ([v16 conformsToProtocol:&unk_26D299648]) {
          objc_storeStrong((id *)&self->_info, v16);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_input, v16);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_physicalInput, v16);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_motion, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D290950])
        {
          id v17 = v16;
          if (GCCurrentProcessLinkedOnAfter(0x7E40901FFFFFFFFuLL))
          {
            v18 = (GCLocalPlayerIndicator *)v17;
          }
          else
          {
            [(GCController *)self removeComponent:v17];
            playerIndicator = self->_playerIndicator;
            if (playerIndicator) {
              int64_t playerIndex = [(GCControllerPlayerIndicator *)playerIndicator playerIndex];
            }
            else {
              int64_t playerIndex = self->_playerIndex;
            }
            v18 = [[GCLocalPlayerIndicator alloc] initWithInitialValue:playerIndex systemPlayerIndicatorProxy:v17];
            [(GCController *)self _addComponent:v18];
          }
          v21 = self->_playerIndicator;
          self->_playerIndicator = (GCControllerPlayerIndicator *)v18;
        }
        if ([v16 conformsToProtocol:&unk_26D290508]) {
          objc_storeStrong((id *)&self->_hapticCapabilityInfo, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D2975A8]) {
          objc_storeStrong((id *)&self->_light, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D290BB8]) {
          objc_storeStrong((id *)&self->_motionConfigurableSensors, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D28C230]) {
          objc_storeStrong((id *)&self->_battery, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D299728]) {
          objc_storeStrong((id *)&self->_settings, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D293920]) {
          objc_storeStrong((id *)&self->_gameIntent, v16);
        }
        if ([v16 conformsToProtocol:&unk_26D29F9A8]) {
          objc_storeStrong(p_systemGesture, v16);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v13);
  }

  if (self->_settings && (self->_physicalInput || self->_input))
  {
    objc_initWeak(&from, self);
    settings = self->_settings;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __30__GCController_setComponents___block_invoke;
    v30[3] = &unk_26D22BFC8;
    objc_copyWeak(&v31, &from);
    [(GCControllerSettingsComponent *)settings setChangedHandler:v30];
    physicalInput = self->_physicalInput;
    v24 = [(GCControllerSettingsComponent *)self->_settings settingsProfile];
    [(GCPhysicalInputProfile *)physicalInput setSettingsProfile:v24];

    input = self->_input;
    v26 = [(GCControllerSettingsComponent *)self->_settings settingsProfile];
    [(_GCControllerInputComponent *)input setSettingsProfile:v26];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
  }
  if (self->_systemGesture)
  {
    v27 = self->_physicalInput;
    if (v27) {
      -[GCPhysicalInputProfile applySystemGestureComponent:](v27, "applySystemGestureComponent:");
    }
  }
}

void __30__GCController_setComponents___block_invoke(uint64_t a1)
{
  v2 = +[_GCControllerManager sharedInstance];
  v3 = [v2 controllersQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __30__GCController_setComponents___block_invoke_2;
  block[3] = &unk_26D22A9D0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __30__GCController_setComponents___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((void *)WeakRetained + 6);
    id v6 = WeakRetained;
    v3 = [*((id *)WeakRetained + 9) settingsProfile];
    [v2 setSettingsProfile:v3];

    id v4 = (void *)*((void *)v6 + 5);
    id v5 = [*((id *)v6 + 9) settingsProfile];
    [v4 setSettingsProfile:v5];

    id WeakRetained = v6;
  }
}

- (void)setHandlerQueue:(id)a3
{
  id v5 = (OS_dispatch_queue *)a3;
  if (self->_handlerQueue != v5)
  {
    objc_storeStrong((id *)&self->_handlerQueue, a3);
    if (self->_components)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = [(GCController *)self components];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v11 setDispatchQueue:v5];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (NSString)vendorName
{
  if (self->_components) {
    [(GCControllerProductInfo *)self->_info vendorName];
  }
  else {
  v2 = [(GCController *)self _legacy_vendorName];
  }

  return (NSString *)v2;
}

- (NSString)productCategory
{
  if (self->_components)
  {
    uint64_t v2 = [(GCControllerProductInfo *)self->_info productCategory];
    v3 = (void *)v2;
    id v4 = @"Generic Game Controller";
    if (v2) {
      id v4 = (__CFString *)v2;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = [(GCController *)self _legacy_productCategory];
  }

  return (NSString *)v5;
}

- (id)detailedProductCategory
{
  if (self->_components)
  {
    v3 = [(GCControllerProductInfo *)self->_info detailedProductCategory];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(GCController *)self productCategory];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(GCController *)self productCategory];
  }

  return v6;
}

- (id)anonymizedIdentifier
{
  uint64_t v2 = @"controller";
  if (self->_components)
  {
    uint64_t v3 = [(GCControllerProductInfo *)self->_info anonymizedIdentifier];
    id v4 = (void *)v3;
    if (v3) {
      id v5 = (__CFString *)v3;
    }
    else {
      id v5 = @"controller";
    }
    uint64_t v2 = v5;
  }

  return v2;
}

- (id)persistentIdentifier
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self->_identifier;
  }
  else {
    uint64_t v3 = (NSCopying *)@"controller";
  }

  return v3;
}

- (BOOL)isAttachedToDevice
{
  if (self->_components)
  {
    uint64_t v2 = [(GCControllerProductInfo *)self->_info isAttachedToDevice];
    char v3 = [v2 BOOLValue];

    return v3;
  }
  else
  {
    return [(GCController *)self _legacy_isAttachedToDevice];
  }
}

- (BOOL)isEqualToController:(id)a3
{
  id v4 = a3;
  if (self->_components)
  {
    int v5 = [(GCController *)self isComponentBased];
    if (v5 == [v4 isComponentBased])
    {
      uint64_t v7 = [(GCController *)self components];
      uint64_t v8 = [v4 components];
      char v6 = [v7 isEqualToArray:v8];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = [(GCController *)self _legacy_isEqualToController:v4];
  }

  return v6;
}

- (NSString)description
{
  if (self->_components)
  {
    char v3 = [(GCController *)self vendorName];
    id v4 = +[NSString stringWithFormat:@"<GCController %p vendorName='%@'>", self, v3];
  }
  else
  {
    id v4 = [(GCController *)self _legacy_description];
  }

  return (NSString *)v4;
}

- (GCSProfile)settingsProfile
{
  if (self->_components)
  {
    uint64_t v2 = [(GCControllerSettingsComponent *)self->_settings settingsProfile];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (GCSProfile *)v2;
}

- (GCControllerPlayerIndex)playerIndex
{
  if (!self->_components) {
    return [(GCController *)self _legacy_playerIndex];
  }
  if (self->_playerIndicator) {
    return [(GCControllerPlayerIndicator *)self->_playerIndicator playerIndex];
  }
  return self->_playerIndex;
}

- (void)setPlayerIndex:(GCControllerPlayerIndex)playerIndex
{
  if (self->_components)
  {
    if (playerIndex < GCControllerPlayerIndex1) {
      int64_t playerIndex = GCControllerPlayerIndexUnset;
    }
    if (self->_playerIndicator) {
      [(GCControllerPlayerIndicator *)self->_playerIndicator setPlayerIndex:playerIndex];
    }
    else {
      self->_int64_t playerIndex = playerIndex;
    }
  }
  else
  {
    [(GCController *)self _legacy_setPlayerIndex:playerIndex];
  }
}

- (GCDeviceBattery)battery
{
  if (self->_components) {
    [(GCDeviceBatteryComponent *)self->_battery battery];
  }
  else {
  uint64_t v2 = [(GCController *)self _legacy_batteryStatus];
  }

  return (GCDeviceBattery *)v2;
}

- (GCControllerLiveInput)input
{
  if (self->_components)
  {
    char v3 = [(_GCDevicePhysicalInputComponent *)(id *)&self->_input->super.super.isa defaultPhysicalInput];
    id v4 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v3);
    int v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(GCController *)self _legacy_input];
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = [(GCController *)self _legacy_input];
  }

  return (GCControllerLiveInput *)v7;
}

- (id)physicalInputProfileName
{
  if (self->_components) {
    [(GCPhysicalInputProfile *)self->_physicalInput name];
  }
  else {
  uint64_t v2 = [(GCController *)self _legacy_physicalInputProfileName];
  }

  return v2;
}

- (GCPhysicalInputProfile)physicalInputProfile
{
  if (self->_components)
  {
    uint64_t v2 = self->_physicalInput;
  }
  else
  {
    uint64_t v2 = [(GCController *)self _legacy_physicalInputProfile];
  }

  return v2;
}

- (GCExtendedGamepad)extendedGamepad
{
  if (self->_components)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v3 = self->_physicalInput;
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = [(GCController *)self _legacy_extendedGamepad];
  }

  return (GCExtendedGamepad *)v3;
}

- (GCGamepad)gamepad
{
  if (self->_components)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      char v3 = self->_physicalInput;
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = [(GCController *)self _legacy_gamepad];
  }

  return (GCGamepad *)v3;
}

- (GCMicroGamepad)microGamepad
{
  if (self->_components)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v3 = self->_physicalInput;
    }
    else
    {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = [(GCController *)self _legacy_microGamepad];
  }

  return (GCMicroGamepad *)v3;
}

- (GCMotion)motion
{
  if (self->_components)
  {
    uint64_t v2 = self->_motion;
  }
  else
  {
    uint64_t v2 = [(GCController *)self _legacy_motion];
  }

  return v2;
}

- (GCDeviceHaptics)haptics
{
  if (self->_components)
  {
    uint64_t v2 = [(GCDeviceHapticCapabilityInfo *)self->_hapticCapabilityInfo deviceHaptics];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (GCDeviceHaptics *)v2;
}

- (id)hapticEngines
{
  if (self->_components) {
    [(GCDeviceHapticCapabilityInfo *)self->_hapticCapabilityInfo hapticEngines];
  }
  else {
  uint64_t v2 = +[NSArray array];
  }

  return v2;
}

- (void)initializeHapticEngines
{
}

- (void)removeHapticEngines
{
}

- (GCDeviceLight)light
{
  if (self->_components)
  {
    uint64_t v2 = [(GCDeviceLightComponent *)self->_light light];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (GCDeviceLight *)v2;
}

+ (GCController)current
{
  if (current_onceToken != -1) {
    dispatch_once(&current_onceToken, &__block_literal_global_20);
  }
  uint64_t v2 = +[_GCControllerManager sharedInstance];
  char v3 = [v2 currentController];

  return (GCController *)v3;
}

uint64_t __23__GCController_current__block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:3];
}

- (void)_becomeCurrent
{
  id v3 = +[_GCControllerManager sharedInstance];
  [v3 setCurrentController:self];
}

+ (NSArray)controllers
{
  if (controllers_onceToken != -1) {
    dispatch_once(&controllers_onceToken, &__block_literal_global_267);
  }
  uint64_t v2 = +[_GCControllerManager sharedInstance];
  id v3 = [v2 controllers];

  return (NSArray *)v3;
}

uint64_t __27__GCController_controllers__block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:2];
}

+ (void)_startWirelessControllerDiscoveryWithCompanions:(BOOL)a3 btClassic:(BOOL)a4 btle:(BOOL)a5 completionHandler:(id)a6
{
}

+ (void)_startWirelessControllerDiscoveryWithBTClassic:(BOOL)a3 btle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = a5;
  if (gc_isInternalBuild())
  {
    long long v13 = getGCLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "startWirelessControllerDiscovery", buf, 2u);
    }
  }
  if (_startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler__onceToken != -1) {
    dispatch_once(&_startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler__onceToken, &__block_literal_global_269);
  }
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3020000000;
  int v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_2;
  v18[3] = &unk_26D22BFF0;
  v20 = buf;
  id v8 = v7;
  id v19 = v8;
  uint64_t v9 = (void *)MEMORY[0x223C6E420](v18);
  uint64_t v10 = v9;
  if (v6) {
    ++*((_DWORD *)v22 + 10);
  }
  if (v5) {
    ++*((_DWORD *)v22 + 10);
  }
  if (v6)
  {
    v11 = s_cbDelegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_3;
    block[3] = &unk_26D22C018;
    id v17 = v9;
    dispatch_async(v11, block);
  }
  if (v5)
  {
    long long v12 = s_cbDelegateQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_4;
    v14[3] = &unk_26D22C018;
    id v15 = v10;
    dispatch_async(v12, v14);
  }
  _Block_object_dispose(buf, 8);
}

void __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("wireless-discovery-queue", 0);
  v1 = (void *)s_cbDelegateQueue;
  s_cbDelegateQueue = (uint64_t)v0;
}

uint64_t __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_2(uint64_t result)
{
  if (!--*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)s_mbDelegate;
  if (!s_mbDelegate)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)s_mbDelegate;
    s_mbDelegate = v3;

    uint64_t v2 = (void *)s_mbDelegate;
  }
  [v2 setCompletionHandler:*(void *)(a1 + 32)];
  BOOL v5 = (void *)s_mbDelegate;

  return [v5 startScan];
}

void __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_4(uint64_t a1)
{
  if (s_cbDelegate)
  {
    [(id)s_cbDelegate setCompletionHandler:*(void *)(a1 + 32)];
    uint64_t v2 = (void *)s_cbDelegate;
    [v2 startScan];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)s_cbDelegate;
    s_cbDelegate = v3;

    id v5 = objc_alloc((Class)&off_26D2C8FB8);
    uint64_t v6 = s_cbDelegate;
    uint64_t v7 = s_cbDelegateQueue;
    uint64_t v10 = CBCentralManagerOptionShowPowerAlertKey;
    v11 = &__kCFBooleanFalse;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v5 initWithDelegate:v6 queue:v7 options:v8];

    [(id)s_cbDelegate setCentralManager:v9];
    [(id)s_cbDelegate setCompletionHandler:*(void *)(a1 + 32)];
  }
}

+ (void)startWirelessControllerDiscoveryWithCompletionHandler:(void *)completionHandler
{
}

+ (void)stopWirelessControllerDiscovery
{
  [(id)s_mbDelegate stopScan];
  uint64_t v2 = (void *)s_cbDelegate;

  [v2 stopScan];
}

- (void)_setSnapshot:(BOOL)a3
{
  self->_snapshot = a3;
}

- (GCController)capture
{
  uint64_t v3 = [(GCController *)self physicalInputProfile];
  id v4 = [v3 capture];

  id v5 = +[GCController snapshotWithProfile:v4];
  uint64_t v6 = [(GCController *)self motion];

  if (v6)
  {
    uint64_t v7 = [[GCMotion alloc] initWithController:v5];
    [(GCMotion *)v7 _setCompassEnabled:1];
    [(GCMotion *)v7 _setMotionLite:1];
    objc_msgSend(v4, "set_motion:", v7);
    id v8 = [v5 motion];
    uint64_t v9 = [(GCController *)self motion];
    [v8 setStateFromMotion:v9];
  }

  return (GCController *)v5;
}

+ (GCController)controllerWithMicroGamepad
{
  uint64_t v2 = [(GCPhysicalInputProfile *)[GCMicroGamepad alloc] initWithController:0];
  uint64_t v3 = [[GCController alloc] initWithProfile:v2];
  [(GCController *)v3 _setSnapshot:1];
  id v4 = [[GCMotion alloc] initWithController:v3];
  [(GCMotion *)v4 _setCompassEnabled:1];
  [(GCMotion *)v4 _setMotionLite:1];
  [(GCPhysicalInputProfile *)v2 set_motion:v4];

  return v3;
}

+ (GCController)controllerWithExtendedGamepad
{
  memset(v8, 0, 512);
  GCExtendedGamepadInitInfoMake(v8);
  for (uint64_t i = 8; i != 1592; i += 72)
    *((unsigned char *)v8 + i) = 1;
  uint64_t v3 = [[GCExtendedGamepad alloc] initWithController:0 initInfo:v8];
  id v4 = [[GCController alloc] initWithProfile:v3];
  [(GCController *)v4 _setSnapshot:1];
  id v5 = [[GCMotion alloc] initWithController:v4];
  [(GCMotion *)v5 _setHasAttitude:[(GCMotion *)v5 hasAttitude]];
  [(GCMotion *)v5 _setHasRotationRate:[(GCMotion *)v5 hasRotationRate]];
  [(GCPhysicalInputProfile *)v3 set_motion:v5];

  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v8 + j);

  return v4;
}

- (void)dealloc
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__5;
  v9[4] = __Block_byref_object_dispose__5;
  id v10 = (id)[(NSMutableArray *)self->_hidServices mutableCopy];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__5;
  v7[4] = __Block_byref_object_dispose__5;
  id v8 = self->_profile;
  hidServices = self->_hidServices;
  self->_hidServices = 0;

  profile = self->_profile;
  self->_profile = 0;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __23__GCController_dealloc__block_invoke;
  block[3] = &unk_26D22C040;
  void block[4] = v9;
  block[5] = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  v5.receiver = self;
  v5.super_class = (Class)GCController;
  [(GCController *)&v5 dealloc];
}

void __23__GCController_dealloc__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeAllObjects];
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

+ (BOOL)shouldMonitorBackgroundEvents
{
  return 0;
}

- (void)_triggerGameIntentLongPress
{
}

- (void)_triggerGameIntentShortPress
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (NSArray)components
{
  return self->_components;
}

- (void)controllerPausedHandler
{
  return self->_controllerPausedHandler;
}

- (void)setControllerPausedHandler:(void *)controllerPausedHandler
{
}

- (BOOL)isSnapshot
{
  return self->_snapshot;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_controllerPausedHandler, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_physicalDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_hidServices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_legacy_input, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_systemGesture, 0);
  objc_storeStrong((id *)&self->_gameIntent, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_hapticCapabilityInfo, 0);
  objc_storeStrong((id *)&self->_playerIndicator, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_motionConfigurableSensors, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

- (BOOL)isComponentBased
{
  return self->_components != 0;
}

- (GCControllerMotionConfigurableSensors)motionConfigurableSensors
{
  return self->_motionConfigurableSensors;
}

- (GCSystemGestureComponent)systemGestureComponent
{
  return self->_systemGesture;
}

- (id)controllerSettings
{
  return self->_settings;
}

- (void)_addComponent:(id)a3
{
  components = self->_components;
  id v5 = a3;
  uint64_t v6 = (NSArray *)[(NSArray *)components mutableCopy];
  [v5 setController:self];
  [(NSArray *)v6 addObject:v5];

  uint64_t v7 = self->_components;
  self->_components = v6;
}

- (id)_componentWithProtocol:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSArray *)self->_components mutableCopy];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 conformsToProtocol:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_componentOfClass:(Class)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[(NSArray *)self->_components mutableCopy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)_settingsSupportedForBLEDevice:(id)a3 settingsStore:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 identifier];
  uint64_t v7 = [v6 lowercaseString];

  if (v7)
  {
    +[GCController controllers];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v14 = [v13 persistentIdentifier];
          if (__80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke((uint64_t)v14, v14, v7))
          {
            uint64_t v15 = v13[9];

            if (v15)
            {
              LOBYTE(v21) = 1;
              v22 = v8;
              goto LABEL_24;
            }
          }
          else
          {
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v16 = objc_msgSend(v5, "controllers", 0);
    v22 = [v16 values];

    uint64_t v21 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v22);
          }
          id v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) persistentIdentifier];
          char v20 = __80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke((uint64_t)v19, v19, v7);

          if (v20)
          {
            LOBYTE(v21) = 1;
            goto LABEL_24;
          }
        }
        uint64_t v21 = [v22 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_24:
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

uint64_t __80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lowercaseString];
  uint64_t v6 = [v5 containsString:v4];

  return v6;
}

+ (BOOL)_settingsSupportedForBTClassicDevice:(id)a3 settingsStore:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 btAddressData];
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 length] == 6)
    {
      id v8 = (unsigned __int8 *)[v7 bytes];
      uint64_t v9 = +[NSString stringWithFormat:@"%02X-%02X-%02X-%02X-%02X-%02X", *v8, v8[1], v8[2], v8[3], v8[4], v8[5]];
      uint64_t v10 = +[GCController controllers];
      id v42 = 0;
      uint64_t v11 = +[NSRegularExpression regularExpressionWithPattern:@"([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})" options:1 error:&v42];
      id v12 = v42;
      if (v12)
      {
        LOBYTE(v13) = 0;
      }
      else
      {
        long long v31 = v5;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = __86__GCController_BluetoothSettings___settingsSupportedForBTClassicDevice_settingsStore___block_invoke;
        v40[3] = &unk_26D22C068;
        long long v29 = v11;
        id v41 = v11;
        long long v14 = (unsigned int (**)(void, void, void))MEMORY[0x223C6E420](v40);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v30 = v10;
        id v15 = v10;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(v15);
              }
              char v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v21 = [v20 persistentIdentifier];
              if (((unsigned int (**)(void, void *, NSObject *))v14)[2](v14, v21, v9))
              {
                uint64_t v22 = v20[9];

                if (v22) {
                  goto LABEL_27;
                }
              }
              else
              {
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v17);
        }

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v5 = v31;
        uint64_t v23 = [v31 controllers];
        id v15 = [v23 values];

        uint64_t v13 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
        if (v13)
        {
          uint64_t v24 = *(void *)v33;
LABEL_20:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v15);
            }
            long long v26 = [*(id *)(*((void *)&v32 + 1) + 8 * v25) persistentIdentifier];
            char v27 = ((unsigned int (**)(void, void *, NSObject *))v14)[2](v14, v26, v9);

            if (v27) {
              break;
            }
            if (v13 == ++v25)
            {
              uint64_t v13 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
              if (v13) {
                goto LABEL_20;
              }
              goto LABEL_28;
            }
          }
LABEL_27:
          LOBYTE(v13) = 1;
LABEL_28:
          id v5 = v31;
        }

        uint64_t v11 = v29;
        uint64_t v10 = v30;
        id v12 = 0;
      }

      goto LABEL_31;
    }
    if (gc_isInternalBuild())
    {
      uint64_t v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[GCController(BluetoothSettings) _settingsSupportedForBTClassicDevice:settingsStore:]((uint64_t)v7, v9);
      }
      LOBYTE(v13) = 0;
LABEL_31:

      goto LABEL_32;
    }
  }
  LOBYTE(v13) = 0;
LABEL_32:

  return v13;
}

BOOL __86__GCController_BluetoothSettings___settingsSupportedForBTClassicDevice_settingsStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL && v8 == 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v5, "substringWithRange:", v7, v8);
    uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

    BOOL v12 = [v11 caseInsensitiveCompare:v6] == 0;
  }

  return v12;
}

+ (BOOL)settingsSupportedForCBDevice:(id)a3
{
  id v4 = a3;
  if (settingsSupportedForCBDevice__onceToken != -1) {
    dispatch_once(&settingsSupportedForCBDevice__onceToken, &__block_literal_global_447);
  }
  if (([v4 deviceFlags] & 0x4000) != 0)
  {
    char v6 = [a1 _settingsSupportedForBTClassicDevice:v4 settingsStore:settingsSupportedForCBDevice___settingsStore];
LABEL_8:
    BOOL v5 = v6;
    goto LABEL_9;
  }
  if (([v4 deviceFlags] & 0x2000) != 0)
  {
    char v6 = [a1 _settingsSupportedForBLEDevice:v4 settingsStore:settingsSupportedForCBDevice___settingsStore];
    goto LABEL_8;
  }
  BOOL v5 = 0;
LABEL_9:

  return v5;
}

void __64__GCController_BluetoothSettings__settingsSupportedForCBDevice___block_invoke()
{
  dispatch_queue_t v0 = (void *)[objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
  v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
  }
  id v5 = v2;

  uint64_t v3 = [objc_alloc((Class)&off_26D2C9A10) initWithUserDefaults:v5];
  id v4 = (void *)settingsSupportedForCBDevice___settingsStore;
  settingsSupportedForCBDevice___settingsStore = v3;
}

+ (BOOL)userHasPairedGameController
{
  if (userHasPairedGameController_onceToken != -1) {
    dispatch_once(&userHasPairedGameController_onceToken, &__block_literal_global_459);
  }
  id v2 = (void *)userHasPairedGameController__defaults;

  return [v2 BOOLForKey:@"showGCPrefsPane"];
}

void __53__GCController_AppStore__userHasPairedGameController__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)&off_26D2BBC18) initWithSuiteName:@"com.apple.GameController"];
  v1 = (void *)userHasPairedGameController__defaults;
  userHasPairedGameController__defaults = v0;
}

+ (BOOL)userHasPairedGameControllerSupportingInteractionProfile:(id)a3
{
  return 1;
}

+ (BOOL)userHasRecentlyInstalledGameSupportingInteractionProfile:(id)a3
{
  return _os_feature_enabled_impl() ^ 1;
}

+ (void)__open__
{
}

void __32__GCController_Legacy____open____block_invoke()
{
  id v0 = +[_GCControllerManager sharedInstance];
  [v0 open];
}

+ (void)__openXPC__
{
}

void __35__GCController_Legacy____openXPC____block_invoke()
{
  id v0 = +[_GCControllerManager sharedInstance];
  [v0 open];
}

+ (void)__openXPC_and_CBApplicationDidBecomeActive__
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_98_0);
  if (GCApplicationIsAlmond())
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&unk_26D2878C8];
  }
}

void __68__GCController_Legacy____openXPC_and_CBApplicationDidBecomeActive____block_invoke()
{
  id v0 = +[_GCControllerManager sharedInstance];
  [v0 open];

  +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  -[_GCCurrentApplicationForegroundMonitor CBApplicationDidBecomeActive](v1);
}

+ (id)snapshotWithProfile:(id)a3
{
  id v3 = a3;
  id v4 = [GCController alloc];
  [(GCController *)v4 _setSnapshot:1];
  id v5 = [(GCController *)v4 initWithProfile:v3];

  return v5;
}

- (GCController)initWithProfile:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCController;
  char v6 = [(GCController *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handlerQueue, &_dispatch_main_q);
    uint64_t v8 = (NSMutableArray *)objc_alloc_init((Class)&off_26D2B4AE0);
    hidServices = v7->_hidServices;
    v7->_hidServices = v8;

    uint64_t v10 = +[NSUUID UUID];
    uint64_t v11 = [v10 UUIDString];
    [(GCController *)v7 setPhysicalDeviceUniqueID:v11];

    objc_storeStrong((id *)&v7->_profile, a3);
    [(GCNamedProfile *)v7->_profile setController:v7];
    if (gc_isInternalBuild())
    {
      uint64_t v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [(GCController *)v7 deviceHash];
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v14;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "DeviceHash: 0x%lx", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      id v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [(GCController *)v7 vendorName];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = (uint64_t)v16;
        _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      uint64_t v17 = getGCLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [(GCController *)v7 debugName];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = (uint64_t)v18;
        _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);
      }
    }
  }

  return v7;
}

- (GCController)initWithProfileClass:(Class)a3 serviceRef:(__IOHIDServiceClient *)a4
{
  v37.receiver = self;
  v37.super_class = (Class)GCController;
  char v6 = [(GCController *)&v37 init];
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = (NSMutableArray *)objc_alloc_init((Class)&off_26D2B4AE0);
  hidServices = v6->_hidServices;
  v6->_hidServices = v7;

  uint64_t v9 = (void *)[objc_alloc((Class)&off_26D2AD0D0) initWithService:a4];
  [(NSMutableArray *)v6->_hidServices addObject:v9];
  uint64_t v10 = [v9 stringPropertyForKey:@"PhysicalDeviceUniqueID"];
  [(GCController *)v6 setPhysicalDeviceUniqueID:v10];

  uint64_t v11 = [v9 numberPropertyForKey:@"UsesCompass"];
  -[GCController setPhysicalDeviceUsesCompass:](v6, "setPhysicalDeviceUsesCompass:", [v11 BOOLValue]);

  BOOL v12 = [v9 stringPropertyForKey:@"SerialNumber"];
  [(GCController *)v6 setUniqueIdentifier:v12];

  if (gc_isInternalBuild())
  {
    long long v28 = getGCLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v29 = [(GCController *)v6 physicalDeviceUsesCompass];
      *(_DWORD *)buf = 138413058;
      long long v39 = a4;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      Class v43 = a3;
      __int16 v44 = 1024;
      BOOL v45 = v29;
      _os_log_impl(&dword_220998000, v28, OS_LOG_TYPE_DEFAULT, "initWithServiceRef: \n%@...\n controller: %@, controllerClass: %@, %d", buf, 0x26u);
    }

    if (!a3) {
      goto LABEL_22;
    }
  }
  else if (!a3)
  {
LABEL_22:
    objc_storeStrong((id *)&v6->_handlerQueue, &_dispatch_main_q);
    [(GCController *)v6 setPlayerIndex:-1];

LABEL_23:
    long long v26 = v6;
    goto LABEL_24;
  }
  uint64_t v13 = [[a3 alloc] initWithController:v6];
  profile = v6->_profile;
  v6->_profile = (GCNamedProfile *)v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(GCNamedProfile *)v6->_profile conformsToProtocol:&unk_26D294150])
    {
      uint64_t v23 = [v9 numberPropertyForKey:@"ProductID"];
      int v24 = [v23 unsignedIntValue];

      if ((v24 & 0xFFFFFFFE) == 0x314) {
        uint64_t v25 = 6;
      }
      else {
        uint64_t v25 = 5;
      }
      [(GCNamedProfile *)v6->_profile setDeviceType:v25];
    }
    goto LABEL_19;
  }
  id v15 = v6->_profile;
  uint64_t v16 = [v9 numberPropertyForKey:@"VendorID"];
  int v17 = [v16 unsignedIntValue];

  uint64_t v18 = [v9 numberPropertyForKey:@"ProductID"];
  int v19 = [v18 unsignedIntValue];

  char v20 = [v9 stringPropertyForKey:@"Transport"];
  uint64_t v21 = v20;
  if (v17 != 76) {
    goto LABEL_16;
  }
  if (v19 == 621)
  {
    uint64_t v22 = 2;
    goto LABEL_15;
  }
  if (v19 != 614)
  {
LABEL_16:

LABEL_19:
    if (gc_isInternalBuild())
    {
      long long v30 = getGCLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [(GCController *)v6 deviceHash];
        *(_DWORD *)buf = 134217984;
        long long v39 = (__IOHIDServiceClient *)v31;
        _os_log_impl(&dword_220998000, v30, OS_LOG_TYPE_INFO, "DeviceHash: %lu", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      long long v32 = getGCLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        long long v33 = [(GCController *)v6 vendorName];
        *(_DWORD *)buf = 138412290;
        long long v39 = v33;
        _os_log_impl(&dword_220998000, v32, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      long long v34 = getGCLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        long long v35 = [(GCController *)v6 debugName];
        *(_DWORD *)buf = 138412290;
        long long v39 = v35;
        _os_log_impl(&dword_220998000, v34, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);
      }
    }
    goto LABEL_22;
  }
  if ([v20 isEqualToString:@"Rapport"])
  {
    uint64_t v22 = 4;
LABEL_15:
    [(GCNamedProfile *)v15 setDeviceType:v22];
    goto LABEL_16;
  }
  if ([v21 isEqualToString:@"BluetoothLowEnergy"])
  {
    uint64_t v22 = 1;
    goto LABEL_15;
  }
  if (gc_isInternalBuild())
  {
    long long v36 = getGCLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v36, OS_LOG_TYPE_DEFAULT, "App Store HID remote detected, rejecting.", buf, 2u);
    }
  }
  long long v26 = 0;
LABEL_24:

  return v26;
}

- (GCController)initWithServiceRef:(__IOHIDServiceClient *)a3
{
  id v5 = ControllerClassForService(a3);
  if (v5)
  {
    self = [(GCController *)self initWithProfileClass:v5 serviceRef:a3];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (GCController)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GCController;
  id v5 = [(GCController *)&v24 init];
  if (v5)
  {
    char v6 = (NSMutableArray *)objc_alloc_init((Class)&off_26D2B4AE0);
    hidServices = v5->_hidServices;
    v5->_hidServices = v6;

    int v8 = [v4 decodeBoolForKey:@"isExtended"];
    int v9 = [v4 decodeBoolForKey:@"hasMotion"];
    v5->_deviceHash = [v4 decodeInt64ForKey:@"deviceHash"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v10;

    if (gc_isInternalBuild())
    {
      uint64_t v18 = getGCLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [(GCController *)v5 deviceHash];
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v19;
        _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "DeviceHash: %lu", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      char v20 = getGCLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(GCController *)v5 vendorName];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v21;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);
      }
    }
    if (gc_isInternalBuild())
    {
      uint64_t v22 = getGCLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [(GCController *)v5 debugName];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v23;
        _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v5->_handlerQueue, &_dispatch_main_q);
    if (v8) {
      BOOL v12 = GCExtendedGamepadSnapshot;
    }
    else {
      BOOL v12 = GCGamepadSnapshot;
    }
    uint64_t v13 = [[v12 alloc] initWithController:v5];
    profile = v5->_profile;
    v5->_profile = (GCNamedProfile *)v13;

    if (v9 && [(GCNamedProfile *)v5->_profile conformsToProtocol:&unk_26D28E460])
    {
      id v15 = v5->_profile;
      uint64_t v16 = [[GCMotion alloc] initWithController:v5];
      if ([v4 decodeBoolForKey:@"hasCompass"]) {
        [(GCMotion *)v16 _setCompassEnabled:1];
      }
      [(GCNamedProfile *)v15 set_motion:v16];
    }
    -[GCController setPlayerIndex:](v5, "setPlayerIndex:", [v4 decodeIntegerForKey:@"playerIndex"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GCController *)self extendedGamepad];
  [v4 encodeBool:v5 != 0 forKey:@"isExtended"];

  char v6 = [(GCController *)self motion];
  [v4 encodeBool:v6 != 0 forKey:@"hasMotion"];

  uint64_t v7 = [(GCController *)self motion];
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v7, "hasAttitudeAndRotationRate"), @"hasCompass");

  objc_msgSend(v4, "encodeInteger:forKey:", -[GCController playerIndex](self, "playerIndex"), @"playerIndex");
  objc_msgSend(v4, "encodeInt64:forKey:", -[GCController deviceHash](self, "deviceHash"), @"deviceHash");
  id v8 = [(GCController *)self vendorName];
  [v4 encodeObject:v8 forKey:@"vendorName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCNamedProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSArray)hidServices
{
  return (NSArray *)self->_hidServices;
}

- (void)setHidServices:(id)a3
{
}

- (NSString)physicalDeviceUniqueID
{
  return self->_physicalDeviceUniqueID;
}

- (void)setPhysicalDeviceUniqueID:(id)a3
{
}

- (BOOL)physicalDeviceUsesCompass
{
  return self->_physicalDeviceUsesCompass;
}

- (void)setPhysicalDeviceUsesCompass:(BOOL)a3
{
  self->_physicalDeviceUsesCompass = a3;
}

- (unint64_t)deviceHash
{
  if (!self->_profile) {
    return 0;
  }
  unint64_t result = self->_deviceHash;
  if (!result)
  {
    if (![(NSMutableArray *)self->_hidServices count]
      || ([(NSMutableArray *)self->_hidServices objectAtIndexedSubscript:0],
          (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      self->_deviceHash = [(GCController *)self hash];
      return self->_deviceHash;
    }
    id v5 = (void *)v4;
    if ([(GCController *)self isATVRemote])
    {
      char v6 = [(GCController *)self profile];
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);

      int v9 = [(GCController *)self profile];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_15:
        if (gc_isInternalBuild())
        {
          uint64_t v21 = getGCLogger();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v8;
            _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_DEFAULT, "hashBase = %@", buf, 0xCu);
          }
        }
        self->_deviceHash = [v8 hash];

        return self->_deviceHash;
      }
      id v11 = [(GCController *)self profile];
      if ([v11 deviceType] == 4)
      {
        BOOL v12 = [(GCController *)self hidServices];
        uint64_t v13 = [v12 firstObject];
        uint64_t v14 = [v13 registryID];
        uint64_t v15 = [v14 description];

        id v8 = (void *)v15;
      }
    }
    else
    {
      uint64_t v16 = [v5 stringPropertyForKey:@"PhysicalDeviceUniqueID"];
      id v11 = v16;
      if (v16)
      {
        id v11 = v16;
        id v8 = v11;
      }
      else
      {
        int v17 = [v5 numberPropertyForKey:@"LocationID"];
        uint64_t v18 = [v5 numberPropertyForKey:@"VendorID"];
        uint64_t v19 = [v5 numberPropertyForKey:@"ProductID"];
        char v20 = [v5 registryID];
        id v8 = +[NSString stringWithFormat:@"%@ %@ %@ %@", v18, v19, v17, v20];
      }
    }

    goto LABEL_15;
  }
  return result;
}

- (void)setDeviceHash:(unint64_t)a3
{
  self->_deviceHash = a3;
}

- (NSString)debugName
{
  if (self->_vendorName || self->_deviceHash)
  {
    debugName = self->_debugName;
    if (!debugName)
    {
      uint64_t v4 = [(GCController *)self productCategory];
      id v5 = +[NSString stringWithFormat:@"%@ (0x%02lx)", v4, self->_deviceHash];
      char v6 = self->_debugName;
      self->_debugName = v5;

      debugName = self->_debugName;
    }
    uint64_t v7 = debugName;
  }
  else
  {
    uint64_t v7 = [(GCController *)self description];
  }

  return v7;
}

- (void)setDebugName:(id)a3
{
}

- (BOOL)isForwarded
{
  return self->_forwarded;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (BOOL)areAllHIDDevicesConnected
{
  return self->_allHIDDevicesConnected;
}

- (void)setAllHIDDevicesConnected:(BOOL)a3
{
  self->_allHIDDevicesConnected = a3;
}

- (BOOL)isPublished
{
  return self->_published;
}

- (void)setPublished:(BOOL)a3
{
  self->_published = a3;
}

- (BOOL)_legacy_isAttachedToDevice
{
  if (![(NSMutableArray *)self->_hidServices count]) {
    return 0;
  }
  id v3 = [(NSMutableArray *)self->_hidServices objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 numberPropertyForKey:@"GameControllerFormFitting"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_hidServices objectAtIndexedSubscript:0];
  id v8 = [v7 numberPropertyForKey:@"IAPHIDAccessoryCategory"];

  int v9 = [v8 intValue];
  if (v9 == 3) {
    char v10 = 1;
  }
  else {
    char v10 = v5;
  }
  if (v9 == 4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v10;
  }

  return v6;
}

- (id)_legacy_vendorName
{
  p_vendorName = (id *)&self->_vendorName;
  if (self->_vendorName) {
    goto LABEL_16;
  }
  profile = self->_profile;
  char v5 = @"Generic Controller";
  if (!profile) {
    goto LABEL_17;
  }
  if ([(GCNamedProfile *)profile conformsToProtocol:&unk_26D294150])
  {
    if (![(GCController *)self displayTrueSiriRemoteName])
    {
      id v7 = *p_vendorName;
      id *p_vendorName = @"Remote";
      goto LABEL_15;
    }
    BOOL allHIDDevicesConnected = self->_allHIDDevicesConnected;
    VendorNameForATVProfile(self->_profile);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    char v5 = +[NSString stringWithFormat:@"%@%@", v7, &stru_26D27BBB8];
    if (!allHIDDevicesConnected)
    {

      goto LABEL_17;
    }
    id v8 = *p_vendorName;
    goto LABEL_9;
  }
  if (![(NSMutableArray *)self->_hidServices count])
  {
    if ([(GCNamedProfile *)self->_profile conformsToProtocol:&unk_26D28E460])
    {
      uint64_t v10 = [(GCNamedProfile *)self->_profile name];
      id v7 = *p_vendorName;
      id *p_vendorName = (id)v10;
    }
    else
    {
      id v7 = *p_vendorName;
      id *p_vendorName = @"Generic Controller";
    }
    goto LABEL_15;
  }
  int v9 = [(NSMutableArray *)self->_hidServices objectAtIndexedSubscript:0];
  id v7 = [v9 stringPropertyForKey:@"Product"];

  objc_storeStrong(p_vendorName, v7);
  id v8 = *p_vendorName;
  if (!*p_vendorName)
  {
LABEL_9:
    id *p_vendorName = v5;
  }
LABEL_15:

LABEL_16:
  char v5 = (__CFString *)*p_vendorName;
LABEL_17:

  return v5;
}

- (void)setVendorName:(id)a3
{
}

- (BOOL)displayTrueSiriRemoteName
{
  if (displayTrueSiriRemoteName_onceToken != -1) {
    dispatch_once(&displayTrueSiriRemoteName_onceToken, &__block_literal_global_275);
  }
  return displayTrueSiriRemoteName_displayTrueSiriRemoteName;
}

void __49__GCController_Legacy__displayTrueSiriRemoteName__block_invoke()
{
  id v0 = +[NSUserDefaults standardUserDefaults];
  displayTrueSiriRemoteName_displayTrueSiriRemoteName = [v0 BOOLForKey:@"displayTrueSiriRemoteName"];
}

- (id)_legacy_productCategory
{
  return (id)[(GCNamedProfile *)self->_profile productCategory];
}

- (BOOL)_legacy_isEqualToController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(GCController *)self deviceHash];
  if (v5 == [v4 deviceHash])
  {
    id v21 = v4;
    BOOL v6 = [v4 hidServices];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v43 = 0;
      __int16 v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__8;
      v47 = __Block_byref_object_dispose__8;
      id v48 = 0;
      uint64_t v37 = 0;
      long long v38 = &v37;
      uint64_t v39 = 0x3032000000;
      __int16 v40 = __Block_byref_object_copy__8;
      id v41 = __Block_byref_object_dispose__8;
      id v42 = 0;
      id v8 = +[_GCControllerManager sharedInstance];
      int v9 = [v8 controllersQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __52__GCController_Legacy___legacy_isEqualToController___block_invoke;
      block[3] = &unk_26D22CC80;
      long long v35 = &v43;
      long long v36 = &v37;
      id v33 = v4;
      long long v34 = self;
      dispatch_barrier_sync(v9, block);

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      obuint64_t j = (id)v44[5];
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v50 count:16];
      if (v10)
      {
        uint64_t v23 = *(void *)v29;
        while (1)
        {
          uint64_t v11 = 0;
LABEL_6:
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          BOOL v12 = [*(id *)(*((void *)&v28 + 1) + 8 * v11) numberPropertyForKey:@"LocationID"];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = (id)v38[5];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v49 count:16];
          if (!v14) {
            break;
          }
          uint64_t v15 = *(void *)v25;
LABEL_10:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v13);
            }
            int v17 = [*(id *)(*((void *)&v24 + 1) + 8 * v16) numberPropertyForKey:@"LocationID"];
            char v18 = [v12 isEqualToNumber:v17];

            if (v18) {
              break;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v49 count:16];
              if (v14) {
                goto LABEL_10;
              }
              goto LABEL_21;
            }
          }

          if (++v11 != v10) {
            goto LABEL_6;
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v50 count:16];
          BOOL v19 = 1;
          if (!v10) {
            goto LABEL_24;
          }
        }
LABEL_21:

        BOOL v19 = 0;
      }
      else
      {
        BOOL v19 = 1;
      }
LABEL_24:

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v43, 8);
    }
    else
    {
      BOOL v19 = 1;
    }
    id v4 = v21;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void __52__GCController_Legacy___legacy_isEqualToController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hidServices];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = [*(id *)(a1 + 40) hidServices];
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)_legacy_invalidateDescription
{
  description = self->_description;
  self->_description = 0;

  debugName = self->_debugName;
  self->_debugName = 0;
}

- (id)_legacy_description
{
  description = self->_description;
  if (description) {
    goto LABEL_5;
  }
  uint64_t v4 = [(GCController *)self vendorName];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    unint64_t v6 = [(GCController *)self deviceHash];

    if (v6)
    {
      uint64_t v7 = [(GCController *)self productCategory];
      id v8 = +[NSString stringWithFormat:@"<GCController %p ('%@' - 0x%lx)>", self, v7, [(GCController *)self deviceHash]];
      id v9 = self->_description;
      self->_description = v8;

      description = self->_description;
LABEL_5:
      uint64_t v10 = description;
      goto LABEL_7;
    }
  }
  uint64_t v11 = [(GCController *)self productCategory];
  uint64_t v10 = +[NSString stringWithFormat:@"<GCController %p ('%@' - 0x%lx)>", self, v11, [(GCController *)self deviceHash]];

LABEL_7:

  return v10;
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
}

- (void)createInputBufferForDevice:(__IOHIDDevice *)a3 withSize:(unint64_t)a4
{
  return 0;
}

- (void)addServiceRefs:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(a3, "hidServices", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_hidServices addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addServiceRefsWithDevice:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(a3, "hidServices", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_hidServices addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addServiceRef:(id)a3
{
}

- (BOOL)hasServiceRef:(__IOHIDServiceClient *)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(GCController *)self hidServices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((__IOHIDServiceClient *)[*(id *)(*((void *)&v11 + 1) + 8 * i) service] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)removeServiceRef:(__IOHIDServiceClient *)a3
{
  if (-[GCController hasServiceRef:](self, "hasServiceRef:"))
  {
    uint64_t v5 = +[_GCControllerManager sharedInstance];
    uint64_t v6 = [v5 controllersQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __41__GCController_Legacy__removeServiceRef___block_invoke;
    v7[3] = &unk_26D22B928;
    v7[4] = self;
    void v7[5] = a3;
    dispatch_barrier_sync(v6, v7);
  }
}

void __41__GCController_Legacy__removeServiceRef___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "service", (void)v9) == *(void *)(a1 + 40)) {
          [*(id *)(*(void *)(a1 + 32) + 160) removeObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)clearServiceRef
{
}

- (BOOL)isATVRemote
{
  id v3 = [(GCController *)self profile];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(GCController *)self profile];
  char v5 = [v4 conformsToProtocol:&unk_26D294150];

  return v5;
}

- (unsigned)sampleRate
{
  id v3 = [(GCController *)self profile];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(GCController *)self profile];
  unsigned int v6 = [v5 sampleRate];

  return v6;
}

- (int64_t)_legacy_playerIndex
{
  return self->_playerIndex;
}

- (void)_legacy_setPlayerIndex:(int64_t)a3
{
  if (a3 < 0) {
    a3 = -1;
  }
  self->_int64_t playerIndex = a3;
  -[GCNamedProfile setPlayerIndex:](self->_profile, "setPlayerIndex:");
}

- (id)_legacy_input
{
  legacy_input = self->_legacy_input;
  if (legacy_input)
  {
    char v4 = [(_GCDevicePhysicalInputComponent *)(id *)&legacy_input->super.super.isa defaultPhysicalInput];
    char v5 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v4);
  }
  else
  {
    unsigned int v6 = self;
    objc_sync_enter(v6);
    if (!self->_legacy_input)
    {
      uint64_t v7 = [GCControllerLiveInput alloc];
      uint64_t v8 = objc_opt_new();
      long long v9 = [(_GCDevicePhysicalInputFacade *)v7 initWithParameters:v8];

      long long v10 = +[NSSet set];
      long long v11 = [_GCDevicePhysicalInput alloc];
      long long v12 = +[NSSet set];
      long long v13 = [(_GCDevicePhysicalInput *)v11 initWithFacade:v9 elements:v10 attributes:v12];

      long long v14 = [_GCDevicePhysicalInput alloc];
      uint64_t v15 = +[NSSet setWithObject:@"unmapped"];
      uint64_t v16 = [(_GCDevicePhysicalInput *)v14 initWithFacade:v9 elements:v10 attributes:v15];

      int v17 = [_GCControllerInputComponent alloc];
      char v18 = +[NSUUID UUID];
      v25[0] = v13;
      v25[1] = v16;
      BOOL v19 = +[NSArray arrayWithObjects:v25 count:2];
      char v20 = [(_GCDevicePhysicalInputComponent *)v17 initWithIdentifier:v18 physicalInputs:v19];
      id v21 = self->_legacy_input;
      self->_legacy_input = v20;
    }
    objc_sync_exit(v6);

    uint64_t v23 = [(_GCDevicePhysicalInputComponent *)(id *)&self->_legacy_input->super.super.isa defaultPhysicalInput];
    char v5 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v23);
  }

  return v5;
}

- (id)_legacy_physicalInputProfileName
{
  id v2 = [(GCController *)self profile];
  id v3 = [v2 name];

  return v3;
}

- (id)_legacy_physicalInputProfile
{
  return self->_profile;
}

- (id)_legacy_gamepad
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v3 = self->_profile;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_legacy_microGamepad
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  profile = self->_profile;
  if (isKindOfClass) {
    goto LABEL_5;
  }
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
  profile = self->_profile;
  if (v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    profile = self->_profile;
LABEL_5:
    unsigned int v6 = profile;
    goto LABEL_6;
  }
  unsigned int v6 = 0;
LABEL_6:

  return v6;
}

- (id)_legacy_extendedGamepad
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_profile;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_legacy_keyboard
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_profile;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_legacy_mouse
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->_profile;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_legacy_motion
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(GCNamedProfile *)self->_profile performSelector:sel__motion];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_legacy_batteryStatus
{
  return 0;
}

@end