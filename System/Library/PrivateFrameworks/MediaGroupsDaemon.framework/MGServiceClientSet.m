@interface MGServiceClientSet
- (MGServiceClientSet)init;
- (NSMapTable)clients;
- (id)serviceClientForXPCConnection:(id)a3;
- (void)addClientService:(id)a3;
- (void)enumerateClientsUsingBlock:(id)a3;
- (void)removeClientService:(id)a3;
- (void)setClients:(id)a3;
@end

@implementation MGServiceClientSet

- (MGServiceClientSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)MGServiceClientSet;
  v2 = [(MGServiceClientSet *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMapTable *)objc_alloc_init(MEMORY[0x263F08968]);
    clients = v3->_clients;
    v3->_clients = v4;
  }
  return v3;
}

- (id)serviceClientForXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__MGServiceClientSet_serviceClientForXPCConnection___block_invoke;
  v8[3] = &unk_26485E4E0;
  v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MGServiceClientSet_serviceClientForXPCConnection___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addClientService:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__MGServiceClientSet_addClientService___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);
}

void __39__MGServiceClientSet_addClientService___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 connection];
  [v4 setObject:v2 forKey:v3];
}

- (void)removeClientService:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__MGServiceClientSet_removeClientService___block_invoke;
  v6[3] = &unk_26485E468;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);
}

void __42__MGServiceClientSet_removeClientService___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = [*(id *)(a1 + 40) connection];
  [v3 removeObjectForKey:v2];
}

- (void)enumerateClientsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  id v15 = (id)MEMORY[0x263EFFA68];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke;
  v9[3] = &unk_26485E5A8;
  v9[4] = self;
  v9[5] = &v10;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v9);
  id v5 = (void *)v11[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke_2;
  v7[3] = &unk_26485EFA0;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(&v10, 8);
}

void __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) clients];
  uint64_t v2 = [v6 objectEnumerator];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __49__MGServiceClientSet_enumerateClientsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSMapTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end