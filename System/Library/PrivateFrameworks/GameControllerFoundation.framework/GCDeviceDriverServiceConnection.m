@interface GCDeviceDriverServiceConnection
@end

@implementation GCDeviceDriverServiceConnection

id __75___GCDeviceDriverServiceConnection_connectionToServiceInDriver_withClient___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithDriverConnection:*(void *)(a1 + 32) serviceVendor:v4];

  return v5;
}

void __75___GCDeviceDriverServiceConnection_initWithDriverConnection_serviceVendor___block_invoke(uint64_t a1)
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
    id Property = *(id *)(a1 + 40);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 48, 1);
    }
    id v8 = Property;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = a1 + 32;
    v11 = *(void **)(v10 + 16);
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

void __59___GCDeviceDriverServiceConnection_addInvalidationHandler___block_invoke(uint64_t a1)
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

id __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    v14 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
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
    long long v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__3;
    long long v24 = __Block_byref_object_dispose__3;
    id v25 = 0;
    v7 = *(void **)(*(void *)(a1 + 32) + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_23;
    v19[3] = &unk_26BEC42E0;
    v19[4] = &v20;
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v19];
    uint64_t v9 = *(void *)(a1 + 40);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2;
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

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_23(uint64_t a1, void *a2)
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

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      goto LABEL_6;
    }
    NSErrorUserInfoKey v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a3;
  }
  objc_storeStrong(v9, v10);
LABEL_6:
}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_3(uint64_t a1, void *a2)
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
    v14[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4;
    v14[3] = &unk_26BEC4358;
    id v7 = v3;
    id v15 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v14];
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5;
    v12[3] = &unk_26BEC4380;
    id v13 = v7;
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v12);

    id v4 = v15;
  }
}

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_4(uint64_t a1, void *a2)
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

void __74___GCDeviceDriverServiceConnection_serviceVendorRequestWithLabel_handler___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

@end