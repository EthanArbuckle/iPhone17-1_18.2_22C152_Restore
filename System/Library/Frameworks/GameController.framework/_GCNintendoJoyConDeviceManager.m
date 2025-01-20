@interface _GCNintendoJoyConDeviceManager
- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4;
- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4;
- (NSObject)identifier;
- (_GCNintendoJoyConDeviceManager)init;
- (_GCPhysicalDeviceRegistry)deviceRegistry;
- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4;
- (id)matchHIDService:(id)a3;
- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3;
- (void)_onqueue_registerDefaultConfigurationForJoyConDevice:(id)a3;
- (void)_onqueue_registerDefaultConfigurationsForDevice:(id)a3;
- (void)_onqueue_registerFusionConfigurationWithLeftDevice:(id)a3 rightDevice:(id)a4;
- (void)_onqueue_relinquishHIDService:(id)a3;
- (void)_onqueue_tryRegisteringFusionConfigurationWithDevice:(id)a3;
- (void)activateLogicalDevice:(id)a3;
- (void)claimHIDService:(id)a3;
- (void)deactivateLogicalDevice:(id)a3;
- (void)device:(id)a3 fusionGestureActive:(BOOL)a4;
- (void)relinquishHIDService:(id)a3;
- (void)setDeviceRegistry:(id)a3;
@end

@implementation _GCNintendoJoyConDeviceManager

- (_GCNintendoJoyConDeviceManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)_GCNintendoJoyConDeviceManager;
  v2 = [(_GCNintendoJoyConDeviceManager *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("_GCNintendoJoyConDeviceManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    claimedServices = v2->_claimedServices;
    v2->_claimedServices = v5;

    uint64_t v7 = objc_opt_new();
    pendingDevices = v2->_pendingDevices;
    v2->_pendingDevices = (NSMutableDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    physicalDevices = v2->_physicalDevices;
    v2->_physicalDevices = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    fusionGestureDevices = v2->_fusionGestureDevices;
    v2->_fusionGestureDevices = v11;
  }
  return v2;
}

- (void)device:(id)a3 fusionGestureActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (gc_isInternalBuild())
  {
    v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "ended";
      if (v4) {
        v10 = "began";
      }
      *(_DWORD *)buf = 136315394;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Device fusion gesture %s: %@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61___GCNintendoJoyConDeviceManager_device_fusionGestureActive___block_invoke;
  block[3] = &unk_26D22B578;
  BOOL v14 = v4;
  id v12 = v6;
  v13 = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (NSObject)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRegistry);

  return (_GCPhysicalDeviceRegistry *)WeakRetained;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] == 1)
  {
    v9 = [v8 anyObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [v8 anyObject];
      [(_GCNintendoFusedJoyConDevice *)v11 setConfiguration:v7];
      goto LABEL_35;
    }
  }
  if ([v8 count] != 1
    || ([v8 anyObject],
        id v12 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v13 = objc_opt_isKindOfClass(),
        v12,
        (v13 & 1) == 0))
  {
    if ([v8 count] != 2)
    {
      v22 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v22 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 180, @"Bad configuration: %@", v7 object file lineNumber description];

      v11 = 0;
      goto LABEL_35;
    }
    BOOL v14 = [v8 allObjects];
    v16 = [v14 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v17 = [v14 objectAtIndexedSubscript:1];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18)
      {
        v19 = [v14 objectAtIndexedSubscript:0];
        v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "type") != 1);

        v20 = [v14 objectAtIndexedSubscript:0];
        v21 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v20, "type") != 2);

        v11 = [[_GCNintendoFusedJoyConDevice alloc] initWithLeft:v15 right:v21 manager:self];
        [(_GCNintendoFusedJoyConDevice *)v11 setConfiguration:v7];

        goto LABEL_11;
      }
    }
    else
    {
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v44 = v8;
    id v23 = v8;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      v41 = a2;
      v42 = v14;
      v43 = self;
      id obj = v23;
      v46 = v7;
      v26 = 0;
      v27 = 0;
      uint64_t v28 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v31 = [v30 identifier];
          v32 = [v46 deviceDependencies];
          v33 = [v32 firstObject];
          int v34 = [v31 isEqual:v33];

          id v35 = v30;
          if (v34) {
            v36 = v26;
          }
          else {
            v36 = v27;
          }
          if (v34) {
            v26 = v35;
          }
          else {
            v27 = v35;
          }
        }
        id v23 = obj;
        uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v25);

      id v7 = v46;
      BOOL v14 = v42;
      self = v43;
      a2 = v41;
      if (v26) {
        goto LABEL_31;
      }
    }
    else
    {

      v27 = 0;
    }
    v37 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v37 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 170, @"Dependencies did not contain primary device. %@", v23 object file lineNumber description];

    v26 = 0;
LABEL_31:
    id v8 = v44;
    if (!v27)
    {
      v40 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v40 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 171, @"Dependencies did not contain secondary device. %@", v23 object file lineNumber description];
    }
    v11 = [[_GCFusedLogicalDevice alloc] initWithPrimaryPhysicalDevice:v26 secondaryPhysicalDevice:v27 configuration:v7 manager:self];
    v38 = [v26 delegate];
    [(_GCNintendoFusedJoyConDevice *)v11 setDelegate:v38];

    goto LABEL_34;
  }
  BOOL v14 = [v8 anyObject];
  v11 = [[_GCDefaultLogicalDevice alloc] initWithPhysicalDevice:v14 configuration:v7 manager:self];
  v15 = [v14 delegate];
  [(_GCNintendoFusedJoyConDevice *)v11 setDelegate:v15];
LABEL_11:

LABEL_34:
LABEL_35:

  return v11;
}

- (void)activateLogicalDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_queue_t v3 = [v4 underlyingDevices];
    [v3 makeObjectsPerformSelector:sel_setFusionDevice_ withObject:v4];
  }
}

- (void)deactivateLogicalDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_queue_t v3 = [v4 underlyingDevices];
    [v3 makeObjectsPerformSelector:sel_setFusionDevice_ withObject:0];
  }
}

- (void)_onqueue_registerFusionConfigurationWithLeftDevice:(id)a3 rightDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_GCNintendoFusedJoyConDevice identifierForFusedJoyConDeviceWithLeftDevice:v7 rightDevice:v6];
  v9 = [v7 identifier];
  v19[0] = v9;
  v10 = [v6 identifier];
  v19[1] = v10;
  v11 = +[NSArray arrayWithObjects:v19 count:2];

  id v12 = [(_GCNintendoJoyConDeviceManager *)self identifier];
  char v13 = unk_26D2BF3B4(&off_26D2BFB40, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v8, 20, v8, v11, v12);

  BOOL v14 = [v7 identifier];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    [v13 setTransient:1];
    goto LABEL_5;
  }
  v15 = [v6 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
LABEL_5:
  __int16 v17 = [(_GCNintendoJoyConDeviceManager *)self deviceRegistry];
  char v18 = [v17 deviceConfigurationRegistry];
  [v18 addConfiguration:v13 replaceExisting:0];
}

- (void)_onqueue_tryRegisteringFusionConfigurationWithDevice:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingJoyCon);

  if (!WeakRetained
    || (id v5 = objc_loadWeakRetained((id *)&self->_pendingJoyCon),
        int v6 = [v5 type],
        int v7 = [obj type],
        v5,
        v6 == v7))
  {
    objc_storeWeak((id *)&self->_pendingJoyCon, obj);
    goto LABEL_18;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
  if ([v8 type] == 1 && objc_msgSend(obj, "type") == 2)
  {

LABEL_9:
    id v11 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
    if ([v11 type] == 1) {
      id v12 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
    }
    else {
      id v12 = obj;
    }
    id v8 = v12;

    id v13 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
    if ([v13 type] == 2) {
      id v14 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
    }
    else {
      id v14 = obj;
    }
    v15 = v14;

    [(_GCNintendoJoyConDeviceManager *)self _onqueue_registerFusionConfigurationWithLeftDevice:v8 rightDevice:v15];
    goto LABEL_17;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
  if ([v9 type] == 2)
  {
    int v10 = [obj type];

    if (v10 != 1) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }

LABEL_17:
LABEL_18:
}

- (void)_onqueue_registerDefaultConfigurationForJoyConDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)&off_26D2B6E68);
  int v6 = [v4 identifier];
  int v7 = (void *)[v5 initWithFormat:@"JOYCON(%@)", v6];

  id v8 = [v4 identifier];
  id v9 = [v4 identifier];
  v16 = v9;
  int v10 = +[NSArray arrayWithObjects:&v16 count:1];
  id v11 = [(_GCNintendoJoyConDeviceManager *)self identifier];
  id v12 = unk_26D2BF3B4(&off_26D2BFB40, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v8, v10, v11);

  id v13 = [v4 identifier];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    [v12 setTransient:1];
  }
  id v14 = [(_GCNintendoJoyConDeviceManager *)self deviceRegistry];
  v15 = [v14 deviceConfigurationRegistry];
  [v15 addConfiguration:v12 replaceExisting:0];
}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)&off_26D2B6E68);
  int v6 = [v4 identifier];
  int v7 = (void *)[v5 initWithFormat:@"LOGICAL_DEVICE(%@)", v6];

  id v8 = [v4 identifier];
  v15 = v8;
  id v9 = +[NSArray arrayWithObjects:&v15 count:1];
  int v10 = [(_GCNintendoJoyConDeviceManager *)self identifier];
  id v11 = unk_26D2BF3B4(&off_26D2BFB40, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v7, v9, v10);

  id v12 = [v4 identifier];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    [v11 setTransient:1];
  }
  id v13 = [(_GCNintendoJoyConDeviceManager *)self deviceRegistry];
  id v14 = [v13 deviceConfigurationRegistry];
  [v14 addConfiguration:v11 replaceExisting:0];
}

- (void)_onqueue_registerDefaultConfigurationsForDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_GCNintendoJoyConDeviceManager *)self _onqueue_registerDefaultConfigurationForJoyConDevice:v4];
    [(_GCNintendoJoyConDeviceManager *)self _onqueue_tryRegisteringFusionConfigurationWithDevice:v4];
  }
  else
  {
    [(_GCNintendoJoyConDeviceManager *)self _onqueue_registerDefaultConfigurationForDevice:v4];
  }
}

- (id)matchHIDService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 numberPropertyForKey:@"VendorID"];
  id v5 = [v3 numberPropertyForKey:@"ProductID"];

  if ([v4 isEqualToNumber:&unk_26D2864C8]
    && (([v5 isEqualToNumber:&unk_26D2864E0] & 1) != 0
     || ([v5 isEqualToNumber:&unk_26D2864F8] & 1) != 0
     || ([v5 isEqualToNumber:&unk_26D286510] & 1) != 0
     || ([v5 isEqualToNumber:&unk_26D286528] & 1) != 0
     || ([v5 isEqualToNumber:&unk_26D286540] & 1) != 0
     || ([v5 isEqualToNumber:&unk_26D286558] & 1) != 0))
  {
    int v6 = (id *)&GCPhysicalDeviceProbeScoreHighPriority;
  }
  else
  {
    int v6 = (id *)&GCPhysicalDeviceProbeScoreNoMatch;
  }
  id v7 = *v6;

  return v7;
}

- (void)claimHIDService:(id)a3
{
  id v5 = a3;
  int v6 = _os_activity_create(&dword_220998000, "[Joy-Con Device Manager] Claim HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    id v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_GCNintendoJoyConDeviceManager claimHIDService:]();
    }
  }
  if ([(NSMutableSet *)self->_claimedServices containsObject:v5])
  {
    int v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 313, @"%@ has already claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices addObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_26D22B5F0;
  id v12 = v5;
  id v13 = self;
  SEL v14 = a2;
  id v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_relinquishHIDService:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_physicalDevices objectForKey:v4];
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      id v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[_GCNintendoJoyConDeviceManager _onqueue_relinquishHIDService:]();
      }
    }
    int v6 = [(_GCNintendoJoyConDeviceManager *)self deviceRegistry];
    [v6 deviceManager:self deviceDidDisconnect:v5];

    [(NSMutableSet *)self->_fusionGestureDevices removeObject:v5];
    [(NSMutableDictionary *)self->_physicalDevices removeObjectForKey:v4];
  }
  id v7 = [(NSMutableDictionary *)self->_pendingDevices objectForKey:v4];
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      int v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_GCNintendoJoyConDeviceManager _onqueue_relinquishHIDService:]();
      }
    }
    id v8 = [v7 device];
    [v8 cancel];

    [v7 setFilterConnection:0 invalidatingPrevious:1];
    [v7 setDriverConnection:0 invalidatingPrevious:1];
    [(NSMutableDictionary *)self->_pendingDevices removeObjectForKey:v4];
  }
}

- (void)relinquishHIDService:(id)a3
{
  id v5 = a3;
  int v6 = _os_activity_create(&dword_220998000, "[JoyCon Device Manager] Relinquish HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    id v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_GCNintendoJoyConDeviceManager relinquishHIDService:]();
    }
  }
  if (([(NSMutableSet *)self->_claimedServices containsObject:v5] & 1) == 0)
  {
    int v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 397, @"%@ has not claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices removeObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55___GCNintendoJoyConDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_26D22A8E8;
  void block[4] = self;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_220998000, "[JoyCon Device Manager] Accept HID Driver Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  char v10 = [(NSMutableSet *)self->_claimedServices containsObject:v8];
  if (v10)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
    block[3] = &unk_26D22B618;
    void block[4] = self;
    id v15 = v8;
    id v16 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    id v13 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v13 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 409, @"Unclaimed service: %@", v8 object file lineNumber description];
  }
  os_activity_scope_leave(&state);

  return v10;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_220998000, "[JoyCon Device Manager] Accept HID Filter Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  char v10 = [(NSMutableSet *)self->_claimedServices containsObject:v8];
  if (v10)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
    block[3] = &unk_26D22A960;
    void block[4] = self;
    id v15 = v8;
    id v16 = v7;
    SEL v17 = a2;
    dispatch_async(queue, block);
  }
  else
  {
    id v13 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v13 handleFailureInMethod:a2, self, @"_GCNintendoJoyConDeviceManager.m", 433, @"Unclaimed service: %@", v8 object file lineNumber description];
  }
  os_activity_scope_leave(&state);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionGestureDevices, 0);
  objc_destroyWeak((id *)&self->_pendingJoyCon);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_pendingDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_destroyWeak((id *)&self->_deviceRegistry);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)claimHIDService:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v0, v1, "%@: Asked to claim %@");
}

- (void)_onqueue_relinquishHIDService:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v0, v1, "%@: Removing %@");
}

- (void)_onqueue_relinquishHIDService:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v0, v1, "%@: Removing %@");
}

- (void)relinquishHIDService:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_220998000, v0, v1, "%@: Asked to relinquish %@");
}

@end