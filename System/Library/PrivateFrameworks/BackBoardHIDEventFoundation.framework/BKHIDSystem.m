@interface BKHIDSystem
+ (id)sharedInstance;
- (BKHIDClientConnectionManager)clientConnectionManager;
- (BKHIDDisplayChangeObserving)mainDisplayObserver;
- (BKHIDEventDeliveryManager)deliveryManager;
- (BKHIDEventDispatcherProviding)dispatcherProvider;
- (BKHIDEventProcessor)eventProcessor;
- (BKHIDEventSenderCache)senderCache;
- (BKHIDSystem)init;
- (BKHIDSystemDelegate)delegate;
- (BOOL)isFullyInitialized;
- (OS_dispatch_mach)HIDSystemChannel;
- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5;
- (id)IOHIDServicesMatching:(id)a3;
- (id)systemPropertyForKey:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_asyncScheduleWithHIDEventQuue:(id)a3;
- (void)_beginHandlingEvents;
- (void)buffer:(id)a3 drainEvent:(__IOHIDEvent *)a4 withContext:(id)a5 sender:(id)a6 sequence:(id)a7 toResolution:(id)a8;
- (void)bufferDidFinishDraining:(id)a3;
- (void)bufferWillBeginDraining:(id)a3;
- (void)bufferingDidAddNewBuffers:(id)a3;
- (void)dealloc;
- (void)injectGSEvent:(__GSEvent *)a3;
- (void)injectHIDEvent:(__IOHIDEvent *)a3;
- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
- (void)requestBufferReevaluationWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatcherProvider:(id)a3;
- (void)setFullyInitialized:(BOOL)a3;
- (void)setHIDSystemChannel:(id)a3;
- (void)setMainDisplayObserver:(id)a3;
- (void)setSystemProperty:(id)a3 forKey:(id)a4;
- (void)startEventProcessor:(id)a3 mainDisplayObserver:(id)a4 deliveryManager:(id)a5 dispatcherProvider:(id)a6;
- (void)startEventRouting;
- (void)startHIDSystem;
- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6;
@end

@implementation BKHIDSystem

- (BKHIDEventDeliveryManager)deliveryManager
{
  return (BKHIDEventDeliveryManager *)objc_getProperty(self, a2, 48, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2575 != -1) {
    dispatch_once(&sharedInstance_onceToken_2575, &__block_literal_global_2576);
  }
  v2 = (void *)sharedInstance___singleton;

  return v2;
}

- (BKHIDEventSenderCache)senderCache
{
  return (BKHIDEventSenderCache *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  return 1;
}

- (BKHIDEventDispatcherProviding)dispatcherProvider
{
  return self->_dispatcherProvider;
}

- (void)bufferingDidAddNewBuffers:(id)a3
{
}

- (void)bufferWillBeginDraining:(id)a3
{
}

- (void)bufferDidFinishDraining:(id)a3
{
}

uint64_t __52__BKHIDSystem_requestBufferReevaluationWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) reevaluateBufferingWithContext:*(void *)(a1 + 40)];
}

- (void)requestBufferReevaluationWithContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__BKHIDSystem_requestBufferReevaluationWithContext___block_invoke;
  v6[3] = &unk_1E68718D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BKHIDSystem *)self _asyncScheduleWithHIDEventQuue:v6];
}

- (void)_asyncScheduleWithHIDEventQuue:(id)a3
{
  id v3 = a3;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D418], v3);

  CFRunLoopWakeUp(Main);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcherProvider, 0);
  objc_storeStrong((id *)&self->_mainDisplayObserver, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_HIDSystemChannel, 0);
  objc_storeStrong((id *)&self->_senderCache, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_gsEventQueue, 0);
}

- (void)setDispatcherProvider:(id)a3
{
}

- (void)setMainDisplayObserver:(id)a3
{
}

- (BKHIDDisplayChangeObserving)mainDisplayObserver
{
  return self->_mainDisplayObserver;
}

- (BKHIDEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setHIDSystemChannel:(id)a3
{
}

- (OS_dispatch_mach)HIDSystemChannel
{
  return (OS_dispatch_mach *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFullyInitialized:(BOOL)a3
{
  self->_fullyInitialized = a3;
}

- (BOOL)isFullyInitialized
{
  return self->_fullyInitialized;
}

- (void)setDelegate:(id)a3
{
}

- (BKHIDSystemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKHIDSystemDelegate *)WeakRetained;
}

- (void)buffer:(id)a3 drainEvent:(__IOHIDEvent *)a4 withContext:(id)a5 sender:(id)a6 sequence:(id)a7 toResolution:(id)a8
{
  v22 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  v19 = [(BKHIDSystem *)self dispatcherProvider];
  v20 = [v19 dispatcherForEvent:a4];
  v21 = [v15 processor];
  [v21 processEvent:&v22 withContext:v17 buffer:v18 sequence:v15 sender:v16 dispatcher:v20 resolution:v14];
}

- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_HIDEventSystem)
  {
    MEMORY[0x1F40E8C28]();
  }
  else
  {
    id v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_HIDEventSystem)
  {
    MEMORY[0x1F40E8C00]();
  }
  else
  {
    id v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = NSStringFromSelector(a2);
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)IOHIDServicesMatching:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_HIDEventSystem)
  {
    id v3 = (void *)IOHIDEventSystemCopyServices();
  }
  else
  {
    id v5 = BKLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSelector(a2);
      int v8 = 138543362;
      int v9 = v6;
      _os_log_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: _HIDEventSystem not initialized", (uint8_t *)&v8, 0xCu);
    }
    id v3 = 0;
  }

  return v3;
}

- (void)_beginHandlingEvents
{
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return (BKHIDClientConnectionManager *)(id)__HIDClientConnectionManager;
}

- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_HIDEventSystem)
  {
    return (__IOHIDEvent *)MEMORY[0x1F40E8BC8]();
  }
  else
  {
    v6 = BKLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      uint64_t Name = IOHIDEventTypeGetName();
      __int16 v10 = 2114;
      uint64_t v11 = a4;
      _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "HIDSystem is not fully initialized, dropping systemEventOfType request: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
    }

    return 0;
  }
}

- (void)injectGSEvent:(__GSEvent *)a3
{
  if (a3)
  {
    CFRetain(a3);
    gsEventQueue = self->_gsEventQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__BKHIDSystem_injectGSEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(gsEventQueue, block);
  }
}

void __29__BKHIDSystem_injectGSEvent___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = BKLogEventDelivery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v13 = 67109120;
    int Type = GSEventGetType();
    _os_log_error_impl(&dword_1CFDE2000, v2, OS_LOG_TYPE_ERROR, "Received a GSEvent of type %d, but GSEvents are no longer supported", (uint8_t *)&v13, 8u);
  }

  GSEventRecord = (int *)_GSEventGetGSEventRecord();
  if (!GSEventShouldRouteToFrontMost())
  {
    int v9 = BKLogEventDelivery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = GSEventGetType();
      int v13 = 67109120;
      int Type = v10;
      uint64_t v11 = "Received a GSEvent that is not designated as being routed to frontmost (type %d), routing to system shell";
LABEL_12:
      _os_log_impl(&dword_1CFDE2000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 8u);
    }
LABEL_13:

    BKSendGSEvent(GSEventRecord, 0, 1);
    goto LABEL_14;
  }
  GSEventRemoveShouldRouteToFrontMost();
  if (GSEventGetType() != 50)
  {
    int v9 = BKLogEventDelivery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = GSEventGetType();
      int v13 = 67109120;
      int Type = v12;
      uint64_t v11 = "Received a frontmost non-orientation GSEvent (type:%d), routing to system shell";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  unsigned int v4 = GSEventDeviceOrientation();
  uint64_t v5 = v4;
  v6 = BKLogEventDelivery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    int Type = v4;
    _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "Got an orientation event from a GSEvent: %d", (uint8_t *)&v13, 8u);
  }

  id v7 = +[BKHIDSystem sharedInstance];
  int v8 = [v7 delegate];
  [v8 hidSystem:v7 receivedUpdatedDeviceOrientation:v5];

LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)injectHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)setSystemProperty:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v7 = a4;
  if (!self->_HIDEventSystem)
  {
    int v8 = [NSString stringWithFormat:@"need HID system"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = NSStringFromSelector(a2);
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v11;
      __int16 v17 = 2048;
      id v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKHIDSystem.m";
      __int16 v21 = 1024;
      int v22 = 167;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE01928);
  }
  IOHIDEventSystemSetProperty();
}

- (id)systemPropertyForKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_HIDEventSystem)
  {
    int v8 = [NSString stringWithFormat:@"need HID system"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = NSStringFromSelector(a2);
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = 138544642;
      int v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = @"BKHIDSystem.m";
      __int16 v20 = 1024;
      int v21 = 159;
      __int16 v22 = 2114;
      __int16 v23 = v8;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE01A9CLL);
  }
  id v6 = (id)IOHIDEventSystemGetProperty();

  return v6;
}

- (void)startEventProcessor:(id)a3 mainDisplayObserver:(id)a4 deliveryManager:(id)a5 dispatcherProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_storeStrong((id *)&self->_eventProcessor, a3);
  objc_storeStrong((id *)&self->_mainDisplayObserver, a4);
  objc_storeStrong((id *)&self->_dispatcherProvider, a6);
  objc_storeStrong((id *)&self->_deliveryManager, a5);
  objc_initWeak(&location, self);
  mainDisplayObserver = self->_mainDisplayObserver;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke;
  __int16 v20 = &unk_1E6871730;
  objc_copyWeak(&v21, &location);
  [(BKHIDDisplayChangeObserving *)mainDisplayObserver setDisplayChangedHandler:&v17];
  __int16 v16 = [(BKHIDDisplayChangeObserving *)self->_mainDisplayObserver display];
  [(BKHIDEventDeliveryManager *)self->_deliveryManager setMainDisplay:v16];
  [(BKHIDEventDeliveryManager *)self->_deliveryManager setBufferingDispatcher:self];
  [(BKHIDSystem *)self _beginHandlingEvents];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke_2;
  v6[3] = &unk_1E68718D8;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  [WeakRetained _asyncScheduleWithHIDEventQuue:v6];
}

uint64_t __90__BKHIDSystem_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setMainDisplay:*(void *)(a1 + 40)];
}

- (void)startEventRouting
{
  __HIDClientConnectionManager = [[BKHIDClientConnectionManager alloc] initWithHIDEventSystem:self->_HIDEventSystem];

  MEMORY[0x1F41817F8]();
}

- (void)startHIDSystem
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_HIDEventSystem)
  {
    int v8 = [NSString stringWithFormat:@"IOHIDEventSystem creation failed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = NSStringFromSelector(a2);
      int v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v20 = 138544642;
      id v21 = v9;
      __int16 v22 = 2114;
      __int16 v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      v27 = @"BKHIDSystem.m";
      __int16 v28 = 1024;
      int v29 = 105;
      __int16 v30 = 2114;
      v31 = v8;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE01EE0);
  }
  if (!IOHIDEventSystemOpen())
  {
    id v12 = [NSString stringWithFormat:@"Failed to open HID system fullly"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      id v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      int v20 = 138544642;
      id v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      v27 = @"BKHIDSystem.m";
      __int16 v28 = 1024;
      int v29 = 108;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE01FCCLL);
  }
  unsigned int v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  self->_HIDEventSystemClient = v4;
  if (!v4)
  {
    __int16 v16 = [NSString stringWithFormat:@"BKHID: Failed to create system client"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(a2);
      uint64_t v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      int v20 = 138544642;
      id v21 = v17;
      __int16 v22 = 2114;
      __int16 v23 = v19;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      v27 = @"BKHIDSystem.m";
      __int16 v28 = 1024;
      int v29 = 111;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFE020B8);
  }
  id v5 = v4;
  CFRunLoopRef Main = CFRunLoopGetMain();
  uint64_t v7 = *MEMORY[0x1E4F1D418];

  MEMORY[0x1F40E8B20](v5, Main, v7);
}

- (void)dealloc
{
  HIDEventSystem = self->_HIDEventSystem;
  if (HIDEventSystem) {
    CFRelease(HIDEventSystem);
  }
  HIDEventSystemClient = self->_HIDEventSystemClient;
  if (HIDEventSystemClient) {
    CFRelease(HIDEventSystemClient);
  }
  v5.receiver = self;
  v5.super_class = (Class)BKHIDSystem;
  [(BKHIDSystem *)&v5 dealloc];
}

- (BKHIDSystem)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKHIDSystem;
  v2 = [(BKHIDSystem *)&v10 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    gsEventQueue = v2->_gsEventQueue;
    v2->_gsEventQueue = (OS_dispatch_queue *)Serial;

    objc_super v5 = [BKHIDEventSenderCache alloc];
    uint64_t v6 = [(BKHIDEventSenderCache *)v5 initWithQueue:MEMORY[0x1E4F14428]];
    senderCache = v2->_senderCache;
    v2->_senderCache = (BKHIDEventSenderCache *)v6;

    int v8 = +[BKHIDAccessibilitySender accessibilityHIDServices];
    [(BKHIDEventSenderCache *)v2->_senderCache addSenderInfo:v8];
    v2->_HIDEventSystem = (__IOHIDEventSystem *)IOHIDEventSystemCreate();
  }
  return v2;
}

uint64_t __29__BKHIDSystem_sharedInstance__block_invoke()
{
  sharedInstance___singleton = objc_alloc_init(BKHIDSystem);

  return MEMORY[0x1F41817F8]();
}

@end