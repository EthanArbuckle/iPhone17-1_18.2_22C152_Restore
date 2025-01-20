@interface _GCNintendoJoyConDevicePending
- (GCFuture)device;
- (GCHIDServiceInfo)serviceInfo;
- (_GCDeviceDriverConnection)driverConnection;
- (_GCDeviceDriverConnection)filterConnection;
- (_GCNintendoJoyConDeviceManager)manager;
- (_GCNintendoJoyConDevicePending)init;
- (_GCNintendoJoyConDevicePending)initWithHIDService:(id)a3 manager:(id)a4;
- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1;
- (void)dealloc;
- (void)setDriverConnection:(id)a3;
- (void)setDriverConnection:(id)a3 invalidatingPrevious:(BOOL)a4;
- (void)setFilterConnection:(id)a3;
- (void)setFilterConnection:(id)a3 invalidatingPrevious:(BOOL)a4;
@end

@implementation _GCNintendoJoyConDevicePending

- (_GCNintendoJoyConDevicePending)initWithHIDService:(id)a3 manager:(id)a4
{
  v7 = (GCHIDServiceInfo *)a3;
  v8 = (_GCNintendoJoyConDeviceManager *)a4;
  v25.receiver = self;
  v25.super_class = (Class)_GCNintendoJoyConDevicePending;
  v9 = [(_GCNintendoJoyConDevicePending *)&v25 init];
  if (!v7)
  {
    v21 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_GCNintendoJoyConDevicePending.m", 42, @"Invalid parameter not satisfying: %s", "serviceInfo != nil");

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_GCNintendoJoyConDevicePending.m", 43, @"Invalid parameter not satisfying: %s", "manager != nil");

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  dispatch_queue_t v11 = dispatch_queue_create("NintendoJoyConDevice.Pending", v10);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v11;

  serviceInfo = v9->_serviceInfo;
  v9->_serviceInfo = v7;
  v14 = v7;

  manager = v9->_manager;
  v9->_manager = v8;
  v16 = v8;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __61___GCNintendoJoyConDevicePending_initWithHIDService_manager___block_invoke;
  v23[3] = &unk_26D22C740;
  v17 = v9;
  v24 = v17;
  uint64_t v18 = unk_26D2C0AB0(&off_26D2C1690, "futureWithBlock:", v23);
  deviceFuture = v17->_deviceFuture;
  v17->_deviceFuture = (GCFuture *)v18;

  return v17;
}

- (_GCNintendoJoyConDevicePending)init
{
  return 0;
}

- (void)dealloc
{
  [(GCPromise *)self->_devicePromise cancel];
  v3.receiver = self;
  v3.super_class = (Class)_GCNintendoJoyConDevicePending;
  [(_GCNintendoJoyConDevicePending *)&v3 dealloc];
}

- (_GCDeviceDriverConnection)driverConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDriverConnection:(id)a3
{
}

- (void)setDriverConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if ([v7 isEqual:v8->_driverConnection])
  {
    objc_sync_exit(v8);
  }
  else
  {
    v9 = v8->_driverConnection;
    [(_GCNintendoJoyConDevicePending *)v8 willChangeValueForKey:@"driverConnection"];
    objc_setProperty_atomic(v8, a2, v7, 48);
    [(_GCNintendoJoyConDevicePending *)v8 didChangeValueForKey:@"driverConnection"];
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __75___GCNintendoJoyConDevicePending_setDriverConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_26D22C768;
    v12[4] = v8;
    id v13 = v7;
    v14 = v9;
    BOOL v15 = a4;
    dispatch_queue_t v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = _os_activity_create(&dword_220998000, "[JoyCon Physical Device (Pending)] Prepare Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (v3)
    {
      if ([v3 isInvalid] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 24), "isCancelled")) {
        goto LABEL_18;
      }
      id v5 = [*(id *)(a1 + 56) stringPropertyForKey:@"JoyConControllerType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v5 isEqualToString:@"Joy-Con (L)"])
        {
          uint64_t v6 = 1;
LABEL_10:

          id v7 = [[_GCNintendoJoyConDevice alloc] initWithHIDDevice:*(void *)(a1 + 56) manager:*(void *)(a1 + 32) type:v6];
LABEL_11:
          if (objc_opt_respondsToSelector()) {
            [(_GCNintendoJoyConDevice *)v7 setDriverConnection:*(void *)(a1 + 48)];
          }
          if ((objc_opt_respondsToSelector() & 1) != 0 && *(void *)(a1 + 40)) {
            -[_GCNintendoJoyConDevice setFilterConnection:](v7, "setFilterConnection:");
          }
          [*(id *)(a1 + 24) succeedWithResult:v7];
          goto LABEL_17;
        }
        if ([v5 isEqualToString:@"Joy-Con (R)"])
        {
          uint64_t v6 = 2;
          goto LABEL_10;
        }
        if (([v5 isEqualToString:@"Pro Controller"] & 1) != 0
          || ([v5 isEqualToString:@"NES Controller (L)"] & 1) != 0
          || ([v5 isEqualToString:@"NES Controller (R)"] & 1) != 0
          || ([v5 isEqualToString:@"SNES Controller"] & 1) != 0
          || ([v5 isEqualToString:@"N64 Controller"] & 1) != 0)
        {

          id v7 = [[_GCDefaultPhysicalDevice alloc] initWithHIDDevice:*(void *)(a1 + 56) manager:*(void *)(a1 + 32)];
          [(_GCNintendoJoyConDevice *)v7 setDelegate:objc_opt_class()];
          goto LABEL_11;
        }
      }

      if (!gc_isInternalBuild()) {
        goto LABEL_18;
      }
      getGCLogger();
      id v7 = (_GCNintendoJoyConDevice *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[_GCNintendoJoyConDevicePending _onqueue_prepareDeviceWithConnection:](a1, &v7->super);
      }
    }
    else
    {
      unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      id v7 = (_GCNintendoJoyConDevice *)objc_claimAutoreleasedReturnValue();
      [(_GCNintendoJoyConDevice *)v7 handleFailureInMethod:sel__onqueue_prepareDeviceWithConnection_, a1, @"_GCNintendoJoyConDevicePending.m", 158, @"Invalid parameter not satisfying: %s", "connection != nil" object file lineNumber description];
    }
LABEL_17:

LABEL_18:
    os_activity_scope_leave(&state);
  }
}

- (_GCDeviceDriverConnection)filterConnection
{
  return (_GCDeviceDriverConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilterConnection:(id)a3
{
}

- (void)setFilterConnection:(id)a3 invalidatingPrevious:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if ([v7 isEqual:v8->_filterConnection])
  {
    objc_sync_exit(v8);
  }
  else
  {
    v9 = v8->_filterConnection;
    [(_GCNintendoJoyConDevicePending *)v8 willChangeValueForKey:@"filterConnection"];
    objc_setProperty_atomic(v8, a2, v7, 40);
    [(_GCNintendoJoyConDevicePending *)v8 didChangeValueForKey:@"filterConnection"];
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __75___GCNintendoJoyConDevicePending_setFilterConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_26D22C768;
    v12[4] = v8;
    id v13 = v7;
    v14 = v9;
    BOOL v15 = a4;
    dispatch_queue_t v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (GCFuture)device
{
  return (GCFuture *)objc_getProperty(self, a2, 16, 1);
}

- (GCHIDServiceInfo)serviceInfo
{
  return (GCHIDServiceInfo *)objc_getProperty(self, a2, 56, 1);
}

- (_GCNintendoJoyConDeviceManager)manager
{
  return (_GCNintendoJoyConDeviceManager *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
  objc_storeStrong((id *)&self->_filterConnection, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_devicePromise, 0);
  objc_storeStrong((id *)&self->_deviceFuture, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "%@ Missing controller type", (uint8_t *)&v2, 0xCu);
}

@end