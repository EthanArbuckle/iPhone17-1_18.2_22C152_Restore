@interface _GCGenericPhysicalDevicePending
- (GCFuture)device;
- (GCHIDServiceInfo)serviceInfo;
- (_GCDeviceDriverConnection)driverConnection;
- (_GCDeviceDriverConnection)filterConnection;
- (_GCGenericDeviceManager)manager;
- (_GCGenericPhysicalDevicePending)init;
- (_GCGenericPhysicalDevicePending)initWithHIDService:(id)a3 manager:(id)a4;
- (id)_onqueue_createDeviceWithModel:(id)a3 service:(id)a4;
- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a1;
- (void)dealloc;
- (void)setDriverConnection:(id)a3;
- (void)setDriverConnection:(id)a3 invalidatingPrevious:(BOOL)a4;
- (void)setFilterConnection:(id)a3;
- (void)setFilterConnection:(id)a3 invalidatingPrevious:(BOOL)a4;
@end

@implementation _GCGenericPhysicalDevicePending

- (_GCGenericPhysicalDevicePending)initWithHIDService:(id)a3 manager:(id)a4
{
  v7 = (GCHIDServiceInfo *)a3;
  v8 = (_GCGenericDeviceManager *)a4;
  v25.receiver = self;
  v25.super_class = (Class)_GCGenericPhysicalDevicePending;
  v9 = [(_GCGenericPhysicalDevicePending *)&v25 init];
  if (!v7)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_GCGenericPhysicalDevicePending.m", 48, @"Invalid parameter not satisfying: %s", "serviceInfo != nil");

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"_GCGenericPhysicalDevicePending.m", 49, @"Invalid parameter not satisfying: %s", "manager != nil");

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  dispatch_queue_t v11 = dispatch_queue_create("GenericDevice.Pending", v10);
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
  v23[2] = __62___GCGenericPhysicalDevicePending_initWithHIDService_manager___block_invoke;
  v23[3] = &unk_26BEC5190;
  v17 = v9;
  v24 = v17;
  uint64_t v18 = +[GCFuture futureWithBlock:v23];
  deviceFuture = v17->_deviceFuture;
  v17->_deviceFuture = (GCFuture *)v18;

  return v17;
}

- (_GCGenericPhysicalDevicePending)init
{
  return 0;
}

- (void)dealloc
{
  [(GCPromise *)self->_devicePromise cancel];
  v3.receiver = self;
  v3.super_class = (Class)_GCGenericPhysicalDevicePending;
  [(_GCGenericPhysicalDevicePending *)&v3 dealloc];
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
    [(_GCGenericPhysicalDevicePending *)v8 willChangeValueForKey:@"driverConnection"];
    objc_setProperty_atomic(v8, a2, v7, 48);
    [(_GCGenericPhysicalDevicePending *)v8 didChangeValueForKey:@"driverConnection"];
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __76___GCGenericPhysicalDevicePending_setDriverConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_26BEC51B8;
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
    v4 = _os_activity_create(&dword_20AD04000, "[Generic Physical Device (Pending)] Prepare Device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    if (!v3)
    {
      unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__onqueue_prepareDeviceWithConnection_, a1, @"_GCGenericPhysicalDevicePending.m", 164, @"Invalid parameter not satisfying: %s", "connection != nil");
      goto LABEL_16;
    }
    if ([v3 isInvalid] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 24), "isCancelled")) {
      goto LABEL_17;
    }
    v5 = _gc_log_generic_device();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:]0();
    }

    v6 = +[_GCDeviceDriverServiceConnection connectionToServiceInDriver:v3 withClient:a1];
    id v35 = 0;
    id v36 = 0;
    uint64_t v7 = [v6 waitForResult:&v36 error:&v35];
    id v8 = v36;
    id v9 = v35;

    if (!v7) {
      goto LABEL_14;
    }
    if (v7 == 1)
    {
      v10 = _gc_log_generic_device();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.9();
      }
      id v11 = 0;
      goto LABEL_12;
    }
    if ([*(id *)(a1 + 24) isCancelled])
    {
LABEL_14:
      id v11 = 0;
      goto LABEL_15;
    }
    v12 = _gc_log_generic_device();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.8();
    }

    id v13 = [v8 fetchDeviceSnapshot];
    id v33 = 0;
    id v34 = 0;
    uint64_t v14 = [v13 waitForResult:&v34 error:&v33];
    id v11 = v34;
    id v15 = v33;

    if (!v14) {
      goto LABEL_26;
    }
    if (v14 == 1)
    {
      v10 = _gc_log_generic_device();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.7();
      }
      goto LABEL_42;
    }
    if ([*(id *)(a1 + 24) isCancelled])
    {
LABEL_26:
      id v9 = v15;
      goto LABEL_15;
    }
    v29 = GCLookupService(*(void **)(a1 + 32), (objc_class *)&unk_26BEE8588, 0, 0);
    if (v29)
    {
      v16 = _gc_log_generic_device();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = [v11 debugDescription];
        [(_GCGenericPhysicalDevicePending *)a1 _onqueue_prepareDeviceWithConnection:(uint64_t)v39];
      }

      uint64_t v18 = [v29 preparedModelForDevice:v11];
      id v31 = 0;
      id v32 = 0;
      uint64_t v19 = [v18 waitForResult:&v32 error:&v31];
      v10 = v32;
      id v20 = v31;

      if (v19)
      {
        if (v19 == 1)
        {
          v21 = _gc_log_generic_device();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:].cold.5();
          }
          id v15 = v20;
LABEL_38:

LABEL_41:
LABEL_42:
          id v9 = v15;
LABEL_12:

LABEL_15:
LABEL_16:

LABEL_17:
          os_activity_scope_leave(&state);

          goto LABEL_18;
        }
        if (([*(id *)(a1 + 24) isCancelled] & 1) == 0)
        {
          v22 = _gc_log_generic_device();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = [v10 driver];
            [(_GCGenericPhysicalDevicePending *)a1 _onqueue_prepareDeviceWithConnection:(uint64_t)v38];
          }

          uint64_t v24 = [v10 driver];
          objc_super v25 = [v8 applyConfiguration:v24];
          id v30 = 0;
          uint64_t v26 = [v25 waitForResult:0 error:&v30];
          v28 = (void *)v24;
          id v15 = v30;

          if (!v26) {
            goto LABEL_41;
          }
          if (v26 == 1)
          {
            v21 = _gc_log_generic_device();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:]();
            }
          }
          else
          {
            v21 = objc_msgSend((id)a1, "_onqueue_createDeviceWithModel:service:", v10, *(void *)(a1 + 56));
            if (v21)
            {
              if (objc_opt_respondsToSelector()) {
                [v21 setDriverConnection:*(void *)(a1 + 48)];
              }
              if ((objc_opt_respondsToSelector() & 1) != 0 && *(void *)(a1 + 40)) {
                -[NSObject setFilterConnection:](v21, "setFilterConnection:");
              }
              [*(id *)(a1 + 24) succeedWithResult:v21];
            }
            else
            {
              v27 = _gc_log_generic_device();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:]();
              }
            }
          }
          goto LABEL_38;
        }
      }
      id v15 = v20;
      goto LABEL_41;
    }
    v21 = _gc_log_generic_device();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_GCGenericPhysicalDevicePending _onqueue_prepareDeviceWithConnection:]();
    }
    v10 = 0;
    goto LABEL_38;
  }
LABEL_18:
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
  id v8 = self;
  objc_sync_enter(v8);
  if ([v7 isEqual:v8->_filterConnection])
  {
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = v8->_filterConnection;
    [(_GCGenericPhysicalDevicePending *)v8 willChangeValueForKey:@"filterConnection"];
    objc_setProperty_atomic(v8, a2, v7, 40);
    [(_GCGenericPhysicalDevicePending *)v8 didChangeValueForKey:@"filterConnection"];
    objc_sync_exit(v8);

    queue = v8->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __76___GCGenericPhysicalDevicePending_setFilterConnection_invalidatingPrevious___block_invoke;
    v12[3] = &unk_26BEC51B8;
    v12[4] = v8;
    id v13 = v7;
    uint64_t v14 = v9;
    BOOL v15 = a4;
    id v11 = v9;
    dispatch_async(queue, v12);
  }
}

- (id)_onqueue_createDeviceWithModel:(id)a3 service:(id)a4
{
  return 0;
}

- (GCFuture)device
{
  return (GCFuture *)objc_getProperty(self, a2, 16, 1);
}

- (GCHIDServiceInfo)serviceInfo
{
  return (GCHIDServiceInfo *)objc_getProperty(self, a2, 56, 1);
}

- (_GCGenericDeviceManager)manager
{
  return (_GCGenericDeviceManager *)objc_getProperty(self, a2, 32, 1);
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

- (void)_onqueue_prepareDeviceWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_20AD04000, v0, OS_LOG_TYPE_ERROR, "%@ No device DB.", v1, 0xCu);
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_20AD04000, v0, OS_LOG_TYPE_ERROR, "%@ Failed to create device with model", v1, 0xCu);
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.3()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_20AD04000, v0, v1, "%@ Failed to configure driver: %@");
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a3 .cold.4(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_4(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_20AD04000, v5, OS_LOG_TYPE_DEBUG, "%@ Configuring driver with model: %@", v4, 0x16u);
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.5()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_20AD04000, v0, v1, "%@ Failed to retrieve device model: %@");
}

- (void)_onqueue_prepareDeviceWithConnection:(uint64_t)a3 .cold.6(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_4(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_20AD04000, v5, OS_LOG_TYPE_DEBUG, "%@ Fetching HID device model for snapshot %@", v4, 0x16u);
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.7()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_20AD04000, v0, v1, "%@ Failed to fetch HID device snapshot: %@");
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.8()
{
  OUTLINED_FUNCTION_3_3();
  _os_log_debug_impl(&dword_20AD04000, v0, OS_LOG_TYPE_DEBUG, "%@ Fetching HID device snapshot", v1, 0xCu);
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.9()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_20AD04000, v0, v1, "%@ Failed to connect to GCGenericDeviceDriverConfigurationService: %@");
}

- (void)_onqueue_prepareDeviceWithConnection:.cold.10()
{
  OUTLINED_FUNCTION_3_3();
  _os_log_debug_impl(&dword_20AD04000, v0, OS_LOG_TYPE_DEBUG, "%@ Connect to GCGenericDeviceDriverConfigurationService", v1, 0xCu);
}

@end