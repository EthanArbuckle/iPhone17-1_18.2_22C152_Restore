@interface AXHAServer
+ (id)sharedInstance;
- (AXHAServer)init;
- (BOOL)hearingAidConnectedOrReachable;
- (BOOL)hearingAidReachableForAudioTransfer;
- (NSArray)availableControllers;
- (NSArray)availableHearingAids;
- (NSMutableDictionary)connectionStateBlocks;
- (NSMutableDictionary)updates;
- (NSString)connectedDeviceName;
- (NSString)hearingDeviceName;
- (void)_headphoneLevelDidUpdate:(id)a3 messageIdentifier:(unint64_t)a4;
- (void)_liveListenDidUpdate_BOOLValue:(id)a3;
- (void)_registerConnectionStateBlock:(id)a3 listenerHash:(id)a4;
- (void)_registerListener:(id)a3 forAvailableDeviceHandler:(id)a4 beginSearching:(BOOL)a5;
- (void)_registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4 messageIdentifier:(unint64_t)a5;
- (void)_registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 listenerHash:(id)a5;
- (void)_unregisterLiveHeadphoneLevelHandler:(id)a3 messageIdentifier:(unint64_t)a4;
- (void)_unregisterUpdateListenerHash:(id)a3;
- (void)availableDevicesDidUpdate:(id)a3;
- (void)cancelHearingAidConnectionRequest;
- (void)comfortSoundsAssetsDidUpdate:(id)a3;
- (void)connectToControllerWithID:(id)a3;
- (void)controlMessageDidUpdate:(id)a3;
- (void)deviceDidUpdateProperty:(id)a3;
- (void)downloadComfortSoundAsset:(id)a3;
- (void)environmentalDosimetryDidUpdate:(id)a3;
- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4;
- (void)registerListener:(id)a3 forAvailableDeviceHandler:(id)a4;
- (void)registerListener:(id)a3 forComfortSoundsModelUpdatesHandler:(id)a4;
- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4;
- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4 listenerHash:(id)a5;
- (void)registerListener:(id)a3 forControlMessageHandler:(id)a4;
- (void)registerListener:(id)a3 forLiveDosimetryUpdates:(BOOL)a4 withDoseHandler:(id)a5;
- (void)registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4;
- (void)registerListener:(id)a3 forLiveListenLevelsHandler:(id)a4;
- (void)registerListener:(id)a3 forPropertyUpdateHandler:(id)a4;
- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelChangesHandler:(id)a4;
- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelHandler:(id)a4;
- (void)registerPassiveListener:(id)a3 forAvailableDeviceHandler:(id)a4;
- (void)registerResponseBlock:(id)a3 forUUID:(id)a4;
- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5;
- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5 listenerHash:(id)a6;
- (void)removeComfortSoundAsset:(id)a3;
- (void)requestHearingAidConnectionWithReason:(int64_t)a3;
- (void)requestHearingAidReachabilityStatus;
- (void)reregisterForComfortSoundsAssetsUpdatesIfNeeded;
- (void)resetConnection;
- (void)sendMessagesPriorityDefault;
- (void)sendMessagesPriorityHigh;
- (void)setAvailableControllers:(id)a3;
- (void)setAvailableHearingAids:(id)a3;
- (void)setConnectedDeviceName:(id)a3;
- (void)setConnectionStateBlocks:(id)a3;
- (void)setHearingAidConnectedOrReachable:(BOOL)a3;
- (void)setHearingAidReachableForAudioTransfer:(BOOL)a3;
- (void)setHearingDeviceName:(id)a3;
- (void)setUpdates:(id)a3;
- (void)setupListenerHelperForListener:(id)a3 withAddress:(id)a4;
- (void)shouldRestartOnInterruption:(id)a3;
- (void)startLiveListen;
- (void)startServerWithDelegate:(id)a3;
- (void)stopLiveListen;
- (void)unregisterComfortSoundsModelUpdatesHandler:(id)a3;
- (void)unregisterControlMessageHandler:(id)a3;
- (void)unregisterDoseHandler:(id)a3;
- (void)unregisterLiveHeadphoneLevelHandler:(id)a3;
- (void)unregisterLiveListenLevelListener:(id)a3;
- (void)unregisterRemoteLiveHeadphoneLevelChangesHandler:(id)a3;
- (void)unregisterRemoteLiveHeadphoneLevelHandler:(id)a3;
- (void)unregisterUpdateListener:(id)a3;
- (void)unregisterUpdateListenerHash:(id)a3;
- (void)updateListenersWithConnectionStatus:(BOOL)a3;
- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4;
- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5;
@end

@implementation AXHAServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_Server;

  return v2;
}

uint64_t __28__AXHAServer_sharedInstance__block_invoke()
{
  sharedInstance_Server = objc_alloc_init(AXHAServer);

  return MEMORY[0x270F9A758]();
}

- (AXHAServer)init
{
  v16[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)AXHAServer;
  v2 = [(HCServer *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(AXHAServer *)v2 setUpdates:v3];

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    responseBlocks = v2->_responseBlocks;
    v2->_responseBlocks = v4;

    uint64_t v6 = objc_opt_new();
    connectionStateBlocks = v2->_connectionStateBlocks;
    v2->_connectionStateBlocks = (NSMutableDictionary *)v6;

    v8 = +[HUHearingAidSettings sharedInstance];
    v9 = [v8 pairedHearingAids];

    if (v9)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:2048];
      v15 = v10;
      v16[0] = MEMORY[0x263EFFA88];
      v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [(HCServer *)v2 sendMessageWithPayload:v11 andIdentifier:2048];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)shouldHandleServerStarting, @"com.apple.accessibility.hearing.server.ready", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)shouldRestartOnInterruption:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__AXHAServer_shouldRestartOnInterruption___block_invoke;
  v5[3] = &unk_2640FCEC8;
  id v6 = v3;
  id v4 = v3;
  hearingDeamonShouldBeRunning(v5);
}

uint64_t __42__AXHAServer_shouldRestartOnInterruption___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startServerWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXHAServer;
  [(HCServer *)&v4 startServerWithDelegate:a3];
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5A50 andIdentifier:4];
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5A78 andIdentifier:0x10000];
}

- (void)resetConnection
{
  v8.receiver = self;
  v8.super_class = (Class)AXHAServer;
  [(HCServer *)&v8 resetConnection];
  id v3 = [(AXHAServer *)self updates];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__AXHAServer_resetConnection__block_invoke;
  v7[3] = &unk_2640FCEF0;
  v7[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  objc_super v4 = [(AXHAServer *)self availableHearingAids];
  v5 = [v4 lastObject];
  id v6 = [v5 deviceUUID];
  [(AXHAServer *)self updateProperty:0xD07D42105FCLL forDeviceID:v6];
}

void __29__AXHAServer_resetConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "sendMessageWithPayload:andIdentifier:", &unk_26C1E5AA0, objc_msgSend(v5, "unsignedLongLongValue"));
  }
}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 0x40000)
  {
    [(AXHAServer *)self environmentalDosimetryDidUpdate:v6];
    goto LABEL_46;
  }
  HAInitializeLogging();
  v7 = NSString;
  objc_super v8 = messageIdentifierDescription();
  v9 = [v7 stringWithFormat:@"Handle incoming message ID: %@ %@", v8, v6];

  v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 128, v9];
  v11 = (os_log_t *)MEMORY[0x263F47290];
  v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v10;
    objc_super v14 = v12;
    *(_DWORD *)buf = 136446210;
    uint64_t v47 = [v13 UTF8String];
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ((uint64_t)a4 > 255)
  {
    if ((uint64_t)a4 >= 0x100000)
    {
      if ((uint64_t)a4 >= 0x400000)
      {
        if (a4 != 0x400000)
        {
          if (a4 == 0x1000000) {
            [(AXHAServer *)self comfortSoundsAssetsDidUpdate:v6];
          }
          goto LABEL_46;
        }
        v16 = self;
        id v17 = v6;
        uint64_t v18 = 0x400000;
      }
      else if (a4 == 0x100000)
      {
        v16 = self;
        id v17 = v6;
        uint64_t v18 = 0x100000;
      }
      else
      {
        if (a4 != 0x200000) {
          goto LABEL_46;
        }
        v16 = self;
        id v17 = v6;
        uint64_t v18 = 0x200000;
      }
      [(AXHAServer *)v16 _headphoneLevelDidUpdate:v17 messageIdentifier:v18];
      goto LABEL_46;
    }
    if (a4 != 256)
    {
      if (a4 == 512)
      {
LABEL_38:
        [(AXHAServer *)self liveListenDidUpdate:v6];
        goto LABEL_46;
      }
      if (a4 != 2048) {
        goto LABEL_46;
      }
      HAInitializeLogging();
      v19 = [NSString stringWithFormat:@"Availability %@", v6];
      v20 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 167, v19];
      os_log_t v21 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v20;
        v23 = v21;
        uint64_t v24 = [v22 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v47 = v24;
        _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v25 = [NSNumber numberWithUnsignedLongLong:0x4000];
      v26 = [v6 objectForKey:v25];

      v27 = [v26 objectForKey:&unk_26C1E5498];
      uint64_t v28 = [v27 BOOLValue];

      v29 = [v26 objectForKey:&unk_26C1E54B0];
      uint64_t v30 = [v29 BOOLValue];

      v31 = [v26 objectForKey:*MEMORY[0x263F472A0]];
      if (![v31 length])
      {

        v31 = 0;
      }
      [(AXHAServer *)self setHearingDeviceName:v31];
      [(AXHAServer *)self setHearingAidReachableForAudioTransfer:v30];
      if (v28 != [(AXHAServer *)self hearingAidConnectedOrReachable])
      {
        v32 = [(AXHAServer *)self availableHearingAids];
        v33 = [v32 firstObject];
        v34 = [v33 deviceUUID];
        [(AXHAServer *)self updateProperty:0x200000 forDeviceID:v34];

        v35 = [MEMORY[0x263F08A00] defaultCenter];
        [v35 postNotificationName:@"com.apple.accessibility.hearingaid.nearby.devices.changed" object:0];
      }
      v36 = [v26 objectForKey:&unk_26C1E54C8];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v36 length])
      {

        v36 = 0;
      }
      [(AXHAServer *)self setConnectedDeviceName:v36];
      [(AXHAServer *)self setHearingAidConnectedOrReachable:v28];
      if (v36)
      {
        v45 = v36;
        v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        [(AXHAServer *)self setAvailableControllers:v37];
      }
      else
      {
        [(AXHAServer *)self setAvailableControllers:0];
      }

LABEL_45:
      goto LABEL_46;
    }
LABEL_29:
    HAInitializeLogging();
    v38 = NSString;
    v39 = messageIdentifierDescription();
    v26 = [v38 stringWithFormat:@"Unexpected message ID: %@", v39];

    v31 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 138, v26];
    os_log_t v40 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = v31;
      v42 = v40;
      uint64_t v43 = [v41 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v47 = v43;
      _os_log_impl(&dword_20CC86000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_45;
  }
  char v15 = a4 - 2;
  if (a4 - 2 > 0x3E) {
    goto LABEL_36;
  }
  if (((1 << v15) & 0x45) != 0) {
    goto LABEL_29;
  }
  if (((1 << v15) & 0x4000000000004000) != 0)
  {
    [(AXHAServer *)self deviceDidUpdateProperty:v6];
    goto LABEL_46;
  }
  if (a4 == 32)
  {
    [(AXHAServer *)self availableDevicesDidUpdate:v6];
    goto LABEL_46;
  }
LABEL_36:
  if (a4 == 0x8000000000000000)
  {
    [(AXHAServer *)self controlMessageDidUpdate:v6];
    goto LABEL_46;
  }
  if (a4 == 128) {
    goto LABEL_38;
  }
LABEL_46:
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __53__AXHAServer_handleMessageWithPayload_forIdentifier___block_invoke;
  v44[3] = &unk_2640FCF18;
  v44[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v44];
}

void __53__AXHAServer_handleMessageWithPayload_forIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:a2];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)deviceDidUpdateProperty:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  HCPerformSafeBlock();
}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updates];
  id v3 = [NSNumber numberWithUnsignedLongLong:4];
  id v4 = [v2 objectForKey:v3];

  uint64_t v5 = [*(id *)(a1 + 32) availableHearingAids];
  id v6 = [v5 firstObject];

  if ([v6 isPaired]) {
    int v7 = [v6 hasConnection];
  }
  else {
    int v7 = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__AXHAServer_deviceDidUpdateProperty___block_invoke_2;
  v14[3] = &unk_2640FCF40;
  id v15 = *(id *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v14];
  if ([v6 isPaired] && v7 != objc_msgSend(v6, "hasConnection"))
  {
    objc_super v8 = +[HUUtilities sharedUtilities];
    [v8 clearAudioRoutes];
  }
  v9 = *(void **)(a1 + 40);
  v10 = [v9 allKeys];
  v11 = [v10 firstObject];
  v12 = [v9 objectForKey:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__AXHAServer_deviceDidUpdateProperty___block_invoke_3;
    v13[3] = &unk_2640FCF68;
    v13[4] = *(void *)(a1 + 32);
    [v12 enumerateKeysAndObjectsUsingBlock:v13];
  }
}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  v3[2](v3, *(void *)(a1 + 32));
}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  BOOL v7 = [a2 integerValue] == 0x200000;
  objc_super v8 = v12;
  if (v7)
  {
    v9 = [v12 firstObject];
    BOOL v10 = 1;
    if ([v9 intValue] != 2)
    {
      v11 = [v12 lastObject];
      BOOL v10 = [v11 intValue] == 2;
    }
    [*(id *)(a1 + 32) updateListenersWithConnectionStatus:v10];
    *a4 = 1;
    objc_super v8 = v12;
  }
}

- (void)updateListenersWithConnectionStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(HCServer *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(HCServer *)self delegate];
    [v7 hearingAidConnectionDidChange:v3];
  }
  objc_super v8 = [(AXHAServer *)self connectionStateBlocks];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__AXHAServer_updateListenersWithConnectionStatus___block_invoke;
  v9[3] = &__block_descriptor_33_e32_v32__0__NSNumber_8___v__B_16_B24l;
  BOOL v10 = v3;
  [v8 enumerateKeysAndObjectsUsingBlock:v9];
}

uint64_t __50__AXHAServer_updateListenersWithConnectionStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(unsigned __int8 *)(a1 + 32));
}

- (void)availableDevicesDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke;
  v12[3] = &unk_2640FD000;
  v12[4] = self;
  id v6 = v5;
  id v13 = v6;
  objc_super v14 = &v15;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  [(AXHAServer *)self setAvailableHearingAids:v6];
  if (*((unsigned char *)v16 + 24) || ![v6 count])
  {
    BOOL v7 = [(AXHAServer *)self updates];
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:2];
    v9 = [v7 objectForKey:v8];

    id v10 = v9;
    id v11 = v6;
    HCPerformSafeBlock();
  }
  _Block_object_dispose(&v15, 8);
}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [*(id *)(a1 + 32) availableHearingAids];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_2;
      v15[3] = &unk_2640FCFB0;
      id v8 = v5;
      id v16 = v8;
      uint64_t v9 = [v7 indexOfObjectPassingTest:v15];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || !v7)
      {
        id v10 = [[AXRemoteHearingAidDevice alloc] initWithRemoteRepresentation:v6 andDeviceID:v8];
        [*(id *)(a1 + 40) addObject:v10];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        id v10 = [v7 objectAtIndex:v9];
        if (v10)
        {
          [*(id *)(a1 + 40) addObject:v10];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_3;
          v12[3] = &unk_2640FCFD8;
          id v10 = v10;
          uint64_t v11 = *(void *)(a1 + 48);
          id v13 = v10;
          uint64_t v14 = v11;
          [v6 enumerateKeysAndObjectsUsingBlock:v12];
        }
      }
    }
  }
}

uint64_t __40__AXHAServer_availableDevicesDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsPeripheralWithUUID:*(void *)(a1 + 32)];
}

uint64_t __40__AXHAServer_availableDevicesDidUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 availableEars];
  objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v6, objc_msgSend(v7, "unsignedLongLongValue"));

  uint64_t v9 = [v7 unsignedLongLongValue];
  uint64_t result = propertyContainsProperty(v9, 8);
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) availableEars];
    if (result != v8) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_5;
  v2[3] = &unk_2640FCF40;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  v3[2](v3, *(void *)(a1 + 32));
}

- (void)_liveListenDidUpdate_BOOLValue:(id)a3
{
  id v4 = a3;
  id v5 = [(AXHAServer *)self updates];
  id v6 = [NSNumber numberWithUnsignedLongLong:256];
  id v7 = [v5 objectForKey:v6];

  int v8 = [NSNumber numberWithUnsignedLongLong:512];
  uint64_t v9 = [v4 objectForKey:v8];
  [v9 doubleValue];

  id v10 = [NSNumber numberWithUnsignedLongLong:1024];
  uint64_t v11 = [v4 objectForKey:v10];

  [v11 BOOLValue];
  id v13 = v7;
  id v12 = v7;
  HCPerformSafeBlock();
}

uint64_t __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke_2;
  v3[3] = &__block_descriptor_41_e24_v32__0__NSArray_8Q16_B24l;
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  v3[2](v3, *(unsigned __int8 *)(a1 + 40), *(double *)(a1 + 32));
}

- (void)unregisterUpdateListener:(id)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(AXHAServer *)self unregisterUpdateListenerHash:v4];
}

- (void)unregisterUpdateListenerHash:(id)a3
{
  id v4 = a3;
  id v5 = [(HCServer *)self connectionQueue];

  if (v5)
  {
    id v6 = [(HCServer *)self connectionQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__AXHAServer_unregisterUpdateListenerHash___block_invoke;
    v7[3] = &unk_2640FC938;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else
  {
    [(AXHAServer *)self _unregisterUpdateListenerHash:v4];
  }
}

uint64_t __43__AXHAServer_unregisterUpdateListenerHash___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterUpdateListenerHash:*(void *)(a1 + 40)];
}

- (void)_unregisterUpdateListenerHash:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  id v5 = [NSString stringWithFormat:@"Unregister from updates listenerHash: %@", v4];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer _unregisterUpdateListenerHash:]", 425, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:2 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:4 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:256 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x8000000000000000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x40000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x100000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x200000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x400000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x1000000 withListener:0 listenerHash:v4];
  [(AXHAServer *)self registerListener:0 forConnectionStateHandler:0 listenerHash:v4];
}

- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5
{
  uint64_t v9 = NSNumber;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 numberWithUnsignedLongLong:a5];
  [(AXHAServer *)self registerUpdateBlock:v11 forIdentifier:a4 withListener:v10 listenerHash:v12];
}

- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5 listenerHash:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11) {
    [(AXHAServer *)self setupListenerHelperForListener:v11 withAddress:v12];
  }
  id v13 = [(HCServer *)self connectionQueue];

  if (v13)
  {
    objc_initWeak(&location, self);
    uint64_t v14 = [(HCServer *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__AXHAServer_registerUpdateBlock_forIdentifier_withListener_listenerHash___block_invoke;
    block[3] = &unk_2640FD070;
    objc_copyWeak(v18, &location);
    id v16 = v10;
    v18[1] = (id)a4;
    id v17 = v12;
    dispatch_async(v14, block);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AXHAServer *)self _registerUpdateBlock:v10 forIdentifier:a4 listenerHash:v12];
  }
}

void __74__AXHAServer_registerUpdateBlock_forIdentifier_withListener_listenerHash___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _registerUpdateBlock:*(void *)(a1 + 32) forIdentifier:*(void *)(a1 + 56) listenerHash:*(void *)(a1 + 40)];
}

- (void)_registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 listenerHash:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AXHAServer *)self updates];
  id v11 = [NSNumber numberWithUnsignedLongLong:a4];
  id v12 = [v10 objectForKey:v11];

  if (v8)
  {
    id v13 = (void *)[v8 copy];
    v24[0] = v9;
    uint64_t v14 = (void *)MEMORY[0x2105575F0]();
    v24[1] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];

    if (!v12)
    {
      id v12 = [MEMORY[0x263EFF980] array];
      id v16 = [(AXHAServer *)self updates];
      id v17 = [NSNumber numberWithUnsignedLongLong:a4];
      [v16 setObject:v12 forKey:v17];
    }
    [v12 addObject:v15];
  }
  else
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    os_log_t v21 = __62__AXHAServer__registerUpdateBlock_forIdentifier_listenerHash___block_invoke;
    id v22 = &unk_2640FD098;
    id v23 = v9;
    char v18 = [v12 indexesOfObjectsPassingTest:&v19];
    if (objc_msgSend(v18, "count", v19, v20, v21, v22)) {
      [v12 removeObjectsAtIndexes:v18];
    }
    if (![v12 count]) {
      [(HCServer *)self sendMessageWithPayload:&unk_26C1E5AC8 andIdentifier:a4];
    }

    id v13 = v23;
  }
}

uint64_t __62__AXHAServer__registerUpdateBlock_forIdentifier_listenerHash___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)registerResponseBlock:(id)a3 forUUID:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v9 = (id)[a3 copy];
    responseBlocks = self->_responseBlocks;
    id v8 = (void *)MEMORY[0x2105575F0]();
    [(NSMutableDictionary *)responseBlocks setObject:v8 forKey:v6];
  }
}

- (void)registerListener:(id)a3 forAvailableDeviceHandler:(id)a4
{
}

- (void)registerPassiveListener:(id)a3 forAvailableDeviceHandler:(id)a4
{
}

- (void)_registerListener:(id)a3 forAvailableDeviceHandler:(id)a4 beginSearching:(BOOL)a5
{
  BOOL v5 = a5;
  v20[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v19[0] = @"ax_hearing_should_register_client_key";
  v19[1] = @"ax_hearing_should_begin_searching_key";
  v20[0] = MEMORY[0x263EFFA88];
  id v9 = NSNumber;
  id v10 = a3;
  id v11 = [v9 numberWithBool:v5];
  v20[1] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [(HCServer *)self sendMessageWithPayload:v12 andIdentifier:2];

  id v13 = (void *)MEMORY[0x2105575F0](v8);
  [(AXHAServer *)self registerUpdateBlock:v13 forIdentifier:2 withListener:v10];

  uint64_t v14 = [(AXHAServer *)self availableHearingAids];
  uint64_t v15 = [v14 count];

  if (v8 && v15)
  {
    id v16 = [(HCServer *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__AXHAServer__registerListener_forAvailableDeviceHandler_beginSearching___block_invoke;
    block[3] = &unk_2640FCD88;
    void block[4] = self;
    id v18 = v8;
    dispatch_async(v16, block);
  }
}

void __73__AXHAServer__registerListener_forAvailableDeviceHandler_beginSearching___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) availableHearingAids];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)registerListener:(id)a3 forPropertyUpdateHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5AF0 andIdentifier:4];
  id v8 = (id)MEMORY[0x2105575F0](v6);

  [(AXHAServer *)self registerUpdateBlock:v8 forIdentifier:4 withListener:v7];
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  id v6 = NSDictionary;
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = [v7 numberWithUnsignedLongLong:a3];
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, &unk_26C1E54E0, v8, v9, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(HCServer *)self sendMessageWithPayload:v10 andIdentifier:16];
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = NSDictionary;
  id v9 = NSNumber;
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 numberWithUnsignedLongLong:a4];
  id v13 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v10, &unk_26C1E54E0, v11, v12, 0);

  HAInitializeLogging();
  uint64_t v14 = [NSString stringWithFormat:@"XPC sending payload %@", v13];
  uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer writeValue:forProperty:andDeviceID:]", 557, v14];
  id v16 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v15;
    id v18 = v16;
    *(_DWORD *)buf = 136446210;
    uint64_t v20 = [v17 UTF8String];
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HCServer *)self sendMessageWithPayload:v13 andIdentifier:8];
}

- (void)sendMessagesPriorityHigh
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"XPC sending messagesPriority: Urgent"];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer sendMessagesPriorityHigh]", 563, v3];
  BOOL v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:0x20000];
  id v10 = v8;
  uint64_t v11 = MEMORY[0x263EFFA88];
  id v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(HCServer *)self sendMessageWithPayload:v9 andIdentifier:0x20000];
}

- (void)sendMessagesPriorityDefault
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"XPC sending messagesPriority: Default"];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer sendMessagesPriorityDefault]", 569, v3];
  BOOL v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:0x20000];
  id v10 = v8;
  uint64_t v11 = MEMORY[0x263EFFA80];
  id v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(HCServer *)self sendMessageWithPayload:v9 andIdentifier:0x20000];
}

- (void)requestHearingAidReachabilityStatus
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = [NSNumber numberWithUnsignedLongLong:2048];
  BOOL v5 = v3;
  v6[0] = MEMORY[0x263EFFA88];
  id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(HCServer *)self sendMessageWithPayload:v4 andIdentifier:2048];
}

- (NSArray)availableHearingAids
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSArray *)v2->_availableHearingAids copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setAvailableHearingAids:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  availableHearingAids = v4->_availableHearingAids;
  v4->_availableHearingAids = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 numberWithUnsignedLongLong:a3];
  [(AXHAServer *)self registerListener:v8 forConnectionStateHandler:v7 listenerHash:v9];
}

- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4 listenerHash:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8) {
    [(AXHAServer *)self setupListenerHelperForListener:v8 withAddress:v10];
  }
  uint64_t v11 = [(HCServer *)self connectionQueue];

  if (v11)
  {
    objc_initWeak(&location, self);
    id v12 = [(HCServer *)self connectionQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__AXHAServer_registerListener_forConnectionStateHandler_listenerHash___block_invoke;
    v13[3] = &unk_2640FD0C0;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    id v14 = v10;
    dispatch_async(v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AXHAServer *)self _registerConnectionStateBlock:v9 listenerHash:v10];
  }
}

void __70__AXHAServer_registerListener_forConnectionStateHandler_listenerHash___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _registerConnectionStateBlock:*(void *)(a1 + 40) listenerHash:*(void *)(a1 + 32)];
}

- (void)_registerConnectionStateBlock:(id)a3 listenerHash:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v9 = (id)[a3 copy];
    id v7 = [(AXHAServer *)self connectionStateBlocks];
    id v8 = (void *)MEMORY[0x2105575F0](v9);
    [v7 setObject:v8 forKey:v6];

    id v6 = v7;
  }
  else
  {
    id v9 = [(AXHAServer *)self connectionStateBlocks];
    [v9 removeObjectForKey:v6];
  }
}

- (void)connectToControllerWithID:(id)a3
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"controller", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HCServer *)self sendMessageWithPayload:v4 andIdentifier:0x8000];
}

- (void)requestHearingAidConnectionWithReason:(int64_t)a3
{
  if (a3 == 5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.audio.transfer", 0, 0, 1u);
  }
  else
  {
    id v6 = NSDictionary;
    id v7 = [MEMORY[0x263EFF9D0] null];
    id v8 = [NSNumber numberWithInteger:a3];
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"controller", v8, @"reason", 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [(HCServer *)self sendMessageWithPayload:v9 andIdentifier:0x8000];
  }
}

- (void)cancelHearingAidConnectionRequest
{
  id v3 = NSDictionary;
  id v4 = [MEMORY[0x263EFF9D0] null];
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"controller", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(HCServer *)self sendMessageWithPayload:v5 andIdentifier:0x2000];
}

- (void)registerListener:(id)a3 forLiveListenLevelsHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5B18 andIdentifier:256];
  id v8 = (id)MEMORY[0x2105575F0](v6);

  [(AXHAServer *)self registerUpdateBlock:v8 forIdentifier:256 withListener:v7];
}

- (void)unregisterLiveListenLevelListener:(id)a3
{
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:256 withListener:a3];
  id v4 = [(AXHAServer *)self updates];
  id v5 = [NSNumber numberWithUnsignedLongLong:256];
  id v6 = [v4 objectForKey:v5];

  if (![v6 count]) {
    [(HCServer *)self sendMessageWithPayload:&unk_26C1E5B40 andIdentifier:256];
  }
}

- (void)startLiveListen
{
  id v3 = NSDictionary;
  id v4 = [NSNumber numberWithUnsignedLongLong:128];
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", MEMORY[0x263EFFA88], v4, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(HCServer *)self sendMessageWithPayload:v5 andIdentifier:128];
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5B68 andIdentifier:256];
}

- (void)stopLiveListen
{
  id v3 = NSDictionary;
  id v4 = [NSNumber numberWithUnsignedLongLong:128];
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", MEMORY[0x263EFFA80], v4, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(HCServer *)self sendMessageWithPayload:v5 andIdentifier:128];
}

- (void)registerListener:(id)a3 forLiveDosimetryUpdates:(BOOL)a4 withDoseHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5B90 andIdentifier:0x40000];
  id v9 = (id)MEMORY[0x2105575F0](v7);

  [(AXHAServer *)self registerUpdateBlock:v9 forIdentifier:0x40000 withListener:v8];
}

- (void)unregisterDoseHandler:(id)a3
{
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x40000 withListener:a3];
  id v4 = [(AXHAServer *)self updates];
  id v5 = [NSNumber numberWithUnsignedLongLong:0x40000];
  id v6 = [v4 objectForKey:v5];

  if (![v6 count]) {
    [(HCServer *)self sendMessageWithPayload:&unk_26C1E5BB8 andIdentifier:0x40000];
  }
}

- (void)environmentalDosimetryDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(AXHAServer *)self updates];
  id v6 = [NSNumber numberWithUnsignedLongLong:0x40000];
  id v7 = [v5 objectForKey:v6];

  id v8 = [v4 objectForKey:@"HUEDSlowLeqIdentifier"];
  [v8 floatValue];

  id v9 = [v4 objectForKey:@"HUEDFastLeqIdentifier"];
  [v9 floatValue];

  id v10 = [v4 objectForKey:@"HUEDEnabledIdentifier"];
  [v10 BOOLValue];

  uint64_t v11 = [v4 objectForKey:@"HUEDThresholdCrossedIdentifier"];
  [v11 unsignedIntegerValue];

  id v12 = [v4 objectForKey:@"HUEDSlowAttenuationLevelIdentifier"];
  [v12 floatValue];

  uint64_t v13 = [v4 objectForKey:@"HUEDFastAttenuationLevelIdentifier"];
  [v13 floatValue];

  id v14 = [v4 objectForKey:@"HUEDWearingAirPodsIdentifier"];
  [v14 BOOLValue];

  id v15 = [v4 objectForKey:@"HUEDDeviceTypeIdentifier"];

  [v15 unsignedIntegerValue];
  id v17 = v7;
  id v16 = v7;
  HCPerformSafeBlock();
}

uint64_t __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke_2;
  v4[3] = &__block_descriptor_66_e24_v32__0__NSArray_8Q16_B24l;
  __int16 v7 = *(_WORD *)(a1 + 72);
  long long v2 = *(_OWORD *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v5 = v2;
  return [v1 enumerateObjectsUsingBlock:v4];
}

void __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  (*((void (**)(id, void, void, void, void, float, float, float, float))v3 + 2))(v3, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 40), *(float *)(a1 + 48), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60));
}

- (void)registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4
{
}

- (void)unregisterLiveHeadphoneLevelHandler:(id)a3
{
}

- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HUUtilities sharedUtilities];
  int v9 = [v8 deviceIsTinker];

  if (v9)
  {
    id v10 = HCLogSoundMeter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_INFO, "Watch is in family mode. Not requesting remote live headphone data", v11, 2u);
    }
  }
  else
  {
    [(AXHAServer *)self _registerListener:v6 forLiveHeadphoneLevelHandler:v7 messageIdentifier:0x200000];
  }
}

- (void)unregisterRemoteLiveHeadphoneLevelHandler:(id)a3
{
}

- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelChangesHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HUUtilities sharedUtilities];
  int v9 = [v8 deviceIsTinker];

  if (v9)
  {
    id v10 = HCLogSoundMeter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_INFO, "Watch is in family mode. Not requesting remote headphone data changes", v11, 2u);
    }
  }
  else
  {
    [(AXHAServer *)self _registerListener:v6 forLiveHeadphoneLevelHandler:v7 messageIdentifier:0x400000];
  }
}

- (void)unregisterRemoteLiveHeadphoneLevelChangesHandler:(id)a3
{
}

- (void)_registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4 messageIdentifier:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5BE0 andIdentifier:a5];
  id v10 = (id)MEMORY[0x2105575F0](v8);

  [(AXHAServer *)self registerUpdateBlock:v10 forIdentifier:a5 withListener:v9];
}

- (void)_unregisterLiveHeadphoneLevelHandler:(id)a3 messageIdentifier:(unint64_t)a4
{
}

- (void)_headphoneLevelDidUpdate:(id)a3 messageIdentifier:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AXHAServer *)self updates];
  id v8 = [NSNumber numberWithUnsignedLongLong:a4];
  id v9 = [v7 objectForKey:v8];

  id v10 = v6;
  id v11 = v9;
  HCPerformSafeBlock();
}

void __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke_2;
  v2[3] = &unk_2640FCF40;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, *(void *)(a1 + 32));
    id v3 = (void (**)(void, void))v4;
  }
}

- (void)registerListener:(id)a3 forControlMessageHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2105575F0](a4);
  [(AXHAServer *)self registerUpdateBlock:v7 forIdentifier:0x8000000000000000 withListener:v6];

  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5C08 andIdentifier:0x8000000000000000];
}

- (void)unregisterControlMessageHandler:(id)a3
{
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x8000000000000000 withListener:a3];

  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5C30 andIdentifier:0x8000000000000000];
}

- (void)controlMessageDidUpdate:(id)a3
{
  id v4 = a3;
  long long v5 = [(AXHAServer *)self updates];
  id v6 = [NSNumber numberWithUnsignedLongLong:0x8000000000000000];
  id v7 = [v5 objectForKey:v6];

  id v10 = v4;
  id v8 = v4;
  id v9 = v7;
  HCPerformSafeBlock();
}

void __38__AXHAServer_controlMessageDidUpdate___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__AXHAServer_controlMessageDidUpdate___block_invoke_2;
  v2[3] = &unk_2640FCF40;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __38__AXHAServer_controlMessageDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, *(void *)(a1 + 32));
    id v3 = (void (**)(void, void))v4;
  }
}

- (void)registerListener:(id)a3 forComfortSoundsModelUpdatesHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2105575F0](a4);
  [(AXHAServer *)self registerUpdateBlock:v7 forIdentifier:0x1000000 withListener:v6];

  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5C58 andIdentifier:0x1000000];
}

- (void)unregisterComfortSoundsModelUpdatesHandler:(id)a3
{
  [(AXHAServer *)self registerUpdateBlock:0 forIdentifier:0x1000000 withListener:a3];

  [(HCServer *)self sendMessageWithPayload:&unk_26C1E5C80 andIdentifier:0x1000000];
}

- (void)comfortSoundsAssetsDidUpdate:(id)a3
{
  id v4 = a3;
  long long v5 = [(AXHAServer *)self updates];
  id v6 = [NSNumber numberWithUnsignedLongLong:0x1000000];
  id v7 = [v5 objectForKey:v6];

  id v10 = v4;
  id v8 = v7;
  id v9 = v4;
  HCPerformSafeBlock();
}

void __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v2 = (void *)MEMORY[0x263F21138];
  id v3 = [*(id *)(a1 + 32) valueForKey:@"HUComfortSoundsAvailableAssetsKey"];
  id v19 = 0;
  id v4 = [v2 unarchivedAssets:v3 error:&v19];
  id v5 = v19;

  id v6 = [*(id *)(a1 + 32) valueForKey:@"HUComfortSoundsDownloadProgressKey"];
  if (v5)
  {
    CSInitializeLogging();
    id v7 = [NSString stringWithFormat:@"Error unarchiving assets"];
    id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer comfortSoundsAssetsDidUpdate:]_block_invoke", 909, v7];
    id v9 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      id v11 = v9;
      uint64_t v12 = [v10 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v12;
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  uint64_t v13 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke_132;
  v16[3] = &unk_2640FD130;
  id v17 = v4;
  id v18 = v6;
  id v14 = v6;
  id v15 = v4;
  [v13 enumerateObjectsUsingBlock:v16];
}

void __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
    id v3 = (void (**)(void, void, void))v4;
  }
}

- (void)reregisterForComfortSoundsAssetsUpdatesIfNeeded
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(AXHAServer *)self updates];
  id v4 = [NSNumber numberWithUnsignedLongLong:0x1000000];
  id v5 = [v3 objectForKey:v4];

  CSInitializeLogging();
  id v6 = [NSString stringWithFormat:@"Reregistering for updates %@", v5];
  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHAServer reregisterForComfortSoundsAssetsUpdatesIfNeeded]", 924, v6];
  id v8 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([v5 count]) {
    [(HCServer *)self sendMessageWithPayload:&unk_26C1E5CA8 andIdentifier:0x1000000];
  }
}

- (void)downloadComfortSoundAsset:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 assetId];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(AXHAServer *)self reregisterForComfortSoundsAssetsUpdatesIfNeeded];
    id v9 = @"HUComfortSoundsDownloadAssetKey";
    id v7 = [v4 assetId];
    v10[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(HCServer *)self sendMessageWithPayload:v8 andIdentifier:0x1000000];
  }
}

- (void)removeComfortSoundAsset:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 assetId];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(AXHAServer *)self reregisterForComfortSoundsAssetsUpdatesIfNeeded];
    id v9 = @"HUComfortSoundsRemoveAssetKey";
    id v7 = [v4 assetId];
    v10[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(HCServer *)self sendMessageWithPayload:v8 andIdentifier:0x1000000];
  }
}

- (void)setupListenerHelperForListener:(id)a3 withAddress:(id)a4
{
  id object = a3;
  id v5 = a4;
  objc_getAssociatedObject(object, &AXHAListenerHelperKey);
  uint64_t v6 = (AXHAListenerHelper *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v6 = [[AXHAListenerHelper alloc] initWithListenerAddress:v5];
    objc_setAssociatedObject(object, &AXHAListenerHelperKey, v6, (void *)1);
  }
}

- (NSArray)availableControllers
{
  return self->_availableControllers;
}

- (void)setAvailableControllers:(id)a3
{
}

- (BOOL)hearingAidReachableForAudioTransfer
{
  return self->_hearingAidReachableForAudioTransfer;
}

- (void)setHearingAidReachableForAudioTransfer:(BOOL)a3
{
  self->_hearingAidReachableForAudioTransfer = a3;
}

- (NSString)hearingDeviceName
{
  return self->_hearingDeviceName;
}

- (void)setHearingDeviceName:(id)a3
{
}

- (NSString)connectedDeviceName
{
  return self->_connectedDeviceName;
}

- (void)setConnectedDeviceName:(id)a3
{
}

- (BOOL)hearingAidConnectedOrReachable
{
  return self->_hearingAidConnectedOrReachable;
}

- (void)setHearingAidConnectedOrReachable:(BOOL)a3
{
  self->_hearingAidConnectedOrReachable = a3;
}

- (NSMutableDictionary)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (NSMutableDictionary)connectionStateBlocks
{
  return self->_connectionStateBlocks;
}

- (void)setConnectionStateBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionStateBlocks, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_connectedDeviceName, 0);
  objc_storeStrong((id *)&self->_hearingDeviceName, 0);
  objc_storeStrong((id *)&self->_availableControllers, 0);
  objc_storeStrong((id *)&self->_availableHearingAids, 0);

  objc_storeStrong((id *)&self->_responseBlocks, 0);
}

@end