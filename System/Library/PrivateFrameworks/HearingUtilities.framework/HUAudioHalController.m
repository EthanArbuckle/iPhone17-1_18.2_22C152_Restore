@interface HUAudioHalController
- (BOOL)processUpdateDescription:(id)a3;
- (HUAudioHalController)init;
- (NSString)reachableHearingAidsName;
- (id)routeChangeDispatchBlock;
- (unsigned)getHearingPlugInID;
- (unsigned)plugInID;
- (void)clearAudioHalDevice;
- (void)hearingAidConnectionDidChange:(BOOL)a3;
- (void)hearingAidReachabilityDidChange;
- (void)registerForPropertyUpdate;
- (void)setPlugInID:(unsigned int)a3;
- (void)setReachableHearingAidsName:(id)a3;
- (void)setRouteChangeDispatchBlock:(id)a3;
@end

@implementation HUAudioHalController

- (HUAudioHalController)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUAudioHalController;
  v2 = [(HUAudioHalController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__HUAudioHalController_init__block_invoke;
    block[3] = &unk_2640FC960;
    v6 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v3;
}

uint64_t __28__HUAudioHalController_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addAudioHalListener];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)HearingDevicesDidChangeNotification, @"com.apple.accessibility.hearing.audio.transfer.availability", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = *(void **)(a1 + 32);

  return [v3 registerForPropertyUpdate];
}

- (unsigned)getHearingPlugInID
{
  return 0;
}

- (void)hearingAidReachabilityDidChange
{
  nameOfHearingDeviceReachableForAudioHandoff();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(HUAudioHalController *)self updateHalWithReachableHearingAidsName:v3];
}

- (void)clearAudioHalDevice
{
  id v3 = AXLogHearingHalPlugin();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "AXAudioHalController clearAudioHalDevice", v4, 2u);
  }

  [(HUAudioHalController *)self updateHalWithReachableHearingAidsName:0];
}

- (void)registerForPropertyUpdate
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__HUAudioHalController_registerForPropertyUpdate__block_invoke;
  v5[3] = &unk_2640FDB78;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2105575F0](v5, a2);
  id v3 = +[AXHearingAidDeviceController sharedController];
  [v3 registerForPropertyUpdates:v2];

  v4 = +[HUNearbyHearingAidController sharedInstance];
  [v4 registerForPropertyUpdates:v2];
}

void __49__HUAudioHalController_registerForPropertyUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __49__HUAudioHalController_registerForPropertyUpdate__block_invoke_2;
    v4[3] = &unk_2640FCDB0;
    v4[4] = *(void *)(a1 + 32);
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __49__HUAudioHalController_registerForPropertyUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3, char *a4)
{
  id v10 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    char v9 = [*(id *)(a1 + 32) processUpdateDescription:v10];
  }
  else {
    char v9 = 1;
  }
  *a4 = v9;
}

- (BOOL)processUpdateDescription:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKey:&unk_26C1E5888], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    id v7 = [v5 firstObject];
    if ([v7 intValue] == 2)
    {
      [(HUAudioHalController *)self hearingAidConnectionDidChange:1];
    }
    else
    {
      char v9 = [v6 lastObject];
      -[HUAudioHalController hearingAidConnectionDidChange:](self, "hearingAidConnectionDidChange:", [v9 intValue] == 2);
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)hearingAidConnectionDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = AXLogHearingHalPlugin();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "AXAudioHalController hearingAidConnectionDidChange connected: %d", (uint8_t *)v5, 8u);
  }
}

- (NSString)reachableHearingAidsName
{
  return self->_reachableHearingAidsName;
}

- (void)setReachableHearingAidsName:(id)a3
{
}

- (unsigned)plugInID
{
  return self->_plugInID;
}

- (void)setPlugInID:(unsigned int)a3
{
  self->_plugInID = a3;
}

- (id)routeChangeDispatchBlock
{
  return self->_routeChangeDispatchBlock;
}

- (void)setRouteChangeDispatchBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_routeChangeDispatchBlock, 0);

  objc_storeStrong((id *)&self->_reachableHearingAidsName, 0);
}

@end