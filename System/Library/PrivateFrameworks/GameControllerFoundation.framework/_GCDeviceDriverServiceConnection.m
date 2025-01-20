@interface _GCDeviceDriverServiceConnection
+ (Protocol)serviceProtocol;
+ (id)connectionToServiceInDriver:(id)a3 withClient:(id)a4;
- (BOOL)isInvalid;
- (_GCDeviceDriverServiceConnection)initWithDriverConnection:(id)a3 serviceVendor:(id)a4;
- (id)addInvalidationHandler:(id)a3;
- (id)invalidationHandlers;
- (id)serviceVendor;
- (id)serviceVendorRequestWithHandler:(id)a3;
- (id)serviceVendorRequestWithLabel:(id)a3 handler:(id)a4;
- (void)scheduleSendBarrierBlock:(id)a3;
- (void)setInvalidationHandlers:(void *)a1;
@end

@implementation _GCDeviceDriverServiceConnection

+ (Protocol)serviceProtocol
{
  return 0;
}

+ (id)connectionToServiceInDriver:(id)a3 withClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_GCDeviceDriverServiceConnection.m", 35, @"Invalid parameter not satisfying: %s", "driverConnection != nil");

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_GCDeviceDriverServiceConnection.m", 36, @"Invalid parameter not satisfying: %s", "client != nil");

LABEL_3:
  v10 = [a1 serviceProtocol];
  v11 = [v7 connectToDeviceService:v10 withClient:v9];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __75___GCDeviceDriverServiceConnection_connectionToServiceInDriver_withClient___block_invoke;
  v17[3] = &unk_26BEC4290;
  id v18 = v7;
  id v19 = a1;
  id v12 = v7;
  v13 = [v11 thenSynchronouslyWithResult:v17];

  return v13;
}

- (_GCDeviceDriverServiceConnection)initWithDriverConnection:(id)a3 serviceVendor:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_GCDeviceDriverServiceConnection;
  v10 = [(_GCDeviceDriverServiceConnection *)&v26 init];
  if (!v8)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"_GCDeviceDriverServiceConnection.m", 48, @"Invalid parameter not satisfying: %s", "driverConnection != nil");

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"_GCDeviceDriverServiceConnection.m", 49, @"Invalid parameter not satisfying: %s", "serviceVendor != nil");

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  objc_storeStrong((id *)&v10->_driverConnection, a3);
  objc_storeStrong(&v10->_serviceVendor, a4);
  uint64_t v11 = objc_opt_new();
  invalidationHandlers = v10->_invalidationHandlers;
  v10->_invalidationHandlers = (NSArray *)v11;

  atomic_store(0, (unsigned __int8 *)&v10->_invalid);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = __75___GCDeviceDriverServiceConnection_initWithDriverConnection_serviceVendor___block_invoke;
  aBlock[3] = &unk_26BEC3D48;
  v24 = v10;
  v13 = v24;
  v25 = v13;
  v14 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v15 = [(_GCDeviceDriverConnection *)v10->_driverConnection addInterruptionHandler:v14];
  id driverConnectionInterruptionObserver = v13->_driverConnectionInterruptionObserver;
  v13->_id driverConnectionInterruptionObserver = (id)v15;

  uint64_t v17 = [(_GCDeviceDriverConnection *)v10->_driverConnection addInvalidationHandler:v14];
  id driverConnectionInvalidationObserver = v13->_driverConnectionInvalidationObserver;
  v13->_id driverConnectionInvalidationObserver = (id)v17;

  if (!v13->_driverConnectionInterruptionObserver || !v13->_driverConnectionInvalidationObserver) {
    v14[2](v14);
  }
  id v19 = v13;

  return v19;
}

- (id)invalidationHandlers
{
  if (result) {
    return objc_getProperty(result, a2, 48, 1);
  }
  return result;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if (v7)
  {
    objc_sync_exit(v5);

    v13 = 0;
  }
  else
  {
    id v8 = objc_getProperty(v5, v6, 48, 1);
    id v9 = (void *)[v8 mutableCopy];

    v10 = _Block_copy(v4);
    [v9 addObject:v10];

    objc_setProperty_atomic_copy(v5, v11, v9, 48);
    objc_sync_exit(v5);

    id v12 = [_GCDisposable alloc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __59___GCDeviceDriverServiceConnection_addInvalidationHandler___block_invoke;
    v15[3] = &unk_26BEC42B8;
    v15[4] = v5;
    id v16 = v4;
    v13 = [(_GCDisposable *)v12 initWithCleanupHandler:v15];
  }

  return v13;
}

- (void)setInvalidationHandlers:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 48);
  }
}

- (void)scheduleSendBarrierBlock:(id)a3
{
}

- (id)serviceVendorRequestWithLabel:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[GCOperation alloc] initOnQueue:0 withOptions:0];
  [v8 setLabel:v7];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke;
  v19[3] = &unk_26BEC4330;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  [v8 setSyncBlock:v19];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3;
  id v16 = &unk_26BEC43A8;
  uint64_t v17 = self;
  id v18 = v9;
  id v10 = v9;
  [v8 setAsyncBlock:&v13];
  SEL v11 = objc_msgSend(v8, "activate", v13, v14, v15, v16, v17);

  return v11;
}

- (id)serviceVendorRequestWithHandler:(id)a3
{
  return [(_GCDeviceDriverServiceConnection *)self serviceVendorRequestWithLabel:0 handler:a3];
}

- (id)serviceVendor
{
  if (result) {
    return objc_getProperty(result, a2, 32, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong(&self->_serviceVendor, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationObserver, 0);
  objc_storeStrong(&self->_driverConnectionInterruptionObserver, 0);

  objc_storeStrong((id *)&self->_driverConnection, 0);
}

@end