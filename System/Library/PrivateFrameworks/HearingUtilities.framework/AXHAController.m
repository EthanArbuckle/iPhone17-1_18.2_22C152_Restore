@interface AXHAController
+ (id)descriptionForHandoffReason:(int64_t)a3;
+ (id)sharedController;
- (AXHAController)init;
- (BOOL)hearingAidsIsLEA2:(id)a3;
- (BOOL)hearingAidsPaired;
- (HCXPCMessage)liveListenMessage;
- (HUAudioHalController)audioHalController;
- (NSDictionary)availableControllersPayload;
- (NSDictionary)availableDevicesDescription;
- (NSString)pairedDeviceUUID;
- (OS_os_transaction)transaction;
- (id)_registerForLiveListenUpdates_BOOLValue:(id)a3;
- (id)_toggleLiveListen_BOOLValue:(id)a3;
- (id)connectToControllerWithID:(id)a3;
- (id)currentDeviceController;
- (id)disconnectAndForceClient:(id)a3;
- (id)liveListenController;
- (id)readAvailableControllers:(id)a3;
- (id)readAvailableDevices:(id)a3;
- (id)readDeviceProperty:(id)a3;
- (id)registerForAvailableDevicesUpdates:(id)a3;
- (id)registerForControlMessageUpdates:(id)a3;
- (id)registerForDeviceUpdates:(id)a3;
- (id)sendMessagesPriority:(id)a3;
- (id)writeDeviceProperty:(id)a3;
- (void)availableRemoteControllersDidChange;
- (void)cleanUp;
- (void)connectToPairedDevice;
- (void)dealloc;
- (void)liveListenControllerStateDidChange;
- (void)processPropertyUpdates:(id)a3 isLocal:(BOOL)a4;
- (void)readLiveListenLevels;
- (void)sendAvailabilityDidChangeNotification;
- (void)sendUpdatesForProperties:(id)a3 excludingClient:(id)a4;
- (void)setAudioHalController:(id)a3;
- (void)setAvailableControllersPayload:(id)a3;
- (void)setAvailableDevicesDescription:(id)a3;
- (void)setListenForAvailableDeviceUpdates:(BOOL)a3;
- (void)setLiveListenMessage:(id)a3;
- (void)setPairedDeviceUUID:(id)a3;
- (void)setPairedHearingAidID:(id)a3;
- (void)setTransaction:(id)a3;
- (void)transitionToPeer;
- (void)updateNearbyDeviceAvailabilityWithForce:(BOOL)a3;
- (void)willSwitchUser;
@end

@implementation AXHAController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1) {
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedController_Controller_0;

  return v2;
}

uint64_t __34__AXHAController_sharedController__block_invoke()
{
  sharedController_Controller_0 = objc_alloc_init(AXHAController);

  return MEMORY[0x270F9A758]();
}

+ (id)descriptionForHandoffReason:(int64_t)a3
{
  if (descriptionForHandoffReason__onceToken != -1) {
    dispatch_once(&descriptionForHandoffReason__onceToken, &__block_literal_global_2);
  }
  if ([(id)descriptionForHandoffReason__HandoffReasonDeacription count] <= (unint64_t)a3)
  {
    v4 = @"Unknown";
  }
  else
  {
    v4 = [(id)descriptionForHandoffReason__HandoffReasonDeacription objectAtIndexedSubscript:a3];
  }

  return v4;
}

void __46__AXHAController_descriptionForHandoffReason___block_invoke()
{
  v0 = (void *)descriptionForHandoffReason__HandoffReasonDeacription;
  descriptionForHandoffReason__HandoffReasonDeacription = (uint64_t)&unk_26C1E5D60;
}

- (void)cleanUp
{
}

- (AXHAController)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXHAController;
  v2 = [(AXHAController *)&v18 init];
  if (v2)
  {
    v3 = +[HUHearingAidSettings sharedInstance];
    id v4 = (id)[v3 pairedHearingAids];

    objc_initWeak(&location, v2);
    v5 = +[HUHearingAidSettings sharedInstance];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __22__AXHAController_init__block_invoke;
    v15 = &unk_2640FC910;
    objc_copyWeak(&v16, &location);
    [v5 registerUpdateBlock:&v12 forRetrieveSelector:sel_pairedHearingAids withListener:v2];

    v6 = +[HUNearbyHearingAidController sharedInstance];
    [v6 setDelegate:v2];

    if ([(AXHAController *)v2 hearingAidsPaired])
    {
      [(AXHAController *)v2 setListenForAvailableDeviceUpdates:1];
      v7 = +[HUNearbyHearingAidController sharedInstance];
      [v7 start];
    }
    if ([MEMORY[0x263F472B0] deviceIsMultiUser])
    {
      v8 = [getUMUserManagerClass() sharedManager];
      [v8 registerUserSwitchStakeHolder:v2];
    }
    v9 = objc_alloc_init(HUAudioHalController);
    audioHalController = v2->_audioHalController;
    v2->_audioHalController = v9;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__AXHAController_init__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v2 = [NSString stringWithFormat:@"Updated"];
  v3 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController init]_block_invoke", 107, v2];
  id v4 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7 = +[HUHearingAidSettings sharedInstance];
  v8 = [v7 pairedHearingAids];

  if (v8)
  {
    WeakRetained = +[AXHearingAidDeviceController sharedController];
    [WeakRetained checkPartiallyPairedWithCompletion:&__block_literal_global_31];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setPairedHearingAidID:0];
  }
}

void __22__AXHAController_init__block_invoke_28(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = +[HUNearbyHearingAidController sharedInstance];
    [v3 start];
  }
}

- (void)dealloc
{
  [(AXHAController *)self setPairedDeviceUUID:0];
  [(AXHAController *)self setAvailableDevicesDescription:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXHAController;
  [(AXHAController *)&v4 dealloc];
}

- (void)willSwitchUser
{
  id v3 = [getUMUserManagerClass() sharedManager];
  char v4 = [v3 isLoginSession];

  if ((v4 & 1) == 0)
  {
    [(AXHAController *)self setPairedHearingAidID:0];
  }
}

- (id)currentDeviceController
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = +[AXHearingAidDeviceController sharedController];
  char v4 = [(AXHAController *)self pairedDeviceUUID];
  id v5 = [v3 hearingAidForDeviceID:v4];

  if ([v5 leftAvailable]) {
    int v6 = 0;
  }
  else {
    int v6 = [v5 rightAvailable] ^ 1;
  }
  v7 = +[AXHearingAidDeviceController sharedController];
  if ([v7 isConnected])
  {

LABEL_12:
    v34 = v5;
    HAInitializeLogging();
    v32 = NSString;
    v33 = +[AXHearingAidDeviceController sharedController];
    unsigned int v16 = [v33 isConnected];
    v17 = +[AXHearingAidDeviceController sharedController];
    objc_super v18 = [(AXHAController *)self pairedDeviceUUID];
    v19 = [v17 hearingAidForDeviceID:v18];
    unsigned int v20 = [v19 isConnecting];
    v21 = +[HUNearbyHearingAidController sharedInstance];
    uint64_t v22 = [v21 state];
    v23 = +[AXHearingAidDeviceController sharedController];
    v24 = [(AXHAController *)self pairedDeviceUUID];
    v25 = [v23 hearingAidForDeviceID:v24];
    v26 = [v32 stringWithFormat:@"Current controller is device %d, %d, %d - %@", v16, v20, v22, v25];

    v27 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController currentDeviceController]", 172, v26];
    v28 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v27;
      v30 = v28;
      *(_DWORD *)buf = 136446210;
      uint64_t v36 = [v29 UTF8String];
      _os_log_impl(&dword_20CC86000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v15 = +[AXHearingAidDeviceController sharedController];
    id v5 = v34;
    goto LABEL_15;
  }
  if (([v5 isConnecting] ^ 1 | v6) == 1)
  {
  }
  else
  {
    v8 = +[HUNearbyHearingAidController sharedInstance];
    uint64_t v9 = [v8 state];

    if (v9 != 2) {
      goto LABEL_12;
    }
  }
  HAInitializeLogging();
  v10 = [NSString stringWithFormat:@"Current controller is nearby"];
  uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController currentDeviceController]", 175, v10];
  uint64_t v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    v14 = v12;
    *(_DWORD *)buf = 136446210;
    uint64_t v36 = [v13 UTF8String];
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v15 = +[HUNearbyHearingAidController sharedInstance];
LABEL_15:

  return v15;
}

- (BOOL)hearingAidsPaired
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v2 = NSString;
  id v3 = +[HUHearingAidSettings sharedInstance];
  char v4 = [v3 pairedHearingAids];
  id v5 = objc_msgSend(v2, "stringWithFormat:", @"Checking paired %d", v4 != 0);

  int v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController hearingAidsPaired]", 184, v5];
  v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v10 = +[HUHearingAidSettings sharedInstance];
  uint64_t v11 = [v10 pairedHearingAids];
  BOOL v12 = v11 != 0;

  return v12;
}

- (void)setListenForAvailableDeviceUpdates:(BOOL)a3
{
  if (self->_isListening != a3)
  {
    BOOL v3 = a3;
    self->_isListening = a3;
    id v5 = +[AXHearingAidDeviceController sharedController];
    id v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke;
      v7[3] = &unk_2640FDB50;
      v7[4] = self;
      [v5 searchForAvailableDevicesWithCompletion:v7];
    }
    else
    {
      [v5 stopSearching];
    }
  }
}

void __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = +[AXHearingAidDeviceController sharedController];
  id v5 = [*(id *)(a1 + 32) pairedDeviceUUID];
  id v6 = [v4 hearingAidForDeviceID:v5];

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke_2;
  v25 = &unk_2640FDB28;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v26 = v8;
  uint64_t v27 = v9;
  id v10 = v7;
  id v28 = v10;
  [v3 enumerateObjectsUsingBlock:&v22];

  if (![v10 count])
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    [v10 setObject:v11 forKey:@"No_HA_Devices"];
  }
  HAInitializeLogging();
  BOOL v12 = [NSString stringWithFormat:@"Available Devices: %@", v10];
  id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke", 246, v12, v22, v23, v24, v25];
  v14 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    uint64_t v16 = v14;
    uint64_t v17 = [v15 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v30 = v17;
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setAvailableDevicesDescription:v10];
  objc_super v18 = +[AXHeardController sharedServer];
  v19 = (void *)MEMORY[0x263F472C0];
  unsigned int v20 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v10 andIdentifier:32];
  v21 = [v19 messageWithPayload:v20];
  [v18 sendUpdateMessage:v21 forIdentifier:32];
}

void __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (([v6 isPaired] & 1) != 0 || objc_msgSend(v6, "isPersistent"))
  {
    char v7 = [v6 isEqual:*(void *)(a1 + 32)];
    id v8 = (os_log_t *)MEMORY[0x263F47290];
    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      uint64_t v9 = NSString;
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [v6 deviceUUID];
      BOOL v12 = [v9 stringWithFormat:@"Changing pairing %@ - %@", v10, v11];

      id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke_2", 205, v12];
      os_log_t v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v13;
        uint64_t v16 = v14;
        *(_DWORD *)buf = 136446210;
        uint64_t v39 = [v15 UTF8String];
        _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v17 = *(void **)(a1 + 40);
      objc_super v18 = [v6 deviceUUID];
      [v17 setPairedHearingAidID:v18];

      v19 = +[AXHeardController sharedServer];
      unsigned int v20 = (void *)MEMORY[0x263F472C0];
      v21 = (void *)MEMORY[0x263F472B0];
      uint64_t v22 = [v6 deviceDescription];
      uint64_t v23 = [v21 messagePayloadFromDictionary:v22 andIdentifier:64];
      v24 = [v20 messageWithPayload:v23];
      [v19 sendUpdateMessage:v24 forIdentifier:64];
    }
    if ([v6 didLoadPersistentProperties])
    {
      v25 = +[HUHearingAidSettings sharedInstance];
      char v26 = [v25 isiCloudPaired];

      if ((v26 & 1) == 0)
      {
        uint64_t v27 = *(void **)(a1 + 48);
        id v28 = [v6 deviceDescription];
        [v27 setDictionary:v28];

        *a4 = 1;
      }
    }
    else
    {
      HAInitializeLogging();
      id v29 = [NSString stringWithFormat:@"Missing info %@", v6];
      uint64_t v30 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke", 213, v29];
      os_log_t v31 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = v30;
        v33 = v31;
        uint64_t v34 = [v32 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v39 = v34;
        _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [*(id *)(a1 + 40) setPairedHearingAidID:0];
    }
  }
  v35 = [v6 leftPeripheralUUID];
  if (!v35)
  {
    [v6 rightPeripheralUUID];
  }
  [v6 availableInputEars];
  [v6 earsSupportingWatch];
  [*(id *)(a1 + 40) hearingAidsIsLEA2:v6];
  uint64_t v36 = *(void **)(a1 + 48);
  uint64_t v37 = [v6 deviceDescription];
  [v36 addEntriesFromDictionary:v37];
}

- (BOOL)hearingAidsIsLEA2:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 availableInputEars];
  id v5 = [v3 leftPeripheralUUID];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [v3 rightPeripheralUUID];
    BOOL v6 = v7 != 0;
  }
  id v8 = +[HUHearingAidSettings sharedInstance];
  uint64_t v9 = [v8 hearingAidsLEAVersionFromiCloud];

  HAInitializeLogging();
  uint64_t v10 = NSString;
  uint64_t v11 = [v3 name];
  BOOL v12 = +[HUHearingAidSettings sharedInstance];
  id v13 = [v10 stringWithFormat:@" %@ LEA version from iCloud: %d, real hearing aids: %d, iCloud paired: %d, available input ears: %d", v11, v9 == 2, v6, objc_msgSend(v12, "isiCloudPaired"), objc_msgSend(v3, "availableInputEars")];

  os_log_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController hearingAidsIsLEA2:]", 267, v13];
  id v15 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v16 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v14;
    objc_super v18 = v16;
    id v15 = (os_log_t *)MEMORY[0x263F47290];
    *(_DWORD *)buf = 136446210;
    uint64_t v31 = [v17 UTF8String];
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  char v19 = !v6;
  if (!v4) {
    char v19 = 1;
  }
  if (v9 == 2) {
    char v20 = 0;
  }
  else {
    char v20 = v19;
  }
  if ((v20 & 1) == 0)
  {
    HAInitializeLogging();
    v21 = NSString;
    uint64_t v22 = [v3 name];
    uint64_t v23 = [v21 stringWithFormat:@" %@ is LEA 2.0", v22];

    v24 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController hearingAidsIsLEA2:]", 271, v23];
    os_log_t v25 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v24;
      uint64_t v27 = v25;
      uint64_t v28 = [v26 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v31 = v28;
      _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

  return v20 ^ 1;
}

- (void)setPairedHearingAidID:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[AXHearingAidDeviceController sharedController];
  BOOL v6 = [v5 hearingAidForDeviceID:v4];

  char v7 = +[AXHearingAidDeviceController sharedController];
  id v8 = [(AXHAController *)self pairedDeviceUUID];
  uint64_t v9 = [v7 hearingAidForDeviceID:v8];

  HAInitializeLogging();
  uint64_t v10 = NSString;
  uint64_t v11 = [v6 deviceUUID];
  BOOL v12 = [v10 stringWithFormat:@"%d, %d, %d - %@ - %@ == %d, %@", objc_msgSend(v9, "containsPeripheralWithUUID:", v11), objc_msgSend(v9, "hasConnection") ^ 1, objc_msgSend(v6, "hasConnection"), v4, v9, objc_msgSend(v6, "didLoadPersistentProperties"), v6];

  id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setPairedHearingAidID:]", 284, v12];
  os_log_t v14 = (os_log_t *)MEMORY[0x263F47290];
  id v15 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v13;
    id v17 = v15;
    *(_DWORD *)buf = 136446210;
    uint64_t v56 = [v16 UTF8String];
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  objc_super v18 = [v6 deviceUUID];
  int v19 = [v9 containsPeripheralWithUUID:v18];

  if (v19 && (([v9 hasConnection] & 1) != 0 || !objc_msgSend(v6, "hasConnection"))
    || ([v6 didLoadPersistentProperties] & 1) == 0 && v6)
  {
    if (!v4) {
LABEL_22:
    }
      [(AXHAController *)self cleanUp];
  }
  else
  {
    [v9 setKeepInSync:0];
    if ((v19 & 1) == 0) {
      [v9 disconnectAndUnpair:1];
    }
    [v9 setIsPaired:0];
    char v20 = [v6 deviceUUID];
    [(AXHAController *)self setPairedDeviceUUID:v20];

    v21 = [(AXHAController *)self currentDeviceController];
    [v21 stopPropertyUpdates];

    if (!v4)
    {
      v24 = +[AXHearingAidDeviceController sharedController];
      [v24 forgetDevice:v9];

      if ((liveListenStreamSelected() & 1) == 0)
      {
        os_log_t v25 = [(AXHAController *)self liveListenController];
        [v25 stopListeningWithCompletion:0];
      }
      [(AXHAController *)self setListenForAvailableDeviceUpdates:0];
      id v26 = +[HUNearbyHearingAidController sharedInstance];
      [v26 stop];

      [(AXHAController *)self availableRemoteControllersDidChange];
      HAInitializeLogging();
      uint64_t v27 = [NSString stringWithFormat:@"Hearing aids unpaired. Updated available controllers"];
      uint64_t v28 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setPairedHearingAidID:]", 352, v27];
      os_log_t v29 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = v28;
        uint64_t v31 = v29;
        uint64_t v32 = [v30 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v56 = v32;
        _os_log_impl(&dword_20CC86000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v33 = +[AXHeardController sharedServer];
      uint64_t v34 = (void *)MEMORY[0x263F472C0];
      v35 = (void *)MEMORY[0x263F472B0];
      v53 = @"No_HA_Devices";
      uint64_t v36 = [MEMORY[0x263EFF9D0] null];
      v54 = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      v38 = [v35 messagePayloadFromDictionary:v37 andIdentifier:32];
      uint64_t v39 = [v34 messageWithPayload:v38];
      [v33 sendUpdateMessage:v39 forIdentifier:32];

      goto LABEL_22;
    }
    uint64_t v22 = (void *)os_transaction_create();
    [(AXHAController *)self setTransaction:v22];

    [v6 setIsPaired:1];
    if (([v6 isConnected] & 1) == 0) {
      [v6 connect];
    }
    [v6 setKeepInSync:1];
    if ([(AXHAController *)self hearingAidsPaired])
    {
      uint64_t v23 = +[HUNearbyHearingAidController sharedInstance];
      [v23 start];
    }
    else
    {
      HAInitializeLogging();
      uint64_t v23 = [NSString stringWithFormat:@"Skipping nearby because no hearing aids paired."];
      uint64_t v40 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController setPairedHearingAidID:]", 318, v23];
      os_log_t v41 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = v40;
        v43 = v41;
        uint64_t v44 = [v42 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v56 = v44;
        _os_log_impl(&dword_20CC86000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }

    v45 = +[AXHearingAidDeviceController sharedController];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __40__AXHAController_setPairedHearingAidID___block_invoke;
    v52[3] = &unk_2640FCA50;
    v52[4] = self;
    [v45 checkPartiallyPairedWithCompletion:v52];

    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __40__AXHAController_setPairedHearingAidID___block_invoke_2;
    v51[3] = &unk_2640FDB78;
    v51[4] = self;
    v46 = (void *)MEMORY[0x2105575F0](v51);
    v47 = +[AXHearingAidDeviceController sharedController];
    [v47 registerForPropertyUpdates:v46];

    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __40__AXHAController_setPairedHearingAidID___block_invoke_3;
    v50[3] = &unk_2640FDB78;
    v50[4] = self;
    v48 = (void *)MEMORY[0x2105575F0](v50);
    v49 = +[HUNearbyHearingAidController sharedInstance];
    [v49 registerForPropertyUpdates:v48];

    [(AXHAController *)self setTransaction:0];
  }
}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) setListenForAvailableDeviceUpdates:0];
  }
  return result;
}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processPropertyUpdates:a2 isLocal:1];
}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processPropertyUpdates:a2 isLocal:0];
}

- (void)processPropertyUpdates:(id)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v6 = (void *)[a3 copy];
  HAInitializeLogging();
  char v7 = [NSString stringWithFormat:@"UPDATE isLocal %d %@", v4, v6];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController processPropertyUpdates:isLocal:]", 366, v7];
  uint64_t v9 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v8;
    BOOL v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v35 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v13 = [(AXHAController *)self pairedDeviceUUID];
  os_log_t v14 = [v6 objectForKey:v13];
  id v15 = [v14 objectForKey:&unk_26C1E5630];

  if (v15)
  {
    id v16 = +[AXHearingAidDeviceController sharedController];
    id v17 = [(AXHAController *)self pairedDeviceUUID];
    objc_super v18 = [v16 hearingAidForDeviceID:v17];

    if (([v18 hasConnection] & 1) == 0 && (liveListenStreamSelected() & 1) == 0)
    {
      int v19 = [(AXHAController *)self liveListenController];
      [v19 stopListeningWithCompletion:0];
    }
    HAInitializeLogging();
    char v20 = [NSString stringWithFormat:@"Connection status changed. Updated available controllers"];
    v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController processPropertyUpdates:isLocal:]", 378, v20];
    os_log_t v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      v24 = v22;
      uint64_t v25 = [v23 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = v25;
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(AXHAController *)self availableRemoteControllersDidChange];
  }
  if ([(AXHAController *)self hearingAidsPaired])
  {
    id v26 = +[HUNearbyHearingAidController sharedInstance];
    [v26 start];
  }
  uint64_t v27 = (void *)MEMORY[0x263F472C0];
  uint64_t v28 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v6 andIdentifier:64];
  os_log_t v29 = [v27 messageWithPayload:v28];

  id v30 = +[AXHeardController sharedServer];
  [v30 sendUpdateMessage:v29 forIdentifier:64];

  uint64_t v31 = +[AXHearingAidDeviceController sharedController];
  int v32 = [v31 isConnected];

  if (v32 && v4)
  {
    v33 = +[HUNearbyHearingAidController sharedInstance];
    [v33 sendWriteToAllDevices:v6];
  }
}

- (void)readLiveListenLevels
{
  liveListenLevelsTimer = self->_liveListenLevelsTimer;
  if (!liveListenLevelsTimer)
  {
    id v4 = objc_alloc(MEMORY[0x263F21398]);
    id v5 = (AXDispatchTimer *)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    BOOL v6 = self->_liveListenLevelsTimer;
    self->_liveListenLevelsTimer = v5;

    liveListenLevelsTimer = self->_liveListenLevelsTimer;
  }
  [(AXDispatchTimer *)liveListenLevelsTimer cancel];
  objc_initWeak(&location, self);
  char v7 = self->_liveListenLevelsTimer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__AXHAController_readLiveListenLevels__block_invoke;
  v8[3] = &unk_2640FDBA0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(AXDispatchTimer *)v7 afterDelay:v8 processBlock:0.05];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__AXHAController_readLiveListenLevels__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained liveListenController];
  [v4 audioLevel];
  double v6 = v5;

  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 liveListenController];
  uint64_t v9 = [v8 isListening];

  uint64_t v10 = NSDictionary;
  id v11 = [NSNumber numberWithDouble:v6];
  BOOL v12 = [NSNumber numberWithUnsignedLongLong:512];
  id v13 = [NSNumber numberWithBool:v9];
  os_log_t v14 = [NSNumber numberWithUnsignedLongLong:1024];
  id v15 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v13, v14, 0);

  id v19 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v15 andIdentifier:512];

  id v16 = +[AXHeardController sharedServer];
  id v17 = [MEMORY[0x263F472C0] messageWithPayload:v19];
  [v16 sendUpdateMessage:v17 forIdentifier:512];

  if (v9)
  {
    id v18 = objc_loadWeakRetained(v2);
    [v18 readLiveListenLevels];
  }
  else
  {
    [*(id *)(a1 + 32) setLiveListenMessage:0];
  }
}

- (void)liveListenControllerStateDidChange
{
  id v3 = [(AXHAController *)self liveListenController];
  int v4 = [v3 isListening];

  if (v4)
  {
    [(AXHAController *)self readLiveListenLevels];
  }
}

- (id)liveListenController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__AXHAController_liveListenController__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  if (liveListenController_onceToken != -1) {
    dispatch_once(&liveListenController_onceToken, block);
  }
  return (id)liveListenController_LiveListenController;
}

uint64_t __38__AXHAController_liveListenController__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(HULiveListenController);
  id v3 = (void *)liveListenController_LiveListenController;
  liveListenController_LiveListenController = (uint64_t)v2;

  int v4 = (void *)liveListenController_LiveListenController;
  uint64_t v5 = *(void *)(a1 + 32);

  return [v4 setDelegate:v5];
}

- (void)connectToPairedDevice
{
  id v2 = +[HUNearbyHearingAidController sharedInstance];
  [v2 requestConnection];
}

- (void)transitionToPeer
{
  id v2 = +[HUNearbyHearingAidController sharedInstance];
  [v2 relinquishConnection];
}

- (void)availableRemoteControllersDidChange
{
}

- (id)registerForAvailableDevicesUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  double v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  char v7 = [v6 BOOLValue];

  id v8 = [v4 payload];
  uint64_t v9 = [v8 objectForKey:@"ax_hearing_should_begin_searching_key"];
  char v10 = [v9 BOOLValue];

  id v11 = +[AXHearingAidDeviceController sharedController];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke;
  v19[3] = &unk_2640FDC10;
  char v21 = v7;
  v19[4] = self;
  id v12 = v4;
  id v20 = v12;
  char v22 = v10;
  [v11 checkPartiallyPairedWithCompletion:v19];

  id v13 = [(AXHAController *)self availableDevicesDescription];

  if (v13)
  {
    os_log_t v14 = (void *)MEMORY[0x263F472B0];
    id v15 = [(AXHAController *)self availableDevicesDescription];
    id v16 = [v14 messagePayloadFromDictionary:v15 andIdentifier:32];
    id v17 = [v12 replyMessageWithPayload:v16];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = [*(id *)(a1 + 32) pairedDeviceUUID];
    BOOL v6 = [v5 length] != 0;

    if ((v6 & a2) != 0) {
      double v3 = 180.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  unsigned int v7 = [*(id *)(a1 + 40) hasEntitlement:@"com.apple.CoreRoutine.preferences"];
  HAInitializeLogging();
  id v8 = [NSString stringWithFormat:@"Registing for device availability %d, %d, %lf", *(unsigned __int8 *)(a1 + 48), v7, *(void *)&v3];
  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController registerForAvailableDevicesUpdates:]_block_invoke", 495, v8];
  char v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  AXPerformBlockOnMainThreadAfterDelay();
  id v13 = [*(id *)(a1 + 40) client];
  [v13 setWantsUpdates:*(unsigned __int8 *)(a1 + 48) forIdentifier:32];
}

uint64_t __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_111(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41))
    {
      id v2 = +[AXHearingAidDeviceController sharedController];
      char v3 = [v2 shouldActiveScan];

      if ((v3 & 1) == 0) {
        [*(id *)(a1 + 32) setListenForAvailableDeviceUpdates:0];
      }
    }
    id v4 = +[AXHearingAidDeviceController sharedController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_2;
    v6[3] = &__block_descriptor_34_e8_v12__0B8l;
    char v7 = *(unsigned char *)(a1 + 42);
    char v8 = *(unsigned char *)(a1 + 41);
    [v4 checkPartiallyPairedWithCompletion:v6];
  }
  return [*(id *)(a1 + 32) setListenForAvailableDeviceUpdates:*(unsigned __int8 *)(a1 + 41)];
}

void __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int v3 = *(unsigned char *)(a1 + 32) != 0;
  if (*(unsigned char *)(a1 + 32) && (a2 & 1) == 0)
  {
    id v4 = +[HUHearingAidSettings sharedInstance];
    uint64_t v5 = [v4 pairedHearingAids];
    if (v5)
    {
      BOOL v6 = +[HUHearingAidSettings sharedInstance];
      unsigned int v3 = [v6 isiCloudPaired];
    }
    else
    {
      unsigned int v3 = 1;
    }
  }
  HAInitializeLogging();
  char v7 = [NSString stringWithFormat:@"Setting active scan %d, %d", *(unsigned __int8 *)(a1 + 33), v3];
  char v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController registerForAvailableDevicesUpdates:]_block_invoke_2", 507, v7];
  uint64_t v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    id v11 = v9;
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v12 = +[AXHearingAidDeviceController sharedController];
  id v13 = v12;
  if (*(unsigned char *)(a1 + 33)) {
    uint64_t v14 = v3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v12 setShouldActiveScan:v14];
}

- (id)registerForDeviceUpdates:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  BOOL v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v7 = [v6 BOOLValue];

  char v8 = [v4 client];
  [v8 setWantsUpdates:v7 forIdentifier:64];

  [(AXHAController *)self availableRemoteControllersDidChange];
  HAInitializeLogging();
  uint64_t v9 = [NSString stringWithFormat:@"New device updates client. Updated available controllers"];
  id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController registerForDeviceUpdates:]", 532, v9];
  id v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    id v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v20 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v14 = (void *)MEMORY[0x263F472B0];
  uint64_t v15 = [(AXHAController *)self availableDevicesDescription];
  uint64_t v16 = [v14 messagePayloadFromDictionary:v15 andIdentifier:32];
  uint64_t v17 = [v4 replyMessageWithPayload:v16];

  return v17;
}

- (id)readDeviceProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  BOOL v6 = [v5 allKeys];

  uint64_t v7 = [v4 payload];

  char v8 = [v7 objectForKey:&unk_26C1E5648];

  if (v8)
  {
    uint64_t v9 = [(AXHAController *)self pairedDeviceUUID];
    int v10 = [v9 isEqualToString:v8];

    if (v10)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __37__AXHAController_readDeviceProperty___block_invoke;
      v12[3] = &unk_2640FD460;
      v12[4] = self;
      id v13 = v8;
      [v6 enumerateObjectsUsingBlock:v12];
    }
  }

  return 0;
}

void __37__AXHAController_readDeviceProperty___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 currentDeviceController];
  uint64_t v5 = [v4 integerValue];

  [v6 updateProperty:v5 forDeviceID:*(void *)(a1 + 40)];
}

- (void)sendUpdatesForProperties:(id)a3 excludingClient:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a3;
  uint64_t v9 = [v7 dictionary];
  int v10 = [(AXHAController *)self pairedDeviceUUID];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__AXHAController_sendUpdatesForProperties_excludingClient___block_invoke;
  v17[3] = &unk_2640FD4D8;
  id v11 = v10;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  [v8 enumerateObjectsUsingBlock:v17];

  if ([v12 count] && objc_msgSend(v11, "length"))
  {
    id v13 = +[AXHeardController sharedServer];
    uint64_t v14 = (void *)MEMORY[0x263F472B0];
    id v20 = v11;
    v21[0] = v12;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v16 = [v14 messagePayloadFromDictionary:v15 andIdentifier:64];
    [v13 sendClientsMessageWithPayload:v16 excluding:v6];
  }
}

void __59__AXHAController_sendUpdatesForProperties_excludingClient___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = +[AXHearingAidDeviceController sharedController];
  id v4 = objc_msgSend(v3, "valueForProperty:forDeviceID:", objc_msgSend(v5, "longLongValue"), *(void *)(a1 + 32));

  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v5];
  }
}

- (id)writeDeviceProperty:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[AXHearingAidDeviceController sharedController];
  id v6 = [(AXHAController *)self pairedDeviceUUID];
  uint64_t v7 = [v5 hearingAidForDeviceID:v6];

  id v8 = [v4 payload];
  uint64_t v9 = [v8 objectForKey:&unk_26C1E5648];

  if (v9)
  {
    int v10 = [v7 deviceUUID];
    if ([v10 isEqualToString:v9])
    {
      int v11 = [v7 isPaired];

      if (v11)
      {
        id v12 = [v4 payload];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __38__AXHAController_writeDeviceProperty___block_invoke;
        v31[3] = &unk_2640FCDB0;
        id v32 = v9;
        [v12 enumerateKeysAndObjectsUsingBlock:v31];

        id v13 = [v4 payload];
        uint64_t v14 = [v13 allKeys];
        uint64_t v15 = [v4 client];
        [(AXHAController *)self sendUpdatesForProperties:v14 excludingClient:v15];

        uint64_t v16 = v32;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v17 = [v4 payload];
    id v18 = [v17 objectForKey:&unk_26C1E5630];

    if (v18)
    {
      id v19 = +[AXHearingAidDeviceController sharedController];
      uint64_t v16 = [v19 hearingAidsForUUID:v9];

      if ([v16 count])
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __38__AXHAController_writeDeviceProperty___block_invoke_2;
        v27[3] = &unk_2640FDB28;
        id v28 = v4;
        os_log_t v29 = self;
        id v30 = v9;
        [v16 enumerateObjectsUsingBlock:v27];
        if ((unint64_t)[v16 count] >= 2)
        {
          HAInitializeLogging();
          id v20 = [NSString stringWithFormat:@"Found more than one matching hearing aid %@", v16];
          uint64_t v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController writeDeviceProperty:]", 611, v20];
          char v22 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v23 = v21;
            v24 = v22;
            uint64_t v25 = [v23 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v34 = v25;
            _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
      }
      goto LABEL_13;
    }
  }
LABEL_14:

  return 0;
}

void __38__AXHAController_writeDeviceProperty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = +[AXHearingAidDeviceController sharedController];
  int v7 = [v6 isConnected];

  if (v7)
  {
    id v8 = +[AXHearingAidDeviceController sharedController];
    objc_msgSend(v8, "writeValue:forProperty:andDeviceID:", v5, objc_msgSend(v10, "unsignedLongLongValue"), *(void *)(a1 + 32));
  }
  uint64_t v9 = +[HUNearbyHearingAidController sharedInstance];
  objc_msgSend(v9, "writeValue:forProperty:andDeviceID:", v5, objc_msgSend(v10, "unsignedLongLongValue"), *(void *)(a1 + 32));
}

void __38__AXHAController_writeDeviceProperty___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (([v8 leftAvailable] & 1) != 0 || objc_msgSend(v8, "rightAvailable"))
  {
    id v6 = [*(id *)(a1 + 32) payload];
    int v7 = [v6 objectForKey:&unk_26C1E5630];

    [v8 setValue:v7 forProperty:0x200000];
    if ([v7 intValue] == 2) {
      [*(id *)(a1 + 40) setPairedHearingAidID:*(void *)(a1 + 48)];
    }
    *a4 = 1;
  }
}

- (id)registerForControlMessageUpdates:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payload];
  id v5 = [v4 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v6 = [v5 BOOLValue];

  int v7 = [v3 client];

  [v7 setWantsUpdates:v6 forIdentifier:0x8000000000000000];
  return 0;
}

- (void)updateNearbyDeviceAvailabilityWithForce:(BOOL)a3
{
  id v5 = [(AXHAController *)self pairedDeviceUUID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = +[AXHearingAidDeviceController sharedController];
    if ([v7 isConnected])
    {
      char v8 = 1;
    }
    else
    {
      id v10 = +[AXHearingAidDeviceController sharedController];
      char v8 = [v10 isPartiallyConnected];
    }
    int v11 = +[HUNearbyHearingAidController sharedInstance];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__AXHAController_updateNearbyDeviceAvailabilityWithForce___block_invoke;
    v12[3] = &unk_2640FDC38;
    char v13 = v8;
    v12[4] = self;
    BOOL v14 = a3;
    [v11 connectedPeerWithCompletion:v12];
  }
  else
  {
    uint64_t v9 = +[HUHearingAidSettings sharedInstance];
    [v9 setAvailableHearingDeviceName:0];

    if (!a3)
    {
      [(AXHAController *)self sendAvailabilityDidChangeNotification];
    }
  }
}

void __58__AXHAController_updateNearbyDeviceAvailabilityWithForce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v5 = *(unsigned char *)(a1 + 40) != 0;
  if (v3 && !*(unsigned char *)(a1 + 40))
  {
    uint64_t v6 = +[HUHearingAidSettings sharedInstance];
    unsigned int v5 = [v6 multideviceSettingsEnabled];

    int v4 = *(unsigned __int8 *)(a1 + 40);
  }
  uint64_t v7 = v4 != 0;
  if (v3 && !v4)
  {
    char v8 = +[HUHearingAidSettings sharedInstance];
    uint64_t v7 = [v8 multideviceAudioEnabled];
  }
  uint64_t v9 = +[AXHearingAidDeviceController sharedController];
  id v10 = [*(id *)(a1 + 32) pairedDeviceUUID];
  int v11 = [v9 hearingAidForDeviceID:v10];
  id v12 = [v11 name];

  char v13 = v12;
  if ((v3 || *(unsigned char *)(a1 + 40))
    && (+[HUHearingAidSettings sharedInstance],
        BOOL v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isiCloudPaired],
        v14,
        !v15))
  {
    uint64_t v16 = v13;
  }
  else
  {

    uint64_t v16 = 0;
  }
  uint64_t v17 = +[AXHearingAidDeviceController sharedController];
  int v18 = [v17 isBluetoothAvailable];

  id v19 = +[HUHearingAidSettings sharedInstance];
  id v20 = v19;
  if (v18) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = 0;
  }
  [v19 setAvailableHearingDeviceName:v21];

  if (v13) {
    char v22 = v13;
  }
  else {
    char v22 = &stru_26C1D5720;
  }
  id v23 = [v3 name];
  v24 = v23;
  if (!v23 || !v3 || *(unsigned char *)(a1 + 40))
  {

    v24 = &stru_26C1D5720;
  }
  uint64_t v25 = HCLogHearingHandoff();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v27 = [NSNumber numberWithBool:v7];
    *(_DWORD *)buf = 138413058;
    v43 = v24;
    __int16 v44 = 2112;
    v45 = v16;
    __int16 v46 = 2112;
    v47 = v26;
    __int16 v48 = 2112;
    v49 = v27;
    _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "connectedPeer: %@, Reachable HA: %@, isConnected: %@, audioReachable: %@", buf, 0x2Au);
  }
  id v28 = [NSNumber numberWithUnsignedLongLong:0x4000];
  uint64_t v40 = v28;
  v38[0] = &unk_26C1E5660;
  os_log_t v29 = [NSNumber numberWithBool:v5];
  v39[0] = v29;
  v38[1] = &unk_26C1E5678;
  id v30 = [NSNumber numberWithBool:v7];
  v39[1] = v30;
  v39[2] = v24;
  uint64_t v31 = *MEMORY[0x263F472A0];
  v38[2] = &unk_26C1E5690;
  v38[3] = v31;
  v39[3] = v22;
  id v32 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
  os_log_t v41 = v32;
  v33 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

  if (*(unsigned char *)(a1 + 41)
    || ([*(id *)(a1 + 32) availableControllersPayload],
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = [v33 isEqualToDictionary:v34],
        v34,
        (v35 & 1) == 0))
  {
    [*(id *)(a1 + 32) setAvailableControllersPayload:v33];
    uint64_t v36 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v33 andIdentifier:2048];

    uint64_t v37 = +[AXHeardController sharedServer];
    [v37 sendClientsMessageWithPayload:v36 excluding:0];

    v33 = (void *)v36;
  }
  if (!*(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) sendAvailabilityDidChangeNotification];
  }
}

- (void)sendAvailabilityDidChangeNotification
{
}

void __55__AXHAController_sendAvailabilityDidChangeNotification__block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.audio.transfer.availability", 0, 0, 1u);
}

- (id)readAvailableDevices:(id)a3
{
  int v4 = (void *)MEMORY[0x263F472B0];
  id v5 = a3;
  uint64_t v6 = [(AXHAController *)self availableDevicesDescription];
  uint64_t v7 = [v4 messagePayloadFromDictionary:v6 andIdentifier:32];
  char v8 = [v5 replyMessageWithPayload:v7];

  return v8;
}

- (id)readAvailableControllers:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  int v4 = [NSString stringWithFormat:@"Client requesting update to available controllers"];
  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAController readAvailableControllers:]", 715, v4];
  uint64_t v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    char v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXHAController *)self updateNearbyDeviceAvailabilityWithForce:1];
  return 0;
}

- (id)connectToControllerWithID:(id)a3
{
  id v3 = a3;
  int v4 = [v3 payload];
  id v5 = [v4 valueForKey:@"controller"];

  uint64_t v6 = [v3 payload];

  id v7 = [v6 valueForKey:@"reason"];

  if (v7) {
    uint64_t v8 = [v7 integerValue];
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];

  if (v5 == v9)
  {
    id v10 = +[HUNearbyHearingAidController sharedInstance];
    uint64_t v11 = v10;
    if (v8 == 1) {
      [v10 requestConnectionForMedia];
    }
    else {
      [v10 requestConnectionForReason:v8];
    }
  }
  return 0;
}

- (id)disconnectAndForceClient:(id)a3
{
  return 0;
}

- (id)_toggleLiveListen_BOOLValue:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 payload];
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:128];
  id v7 = [v5 objectForKey:v6];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [(AXHAController *)self liveListenController];
  LODWORD(v6) = [v9 isListening];

  if (v8 != v6)
  {
    id v10 = [(AXHAController *)self liveListenController];
    uint64_t v11 = v10;
    if (v8)
    {
      [v10 startListeningWithCompletion:0];
      id v12 = v4;
    }
    else
    {
      [v10 stopListeningWithCompletion:0];
      id v12 = 0;
    }

    [(AXHAController *)self setLiveListenMessage:v12];
  }
  [(AXHAController *)self readLiveListenLevels];
  char v13 = (void *)MEMORY[0x263F472B0];
  BOOL v14 = [NSNumber numberWithUnsignedLongLong:128];
  char v22 = v14;
  int v15 = NSNumber;
  uint64_t v16 = [(AXHAController *)self liveListenController];
  uint64_t v17 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isListening"));
  v23[0] = v17;
  int v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v19 = [v13 messagePayloadFromDictionary:v18 andIdentifier:128];
  id v20 = [v4 replyMessageWithPayload:v19];

  return v20;
}

- (id)_registerForLiveListenUpdates_BOOLValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  uint64_t v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v7 = [v6 BOOLValue];

  int v8 = [v4 client];
  [v8 setWantsUpdates:v7 forIdentifier:512];

  uint64_t v9 = +[AXHeardController sharedServer];
  uint64_t v10 = [v9 countOfClientsListeningForIdentifier:512];

  if (v10)
  {
    if (v10 == 1) {
      [(AXHAController *)self readLiveListenLevels];
    }
  }
  else
  {
    [(AXDispatchTimer *)self->_liveListenLevelsTimer cancel];
  }
  uint64_t v11 = (void *)MEMORY[0x263F472B0];
  id v12 = NSDictionary;
  char v13 = [NSNumber numberWithUnsignedLongLong:512];
  BOOL v14 = NSNumber;
  int v15 = [(AXHAController *)self liveListenController];
  uint64_t v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isListening"));
  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:1024];
  int v18 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", &unk_26C1E5EB0, v13, v16, v17, 0);
  id v19 = [v11 messagePayloadFromDictionary:v18 andIdentifier:512];
  id v20 = [v4 replyMessageWithPayload:v19];

  return v20;
}

- (id)sendMessagesPriority:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [a3 payload];
  id v4 = [NSNumber numberWithUnsignedLongLong:0x20000];
  id v5 = [v3 objectForKey:v4];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = *MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "XPC received MessagesPriority isHigh: %d", (uint8_t *)v11, 8u);
  }
  int v8 = +[HUNearbyHearingAidController sharedInstance];
  uint64_t v9 = v8;
  if (v6) {
    [v8 sendMessagesPriorityHigh];
  }
  else {
    [v8 sendMessagesPriorityDefault];
  }

  return 0;
}

- (NSString)pairedDeviceUUID
{
  return self->_pairedDeviceUUID;
}

- (void)setPairedDeviceUUID:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (HUAudioHalController)audioHalController
{
  return self->_audioHalController;
}

- (void)setAudioHalController:(id)a3
{
}

- (NSDictionary)availableDevicesDescription
{
  return self->_availableDevicesDescription;
}

- (void)setAvailableDevicesDescription:(id)a3
{
}

- (NSDictionary)availableControllersPayload
{
  return self->_availableControllersPayload;
}

- (void)setAvailableControllersPayload:(id)a3
{
}

- (HCXPCMessage)liveListenMessage
{
  return self->_liveListenMessage;
}

- (void)setLiveListenMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveListenMessage, 0);
  objc_storeStrong((id *)&self->_availableControllersPayload, 0);
  objc_storeStrong((id *)&self->_availableDevicesDescription, 0);
  objc_storeStrong((id *)&self->_audioHalController, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_pairedDeviceUUID, 0);

  objc_storeStrong((id *)&self->_liveListenLevelsTimer, 0);
}

@end