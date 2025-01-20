@interface AEActiveRestrictionUUIDFetchingProxy
+ (id)daemonProxyWithQueue:(id)a3;
+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4;
+ (id)proxyWithOrigin:(void *)a3 queue:;
- (id)initWithXPCProxy:(void *)a3 queue:;
- (id)setOfActiveRestrictionUUIDs:(id)a3;
@end

@implementation AEActiveRestrictionUUIDFetchingProxy

- (id)initWithXPCProxy:(void *)a3 queue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEActiveRestrictionUUIDFetchingProxy;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (id)proxyWithOrigin:(void *)a3 queue:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_opt_new();
  id v7 = [v6 makeInterface];

  v8 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v5, v7);
  v9 = -[AEActiveRestrictionUUIDFetchingProxy initWithXPCProxy:queue:]((id *)[AEActiveRestrictionUUIDFetchingProxy alloc], v8, v4);

  return v9;
}

+ (id)daemonProxyWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = -[AEMachServiceXPCConnectionOrigin initWithMachServiceName:options:]([AEMachServiceXPCConnectionOrigin alloc], @"com.apple.assessmentagent.activeRestrictionUUIDFetching", 4096);
  id v6 = +[AEActiveRestrictionUUIDFetchingProxy proxyWithOrigin:queue:]((uint64_t)a1, v5, v4);

  return v6;
}

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v7);

  v9 = +[AEActiveRestrictionUUIDFetchingProxy proxyWithOrigin:queue:]((uint64_t)a1, v8, v6);

  return v9;
}

- (id)setOfActiveRestrictionUUIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    xpcProxy = self->_xpcProxy;
  }
  else {
    xpcProxy = 0;
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke;
  v25[3] = &unk_264EA3BB8;
  v25[4] = self;
  id v6 = -[AEXPCProxy synchronousRemoteObjectProxyWithErrorHandler:](xpcProxy, v25);
  id v7 = v6;
  if (v6)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v16 = 0;
    v17[0] = &v16;
    v17[1] = 0x3032000000;
    v17[2] = __Block_byref_object_copy_;
    v17[3] = __Block_byref_object_dispose_;
    id v18 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke_6;
    v15[3] = &unk_264EA3BE0;
    v15[4] = &v19;
    v15[5] = &v16;
    [v6 fetchSetOfActiveRestrictionUUIDsWithClientType:v4 completion:v15];
    v8 = (void *)v20[5];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      v11 = AECoreLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        -[AEActiveRestrictionUUIDFetchingProxy setOfActiveRestrictionUUIDs:](v13, (uint64_t)v17, buf, v11);
      }

      id v9 = (id)objc_opt_new();
    }
    objc_super v10 = v9;
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    objc_super v10 = objc_opt_new();
  }

  return v10;
}

void __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AECoreLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

- (void)setOfActiveRestrictionUUIDs:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_23D508000, log, OS_LOG_TYPE_ERROR, "[%{public}@] An error occurred fetching active restriction UUIDs: %{public}@", buf, 0x16u);
}

void __68__AEActiveRestrictionUUIDFetchingProxy_setOfActiveRestrictionUUIDs___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138543618;
  v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_23D508000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] An error occurred creating synchronous remote object proxy: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end