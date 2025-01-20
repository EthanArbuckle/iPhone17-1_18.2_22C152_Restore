@interface GCConfigXPCServiceServiceConnection
+ (Protocol)serviceProtocol;
+ (id)connection:(id)a3 withClient:(id)a4;
- (BOOL)isInvalid;
- (GCConfigXPCServiceServiceConnection)initWithConnection:(id)a3 serviceVendor:(id)a4;
- (id)addInvalidationHandler:(id)a3;
- (id)invalidationHandlers;
- (id)serviceVendor;
- (id)serviceVendorRequestWithHandler:(id)a3;
- (id)serviceVendorRequestWithLabel:(id)a3 handler:(id)a4;
- (void)scheduleSendBarrierBlock:(id)a3;
- (void)setInvalidationHandlers:(void *)a1;
@end

@implementation GCConfigXPCServiceServiceConnection

+ (Protocol)serviceProtocol
{
  return 0;
}

+ (id)connection:(id)a3 withClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"GCConfigXPCServiceServiceConnection.m", 35, @"Invalid parameter not satisfying: %s", "rootConnection != nil");
  }
  v9 = [a1 serviceProtocol];
  v10 = [v7 connectToService:v9 withClient:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __61__GCConfigXPCServiceServiceConnection_connection_withClient___block_invoke;
  v15[3] = &unk_26BEC4B98;
  id v16 = v7;
  id v17 = a1;
  id v11 = v7;
  v12 = [v10 thenSynchronouslyWithResult:v15];

  return v12;
}

id __61__GCConfigXPCServiceServiceConnection_connection_withClient___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(objc_class **)(a1 + 40);
    id v4 = a2;
    v5 = (void *)[[v3 alloc] initWithConnection:*(void *)(a1 + 32) serviceVendor:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GCConfigXPCServiceServiceConnection)initWithConnection:(id)a3 serviceVendor:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GCConfigXPCServiceServiceConnection;
  v10 = [(GCConfigXPCServiceServiceConnection *)&v25 init];
  if (!v8)
  {
    v21 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"GCConfigXPCServiceServiceConnection.m", 51, @"Invalid parameter not satisfying: %s", "rootConnection != nil");

    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, @"GCConfigXPCServiceServiceConnection.m", 52, @"Invalid parameter not satisfying: %s", "serviceVendor != nil");

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  objc_storeStrong((id *)&v10->_rootConnection, a3);
  objc_storeStrong(&v10->_serviceVendor, a4);
  uint64_t v11 = objc_opt_new();
  invalidationHandlers = v10->_invalidationHandlers;
  v10->_invalidationHandlers = (NSArray *)v11;

  atomic_store(0, (unsigned __int8 *)&v10->_invalid);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = __72__GCConfigXPCServiceServiceConnection_initWithConnection_serviceVendor___block_invoke;
  aBlock[3] = &unk_26BEC3CA8;
  v13 = v10;
  v24 = v13;
  v14 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v15 = [(GCIPCRemoteConnection *)v10->_rootConnection addInterruptionHandler:v14];
  id rootConnectionInterruptionObserver = v13->_rootConnectionInterruptionObserver;
  v13->_id rootConnectionInterruptionObserver = (id)v15;

  uint64_t v17 = [(GCIPCRemoteConnection *)v10->_rootConnection addInvalidationHandler:v14];
  id rootConnectionInvalidationObserver = v13->_rootConnectionInvalidationObserver;
  v13->_id rootConnectionInvalidationObserver = (id)v17;

  if (!v13->_rootConnectionInterruptionObserver || !v13->_rootConnectionInvalidationObserver) {
    v14[2](v14);
  }
  v19 = v13;

  return v19;
}

void __72__GCConfigXPCServiceServiceConnection_initWithConnection_serviceVendor___block_invoke(uint64_t a1)
{
  v2 = _gc_log_ipc();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v3;
    _os_log_impl(&dword_20AD04000, v2, OS_LOG_TYPE_INFO, "%@: Invalidating", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  if (v6)
  {
    objc_sync_exit(v4);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 40));
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 48, 1);
    }
    id v8 = Property;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = a1 + 32;
    uint64_t v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = 0;

    v12 = *(void **)(*(void *)v9 + 24);
    *(void *)(*(void *)v9 + 24) = 0;

    objc_sync_exit(v4);
    v32[0] = NSLocalizedDescriptionKey;
    v32[1] = NSLocalizedFailureReasonErrorKey;
    v33[0] = @"Request failed.";
    v33[1] = @"Service connection invalidated.";
    v13 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v14 = +[NSError gc_IPCError:1 userInfo:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = [0 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v27;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(0);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v17++) failWithError:v14];
        }
        while (v15 != v17);
        uint64_t v15 = [0 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v15);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v18);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v21++) + 16))();
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v19);
    }

    id v4 = v8;
  }
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
  id v4 = (void *)[a3 copy];
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
    uint64_t v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = _Block_copy(v4);
    [v9 addObject:v10];

    objc_setProperty_atomic_copy(v5, v11, v9, 48);
    objc_sync_exit(v5);

    v12 = [_GCDisposable alloc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __62__GCConfigXPCServiceServiceConnection_addInvalidationHandler___block_invoke;
    v15[3] = &unk_26BEC42B8;
    void v15[4] = v5;
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

void __62__GCConfigXPCServiceServiceConnection_addInvalidationHandler___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 48, 1);
  }
  id v4 = Property;
  v5 = (void *)[v4 mutableCopy];

  unsigned __int8 v6 = _Block_copy(*(const void **)(a1 + 40));
  [v5 removeObject:v6];

  id v8 = *(void **)(a1 + 32);
  if (v8) {
    objc_setProperty_atomic_copy(v8, v7, v5, 48);
  }

  objc_sync_exit(obj);
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
  v19[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke;
  v19[3] = &unk_26BEC4330;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  [v8 setSyncBlock:v19];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3;
  id v16 = &unk_26BEC43A8;
  uint64_t v17 = self;
  id v18 = v9;
  id v10 = v9;
  [v8 setAsyncBlock:&v13];
  SEL v11 = objc_msgSend(v8, "activate", v13, v14, v15, v16, v17);

  return v11;
}

id __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  if (v6)
  {
    v32[0] = NSLocalizedDescriptionKey;
    v32[1] = NSLocalizedFailureReasonErrorKey;
    v33[0] = @"Request failed.";
    v33[1] = @"Service connection is invalid.";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v15 = +[NSError gc_IPCError:1 userInfo:v14];

    id v16 = v15;
    *a3 = v16;

    objc_sync_exit(v5);
    id v13 = 0;
  }
  else
  {
    objc_sync_exit(v5);

    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__7;
    v30 = __Block_byref_object_dispose__7;
    id v31 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__7;
    long long v24 = __Block_byref_object_dispose__7;
    id v25 = 0;
    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_22;
    v19[3] = &unk_26BEC42E0;
    v19[4] = &v20;
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v19];
    uint64_t v9 = *(void *)(a1 + 40);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2;
    v18[3] = &unk_26BEC4308;
    v18[4] = &v26;
    v18[5] = &v20;
    (*(void (**)(uint64_t, void *, void *, uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v8, v18, v10, v11, v12);
    *a3 = (id) v21[5];
    id v13 = (id)v27[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v13;
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    uint64_t v10 = @"The request failed, but an error was not provided.";
    id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v6 = +[NSError gc_IPCError:0 userInfo:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    NSErrorUserInfoKey v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = a2;
  }
  else
  {
    if (!v7)
    {
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      id v16 = @"The request did not return a result, but an error was not provided.";
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v12 = +[NSError gc_IPCError:0 userInfo:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_6;
    }
    NSErrorUserInfoKey v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a3;
  }
  objc_storeStrong(v9, v10);
LABEL_6:
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 40));
  if (v5)
  {
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSLocalizedFailureReasonErrorKey;
    v17[0] = @"Request failed.";
    v17[1] = @"Service connection is invalid.";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v11 = +[NSError gc_IPCError:1 userInfo:v10];

    [v3 failWithError:v11];
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    id v6 = *(void **)(*(void *)(a1 + 32) + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4;
    v14[3] = &unk_26BEC4358;
    id v7 = v3;
    id v15 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v14];
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5;
    v12[3] = &unk_26BEC4380;
    id v13 = v7;
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v12);

    id v4 = v15;
  }
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
    id v6 = @"The request failed, but an error was not provided.";
    id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    id v3 = +[NSError gc_IPCError:0 userInfo:v4];
  }
  [*(id *)(a1 + 32) failWithError:v3];
}

void __77__GCConfigXPCServiceServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) succeedWithResult:v5];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v6)
    {
      [v8 failWithError:v6];
    }
    else
    {
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      uint64_t v12 = @"The request did not return a result, but an error was not provided.";
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      uint64_t v10 = +[NSError gc_IPCError:0 userInfo:v9];
      [v8 failWithError:v10];
    }
  }
}

- (id)serviceVendorRequestWithHandler:(id)a3
{
  return [(GCConfigXPCServiceServiceConnection *)self serviceVendorRequestWithLabel:0 handler:a3];
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
  objc_storeStrong(&self->_rootConnectionInvalidationObserver, 0);
  objc_storeStrong(&self->_rootConnectionInterruptionObserver, 0);

  objc_storeStrong((id *)&self->_rootConnection, 0);
}

@end