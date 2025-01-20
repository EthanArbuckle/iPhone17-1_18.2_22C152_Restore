@interface COCoordinationServiceClientSet
- (COCoordinationServiceClientSet)init;
- (NSMutableSet)clients;
- (id)serviceClientForXPCConnection:(id)a3;
- (id)serviceClients;
- (void)_withLock:(id)a3;
- (void)addServiceClient:(id)a3;
- (void)removeServiceClient:(id)a3;
@end

@implementation COCoordinationServiceClientSet

- (COCoordinationServiceClientSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)COCoordinationServiceClientSet;
  v2 = [(COCoordinationServiceClientSet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clients = v2->_clients;
    v2->_clients = v3;
  }
  return v2;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)serviceClientForXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__22;
  v15 = __Block_byref_object_dispose__22;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke;
  v8[3] = &unk_2645CAED0;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(COCoordinationServiceClientSet *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clients];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke_2;
  v5[3] = &unk_2645CDBF8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __64__COCoordinationServiceClientSet_serviceClientForXPCConnection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 connection];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];
  *a3 = v7;

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)serviceClients
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__22;
  id v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__COCoordinationServiceClientSet_serviceClients__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCoordinationServiceClientSet *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __48__COCoordinationServiceClientSet_serviceClients__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addServiceClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__COCoordinationServiceClientSet_addServiceClient___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCoordinationServiceClientSet *)self _withLock:v6];
}

void __51__COCoordinationServiceClientSet_addServiceClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clients];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeServiceClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__COCoordinationServiceClientSet_removeServiceClient___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCoordinationServiceClientSet *)self _withLock:v6];
}

void __54__COCoordinationServiceClientSet_removeServiceClient___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clients];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
}

@end