@interface _GCDefaultDeviceManager
- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4;
- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4;
- (NSObject)identifier;
- (_GCDefaultDeviceManager)initWithIdentifier:(id)a3 matchingFilter:(id)a4 probeScore:(id)a5;
- (_GCDefaultDeviceManagerDelegate)delegate;
- (_GCPhysicalDeviceRegistry)deviceRegistry;
- (id)configurationIdentifierForDevice:(id)a3;
- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4;
- (id)matchHIDService:(id)a3;
- (void)_onqueue_checkAndHideDuplicateDevice:(id)a3;
- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3 replaceExisting:(BOOL)a4;
- (void)_onqueue_registerPhysicalDevice:(id)a3 serviceInfo:(id)a4 checkForDuplicateDevice:(BOOL)a5;
- (void)_onqueue_relinquishHIDDevice:(id)a3;
- (void)claimHIDService:(id)a3;
- (void)refreshPhysicalDeviceConfiguration:(id)a3;
- (void)relinquishHIDService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRegistry:(id)a3;
@end

@implementation _GCDefaultDeviceManager

- (_GCDefaultDeviceManager)initWithIdentifier:(id)a3 matchingFilter:(id)a4 probeScore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_GCDefaultDeviceManager;
  v11 = [(_GCDefaultDeviceManager *)&v28 init];
  if (v11)
  {
    uint64_t v12 = [v8 copyWithZone:0];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_probeScore, a5);
    objc_storeStrong((id *)&v11->_matchingFilter, a4);
    v14 = [(_GCDeviceMatchingFilter *)v11->_matchingFilter identifier];
    v15 = +[NSString stringWithFormat:@"_GCDefaultDeviceManager.%@"], v14);

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    id v17 = v15;
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 cStringUsingEncoding:4], v16);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)&off_26D2B4EF0);
    claimedServices = v11->_claimedServices;
    v11->_claimedServices = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    physicalDevices = v11->_physicalDevices;
    v11->_physicalDevices = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)&off_26D2B4CF0);
    hiddenPhysicalDevices = v11->_hiddenPhysicalDevices;
    v11->_hiddenPhysicalDevices = v24;

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v11 selector:sel_refreshPhysicalDeviceConfiguration_ name:@"GCRefreshPhysicalDeviceConfigurationNotification" object:0];
  }
  return v11;
}

- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] == 1)
  {
    id v9 = [_GCDefaultLogicalDevice alloc];
    id v10 = [v8 anyObject];
    v11 = [(_GCDefaultLogicalDevice *)v9 initWithPhysicalDevice:v10 configuration:v7 manager:self];

    uint64_t v12 = [(_GCDefaultDeviceManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 deviceManager:self prepareLogicalDevice:v11];
    }

    goto LABEL_25;
  }
  if ([v8 count] != 2)
  {
    objc_super v28 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v28 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 124, @"Bad configuration: %@", v7 object file lineNumber description];

    v11 = 0;
    goto LABEL_25;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v14)
  {

    v16 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  v32 = a2;
  v33 = self;
  id v34 = v8;
  id obj = v13;
  v16 = 0;
  id v17 = 0;
  uint64_t v36 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v38 != v36) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      v20 = [v19 identifier];
      v21 = [v7 deviceDependencies];
      [v21 firstObject];
      v23 = id v22 = v7;
      int v24 = [v20 isEqual:v23];

      id v7 = v22;
      id v25 = v19;
      if (v24) {
        v26 = v17;
      }
      else {
        v26 = v16;
      }
      if (v24) {
        id v17 = v25;
      }
      else {
        v16 = v25;
      }
    }
    id v13 = obj;
    uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v15);

  self = v33;
  id v8 = v34;
  a2 = v32;
  if (!v17)
  {
LABEL_29:
    v30 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v30 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 111, @"Dependencies did not contain primary device. %@", v13 object file lineNumber description];

    id v17 = 0;
    if (v16) {
      goto LABEL_21;
    }
LABEL_30:
    v31 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v31 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 112, @"Dependencies did not contain secondary device. %@", v13 object file lineNumber description];

    goto LABEL_21;
  }
  if (!v16) {
    goto LABEL_30;
  }
LABEL_21:
  v11 = [[_GCFusedLogicalDevice alloc] initWithPrimaryPhysicalDevice:v17 secondaryPhysicalDevice:v16 configuration:v7 manager:self];
  v27 = [(_GCDefaultDeviceManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v27 deviceManager:self prepareLogicalDevice:v11];
  }

LABEL_25:

  return v11;
}

- (id)configurationIdentifierForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)&off_26D2B6E68);
  v5 = [v3 identifier];

  v6 = (void *)[v4 initWithFormat:@"LOGICAL_DEVICE(%@)", v5];

  return v6;
}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3 replaceExisting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_GCDefaultDeviceManager *)self configurationIdentifierForDevice:v6];
  id v8 = [v6 identifier];
  uint64_t v15 = v8;
  id v9 = +[NSArray arrayWithObjects:&v15 count:1];
  id v10 = [(_GCDefaultDeviceManager *)self identifier];
  v11 = unk_26D2BF3B4(&off_26D2BFB40, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v7, v9, v10);

  uint64_t v12 = [v6 identifier];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6) {
    [v11 setTransient:1];
  }
  id v13 = [(_GCDefaultDeviceManager *)self deviceRegistry];
  uint64_t v14 = [v13 deviceConfigurationRegistry];
  [v14 addConfiguration:v11 replaceExisting:v4];
}

- (void)refreshPhysicalDeviceConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  int v6 = [v5 conformsToProtocol:&unk_26D293490];

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __62___GCDefaultDeviceManager_refreshPhysicalDeviceConfiguration___block_invoke;
    v8[3] = &unk_26D22B668;
    objc_copyWeak(&v11, &location);
    id v9 = v4;
    id v10 = self;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (id)matchHIDService:(id)a3
{
  int v4 = [(_GCDeviceMatchingFilter *)self->_matchingFilter match:a3];
  p_probeScore = &self->_probeScore;
  if (!v4) {
    p_probeScore = (NSNumber **)&GCPhysicalDeviceProbeScoreNoMatch;
  }
  int v6 = *p_probeScore;

  return v6;
}

- (void)_onqueue_checkAndHideDuplicateDevice:(id)a3
{
  id v18 = a3;
  int v4 = [v18 identifier];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(NSMutableDictionary *)self->_physicalDevices allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      id v11 = [(NSMutableDictionary *)self->_physicalDevices objectForKeyedSubscript:v10];
      uint64_t v12 = [v11 identifier];
      char v13 = [v12 isEqual:v4];

      if (v13) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v15 = v18;
    if (v11 == v18)
    {
      id v11 = v18;
    }
    else
    {
      if (gc_isInternalBuild())
      {
        id v17 = getGCLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v24 = v4;
          _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "Identifier '%@' is already registered with this device manager. Possible duplicate identifier? Relinquishing old device, then claiming incoming device.", buf, 0xCu);
        }
      }
      [(_GCDefaultDeviceManager *)self _onqueue_relinquishHIDDevice:v14];
      [(NSMutableDictionary *)self->_hiddenPhysicalDevices setObject:v11 forKey:v14];
    }
  }
  else
  {
LABEL_9:

    id v14 = 0;
LABEL_14:
    uint64_t v15 = v18;
    if (gc_isInternalBuild())
    {
      v16 = getGCLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[_GCDefaultDeviceManager _onqueue_checkAndHideDuplicateDevice:](v16);
      }
    }
    id v11 = 0;
  }
}

- (void)claimHIDService:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _os_activity_create(&dword_220998000, "[Default Device Manager] Claim HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    id v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_GCDefaultDeviceManager claimHIDService:]();
    }
  }
  uint64_t v7 = [(_GCDefaultDeviceManager *)self matchHIDService:v5];
  unint64_t v8 = GCPhysicalDeviceProbeScoreNoMatch;

  if ((unint64_t)v7 <= v8)
  {
    uint64_t v12 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v12 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 214, @"%@ does not match against %@ but is trying to claim it", self, v5 object file lineNumber description];
  }
  if ([(NSMutableSet *)self->_claimedServices containsObject:v5])
  {
    char v13 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v13 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 215, @"%@ has already claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices addObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43___GCDefaultDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_26D22B5F0;
  block[4] = self;
  id v15 = v5;
  SEL v16 = a2;
  id v10 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_registerPhysicalDevice:(id)a3 serviceInfo:(id)a4 checkForDuplicateDevice:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5) {
    [(_GCDefaultDeviceManager *)self _onqueue_checkAndHideDuplicateDevice:v8];
  }
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "%@: Adding %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_physicalDevices setObject:v8 forKey:v9];
    [(_GCDefaultDeviceManager *)self _onqueue_registerDefaultConfigurationForDevice:v8 replaceExisting:1];
    id v10 = [(_GCDefaultDeviceManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 deviceManager:self willPublishPhysicalDevice:v8];
    }
    id v11 = [(_GCDefaultDeviceManager *)self deviceRegistry];
    [v11 deviceManager:self deviceDidConnect:v8];
  }
}

- (void)_onqueue_relinquishHIDDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(NSMutableDictionary *)self->_physicalDevices objectForKey:v4];
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      int v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[_GCDefaultDeviceManager _onqueue_relinquishHIDDevice:]();
      }
    }
    uint64_t v6 = [(_GCDefaultDeviceManager *)self deviceRegistry];
    [v6 deviceManager:self deviceDidDisconnect:v5];

    [(NSMutableDictionary *)self->_physicalDevices removeObjectForKey:v4];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_hiddenPhysicalDevices objectForKey:v4];
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      id v14 = getGCLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_GCDefaultDeviceManager _onqueue_relinquishHIDDevice:]();
      }
    }
    [(NSMutableDictionary *)self->_hiddenPhysicalDevices removeObjectForKey:v4];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  hiddenPhysicalDevices = self->_hiddenPhysicalDevices;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __56___GCDefaultDeviceManager__onqueue_relinquishHIDDevice___block_invoke;
  v18[3] = &unk_26D22B690;
  id v9 = v5;
  id v19 = v9;
  long long v20 = &v28;
  long long v21 = &v22;
  [(NSMutableDictionary *)hiddenPhysicalDevices enumerateKeysAndObjectsWithOptions:0 usingBlock:v18];
  if (v29[5])
  {
    id v10 = [v4 stringPropertyForKey:@"Transport"];
    id v11 = [(id)v29[5] stringPropertyForKey:@"Transport"];
    if (gc_isInternalBuild())
    {
      __int16 v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = v29[5];
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v4;
        __int16 v38 = 2112;
        uint64_t v39 = v16;
        _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "%@ Service %@ was relinquished, but we found cached hidden service %@ with the same identifier...", buf, 0x20u);
      }
    }
    if ([v10 isEqual:v11])
    {
      if (gc_isInternalBuild())
      {
        uint64_t v12 = getGCLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "%@ The two services have the same transport and the same identifier. Possible state inconsistency in the service stack - ignoring the hidden service", buf, 0xCu);
        }
      }
    }
    else
    {
      if (gc_isInternalBuild())
      {
        id v17 = getGCLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "%@ The two services have differing transports but the same identifier. Possible BT controller plugged in via wired connection. Resurfacing the hidden service.", buf, 0xCu);
        }
      }
      [(_GCDefaultDeviceManager *)self _onqueue_registerPhysicalDevice:v23[5] serviceInfo:v29[5] checkForDuplicateDevice:0];
    }
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)relinquishHIDService:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _os_activity_create(&dword_220998000, "[Default Device Manager] Relinquish HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    id v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_GCDefaultDeviceManager relinquishHIDService:]();
    }
  }
  if (([(NSMutableSet *)self->_claimedServices containsObject:v5] & 1) == 0)
  {
    id v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"GCDefaultDeviceManager.m", 311, @"%@ has not claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices removeObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48___GCDefaultDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_26D22A8E8;
  block[4] = self;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
  block[3] = &unk_26D22B618;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
  block[3] = &unk_26D22B618;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 56, 1);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRegistry);

  return (_GCPhysicalDeviceRegistry *)WeakRetained;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (_GCDefaultDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GCDefaultDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hiddenPhysicalDevices, 0);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_matchingFilter, 0);

  objc_storeStrong((id *)&self->_probeScore, 0);
}

- (void)_onqueue_checkAndHideDuplicateDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_220998000, log, OS_LOG_TYPE_DEBUG, "currentlyConnectedDevice is nil", v1, 2u);
}

- (void)claimHIDService:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "%@: Asked to claim %@");
}

- (void)_onqueue_relinquishHIDDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "%@: Removing hidden device %@");
}

- (void)_onqueue_relinquishHIDDevice:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "%@: Removing %@");
}

- (void)relinquishHIDService:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_220998000, v0, v1, "%@: Asked to relinquish %@");
}

@end