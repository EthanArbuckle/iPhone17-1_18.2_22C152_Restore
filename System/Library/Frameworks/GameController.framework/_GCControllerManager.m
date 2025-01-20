@interface _GCControllerManager
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)combineSiriRemoteHIDDevicesWithNewController:(id)a3 existingController:(id)a4;
- (BOOL)isAppInBackground;
- (BOOL)isExistingController:(id)a3;
- (BOOL)shouldMonitorBackgroundEvents;
- (GCController)currentController;
- (GCController)firstMicroGamepad;
- (GCExtendedGamepad)currentExtendedGamepad;
- (GCMicroGamepad)currentMicroGamepad;
- (GCMouse)currentMouse;
- (NSObject)identifier;
- (OS_dispatch_queue)controllersQueue;
- (_GCControllerManager)init;
- (id)HIDDeviceMatchingAttributes;
- (id)IPCObjectWithIdentifier:(id)a3;
- (id)_legacy_controllers;
- (id)_legacy_makeHIDEventSource:(__IOHIDEventSystemClient *)a3;
- (id)coalescedKeyboard;
- (id)mice;
- (id)observeHIDEvents:(id)a3;
- (id)observeHIDEvents:(id)a3 forService:(id)a4;
- (id)serviceClientForIPCService:(id)a3;
- (int)connectedATVRemoteCount;
- (void)CBApplicationDidBecomeActive;
- (void)CBApplicationWillResignActive;
- (void)_legacy_addControllerWithServiceInfo:(id)a3;
- (void)_legacy_init;
- (void)_legacy_publishController:(id)a3;
- (void)_legacy_removeControllerWithServiceInfo:(id)a3;
- (void)_legacy_startHIDDeviceMonitor;
- (void)_legacy_startHIDEventMonitor;
- (void)_legacy_stopHIDDeviceMonitor;
- (void)_legacy_stopHIDEventMonitor;
- (void)_legacy_unpublishController:(id)a3;
- (void)_legacy_updateControllerWithEvent:(__IOHIDEvent *)a3;
- (void)_queue_removeController:(id)a3 registryID:(id)a4;
- (void)addController:(id)a3;
- (void)dealloc;
- (void)open;
- (void)registerIPCObject:(id)a3;
- (void)removeCoalescedControllerComponent:(id)a3;
- (void)removeController:(id)a3;
- (void)removeController:(id)a3 registryID:(id)a4;
- (void)setCurrentController:(id)a3;
- (void)setCurrentExtendedGamepad:(id)a3;
- (void)setCurrentMicroGamepad:(id)a3;
- (void)setFirstMicroGamepad:(id)a3;
- (void)setShouldMonitorBackgroundEvents:(BOOL)a3;
- (void)setupHIDMonitor:(BOOL)a3;
- (void)storeController:(id)a3;
- (void)teardownHIDMonitor:(BOOL)a3;
- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3;
@end

@implementation _GCControllerManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_sharedManager;

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && gc_isInternalBuild())
  {
    v2 = getGCLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v4 = objc_opt_class();
      _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_DEFAULT, "+[%{public}@ initialize]", buf, 0xCu);
    }
  }
}

- (_GCControllerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)_GCControllerManager;
  v2 = [(_GCControllerManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("GCControllerManager.controllers", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    controllersQueue = v2->_controllersQueue;
    v2->_controllersQueue = (OS_dispatch_queue *)v3;

    v2->_ipcRegistryLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [objc_alloc((Class)&off_26D2C08B0) initWithKeyOptions:0 valueOptions:5 capacity:0];
    ipcObjectRegistry = v2->_ipcObjectRegistry;
    v2->_ipcObjectRegistry = (NSMapTable *)v5;

    [(_GCControllerManager *)v2 registerIPCObject:v2];
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.corecontroller.events", v7);
    hidSystemClientQueue = v2->_hidSystemClientQueue;
    v2->_hidSystemClientQueue = (OS_dispatch_queue *)v8;

    [(_GCControllerManager *)v2 _legacy_init];
  }
  return v2;
}

- (void)dealloc
{
  [(_GCControllerManager *)self _legacy_dealloc];
  v3.receiver = self;
  v3.super_class = (Class)_GCControllerManager;
  [(_GCControllerManager *)&v3 dealloc];
}

- (void)setShouldMonitorBackgroundEvents:(BOOL)a3
{
  if (self->_shouldMonitorBackgroundEvents != a3)
  {
    self->_shouldMonitorBackgroundEvents = a3;
    if (gc_isInternalBuild())
    {
      uint64_t v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_shouldMonitorBackgroundEvents) {
          uint64_t v5 = @"YES";
        }
        else {
          uint64_t v5 = @"NO";
        }
        int v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "shouldMonitorBackgroundEvents = %@", (uint8_t *)&v6, 0xCu);
      }
    }
    if (self->_shouldMonitorBackgroundEvents) {
      [(_GCControllerManager *)self CBApplicationDidBecomeActive];
    }
  }
}

- (BOOL)shouldMonitorBackgroundEvents
{
  return self->_shouldMonitorBackgroundEvents;
}

- (id)HIDDeviceMatchingAttributes
{
  v2 = +[NSMutableArray array];
  v14[0] = @"DeviceUsagePage";
  v14[1] = @"DeviceUsage";
  v15[0] = &unk_26D286570;
  v15[1] = &unk_26D286588;
  objc_super v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 addObject:v3];
  v12[0] = @"DeviceUsagePage";
  v12[1] = @"DeviceUsage";
  v13[0] = &unk_26D286570;
  v13[1] = &unk_26D2865A0;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v2 addObject:v4];
  v10[0] = @"DeviceUsagePage";
  v10[1] = @"DeviceUsage";
  v11[0] = &unk_26D286570;
  v11[1] = &unk_26D2865B8;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v2 addObject:v5];
  v8[0] = @"DeviceUsagePage";
  v8[1] = @"DeviceUsage";
  v9[0] = &unk_26D286570;
  v9[1] = &unk_26D2865D0;
  int v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v2 addObject:v6];

  return v2;
}

- (void)setupHIDMonitor:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_hidSystemClient)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v5 = _os_activity_create(&dword_220998000, "Setup HID Monitor", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    int v6 = (void *)IOHIDEventSystemClientCreateWithType();
    IOHIDEventSystemClientSetDispatchQueue();
    v7 = [(_GCControllerManager *)self HIDDeviceMatchingAttributes];
    IOHIDEventSystemClientSetMatchingMultiple();

    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke;
    v27[3] = &unk_26D22B8B0;
    objc_copyWeak(v28, &location);
    v28[1] = v6;
    dispatch_queue_t v8 = (void *)MEMORY[0x223C6E420](v27);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke_127;
    v24[3] = &unk_26D22B8D8;
    objc_copyWeak(v26, &location);
    v26[1] = v6;
    id v9 = v8;
    id v25 = v9;
    v10 = (void *)MEMORY[0x223C6E420](v24);
    IOHIDEventSystemClientRegisterDeviceMatchingBlock();
    objc_super v11 = [(_GCControllerManager *)self makeHIDEventSource:v6];
    hidEventSource = self->_hidEventSource;
    self->_hidEventSource = v11;

    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = __40___GCControllerManager_setupHIDMonitor___block_invoke_128;
    v22 = &__block_descriptor_40_e5_v8__0l;
    v23 = v6;
    IOHIDEventSystemClientSetCancelHandler();
    self->_hidSystemClient = (__IOHIDEventSystemClient *)CFRetain(v6);
    __dmb(0xBu);
    if (v3)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __40___GCControllerManager_setupHIDMonitor___block_invoke_2;
      v16[3] = &unk_26D22B900;
      v18 = v6;
      id v17 = v10;
      v13 = (void *)MEMORY[0x223C6E420](v16);
      int IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
      hidSystemClientQueue = self->_hidSystemClientQueue;
      if (IsGameControllerDaemon) {
        dispatch_async_and_wait(hidSystemClientQueue, v13);
      }
      else {
        dispatch_async(hidSystemClientQueue, v13);
      }
    }
    IOHIDEventSystemClientActivate();

    objc_destroyWeak(v26);
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
    os_activity_scope_leave(&state);
  }
}

- (void)teardownHIDMonitor:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  hidSystemClient = self->_hidSystemClient;
  if (hidSystemClient)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    int v6 = _os_activity_create(&dword_220998000, "Teardown HID Monitor", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = __43___GCControllerManager_teardownHIDMonitor___block_invoke;
    v10[3] = &unk_26D22B928;
    v10[4] = self;
    v10[5] = hidSystemClient;
    v7 = (void (**)(void))MEMORY[0x223C6E420](v10);
    dispatch_queue_t v8 = v7;
    if (v3) {
      dispatch_sync((dispatch_queue_t)self->_hidSystemClientQueue, v7);
    }
    else {
      v7[2](v7);
    }
    hidEventSource = self->_hidEventSource;
    self->_hidEventSource = 0;

    os_activity_scope_leave(&state);
  }
}

- (id)observeHIDEvents:(id)a3 forService:(id)a4
{
  return [(_GCHIDEventSubject *)self->_hidEventSource observeHIDEvents:a3 forService:a4];
}

- (id)observeHIDEvents:(id)a3
{
  return [(_GCHIDEventSubject *)self->_hidEventSource observeHIDEvents:a3];
}

- (void)open
{
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "open", v4, 2u);
    }
  }
  if (!self->_hidSystemClient) {
    [(_GCControllerManager *)self _legacy_startHIDDeviceMonitor];
  }
  [(_GCControllerManager *)self setupHIDMonitor:1];
}

- (OS_dispatch_queue)controllersQueue
{
  return self->_controllersQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__controller_genericBTRemote, 0);
  objc_storeStrong((id *)&self->_keyboardAndMouseManager, 0);
  objc_destroyWeak((id *)&self->_firstMicroGamepad);
  objc_storeStrong((id *)&self->_controllersByRegistryID, 0);
  objc_storeStrong((id *)&self->_controllersByUDID, 0);
  objc_storeStrong(&self->_hidEventObservation, 0);
  objc_storeStrong((id *)&self->_currentExtendedGamepad, 0);
  objc_storeStrong((id *)&self->_currentMicroGamepad, 0);
  objc_storeStrong((id *)&self->_currentController, 0);
  objc_storeStrong((id *)&self->_hidEventSource, 0);
  objc_storeStrong((id *)&self->_ipcObjectRegistry, 0);
  objc_storeStrong((id *)&self->_hidSystemClientQueue, 0);

  objc_storeStrong((id *)&self->_controllersQueue, 0);
}

- (NSObject)identifier
{
  return @"SharedManagee";
}

- (id)IPCObjectWithIdentifier:(id)a3
{
  p_ipcRegistryLock = &self->_ipcRegistryLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ipcRegistryLock);
  int v6 = [(NSMapTable *)self->_ipcObjectRegistry objectForKey:v5];

  os_unfair_lock_unlock(p_ipcRegistryLock);

  return v6;
}

- (void)registerIPCObject:(id)a3
{
  id v5 = a3;
  int v6 = [v5 identifier];
  id v8 = (id)[v6 copyWithZone:0];

  if (!v8)
  {
    v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v7 handleFailureInMethod:a2 object:self file:@"GCControllerManager.m" lineNumber:500 description:@"Object has nil IPCIdentifier"];
  }
  os_unfair_lock_lock(&self->_ipcRegistryLock);
  [(NSMapTable *)self->_ipcObjectRegistry setObject:v5 forKey:v8];

  os_unfair_lock_unlock(&self->_ipcRegistryLock);
}

- (id)serviceClientForIPCService:(id)a3
{
  return 0;
}

- (void)_legacy_init
{
  BOOL v3 = (NSMutableDictionary *)objc_opt_new();
  controllersByUDID = self->_controllersByUDID;
  self->_controllersByUDID = v3;

  id v5 = (NSMutableDictionary *)objc_opt_new();
  controllersByRegistryID = self->_controllersByRegistryID;
  self->_controllersByRegistryID = v5;

  self->_currentMediaRemoteInputMode = -1;
  v7 = +[GCKeyboardAndMouseManager managerWithQueue:self->_controllersQueue];
  keyboardAndMouseManager = self->_keyboardAndMouseManager;
  self->_keyboardAndMouseManager = v7;
}

- (BOOL)isAppInBackground
{
  v2 = +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
  char v3 = [v2 isAppInBackground];

  return v3;
}

- (void)CBApplicationWillResignActive
{
  [(_GCControllerManager *)self _legacy_stopHIDEventMonitor];
  char v3 = [(_GCControllerManager *)self controllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 motion];

        if (v9)
        {
          v10 = [v8 motion];
          [v10 _pauseMotionUpdates:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  +[GCController __daemon__appDidEnterBackground];
}

- (void)CBApplicationDidBecomeActive
{
  [(_GCControllerManager *)self _legacy_startHIDEventMonitor];
  char v3 = [(_GCControllerManager *)self controllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 motion];

        if (v9)
        {
          v10 = [v8 motion];
          [v10 _pauseMotionUpdates:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  +[GCController __daemon__appWillEnterForeground];
}

- (id)_legacy_makeHIDEventSource:(__IOHIDEventSystemClient *)a3
{
  uint64_t v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 objectForInfoDictionaryKey:@"_GCBypassUIKit"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0
    || (+[UIApplication sharedApplication],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v10 = [[_GCHIDEventIOKitClient alloc] initWithClient:a3 queue:self->_hidSystemClientQueue];
    goto LABEL_6;
  }
  id v9 = +[UIApplication sharedApplication];

  if (v9)
  {
    v10 = [[_GCHIDEventUIKitClient alloc] initWithQueue:self->_hidSystemClientQueue];
LABEL_6:
    long long v11 = v10;
    goto LABEL_7;
  }
  long long v11 = 0;
LABEL_7:

  return v11;
}

- (void)_legacy_startHIDDeviceMonitor
{
  if (gc_isInternalBuild())
  {
    char v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "startHIDEventSystemClient", v4, 2u);
    }
  }
  [(_GCControllerManager *)self setupHIDMonitor:1];
}

- (void)_legacy_stopHIDDeviceMonitor
{
  if (gc_isInternalBuild())
  {
    char v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220998000, v3, OS_LOG_TYPE_DEFAULT, "stopHIDEventSystemClient", v4, 2u);
    }
  }
  [(_GCControllerManager *)self teardownHIDMonitor:0];
}

- (void)_legacy_startHIDEventMonitor
{
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "startHIDEventMonitor", buf, 2u);
    }
  }
  if (!self->_hidSystemClient) {
    [(_GCControllerManager *)self _legacy_startHIDDeviceMonitor];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __60___GCControllerManager_Legacy___legacy_startHIDEventMonitor__block_invoke;
  v6[3] = &unk_26D22CE28;
  v6[4] = self;
  char v3 = [(_GCControllerManager *)self observeHIDEvents:v6];
  id hidEventObservation = self->_hidEventObservation;
  self->_id hidEventObservation = v3;
}

- (void)_legacy_stopHIDEventMonitor
{
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "stopHIDEventMonitor", v5, 2u);
    }
  }
  id hidEventObservation = self->_hidEventObservation;
  self->_id hidEventObservation = 0;
}

- (void)_legacy_publishController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 areAllHIDDevicesConnected] && (objc_msgSend(v4, "isPublished") & 1) == 0)
  {
    objc_msgSend(v4, "_legacy_invalidateDescription");
    [v4 setPublished:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __58___GCControllerManager_Legacy___legacy_publishController___block_invoke;
    v6[3] = &unk_26D22A8E8;
    id v7 = v4;
    id v8 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    v32 = getGCLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220998000, v32, OS_LOG_TYPE_DEFAULT, "current GCController disconnected, searching for more recently used controller", buf, 2u);
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(_GCControllerManager *)self _legacy_controllers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (!v5)
  {
    id v7 = 0;
    id v8 = 0;
    goto LABEL_28;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v39;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v39 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v38 + 1) + 8 * v10);
      if (v11 != v4)
      {
        long long v12 = [*(id *)(*((void *)&v38 + 1) + 8 * v10) profile];
        if (gc_isInternalBuild())
        {
          v26 = getGCLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            [v11 profile];
            v27 = v36 = self;
            [v27 lastEventTimestamp];
            *(_DWORD *)buf = 134217984;
            v43 = v28;
            _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_DEFAULT, "candidate controller lastEventTimestamp=%f", buf, 0xCu);

            self = v36;
          }
        }
        [v12 lastEventTimestamp];
        double v14 = v13;
        v15 = [v8 profile];
        [v15 lastEventTimestamp];
        double v17 = v16;

        if (v14 >= v17)
        {
          id v18 = v11;

          id v8 = v18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [(_GCControllerManager *)self currentExtendedGamepad];
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [(_GCControllerManager *)self currentMicroGamepad];
LABEL_15:
          uint64_t v20 = (void *)v19;
        }
        else
        {
          uint64_t v20 = 0;
        }
        [v12 lastEventTimestamp];
        double v22 = v21;
        [v20 lastEventTimestamp];
        if (v22 >= v23)
        {
          v24 = self;
          id v25 = v12;

          id v7 = v25;
          self = v24;
        }
      }
      ++v10;
    }
    while (v6 != v10);
    uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    uint64_t v6 = v29;
  }
  while (v29);
LABEL_28:

  v30 = v7;
  if (gc_isInternalBuild())
  {
    v33 = getGCLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [v8 profile];
      [v34 lastEventTimestamp];
      *(_DWORD *)buf = 138412546;
      v43 = v8;
      __int16 v44 = 2048;
      uint64_t v45 = v35;
      _os_log_impl(&dword_220998000, v33, OS_LOG_TYPE_DEFAULT, "setting current controller to %@, as lastEventTimestamp=%f", buf, 0x16u);
    }
  }
  id v31 = [(_GCControllerManager *)self currentController];

  if (v31 == v4) {
    [(_GCControllerManager *)self setCurrentController:v8];
  }
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_GCControllerManager *)self setCurrentExtendedGamepad:v30];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(_GCControllerManager *)self setCurrentMicroGamepad:v30];
      }
    }
  }
}

- (void)_legacy_unpublishController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_GCControllerManager *)self controllersQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isPublished])
  {
    [v4 setPublished:0];
    if (gc_isInternalBuild())
    {
      uint64_t v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v4 productCategory];
        *(_DWORD *)buf = 138412546;
        long long v12 = v7;
        __int16 v13 = 2112;
        id v14 = v4;
        _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_DEFAULT, "posting GCControllerDidDisconnectNotification for %@ controller: %@", buf, 0x16u);
      }
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = __60___GCControllerManager_Legacy___legacy_unpublishController___block_invoke;
    v8[3] = &unk_26D22A8E8;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

- (void)storeController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [v4 deviceHash]);
  [(NSMutableDictionary *)self->_controllersByUDID setObject:v4 forKey:v5];
  uint64_t v6 = [v4 hidServices];
  id v7 = (void *)[v6 mutableCopy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v20;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13), "registryID", v18, (void)v19);
        if (!gc_isInternalBuild())
        {
          if (!v14) {
            goto LABEL_9;
          }
LABEL_8:
          [(NSMutableDictionary *)self->_controllersByRegistryID setObject:v4 forKey:v14];
          if (gc_isInternalBuild())
          {
            double v16 = getGCLogger();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_DEFAULT, "added to controllers by registry id lookup", buf, 2u);
            }
          }
          goto LABEL_9;
        }
        v15 = getGCLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v24 = v14;
          _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_DEFAULT, "got registryID = %@", buf, 0xCu);
        }

        if (v14) {
          goto LABEL_8;
        }
LABEL_9:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v17 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      uint64_t v11 = v17;
    }
    while (v17);
  }
}

- (void)addController:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    id v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 hidServices];
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "addController:%@, services: %@", buf, 0x16u);
    }
  }
  controllersQueue = self->_controllersQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = __46___GCControllerManager_Legacy__addController___block_invoke;
  v9[3] = &unk_26D22A8E8;
  id v10 = v4;
  uint64_t v11 = self;
  id v6 = v4;
  dispatch_barrier_sync(controllersQueue, v9);
}

- (void)removeController:(id)a3
{
}

- (void)removeController:(id)a3 registryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  controllersQueue = self->_controllersQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60___GCControllerManager_Legacy__removeController_registryID___block_invoke;
  block[3] = &unk_26D22B618;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(controllersQueue, block);
}

- (void)_queue_removeController:(id)a3 registryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllersQueue);
  if (gc_isInternalBuild())
  {
    long long v18 = getGCLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = [v6 deviceHash];
      _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_DEFAULT, "removeController:%@ for hash: %lu", (uint8_t *)&v20, 0x16u);
    }
  }
  id v8 = +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", [v6 deviceHash]);
  id v9 = [(NSMutableDictionary *)self->_controllersByUDID objectForKey:v8];
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      long long v19 = getGCLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v8;
        _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_DEFAULT, "removing from registry lookup with registry ID: %@ and UDID: %@", (uint8_t *)&v20, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_controllersByRegistryID removeObjectForKey:v7];
  }
  controller_genericBTRemote = [v9 physicalInputProfile];
  if ([controller_genericBTRemote conformsToProtocol:&unk_26D294150])
  {
    uint64_t v11 = [v9 physicalInputProfile];
    if ([v11 deviceType] == 5)
    {
    }
    else
    {
      id v12 = [v9 physicalInputProfile];
      uint64_t v13 = [v12 deviceType];

      if (v13 != 6) {
        goto LABEL_11;
      }
    }
    controller_genericBTRemote = self->__controller_genericBTRemote;
    self->__controller_genericBTRemote = 0;
  }

LABEL_11:
  __int16 v14 = [v6 profile];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_18;
  }
  v15 = [v6 hidServices];
  unint64_t v16 = [v15 count];

  if (v16 < 2)
  {
LABEL_18:
    [v9 setAllHIDDevicesConnected:0];
    [(NSMutableDictionary *)self->_controllersByUDID removeObjectForKey:v8];
    [(_GCControllerManager *)self _legacy_unpublishController:v9];
    goto LABEL_19;
  }
  if (gc_isInternalBuild())
  {
    uint64_t v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "Coalesced keyboard was removed with registryID: %@", (uint8_t *)&v20, 0xCu);
    }
  }
LABEL_19:
}

- (id)_legacy_controllers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  controllersQueue = self->_controllersQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __51___GCControllerManager_Legacy___legacy_controllers__block_invoke;
  v5[3] = &unk_26D22ACE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(controllersQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isExistingController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  controllersQueue = self->_controllersQueue;
  char v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53___GCControllerManager_Legacy__isExistingController___block_invoke;
  block[3] = &unk_26D22CE50;
  id v9 = v4;
  id v10 = self;
  id v11 = &v12;
  id v6 = v4;
  dispatch_barrier_sync(controllersQueue, block);
  LOBYTE(controllersQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)controllersQueue;
}

- (void)_legacy_addControllerWithServiceInfo:(id)a3
{
  id v4 = a3;
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    uint64_t v5 = [v4 numberPropertyForKey:@"GameControllerSupportedHIDDevice"];
    if (([v5 BOOLValue] & 1) == 0
      && (objc_msgSend(ControllerClassForService((__IOHIDServiceClient *)objc_msgSend(v4, "service")), "conformsToProtocol:", &unk_26D290330) & 1) == 0&& !-[GCKeyboardAndMouseManager addDeviceWithServiceRef:](self->_keyboardAndMouseManager, "addDeviceWithServiceRef:", objc_msgSend(v4, "service")))
    {
      if (gc_isInternalBuild())
      {
        id v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v4 registryID];
          int v9 = 138412546;
          id v10 = v4;
          __int16 v11 = 2112;
          uint64_t v12 = v8;
          _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "addControllerWithServiceInfo:%@ registryID:%@", (uint8_t *)&v9, 0x16u);
        }
      }
      id v6 = -[GCController initWithServiceRef:]([GCController alloc], "initWithServiceRef:", [v4 service]);
      if (v6) {
        [(_GCControllerManager *)self addController:v6];
      }
    }
  }
}

- (void)_legacy_removeControllerWithServiceInfo:(id)a3
{
  id v4 = a3;
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    -[GCKeyboardAndMouseManager removeDeviceWithServiceRef:](self->_keyboardAndMouseManager, "removeDeviceWithServiceRef:", [v4 service]);
    uint64_t v5 = [v4 registryID];
    id v6 = [(NSMutableDictionary *)self->_controllersByRegistryID objectForKey:v5];
    if (v6)
    {
      [(_GCControllerManager *)self removeController:v6 registryID:v5];
      if (gc_isInternalBuild())
      {
        id v7 = getGCLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v6 hidServices];
          int v9 = 138412290;
          id v10 = v8;
          _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "Removing: %@", (uint8_t *)&v9, 0xCu);
        }
      }
      objc_msgSend(v6, "removeServiceRef:", objc_msgSend(v4, "service"));
    }
  }
}

- (id)coalescedKeyboard
{
  return [(GCKeyboardAndMouseManager *)self->_keyboardAndMouseManager coalescedKeyboard];
}

- (id)mice
{
  v2 = [(GCKeyboardAndMouseManager *)self->_keyboardAndMouseManager mice];
  id v3 = v2;
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  return v4;
}

- (GCMouse)currentMouse
{
  return [(GCKeyboardAndMouseManager *)self->_keyboardAndMouseManager currentMouse];
}

- (GCController)currentController
{
  return self->_currentController;
}

- (void)setCurrentController:(id)a3
{
  uint64_t v5 = (GCController *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_currentController = (id *)&v6->_currentController;
  currentController = v6->_currentController;
  if (currentController != v5)
  {
    if (currentController)
    {
      if (gc_isInternalBuild())
      {
        __int16 v22 = getGCLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[_GCControllerManager(Legacy) setCurrentController:]((uint64_t *)&v6->_currentController, v22);
        }
      }
      int v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCControllerDidStopBeingCurrentNotification" object:*p_currentController userInfo:0];
    }
    objc_storeStrong((id *)&v6->_currentController, a3);
    if (gc_isInternalBuild())
    {
      id v21 = getGCLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[_GCControllerManager(Legacy) setCurrentController:]((uint64_t *)&v6->_currentController, v21);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCControllerDidBecomeCurrentNotification" object:*p_currentController userInfo:0];

    __int16 v11 = [*p_currentController profile];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v13 = *p_currentController;
    if (isKindOfClass)
    {
      uint64_t v14 = [v13 profile];
      [(_GCControllerManager *)v6 setCurrentExtendedGamepad:v14];

      char v15 = [*p_currentController profile];
      [(_GCControllerManager *)v6 setCurrentMicroGamepad:v15];
LABEL_12:

      goto LABEL_13;
    }
    unint64_t v16 = [v13 profile];
    __deprecated_GCGamepad_Class();
    char v17 = objc_opt_isKindOfClass();

    id v18 = *p_currentController;
    if (v17)
    {
      char v15 = [v18 profile];
      [(_GCControllerManager *)v6 setCurrentMicroGamepad:v15];
      goto LABEL_12;
    }
    long long v19 = [v18 profile];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20)
    {
      char v15 = [*p_currentController profile];
      [(_GCControllerManager *)v6 setCurrentMicroGamepad:v15];
      goto LABEL_12;
    }
  }
LABEL_13:
  objc_sync_exit(v6);
}

- (GCMicroGamepad)currentMicroGamepad
{
  return self->_currentMicroGamepad;
}

- (void)setCurrentMicroGamepad:(id)a3
{
  uint64_t v5 = (GCMicroGamepad *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_currentMicroGamepad = &v6->_currentMicroGamepad;
  currentMicroGamepad = v6->_currentMicroGamepad;
  if (currentMicroGamepad != v5)
  {
    if (currentMicroGamepad)
    {
      if (gc_isInternalBuild())
      {
        id v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *p_currentMicroGamepad;
          int v15 = 138412290;
          unint64_t v16 = v14;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "GCMicroGamepadDidStopBeingCurrent - %@", (uint8_t *)&v15, 0xCu);
        }
      }
      int v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCMicroGamepadDidStopBeingCurrentNotification" object:*p_currentMicroGamepad userInfo:0];
    }
    objc_storeStrong((id *)&v6->_currentMicroGamepad, a3);
    if (gc_isInternalBuild())
    {
      __int16 v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *p_currentMicroGamepad;
        int v15 = 138412290;
        unint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "GCMicroGamepadDidBecomeCurrent - %@", (uint8_t *)&v15, 0xCu);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCMicroGamepadDidBecomeCurrentNotification" object:*p_currentMicroGamepad userInfo:0];
  }
  objc_sync_exit(v6);
}

- (GCExtendedGamepad)currentExtendedGamepad
{
  return self->_currentExtendedGamepad;
}

- (void)setCurrentExtendedGamepad:(id)a3
{
  uint64_t v5 = (GCExtendedGamepad *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_currentExtendedGamepad = &v6->_currentExtendedGamepad;
  currentExtendedGamepad = v6->_currentExtendedGamepad;
  if (currentExtendedGamepad != v5)
  {
    if (currentExtendedGamepad)
    {
      if (gc_isInternalBuild())
      {
        id v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *p_currentExtendedGamepad;
          int v15 = 138412290;
          unint64_t v16 = v14;
          _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "GCExtendedGamepadDidStopBeingCurrent - %@", (uint8_t *)&v15, 0xCu);
        }
      }
      int v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"GCExtendedGamepadDidStopBeingCurrentNotification" object:*p_currentExtendedGamepad userInfo:0];
    }
    objc_storeStrong((id *)&v6->_currentExtendedGamepad, a3);
    if (gc_isInternalBuild())
    {
      __int16 v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *p_currentExtendedGamepad;
        int v15 = 138412290;
        unint64_t v16 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "GCExtendedGamepadDidBecomeCurrent - %@", (uint8_t *)&v15, 0xCu);
      }
    }
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"GCExtendedGamepadDidBecomeCurrentNotification" object:*p_currentExtendedGamepad userInfo:0];
  }
  objc_sync_exit(v6);
}

- (void)_legacy_updateControllerWithEvent:(__IOHIDEvent *)a3
{
  if ((![(_GCControllerManager *)self isAppInBackground]
     || [(_GCControllerManager *)self shouldMonitorBackgroundEvents])
    && ![(GCKeyboardAndMouseManager *)self->_keyboardAndMouseManager handleHIDEvent:a3])
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:IOHIDEventGetSenderID()];
    if (IOHIDEventGetType() == 11 && _DescendantPointerEvent_0((uint64_t)a3))
    {
      uint64_t v5 = +[NSNumber numberWithUnsignedLongLong:IOHIDEventGetSenderID()];

      id v8 = (id)v5;
    }
    id v6 = [(NSMutableDictionary *)self->_controllersByRegistryID objectForKey:v8];
    char v7 = [v6 isComponentBased];
    if (v6 && (v7 & 1) == 0)
    {
      [(_GCControllerManager *)self setCurrentController:v6];
      objc_msgSend(v6, "_legacy_handleEvent:", a3);
    }
  }
}

- (void)removeCoalescedControllerComponent:(id)a3
{
  id v4 = (GCController *)a3;
  uint64_t v29 = self;
  uint64_t v5 = [(_GCControllerManager *)self firstMicroGamepad];
  uint64_t v6 = [(GCController *)v4 deviceHash];
  char v7 = [(GCController *)v5 profile];
  if ([v7 owner] == v6) {
    [v7 setOwner:0];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [(NSMutableDictionary *)v29->_controllersByUDID allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v28 = v5;
    v27 = v7;
    __int16 v11 = 0;
    uint64_t v12 = 0;
    int v13 = 0;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v8);
        }
        unint64_t v16 = *(GCController **)(*((void *)&v30 + 1) + 8 * i);
        if (v16 != v4
          && [*(id *)(*((void *)&v30 + 1) + 8 * i) isATVRemote]
          && [(GCController *)v16 areAllHIDDevicesConnected])
        {
          ++v13;
          controller_genericBTRemote = v29->__controller_genericBTRemote;
          id v18 = v16;
          if (v16 == controller_genericBTRemote) {
            long long v19 = v11;
          }
          else {
            long long v19 = v12;
          }
          if (v16 == controller_genericBTRemote) {
            __int16 v11 = v18;
          }
          else {
            uint64_t v12 = v18;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v10);

    if (v13)
    {
      if (v11 && (v11 == v29->__controller_genericBTRemote ? (BOOL v20 = v13 == 1) : (BOOL v20 = 0), v20))
      {
        if (gc_isInternalBuild())
        {
          id v25 = getGCLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v11;
            _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_DEFAULT, "Publishing directional gamepad as the first microgamepad, since no others remain... %@", buf, 0xCu);
          }
        }
        uint64_t v5 = v28;
        -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v28, v27);
        [(_GCControllerManager *)v29 setFirstMicroGamepad:v11];
        [(_GCControllerManager *)v29 _legacy_publishController:v11];
      }
      else
      {
        uint64_t v5 = v28;
        if (v28 == v4)
        {
          char v7 = v27;
          if (gc_isInternalBuild())
          {
            v26 = getGCLogger();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v35 = v12;
              _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_DEFAULT, "Publishing candidate gamepad as the first microgamepad, since the first microgamepad was disconnected... %@", buf, 0xCu);
            }

            char v7 = v27;
            uint64_t v5 = v28;
          }
          -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v4, v27);
          [(_GCControllerManager *)v29 setFirstMicroGamepad:v12];
          [(_GCControllerManager *)v29 _legacy_publishController:v12];
          goto LABEL_36;
        }
      }
      char v7 = v27;
      goto LABEL_36;
    }
    char v7 = v27;
    uint64_t v5 = v28;
  }
  else
  {

    uint64_t v12 = 0;
    __int16 v11 = 0;
  }
  if (gc_isInternalBuild())
  {
    v24 = getGCLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v5;
      _os_log_impl(&dword_220998000, v24, OS_LOG_TYPE_DEFAULT, "We are the last microgamepad, disconnecting the first microgamepad... %@", buf, 0xCu);
    }
  }
  -[_GCControllerManager _legacy_unpublishController:](v29, "_legacy_unpublishController:", v5, v27);
  [(_GCControllerManager *)v29 setFirstMicroGamepad:0];
LABEL_36:
  id v21 = [(GCController *)v4 hidServices];
  unint64_t v22 = [v21 count];

  if (v22 <= 1)
  {
    uint64_t v23 = +[NSNumber numberWithUnsignedInteger:[(GCController *)v4 deviceHash]];
    [(NSMutableDictionary *)v29->_controllersByUDID removeObjectForKey:v23];
  }
}

- (int)connectedATVRemoteCount
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMutableDictionary *)self->_controllersByUDID allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isATVRemote]) {
          v5 += [v8 areAllHIDDevicesConnected];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (GCController)firstMicroGamepad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstMicroGamepad);

  return (GCController *)WeakRetained;
}

- (void)setFirstMicroGamepad:(id)a3
{
  id obj = a3;
  if (obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_firstMicroGamepad);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_firstMicroGamepad);
      [(_GCControllerManager *)self _legacy_unpublishController:v5];
    }
  }
  objc_storeWeak((id *)&self->_firstMicroGamepad, obj);
}

- (BOOL)combineSiriRemoteHIDDevicesWithNewController:(id)a3 existingController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 hidServices];
  uint64_t v9 = [v8 firstObject];
  long long v10 = [v9 registryID];

  if (v10)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v29 = getGCLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 138412546;
        uint64_t v42 = (uint64_t)v6;
        __int16 v43 = 2112;
        id v44 = v7;
        _os_log_impl(&dword_220998000, v29, OS_LOG_TYPE_DEFAULT, "combineSiriRemoteHIDDevicesWithNewController: %@ existingController: %@", (uint8_t *)&v41, 0x16u);
      }
    }
    long long v11 = [v7 motion];
    [v11 _stopDeviceMotionUpdates];

    long long v12 = [v7 motion];
    long long v13 = [v12 valueChangedHandler];

    if (gc_isInternalBuild())
    {
      long long v30 = getGCLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = (void *)MEMORY[0x223C6E420](v13);
        int v41 = 138412290;
        uint64_t v42 = (uint64_t)v31;
        _os_log_impl(&dword_220998000, v30, OS_LOG_TYPE_DEFAULT, "previous motion handler = %@", (uint8_t *)&v41, 0xCu);
      }
    }
    if ([v6 physicalDeviceUsesCompass]) {
      objc_msgSend(v7, "setPhysicalDeviceUsesCompass:", objc_msgSend(v6, "physicalDeviceUsesCompass"));
    }
    [v7 addServiceRefs:v6];
    if (gc_isInternalBuild())
    {
      long long v32 = getGCLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 138412290;
        uint64_t v42 = (uint64_t)v10;
        _os_log_impl(&dword_220998000, v32, OS_LOG_TYPE_DEFAULT, "registering existing controller with registry id = %@", (uint8_t *)&v41, 0xCu);
      }
    }
    [(NSMutableDictionary *)self->_controllersByRegistryID setObject:v7 forKey:v10];
    [v6 clearServiceRef];
    if (gc_isInternalBuild())
    {
      long long v33 = getGCLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [v7 hidServices];
        int v41 = 138412290;
        uint64_t v42 = (uint64_t)v34;
        _os_log_impl(&dword_220998000, v33, OS_LOG_TYPE_DEFAULT, "serviceRefs: %@", (uint8_t *)&v41, 0xCu);
      }
      if (!v13)
      {
LABEL_10:
        int v15 = [v7 physicalDeviceUniqueID];

        if (!v15)
        {
          unint64_t v16 = [v6 physicalDeviceUniqueID];
          [v7 setPhysicalDeviceUniqueID:v16];
        }
        char v17 = [v7 profile];
        int v18 = [v17 conformsToProtocol:&unk_26D294150];

        if (!v18)
        {
          BOOL v27 = 0;
LABEL_31:

          goto LABEL_32;
        }
        long long v19 = [v7 profile];
        BOOL v20 = [v6 profile];
        if (gc_isInternalBuild())
        {
          uint64_t v35 = getGCLogger();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_220998000, v35, OS_LOG_TYPE_DEFAULT, "========================================================================", (uint8_t *)&v41, 2u);
          }
        }
        if (gc_isInternalBuild())
        {
          v36 = getGCLogger();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = [v19 deviceType];
            int v41 = 134217984;
            uint64_t v42 = v37;
            _os_log_impl(&dword_220998000, v36, OS_LOG_TYPE_DEFAULT, "Existing device type: %ld", (uint8_t *)&v41, 0xCu);
          }
        }
        if (![v19 deviceType]) {
          objc_msgSend(v19, "setDeviceType:", objc_msgSend(v20, "deviceType"));
        }
        if (gc_isInternalBuild())
        {
          long long v38 = getGCLogger();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = [v19 deviceType];
            int v41 = 134217984;
            uint64_t v42 = v39;
            _os_log_impl(&dword_220998000, v38, OS_LOG_TYPE_DEFAULT, "New device type: %ld", (uint8_t *)&v41, 0xCu);
          }
        }
        if (gc_isInternalBuild())
        {
          long long v40 = getGCLogger();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_220998000, v40, OS_LOG_TYPE_DEFAULT, "========================================================================", (uint8_t *)&v41, 2u);
          }
        }
        if ([v19 deviceType] != 1
          || ([v7 hidServices],
              id v21 = objc_claimAutoreleasedReturnValue(),
              unint64_t v22 = [v21 count],
              v21,
              v22 <= 2))
        {
          if ([v19 deviceType] != 2
            || ([v7 hidServices],
                uint64_t v23 = objc_claimAutoreleasedReturnValue(),
                unint64_t v24 = [v23 count],
                v23,
                v24 <= 2))
          {
            if ([v19 deviceType] != 6
              || ([v7 hidServices],
                  id v25 = objc_claimAutoreleasedReturnValue(),
                  unint64_t v26 = [v25 count],
                  v25,
                  v26 < 2))
            {
              BOOL v27 = 0;
              goto LABEL_30;
            }
            objc_storeStrong((id *)&self->__controller_genericBTRemote, a4);
          }
        }
        BOOL v27 = 1;
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (!v13)
    {
      goto LABEL_10;
    }
    uint64_t v14 = [v7 motion];
    [v14 setValueChangedHandler:v13];

    goto LABEL_10;
  }
  BOOL v27 = 0;
LABEL_32:

  return v27;
}

@end