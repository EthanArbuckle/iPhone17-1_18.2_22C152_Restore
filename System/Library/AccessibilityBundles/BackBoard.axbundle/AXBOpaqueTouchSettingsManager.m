@interface AXBOpaqueTouchSettingsManager
+ (id)sharedInstance;
- (BOOL)_shouldBlockOpaqueTouchEvents;
- (id)initSharedInstance;
- (void)_applyPreferencesToDeviceService:(__IOHIDServiceClient *)a3;
- (void)_resendPreferencesToServices;
- (void)dealloc;
- (void)deviceServiceAppeared:(__IOHIDServiceClient *)a3;
- (void)deviceServiceDisappeared:(__IOHIDServiceClient *)a3;
- (void)start;
@end

@implementation AXBOpaqueTouchSettingsManager

- (id)initSharedInstance
{
  v7.receiver = self;
  v7.super_class = (Class)AXBOpaqueTouchSettingsManager;
  v2 = [(AXBOpaqueTouchSettingsManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    trackedServices = v2->_trackedServices;
    v2->_trackedServices = (NSMutableArray *)v3;

    v2->_systemFilterClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    v5 = [MEMORY[0x263EFF980] array];
    [v5 addObject:&unk_26F6378C0];
    [v5 addObject:&unk_26F6378E8];
    IOHIDEventSystemClientSetMatchingMultiple();
    CFRunLoopGetMain();
    IOHIDEventSystemClientScheduleWithRunLoop();
  }
  return v2;
}

- (void)dealloc
{
  if (self->_systemFilterClient)
  {
    CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    CFRelease(self->_systemFilterClient);
    self->_systemFilterClient = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)AXBOpaqueTouchSettingsManager;
  [(AXBOpaqueTouchSettingsManager *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

uint64_t __47__AXBOpaqueTouchSettingsManager_sharedInstance__block_invoke()
{
  sharedInstance_shared = [[AXBOpaqueTouchSettingsManager alloc] initSharedInstance];

  return MEMORY[0x270F9A758]();
}

- (void)_applyPreferencesToDeviceService:(__IOHIDServiceClient *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_241F5C000, v4, OS_LOG_TYPE_DEFAULT, "Applying preferences to service", buf, 2u);
  }

  if (IOHIDServiceClientConformsTo(a3, 0xFF60u, 0x1000u))
  {
    _AXSOpaqueTouchTapSpeed();
    uint64_t valuePtr = (uint64_t)(float)(v5 * 1000.0);
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    IOHIDServiceClientSetProperty(a3, @"DoubleTapDeltaMs", v6);
    CFRelease(v6);
    int v7 = _AXSAllowOpaqueTouchGestures();
    v8 = (CFTypeRef *)MEMORY[0x263EFFB38];
    if (!v7) {
      v8 = (CFTypeRef *)MEMORY[0x263EFFB40];
    }
    IOHIDServiceClientSetProperty(a3, @"GesturesDisabled", *v8);
    v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFNumberRef v17 = v6;
      _os_log_impl(&dword_241F5C000, v9, OS_LOG_TYPE_DEFAULT, "Applying double-tap delay %@", buf, 0xCu);
    }
  }
  else
  {
    if (!IOHIDServiceClientConformsTo(a3, 0xDu, 0xCu)) {
      return;
    }
    v10 = NSNumber;
    v11 = [MEMORY[0x263F22938] sharedInstance];
    IOHIDServiceClientSetProperty(a3, @"TrackpadExternallyDisabled", (CFTypeRef)objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "ignoreTrackpad")));

    v9 = AXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSNumber;
      v13 = [MEMORY[0x263F22938] sharedInstance];
      objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "ignoreTrackpad"));
      CFNumberRef v14 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      CFNumberRef v17 = v14;
      _os_log_impl(&dword_241F5C000, v9, OS_LOG_TYPE_DEFAULT, "Applying ignore trackpad from service discovery %@", buf, 0xCu);
    }
  }
}

- (void)deviceServiceAppeared:(__IOHIDServiceClient *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  float v5 = AXLogAccessories();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Accessibility noticed opaque touch service appearing: %@", (uint8_t *)&v7, 0xCu);
  }

  IOHIDServiceClientRegisterRemovalCallback();
  CFNumberRef v6 = a3;
  if (([(NSMutableArray *)self->_trackedServices containsObject:v6] & 1) == 0)
  {
    [(NSMutableArray *)self->_trackedServices addObject:v6];
    [(AXBOpaqueTouchSettingsManager *)self _applyPreferencesToDeviceService:v6];
  }
}

- (void)deviceServiceDisappeared:(__IOHIDServiceClient *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  float v5 = AXLogAccessories();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = a3;
    _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Accessibility noticed opaque touch service disappearing: %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableArray *)self->_trackedServices removeObject:a3];
}

- (void)start
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_running || (v12 = "-[AXBOpaqueTouchSettingsManager start]", _AXAssert(), !self->_running))
  {
    self->_running = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x263F8B108], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_prefChangedCallback, (CFStringRef)*MEMORY[0x263F8B320], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    IOHIDEventSystemClientRegisterDeviceMatchingCallback();
    CFArrayRef v5 = IOHIDEventSystemClientCopyServices(self->_systemFilterClient);
    int v6 = AXLogAccessories();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [(__CFArray *)v5 count];
      _os_log_impl(&dword_241F5C000, v6, OS_LOG_TYPE_DEFAULT, "Accessibility is starting opaque touch settings manager. There are %ld matching devices at startup.", buf, 0xCu);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    CFArrayRef v7 = v5;
    uint64_t v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          -[AXBOpaqueTouchSettingsManager deviceServiceAppeared:](self, "deviceServiceAppeared:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(__CFArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)_resendPreferencesToServices
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = AXLogAccessories();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSMutableArray *)self->_trackedServices count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v4;
    _os_log_impl(&dword_241F5C000, v3, OS_LOG_TYPE_DEFAULT, "Accessibility is resending opaque touch preferences to tracked device services. there are %ld such services.", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFArrayRef v5 = self->_trackedServices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AXBOpaqueTouchSettingsManager _applyPreferencesToDeviceService:](self, "_applyPreferencesToDeviceService:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_shouldBlockOpaqueTouchEvents
{
  return _AXSAllowOpaqueTouchGestures() == 0;
}

- (void).cxx_destruct
{
}

@end