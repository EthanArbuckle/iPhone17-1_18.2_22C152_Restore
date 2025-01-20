@interface AXBHardwareManager
+ (void)initializeMonitor;
- (AXBHardwareManager)init;
- (BOOL)shouldNotUpdateHIDClientForNextStickyKeysEnabledChange;
- (NSString)eventTapIdentifier;
- (OS_dispatch_queue)springboardContinuityCheckQueue;
- (id)_stickyKeysClient;
- (void)_notifyServerStickyKeyUpdatedForKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 down:(BOOL)a5 up:(BOOL)a6 locked:(BOOL)a7;
- (void)_notifyServerStickyKeysDisabled;
- (void)_notifyServerStickyKeysToggledViaShift;
- (void)_stickyKeysEnabledChanged;
- (void)_updateCameraButtonSensitivity;
- (void)_updateEventTap;
- (void)_updateForContinuityStateChange;
- (void)_updateIgnoreTrackpadSettings;
- (void)_updateKeyboardService:(__IOHIDServiceClient *)a3;
- (void)_updateStateForKeyboardEvent:(id)a3;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)setEventTapIdentifier:(id)a3;
- (void)setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:(BOOL)a3;
- (void)setSpringboardContinuityCheckQueue:(id)a3;
@end

@implementation AXBHardwareManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_5 != -1) {
    dispatch_once(&initializeMonitor_onceToken_5, &__block_literal_global_11);
  }
}

uint64_t __39__AXBHardwareManager_initializeMonitor__block_invoke()
{
  _SharedManager_2 = objc_alloc_init(AXBHardwareManager);

  return MEMORY[0x270F9A758]();
}

- (AXBHardwareManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXBHardwareManager;
  v2 = [(AXBHardwareManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__AXBHardwareManager_init__block_invoke;
    block[3] = &unk_26510B378;
    v6 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v3;
}

void __26__AXBHardwareManager_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateEventTap];
  [*(id *)(a1 + 32) _updateIgnoreTrackpadSettings];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [MEMORY[0x263F22938] sharedInstance];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __26__AXBHardwareManager_init__block_invoke_2;
  v21[3] = &unk_26510B570;
  objc_copyWeak(&v22, &location);
  [v2 registerUpdateBlock:v21 forRetrieveSelector:sel_stickyKeysEnabled withListener:*(void *)(a1 + 32)];

  objc_destroyWeak(&v22);
  v3 = [MEMORY[0x263F22938] sharedInstance];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __26__AXBHardwareManager_init__block_invoke_3;
  v19[3] = &unk_26510B570;
  objc_copyWeak(&v20, &location);
  [v3 registerUpdateBlock:v19 forRetrieveSelector:sel_stickyKeysShiftToggleEnabled withListener:*(void *)(a1 + 32)];

  objc_destroyWeak(&v20);
  v4 = [MEMORY[0x263F22938] sharedInstance];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __26__AXBHardwareManager_init__block_invoke_4;
  v17[3] = &unk_26510B570;
  objc_copyWeak(&v18, &location);
  [v4 registerUpdateBlock:v17 forRetrieveSelector:sel_ignoreTrackpad withListener:*(void *)(a1 + 32)];

  objc_destroyWeak(&v18);
  if (AXDeviceSupportsCameraButton())
  {
    v5 = [MEMORY[0x263F22938] sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __26__AXBHardwareManager_init__block_invoke_5;
    v15[3] = &unk_26510B570;
    objc_copyWeak(&v16, &location);
    [v5 registerUpdateBlock:v15 forRetrieveSelector:sel_cameraButtonSensitivity withListener:*(void *)(a1 + 32)];

    objc_destroyWeak(&v16);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__slowKeysEnabledChanged name:*MEMORY[0x263F8B380] object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__slowKeysAcceptanceDelayChanged name:*MEMORY[0x263F8B378] object:0];
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.AXBackBoard.ContinuitySessionCheck", 0);
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_handleContinuityDisplayStateChanged, (CFStringRef)*MEMORY[0x263F8B180], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v11 = *(void **)(a1 + 32);
  v12 = v11[4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __26__AXBHardwareManager_init__block_invoke_6;
  v13[3] = &unk_26510B378;
  v14 = v11;
  dispatch_async(v12, v13);

  objc_destroyWeak(&location);
}

void __26__AXBHardwareManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stickyKeysEnabledChanged];
}

void __26__AXBHardwareManager_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stickyKeysShiftToggleChanged];
}

void __26__AXBHardwareManager_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIgnoreTrackpadSettings];
}

void __26__AXBHardwareManager_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCameraButtonSensitivity];
}

uint64_t __26__AXBHardwareManager_init__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForContinuityStateChange];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F8B380] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F8B378] object:0];
  [(AXUIClient *)self->_stickyKeysClient setDelegate:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v5.receiver = self;
  v5.super_class = (Class)AXBHardwareManager;
  [(AXBHardwareManager *)&v5 dealloc];
}

- (void)_updateCameraButtonSensitivity
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22938] sharedInstance];
  [v2 cameraButtonSensitivity];
  double v4 = v3;

  objc_super v5 = [MEMORY[0x263F29868] build:&__block_literal_global_286_0];
  v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v7 = [NSNumber numberWithDouble:v4];
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "CameraButton: Setting sensitivty: %@", buf, 0xCu);
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithDouble:", v4, @"HalfPressThresholdModifier");
  v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  BKSHIDServicesSetPersistentServiceProperties();
}

uint64_t __52__AXBHardwareManager__updateCameraButtonSensitivity__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:65280 primaryUsage:102];
}

- (void)_updateIgnoreTrackpadSettings
{
  v26[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = IOHIDEventSystemClientCreate();
  if (v2)
  {
    double v3 = (__IOHIDEventSystemClient *)v2;
    v25[0] = @"PrimaryUsagePage";
    v25[1] = @"PrimaryUsage";
    v26[0] = &unk_26F637710;
    v26[1] = &unk_26F637728;
    id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    IOHIDEventSystemClientSetMatching();
    cf = v3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    CFArrayRef v4 = IOHIDEventSystemClientCopyServices(v3);
    uint64_t v5 = [(__CFArray *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(__IOHIDServiceClient **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v10 = NSNumber;
          v11 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", v16, cf);
          IOHIDServiceClientSetProperty(v9, @"TrackpadExternallyDisabled", (CFTypeRef)objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "ignoreTrackpad")));

          v12 = AXLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = NSNumber;
            uint64_t v14 = [MEMORY[0x263F22938] sharedInstance];
            v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "ignoreTrackpad"));
            *(_DWORD *)buf = 138412290;
            v23 = v15;
            _os_log_impl(&dword_241F5C000, v12, OS_LOG_TYPE_DEFAULT, "Applying ignore trackpad from pref change %@", buf, 0xCu);
          }
        }
        uint64_t v6 = [(__CFArray *)v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v6);
    }

    CFRelease(cf);
  }
}

- (void)_updateStateForKeyboardEvent:(id)a3
{
  id v9 = a3;
  CFArrayRef v4 = [MEMORY[0x263F22938] sharedInstance];
  unsigned int v5 = [v9 flags];
  if ((v5 & 0xE0000) != 0)
  {
    uint64_t v6 = [v9 keyInfo];
    uint64_t v7 = [v6 keyCode];
    uint64_t v8 = [v9 keyInfo];
    -[AXBHardwareManager _notifyServerStickyKeyUpdatedForKeycode:usagePage:down:up:locked:](self, "_notifyServerStickyKeyUpdatedForKeycode:usagePage:down:up:locked:", v7, [v8 usagePage], (v5 >> 17) & 1, (v5 >> 19) & 1, (v5 >> 18) & 1);
  }
  if ((v5 & 0x200000) != 0 && ([v4 stickyKeysEnabled] & 1) == 0)
  {
    [(AXBHardwareManager *)self setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:1];
    [v4 setStickyKeysEnabled:1];
    [(AXBHardwareManager *)self _notifyServerStickyKeysToggledViaShift];
  }
  else if ((v5 & 0x400000) != 0 && [v4 stickyKeysEnabled])
  {
    [(AXBHardwareManager *)self setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:1];
    [v4 setStickyKeysEnabled:0];
    [(AXBHardwareManager *)self _notifyServerStickyKeysToggledViaShift];
    [(AXBHardwareManager *)self _notifyServerStickyKeysDisabled];
  }
}

- (void)_updateKeyboardService:(__IOHIDServiceClient *)a3
{
  id v15 = [MEMORY[0x263F22938] sharedInstance];
  char v4 = [v15 stickyKeysEnabled];
  unsigned int v5 = (CFTypeRef *)MEMORY[0x263EFFB38];
  uint64_t v6 = (CFTypeRef *)MEMORY[0x263EFFB40];
  uint64_t v7 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if ((v4 & 1) == 0)
  {
    if ([v15 stickyKeysShiftToggleEnabled]) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v6;
    }
  }
  IOHIDServiceClientSetProperty(a3, @"HIDStickyKeysDisabled", *v7);
  int v8 = [v15 stickyKeysEnabled];
  CFTypeRef v9 = *v6;
  CFTypeRef v10 = *v5;
  if (v8) {
    v11 = v9;
  }
  else {
    v11 = v10;
  }
  IOHIDServiceClientSetProperty(a3, @"HIDStickyKeysOn", v11);
  if ([v15 stickyKeysShiftToggleEnabled]) {
    v12 = v9;
  }
  else {
    v12 = v10;
  }
  IOHIDServiceClientSetProperty(a3, @"HIDStickyKeysShiftToggles", v12);
  if (_AXSSlowKeysEnabled())
  {
    _AXSSlowKeysAcceptanceDelay();
    unint64_t v14 = (unint64_t)(v13 * 1000.0);
  }
  else
  {
    unint64_t v14 = 0;
  }
  IOHIDServiceClientSetProperty(a3, @"HIDSlowKeysDelay", (CFTypeRef)[NSNumber numberWithUnsignedInteger:v14]);
}

- (void)_updateEventTap
{
  double v3 = [MEMORY[0x263F22938] sharedInstance];
  if (_AXSSlowKeysEnabled()
    || ([v3 stickyKeysEnabled] & 1) != 0
    || [v3 stickyKeysShiftToggleEnabled])
  {
    char v4 = [(AXBHardwareManager *)self eventTapIdentifier];

    unsigned int v5 = [MEMORY[0x263F228B0] sharedManager];
    uint64_t v6 = v5;
    if (v4)
    {
      uint64_t v7 = [(AXBHardwareManager *)self eventTapIdentifier];
      [v6 runMatchingServiceHandlerForEventTap:v7];
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __37__AXBHardwareManager__updateEventTap__block_invoke;
      v15[3] = &unk_26510B8B0;
      void v15[4] = self;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__AXBHardwareManager__updateEventTap__block_invoke_2;
      v14[3] = &unk_26510B8D8;
      v14[4] = self;
      int v8 = [v5 installKeyboardEventTap:v15 identifier:0 matchingServiceHandler:v14];
      [(AXBHardwareManager *)self setEventTapIdentifier:v8];

      uint64_t v6 = [MEMORY[0x263F228B0] sharedManager];
      uint64_t v7 = [(AXBHardwareManager *)self eventTapIdentifier];
      [v6 setEventTapPriority:v7 priority:22];
    }
  }
  else
  {
    CFTypeRef v9 = [(AXBHardwareManager *)self eventTapIdentifier];

    if (v9)
    {
      CFTypeRef v10 = [MEMORY[0x263F228B0] sharedManager];
      v11 = [(AXBHardwareManager *)self eventTapIdentifier];
      [v10 runMatchingServiceHandlerForEventTap:v11];

      v12 = [MEMORY[0x263F228B0] sharedManager];
      double v13 = [(AXBHardwareManager *)self eventTapIdentifier];
      [v12 removeEventTap:v13];

      [(AXBHardwareManager *)self setEventTapIdentifier:0];
    }
  }
}

uint64_t __37__AXBHardwareManager__updateEventTap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 senderID] != 0x8000000817319378) {
    [*(id *)(a1 + 32) _updateStateForKeyboardEvent:v3];
  }

  return 0;
}

uint64_t __37__AXBHardwareManager__updateEventTap__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateKeyboardService:a2];
}

- (void)_updateForContinuityStateChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F22968] server];
  uint64_t v3 = [v2 isContinuitySessionActive];

  char v4 = [MEMORY[0x263F228B0] sharedManager];
  [v4 setIgnoreEventsForContinuitySession:v3];

  unsigned int v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    int v7 = 136315394;
    int v8 = "-[AXBHardwareManager _updateForContinuityStateChange]";
    __int16 v9 = 2112;
    CFTypeRef v10 = v6;
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "%s isContinuitySessionActive: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_stickyKeysClient
{
  stickyKeysClient = self->_stickyKeysClient;
  if (!stickyKeysClient)
  {
    char v4 = (AXUIClient *)[objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:@"AXBHardwareManager" serviceBundleName:@"StickyKeys"];
    unsigned int v5 = self->_stickyKeysClient;
    self->_stickyKeysClient = v4;

    [(AXUIClient *)self->_stickyKeysClient setDelegate:self];
    stickyKeysClient = self->_stickyKeysClient;
  }

  return stickyKeysClient;
}

- (void)_stickyKeysEnabledChanged
{
  uint64_t v3 = [MEMORY[0x263F22938] sharedInstance];
  char v4 = [v3 stickyKeysEnabled];

  if ((v4 & 1) == 0) {
    [(AXBHardwareManager *)self _notifyServerStickyKeysDisabled];
  }
  if ([(AXBHardwareManager *)self shouldNotUpdateHIDClientForNextStickyKeysEnabledChange])
  {
    [(AXBHardwareManager *)self setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:0];
  }
  else
  {
    [(AXBHardwareManager *)self _updateEventTap];
  }
}

- (void)_notifyServerStickyKeysToggledViaShift
{
  id v3 = [(AXBHardwareManager *)self _stickyKeysClient];
  uint64_t v2 = [MEMORY[0x263F21380] mainAccessQueue];
  [v3 sendAsynchronousMessage:0 withIdentifier:10000 targetAccessQueue:v2 completion:&__block_literal_global_336];
}

uint64_t __60__AXBHardwareManager__notifyServerStickyKeysToggledViaShift__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)_notifyServerStickyKeysDisabled
{
  id v3 = [(AXBHardwareManager *)self _stickyKeysClient];
  uint64_t v2 = [MEMORY[0x263F21380] mainAccessQueue];
  [v3 sendAsynchronousMessage:0 withIdentifier:10001 targetAccessQueue:v2 completion:&__block_literal_global_341];
}

uint64_t __53__AXBHardwareManager__notifyServerStickyKeysDisabled__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)_notifyServerStickyKeyUpdatedForKeycode:(unsigned __int16)a3 usagePage:(unsigned int)a4 down:(BOOL)a5 up:(BOOL)a6 locked:(BOOL)a7
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = a3;
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = 1;
  if (!a6) {
    uint64_t v9 = 2;
  }
  if (a5) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = [(AXBHardwareManager *)self _stickyKeysClient];
  v17[0] = *MEMORY[0x263F22728];
  v12 = [NSNumber numberWithUnsignedShort:v8];
  v18[0] = v12;
  v17[1] = *MEMORY[0x263F22730];
  double v13 = [NSNumber numberWithUnsignedInt:v7];
  v18[1] = v13;
  v17[2] = *MEMORY[0x263F22720];
  unint64_t v14 = [NSNumber numberWithInteger:v10];
  v18[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  id v16 = [MEMORY[0x263F21380] mainAccessQueue];
  [v11 sendAsynchronousMessage:v15 withIdentifier:10002 targetAccessQueue:v16 completion:&__block_literal_global_346];
}

uint64_t __87__AXBHardwareManager__notifyServerStickyKeyUpdatedForKeycode_usagePage_down_up_locked___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__AXBHardwareManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
  block[3] = &unk_26510B378;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__AXBHardwareManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (NSString)eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (void)setEventTapIdentifier:(id)a3
{
}

- (BOOL)shouldNotUpdateHIDClientForNextStickyKeysEnabledChange
{
  return self->_shouldNotUpdateHIDClientForNextStickyKeysEnabledChange;
}

- (void)setShouldNotUpdateHIDClientForNextStickyKeysEnabledChange:(BOOL)a3
{
  self->_shouldNotUpdateHIDClientForNextStickyKeysEnabledChange = a3;
}

- (OS_dispatch_queue)springboardContinuityCheckQueue
{
  return self->_springboardContinuityCheckQueue;
}

- (void)setSpringboardContinuityCheckQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardContinuityCheckQueue, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);

  objc_storeStrong((id *)&self->_stickyKeysClient, 0);
}

@end