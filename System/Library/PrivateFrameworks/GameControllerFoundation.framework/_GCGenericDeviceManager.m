@interface _GCGenericDeviceManager
- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4;
- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4;
- (NSObject)identifier;
- (_GCGenericDeviceManager)init;
- (_GCPhysicalDeviceRegistry)deviceRegistry;
- (id)matchHIDService:(id)a3;
- (id)serviceFor:(id)a3 client:(id)a4;
- (void)_onioqueue_setupHIDMatching;
- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3;
- (void)_onqueue_relinquishHIDService:(uint64_t)a1;
- (void)claimHIDService:(id)a3;
- (void)dealloc;
- (void)init;
- (void)relinquishHIDService:(id)a3;
- (void)setDeviceRegistry:(id)a3;
@end

@implementation _GCGenericDeviceManager

- (_GCGenericDeviceManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)_GCGenericDeviceManager;
  id v2 = [(_GCGenericDeviceManager *)&v16 init];
  dispatch_queue_t v3 = dispatch_queue_create("GenericDevice.Manager", 0);
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  id v5 = objc_alloc_init((Class)&off_26BEEB428);
  v6 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = v5;

  uint64_t v7 = objc_opt_new();
  v8 = (void *)*((void *)v2 + 6);
  *((void *)v2 + 6) = v7;

  uint64_t v9 = objc_opt_new();
  v10 = (void *)*((void *)v2 + 7);
  *((void *)v2 + 7) = v9;

  IONotificationPortRef v11 = IONotificationPortCreate(kIOMainPortDefault);
  *((void *)v2 + 2) = v11;
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -10);
    dispatch_queue_t v13 = dispatch_queue_create("GenericDevice.HIDMatching", v12);
    v14 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v13;

    IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
  }
  else
  {
    v12 = _gc_log_generic_device();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_GCGenericDeviceManager init](v12);
    }
  }

  return (_GCGenericDeviceManager *)v2;
}

- (void)dealloc
{
  io_object_t ioHIDDeviceIterator = self->_ioHIDDeviceIterator;
  if (ioHIDDeviceIterator)
  {
    IOObjectRelease(ioHIDDeviceIterator);
    self->_io_object_t ioHIDDeviceIterator = 0;
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCGenericDeviceManager;
  [(_GCGenericDeviceManager *)&v5 dealloc];
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  return 0;
}

- (NSObject)identifier
{
  return @"GenericDeviceManager";
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_deviceRegistry, a3);
  ioNotificationQueue = self->_ioNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45___GCGenericDeviceManager_setDeviceRegistry___block_invoke;
  block[3] = &unk_26BEC3CA8;
  block[4] = self;
  dispatch_async(ioNotificationQueue, block);
}

- (id)matchHIDService:(id)a3
{
  dispatch_queue_t v3 = (void *)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)[a3 service], @"GameControllerSupportedHIDDevice");
  int v4 = [v3 BOOLValue];
  objc_super v5 = (id *)&GCPhysicalDeviceProbeScoreNoMatch;
  if (v4) {
    objc_super v5 = (id *)&GCPhysicalDeviceProbeScoreLowPriority;
  }
  id v6 = *v5;

  return v6;
}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NSString_0 alloc];
  id v6 = [v4 identifier];
  uint64_t v7 = [(NSString *)v5 initWithFormat:@"LOGICAL_DEVICE(%@)", v6];

  v8 = [v4 identifier];
  v15 = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:&v15 count:1];
  v10 = [(_GCGenericDeviceManager *)self identifier];
  IONotificationPortRef v11 = +[_GCDeviceConfiguration configurationWithIdentifier:v7 priority:10 deviceIdentifier:v7 deviceDependencies:v9 deviceBuilder:v10];

  v12 = [v4 identifier];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    [v11 setTransient:1];
  }
  dispatch_queue_t v13 = [(_GCGenericDeviceManager *)self deviceRegistry];
  v14 = [v13 deviceConfigurationRegistry];
  [v14 addConfiguration:v11 replaceExisting:1];
}

- (void)claimHIDService:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_20AD04000, "[Generic Device Manager] Claim HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = _gc_log_generic_device();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_GCGenericDeviceManager claimHIDService:]((uint64_t)self);
  }

  if ([(NSMutableSet *)self->_claimedServices containsObject:v5])
  {
    v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"_GCGenericDeviceManager.m", 157, @"%@ has already claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices addObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43___GCGenericDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_26BEC3D20;
  id v12 = v5;
  dispatch_queue_t v13 = self;
  SEL v14 = a2;
  id v9 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v4 = [*(id *)(a1 + 56) objectForKey:v3];
    if (v4)
    {
      id v5 = _gc_log_generic_device();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[_GCGenericDeviceManager _onqueue_relinquishHIDService:](a1);
      }

      id v6 = [(id)a1 deviceRegistry];
      [v6 deviceManager:a1 deviceDidDisconnect:v4];

      [*(id *)(a1 + 56) removeObjectForKey:v3];
    }
    uint64_t v7 = [*(id *)(a1 + 48) objectForKey:v3];
    if (v7)
    {
      v8 = _gc_log_generic_device();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[_GCGenericDeviceManager _onqueue_relinquishHIDService:](a1);
      }

      id v9 = [v7 device];
      [v9 cancel];

      [v7 setFilterConnection:0 invalidatingPrevious:1];
      [v7 setDriverConnection:0 invalidatingPrevious:1];
      [*(id *)(a1 + 48) removeObjectForKey:v3];
    }
  }
}

- (void)relinquishHIDService:(id)a3
{
  id v5 = a3;
  id v6 = _os_activity_create(&dword_20AD04000, "[Generic Device Manager] Relinquish HID Service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = _gc_log_generic_device();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_GCGenericDeviceManager relinquishHIDService:]((uint64_t)self);
  }

  if (([(NSMutableSet *)self->_claimedServices containsObject:v5] & 1) == 0)
  {
    v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v10 handleFailureInMethod:a2, self, @"_GCGenericDeviceManager.m", 245, @"%@ has not claimed %@", self, v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_claimedServices removeObject:v5];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48___GCGenericDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_26BEC3D48;
  void block[4] = self;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_20AD04000, "[Generic Device Manager] Accept HID Driver Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  char v10 = [(NSMutableSet *)self->_claimedServices containsObject:v8];
  if (v10)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
    block[3] = &unk_26BEC3D70;
    void block[4] = self;
    id v15 = v8;
    id v16 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    dispatch_queue_t v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2, self, @"_GCGenericDeviceManager.m", 257, @"Unclaimed service: %@", v8 object file lineNumber description];
  }
  os_activity_scope_leave(&state);

  return v10;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_20AD04000, "[Generic Device Manager] Accept HID Filter Connection", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  char v10 = [(NSMutableSet *)self->_claimedServices containsObject:v8];
  if (v10)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
    block[3] = &unk_26BEC3D98;
    void block[4] = self;
    id v15 = v8;
    id v16 = v7;
    SEL v17 = a2;
    dispatch_async(queue, block);
  }
  else
  {
    dispatch_queue_t v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2, self, @"_GCGenericDeviceManager.m", 281, @"Unclaimed service: %@", v8 object file lineNumber description];
  }
  os_activity_scope_leave(&state);

  return v10;
}

- (void)_onioqueue_setupHIDMatching
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_20AD04000, a2, OS_LOG_TYPE_FAULT, "Failed to setup IOHIDDevice service matching: %{mach.errno}d.  Game controller discovery may be impacted.", (uint8_t *)v2, 8u);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRegistry);

  return (_GCPhysicalDeviceRegistry *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_pendingDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_storeStrong((id *)&self->_ioNotificationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20AD04000, log, OS_LOG_TYPE_FAULT, "Failed to create IONotificationPort.  Game controller discovery may be impacted.", v1, 2u);
}

- (void)claimHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Asked to claim %@", (void)v3, DWORD2(v3));
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Removing %@", (void)v3, DWORD2(v3));
}

- (void)_onqueue_relinquishHIDService:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Removing %@", (void)v3, DWORD2(v3));
}

- (void)relinquishHIDService:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_20AD04000, v1, v2, "%@: Asked to relinquish %@", (void)v3, DWORD2(v3));
}

@end